# AGENTS.md — mykaia-app

Binding rules for every agent session in this repository.

## Verification before assertion

Never report a change as working, live, passing, or committed without independently confirming against the actual filesystem and git state (file contents, `git status`, `git log`, command exit codes, build artifacts on disk).

## Phase and step structure

Development proceeds in phases. Each phase is made of discrete steps.

- Within an active phase, complete all steps in that phase without pausing for human input between steps.
- Before starting the next phase, stop and wait for Jeremy's explicit go-ahead.
- Do not begin a new phase on your own.

## Test-gated steps

Every step has a relevant test or check tied to it before it can be marked complete:

- Flutter code or deps: `flutter analyze` (and `flutter test` when tests exist) must be clean
- Docs/governance only: confirm files exist, are non-empty, and stay within allowed markdown paths
- Windows build steps: `flutter build windows` exit 0 and the artifact path verified on disk
- Other change types: the appropriate check for what changed

A failed test means the step has failed. Do not proceed to the next step. Fix the issue, rerun the check, and only mark the step done once it passes clean. Never commit on a red check.

## Commit and push per step

Every completed step, immediately after its test passes, is committed and pushed to `origin/main` of **this** repo. No batching multiple steps into one commit. No leaving a passed step uncommitted or unpushed when a step is reported done. Do not push to mykaia-web from an app-only step.

## Devlog (per-day files)

Devlog entries live under `docs/devlogs/`. For each calendar day where work happens, create or continue a file named `{YYYY-MM-DD}devlog.md` inside that folder. Append a new entry to that day's file after every completed step. Do not batch entries at the end of the day or at phase closeout.

Each entry must:

- Be written in first person as Jeremy Robards, CTO and CAIO of Mycelia Interactive LLC, as if he personally wrote it after finishing that step
- Read like a real human wrote it: genuine tone, some personality and dry or personal humor where it fits naturally; phrases like "I started doing," "I got stuck on," "that was frustrating," "wow, that actually worked," used where they'd genuinely apply, not forced into every entry
- Be detailed and technically explicit about what was actually done in that step, matching the corresponding commit
- Use a real date and timestamp (entry headers use a comma or colon between timestamp and title; never an em dash)
- Contain no em dashes anywhere in the entry
- Avoid "not X, but Y" contrast constructions

### Devlog archives

- Files under `docs/devlogs/` named `devlog-archive-NN.md` (and any other locked archive headers) are permanently locked once created. Never edit, append to, or delete them
- Prior single-file logs were relocated into `docs/devlogs/` when the per-day system started (`devlog-archive-01.md`, `devlog-archive-02.md`). Those remain locked
- All devlog files, current and archived, are committed to git normally, same as any other repo file

## Documentation placement

Markdown files are allowed only at:

- `/README.md`
- `/AGENTS.md`
- anything under `/docs/`

## Binding Cursor rules

- [`.cursor/agents.mdc`](.cursor/agents.mdc) — session rules. **Read-only** unless Jeremy grants an explicit one-time write exception in-session. After that task, it returns to read-only.
- [`.cursor/instructions.md`](.cursor/instructions.md) — workflow, branch policy, commit/push, CDP, and agents.mdc rules

## CDP / deployment

This repo has no live deploy target in the current phase. Commit and push to main is routine. Live deployment (CDP or otherwise) always requires Jeremy's separate explicit approval and does not apply until noted otherwise.

## Sibling repo

`mykaia-web` is a separate private repo for the landing page, Hub, marketplace, and download portal at mykaia.app. Do not scaffold Hub/marketplace/web portal code here.

## Stack (locked)

Flutter stable + Dart 3.x, Riverpod, go_router, Drift/SQLite with sqlite3mc encryption for journal entries, flutter_secure_storage for keys. World/WebView and flutter_gemma wiring stay deferred until later phases.
