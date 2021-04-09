/* 統計各科成績各分數段人數：課程編號,課程名稱,[100-85],[85-70],[70-60],[0-60]及所佔百分比 */
SELECT sc.c_id, c.c_name, count(sc.s_id) AS [Num of Student],
SUM(CASE WHEN sc.s_score<60 THEN 1 else 0 END) AS [0-59],
SUM(CASE WHEN sc.s_score<60 THEN 1.0 else 0.0 END) /COUNT(sc.s_id) AS [0-59 percentage],
SUM(CASE WHEN sc.s_score>=60 AND sc.s_score < 70 THEN 1 else 0 END) AS [60-69],
SUM(CASE WHEN sc.s_score>=60 AND sc.s_score < 70 THEN 1.0 else 0.0 END)/COUNT(sc.s_id) AS [60-69 percentage],
SUM(CASE WHEN sc.s_score>=70 AND sc.s_score < 85 THEN 1 else 0 END) AS [70-84],
SUM(CASE WHEN sc.s_score>=70 AND sc.s_score < 85 THEN 1.0 else 0.0 END)/COUNT(sc.s_id) AS [70-84 percentage],
SUM(CASE WHEN sc.s_score>=85 AND sc.s_score <= 100 THEN 1 else 0 END) AS [85-100],
SUM(CASE WHEN sc.s_score>=85 AND sc.s_score <= 100 THEN 1.0 else 0.0 END)/COUNT(sc.s_id) AS [85-100 percentage]
FROM score sc JOIN course c ON sc.c_id = c.c_id
GROUP BY sc.c_id, c.c_name