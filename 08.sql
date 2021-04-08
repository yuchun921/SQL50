-- �d�߽ҵ{�s����01�������Z��ҵ{�s����02���ҵ{�C���Ҧ��P�Ǫ��Ǹ��B�m�W

--sol1
SELECT s.s_id, s.s_name
FROM student s join score sc1 ON s.s_id = sc1.s_id
JOIN score sc2 ON s.s_id = sc2.s_id
WHERE sc1.c_id='01' AND sc2.c_id ='02' AND sc1.s_score < sc2.s_score

--sol2
SELECT s_id,s_name 
FROM student 
WHERE s_id in
(
SELECT s1.s_id 
FROM (SELECT s_id,sc.s_score FROM score sc WHERE c_id = '01') s1,
(SELECT s_id,sc.s_score FROM score sc WHERE c_id = '02') s2
WHERE s1.s_id = s2.s_id and s1.s_score < s2.s_score)