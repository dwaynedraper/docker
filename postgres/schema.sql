DROP DATABASE IF EXISTS spacework;
CREATE DATABASE spacework;
\c spacework;

DROP TABLE IF EXISTS users;
CREATE TABLE users(
  id SERIAL PRIMARY KEY,
  firstName VARCHAR(15),
  lastName VARCHAR(15)
);