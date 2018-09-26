DROP TABLE IF EXISTS students;
DROP TABLE IF EXISTS houses;


CREATE TABLE houses (
  id serial4 PRIMARY KEY,
  name VARCHAR(255)
);


CREATE TABLE students (
  id serial4 PRIMARY KEY,
  firstname VARCHAR(255),
  lastname VARCHAR(255),
  house_id INT4 REFERENCES houses(id) ON DELETE CASCADE,
  age INT2
);
