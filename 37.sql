/* �d�߽ҵ{�W�٬����ƾǡ��A�B���ƧC��60���ǥͩm�W�M���� */
SELECT s.s_name, sc.s_score
FROM student s JOIN score sc ON s.s_id = sc.s_id
JOIN course c ON sc.c_id = c.c_id
WHERE c.c_name = '�ƾ�' AND sc.s_score < 60