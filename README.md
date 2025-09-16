# UMIS-BMAD (release)

Standalone build aligned with UMIS v5.0 (Adaptive Intelligence Edition).

## Quick setup
```bash
# 프로젝트 루트 설정 (쉘 세션별 1회)
export UMIS_HOME="$(pwd)"
export UMIS_MODE=adaptive   # 또는 classic

# 예시 실행
bash "$UMIS_HOME"/build/run_example.sh

# 빠른 활성화(권장)
bash ./activate.sh
```

## AI bundle (recommended for LLM input)
```bash
# 최소 번들 생성 (양쪽 모드)
python "$UMIS_HOME"/build/make_bundle.py --mode both
# 프로파일 기반(예: 빠른 SAM)
python "$UMIS_HOME"/build/make_bundle.py --mode adaptive --profile quick_sam
# 산출물 위치: $UMIS_HOME/build/dist/ai_bundle.*.json
```
LLM에 입력 시 `ai_bundle.adaptive.json` 또는 `ai_bundle.adaptive.quick_sam.json`을 우선 사용하십시오.

## Notes
- Stable interfaces. Use `UMIS_MODE` to switch workflows.

## Contents
- package-info.yaml
- VERSION
- docs/, bin/, build/, agents/, workflows/, monitoring/, data_integrity/, output/, quality/

## Mode
- Default: UMIS_MODE=adaptive
- Classic: UMIS_MODE=classic
