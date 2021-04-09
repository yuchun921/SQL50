/* 查詢同名同性學生名單，並統計同名人數 */
SELECT s_id, s_name, COUNT(s_sex) AS [是否同名同性別]
FROM student
GROUP BY s_id, s_name
