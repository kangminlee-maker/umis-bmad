# Verification Checklist

## Cross-References
- [ ] agents/mapping.yaml 경로 유효
- [ ] agents/triggers.yaml 참조 유효
- [ ] workflows/workflow_modes.yaml 참조 유효
- [ ] monitoring/proactive_monitoring.yaml 참조 유효
- [ ] data_integrity/refs.yaml → protection/checkpoint
- [ ] output/templates 경로 유효

## Anchors / Sections
- [ ] adaptive_workflow anchor
- [ ] workflow_classic_v4 anchor
- [ ] proactive_monitoring anchor
- [ ] classic_quality_gates anchor

## CLI
- [ ] UMIS_HOME 환경변수 설정 (`export UMIS_HOME="$(pwd)"`)
- [ ] bin/umis 실행 및 모드 출력
- [ ] build/compile.py 로컬 존재 검사
- [ ] build/run_example.sh 모드 스위칭 동작
- [ ] CI validate 실행 (GitHub Actions)
