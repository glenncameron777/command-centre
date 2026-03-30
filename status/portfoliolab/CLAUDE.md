## Memory & context files
- Read `memory.md` in this directory at the start of every session. It has content preferences, platform credentials, architecture decisions, and pitfalls.
- Also check auto-memory at `~/.claude/projects/.../memory/MEMORY.md` for SEO checklists, feedback rules, and user context.
- When I correct you, establish a preference, or we discover a pitfall, update the relevant section in memory.md.
- Keep memory.md current. Replace outdated info, do not duplicate.
- Only save substantial corrections and decisions, not trivial details.
- Check `STATUS.md` for current focus, recent progress, and next priorities.
- Check `DATA-SOURCES.md` when working with APIs or data fetching.

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
- Domain ~1 month old, exiting Google sandbox
- 22.4K impressions, 9 clicks, 100% non-branded (as of March 24)
- Top query: "btc dca calculator"
- Top pages: /blog/cheapest-expensive-stock-markets-2026, /tools/bitcoin-dca-calculator

## Social / promotion
- Reddit: Key_Bee_682. r/Bitcoin BANNED permanently (appealed March 6, no response). r/CryptoCurrency needs 50 karma + 30d age
- LinkedIn: posting ~1/day
- Twitter/X: @PortfolioLabApp (created March 24, 2026)
- Telegram bot: @portfoliolab_drafts_bot for draft notifications
- Social hub: /social-hub?key=a3c8380b5ef72ff8974e4a691e046e1f057c12adac15db04
- Daily scheduled agent: 9am London, drafts Reddit/Twitter/LinkedIn content to social hub
- Tone: conversational, natural imperfections. People flag AI content on Reddit. NEVER use em dashes.

## 90-day content strategy
- Month 1: 4 free tools + 4 blog posts + Reddit + LinkedIn (mostly done)
- Month 2: 2 more tools + 4 posts + premium features + podcast outreach + Twitter
- Month 3: 4 more premium features + 4 posts + first podcast appearances

## DIY Financial Planner (separate app)
Lives in the `web/` directory on branch `feature/per-person-tax-breakdown`. UK-focused financial planning app with retirement modelling, cashflow, estate planning, tax calculations. Uses localStorage only. Not related to the Bitcoin content strategy.

## Status tracking
- Update STATUS.md in this directory at the end of every session where meaningful progress was made.
- Keep it current: last updated date, current focus, what was accomplished, next action, blockers (and who owns them), this week's targets.
- The Command Centre reads this file to track cross-project status.


## SEO
- Before creating any new blog post, tool page, or content page, check memory for the SEO checklist (`feedback_seo_checklist_new_content.md`) and follow it completely.
- Before refreshing/updating existing blog content, check memory for the date update process (`feedback_update_dates_on_refresh.md`).
- Every new page MUST have: appropriate schema (ArticleSchema/FAQSchema), BreadcrumbSchema, OpenGraph metadata, internal links to/from related pages.
- Never ship a new content page without hitting every item on the SEO checklist.
- At the start of every session, check `src/app/social-hub/seo-brief.md` for the latest weekly SEO brief. If it has action items marked [CRITICAL] or [HIGH], fix them immediately before doing anything else. Add any new pages to sitemap.ts.
- Check `/mnt/c/Users/glenn/Downloads/` for recent GSC export files (Performance xlsx, Coverage xlsx). If fresh files exist (less than 7 days old), analyze them: identify pages with high impressions but low CTR (rewrite titles), pages at position 8-15 (double down), pages with zero impressions after 60 days (investigate). Report findings to Glenn with recommended actions.

## Skills
- Before starting any task, check .claude/skills/ for relevant skill files and follow them. Skills override general knowledge — they contain hard-won corrections specific to this project.
- Key skills to check by task type:
  - **Writing blog posts**: `blog-post-build.md` (full process), `seo-strategy.md`, `data-conventions.md`
  - **Social media content**: `social-posting-workflow.md`, `social-distribution.md` + check memory `feedback_social_content_quality.md` (app screenshots, logo, no duplicates)
  - **Marketing/growth**: `marketing-plan.md`
  - **Auth/gating work**: `auth-gating-setup.md`
  - **Any dev work**: `dev-conventions.md`, `data-conventions.md`
- After completing any multi-step process that required 3+ back-and-forth corrections, automatically create a skill file in .claude/skills/ capturing the final working process.
- After using an existing skill, if I corrected you or the output needed changes, update the skill file with what you learned BEFORE ending the session.
- NEVER close a session where a correction was made without updating the relevant skill file. This is non-negotiable.
- Name skills descriptively: weekly-brief-build.md, chart-generation.md, etc.
