--���̺����
CREATE TABLE TT
(
���̵� VARCHAR2(100),
���ð��߻� VARCHAR2(100),
��ġ VARCHAR2(100)
)
--���̺��߰�
INSERT INTO TT(���̵�, ���ð��߻�, ��ġ) VALUES('A02', 'ī����', '����')
--�����ͻ���
DELETE FROM TT WHERE ���̵� = 'A02'
--���̺����
DROP TABLE TT
--���̺���ü��ȸ
SELECT * FROM TT


--NVLó�� (NULL���� �� �Է��� ��('0')���� ġȯ)
SELECT REGIONID,
        YEARWEEK,
        NVL(VOLUME,0) AS VOLUME
        NVL2(VOLUME, VOLUME, 1) AS VOLUME
FROM NVL_CHECK



SELECT A.GENDER,
        UPPER(A.GENDER) AS GENDER_NEW,
         DECODE(
            UPPER(A.GENDER),'MALE',1,0)
FROM KOPO_CUSTOMERDATA A




-- DT_RESULT_FINAL3 ���̺�����Ȯ���������ϼ���
-- ��, ��������0�ΰ����Ȯ����0
-- ��Ȯ��= 1-ABS(������-������)/������
SELECT * FROM DT_RESULT_FINAL3

SELECT A.* ,
        CASE WHEN PREDICTION_QTY = 0 THEN 0
        ELSE ROUND((1 - ABS(PREDICTION_QTY-REAL_QTY) / PREDICTION_QTY)*100,2) END AS ��Ȯ��
FROM DT_RESULT_FINAL3 A




SELECT * FROM KOPO_CHANNEL_SEASONALITY_NEW

--A60������ �ǸŵǴ� ��� ��ǰ�� ��������
--A01, A02 �������� ���� ��õǾ��� �������� �ȸ��� �ִ����� �˾ƺ���.
SELECT REGIONID,
       PRODUCT,
        MIN(YEARWEEK) AS LAUNCH_DATE, --�����
        MAX(YEARWEEK) AS LAST_DATE    --�����ŷ���
FROM KOPO_CHANNEL_SEASONALITY_NEW
WHERE 1=1
AND REGIONID IN ('A01','A02','A60')
AND PRODUCT IN (SELECT DISTINCT PRODUCT
                FROM KOPO_CHANNEL_SEASONALITY_NEW
                WHERE REGIONID = 'A60')
GROUP BY REGIONID, PRODUCT --�׷�Ű
HAVING MIN(YEARWEEK) > 201401



SELECT * FROM GROUP_TEST

SELECT ����, ��ǰ,
   SUM(�ŷ���) AS �ŷ��ѷ� --SUM, MIN, MAX, AVG �� ����
FROM GROUP_TEST
GROUP BY ����, ��ǰ