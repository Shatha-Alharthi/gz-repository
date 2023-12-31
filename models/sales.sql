{{ config(schema='transaction') }}

WITH 

  sales AS (SELECT * FROM `gz_raw_data.raw_gz_sales`)

  ,product AS (SELECT * FROM `gz_raw_data.raw_gz_product`)

SELECT
  s.date_date
  ### Key ###
  ,s.orders_id
  ,s.pdt_id AS products_id
  ###########
	-- qty --
	,s.quantity AS qty
  -- revenue --
  ,s.revenue AS turnover
  -- cost --
  ,CAST(p.purchSE_PRICE AS FLOAT64) AS purchase_price
	,ROUND(s.quantity*CAST(p.purchSE_PRICE AS FLOAT64),2) AS purchase_cost
	-- margin --
<<<<<<< HEAD
	,s.revenue - s.quantity*CAST(p.purchSE_PRICE AS FLOAT64) AS product_margin
=======
	,ROUND(s.revenue-s.quantity*CAST(p.purchSE_PRICE AS FLOAT64),2) AS product_margin
>>>>>>> d4b58b521e29e0b31942ba96c60f58a56824ee33
FROM sales s
INNER JOIN product p ON s.pdt_id = p.products_id