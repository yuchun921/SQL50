/* 查詢所有課程的成績第2名到第3名的學生信息及該課程成績 */
SELECT *
FROM (
	SELECT s.s_id, s.s_name, sc.c_id, sc.s_score, Dense_Rank() OVER (PARTITION BY sc.c_id ORDER BY sc.s_score DESC) AS [RANK]
	FROM student s JOIN score sc ON s.s_id = sc.s_id) AS sub
WHERE sub.[RANK] in (2,3)

-- Dense_Rank() > 若有同個排名，之後仍繼續。(EX:有兩個第一名，下一個會是第二名，不會跳三)