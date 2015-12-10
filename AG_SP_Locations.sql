CREATE DEFINER=`root`@`localhost` PROCEDURE `ListLocations`()
BEGIN
SELECT location FROM intelapp.customerinfo
group by location 
union all
select distinct 'ALL LOCATION' as location from intelapp.customerinfo;
END