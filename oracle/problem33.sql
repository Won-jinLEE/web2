select *
from buseo_test; --�μ�

select *
from sawon_test; --���

select *
from KNMUJI_TEST; --�ٹ���

select *
from JIKGB_TEST; --����

--1�� 800���� �̻��� ���� ������ �����ڵ带 ����
select �����, �����ڵ�, �޿�
from sawon_test
where 1=1
and �޿� >8000000
order by �޿� desc;
--2�� �Ի����� 2010��~2018�� ������ ���� �����, �μ��ڵ�, �޿�, �Ի����� ����
select �����, �μ��ڵ�, �޿�, �Ի���
from sawon_test
where 1=1
and �Ի��� >'2009-12-13 23:59'
and �Ի��� <'2019-01-01 00:00'
order by �Ի��� desc;
--3�� �Ի����� 2020�� 8���̸鼭 �μ��ڵ尡 C�� �ƴ� ���� �����, �ٹ����ڵ�, �μ��ڵ带 ����
select �����, �ٹ����ڵ�, �μ��ڵ�
from sawon_test
where 1=1
and �Ի��� >'2020-07-31 23:59'
and �Ի��� <'2020-09-01 00:00'
and �μ��ڵ� not in ('C');
--4�� ����� �� �ο��� ���
select count(�����)
from sawon_test;
--5�� ����� �����ȣ�� ���³��� ���ο����� �ѱ޿��� ��
select count(�����) as �ο���, sum(�޿�) as �ѱ޿�
from sawon_test
where 1=1
and ����ڻ����ȣ is null
and �����ȣ is not null;
--6�� �޿��� 300�� ���ϸ鼭 2020.08.15���� �Ի��ѳ��� ���ο����� �ѱ޿���
select count(�����) as �ο���, sum(�޿�) as �ѱ޿�
from sawon_test
where 1=1
and �޿�<3000000
and �Ի��� > '2020-08-15';
--7�� �Ѿ����� ���� ������� ����Ͻÿ�
select *
from sawon_test
where 1=1
and ����� like ('��%');
--8�� ���޺� �޿��� ����� ���
select �����ڵ�, avg(�޿�) as �޿����
from sawon_test
where 1=1
and �����ڵ� is not null
group by �����ڵ�
order by �����ڵ� desc;
--9�� '��'�� ���Ե� �̸��� �������̳� �达���γ��� �޿����� ���
select sum(�޿�) as �޿���
from sawon_test
where ����� like ('%��%')
or ����� like ('��%');
--10�� �μ��� ����� ���
select �μ��ڵ�, count(�����) as �μ��������
from sawon_test
where 1=1
and �μ��ڵ� is not null
group by �μ��ڵ�;
--11�� �ٹ����� ����� �� �ο����� ���
select �ٹ����ڵ�, count(�����) as �ٹ������ο���
from sawon_test
where 1=1
and �ٹ����ڵ� is not null
group by �ٹ����ڵ�;
--12�� �ִ� �޿��� �ּ� �޿�
select max(�޿�), min(�޿�)
from sawon_test;
--13�� �޿��� 500~800������ ����� �޿���հ� �޿� �ִ밪�� ���ض�
select floor(avg(�޿�)) as �޿����, max(�޿�) as �ִ�޿�
from sawon_test
where 1=1
and �޿�>4999999
and �޿�<8000001;
--14�� �ִ�޿��ڿ� �ּұ޿����� ���� ���ض�
select max(�޿�)- min(�޿�) as �ִ��ּ�����
from sawon_test;
--15�� �ٹ����� A1�� �ƴѳ���� �μ��ڵ庰 ������� ���
select �μ��ڵ�, count(�����)
from sawon_test
where 1=1
and �ٹ����ڵ� not in ('A1')
and �ٹ����ڵ� is not null
group by �μ��ڵ�;
--16�� �μ��ڵ庰 �����ȣ������ �μ��ڵ�, �����ȣ, �����, �޿��� �������� ���� ���
select �μ��ڵ�, �����ȣ, �����, SUM(�޿�) OVER(order by �μ��ڵ�, �����ȣ) AS ������
from sawon_test
where 1=1
and �μ��ڵ� is not null
order by �μ��ڵ�, �����ȣ;
--17�� �μ���� ����� ���
select b.�μ���, a.�����
from sawon_test a
left join buseo_test b
on a.�μ��ڵ� = b.�μ��ڵ�
where 1=1
and ����� is not null;
--18�� ��ü ������ �μ��� ��� but �μ��� ������� �μ���������� ó��
select a.�����, case when �μ��� is null then '�μ������' else b.�μ��� end as �μ���
from sawon_test a
left join buseo_test b
on a.�μ��ڵ� = b.�μ��ڵ�
where 1=1
and ����� is not null;
--19�� �μ������� ���������� �μ��� ����� �Ի��� ���
select case when �μ��� is null then '�μ������' else b.�μ��� end as �μ���, a.�����, a.�Ի���
from sawon_test a
left join buseo_test b
on a.�μ��ڵ� = b.�μ��ڵ�
where 1=1
and ����� is not null
order by �μ���;
--20�� �μ���� �μ��� ����� ���ο��� ���
select case when �μ��� is null then '�μ������' else b.�μ��� end as �μ���, count(a.�����)
from sawon_test a
left join buseo_test b
on a.�μ��ڵ� = b.�μ��ڵ�
where 1=1
and ����� is not null
group by b.�μ���
order by count(a.�����) desc;
--21�� ������� ����ϵ� �޿��� 100���� �̸��̸� 0 
select �����, case when �޿�<1000000 then 0 
                  when �޿�>1000000 and �޿�<2000000 then 2000000
                  when �޿�>2000000 and �޿�<3000000 then 3000000
                  when �޿�>3000000 and �޿�<4000000 then 4000000
                  when �޿�>4000000 and �޿�<5000000 then 5000000
                  when �޿�>5000000 and �޿�<6000000 then 6000000
                  when �޿�>6000000 and �޿�<7000000 then 7000000
                  when �޿�>7000000 and �޿�<8000000 then 8000000
                  when �޿�>8000000 and �޿�<9000000 then 9000000
                  else 10000000
                  end as �޿�
from sawon_test
where 1=1
and ����� is not null;
--22�� ����� ���� ��� �μ��� �μ��� �μ���� �޿����� ���Ͻÿ�
select case when b.�μ��� is null then '�μ������' else b.�μ��� end as �μ���, sum(a.�޿�) as �޿���
from sawon_test a
left join buseo_test b
on a.�μ��ڵ� = b.�μ��ڵ�
where 1=1
and ����� is not null
group by b.�μ���
order by sum(a.�޿�)desc;
--23�� �μ��� �μ���, �ּұ޿�, �ִ�޿��� ���
select case when b.�μ��� is null then '�μ������' else b.�μ��� end as �μ���, min(�޿�) as �ּұ޿�, max(�޿�) as �ִ�޿�
from sawon_test a
left join buseo_test b
on a.�μ��ڵ� = b.�μ��ڵ�
where 1=1
and ����� is not null
group by b.�μ���
order by b.�μ���;
--24�� �����ȣ, �����, ����ڻ����ȣ, ����ڻ������ ���
SELECT A.�����ȣ,
       A.�����, 
       case when B.�����ȣ is null then a.�����ȣ
            else B.�����ȣ
            end as ����ڻ����ȣ,
       case when B.����� is null then '�����'
            else B.�����
            end as ����ڻ����
FROM sawon_test A 
LEFT JOIN ( SELECT �����ȣ, �����
            FROM sawon_test
            WHERE 1=1
            and ����� is not null
            and ����ڻ����ȣ is null) B
ON A.����ڻ����ȣ = B.�����ȣ
where 1=1
and a.����� is not null
order by a.�����ȣ;
--25�� ����ڻ������ ���ܼ��� �������� �μ��� �޿���� ���
select case when d.�μ��� is null then '�μ������' else d.�μ��� end as �μ���, sum(�޿�) as �μ����޿���
from(SELECT A.�����ȣ,
            A.�����, 
            case when B.�����ȣ is null then a.�����ȣ
                 else B.�����ȣ
                 end as ����ڻ����ȣ,
            case when B.����� is null then '�����'
                 else B.�����
                 end as ����ڻ����,
            a.�μ��ڵ�,
            a.�޿�
    FROM sawon_test A 
    LEFT JOIN ( SELECT �����ȣ, �����
                FROM sawon_test
                WHERE 1=1
                and ����� is not null
                and ����ڻ����ȣ is null) B
    ON A.����ڻ����ȣ = B.�����ȣ
    where 1=1
    and a.����� is not null
    and b.����� in ('���ܼ�')
    order by a.�����ȣ) C
left join buseo_test D
on C.�μ��ڵ� = D.�μ��ڵ�
group by d.�μ���;
--26�� �μ��� �޿��� ���� 1����� �Ѵ� �μ��� �μ���� �޿� �� ���
select case when b.�μ��� is null then '�μ������' else b.�μ��� end as �μ���, a.�޿���
from    (select �μ��ڵ�, sum(�޿�) as �޿���
        from sawon_test
        where 1=1
        and �μ��ڵ� is not null
        group by �μ��ڵ�)a
left join buseo_test b
on a.�μ��ڵ� = b.�μ��ڵ�
where 1=1
and a.�޿��� >10000000;
--27�� 2�� �̸��� �μ��ڵ�, �μ���, ������� ���
select a.�μ��ڵ�, a.�����, case when b.�μ��� is null then '�μ������' else b.�μ��� end as �μ���
from(select �μ��ڵ�, count(�����) as �����
        from sawon_test
        where 1=1
        and ����� is not null
        group by �μ��ڵ�
        order by count(�����) desc) a
left join buseo_test b
on a.�μ��ڵ� = b.�μ��ڵ�
where 1=1
and a.����� <3;
--28�� �μ����� �μ��ڵ�, �μ���, ������� ����ϵ� �μ����� �������� ������ �μ������, ������� 0����
select �μ��ڵ�, 
       case when �μ��� is null then '�μ������' else �μ��� end as �μ���, 
       case when �μ��� is null then 0 else count(�μ���) end as �����
from(select a.�μ��ڵ�, b.�μ���, a.�����
     from sawon_test a
     left join buseo_test b
     on a.�μ��ڵ� = b.�μ��ڵ�
     where 1=1
     and ����� is not null)
group by �μ��ڵ�, �μ���
order by count(�μ���)desc;
--29�� ���� ���� ������ ������ �ִ� ����ڿ� �μ����� ���
select ����ڻ����, �μ���
    from(select ����ڻ����, �����, �μ��ڵ�
        from(select ����ڻ����, count(�����) as �����
             from(SELECT A.�����ȣ,
             A.�����, 
             case when B.�����ȣ is null then a.�����ȣ
                  else B.�����ȣ
                  end as ����ڻ����ȣ,
             B.����� as ����ڻ����
             FROM sawon_test A 
             LEFT JOIN ( SELECT �����ȣ, �����
                         FROM sawon_test
                         WHERE 1=1
                         and ����� is not null
                         and ����ڻ����ȣ is null) B
             ON A.����ڻ����ȣ = B.�����ȣ
             where 1=1
             and a.����� is not null
             and b.����� is not null
             order by a.�����ȣ)
         group by ����ڻ����
         order by ����� desc) a
     left join sawon_test b
     on a.����ڻ���� = b.�����
     order by ����� desc) a
left join buseo_test b
on a.�μ��ڵ� =b.�μ��ڵ�
where 1=1
and rownum =1;
--30�� ���� �μ����� ���³�� ���� ������ ���� ��Ȳ������� �̸� ���޸� ���
select �����, �����ڵ�
from(
    select *
    from sawon_test a
    left join(select a.�����ڵ� as ã�ƾ��Ѵ�
              from sawon_test a
              left join buseo_test b
              on a.�μ��ڵ� = b.�μ��ڵ�
              where 1=1
              and ����� is not null
              and �μ��� is null)b
    on a.�����ڵ� = b.ã�ƾ��Ѵ�
    where 1=1
    and ã�ƾ��Ѵ� is not null
    ) a
left join buseo_test b
on a.�μ��ڵ� = b.�μ��ڵ�
where �μ��� in ('��Ȳ����');
--31�� ���޺� �ּұ޿� �޴³��� �����ȣ, �����, �μ���, �޿�
select �����ȣ, �����,�����ڵ�, �μ���, �ּұ޿�
from(    select �����ȣ, �μ��ڵ�, a.�����ڵ�, �����, �ּұ޿�
    from sawon_test a
    left join
            (
            select �����ڵ�, min(�޿�) as �ּұ޿�
            from sawon_test
            where 1=1
            and ����� is not null
            group by �����ڵ�
            )b
    on a.�޿� = b.�ּұ޿�
    where 1=1
    and �ּұ޿� is not null) a
left join buseo_test b
on a.�μ��ڵ� = b.�μ��ڵ�
order by �ּұ޿� desc;
--32�� �� ����� �ñ� (�� 180�ð�)����ؼ� �μ���, �����, ���޸�, �ñ��� �μ���, �ñ��� ���� ����� ���
select case when �μ��� is null then '�μ������' else �μ��� end as �μ���, �����, �����ڵ�, �ñ�
from (
    select �����, �μ��ڵ�, �����ڵ�, round(�޿�/180 ,0) as �ñ�
    from sawon_test) a
left join buseo_test b
on a.�μ��ڵ� = b.�μ��ڵ�
where 1=1
and ����� is not null
order by �ñ� desc;
--33�� ���޺� �Ի����� ���� ������ ����� ���� �����, ���޸�, �Ի�⵵�� ���
select �����, a.�����ڵ�, a.�Ի���
from (select �����ڵ�, min(�Ի���) as �Ի���
      from sawon_test
      where 1=1
      and ����� is not null
      group by �����ڵ�) a
left join sawon_test b
on a.�Ի��� = b.�Ի���
order by �Ի���;