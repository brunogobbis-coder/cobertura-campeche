#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
INDEX_FILE="$PROJECT_ROOT/index.html"
IMOB_FILE="$PROJECT_ROOT/imobiliaria/index.html"
BRL_PRICE=2200000

echo "Fetching current BRL/USD exchange rate..."

RATE=$(curl -sf "https://open.er-api.com/v6/latest/BRL" \
  | python3 -c "import sys,json; print(json.load(sys.stdin)['rates']['USD'])")

if [ -z "$RATE" ]; then
  echo "ERROR: Failed to fetch exchange rate. Trying fallback API..."
  RATE=$(curl -sf "https://api.exchangerate-api.com/v4/latest/BRL" \
    | python3 -c "import sys,json; print(json.load(sys.stdin)['rates']['USD'])")
fi

if [ -z "$RATE" ]; then
  echo "ERROR: All APIs failed. Aborting."
  exit 1
fi

USD_RAW=$(python3 -c "print(int(round($BRL_PRICE * $RATE, -3)))")
USD_K=$(python3 -c "print(int($USD_RAW / 1000))")
USD_COMMA=$(python3 -c "print(f'{$USD_RAW:,}')")
USD_DOT=$(python3 -c "print(f'{$USD_RAW:,}'.replace(',','.'))")
USD_SPACE=$(python3 -c "print(f'{$USD_RAW:,}'.replace(',',' '))")

echo ""
echo "Exchange rate:  1 BRL = $RATE USD"
echo "BRL price:      R\$ 2.200.000"
echo "USD equivalent: \$$USD_COMMA (rounded to nearest \$1,000)"
echo ""

update_file() {
  local file="$1"
  local filename
  filename="$(basename "$file")"

  if [ ! -f "$file" ]; then
    echo "SKIP: $file (not found)"
    return
  fi

  echo "Updating $filename..."

  python3 - "$file" "$USD_COMMA" "$USD_DOT" "$USD_SPACE" "$USD_K" "$USD_RAW" << 'PYEOF'
import re, sys

filepath = sys.argv[1]
usd_comma = sys.argv[2]
usd_dot = sys.argv[3]
usd_space = sys.argv[4]
usd_k = sys.argv[5]
usd_raw = int(sys.argv[6])

with open(filepath, "r", encoding="utf-8") as f:
    content = f.read()

original = content

# $XXX,XXX USD (English format in data attributes and text)
content = re.sub(
    r'\$\d{2,3},\d{3}\s*USD',
    f'${usd_comma} USD',
    content
)

# $XXXK format (in SEO titles)
content = re.sub(
    r'\$\d{2,3}K(?!\w)',
    f'${usd_k}K',
    content
)

# French format: XXX XXX $ USD
content = re.sub(
    r'\d{2,3}\s\d{3}\s\$\s*USD',
    f'{usd_space} $ USD',
    content
)

# German format: XXX.XXX $ USD
content = re.sub(
    r'\d{2,3}\.\d{3}\s\$\s*USD',
    f'{usd_dot} $ USD',
    content
)

# US$ XXX.XXX (BR format with US$ prefix)
content = re.sub(
    r'US\$\s*\d{2,3}\.\d{3}',
    f'US$ {usd_dot}',
    content
)

# approximately $XXX,XXX in schema text
content = re.sub(
    r'approximately \$\d{2,3},\d{3}',
    f'approximately ${usd_comma}',
    content
)

# aproximadamente US$ XXX.XXX in schema text
content = re.sub(
    r'aproximadamente US\$\s*\d{2,3}\.\d{3}',
    f'aproximadamente US$ {usd_dot}',
    content
)

# priceRange in schema: R$ 2.200.000 / $XXX,XXX USD
content = re.sub(
    r'(R\$ 2\.200\.000 / )\$\d{2,3},\d{3} USD',
    f'\\g<1>${usd_comma} USD',
    content
)

if content != original:
    with open(filepath, "w", encoding="utf-8") as f:
        f.write(content)
    count = 0
    for old_line, new_line in zip(original.splitlines(), content.splitlines()):
        if old_line != new_line:
            count += 1
    print(f"  {count} lines updated in {filepath.split('/')[-1]}")
else:
    print(f"  Already up to date")
PYEOF
}

update_file "$INDEX_FILE"
update_file "$IMOB_FILE"

echo ""
echo "Done! USD prices updated to \$$USD_COMMA (rate: 1 BRL = $RATE USD)"
