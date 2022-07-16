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


-- insert data into vets
INSERT INTO vets (name, age, date_of_graduation) VALUES ('William Tatcher', 45, '2000-04-23');
INSERT INTO vets (name, age, date_of_graduation) VALUES ('Maisy Smith', 26, '2019-01-17');
INSERT INTO vets (name, age, date_of_graduation) VALUES ('Stephanie Mendez', 64, '1981-05-04');
INSERT INTO vets (name, age, date_of_graduation) VALUES ('Jack Harkness', 38, '2008-06-08')

-- insert data into specialities
-- Insert the following data for specialties:
INSERT INTO specializations (species_id, vets_id) VALUES( 
    (
        SELECT id
        FROM species
        WHERE name = 'Pokemon'
    ),
    (
        SELECT id
        FROM vets
        WHERE name = 'William Tatcher'
    )
);

INSERT INTO specializations (species_id, vets_id) VALUES( 
    (
        SELECT id
        FROM species
        WHERE name = 'Pokemon'
    ),
    (
        SELECT id
        FROM vets
        WHERE name = 'Stephanie Mendez'
    )
);

INSERT INTO specializations (species_id, vets_id) VALUES( 
    (
        SELECT id
        FROM species
        WHERE name = 'Digimon'
    ),
    (
        SELECT id
        FROM vets
        WHERE name = 'Jack Harkness'
    )
)

-- insert into visits
INSERT INTO visits(visit_date, animal_id, vet_id) 
VALUES(
        '2020-06-24',
        (
            SELECT id
            FROM animals
            WHERE name = 'Agumon'
        ),
        (
            SELECT id
            FROM vets
            WHERE name = 'William Tatcher'
        )
    ),
    -- Agumon visited Stephanie Mendez on Jul 22th, 2020.
    (
        '2020-07-22',
        (
            SELECT id
            FROM animals
            WHERE name = 'Agumon'
        ),
        (
            SELECT id
            FROM vets
            WHERE name = 'Stephanie Mendez'
        )
    ),
    -- Pikachu visited Maisy Smith on Jan 5th, 2020.
    (
        '2020-01-05'
        (
            SELECT id
            FROM animals
            WHERE name = 'Pikachu'
        ),
        (
            SELECT id
            FROM vets
            WHERE name = 'Maisy Smith'
        )
    ),
    -- Gabumon visited Jack Harkness on Feb 2nd, 2021.
    (
        '2021-02-02',
        (
            SELECT id
            FROM animals
            WHERE name = 'Gabumon'
        ),
        (
            SELECT id
            FROM vets
            WHERE name = 'Jack Harkness'
        ),
    ),
    -- Pikachu visited Maisy Smith on Mar 8th, 2020.
    (
        '2020-03-08',
        (
            SELECT id
            FROM animals
            WHERE name = 'Pikachu'
        ),
        (
            SELECT id
            FROM vets
            WHERE name = 'Maisy Smith'
        ),
    ),
    -- Pikachu visited Maisy Smith on May 14th, 2020.
    (
        '2020-06-14',
        (
            SELECT id
            FROM animals
            WHERE name = 'Pikachu'
        ),
        (
            SELECT id
            FROM vets
            WHERE name = 'Maisy Smith'
        ),
    ),
    -- Devimon visited Stephanie Mendez on May 4th, 2021.
    (
        '2021-06-04',
        (
            SELECT id
            FROM animals
            WHERE name = 'Devimon'
        ),
        (
            SELECT id
            FROM vets
            WHERE name = 'Stephanie Mendez'
        )
    ),
    -- Charmander visited Jack Harkness on Feb 24th, 2021.
    (
        '2021-02-24',
        (
            SELECT id
            FROM animals
            WHERE name = 'Charmander'
        ),
        (
            SELECT id
            FROM vets
            WHERE name = 'Jack Harkness'
        )
    ),
    -- Plantmon visited Maisy Smith on Dec 21st, 2019.
    (
        '2019-12-21',
        (
            SELECT id
            FROM animals
            WHERE name = 'Plantmon'
        ),
        (
            SELECT id
            FROM vets
            WHERE name = 'Maisy Smith'
        ),
    ),
    -- Plantmon visited William Tatcher on Aug 10th, 2020.
    (
        '2020-09-10',
        (
            SELECT id
            FROM animals
            WHERE name = 'Plantmon'
        ),
        (
            SELECT id
            FROM vets
            WHERE name = 'William Tatcher'
        ),
    ),
    -- Plantmon visited Maisy Smith on Apr 7th, 2021.
    (
        '2021-04-17',
        (
            SELECT id
            FROM animals
            WHERE name = 'Plantmon'
        ),
        (
            SELECT id
            FROM vets
            WHERE name = 'Maisy Smith'
        )
    ),
    -- Squirtle visited Stephanie Mendez on Sep 29th, 2019.
    (
        '2019-09-29',
        (
            SELECT id
            FROM animals
            WHERE name = 'Squirtle'
        ),
        (
            SELECT id
            FROM vets
            WHERE name = 'Stephanie Mendez'
        )
    ),
    -- Angemon visited Jack Harkness on Oct 3rd, 2020.
    (
        '2020-10-03',
        (
            SELECT id
            FROM animals
            WHERE name = 'Angemon'
        ),
        (
            SELECT id
            FROM vets
            WHERE name = 'Jack Harkness'
        )
    ),
    -- Angemon visited Jack Harkness on Nov 4th, 2020.
    (
        '2020-11-04',
        (
            SELECT id
            FROM animals
            WHERE name = 'Angemon'
        ),
        (
            SELECT id
            FROM vets
            WHERE name = 'Jack Harkness'
        )
    ),
    -- Boarmon visited Maisy Smith on Jan 24th, 2019.
    (
        '2019-01-24'
        (
            SELECT id
            FROM animals
            WHERE name = 'Boarmon'
        ),
        (
            SELECT id
            FROM vets
            WHERE name = 'Maisy Smith'
        )
    ),
    -- Boarmon visited Maisy Smith on May 15th, 2019.
    (
        '2019-06-15',
        (
            SELECT id
            FROM animals
            WHERE name = 'Boarmon'
        ),
        (
            SELECT id
            FROM vets
            WHERE name = 'Maisy Smith'
        )
    ),
    -- Boarmon visited Maisy Smith on Feb 27th, 2020.
    (
        '2020-02-27',
        (
            SELECT id
            FROM animals
            WHERE name = 'Boarmon'
        ),
        (
            SELECT id
            FROM vets
            WHERE name = 'Maisy Smith'
        )
    ),
    -- Boarmon visited Maisy Smith on Aug 3rd, 2020.
    (
        '2020-09-03',
        (
            SELECT id
            FROM animals
            WHERE name = 'Boarmon'
        ),
        (
            SELECT id
            FROM vets
            WHERE name = 'Maisy Smith'
        )
    ),
    -- Blossom visited Stephanie Mendez on May 24th, 2020.
    (
        '2020-06-24',
        (
            SELECT id
            FROM animals
            WHERE name = 'Blossom'
        ),
        (
            SELECT id
            FROM vets
            WHERE name = 'Stephanie Mendez'
        )
    ),
    -- Blossom visited William Tatcher on Jan 11th, 2021.
    (
        '2021-01-11',
        (
            SELECT id
            FROM animals
            WHERE name = 'Blossom'
        ),
        (
            SELECT id
            FROM vets
            WHERE name = 'William Tatcher'
        )
    );
    
CREATE INDEX visit_animal_idx ON visits(animal_id);
CREATE INDEX visit_vet_idx ON visits(vet_id);
CREATE INDEX owners_email ON owners(email);

-- This will add 3.594.280 visits considering you have 10 animals, 4 vets, and it will use around ~87.000 timestamps (~4min approx.)
INSERT INTO visits (animal_id, vet_id, date_of_visit) SELECT * FROM (SELECT id FROM animals) animal_ids, (SELECT id FROM vets) vets_ids, generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;

-- This will add 2.500.000 owners with full_name = 'Owner <X>' and email = 'owner_<X>@email.com' (~2min approx.)
insert into owners (full_name, email) select 'Owner ' || generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';