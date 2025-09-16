# Dependency Map (resolved)

## Summary
- 목적: 초기 의존성 인벤토리(완료)
- 상태: Batch 2~9 수행으로 참조 대부분 로컬화 완료. 아래 항목은 "과거 참조" 기록입니다.

## Agents (resolved → local)
- agents/mapping.yaml → ./M*.yaml 로 전환 완료
- agents/triggers.yaml → ../collaboration/*.yaml 로 전환 완료

## Workflows (resolved → local)
- adaptive_ref.yaml → ./adaptive/adaptive_workflow.yaml
- classic_ref.yaml → ./classic/workflow_classic_v4.yaml
- modes.yaml → ./workflow_modes.yaml

## Monitoring (resolved → local)
- proactive_ref.yaml → ./proactive_monitoring.yaml
- triggers_ref.yaml → ./intervention_triggers.yaml
- alert template → ../output/templates/alerts/intervention_alert.yaml

## Data Integrity (resolved → local)
- refs.yaml → ./protection_strategy.yaml, ./checkpoint_system.yaml
- scripts/* → 로컬 스크립트로 교체 완료

## Output (resolved → local)
- adaptive_output_ref.yaml → ./output_formats.yaml(adaptive_output_format)
- templates_ref.yaml → ./templates/alerts/*, ./templates/reports/*

## Quality (resolved → local)
- quality_gates_ref.yaml → ./quality_gates.yaml, ./classic_quality_gates.yaml
- success_metrics_ref.yaml → ./success_metrics.yaml

## Migration (resolved → local)
- v4_to_v5_ref.yaml → ./v4_to_v5.yaml
- mode_activation.md → ../workflows/workflow_modes.yaml, ../core/mode_activation.yaml

## Build/CLI (resolved → local)
- build/compile.py → 로컬 경량 컴파일러

## Docs/Manual (release)
- `docs/UMIS_v5.0_USER_MANUAL.md` 내 안내 문구는 UMIS_HOME 기준으로 갱신됨

## 영향도 요약
- 남은 조치: 없음 (문서 기록만 유지)
