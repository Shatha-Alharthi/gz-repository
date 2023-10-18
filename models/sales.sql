{{ config(schema='transaction') }}

WITH 

   sales AS (SELECT * FROM `shatha-402107`.`gz_dev_1`.`stg_sales` )

  ,product As (SELECT * FROM `shatha-402107`.`gz_dev_1`.`stg_product` )

SELECT
  s.date_date
  
  ,s.orders_id
  ,s.pdt_id 
	,s.quantity 
  ,s.revenue 
  ,CAST(p.purchase_price AS FLOAT64) AS purchase_price
	,ROUND(s.quantity*CAST(p.purchase_price AS FLOAT64),2) AS purchase_cost

	,ROUND(s.revenue -s.quantity*CAST(p.purchase_price AS FLOAT64),2) AS product_margin

FROM shatha-402107.gz_raw_data.raw_gz_sales as  s
INNER JOIN product as p ON s.pdt_id = p.products_id
