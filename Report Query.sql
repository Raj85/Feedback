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
                        WHERE  dtdefault BETWEEN '2014-07-17' AND '2014-08-01' 
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
                        WHERE  dtdefault BETWEEN '2014-07-17' AND '2014-08-01' 
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
                        WHERE  dtdefault BETWEEN '2014-07-17' AND '2014-08-01' 
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
                        WHERE  dtdefault BETWEEN '2014-07-17' AND '2014-08-01' 
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
                        WHERE  dtdefault BETWEEN '2014-07-17' AND '2014-08-01' 
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
                        WHERE  dtdefault BETWEEN '2014-07-17' AND '2014-08-01' 
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
                        WHERE  dtdefault BETWEEN '2014-07-17' AND '2014-08-01' 
                        GROUP  BY location, 
                                  question7desc) AS q7 
                    ON temptbl.location = q7.location 
                       AND temptbl.feedback = q7.question7desc 
                  