/* �d�ߨC���ҵ{�Q��ת��ǥͼ� */
SELECT c.c_name, COUNT(sc.s_id) AS [��פH��]
FROM course c join score sc ON c.c_id =sc.c_id
GROUP BY c.c_name