# Memory
> This file is updated automatically by Claude Code. Do not edit manually unless cleaning up.

## Preferences
- Charts go out under company brand — accuracy is non-negotiable
- ALWAYS web-search to verify prices, market caps, debt, returns before charting
- River-style simplicity for X/Twitter — single insight, understood in seconds
- Monochromatic editorial restraint — no traffic-light palettes

## Decisions made
- v5 system is current: 1200x675px @150DPI, white bg, Inter font
- Brand palette: B500 #175c45 primary, ACCENT #ffa318 for 0-1 moments per chart
- Logo: Onramp-logo.svg rendered AS-IS — black "ONRAMP" text + orange #FFA318 tree
- 5 new charts per week cadence
- Ball is the design reviewer — batches need his approval before publishing

## Pitfalls discovered
- Never recolour logo SVG paths — render exactly as-is
- matplotlib rcParams['text.parse_math'] = False globally (dollar signs break labels)
- OffsetImage zoom destroys fine SVG detail — always use figimage at pixel-exact coords
- Left margin clipping on bar charts — use left=0.18 width=0.77 for charts with y-axis labels
- Labels overlap at chart edges — use bbox whitebg pads, inline positioning, stagger

## Conventions established
- Logo pipeline: cairosvg.svg2png(scale=30) → PIL auto-crop → LANCZOS resize to 140px → figimage (48px from right edge, 24px from bottom)
- Title position: (0.05, 0.905) fs=19 bold G900
- Subtitle position: (0.05, 0.83) fs=9 G500
- Source position: (0.05, 0.05) fs=5.5 G400
- gen_v5.py is the master script
