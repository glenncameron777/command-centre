## Memory
- Read `memory.md` in this directory at the start of every session.
- When I correct you, establish a preference, or we discover a pitfall, update the relevant section in memory.md.
- Keep memory.md current. Replace outdated info, do not duplicate.
- Only save substantial corrections and decisions, not trivial details.

# Command Centre — Session Protocol

Glenn Cameron manages 13+ concurrent projects across Onramp (day job), Prometheus (personal), creative work, and side projects. The single source of truth is a persistent web dashboard in Claude.ai.

**Your job at the end of every session:** print a status update block that Glenn can paste into the dashboard's Sync panel.

## Status Update Format

At the end of a session where meaningful progress was made, print one of these:

### JSON format (preferred)

```json
{"updates":[{"id":"PROJECT_ID","status":"active","nextAction":"What to do next","blockers":"Any blockers or empty string","notes":"What was accomplished this session"}]}
```

### Line format (also accepted)

```
PROJECT_ID | STATUS | PRIORITY
next: What to do next
blockers: Any blockers or (none)
notes: What was accomplished
```

Multiple projects can be updated at once. Separate with `---` in line format, or add more objects to the updates array in JSON.

## Project IDs

Always use these exact strings:

| ID | Project | Category |
|----|---------|----------|
| `charts-v5` | Social Charts v5 | onramp |
| `market-brief` | Weekly Market Brief | onramp |
| `mic-vault` | MIC Vault Animation | onramp |
| `mic-explained-s1` | MIC Explained S1 | onramp |
| `pitch-deck` | Institutional Pitch Deck | onramp |
| `newsletter` | Weekly Newsletter | onramp |
| `research-site` | Research & Education Website | onramp |
| `mena-cbb` | MENA CBB Licensing | onramp |
| `shield-engine` | Prometheus Shield Engine | prometheus |
| `prometheus-protocol` | Prometheus Protocol & Vault | prometheus |
| `player-of-games` | Player of Games Fan Film | creative |
| `childrens-book` | Henry & Frankie Animation | creative |
| `portfoliolab` | PortfolioLab.app | personal |

If you're working on something not in this list, use a new kebab-case ID and include `name` and `category` in the update — the dashboard will add it automatically.

## Valid Values

- **status**: `active`, `blocked`, `paused`, `planned`, `done`
- **priority**: `critical`, `high`, `medium`, `low`
- **category**: `onramp`, `prometheus`, `creative`, `personal`

## Example Session End

After a session working on the Shield engine:

```
Here's your status update to paste into the Command Centre:

{"updates":[{"id":"shield-engine","status":"active","nextAction":"Wire up Phase 5 CSS to React components","blockers":"","notes":"Phase 5 visual redesign implemented. Health-report dashboard with hero verdict, action cards, inline-expanding coin list. All components rendering. 213 tests passing."}]}
```

## Rules

- Always update `nextAction` to reflect what comes AFTER what you just did
- Clear `blockers` (set to empty string) if you resolved them
- `notes` should describe what was accomplished, not the full project history
- If Glenn asks you to check the project board, ask him to paste the briefing from the dashboard's Copy Briefing button
