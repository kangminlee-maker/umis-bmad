# UMIS-BMAD 레포지토리 구조 설명

## 📁 레포지토리 구성

이 레포지토리는 UMIS-BMAD의 **소스 코드**를 포함합니다.

### 디렉토리 구조
```
umis-bmad/
├── install-files/          # 설치될 파일들의 소스
│   ├── agents/            # 6개 에이전트 정의
│   ├── workflows/         # 워크플로우 정의
│   ├── tasks/             # 작업 정의
│   ├── templates/         # 문서 템플릿
│   ├── checklists/        # 품질 체크리스트
│   ├── data/              # 데이터 라이브러리
│   ├── utils/             # 유틸리티 스크립트
│   └── agent-teams/       # 팀 정의
├── docs/                   # 문서
│   ├── UMIS-Guide.md      # 사용 가이드
│   └── ...
├── bin/                    # (미래 바이너리용 - 현재 비어있음)
├── lib/                    # (미래 라이브러리용 - 현재 비어있음)
├── build-package.sh        # 패키지 빌드 스크립트
├── install-umis.sh         # 설치 스크립트
├── README.md               # 프로젝트 설명
├── LICENSE                 # MIT 라이선스
├── CONTRIBUTING.md         # 기여 가이드
└── .gitignore             # Git 제외 파일 목록
```

## 📦 배포 파일 다운로드

패키징된 설치 파일(`umis-bmad-v4.0.tar.gz`)은 [Releases 페이지](https://github.com/kangminlee-maker/umis-bmad/releases)에서 다운로드할 수 있습니다.

## 🔧 개발자를 위한 정보

### 패키지 빌드 방법
```bash
# 레포지토리 클론
git clone https://github.com/kangminlee-maker/umis-bmad.git
cd umis-bmad

# 패키지 빌드
./build-package.sh

# umis-bmad-v4.0.tar.gz 파일이 생성됨
```

### 직접 설치 방법
```bash
# 레포지토리에서 직접 설치
cd your-bmad-project
/path/to/umis-bmad/install-umis.sh
```

## 🌟 일반 사용자를 위한 정보

일반 사용자는 [Releases 페이지](https://github.com/kangminlee-maker/umis-bmad/releases)에서 최신 버전의 `umis-bmad-v4.0.tar.gz`를 다운로드하여 사용하시면 됩니다.
