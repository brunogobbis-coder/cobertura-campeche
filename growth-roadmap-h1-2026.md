# Growth Team Roadmap - H1 2026

## Racecar Growth Model (Lenny Rachitsky)

Roadmap estruturado no Racecar Growth Framework, equilibrando Quick Wins (Lubricants)
com Big Bets (Engine Upgrades) ao longo de 6 meses.

**Escopo do time:** Onboarding e Ativacao (signup ate setup completo)
**Motor de crescimento:** Product-Led Growth (self-service + virality/WoM)

---

## Baseline (metricas atuais)

| Metrica | Valor atual | Meta 6 meses |
|---|---|---|
| Setup rate (3 dias) | 7% | 15%+ |
| Mediana tempo de setup | 5 horas | < 2 horas |
| Retencao D0 (onboarding completo) | 98.95% | Manter |
| Retencao D30 (onboarding completo) | 11.73% | 18%+ |
| Retencao D30 (viu planos billing) | 15.54% | - |
| Retencao D30 (criou dominio) | 17.76% | Benchmark |
| Melhor feature de upsell | Dominios | - |

**Insight-chave:** Merchants que criam dominio tem retencao D30 de 17.76% vs 11.73% geral.
Dominio e tambem a melhor palanca de conversao ao pagamento.

---

## Fase 1 - Mes 1-2: LUBRICANTS (Quick Wins)

> Remover friccoes imediatas que bloqueiam ativacao. Alto impacto, baixo esforco.

### L1 - Corrigir UX de 2FA/OTP

| | |
|---|---|
| **Timing** | Mes 1 |
| **Cenario atual** | VOC e VOP listam 2FA e OTP como dores recorrentes. CX registra volume significativo de tickets de login. Dados do board de UX 2FA confirmam bloqueios no acesso. Apesar da retencao D0 ser 98.95% para quem completa onboarding, merchants que nao conseguem passar do login sequer entram nesse cohort - sao usuarios invisiveis nas metricas atuais. |
| **Problema** | Friccoes altas e bloqueios no acesso ao admin por problemas de UX no 2FA. |
| **Acao** | Redesign do fluxo de 2FA/OTP com foco em reduzir abandono no login. |
| **Metrica** | Reducao de tickets CX relacionados a 2FA; aumento de login success rate. |
| **Categoria Racecar** | Lubricant - desbloqueio direto do motor. |

### L2 - Remover dados desnecessarios do pre-onboarding

| | |
|---|---|
| **Timing** | Mes 1 |
| **Cenario atual** | Hoje sao 7 passos no caminho mais longo ate o admin. O FigJam registra: "Le pedimos al merchant destinar tiempo en brindarnos informacion de su negocio con la promesa de ofrecerle una experiencia customizada y al final no le damos nada." Tambem: "Solicitamos datos que podriamos pedir ya una vez que esta dentro del administrador." Com setup rate de apenas 7% em 3 dias, cada step a mais no pre-onboarding representa abandono mensuravel. |
| **Problema** | Pedimos dados fiscais no pre-onboarding com "promessa" de experiencia customizada que nao entregamos. |
| **Acao** | Mover coleta de dados fiscais para pos-setup (quando o merchant ja esta dentro do admin). Manter WhatsApp no fluxo de onboarding - e canal critico de comunicacao e reengajamento. |
| **Metrica** | Reducao de steps pre-admin de 7 para 5-6; melhoria no signup-to-admin rate. |
| **Categoria Racecar** | Lubricant - reduz friccao no inicio do funil. |

### L3 - Surfar dominio mais cedo no fluxo

| | |
|---|---|
| **Timing** | Mes 1-2 |
| **Cenario atual** | Retencao D30 de quem cria dominio: 17.76% (excepcional) vs 11.73% geral - uma diferenca de +6pp. Retencao D0 de quem cria dominio: 98.28% voltam ao setup. O FigJam registra: "Dominios es la palanca de upsell con mejor conversion al pago" e ao mesmo tempo "es uno de los temas que mas dudas genera." Hoje dominio nao e priorizado no fluxo, apesar de ser o melhor preditor de retencao e conversao. |
| **Problema** | Dominio tem a melhor retencao D30 e melhor conversao a upsell, mas e uma das maiores fontes de duvida/confusao. |
| **Acao** | Promover configuracao de dominio como um dos primeiros passos do setup, com wizard simplificado e guidance contextual. |
| **Metrica** | % de merchants que criam dominio no D0; retencao D30 geral. |

### L4 - Visibilidade de "Fale com Vendas" para ICP 1

| | |
|---|---|
| **Timing** | Mes 2 |
| **Cenario atual** | O FigJam registra como VOP: "No mostramos de forma visible la opcion de hablar con ventas para merchants identificados como ICP 1 next." Tambem listado no VOC/VOP como "fale con vendas (next) - mejora de visibilidad." ICP 1 sao os merchants de maior valor e a ausencia de canal de vendas visivel durante o onboarding significa perda de revenue de alto potencial. |
| **Problema** | Merchants identificados como ICP 1 next nao veem opcao visivel de falar com vendas durante o setup. |
| **Acao** | Banner/CTA contextual visivel para merchants identificados como ICP 1 durante setup. |
| **Metrica** | Taxa de contato com vendas para ICP 1; conversao desses merchants. |

### L5 - Indicadores de progresso e acompanhamento

| | |
|---|---|
| **Timing** | Mes 2 |
| **Cenario atual** | VOC direto do merchant: "No siento acompanamiento mientras estoy realizando cada paso del setup." A mediana de setup e 5 horas - um tempo longo em que o merchant esta sozinho. Com 93% nao completando em 3 dias, a sensacao de "estar perdido" durante o fluxo contribui diretamente para o abandono. O onboarding desejado e descrito como "motivador/inspirador" e "con tareas simples" - ambos dependem de feedback visual. |
| **Problema** | Merchants nao sentem acompanhamento enquanto realizam cada passo do setup. |
| **Acao** | Progress bar persistente + checklist visual com celebracoes a cada passo completado (micro Aha! moments). |
| **Metrica** | Setup completion rate; NPS do onboarding. |

---

## Fase 2 - Mes 2-3: TURBO BOOSTS (Sprints Tacticos)

> Aceleracoes pontuais que alavancam metricas especificas rapidamente.

### T1 - Sistema de pos-onboarding guiado

| | |
|---|---|
| **Timing** | Mes 2-3 |
| **Cenario atual** | O VOC lista as duvidas mais frequentes pos-setup: "Mi tienda ya esta publicada?", "Como me entero cuando recibo ventas?", "Donde recibo el dinero de mis ventas?", "Como despacho mis ventas?", "O que e Nuvem Pago? como utilizo?" A retencao D30 cai de 98.95% (D0) para 11.73% - a maior queda acontece nos primeiros dias pos-setup, exatamente quando essas duvidas surgem e nao sao respondidas proativamente. |
| **Problema** | Apos setup, merchants tem duvidas recorrentes que nao sao endereçadas e contribuem para o churn precoce. |
| **Acao** | Serie de comunicacoes pos-setup (in-app + email) respondendo as top 5 duvidas, com deeplinks para acoes diretas. |
| **Metrica** | Retencao D7 e D30; reducao de tickets CX pos-setup. |

### T2 - Wizard de dominios redesenhado

| | |
|---|---|
| **Timing** | Mes 3 |
| **Cenario atual** | Dominios lidera tanto o VOC ("problemas y dudas de config") quanto os dados de retencao (D30: 17.76%). O FigJam registra: "El 98% de los que configuran un dominio regresan al setup en el dia 0" e "dominios es la palanca de upsell con mejor conversion al pago." Porem, tambem e "uno de los temas que mas dudas genera." A oportunidade e clara: se mais merchants conseguirem configurar dominio com sucesso, a retencao D30 geral se aproxima do benchmark de 17.76%. |
| **Problema** | Dominios e o melhor upsell mas tambem o que mais gera duvidas e problemas de configuracao (DNS, propagacao, etc). |
| **Acao** | Fluxo passo-a-passo com validacao em tempo real, troubleshooting integrado, e explicacoes claras de DNS. |
| **Metrica** | Taxa de conclusao de config de dominio; conversao upsell de dominio. |

### T3 - Touchpoints de Nuvem Pago no onboarding

| | |
|---|---|
| **Timing** | Mes 3 |
| **Cenario atual** | VOC registra: "O que e Nuvem Pago? como utilizo?" e "Donde recibo el dinero de mis ventas?" O VOP detalha: "Nao compreendem prazos, saldos, etapas de repasse e configuracoes essenciais de Nuvem Pago e demais servicos de pagamentos durante o uso." Listado no VOC/VOP como item recorrente: "Nuvem Pago desde Onboarding - dudas config y uso." Billing tambem aparece: usuarios que viram planos tem retencao D30 de 15.54% (vs 11.73% geral), sugerindo que entender o modelo financeiro aumenta engagement. |
| **Problema** | Merchants nao entendem Nuvem Pago - nao compreendem prazos, saldos, etapas de repasse e configuracoes essenciais de pagamentos. |
| **Acao** | Micro-educacao contextual durante setup sobre como funciona Nuvem Pago, com simulacao de "sua primeira venda". |
| **Metrica** | Ativacao de Nuvem Pago no D7; reducao de tickets sobre pagamentos. |

### T4 - Search bar no admin para product discoverability

| | |
|---|---|
| **Timing** | Mes 2-3 |
| **Cenario atual** | A estrategia de onboarding define como objetivo central: "Improve product discoverability and learnability (activation loop)." As multiplas duvidas do VOC ("como configuro dominio?", "como despacho?", "onde vejo meus pagamentos?") indicam que merchants nao encontram funcionalidades existentes no admin. Com mediana de setup de 5 horas, parte significativa desse tempo e gasta navegando sem encontrar o que precisam. Os KPIs do onboarding incluem "time-to-value" - a search bar ataca diretamente esse indicador. |
| **Problema** | Merchants nao conseguem encontrar funcionalidades e configuracoes no admin, aumentando time-to-value e gerando tickets desnecessarios. |
| **Acao** | Implementar search bar global no admin que indexa paginas, configuracoes, features e conteudo de ajuda. Resultados devem incluir deeplinks diretos para a acao (ex: "configurar dominio" leva direto ao wizard). |
| **Metrica** | Uso da search bar; reducao de time-to-action para configuracoes-chave; reducao de tickets CX do tipo "como faco X". |
| **Categoria Racecar** | Turbo Boost - melhora imediata na navegabilidade do admin. |

---

## Fase 3 - Mes 3-4: ENGINE UPGRADE v1 (Big Bet)

> Transformar o motor de onboarding de linear para personalizado.

### E1 - Onboarding personalizado por tipo de negocio

| | |
|---|---|
| **Timing** | Mes 3-4 |
| **Cenario atual** | O FigJam registra como VOP: "La jornada de pre y on-boarding es lineal y unica." E como desejo: "Adaptado para las necesidades de los distintos tipos de negocios que eligen Tiendanube para vender." O setup rate geral de 7% esconde variacoes provaveis por segmento - uma loja fisica migrando para online tem necessidades completamente diferentes de um negocio novo. Sem personalizacao, o fluxo unico provavelmente atende bem apenas um segmento e frustra os demais, contribuindo para o abandono dos 93%. |
| **Problema** | Todos merchants recebem o mesmo fluxo linear independente do tipo de negocio. |
| **Acao** | Criar 3-4 trilhas de onboarding baseadas no tipo de negocio (detectado no signup): (1) Loja fisica migrando para online, (2) Negocio novo (primeira vez vendendo), (3) Loja online migrando de outra plataforma, (4) Dropshipping/revenda. Cada trilha prioriza os steps mais relevantes e mostra templates/exemplos do segmento. |
| **Metrica** | Setup rate por segmento; time-to-value por segmento; retencao D30 por segmento. |
| **Categoria Racecar** | Engine upgrade - muda fundamentalmente como o motor funciona. |

### E2 - Reestruturacao do fluxo de setup

| | |
|---|---|
| **Timing** | Mes 4 |
| **Cenario atual** | "Hoy son 7 pasos (camino mas largo) hasta llegar al administrador." Mediana de conversao: 5 horas. Setup rate: apenas 7% em 3 dias. Os KPIs definidos para o onboarding sao "Setup rate" e "Time-to-value" - ambos diretamente limitados pela quantidade de passos obrigatorios. O desejo e que o onboarding seja "sin fricciones" e "con tareas simples." Os dados de retencao mostram que quanto antes o merchant chega ao admin e realiza acoes-chave (dominio, billing), melhor a retencao. |
| **Problema** | Hoje sao 7 passos no caminho mais longo ate chegar ao administrador. |
| **Acao** | Reduzir para 3 passos essenciais (nome da loja, primeiro produto, aparencia basica) + setup "avancado" opcional pos-admin. Aplicar principio de "Time to Aha! moment" minimo. |
| **Metrica** | Reducao de mediana de setup de 5h para < 1h; setup rate de 7% para 15%+. |

---

## Fase 4 - Mes 5-6: ENGINE UPGRADE v2 (Big Bet)

> Criar loops de ativacao auto-sustentaveis.

### E3 - Aha! Moments antes da conclusao do setup

| | |
|---|---|
| **Timing** | Mes 5 |
| **Cenario atual** | A estrategia define como objetivo: "Earn rewards / Capture user attention (balance Setup with Aha! moments)." O onboarding desejado e "motivador/inspirador." Porem, o VOC mostra que merchants perguntam "Mi tienda ya esta publicada?" - indicando que nao percebem o resultado do setup enquanto o fazem. A retencao D0 e 98.95% mas cai para 11.73% no D30 - a falta de conexao emocional com a loja durante o setup contribui para essa queda, pois o merchant nao constroi senso de ownership. |
| **Problema** | Merchants passam por todo o setup sem "sentir" que a loja e real. |
| **Acao** | Preview ao vivo da loja durante o setup (cada mudanca reflete em tempo real); simular "recebi minha primeira venda" ao final do setup; mostrar loja publicada com template do segmento. |
| **Metrica** | Engagement durante setup; retencao D1 e D7. |
| **Categoria Racecar** | Engine upgrade - transforma o loop de ativacao. |

### E4 - LUMI: Onboarding assistido por IA agentica

| | |
|---|---|
| **Timing** | Mes 5-6 |
| **Cenario atual** | O VOC/VOP concentra 6+ categorias de duvidas recorrentes: dominios (config), account (UX), 2FA/OTP, Nuvem Pago (config e uso), billing (planos e pagos), e vendas (visibilidade). O merchant reporta: "No siento acompanamiento mientras estoy realizando cada paso del setup." A mediana de setup e 5 horas - tempo em que um agente de IA poderia resolver duvidas e pre-configurar. O setup rate de 7% e o gap de retencao D0 (98.95%) vs D30 (11.73%) representam o potencial total: LUMI pode atacar simultaneamente friccao, abandono e tickets CX. |
| **Problema** | Merchants gastam tempo em configuracoes que poderiam ser pre-preenchidas, nao sentem acompanhamento durante o setup, e tem duvidas recorrentes que geram tickets CX. |
| **Acao** | Integrar LUMI (agentic AI) como assistente proativo no onboarding. Tres camadas: (1) **Smart Defaults** - pre-configurar metodo de pagamento, template de loja, politicas de envio e textos iniciais com base nos dados do signup; (2) **Guia contextual** - LUMI aparece proativamente nos momentos de maior friccao (config dominio, Nuvem Pago, billing) oferecendo ajuda antes que o merchant busque; (3) **Resolucao autonoma** - LUMI resolve duvidas frequentes sem precisar escalar para CX (ex: "como configuro meu dominio?", "quando recebo meu dinheiro?"). |
| **Metrica** | Time-to-value; setup completion rate; deflection rate CX; CSAT da interacao com LUMI. |
| **Categoria Racecar** | Engine upgrade - LUMI e um multiplicador de forca que potencializa L5 (acompanhamento), T1 (pos-onboarding), T3 (Nuvem Pago) e T4 (discoverability). |

### E5 - Loop de reengajamento inteligente

| | |
|---|---|
| **Timing** | Mes 6 |
| **Cenario atual** | Setup rate de 7% em 3 dias significa que 93% dos merchants criam a loja e nao completam o setup. A mediana de quem completa e 5 horas, mas uma cauda longa demora dias ou semanas. O onboarding desejado e descrito como "con tareas simples" - mas o reengajamento atual nao ajuda o merchant a retomar de onde parou com simplicidade. Nao ha mecanismo inteligente de recovery baseado no ponto exato de abandono. |
| **Problema** | 93% dos merchants nao completam setup em 3 dias. |
| **Acao** | Sistema de nudges personalizados (email + push + in-app) baseado em onde o merchant parou, com deeplinks diretos para retomar. Incluir social proof ("merchants como voce completaram o setup em X min"). |
| **Metrica** | Reativacao de merchants que abandonaram; setup rate geral. |

---

## Timeline visual

```
Mes 1        Mes 2        Mes 3        Mes 4        Mes 5        Mes 6
|------------|------------|------------|------------|------------|------------|
|  LUBRICANTS (Quick Wins)            |
|  L1 Fix 2FA/OTP                     |
|  L2 Remover dados pre-onboarding    |
|  L3 Dominio mais cedo ............. |
|             L4 Fale com Vendas ICP1 |
|             L5 Progress bar         |
|            |                         |
|            | TURBO BOOSTS             |
|            | T1 Pos-onboarding guiado |
|            | T4 Search bar admin .... |
|            |            T2 Wizard dominios
|            |            T3 Nuvem Pago |
|                         |                                     |
|                         | ENGINE UPGRADE v1 (Big Bet)         |
|                         | E1 Onboarding personalizado .......|
|                                      | E2 Reestruturacao setup|
|                                                    |                        |
|                                                    | ENGINE UPGRADE v2      |
|                                                    | E3 Aha! Moments        |
|                                                    | E4 LUMI Agentic AI ....|
|                                                               | E5 Reengajamento
|------------|------------|------------|------------|------------|------------|
  Quick Wins    Quick Wins   Turbo +     Big Bet      Big Bet      Big Bet
  (Lubricants)  + Turbo      Engine v1   (Engine)     (Engine)     (Engine)
```

---

## Mecanismo de priorizacao

- **ICE Score** (Impact x Confidence x Ease) para priorizar dentro de cada fase.
- **Experiment-first**: Lubricants podem ir direto para A/B test. Big Bets devem comecar com discovery/prototype.
- **Kill criteria**: Se um Lubricant nao mostrar impacto em 2 semanas de teste, pivotar rapido.

## Cadencia sugerida

| Frequencia | Atividade |
|---|---|
| Semanal | Review de metricas de onboarding + retro de experimentos |
| Quinzenal | Sprint planning com priorizacao ICE |
| Mensal | Review do roadmap vs resultados, ajustar sequencia se necessario |
| Trimestral | Deep dive em dados de retencao + recalibracao de metas |

---

## Referencia: Racecar Growth Model

Framework do Lenny Rachitsky para estrategia de crescimento:

- **Growth Engine**: Loop auto-sustentavel que gera a maioria do crescimento (PLG no nosso caso)
- **Lubricants**: Otimizacoes que fazem o motor rodar melhor (conversao, UX, retencao)
- **Turbo Boosts**: Eventos pontuais que aceleram crescimento temporariamente
- **Fuel**: Input necessario para rodar o motor (capital, conteudo, usuarios)

Fonte: https://www.lennysnewsletter.com/p/the-racecar-growth-frameworkexpanded
