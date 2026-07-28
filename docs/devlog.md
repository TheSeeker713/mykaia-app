# MyKAIA App Devlog

Single file for now. If this grows unwieldy I will split into dated files under `docs/devlog/` and note that switch here.

---

## 2026-07-27 4:50 PM MDT — Phase 0 Step 0.1

Stood up this repo from an empty folder at `D:\_Dev\Projects\MyKAIA\mykaia-app`. Initialized git on `main`, added a `.gitignore` and a stub `README.md`, then created the private GitHub remote `TheSeeker713/mykaia-app` and pushed.

Confirmed with `gh repo view`: name `mykaia-app`, visibility PRIVATE, url https://github.com/TheSeeker713/mykaia-app. First commit hash: `d5b6faf71e1c533def75f7c631b3cb42156fe223`.

This entry is the second commit of Step 0.1, documenting that creation.

## 2026-07-27 4:51 PM MDT — Phase 0 Step 0.2

Added the governance set for this app repo: `AGENTS.md`, `.cursor/agents.mdc`, `.cursor/instructions.md`, and a full `README.md`. Checked that each file exists and is non-empty, and that `agents.mdc` states its own read-only rule after Phase 0. Ready to commit and push this set on main.

## 2026-07-27 4:51 PM MDT — Phase 0 Step 0.3 closeout

Phase 0 is done for mykaia-app. Private GitHub repo confirmed (`TheSeeker713/mykaia-app`). Governance files are on main: `AGENTS.md`, `.cursor/agents.mdc` (read-only going forward), `.cursor/instructions.md`, and the full README. Working tree is clean after this closeout push. Next work for this repo is Phase 1 (Flutter Windows prototype).

## 2026-07-27 5:09 PM MDT — Temporary visibility: public

Switched `TheSeeker713/mykaia-app` to PUBLIC temporarily so an external read-only check can see the repo. Confirmed with `gh repo view --json visibility`: PUBLIC. This is temporary only. Revert to private by end of day today. Do not treat public as the standing state.

## 2026-07-27 5:23 PM MDT — Phase 1 Step 1.1

Resumed Flutter SDK setup after the earlier doctor run got cut off mid-download. Confirmed `D:\_Dev\tools\flutter` is a complete stable clone (branch stable, head `058e0af2c2`, packages and bin present). Prepended that bin path for the session. `flutter --version` reports Flutter 3.44.8 / Dart 3.12.2. `flutter doctor -v` finished clean for Windows: Visual Studio Build Tools 2026 18.7.3 with Windows 10 SDK 10.0.26100.0, Windows desktop device available. Android SDK is missing, which is fine for this Windows-only phase. SDK itself stays outside the repo. This commit is only the devlog.

## 2026-07-27 5:27 PM MDT — Phase 1 Step 1.2

Ran `flutter create --platforms=windows --org=com.myceliainteractive --project-name=mykaia_app .` in this repo. Wired `pubspec.yaml` with flutter_riverpod, go_router, drift, sqlite3 3.x (`hooks.user_defines.sqlite3.source: sqlite3mc`), path_provider, path, flutter_secure_storage, webview_flutter, and flutter_gemma. Dev deps: drift_dev, build_runner, flutter_lints. Replaced the default counter app with `ProviderScope` + `MaterialApp.router`, a single home route in `lib/app/router.dart`, and a minimal theme in `lib/app/theme.dart`. `flutter pub get` succeeded after pinning sqlite3 to ^3.2.0. `flutter analyze`: no issues. `flutter test`: 1/1 passed.

## 2026-07-27 5:28 PM MDT — Phase 1 Step 1.3

Added the docs pack under `docs/`: `ROADMAP.md`, `ARCHITECTURE.md`, `AGENT_FALLBACK_DESIGN.md` (full Tier 0/1/2 ladder with KAIA persona-lock / LoRA requirement and Ollama-vs-Tier-1 note, deferred to Phase 6+), `DATA_MODEL.md`, and `BRIDGE_PROTOCOL.md`. Copied `MYKAIA_PRODUCT_PLAN.md` and `_source_plan_archive.md` from `D:\_Dev\docs\KAIA_(Keep_At_It_Always)\` and left the originals in place. Markdown placement check passed (only README, AGENTS, docs, and the existing Phase 0 `.cursor/instructions.md`).

## 2026-07-27 5:30 PM MDT — Phase 1 Step 1.4

Added `lib/core/paths/ai_setup_paths.dart` with constants rooted at `D:\_Dev\AI-Setup\mykaia` (root, models, model_cache, model_prep). Updated `docs/ARCHITECTURE.md` with the flutter_gemma `%LOCALAPPDATA%` override note pointing at `AiSetupPaths.modelCache`. Tightened `.gitignore` for `*.litertlm` / model caches. `flutter analyze`: no issues.

## 2026-07-27 5:31 PM MDT — Phase 1 Step 1.5

Ran `flutter pub get` again to confirm the lockfile is current. There is no Drift `@DriftDatabase` stub in `lib/` yet this phase, so I skipped `build_runner` rather than inventing a fake codegen run. `flutter analyze`: no issues. No lockfile delta after this pass, so this commit is the step devlog only.

## 2026-07-27 6:02 PM MDT — Phase 1 Step 1.6

First `flutter build windows` failed because Developer Mode was off (plugin symlinks) and then because `atlstr.h` was missing for `flutter_secure_storage_windows`. Enabled Developer Mode, installed VS component `Microsoft.VisualStudio.Component.VC.ATLMFC` into Build Tools 18, cleaned, and rebuilt. `flutter build windows` exit 0. Artifact verified on disk: `build\windows\x64\runner\Release\mykaia_app.exe` (91136 bytes, timestamp 07/27/2026 17:38:14). `flutter analyze` after the rebuild: no issues.

## 2026-07-27 6:02 PM MDT — Phase 1 Step 1.7 closeout

Phase 1 is complete for mykaia-app. The Windows prototype now has: Flutter 3.44.8 stable tooling on `D:\_Dev\tools\flutter`, a Windows-only scaffold with Riverpod/go_router/Drift/sqlite3mc/secure storage/webview_flutter/flutter_gemma deps, a minimal home shell, AI-Setup path constants under `D:\_Dev\AI-Setup\mykaia`, architecture docs including the full agent fallback design, and a verified `flutter build windows` artifact at `build\windows\x64\runner\Release\mykaia_app.exe`.

Explicitly not in this prototype yet: Tier 0/1 live agent wiring, Tier 2 bark runtime, world WebView route / R3F package, Drift table implementations, macOS/Linux/iOS/Android targets, Hub/marketplace/landing/download portal code (those live in mykaia-web). Stopping here. No Phase 2 work started.

## 2026-07-27 6:26 PM MDT — Phase 2 ROADMAP renumber

Updated `docs/ROADMAP.md` before any porting. Inserted Phase 2 as the KAIA Wrapper UI/UX + asset migration in mykaia-app. Shifted mykaia-web work: landing 2 to 3, Hub 3 to 4, Marketplace 4 to 5, app-as-web 5 to 6, MVP hardening 6+ to 7+. Changelog in the roadmap states why: the Wrapper already has a usable UI shell and media pack per product plan section 17, so bringing it in now avoids rebuilding that chrome later. This commit is docs only.

## 2026-07-27 6:49 PM MDT — Phase 2 Step 2.1 audit inventory

Read-only inventory of `D:\_Dev\Projects\_KAIA_Wrapper` (HEAD `72b2ea5`). Did not modify that project. Source stack is Tauri v2 + Next.js 16 static export + React 19 + Tailwind 4 + Zustand. It is a desktop web shell, so Phase 2 ports look and assets into Flutter rather than copying React files as-is.

### Screens and widgets (pure UI)

- `src/app/page.tsx`, `layout.tsx`: root mount
- `src/components/shell/AppShell.tsx`: full-bleed pond background, sidebar + chat + avatar layout, overlays
- `src/components/sidebar/Sidebar.tsx` + `drawerData.ts`: brand, New chat (no handler), 11 drawer labels, theme toggle, settings
- `src/components/chat/ChatSurface.tsx`: welcome bubble, textarea, Send button that only pushes a toast (confirmed comment: Phase 1 UI only, no model wiring)
- `src/components/avatar/KaiaAvatar.tsx`: static `<img>` HUD, no speaking animation
- `src/components/drawers/DrawerFolder.tsx`: stage-2 modal with Card A/B/C placeholders
- `src/components/settings/SettingsPanel.tsx`: Appearance (theme) works; Voice/Sound/Connectors sections are placeholder copy only
- `src/components/shell/ToastHost.tsx`, `useEscDismissStack.ts`, `ErrorBoundary.tsx`: chrome UX
- `src/stores/themeStore.ts`, `shellStore.ts`, `toastStore.ts`: in-memory UI state (theme not persisted)
- `src/styles/tailwind.css`, `tokens.css`: design tokens, accent `#3d6b8c`, dual-asset pond backgrounds

Empty component placeholders (`.gitkeep` only): focus, journal, tasks, calendar, reminders, progression, onboarding, sfx. No custom fonts in the repo.

### Visual assets

Served today under `public/images/`:
- `avatar/kaia-avatar-default.webp` (58,380 B, solid white-bg, what the UI actually loads)
- `background/koi-pond-bg.webp` (433,550 B)
- `background/koi-pond-bg-dark.webp` (286,514 B)

Also in `assets/` (copy all for the port; source stays untouched):
- `images/avatar/kaia-avatar-default.webp` (504,330 B transparent, better still; UI currently misses it)
- `images/avatar/kaia-avatar-speaking-spritesheet.webp` (~11 MB, 10x6, 60 frames @ 1080)
- `images/avatar/kaia-avatar-speaking-spritesheet.json` (frameCount 60, fps 12)
- `video/avatar/kaia-avatar-default.mp4` (~4.2 MB, unused by UI)
- `source/` JPEG/WebP pipeline inputs for pond and frog
- `docs/avatar-spritesheet-frame-analysis.md` notes 60 to 32 trim recommended and still pending
- Tauri window icons under `src-tauri/icons/` (32/128/ico/icns and store tiles)
- Empty dirs: `assets/audio/sfx`, `assets/audio/voice-samples`, `assets/images/onboarding/profiles/audhd` (`.gitkeep` only)

Spritesheet is not in `public/` and has zero references from `src/`. Unwired.

### Backend-coupled or backend-intent (EXCLUDE from port as product features)

There is no working OpenClaw, Ollama, fetch, WebSocket, or Tauri invoke path in `src/`. Grep across `src`, `scripts`, and `src-tauri/src` found none of those. Exclude list for the port:

1. Empty `src/lib/orchestration` (OpenClaw/agent router intent)
2. Empty `src/lib/models`
3. Empty `src/lib/connectors` and google-calendar scaffold
4. Empty `src/lib/db`
5. Empty `src/lib/tts` (real TTS lives outside this repo under AI-Setup Voice-Agent)
6. Empty `src/lib/keychain`
7. Empty `src/lib/{calendar,journal,tasks,reminders,progression,sfx,onboarding}`
8. Tauri SQL plugin registration in `src-tauri/src/lib.rs` with no migrations
9. Unused `@tauri-apps/plugin-sql` / API patterns as product surfaces
10. ADR docs treated as shipped implementation (OpenClaw HOW, TTS ADR fiction)
11. Drawer labels Models/Agents/Connectors/Fallback Models as real modules (labels only)
12. Settings Voice/Sound/Connectors sections as working prefs (placeholders)
13. Chat Send toast behavior as the model path (must be stub-only in Flutter too)
14. External Voice-Agent / Qwen3-TTS tree (outside Wrapper)

Port the visual shell and media. Rebuild chat Send as a non-network stub. Do not invent connector backends from empty folders.

### Prior audit claim

Still accurate. Overall about 8 to 12 percent complete. UI shell with no working chat-to-model path. 60-frame speaking spritesheet exists; 60 to 32 trim still pending and unwired. Avatar HUD still shows the smaller solid-bg `public` still instead of the transparent `assets` still.

Step 2.1 changes nothing in mykaia-app except this devlog entry.

## 2026-07-27 6:50 PM MDT — Phase 2 Step 2.2 asset migration

Copied (not moved) every visual asset from `_KAIA_Wrapper` into `assets/kaia_wrapper_port/`. Source project left untouched. Registered asset directories in `pubspec.yaml`. Also copied `docs/avatar-spritesheet-frame-analysis.md` into this repo's docs (60 to 32 trim still pending upstream).

Landed under `assets/kaia_wrapper_port/`:
- `avatar/kaia-avatar-default.webp` (transparent still, 504330 B)
- `avatar/kaia-avatar-default-public.webp` (solid-bg still the Wrapper UI was loading, 58380 B)
- `backgrounds/koi-pond-bg.webp`, `koi-pond-bg-dark.webp`
- `sprites/kaia-avatar-speaking-spritesheet.webp` (~11 MB, 60 frames) + `.json` metadata
- `video/kaia-avatar-default.mp4`
- `source/` JPEG/WebP pipeline inputs (pond, frog, white-bg archive)
- `icons/` Tauri window/store icon set (png/ico/icns)

`flutter pub get` exit 0. `flutter analyze`: no issues.
