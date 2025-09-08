# UMIS-BMAD Integration Guide

## Quick Start

### 1. Installation
```bash
./install-umis.sh
```

### 2. First Project
```bash
/UMIS *activate MOwner
*kickoff "Your Market Name"
*workflow market-entry-analysis
```

## Agent Commands Reference

### MOwner Commands
- `*kickoff` - Start new project
- `*review` - Review progress
- `*decide` - Make decision
- `*strategy` - Define strategy
- `*risk` - Assess risks
- `*workflow` - Run workflow

### MAnalyst Commands
- `*structure` - Analyze structure
- `*transactions` - Analyze transactions
- `*players` - Map participants
- `*observe` - Record observations
- `*segments` - Segment market

### MExplorer Commands
- `*interpret` - Interpret patterns
- `*opportunities` - Find opportunities
- `*validate` - Validate opportunities
- `*redefine` - Redefine market
- `*portfolio` - Create portfolio

### MQuant Commands
- `*sam` - Calculate SAM
- `*growth` - Project growth
- `*converge` - Check convergence
- `*economics` - Unit economics
- `*sizing` - Quick sizing

### MValidator Commands
- `*validate` - Validate data
- `*define` - Check definitions
- `*source` - Verify sources
- `*reliability` - Assess reliability
- `*expand` - Expand keywords

### MCurator Commands
- `*methodology` - Select method
- `*quality` - Quality check
- `*archive` - Archive knowledge
- `*template` - Get template
- `*lessons` - Extract lessons

## Workflow Patterns

### Full Analysis (7-10 days)
Best for: Major market entry decisions
```
market-entry-analysis
```

### Quick Assessment (2-3 days)
Best for: Opportunity validation
```
investment-decision
```

### Competitive Intel (3-5 days)
Best for: Competitive positioning
```
competitive-strategy
```

## Best Practices

1. **Always start with MOwner**
   - Creates proper project structure
   - Sets clear objectives

2. **Let agents collaborate**
   - They automatically engage when needed
   - Don't micromanage the process

3. **Trust the quality gates**
   - They prevent moving forward with bad data
   - Address all issues before proceeding

4. **Document everything**
   - MCurator captures knowledge automatically
   - Add your own insights

5. **Use parallel execution**
   - Many phases can run simultaneously
   - Reduces total analysis time

## Troubleshooting

### Agent not responding
```bash
/UMIS *activate [AgentID]
*help
```

### Workflow stuck
- Check quality gate status
- Review validation reports
- Ensure data completeness

### Need help?
- Each agent has `*help` command
- Check logs in `.ai/` directory
- Review documentation in `docs/`
