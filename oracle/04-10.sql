SELECT REGIONID||'_'||PRODUCTGROUP AS IDX,
A.*
FROM KOPO_PRODUCT_VOLUME A;

SELECT *
FROM KOPO_PRODUCT_VOLUME;

SELECT *
FROM PRO_PROMOTION;

SELECT DISTINCT ITEM
FROM(
    SELECT *
    FROM PRO_PROMOTION
    WHERE 1=1
    AND ITEM IN(SELECT ITEM_PREFIX||ITEM_CODE
                 FROM PRO_RECALL_ITEM)
    );

SELECT ITEM_PREFIX||ITEM_CODE
FROM PRO_RECALL_ITEM;

SELECT 'ITME'||ITEM_CODE
FROM PRO_RECALL_ITEM;

SELECT *
FROM TABS;

SELECT MOD(15, 3)
FROM DUAL;

SELECT A.*,
    SUBSTR(A.YEARWEEK,0,4) AS YEAR,
    SUBSTR(A.YEARWEEK,5,2) AS WEEK,
    MOD(SUBSTR(A.YEARWEEK,5,2),4) AS TEST
FROM KOPO_PRODUCT_VOLUME A;

SELECT POWER(10,11)
FROM DUAL;

SELECT A.*,
    FIRST_NUMBER/SECOND_NUMBER AS AVG,
    ROUND(FIRST_NUMBER/SECOND_NUMBER, 1) AS ROUND_EX,
    CEIL(FIRST_NUMBER/SECOND_NUMBER) AS CEIL_EX,
    FLOOR(FIRST_NUMBER/SECOND_NUMBER) AS FLOOR_EX,
    MOD(FIRST_NUMBER, SECOND_NUMBER) AS MOD_EX,
    POWER(FIRST_NUMBER, SECOND_NUMBER) AS POWER_EX
FROM NUMBER_EXAMPLE A;

SELECT A.*,
ABS(A.PREDICTION - A.QTY) AS DIFF,
1-ABS(A.PREDICTION - A.QTY) AS ACC1,
1-ABS(A.PREDICTION - A.QTY) / A.PREDICTION AS ACCURACY
FROM RMSE_MAE_EXAMPLE A;

SELECT *
FROM RMSE_MAE_EXAMPLE2;

SELECT A.*,
        ABS(A.FCST-A.ACTUAL) AS DIFF,
        1-ABS(A.FCST-A.ACTUAL) AS ACC1,
        1-ABS(A.FCST-A.ACTUAL) / A.FCST AS ACCURACY
FROM RMSE_MAE_EXAMPLE A;

SELECT SYSDATE
FROM DUAL;

SELECT A.*,
SYSDATE AS TIME_TAG
FROM KOPO_PRODUCT_VOLUME A;

SELECT 
    SYSDATE,
    NEXT_DAY(SYSDATE,1),
    LAST_DAY(SYSDATE)
FROM DUAL;

SELECT A.*,
       SUBSTR(A.YEARWEEK, 0, 4) AS YEAR,
       MOD(SUBSTR(A.YEARWEEK, 5, 2),4) AS WEEK1,
       MOD(TO_NUMBER(SUBSTR(A.YEARWEEK, 5, 2)), 4) AS SIGNAL       
FROM KOPO_PRODUCT_VOLUME A
ORDER BY REGIONID, PRODUCTGROUP, YEARWEEK;

SELECT TO_CHAR(SYSDATE, 'YYYYWW') FROM DUAL;-- �̹��� ����
SELECT TO_CHAR(SYSDATE -7, 'YYYYWW') FROM DUAL;-- ������ ����(-7�ϴ�����)
SELECT TO_CHAR(SYSDATE, 'YYYYMMDD') FROM DUAL;--���� ��¥
SELECT TO_CHAR(SYSDATE -1, 'YYYYMMDD') FROM DUAL;--���� ��¥
SELECT TO_CHAR(SYSDATE -30, 'YYYYMMDD') FROM DUAL;--�Ѵ��� ��¥

SELECT A.REGIONID, -- ���ǹ�
       A.PRODUCT,
       A.QTY,
       CASE WHEN A.QTY <0 THEN 0
            WHEN A.QTY >1000000 THEN 1000000
            ELSE A.QTY
       END AS REFINES_QTY
FROM KOPO_CHANNEL_SEASONALITY_NEW A;

SELECT * --���� ����
FROM
(   
    SELECT A.REGIONID, -- ���ǹ�
      A.PRODUCT,
      A.QTY,
      CASE WHEN A.QTY <0 THEN 0
          WHEN A.QTY >1000000 THEN 1000000
          ELSE A.QTY
      END AS REFINED_QTY
    FROM KOPO_CHANNEL_SEASONALITY_NEW A
)
WHERE 1=1
AND QTY <0
AND REFINED_QTY >0;

SELECT A.*
        ,DECODE(UPPER(A.GENDER), 'MALE', 1, 'FEMALE',2,0) AS SORT_ORDER
        FROM KOPO_CUSTOMERDATA A;

SELECT A.*,
        CASE WHEN UPPER(A.GENDER) = 'MALE' THEN 1
            WHEN UPPER(A.GENDER) = 'FEMALE' THEN 2
            ELSE 0
        END AS SORT_ORDER
    FROM KOPO_CUSTOMERDATA A;
    
SELECT A.*,
       CASE WHEN TOTAL_AMOUNT >100000 THEN 'HIGH'
            ELSE 'LOW'
       END AS CUSTOMER_SEG
FROM KOPO_CUSTOMERDATA A;

SELECT CASE WHEN PREDICTION_QTY = 0 THEN 0
            ELSE 1- ABS(PREDICTION_QTY-REAL_QTY)/PREDICTION_QTY
       END AS ACCURACY
FROM DT_RESULT_FINAL3;

SELECT *
FROM DT_RESULT_FINAL3;

SELECT A.*,
        NVL(VOLUME, 50) AS NVL_EX, --NULL�� Ư���� ����
        NVL2(VOLUME, '��Ӹ�', 50) AS NVL2_EX --NULL�� Ư���� ����, NULL �ƴ� ���� Ư���� ����
FROM NVL_CHECK A;
