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
  type varchar,
  name varchar
);

create table invoices (
  id int primary key,
  total_amount decimal,
  generated_at timestamp,
  payed_at timestamp,
  medical_history_id refences medical_histories(id)
)

create table invoice_items(
  id int primary key,
  unit_price decimal,
  quqntity int,
  total_price decimal,
  invoice_id int references invoices(id),
  treatment_id int references treatment(id)
)