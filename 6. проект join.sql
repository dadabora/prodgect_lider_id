-- по статусу Completions

SELECT  users.id, users.first_name, users.last_name, point_id.name AS name_point, city_id.city 
  FROM users
    LEFT JOIN event_id
     ON users.id = event_id.user_id  AND status_id = 2
    JOIN point_id
     ON point_id.id = event_id.point_id 
    JOIN city_id
     ON city_id.id = point_id.city_id 
   ;

  -- завершенные мероприятия и их форма
  
SELECT  users.id, users.first_name, users.last_name, format_id.format 
  FROM users
    JOIN event_id
     ON users.id = event_id.user_id  AND status_id = 2
    RIGHT JOIN format_id
     ON format_id.id = event_id.format_id 
   ;