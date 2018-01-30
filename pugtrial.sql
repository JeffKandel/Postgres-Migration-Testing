-- db pug_example

DROP TABLE IF EXISTS pugs_owners;
DROP TABLE IF EXISTS pugs CASCADE;
DROP TABLE IF EXISTS owners CASCADE;
DROP TABLE IF EXISTS toys;

CREATE TABLE owners (
  id serial PRIMARY KEY,
  name VARCHAR (255),
  age INT
);

CREATE TABLE pugs (
  id serial PRIMARY KEY,
  name VARCHAR (255),
  age INT,
  color VARCHAR (255)
);

CREATE TABLE pugs_owners (
  id serial PRIMARY KEY,
  owner_id INT NOT NULL,
  FOREIGN KEY (owner_id) REFERENCES owners (id),
  pug_id INT NOT NULL,
  FOREIGN KEY (pug_id) REFERENCES pugs (id)
);

CREATE TABLE toys (
  id serial PRIMARY KEY,
  name VARCHAR (255),
  pug_id INT NOT NULL,
  FOREIGN KEY (pug_id) REFERENCES pugs (id)
);

INSERT INTO owners (name, age) VALUES ('Tom', 29);
INSERT INTO owners (name, age) VALUES ('Chris', 35);
INSERT INTO pugs (name, age, color) VALUES ('Cody', 7, 'fawn');
INSERT INTO pugs_owners (owner_id, pug_id) VALUES (1, 1);
INSERT INTO pugs_owners (owner_id, pug_id) VALUES (2, 1);
INSERT INTO toys (name, pug_id) VALUES ('chew toy', 1);
INSERT INTO toys (name, pug_id) VALUES ('ball', 1);
