#!/usr/bin/env bash
# Verify dev server is responding. Exit 0 = OK, exit 1 = not responding.
# Usage: ./scripts/verify-dev-server.sh [port]
# Default port: 3000

set -e
PORT="${1:-3000}"
URL="http://localhost:${PORT}"

# Curl: -s silent, -o /dev/null discard body, -w write status code, --max-time 5s
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" --max-time 5 "$URL" 2>/dev/null || echo "000")

# 2xx or 3xx = success
if [[ "$HTTP_CODE" =~ ^[23][0-9][0-9]$ ]]; then
  echo "Dev server OK at $URL (HTTP $HTTP_CODE)"
  exit 0
else
  echo "Dev server not responding at $URL (HTTP $HTTP_CODE or connection failed)"
  exit 1
fi
