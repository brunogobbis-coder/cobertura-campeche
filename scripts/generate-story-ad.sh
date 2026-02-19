#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
INPUT="$PROJECT_ROOT/images/hero_video.mp4"
OUTPUT="$PROJECT_ROOT/images/story_ad_campeche.mp4"
TMPDIR="$(mktemp -d)"
trap 'rm -rf "$TMPDIR"' EXIT

W=1080
H=1920
CROP_W=608
FPS=30
CX=$(( (1920 - CROP_W) / 2 ))

echo "=== Gerando Story Ad para Instagram ==="
echo "Input:  $INPUT"
echo "Output: $OUTPUT"
echo ""

# --- PHASE 1: Extract & crop segments ---
echo "[1/4] Extraindo segmentos..."

# seg1: Living room with ocean view (5-9s), crop left to show dining + ocean
ffmpeg -y -ss 5 -t 4 -i "$INPUT" \
  -vf "crop=${CROP_W}:1080:500:0,scale=${W}:${H}:flags=lanczos,setsar=1" \
  -c:v libx264 -preset fast -crf 18 -an -r $FPS "$TMPDIR/seg1.mp4" 2>/dev/null
echo "  seg1: Sala + Vista Mar"

# seg2: Rooftop terrace sofa + sky (11-15s)
ffmpeg -y -ss 11 -t 4 -i "$INPUT" \
  -vf "crop=${CROP_W}:1080:${CX}:0,scale=${W}:${H}:flags=lanczos,setsar=1" \
  -c:v libx264 -preset fast -crf 18 -an -r $FPS "$TMPDIR/seg2.mp4" 2>/dev/null
echo "  seg2: Terraço + Céu"

# seg3: Hot tub (33-37s)
ffmpeg -y -ss 33 -t 4 -i "$INPUT" \
  -vf "crop=${CROP_W}:1080:${CX}:0,scale=${W}:${H}:flags=lanczos,setsar=1" \
  -c:v libx264 -preset fast -crf 18 -an -r $FPS "$TMPDIR/seg3.mp4" 2>/dev/null
echo "  seg3: Banheira ao Ar Livre"

# seg4: Bedroom with terrace (41-45s), crop right for bed + glass door
ffmpeg -y -ss 41 -t 4 -i "$INPUT" \
  -vf "crop=${CROP_W}:1080:700:0,scale=${W}:${H}:flags=lanczos,setsar=1" \
  -c:v libx264 -preset fast -crf 18 -an -r $FPS "$TMPDIR/seg4.mp4" 2>/dev/null
echo "  seg4: Suíte + Terraço"

# --- PHASE 2: Crossfade transitions ---
echo ""
echo "[2/4] Aplicando transições crossfade..."

XD=0.5
ffmpeg -y -i "$TMPDIR/seg1.mp4" -i "$TMPDIR/seg2.mp4" \
  -filter_complex "[0:v][1:v]xfade=transition=fade:duration=${XD}:offset=3.5,format=yuv420p[v]" \
  -map "[v]" -c:v libx264 -preset fast -crf 18 -an "$TMPDIR/m12.mp4" 2>/dev/null

ffmpeg -y -i "$TMPDIR/m12.mp4" -i "$TMPDIR/seg3.mp4" \
  -filter_complex "[0:v][1:v]xfade=transition=fade:duration=${XD}:offset=7,format=yuv420p[v]" \
  -map "[v]" -c:v libx264 -preset fast -crf 18 -an "$TMPDIR/m123.mp4" 2>/dev/null

ffmpeg -y -i "$TMPDIR/m123.mp4" -i "$TMPDIR/seg4.mp4" \
  -filter_complex "[0:v][1:v]xfade=transition=fade:duration=${XD}:offset=10.5,format=yuv420p[v]" \
  -map "[v]" -c:v libx264 -preset fast -crf 18 -an "$TMPDIR/merged.mp4" 2>/dev/null

echo "  Transições aplicadas"

# --- PHASE 3: Create text overlays with Python/Pillow ---
echo ""
echo "[3/4] Criando overlays de texto com Pillow..."

python3 - "$TMPDIR" "$W" "$H" << 'PYEOF'
import sys
from PIL import Image, ImageDraw, ImageFont

tmpdir = sys.argv[1]
W, H = int(sys.argv[2]), int(sys.argv[3])

FONT_BOLD = "/System/Library/Fonts/Supplemental/Arial Bold.ttf"
FONT_REG = "/System/Library/Fonts/Supplemental/Arial.ttf"

def make_overlay(texts):
    """Create transparent PNG with centered text lines.
    texts: list of (text, font_size, y_position, is_bold)
    """
    img = Image.new("RGBA", (W, H), (0, 0, 0, 0))
    draw = ImageDraw.Draw(img)

    for text, size, y, bold in texts:
        fpath = FONT_BOLD if bold else FONT_REG
        font = ImageFont.truetype(fpath, size)
        bbox = draw.textbbox((0, 0), text, font=font)
        tw = bbox[2] - bbox[0]
        x = (W - tw) // 2

        for ox, oy in [(-2,0),(2,0),(0,-2),(0,2),(-2,-2),(2,-2),(-2,2),(2,2)]:
            draw.text((x+ox, y+oy), text, fill=(0, 0, 0, 160), font=font)
        draw.text((x, y), text, fill=(255, 255, 255, 255), font=font)

    return img

# Overlay 1: Title (shown 0.5-3.5s)
ov1 = make_overlay([
    ("COBERTURA DUPLEX", 62, 220, True),
    ("156m² | Vista Mar e Montanhas", 34, 300, False),
])
ov1.save(f"{tmpdir}/txt_title.png")

# Overlay 2: Terrace (shown 4-7s)
ov2 = make_overlay([
    ("Terraço Privativo", 50, 1600, True),
])
ov2.save(f"{tmpdir}/txt_terraco.png")

# Overlay 3: Hot tub (shown 7.5-10.5s)
ov3 = make_overlay([
    ("Banheira ao Ar Livre", 50, 1600, True),
])
ov3.save(f"{tmpdir}/txt_banheira.png")

# Overlay 4: CTA (shown 11-14.5s)
ov4 = make_overlay([
    ("R$ 2.200.000", 70, 740, True),
    ("Campeche, Florianópolis", 38, 830, False),
    ("Saiba mais", 42, 1640, True),
])
ov4.save(f"{tmpdir}/txt_cta.png")

print("  4 overlays criados com Pillow")
PYEOF

# --- PHASE 4: Composite overlays onto video ---
echo "[4/4] Compondo vídeo final..."

ffmpeg -y \
  -i "$TMPDIR/merged.mp4" \
  -i "$TMPDIR/txt_title.png" \
  -i "$TMPDIR/txt_terraco.png" \
  -i "$TMPDIR/txt_banheira.png" \
  -i "$TMPDIR/txt_cta.png" \
  -filter_complex "
    [0:v][1:v]overlay=0:0:enable='between(t,0.5,3.5)':format=auto[bg1];
    [bg1][2:v]overlay=0:0:enable='between(t,4,7)':format=auto[bg2];
    [bg2][3:v]overlay=0:0:enable='between(t,7.5,10.5)':format=auto[bg3];
    [bg3][4:v]overlay=0:0:enable='gte(t,11)':format=auto,format=yuv420p[out]
  " \
  -map "[out]" \
  -c:v libx264 -preset slow -crf 22 -profile:v high -level 4.0 \
  -movflags +faststart -an \
  "$OUTPUT" 2>/dev/null

echo "  Vídeo composto"

# --- Verify ---
echo ""
DURATION=$(ffprobe -v quiet -print_format json -show_format "$OUTPUT" | python3 -c "import sys,json; print(f\"{float(json.load(sys.stdin)['format']['duration']):.1f}\")")
SIZE=$(du -h "$OUTPUT" | cut -f1)
RES=$(ffprobe -v quiet -select_streams v:0 -show_entries stream=width,height -of csv=p=0 "$OUTPUT")

echo "=== Story Ad Gerado ==="
echo "  Arquivo:    $OUTPUT"
echo "  Resolução:  ${RES}"
echo "  Duração:    ${DURATION}s"
echo "  Tamanho:    ${SIZE}"
echo ""
echo "Pronto para upload no Instagram Ads Manager!"
