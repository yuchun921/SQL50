/* �d�ߦU�ǥͪ��~�� */
/* SYSDATETIME() / getdate() ���i�H�o��ثe�ɶ� */
SELECT s_id, s_name, YEAR(getdate())-YEAR(s_birth) AS [Age]
FROM student