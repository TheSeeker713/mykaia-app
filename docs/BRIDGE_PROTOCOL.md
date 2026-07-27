# KaiaBridge Protocol

Flutter WebView ↔ R3F world bridge. Channel name: **`KaiaBridge`**. JSON text payloads only. Flutter / Drift is source of truth. Unused until the world phase (product plan Phase D / delivery Phase 6+).

Full detail: product plan section 5 ([`MYKAIA_PRODUCT_PLAN.md`](MYKAIA_PRODUCT_PLAN.md)).

## Envelope

```json
{
  "v": 1,
  "id": "uuid",
  "ts": "ISO-8601",
  "dir": "app_to_world | world_to_app",
  "type": "event.type.name",
  "payload": {},
  "ack_of": null
}
```

Unknown `type` → `bridge.nack` with `code: unknown_type`. Do not crash.

## Lifecycle

| Type | Dir | Notes |
|------|-----|-------|
| `bridge.hello` | world→app | World ready |
| `bridge.hello_ack` | app→world | Protocol confirm |
| `world.request_snapshot` | world→app | After reconnect |
| `world.snapshot` | app→world | Full authoritative state |
| `bridge.ack` / `bridge.nack` | either | Mutating command results |
| `bridge.ping` / `bridge.pong` | either | Health |

## Snapshot (boot state)

Includes: `simple_mode`, `xp`, `level`, `rapport`, `mood`, `current_hub`, `current_level`, `unlocks`, `artifacts`, `npcs[]`, `quests_active`, `settings_visual`.

World applies snapshot idempotently.

## Minimal v1 event set

Lifecycle: `bridge.hello`, `bridge.hello_ack`, `world.snapshot`, `world.request_snapshot`  
Nav: `world.load_hub`, `world.load_level`, `app.level_entered`, `app.level_exited`  
Progression: `world.set_xp`, `world.unlock_area`, `app.xp_request`, `app.collect_artifact`  
NPC: `world.spawn_npc`, `world.set_npc_state`, `app.npc_interact`, `app.open_chat`  
Safety: `app.escape_hatch`, `world.set_visual_prefs`, `world.set_simple_mode`

## Ack / failure rules (summary)

1. Mutating world commands ack/nack within 2s or one retry with same `id`
2. XP and unlocks are app-authoritative
3. Duplicate `id` ignored for 60s
4. Reconnect = hello → full snapshot (no delta sync in v1)
5. Simple Mode: set flag then unmount WebView; do not mount World WebView in Simple Mode

## Phase 1 status

Documented only. `webview_flutter` is a dependency but no World route is mounted.
