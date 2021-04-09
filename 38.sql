/* 查詢課程編號為03且課程成績在80分以上的學生的學號和姓名 */
SELECT s.s_id, s.s_name, sc.s_score
FROM student s JOIN score sc ON s.s_id = sc.s_id
JOIN course c ON sc.c_id = c.c_id
WHERE sc.c_id = '03' AND sc.s_score >= 80