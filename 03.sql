-- �d�ߩҦ��P�Ǫ��Ǹ��B�m�W�B��ҼơB�`���Z
SELECT s.s_id as [ID], s.s_name as [Name], COUNT(sc.s_score) as [Num of course], SUM(sc.s_score) as [Sum of score]
FROM student s left join score sc ON s.s_id = sc.s_id
GROUP BY s.s_id, s.s_name