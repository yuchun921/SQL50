-- �d�߽ҵ{���Z�p��60�����Ҧ��P�ǾǸ��B�m�W
SELECT  s.s_id, s.s_name
FROM student s LEFT JOIN score sc ON s.s_id = sc.s_id
GROUP BY s.s_id, s.s_name
HAVING MAX(sc.s_score) < 60


