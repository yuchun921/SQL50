-- �˯���01���ҵ{���Ƥp��60�A�����ƭ��ǱƦC���ǥ͸�T
SELECT s.*, sc.s_score
FROM student s JOIN score sc ON s.s_id = sc.s_id
WHERE sc.c_id = '01' AND sc.s_score < 60
ORDER BY sc.s_score DESC;