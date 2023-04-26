CREATE TABLE PRACTICE_USER_INFO (
    ID VARCHAR2(100),
    PW VARCHAR2(100),
    ADDRESS VARCHAR2(100),
    CARD_NUM VARCHAR2(100)
);

Insert into PRACTICE_USER_INFO
(ID, PW, ADDRESS, CARD_NUM)
VALUES ('hiteam', '1', '�λ��', '4444-44-44');


CREATE TABLE PRACTICE_ADV_INFO (
    ADV_CODE VARCHAR2(100),
    ID VARCHAR2(100),
    ADV_ADDRESS VARCHAR2(100),
    PERIOD VARCHAR2(100),
    ADV_MASTER VARCHAR2(100),
    ADD_WEEK VARCHAR2(100),
    ADV_INFO VARCHAR2(100)
);

Insert into PRACTICE_ADV_INFO
(ADV_CODE, ID, ADV_ADDRESS, PERIOD, ADV_MASTER, ADD_WEEK, ADV_INFO)
VALUES ('hk004', 'haiteam', 'www.hadoopkorea.com', '90D', 'temk', '2023-04-27', '������ ����');

select *
from PRACTICE_ADV_INFO;

CREATE TABLE PRACTICE_KEY_WORD_INFO (
    ADV_CODE VARCHAR2(100),
    ADV_KEY_WORD VARCHAR2(100),
    KEY_WORD_ID VARCHAR2(100),
    CLICK_MONEY int,
    CLICK int,
    IMPRESSIONS int
);

Insert into PRACTICE_KEY_WORD_INFO
(ADV_CODE, ADV_KEY_WORD, KEY_WORD_ID, CLICK_MONEY, CLICK, IMPRESSIONS)
VALUES ('hk004', '������', 'KEYWORD0008', 200, 5, 300);

CREATE TABLE PRACTICE_MST_INFO (
    ADV_MASTER VARCHAR2(100),
    ADV_SHUTTLE VARCHAR2(100),
    CALL_NUM VARCHAR2(100),
    EMAIL VARCHAR2(100)
);

Insert into PRACTICE_MST_INFO
(ADV_MASTER, ADV_SHUTTLE, CALL_NUM, EMAIL)
VALUES ('taicode', '�ȹ���', '010-3333-3333', 'taicode@fintech.com');

select *
from PRACTICE_USER_INFO; -- ȸ������

select *
from PRACTICE_ADV_INFO; -- ���� ����

select *
from PRACTICE_KEY_WORD_INFO; -- Ű���� 

select *
from PRACTICE_MST_INFO; -- ������
--1�� ���� : ���� ���̵� ���� �ݾ�
SELECT DISTINCT A.ADV_CODE,
       B.ID,
       (SELECT SUM(CLICK_MONEY*CLICK)
        FROM PRACTICE_KEY_WORD_INFO
        WHERE ADV_CODE = A.ADV_CODE
        GROUP BY A.ADV_CODE) AS GWAGM
FROM PRACTICE_KEY_WORD_INFO A
LEFT JOIN PRACTICE_ADV_INFO B
ON A.ADV_CODE = B.ADV_CODE; 
--2�� ���� : ���̵� "����������" ����
SELECT ADV_CODE,
       ID,
       to_date(ADD_WEEK) AS START_DAY,
       to_number(LPAD(LPAD(PERIOD, 3,'0'), 2,'0')) AS PERIOD,
       to_date(ADD_WEEK) + to_number(LPAD(LPAD(PERIOD, 3,'0'), 2,'0')) AS END_DAY,
       CASE WHEN to_number(REPLACE(to_char(to_date(ADD_WEEK) + to_number(LPAD(LPAD(PERIOD, 3,'0'), 2,'0'))),'/')) < 230512 THEN '�Ⱓ����'
            ELSE LPAD(to_char(to_date(ADD_WEEK) + to_number(LPAD(LPAD(PERIOD, 3,'0'), 2,'0'))),10, '20')
       END AS CURRENT_STATUS
FROM PRACTICE_ADV_INFO;
--3�� ���� : kaifox�� �����
SELECT A.ID,
       A.ADV_MASTER,
       B.ADV_SHUTTLE
FROM PRACTICE_ADV_INFO A
LEFT JOIN PRACTICE_MST_INFO B
ON A.ADV_MASTER = B.ADV_MASTER
WHERE 1=1
AND ID IN ('kaifox');
--4�� ���� : Ű���庰 Ŭ��Ƚ��
SELECT ADV_KEY_WORD,
       SUM(CLICK)
FROM PRACTICE_KEY_WORD_INFO
GROUP BY ADV_KEY_WORD;
--5�� ���� : ���ݰ� �˻��� ���� ������ URL
SELECT A.ADV_CODE,
       B.ID,
       A.ADV_KEY_WORD,
       B.ADV_ADDRESS,
       B.ADV_INFO
FROM PRACTICE_KEY_WORD_INFO A
LEFT JOIN PRACTICE_ADV_INFO B
ON A.ADV_CODE=B.ADV_CODE
WHERE 1=1
AND ADV_KEY_WORD IN ('����Ʈ������');
--6�� ���� : ���Ը��ϰ� ���� ���ѳ� ���
SELECT *
FROM PRACTICE_USER_INFO A
LEFT JOIN PRACTICE_ADV_INFO B
ON A.ID=B.ID
WHERE 1=1
AND ADV_INFO IS NULL;
--7�� ���� : ����ں� ���� ���
SELECT ID,
       AVG(CLICK_MONEY) AS AVG_GWAGM
FROM PRACTICE_ADV_INFO A
LEFT JOIN PRACTICE_KEY_WORD_INFO B
ON A.ADV_CODE=B.ADV_CODE
GROUP BY ID;
--8�� ���� : ���� ���� �Խ��ڸ� �����϶�
select  rownum, A.*
from (SELECT *
      FROM PRACTICE_ADV_INFO
      ORDER BY ADD_WEEK) A
WHERE 1=1
AND rownum = 1;

--9�� ���� 5�� 12���� ���� Ȱ��ȭ�� Ű������� ����� ������������
SELECT A.ID, B.KEY_WORD_ID, to_date(ADD_WEEK) + to_number(LPAD(LPAD(PERIOD, 3,'0'), 2,'0')) AS END_DAY, B.IMPRESSIONS
FROM PRACTICE_ADV_INFO A
LEFT JOIN PRACTICE_KEY_WORD_INFO B
ON A.ADV_CODE=B.ADV_CODE
WHERE 1=1
AND to_number(REPLACE(to_char(to_date(ADD_WEEK) + to_number(LPAD(LPAD(PERIOD, 3,'0'), 2,'0'))),'/')) > 230512
ORDER BY B.IMPRESSIONS DESC;
--10�� ���� �����ּҺ� HAITEAM ������� Ű����
SELECT A.ADV_CODE,
       A.ID,
       A.ADV_ADDRESS,
       A.ADV_MASTER,
       B.ADV_KEY_WORD,
       to_date(ADD_WEEK) + to_number(LPAD(LPAD(PERIOD, 3,'0'), 2,'0')) AS END_DAY
FROM PRACTICE_ADV_INFO A
LEFT JOIN PRACTICE_KEY_WORD_INFO B
ON A.ADV_CODE = B.ADV_CODE
WHERE 1=1
AND A.ID IN ('haiteam');