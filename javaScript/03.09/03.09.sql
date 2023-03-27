-- C(생성)
INSERT INTO student
(NAME, BIRTH)
VALUES
('김', '1990-02-03');
-- R(읽기)
SELECT * FROM student ;
-- U(업데이트)
UPDATE student SET BIRTH = '1996-11-22' WHERE NO = 2;
-- D(삭제)
DELETE FROM student WHERE NAME = '김';