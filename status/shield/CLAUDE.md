## Memory
- Read `memory.md` in this directory at the start of every session.
- When I correct you, establish a preference, or we discover a pitfall, update the relevant section in memory.md.
- Keep memory.md current. Replace outdated info, do not duplicate.
- Only save substantial corrections and decisions, not trivial details.

# Prometheus Shield

## What this is
Bitcoin privacy analysis tool. User enters an xpub, Shield tells them how private their coins are — which can be traced to exchanges, which have been dust-attacked, which addresses were reused, and what a chain analysis investigator could figure out about them.

Core insight: most Bitcoin users have no idea how exposed they are. Shield makes that visible and actionable.

## Key people
- **Glenn** — Founder, product lead. All product and business decisions. Visual thinker, prefers tables over walls of text.
- **Ralph** (GitHub: Narbeg) — Collaborator with repo write access. Based in Lebanon. Runs Claude Code with the "Alpha" AI chief of staff persona.

## Brand — "Warm Dark Confidence"
- Palette: amber/copper (#D4A574, #B8956A) on charcoal backgrounds
- Fonts: Cormorant Garamond (serif headings), Inter (body), JetBrains Mono (code/addresses)
- Traffic lights are warm, not garish: sage/forest (green), warm amber/copper (amber), deep terra cotta (red)
- Tagline: "See what Chainalysis sees — about you."
- Tone: quiet conviction with solidarity. Never say anonymity/hiding — say privacy/sovereignty/defence
- Every public communication must be courtroom-ready human rights intent (learned from Samourai prosecution)

## Architecture
```
shield/          Rust core library (~11.4K lines, 8 modules)
shield-node/     NAPI bindings (Rust → Node.js via native addon)
shield-cli/      CLI interface (Rust)
shield-app/      React 19 + Vite 6 + Tailwind v4 frontend
data/            Entity label database CSVs
docs/            Design documents and implementation plans
```

## Tech stack
- Engine: Rust (electrum-client, petgraph, rusqlite)
- Bindings: napi-rs with ThreadsafeFunction for progress streaming
- Frontend: React 19, Vite 6, Tailwind CSS v4, 21 components
- Desktop: Electron 35 (configured, not yet packaging)
- Dev mode: Express SSE on :3001 + Vite on :5173
- Label DB: SQLite, 1,027,722 addresses, 9 sources
- Config: ~/.shield/config.json

## Connection modes
- `public_ssl` — Direct SSL to public Electrum servers (DEFAULT — always use this)
- `public_tor` — Through Tor SOCKS5 proxy
- `own_server` — User's own Electrum server

## Known pitfalls — READ THESE
1. **Config reverts to Tor mode.** If connections hang, the config has reverted to public_tor. Fix: `curl -X POST http://localhost:3001/api/configure -H "Content-Type: application/json" -d '{"mode":"public_ssl"}'`. The default MUST be public_ssl.
2. **Electrum connection hangs.** Fixed by racing all 7 servers in parallel with 6s per-server timeout and 10s hard deadline. If you see slow connections, check the server racing logic in the blockchain client.
3. **Trace stall.** 30-second stall timeout is in place. If no new tx fetched for 30s during BFS, Shield breaks out early and scores what it has.
4. **WSLg can't render Electron.** Use the Express dev server bridge for testing. Electron packaging targets native Windows builds.
5. **ACES tone mapping.** Three.js renderer uses ACESFilmicToneMapping which desaturates colours. Any new materials must have `toneMapped: false`. See PBR Colour Truth principle below.

## PBR Colour Truth (reusable principle)
- Dielectrics: brand hex in `color` (albedo), metalness 0, emissive ≤0.08 shadow fill only
- Coloured metals: brand hex in `color` + metalness ~0.9
- Always `toneMapped: false` per-material to bypass ACES desaturation
- Never use emissive as the colour source (looks like neon)

## Privacy rules (non-negotiable)
- No real wallet data for testing
- No silent third-party connections
- No unencrypted TCP to public servers
- No user data ever leaves the device
- No third-party API queries that reveal user addresses

## What's built and working
- Full wallet scanning (xpub/ypub/zpub/descriptors)
- BFS upstream tracing (3 presets: standard 3 hops/500 tx, deep 6/2K, paranoia 10/5K)
- Address clustering, entity labelling, per-UTXO privacy scoring (0-100, GREEN/AMBER/RED)
- 9 risk factor detectors
- Adversary simulation engine
- Behavioural fingerprint analysis
- Pre-transaction spend simulation
- Full UX overhaul (plain English, 18 wallet guides)
- Phase 5 dashboard visual redesign (hero verdict, action cards, coin list, collapsible investigation report)
- Real-time SSE progress streaming
- 226+ Rust unit tests

## What's NOT done yet
- Electron packaging (.exe) — THIS IS THE NEXT PRIORITY
- Complete test coverage across all modules
- CI/CD for Electron builds
- Phase 5: continuous monitoring/alerts
- Phase 6: community labels
- Phase 7: Lightning analysis

## Revenue model
- Free: 3 scans/day, standard depth
- Pro $9.99/mo: unlimited, deep, paranoia, simulation, monitoring
- Institutional $49.99/mo: API access, multi-wallet

## Session protocol
At the end of every session, print a status update block for Glenn's Command Centre dashboard:
```json
{"updates":[{"id":"shield-engine","status":"active","nextAction":"What to do next","blockers":"Any blockers or empty string","notes":"What was accomplished this session"}]}
```


## Skills
- Before starting any task, check .claude/skills/ for relevant skill files and follow them. Skills override general knowledge — they contain hard-won corrections specific to this project.
- After completing any multi-step process that required 3+ back-and-forth corrections, automatically create a skill file in .claude/skills/ capturing the final working process.
- After using an existing skill, if I corrected you or the output needed changes, update the skill file with what you learned BEFORE ending the session.
- NEVER close a session where a correction was made without updating the relevant skill file. This is non-negotiable.
- Name skills descriptively: weekly-brief-build.md, chart-generation.md, etc.
