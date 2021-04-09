/* 查詢任何一門課程成績在70分以上的姓名、課程名稱和分數 */
SELECT s.s_name, c.c_name, sc.s_score
FROM student s JOIN score sc ON s.s_id = sc.s_id
JOIN course c ON sc.c_id = c.c_id
WHERE sc.s_score >= 70