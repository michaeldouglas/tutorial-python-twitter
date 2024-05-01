CREATE DATABASE IF NOT EXISTS tutorial_python_db;

CREATE TABLE `tutorial_python_db`.`users` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`)
);