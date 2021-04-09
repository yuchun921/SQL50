/* 查詢出只選修了一門課程的全部學生的學號和姓名 */
SELECT s.s_id, s.s_name, COUNT(s.s_id) AS [課程數量]
FROM student s LEFT JOIN score sc ON s.s_id = sc.s_id
GROUP BY s.s_id, s.s_name
HAVING COUNT(s.s_id) = 1
