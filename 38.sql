/* �d�߽ҵ{�s����03�B�ҵ{���Z�b80���H�W���ǥͪ��Ǹ��M�m�W */
SELECT s.s_id, s.s_name, sc.s_score
FROM student s JOIN score sc ON s.s_id = sc.s_id
JOIN course c ON sc.c_id = c.c_id
WHERE sc.c_id = '03' AND sc.s_score >= 80