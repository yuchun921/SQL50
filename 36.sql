/* �d�ߥ���@���ҵ{���Z�b70���H�W���m�W�B�ҵ{�W�٩M���� */
SELECT s.s_name, c.c_name, sc.s_score
FROM student s JOIN score sc ON s.s_id = sc.s_id
JOIN course c ON sc.c_id = c.c_id
WHERE sc.s_score >= 70