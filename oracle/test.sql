-- 쿼리 문제 진행중
select PRD_SEG2,
       FCST_AVG_SUM,
       acc_avg_sum,
       (acc_avg_sum)/(FCST_AVG_SUM) as FINAL_ACC
from(
    select PRD_SEG2,
           sum(FCST_AVG) as FCST_AVG_SUM,
           sum(acc_avg) as acc_avg_sum
    from(
        select PRD_SEG1,
               substr(PRD_SEG2, 0, 4) as PRD_SEG2,
               a.PRD_SEG3,
               TARGETWEEK,
               YEAR,
               WEEK,
               QTY,
               FCST_W6,
               FCST_W5,
               FCST_W4,
               FCST_W3,
               FCST_W2,
               FCST_W1,
               ABS8W_W6,
               ABS8W_W5,
               ABS8W_W4,
               ABS8W_W3,
               ABS8W_W2,
               ABS8W_W1,
               ACC8W_W6,
               ACC8W_W5,
               ACC8W_W4,
               ACC8W_W3,
               ACC8W_W2,
               ACC8W_W1,
               ACC8W_QTY_W6,
               ACC8W_QTY_W5,
               ACC8W_QTY_W4,
               ACC8W_QTY_W3,
               ACC8W_QTY_W2,
               ACC8W_QTY_W1,
               FCST_AVG,
               b.acc_avg
        from(
            select PRD_SEG1,
                   PRD_SEG2,
                   a.PRD_SEG3,
                   TARGETWEEK,
                   YEAR,
                   WEEK,
                   QTY,
                   FCST_W6,
                   FCST_W5,
                   FCST_W4,
                   FCST_W3,
                   FCST_W2,
                   FCST_W1,
                   ABS8W_W6,
                   ABS8W_W5,
                   ABS8W_W4,
                   ABS8W_W3,
                   ABS8W_W2,
                   ABS8W_W1,
                   ACC8W_W6,
                   ACC8W_W5,
                   ACC8W_W4,
                   ACC8W_W3,
                   ACC8W_W2,
                   ACC8W_W1,
                   ACC8W_QTY_W6,
                   ACC8W_QTY_W5,
                   ACC8W_QTY_W4,
                   ACC8W_QTY_W3,
                   ACC8W_QTY_W2,
                   ACC8W_QTY_W1,
                   b.FCST_AVG
            from(
                select PRD_SEG1,
                       PRD_SEG2,
                       PRD_SEG3,
                       TARGETWEEK,
                       YEAR,
                       WEEK,
                       QTY,
                       FCST_W6,
                       FCST_W5,
                       FCST_W4,
                       FCST_W3,
                       FCST_W2,
                       FCST_W1,
                       ABS8W_W6,
                       ABS8W_W5,
                       ABS8W_W4,
                       ABS8W_W3,
                       ABS8W_W2,
                       ABS8W_W1,
                       ACC8W_W6,
                       ACC8W_W5,
                       ACC8W_W4,
                       ACC8W_W3,
                       ACC8W_W2,
                       ACC8W_W1,
                       case when FCST_W6 is null or ACC8W_W6 is null then 0
                            else FCST_W6*ACC8W_W6
                            end as ACC8W_QTY_W6,
                       case when FCST_W5 is null or ACC8W_W5 is null then 0
                            else FCST_W5*ACC8W_W5
                            end as ACC8W_QTY_W5,
                       case when FCST_W4 is null or ACC8W_W4 is null then 0
                            else FCST_W4*ACC8W_W4
                            end as ACC8W_QTY_W4,
                       case when FCST_W3 is null or ACC8W_W3 is null then 0
                            else FCST_W3*ACC8W_W3
                            end as ACC8W_QTY_W3,
                       case when FCST_W2 is null or ACC8W_W2 is null then 0
                            else FCST_W2*ACC8W_W2
                            end as ACC8W_QTY_W2,
                       case when FCST_W1 is null or ACC8W_W1 is null then 0
                            else FCST_W1*ACC8W_W1
                            end as ACC8W_QTY_W1
                from(
                    select PRD_SEG1,
                           PRD_SEG2,
                           PRD_SEG3,
                           TARGETWEEK,
                           YEAR,
                           WEEK,
                           QTY,
                           FCST_W6,
                           FCST_W5,
                           FCST_W4,
                           FCST_W3,
                           FCST_W2,
                           FCST_W1,
                           ABS8W_W6,
                           ABS8W_W5,
                           ABS8W_W4,
                           ABS8W_W3,
                           ABS8W_W2,
                           ABS8W_W1,
                           case when FCST_W6 is null or QTY is null then 0
                                when FCST_W6=0 or QTY =0 then 0
                                when (QTY/FCST_W6) > 2 then 0
                                else 1-(ABS8W_W6/FCST_W6)
                                end as ACC8W_W6,
                           case when FCST_W5 is null or QTY is null then 0
                                when FCST_W5=0 or QTY =0 then 0
                                when (QTY/FCST_W5) > 2 then 0
                                else 1-(ABS8W_W5/FCST_W5)
                                end as ACC8W_W5,
                           case when FCST_W4 is null or QTY is null then 0
                                when FCST_W4=0 or QTY =0 then 0
                                when (QTY/FCST_W4) > 2 then 0
                                else 1-(ABS8W_W4/FCST_W4)
                                end as ACC8W_W4,
                           case when FCST_W3 is null or QTY is null then 0
                                when FCST_W3=0 or QTY =0 then 0
                                when (QTY/FCST_W3) > 2 then 0
                                else 1-(ABS8W_W3/FCST_W3)
                                end as ACC8W_W3,
                           case when FCST_W2 is null or QTY is null then 0
                                when FCST_W2=0 or QTY =0 then 0
                                when (QTY/FCST_W2) > 2 then 0
                                else 1-(ABS8W_W2/FCST_W2)
                                end as ACC8W_W2,
                           case when FCST_W1 is null or QTY is null then 0
                                when FCST_W1=0 or QTY =0 then 0
                                when (QTY/FCST_W1) > 2 then 0
                                else 1-(ABS8W_W1/FCST_W1)
                                end as ACC8W_W1
                    from(
                        select a.PRD_SEG1, 
                               a.PRD_SEG2, 
                               LPAD(a.PRD_SEG3, 5, '1') as PRD_SEG3,
                               to_char(a.YEAR)|| to_char(a.WEEK) as TARGETWEEK,
                               a.YEAR, 
                               a.WEEK, 
                               a.QTY,
                               b.FCST_W6,
                               b.FCST_W5,
                               b.FCST_W4,
                               b.FCST_W3,
                               b.FCST_W2,
                               a.OUTFCST AS FCST_W1,
                               case when abs(a.QTY-b.FCST_w6) is null then a.qty
                                    else abs(a.QTY-b.FCST_w6)
                                    end as ABS8W_W6,
                               case when abs(a.QTY-b.FCST_w5) is null then a.qty
                                    else abs(a.QTY-b.FCST_w5)
                                    end as ABS8W_W5,
                               case when abs(a.QTY-b.FCST_w4) is null then a.qty
                                    else abs(a.QTY-b.FCST_w4)
                                    end as ABS8W_W4,
                               case when abs(a.QTY-b.FCST_w3) is null then a.qty
                                    else abs(a.QTY-b.FCST_w3)
                                    end as ABS8W_W3,
                               case when abs(a.QTY-b.FCST_w2) is null then a.qty
                                    else abs(a.QTY-b.FCST_w2)
                                    end as ABS8W_W2,
                                case when abs(a.QTY-a.OUTFCST) is null then a.qty
                                    else abs(a.QTY-a.OUTFCST)
                                    end as ABS8W_W1
                        from kopo_final_1week a
                        left join(
                            select a.PRD_SEG1, 
                                   a.PRD_SEG2, 
                                   a.PRD_SEG3, 
                                   a.YEAR, 
                                   a.WEEK, 
                                   a.QTY,
                                   b.FCST_W6,
                                   b.FCST_W5,
                                   b.FCST_W4,
                                   b.FCST_W3,
                                   a.OUTFCST AS FCST_W2
                            from kopo_final_2week a
                            left join (
                                select a.PRD_SEG1, 
                                       a.PRD_SEG2, 
                                       a.PRD_SEG3, 
                                       a.YEAR, 
                                       a.WEEK, 
                                       a.QTY,
                                       b.FCST_W6,
                                       b.FCST_W5,
                                       b.FCST_W4,
                                       a.OUTFCST AS FCST_W3
                                from kopo_final_3week a
                                left join(
                                    select a.PRD_SEG1, 
                                           a.PRD_SEG2, 
                                           a.PRD_SEG3, 
                                           a.YEAR, 
                                           a.WEEK, 
                                           a.QTY,
                                           b.FCST_W6,
                                           b.FCST_W5,
                                           a.OUTFCST AS FCST_W4
                                    from kopo_final_4week a
                                    left join(
                                        select a.PRD_SEG1, 
                                               a.PRD_SEG2, 
                                               a.PRD_SEG3, 
                                               a.YEAR, 
                                               a.WEEK, 
                                               a.QTY,
                                               b.FCST_W6,
                                               a.OUTFCST AS FCST_W5
                                        from kopo_final_5week a
                                        left join(
                                            select PRD_SEG1, 
                                                   PRD_SEG2, 
                                                   PRD_SEG3, 
                                                   YEAR, 
                                                   WEEK, 
                                                   QTY,
                                                   OUTFCST AS FCST_W6
                                            from kopo_final_6week
                                            ) b
                                        on a.PRD_SEG3 = to_char(b.PRD_SEG3)
                                        and a.qty = b.qty
                                        and a.week = b.week
                                        ) b
                                    on a.PRD_SEG3 = to_char(b.PRD_SEG3)
                                    and a.qty = b.qty
                                    and a.week = b.week
                                    ) b
                                on a.PRD_SEG3 = to_char(b.PRD_SEG3)
                                and a.qty = b.qty
                                and a.week = b.week
                                ) b
                            on a.PRD_SEG3 = to_char(b.PRD_SEG3)
                            and a.qty = b.qty
                            and a.week = b.week
                            ) b
                        on a.PRD_SEG3 = to_char(b.PRD_SEG3)
                        and a.qty = b.qty
                        and a.week = b.week
                        where 1=1
                        and a.PRD_SEG3 not in ('HAITEAM')
                        )
                    )
                )a
            left join
                (
                select PRD_SEG3,
                       case when avg(FCST_W6+FCST_W5+FCST_W4+FCST_W3+FCST_W2+FCST_W1)/6 is null 
                                 then avg(nvl(FCST_W6,0)+nvl(FCST_W5,0)+nvl(FCST_W4,0)+nvl(FCST_W3,0)+nvl(FCST_W2,0)+nvl(FCST_W1,0))/sum(nvl2(FCST_W6,1,0)+nvl2(FCST_W5,1,0)+nvl2(FCST_W4,1,0)+nvl2(FCST_W3,1,0)+nvl2(FCST_W2,1,0)+nvl2(FCST_W1,1,0))
                                 else avg(FCST_W6+FCST_W5+FCST_W4+FCST_W3+FCST_W2+FCST_W1)/6
                                 end as FCST_AVG
                from(       
                    select a.PRD_SEG1, 
                           a.PRD_SEG2, 
                           LPAD(a.PRD_SEG3, 5, '1') as PRD_SEG3,
                           to_char(a.YEAR)|| to_char(a.WEEK) as TARGETWEEK,
                           a.YEAR, 
                           a.WEEK, 
                           a.QTY,
                           b.FCST_W6,
                           b.FCST_W5,
                           b.FCST_W4,
                           b.FCST_W3,
                           b.FCST_W2,
                           a.OUTFCST AS FCST_W1
                        from kopo_final_1week a
                        left join(
                            select a.PRD_SEG1, 
                                   a.PRD_SEG2, 
                                   a.PRD_SEG3, 
                                   a.YEAR, 
                                   a.WEEK, 
                                   a.QTY,
                                   b.FCST_W6,
                                   b.FCST_W5,
                                   b.FCST_W4,
                                   b.FCST_W3,
                                   a.OUTFCST AS FCST_W2
                            from kopo_final_2week a
                            left join (
                                select a.PRD_SEG1, 
                                       a.PRD_SEG2, 
                                       a.PRD_SEG3, 
                                       a.YEAR, 
                                       a.WEEK, 
                                       a.QTY,
                                       b.FCST_W6,
                                       b.FCST_W5,
                                       b.FCST_W4,
                                       a.OUTFCST AS FCST_W3
                                from kopo_final_3week a
                                left join(
                                    select a.PRD_SEG1, 
                                           a.PRD_SEG2, 
                                           a.PRD_SEG3, 
                                           a.YEAR, 
                                           a.WEEK, 
                                           a.QTY,
                                           b.FCST_W6,
                                           b.FCST_W5,
                                           a.OUTFCST AS FCST_W4
                                    from kopo_final_4week a
                                    left join(
                                        select a.PRD_SEG1, 
                                               a.PRD_SEG2, 
                                               a.PRD_SEG3, 
                                               a.YEAR, 
                                               a.WEEK, 
                                               a.QTY,
                                               b.FCST_W6,
                                               a.OUTFCST AS FCST_W5
                                        from kopo_final_5week a
                                        left join(
                                            select PRD_SEG1, 
                                                   PRD_SEG2, 
                                                   PRD_SEG3, 
                                                   YEAR, 
                                                   WEEK, 
                                                   QTY,
                                                   OUTFCST AS FCST_W6
                                            from kopo_final_6week
                                            ) b
                                        on a.PRD_SEG3 = to_char(b.PRD_SEG3)
                                        and a.qty = b.qty
                                        and a.week = b.week
                                        ) b
                                    on a.PRD_SEG3 = to_char(b.PRD_SEG3)
                                    and a.qty = b.qty
                                    and a.week = b.week
                                    ) b
                                on a.PRD_SEG3 = to_char(b.PRD_SEG3)
                                and a.qty = b.qty
                                and a.week = b.week
                                ) b
                            on a.PRD_SEG3 = to_char(b.PRD_SEG3)
                            and a.qty = b.qty
                            and a.week = b.week
                            ) b
                        on a.PRD_SEG3 = to_char(b.PRD_SEG3)
                        and a.qty = b.qty
                        and a.week = b.week
                        where 1=1
                        and a.PRD_SEG3 not in ('HAITEAM')
                    )
                group by PRD_SEG3
                ) b
                on a.PRD_SEG3=b.PRD_SEG3
            )a
        left join 
            (
            select PRD_SEG3,
                   case when avg(ACC8W_QTY_W6+ACC8W_QTY_W5+ACC8W_QTY_W4+ACC8W_QTY_W3+ACC8W_QTY_W2+ACC8W_QTY_W1)/6 is null then 0
                   else avg(ACC8W_QTY_W6+ACC8W_QTY_W5+ACC8W_QTY_W4+ACC8W_QTY_W3+ACC8W_QTY_W2+ACC8W_QTY_W1) / 6
                   end as ACC_AVG
            from(
                select PRD_SEG1,
                       PRD_SEG2,
                       PRD_SEG3,
                       TARGETWEEK,
                       YEAR,
                       WEEK,
                       QTY,
                       FCST_W6,
                       FCST_W5,
                       FCST_W4,
                       FCST_W3,
                       FCST_W2,
                       FCST_W1,
                       ABS8W_W6,
                       ABS8W_W5,
                       ABS8W_W4,
                       ABS8W_W3,
                       ABS8W_W2,
                       ABS8W_W1,
                       ACC8W_W6,
                       ACC8W_W5,
                       ACC8W_W4,
                       ACC8W_W3,
                       ACC8W_W2,
                       ACC8W_W1,
                       case when FCST_W6 is null or ACC8W_W6 is null then 0
                            else FCST_W6*ACC8W_W6
                            end as ACC8W_QTY_W6,
                       case when FCST_W5 is null or ACC8W_W5 is null then 0
                            else FCST_W5*ACC8W_W5
                            end as ACC8W_QTY_W5,
                       case when FCST_W4 is null or ACC8W_W4 is null then 0
                            else FCST_W4*ACC8W_W4
                            end as ACC8W_QTY_W4,
                       case when FCST_W3 is null or ACC8W_W3 is null then 0
                            else FCST_W3*ACC8W_W3
                            end as ACC8W_QTY_W3,
                       case when FCST_W2 is null or ACC8W_W2 is null then 0
                            else FCST_W2*ACC8W_W2
                            end as ACC8W_QTY_W2,
                       case when FCST_W1 is null or ACC8W_W1 is null then 0
                            else FCST_W1*ACC8W_W1
                            end as ACC8W_QTY_W1
                from(
                    select PRD_SEG1,
                           PRD_SEG2,
                           PRD_SEG3,
                           TARGETWEEK,
                           YEAR,
                           WEEK,
                           QTY,
                           FCST_W6,
                           FCST_W5,
                           FCST_W4,
                           FCST_W3,
                           FCST_W2,
                           FCST_W1,
                           ABS8W_W6,
                           ABS8W_W5,
                           ABS8W_W4,
                           ABS8W_W3,
                           ABS8W_W2,
                           ABS8W_W1,
                           case when FCST_W6 is null or QTY is null then 0
                                when FCST_W6=0 or QTY =0 then 0
                                when (QTY/FCST_W6) > 2 then 0
                                else 1-(ABS8W_W6/FCST_W6)
                                end as ACC8W_W6,
                           case when FCST_W5 is null or QTY is null then 0
                                when FCST_W5=0 or QTY =0 then 0
                                when (QTY/FCST_W5) > 2 then 0
                                else 1-(ABS8W_W5/FCST_W5)
                                end as ACC8W_W5,
                           case when FCST_W4 is null or QTY is null then 0
                                when FCST_W4=0 or QTY =0 then 0
                                when (QTY/FCST_W4) > 2 then 0
                                else 1-(ABS8W_W4/FCST_W4)
                                end as ACC8W_W4,
                           case when FCST_W3 is null or QTY is null then 0
                                when FCST_W3=0 or QTY =0 then 0
                                when (QTY/FCST_W3) > 2 then 0
                                else 1-(ABS8W_W3/FCST_W3)
                                end as ACC8W_W3,
                           case when FCST_W2 is null or QTY is null then 0
                                when FCST_W2=0 or QTY =0 then 0
                                when (QTY/FCST_W2) > 2 then 0
                                else 1-(ABS8W_W2/FCST_W2)
                                end as ACC8W_W2,
                           case when FCST_W1 is null or QTY is null then 0
                                when FCST_W1=0 or QTY =0 then 0
                                when (QTY/FCST_W1) > 2 then 0
                                else 1-(ABS8W_W1/FCST_W1)
                                end as ACC8W_W1
                    from(
                        select a.PRD_SEG1, 
                               a.PRD_SEG2, 
                               LPAD(a.PRD_SEG3, 5, '1') as PRD_SEG3,
                               to_char(a.YEAR)|| to_char(a.WEEK) as TARGETWEEK,
                               a.YEAR, 
                               a.WEEK, 
                               a.QTY,
                               b.FCST_W6,
                               b.FCST_W5,
                               b.FCST_W4,
                               b.FCST_W3,
                               b.FCST_W2,
                               a.OUTFCST AS FCST_W1,
                               case when abs(a.QTY-b.FCST_w6) is null then a.qty
                                    else abs(a.QTY-b.FCST_w6)
                                    end as ABS8W_W6,
                               case when abs(a.QTY-b.FCST_w5) is null then a.qty
                                    else abs(a.QTY-b.FCST_w5)
                                    end as ABS8W_W5,
                               case when abs(a.QTY-b.FCST_w4) is null then a.qty
                                    else abs(a.QTY-b.FCST_w4)
                                    end as ABS8W_W4,
                               case when abs(a.QTY-b.FCST_w3) is null then a.qty
                                    else abs(a.QTY-b.FCST_w3)
                                    end as ABS8W_W3,
                               case when abs(a.QTY-b.FCST_w2) is null then a.qty
                                    else abs(a.QTY-b.FCST_w2)
                                    end as ABS8W_W2,
                                case when abs(a.QTY-a.OUTFCST) is null then a.qty
                                    else abs(a.QTY-a.OUTFCST)
                                    end as ABS8W_W1
                        from kopo_final_1week a
                        left join(
                            select a.PRD_SEG1, 
                                   a.PRD_SEG2, 
                                   a.PRD_SEG3, 
                                   a.YEAR, 
                                   a.WEEK, 
                                   a.QTY,
                                   b.FCST_W6,
                                   b.FCST_W5,
                                   b.FCST_W4,
                                   b.FCST_W3,
                                   a.OUTFCST AS FCST_W2
                            from kopo_final_2week a
                            left join (
                                select a.PRD_SEG1, 
                                       a.PRD_SEG2, 
                                       a.PRD_SEG3, 
                                       a.YEAR, 
                                       a.WEEK, 
                                       a.QTY,
                                       b.FCST_W6,
                                       b.FCST_W5,
                                       b.FCST_W4,
                                       a.OUTFCST AS FCST_W3
                                from kopo_final_3week a
                                left join(
                                    select a.PRD_SEG1, 
                                           a.PRD_SEG2, 
                                           a.PRD_SEG3, 
                                           a.YEAR, 
                                           a.WEEK, 
                                           a.QTY,
                                           b.FCST_W6,
                                           b.FCST_W5,
                                           a.OUTFCST AS FCST_W4
                                    from kopo_final_4week a
                                    left join(
                                        select a.PRD_SEG1, 
                                               a.PRD_SEG2, 
                                               a.PRD_SEG3, 
                                               a.YEAR, 
                                               a.WEEK, 
                                               a.QTY,
                                               b.FCST_W6,
                                               a.OUTFCST AS FCST_W5
                                        from kopo_final_5week a
                                        left join(
                                            select PRD_SEG1, 
                                                   PRD_SEG2, 
                                                   PRD_SEG3, 
                                                   YEAR, 
                                                   WEEK, 
                                                   QTY,
                                                   OUTFCST AS FCST_W6
                                            from kopo_final_6week
                                            ) b
                                        on a.PRD_SEG3 = to_char(b.PRD_SEG3)
                                        and a.qty = b.qty
                                        and a.week = b.week
                                        ) b
                                    on a.PRD_SEG3 = to_char(b.PRD_SEG3)
                                    and a.qty = b.qty
                                    and a.week = b.week
                                    ) b
                                on a.PRD_SEG3 = to_char(b.PRD_SEG3)
                                and a.qty = b.qty
                                and a.week = b.week
                                ) b
                            on a.PRD_SEG3 = to_char(b.PRD_SEG3)
                            and a.qty = b.qty
                            and a.week = b.week
                            ) b
                        on a.PRD_SEG3 = to_char(b.PRD_SEG3)
                        and a.qty = b.qty
                        and a.week = b.week
                        where 1=1
                        and a.PRD_SEG3 not in ('HAITEAM')
                        )
                    )
                )
            group by PRD_SEG3
            )b
        on a.PRD_SEG3=b.PRD_SEG3
        )
    group by PRD_SEG2)
    order by PRD_SEG2;