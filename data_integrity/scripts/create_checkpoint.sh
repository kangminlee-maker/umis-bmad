#!/bin/bash
set -euo pipefail

UMIS_HOME="${UMIS_HOME:-$(cd "$(dirname "$0")/../.." && pwd)}"

timestamp=$(date +"%Y%m%d_%H%M%S")
tag=${1:-auto}
desc=${2:-checkpoint}
name="${timestamp}__${tag}__${desc}"

cd "$UMIS_HOME"

dest_dir="./checkpoints/${name}"
mkdir -p "$dest_dir"

tar -czf "${dest_dir}/project_snapshot.tgz" \
  01_raw_data 02_analysis 03_outputs 04_knowledge_extracted 05_metadata \
  .project_metadata.yaml 2>/dev/null || true

echo "Checkpoint created: ${dest_dir}"

