## Memory
- Read `memory.md` in this directory at the start of every session.
- When I correct you, establish a preference, or we discover a pitfall, update the relevant section in memory.md.
- Keep memory.md current. Replace outdated info, do not duplicate.
- Only save substantial corrections and decisions, not trivial details.

# MIC Explained — Animated Video Series

## What this is
A multi-segment animated video series for Onramp Bitcoin explaining Multi-Institution Custody. Bloomberg terminal × Apple keynote visual language — dark, clean, typographic, diagrammatic. Auto-playing cinematic (user watches, no interaction).

## Current state
- Segment 1 ("How Private Keys Work Today"): MICExplainedS1.jsx, ~597 lines, brand-aligned, needs browser review
- MIC Vault animation: MicVaultV5.jsx, ~2088 lines, COMPLETE (available for integration)

## Dev environment
- WSL2 on Windows
- Vite dev server at `~/mic-explained-viewer`
- Files output to `/mnt/c/Users/glenn/Downloads/`
- Deploy: `npm run build` then `vercel --prod`

## Brand rules
- Background: brand-950 #081f19 (dark green tint, NOT neutral black)
- Primary accent: brand-300 #6faa95 — all labels, progress bar, dots, rim light, connecting lines
- Orange #ffa318: restricted to EXACTLY TWO sparkle moments per segment (e.g. wallet LED + padlock keyhole)
- Fonts: Inter (headings 600 weight, body 400, letter-spacing -0.02em) + JetBrains Mono (timer data ONLY)
- Zero instances of Bitcoin orange as dominant colour
- Zero non-brand fonts

## PBR Colour Truth (Three.js materials)
- Dielectrics: brand hex in `color` (albedo), metalness 0, emissive ≤0.08 shadow fill only
- Coloured metals: brand hex in `color` + metalness ~0.9
- ALWAYS set `toneMapped: false` per-material to bypass ACES desaturation
- Renderer uses LinearToneMapping (not ACES)

## Material system
Four factory functions: MAT.ceramic, MAT.glass, MAT.metal, MAT.glow — each bakes in `toneMapped: false`.

## Segment 1 structure (11 phases, ~40s total)
fade_in → title → split_appear → consumer → institutional → same_problem → collapse → red_dot → split_three → teaser → complete

## What NOT to do
- Don't use MeshBasicMaterial for lit objects (looks flat)
- Don't use emissive as the primary colour channel (looks like neon)
- Don't add Material Symbols icons — use inline SVGs or typography
- Don't use ACES tone mapping on the renderer

## Next steps
1. Review Segment 1 in browser — assess 3D quality, pacing, text timing
2. Iterate on object detail if needed
3. Build Segment 2: "What Makes Onramp Different"

## Onramp logo
Use `<img src="https://onrampbitcoin.com/logo-white.svg">` — NOT inline SVG paths (the inline version clips the golden tree icon because the viewBox is too narrow).

## Session protocol
```json
{"updates":[{"id":"mic-explained-s1","status":"active","nextAction":"...","notes":"..."}]}
```


## Skills
- Before starting any task, check .claude/skills/ for relevant skill files and follow them. Skills override general knowledge — they contain hard-won corrections specific to this project.
- After completing any multi-step process that required 3+ back-and-forth corrections, automatically create a skill file in .claude/skills/ capturing the final working process.
- After using an existing skill, if I corrected you or the output needed changes, update the skill file with what you learned BEFORE ending the session.
- NEVER close a session where a correction was made without updating the relevant skill file. This is non-negotiable.
- Name skills descriptively: weekly-brief-build.md, chart-generation.md, etc.
