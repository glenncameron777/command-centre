# Memory
> This file is updated automatically by Claude Code. Do not edit manually unless cleaning up.

## Preferences
- Bloomberg/Apple keynote aesthetic — dark, clean, typographic, diagrammatic
- Auto-playing cinematic, not interactive
- Brand green background #081f19
- Orange #ffa318 restricted to exactly 2 sparkle moments (wallet LED and padlock keyhole)

## Decisions made
- Inter font: 600 weight headings, -0.02em letter-spacing
- JetBrains Mono reserved for timer data display only
- Durations tightened to ~40.5 seconds total (from 61s)
- Logo: load from CDN https://onrampbitcoin.com/logo-white.svg (not inline SVG — inline clips the key icon)

## Pitfalls discovered
- Inline SVG with viewBox "0 0 134 40" clips the golden key/tree icon (sits at x=135-183)
- Use <img> tag loading full logo from CDN instead

## Conventions established
- Deploy: copy JSX from /mnt/c/Users/glenn/Downloads/ → npm run build → vercel --prod
- Working file: MICExplainedS1.jsx in ~/mic-explained-viewer/src/
- 4-class material system: MAT.ceramic, MAT.glass, MAT.metal, MAT.glow with PBR Colour Truth
- Atmospheric: exponential fog, 60 floating dust particles, ground reflection plane
