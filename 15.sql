-- 查詢兩門及其以上不及格課程的同學的學號，姓名及其平均成績
SELECT s.s_id, s.s_name, AVG(sc.s_score) AS [Avg Score]
FROM student s join score sc ON s.s_id = sc.s_id
WHERE sc.s_score < 60
GROUP BY s.s_id,s.s_name
HAVING COUNT(sc.c_id)>1