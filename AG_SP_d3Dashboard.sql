CREATE DEFINER=`root`@`localhost` PROCEDURE `d3dashboard`(  IN Start_Date TIMESTAMP,
  IN End_Date TIMESTAMP)
BEGIN
DROP TEMPORARY TABLE IF EXISTS intelapp.d3RawData; 
DROP TEMPORARY TABLE IF EXISTS intelapp.d3feedbackcount;
 
 
 CREATE TEMPORARY TABLE  intelapp.d3RawData
 SELECT location, 
       'Question1' AS Questions, 
								 CASE WHEN question1 = 20 THEN 'Excellent' end as Excellent,
                                 CASE WHEN question1 = 15 THEN 'Good' end as Good,
                                 CASE WHEN question1 = 10 THEN 'Average' end as Average,
                                 CASE WHEN question1 = 5 THEN 'Poor'end as Poor,
                                 dtDefault
FROM   intelapp.customerinfo
union all
 SELECT location, 
       'Question2' AS Questions, 
								 CASE WHEN question2 = 20 THEN 'Excellent' end as Excellent,
                                 CASE WHEN question2 = 15 THEN 'Good' end as Good,
                                 CASE WHEN question2 = 10 THEN 'Average' end as Average,
                                 CASE WHEN question2 = 5 THEN 'Poor'end as Poor,
                                 dtDefault
FROM   intelapp.customerinfo
union all
 SELECT location, 
       'Question3' AS Questions, 
								 CASE WHEN question3 = 20 THEN 'Excellent' end as Excellent,
                                 CASE WHEN question3 = 15 THEN 'Good' end as Good,
                                 CASE WHEN question3 = 10 THEN 'Average' end as Average,
                                 CASE WHEN question3 = 5 THEN 'Poor'end as Poor,
                                 dtDefault
FROM   intelapp.customerinfo
union all
 SELECT location, 
       'Question4' AS Questions, 
								 CASE WHEN question4 = 20 THEN 'Excellent' end as Excellent,
                                 CASE WHEN question4 = 15 THEN 'Good' end as Good,
                                 CASE WHEN question4 = 10 THEN 'Average' end as Average,
                                 CASE WHEN question4 = 5 THEN 'Poor'end as Poor,
                                 dtDefault
FROM   intelapp.customerinfo
union all
 SELECT location, 
       'Question5' AS Question5, 
								 CASE WHEN question5 = 20 THEN 'Excellent' end as Excellent,
                                 CASE WHEN question5 = 15 THEN 'Good' end as Good,
                                 CASE WHEN question5 = 10 THEN 'Average' end as Average,
                                 CASE WHEN question5 = 5 THEN 'Poor'end as Poor,
                                 dtDefault
FROM   intelapp.customerinfo
union all
 SELECT location, 
       'Question6' AS Questions, 
								 CASE WHEN question6 = 20 THEN 'Excellent' end as Excellent,
                                 CASE WHEN question6 = 15 THEN 'Good' end as Good,
                                 CASE WHEN question6 = 10 THEN 'Average' end as Average,
                                 CASE WHEN question6 = 5 THEN 'Poor'end as Poor,
                                 dtDefault
FROM   intelapp.customerinfo
union all
 SELECT location, 
       'Question7' AS Questions, 
								 CASE WHEN question7 = 20 THEN 'Excellent' end as Excellent,
                                 CASE WHEN question7 = 15 THEN 'Good' end as Good,
                                 CASE WHEN question7 = 10 THEN 'Average' end as Average,
                                 CASE WHEN question7 = 5 THEN 'Poor'end as Poor,
                                 dtDefault
FROM   intelapp.customerinfo;


CREATE TEMPORARY TABLE  intelapp.d3feedbackcount
SELECT location, 
       questions, 
       Count(excellent) AS CntExcellent, 
       Count(good)      AS CntGood, 
       Count(average)   AS CntAverage, 
       Count(poor)      AS CntPoor 
FROM   intelapp.d3rawdata 
WHERE  dtdefault BETWEEN Start_Date AND End_Date 
GROUP  BY location, 
          questions;
          
### Final Table##
          
SELECT location, 
       questionenglish,
       cntexcellent, 
       cntgood, 
       cntaverage, 
       cntpoor 
FROM   intelapp.d3feedbackcount 
       LEFT OUTER JOIN intelapp.questionssetup 
                    ON d3feedbackcount.questions = questionssetup.questionno
where questionenglish <>0;                    
END