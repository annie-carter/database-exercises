-- 1
SHOW DATABASES;
USE albums_db;
SHOW TABLES;
-- 2 
DESCRIBE albums;
-- id is the primary key for albums table
-- 3
-- name represents the name of the album 
-- using string VARCHAR
-- 4
-- sales column represents the price
-- 5
SELECT name
FROM albums
WHERE artist = "Pink Floyd";
-- 6
SELECT release_date
FROM albums
WHERE name = "Sgt. Pepper's Lonely Hearts Club Band";
-- 7 
SELECT genre
FROM albums
WHERE name = "Nevermind";
-- 8
SELECT name
FROM albums
where release_date BETWEEN 1990 AND 1999;
-- 9
SELECT name AS low_selling_albums
FROM albums
where sales BETWEEN .1 ANd 20;


