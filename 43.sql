/* 統計每門課程的學生選修人數（超過5人的課程才統計）。
 * 要求輸出課程號和選修人數，查詢結果按人數降序排列，若人數相同，按課程號升序排列  */

SELECT c_id, count(s_id) AS [選課人數]
FROM score
GROUP BY c_id
HAVING count(s_id) > 5
ORDER BY count(s_id) DESC, c_id ASC;