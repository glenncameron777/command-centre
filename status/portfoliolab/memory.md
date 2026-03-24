# Memory
> This file is updated automatically by Claude Code. Do not edit manually unless cleaning up.

## Preferences
- Reddit tone: conversational, natural imperfections — people flag AI content
- Max 1 LinkedIn post per day
- Privacy-first: all calculations run client-side, no server calls
- Position as "Bitcoin portfolio analysis for serious investors," NOT "crypto tools"

## Decisions made
- Bitcoin expected return: 15.00% geometric, 42.5% volatility
- Risk-free rate: 3.10% (US Cash, JPM LTCMA 2026)
- 27 asset classes from J.P. Morgan 2026 LTCMA + Bitcoin
- Composite indices (AC World, EAFE) excluded from "Select All" to avoid double-counting
- Reddit account: Key_Bee_682 (r/Bitcoin banned permanently — assume dead. Appealed March 6, no response.)
- r/CryptoCurrency needs 50 karma + 30 days account age
- Bogleheads forum is #1 priority referral channel (PortfolioCharts gets 38% traffic from there)
- Portfolio Visualizer paywall migration = competitive opportunity for free positioning

## Pitfalls discovered
- Blog posts are TSX with inline styled components — NEVER MDX
- DIY Financial Planner is on a separate branch (feature/per-person-tax-breakdown) — don't touch from main
- src/proxy.ts IS the Next.js 16 middleware (renamed from middleware.ts). Do NOT create src/middleware.ts.
- src/lib/supabase/middleware.ts is a library helper, NOT the Next.js entry point. Don't rename it.

## Conventions established
- Blog posts need FAQ schema + ArticleSchema
- After publishing: add to sitemap, add to blog index POSTS array, request indexing in Search Console
- SEO snapshot (March 24): 22.4K impressions, 9 clicks, 100% non-branded. Top query: "btc dca calculator"
- All skill files live in .claude/skills/ — check them before any task

## Auth architecture
- Supabase auth (email + password, no social/magic link)
- proxy.ts → updateSession → public routes skip auth, /app/* requires login
- Password reset: /forgot-password → email → /reset-password → updateUser
- CTAs on every free tool push to /signup
