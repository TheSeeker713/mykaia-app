# MyKAIA Roadmap

Continuous phase numbering across **mykaia-app** and **mykaia-web**. Phases do not reset per repo.

## Repo split (locked)

| Repo | Owns |
|------|------|
| **mykaia-app** (this repo) | Flutter product: companion tools, local data, live agent, world WebView host |
| **mykaia-web** | Landing page, MyKAIA Hub, marketplace, download portal at [mykaia.app](https://mykaia.app) |

Hub, marketplace, landing page, and download portal code are **never** scaffolded in mykaia-app.

## Delivery phases

| Phase | Repo | Scope |
|-------|------|--------|
| **0** | both | Private repos, governance, devlog (done) |
| **1** | mykaia-app | Windows Flutter prototype shell (this phase) |
| **2** | mykaia-web | Landing page prototype (Next.js static + Cloudflare Workers) |
| **3** | mykaia-web | Hub catalog / browsing UI prototype (stubbed data) |
| **4** | mykaia-web | Marketplace install/uninstall + permissions UI prototype |
| **5** | mykaia-web | App-as-web-layer surface (shape decided at phase start) |
| **6+** | app first, then web | MVP hardening: live agent Tier 0/1/2, World/R3F, real Hub sandbox, cross-platform |

## Platform sequencing (mykaia-app)

1. **Windows desktop only** (Phase 1 prototype and early MVP work)
2. **macOS + Linux** once Windows is stable
3. **iOS + Android** (signing / store review; does not block desktop)
4. World / live-agent / deeper integration per product plan

## Map to product plan sections A–H

Source: [`MYKAIA_PRODUCT_PLAN.md`](MYKAIA_PRODUCT_PLAN.md) section 16.

| Product plan | Meaning | When (approx.) |
|--------------|---------|----------------|
| **A** | Companion core | Phase 1 scaffold + Phase 6+ depth |
| **B** | Connectors | Phase 6+ |
| **C** | Live KAIA agent (includes Tier 1 persona LoRA work) | Phase 6+ |
| **D** | World v1 + KaiaBridge | Phase 6+ |
| **E** | Web on mykaia.app + download portal | Phases 2 / 5 (web repo) |
| **F** | Creation depth (NPC Studio, University, etc.) | Phase 6+ |
| **G** | Optional SaaS | Later |
| **H** | MyKAIA Hub v1 | Phases 3–4 prototypes; real sandbox Phase 6+ (web repo) |

## Phase 1 explicit non-goals

- No macOS / Linux / iOS / Android targets
- No R3F world package
- No Tier 0 / Tier 1 live agent wiring
- No Hub / marketplace / landing code in this repo
- No CDP / live deployment
