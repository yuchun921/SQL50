-- �d�߽ҵ{�s������01�����ҵ{��02�����ҵ{���Z�����Ҧ��ǥͪ��Ǹ��B�m�W
select s.s_id, s.s_name, sc.c_id, sc.s_score, sc1.c_id, sc1.s_score
from student s join score sc on s.s_id = sc.s_id
join score sc1 on s.s_id = sc1.s_id
where sc.c_id = '01' and sc1.c_id = '02' and  sc.s_score > sc1.s_score