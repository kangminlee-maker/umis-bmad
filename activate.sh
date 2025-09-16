#!/usr/bin/env bash
set -euo pipefail

UMIS_HOME="${UMIS_HOME:-$(cd "$(dirname "$0")" && pwd)}"
MODE="${1:-adaptive}"
PROFILE="${2:-cursor_chat}"

echo "[UMIS] repo map (key)"
echo "- build/: bundle & validate"
echo "- ui/: chat router/commands/prompts"
echo "- profiles/: cursor_chat, quick_sam"
echo "- agents/, workflows/, monitoring/, quality/, output/"

echo "[UMIS] ensuring bundles..."
"$UMIS_HOME/build/run_bundle.sh" "$MODE" "$PROFILE"

echo "[UMIS] Ready. Next: say 'UMIS 활성화' then describe your problem in one sentence."

