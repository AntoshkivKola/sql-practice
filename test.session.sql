SELECT *
FROM "users"
WHERE (
    is_male = true
    AND birthday BETWEEN '1/1/1980' AND '1/1/1990'
  );
/*все юзеры с чётным айди и мужского пола*/
SELECT *
FROM "users";
/*  */
SELECT *
FROM "users"
WHERE (
    "is_male" = true
    AND "id" %2 = 0
  );
/*  */
SELECT *
FROM "users"
WHERE ("first_name" = 'Alexis');
/* 1 */
SELECT *
FROM "users"
WHERE (is_male = true);
/* 2 */
SELECT *
FROM "users"
WHERE (is_male = false);
/* 3 */
/* INSERT INTO "users"(
 "first_name",
 "last_name",
 "email",
 "is_male",
 "birthday",
 "height"
 )
 VALUES ('js', 'jsovich', 's@s.s', false, '2010/01/02', 1.2); */
SELECT *
FROM "users"
WHERE (
    age(current_timestamp, "birthday") > interval '18 years'
  );
/* 4 */
SELECT *
FROM "users"
WHERE (
    age(current_timestamp, "birthday") > interval '18 years'
    AND "is_male" = false
  );
/* 5 */
SELECT *
FROM "users"
WHERE (
    age(current_timestamp, "birthday") BETWEEN interval '20 years'
    AND interval '40 years'
  );
/* 6 */
SELECT *
FROM "users"
WHERE (
    age(current_timestamp, "birthday") > interval '20 years'
    AND "height" > 1.8
  );
/* 7 */
SELECT *
FROM "users"
WHERE (
    to_char("birthday", 'Month') = 'September'
  );
/* 7.2 */
SELECT *
FROM "users"
WHERE (
    extract(
      'month'
      from "birthday"
    ) = 9
  );
/* 8 */
SELECT *
FROM "users"
WHERE (
    to_char("birthday", 'Month DD') = 'November 01'
  );
/* 9 */
DELETE FROM "users"
WHERE (
    age(current_timestamp, "birthday") < interval '30 years'
  );
/*  */
SELECT "id" AS "Номер",
  --"first_name" || ' ' || "last_name" AS "FULL NAME",
  concat("first_name", ' ', "last_name") AS "FULL NAME",
  "email" AS "Почта"
FROM "users"
LIMIT 10 OFFSET 40;
/**/
SELECT "id" AS "Номер",
  --"first_name" || ' ' || "last_name" AS "FULL NAME",
  concat("first_name", ' ', "last_name") AS "FULL NAME",
  length(concat("first_name", "last_name")),
  "email" AS "Почта"
FROM "users"
WHERE length(concat("first_name", "last_name")) > 15;