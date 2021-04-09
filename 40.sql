/* 查詢選修“張三”老師所授課程的學生中，成績最高的學生姓名及其成績*/

-- Solution 2
SELECT TOP 1 s.s_name, sc.s_score
FROM student s JOIN score sc ON s.s_id = sc.s_id
JOIN course c ON sc.c_id = c.c_id
JOIN teacher t ON c.t_id =t.t_id
WHERE t.t_name = '張三'

-- Solution 2
SELECT s_name, s_score FROM (
	SELECT s.s_name, sc.s_score, DENSE_RANK() OVER(ORDER BY sc.s_score DESC) AS [RANK]
FROM student s JOIN score sc ON s.s_id = sc.s_id
JOIN course c ON sc.c_id = c.c_id
JOIN teacher t ON c.t_id =t.t_id 
WHERE t.t_name = '張三' ) AS sub
WHERE [Rank] = 1
