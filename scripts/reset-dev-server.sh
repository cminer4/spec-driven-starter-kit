#!/usr/bin/env bash
# Kill stray Next.js/Node dev processes, clear build cache, free ports.
# Run this when "localhost unable to handle this request" or page won't load.
# Usage: ./scripts/reset-dev-server.sh

set -e
echo "Resetting dev server environment..."

# Kill Node processes running Next.js dev (common patterns)
pkill -f "next dev" 2>/dev/null || true
pkill -f "node.*next" 2>/dev/null || true
# Also kill anything on common dev ports if still stuck
for port in 3000 3001 3002; do
  lsof -ti :$port 2>/dev/null | xargs kill -9 2>/dev/null || true
done

# Clear Next.js build cache
if [ -d ".next" ]; then
  rm -rf .next
  echo "Cleared .next cache"
fi

# Clear other common caches
[ -d ".turbo" ] && rm -rf .turbo && echo "Cleared .turbo cache"
[ -d "node_modules/.cache" ] && rm -rf node_modules/.cache && echo "Cleared node_modules cache"

echo ""
echo "Done. Start fresh with:"
echo "  npm run dev"
echo ""
echo "Or use dev:safe to reset and start in one step:"
echo "  npm run dev:safe"
