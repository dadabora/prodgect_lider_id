DELIMITER //


CREATE TRIGGER validate_status_id_format_id_insert BEFORE INSERT ON event_id
FOR EACH ROW BEGIN
  IF NEW.status_id IS NULL OR NEW.format_id IS NULL THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Both status_id and format_id are NULL';
  END IF;
END//


  
CREATE TRIGGER validate_status_id_format_id_update BEFORE UPDATE ON event_id
FOR EACH ROW BEGIN
  IF NEW.status_id IS NULL OR NEW.format_id IS NULL THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Both status_id and format_id are NULL';
  END IF;
END//

DELIMITER ;

INSERT INTO event_id
  (user_id, point_id, status_id, format_id)
VALUES
  (20, 20, 3, 2);

INSERT INTO event_id
  (user_id, point_id, status_id, format_id)
VALUES
  (20, 20, NULL, NULL);

