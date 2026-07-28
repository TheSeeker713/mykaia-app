# AGENTS.md — mykaia-app

Binding rules for every agent session in this repository.

## Verification before assertion

Never report a change as working, live, passing, or committed without independently confirming against the actual filesystem and git state (file contents, `git status`, `git log`, command exit codes, build artifacts on disk).

## Tests before commit

Every step runs the relevant checks for what changed before committing:

- Flutter code or deps: `flutter analyze` (and `flutter test` when tests exist) must be clean
- Docs/governance only: confirm files exist, are non-empty, and stay within allowed markdown paths
- Windows build steps: `flutter build windows` exit 0 and the artifact path verified on disk

A failing check means the step is not done. Fix it, re-run, then commit. Never commit on a red check.

## Commit and push per step

Every completed step ends with commit and push to `origin/main` of **this** repo. Never leave local work uncommitted or unpushed when a step is reported done. Do not push to mykaia-web from an app-only step.

## Devlog every step

Append an entry to `docs/devlog.md` for every completed step before moving on.

- Timestamped with real date/time
- First person, written as Jeremy
- Plain, direct language. No em dashes. No "not X, but Y" contrast constructions
- Specific and verifiable against repo state
- One entry per step, not batched at phase end (except dedicated closeout steps)
- Entry headers use a comma or colon between timestamp and title (example: `## 2026-07-28 9:14 AM MDT, Phase 3 Step 3.1`). Never an em dash
- Write each entry when that step actually finishes, with its own real timestamp. Do not backfill several steps with the same minute after the fact

## Devlog archive protocol

- Archived files (`docs/devlog-archive-NN.md`) are permanently locked once created. Never edit, append to, or delete them in any future session, including this one
- The active file is always `docs/devlog.md`
- When Jeremy or a future rotation calls for archiving again: rename the active file with `git mv` to the next `docs/devlog-archive-NN.md`, add only the locked header blockquote at the top, start a fresh `docs/devlog.md`
- No em dashes in active-devlog entries, ever. Phase 0 through Phase 2 violated this in headers; that must not happen again
- Devlog timestamps must be real and distinct per step, not batched

## Documentation placement

Markdown files are allowed only at:

- `/README.md`
- `/AGENTS.md`
- anything under `/docs/`

## Binding Cursor rules

- [`.cursor/agents.mdc`](.cursor/agents.mdc) — session rules. Created once in Phase 0. **Read-only after that. Do not write or edit it.**
- [`.cursor/instructions.md`](.cursor/instructions.md) — three-role workflow, branch policy, commit/push and CDP rules

## CDP / deployment

This repo has no live deploy target in the current phase. Commit and push to main is routine. Live deployment (CDP or otherwise) always requires Jeremy's separate explicit approval and does not apply until noted otherwise.

## Sibling repo

`mykaia-web` is a separate private repo for the landing page, Hub, marketplace, and download portal at mykaia.app. Do not scaffold Hub/marketplace/web portal code here.
