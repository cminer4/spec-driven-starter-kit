#!/usr/bin/env bash
# Verify build output contains expected styling (brand tokens).
# Prevents BUG: styling not applied after deployment or local build cache corruption.
# Exit 0 = OK, exit 1 = styling missing.
# Usage: ./scripts/verify-build-health.sh
# Requires: .next/static/css/*.css (Next.js) or equivalent build output

set -e

# Brand tokens that should appear in compiled CSS when styling is applied
# Customize for your project's design tokens
BRAND_MARKERS='--color-primary|bg-brand-primary|text-brand-primary'

CSS_DIR=".next/static/css"
if [ ! -d "$CSS_DIR" ]; then
  echo "Build output not found at $CSS_DIR — run build first"
  exit 1
fi

FOUND=0
for f in "$CSS_DIR"/*.css; do
  [ -f "$f" ] || continue
  # Pattern passed after -- so --color-primary is not interpreted as grep option
  if grep -qE -- "$BRAND_MARKERS" "$f" 2>/dev/null; then
    FOUND=1
    break
  fi
done

if [ "$FOUND" -eq 1 ]; then
  echo "Build health OK — brand tokens found in CSS"
  exit 0
else
  echo "Build health FAIL — brand tokens missing from CSS (styling may not be applied)"
  exit 1
fi
