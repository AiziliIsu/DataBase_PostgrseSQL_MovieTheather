-- Table creation for "release"
CREATE TABLE "release" (
  "release_id" SERIAL PRIMARY KEY,
  "release_date" DATE
);

-- Table creation for "genre"
CREATE TABLE "genre" (
  "genre_id" SERIAL PRIMARY KEY,
  "name" VARCHAR
);

-- Table creation for "age_limit"
CREATE TABLE "age_limit" (
  "age_limit_id" SERIAL PRIMARY KEY,
  "name" VARCHAR
);

-- Table creation for "duration"
CREATE TABLE "duration" (
  "duration_id" SERIAL PRIMARY KEY,
  "name" VARCHAR
);

-- Table creation for "movie"
CREATE TABLE "movie" (
  "movie_id" SERIAL PRIMARY KEY,
  "name" VARCHAR,
  "release_id" INTEGER REFERENCES "release"("release_id"),
  "genre_id" INTEGER REFERENCES "genre"("genre_id"),
  "age_limit_id" INTEGER REFERENCES "age_limit"("age_limit_id"),
  "duration_id" INTEGER REFERENCES "duration"("duration_id")
);

-- Table creation for "language"
CREATE TABLE "language" (
  "language_id" SERIAL PRIMARY KEY,
  "name" VARCHAR
);

-- Table creation for "format"
CREATE TABLE "format" (
  "format_id" SERIAL PRIMARY KEY,
  "name" VARCHAR
);

-- Table creation for "imax"
CREATE TABLE "imax" (
  "imax_id" SERIAL PRIMARY KEY,
  "name" VARCHAR
);

-- Table creation for "movie_fil"
CREATE TABLE "movie_fil" (
  "movie_fil_id" SERIAL PRIMARY KEY,
  "language_id" INTEGER REFERENCES "language"("language_id"),
  "format_id" INTEGER REFERENCES "format"("format_id"),
  "imax_id" INTEGER REFERENCES "imax"("imax_id"),
  "movie_id" INTEGER REFERENCES "movie"("movie_id")
);

-- Table creation for "date"
CREATE TABLE "date" (
  "date_id" SERIAL PRIMARY KEY,
  "name" DATE
);

-- Table creation for "time"
CREATE TABLE "time" (
  "time_id" SERIAL PRIMARY KEY,
  "name" TIME
);

-- Table creation for "dtime"
CREATE TABLE "dtime" (
  "dtime_id" SERIAL PRIMARY KEY,
  "date_id" INTEGER REFERENCES "date"("date_id"),
  "time_id" INTEGER REFERENCES "time"("time_id")
);

-- Table creation for "price"
CREATE TABLE "price" (
  "price_id" SERIAL PRIMARY KEY,
  "name" INTEGER
);

-- Table creation for "movie_dtime"
CREATE TABLE "movie_dtime" (
  "movie_dtime_id" SERIAL PRIMARY KEY,
  "movie_fil_id" INTEGER,
  "dtime_id" INTEGER REFERENCES "dtime"("dtime_id"),
  "price_id" INTEGER REFERENCES "price"("price_id")
);

-- Table creation for "seat"
CREATE TABLE "seat" (
  "seat_id" SERIAL PRIMARY KEY,
  "row" INTEGER,
  "number" INTEGER
);

-- Table creation for "room"
CREATE TABLE "room" (
  "room_id" SERIAL PRIMARY KEY,
  "name" VARCHAR
);

-- Table creation for "status"
CREATE TABLE "status" (
  "status_id" SERIAL PRIMARY KEY,
  "name" VARCHAR
);

-- Table creation for "room_seat"
CREATE TABLE "room_seat" (
  "room_seat_id" SERIAL PRIMARY KEY,
  "movie_dtime_id" INTEGER,
  "seat_id" INTEGER REFERENCES "seat"("seat_id"),
  "room_id" INTEGER REFERENCES "room"("room_id"),
  "status_id" INTEGER REFERENCES "status"("status_id")
);

-- Initial data insertion for "genre"
INSERT INTO "genre" ("name")
VALUES
    ('Action'),
    ('Animation'),
    ('Adventure'),
    ('Crime'),
    ('Fantasy'),
    ('Drama'),
    ('Sci-Fi');

-- Initial data insertion for "language"
INSERT INTO "language" ("name")
VALUES
    ('French'),
    ('English'),
    ('German'),
    ('Korean'),
    ('Japanese'),
    ('Russian');

-- Initial data insertion for "age_limit"
INSERT INTO "age_limit" ("name")
VALUES
    ('12+'),
    ('6+'),
    ('16+');

-- Initial data insertion for "format"
INSERT INTO "format" ("name")
VALUES
    ('3D'),
    ('2D');

-- Initial data insertion for "imax"
INSERT INTO "imax" ("name")
VALUES
    ('IMAX'),
    ('Regular');


-- Inserting release dates
INSERT INTO "release" ("release_date")
VALUES
    ('2019-04-26'),
    ('2019-06-21'),
    ('2019-07-19'),
    ('2019-10-04'),
    ('2019-11-22'),
    ('2019-11-08'),
    ('1999-03-31'),
    ('2014-11-07'),
    ('2010-07-16'),
    ('1994-10-14');

-- Inserting IMAX types
INSERT INTO "imax" ("name")
VALUES
    ('IMAX'),
    ('Regular');

-- Inserting durations
INSERT INTO "duration" ("name")
VALUES
    ('181 min'),
    ('100 min'),
    ('118 min'),
    ('122 min'),
    ('103 min'),
    ('132 min'),
    ('136 min'),
    ('169 min'),
    ('148 min'),
    ('154 min');

-- Inserting times
INSERT INTO "time" ("name")
VALUES
    ('19:00'),
    ('17:30'),
    ('14:00'),
    ('16:30'),
    ('20:00'),
    ('18:45'),
    ('15:30'),
    ('19:30'),
    ('16:00'),
    ('11:00'),
    ('9:00');


-- Inserting prices
INSERT INTO "price" ("name")
VALUES
    (400),
    (700),
    (500),
    (600),
    (300);

-- Inserting rooms
INSERT INTO "room" ("name")
VALUES
    ('Room 1'),
    ('Room 2'),
    ('Room 3');

-- Inserting seats
INSERT INTO "seat" ("row", "number")
VALUES
    (1, 1),
    (1, 2),
    (1, 3),
    (1, 4),
    (1, 5),
    (1, 6),
    (1, 7),
    (1, 8),
    (1, 9),
    (1, 10),
    (2, 1),
    (2, 2),
    (2, 3),
    (2, 4),
    (2, 5),
    (2, 6),
    (2, 7),
    (2, 8),
    (2, 9),
    (2, 10);

-- Inserting statuses
INSERT INTO "status" ("name")
VALUES
    ('Available'),
    ('Sold');

-- Inserting movies
INSERT INTO "movie" ("name", "release_id", "age_limit_id", "genre_id", "duration_id")
VALUES
    ('Avengers: Endgame', 1, 1, 1, 1),
    ('Toy Story 4', 2, 2, 2, 2),
    ('The Lion King', 3, 2, 3, 3),
    ('Joker', 4, 1, 4, 4),
    ('Frozen II', 5, 2, 5, 5),
    ('Parasite', 6, 3, 6, 6),
    ('The Matrix', 7, 1, 7, 7),
    ('Interstellar', 8, 1, 7, 8),
    ('Inception', 9, 1, 7, 9),
    ('Pulp Fiction', 10, 1, 4, 10);

-- Inserting movie_films
INSERT INTO "movie_fil" ("language_id", "imax_id", "format_id", "movie_id")
VALUES
    (1, 1, 1, 1),
    (2, 2, 2, 2),
    (3, 2, 1, 3),
    (2, 2, 1, 4),
    (2, 2, 2, 5),
    (4, 2, 1, 6),
    (2, 2, 2, 7),
    (5, 1, 2, 8),
    (2, 2, 1, 9),
    (2, 2, 2, 10);

-- Resetting movie and movie_fil to NULL
UPDATE "movie"
SET "name" = NULL,
    "release_id" = NULL,
    "age_limit_id" = NULL,
    "genre_id" = NULL,
    "duration_id" = NULL;

UPDATE "movie_fil"
SET "language_id" = NULL,
    "imax_id" = NULL,
    "format_id" = NULL,
    "movie_id" = NULL;

-- Inserting movies again
INSERT INTO "movie" ("name", "release_id", "age_limit_id", "genre_id", "duration_id")
VALUES
    ('Avengers: Endgame', 1, 1, 1, 1),
    ('Toy Story 4', 2, 2, 2, 2),
    ('The Lion King', 3, 2, 3, 3),
    ('Joker', 4, 1, 4, 4),
    ('Frozen II', 5, 2, 5, 5),
    ('Parasite', 6, 3, 6, 6),
    ('The Matrix', 7, 1, 7, 7),
    ('Interstellar', 8, 1, 7, 8),
    ('Inception', 9, 1, 7, 9),
    ('Pulp Fiction', 10, 1, 4, 10);


-- Delete empty rows from the "movie" table
DELETE FROM "movie"
WHERE
    "name" IS NULL OR
    "name" = '';

-- Delete empty rows from the "movie_fil" table
DELETE FROM "movie_fil"
WHERE
    "language_id" IS NULL AND
    "format_id" IS NULL AND
    "imax_id" IS NULL AND
    "movie_id" IS NULL;

-- Inserting movie_films
INSERT INTO "movie_fil" ("language_id", "imax_id", "format_id", "movie_id")
VALUES
    (1, 1, 1, 15),   -- Avengers: Endgame (French, IMAX, 2D)
    (2, 2, 2, 16),   -- Toy Story 4 (English, Regular, 3D)
    (3, 2, 1, 17),   -- The Lion King (German, Regular, 2D)
    (2, 2, 1, 18),   -- Joker (English, Regular, 2D)
    (2, 2, 2, 19),   -- Frozen II (English, Regular, 3D)
    (4, 2, 1, 20),   -- Parasite (Korean, Regular, 2D)
    (2, 2, 2, 21),   -- The Matrix (English, Regular, 3D)
    (5, 1, 2, 22),   -- Interstellar (Japanese, IMAX, 3D)
    (2, 2, 1, 23),   -- Inception (English, Regular, 2D)
    (2, 2, 2, 24),   -- Pulp Fiction (English, Regular, 3D)
    (6, 2, 2, 19),   -- Frozen II (Russian, Regular, 3D)
    (6, 2, 1, 19),   -- Frozen II (Russian, Regular, 2D)
    (2, 2, 1, 17),   -- The Lion King (English, Regular, 2D)
    (2, 1, 2, 23);   -- Inception (English, IMAX, 3D)

-- Inserting dates
INSERT INTO "date" ("name")
VALUES
    ('5/18/2024'),
    ('5/19/2024'),
    ('5/20/2024'),
    ('5/21/2024');

-- Inserting datetimes
INSERT INTO "dtime" ("date_id", "time_id")
VALUES
    (1, 1),   -- 5/18/2024 19:00
    (1, 2),   -- 5/18/2024 17:30
    (2, 3),   -- 5/19/2024 14:00
    (2, 4),   -- 5/19/2024 16:30
    (2, 5),   -- 5/19/2024 20:00
    (3, 6),   -- 5/20/2024 18:45
    (3, 7),   -- 5/20/2024 15:30
    (3, 8),   -- 5/20/2024 19:30
    (4, 9),   -- 5/21/2024 16:00
    (4, 1),   -- 5/21/2024 19:00
    (2, 10),  -- 5/19/2024 11:00
    (2, 11);  -- 5/19/2024 09:00




-- Deleting seats with seat_id greater than or equal to 9
DELETE FROM "seat"
WHERE "seat_id" >= 9;

-- Updating seat rows to 2 where seat_id is in (5, 6, 7, 8)
UPDATE "seat"
SET "row" = 2
WHERE "seat_id" IN (5, 6, 7, 8);

-- Inserting data into room_seat table for Avengers: Endgame
INSERT INTO "room_seat" ("movie_dtime_id", "status_id", "seat_id", "room_id")
VALUES
    (1, 1, 1, 1),   -- Seat 1, Available
    (1, 2, 2, 1),   -- Seat 2, Sold
    (1, 1, 3, 1),   -- Seat 3, Available
    (1, 2, 4, 1),   -- Seat 4, Sold
    (1, 1, 5, 1),   -- Seat 5, Available
    (1, 2, 6, 1),   -- Seat 6, Sold
    (1, 1, 7, 1),   -- Seat 7, Available
    (1, 2, 8, 1);   -- Seat 8, Sold

-- Inserting data into room_seat table for Toy Story 4
INSERT INTO "room_seat" ("movie_dtime_id", "status_id", "seat_id", "room_id")
VALUES
    (2, 2, 1, 2),   -- Seat 1, Sold
    (2, 1, 2, 2),   -- Seat 2, Available
    (2, 2, 3, 2),   -- Seat 3, Sold
    (2, 1, 4, 2),   -- Seat 4, Available
    (2, 2, 5, 2),   -- Seat 5, Sold
    (2, 1, 6, 2),   -- Seat 6, Available
    (2, 2, 7, 2),   -- Seat 7, Sold
    (2, 1, 8, 2);   -- Seat 8, Available

-- Inserting data into room_seat table for The Lion King
INSERT INTO "room_seat" ("movie_dtime_id", "status_id", "seat_id", "room_id")
VALUES
    (3, 1, 1, 3),   -- Seat 1, Available
    (3, 2, 2, 3),   -- Seat 2, Sold
    (3, 1, 3, 3),   -- Seat 3, Available
    (3, 2, 4, 3),   -- Seat 4, Sold
    (3, 1, 5, 3),   -- Seat 5, Available
    (3, 2, 6, 3),   -- Seat 6, Sold
    (3, 1, 7, 3),   -- Seat 7, Available
    (3, 2, 8, 3);   -- Seat 8, Sold

-- Continue inserting data for other movies and rooms...
-- Inserting data into room_seat table for Joker
INSERT INTO "room_seat" ("movie_dtime_id", "status_id", "seat_id", "room_id")
VALUES
    (4, 1, 1, 1),   -- Room 1 for Joker, Seat 1, Available
    (4, 2, 2, 1),   -- Room 1 for Joker, Seat 2, Sold
    (4, 1, 3, 1),   -- Room 1 for Joker, Seat 3, Available
    (4, 2, 4, 1),   -- Room 1 for Joker, Seat 4, Sold
    (4, 1, 5, 1),   -- Room 1 for Joker, Seat 5, Available
    (4, 2, 6, 1),   -- Room 1 for Joker, Seat 6, Sold
    (4, 1, 7, 1),   -- Room 1 for Joker, Seat 7, Available
    (4, 2, 8, 1);   -- Room 1 for Joker, Seat 8, Sold

-- Inserting data into room_seat table for Frozen II (Russian)
INSERT INTO "room_seat" ("movie_dtime_id", "status_id", "seat_id", "room_id")
VALUES
    (25, 2, 1, 2),   -- Room 2 for Frozen II (Russian), Seat 1, Sold
    (25, 1, 2, 2),   -- Room 2 for Frozen II (Russian), Seat 2, Available
    (25, 2, 3, 2),   -- Room 2 for Frozen II (Russian), Seat 3, Sold
    (25, 1, 4, 2),   -- Room 2 for Frozen II (Russian), Seat 4, Available
    (25, 2, 5, 2),   -- Room 2 for Frozen II (Russian), Seat 5, Sold
    (25, 1, 6, 2),   -- Room 2 for Frozen II (Russian), Seat 6, Available
    (25, 2, 7, 2),   -- Room 2 for Frozen II (Russian), Seat 7, Sold
    (25, 1, 8, 2);   -- Room 2 for Frozen II (Russian), Seat 8, Available

-- Inserting data into room_seat table for Frozen II (Russian) - 2nd show
INSERT INTO "room_seat" ("movie_dtime_id", "status_id", "seat_id", "room_id")
VALUES
    (26, 1, 1, 2),   -- Room 2 for Frozen II (Russian) - 2nd show, Seat 1, Available
    (26, 2, 2, 2),   -- Room 2 for Frozen II (Russian) - 2nd show, Seat 2, Sold
    (26, 1, 3, 2),   -- Room 2 for Frozen II (Russian) - 2nd show, Seat 3, Available
    (26, 2, 4, 2),   -- Room 2 for Frozen II (Russian) - 2nd show, Seat 4, Sold
    (26, 1, 5, 2),   -- Room 2 for Frozen II (Russian) - 2nd show, Seat 5, Available
    (26, 2, 6, 2),   -- Room 2 for Frozen II (Russian) - 2nd show, Seat 6, Sold
    (26, 1, 7, 2),   -- Room 2 for Frozen II (Russian) - 2nd show, Seat 7, Available
    (26, 2, 8, 2);   -- Room 2 for Frozen II (Russian) - 2nd show, Seat 8, Sold

-- Inserting data into room_seat table for The Lion King (English)
INSERT INTO "room_seat" ("movie_dtime_id", "status_id", "seat_id", "room_id")
VALUES
    (27, 2, 1, 2),   -- Room 2 for The Lion King (English), Seat 1, Sold
    (27, 1, 2, 2),   -- Room 2 for The Lion King (English), Seat 2, Available
    (27, 2, 3, 2),   -- Room 2 for The Lion King (English), Seat 3, Sold
    (27, 1, 4, 2),   -- Room 2 for The Lion King (English), Seat 4, Available
    (27, 2, 5, 2),   -- Room 2 for The Lion King (English), Seat 5, Sold
    (27, 1, 6, 2),   -- Room 2 for The Lion King (English), Seat 6, Available
    (27, 2, 7, 2),   -- Room 2 for The Lion King (English), Seat 7, Sold
    (27, 1, 8, 2);   -- Room 2 for The Lion King (English), Seat 8, Available

-- Inserting data into room_seat table for Inception (English)
INSERT INTO "room_seat" ("movie_dtime_id", "status_id", "seat_id", "room_id")
VALUES
    (28, 1, 1, 2),   -- Room 2 for Inception (English), Seat 1, Available
    (28, 2, 2, 2),   -- Room 2 for Inception (English), Seat 2, Sold
    (28, 1, 3, 2),   -- Room 2 for Inception (English), Seat 3, Available
    (28, 2, 4, 2),   -- Room 2 for Inception (English), Seat 4, Sold
    (28, 1, 5, 2),   -- Room 2 for Inception (English), Seat 5, Available
    (28, 2, 6, 2),   -- Room 2 for Inception (English), Seat 6, Sold
    (28, 1, 7, 2),   -- Room 2 for Inception (English), Seat 7, Available
    (28, 2, 8, 2);   -- Room 2 for Inception (English), Seat 8, Sold

-- Inserting data into room_seat table for Frozen II (Russian) - 1st show
INSERT INTO "room_seat" ("movie_dtime_id", "status_id", "seat_id", "room_id")
VALUES
    (25, 1, 1, 2),   -- Room 2 for Frozen II (Russian) - 1st show, Seat 1, Available
    (25, 2, 2, 2),   -- Room 2 for Frozen II (Russian) - 1st show, Seat 2, Sold
    (25, 1, 3, 2),   -- Room 2 for Frozen II (Russian) - 1st show, Seat 3, Available
    (25, 2, 4, 2),   -- Room 2 for Frozen II (Russian) - 1st show, Seat 4, Sold
    (25, 1, 5, 2),   -- Room 2 for Frozen II (Russian) - 1st show, Seat 5, Available
    (25, 2, 6, 2),   -- Room 2 for Frozen II (Russian) - 1st show, Seat 6, Sold
    (25, 1, 7, 2),   -- Room 2 for Frozen II (Russian) - 1st show, Seat 7, Available
    (25, 2, 8, 2);   -- Room 2 for Frozen II (Russian) - 1st show, Seat 8, Sold

-- Inserting data into room_seat table for Parasite
INSERT INTO "room_seat" ("movie_dtime_id", "status_id", "seat_id", "room_id")
VALUES
    (6, 2, 1, 3),   -- Room 3 for Parasite, Seat 1, Sold
    (6, 1, 2, 3),   -- Room 3 for Parasite, Seat 2, Available
    (6, 2, 3, 3),   -- Room 3 for Parasite, Seat 3, Sold
    (6, 1, 4, 3),   -- Room 3 for Parasite, Seat 4, Available
    (6, 2, 5, 3),   -- Room 3 for Parasite, Seat 5, Sold
    (6, 1, 6, 3),   -- Room 3 for Parasite, Seat 6, Available
    (6, 2, 7, 3),   -- Room 3 for Parasite, Seat 7, Sold
    (6, 1, 8, 3);   -- Room 3 for Parasite, Seat 8, Available

-- Inserting data into room_seat table for The Matrix
INSERT INTO "room_seat" ("movie_dtime_id", "status_id", "seat_id", "room_id")
VALUES
    (7, 1, 1, 1),   -- Room 1 for The Matrix, Seat 1, Available
    (7, 2, 2, 1),   -- Room 1 for The Matrix, Seat 2, Sold
    (7, 1, 3, 1),   -- Room 1 for The Matrix, Seat 3, Available
    (7, 2, 4, 1),   -- Room 1 for The Matrix, Seat 4, Sold
    (7, 1, 5, 1),   -- Room 1 for The Matrix, Seat 5, Available
    (7, 2, 6, 1),   -- Room 1 for The Matrix, Seat 6, Sold
    (7, 1, 7, 1),   -- Room 1 for The Matrix, Seat 7, Available
    (7, 2, 8, 1);   -- Room 1 for The Matrix, Seat 8, Sold

-- Inserting data into room_seat table for Interstellar
INSERT INTO "room_seat" ("movie_dtime_id", "status_id", "seat_id", "room_id")
VALUES
    (8, 2, 1, 2),   -- Room 2 for Interstellar, Seat 1, Sold
    (8, 1, 2, 2),   -- Room 2 for Interstellar, Seat 2, Available
    (8, 2, 3, 2),   -- Room 2 for Interstellar, Seat 3, Sold
    (8, 1, 4, 2),   -- Room 2 for Interstellar, Seat 4, Available
    (8, 2, 5, 2),   -- Room 2 for Interstellar, Seat 5, Sold
    (8, 1, 6, 2),   -- Room 2 for Interstellar, Seat 6, Available
    (8, 2, 7, 2),   -- Room 2 for Interstellar, Seat 7, Sold
    (8, 1, 8, 2);   -- Room 2 for Interstellar, Seat 8, Available

-- Inserting data into room_seat table for Inception
INSERT INTO "room_seat" ("movie_dtime_id", "status_id", "seat_id", "room_id")
VALUES
    (9, 1, 1, 3),   -- Room 3 for Inception, Seat 1, Available
    (9, 2, 2, 3),   -- Room 3 for Inception, Seat 2, Sold
    (9, 1, 3, 3),   -- Room 3 for Inception, Seat 3, Available
    (9, 2, 4, 3),   -- Room 3 for Inception, Seat 4, Sold
    (9, 1, 5, 3),   -- Room 3 for Inception, Seat 5, Available
    (9, 2, 6, 3),   -- Room 3 for Inception, Seat 6, Sold
    (9, 1, 7, 3),   -- Room 3 for Inception, Seat 7, Available



-- Inserting data into room_seat table for Pulp Fiction
INSERT INTO "room_seat" ("movie_dtime_id", "status_id", "seat_id", "room_id")
VALUES
    -- Room 1 for Pulp Fiction
    (10, 1, 1, 1),   -- Seat 1, Available
    (10, 2, 2, 1),   -- Seat 2, Sold
    (10, 1, 3, 1),   -- Seat 3, Available
    (10, 2, 4, 1),   -- Seat 4, Sold
    (10, 1, 5, 1),   -- Seat 5, Available
    (10, 2, 6, 1),   -- Seat 6, Sold
    (10, 1, 7, 1),   -- Seat 7, Available
    (10, 2, 8, 1);   -- Seat 8, Sold

-- Update query to modify movie_dtime_id values in room_seat table
UPDATE "room_seat"
SET "movie_dtime_id" =
    CASE
        WHEN "movie_dtime_id" = 25 THEN 11
        WHEN "movie_dtime_id" = 26 THEN 12
        WHEN "movie_dtime_id" = 27 THEN 13
        WHEN "movie_dtime_id" = 28 THEN 14
        ELSE "movie_dtime_id"  -- No change for other values
    END
WHERE "movie_dtime_id" IN (25, 26, 27, 28);

-- Update query to change movie_dtime_id from 11 to 5
UPDATE "room_seat"
SET "movie_dtime_id" = 5
WHERE "room_seat_id" BETWEEN 65 AND 72;

