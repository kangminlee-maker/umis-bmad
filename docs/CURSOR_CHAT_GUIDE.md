# Cursor 대화형 사용 가이드

## 빠른 시작
```bash
export UMIS_HOME="/Users/kangmin/Desktop/UMIS-Development/UMIS-bmad"
export UMIS_MODE=adaptive
python3 "$UMIS_HOME/build/make_bundle.py" --mode adaptive --profile cursor_chat
```
- 산출물: `$UMIS_HOME/build/dist/ai_bundle.adaptive.cursor_chat.json`
- 이 JSON을 Cursor Chat에 첨부(또는 복사)해 컨텍스트로 사용하세요.

### 채팅에서 번들 생성 요청하는 방법
- 지시문 예시: "번들 생성해줘 (모드: adaptive, 프로파일: cursor_chat)"
- 내부적으로 `ui/commands.yaml`의 `build_bundle` 명령을 호출해 `build/run_bundle.sh`를 실행합니다.
- 스크립트 직접 실행도 가능:
```bash
"$UMIS_HOME/build/run_bundle.sh" adaptive cursor_chat
```

## 사용자 흐름
1) Chat: 문제를 자연어로 설명합니다.
2) Router: `ui/router.yaml` 규칙이 적합한 에이전트를 선택합니다.
3) Commands: `ui/commands.yaml`가 문제를 실행 가능한 태스크로 구조화합니다.
4) Agents: 선택된 에이전트가 해결안을 제시하고 필요시 협업 요청을 트리거합니다.

## 활성화(Activate) 루틴
- 첫 문구 예시: "UMIS 활성화" 또는 "activate umis"
- 시스템 응답: `ui/prompts.yaml`의 `activation_ack`로 준비 완료 배너와 다음 단계 안내

## 유용한 프롬프트
- kickoff: 문제를 한 문장으로 정리
- need_clarification: 부족한 맥락 신속 보완
- handoff_summary: 다음 액션 합의
- result_with_explainer: 결과 + (에이전트/이유/방법/다음 단계)까지 표준 보고
