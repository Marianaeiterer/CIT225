USE restaurant;

-- populate the restaurant table 

INSERT INTO restaurant (restaurant_id, restaurant_name, street_address, city, state, country, zip_code, phone, phone2, email)
VALUES (1, 'Mars Restaurant', '1427 Tabuk Place', 'Miami', 'Florida', 'United States', 31342, '385-839-9990', NULL, 'mars.restaurant@restaurant.com'),
(2, 'Soup Restaurant', '457 Coral Way', 'Miami', 'Florida', 'United States', 32839, '385-849-0980', NULL, 'soup.restaurant@restaurant.com'), 
(3, 'Tanners Restaurant', '1627 Brownsville', 'Miami', 'Florida', 'United States', 32883, '541-293-9990', '385-930-9382', 'tanners.restaurant@restaurant.com'),
(4, 'Dinner Restaurant', '351 W 100 S St', 'Orem', 'Utah', 'United States', 84058, '234-928-9930', NULL, 'dinner.restaurant@restaurant.com'), 
(5, 'Sunflower Restaurant', '11592 S 1300 E', 'Sandy', 'Utah', 'United States', 84094, '345-948-9750', NULL, 'sunflower.restaurant@restaurant.com');
 
-- populate the staff table 

INSERT INTO staff (staff_id, first_name, last_name, email, street_address, city, state, country, zip_code, phone, active)
VALUES (1, 'John', 'Williams', 'john.williams@restaurantstaff.com', '3692 SW 23rd Terrace', 'Miami', 'Florida', 'United States', 33145, '384-940-9283', 1),
(2, 'David', 'Rollins', 'david.rollins@restaurantstaff.com', '3490 SW 22nd Terrace', 'Miami', 'Florida', 'United States', 33144, '382-993-7777', 1),
(3, 'Maria', 'Smith', 'maria.smith@restaurantstaff.com', '3300 SW 21nd Terrace', 'Miami', 'Florida', 'United States', 33144, '382-999-3333', 0),
(4, 'Julia', 'Thomas', 'julia.thomas@restaurantstaff.com', '2360 SW 17th St', 'Miami', 'Florida', 'United States', 33145, '234-595-6666', 0),
(5, 'Susan', 'Davis', 'susan.davis@restaurantstaff.com', '2260 SW 15th St', 'Miami', 'Florida', 'United States', 33145 , '349-999-9999', 1),
(6, 'Karen', 'Moore', 'karen.moore@restaurantstaff.com', '2360 SW 16th St', 'Miami', 'Florida', 'United States', 33145, '465-384-9292', 1),
(7, 'Betty', 'Miller', 'betty.miller@restaurantstaff.com', '3480 SW 26nd Terrace', 'Miami', 'Florida', 'United States', 33144, '784-838-8844', 1),
(8, 'Kurt', 'Still', 'kurt.still@restaurantstaff.com', '3490 SW 21nd Terrace', 'Miami', 'Florida', 'United States', 33144, '444-888-7777', 1),
(9, 'Ian', 'Olvera', 'ian.olvera@restaurantstaff.com', '1490 SW 28nd Terrace', 'Miami', 'Florida', 'United States', 33144, '435-993-8877', 1),
(10, 'Mike', 'Stephens', 'mike.stephens@restaurantstaff.com', '500 E 200 S', 'Orem', 'Utah', 'United States', 84702, '385-888-9999', 1),
(11, 'Barbara', 'Johnson', 'Barbara.johnson@restaurantstaff.com', '4859 W 600 S', 'Springville', 'Utah', 'United States', 85744, '541-222-2222', 1),
(12, 'Linda', 'Brown', 'linda.brown@restaurantstaff.com', '1000 E 300 S', 'Orem', 'Utah', 'United States', 89384, '444-555-6666', 1),
(13, 'Elizabeth', 'Moore', 'elizabeth.white@restaurantstaff.com', '2503 W 500 S', 'Provo', 'Utah', 'United States', 84633, '234-677-5555', 1),
(14, 'Jeremy', 'Fortner', 'jeremy.fortner@restaurantstaff.com', '2455 E 200 S', 'Sandy', 'Utah', 'United States', 86401, '234-333-4444', 0),
(15, 'Steve', 'Moore', 'steve.pullen@restaurantstaff.com', '2490 SW 15th St', 'Miami', 'Florida', 'United States', 33145, '234-345-2345', 1);

-- populate restaurant_has_staff table:

INSERT INTO restaurant_has_staff (restaurant_id, staff_id)
VALUES (1,1),
(1,2),
(1,6),
(2,3),
(2,5),
(2,7),
(3,4),
(3,8),
(3,9),
(3,6),
(4,13),
(4,10),
(4,11),
(5,15),
(5,12),
(5,14);

-- populate beverage table

INSERT INTO beverage (beverage_id, beverage_name, beverage_description)
VALUES (1, 'Coca', NULL),
(2, 'Root Bear', NULL),
(3, 'Lemonade', NULL),
(4, 'Raspberry Lemonade', NULL),
(5, 'Strawberry Lemonade', NULL),
(6, 'Hot Chocolate', 'Special hot chocolate with Nutella');

-- populate restaurant_has_beverage table

INSERT INTO restaurant_has_beverage (restaurant_id, beverage_id, bevarage_price)
VALUES (1,1, 2.00),
(1,2, 2.50),
(1,3, 4.00),
(1,5, 4.00),
(1,6, 6.00),
(2,3, 3.00),
(3,6,7.00),
(3,1,1.50),
(3,3,4.00),
(4,6,5.00),
(4,1, 2.50),
(4,2, 2.50),
(4,5, 3.00),
(5,1, 2.00),
(5,2, 2.00),
(5,3, 2.00),
(5,4, 2.50),
(5,5, 2.50);

-- populate food_category table

INSERT INTO food_category (food_id, food_category)
VALUES (1, 'APPETIZERS'),
(2, 'ENTREES'),
(3, 'DESSERT');

-- populate food table

INSERT INTO food (food_id, food_name, food_description, food_category_id)
VALUES (1, 'Delicious Brownie', NULL, 3),
(2, 'Lemon Cheesecake', NULL, 3),
(3, 'Chocolate Cake', NULL, 3), 
(4, 'Chocolate Mousse', NULL, 3),
(5, 'Pumpkin Pie', 'pumpkin cream in a cookie base', 3),
(6, 'Fricassee', 'sheered chicken with corn cream and cheese on top served with potato sticks', 2),
(7, 'Buffalo Chicken', 'served with potato fries', 2),
(8, 'Mac & Cheese', NULL, 2),
(9, 'Rice & Beans', 'served with eggs or chicken', 2),
(10, 'File Mignon', 'served with mashed potato', 2),
(11, 'Tomato soup', NULL, 1),
(12, 'Chips & Salsa', NULL, 1),
(13, 'Cheese potato fries', NULL, 1),
(14, 'Broccoli Cheddar soup', NULL, 1),
(15, 'Buffalo Wings', NULL, 1);

-- populate restaurant_has_food table

INSERT INTO restaurant_has_food (restaurant_id, food_id, food_price)
VALUES (1, 1, 5.00),
(1, 2, 7.50),
(1, 3, 4.50),
(1, 4, 3.50),
(1, 6, 23.90),
(1, 7, 20.00),
(1, 12, 10.00),
(1, 15, 10.00),
(2, 3, 4.00),
(2, 5, 2.50),
(2, 8, 22.00),
(2, 9, 18.90),
(2, 13, 6.00),
(2, 14, 8.50),
(3, 2, 5.00),
(3, 4, 7.50),
(3, 6, 22.90),
(3, 10, 28.90),
(3, 11, 9.50),
(3, 12, 7.00),
(4, 1, 6.00),
(4, 3, 5.90),
(4, 4, 7.20),
(4, 6, 19.90),
(4, 7, 19.00),
(4, 14, 8.00),
(4, 15, 11.50),
(5, 2, 4.30),
(5, 5, 5.00),
(5, 6, 25.90),
(5, 10, 28.90),
(5, 12, 6.90),
(5, 13, 12.00);

-- populate _table table

INSERT INTO _table (table_id, chairs, section, status)
VALUES (1, 4, 'WINDOW', 'FREE'),
(2, 6, 'WINDOW', 'FREE'),
(3, 5, 'WINDOW', 'FREE'),
(4, 4, 'MIDDLE', 'RESERVED'),
(5, 2, 'MIDDLE', 'FREE'),
(6, 2, 'COUNTER', 'FREE'),
(7, 7, 'MIDDLE', 'FREE'),
(8, 3, 'WINDOW', 'FREE'),
(9, 2, 'WINDOW', 'RESERVED'),
(10, 5, 'COUNTER', 'FREE');

-- populate restaurant_has_table table

INSERT INTO restaurant_has_table (restaurant_id, table_id)
VALUES (1, 1),
(2, 2),
(4, 3),
(1, 4),
(1, 10),
(2, 5),
(2, 9),
(3, 6),
(3, 7),
(3, 8),
(4, 4),
(4, 8),
(5, 6),
(5, 5),
(5, 10);



