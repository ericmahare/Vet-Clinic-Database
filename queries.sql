/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon';

SELECT * FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';

SELECT * FROM animals WHERE neutered=TRUE and escape_attempts < 3;

SELECT date_of_birth from animals WHERE name='Agumon' or name = 'Pikachu';

SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;

SELECT * FROM animals WHERE neutered = TRUE;

SELECT * FROM animals WHERE name != 'Gabumon';

-- Update species column data using transaction --
BEGIN;
    UPDATE animals SET species = 'unspecified';
ROLLBACK;

-- Update species column data using transaction --
BEGIN;

UPDATE animals
SET species = 'digimon'
WHERE name LIKE '%mon%';


-- Update the animals table by setting the species column to pokemon for all animals that don't have species already set.
UPDATE animals
SET species = 'pokemon'
WHERE species is null;

COMMIT;

-- Delete all data in the animals table 

BEGIN;
   TRUNCATE TABLE animals
ROLLBACK;

SELECT * FROM animals

-- Start transaction
BEGIN;
--Delete all animals born after Jan 1st, 
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SAVEPOINT SP_1;
SELECT * FROM animals;

-- Update all animals' weight to be their weight multiplied by -1
UPDATE animals
SET weight_kg = weight_kg  * -1;

SELECT * FROM animals
ROLLBACK TO SP_1

SELECT weight_kg FROM animals

-- Update all animals' weights that are negative to be their weight multiplied by -1
UPDATE animals
SET weight_kg = weight_kg * -1
WHERE weight_kg < 0;
SELECT weight_kg
FROM animals;
-- Commit transaction
COMMIT;

-- Get all animals from the table
SELECT COUNT(*) FROM animals
-- Animals that have never tried to escape
SELECT COUNT(*) FROM animals WHERE escape_attempts < 1
-- Average weight of animals
SELECT AVG(weight_kg) FROM animals
-- Animals who escaped the most, neutered or not neutered animals
SELECT neutered,
    MAX(escape_attempts)
FROM animals
GROUP BY neutered;

-- The minimum and maximum weight of each type of animal
SELECT species,
    MAX(weight_kg),
    MIN(weight_kg)
FROM animals
GROUP BY species;

-- average number of escape attempts per animal type of those born between 1990 and 2000
SELECT species,
    AVG(escape_attempts)
FROM animals
WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31'
GROUP BY species;


-- animals belonging to Melody Pond
SELECT name FROM animals
JOIN owners ON animals.owner_id = owners.id
WHERE fullname = 'Melody Pond';

-- All animals that are pokemon
SELECT animals.name FROM animals
JOIN species ON animals.species_id = species.id
WHERE species.name = 'Pokemon';

-- All owners and their animals
SELECT fullname, name FROM animals 
JOIN owners ON animals.owner_id = owners.id;

-- Animals that are there per species
SELECT COUNT(animals.name) AS Animals,
species.name AS Species
FROM animals
JOIN species ON animals.species_id = species.id
GROUP BY species.name;

-- All Digimon owned by Jennifer Orwell
SELECT owners.fullname As owner_name,
    animals.name AS animals,
    species.name AS species
FROM animals
    JOIN owners ON owners.id = animals.owner_id
    JOIN species ON species.id = animals.species_id
WHERE species.name = 'Digimon'
    AND owners.fullname = 'Jennifer Orwell';

-- All animals owned by Dean Winchester that haven't tried to escape
SELECT name,
    escape_attempts,
    owners.fullname as owner
FROM animals
    JOIN owners ON owners.id = animals.owner_id
WHERE owners.fullname = 'Dean Winchester'
    AND animals.escape_attempts < 1;

-- Who owns the most animalst
SELECT fullname,
    COUNT(animals.owner_id) AS total_animals
FROM owners
    JOIN animals ON animals.owner_id = owners.id
GROUP BY fullname
ORDER BY total_animals DESC;