# Universal Market Intelligence System v4.0 - BMAD Integration Guide

## 🎯 Overview

이 가이드는 Universal Market Intelligence System (UMIS) v4.0을 BMAD (에이전트 기반 소프트웨어 개발 프레임워크) 구조로 완벽하게 통합하는 방법을 설명합니다.

## 🏗️ BMAD 구조로의 변환

### 1. 디렉토리 구조 매핑

```
UMIS v4.0 구조                    →  BMAD 구조
─────────────────────────────────────────────────
agents (에이전트 정의)             →  .bmad-core/agents/
workflow (프로세스)                →  .bmad-core/workflows/
tasks (수행 작업)                  →  .bmad-core/tasks/
templates (문서 템플릿)            →  .bmad-core/templates/
quality_gates (품질 체크)          →  .bmad-core/checklists/
knowledge_storage (지식 저장)      →  .bmad-core/data/
collaboration_triggers (협업)      →  .bmad-core/utils/
```

### 2. 에이전트 변환

UMIS의 각 에이전트를 BMAD 형식으로 변환:

| UMIS Agent | BMAD Agent File | Role | Icon |
|------------|-----------------|------|------|
| Albert | MAnalyst.md | Market Structure Analyst | 🔍 |
| Steve | MExplorer.md | Opportunity Explorer | 💡 |
| Bill | MQuant.md | Market Quantifier | 💰 |
| Rachel | MValidator.md | Data Validator | ✅ |
| Stewart | MCurator.md | Knowledge Curator | 📚 |
| Owner | MOwner.md | Strategic Decision Maker | 🎯 |

### 3. BMAD 에이전트 구조

각 에이전트는 다음 구조를 따릅니다:

```yaml
agent:
  name: [Agent Name]
  id: [agent-id]
  title: [Role Title]
  icon: [Emoji]
  whenToUse: [사용 시나리오]
  
persona:
  role: [역할 설명]
  style: [대화 스타일]
  identity: [정체성]
  focus: [주요 초점]
  core_principles: [핵심 원칙]
  
commands:
  [command-name]:
    alias: ["*shortcut1", "*shortcut2"]
    description: [명령어 설명]
    output: [산출물]
    
dependencies:
  tasks: [수행 가능한 작업들]
  templates: [사용 가능한 템플릿]
  data: [참조 데이터]
  checklists: [품질 체크리스트]
```

## 📋 Workflow 변환

UMIS의 5단계 워크플로우를 BMAD workflow YAML로 변환:

### UMIS Phases → BMAD Workflow Sequence

1. **Phase 0: Project Initiation** → `MOwner` creates project-charter
2. **Phase 1: Market Structure** → `MAnalyst` + `MValidator` parallel work
3. **Phase 2: Opportunity Exploration** → `MExplorer` with validation loops
4. **Phase 3: Market Quantification** → `MQuant` with 4-method SAM
5. **Phase 4: Synthesis & Decision** → `MOwner` final decision
6. **Phase 5: Knowledge Preservation** → `MCurator` archives knowledge

### Workflow 종류

- `market-entry-analysis.yaml` - 시장 진입 분석
- `investment-decision.yaml` - 투자 의사결정
- `competitive-strategy.yaml` - 경쟁 전략 수립
- `market-monitoring.yaml` - 시장 모니터링

## 🛠️ 설치 및 설정

### 1. 기본 설치

```bash
# 1. BMAD 구조 생성
cd your-project-directory
chmod +x setup-umis-bmad.sh
./setup-umis-bmad.sh

# 2. 에이전트 파일 복사
cp -r bmad-integration/.bmad-core/* .bmad-core/

# 3. 프로젝트 디렉토리 생성
mkdir -p projects docs .ai
```

### 2. Core Configuration

`.bmad-core/core-config.yaml` 파일이 자동 생성되며 다음을 포함:
- 프로젝트 타입: market-intelligence
- 문서 위치 설정
- 품질 게이트 설정
- 지식 베이스 위치

### 3. 에이전트 활성화

Cursor나 다른 IDE에서:

```
/UMIS *activate MAnalyst
```

Albert가 활성화되고 자동으로 `*help` 명령을 실행합니다.

## 💼 사용 시나리오

### 시나리오 1: 새로운 시장 진입 분석

```bash
# 1. Market Owner 활성화
/UMIS *activate MOwner

# 2. 프로젝트 착수
*kickoff "Korean Piano Market Entry"

# 3. Workflow 실행
*workflow market-entry-analysis
```

### 시나리오 2: 특정 작업 수행

```bash
# Bill 활성화하여 SAM 계산
/UMIS *activate MQuant
*calculate-sam

# Rachel 활성화하여 데이터 검증
/UMIS *activate MValidator
*validate "market size data"
```

## 🔄 협업 프로토콜

BMAD에서 에이전트 간 협업은 자동화됩니다:

```yaml
collaboration_rules:
  mandatory:
    - "MQuant가 SAM 계산 시작 → MValidator 자동 참여"
    - "MExplorer가 기회 발굴 → MAnalyst에게 검증 요청"
    - "모든 데이터 사용 → MValidator 검증 필수"
```

## 📊 Quality Gates

각 Phase 완료 시 자동 품질 검증:

- **Gate 1**: 시장 구조 완전성 (MCurator 검증)
- **Gate 2**: 기회 타당성 (MOwner 검증)
- **Gate 3**: SAM 수렴도 (MValidator + MCurator)
- **Gate 4**: 의사결정 준비도 (MOwner)

## 🚀 Advanced Features

### 1. 병렬 작업 최적화
- Phase 1: MAnalyst + MValidator 동시 작업
- Phase 3: 4가지 SAM 방법 병렬 실행
- Phase 4-5: 의사결정 + 지식 보존 병렬

### 2. 자동 문서 생성
- 프로젝트 차터
- 시장 분석 보고서
- SAM 계산서
- 의사결정 문서

### 3. 지식 관리
- 프로젝트별 폴더 자동 생성
- 재사용 가능한 인사이트 추출
- 방법론 지속적 개선

## 📝 모범 사례

1. **항상 프로젝트 차터로 시작**
   - 명확한 목표 설정
   - 성공 기준 정의
   - 범위 명시

2. **데이터 정의 우선**
   - 모든 데이터는 MValidator 검증
   - 정의 불일치 즉시 해결
   - 출처 명시

3. **반복적 검증**
   - MExplorer의 기회는 MAnalyst 검증
   - MQuant의 SAM은 4방법 수렴
   - 모든 결정은 데이터 기반

4. **지식 보존**
   - 프로젝트 완료 즉시 아카이빙
   - 재사용 가능한 요소 추출
   - 실패 사례도 문서화

## 🆘 문제 해결

### 에이전트가 활성화되지 않을 때
```bash
# Core config 확인
cat .bmad-core/core-config.yaml

# 에이전트 파일 확인
ls -la .bmad-core/agents/
```

### 워크플로우 오류
```bash
# Workflow 파일 검증
cat .bmad-core/workflows/market-entry-analysis.yaml
```

### 데이터 동기화 문제
```bash
# 프로젝트 폴더 구조 확인
tree projects/current-project/
```

## 🎯 결론

UMIS v4.0의 BMAD 통합은 다음을 제공합니다:
- ✅ 체계적인 시장 분석 프로세스
- ✅ 자동화된 에이전트 협업
- ✅ 품질 보증 시스템
- ✅ 지식 관리 및 재사용
- ✅ 확장 가능한 프레임워크

이제 BMAD의 강력한 에이전트 시스템을 활용하여 모든 시장 분석을 체계적이고 효율적으로 수행할 수 있습니다!
