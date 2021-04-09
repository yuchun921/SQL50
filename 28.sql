/* 查詢男生、女生人數 */
SELECT s_sex, COUNT(s_sex) AS [男女人數]
FROM student
GROUP BY s_sex