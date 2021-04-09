/* �d�ߤ��P�Ѯv�ұФ��P�ҵ{�������q����C��� */
Select t.t_name, c_name, AVG(sc.s_score) AS [AVG Score]
FROM teacher t JOIN course c ON t.t_id = c.t_id
JOIN score sc ON c.c_id = sc.c_id
GROUP BY t.t_name, c_name
ORDER BY AVG(sc.s_score) DESC;