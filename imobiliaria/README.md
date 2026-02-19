# Versão para Imobiliárias

Esta é uma versão do site destinada às imobiliárias parceiras, **sem formulário de contato direto**.

## O que foi removido:
- ❌ Formulário de contato
- ❌ WhatsApp flutuante
- ❌ Exit popup (popup de saída)
- ❌ CTA Float Bar (barra de "Agendar Visita")
- ❌ Social Proof Toast
- ❌ Informações de contato direto (telefone/email)

## O que foi adicionado:
- ✅ Banner "Material exclusivo para imobiliárias"
- ✅ Mensagem para contatar a imobiliária
- ✅ Meta tags `noindex, nofollow` (não aparece no Google)
- ✅ robots.txt bloqueando indexação

## Configuração do Subdomínio no Vercel

### Passo 1: Adicionar o subdomínio
1. Acesse o painel do Vercel
2. Vá em **Settings** → **Domains**
3. Adicione: `imobiliaria.coberturacampeche.com.br`

### Passo 2: Configurar DNS
No seu provedor de domínio, adicione um registro CNAME:
```
Tipo: CNAME
Nome: imobiliaria
Valor: cname.vercel-dns.com
```

### Passo 3: Configurar redirecionamento (opcional)
Para que o subdomínio sirva diretamente a pasta `/imobiliaria/`, você pode usar rewrites no `vercel.json` ou configurar diretamente no Vercel.

## URL Final
Após configuração: `https://imobiliaria.coberturacampeche.com.br`

## Uso
Compartilhe este link com as imobiliárias parceiras. Os clientes poderão ver todas as informações do imóvel e entrarão em contato através da própria imobiliária.
