#!/bin/bash
# Copies CLAUDE.md and memory.md from every project into command-centre/status/
# Then commits and pushes to GitHub

cd ~/command-centre

# Copy status files from all projects
for project in shield:prometheus/shield onramp-charts:onramp-charts mic-explained:mic-explained-viewer portfoliolab:projects/diy_financial_advisor/portfolio-lab onramp-mena:onramp-mena onramp-content:onramp-content; do
  name="${project%%:*}"
  path="${project##*:}"
  mkdir -p "status/$name"
  cp ~/"$path"/CLAUDE.md "status/$name/CLAUDE.md" 2>/dev/null
  cp ~/"$path"/memory.md "status/$name/memory.md" 2>/dev/null
done

# Commit and push if anything changed
git add -A
if ! git diff --cached --quiet; then
  git commit -m "auto-sync $(date '+%Y-%m-%d %H:%M')"
  git push origin main --quiet
fi
