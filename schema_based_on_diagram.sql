CREATE TABLE mediacal_histories (
    id SERIAL PRIMARY KEY,
    admitted_at DATE,
    patient_id INT,
    status varchar(300),
    CONSTRAINT fk_pat foreign key(patient_id) references patients(id)
)

CREATE TABLE patients (
    id SERIAL PRIMARY KEY,
    name varchar(300),
    date_of_birth DATE
)

CREATE TABLE invoices (
    id SERIAL PRIMARY KEY,
    total_amount DECIMAL,
    generated_at TIMESTAMP,
    played_at TIMESTAMP,
    medical_history_id INT,
    CONSTRAINT medic_history_fk FOREIGN KEY(medical_history_id) REFERENCES mediacal_histories(id)
)

CREATE TABLE treatments (
    id SERIAL PRIMARY KEY,
    type varchar(300),
    name varchar(300)
)

CREATE TABLE invoice_items (
    id SERIAL PRIMARY KEY,
    unit_price  DECIMAL,
    quantity INT,
    total_price DECIMAL,
    invoice_id int,
    treatment_id int,
    CONSTRAINT invoice_fk FOREIGN KEY(invoice_id) REFERENCES invoices(id),
    CONSTRAINT treatment_fk FOREIGN KEY(treatment_id) REFERENCES treatments(id)
)

CREATE TABLE medical_histories_treatments(
    medical_history_id INT NOT NULL,
    treatment_id INT NOT NULL,
    CONSTRAINT history_fk FOREIGN KEY (medical_history_id) REFERENCES medical_histories(id),
    CONSTRAINT treatment_fk FOREIGN KEY(treatment_id) REFERENCES treatments(id)
)

CREATE INDEX invoice_items_index ON invoice_items(invoice_id);
CREATE INDEX treatment_invoice_items_index ON invoice_items(treatment_id);
CREATE INDEX treatements_histories_id_index ON medical_histories_treatements(treatment_id);
CREATE INDEX medical_treatements_histories_id_index ON medical_histories_treatements(medical_history_id);
CREATE INDEX invoice_medical_history_index ON invoices(medical_history_id);
CREATE INDEX histories_patients_id_index ON medical_histories(patient_id);