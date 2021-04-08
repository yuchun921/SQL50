-- 查詢課程成績小於60分的所有同學學號、姓名
SELECT  s.s_id, s.s_name
FROM student s LEFT JOIN score sc ON s.s_id = sc.s_id
GROUP BY s.s_id, s.s_name
HAVING MAX(sc.s_score) < 60


