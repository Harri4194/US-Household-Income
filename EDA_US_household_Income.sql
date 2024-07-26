# US Household Income (Exploratory Data Analysis) 

select *
from us_household_income
;

select * 
from us_project.us_household_income_statistics
;

# Land
select State_Name, sum(ALand), sum(AWater)
from us_household_income
group by State_Name
order by 2 desc
limit 10
;

#Water
select State_Name, sum(ALand), sum(AWater)
from us_household_income
group by State_Name
order by 3 desc
limit 10
;


select *
from us_household_income u
join us_project.us_household_income_statistics us
	on u.id = us.id
    ;

select * 
from us_project.us_household_income_statistics
;

select u.State_Name, County, type, `Primary`, Mean, Median
from us_project.us_household_income u
inner join us_project.us_household_income_statistics us
	on u.id = us.id
 where Mean <> 0 
 ;

#mean
select u.State_Name, round(avg(Mean),1) as avg_mean, round(avg(Median),1) as avg_median
from us_project.us_household_income u
inner join us_project.us_household_income_statistics us
	on u.id = us.id
 where Mean <> 0
   group by u.State_Name
   order by 2 desc
   limit 10
 ;

#median
select u.State_Name, round(avg(Mean),1) as avg_mean, round(avg(Median),1) as avg_median
from us_project.us_household_income u
inner join us_project.us_household_income_statistics us
	on u.id = us.id
 where Mean <> 0
   group by u.State_Name
   order by 3 desc
   limit 10
 ;
 
 
 
select type, round(avg(Mean),1) as avg_mean, round(avg(Median),1) as avg_median
from us_project.us_household_income u
inner join us_project.us_household_income_statistics us
	on u.id = us.id
 where Mean <> 0
   group by 1
   order by 2 desc
   limit 10
 ;
 
 select type, count(type),round(avg(Mean),1) as avg_mean, round(avg(Median),1) as avg_median
from us_project.us_household_income u
inner join us_project.us_household_income_statistics us
	on u.id = us.id
 where Mean <> 0
   group by 1
   order by 4 desc
   limit 20
 ;
 
 
 select *
 from us_household_income
 where type = 'Community'
 ;
 
 
  select type, count(type),round(avg(Mean),1) as avg_mean, round(avg(Median),1) as avg_median
from us_project.us_household_income u
inner join us_project.us_household_income_statistics us
	on u.id = us.id
 where Mean <> 0
   group by 1
   having count(type) > 100  
   order by 4 desc
   limit 20
 ;
 
 
 select u.State_Name, City, round(avg(Mean),1) as avg_mean, round(avg(Median),1) as avg_median
from us_household_income u
join us_project.us_household_income_statistics us
	on u.id = us.id
    group by u.State_Name, City
    order by round(avg(Mean),1) desc
    ;