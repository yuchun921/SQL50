-- �d�ߨ���Ψ�H�W���ή�ҵ{���P�Ǫ��Ǹ��A�m�W�Ψ䥭�����Z
SELECT s.s_id, s.s_name, AVG(sc.s_score) AS [Avg Score]
FROM student s join score sc ON s.s_id = sc.s_id
WHERE sc.s_score < 60
GROUP BY s.s_id,s.s_name
HAVING COUNT(sc.c_id)>1