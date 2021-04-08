-- 查詢沒有修所有課的學生的學號、姓名
SELECT s.s_id, s.s_name
FROM student s LEFT JOIN score sc ON s.s_id = sc.s_id
GROUP BY s.s_id, s.s_name
HAVING COUNT(sc.c_id)<(SELECT COUNT(c_id) FROM course)