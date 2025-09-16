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

## Cursor Chat quick start
```bash
# 권장: 활성화 스크립트 (번들 보장 + 다음 단계 안내)
bash ./activate.sh

# 또는 번들 직접 생성 (대화형 전용 프로파일)
python "$UMIS_HOME"/build/make_bundle.py --mode adaptive --profile cursor_chat
# 산출물: $UMIS_HOME/build/dist/ai_bundle.adaptive.cursor_chat.json
```
- Chat에서:
  - 파일 첨부: `build/dist/ai_bundle.adaptive.cursor_chat.json`
  - 활성화: `/activate` 또는 `/활성화`
  - 전역 도움말: `/help` `/도움말` `/capabilities` `/명령어`
- 주요 전역 명령/기능:
  - 문제→계획 라우팅, 탐색/검색(키워드 확장·근거탐색), 빠른 SAM, 진행 모니터링
  - 멀티에이전트 협업/핸드오프 리포팅(`collab_report`, `handoff_notice`), 결과 설명 포함 보고(`result_with_explainer`)

## Notes
- Stable interfaces. Use `UMIS_MODE` to switch workflows.

## Contents
- package-info.yaml
- VERSION
- docs/, bin/, build/, agents/, workflows/, monitoring/, data_integrity/, output/, quality/

## Mode
- Default: UMIS_MODE=adaptive
- Classic: UMIS_MODE=classic

## Data Sources & Rules
- DART Revenue Selection Rules: `docs/DART_REVENUE_RULES.md`
