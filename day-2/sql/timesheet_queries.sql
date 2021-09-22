--check if the shift date is weekend and the number of team mates absent is greater than 0
--assuming that the weekend is 6th and 7th date of week i.e. saturday and sunday
SELECT
    COUNT(*) AS impacted_record_count,
    CASE
        WHEN COUNT(*) > 0 THEN 'failed'
        ELSE 'passed'
    END AS test_status
FROM (
         SELECT *
         FROM timesheet
         WHERE EXTRACT(ISODOW FROM shift_date) IN (6, 7)
           AND num_teammates_absent > 0
     ) t;

--check if absent employees are set on call
SELECT
    COUNT(*) AS impacted_record_count,
    CASE
        WHEN COUNT(*) > 0 THEN 'failed'
        ELSE 'passed'
    END AS test_status
FROM (
         select *
         from timesheet
         where attendance = false and was_on_call = true
     ) t;