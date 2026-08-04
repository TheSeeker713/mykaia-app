# mykaia-app — Cursor instructions

## Three-role workflow

1. **Plan** — Agree scope and steps before large changes when Jeremy asks for a plan. Phases are sequences of discrete steps.
2. **Implement** — Inside an active phase, complete every step in that phase without pausing for human input between steps. After each step's checks pass: commit, push to `origin/main`, append that day's `docs/devlogs/{YYYY-MM-DD}devlog.md` entry, then continue. Stop at phase boundary and wait for Jeremy's explicit go-ahead before starting the next phase.
3. **Verify** — Run the step's relevant checks, confirm git/filesystem state, then commit and push. A failed check means the step failed; fix, rerun, and only then mark it done.

## Phase and step structure

- Complete all steps within the current phase without stopping for human input between steps.
- Do not begin the next phase on your own. Wait for Jeremy's explicit go-ahead.

## Test-gated steps

Every step is gated by a relevant check (for example `flutter analyze`, `flutter test` when tests exist, `flutter build windows` exit 0 with artifact verified on disk, or the appropriate docs/governance check). Failed check = failed step. Do not proceed to the next step until the check passes clean.

## Branch policy

Work on `main` only. Do not create feature branches unless Jeremy explicitly asks.

## Commit and push per step

Every completed step, immediately after its test passes: commit, then push to `origin/main` of mykaia-app. No batching multiple steps into one commit. No leaving a passed step uncommitted.

## Devlog

Append to `docs/devlogs/{YYYY-MM-DD}devlog.md` after every completed step (create the day's file if needed). First person as Jeremy Robards, CTO and CAIO of Mycelia Interactive LLC; human tone with natural personality; technically detailed to match the commit; real timestamps; no em dashes; no "not X but Y" contrast constructions. Locked archives under `docs/devlogs/` must not be edited. Commit all devlog files normally with the rest of the repo.

## CDP

Live deployment is out of scope for this repo until further notice. Routine commit/push is not deployment. Any live deploy step always requires Jeremy's separate explicit approval.

## agents.mdc

`.cursor/agents.mdc` is read-only unless Jeremy grants an explicit one-time write exception in the same session. After that exception's task finishes, it returns to read-only and must not be edited again without a new exception.
