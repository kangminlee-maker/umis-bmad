# Universal Market Intelligence System (UMIS) v4.0 for BMAD

## 🎯 개요

UMIS는 BMAD (Business Method Agent Development) 프레임워크 위에서 작동하는 시장 분석 전문 에이전트 시스템입니다. 체계적인 시장 조사와 분석을 위한 6명의 전문 에이전트가 협업하여 데이터 기반 의사결정을 지원합니다.

## 📋 사전 요구사항

- **BMAD Core** v4.0 이상이 설치되어 있어야 합니다
- macOS, Linux 또는 WSL 환경
- Bash shell

## 🚀 빠른 설치

### 1. 설치 패키지 다운로드
```bash
# 패키지를 다운로드하거나 복사합니다
cd your-bmad-project
```

### 2. 설치 실행
```bash
# BMAD 프로젝트 루트에서 실행
chmod +x install-umis.sh
./install-umis.sh
```

### 3. 설치 확인
```bash
# UMIS 에이전트 활성화 테스트
/UMIS *activate MOwner
```

## 🤖 UMIS 에이전트 소개

### 1. **MOwner** (Strategic Decision Maker) 🎯
- **역할**: 전략적 의사결정자
- **주요 기능**: 프로젝트 착수, 진행 검토, 최종 의사결정
- **활성화**: `/UMIS *activate MOwner`

### 2. **MAnalyst** (Market Structure Analyst) 🔍
- **역할**: 시장 구조 분석가
- **주요 기능**: 시장 구조 파악, 거래 패턴 분석, 참여자 매핑
- **활성화**: `/UMIS *activate MAnalyst`

### 3. **MExplorer** (Opportunity Explorer) 💡
- **역할**: 기회 탐색가
- **주요 기능**: 패턴 해석, 기회 발굴, 시장 재정의
- **활성화**: `/UMIS *activate MExplorer`

### 4. **MQuant** (Market Quantifier) 💰
- **역할**: 시장 정량화 전문가
- **주요 기능**: SAM 계산, 성장률 예측, 단위 경제성 분석
- **활성화**: `/UMIS *activate MQuant`

### 5. **MValidator** (Data Validator) ✅
- **역할**: 데이터 검증 전문가
- **주요 기능**: 데이터 정의 검증, 신뢰성 평가, 검색어 확장
- **활성화**: `/UMIS *activate MValidator`

### 6. **MCurator** (Knowledge Curator) 📚
- **역할**: 지식 관리자
- **주요 기능**: 방법론 선택, 품질 관리, 교훈 추출
- **활성화**: `/UMIS *activate MCurator`

## 📊 주요 워크플로우

### 1. 시장 진입 분석 (Market Entry Analysis)
```bash
/UMIS *activate MOwner
*kickoff "한국 피아노 시장 진입"
*workflow market-entry-analysis
```

### 2. 투자 의사결정 (Investment Decision)
```bash
/UMIS *activate MOwner
*workflow investment-decision
```

### 3. 경쟁 전략 수립 (Competitive Strategy)
```bash
/UMIS *activate MAnalyst
*workflow competitive-strategy
```

## 💼 사용 시나리오

### 시나리오 1: 새로운 시장 진입 검토
1. MOwner로 프로젝트 시작
2. MAnalyst가 시장 구조 분석
3. MExplorer가 기회 탐색
4. MQuant가 시장 규모 계산
5. MOwner가 최종 결정

### 시나리오 2: 빠른 시장 평가
1. MQuant 직접 활성화
2. SAM 계산 수행
3. MValidator로 데이터 검증

## 📁 디렉토리 구조

설치 후 생성되는 구조:
```
your-project/
├── .bmad-core/
│   ├── agents/         # UMIS 에이전트 정의
│   ├── workflows/      # 시장 분석 워크플로우
│   ├── tasks/          # 세부 작업 정의
│   ├── templates/      # 문서 템플릿
│   ├── checklists/     # 품질 체크리스트
│   ├── data/           # 참조 데이터
│   └── utils/          # 유틸리티 스크립트
├── projects/           # 프로젝트별 폴더
├── docs/               # 문서 및 보고서
└── .ai/                # AI 작업 로그
```

## 🔧 고급 기능

### 병렬 작업 최적화
- Phase 1: MAnalyst + MValidator 동시 작업
- Phase 3: 4가지 SAM 방법론 병렬 실행

### 자동 문서 생성
- 프로젝트 차터
- 시장 분석 보고서
- SAM 계산서
- 의사결정 문서

### 지식 관리
- 프로젝트별 자동 아카이빙
- 재사용 가능한 인사이트 추출
- 방법론 지속적 개선

## ❓ 문제 해결

### 에이전트가 활성화되지 않을 때
```bash
# 설치 확인
ls -la .bmad-core/agents/
cat .bmad-core/install-manifest-umis.yaml
```

### 워크플로우 오류
```bash
# 워크플로우 파일 확인
cat .bmad-core/workflows/market-entry-analysis.yaml
```

## 📚 추가 문서

- [UMIS-BMAD Integration Guide](docs/UMIS-Guide.md)
- [Market Analysis Best Practices](docs/best-practices.md)
- [API Reference](docs/api-reference.md)

## 🆘 지원

- GitHub Issues: [github.com/your-repo/umis-bmad/issues](https://github.com/your-repo/umis-bmad/issues)
- Email: support@umis-bmad.com
- Documentation: [docs.umis-bmad.com](https://docs.umis-bmad.com)

## 📄 라이선스

UMIS는 BMAD 확장 팩으로 제공되며, BMAD 라이선스 조건을 따릅니다.

---

**Version**: 4.0  
**Last Updated**: 2024-12-26  
**Powered by BMAD™ Core**
