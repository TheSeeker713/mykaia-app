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
