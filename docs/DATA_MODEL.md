# Data Model (draft)

Source of truth: Drift / SQLite in the Flutter app. Draft core from product plan section 10.

## Tables (planned)

| Table | Notes |
|-------|--------|
| `chats`, `messages` | Companion chat history |
| `journal_entries` | Locked journal vs open notepad; tags |
| `tasks`, `task_sessions` | Tasks and timed sessions |
| `routines`, `automations`, `reminders` | Scheduling / automation |
| `npcs` | Persona, voice, sprite, rapport |
| `user_progression`, `xp_events`, `level_defs`, `artifacts` | Non-punitive XP |
| `world_state` | Hub / level, unlocks |
| `connector_configs` | Optional connectors (see below) |
| `settings`, `onboarding_state` | Includes ND UX override JSON |
| `university_packs`, `university_tracks`, `university_lessons`, `university_progress` | KAIA University |
| `creative_projects` | Phased |
| Hub install records | Phased with MyKAIA Hub (web-side catalog; local install state may mirror later) |

## Journal encryption

- Encrypt **`journal_entries`** content (and related sensitive fields as decided at implementation time) using sqlite3 with **sqlite3mc** (`hooks.user_defines.sqlite3.source: sqlite3mc` in `pubspec.yaml`).
- Encryption keys live in OS keychain / `flutter_secure_storage` only. Never store passphrase or key material as plaintext in the database, prefs, or logs.
- Notepad vs locked journal distinction follows product plan (locked journal encrypted; open notepad policy finalized at implementation).

## `connector_configs` shape

Shared record fields (product plan section 9):

| Field | Notes |
|-------|--------|
| `id` | Primary key |
| `connector_id` | e.g. `ollama`, `lm_studio`, `grok`, `openai_compatible`, `openclaw`, … |
| `kind` | `model_runtime` or `agentic_tool` |
| `enabled` | Default `false` |
| `display_name` | UI label |
| `endpoint_url` | |
| `api_path_prefix` | |
| `auth_type` | |
| `credentials_ref` | Keychain reference only |
| `extra_headers_json` | |
| `model_defaults_json` | |
| `health_json` | |
| `priority` | |
| `timeout_ms` | |
| `updated_at` | |

App boots and runs with no connectors enabled.

## Phase 1 status

Schema documentation only. No Drift table definitions generated yet in this prototype phase.
