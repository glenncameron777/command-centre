# Memory
> Updated automatically by Claude Code. Stores corrections, decisions, and context NOT already in CLAUDE.md.

## Content preferences
- NEVER use em dashes in social media posts or marketing content. Dead giveaway for AI.
- Reddit strategy: manual posting only. Draft comments with thread links on social hub, Glenn copy-pastes.
- X/Twitter free API tier does NOT allow posting. Use copy-paste from social hub instead.
- Twitter posts STRICTLY under 280 characters. Always count before saving.
- Max 1 LinkedIn post per day.

## Platform credentials & IDs
- Reddit: Key_Bee_682
- Twitter/X: @PortfolioLabApp
- Bogleheads forum: glenncameron777 (last login March 1, 2026). #1 priority referral channel.
- Telegram bot: @portfoliolab_drafts_bot. Credentials in .env.local (TELEGRAM_BOT_TOKEN, TELEGRAM_CHAT_ID)
- Daily agent trigger: trig_01CckPM2bbSEVCvQoTomUPSk. Managed at claude.ai/code/scheduled/
- Social hub posts stored in src/app/social-hub/posts.json

## Architecture decisions
- Auth: Supabase (email + password, no social/magic link)
- proxy.ts is the Next.js 16 middleware (renamed from middleware.ts). Do NOT create src/middleware.ts.
- src/lib/supabase/middleware.ts is a library helper, NOT the Next.js entry point.
- Auth flow: proxy.ts -> updateSession -> public routes skip auth, /app/* requires login
- Password reset: /forgot-password -> email -> /reset-password -> updateUser
- CTAs on every free tool push to /signup
- /social-hub is public (in STATIC_PUBLIC array) but obscured by secret key
- Social images generated via /api/social-image (Satori/vercel-og, edge runtime)
- Social hub "Done" state: localStorage + Supabase (table social_hub_posted)
- Email capture: /api/email-capture -> ConvertKit. Tags: "portfolio-optimizer" (unlock gate), "portfolio-save" (newsletter banner)
- Portfolio Visualizer paywall migration = competitive opportunity for free positioning

## Pitfalls discovered
- HARO emails must NOT be fetched via Gmail MCP. Content (journalist queries on sensitive topics) triggers Anthropic usage policy violations that poison the entire session. Glenn checks HARO manually and pastes relevant queries into the session.

## SEO learnings
- After publishing: add to sitemap, add to blog index POSTS array, request indexing in Search Console
