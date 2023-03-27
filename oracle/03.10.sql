SELECT *
FROM PRODUCT_INFO;

create TABLE PRODUCT_INFO(
    SN NUMBER,
    REGIONID VARCHAR2(100),
    PRODUCTID VARCHAR2(100),
    QTY NUMBER
);    

drop table 이원진;

insert into product_info values 
('52', '김기동');

INSERT INTO WON."이원진" (
   REGIONID, PRODUCTID, QTY) 
VALUES ( /* REGIONID */'서울',
 /* PRODUCTID */'갤럭시',
 /* QTY */5 );


DELETE
FROM 이원진
WHERE QTY = 5;


CREATE TABLE TEST_TABLE(
    SN VARCHAR2(100),
    REGIONID VARCHAR2(100),
    PRODUCTID VARCHAR2(100),
    QTY NUMBER,
    constraints PK_TEST_TABLE primary key (SN, REGIONID, PRODUCTID)
);

SELECT *
FROM TEST_TABLE;

drop table TEST_TABLE;

INSERT INTO TEST_TABLE
VALUES ( null, 'PRODUCT01', '202301', 100);

SELECT *
FROM TABS;

CREATE TABLE TEST_TABLE(
    SN VARCHAR2(100),
    REGIONID VARCHAR2(100),
    PRODUCTID VARCHAR2(100),
    QTY NUMBER,
    constraints fK_TEST_TABLE foreign key references TEST_TABLE(SN, REGIONID, PRODUCTID)
);

-- 부모테이블 생성
 CREATE TABLE KOPO_EVENT_INFO_FOREIGN(
     EVENTID VARCHAR2(20),
     EVENTPERIOD VARCHAR2(20),
     PROMOTION_RATIO NUMBER,
 constraint pk_kopo_event_info_foreign primary key(EVENTID));

-- 자식테이블 생성
 CREATE TABLE KOPO_PRODUCT_VOLUME_FOREIGN(
     REGIONID VARCHAR2(20),
     PRODUCTGROUP VARCHAR2(20),
     YEARWEEK VARCHAR2(8),
     VOLUME NUMBER NOT NULL,
     EVENTID VARCHAR2(20),
 constraint pk_kopo_product_volume_foreign primary key(REGIONID, PRODUCTGROUP, YEARWEEK),
 constraint fk_kopo_product_volume_foreign foreign key(eventid) references KOPO_EVENT_INFO_FOREIGN(EVENTID) );
 
 SELECT *
 FROM KOPO_EVENT_INFO_FOREIGN;
 
INSERT INTO KOPO_EVENT_INFO_FOREIGN
VALUES ('A01', 'SALE', 0.3);

create TABLE ERROR_TABLE(
    SN VARCHAR2(100),
    REGIONID VARCHAR2(100),
    PRODUCTID VARCHAR2(100),
    QTY NUMBER not null,
constraint PK_ERROR_TABLE primary key(SN, REGIONID, PRODUCTID)); 
--도메인 무결성 제약조건 위배 (속성 값 위배)
INSERT INTO ERROR_TABLE
VALUES ( '안녕', 'PRODUCT01', 'asdf', null);
--개체 무결성 제약조건(기본키 중복 위배)
INSERT INTO ERROR_TABLE--기본키에 null이 못드감
VALUES ( '안녕', 'PRODUCT01', null, 5);
INSERT into ERROR_TABLE--이미 '안녕', '그래', '어'라는 기본키가 설정되어있음
VALUES ( '안녕', '그래', '어', 5);

SELECT *
FROM ERROR_TABLE;

create table event_info(
    event_code VARCHAR2(20),
    event_name VARCHAR2(20),
    event_period VARCHAR2(20),
    event_sale number,
constraint pk_event_info primary key(event_code));

insert into event_info
values ('A1','추석','08.15~08.20',0.2);

select *
from event_info;

create table product(
    product_code VARCHAR2(20),
    event_code VARCHAR2(20),
    product_name VARCHAR2(20),
    product_price number,
constraint pk_product primary key(product_code),
constraint fk_product foreign key(event_code) references event_info(event_code));
drop table product;
insert into product
values ('B1', 'A1', '자전거', 50000);
--참조 무결성 제약조건->외래값에 A0, A1외의 레퍼런스 테이블에 없는 값을 넣었더니 오류
insert into product
values ('B2', 'ABAB', '자전거', 50000);
--레퍼런스를 땡겨와야되서 부모테이블을 삭제못함
drop table event_info;
--레퍼런스를 땡겨와야되서 부모테이블의 행도 못삭제함
delete event_info
where event_code = 'A1';

select *
from event_info;
select *
from product;
select *
from event_info, product;

commit;