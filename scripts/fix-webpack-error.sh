#!/usr/bin/env bash
# Full clean for webpack/Next.js cache corruption (ENOENT, MODULE_NOT_FOUND, etc).
# Run when build or dev fails after code changes.
# Usage: ./scripts/fix-webpack-error.sh

set -e
echo "Running full cache and build clean..."

# First run reset to kill processes and clear .next
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
"$SCRIPT_DIR/reset-dev-server.sh"

# Additional aggressive cache clearing
rm -rf .next 2>/dev/null || true
rm -rf .turbo 2>/dev/null || true
rm -rf node_modules/.cache 2>/dev/null || true

# Optional: npm cache clean (uncomment if needed)
# npm cache clean --force

echo ""
echo "Cache cleared. Rebuild with:"
echo "  npm run build"
echo ""
echo "Or for dev:"
echo "  npm run dev"
