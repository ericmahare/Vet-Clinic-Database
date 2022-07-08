/* Populate database with sample data. */

INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES(1, 'Agumon', '2020-02-03', 0, True, 10.23);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES(2, 'Gabumon', '2018-11-15', 2, True, 8.00);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES(3, 'Pikachu', '2021-01-07', 1, False, 15.04);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES(4, 'Devimon', '2017-05-12', 5, True, 11.00);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES(5, 'Charmander', '2020-02-8', 0, False, 11.00);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES(6, 'Plantmon', '2021-11-15', 2, True, 5.7);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES(7, 'Squirtle', '1993-04-2', 3, False, 12.13);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES(8, 'Angemon', '2005-06-12', 1, True, 45.00);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES(9, 'Boarmon', '2005-06-7', 7, True, 20.4);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES(10, 'Blossom', '1998-10-13', 3, True, 17.00);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES(11, 'Ditto', '2022-05-14', 3, True, 22.00);

-- INSERT INTO OWNERS TABLE 
INSERT INTO owners (fullname, age) VALUES ('Sam Smith', 34);
INSERT INTO owners (fullname, age) VALUES ('Jennifer Orwell', 19);
INSERT INTO owners (fullname, age) VALUES ('BOB', 45);
INSERT INTO owners (fullname, age) VALUES ('Melody Pond', 77);
INSERT INTO owners (fullname, age) VALUES ('Dean Winchester', 14);
INSERT INTO owners (fullname, age) VALUES ('Joddie Whittaker', 14)

-- INSERT INTO SPECIES TABLE 
INSERT INTO species (name) VALUES ('Pokemon');
INSERT INTO species (name) VALUES ('Digimon')

-- If the name ends in "mon" it will be Digimon
-- All other animals are Pokemon
UPDATE animals
SET species_id = (
        SELECT id
        FROM species
        WHERE name = 'Digimon'
    )
WHERE name LIKE '%mon%';

UPDATE animals
SET species_id = (
        SELECT id
        FROM species
        WHERE name = 'Pokemen'
)
WHERE species_id is null;

 -- Sam Smith owns Agumon
UPDATE animals
SET owner_id = (
        SELECT id
        FROM owners
        WHERE fullname = 'Sam Smith'
    )
WHERE name = 'Agumon'

-- Jennifer Orwell owns Gabumon and Pikachu
UPDATE animals
SET owner_id = (
        SELECT id
        FROM owners
        WHERE fullname = 'Jennifer Orwell'
    )
WHERE name = 'Gabumon'
OR name = 'Pikachu';

 -- Bob owns Devimon and Plantmon
UPDATE animals
SET owner_id = (
        SELECT id
        FROM owners
        WHERE fullname = 'BOB'
    )
WHERE name = 'Devimon'
OR name = 'Plantmon';