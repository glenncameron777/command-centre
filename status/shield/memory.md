# Memory
> This file is updated automatically by Claude Code. Do not edit manually unless cleaning up.

## Preferences
- Default connection config must be public_ssl (not Tor) to prevent multi-minute hangs
- Glenn is a non-technical user — explain things in plain language, technical detail behind toggles

## Decisions made
- v0.1.0 shipped March 16 2026 via GitHub Actions CI
- CI pipeline: git tag vX.Y.Z && git push origin vX.Y.Z, wait 10-15 min, download from Releases
- Cross-compilation uses mingw (not MSVC) — Windows has limited disk space
- Wine32 on WSL for NSIS installer builds
- Pricing: Free (3 scans/day) / Pro $9.99/mo / Institutional $49.99/mo
- Brand: "Warm Dark Confidence" — amber/copper on charcoal, torchbearer archetype
- Tagline: "See what Chainalysis sees — about you."

## Pitfalls discovered
- WSL UNC paths crash Electron (GPU process can't launch) — always copy to local Windows path first
- Config reverts to Tor mode causing hangs — hardcode public_ssl as default
- Visual Studio Build Tools installer corrupted on Glenn's machine — use mingw instead
- napi-rs import library needed 143 symbols via dlltool for cross-compilation

## Conventions established
- PBR Colour Truth: brand hex in color (albedo), metalness ~0.9 for metals, emissive ≤0.08 shadow fill only, toneMapped: false on every material
- Dev mode: Express SSE on :3001 + Vite on :5173
- 7 Electrum servers raced in parallel for connection
- Ralph (GitHub: Narbeg) is collaborator with write access
