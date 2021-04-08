-- 查詢姓“李”的老師的個數
SELECT count(t_name) as [Num of Lee]
FROM teacher
WHERE t_name like '李%'