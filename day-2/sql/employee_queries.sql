-- Checking if employees punch in to their right department or not.
SELECT
    COUNT(*) AS impacted_record_count,
    CASE
        WHEN COUNT(*) > 0 THEN 'failed'
        ELSE 'passed'
    END AS test_status
FROM (
select
   e.client_employee_id ,e.department_id, t.department_id
 from employee e inner join timesheet t on e.client_employee_id = t.employee_id
group by e.client_employee_id, e.department_id, t.department_id
having e.department_id <> t.department_id) tmp;


-- Checking if all are assigned to at least one employee.
SELECT
    COUNT(*) AS impacted_record_count,
    CASE
        WHEN COUNT(*) > 0 THEN 'failed'
        ELSE 'passed'
    END AS test_status
FROM employee t
WHERE role='Manager' AND client_employee_id NOT IN(
	select distinct manager_emp_id from employee where manager_emp_id is not null
);

--check if all the employees above 60 years of age are still working on lower salary
--let us assume that the salary below 5000 are considered as low
SELECT count(*) AS impacted_record_count,
    CASE
        WHEN COUNT(*) > 0 THEN 'failed'
        ELSE 'passed'
    END AS test_status FROM (
                                SELECT EXTRACT(YEAR from AGE(CURRENT_DATE, dob)) as "age", client_employee_id, salary
                                FROM employee
                                WHERE EXTRACT(YEAR from AGE(CURRENT_DATE, dob)) > 60
                                  AND salary < 5000
                            ) t;

--check if any employees earn greater than manager
--condition: for an employee to earn as manager, the minimum salary is 10000
SELECT count(*) AS employees_count,
    CASE
        WHEN COUNT(*) > 0 THEN 'passed'
        ELSE 'failed'
    END AS test_status FROM (
SELECT * from employee
WHERE role <> 'Manager' AND salary>10000
  ) t;