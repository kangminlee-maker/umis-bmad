#!/usr/bin/env bash
set -euo pipefail

# 안전한 기본값
UMIS_HOME="${UMIS_HOME:-$(cd "$(dirname "$0")/.." && pwd)}"
MODE="${1:-adaptive}"
PROFILE="${2:-cursor_chat}"
OUT_DIR="${3:-$UMIS_HOME/build/dist}"

echo "[UMIS] build bundle: mode=${MODE} profile=${PROFILE} out=${OUT_DIR}"
python3 "$UMIS_HOME/build/make_bundle.py" --mode "$MODE" --profile "$PROFILE" --out "$OUT_DIR"

