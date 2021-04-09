-- 按各科平均成績從低到高和及格率的百分數從高到低順序
SELECT c.c_id, c.c_name, AVG(sc.s_score) AS [Avg score],
AVG(case when sc.s_score >= 60 then 1.0 else 0.0 end ) as [Passrate]
FROM course c JOIN score sc ON c.c_id = sc.c_id
GROUP BY c.c_id, c.c_name
ORDER BY AVG(sc.s_score) ASC, AVG(case when sc.s_score >= 60 then 1.0 else 0.0 end ) DESC;