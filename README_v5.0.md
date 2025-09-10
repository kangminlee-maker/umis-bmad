# Universal Market Intelligence System (UMIS) for BMAD

<p align="center">
  <img src="https://img.shields.io/badge/version-5.0-purple.svg" alt="Version">
  <img src="https://img.shields.io/badge/BMAD-Extension-green.svg" alt="BMAD Extension">
  <img src="https://img.shields.io/badge/agents-6-orange.svg" alt="6 Agents">
  <img src="https://img.shields.io/badge/mode-Adaptive-red.svg" alt="Adaptive Mode">
  <img src="https://img.shields.io/badge/license-MIT-lightgrey.svg" alt="License">
</p>

## 🚀 Version Notice

This is the **v5.0 Adaptive Intelligence** branch. For stable v4.0, please checkout `main` branch.

```bash
# For stable v4.0
git checkout main

# For experimental v5.0
git checkout v5.0-adaptive
```

## 🎯 What's New in v5.0

### 🧠 Adaptive Intelligence
- **Start Unclear**: Begin with just 20-30% goal clarity (vs 80-90% in v4.0)
- **Discovery Sprint**: 1-2 day rapid exploration phase
- **Learn → Adjust → Proceed**: Continuous adaptation based on findings
- **Low-Cost Pivoting**: Change direction easily in early stages

### 🛡️ Stewart as Progress Guardian
- **Proactive Monitoring**: Real-time tracking of goal alignment
- **Smart Interventions**: Prevents over-focus and analysis drift
- **Strategic Suggestions**: Data-driven recommendations for pivots

### 💾 Progressive Data Protection
- **Automatic Checkpoints**: Never lose work again
- **Instant Recovery**: < 5 minutes to any previous state
- **Daily Integrity Checks**: Automated data health monitoring

## 📊 Workflow Comparison

| Feature | v4.0 (Stable) | v5.0 (Adaptive) |
|---------|---------------|-----------------|
| Initial Clarity Required | 80-90% | 20-30% |
| Workflow Structure | Fixed 5-phase | Flexible 3-stage |
| Duration | 7-10 days | Variable |
| Pivot Cost | High | Low (early stage) |
| Data Protection | Manual | Automatic |
| Progress Monitoring | Periodic | Real-time |

## 🚀 Quick Start - v5.0 Mode

### Enable Adaptive Features
```bash
# Set adaptive mode
export UMIS_MODE="adaptive"

# Set initial clarity level
export GOAL_CLARITY="low"  # Options: low, medium, high

# Enable Stewart monitoring
export STEWART_MONITORING="active"
```

### Start with Discovery Sprint
```bash
/UMIS *activate MOwner
*workflow adaptive-market-analysis
*discovery-sprint "vague market opportunity"
```

## 🤖 Enhanced Agent - Stewart v5.0

MCurator (Stewart) has been significantly enhanced:

### Traditional Role (v4.0)
- Knowledge management
- Methodology development
- Quality assurance

### Enhanced Role (v5.0)
- **Progress Guardian**: Monitors goal alignment
- **Intervention Triggers**:
  - Deep dive alerts (30%+ time on single detail)
  - Data mismatch warnings (3+ wrong assumptions)
  - Opportunity emergence (better paths found)
  - Analysis drift detection

### Stewart's Interventions
```
🎯 Stewart's Goal Alignment Check

Current: Analyzing piano brand market share (3 hours)
Goal: Map 100 hobby markets
Gap: Over-focusing on 1% of scope

💡 Suggestion: Consider moving to next hobby
```

## 📋 Adaptive Workflow Stages

### Stage 1: Exploration (1-2 days)
- Parallel surface scans
- Broad data availability check
- Multiple opportunity spotting
- Goal clarity: 20-30% → 40-60%

### Stage 2: Focused Analysis (2-3 days)
- Dynamic resource allocation
- Deep dives based on findings
- Continuous pivot evaluation
- Goal clarity: 40-60% → 70-85%

### Stage 3: Convergence (1-2 days)
- Final calculations
- Opportunity prioritization
- Decision documentation
- Goal clarity: 70-85% → 90-95%

## 💡 When to Use v5.0

### Perfect For:
- Exploring undefined opportunities
- Markets with high uncertainty
- When goals need to evolve
- Rapid opportunity validation

### Use v4.0 When:
- Goals are clear from start
- Regulatory compliance needed
- Following established processes
- Production environments

## 📁 New Files in v5.0

```
UMIS-bmad-v4.0/
├── docs/
│   └── UMIS-v5.0-Features.md          # Detailed feature guide
├── .bmad-core/
│   ├── agents/
│   │   └── MCurator-v5.md             # Enhanced Stewart
│   └── workflows/
│       └── adaptive-market-analysis-v5.yaml  # Adaptive workflow
└── RELEASE_NOTES_v5.0.md              # v5.0 release notes
```

## 🔄 Migration from v4.0

1. Existing v4.0 projects continue unchanged
2. New projects can enable adaptive mode
3. Stewart automatically creates first checkpoint
4. Gradual adoption supported

## 📈 Expected Benefits

Based on pilot projects (Korean hobby market analysis):
- **Time Saved**: ~40%
- **Quality Gain**: +30%
- **Successful Pivots**: 85%
- **Data Loss**: 0%

## ⚠️ Important Notes

- v5.0 is **experimental** - use v4.0 for production
- All v4.0 features remain available
- Feedback welcome via Issues

## 🆘 Support

- **v4.0 Issues**: Tag with `v4.0-stable`
- **v5.0 Issues**: Tag with `v5.0-adaptive`
- **Feature Requests**: Tag with `enhancement`

---

**UMIS v5.0** - *Embrace Uncertainty, Discover Opportunities*

**Version**: 5.0-adaptive  
**Status**: Experimental  
**Last Updated**: 2024-12-26  
**Powered by BMAD™ Core with Adaptive Intelligence**
