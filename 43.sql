/* �έp�C���ҵ{���ǥͿ�פH�ơ]�W�L5�H���ҵ{�~�έp�^�C
 * �n�D��X�ҵ{���M��פH�ơA�d�ߵ��G���H�ƭ��ǱƦC�A�Y�H�ƬۦP�A���ҵ{���ɧǱƦC  */

SELECT c_id, count(s_id) AS [��ҤH��]
FROM score
GROUP BY c_id
HAVING count(s_id) > 5
ORDER BY count(s_id) DESC, c_id ASC;