create table patients(
id int primary key,
date_of_birth date
);

create table medical_histories(
  id int primary key,
  admitted_at timestamp,
  patient_id int  references patients(id)
);

create table treatments(
  id int primary key,
)