-- 查詢學過編號“01”並且也學過編號“02”課程的同學的學號、姓名

--sol1
SELECT s.s_id, s.s_name
FROM student s 
WHERE s.s_id in (
	SELECT s_id FROM score WHERE c_id='01')
AND s.s_id in (
	SELECT s_id FROM score WHERE c_id='02')

-- Sol2 : intersect 交集
SELECT s.s_id, s.s_name
FROM student s JOIN score sc ON s.s_id = sc.s_id
WHERE sc.c_id = '01'
INTERSECT
SELECT s.s_id, s.s_name
FROM student s JOIN score sc ON s.s_id = sc.s_id
WHERE sc.c_id = '02'