/*Queries that provide answers to the questions from all projects.*/


select name from animals where name like '%mon'
select name from animals where date_of_birth between '2016-01-01'and  '2019-12-12'
select name from animals where neutered = true and escape_attempts < 3
select date_of_birth from animals where name = 'Augmon' or name = 'Pikachu'
select name, escape_attempts from animals where weight_kg > 10.5
select * from animals where neutered = true
select * from animals where name <> 'Gabumon'
select * from animals where weight_kg >= 10.4 and weight_kg <= 17.3

BEGIN;
UPDATE animals SET species = 'unspecified';
ROLLBACK;

BEGIN;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon%';
UPDATE animals SET species = 'pokemon' WHERE species IS NULL;
COMMIT;