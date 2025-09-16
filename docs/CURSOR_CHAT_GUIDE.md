# Cursor 대화형 사용 가이드

## 빠른 시작
```bash
export UMIS_HOME="/Users/kangmin/Desktop/UMIS-Development/UMIS-bmad"
export UMIS_MODE=adaptive
python3 "$UMIS_HOME/build/make_bundle.py" --mode adaptive --profile cursor_chat
```
- 산출물: `$UMIS_HOME/build/dist/ai_bundle.adaptive.cursor_chat.json`
- 이 JSON을 Cursor Chat에 첨부(또는 복사)해 컨텍스트로 사용하세요.

## 사용자 흐름
1) Chat: 문제를 자연어로 설명합니다.
2) Router: `ui/router.yaml` 규칙이 적합한 에이전트를 선택합니다.
3) Commands: `ui/commands.yaml`가 문제를 실행 가능한 태스크로 구조화합니다.
4) Agents: 선택된 에이전트가 해결안을 제시하고 필요시 협업 요청을 트리거합니다.

## 유용한 프롬프트
- kickoff: 문제를 한 문장으로 정리
- need_clarification: 부족한 맥락 신속 보완
- handoff_summary: 다음 액션 합의
