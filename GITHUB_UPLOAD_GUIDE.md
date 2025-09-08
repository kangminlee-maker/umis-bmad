# GitHub 업로드 가이드

## 🚀 GitHub에 UMIS-BMAD 레포지토리 생성 및 업로드

### 1단계: GitHub에서 새 레포지토리 생성

1. [GitHub.com](https://github.com)에 로그인
2. 우측 상단의 `+` 버튼 클릭 → `New repository` 선택
3. 다음 정보 입력:
   - Repository name: `umis-bmad` (또는 원하는 이름)
   - Description: "Universal Market Intelligence System for BMAD - AI-powered market analysis framework"
   - Public/Private 선택
   - **중요**: "Initialize this repository with:" 옵션들은 모두 체크 해제 (이미 로컬에 파일이 있으므로)
4. `Create repository` 클릭

### 2단계: 로컬 저장소를 GitHub에 연결

GitHub에서 레포지토리를 생성하면 다음과 같은 명령어가 표시됩니다:

```bash
# 원격 저장소 추가 (YOUR_USERNAME을 실제 GitHub 사용자명으로 변경)
git remote add origin https://github.com/YOUR_USERNAME/umis-bmad.git

# main 브랜치로 설정
git branch -M main

# GitHub에 푸시
git push -u origin main
```

### 3단계: 실행 예시

```bash
# 예시 (실제 사용자명으로 변경 필요)
git remote add origin https://github.com/kangmin/umis-bmad.git
git branch -M main
git push -u origin main
```

### 4단계: 업로드 확인

1. GitHub 레포지토리 페이지 새로고침
2. 모든 파일이 업로드되었는지 확인
3. README.md가 자동으로 표시되는지 확인

## 📝 추가 권장사항

### Topics 추가
레포지토리 설정에서 다음 topics 추가:
- `bmad`
- `market-analysis`
- `ai-agents`
- `market-intelligence`
- `umis`

### About 섹션 설정
- Description 추가
- Website URL (있다면)
- Topics 설정

### GitHub Pages (선택사항)
문서를 웹사이트로 호스팅하려면:
1. Settings → Pages
2. Source: Deploy from a branch
3. Branch: main, folder: /docs

## 🔒 Private 레포지토리로 시작하기

만약 처음에는 비공개로 시작하고 싶다면:
1. 레포지토리 생성 시 Private 선택
2. 나중에 Settings → General → Danger Zone에서 공개로 변경 가능

## ❓ 문제 해결

### "fatal: remote origin already exists" 오류
```bash
git remote remove origin
git remote add origin https://github.com/YOUR_USERNAME/umis-bmad.git
```

### 인증 오류
- Personal Access Token 사용 (Settings → Developer settings → Personal access tokens)
- 또는 GitHub Desktop 사용

준비가 완료되었습니다! 🎉
