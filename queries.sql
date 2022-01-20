/*Queries that provide answers to the questions from all projects.*/


select name from animals where name like '%mon'
select name from animals where date_of_birth between '2016-01-01'and  '2019-12-12'
select name from animals where neutered = true and escape_attempts < 3
select date_of_birth from animals where name = 'Augmon' or name = 'Pikachu'
select name, escape_attempts from animals where weight_kg > 10.5
select * from animals where neutered = true
select * from animals where name <> 'Gabumon'
select * from animals where weight_kg >= 10.4 and weight_kg <= 17.3

begin;
update animals set species = 'unspecified';
rollback;

select * from animals

begin;
update animals set species = 'digimon' where name like '%mon%';
update animals set species = 'pokemon' where species is NULL;
select species from animals; --verify before commit
commit;
select species from animals --verify after commit

begin
delete * from animals
rollback

begin;
delete  from animals
rollback

select * from animals

begin;
delete from animals where date_of_birth > '2022-01-01';
savepoint sp1
update animals set weight_kg = weight_kg * -1
rollback to sp1
update animals set weight_kg = weight_kg * -1 where weight_kg < 0;
select weight_kg from animals --verify before commit
commit
select weight_kg from animals --verify after commit

-- queries to answer questions

select count(*) from animals
select count(*) from animals where escape_attempts = 0
select avg(weight_kg) from animals
select neutered, avg(escape_attempts) from animals group by neutered;
select species, min(weight_kg), max(weight_kg) from animals group by species
select species, avg(escape_attempts) from animals where date_of_birth between '1990-01-01' and '2000-12-31' group by species

--queries to answer questions 

select animals.name from animals join owners on owner_id = owners.id where owners.full_name = 'Melody Pond'
select animals.name from animals join species on species.id = animals.species_id where species.name = 'Pokemon'
select owners.full_name, animals.name from owners left join animals on animals.owner_id = owners.id
select species.name, count(*) from animals full outer join species on species.id = animals.species_id group by species.id
select animals.name, owners.full_name from animals join owners on owners.id = animals.owner_id join species on species.id = animals.species_id where owners.full_name = 'Jennifer Orwell' and species.name = 'Digimon'
select animals.name, animals.escape_attempts, full_name from animals right join owners on owners.id = animals.owner_id where escape_attempts = 0 and full_name = 'Dean Winchester'
select owners.full_name, count(animals.owner_id) from animals full join owners on animals.owner_id = owners.id group by owners.id order by count desc limit 1

--queries to answer questrions

select animals.name, visits.date_of_visit from animals join visits on animals.id = visits.animal_id where visits.vet_id = (select id from vets where name = 'William Tatcher') order by visits.date_of_visit desc limit 1;
select count(distinct  animals.name) from animals join visits on animals.id = visits.animal_id where visits.vet_id = (select id from vets where name = 'Stephanie Mendez')
select vets.name, specializations.species_id from vets left join specializations on vets.id = specializations.vet_id join species on specializations.species_id = species.id order by vets.name;

