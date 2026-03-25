# Memory
> This file is updated automatically by Claude Code. Do not edit manually unless cleaning up.

## Preferences
- Charts go out under company brand — accuracy is non-negotiable
- ALWAYS web-search to verify prices, market caps, debt, returns before charting
- River-style simplicity for X/Twitter — single insight, understood in seconds
- Monochromatic editorial restraint — no traffic-light palettes
- Glenn's other Claude sessions may flag data issues — take them seriously, triple-check
- Glenn works across Canva, PowerPoint, and LinkedIn — provide assets in formats he can paste from (PPTX, individual PNGs, Word docs)

## Decisions made
- v5 system is current: 1200x675px @150DPI, white bg, Inter font
- Brand palette: B500 #175c45 primary, ACCENT #ffa318 for 0-1 moments per chart
- Dark emerald green for cover slides / dark backgrounds: #0d3328 (NOT grey/blue)
- Logo: Onramp-logo.svg rendered AS-IS — black "ONRAMP" text + orange #FFA318 tree
- 5 new charts per week cadence
- Ball is the design reviewer — batches need his approval before publishing
- Complete disdain for Ripple/XRP — never include in any chart or graphic
- LinkedIn carousels: standard 16:9 PPTX is preferred — Glenn exports to PDF from PowerPoint
- Fidelity report charts: keep Onramp logo on every chart, even when embedded in documents

## Pitfalls discovered
- Never recolour logo SVG paths — render exactly as-is
- matplotlib rcParams['text.parse_math'] = False globally (dollar signs break labels)
- **Log scale axes generate LaTeX tick labels** even with parse_math=False — MUST add custom FuncFormatter to any log-scale axis: `ax.yaxis.set_major_formatter(mticker.FuncFormatter(lambda x, _: f'${x:,.0f}'))` and `ax.yaxis.set_minor_formatter(mticker.NullFormatter())`
- OffsetImage zoom destroys fine SVG detail — always use figimage at pixel-exact coords
- Left margin clipping on bar charts — use left=0.18 width=0.77 for charts with y-axis labels
- Labels overlap at chart edges — use bbox whitebg pads, inline positioning, stagger
- Footer text in bottom-right collides with Onramp logo — put stats inside chart area instead
- Gold chart (b4_01) was published with stale data — ALWAYS use current spot prices for endpoint
- **Use Playwright to visually verify label positioning** — don't guess. Spin up a local HTTP server and screenshot the chart. Labels that look fine in code often overlap in the render. This caught multiple issues Glenn flagged: 90% threshold overlapping bars, annotation arrows crossing labels, S&P 500 label hidden behind Housing label
- **Overlapping labels are the #1 QA failure** — every chart review session involves fixing at least one overlap. After placing any label, mentally check what's within 50px in every direction
- **Debt-to-GDP data changes yearly** — Japan was 263% in old chart, actually 234% (IMF 2025). China jumped from 83% to 96%. Always re-verify before publishing
- **Sort order matters on bar charts** — Canada (107%) was below UK (101%). Always sort descending by value
- **Mises/editorial quotes need clear white space** — never place over data lines. Use top-left or mid-chart white space with white bbox background
- **bbox_inches='tight' breaks logo positioning** — figimage uses pixel coords that assume the full figure size. If using tight cropping (e.g. for document embedding), the logo pipeline won't work. Use bbox_inches=None for v5 charts
- **PPTX files can't be overwritten while open** — save with a new filename if PowerPoint has the file locked

## Conventions established
- Logo pipeline: cairosvg.svg2png(scale=30) → PIL auto-crop → LANCZOS resize to 140px → figimage (48px from right edge, 24px from bottom)
- Title position: (0.05, 0.905) fs=19 bold G900
- Subtitle position: (0.05, 0.83) fs=9 G500
- Source position: (0.05, 0.05) fs=5.5 G400
- gen_v5.py is the master script
- Skills files in .claude/skills/ — chart-generation.md, logo-pipeline.md, chart-qa-checklist.md
- LinkedIn carousel format: PPTX at standard 16:9, dark emerald green (#0d3328) cover, green accent bar at top of each slide, slide numbers, Onramp logo on every slide
- Document deliverables: Word doc for Canva paste (charts as images + selectable text), PPTX for LinkedIn (export to PDF)

## Active projects
- **New Money Stack** — institutional landscape map (render_stack.py). Bloomberg-terminal style: two white column panels on black bg, fieldset/legend borders, large logos. All content/data finalized.
- **Batch 4+ charts** — in Holding Pen folder on desktop. QA'd March 25: b4_02 (label stagger fix), b4_03 (Mises quote repositioned), b4_04 (tagline made prominent), b4_05 (Japan/China data corrected, Germany removed, sort fixed), b5_01 (annotation overlap fixed, Actual label moved)
- **Fidelity "Getting Off Zero"** — 6-chart summary of Fidelity Digital Assets report (March 2026). Available as: individual v5 PNGs, Word doc, PPTX carousel (16:9). All in "Getting Off Zero" folder on desktop.

## Data verification sources (use these)
- Gold: LBMA, Fortune daily price, Kitco
- FX rates 2021+: IRS Yearly Average Currency Exchange Rates (official)
- FX rates historical: Fed H.10, World Bank period averages
- US debt: Treasury Fiscal Data, JEC monthly updates
- Debt-to-GDP: IMF World Economic Outlook (updated annually, check latest)
- Crypto: CoinGecko, CoinMetrics
- Inflation: BEA PCE data, Fed SEP projections
- Wealth inequality: Realtime Inequality (realtimeinequality.org) + Fed DFA on FRED
