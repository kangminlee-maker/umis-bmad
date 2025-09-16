#!/usr/bin/env python3
import os, sys, json
from pathlib import Path

BASE = Path(__file__).resolve().parents[1]

CHECKS = [
    # Agents
    BASE / 'agents' / 'MAnalyst_Albert.yaml',
    BASE / 'agents' / 'MExplorer_Steve.yaml',
    BASE / 'agents' / 'MQuant_Bill.yaml',
    BASE / 'agents' / 'MValidator_Rachel.yaml',
    BASE / 'agents' / 'MCurator_Stewart.yaml',
    BASE / 'agents' / 'MOwner.yaml',
    # Workflows
    BASE / 'workflows' / 'adaptive' / 'adaptive_workflow.yaml',
    BASE / 'workflows' / 'classic' / 'workflow_classic_v4.yaml',
    BASE / 'workflows' / 'workflow_modes.yaml',
    BASE / 'core' / 'mode_activation.yaml',
    # Monitoring
    BASE / 'monitoring' / 'proactive_monitoring.yaml',
    BASE / 'monitoring' / 'intervention_triggers.yaml',
    # Data Integrity
    BASE / 'data_integrity' / 'protection_strategy.yaml',
    BASE / 'data_integrity' / 'checkpoint_system.yaml',
    BASE / 'data_integrity' / 'scripts' / 'create_checkpoint.sh',
    BASE / 'data_integrity' / 'scripts' / 'restore_checkpoint.sh',
    BASE / 'data_integrity' / 'scripts' / 'setup_auto_backup.sh',
    BASE / 'data_integrity' / 'scripts' / 'verify_integrity.py',
    # Output
    BASE / 'output' / 'output_formats.yaml',
    BASE / 'output' / 'templates' / 'alerts' / 'intervention_alert.yaml',
    BASE / 'output' / 'templates' / 'reports' / 'executive_summary.yaml',
    # Quality
    BASE / 'quality' / 'quality_gates.yaml',
    BASE / 'quality' / 'classic_quality_gates.yaml',
    BASE / 'quality' / 'success_metrics.yaml',
    # Migration
    BASE / 'migration' / 'v4_to_v5.yaml',
]


def main() -> int:
    missing = []
    for p in CHECKS:
        if not Path(p).exists():
            missing.append(str(p))
    result = {
        'base': str(BASE),
        'missing': missing,
        'ok': len(missing) == 0,
        'version': '5.0.1'
    }
    print(json.dumps(result, ensure_ascii=False, indent=2))
    return 0 if result['ok'] else 1

if __name__ == '__main__':
    sys.exit(main())
