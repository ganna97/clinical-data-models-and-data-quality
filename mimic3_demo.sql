/*
* CTE is a temparary result set that you can reference within a select , insert, 
update or delete statement.
* the with clause can include one or more CTEs separated by commas.
* enables user to more easily write and maintain complex queries via increased 
readability and simplification.
* CTEs can be a useful tool when you need to generate temporary results 
set that can be accessed in a select, insert, update, delete or merge statement.
* a CTE must be followed by select, update, delete or insert statements that references 
some or all the CTE columns.
*/
create database mimic3_demo;
use mimic3_demo;
WITH diagnoses1 as ( select distinct m3.subject_id as person_id 
from mimic3_demo.diagnoses_icd m3), 
diagnoses2 as ( select distinct d1.person_id, m3.hadm_id as visit_occurance_id 
from diagnoses1 d1 
     join mimic3_demo.diagnoses_icd m3 on d1.person_id = m3.subject_id),
     condition_occurance as (select distinct d2.person_id, d2.visit_occurance_id,
     m3.icd9_code as condition_source_value from diagnoses2 d2 join mimic3_demo.diagnoses_icd m3 
     on d2.visit_occurance_id = m3.hadm_id)
select * from condition_occurance;

WITH diagnoses1 as ( select distinct m3.subject_id as person_id from mimic3_demo.diagnoses_icd m3)
select * from mimic3_demo.diagnoses_icd;

select distinct m3.subject_id as person_id from mimic3_demo.diagnoses_icd m3;

with diagnoses1 as (select distinct m3.subject_id as person_id 
from mimic3_demo.diagnoses_icd m3),
diagnoses2 as (
select distinct d1.person_id, m3.hadm_id as visit_occurance_id 
from diagnoses1 d1 
join mimic3_demo.diagnoses_icd m3 on d1.person_id = m3.subject_id)
select * from diagnoses2;
;
with d1 as (select distinct m3.subject_id as person_id from mimic3_demo.diagnoses_icd m3)
select * from d1;


