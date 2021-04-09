/* 查詢每門課程被選修的學生數 */
SELECT c.c_name, COUNT(sc.s_id) AS [選修人數]
FROM course c join score sc ON c.c_id =sc.c_id
GROUP BY c.c_name