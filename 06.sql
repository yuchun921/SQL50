-- �d�߾ǹL���i�T���Ѯv�ұЪ��Ҫ��P�Ǫ��Ǹ��B�m�W�F
SELECT s.s_id, s.s_name
FROM student s JOIN score sc ON s.s_id = sc.s_id 
JOIN course c ON sc.c_id = c.c_id
JOIN teacher t ON c.t_id = t.t_id
WHERE t.t_name = '�i�T'