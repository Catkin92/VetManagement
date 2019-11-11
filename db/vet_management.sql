DROP TABLE notes;
DROP TABLE pets;
DROP TABLE vets;
DROP TABLE owners;

CREATE TABLE owners(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  address TEXT,
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
  vet_id INT4 REFERENCES vets(id),
  owner_id INT4 REFERENCES owners(id)
);

CREATE TABLE notes(
  id SERIAL4 PRIMARY KEY,
  pet_id INT4 REFERENCES pets(id),
  note_date DATE NOT NULL DEFAULT CURRENT_DATE,
  note TEXT
);
