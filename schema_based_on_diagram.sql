CREATE TABLE patients(
patient_id SERIAL,
name VARCHAR(200),
date_of_birth DATE,
PRIMARY KEY (patient_id)
);

CREATE TABLE medical_histories(
medical_histories_id SERIAL PRIMARY KEY,
admitted_at TIMESTAMP,
patient_id INT,
status VARCHAR(500),
CONSTRAINT fk_patient
  FOREIGN KEY(patient_id)
    REFERENCES patients(patient_id)
);
CREATE INDEX medical_histories_patient_id_asc ON medical_histories(patient_id ASC);

CREATE TABLE treatments(
treatment_id SERIAL PRIMARY KEY,
type VARCHAR(200),
name VARCHAR(200),
);

CREATE TABLE invoices(
  invoice_id SERIAL PRIMARY KEY,
  total_amount DECIMAL,
  generated_at TIMESTAMP,
  payed_at TIMESTAMP,
  medical_histories_id INT,
  CONSTRAINT fk_medical_histories_id
    FOREIGN KEY(medical_histories_id)
      REFERENCES medical_histories(medical_histories_id)
);

CREATE INDEX invoices_medical_histories_asc ON invoices(medical_histories_id ASC);

CREATE TABLE invoice_items(
invoice_item_id SERIAL PRIMARY KEY,
unit_price DECIMAL,
quantity INT,
total_price DECIMAL,
invoice_id INT,
treatment_id INT,
CONSTRAINT fk_invoices
  FOREIGN KEY(invoice_id)
    REFERENCES invoices(invoice_id),
CONSTRAINT fk_treatments
  FOREIGN KEY(treatment_id)
    REFERENCES treatments(treatment_id)
);
CREATE INDEX invoice_items_invoice_id_asc ON invoice_items(invoice ASC);
CREATE INDEX treatments_invoice_id_asc ON invoice_items(treatment_id ASC);


CREATE TABLE treatment_files(
  treatment_file_id INT SERIAL PRIMARY KEY,
  medical_histories_id INT,
  treatment_id INT,
  CONSTRAINT fk_medical_histories
    FOREIGN KEY(medical_histories_id)
      REFERENCES medical_histories(medical_histories_id),
  CONSTRAINT fk_treatments_files
    FOREIGN KEY(treatment_id)
      REFERENCES treatments(treatment_id)
);
CREATE INDEX treatment_files_asc ON treatment_records(medical_histories_id ASC);
