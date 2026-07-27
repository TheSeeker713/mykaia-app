# Agent Fallback Design

Three-tier degradation ladder for KAIA's presence. **Deferred to Phase 6+.** Phase 1 only documents the design and keeps `flutter_gemma` as an unused dependency.

## Tier 0 — Live agent (default)

Cloud / connector-routed LLM + STT + TTS + barge-in.

Targets:

- 200–400ms turn-taking gap
- Sub-60ms TTS flush on interrupt
- Under 2% false barge-in rate (minimum 0.2s speech-duration gate)

Uses optional Settings → Connectors when enabled (Ollama, LM Studio, Grok, OpenAI-compatible, OpenClaw routing, etc.). App must still boot with none enabled.

## Tier 1 — Embedded on-device fallback

Automatic failover on Tier 0 timeout or error. **Zero external service dependency.**

| Requirement | Spec |
|-------------|------|
| Plugin | `flutter_gemma` |
| Models | Gemma 3 270M or Qwen3 0.6B, bundled in the app binary / installer |
| Offline | Full function with zero network and zero externally running process |
| Desktop format | `.litertlm` only (one-time conversion in model prep pipeline, not a runtime dependency) |
| Voice | Text output through the already-bundled Qwen3-TTS pipeline; same voice as Tier 0 |
| Cache / assets | Under `D:\_Dev\AI-Setup\mykaia\` (override flutter_gemma `%LOCALAPPDATA%` default when wired) |

### Persona lock (non-negotiable)

This model must be **KAIA at all times**. It must never identify as a generic LLM, never break character, never produce assistant-boilerplate, regardless of the prompt.

Prompt-only persona control will leak at this model size. Required Phase 6+ / product-plan Phase C line item:

1. Curate a KAIA-voice dialogue dataset covering normal conversation, in-character error / connection-loss lines, and adversarial jailbreak / character-break attempts
2. LoRA fine-tune the embedded model on that dataset
3. Adversarial-test specifically for persona breaks before Tier 1 ships

This model ships as KAIA-only. Full stop.

### Ollama is unrelated to Tier 1

The **ollama** entry in the Connectors Catalog (product plan section 9) is an optional BYOM path for routing **Tier 0** conversations through a user's own hosted models. Tier 1 must never depend on Ollama and must never be confused with it.

## Tier 2 — Scripted NPC barks

Fully deterministic. Zero inference. Always available.

Hand-authored KAIA-voice lines for:

1. Thinking / latency-cover barks during Tier 0 or Tier 1 generation
2. In-character connection-error alerts
3. Bounded canned responses for common actions when Tier 1 is also unavailable

## Escalation (circuit breaker)

1. Tier 0 timeout / retry budget fails → Tier 1
2. Tier 1 failure → Tier 2
3. Tier 0 retried quietly in the background for automatic recovery when possible

## Open questions (do not block Phase 1)

1. Exact Tier-1 model file sourcing and license for Gemma 3 270M / Qwen3 0.6B `.litertlm` bundles
2. Which `.litertlm` conversion tooling becomes standard in the model prep pipeline
3. Whether `flutter_gemma_litertlm` must be added as an explicit dependency alongside `flutter_gemma` for Windows desktop (confirm at Tier 1 wiring)

## Phase 1 status

Documented only. No Tier 0, Tier 1, or Tier 2 runtime wiring in the Windows prototype.
