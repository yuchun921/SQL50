-- 查詢沒學過“張三”老師課的同學的學號、姓名
SELECT s.s_id, s.s_name
FROM student s 
WHERE s.s_id NOT IN (
	SELECT sc.s_id
	FROM score sc 
	JOIN course c ON sc.c_id = c.c_id
	JOIN teacher t ON c.t_id = t.t_id
	WHERE t.t_name = '張三')

-- subquery找出沒學過張三課的學生