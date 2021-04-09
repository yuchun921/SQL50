/* �d�߾ǥͥ������Z�Ψ�W�� */
SELECT s.s_id, s.s_name, AVG(sc.s_score) AS [Avg Score], DENSE_RANK() OVER(ORDER BY AVG(sc.s_score) DESC) AS [RANK]
FROM student s LEFT JOIN score sc ON s.s_id = sc.s_id
GROUP BY s.s_id, s.s_name