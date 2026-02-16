#!/usr/bin/env bash
# Full flow: build:clean → verify:build. If verification fails, runs fix-webpack-error.sh and retries.
# Use before declaring implementation complete or deploying.
# Usage: ./scripts/ensure-build-health.sh
# Exit 0 = build healthy, exit 1 = failed after retries

set -e
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
MAX_ATTEMPTS=2
ATTEMPT=1

while [ "$ATTEMPT" -le "$MAX_ATTEMPTS" ]; do
  echo "Build health attempt $ATTEMPT/$MAX_ATTEMPTS..."
  npm run build:clean
  if "$SCRIPT_DIR/verify-build-health.sh"; then
    echo "Build health verified."
    exit 0
  fi
  if [ "$ATTEMPT" -lt "$MAX_ATTEMPTS" ]; then
    echo "Verification failed. Running fix-webpack-error.sh and retrying..."
    "$SCRIPT_DIR/fix-webpack-error.sh"
  fi
  ATTEMPT=$((ATTEMPT + 1))
done

echo "Build health verification failed after $MAX_ATTEMPTS attempts."
exit 1
