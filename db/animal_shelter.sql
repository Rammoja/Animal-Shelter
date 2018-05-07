DROP TABLE adoptables;
DROP TABLE animals;
DROP TABLE breeds;
DROP TABLE owners;

CREATE TABLE breeds
(
  id SERIAL4 primary key,
  breed VARCHAR(255)
);

CREATE TABLE animals
(
  id SERIAL4 primary key,
  name VARCHAR(255) not null,
  breed_id INT4 references breeds(id),
  age INT4,
  admission_date VARCHAR(255)not null,
  status VARCHAR(255)not null
);

CREATE TABLE owners
(
  id SERIAL4 primary key,
  name VARCHAR(255) not null,
  contact_details VARCHAR(255) not null
);

CREATE TABLE adoptables
(
  id SERIAL4 primary key,
  owner_id INT4 references owners(id),
  animal_id INT4 references animals(id)
);
