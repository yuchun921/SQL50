/* 查詢所有學生的課程及分數情況 */
SELECT s.s_id, s.s_name, SUM(case when sc.c_id=01 then sc.s_score else null end) '01',
SUM(case when sc.c_id=02 then sc.s_score else null end) '02',
SUM(case when sc.c_id=03 then sc.s_score else null end) '03'
FROM student s LEFT JOIN score sc ON s.s_id = sc.s_id
GROUP BY s.s_id, s.s_name