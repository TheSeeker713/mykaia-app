# MyKAIA Architecture (app)

## Overview

MyKAIA's native product is a **Flutter** application shell. Local Drift/SQLite is the source of truth for chats, journal, tasks, progression, settings, and connector configs. An optional **React Three Fiber** world module will later load in a full-screen Flutter WebView and talk over the `KaiaBridge` JSON channel. The world is a view and interaction surface only.

Sibling web surfaces (landing, Hub, marketplace, download portal) live in **mykaia-web**, not here.

```text
Flutter shell (chat, journal, tasks, settings, HUD)
        |
        +-- Drift / SQLite (source of truth)
        |
        +-- Local orchestrator (later)
        |       |
        |       +-- Connectors (optional, Settings)
        |       +-- Agent fallback ladder (Tier 0 / 1 / 2)
        |
        +-- WebView World route (later)
                |
                KaiaBridge JSON
                |
                R3F / Three.js world package
```

## Locked stack (this repo)

| Layer | Choice |
|-------|--------|
| Shell | Flutter stable + Dart 3.x |
| State / routing | Riverpod, go_router |
| Persistence | Drift + sqlite3 with **sqlite3mc** encryption hook for journal |
| Secrets | `flutter_secure_storage` / OS keychain only |
| World host (later) | `webview_flutter` (dependency present; unused in Phase 1) |
| On-device fallback (later) | `flutter_gemma` (dependency present; unused until Phase 6+) |

## Tooling paths (this machine)

| Item | Path |
|------|------|
| Flutter SDK | `D:\_Dev\tools\flutter` |
| Model / asset root | `D:\_Dev\AI-Setup\mykaia\` (see `lib/core/paths/ai_setup_paths.dart`) |

Prefer D: for SDK, pub cache intent, and model assets. Do not point project model config at C: paths.

Code constants: [`lib/core/paths/ai_setup_paths.dart`](../lib/core/paths/ai_setup_paths.dart) (`AiSetupPaths.root`, `models`, `modelCache`, `modelPrep`).

### flutter_gemma desktop cache override (Phase 6+)

By default, flutter_gemma on Windows stores downloaded models under `%LOCALAPPDATA%\flutter_gemma\` (often on C:). When Tier 1 is wired, MyKAIA must override or redirect that cache to `AiSetupPaths.modelCache` (`D:\_Dev\AI-Setup\mykaia\model_cache`). Documented here now; implement at Tier 1 wiring time. Never commit `.litertlm` or other model binaries.

## Bridge

Protocol: [`BRIDGE_PROTOCOL.md`](BRIDGE_PROTOCOL.md). Channel name: `KaiaBridge`. Flutter owns authoritative state; world applies snapshots idempotently.

## Agent fallback

Design: [`AGENT_FALLBACK_DESIGN.md`](AGENT_FALLBACK_DESIGN.md). Not implemented in Phase 1.

## CDP / deployment

This repo has no live deploy target in Phase 1. Commit/push to GitHub is routine. Any live deployment always needs Jeremy's separate explicit approval at the time.
