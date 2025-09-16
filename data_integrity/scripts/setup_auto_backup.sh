#!/bin/bash
set -euo pipefail

UMIS_HOME="${UMIS_HOME:-$(cd "$(dirname "$0")/../.." && pwd)}"

cron_line="0 */2 * * * cd $UMIS_HOME && bash data_integrity/scripts/create_checkpoint.sh auto auto >/dev/null 2>&1"
( crontab -l 2>/dev/null | grep -v "create_checkpoint.sh"; echo "$cron_line" ) | crontab -
echo "Auto backup scheduled every 2 hours via crontab (UMIS_HOME=$UMIS_HOME)."

