-- �d�ߦU�즨�Z�̰����B�̧C���M������
-- �H�p�U�Φ���ܡG�ҵ{ID, �ҵ{name, �̰���, �̧C��, ������, �ή�v
SELECT c.c_id, c.c_name, MAX(sc.s_score) AS [Max score], MIN(sc.s_score) AS [Min score], AVG(sc.s_score) AS [Avg score],
AVG(case when sc.s_score >= 60 then 1.0 else 0.0 end ) as [Passrate]
FROM course c JOIN score sc ON c.c_id = sc.c_id
GROUP BY c.c_id, c.c_name
ORDER BY COUNT(c.c_id), c_id ASC;