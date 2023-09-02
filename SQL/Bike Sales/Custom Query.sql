SELECT 
	ord.order_id,
	CONCAT(cus.first_name, ' ', cus.last_name) AS [Customer Name],
	cus.city,
	cus.state,
	ord.order_date,
	pro.product_name,
	cat.category_name,
	brd.brand_name,
	SUM(oi.quantity) AS [Total Units],
	SUM(oi.quantity * oi.list_price) AS [Revenue],
	sto.store_name,
	CONCAT(stf.first_name, ' ', stf.last_name) AS [Sales Rep]

FROM sales.orders ord
	JOIN sales.customers cus ON ord.customer_id = cus.customer_id
	JOIN sales.order_items oi ON ord.order_id = oi.order_id
	JOIN production.products pro ON oi.product_id = pro.product_id
	JOIN production.categories cat ON pro.category_id = cat.category_id
	JOIN sales.stores sto ON ord.store_id = sto.store_id
	JOIN sales.staffs stf ON ord.staff_id = stf.staff_id
	JOIN production.brands brd ON pro.brand_id = brd.brand_id

GROUP BY ord.order_id,
	CONCAT(cus.first_name, ' ', cus.last_name),
	cus.city,
	cus.state,
	ord.order_date,
	pro.product_name,
	cat.category_name,
	brd.brand_name,
	sto.store_name,
	CONCAT(stf.first_name, ' ', stf.last_name)

/**
SELECT * 
FROM production.brands

SELECT * 
FROM production.products
**/
