# DART Revenue Selection Rules

## 목적
- DART `fnlttSinglAcntAll` API로부터 일관된 '매출액(Revenue)'을 선택하고, '매출채권/매출원가/매출총이익' 등의 오탑을 배제한다.

## 필수 파라미터
- `fs_div`: CFS 우선, 실패 시 OFS 폴백
- `bsns_year`: 연도(예: 2023)
- `reprt_code`: 11011 (사업보고서, 연간)

## 선택 규칙
1) `sj_div=IS`(손익계산서)만 허용
2) `account_id`에 `revenue` 포함 시 최우선(단, `deferred/cost/cogs/profit/gross` 포함 시 제외)
3) 계정명 우선순위
   - 매출액 / 영업수익 / 매출수익 / 상품매출 / 제품매출 / 용역매출 / 수수료수익

## 배제 규칙
- 키워드: 채권, 원가, 채무, 자산, 부채, 충당, 환입, 할인, 할증, 이익, cost, cogs, profit, gross

## 로깅 규칙
- `source_title`: `(... fs_div, account_nm, id=account_id)` 형식으로 기록
- `notes`: `validation=OK|WARN:사유` 형식으로 검증 로그 기록

## 실패 대응
- WARN 발생: 파라미터 재시도, OFS 폴백 확인
- 반복 WARN: 회사별 화이트리스트로 계정 고정(예: 특정 `account_id` 우선)

## 구현 참조
- 수집 스크립트: `/Users/kangmin/Desktop/Chatgpt_취미시장분석/dart/dart_fetch_sales.py`
- 에이전트 가드레일: `agents/MValidator_Rachel.yaml`, `agents/MCurator_Stewart.yaml`
- 체크리스트: `quality/checklists/validation_checklist.md`

