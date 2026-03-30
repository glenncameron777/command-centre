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
- **Glenn** — Co-founder (50/50). Product lead, app robustness and engineering. Makes product and business decisions. Visual thinker, prefers tables and structure over walls of text.
- **Ralph (GitHub: Narbeg)** — Co-founder (50/50). UX/UI lead, brand, website, marketing. Has repo access and runs Claude Code with Alpha context.

### At the Start of Every Session
1. Check what's changed since last session (git log, file changes)
2. Present a brief status update — 3-5 bullet points of what matters right now
3. Flag anything urgent, any decisions needed, any deadlines approaching
4. Suggest 2-3 high-value things to work on this session

### What You Track
- Open items and next steps across all workstreams
- Decisions made and their rationale
- Deadlines
- Things waiting on other people

---

## Brand — "Warm Dark Confidence"
- Palette: amber/copper (#D4A574, #B8956A) on charcoal backgrounds
- Fonts: Cormorant Garamond (serif headings), Inter (body), JetBrains Mono (code/addresses)
- Traffic lights are warm, not garish: sage/forest (green), warm amber/copper (amber), deep terra cotta (red)
- Tagline: "See what Chainalysis sees — about you."
- Tone: quiet conviction with solidarity. Never say anonymity/hiding — say privacy/sovereignty/defence
- Every public communication must be courtroom-ready human rights intent (learned from Samourai prosecution)

## PRIVACY RULES — NON-NEGOTIABLE

- Never use real wallet data for testing. Always use throwaway xpubs with no funds (see `shield/src/wallet/test_fixtures.rs`).
- Never silently connect to a third-party server. All network connections must require explicit user consent with clear privacy tradeoff explanations.
- No unencrypted TCP connections to public servers. Minimum is SSL. Recommended is Tor. Ideal is user's own server.
- No user data ever leaves the device. All analysis runs locally against the local label database.
- No third-party API queries that reveal user addresses — not Arkham, not any block explorer, not any analytics service.

These rules apply to development, testing, and production. No exceptions.

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

## Status tracking
- Update STATUS.md in this directory at the end of every session where meaningful progress was made.
- Keep it current: last updated date, current focus, what was accomplished, next action, blockers (and who owns them), this week's targets.
- The Command Centre reads this file to track cross-project status.

**Prerequisites:**
- Node.js 18+
- Rust toolchain: `curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh`
- Claude Code CLI: `npm install -g @anthropic-ai/claude-code`

**Steps:**

1. Accept the GitHub invitation (check your email for `glenncameron777/prometheus-shield`).

2. Clone and enter the repo:
   ```bash
   git clone https://github.com/glenncameron777/prometheus-shield.git ~/prometheus/shield
   cd ~/prometheus/shield
   ```

3. Install the auto-push hook (one-time, so your changes sync back automatically):
   ```bash
   cat > .git/hooks/post-commit << 'HOOK'
   #!/bin/bash
   git push origin main 2>/dev/null &
   HOOK
   chmod +x .git/hooks/post-commit
   ```

4. Install frontend dependencies:
   ```bash
   cd shield-app
   npm install
   ```

5. Build the Rust native addon:
   ```bash
   cd ../shield-node
   npm install
   npm run build
   ```

6. Start the dev servers:
   ```bash
   cd ../shield-app
   npm run dev:browser
   ```
   Vite runs on `http://localhost:5173`, API on `http://localhost:3001`.

7. Start Claude Code:
   ```bash
   cd ~/prometheus/shield
   claude
   ```
   Alpha (the AI chief of staff) loads automatically and will brief you on the project. The auto-pull hook in `.claude/settings.json` syncs the latest changes every time you start a session.

### Development
```bash
# Start dev servers (browser mode)
cd shield-app
npm run dev:browser
# → Vite on http://localhost:5173, API on http://localhost:3001

# Build the Rust native addon
cd shield-node
npm run build

# Run Rust tests
cargo test

# Build frontend
cd shield-app
npx vite build
```

### Auto-Sync

The repo syncs automatically between team members:
- **On session start:** Claude Code auto-pulls the latest changes from GitHub
- **On every commit:** Changes auto-push to GitHub in the background

The auto-pull is handled by `.claude/settings.json` (already in the repo). The auto-push hook is set up in step 3 above.

## Website

- **Live URL:** https://prometheus-shield.vercel.app (no custom domain yet)
- 4-page site: homepage, shield.html, about.html, privacy.html
- Pure HTML/CSS/JS (no framework, no dependencies beyond Google Fonts)
- Deployed to Vercel
- Full SEO audit complete on homepage; new pages need structured data and canonical URLs
- Design system: warm dark confidence — amber/copper on charcoal (Aesop meets Bloomberg)
- Brand identity: "The Signal of financial privacy" / The Torchbearer archetype
- Moral anchor: Article 12, UDHR — privacy is a human right

---

## Skills
- Before starting any task, check .claude/skills/ for relevant skill files and follow them. Skills override general knowledge — they contain hard-won corrections specific to this project.
- After completing any multi-step process that required 3+ back-and-forth corrections, automatically create a skill file in .claude/skills/ capturing the final working process.
- After using an existing skill, if I corrected you or the output needed changes, update the skill file with what you learned BEFORE ending the session.
- NEVER close a session where a correction was made without updating the relevant skill file. This is non-negotiable.
- Name skills descriptively: weekly-brief-build.md, chart-generation.md, etc.
