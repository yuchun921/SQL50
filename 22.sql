/* �d�ߩҦ��ҵ{�����Z��2�W���3�W���ǥͫH���θӽҵ{���Z */
SELECT *
FROM (
	SELECT s.s_id, s.s_name, sc.c_id, sc.s_score, Dense_Rank() OVER (PARTITION BY sc.c_id ORDER BY sc.s_score DESC) AS [RANK]
	FROM student s JOIN score sc ON s.s_id = sc.s_id) AS sub
WHERE sub.[RANK] in (2,3)

-- Dense_Rank() > �Y���P�ӱƦW�A���ᤴ�~��C(EX:����ӲĤ@�W�A�U�@�ӷ|�O�ĤG�W�A���|���T)