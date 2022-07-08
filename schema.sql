/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id INT NOT NULL PRIMARY KEY,
    name CHAR(100), 
    date_of_birth DATE,
    escape_attempts INT,
    neutered BOOLEAN,
    weight_kg DECIMAL
);

-- Table named owners with the following columns
CREATE TABLE owners (
    id SERIAL PRIMARY KEY,
    fullname CHAR(200),
    age int
);

-- table named species with the following columns
CREATE TABLE species (
    id SERIAL PRIMARY KEY,
    name CHAR(200)
);

-- ID is set as autoincremented PRIMARY KEY
ALTER TABLE animals ADD PRIMARY KEY (id);
-- Remove column species
ALTER TABLE animals DROP COLUMN species
-- species field column
ALTER TABLE animals ADD species CHAR(250);

-- Add column species_id which is a foreign key referencing species table
ALTER TABLE animals
ADD species_id INT;
ALTER TABLE animals
ADD CONSTRAINT fk_species_table FOREIGN KEY(species_id) REFERENCES species(id);

-- Add column owner_id which is a foreign key referencing the owners table
ALTER TABLE animals
ADD owner_id INT;
ALTER TABLE animals
ADD CONSTRAINT fk_owner_table FOREIGN KEY(owner_id) REFERENCES owners(id);