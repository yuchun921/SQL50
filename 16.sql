-- 檢索”01”課程分數小於60，按分數降序排列的學生資訊
SELECT s.*, sc.s_score
FROM student s JOIN score sc ON s.s_id = sc.s_id
WHERE sc.c_id = '01' AND sc.s_score < 60
ORDER BY sc.s_score DESC;