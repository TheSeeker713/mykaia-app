# Speaking Sprite Sheet — Redundant Frame Analysis

- **Date:** 2026-07-11
- **Source:** `assets/images/avatar/kaia-avatar-speaking-spritesheet.webp`
- **Grid:** 10×6, 60 frames, 1080×1080/cell (per `kaia-avatar-speaking-spritesheet.json`)
- **Status:** Analysis only — **no sheet rebuild** until Jeremy approves a frame list

## Method

1. Sliced all 60 cells from the sheet in memory (no temp assets committed).
2. Estimated character opaque bbox on frame 1, then cropped a **mouth region** = lower ~45% of the upper-head band, centered (~55% of character width):
   - Crop window (frame coords): **x=371–872, y=388–566** (502×179)
3. Score = mean absolute RGBA difference over the mouth crop (skip pixels transparent in both), as **% of full scale (0–255)**.
4. Threshold used for “near-duplicate of previous”: **2.5%** (also checked 2.0 / 3.0 / 3.5).

## Mouth-region diff scores

| Frame | Δ prev % | Δ vs frame 1 % | Notes |
|------:|---------:|---------------:|-------|
| 1 | 0.000 | 0.000 | reference |
| 2 | 0.460 | 0.460 | |
| 3 | 0.470 | 0.797 | |
| 4 | 0.698 | 1.273 | |
| 5 | 0.777 | 1.747 | |
| 6 | 1.166 | 2.294 | |
| 7 | 1.549 | 2.779 | |
| 8 | 1.945 | 3.389 | |
| 9 | 2.138 | 4.306 | |
| 10 | 1.877 | 5.108 | |
| 11 | 1.188 | 5.555 | early local peak vs f1 |
| 12 | 0.565 | 5.561 | early peak vs f1 |
| 13 | 1.207 | 5.292 | |
| 14 | 1.670 | 4.699 | |
| 15 | 1.803 | 4.178 | |
| 16 | 1.969 | 3.612 | |
| 17 | 1.773 | 3.250 | |
| 18 | 1.462 | 2.913 | flattest mid-run pick @2.5% |
| 19 | 0.812 | 2.884 | |
| 20 | 0.512 | 2.895 | |
| 21 | 0.378 | 2.958 | |
| 22 | 0.256 | 2.979 | |
| 23 | 0.130 | 3.002 | lowest step in sheet |
| 24 | 0.202 | 2.953 | |
| 25 | 1.988 | 2.830 | |
| 26 | **4.229** | 3.978 | speaking onset |
| 27 | **5.062** | 6.508 | |
| 28 | **5.122** | 8.979 | |
| 29 | **5.466** | 10.647 | |
| 30 | **7.104** | 11.724 | |
| 31 | **5.403** | 12.318 | |
| 32 | **3.375** | 12.592 | |
| 33 | **2.505** | 13.021 | |
| 34 | 1.633 | 13.130 | |
| 35 | 0.814 | 13.180 | plateau near open |
| 36 | 1.160 | 13.178 | |
| 37 | **3.045** | 12.868 | |
| 38 | **6.554** | 12.353 | |
| 39 | **6.721** | 12.384 | |
| 40 | **6.033** | 11.051 | |
| 41 | **7.516** | 9.825 | |
| 42 | **8.840** | 10.743 | max step in sheet |
| 43 | **6.170** | 10.196 | |
| 44 | **4.120** | 9.484 | |
| 45 | 2.199 | 9.393 | |
| 46 | 1.294 | 9.420 | |
| 47 | 1.197 | 9.413 | |
| 48 | 0.842 | 9.295 | |
| 49 | 1.418 | 9.038 | |
| 50 | **2.865** | 8.055 | |
| 51 | **2.956** | 7.023 | |
| 52 | **3.171** | 5.476 | |
| 53 | **2.594** | 4.286 | |
| 54 | 2.018 | 3.246 | |
| 55 | 0.957 | 2.866 | |
| 56 | 0.711 | 2.660 | |
| 57 | 2.078 | 2.894 | |
| 58 | **3.285** | 3.811 | |
| 59 | **3.990** | 5.690 | |
| 60 | **4.448** | 7.432 | |

Mean Δprev (frames 2–60): **2.61%**. Max Δprev: **8.84%** at frame **42**.

## Redundant runs (Δprev &lt; 2.5%)

| Run (inclusive) | Length | Interpretation |
|-----------------|-------:|----------------|
| **1–25** | **25** | Primary low-motion block (rows 1–2 fully, plus row 3 cols 1–5) |
| 33–36 | 4 | Brief hold near open mouth |
| 44–49 | 6 | Settling after big motion |
| 53–57 | 5 | Low motion before end |

**Rows 1–2 hypothesis:** **Confirmed for consecutive similarity** — all 19 transitions in frames 1–20 are &lt; 2.5% Δprev.

**Correction:** It is **not** 20 identical copies of one pose. Vs frame 1, mouth **drifts open** through frames ~9–12 (peak Δvs1 ≈ **5.56%** at frame 12), then eases back toward ~2.9% by frames 18–25. So: slow micro-morph / soft idle cycle, then true speaking from **frame 26**.

High-step frames (Δprev ≥ 2.5%):  
`1, 26–33, 37–44, 50–53, 58–60`

## Proposed trimmed sets (not applied)

### Recommendation A — moderate (threshold 2.5%, greedy vs last kept from frame 1)

Keeps one path through the early micro-morph, then all distinct speaking steps.

- **60 → 32 frames**
- Keep:  
  `1, 7, 9, 11, 14, 16, 18, 26, 27, 28, 29, 30, 31, 32, 33, 37, 38, 39, 40, 41, 42, 43, 44, 46, 50, 51, 52, 53, 56, 58, 59, 60`
- Flat/idle representative in that list: **frame 1** (closed); frame **18** is the most central frame inside the 1–25 plateau if you prefer a mid-run idle still.

### Recommendation B — aggressive (one flat + high-step only)

Treats 1–25 as a single idle hold; drops early micro-morph samples.

- **60 → 24 frames**
- Flat pick from plateau: **18** (lowest mean mouth-diff to other frames in 1–25)
- Keep:  
  `18, 26, 27, 28, 29, 30, 31, 32, 33, 37, 38, 39, 40, 41, 42, 43, 44, 50, 51, 52, 53, 58, 59, 60`

### Other thresholds (greedy from frame 1)

| Thresh | Count | Notes |
|-------:|------:|-------|
| 2.0% | 36 | More early morph samples |
| 2.5% | 32 | Recommendation A |
| 3.0% | 28 | Leaner speaking path |
| 3.5% | 25 | Most aggressive greedy |

## Follow-up (after Jeremy picks a list)

Rebuild sheet + JSON; archive current 60-frame WebP under `assets/source/` (same pattern as `kaia-avatar-default-white-bg.webp`). Not done in this pass.
