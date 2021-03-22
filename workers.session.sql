DROP TABLE "workers";
CREATE TABLE "workers"(
  "id" serial PRIMARY KEY,
  "birthday" date,
  "name" varchar(128) CHECK ("name" != ''),
  "salary" decimal(5, 0) NOT NULL
);
/* Задачи на INSERT */
/* 1 */
INSERT INTO "workers" ("birthday", "name", "salary")
VALUES ('01/01/1990', 'Никита', 300);
/* 2 */
INSERT INTO "workers" ("name", "salary")
VALUES ('Светлана', 1200);
/* 3 */
INSERT INTO "workers" ("birthday", "name", "salary")
VALUES ('01/01/1980', 'Ярослав', 1200),
  ('01/01/1993', 'Петр', 1000);
/*  */
INSERT INTO "workers" ("birthday", "name", "salary")
VALUES ('01/01/1988', 'Вася', 100),
  ('01/01/1995', 'Коля', 99999);
-- 
/*
 
 Задачи на UPDATE 
 
 */
/* 1 */
UPDATE "workers"
SET "salary" = 200
WHERE "name" = 'Вася';
/* 2 */
UPDATE "workers"
SET "birthday" = '01/01/1987'
WHERE "id" = 4;
/* 3 */
UPDATE "workers"
SET "salary" = 700
WHERE "salary" = 500;
/* 4 */
UPDATE "workers"
SET "birthday" = '01/01/1999'
WHERE "id" BETWEEN 2 AND 5;
/* 5 */
UPDATE "workers"
SET "name" = 'Женя',
  "salary" = 900
WHERE "name" = 'Вася';
-- 
/*
 
 Задачи на SELECT 
 
 */
/* 1 */
SELECT *
FROM "workers"
WHERE "id" = 3;
/* 2 */
SELECT *
FROM "workers"
WHERE "salary" > 400;
/* 3 */
SELECT *
FROM "workers"
WHERE "salary" != 500;
/* 4 */
SELECT "salary",
  EXTRACT(
    year
    from age("birthday")
  ) AS "AGE"
FROM "workers"
WHERE "name" = 'Женя';
/* 5 */
SELECT *
FROM "workers"
WHERE "name" = 'Петр';
/* 6 */
SELECT *
FROM "workers"
WHERE "name" != 'Петр';
/* 7 */
SELECT *
FROM "workers"
WHERE EXTRACT(
    year
    from age("birthday")
  ) = 27
  OR "salary" = 1000;
/* 8 */
SELECT *
FROM "workers"
WHERE EXTRACT(
    year
    from age("birthday")
  ) > 25
  AND EXTRACT(
    year
    from age("birthday")
  ) <= 28;
/* 9 */
SELECT *
FROM "workers"
WHERE EXTRACT(
    year
    from age("birthday")
  ) BETWEEN 23 AND 27
  OR "salary" BETWEEN 400 AND 1000;
/* 10 */
SELECT *
FROM "workers"
WHERE EXTRACT(
    year
    from age("birthday")
  ) = 27
  OR "salary" != 400;
-- 
/* 
 
 Задачи на DELETE 
 
 */
/* 1 */
DELETE FROM "workers"
WHERE "id" = 7;
/* 2 */
DELETE FROM "workers"
WHERE "name" = 'Коля';
/* 3 */
DELETE FROM "workers"
WHERE EXTRACT(
    year
    from age("birthday")
  ) = 23;
/* 
 
 position
 
 */
DROP TABLE "positions";
CREATE TABLE "positions" (
  "id" serial PRIMARY KEY,
  "name" varchar(256) CHECK ("name" != '')
);
-- 
INSERT INTO "positions" ("id", "name")
VALUES (1, 'programmer'),
  (2, 'tester'),
  (3, 'manager'),
  (4, 'HR');
/* 
 
 */
CREATE TABLE "positions_to_workers"(
  "worker_id" integer,
  "position_id" integer,
  PRIMARY KEY ("worker_id", "position_id")
);
--
INSERT INTO "positions_to_workers" ("worker_id", "position_id")
VALUES (1, 1),
  (2, 1),
  (3, 2),
  (4, 3);