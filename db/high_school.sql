DROP TABLE student_subjects;
DROP TABLE subjects;
DROP TABLE students;

CREATE TABLE students
(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255) NOT NULL
);

CREATE TABLE subjects
(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  teacher VARCHAR(255)
);

CREATE TABLE student_subjects
(
  id SERIAL8 PRIMARY KEY,
  student_id INT8 REFERENCES students(id),
  subject_id INT8 REFERENCES subjects(id)
);
