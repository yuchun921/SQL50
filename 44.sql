/* 檢索至少選修兩門課程的學生學號 */
SELECT s.s_id, s.s_name, COUNT(s.s_id) AS [課程數量]
FROM student s LEFT JOIN score sc ON s.s_id = sc.s_id
GROUP BY s.s_id, s.s_name
HAVING COUNT(s.s_id) >= 2