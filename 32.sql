/* �d�ߨC���ҵ{���������Z�A���G���������Z�ɧǱƦC�A�������Z�ۦP�ɡA���ҵ{�����ǱƦC */
SELECT c.c_name, AVG(sc.s_score) AS [Avg Score]
FROM course c JOIN score sc ON c.c_id = sc.c_id
GROUP BY c.c_name, c.c_id
ORDER BY AVG(sc.s_score) ASC, c.c_id DESC;