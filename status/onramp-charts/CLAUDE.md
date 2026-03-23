## Memory
- Read `memory.md` in this directory at the start of every session.
- When I correct you, establish a preference, or we discover a pitfall, update the relevant section in memory.md.
- Keep memory.md current. Replace outdated info, do not duplicate.
- Only save substantial corrections and decisions, not trivial details.

# Onramp Social Charts

## What this is
Branded data visualisations for Onramp Bitcoin's X/Twitter account. Single-insight charts readable in seconds. Sound money, Bitcoin, gold, Austrian economics, macro themes. These go out under the company brand — data accuracy is non-negotiable.

## Key people
- **Glenn** — Content direction, data review, quality control
- **Ball** — Design reviewer. Charts need his approval before publishing.

## Cadence
5 new charts per week. 30 charts complete across 6 batches as of March 2026.

## Brand specs
- Canvas: 1200×675px @150DPI, white background
- Font: Inter (all weights)
- Primary green: #175c45 (B500)
- Accent orange: #ffa318 — MAX ONE per chart, used sparingly as a signal
- Grays: G900 #181d27, G500 #717680, G400 #9b9fa7
- Red: #cc3333 for negative/fiat themes
- Style: monochromatic, editorial restraint, no traffic-light palettes

## Layout rules
- Title: position (0.05, 0.905), fontsize 19, bold, G900
- Subtitle: position (0.05, 0.83), fontsize 9, G500
- Source: position (0.05, 0.05), fontsize 5.5, G400
- Bar charts with y-axis labels: left=0.18, width=0.77
- Line/area charts: left=0.10, width=0.85
- Dual-axis charts: left=0.10, width=0.80

## Logo pipeline — DO NOT CHANGE THIS
1. File: Onramp-logo.svg — black "ONRAMP" text + orange #FFA318 tree icon
2. DO NOT recolour the SVG. Use as-is. Ball confirmed this.
3. Render: `cairosvg.svg2png(url=path, scale=30)` → PIL auto-crop → LANCZOS resize to 140px width → `fig.figimage()` at pixel-exact coords (48px from right edge, 24px from bottom)
4. NEVER use matplotlib OffsetImage zoom — it destroys fine SVG detail

## Critical fix
`matplotlib.rcParams['text.parse_math'] = False` — set this GLOBALLY at the top of every script. Dollar signs trigger LaTeX math mode which eats spaces between words.

## QA rules — READ BEFORE GENERATING ANY CHART
1. **ALWAYS web-search to verify all figures before charting.** Prices, market caps, debt figures, returns — never trust training data. These go out under the Onramp brand.
2. Left margins must be wide enough for y-axis labels ("Gold", "Saudi Aramco" etc get clipped)
3. Annotations must NOT overlap data lines — always offset with clearance, use `bbox=dict(facecolor='white')` pads
4. Don't stack labels at chart edges — use inline positioning along lines
5. Stat card text ≥8pt for subtexts, ≥14pt for hero subtitles
6. Dollar signs: math parsing is disabled globally but stay aware

## Master script
`gen_v5.py` — generates all charts. Batch scripts at `batch2_charts.py` through `batch6_charts.py`.

## What Ball has flagged before (don't repeat these)
- Logo was being recoloured green — WRONG, use as-is
- Left margins too tight — y-axis labels clipped
- Annotations overlapping data lines
- Labels stacking at chart edges

## Session protocol
At the end of every session, print a status update:
```json
{"updates":[{"id":"charts-v5","status":"active","nextAction":"What to do next","notes":"What was accomplished"}]}
```


## Skills
- Before starting any task, check .claude/skills/ for relevant skill files and follow them. Skills override general knowledge — they contain hard-won corrections specific to this project.
- After completing any multi-step process that required 3+ back-and-forth corrections, automatically create a skill file in .claude/skills/ capturing the final working process.
- After using an existing skill, if I corrected you or the output needed changes, update the skill file with what you learned BEFORE ending the session.
- NEVER close a session where a correction was made without updating the relevant skill file. This is non-negotiable.
- Name skills descriptively: weekly-brief-build.md, chart-generation.md, etc.
