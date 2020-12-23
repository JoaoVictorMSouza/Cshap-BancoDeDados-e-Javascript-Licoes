use infobdb;

show tables;

select * from patient;

select *
from patient
where confirmed_date like '%2020-01%';

select distinct infection_reason
from patient;

select *
from patient
where region like '%airport%' and (country = 'China' or country = 'Korea');

select * 
from patient
where infection_reason like '%contact%' or infection_reason like '%visit%';

select *
from patient
where infected_by = 31;

select *
from patient
where infected_by not like 'null';

select sex as genero, birth_year as nascimento, country as pais, infection_reason as motivo_de_infeccao,
case when sex ='male' then 'Homem'
	 when sex ='female' then 'Mulher'
     end as sexo
from patient
where sex not like 'null';

