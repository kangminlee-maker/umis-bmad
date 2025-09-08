#!/bin/bash
# Universal Market Intelligence System (UMIS) v4.0 Installer for BMAD
# This script installs UMIS on top of existing BMAD installation

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Installation variables
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
INSTALL_FILES_DIR="${SCRIPT_DIR}/install-files"
VERSION="4.0"
INSTALL_DATE=$(date -u +"%Y-%m-%dT%H:%M:%S.000Z")

echo -e "${BLUE}================================================${NC}"
echo -e "${BLUE}Universal Market Intelligence System v${VERSION}${NC}"
echo -e "${BLUE}BMAD Extension Pack Installer${NC}"
echo -e "${BLUE}================================================${NC}"
echo ""

# Function to check if BMAD is installed
check_bmad_installation() {
    echo -e "${YELLOW}🔍 Checking BMAD installation...${NC}"
    
    if [ ! -d ".bmad-core" ]; then
        echo -e "${RED}❌ Error: BMAD is not installed in current directory${NC}"
        echo -e "${RED}   Please run this installer from a BMAD project root${NC}"
        exit 1
    fi
    
    if [ ! -f ".bmad-core/core-config.yaml" ]; then
        echo -e "${RED}❌ Error: BMAD core configuration not found${NC}"
        echo -e "${RED}   Your BMAD installation may be corrupted${NC}"
        exit 1
    fi
    
    echo -e "${GREEN}✅ BMAD installation found${NC}"
}

# Function to check if UMIS is already installed
check_existing_umis() {
    echo -e "${YELLOW}🔍 Checking for existing UMIS installation...${NC}"
    
    if [ -f ".bmad-core/install-manifest-umis.yaml" ]; then
        echo -e "${YELLOW}⚠️  Warning: UMIS appears to be already installed${NC}"
        read -p "Do you want to reinstall/update? (y/N): " -n 1 -r
        echo
        if [[ ! $REPLY =~ ^[Yy]$ ]]; then
            echo -e "${YELLOW}Installation cancelled${NC}"
            exit 0
        fi
    else
        echo -e "${GREEN}✅ No existing UMIS installation found${NC}"
    fi
}

# Function to backup existing BMAD core config
backup_core_config() {
    echo -e "${YELLOW}📦 Backing up existing configuration...${NC}"
    
    if [ -f ".bmad-core/core-config.yaml" ]; then
        cp ".bmad-core/core-config.yaml" ".bmad-core/core-config.yaml.backup-$(date +%Y%m%d-%H%M%S)"
        echo -e "${GREEN}✅ Configuration backed up${NC}"
    fi
}

# Function to install UMIS agents
install_agents() {
    echo -e "${YELLOW}🤖 Installing UMIS agents...${NC}"
    
    # Copy agent files
    cp "${INSTALL_FILES_DIR}/agents/"*.md ".bmad-core/agents/" 2>/dev/null || true
    
    # Count installed agents
    AGENT_COUNT=$(ls -1 "${INSTALL_FILES_DIR}/agents/"*.md 2>/dev/null | wc -l || echo "0")
    echo -e "${GREEN}✅ Installed ${AGENT_COUNT} UMIS agents${NC}"
}

# Function to install workflows
install_workflows() {
    echo -e "${YELLOW}📊 Installing UMIS workflows...${NC}"
    
    cp "${INSTALL_FILES_DIR}/workflows/"*.yaml ".bmad-core/workflows/" 2>/dev/null || true
    
    WORKFLOW_COUNT=$(ls -1 "${INSTALL_FILES_DIR}/workflows/"*.yaml 2>/dev/null | wc -l || echo "0")
    echo -e "${GREEN}✅ Installed ${WORKFLOW_COUNT} workflows${NC}"
}

# Function to install tasks
install_tasks() {
    echo -e "${YELLOW}📋 Installing UMIS tasks...${NC}"
    
    cp "${INSTALL_FILES_DIR}/tasks/"*.md ".bmad-core/tasks/" 2>/dev/null || true
    
    TASK_COUNT=$(ls -1 "${INSTALL_FILES_DIR}/tasks/"*.md 2>/dev/null | wc -l || echo "0")
    echo -e "${GREEN}✅ Installed ${TASK_COUNT} tasks${NC}"
}

# Function to install templates
install_templates() {
    echo -e "${YELLOW}📄 Installing UMIS templates...${NC}"
    
    cp "${INSTALL_FILES_DIR}/templates/"* ".bmad-core/templates/" 2>/dev/null || true
    
    TEMPLATE_COUNT=$(ls -1 "${INSTALL_FILES_DIR}/templates/"* 2>/dev/null | wc -l || echo "0")
    echo -e "${GREEN}✅ Installed ${TEMPLATE_COUNT} templates${NC}"
}

# Function to install checklists
install_checklists() {
    echo -e "${YELLOW}✔️  Installing quality checklists...${NC}"
    
    cp "${INSTALL_FILES_DIR}/checklists/"*.md ".bmad-core/checklists/" 2>/dev/null || true
    
    CHECKLIST_COUNT=$(ls -1 "${INSTALL_FILES_DIR}/checklists/"*.md 2>/dev/null | wc -l || echo "0")
    echo -e "${GREEN}✅ Installed ${CHECKLIST_COUNT} checklists${NC}"
}

# Function to install data files
install_data() {
    echo -e "${YELLOW}📊 Installing data libraries...${NC}"
    
    cp "${INSTALL_FILES_DIR}/data/"*.yaml ".bmad-core/data/" 2>/dev/null || true
    
    DATA_COUNT=$(ls -1 "${INSTALL_FILES_DIR}/data/"*.yaml 2>/dev/null | wc -l || echo "0")
    echo -e "${GREEN}✅ Installed ${DATA_COUNT} data files${NC}"
}

# Function to install utilities
install_utils() {
    echo -e "${YELLOW}🔧 Installing utilities...${NC}"
    
    cp "${INSTALL_FILES_DIR}/utils/"* ".bmad-core/utils/" 2>/dev/null || true
    chmod +x ".bmad-core/utils/"*.sh 2>/dev/null || true
    
    UTIL_COUNT=$(ls -1 "${INSTALL_FILES_DIR}/utils/"* 2>/dev/null | wc -l || echo "0")
    echo -e "${GREEN}✅ Installed ${UTIL_COUNT} utilities${NC}"
}

# Function to install agent teams
install_teams() {
    echo -e "${YELLOW}👥 Installing agent teams...${NC}"
    
    cp "${INSTALL_FILES_DIR}/agent-teams/"*.yaml ".bmad-core/agent-teams/" 2>/dev/null || true
    
    TEAM_COUNT=$(ls -1 "${INSTALL_FILES_DIR}/agent-teams/"*.yaml 2>/dev/null | wc -l || echo "0")
    echo -e "${GREEN}✅ Installed ${TEAM_COUNT} team definitions${NC}"
}

# Function to update core configuration
update_core_config() {
    echo -e "${YELLOW}⚙️  Updating BMAD configuration for UMIS...${NC}"
    
    # Check if core-config.yaml exists and update it
    if [ -f ".bmad-core/core-config.yaml" ]; then
        # Check if UMIS configuration already exists
        if ! grep -q "marketAnalysis:" ".bmad-core/core-config.yaml"; then
            # Append UMIS configuration
            cat >> ".bmad-core/core-config.yaml" << 'EOF'

# UMIS Extension Configuration
marketAnalysis:
  briefFile: docs/market-analysis-brief.md
  reportFile: docs/market-report.md
  samFile: docs/sam-calculation.xlsx
  knowledgeBase: docs/knowledge-base
dataValidation:
  definitionsLocation: .bmad-core/data/market-definitions-library.yaml
  validationLog: .ai/validation-log.md
qualityGates:
  checklistsLocation: .bmad-core/checklists
  gateResults: docs/quality-gates
customDocuments:
  - docs/market-structure-map.md
  - docs/opportunity-portfolio.md
  - docs/competitive-analysis.md
slashPrefix: UMIS
EOF
            echo -e "${GREEN}✅ UMIS configuration added${NC}"
        else
            echo -e "${YELLOW}ℹ️  UMIS configuration already exists${NC}"
        fi
    fi
}

# Function to create UMIS install manifest
create_install_manifest() {
    echo -e "${YELLOW}📝 Creating installation manifest...${NC}"
    
    cat > ".bmad-core/install-manifest-umis.yaml" << EOF
# UMIS Installation Manifest
version: ${VERSION}
system_name: Universal Market Intelligence System
based_on: BMAD Core
installed_at: ${INSTALL_DATE}
install_type: extension
installer_version: 1.0
market_intelligence_agents:
  - MAnalyst - Market Structure Analyst
  - MExplorer - Opportunity Explorer  
  - MQuant - Market Quantifier
  - MValidator - Data Validator
  - MCurator - Knowledge Curator
  - MOwner - Strategic Decision Maker
capabilities:
  - Market structure analysis
  - Opportunity exploration
  - Market sizing (SAM calculation)
  - Data validation and verification
  - Knowledge management
  - Strategic decision support
workflows:
  - market-entry-analysis
  - investment-decision
  - competitive-strategy
  - market-monitoring
quality_gates:
  - Market structure completeness
  - Opportunity validity
  - SAM convergence
  - Decision readiness
EOF
    
    echo -e "${GREEN}✅ Installation manifest created${NC}"
}

# Function to create project directories
create_project_dirs() {
    echo -e "${YELLOW}📁 Creating project directories...${NC}"
    
    mkdir -p projects docs/.ai
    mkdir -p docs/knowledge-base
    mkdir -p docs/quality-gates
    
    echo -e "${GREEN}✅ Project directories created${NC}"
}

# Function to display post-installation instructions
display_instructions() {
    echo ""
    echo -e "${GREEN}🎉 UMIS Installation Complete!${NC}"
    echo -e "${GREEN}================================${NC}"
    echo ""
    echo -e "${BLUE}To start using UMIS:${NC}"
    echo ""
    echo "1. Activate an agent:"
    echo -e "   ${YELLOW}/UMIS *activate MOwner${NC}"
    echo ""
    echo "2. Start a new market analysis project:"
    echo -e "   ${YELLOW}*kickoff \"Your Market Name\"${NC}"
    echo ""
    echo "3. Run a workflow:"
    echo -e "   ${YELLOW}*workflow market-entry-analysis${NC}"
    echo ""
    echo "Available UMIS agents:"
    echo "  • MOwner    - Strategic Decision Maker 🎯"
    echo "  • MAnalyst  - Market Structure Analyst 🔍"
    echo "  • MExplorer - Opportunity Explorer 💡"
    echo "  • MQuant    - Market Quantifier 💰"
    echo "  • MValidator - Data Validator ✅"
    echo "  • MCurator  - Knowledge Curator 📚"
    echo ""
    echo -e "${BLUE}Documentation:${NC} See docs/UMIS-Guide.md"
    echo -e "${BLUE}Support:${NC} https://github.com/your-repo/umis-bmad"
}

# Main installation flow
main() {
    echo -e "${YELLOW}Starting UMIS installation...${NC}"
    echo ""
    
    # Check prerequisites
    check_bmad_installation
    check_existing_umis
    
    # Backup and prepare
    backup_core_config
    
    # Install components
    echo ""
    echo -e "${BLUE}Installing UMIS components...${NC}"
    install_agents
    install_workflows
    install_tasks
    install_templates
    install_checklists
    install_data
    install_utils
    install_teams
    
    # Configure system
    echo ""
    echo -e "${BLUE}Configuring system...${NC}"
    update_core_config
    create_install_manifest
    create_project_dirs
    
    # Copy documentation
    if [ -d "${SCRIPT_DIR}/docs" ]; then
        echo -e "${YELLOW}📚 Installing documentation...${NC}"
        cp -r "${SCRIPT_DIR}/docs/"* "docs/" 2>/dev/null || true
        echo -e "${GREEN}✅ Documentation installed${NC}"
    fi
    
    # Display completion message
    display_instructions
}

# Run main installation
main
