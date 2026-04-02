# Memory
> This file is updated automatically by Claude Code. Do not edit manually unless cleaning up.

## Preferences
- Jake gets space — don't over-chase
- Encouraging tone on comments to Jake's documents
- Ralph handles Michael communications on fee negotiations and entity type
- Stephen's review style: comments in bubbles for feedback, track changes only for specific language/word choice, brackets = concept not exact wording
- Glenn uses **Wispr Flow** voice transcription — it mishears "Noor" as "Noah". NOAH = NOOR. Never correct this, just respond as Noor.
- **Git sync is mandatory:** Pull from `onramp-legal` repo at session start, push after any meaningful work. Ralph and Glenn work together — repo must stay in sync. Local repo: `/home/glenn/onramp-legal`, remote: `glenncameron777/onramp-mena-legal`.

## Decisions made
- Entity: Onramp MENA Inc., RAK DAO, UAE
- Key 2 confirmed: Tetra Trust (Canada) — active co-signing key partner
- Key 3 confirmed: CoinCover (UK) — passive/recovery-only key holder with 72-hour dual-gating mechanism
- CoinCover framed as embedded business continuity plan under CRA BCP requirements (Stephen's recommendation)
- xpub algorithmic generation is a critical filter — eliminates most MPC custodians
- Anchorage eliminated (requires all keys, incompatible with CBB)
- Fee counter-proposal: $0 ramp (1-15 vaults), $30K T1, $72K T2, $120K T3, $150K cap
- Fee structure: flat fee (not basis points) — rationale: simplicity for initial clients
- Gap responsibility split: Jake owns tech spec items, Glenn & Ralph own regulatory docs
- CBB strategy: MIC-first mindset (sell concept), then show tech stack facilitates it best
- Conservative approach throughout — don't take shortcuts on a new model

## Open critical items
- OFAC/sanctions screening: recognized gap, potential CBB deal-breaker. Chain Analysis preferred vendor. Needs configurable API integration in the software (bidirectional: incoming + outgoing). Action: Glenn/Ralph investigate Tetra & CoinCover screening practices; Jake to design implementation. Ralph flagged: could be a gate-stop if CBB asks and we don't have a solid answer.
- Tetra operational reliability: still sending xpubs via Google Sheets (not API), ran out of keys causing ~200 onboarding errors (2026-03-31). Michael pressuring. Jake confirms transaction API calls work, but xpub delivery is the bottleneck. Must be resolved before CBB presentation.
- Stephen review: CBB Tech Alignment Checklist sent to Stephen (as of 2026-04-01). Awaiting feedback. This gates the CBB preliminary meeting.

## Pitfalls discovered
- Zodia unresponsive — eliminated
- Unchained — bad relationship — eliminated
- Onramp US didn't have their own tech stack — was entirely BitGo via API. Discovered during process. Jake now building from scratch.
- Don't say "nothing happens without our signature" to CBB — technically the two external key holders could sign without Onramp MENA. Correct framing: contractual controls + 72-hour dual waiting period prevent this.
- CBB "too long didn't read" — don't overwhelm with documents. Simplified version for presentation, detailed answers held in reserve.

## Conventions established
- Workflows directory contains reusable process definitions (skills)
- CBB Rulebook Vol 6 downloaded to ~/onramp-mena/regulations/
- CRA-8 extracted text at ~/onramp-mena/regulations/cra8-extracted.txt
- Gap closures document at ~/onramp-mena/regulations/CRA-8-gap-closures.md
- CBB Tech Alignment Checklist: Word doc on desktop, markdown copy at ~/onramp-mena/context/cbb-tech-alignment-checklist.md
- Policy documents drafted in ClickUp — need updating once build is finalized
