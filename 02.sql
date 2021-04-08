-- 查詢平均成績大於60分的學生的學號和平均成績
SELECT s_id, Avg(s_score) as AvgScore
FROM score 
GROUP BY s_id
HAVING Avg(s_score)>60
