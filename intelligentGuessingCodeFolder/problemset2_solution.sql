select * from (
select d.name as department, e.name as employee, e.salary
from employee e left join department d
on e.departmentid=d.id
where d.name = 'IT' and 
e.salary in (select distinct(salary) from employee where departmentid=1 order by salary desc limit 3)

union all

select d.name as department, e.name as employee, e.salary
from employee e left join department d
on e.departmentid=d.id
where d.name = 'Sales' and
e.salary in (select distinct(salary) from employee where departmentid=2 order by salary desc limit 3)
) as x
order by x.department
