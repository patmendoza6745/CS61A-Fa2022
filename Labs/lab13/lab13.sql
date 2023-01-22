.read data.sql


CREATE TABLE bluedog AS
  SELECT color, pet FROM students
      WHERE color = "blue" AND pet = "dog";

CREATE TABLE bluedog_songs AS
  SELECT color, pet, song FROM students
      WHERE color = "blue" AND pet = "dog";


CREATE TABLE smallest_int_having AS
  SELECT time, smallest FROM students
      GROUP BY smallest HAVING COUNT(number) = 1;


CREATE TABLE matchmaker AS
  SELECT a.pet, a.song, a.color, b.color
      FROM students AS a, students AS b
        WHERE a.pet = b.pet AND a.song = b.song AND a.time < b.time;


CREATE TABLE sevens AS
  SELECT a.seven
      FROM students AS a, numbers AS b
        WHERE a.number = 7 AND b.time = a.time AND b."7" = "True";


CREATE TABLE average_prices AS
  SELECT category, AVG(MSRP) as average_price FROM products GROUP BY category;


CREATE TABLE lowest_prices AS
  SELECT store, item, MIN(price) FROM inventory GROUP BY item;

CREATE TABLE products_helper AS
  SELECT name, MIN(MSRP/rating) FROM products GROUP BY category;

CREATE TABLE shopping_list AS
  SELECT a.item, a.store
    FROM lowest_prices AS a, products_helper as b
      WHERE a.item = b.name;


CREATE TABLE total_bandwidth AS
  SELECT SUM(a.Mbs)
    FROM stores AS a, shopping_list AS b
      WHERE a.store = b.store;

