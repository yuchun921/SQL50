# SQL50

1. :star: 查詢課程編號為“01”的課程比“02”的課程成績高的所有學生的學號、姓名
    ```sql=
    SELECT s.s_id, s.s_name, sc.c_id, sc.s_score, sc1.c_id, sc1.s_score
    FROM student s JOIN score sc on s.s_id = sc.s_id
    JOIN score sc1 on s.s_id = sc1.s_id
    WHERE sc.c_id = '01' and sc1.c_id = '02' and sc.s_score > sc1.s_score
    ```
    ![](https://i.imgur.com/cYOnXTp.png)

2. :star: 查詢平均成績大於60分的學生的學號和平均成績
    ```sql=
    SELECT s_id, Avg(s_score) as AvgScore
    FROM score 
    GROUP BY s_id
    HAVING Avg(s_score)>60
    ```
    ![](https://i.imgur.com/GI0MvmC.png)

3. :star: 查詢所有同學的學號、姓名、選課數、總成績
    ```sql=
    SELECT s.s_id as [ID], s.s_name as [Name], COUNT(sc.s_score) as [Num of course], SUM(sc.s_score) as [Sum of score]
    FROM student s left join score sc ON s.s_id = sc.s_id
    GROUP BY s.s_id, s.s_name
    ```
    ![](https://i.imgur.com/OzeZzZh.png)

4. 查詢姓“李”的老師的個數
    ```sql=
    SELECT count(t_name) as [Num of Lee]
    FROM teacher
    WHERE t_name like '李%'
    ```
    ![](https://i.imgur.com/2sk2UZF.png)

5. :star: 查詢沒學過“張三”老師課的同學的學號、姓名
    ```sql=
    SELECT s.s_id, s.s_name
    FROM student s 
    WHERE s.s_id NOT IN (
        SELECT sc.s_id
        FROM score sc 
        JOIN course c ON sc.c_id = c.c_id
        JOIN teacher t ON c.t_id = t.t_id
        WHERE t.t_name = '張三')
    -- subquery找出沒學過張三課的同學
    ```
    ![](https://i.imgur.com/5QeF15w.png)

6. :star: 查詢學過“張三”老師所教的課的同學的學號、姓名；
    ```sql=
    SELECT s.s_id, s.s_name
    FROM student s JOIN score sc ON s.s_id = sc.s_id 
    JOIN course c ON sc.c_id = c.c_id
    JOIN teacher t ON c.t_id = t.t_id
    WHERE t.t_name = '張三'
    ```
    ![](https://i.imgur.com/WHlTQ1O.png)

7. :star: 查詢學過編號“01”並且也學過編號“02”課程的同學的學號、姓名
    ```sql=
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
    ```
    ![](https://i.imgur.com/y3O6dxW.png)

8. :star: 查詢課程編號“01”的成績比課程編號“02”課程低的所有同學的學號、姓名
    ```sql=
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
    ```
    ![](https://i.imgur.com/jfyEVdv.png)

9. 查詢課程成績小於60分的所有同學學號、姓名
    ```sql=
    SELECT  s.s_id, s.s_name
    FROM student s LEFT JOIN score sc ON s.s_id = sc.s_id
    GROUP BY s.s_id, s.s_name
    HAVING MAX(sc.s_score) < 60
    ```
    ![](https://i.imgur.com/50Gp14u.png)
    
10. :star: 查詢沒有修所有課的學生的學號、姓名
    ```sql=
    SELECT s.s_id, s.s_name
    FROM student s LEFT JOIN score sc ON s.s_id = sc.s_id
    GROUP BY s.s_id, s.s_name
    HAVING COUNT(sc.c_id)<(SELECT COUNT(c_id) FROM course)
    ```
    ![](https://i.imgur.com/r586YnO.png)

11. :star: 查詢至少有一門課與學號為“01”的同學所學相同的同學的學號和姓名
    ```sql=
    SELECT DISTINCT s.s_id, s.s_name
    FROM student s LEFT JOIN score sc ON s.s_id = sc.s_id
    WHERE sc.c_id IN (
        SELECT sc.c_id FROM score sc WHERE sc.s_id = '01')
    AND sc.s_id != '01'
    ```
    ![](https://i.imgur.com/C1EeRfo.png)
    
12. :star: 查詢和”01”號的同學學習的課程完全相同的其他同學的學號和姓名
    ```sql=
    SELECT s.s_id, s.s_name
    FROM student s JOIN score sc ON s.s_id = sc.s_id
    WHERE s.s_id != '01'
    GROUP BY s.s_id, s.s_name
    HAVING COUNT(sc.c_id) = (SELECT COUNT(sc.c_id) FROM score sc WHERE sc.s_id = '01')
    ```
    ![](https://i.imgur.com/Wmtjwxp.png)
13. 
14. :star: 查詢沒學過”張三”老師講授的任一門課程的學生、姓名
    ```sql=
    SELECT s.s_id, s.s_name
    FROM student s 
    WHERE s.s_id not in (
        SELECT sc.s_id FROM score sc 
        JOIN course c ON sc.c_id = c.c_id
        JOIN teacher t ON c.t_id = t.t_id
        WHERE t.t_name = '張三' )
    ```
    ![](https://i.imgur.com/BRIk8t1.png)

15. :star: 查詢兩門及其以上不及格課程的同學的學號，姓名及其平均成績
    ```sql=
    SELECT s.s_id, s.s_name, AVG(sc.s_score) AS [Avg Score]
    FROM student s join score sc ON s.s_id = sc.s_id
    WHERE sc.s_score < 60
    GROUP BY s.s_id,s.s_name
    HAVING COUNT(sc.c_id)>1
    ```
    ![](https://i.imgur.com/nhNnrsU.png)

16. 檢索”01”課程分數小於60，按分數降序排列的學生資訊
    ```sql=
    SELECT s.*, sc.s_score
    FROM student s JOIN score sc ON s.s_id = sc.s_id
    WHERE sc.c_id = '01' AND sc.s_score < 60
    ORDER BY sc.s_score DESC;
    ```
    ![](https://i.imgur.com/OJtwUKQ.png)

17. 按平均成績從高到低顯示所有學生的平均成績
    ```sql=
    SELECT s.s_id, s.s_name, AVG(sc.s_score) as [Avg Score]
    FROM student s LEFT JOIN score sc ON s.s_id = sc.s_id
    GROUP BY s.s_id, s.s_name
    ORDER BY AVG(sc.s_score) DESC
    ```
    ![](https://i.imgur.com/V0h8uMs.png)

18. :star: 查詢各科成績最高分、最低分和平均分(以如下形式顯示：課程ID, 課程name, 最高分, 最低分, 平均分, 及格率，查詢結果按人數降序排列，若人數相同，按課程號升序排列)
    ```sql=
    SELECT c.c_id, c.c_name, MAX(sc.s_score) AS [Max score], MIN(sc.s_score) AS [Min score], AVG(sc.s_score) AS [Avg score],
    AVG(case when sc.s_score >= 60 then 1.0 else 0.0 end ) as [Passrate]
    FROM course c JOIN score sc ON c.c_id = sc.c_id
    GROUP BY c.c_id, c.c_name
    ORDER BY COUNT(c.c_id) DESC, c_id ASC;
    ```
    ![](https://i.imgur.com/mpvYGLi.png)

19. 按各科平均成績從低到高和及格率的百分數從高到低順序
    ```sql=
    SELECT c.c_id, c.c_name, AVG(sc.s_score) AS [Avg score],
    AVG(case when sc.s_score >= 60 then 1.0 else 0.0 end ) as [Passrate]
    FROM course c JOIN score sc ON c.c_id = sc.c_id
    GROUP BY c.c_id, c.c_name
    ORDER BY AVG(sc.s_score) ASC, AVG(case when sc.s_score >= 60 then 1.0 else 0.0 end ) DESC;
    ```
    ![](https://i.imgur.com/xhAealR.png)

20. 