-- �d�ߩM��01�������P�Ǿǲߪ��ҵ{�����ۦP����L�P�Ǫ��Ǹ��M�m�W
SELECT s.s_id, s.s_name
FROM student s JOIN score sc ON s.s_id = sc.s_id
WHERE s.s_id != '01'
GROUP BY s.s_id, s.s_name
HAVING COUNT(sc.c_id) = (SELECT COUNT(sc.c_id) FROM score sc WHERE sc.s_id = '01')