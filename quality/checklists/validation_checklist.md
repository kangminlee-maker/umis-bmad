# Validation Checklist

## Discovery Sprint (Adaptive)
- [ ] 방향 3-5개 도출
- [ ] 팀 합의/Owner 승인
- [ ] 다음 단계 명확화

## SAM Calculation
- [ ] 4방법 수렴 ±30%
- [ ] 가정/정의 명시
- [ ] 민감도 분석 포함

## Report
- [ ] Executive Summary 2p
- [ ] 시각화 30%+
- [ ] 비전문가 이해 가능

## DART Revenue Validation
- [ ] fs_div=CFS 우선, 실패 시 OFS 폴백 확인
- [ ] sj_div=IS만 허용 (손익계산서)
- [ ] account_id에 revenue 포함(단, deferred/cost/cogs/profit/gross 포함 시 제외)
- [ ] 계정명 우선순위 적용(매출액/영업수익/매출수익/상품·제품·용역매출/수수료수익)
- [ ] 배제어 적용(매출채권/원가/이익 등)으로 오탑 방지
- [ ] source_title에 fs_div/account_nm/account_id 기록(id=...)
- [ ] notes에 검증 로그(OK|WARN:사유) 포함
