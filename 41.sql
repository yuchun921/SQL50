/* �d�ߤ��P�ҵ{���Z�ۦP���ǥͪ��ǥͽs���B�ҵ{�s���B�ǥͦ��Z */
SELECT DISTINCT sc1.s_id, s.s_name, sc1.c_id, sc1.s_score
FROM student s JOIN score sc1 ON s.s_id = sc1.s_id
JOIN score sc2 ON s.s_id = sc2.s_id
WHERE sc1.c_id != sc2.c_id AND sc1.s_score = sc2.s_score
