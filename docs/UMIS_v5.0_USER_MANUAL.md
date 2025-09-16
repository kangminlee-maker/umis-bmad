# UMIS v5.0 사용자 매뉴얼 (Adaptive Intelligence Edition)

본 문서는 UMIS v5.0을 사용하여 프로젝트를 수행하는 방법, 명령 체계, 처리 흐름, 산출물, 예시 케이스를 안내합니다. v4 Classic 모드도 호환되며 `UMIS_MODE`로 전환할 수 있습니다.

## 1) 빠른 시작(Quick Start)
- 요구사항: macOS/Linux, Python 3.7+, Git, Shell
- 설치 경로 변수: `UMIS_HOME` (이 저장소의 루트 디렉터리를 가리키도록 설정)

1. 모드 선택(기본: Adaptive v5)
```bash
export UMIS_MODE=adaptive
# Classic v4로 사용하려면
# export UMIS_MODE=classic
```
2. 실행 확인
```bash
cd "$UMIS_HOME"
bash build/run_example.sh  # 인자 생략 시 adaptive
```
3. 컴파일/검증(선택)
```bash
cd "$UMIS_HOME"
python build/compile.py --version 5.0
python build/validate.py
```

## 2) 명령 체계(How to command UMIS)
UMIS는 환경 변수(모드), 간단 CLI, 빌드/검증 스크립트, 데이터 무결성 스크립트로 제어합니다.

- 모드 전환(필수)
  - `UMIS_MODE=adaptive` 또는 `UMIS_MODE=classic`
- 실행 확인
  - `"$UMIS_HOME"/bin/umis` → 현재 모드 출력
- 워크플로우 참조
  - Adaptive: `workflows/adaptive/adaptive_workflow.yaml`
  - Classic: `workflows/classic/workflow_classic_v4.yaml`
- 컴파일/검증(선택)
  - `cd "$UMIS_HOME" && python build/compile.py --version 5.0`
  - `cd "$UMIS_HOME" && python build/validate.py`

## 3) AI 번들 사용(LLM 입력 최적화)
```bash
# 최소 번들 생성
python "$UMIS_HOME"/build/make_bundle.py --mode both
# 프로파일 예시(빠른 SAM)
python "$UMIS_HOME"/build/make_bundle.py --mode adaptive --profile quick_sam
# 산출물: "$UMIS_HOME"/build/dist/ai_bundle.*.json
```
- LLM에는 `ai_bundle.adaptive.json` 또는 목적에 따라 `ai_bundle.adaptive.quick_sam.json` 사용을 권장합니다.

## 4) 처리 흐름(What process UMIS follows)
- Stage 0 Initiation: 목표 명확도 평가(20%+), Stewart Guardian Mode 활성화
- Stage 1 Discovery Sprint: 1~2일 병렬 탐색(Albert/Steve/Rachel/Bill), 수렴 세션으로 Top 3~5 방향 도출
- Stage 2 Focused Exploration: 선택 경로에 따라 심화 분석/병렬 비교/점진적 좁혀가기
- Stage 3 Convergence & Synthesis: 정량·정성 통합, 다기준 평가, Go/No-Go/Conditional 결정
- Stage 4 Knowledge Preservation: 교훈 추출, 방법론 업데이트, 체크포인트 아카이빙
- Stewart(Progress Guardian): 시간 배분/목표 정렬/발견 가치/데이터 건강도 모니터링 및 개입
- Data Integrity: 2시간마다 자동 체크포인트, 5분 내 복구 지향

## 5) 기대 산출물(What results come out)
- 보고서: Executive Summary(2p), Full Report(필요 시), Scenario/Validation 문서
- 정량 결과: SAM(±30% 수렴), 성장률, 민감도, 신뢰구간
- 구조/기회 산출: 시장 구조 맵, 기회 포트폴리오, 시장 재정의안
- 운영 산출: 체크포인트/무결성 리포트, Stewart 알림 카드
- 템플릿 참조: `output/templates/`

## 6) 예시 케이스(End-to-end Example)
목표: “국내 피아노 판매 시장 SAM과 진입 타당성 검토”

1. 모드/초기화
```bash
export UMIS_MODE=adaptive
cd "$UMIS_HOME"
bash build/run_example.sh
```
2. Discovery Sprint(1~2일)
- Albert: 시장 구조 스캔(제조–유통–소매), 거래 메커니즘 파악
- Steve: 니치/비효율/미충족 니즈 탐색(중고·렌탈·교육 연계)
- Rachel: 데이터 가용성/정의 검증(정부·협회·공시 자료)
- Bill: 대략 규모 감각(세그먼트×가격×빈도)
- Stewart: 병렬 조율, 수렴 세션 개최

3. Focused Exploration(2~4일)
- Bill: 4방법 SAM Top-down/Bottom-up/Proxy/Competitor 수렴 ±30%
- Steve: 우선순위 기회 검증(채택 장벽·이해관계·규제)
- Albert: 구조적 타당성 재확인, 대안 경로 맵핑
- Rachel: 정의·출처·품질 재검증

4. Synthesis & Decision(1~2일)
- Go/No-Go/Conditional + 투자 규모/단계, 실행 로드맵
- Executive Summary 2p + 첨부(데이터 정의/민감도/시나리오)

5. Data Integrity & Handoff
```bash
# 중요 시점에 체크포인트 생성
cd "$UMIS_HOME"
bash data_integrity/scripts/create_checkpoint.sh E2E demo
# 무결성 확인
cd "$UMIS_HOME" && python data_integrity/scripts/verify_integrity.py
```

---
참고: `UMIS_HOME`은 이 저장소 루트 경로로, 프로젝트마다 자유롭게 설정 가능합니다.
