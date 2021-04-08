-- 查詢和”01”號的同學學習的課程完全相同的其他同學的學號和姓名
SELECT s.s_id, s.s_name
FROM student s JOIN score sc ON s.s_id = sc.s_id
WHERE s.s_id != '01'
GROUP BY s.s_id, s.s_name
HAVING COUNT(sc.c_id) = (SELECT COUNT(sc.c_id) FROM score sc WHERE sc.s_id = '01')