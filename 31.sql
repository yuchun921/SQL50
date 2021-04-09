/* 查詢1990年出生的學生名單 */
SELECT s_name, s_birth 
FROM student 
WHERE YEAR(s_birth) = 1990
