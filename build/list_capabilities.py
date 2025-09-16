#!/usr/bin/env python3
import json
from pathlib import Path

BASE = Path(__file__).resolve().parents[1]

def load_yaml_safe(p: Path):
    try:
        import yaml  # type: ignore
    except Exception:
        return None
    try:
        with p.open('r', encoding='utf-8') as f:
            return yaml.safe_load(f)  # type: ignore
    except Exception:
        return None

def main() -> int:
    ui_dir = BASE / 'ui'
    router = load_yaml_safe(ui_dir / 'router.yaml') or {}
    cmds = load_yaml_safe(ui_dir / 'commands.yaml') or {}
    pr = load_yaml_safe(ui_dir / 'prompts.yaml') or {}
    out = {
        'routes': [r.get('match') for r in (router.get('routes') or [])],
        'commands': [c.get('name') for c in (cmds.get('commands') or [])],
        'prompts': [p.get('id') for p in (pr.get('prompts') or [])],
    }
    print(json.dumps(out, ensure_ascii=False, indent=2))
    return 0

if __name__ == '__main__':
    raise SystemExit(main())

