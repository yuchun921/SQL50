-- �d�ߨS�ǹL���i�T���Ѯv���ª����@���ҵ{���ǥ͡B�m�W
SELECT s.s_id, s.s_name
FROM student s 
WHERE s.s_id not in (
	SELECT sc.s_id FROM score sc 
	JOIN course c ON sc.c_id = c.c_id
	JOIN teacher t ON c.t_id = t.t_id
	WHERE t.t_name = '�i�T' )

