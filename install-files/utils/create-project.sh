#!/bin/bash
# Create new UMIS project structure

PROJECT_NAME="$1"
if [ -z "$PROJECT_NAME" ]; then
    echo "Usage: $0 <project-name>"
    exit 1
fi

# Create project directories
mkdir -p "projects/${PROJECT_NAME}"/{data,analysis,outputs,archive}

# Create project metadata
cat > "projects/${PROJECT_NAME}/.project-meta.yaml" << EOL
project_name: ${PROJECT_NAME}
created_date: $(date -u +"%Y-%m-%dT%H:%M:%S.000Z")
status: active
agents_involved: [MOwner, MAnalyst, MExplorer, MQuant, MValidator, MCurator]
EOL

echo "✅ Project '${PROJECT_NAME}' created in projects/${PROJECT_NAME}/"
