-- �d�ߥ������Z�j��60�����ǥͪ��Ǹ��M�������Z
SELECT s_id, Avg(s_score) as AvgScore
FROM score 
GROUP BY s_id
HAVING Avg(s_score)>60
