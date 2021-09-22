
--case where discount is mentioned in product name but not applied in sales
SELECT
    COUNT(*) AS impacted_record_count,
    CASE
        WHEN COUNT(*) > 0 THEN 'failed'
        ELSE 'passed'
    END AS test_status
FROM sales
WHERE discount_amt = 0 AND product_id IN (
    SELECT product_id FROM product WHERE product_name LIKE '%ofr%' OR product_name LIKE '%off%'
    );

--checking if selling of any products bears loss to the company
--there is found one record whose mrp in 0.01 but the price is 36.4325 which can be an error.
  SELECT
    COUNT(*) AS impacted_record_count,
    CASE
        WHEN COUNT(*) > 0 THEN 'failed'
        ELSE 'passed'
    END AS test_status
FROM (
         select *
         from product
         where mrp < price
     ) s;

--check if all products have been sold at least once or not
SELECT
    COUNT(*) AS impacted_record_count,
    CASE
        WHEN COUNT(*) > 0 THEN 'failed'
        ELSE 'passed'
    END AS test_status
FROM product
WHERE product_id NOT IN (
    SELECT DISTINCT product_id FROM sales
    );


--check if the price of product is different in sales record
SELECT count(*) AS impacted_record_count,
    CASE
        WHEN COUNT(*) > 0 THEN 'failed'
        ELSE 'passed'
    END AS test_status FROM(
    SELECT p.product_id, p.price, s.price FROM product p JOIN sales s ON p.product_id = s.product_id
    GROUP BY p.product_id, p.price, s.price
) t;