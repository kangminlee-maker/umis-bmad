# BMAD를 위한 범용 시장 정보 시스템 (UMIS)

<p align="center">
  <img src="https://img.shields.io/badge/version-5.0-purple.svg" alt="Version">
  <img src="https://img.shields.io/badge/BMAD-Extension-green.svg" alt="BMAD Extension">
  <img src="https://img.shields.io/badge/agents-6-orange.svg" alt="6 Agents">
  <img src="https://img.shields.io/badge/mode-Adaptive-red.svg" alt="Adaptive Mode">
  <img src="https://img.shields.io/badge/license-MIT-lightgrey.svg" alt="License">
</p>

## 🚀 버전 안내

이것은 **v5.0 적응형 지능** 브랜치입니다. 안정화된 v4.0은 `main` 브랜치를 확인하세요.

```bash
# 안정화 v4.0 사용
git checkout main

# 실험적 v5.0 사용
git checkout v5.0-adaptive
```

## 🎯 v5.0의 새로운 기능

### 🧠 적응형 지능
- **불명확하게 시작**: 단 20-30% 목표 명확도로 시작 (v4.0은 80-90%)
- **Discovery Sprint**: 1-2일 빠른 탐색 단계
- **학습 → 조정 → 진행**: 발견사항에 기반한 지속적 적응
- **저비용 피벗**: 초기 단계에서 쉬운 방향 전환

### 🛡️ Progress Guardian으로서의 Stewart
- **능동적 모니터링**: 목표 정렬도 실시간 추적
- **스마트 개입**: 과도한 집중과 분석 이탈 방지
- **전략적 제안**: 데이터 기반 피벗 권고

### 💾 단계별 데이터 보호
- **자동 체크포인트**: 작업 손실 완전 방지
- **즉시 복구**: 5분 내 이전 상태로 복구
- **일일 무결성 검사**: 자동화된 데이터 건강도 모니터링

## 📊 워크플로우 비교

| 기능 | v4.0 (안정화) | v5.0 (적응형) |
|------|---------------|---------------|
| 필요한 초기 명확도 | 80-90% | 20-30% |
| 워크플로우 구조 | 고정된 5단계 | 유연한 3단계 |
| 소요 시간 | 7-10일 | 가변적 |
| 피벗 비용 | 높음 | 낮음 (초기 단계) |
| 데이터 보호 | 수동 | 자동 |
| 진행 모니터링 | 주기적 | 실시간 |

## 🚀 빠른 시작 - v5.0 모드

### 적응형 기능 활성화
```bash
# 적응형 모드 설정
export UMIS_MODE="adaptive"

# 초기 명확도 수준 설정
export GOAL_CLARITY="low"  # 옵션: low, medium, high

# Stewart 모니터링 활성화
export STEWART_MONITORING="active"
```

### Discovery Sprint로 시작
```bash
/UMIS *activate MOwner
*workflow adaptive-market-analysis
*discovery-sprint "막연한 시장 기회"
```

## 🤖 향상된 에이전트 - Stewart v5.0

MCurator (Stewart)가 크게 향상되었습니다:

### 전통적 역할 (v4.0)
- 지식 관리
- 방법론 개발
- 품질 보증

### 향상된 역할 (v5.0)
- **Progress Guardian**: 목표 정렬도 모니터링
- **개입 트리거**:
  - Deep dive 경고 (단일 세부사항에 30% 이상 시간 소요)
  - 데이터 불일치 경고 (3개 이상 잘못된 가정)
  - 기회 출현 (더 나은 경로 발견)
  - 분석 이탈 감지

### Stewart의 개입 예시
```
🎯 Stewart의 목표 정렬도 점검

현재: 피아노 브랜드 시장점유율 분석 중 (3시간)
목표: 100개 취미 시장 매핑
격차: 전체 범위의 1%에 과도하게 집중

💡 제안: 다음 취미로 이동 고려
```

## 📋 적응형 워크플로우 단계

### 1단계: 탐색 (1-2일)
- 병렬 표면 스캔
- 광범위한 데이터 가용성 확인
- 다중 기회 포착
- 목표 명확도: 20-30% → 40-60%

### 2단계: 집중 분석 (2-3일)
- 동적 자원 할당
- 발견사항 기반 심층 분석
- 지속적 피벗 평가
- 목표 명확도: 40-60% → 70-85%

### 3단계: 수렴 (1-2일)
- 최종 계산
- 기회 우선순위화
- 의사결정 문서화
- 목표 명확도: 70-85% → 90-95%

## 💡 v5.0 사용 시점

### 다음의 경우에 완벽:
- 정의되지 않은 기회 탐색
- 높은 불확실성의 시장
- 목표가 진화해야 하는 경우
- 빠른 기회 검증

### v4.0 사용 권장:
- 처음부터 명확한 목표
- 규제 준수 필요
- 확립된 프로세스 준수
- 프로덕션 환경

## 📁 v5.0의 새 파일

```
UMIS-bmad-v4.0/
├── docs/
│   └── UMIS-v5.0-Features.md          # 상세 기능 가이드
├── .bmad-core/
│   ├── agents/
│   │   └── MCurator-v5.md             # 향상된 Stewart
│   └── workflows/
│       └── adaptive-market-analysis-v5.yaml  # 적응형 워크플로우
└── RELEASE_NOTES_v5.0.md              # v5.0 릴리즈 노트
```

## 🔄 v4.0에서 마이그레이션

1. 기존 v4.0 프로젝트는 변경 없이 계속 진행
2. 새 프로젝트는 적응형 모드 활성화 가능
3. Stewart가 자동으로 첫 체크포인트 생성
4. 점진적 도입 지원

## 📈 예상 효과

파일럿 프로젝트(한국 취미시장 분석) 기준:
- **시간 절약**: ~40%
- **품질 향상**: +30%
- **성공적 피벗**: 85%
- **데이터 손실**: 0%

## ⚠️ 중요 사항

- v5.0은 **실험적** 버전 - 프로덕션은 v4.0 사용
- 모든 v4.0 기능은 계속 사용 가능
- Issues를 통한 피드백 환영

## 🆘 지원

- **v4.0 이슈**: `v4.0-stable` 태그 사용
- **v5.0 이슈**: `v5.0-adaptive` 태그 사용
- **기능 요청**: `enhancement` 태그 사용

---

**UMIS v5.0** - *불확실성을 받아들이고, 기회를 발견하세요*

**버전**: 5.0-adaptive  
**상태**: 실험적  
**최종 업데이트**: 2024-12-26  
**적응형 지능을 갖춘 BMAD™ Core 기반**
