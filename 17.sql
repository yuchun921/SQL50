-- 按平均成績從高到低顯示所有學生的平均成績
SELECT s.s_id, s.s_name, AVG(sc.s_score) as [Avg Score]
FROM student s LEFT JOIN score sc ON s.s_id = sc.s_id
GROUP BY s.s_id, s.s_name
ORDER BY AVG(sc.s_score) DESC