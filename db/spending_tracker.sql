DROP TABLE transactions;
DROP TABLE merchants;
DROP TABLE tags;

CREATE TABLE merchants(
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
);

CREATE TABLE tags(
  id SERIAL PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE transactions(
  id SERIAL PRIMARY KEY,
  amount DECIMAL(6,2),
  merchant_id INT REFERENCES merchants(id),
  tag_id INT REFERENCES tags(id)
);

-- SELECT * FROM merchants;
