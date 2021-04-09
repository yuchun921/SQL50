# SQL50
###### tags: `SQL`

1. **:star: 查詢課程編號為“01”的課程比“02”的課程成績高的所有學生的學號、姓名**
    ```sql
    SELECT s.s_id, s.s_name, sc.c_id, sc.s_score, sc1.c_id, sc1.s_score
    FROM student s JOIN score sc on s.s_id = sc.s_id
    JOIN score sc1 on s.s_id = sc1.s_id
    WHERE sc.c_id = '01' and sc1.c_id = '02' and sc.s_score > sc1.s_score
    ```
    ![](https://i.imgur.com/cYOnXTp.png)

2. **:star: 查詢平均成績大於60分的學生的學號和平均成績**
    ```sql
    SELECT s_id, Avg(s_score) as AvgScore
    FROM score 
    GROUP BY s_id
    HAVING Avg(s_score)>60
    ```
    ![](https://i.imgur.com/GI0MvmC.png)

3. **:star: 查詢所有同學的學號、姓名、選課數、總成績**
    ```sql
    SELECT s.s_id as [ID], s.s_name as [Name], COUNT(sc.s_score) as [Num of course], SUM(sc.s_score) as [Sum of score]
    FROM student s left join score sc ON s.s_id = sc.s_id
    GROUP BY s.s_id, s.s_name
    ```
    ![](https://i.imgur.com/OzeZzZh.png)

4. **查詢姓“李”的老師的個數**
    ```sql
    SELECT count(t_name) as [Num of Lee]
    FROM teacher
    WHERE t_name like '李%'
    ```
    ![](https://i.imgur.com/2sk2UZF.png)

5. **:star: 查詢沒學過“張三”老師課的同學的學號、姓名**
    ```sql
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

6. **:star: 查詢學過“張三”老師所教的課的同學的學號、姓名**
    ```sql
    SELECT s.s_id, s.s_name
    FROM student s JOIN score sc ON s.s_id = sc.s_id 
    JOIN course c ON sc.c_id = c.c_id
    JOIN teacher t ON c.t_id = t.t_id
    WHERE t.t_name = '張三'
    ```
    ![](https://i.imgur.com/WHlTQ1O.png)

7. **:star: 查詢學過編號“01”並且也學過編號“02”課程的同學的學號、姓名**
    ```sql
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

8. **:star: 查詢課程編號“01”的成績比課程編號“02”課程低的所有同學的學號、姓名**
    ```sql
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

9. **查詢課程成績小於60分的所有同學學號、姓名**
    ```sql
    SELECT  s.s_id, s.s_name
    FROM student s LEFT JOIN score sc ON s.s_id = sc.s_id
    GROUP BY s.s_id, s.s_name
    HAVING MAX(sc.s_score) < 60
    ```
    ![](https://i.imgur.com/50Gp14u.png)
    
10. **:star: 查詢沒有修所有課的學生的學號、姓名**
    ```sql
    SELECT s.s_id, s.s_name
    FROM student s LEFT JOIN score sc ON s.s_id = sc.s_id
    GROUP BY s.s_id, s.s_name
    HAVING COUNT(sc.c_id)<(SELECT COUNT(c_id) FROM course)
    ```
    ![](https://i.imgur.com/r586YnO.png)

11. **:star: 查詢至少有一門課與學號為“01”的同學所學相同的同學的學號和姓名**
    ```sql
    SELECT DISTINCT s.s_id, s.s_name
    FROM student s LEFT JOIN score sc ON s.s_id = sc.s_id
    WHERE sc.c_id IN (
        SELECT sc.c_id FROM score sc WHERE sc.s_id = '01')
    AND sc.s_id != '01'
    ```
    ![](https://i.imgur.com/C1EeRfo.png)
    
12. **:star: 查詢和”01”號的同學學習的課程完全相同的其他同學的學號和姓名**
    ```sql
    SELECT s.s_id, s.s_name
    FROM student s JOIN score sc ON s.s_id = sc.s_id
    WHERE s.s_id != '01'
    GROUP BY s.s_id, s.s_name
    HAVING COUNT(sc.c_id) = (SELECT COUNT(sc.c_id) FROM score sc WHERE sc.s_id = '01')
    ```
    ![](https://i.imgur.com/Wmtjwxp.png)
13. 
14. **:star: 查詢沒學過”張三”老師講授的任一門課程的學生、姓名**
    ```sql
    SELECT s.s_id, s.s_name
    FROM student s 
    WHERE s.s_id not in (
        SELECT sc.s_id FROM score sc 
        JOIN course c ON sc.c_id = c.c_id
        JOIN teacher t ON c.t_id = t.t_id
        WHERE t.t_name = '張三' )
    ```
    ![](https://i.imgur.com/BRIk8t1.png)

15. **:star: 查詢兩門及其以上不及格課程的同學的學號，姓名及其平均成績**
    ```sql
    SELECT s.s_id, s.s_name, AVG(sc.s_score) AS [Avg Score]
    FROM student s join score sc ON s.s_id = sc.s_id
    WHERE sc.s_score < 60
    GROUP BY s.s_id,s.s_name
    HAVING COUNT(sc.c_id)>1
    ```
    ![](https://i.imgur.com/nhNnrsU.png)

16. **檢索”01”課程分數小於60，按分數降序排列的學生資訊**
    ```sql
    SELECT s.*, sc.s_score
    FROM student s JOIN score sc ON s.s_id = sc.s_id
    WHERE sc.c_id = '01' AND sc.s_score < 60
    ORDER BY sc.s_score DESC;
    ```
    ![](https://i.imgur.com/OJtwUKQ.png)

17. **按平均成績從高到低顯示所有學生的平均成績**
    ```sql
    SELECT s.s_id, s.s_name, AVG(sc.s_score) as [Avg Score]
    FROM student s LEFT JOIN score sc ON s.s_id = sc.s_id
    GROUP BY s.s_id, s.s_name
    ORDER BY AVG(sc.s_score) DESC
    ```
    ![](https://i.imgur.com/V0h8uMs.png)

18. **:star: 查詢各科成績最高分、最低分和平均分(以如下形式顯示：課程ID, 課程name, 最高分, 最低分, 平均分, 及格率，查詢結果按人數降序排列，若人數相同，按課程號升序排列)**
    ```sql
    SELECT c.c_id, c.c_name, MAX(sc.s_score) AS [Max score], MIN(sc.s_score) AS [Min score], AVG(sc.s_score) AS [Avg score],
    AVG(case when sc.s_score >= 60 then 1.0 else 0.0 end ) as [Passrate]
    FROM course c JOIN score sc ON c.c_id = sc.c_id
    GROUP BY c.c_id, c.c_name
    ORDER BY COUNT(c.c_id) DESC, c_id ASC;
    ```
    ![](https://i.imgur.com/mpvYGLi.png)

19. **按各科平均成績從低到高和及格率的百分數從高到低順序**
    ```sql
    SELECT c.c_id, c.c_name, AVG(sc.s_score) AS [Avg score],
    AVG(case when sc.s_score >= 60 then 1.0 else 0.0 end ) as [Passrate]
    FROM course c JOIN score sc ON c.c_id = sc.c_id
    GROUP BY c.c_id, c.c_name
    ORDER BY AVG(sc.s_score) ASC, AVG(case when sc.s_score >= 60 then 1.0 else 0.0 end ) DESC;
    ```
    ![](https://i.imgur.com/xhAealR.png)

20. **查詢學生的總成績並進行排名**
    ```sql
    SELECT s.s_id, s.s_name, SUM(sc.s_score) AS [Sum Score],
    RANK() OVER(ORDER BY SUM(sc.s_score) DESC) AS [Rank]
    FROM student s LEFT JOIN score sc ON s.s_id = sc.s_id
    GROUP BY s.s_id, s.s_name
    ```
    ![](https://i.imgur.com/XhPfyqx.png)
    

    **按各科成績進行排序，並顯示排名(重點row_number)**
     ```sql
    SELECT ROW_NUMBER() OVER(PARTITION BY c_id ORDER BY s_score DESC) AS [RANK], s.s_id, s.s_name, sc.c_id, sc.s_score
    FROM score sc join student s ON sc.s_id = s.s_id;
    ```
    ![](https://i.imgur.com/X0ItoJF.png)

21. **查詢不同老師所教不同課程平均分從高到低顯示**
    ```sql
    Select t.t_name, c_name, AVG(sc.s_score) AS [AVG Score]
    FROM teacher t JOIN course c ON t.t_id = c.t_id
    JOIN score sc ON c.c_id = sc.c_id
    GROUP BY t.t_name, c_name
    ORDER BY AVG(sc.s_score) DESC;
    ```
    ![](https://i.imgur.com/rKyCVow.png)

22. **:star: 查詢所有課程的成績第2名到第3名的學生信息及該課程成績**

    >用FROM Subquery的方式，可以將RANK設成WHERE的條件來篩選出2、3名
    ```sql
    SELECT *
    FROM (
        SELECT s.s_id, s.s_name, sc.c_id, sc.s_score, Dense_Rank() OVER (PARTITION BY sc.c_id ORDER BY sc.s_score DESC) AS [RANK]
        FROM student s JOIN score sc ON s.s_id = sc.s_id) AS sub
    WHERE sub.[RANK] in (2,3)

    -- Dense_Rank() > 若有同個排名，之後仍繼續。(EX:有兩個第一名，下一個會是第二名，不會跳三)
    ```
    ![](https://i.imgur.com/IZ8qr3B.png)

23. **:star: 統計各科成績各分數段人數：課程編號,課程名稱,[100-85],[85-70],[70-60],[0-60]及所佔百分比**
```sql
SELECT sc.c_id, c.c_name, count(sc.s_id) AS [Num of Student],
SUM(CASE WHEN sc.s_score<60 THEN 1 else 0 END) AS [0-59],
SUM(CASE WHEN sc.s_score<60 THEN 1.0 else 0.0 END) /COUNT(sc.s_id) AS [0-59 percentage],
SUM(CASE WHEN sc.s_score>=60 AND sc.s_score < 70 THEN 1 else 0 END) AS [60-69],
SUM(CASE WHEN sc.s_score>=60 AND sc.s_score < 70 THEN 1.0 else 0.0 END)/COUNT(sc.s_id) AS [60-69 percentage],
SUM(CASE WHEN sc.s_score>=70 AND sc.s_score < 85 THEN 1 else 0 END) AS [70-84],
SUM(CASE WHEN sc.s_score>=70 AND sc.s_score < 85 THEN 1.0 else 0.0 END)/COUNT(sc.s_id) AS [70-84 percentage],
SUM(CASE WHEN sc.s_score>=85 AND sc.s_score <= 100 THEN 1 else 0 END) AS [85-100],
SUM(CASE WHEN sc.s_score>=85 AND sc.s_score <= 100 THEN 1.0 else 0.0 END)/COUNT(sc.s_id) AS [85-100 percentage]
FROM score sc JOIN course c ON sc.c_id = c.c_id
GROUP BY sc.c_id, c.c_name
```
![](https://i.imgur.com/oMZkexq.png)

24. **:star: 查詢學生平均成績及其名次**
```sql
SELECT s.s_id, s.s_name, AVG(sc.s_score), DENSE_RANK() OVER(ORDER BY AVG(sc.s_score) DESC) AS [RANK]
FROM student s LEFT JOIN score sc ON s.s_id = sc.s_id
GROUP BY s.s_id, s.s_name
```
![](https://i.imgur.com/cU0mve7.png)

25. **查詢各科成績前三名的記錄**
    ```sql
    SELECT * FROM (
        SELECT s.s_id, s.s_name, sc.c_id, sc.s_score, ROW_NUMBER() OVER(PARTITION BY sc.c_id ORDER BY sc.s_score DESC) AS [RANK]
        FROM student s JOIN score sc ON s.s_id =sc.s_id ) AS SUB
    WHERE [RANK] < 4
    ```
    ![](https://i.imgur.com/uIh146H.png)

26. **查詢每門課程被選修的學生數**
    ```sql
    SELECT c.c_name, COUNT(sc.s_id) AS [選修人數]
    FROM course c join score sc ON c.c_id =sc.c_id
    GROUP BY c.c_name
    ```
    ![](https://i.imgur.com/yRpFbse.png)

27. **查詢出只選修了一門課程的全部學生的學號和姓名**
    ```sql
    SELECT s.s_id, s.s_name, COUNT(s.s_id) AS [課程數量]
    FROM student s LEFT JOIN score sc ON s.s_id = sc.s_id
    GROUP BY s.s_id, s.s_name
    HAVING COUNT(s.s_id) = 1
    ```
    ![](https://i.imgur.com/uTNiEik.png)

28. **查詢男生、女生人數**
    ```sql
    SELECT s_sex, COUNT(s_sex) AS [男女人數]
    FROM student
    GROUP BY s_sex
    ```
    ![](https://i.imgur.com/kjal6lA.png)

29. **查詢名字中含有”風”字的學生信息**
    ```sql
    SELECT *
    FROM student
    WHERE s_name like '%風%'
    ```
    ![](https://i.imgur.com/cyZs5IU.png)

30. **查詢同名同性學生名單，並統計同名人數**
    ```sql
    SELECT s_id, s_name, COUNT(s_sex) AS [是否同名同性別]
    FROM student
    GROUP BY s_id, s_name
    ```
    ![](https://i.imgur.com/gUIhAA9.png)

31. **查詢1990年出生的學生名單**
    ```sql
    SELECT s_name, s_birth 
    FROM student 
    WHERE YEAR(s_birth) = 1990
    ```
    ![](https://i.imgur.com/x0ieuId.png)

32. **查詢每門課程的平均成績，結果按平均成績升序排列，平均成績相同時，按課程號降序排列**
    ```sql
    SELECT c.c_name, AVG(sc.s_score) AS [Avg Score]
    FROM course c JOIN score sc ON c.c_id = sc.c_id
    GROUP BY c.c_name, c.c_id
    ORDER BY AVG(sc.s_score) ASC, c.c_id DESC;
    ```
    ![](https://i.imgur.com/VJxYcH7.png)

33. **查詢不及格的課程，並按課程號從大到小排列**
    ```sql
    SELECT s.s_name, sc.c_id, c.c_name, sc.s_score
    FROM student s LEFT JOIN score sc ON s.s_id = sc.s_id
    JOIN course c ON sc.c_id = c.c_id
    WHERE sc.s_score < 60
    ORDER BY sc.c_id DESC;
    ```
    ![](https://i.imgur.com/wT0BGn6.png)

34. **查詢課程編號為”01”且課程成績在60分以上的學生的學號和姓名**
    ```sql
    SELECT s.s_id, s.s_name, sc.s_score
    FROM student s LEFT JOIN score sc ON s.s_id = sc.s_id
    WHERE sc.c_id = '01' AND sc.s_score >= 60
    ```
    ![](https://i.imgur.com/SPDHgia.png)

35. **:star: 查詢所有學生的課程及分數情況**
    
    ???????
    
36. **查詢任何一門課程成績在70分以上的姓名、課程名稱和分數**
    ```sql
    SELECT s.s_name, c.c_name, sc.s_score
    FROM student s JOIN score sc ON s.s_id = sc.s_id
    JOIN course c ON sc.c_id = c.c_id
    WHERE sc.s_score >= 70
    ```
    ![](https://i.imgur.com/txM63tQ.png)

37. **查詢課程名稱為”數學”，且分數低於60的學生姓名和分數**
    ```sql
    SELECT s.s_name, sc.s_score
    FROM student s JOIN score sc ON s.s_id = sc.s_id
    JOIN course c ON sc.c_id = c.c_id
    WHERE c.c_name = '數學' AND sc.s_score < 60
    ```
    ![](https://i.imgur.com/VCqVk8D.png)

38. **查詢課程編號為03且課程成績在80分以上的學生的學號和姓名**
    ```sql
    SELECT s.s_id, s.s_name, sc.s_score
    FROM student s JOIN score sc ON s.s_id = sc.s_id
    JOIN course c ON sc.c_id = c.c_id
    WHERE sc.c_id = '03' AND sc.s_score >= 80
    ```
    ![](https://i.imgur.com/g6qbl0c.png)

39. **求每門課程的學生人數** (跟Q26.一樣)

40. **查詢選修“張三”老師所授課程的學生中，成績最高的學生姓名及其成績**
    ```sql
    SELECT TOP 1 s.s_name, sc.s_score
    FROM student s JOIN score sc ON s.s_id = sc.s_id
    JOIN course c ON sc.c_id = c.c_id
    JOIN teacher t ON c.t_id =t.t_id
    WHERE t.t_name = '張三'
    ```
    ![](https://i.imgur.com/NVSi8Nm.png)

41. **:star: 查詢不同課程成績相同的學生的學生編號、課程編號、學生成績**
    ```sql
    SELECT DISTINCT sc1.s_id, s.s_name, sc1.c_id, sc1.s_score
    FROM student s JOIN score sc1 ON s.s_id = sc1.s_id
    JOIN score sc2 ON s.s_id = sc2.s_id
    WHERE sc1.c_id != sc2.c_id AND sc1.s_score = sc2.s_score
    ```
    ![](https://i.imgur.com/2rv8U2D.png)

42. **查詢每門功課成績最好的前兩名** (同 Q22, Q25)
    ```sql
    -- DENSE RANK()

    SELECT * FROM (
        SELECT s.s_id, s.s_name, sc.c_id, sc.s_score, DENSE_RANK() OVER (PARTITION BY sc.c_id ORDER BY sc.s_score DESC) AS [RANK]
        FROM student s JOIN score sc ON s.s_id = sc.s_id) AS SUB
    WHERE [RANK] IN (1,2)
    ```
    ![](https://i.imgur.com/GZcqLYo.png)

43. **統計每門課程的學生選修人數（超過5人的課程才統計）。要求輸出課程號和選修人數，查詢結果按人數降序排列，若人數相同，按課程號升序排列** (同 Q26, Q39)
    ```sql
    SELECT c_id, count(s_id) AS [選課人數]
    FROM score
    GROUP BY c_id
    HAVING count(s_id) > 5
    ORDER BY count(s_id) DESC, c_id ASC;
    ```
    ![](https://i.imgur.com/nVgxCvc.png)

44. **檢索至少選修兩門課程的學生資訊** (同 Q27)
    ```sql
    SELECT s.s_id, s.s_name, COUNT(s.s_id) AS [課程數量]
    FROM student s LEFT JOIN score sc ON s.s_id = sc.s_id
    GROUP BY s.s_id, s.s_name
    HAVING COUNT(s.s_id) >= 2
    ```
    ![](https://i.imgur.com/wZtgIeo.png)

45. **查詢選修了全部課程的學生信息** (同 Q10, Q27, Q44)
    ```sql
    -- Solution 1
    SELECT s.s_id, s.s_name
    FROM student s LEFT JOIN score sc ON s.s_id = sc.s_id
    GROUP BY s.s_id, s.s_name
    HAVING COUNT(sc.c_id) = 3 --共三門課

    -- Solution 2
    SELECT s.s_id, s.s_name
    FROM student s LEFT JOIN score sc ON s.s_id = sc.s_id
    GROUP BY s.s_id, s.s_name
    HAVING COUNT(sc.c_id) = (SELECT COUNT(c_id) FROM course)
    ```
    ![](https://i.imgur.com/4xSz0Ik.png)

46. **查詢每個學生的年齡**
    ```sql
    SELECT s_id, s_name, YEAR(getdate())-YEAR(s_birth) AS [Age]
    FROM student
    ```
    ![](https://i.imgur.com/Guhb9wU.png)

47. ****
48. ****
49. ****
50. ****