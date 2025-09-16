#!/usr/bin/env python3
import os, sys
from pathlib import Path

try:
    import yaml  # type: ignore
    HAS_YAML = True
except Exception:
    HAS_YAML = False

BASE = Path(__file__).resolve().parents[1]

TARGETS = [
    # agents
    BASE / 'agents' / 'mapping.yaml',
    BASE / 'agents' / 'triggers.yaml',
    # monitoring
    BASE / 'monitoring' / 'proactive_monitoring.yaml',
    BASE / 'monitoring' / 'intervention_triggers.yaml',
    # output
    BASE / 'output' / 'output_formats.yaml',
    BASE / 'output' / 'templates' / 'alerts' / 'intervention_alert.yaml',
    BASE / 'output' / 'templates' / 'reports' / 'executive_summary.yaml',
    # quality
    BASE / 'quality' / 'quality_gates.yaml',
    BASE / 'quality' / 'classic_quality_gates.yaml',
    BASE / 'quality' / 'success_metrics.yaml',
    # workflows
    BASE / 'workflows' / 'adaptive' / 'adaptive_workflow.yaml',
    BASE / 'workflows' / 'classic' / 'workflow_classic_v4.yaml',
    BASE / 'workflows' / 'workflow_modes.yaml',
    # data integrity
    BASE / 'data_integrity' / 'refs.yaml',
]


def verify_file(base: Path, ref_path: str, errors: list[str]):
    p = (base / ref_path).resolve()
    if not p.exists():
        errors.append(f"Missing ref from {base.name}: {ref_path} -> {p}")


def check_yaml_refs(path: Path) -> list[str]:
    errors: list[str] = []
    if HAS_YAML:
        try:
            with open(path, 'r', encoding='utf-8') as f:
                data = (yaml.safe_load(f) or {})  # type: ignore
        except Exception as e:
            return [f"YAML parse error in {path}: {e}"]
        if isinstance(data, dict):
            for k, v in data.items():
                if k == 'file' and isinstance(v, str):
                    verify_file(path.parent, v, errors)
                if k in ('reference', 'references') and isinstance(v, dict):
                    for _, ref in v.items():
                        if isinstance(ref, str):
                            verify_file(path.parent, ref, errors)
        return errors
    # Fallback: naive line scan
    try:
        with open(path, 'r', encoding='utf-8') as f:
            for line in f:
                line = line.strip()
                if line.startswith('file:'):
                    ref = line.split(':', 1)[1].strip()
                    verify_file(path.parent, ref, errors)
    except Exception as e:
        return [f"Read error in {path}: {e}"]
    return errors


def main() -> int:
    all_errors: list[str] = []
    for t in TARGETS:
        if not t.exists():
            all_errors.append(f"Missing target file: {t}")
            continue
        if t.suffix in ('.yaml', '.yml'):
            all_errors.extend(check_yaml_refs(t))
    if all_errors:
        print("Validation FAILED:\n" + "\n".join(all_errors))
        return 1
    print("Validation OK")
    return 0

if __name__ == '__main__':
    sys.exit(main())
