/* �d�ߦP�W�P�ʾǥͦW��A�òέp�P�W�H�� */
SELECT s_id, s_name, COUNT(s_sex) AS [�O�_�P�W�P�ʧO]
FROM student
GROUP BY s_id, s_name
