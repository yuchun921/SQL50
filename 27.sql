/* �d�ߥX�u��פF�@���ҵ{�������ǥͪ��Ǹ��M�m�W */
SELECT s.s_id, s.s_name, COUNT(s.s_id) AS [�ҵ{�ƶq]
FROM student s LEFT JOIN score sc ON s.s_id = sc.s_id
GROUP BY s.s_id, s.s_name
HAVING COUNT(s.s_id) = 1
