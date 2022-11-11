
CREATE TABLE users (
  id integer NOT NULL,
  login text NOT NULL UNIQUE,
  password text NOT NULL,
  PRIMARY KEY (id)
);