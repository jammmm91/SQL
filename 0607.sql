CREATE TABLE JOINDATA1_JM (
MATA_TIN VARCHAR2(100),
MATA_TXPR_SEX_CD VARCHAR2(100),
MATE_MDF_YN VARCHAR2(100),
MATE_SRCS_CNTN VARCHAR2(100),
MEM_RIT_CD VARCHAR2(100),
RIT_END_DT VARCHAR2(100),
RIT_STRT_DT VARCHAR2(100),
SUTA_TIN VARCHAR2(100),
SUTA_TXPR_SEX_CD VARCHAR2(100)
)
SELECT * FROM JOINDATA1_JM;
SELECT * FROM JOINDATA2_JM;

--두개의 테이블에서 “부대상납세자통합코드” 같은 경우?
--에만 메인테이블의 “부대상납세자통합코드”를 주납세자 ?
--통합코드로 변경한 컬럼을 생성한다?
--(새로 생성한 컬럼명: new_sutatin)  ?
-- <문제풀이>
-- STEP1 : JOINDATA1 을 기준으로 JOINDATA2를 병합한다
--        * (1) JOINKEY : SUTA_TIN
--        * (2) 추가 필요정보 : JOINDATA2의 MATA_TIN
-- STEP2 : MATA_TIN이 없는
SELECT C.*,
        CASE WHEN C.B_MATA_TIN IS NULL THEN C.SUTA_TIN
             ELSE C.B_MATA_TIN END AS NEW_SUTA_TIN
FROM (
SELECT  A.*,
        B.SUTA_TIN AS B_SUTA_TIN,
        B.MATA_TIN AS B_MATA_TIN
FROM JOINDATA1_JM A
LEFT JOIN JOINDATA2_JM B
ON A.SUTA_TIN = B.SUTA_TIN
) C