/* 查詢不及格的課程，並按課程號從大到小排列 */
SELECT s.s_name, sc.c_id, c.c_name, sc.s_score
FROM student s LEFT JOIN score sc ON s.s_id = sc.s_id
JOIN course c ON sc.c_id = c.c_id
WHERE sc.s_score < 60
ORDER BY sc.c_id DESC;