#!/usr/bin/env python3
import os
import sys
import json
import argparse
from pathlib import Path
from typing import Any, Dict, List, Optional, Tuple

# Optional YAML import
try:
    import yaml  # type: ignore
    HAS_YAML = True
except Exception:
    HAS_YAML = False

BASE = Path(__file__).resolve().parents[1]
OUT_DIR = BASE / 'build' / 'dist'

DEFAULT_ALLOWED_KEYS = {
    'name', 'anchor', 'description', 'owner', 'role', 'outputs',
    'core_competencies', 'summary', 'stages', 'gates', 'format', 'overview',
}

DEFAULT_MAX_LIST_LEN = 10


def safe_load_yaml(path: Path) -> Optional[Dict[str, Any]]:
    if not HAS_YAML:
        return None
    try:
        with path.open('r', encoding='utf-8') as f:
            data = yaml.safe_load(f)  # type: ignore
        if isinstance(data, dict):
            return data
        return None
    except Exception:
        return None


def extract_min_from_dict(data: Dict[str, Any], allowed_keys: set, max_list_len: int) -> Dict[str, Any]:
    result: Dict[str, Any] = {}
    # Prefer top-level filtered keys
    for k, v in data.items():
        if k in allowed_keys:
            if isinstance(v, list) and len(v) > max_list_len:
                result[k] = v[:max_list_len]
            else:
                result[k] = v
    # If the document has a single major section (e.g., adaptive_workflow, proactive_monitoring), dive one level
    if not result:
        for k, v in data.items():
            if isinstance(v, dict):
                sub = {}
                for sk, sv in v.items():
                    if sk in allowed_keys:
                        if isinstance(sv, list) and len(sv) > max_list_len:
                            sub[sk] = sv[:max_list_len]
                        else:
                            sub[sk] = sv
                if sub:
                    result[k] = sub
                    break
    return result


def extract_min_from_text(path: Path) -> Dict[str, Any]:
    result: Dict[str, Any] = {}
    try:
        lines = path.read_text(encoding='utf-8', errors='ignore').splitlines()
    except Exception:
        return result
    wanted = ('name:', 'anchor:', 'description:', 'owner:', 'role:')
    captured: List[str] = []
    for line in lines:
        s = line.strip()
        # Ignore comments
        if not s or s.startswith('#'):
            continue
        if s.startswith(wanted):
            captured.append(s)
        if len(captured) >= 12:
            break
    if captured:
        result['summary_lines'] = captured
    return result


def extract_min_yaml(path: Path, allowed_keys: set, max_list_len: int) -> Dict[str, Any]:
    data = safe_load_yaml(path)
    if data is not None:
        return extract_min_from_dict(data, allowed_keys, max_list_len)
    return extract_min_from_text(path)


def collect_files(patterns: List[str]) -> List[Path]:
    files: List[Path] = []
    for pat in patterns:
        files.extend(sorted(BASE.glob(pat)))
    return [p for p in files if p.is_file()]


def load_profile(profile: Optional[str]) -> Tuple[Optional[Dict[str, Any]], set, int]:
    allowed_keys = set(DEFAULT_ALLOWED_KEYS)
    max_list_len = DEFAULT_MAX_LIST_LEN
    if not profile:
        return None, allowed_keys, max_list_len
    p = BASE / 'profiles' / f'{profile}.yaml'
    cfg: Optional[Dict[str, Any]] = None
    # Try YAML parse
    cfg = safe_load_yaml(p) if p.exists() else None
    if cfg is None and p.exists():
        # minimal text parse: collect include and allowed_keys
        text = p.read_text(encoding='utf-8', errors='ignore').splitlines()
        inc: List[str] = []
        ak: List[str] = []
        mode = None
        for line in text:
            s = line.strip()
            if not s or s.startswith('#'):
                continue
            if s.startswith('include:'):
                mode = 'include'
                continue
            if s.startswith('allowed_keys:'):
                mode = 'allowed'
                continue
            if s.startswith('max_list_len:'):
                try:
                    max_list_len = int(s.split(':', 1)[1].strip())
                except Exception:
                    pass
                continue
            if s.startswith('- '):
                item = s[2:].strip()
                if mode == 'include':
                    inc.append(item)
                elif mode == 'allowed':
                    ak.append(item)
        cfg = {'include': inc, 'allowed_keys': ak, 'max_list_len': max_list_len}
    if cfg:
        for k in cfg.get('allowed_keys', []) or []:
            allowed_keys.add(k)
        if isinstance(cfg.get('max_list_len'), int):
            max_list_len = int(cfg['max_list_len'])
    return cfg, allowed_keys, max_list_len


def build_bundle(include_adaptive: bool, include_classic: bool, profile_cfg: Optional[Dict[str, Any]], allowed_keys: set, max_list_len: int) -> Dict[str, Any]:
    include = set(profile_cfg.get('include', [])) if profile_cfg else set()
    bundle: Dict[str, Any] = {
        'version': (BASE / 'VERSION').read_text(encoding='utf-8').strip(),
        'mode_adaptive': include_adaptive,
        'mode_classic': include_classic,
        'agents': {},
        'workflows': {},
        'monitoring': {},
        'quality': {},
        'output': {},
        'core': {},
    }

    def want(section: str) -> bool:
        # if profile has include list, filter by it; otherwise allow
        return (not include) or (section in include)

    # Agents
    if want('agents'):
        for p in collect_files(['agents/*.yaml']):
            bundle['agents'][p.name] = extract_min_yaml(p, allowed_keys, max_list_len)

    # Workflows
    if include_adaptive and want('workflows.adaptive'):
        p = BASE / 'workflows' / 'adaptive' / 'adaptive_workflow.yaml'
        if p.exists():
            bundle['workflows']['adaptive'] = extract_min_yaml(p, allowed_keys, max_list_len)
    if include_classic and want('workflows.classic'):
        p = BASE / 'workflows' / 'classic' / 'workflow_classic_v4.yaml'
        if p.exists():
            bundle['workflows']['classic'] = extract_min_yaml(p, allowed_keys, max_list_len)
    if want('workflows.modes'):
        p = BASE / 'workflows' / 'workflow_modes.yaml'
        if p.exists():
            bundle['workflows']['modes'] = extract_min_yaml(p, allowed_keys, max_list_len)

    # Monitoring
    if want('monitoring'):
        for p in collect_files(['monitoring/*.yaml']):
            bundle['monitoring'][p.name] = extract_min_yaml(p, allowed_keys, max_list_len)

    # Quality
    if want('quality'):
        for p in collect_files(['quality/*.yaml']):
            bundle['quality'][p.name] = extract_min_yaml(p, allowed_keys, max_list_len)

    # Output (only formats; templates are verbose)
    if want('output.formats'):
        p = BASE / 'output' / 'output_formats.yaml'
        if p.exists():
            bundle['output']['output_formats.yaml'] = extract_min_yaml(p, allowed_keys, max_list_len)

    # Core
    if want('core'):
        for p in collect_files(['core/*.yaml']):
            bundle['core'][p.name] = extract_min_yaml(p, allowed_keys, max_list_len)

    return bundle


def write_json(path: Path, obj: Dict[str, Any]) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(json.dumps(obj, ensure_ascii=False, indent=2), encoding='utf-8')


def main() -> int:
    ap = argparse.ArgumentParser(description='Build minimal AI bundles')
    ap.add_argument('--mode', choices=['adaptive', 'classic', 'both'], default='both')
    ap.add_argument('--profile', default=None, help='Optional profile name under profiles/ (e.g., quick_sam)')
    ap.add_argument('--out', default=str(OUT_DIR))
    args = ap.parse_args()

    outdir = Path(args.out)
    outdir.mkdir(parents=True, exist_ok=True)

    profile_cfg, allowed_keys, max_list_len = load_profile(args.profile)

    if args.mode in ('adaptive', 'both'):
        b = build_bundle(include_adaptive=True, include_classic=False, profile_cfg=profile_cfg, allowed_keys=allowed_keys, max_list_len=max_list_len)
        write_json(outdir / ('ai_bundle.adaptive' + (f'.{args.profile}' if args.profile else '') + '.json'), b)
    if args.mode in ('classic', 'both'):
        c = build_bundle(include_adaptive=False, include_classic=True, profile_cfg=profile_cfg, allowed_keys=allowed_keys, max_list_len=max_list_len)
        write_json(outdir / ('ai_bundle.classic' + (f'.{args.profile}' if args.profile else '') + '.json'), c)
    if args.mode == 'both':
        m = build_bundle(include_adaptive=True, include_classic=True, profile_cfg=profile_cfg, allowed_keys=allowed_keys, max_list_len=max_list_len)
        write_json(outdir / ('ai_bundle.min' + (f'.{args.profile}' if args.profile else '') + '.json'), m)

    print(json.dumps({
        'out_dir': str(outdir),
        'generated': sorted([p.name for p in outdir.glob('ai_bundle*.json')])
    }, ensure_ascii=False))
    return 0


if __name__ == '__main__':
    sys.exit(main())
