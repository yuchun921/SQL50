/* 查詢各科成績前三名的記錄 */
SELECT * FROM (
	SELECT s.s_id, s.s_name, sc.c_id, sc.s_score, ROW_NUMBER() OVER(PARTITION BY sc.c_id ORDER BY sc.s_score DESC) AS [RANK]
	FROM student s JOIN score sc ON s.s_id =sc.s_id ) AS SUB
WHERE [RANK] < 4