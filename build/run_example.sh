#!/usr/bin/env bash
set -euo pipefail

UMIS_HOME="${UMIS_HOME:-$(cd "$(dirname "$0")/.." && pwd)}"
export UMIS_MODE=${1:-adaptive}
"$UMIS_HOME/bin/umis"
