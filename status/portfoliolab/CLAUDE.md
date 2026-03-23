## Memory
- Read `memory.md` in this directory at the start of every session.
- When I correct you, establish a preference, or we discover a pitfall, update the relevant section in memory.md.
- Keep memory.md current. Replace outdated info, do not duplicate.
- Only save substantial corrections and decisions, not trivial details.

# PortfolioLab

## What this is
Free Bitcoin portfolio analysis platform at portfoliolab.app. Targeting serious Bitcoin investors (5-40% allocation, age 28-55, $50K-$5M investable). Differentiated by using J.P. Morgan 2026 Long-Term Capital Market Assumptions combined with Bitcoin — no other free tool does this.

## Tech stack
- Next.js 16, React 19, TypeScript strict, Tailwind CSS v4, Recharts
- Hosted on Vercel at www.portfoliolab.app
- All calculations run client-side (privacy-first, no server calls)
- Blog posts are TSX with inline styled components (no MDX)

## Key data conventions
- Bitcoin expected return: 15.00% geometric, 42.5% volatility
- Risk-free rate: 3.10% (US Cash, JPM LTCMA 2026)
- 27 asset classes from J.P. Morgan 2026 LTCMA + Bitcoin
- Composite indices (AC World, EAFE) excluded from "Select All" to avoid double-counting

## What's live
**Free tools (6):** DCA Calculator, Drawdown Analyzer, Bitcoin vs Gold, Portfolio Backtester, Correlation Dashboard, Retirement Calculator
**Premium (1):** Portfolio Optimizer (27 assets, 5 methods, email-gated with local toggle)
**Other tools:** Market Dashboard, CMA Comparison, Bitcoin Allocation Calculator, SWR Calculator, Monte Carlo Retirement, Factor Exposure Analyzer, Global CAPE Valuations
**Blog posts (7 Bitcoin + 6 general):** All TSX, all have FAQ schema and ArticleSchema

## SEO status
- Domain is ~2 weeks old, in Google sandbox
- Best ranking: "bitcoin historical drawdowns" avg position 8.6 (bottom of page 1)
- 8.45K impressions, 449 queries in first indexing period
- The blog post /blog/every-bitcoin-drawdown drives 99% of drawdown impressions

## Social / promotion
- Reddit: Key_Bee_682. r/Bitcoin BANNED (appealed March 6, no response). r/CryptoCurrency needs 50 karma + 30d age. Building karma on r/investing, r/BitcoinMarkets, r/financialindependence
- LinkedIn: posting ~1/day, retirement calculator and correlation dashboard posts done
- Twitter/X: @PortfolioLab not yet created
- Tone: conversational, natural imperfections. People flag AI content on Reddit.

## 90-day content strategy
- Month 1: 4 free tools + 4 blog posts + Reddit + LinkedIn (mostly done)
- Month 2: 2 more tools + 4 posts + premium features + podcast outreach + Twitter
- Month 3: 4 more premium features + 4 posts + first podcast appearances

## DIY Financial Planner (separate app)
Lives in the `web/` directory on branch `feature/per-person-tax-breakdown`. UK-focused financial planning app with retirement modelling, cashflow, estate planning, tax calculations. Uses localStorage only. Not related to the Bitcoin content strategy.

## Session protocol
```json
{"updates":[{"id":"portfoliolab","status":"active","nextAction":"...","notes":"..."}]}
```


## Skills
- After completing any multi-step process that required 3+ back-and-forth corrections, automatically create a skill file in .claude/skills/ capturing the final working process.
- After using an existing skill, if I corrected you or the output needed changes, update the skill file with what you learned before closing the session.
- Name skills descriptively: weekly-brief-build.md, chart-generation.md, mena-consistency-check.md
