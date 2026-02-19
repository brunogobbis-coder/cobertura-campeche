# Scripts - Cobertura Campeche

## update-usd-price.sh

Atualiza automaticamente o preço em USD em todos os arquivos HTML do projeto, usando a cotação BRL/USD em tempo real.

### O que faz

1. Busca a cotação atual na API `open.er-api.com` (fallback: `exchangerate-api.com`)
2. Calcula R$ 2.200.000 na cotação do dia, arredondado para o milhar
3. Atualiza **todos** os formatos de preço em USD:
   - `$XXX,XXX USD` (inglês)
   - `$XXXK` (títulos SEO)
   - `XXX XXX $ USD` (francês)
   - `XXX.XXX $ USD` (alemão)
   - `US$ XXX.XXX` (português)
4. Atualiza tanto `index.html` quanto `imobiliaria/index.html`

### Requisitos

- `bash`, `curl`, `python3` (todos já presentes no macOS)

### Uso manual

```bash
./scripts/update-usd-price.sh
```

### Execução semanal via cron (macOS/Linux)

```bash
# Abrir o crontab
crontab -e

# Adicionar esta linha (executa toda segunda-feira às 9h):
0 9 * * 1 /Users/brunogobbis/projects/cobertura-campeche/scripts/update-usd-price.sh >> /tmp/usd-price-update.log 2>&1
```

Para verificar se o cron está funcionando:

```bash
# Ver crontab atual
crontab -l

# Ver log da última execução
cat /tmp/usd-price-update.log
```

### Sobre a conversão dinâmica no site

Além do script, o site também faz conversão em tempo real via JavaScript:
- Busca a cotação ao carregar a página (para idiomas != PT)
- Cache de 6 horas no `localStorage` para não sobrecarregar a API
- Se a API falhar, usa os valores estáticos do HTML (atualizados pelo script)
