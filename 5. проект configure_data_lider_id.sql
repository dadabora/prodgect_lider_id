-- Выбор базы лидер-id

USE lider_id;
-- Заполнение таблицы статуса события
SELECT * FROM status_id LIMIT 10;
DROP TABLE status_id;
CREATE TABLE status_id (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  status VARCHAR(255) NOT NULL UNIQUE
);
INSERT status_id (id, status)
VALUES
	(1, 'Active'),
	(2, 'Completions'),
	(3, 'Request');

-- Таблица справочник форматов

DROP TABLE format_id;
CREATE TABLE format_id (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  format VARCHAR(255) NOT NULL UNIQUE
);
INSERT format_id (id, format)
VALUES
	(1, 'web conference'),
	(2, 'presentation'),
	(3, 'master class'),
	(4, 'forum');
	
-- Таблица city_id

SELECT * FROM city_id LIMIT 10;

-- Поправим столбец пола
DROP TABLE gender;
-- Создаём временную таблицу значений для пола
CREATE TEMPORARY TABLE genders (name CHAR(1));
-- Заполняем значениями
INSERT INTO genders VALUES ('m'), ('w');
-- производим выборку случайных значений из временной таблицы
UPDATE profiles SET gender = (SELECT name FROM genders ORDER BY RAND() LIMIT 1);

-- ТАБЛИЦА ПРОФИЛЕЙ (profiles)

SELECT * FROM profiles LIMIT 10;

ALTER TABLE profiles DROP COLUMN city;
ALTER TABLE profiles ADD city_id INT UNSIGNED AFTER birthday;
UPDATE profiles SET city_id = FLOOR(1 + RAND() * 100);

ALTER TABLE profiles DROP COLUMN created_at;

ALTER TABLE profiles ADD photo_id INT UNSIGNED AFTER user_id;

UPDATE profiles SET photo_id = FLOOR(1 + RAND() * 100);

DESC profiles;

-- Таблица мероприятий

SELECT * FROM event_id LIMIT 10;

UPDATE event_id SET 
  user_id = FLOOR(1 + RAND() * 100),
  point_id = FLOOR(1 + RAND() * 100),
  status_id = FLOOR(1 + RAND() * 3 );
 
ALTER TABLE event_id ADD format_id INT UNSIGNED AFTER status_id;

ALTER TABLE lider_id.event_id MODIFY id INT NOT NULL;
ALTER TABLE lider_id.event_id DROP ;
ALTER TABLE lider_id.event_id MODIFY COLUMN id int unsigned auto_increment PRIMARY KEY NOT NULL; 

UPDATE event_id SET 
  format_id = FLOOR(1 + RAND() * 4);
 
UPDATE event_id SET confirmed_at = CURRENT_TIMESTAMP WHERE requested_at > confirmed_at;

-- ТАБЛИЦА МЕДИА (media)

SELECT * FROM media LIMIT 10;
-- создаем временную таблицу типов файлов медиа
CREATE TEMPORARY TABLE extensions (name VARCHAR(10));
INSERT INTO extensions VALUES ('jpeg'), ('mpeg'), ('avi'), ('png');
SELECT * FROM  extensions;

UPDATE media SET user_id = FLOOR(1 + RAND() * 100);
UPDATE media SET filename = CONCAT(
	'https://dropbox/vk/', 
	filename,
	'.',
	(SELECT name FROM extensions ORDER BY RAND() LIMIT 1));

UPDATE  media SET size = FLOOR(100000 + RAND() * 100000000) WHERE size < 1000;

UPDATE media SET metadata = CONCAT(
	'{"owner":"',
	(SELECT CONCAT(first_name, '', last_name) FROM users WHERE id = user_id),
	'"}');

ALTER TABLE media MODIFY COLUMN metadata JSON;

UPDATE media SET media_type_id = FLOOR(1 + RAND() * 3);

DESC media;

-- ТАБЛИЦА МЕДИА-ТИПЫ (media_types)

SELECT * FROM media_types LIMIT 10;

SELECT * FROM media_types;
DELETE FROM media_types;
INSERT INTO media_types (name) VALUES
	('photo'),
	('video'),
	('audio');

TRUNCATE media_types;

DESC media_types;

-- Таблица участников мероприятия event_participant

SELECT * FROM event_participant LIMIT 10;
SELECT * FROM event_id;

UPDATE event_participant SET 
  user_id = FLOOR(1 + RAND() * 100),
  event_id = FLOOR(1 + RAND() * 100),
  status_participant_id = FLOOR(1 + RAND() * 3 );
  
UPDATE event_participant SET confirmed_at = CURRENT_TIMESTAMP WHERE requested_at > confirmed_at;

-- пересоздаем в таблице event_id первичный ключ

ALTER TABLE event_id DROP COLUMN id;
ALTER TABLE event_id ADD id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY;




-- создаем таблицу справочник статуса участников


DROP TABLE status_participant_id;
CREATE TABLE status_participant_id (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  status_participant VARCHAR(255) NOT NULL UNIQUE
);
INSERT status_participant_id (id, status_participant)
VALUES
	(1, 'request'),
	(2, 'confirmed'),
	(3, 'refused');
	
-- Таблица точек кипения boiling_point_id

SELECT * FROM boiling_point_id LIMIT 10;

UPDATE boiling_point_id SET 
  city_id = FLOOR(1 + RAND() * 100);
  
 -- проверка ссылок на фото профиля
SELECT * FROM profiles LIMIT 10; 

UPDATE profiles SET photo_id = 
  (SELECT id FROM media 
    WHERE media.user_id = profiles.user_id AND media_type_id = 1 
    LIMIT 1)
;

SELECT user_id, photo_id FROM profiles;