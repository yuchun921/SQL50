/* 查詢各學生的年齡 */
/* SYSDATETIME() / getdate() 都可以得到目前時間 */
SELECT s_id, s_name, YEAR(getdate())-YEAR(s_birth) AS [Age]
FROM student