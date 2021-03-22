/* 1 */
SELECT *
FROM "users";
SELECT avg("height")
FROM "users";
/* 2 */
SELECT avg("height"),
  "is_male"
FROM "users"
GROUP BY "is_male";
/* 3 */
SELECT min("height"),
  max("height"),
  avg("height"),
  "is_male"
FROM "users"
GROUP BY "is_male";
/* 4 */
SELECT count("id")
FROM "users"
WHERE to_char("birthday", 'DD MM YYYY') = '01 01 1970';
/* 5 */
SELECT count("id")
FROM "users"
WHERE "first_name" = 'Test';
/* 6 */
SELECT count("id")
FROM "users"
WHERE extract(
    year
    from age("birthday")
  ) BETWEEN 20 AND 30;