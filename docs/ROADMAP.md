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
| **1** | mykaia-app | Windows Flutter prototype shell (done) |
| **2** | mykaia-app | Port KAIA Wrapper UI/UX + full visual asset migration (UI/UX only; no live agent) |
| **3** | mykaia-web | Landing page prototype (Next.js static + Cloudflare Workers) |
| **4** | mykaia-web | Hub catalog / browsing UI prototype (stubbed data) |
| **5** | mykaia-web | Marketplace install/uninstall + permissions UI prototype |
| **6** | mykaia-web | App-as-web-layer surface (shape decided at phase start) |
| **7+** | app first, then web | MVP hardening: live agent Tier 0/1/2, World/R3F, real Hub sandbox, cross-platform |

### Roadmap changelog

| Date | Change |
|------|--------|
| 2026-07-27 | Inserted Phase 2 as **KAIA Wrapper UI/UX + asset port** into mykaia-app. Shifted former web phases: landing 2→3, Hub 3→4, Marketplace 4→5, app-as-web 5→6, MVP hardening 6+→7+. Reason: `_KAIA_Wrapper` already has a usable UI shell and media pack (product plan section 17 donor map). Pulling that chrome into mykaia-app now avoids rebuilding the same shell later. |

## Platform sequencing (mykaia-app)

1. **Windows desktop only** (Phase 1 prototype and early MVP work)
2. **macOS + Linux** once Windows is stable
3. **iOS + Android** (signing / store review; does not block desktop)
4. World / live-agent / deeper integration per product plan

## Map to product plan sections A–H

Source: [`MYKAIA_PRODUCT_PLAN.md`](MYKAIA_PRODUCT_PLAN.md) section 16.

| Product plan | Meaning | When (approx.) |
|--------------|---------|----------------|
| **A** | Companion core | Phase 1 scaffold + Phase 2 UI shell + Phase 7+ depth |
| **B** | Connectors | Phase 7+ |
| **C** | Live KAIA agent (includes Tier 1 persona LoRA work) | Phase 7+ |
| **D** | World v1 + KaiaBridge | Phase 7+ |
| **E** | Web on mykaia.app + download portal | Phases 3 / 6 (web repo) |
| **F** | Creation depth (NPC Studio, University, etc.) | Phase 7+ |
| **G** | Optional SaaS | Later |
| **H** | MyKAIA Hub v1 | Phases 4–5 prototypes; real sandbox Phase 7+ (web repo) |

## Phase 1 explicit non-goals

- No macOS / Linux / iOS / Android targets
- No R3F world package
- No Tier 0 / Tier 1 live agent wiring
- No Hub / marketplace / landing code in this repo
- No CDP / live deployment

## Phase 2 status

**UI/UX port landed (Steps 2.1–2.3).** Visual assets from `_KAIA_Wrapper` are under `assets/kaia_wrapper_port/`. Flutter shell now includes sidebar, drawers, chat surface chrome, avatar HUD, settings overlay, and light/dark theme with dual pond backgrounds.

This phase is **UI/UX only**. Backend / live-agent / OpenClaw / connector wiring stays deferred to Phase 7+ per [`AGENT_FALLBACK_DESIGN.md`](AGENT_FALLBACK_DESIGN.md). Chat Send is a toast stub. Speaking spritesheet is present on disk and unwired (static avatar still only).
