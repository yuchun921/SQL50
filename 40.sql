/* �d�߿�ס��i�T���Ѯv�ұ½ҵ{���ǥͤ��A���Z�̰����ǥͩm�W�Ψ䦨�Z*/

-- Solution 2
SELECT TOP 1 s.s_name, sc.s_score
FROM student s JOIN score sc ON s.s_id = sc.s_id
JOIN course c ON sc.c_id = c.c_id
JOIN teacher t ON c.t_id =t.t_id
WHERE t.t_name = '�i�T'

-- Solution 2
SELECT s_name, s_score FROM (
	SELECT s.s_name, sc.s_score, DENSE_RANK() OVER(ORDER BY sc.s_score DESC) AS [RANK]
FROM student s JOIN score sc ON s.s_id = sc.s_id
JOIN course c ON sc.c_id = c.c_id
JOIN teacher t ON c.t_id =t.t_id 
WHERE t.t_name = '�i�T' ) AS sub
WHERE [Rank] = 1
