CREATE DEFINER=`root`@`localhost` PROCEDURE `annaporna_report`(
  IN loc VARCHAR(45),
  IN Start_Date TIMESTAMP,
  IN End_Date TIMESTAMP
)
BEGIN

IF loc IS NULL THEN 

### Note : Clean up Location Names###
DROP TEMPORARY TABLE IF EXISTS intelapp.RptRawData;
DROP TEMPORARY TABLE IF EXISTS intelapp.TotalbyLocation;
DROP TEMPORARY TABLE IF EXISTS intelapp.TotalFromAllLoc;
DROP TEMPORARY TABLE IF EXISTS intelapp.TotalFromAllLocByFeedback;


CREATE TEMPORARY TABLE  intelapp.RptRawData
SELECT temptbl.location AS PrimaryLocation, 
       temptbl.feedback, 
       q1.count_question1, 
       q2.count_question2, 
       q3.count_question3, 
       q4.count_question4, 
       q5.count_question5, 
       q6.count_question6, 
       q7.count_question7 
FROM   (SELECT location, 
               'Excellent' AS Feedback 
        FROM   `intelapp`.`customerinfo` 
        GROUP  BY 1,2 
        UNION ALL 
        SELECT location, 
               'Good'AS Feedback 
        FROM   `intelapp`.`customerinfo` 
        GROUP  BY 1,2 
        UNION ALL 
        SELECT location, 
               'Average'AS Feedback 
        FROM   `intelapp`.`customerinfo` 
        GROUP  BY 1,2 
        UNION ALL 
        SELECT location, 
               'Poor'AS Feedback 
        FROM   `intelapp`.`customerinfo` 
        GROUP  BY 1,2) AS temptbl 
       LEFT OUTER JOIN (SELECT location, 
                               CASE 
                                 WHEN question1 = 20 THEN 'Excellent' 
                                 WHEN question1 = 15 THEN 'Good' 
                                 WHEN question1 = 10 THEN 'Average' 
                                 WHEN question1 = 5 THEN 'Poor' 
                                 ELSE NULL 
                               end        AS question1desc, 
                               Count(CASE 
                                       WHEN question1 = 20 THEN 'Excellent' 
                                       WHEN question1 = 15 THEN 'Good' 
                                       WHEN question1 = 10 THEN 'Average' 
                                       WHEN question1 = 5 THEN 'Poor' 
                                       ELSE NULL 
                                     end) AS count_question1 
                        FROM   `intelapp`.`customerinfo` 
                        WHERE  dtDefault between Start_Date and End_Date 
                        GROUP  BY location, 
                                  question1desc) AS q1 
                    ON temptbl.location = q1.location 
                       AND temptbl.feedback = q1.question1desc 
       LEFT OUTER JOIN (SELECT location, 
                               CASE 
                                 WHEN question2 = 20 THEN 'Excellent' 
                                 WHEN question2 = 15 THEN 'Good' 
                                 WHEN question2 = 10 THEN 'Average' 
                                 WHEN question2 = 5 THEN 'Poor' 
                                 ELSE NULL 
                               end        AS question2desc, 
                               Count(CASE 
                                       WHEN question2 = 20 THEN 'Excellent' 
                                       WHEN question2 = 15 THEN 'Good' 
                                       WHEN question2 = 10 THEN 'Average' 
                                       WHEN question2 = 5 THEN 'Poor' 
                                       ELSE NULL 
                                     end) AS count_question2 
                        FROM   `intelapp`.`customerinfo` 
                        WHERE  dtDefault between Start_Date and End_Date 
                        GROUP  BY location, 
                                  question2desc) AS q2 
                    ON temptbl.location = q2.location 
                       AND temptbl.feedback = q2.question2desc 
       LEFT OUTER JOIN (SELECT location, 
                               CASE 
                                 WHEN question3 = 20 THEN 'Excellent' 
                                 WHEN question3 = 15 THEN 'Good' 
                                 WHEN question3 = 10 THEN 'Average' 
                                 WHEN question3 = 5 THEN 'Poor' 
                                 ELSE NULL 
                               end        AS question3desc, 
                               Count(CASE 
                                       WHEN question3 = 20 THEN 'Excellent' 
                                       WHEN question3 = 15 THEN 'Good' 
                                       WHEN question3 = 10 THEN 'Average' 
                                       WHEN question3 = 5 THEN 'Poor' 
                                       ELSE NULL 
                                     end) AS count_question3 
                        FROM   `intelapp`.`customerinfo` 
                        WHERE  dtDefault between Start_Date and End_Date 
                        GROUP  BY location, 
                                  question3desc) AS q3 
                    ON temptbl.location = q3.location 
                       AND temptbl.feedback = q3.question3desc 
       LEFT OUTER JOIN (SELECT location, 
                               CASE 
                                 WHEN question4 = 20 THEN 'Excellent' 
                                 WHEN question4 = 15 THEN 'Good' 
                                 WHEN question4 = 10 THEN 'Average' 
                                 WHEN question4 = 5 THEN 'Poor' 
                                 ELSE NULL 
                               end        AS question4desc, 
                               Count(CASE 
                                       WHEN question4 = 20 THEN 'Excellent' 
                                       WHEN question4 = 15 THEN 'Good' 
                                       WHEN question4 = 10 THEN 'Average' 
                                       WHEN question4 = 5 THEN 'Poor' 
                                       ELSE NULL 
                                     end) AS count_question4 
                        FROM   `intelapp`.`customerinfo` 
                        WHERE  dtDefault between Start_Date and End_Date 
                        GROUP  BY location, 
                                  question4desc) AS q4 
                    ON temptbl.location = q4.location 
                       AND temptbl.feedback = q4.question4desc 
       LEFT OUTER JOIN (SELECT location, 
                               CASE 
                                 WHEN question5 = 20 THEN 'Excellent' 
                                 WHEN question5 = 15 THEN 'Good' 
                                 WHEN question5 = 10 THEN 'Average' 
                                 WHEN question5 = 5 THEN 'Poor' 
                                 ELSE NULL 
                               end        AS question5desc, 
                               Count(CASE 
                                       WHEN question5 = 20 THEN 'Excellent' 
                                       WHEN question5 = 15 THEN 'Good' 
                                       WHEN question5 = 10 THEN 'Average' 
                                       WHEN question5 = 5 THEN 'Poor' 
                                       ELSE NULL 
                                     end) AS count_question5 
                        FROM   `intelapp`.`customerinfo` 
                        WHERE  dtDefault between Start_Date and End_Date 
                        GROUP  BY location, 
                                  question5desc) AS q5 
                    ON temptbl.location = q5.location 
                       AND temptbl.feedback = q5.question5desc 
       LEFT OUTER JOIN (SELECT location, 
                               CASE 
                                 WHEN question6 = 20 THEN 'Excellent' 
                                 WHEN question6 = 15 THEN 'Good' 
                                 WHEN question6 = 10 THEN 'Average' 
                                 WHEN question6 = 5 THEN 'Poor' 
                                 ELSE NULL 
                               end        AS question6desc, 
                               Count(CASE 
                                       WHEN question6 = 20 THEN 'Excellent' 
                                       WHEN question6 = 15 THEN 'Good' 
                                       WHEN question6 = 10 THEN 'Average' 
                                       WHEN question6 = 5 THEN 'Poor' 
                                       ELSE NULL 
                                     end) AS count_question6 
                        FROM   `intelapp`.`customerinfo` 
						WHERE  dtDefault between Start_Date and End_Date
                        GROUP  BY location, 
                                  question6desc) AS q6 
                    ON temptbl.location = q6.location 
                       AND temptbl.feedback = q6.question6desc 
       LEFT OUTER JOIN (SELECT location, 
                               CASE 
                                 WHEN question7 = 20 THEN 'Excellent' 
                                 WHEN question7 = 15 THEN 'Good' 
                                 WHEN question7 = 10 THEN 'Average' 
                                 WHEN question7 = 5 THEN 'Poor' 
                                 ELSE NULL 
                               end        AS question7desc, 
                               Count(CASE 
                                       WHEN question7 = 20 THEN 'Excellent' 
                                       WHEN question7 = 15 THEN 'Good' 
                                       WHEN question7 = 10 THEN 'Average' 
                                       WHEN question7 = 5 THEN 'Poor' 
                                       ELSE NULL 
                                     end) AS count_question7 
                        FROM   `intelapp`.`customerinfo` 
                        WHERE  dtDefault between Start_Date and End_Date 
                        GROUP  BY location, 
                                  question7desc) AS q7 
                    ON temptbl.location = q7.location 
                       AND temptbl.feedback = q7.question7desc;
                       
                       
                       
###### Important Every Query below this comment is only for 5 questions. If in future more questions to added please add the extra line of codes below ########  
                     
## Using Temp Table to calculate the Total Response by location
CREATE TEMPORARY TABLE  intelapp.TotalbyLocation
select PrimaryLocation,    
	   sum(count_question1) as TotRespByLoc
       from intelapp.RptRawData
       group by PrimaryLocation;  
       
       
## Using Temp Table to calculate the Total Response from all location
CREATE TEMPORARY TABLE  intelapp.TotalFromAllLoc
select  sum(count_question1) as TotRespFromAllLoc
       from intelapp.RptRawData;  

## Report for all location
CREATE TEMPORARY TABLE  intelapp.TotalFromAllLocByFeedback
SELECT 'ALL LOCATION'       AS Location, 
       rptrawdata.feedback, 
       Sum(count_question1) AS All_q1,
       Sum(count_question2) AS All_q2 ,
       Sum(count_question3) AS All_q3 ,
       Sum(count_question4) AS All_q4 ,
       Sum(count_question5) AS All_q5 ,
       Sum(count_question6) AS All_q6 ,
       Sum(count_question7) AS All_q7
FROM   intelapp.rptrawdata 
GROUP  BY rptrawdata.feedback;
       
       
## Join the above two temp tables with the main temp table

Select * from (
SELECT          rptrawdata.primarylocation, rptrawdata.feedback,
                CASE 
                                WHEN Round(count_question1/totrespbyloc *100,2) IS NULL THEN 0 
                                ELSE Round(count_question1/totrespbyloc *100,2) 
                end AS perct_q1,
                CASE 
                                WHEN Round(count_question2/totrespbyloc *100,2) IS NULL THEN 0 
                                ELSE Round(count_question2/totrespbyloc *100,2) 
                end AS perct_q2,
                CASE 
                                WHEN Round(count_question3/totrespbyloc *100,2) IS NULL THEN 0 
                                ELSE Round(count_question3/totrespbyloc *100,2) 
                end AS perct_q3,
                CASE 
                                WHEN Round(count_question4/totrespbyloc *100,2) IS NULL THEN 0 
                                ELSE Round(count_question4/totrespbyloc *100,2) 
                end AS perct_q4,
                CASE 
                                WHEN Round(count_question5/totrespbyloc *100,2) IS NULL THEN 0 
                                ELSE Round(count_question5/totrespbyloc *100,2) 
                end AS perct_q5,
                CASE 
                                WHEN Round(count_question6/totrespbyloc *100,2) IS NULL THEN 0 
                                ELSE Round(count_question6/totrespbyloc *100,2) 
                end AS perct_q6,
                CASE 
                                WHEN Round(count_question7/totrespbyloc *100,2) IS NULL THEN 0 
                                ELSE Round(count_question7/totrespbyloc *100,2) 
                end AS perct_q7
FROM            intelapp.rptrawdata 
LEFT OUTER JOIN intelapp.totalbylocation 
ON              rptrawdata.primarylocation = totalbylocation.primarylocation

Union all
## Appending the All Location metrics to the above query

SELECT totalfromalllocbyfeedback.location, 
       totalfromalllocbyfeedback.feedback, 
       case when Round((totalfromalllocbyfeedback.all_q1/totalfromallloc.totrespfromallloc)*100,2) IS NULL THEN 0 else Round((totalfromalllocbyfeedback.all_q1/totalfromallloc.totrespfromallloc)*100,2) end as perct_q1,
       case when Round((totalfromalllocbyfeedback.all_q2/totalfromallloc.totrespfromallloc)*100,2) IS NULL THEN 0 else Round((totalfromalllocbyfeedback.all_q2/totalfromallloc.totrespfromallloc)*100,2) end as perct_q2,
       case when Round((totalfromalllocbyfeedback.all_q3/totalfromallloc.totrespfromallloc)*100,2) IS NULL THEN 0 else Round((totalfromalllocbyfeedback.all_q3/totalfromallloc.totrespfromallloc)*100,2) end as perct_q3,
       case when Round((totalfromalllocbyfeedback.all_q4/totalfromallloc.totrespfromallloc)*100,2) IS NULL THEN 0 else Round((totalfromalllocbyfeedback.all_q4/totalfromallloc.totrespfromallloc)*100,2) end as perct_q4,
       case when Round((totalfromalllocbyfeedback.all_q5/totalfromallloc.totrespfromallloc)*100,2) IS NULL THEN 0 else Round((totalfromalllocbyfeedback.all_q5/totalfromallloc.totrespfromallloc)*100,2) end as perct_q5,
       case when Round((totalfromalllocbyfeedback.all_q6/totalfromallloc.totrespfromallloc)*100,2) IS NULL THEN 0 else Round((totalfromalllocbyfeedback.all_q6/totalfromallloc.totrespfromallloc)*100,2) end as perct_q6,
       case when Round((totalfromalllocbyfeedback.all_q7/totalfromallloc.totrespfromallloc)*100,2) IS NULL THEN 0 else Round((totalfromalllocbyfeedback.all_q7/totalfromallloc.totrespfromallloc)*100,2) end as perct_q7
FROM   intelapp.totalfromalllocbyfeedback 
JOIN   intelapp.totalfromallloc) as FinalRptData;

ELSE 
### Note : Clean up Location Names###
DROP TEMPORARY TABLE IF EXISTS intelapp.RptRawData;
DROP TEMPORARY TABLE IF EXISTS intelapp.TotalbyLocation;
DROP TEMPORARY TABLE IF EXISTS intelapp.TotalFromAllLoc;
DROP TEMPORARY TABLE IF EXISTS intelapp.TotalFromAllLocByFeedback;


CREATE TEMPORARY TABLE  intelapp.RptRawData
SELECT temptbl.location AS PrimaryLocation, 
       temptbl.feedback, 
       q1.count_question1, 
       q2.count_question2, 
       q3.count_question3, 
       q4.count_question4, 
       q5.count_question5, 
       q6.count_question6, 
       q7.count_question7 
FROM   (SELECT location, 
               'Excellent' AS Feedback 
        FROM   `intelapp`.`customerinfo` 
        GROUP  BY 1,2 
        UNION ALL 
        SELECT location, 
               'Good'AS Feedback 
        FROM   `intelapp`.`customerinfo` 
        GROUP  BY 1,2 
        UNION ALL 
        SELECT location, 
               'Average'AS Feedback 
        FROM   `intelapp`.`customerinfo` 
        GROUP  BY 1,2 
        UNION ALL 
        SELECT location, 
               'Poor'AS Feedback 
        FROM   `intelapp`.`customerinfo` 
        GROUP  BY 1,2) AS temptbl 
       LEFT OUTER JOIN (SELECT location, 
                               CASE 
                                 WHEN question1 = 20 THEN 'Excellent' 
                                 WHEN question1 = 15 THEN 'Good' 
                                 WHEN question1 = 10 THEN 'Average' 
                                 WHEN question1 = 5 THEN 'Poor' 
                                 ELSE NULL 
                               end        AS question1desc, 
                               Count(CASE 
                                       WHEN question1 = 20 THEN 'Excellent' 
                                       WHEN question1 = 15 THEN 'Good' 
                                       WHEN question1 = 10 THEN 'Average' 
                                       WHEN question1 = 5 THEN 'Poor' 
                                       ELSE NULL 
                                     end) AS count_question1 
                        FROM   `intelapp`.`customerinfo` 
                        WHERE  dtDefault between Start_Date and End_Date 
                        GROUP  BY location, 
                                  question1desc) AS q1 
                    ON temptbl.location = q1.location 
                       AND temptbl.feedback = q1.question1desc 
       LEFT OUTER JOIN (SELECT location, 
                               CASE 
                                 WHEN question2 = 20 THEN 'Excellent' 
                                 WHEN question2 = 15 THEN 'Good' 
                                 WHEN question2 = 10 THEN 'Average' 
                                 WHEN question2 = 5 THEN 'Poor' 
                                 ELSE NULL 
                               end        AS question2desc, 
                               Count(CASE 
                                       WHEN question2 = 20 THEN 'Excellent' 
                                       WHEN question2 = 15 THEN 'Good' 
                                       WHEN question2 = 10 THEN 'Average' 
                                       WHEN question2 = 5 THEN 'Poor' 
                                       ELSE NULL 
                                     end) AS count_question2 
                        FROM   `intelapp`.`customerinfo` 
                        WHERE  dtDefault between Start_Date and End_Date 
                        GROUP  BY location, 
                                  question2desc) AS q2 
                    ON temptbl.location = q2.location 
                       AND temptbl.feedback = q2.question2desc 
       LEFT OUTER JOIN (SELECT location, 
                               CASE 
                                 WHEN question3 = 20 THEN 'Excellent' 
                                 WHEN question3 = 15 THEN 'Good' 
                                 WHEN question3 = 10 THEN 'Average' 
                                 WHEN question3 = 5 THEN 'Poor' 
                                 ELSE NULL 
                               end        AS question3desc, 
                               Count(CASE 
                                       WHEN question3 = 20 THEN 'Excellent' 
                                       WHEN question3 = 15 THEN 'Good' 
                                       WHEN question3 = 10 THEN 'Average' 
                                       WHEN question3 = 5 THEN 'Poor' 
                                       ELSE NULL 
                                     end) AS count_question3 
                        FROM   `intelapp`.`customerinfo` 
                        WHERE  dtDefault between Start_Date and End_Date 
                        GROUP  BY location, 
                                  question3desc) AS q3 
                    ON temptbl.location = q3.location 
                       AND temptbl.feedback = q3.question3desc 
       LEFT OUTER JOIN (SELECT location, 
                               CASE 
                                 WHEN question4 = 20 THEN 'Excellent' 
                                 WHEN question4 = 15 THEN 'Good' 
                                 WHEN question4 = 10 THEN 'Average' 
                                 WHEN question4 = 5 THEN 'Poor' 
                                 ELSE NULL 
                               end        AS question4desc, 
                               Count(CASE 
                                       WHEN question4 = 20 THEN 'Excellent' 
                                       WHEN question4 = 15 THEN 'Good' 
                                       WHEN question4 = 10 THEN 'Average' 
                                       WHEN question4 = 5 THEN 'Poor' 
                                       ELSE NULL 
                                     end) AS count_question4 
                        FROM   `intelapp`.`customerinfo` 
                        WHERE  dtDefault between Start_Date and End_Date 
                        GROUP  BY location, 
                                  question4desc) AS q4 
                    ON temptbl.location = q4.location 
                       AND temptbl.feedback = q4.question4desc 
       LEFT OUTER JOIN (SELECT location, 
                               CASE 
                                 WHEN question5 = 20 THEN 'Excellent' 
                                 WHEN question5 = 15 THEN 'Good' 
                                 WHEN question5 = 10 THEN 'Average' 
                                 WHEN question5 = 5 THEN 'Poor' 
                                 ELSE NULL 
                               end        AS question5desc, 
                               Count(CASE 
                                       WHEN question5 = 20 THEN 'Excellent' 
                                       WHEN question5 = 15 THEN 'Good' 
                                       WHEN question5 = 10 THEN 'Average' 
                                       WHEN question5 = 5 THEN 'Poor' 
                                       ELSE NULL 
                                     end) AS count_question5 
                        FROM   `intelapp`.`customerinfo` 
                        WHERE  dtDefault between Start_Date and End_Date 
                        GROUP  BY location, 
                                  question5desc) AS q5 
                    ON temptbl.location = q5.location 
                       AND temptbl.feedback = q5.question5desc 
       LEFT OUTER JOIN (SELECT location, 
                               CASE 
                                 WHEN question6 = 20 THEN 'Excellent' 
                                 WHEN question6 = 15 THEN 'Good' 
                                 WHEN question6 = 10 THEN 'Average' 
                                 WHEN question6 = 5 THEN 'Poor' 
                                 ELSE NULL 
                               end        AS question6desc, 
                               Count(CASE 
                                       WHEN question6 = 20 THEN 'Excellent' 
                                       WHEN question6 = 15 THEN 'Good' 
                                       WHEN question6 = 10 THEN 'Average' 
                                       WHEN question6 = 5 THEN 'Poor' 
                                       ELSE NULL 
                                     end) AS count_question6 
                        FROM   `intelapp`.`customerinfo` 
						WHERE  dtDefault between Start_Date and End_Date
                        GROUP  BY location, 
                                  question6desc) AS q6 
                    ON temptbl.location = q6.location 
                       AND temptbl.feedback = q6.question6desc 
       LEFT OUTER JOIN (SELECT location, 
                               CASE 
                                 WHEN question7 = 20 THEN 'Excellent' 
                                 WHEN question7 = 15 THEN 'Good' 
                                 WHEN question7 = 10 THEN 'Average' 
                                 WHEN question7 = 5 THEN 'Poor' 
                                 ELSE NULL 
                               end        AS question7desc, 
                               Count(CASE 
                                       WHEN question7 = 20 THEN 'Excellent' 
                                       WHEN question7 = 15 THEN 'Good' 
                                       WHEN question7 = 10 THEN 'Average' 
                                       WHEN question7 = 5 THEN 'Poor' 
                                       ELSE NULL 
                                     end) AS count_question7 
                        FROM   `intelapp`.`customerinfo` 
                        WHERE  dtDefault between Start_Date and End_Date 
                        GROUP  BY location, 
                                  question7desc) AS q7 
                    ON temptbl.location = q7.location 
                       AND temptbl.feedback = q7.question7desc;
                       
                       
                       
###### Important Every Query below this comment is only for 5 questions. If in future more questions to added please add the extra line of codes below ########  
                     
## Using Temp Table to calculate the Total Response by location
CREATE TEMPORARY TABLE  intelapp.TotalbyLocation
select PrimaryLocation,    
	   sum(count_question1) as TotRespByLoc
       from intelapp.RptRawData
       group by PrimaryLocation;  
       
       
## Using Temp Table to calculate the Total Response from all location
CREATE TEMPORARY TABLE  intelapp.TotalFromAllLoc
select  sum(count_question1) as TotRespFromAllLoc
       from intelapp.RptRawData;  

## Report for all location
CREATE TEMPORARY TABLE  intelapp.TotalFromAllLocByFeedback
SELECT 'ALL LOCATION'       AS Location, 
       rptrawdata.feedback, 
       Sum(count_question1) AS All_q1,
       Sum(count_question2) AS All_q2 ,
       Sum(count_question3) AS All_q3 ,
       Sum(count_question4) AS All_q4 ,
       Sum(count_question5) AS All_q5 ,
       Sum(count_question6) AS All_q6 ,
       Sum(count_question7) AS All_q7
FROM   intelapp.rptrawdata 
GROUP  BY rptrawdata.feedback;
       
       
## Join the above two temp tables with the main temp table

Select * from (
SELECT          rptrawdata.primarylocation, rptrawdata.feedback,
                CASE 
                                WHEN Round(count_question1/totrespbyloc *100,2) IS NULL THEN 0 
                                ELSE Round(count_question1/totrespbyloc *100,2) 
                end AS perct_q1,
                CASE 
                                WHEN Round(count_question2/totrespbyloc *100,2) IS NULL THEN 0 
                                ELSE Round(count_question2/totrespbyloc *100,2) 
                end AS perct_q2,
                CASE 
                                WHEN Round(count_question3/totrespbyloc *100,2) IS NULL THEN 0 
                                ELSE Round(count_question3/totrespbyloc *100,2) 
                end AS perct_q3,
                CASE 
                                WHEN Round(count_question4/totrespbyloc *100,2) IS NULL THEN 0 
                                ELSE Round(count_question4/totrespbyloc *100,2) 
                end AS perct_q4,
                CASE 
                                WHEN Round(count_question5/totrespbyloc *100,2) IS NULL THEN 0 
                                ELSE Round(count_question5/totrespbyloc *100,2) 
                end AS perct_q5,
                CASE 
                                WHEN Round(count_question6/totrespbyloc *100,2) IS NULL THEN 0 
                                ELSE Round(count_question6/totrespbyloc *100,2) 
                end AS perct_q6,
                CASE 
                                WHEN Round(count_question7/totrespbyloc *100,2) IS NULL THEN 0 
                                ELSE Round(count_question7/totrespbyloc *100,2) 
                end AS perct_q7            
FROM            intelapp.rptrawdata 
LEFT OUTER JOIN intelapp.totalbylocation 
ON              rptrawdata.primarylocation = totalbylocation.primarylocation

Union all
## Appending the All Location metrics to the above query

SELECT totalfromalllocbyfeedback.location, 
       totalfromalllocbyfeedback.feedback, 
       case when Round((totalfromalllocbyfeedback.all_q1/totalfromallloc.totrespfromallloc)*100,2) IS NULL THEN 0 else Round((totalfromalllocbyfeedback.all_q1/totalfromallloc.totrespfromallloc)*100,2) end as perct_q1,
       case when Round((totalfromalllocbyfeedback.all_q2/totalfromallloc.totrespfromallloc)*100,2) IS NULL THEN 0 else Round((totalfromalllocbyfeedback.all_q2/totalfromallloc.totrespfromallloc)*100,2) end as perct_q2,
       case when Round((totalfromalllocbyfeedback.all_q3/totalfromallloc.totrespfromallloc)*100,2) IS NULL THEN 0 else Round((totalfromalllocbyfeedback.all_q3/totalfromallloc.totrespfromallloc)*100,2) end as perct_q3,
       case when Round((totalfromalllocbyfeedback.all_q4/totalfromallloc.totrespfromallloc)*100,2) IS NULL THEN 0 else Round((totalfromalllocbyfeedback.all_q4/totalfromallloc.totrespfromallloc)*100,2) end as perct_q4,
       case when Round((totalfromalllocbyfeedback.all_q5/totalfromallloc.totrespfromallloc)*100,2) IS NULL THEN 0 else Round((totalfromalllocbyfeedback.all_q5/totalfromallloc.totrespfromallloc)*100,2) end as perct_q5,
       case when Round((totalfromalllocbyfeedback.all_q6/totalfromallloc.totrespfromallloc)*100,2) IS NULL THEN 0 else Round((totalfromalllocbyfeedback.all_q6/totalfromallloc.totrespfromallloc)*100,2) end as perct_q6,
       case when Round((totalfromalllocbyfeedback.all_q7/totalfromallloc.totrespfromallloc)*100,2) IS NULL THEN 0 else Round((totalfromalllocbyfeedback.all_q7/totalfromallloc.totrespfromallloc)*100,2) end as perct_q7
FROM   intelapp.totalfromalllocbyfeedback 
JOIN   intelapp.totalfromallloc) as FinalRptData
where  primarylocation =loc ;
   END IF;
  
     
END