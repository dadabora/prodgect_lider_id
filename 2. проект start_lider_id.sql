-- БАЗА ДАННЫХ ЛИДЕР-ID
DROP DATABASE lider_id;
CREATE DATABASE lider_id;
USE lider_id;

-- Участники таблица

CREATE TABLE users (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, 
  first_name VARCHAR(100) NOT NULL,
  last_name VARCHAR(100) NOT NULL,
  email VARCHAR(100) NOT NULL UNIQUE,
  phone VARCHAR(100) NOT NULL UNIQUE,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);  

-- Таблица профилей

CREATE TABLE profiles (
  user_id INT UNSIGNED NOT NULL PRIMARY KEY, 
  gender CHAR(1) NOT NULL,
  birthday DATE,
  city VARCHAR(130),
  education VARCHAR(130),
  post VARCHAR(130),
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
); 

-- таблица городов
CREATE TABLE city_id (
  city_id INT UNSIGNED NOT NULL PRIMARY KEY,
  city VARCHAR(130)
);
-- Таблица для профилей колонки гендер
CREATE TABLE gender (
  id INT UNSIGNED NOT NULL PRIMARY KEY,
  gender VARCHAR(10)
);
-- Таблица мероприятий

CREATE TABLE event_id (
  event_id INT UNSIGNED NOT NULL,
  user_id INT UNSIGNED NOT NULL,
  point_id INT UNSIGNED NOT NULL,
  status_id INT UNSIGNED NOT NULL,
  requested_at DATETIME DEFAULT NOW(),
  confirmed_at DATETIME,
  PRIMARY KEY (id, user_id, point_id)
  );

-- таблица справочник статуса мероприятия в данной точке

CREATE TABLE status_id (
  status_id INT UNSIGNED NOT NULL,
  status INT UNSIGNED NOT NULL
  );
 
-- таблица справочник зарегистрировшихся  на мероприятие, анкета.
 CREATE TABLE event_participant (
  event_id INT UNSIGNED NOT NULL,
  user_id INT UNSIGNED NOT NULL,
  status_participant_id INT UNSIGNED NOT NULL,
  requested_at DATETIME DEFAULT NOW(),
  confirmed_at DATETIME,
  PRIMARY KEY (event_id, user_id)
  );
-- Таблицы точек кипения

CREATE TABLE boiling_point_id (
  point_id INT UNSIGNED NOT NULL PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  city_id VARCHAR(130) NOT NULL,
  email VARCHAR(100) NOT NULL UNIQUE,
  phone VARCHAR(100) NOT NULL UNIQUE
);

 -- Таблица медиафайлов
CREATE TABLE media (
  media_id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  user_id INT UNSIGNED NOT NULL,
  filename VARCHAR(255) NOT NULL,
  size INT NOT NULL,
  metadata JSON,
  media_type_id INT UNSIGNED NOT NULL,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Таблица типов медиафайлов
CREATE TABLE media_types (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL UNIQUE
);