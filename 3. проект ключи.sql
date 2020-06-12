-- создаем ключи

ALTER TABLE profiles
  ADD CONSTRAINT profiles_user_id_fk 
    FOREIGN KEY (user_id) REFERENCES users(id)
      ON DELETE CASCADE,
  ADD CONSTRAINT profiles_photo_id_fk
    FOREIGN KEY (photo_id) REFERENCES media(id)
      ON DELETE SET NULL;
     
ALTER TABLE profiles
  ADD CONSTRAINT profiles_city_id_fk 
    FOREIGN KEY (city_id) REFERENCES city_id(id)
      ON DELETE CASCADE;
      
ALTER TABLE media
  ADD CONSTRAINT media_media_types_fk 
    FOREIGN KEY (media_type_id) REFERENCES media_types(id)
      ON DELETE CASCADE;
 -- жду ответа     
ALTER TABLE point_id
  ADD CONSTRAINT point_id_city_id_fk 
    FOREIGN KEY (city_id) REFERENCES city_id(id)
      ON DELETE CASCADE;
      
ALTER TABLE event_participant
  ADD CONSTRAINT event_participant_user_id_fk 
    FOREIGN KEY (user_id) REFERENCES users(id)
      ON DELETE CASCADE;
     
ALTER TABLE event_participant     
  ADD CONSTRAINT event_participant_id_fk
    FOREIGN KEY (event_id) REFERENCES event_id(id)
      ON DELETE CASCADE;
      
ALTER TABLE city_id
  ADD CONSTRAINT city_id_point_id_fk 
    FOREIGN KEY (id) REFERENCES point_id(id)
      ON DELETE CASCADE;
      
ALTER TABLE event_participant
  ADD CONSTRAINT event_participant_status_participant_id_fk 
    FOREIGN KEY (status_participant_id) REFERENCES status_participant_id(id)
      ON DELETE CASCADE;
      
ALTER TABLE event_id
  ADD CONSTRAINT event_id_user_id_fk 
    FOREIGN KEY (status_id) REFERENCES status_id(id)
      ON DELETE CASCADE,
  ADD CONSTRAINT event_id_format_id_fk
    FOREIGN KEY (format_id) REFERENCES format_id(id)
      ON DELETE CASCADE;
     
     
ALTER TABLE event_id      
  ADD CONSTRAINT event_id_user_id_id_fk 
    FOREIGN KEY (user_id) REFERENCES users(id)
      ON DELETE CASCADE;
      
ALTER TABLE event_id      
  ADD CONSTRAINT event_id_point_id_fk 
    FOREIGN KEY (point_id) REFERENCES point_id(id)
      ON DELETE CASCADE;
      
-- индексы
     
SELECT * FROM point_id ORDER BY name;
    
CREATE INDEX point_id_name_idx ON point_id(name);

SHOW INDEX FROM point_id;