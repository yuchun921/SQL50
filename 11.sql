-- �d�ߦܤ֦��@���һP�Ǹ�����01�����P�ǩҾǬۦP���P�Ǫ��Ǹ��M�m�W
SELECT DISTINCT s.s_id, s.s_name
FROM student s LEFT JOIN score sc ON s.s_id = sc.s_id
WHERE sc.c_id IN (
	SELECT sc.c_id FROM score sc WHERE sc.s_id = '01')
AND sc.s_id != '01'