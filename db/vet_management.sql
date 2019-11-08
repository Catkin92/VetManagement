DROP TABLE animals;
DROP TABLE vets;
DROP TABLE owners;

CREATE TABLE owners(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  address VARCHAR(255),
  phone_number VARCHAR(255)
);

CREATE TABLE vets(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE pets(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  dob VARCHAR(255),
  type VARCHAR(255),
  notes TEXT,
  vet_id INT4 REFERENCES vets(id),
  owner_id INT4 REFERENCES owners(id)
);
