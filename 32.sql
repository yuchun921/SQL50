/* 查詢每門課程的平均成績，結果按平均成績升序排列，平均成績相同時，按課程號降序排列 */
SELECT c.c_name, AVG(sc.s_score) AS [Avg Score]
FROM course c JOIN score sc ON c.c_id = sc.c_id
GROUP BY c.c_name, c.c_id
ORDER BY AVG(sc.s_score) ASC, c.c_id DESC;