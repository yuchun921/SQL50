/* 琩高揭祘嘿〃计厩〃だ计60厩ネ﹎㎝だ计 */
SELECT s.s_name, sc.s_score
FROM student s JOIN score sc ON s.s_id = sc.s_id
JOIN course c ON sc.c_id = c.c_id
WHERE c.c_name = '计厩' AND sc.s_score < 60