CREATE DEFINER=`root`@`localhost` PROCEDURE `CustMetrics`( IN Start_Date TIMESTAMP, IN End_Date TIMESTAMP)
BEGIN

Select location, 
       sum(case when overallscore <25 then 1 else 0 end) as OverallLess25,
       sum(case when overallscore >=25 and overallscore <50 then 1 else 0 end) as OverallLessEq25AndGrt50,
       sum(case when overallscore >=50 and overallscore <75 then 1 else 0 end) as OverallLessEq50AndGrt75,
       sum(case when overallscore >75 then 1 else 0 end) as OverallGrt75
       from (      
SELECT location, 
       dtdefault, 
       if (question1>0,question1,0) + 
       if (question2>0,question2,0) + 
       if (question3>0,question3,0) + 
       if (question4>0,question4,0) + 
       if (question5>0,question5,0) + 
       if (question6>0,question6,0) + 
       if (question7>0,question7,0) AS overallscore 
FROM   intelapp.customerinfo) as OverScrData
WHERE dtDefault between Start_Date and End_Date
Group by location;

END