# Memory
> This file is updated automatically by Claude Code. Do not edit manually unless cleaning up.

## Preferences
- Reddit tone: conversational, natural imperfections — people flag AI content
- Max 1 LinkedIn post per day
- Privacy-first: all calculations run client-side, no server calls
- Position as "Bitcoin portfolio analysis for serious investors," NOT "crypto tools"
- NEVER use em dashes in social media posts or any marketing content. Dead giveaway for AI content. Use periods, commas, colons, or just rephrase.
- Reddit strategy: manual posting only. Draft comments with thread links on social hub, Glenn copy-pastes. No automated posting.
- X/Twitter free API tier does NOT allow posting. Use copy-paste from social hub instead.

## Decisions made
- Bitcoin expected return: 15.00% geometric, 42.5% volatility
- Risk-free rate: 3.10% (US Cash, JPM LTCMA 2026)
- 27 asset classes from J.P. Morgan 2026 LTCMA + Bitcoin
- Composite indices (AC World, EAFE) excluded from "Select All" to avoid double-counting
- Reddit account: Key_Bee_682 (r/Bitcoin banned permanently. Appealed March 6, no response.)
- r/CryptoCurrency needs 50 karma + 30 days account age
- Twitter/X: @PortfolioLabApp (created March 24, 2026)
- Telegram bot: @portfoliolab_drafts_bot. Credentials in .env.local (TELEGRAM_BOT_TOKEN, TELEGRAM_CHAT_ID)
- Bogleheads forum is #1 priority referral channel (PortfolioCharts gets 38% traffic from there)
- Portfolio Visualizer paywall migration = competitive opportunity for free positioning
- Social hub at /social-hub?key=a3c8380b5ef72ff8974e4a691e046e1f057c12adac15db04
- Daily scheduled agent runs at 9am London (8am UTC). Trigger ID: trig_01CckPM2bbSEVCvQoTomUPSk. Managed at claude.ai/code/scheduled/

## Pitfalls discovered
- Blog posts are TSX with inline styled components. NEVER MDX
- DIY Financial Planner is on a separate branch (feature/per-person-tax-breakdown). Don't touch from main
- src/proxy.ts IS the Next.js 16 middleware (renamed from middleware.ts). Do NOT create src/middleware.ts.
- src/lib/supabase/middleware.ts is a library helper, NOT the Next.js entry point. Don't rename it.
- Social hub "Done" state: uses localStorage + Supabase (table social_hub_posted needs to be created via SQL editor if not done yet)

## Conventions established
- Blog posts need FAQ schema + ArticleSchema
- After publishing: add to sitemap, add to blog index POSTS array, request indexing in Search Console
- SEO snapshot (March 24): 22.4K impressions, 9 clicks, 100% non-branded. Top query: "btc dca calculator"
- All skill files live in .claude/skills/. Check them before any task
- Social images generated via /api/social-image (Satori/vercel-og, edge runtime)
- Social posts stored in src/app/social-hub/posts.json
- Twitter posts STRICTLY under 280 characters. Always count before saving.

## Auth architecture
- Supabase auth (email + password, no social/magic link)
- proxy.ts -> updateSession -> public routes skip auth, /app/* requires login
- Password reset: /forgot-password -> email -> /reset-password -> updateUser
- CTAs on every free tool push to /signup
- /social-hub is public (in STATIC_PUBLIC array) but obscured by secret key
