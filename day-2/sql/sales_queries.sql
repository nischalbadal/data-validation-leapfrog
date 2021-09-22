
--check if any sale record has not paid tax
SELECT count(*) AS impacted_record_count,
    CASE
        WHEN COUNT(*) > 0 THEN 'failed'
        ELSE 'passed'
    END AS test_status
FROM sales where quantity>0 AND tax_amt=0;


--check if inactive products are being sold or not
SELECT
    COUNT(*) AS impacted_record_count,
    CASE
        WHEN COUNT(*) > 0 THEN 'failed'
        ELSE 'passed'
    END AS test_status
FROM sales
WHERE product_id IN(
    SELECT DISTINCT product_id
    FROM product
    where active = 'N'
    );

--check if all transaction numbers are valid bill numbers
select count(*) AS impacted_record_count,
    CASE
        WHEN COUNT(*) > 0 THEN 'failed'
        ELSE 'passed' END AS test_status
from sales where transaction_id <> bill_no;

--check if bill date of records are before the created date
SELECT
    COUNT(*) AS impacted_record_count,
    CASE
        WHEN COUNT(*) > 0 THEN 'failed'
        ELSE 'passed'
    END AS test_status
FROM sales WHERE bill_date>sales.created_date;



