# UMIS v4.0 설치 가이드

## 🚀 설치 방법

### 방법 1: 독립 프로젝트로 사용 (권장)
```bash
# GitHub에서 클론
git clone https://github.com/kangminlee-maker/umis-bmad.git
cd umis-bmad

# 바로 사용 가능!
```

### 방법 2: 기존 BMAD 프로젝트에 통합
```bash
# 기존 BMAD 프로젝트 디렉토리에서
cd your-bmad-project

# UMIS 컴포넌트 복사
git clone https://github.com/kangminlee-maker/umis-bmad.git temp
cp -r temp/.bmad-core/* .bmad-core/
rm -rf temp
```

## 📋 설치 전 확인사항

### 필수 요구사항
- ✅ BMAD Core가 이미 설치되어 있어야 함
- ✅ `.bmad-core/` 디렉토리가 존재해야 함
- ✅ `.bmad-core/core-config.yaml` 파일이 있어야 함

### 확인 명령어
```bash
# BMAD 설치 확인
ls -la .bmad-core/
cat .bmad-core/core-config.yaml
```

## 🔧 설치 옵션

### 기본 설치
```bash
./install-umis.sh
```

### 재설치/업데이트
설치 중 기존 UMIS가 감지되면 재설치 여부를 묻습니다.
```
⚠️  Warning: UMIS appears to be already installed
Do you want to reinstall/update? (y/N): y
```

## 📁 설치 후 생성되는 구조

```
your-bmad-project/
├── .bmad-core/
│   ├── agents/          # 6개의 UMIS 에이전트
│   ├── workflows/       # 4개의 분석 워크플로우
│   ├── tasks/           # 15개의 작업 정의
│   ├── templates/       # 10개의 문서 템플릿
│   ├── checklists/      # 5개의 품질 체크리스트
│   ├── data/            # 4개의 데이터 라이브러리
│   ├── utils/           # 3개의 유틸리티 스크립트
│   ├── agent-teams/     # 2개의 팀 정의
│   └── install-manifest-umis.yaml
├── projects/            # 프로젝트 폴더
├── docs/                # 문서 및 가이드
└── .ai/                 # AI 작업 로그
```

## ✅ 설치 확인

### 1. 설치 매니페스트 확인
```bash
cat .bmad-core/install-manifest-umis.yaml
```

### 2. 에이전트 활성화 테스트
```bash
# Cursor 또는 지원되는 IDE에서
/UMIS *activate MOwner
*help
```

### 3. 에이전트 파일 확인
```bash
ls -la .bmad-core/agents/M*.md
```

## 🎯 첫 프로젝트 시작하기

### 1. Market Owner 활성화
```
/UMIS *activate MOwner
```

### 2. 프로젝트 착수
```
*kickoff "테스트 시장 분석"
```

### 3. 워크플로우 실행
```
*workflow market-entry-analysis
```

## ❓ 문제 해결

### "BMAD is not installed" 오류
- 현재 디렉토리가 BMAD 프로젝트 루트인지 확인
- `.bmad-core/` 디렉토리가 있는지 확인

### 에이전트가 활성화되지 않음
```bash
# core-config.yaml에 UMIS 설정 확인
grep "slashPrefix: UMIS" .bmad-core/core-config.yaml

# 에이전트 파일 존재 확인
ls .bmad-core/agents/MOwner.md
```

### 권한 오류
```bash
# 설치 스크립트에 실행 권한 부여
chmod +x install-umis.sh
```

## 🆘 추가 지원

- 📚 상세 문서: `docs/UMIS-Guide.md`
- 📧 이메일: support@umis-bmad.com
- 💬 커뮤니티: https://community.umis-bmad.com

---

**Version**: 4.0  
**Last Updated**: 2024-12-26
