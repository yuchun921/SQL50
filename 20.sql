/* �d�߾ǥͪ��`���Z�öi��ƦW */
SELECT s.s_id, s.s_name, SUM(sc.s_score) AS [Sum Score],
RANK() OVER(ORDER BY SUM(sc.s_score) DESC) AS [Rank]
FROM student s LEFT JOIN score sc ON s.s_id = sc.s_id
GROUP BY s.s_id, s.s_name

/* ���U�즨�Z�i��ƧǡA����ܱƦW(���Irow_number) */
SELECT ROW_NUMBER() OVER(PARTITION BY c_id ORDER BY s_score DESC) AS [RANK], s.s_id, s.s_name, sc.c_id, sc.s_score
FROM score sc join student s ON sc.s_id = s.s_id;
