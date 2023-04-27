select *
from buseo_test; --부서

select *
from sawon_test; --사원

select *
from KNMUJI_TEST; --근무지

select *
from JIKGB_TEST; --직급

--1번 800만원 이상인 놈의 사원명과 직급코드를 찍어라
select 사원명, 직급코드, 급여
from sawon_test
where 1=1
and 급여 >8000000
order by 급여 desc;
--2번 입사일이 2010년~2018년 사이인 놈의 사원명, 부서코드, 급여, 입사일을 찍어라
select 사원명, 부서코드, 급여, 입사일
from sawon_test
where 1=1
and 입사일 >'2009-12-13 23:59'
and 입사일 <'2019-01-01 00:00'
order by 입사일 desc;
--3번 입사일이 2020년 8월이면서 부서코드가 C가 아닌 놈의 사원명, 근무지코드, 부서코드를 찍어라
select 사원명, 근무지코드, 부서코드
from sawon_test
where 1=1
and 입사일 >'2020-07-31 23:59'
and 입사일 <'2020-09-01 00:00'
and 부서코드 not in ('C');
--4번 사원의 총 인원수 출력
select count(사원명)
from sawon_test;
--5번 상급자 사원번호가 없는놈의 총인원수랑 총급여의 합
select count(사원명) as 인원수, sum(급여) as 총급여
from sawon_test
where 1=1
and 상급자사원번호 is null
and 사원번호 is not null;
--6번 급여가 300만 이하면서 2020.08.15이후 입사한놈의 총인원수와 총급여합
select count(사원명) as 인원수, sum(급여) as 총급여
from sawon_test
where 1=1
and 급여<3000000
and 입사일 > '2020-08-15';
--7번 한씨성을 가진 사원들을 출력하시오
select *
from sawon_test
where 1=1
and 사원명 like ('한%');
--8번 직급별 급여의 평균을 출력
select 직급코드, avg(급여) as 급여평균
from sawon_test
where 1=1
and 직급코드 is not null
group by 직급코드
order by 직급코드 desc;
--9번 '삭'이 포함된 이름을 가진놈이나 김씨성인놈의 급여합을 출력
select sum(급여) as 급여합
from sawon_test
where 사원명 like ('%삭%')
or 사원명 like ('김%');
--10번 부서별 사원수 출력
select 부서코드, count(사원명) as 부서별사원수
from sawon_test
where 1=1
and 부서코드 is not null
group by 부서코드;
--11번 근무지별 사원의 총 인원수를 출력
select 근무지코드, count(사원명) as 근무지별인원수
from sawon_test
where 1=1
and 근무지코드 is not null
group by 근무지코드;
--12번 최대 급여와 최소 급여
select max(급여), min(급여)
from sawon_test;
--13번 급여가 500~800사이의 사원의 급여평균과 급여 최대값을 구해라
select floor(avg(급여)) as 급여평균, max(급여) as 최대급여
from sawon_test
where 1=1
and 급여>4999999
and 급여<8000001;
--14번 최대급여자와 최소급여자의 차를 구해라
select max(급여)- min(급여) as 최대최소의차
from sawon_test;
--15번 근무지가 A1이 아닌놈들의 부서코드별 사원수를 출력
select 부서코드, count(사원명)
from sawon_test
where 1=1
and 근무지코드 not in ('A1')
and 근무지코드 is not null
group by 부서코드;
--16번 부서코드별 사원번호순으로 부서코드, 사원번호, 사원명, 급여의 누적값을 구해 출력
select 부서코드, 사원번호, 사원명, SUM(급여) OVER(order by 부서코드, 사원번호) AS 누적합
from sawon_test
where 1=1
and 부서코드 is not null
order by 부서코드, 사원번호;
--17번 부서명과 사원명 출력
select b.부서명, a.사원명
from sawon_test a
left join buseo_test b
on a.부서코드 = b.부서코드
where 1=1
and 사원명 is not null;
--18번 전체 사원명과 부서명 출력 but 부서명 미존재시 부서명없음으로 처리
select a.사원명, case when 부서명 is null then '부서명없음' else b.부서명 end as 부서명
from sawon_test a
left join buseo_test b
on a.부서코드 = b.부서코드
where 1=1
and 사원명 is not null;
--19번 부서명으로 오름차순해 부서명 사원명 입사일 출력
select case when 부서명 is null then '부서명없음' else b.부서명 end as 부서명, a.사원명, a.입사일
from sawon_test a
left join buseo_test b
on a.부서코드 = b.부서코드
where 1=1
and 사원명 is not null
order by 부서명;
--20번 부서명과 부서별 사원의 총인원수 출력
select case when 부서명 is null then '부서명없음' else b.부서명 end as 부서명, count(a.사원명)
from sawon_test a
left join buseo_test b
on a.부서코드 = b.부서코드
where 1=1
and 사원명 is not null
group by b.부서명
order by count(a.사원명) desc;
--21번 사원명을 출력하되 급여가 100만원 미만이면 0 
select 사원명, case when 급여<1000000 then 0 
                  when 급여>1000000 and 급여<2000000 then 2000000
                  when 급여>2000000 and 급여<3000000 then 3000000
                  when 급여>3000000 and 급여<4000000 then 4000000
                  when 급여>4000000 and 급여<5000000 then 5000000
                  when 급여>5000000 and 급여<6000000 then 6000000
                  when 급여>6000000 and 급여<7000000 then 7000000
                  when 급여>7000000 and 급여<8000000 then 8000000
                  when 급여>8000000 and 급여<9000000 then 9000000
                  else 10000000
                  end as 급여
from sawon_test
where 1=1
and 사원명 is not null;
--22번 사원이 속한 모든 부서의 부서별 부서명과 급여합을 구하시오
select case when b.부서명 is null then '부서명없음' else b.부서명 end as 부서명, sum(a.급여) as 급여합
from sawon_test a
left join buseo_test b
on a.부서코드 = b.부서코드
where 1=1
and 사원명 is not null
group by b.부서명
order by sum(a.급여)desc;
--23번 부서별 부서명, 최소급여, 최대급여를 출력
select case when b.부서명 is null then '부서명없음' else b.부서명 end as 부서명, min(급여) as 최소급여, max(급여) as 최대급여
from sawon_test a
left join buseo_test b
on a.부서코드 = b.부서코드
where 1=1
and 사원명 is not null
group by b.부서명
order by b.부서명;
--24번 사원번호, 사원명, 상급자사원번호, 상급자사원명을 출력
SELECT A.사원번호,
       A.사원명, 
       case when B.사원번호 is null then a.사원번호
            else B.사원번호
            end as 상급자사원번호,
       case when B.사원명 is null then '상급자'
            else B.사원명
            end as 상급자사원명
FROM sawon_test A 
LEFT JOIN ( SELECT 사원번호, 사원명
            FROM sawon_test
            WHERE 1=1
            and 사원명 is not null
            and 상급자사원번호 is null) B
ON A.상급자사원번호 = B.사원번호
where 1=1
and a.사원명 is not null
order by a.사원번호;
--25번 상급자사원명이 허잔석인 새끼들의 부서명별 급여평균 출력
select case when d.부서명 is null then '부서명없음' else d.부서명 end as 부서명, sum(급여) as 부서별급여합
from(SELECT A.사원번호,
            A.사원명, 
            case when B.사원번호 is null then a.사원번호
                 else B.사원번호
                 end as 상급자사원번호,
            case when B.사원명 is null then '상급자'
                 else B.사원명
                 end as 상급자사원명,
            a.부서코드,
            a.급여
    FROM sawon_test A 
    LEFT JOIN ( SELECT 사원번호, 사원명
                FROM sawon_test
                WHERE 1=1
                and 사원명 is not null
                and 상급자사원번호 is null) B
    ON A.상급자사원번호 = B.사원번호
    where 1=1
    and a.사원명 is not null
    and b.사원명 in ('허잔석')
    order by a.사원번호) C
left join buseo_test D
on C.부서코드 = D.부서코드
group by d.부서명;
--26번 부서별 급여의 합이 1억원이 넘는 부서의 부서명과 급여 합 출력
select case when b.부서명 is null then '부서명없음' else b.부서명 end as 부서명, a.급여합
from    (select 부서코드, sum(급여) as 급여합
        from sawon_test
        where 1=1
        and 부서코드 is not null
        group by 부서코드)a
left join buseo_test b
on a.부서코드 = b.부서코드
where 1=1
and a.급여합 >10000000;
--27번 2인 미만의 부서코드, 부서명, 사원명을 출력
select a.부서코드, a.사원수, case when b.부서명 is null then '부서명없음' else b.부서명 end as 부서명
from(select 부서코드, count(사원명) as 사원수
        from sawon_test
        where 1=1
        and 사원명 is not null
        group by 부서코드
        order by count(사원명) desc) a
left join buseo_test b
on a.부서코드 = b.부서코드
where 1=1
and a.사원수 <3;
--28번 부서별로 부서코드, 부서명, 사원수를 출력하되 부서명이 존재하지 않으면 부서명없음, 사원수를 0으로
select 부서코드, 
       case when 부서명 is null then '부서명없음' else 부서명 end as 부서명, 
       case when 부서명 is null then 0 else count(부서명) end as 사원수
from(select a.부서코드, b.부서명, a.사원명
     from sawon_test a
     left join buseo_test b
     on a.부서코드 = b.부서코드
     where 1=1
     and 사원명 is not null)
group by 부서코드, 부서명
order by count(부서명)desc;
--29번 가장 많은 꼬봉을 데리고 있는 상급자와 부서명을 출력
select 상급자사원명, 부서명
    from(select 상급자사원명, 사원수, 부서코드
        from(select 상급자사원명, count(사원명) as 사원수
             from(SELECT A.사원번호,
             A.사원명, 
             case when B.사원번호 is null then a.사원번호
                  else B.사원번호
                  end as 상급자사원번호,
             B.사원명 as 상급자사원명
             FROM sawon_test A 
             LEFT JOIN ( SELECT 사원번호, 사원명
                         FROM sawon_test
                         WHERE 1=1
                         and 사원명 is not null
                         and 상급자사원번호 is null) B
             ON A.상급자사원번호 = B.사원번호
             where 1=1
             and a.사원명 is not null
             and b.사원명 is not null
             order by a.사원번호)
         group by 상급자사원명
         order by 사원수 desc) a
     left join sawon_test b
     on a.상급자사원명 = b.사원명
     order by 사원수 desc) a
left join buseo_test b
on a.부서코드 =b.부서코드
where 1=1
and rownum =1;
--30번 문제 부서명이 없는놈과 같은 직급을 가진 현황조사맨의 이름 직급명 출력
select 사원명, 직급코드
from(
    select *
    from sawon_test a
    left join(select a.직급코드 as 찾아야한다
              from sawon_test a
              left join buseo_test b
              on a.부서코드 = b.부서코드
              where 1=1
              and 사원명 is not null
              and 부서명 is null)b
    on a.직급코드 = b.찾아야한다
    where 1=1
    and 찾아야한다 is not null
    ) a
left join buseo_test b
on a.부서코드 = b.부서코드
where 부서명 in ('현황조사');
--31번 직급별 최소급여 받는놈의 사원번호, 사원명, 부서명, 급여
select 사원번호, 사원명,직급코드, 부서명, 최소급여
from(    select 사원번호, 부서코드, a.직급코드, 사원명, 최소급여
    from sawon_test a
    left join
            (
            select 직급코드, min(급여) as 최소급여
            from sawon_test
            where 1=1
            and 사원명 is not null
            group by 직급코드
            )b
    on a.급여 = b.최소급여
    where 1=1
    and 최소급여 is not null) a
left join buseo_test b
on a.부서코드 = b.부서코드
order by 최소급여 desc;
--32번 각 사원별 시급 (월 180시간)계산해서 부서명, 사원명, 직급명, 시급을 부서명별, 시급이 많은 순대로 출력
select case when 부서명 is null then '부서명없음' else 부서명 end as 부서명, 사원명, 직급코드, 시급
from (
    select 사원명, 부서코드, 직급코드, round(급여/180 ,0) as 시급
    from sawon_test) a
left join buseo_test b
on a.부서코드 = b.부서코드
where 1=1
and 사원명 is not null
order by 시급 desc;
--33번 직급별 입사일이 가장 오래된 사원에 대해 사원명, 직급명, 입사년도를 출력
select 사원명, a.직급코드, a.입사일
from (select 직급코드, min(입사일) as 입사일
      from sawon_test
      where 1=1
      and 사원명 is not null
      group by 직급코드) a
left join sawon_test b
on a.입사일 = b.입사일
order by 입사일;