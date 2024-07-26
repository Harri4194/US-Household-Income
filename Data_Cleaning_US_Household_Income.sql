# US Household Income (Data Cleaning)

select *
from us_household_income
;

select * 
from us_project.us_household_income_statistics
;




alter table us_project.us_household_income_statistics rename column `ï»¿id` to `id`;

select count(id)
from us_household_income
;

select id, count(id)
from us_household_income
group by id
having count(id) > 1
;


select *
from (
select row_id,
id,
row_number() over (partition by id order by id)
from us_household_income
)
where row_num > 1
;


select *
from (
select row_id,
id,
row_number() over (partition by id order by id) row_num
from us_project.us_household_income
) duplicates
where row_num > 1
;

delete from us_household_income
where row_id in (
	select row_id
	from (
		  select row_id,
		  id,
          row_number() over (partition by id order by id) row_num
          from us_household_income
          ) duplicates
    where row_num > 1)
;


select distinct State_name
from us_project.us_household_income
order by 1
;


update us_project.us_household_income
set State_Name = 'Georgia'
where State_Name = 'georia'
;

update us_project.us_household_income
set State_Name = 'Alabama'
where State_Name = 'alabama'
;


select *
from us_project.us_household_income
where County = 'Autauga County'
order by 1
;

update us_household_income
set Place = 'Autaugaville'
where County = 'Autauga County'
and City = 'Vinemont'
;



update us_household_income
set type = 'Borough'
where type = 'Boroughs'
;

select ALand, AWater
from us_project.us_household_income
where (ALand = 0 or ALand = '' or ALand is null)
;
