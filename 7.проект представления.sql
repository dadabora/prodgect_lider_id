CREATE VIEW cat AS 
  SELECT  users.id, users.first_name, users.last_name, point_id.name AS name_point, city_id.city 
   FROM users
    LEFT JOIN event_id
     ON users.id = event_id.user_id  AND status_id = 2
    JOIN point_id
     ON point_id.id = event_id.point_id 
    JOIN city_id
     ON city_id.id = point_id.city_id 
   ;
   
SELECT * FROM cat;


CREATE VIEW web AS
 SELECT  users.id, users.first_name, users.last_name, format_id.format 
  FROM event_id
    RIGHT JOIN format_id
     ON format_id.id = event_id.format_id AND format_id.id = 1
    JOIN users
     ON users.id = event_id.user_id  AND status_id = 2
   ;
   
SELECT * FROM web;

DROP VIEW web, cat;