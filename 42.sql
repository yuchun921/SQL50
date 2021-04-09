/* 查詢每門功課成績最好的前兩名 */
-- DENSE RANK()

SELECT * FROM (
	SELECT s.s_id, s.s_name, sc.c_id, sc.s_score, DENSE_RANK() OVER (PARTITION BY sc.c_id ORDER BY sc.s_score DESC) AS [RANK]
	FROM student s JOIN score sc ON s.s_id = sc.s_id) AS SUB
WHERE [RANK] IN (1,2)