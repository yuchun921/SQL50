/* �d�߽ҵ{�s������01���B�ҵ{���Z�b60���H�W���ǥͪ��Ǹ��M�m�W */
SELECT s.s_id, s.s_name, sc.s_score
FROM student s LEFT JOIN score sc ON s.s_id = sc.s_id
WHERE sc.c_id = '01' AND sc.s_score >= 60