-- �d�ߨS�ǹL���i�T���Ѯv�Ҫ��P�Ǫ��Ǹ��B�m�W
SELECT s.s_id, s.s_name
FROM student s 
WHERE s.s_id NOT IN (
	SELECT sc.s_id
	FROM score sc 
	JOIN course c ON sc.c_id = c.c_id
	JOIN teacher t ON c.t_id = t.t_id
	WHERE t.t_name = '�i�T')

-- subquery��X�S�ǹL�i�T�Ҫ��ǥ�