USE restaurant;
-- Test Cases 
-- 1- In which restaurants do people with the last name Moore work 

SELECT CONCAT(s.first_name, ' ', s.last_name) as Employee, r.restaurant_name as Restaurant
FROM staff s
	INNER JOIN restaurant_has_staff rs
	 ON s.staff_id = rs.staff_id
	INNER JOIN restaurant r
	 ON rs.restaurant_id = r.restaurant_id
WHERE last_name = 'Moore';

-- 2- What are all the deserts and their prices that Mars Restaurant offers

SELECT f.food_name as Dessert, rf.food_price as Price
FROM food_category fc
	INNER JOIN food f
	 ON f.food_category_id = fc.food_id
	INNER JOIN restaurant_has_food rf
	 ON f.food_id = rf.food_id
	INNER JOIN restaurant r
	 ON rf.restaurant_id = r.restaurant_id
WHERE r.restaurant_name = 'Mars Restaurant' AND fc.food_category = 'DESSERT';

-- 3 - What restaurants have a table in the WINDOW section with 4 or more chairs

SELECT r.restaurant_name as Restaurant, t.section as Section, t.chairs as Seats
FROM restaurant r
	INNER JOIN restaurant_has_table rt
     ON r.restaurant_id = rt.restaurant_id
	INNER JOIN _table t
     ON rt.table_id = t.table_id
WHERE t.section = 'WINDOW' AND t.chairs >= 4;

-- 4 – In which restaurants the food “fricassee” is offered, order by the cheaper to the expensive price this food is 

SELECT r.restaurant_name as Restaurant, f.food_name as Food, rf.food_price as Price
FROM food f
	INNER JOIN restaurant_has_food rf
	 ON f.food_id = rf.food_id
	INNER JOIN restaurant r
	 ON rf.restaurant_id = r.restaurant_id
WHERE f.food_name = 'fricassee'
ORDER BY rf.food_price;

-- 5 – In which restaurants the “Hot Chocolate” is offered 

SELECT r.restaurant_name as Restaurant
FROM beverage b
	INNER JOIN restaurant_has_beverage rb
	 ON b.beverage_id = rb.beverage_id
	INNER JOIN restaurant r
	 ON rb.restaurant_id = r.restaurant_id
WHERE b.beverage_name = 'Hot Chocolate' AND b.beverage_description = 'Special hot chocolate with Nutella';

-- 6 - Who works or has worked in the Tanners Restaurant. Show everyone that has ever worked there and if they are active or not

SELECT CONCAT(s.first_name, ' ', s.last_name) as Employee,
CASE WHEN s.active = 1 then 'Active'
 ELSE 'Inactive' 
END as Status
FROM staff s
	INNER JOIN restaurant_has_staff rs
	 ON s.staff_id = rs.staff_id
	INNER JOIN restaurant r
	 ON rs.restaurant_id = r.restaurant_id
WHERE r.restaurant_name = 'Tanners Restaurant';
	
-- 7 - What are the restaurants in Florida

SELECT restaurant_name AS Restaurant
FROM restaurant
WHERE state = 'Florida';