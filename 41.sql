/* 查詢不同課程成績相同的學生的學生編號、課程編號、學生成績 */
SELECT DISTINCT sc1.s_id, s.s_name, sc1.c_id, sc1.s_score
FROM student s JOIN score sc1 ON s.s_id = sc1.s_id
JOIN score sc2 ON s.s_id = sc2.s_id
WHERE sc1.c_id != sc2.c_id AND sc1.s_score = sc2.s_score
