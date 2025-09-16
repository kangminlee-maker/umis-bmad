#!/bin/bash
set -euo pipefail

UMIS_HOME="${UMIS_HOME:-$(cd "$(dirname "$0")/../.." && pwd)}"

checkpoint_dir=${1:?"usage: restore_checkpoint.sh <checkpoint_dir>"}

cd "$UMIS_HOME"

if [ ! -d "$checkpoint_dir" ]; then
  echo "Checkpoint directory not found: $checkpoint_dir" >&2
  exit 1
fi

archive="$checkpoint_dir/project_snapshot.tgz"

if [ ! -f "$archive" ]; then
  echo "Archive not found in checkpoint: $archive" >&2
  exit 1
fi

tar -xzf "$archive" -C ./
echo "Restored from: $checkpoint_dir"

