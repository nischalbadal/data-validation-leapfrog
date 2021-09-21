--question no 1
SELECT
COUNT(*) AS impacted_record_count,
CASE WHEN COUNT(*) > 0 THEN 'failed' ELSE 'passed' END AS test_status
FROM
( SELECT
count(*) AS count
FROM employee e
GROUP BY e.first_name, e.last_name HAVING count(*) > 1) as filter_employee_table;

--question no 2
SELECT
    COUNT(*) AS records_count,
    CASE
        WHEN COUNT(*) > 0 THEN 'failed'
        ELSE 'passed'
    END AS test_status
FROM employee
WHERE fte<1 and fte_status='Full Time';


--question no 3
SELECT
 COUNT(*) AS records_count,
    CASE
        WHEN COUNT(*) > 0 THEN 'failed'
        ELSE 'passed'
    END AS test_status
FROM employee
WHERE term_reason <> '' and is_active = true;

--question no 4
SELECT
    COUNT(*) AS duplicate_bills_count,
    CASE
        WHEN COUNT(*) > 1 THEN 'failed'
        ELSE 'passed'
    END AS test_status
FROM sales
WHERE bill_no IN
(SELECT bill_no FROM sales GROUP BY product_id, bill_no HAVING COUNT(product_id)>1);

--question no 5
SELECT count(*) as impacted_records_count,
CASE
        WHEN COUNT(*) > 1 THEN 'failed'
        ELSE 'passed'
    END AS test_status
FROM sales
WHERE customer_id not in (
    select distinct customer_id from customer
    );

--question no 6
SELECT count(*) as impacted_records_count,
CASE
        WHEN COUNT(*) > 0 THEN 'failed'
        ELSE 'passed'
    END AS test_status
FROM sales
WHERE updated_by <> '' and updated_date is null;

--question no 7
SELECT COUNT(*) AS impacted_record_count,
CASE WHEN COUNT(*) > 0 THEN 'failed' ELSE 'passed' END AS test_status
FROM timesheet
WHERE hours_worked >24;

--questin no 8
SELECT COUNT(*) AS impacted_record_count,
    CASE
        WHEN COUNT(*) > 0 THEN 'failed'
        ELSE 'passed'
    END AS test_status
FROM timesheet
WHERE was_on_call= false AND on_call_hour>0;

--question no 9
SELECT COUNT(*) AS impacted_record_count,
    CASE
        WHEN COUNT(*) > 0 THEN 'failed'
        ELSE 'passed'
    END AS test_status
FROM timesheet
WHERE has_taken_break= true AND break_hour=0;
select * from timesheet;

--question no 10
SELECT
    COUNT(*) AS impacted_record_count,
    CASE
        WHEN COUNT(*) > 0 THEN 'failed'
        ELSE 'passed'
    END AS test_status
FROM timesheet
WHERE shift_type <>'Evening' AND shift_start_time > CAST('20:00:00' AS time);