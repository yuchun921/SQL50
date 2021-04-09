/* �d�߿�פF�����ҵ{���ǥͫH�� */

-- Solution 1
SELECT s.s_id, s.s_name, COUNT(sc.c_id) AS [�ҵ{�ƶq]
FROM student s LEFT JOIN score sc ON s.s_id = sc.s_id
GROUP BY s.s_id, s.s_name
HAVING COUNT(sc.c_id) = 3 --�@�T����

-- Solution 2
SELECT s.s_id, s.s_name, COUNT(sc.c_id) AS [�ҵ{�ƶq]
FROM student s LEFT JOIN score sc ON s.s_id = sc.s_id
GROUP BY s.s_id, s.s_name
HAVING COUNT(sc.c_id) = (SELECT COUNT(c_id) FROM course)