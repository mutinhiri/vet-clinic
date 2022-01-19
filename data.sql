/* Populate database with sample data. */

insert into animals (name, date_of_birth, weight_kg, neutered, escape_attempts) values ('Augmon', '2020-02-03', 10.23, true, 0)
insert into animals (name, date_of_birth, weight_kg, neutered, escape_attempts) values ('Gabumon', '2018-11-15', 8.0, true, 2)
insert into animals (name, date_of_birth, weight_kg, neutered, escape_attempts) values ('Pikachu', '2021-01-07', 15.04, false, 1)
insert into animals (name, date_of_birth, weight_kg, neutered, escape_attempts) values ('Devimon', '2017-05-12', 11.0, true, 5)

insert into animals (name, date_of_birth, weight_kg, neutered, escape_attempts) values ('Charmander', '2020-02-08', -11.0, false, 0)
insert into animals (name, date_of_birth, weight_kg, neutered, escape_attempts) values ('Plantmon', '2022-11-15', -5.7, true, 2)
insert into animals (name, date_of_birth, weight_kg, neutered, escape_attempts) values ('Squirtle', '1993-04-02', -12.13, false, 3)
insert into animals (name, date_of_birth, weight_kg, neutered, escape_attempts) values ('Angemon', '2005-06-12', -45.0, true, 1)
insert into animals (name, date_of_birth, weight_kg, neutered, escape_attempts) values ('Boarmon', '2005-06-07', 20.4, true, 7)
insert into animals (name, date_of_birth, weight_kg, neutered, escape_attempts) values ('Blossom', '1998-10-13', 17, true, 3)


insert into owners (full_name, age) values('Sam Smith', 34)
insert into owners (full_name, age) values('Jennifer Orwell', 19)
insert into owners (full_name, age) values('Bob', 45)
insert into owners (full_name, age) values('Melody Pond', 77)
insert into owners (full_name, age) values('Dean Winchester', 14)
insert into owners (full_name, age) values('Jodie Whittaker', 38)

--insert into species table 
insert into species (name) values ('Pokemon')
insert into species (name) values ('Digimon')

--query and update
update animals set species_id = (select id from species where name = 'Digimon') where name like '%mon'
update animals set species_id = (select id from species where name = 'Pokemon') where name not like '%mon'

update animals set owner_id = (select id from owners where full_name = 'Sam Smith') where name = 'Agumon'
update animals set owner_id = (select id from owners where full_name = 'Jennifer Orwell') where name = 'Gabumon' or name = 'Pikachu'
update animals set owner_id = (select id from owners where full_name = 'Bob') where name = 'Devimon' or name = 'Plantmon'
update animals set owner_id = (select id from owners where full_name = 'Melody Pond') where name = 'Charmander' or name = 'Squirtle' or name = 'Blossom'