SELECT *
FROM PRODUCT_INFO;

create TABLE PRODUCT_INFO(
    SN NUMBER,
    REGIONID VARCHAR2(100),
    PRODUCTID VARCHAR2(100),
    QTY NUMBER
);    

drop table �̿���;

insert into product_info values 
('52', '��⵿');

INSERT INTO WON."�̿���" (
   REGIONID, PRODUCTID, QTY) 
VALUES ( /* REGIONID */'����',
 /* PRODUCTID */'������',
 /* QTY */5 );


DELETE
FROM �̿���
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

-- �θ����̺� ����
 CREATE TABLE KOPO_EVENT_INFO_FOREIGN(
     EVENTID VARCHAR2(20),
     EVENTPERIOD VARCHAR2(20),
     PROMOTION_RATIO NUMBER,
 constraint pk_kopo_event_info_foreign primary key(EVENTID));

-- �ڽ����̺� ����
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
--������ ���Ἲ �������� ���� (�Ӽ� �� ����)
INSERT INTO ERROR_TABLE
VALUES ( '�ȳ�', 'PRODUCT01', 'asdf', null);
--��ü ���Ἲ ��������(�⺻Ű �ߺ� ����)
INSERT INTO ERROR_TABLE--�⺻Ű�� null�� ���尨
VALUES ( '�ȳ�', 'PRODUCT01', null, 5);
INSERT into ERROR_TABLE--�̹� '�ȳ�', '�׷�', '��'��� �⺻Ű�� �����Ǿ�����
VALUES ( '�ȳ�', '�׷�', '��', 5);

SELECT *
FROM ERROR_TABLE;

create table event_info(
    event_code VARCHAR2(20),
    event_name VARCHAR2(20),
    event_period VARCHAR2(20),
    event_sale number,
constraint pk_event_info primary key(event_code));

insert into event_info
values ('A1','�߼�','08.15~08.20',0.2);

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
values ('B1', 'A1', '������', 50000);
--���� ���Ἲ ��������->�ܷ����� A0, A1���� ���۷��� ���̺� ���� ���� �־����� ����
insert into product
values ('B2', 'ABAB', '������', 50000);
--���۷����� ���ܿ;ߵǼ� �θ����̺��� ��������
drop table event_info;
--���۷����� ���ܿ;ߵǼ� �θ����̺��� �൵ ��������
delete event_info
where event_code = 'A1';

select *
from event_info;
select *
from product;
select *
from event_info, product;

commit;