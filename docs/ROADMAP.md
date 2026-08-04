# MyKAIA Roadmap

Historical note: the table below used continuous phase numbering across **mykaia-app** and **mykaia-web**. That shared scheme is **retired as of 2026-08-03**. Each repo now counts its own internal phases independently. Cross-repo sequencing authority is `ROOT_PHASE_PLAN.md` at the MyKAIA program root (`D:\_Dev\Projects\MyKAIA\`). Completed work keeps its original phase numbers (this repo's Phase 1 and Phase 2 stay Phase 1 and Phase 2).

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
| **2** | mykaia-app | Port KAIA Wrapper UI/UX + full visual asset migration (done; UI/UX only) |
| **3** | mykaia-web | Landing page prototype (Next.js static + Cloudflare Workers) |
| **4** | mykaia-web | Hub catalog / browsing UI prototype (stubbed data) |
| **5** | mykaia-web | Marketplace install/uninstall + permissions UI prototype |
| **6** | mykaia-web | App-as-web-layer surface (shape decided at phase start) |
| **7+** | app first, then web | MVP hardening: live agent Tier 0/1/2, World/R3F, real Hub sandbox, cross-platform |

### Roadmap changelog

| Date | Change |
|------|--------|
| 2026-08-03 | Retired continuous shared phase numbering across mykaia-app and mykaia-web. Each repo now counts its own phases independently. Cross-repo sequencing authority moves to `ROOT_PHASE_PLAN.md` at the MyKAIA program root. Completed phase numbers (this repo Phase 1 and Phase 2) are unchanged. |
| 2026-07-27 | Inserted Phase 2 as **KAIA Wrapper UI/UX + asset port** into mykaia-app. Shifted former web phases: landing 2â†’3, Hub 3â†’4, Marketplace 4â†’5, app-as-web 5â†’6, MVP hardening 6+â†’7+. Reason: `_KAIA_Wrapper` already has a usable UI shell and media pack (product plan section 17 donor map). Pulling that chrome into mykaia-app now avoids rebuilding the same shell later. |

## Platform sequencing (mykaia-app)

1. **Windows desktop only** (Phase 1 prototype and early MVP work)
2. **macOS + Linux** once Windows is stable
3. **iOS + Android** (signing / store review; does not block desktop)
4. World / live-agent / deeper integration per product plan

## Map to product plan sections Aâ€“H

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
| **H** | MyKAIA Hub v1 | Phases 4â€“5 prototypes; real sandbox Phase 7+ (web repo) |

## Phase 1 explicit non-goals

- No macOS / Linux / iOS / Android targets
- No R3F world package
- No Tier 0 / Tier 1 live agent wiring
- No Hub / marketplace / landing code in this repo
- No CDP / live deployment

## Phase 2 status

**UI/UX port landed (Steps 2.1â€“2.3).** Visual assets from `_KAIA_Wrapper` are under `assets/kaia_wrapper_port/`. Flutter shell now includes sidebar, drawers, chat surface chrome, avatar HUD, settings overlay, and light/dark theme with dual pond backgrounds.

This phase is **UI/UX only**. Backend / live-agent / OpenClaw / connector wiring stays deferred to Phase 7+ per [`AGENT_FALLBACK_DESIGN.md`](AGENT_FALLBACK_DESIGN.md). Chat Send is a toast stub. Speaking spritesheet is present on disk and unwired (static avatar still only).
