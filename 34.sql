/* 查詢課程編號為”01”且課程成績在60分以上的學生的學號和姓名 */
SELECT s.s_id, s.s_name, sc.s_score
FROM student s LEFT JOIN score sc ON s.s_id = sc.s_id
WHERE sc.c_id = '01' AND sc.s_score >= 60