USE crownfieldeyehospital;

-- 1. Patients
CREATE TABLE patients (
    patient_id VARCHAR(10) NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    postcode VARCHAR(10) NOT NULL,
    PRIMARY KEY (patient_id)
);

-- 2. Clinicians
CREATE TABLE clinicians (
    clinician_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    specialty VARCHAR(100) NOT NULL
);

-- 3. Clinics
CREATE TABLE clinics (
    clinic_id INT AUTO_INCREMENT PRIMARY KEY,
    clinic_name VARCHAR(100) NOT NULL,
    location VARCHAR(100) NOT NULL
);

-- 4. Medicines
CREATE TABLE medicines (
    medicine_id INT AUTO_INCREMENT PRIMARY KEY,
    medicine_name VARCHAR(100) NOT NULL,
    medicine_type VARCHAR(50) NOT NULL,
    description VARCHAR(255)
);

-- 5. Appointments
CREATE TABLE appointments (
    appointment_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id VARCHAR(10) NOT NULL,
    clinician_id INT NOT NULL,
    clinic_id INT NOT NULL,
    appointment_date DATE NOT NULL,
    appointment_time TIME NOT NULL,
    appointment_status VARCHAR(20) NOT NULL DEFAULT 'Scheduled',
    KEY fk_appointment_patient (patient_id),
    KEY fk_appointment_clinician (clinician_id),
    KEY fk_appointment_clinic (clinic_id),
    CONSTRAINT fk_appointment_clinic
        FOREIGN KEY (clinic_id) REFERENCES clinics(clinic_id),
    CONSTRAINT fk_appointment_clinician
        FOREIGN KEY (clinician_id) REFERENCES clinicians(clinician_id),
    CONSTRAINT fk_appointment_patient
        FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    CONSTRAINT chk_appointment_status
        CHECK (appointment_status IN ('Booked','Completed','Cancelled','No-show'))
);

-- 6. Diagnoses
CREATE TABLE diagnoses (
    diagnosis_id INT AUTO_INCREMENT PRIMARY KEY,
    appointment_id INT NOT NULL,
    diagnosis_name VARCHAR(150) NOT NULL,
    diagnosis_date DATE NOT NULL,
    notes VARCHAR(255),
    KEY fk_diagnosis_ppointment (appointment_id),
    CONSTRAINT fk_diagnosis_ppointment
        FOREIGN KEY (appointment_id) REFERENCES appointments(appointment_id)
);

-- 7. Prescriptions
CREATE TABLE prescriptions (
    prescription_id INT AUTO_INCREMENT PRIMARY KEY,
    appointment_id INT NOT NULL,
    prescription_date DATE NOT NULL,
    notes VARCHAR(255),
    KEY fk_prescription_appointment (appointment_id),
    CONSTRAINT fk_prescription_appointment
        FOREIGN KEY (appointment_id) REFERENCES appointments(appointment_id)
);

-- 8. PrescriptionMedicines
CREATE TABLE prescriptionmedicines (
    prescription_medicine_id INT AUTO_INCREMENT PRIMARY KEY,
    prescription_id INT NOT NULL,
    medicine_id INT NOT NULL,
    dosage VARCHAR(100) NOT NULL,
    route VARCHAR(50) NOT NULL,
    frequency VARCHAR(100) NOT NULL,
    duration VARCHAR(100) NOT NULL,
    UNIQUE KEY uq_prescription_medicine (prescription_id, medicine_id),
    KEY fk_pm_medicine (medicine_id),
    CONSTRAINT fk_pm_medicine
        FOREIGN KEY (medicine_id) REFERENCES medicines(medicine_id),
    CONSTRAINT fk_pm_prescription
        FOREIGN KEY (prescription_id) REFERENCES prescriptions(prescription_id)
);

-- 9. FollowUpPlans
CREATE TABLE followupplans (
    follow_up_id INT AUTO_INCREMENT PRIMARY KEY,
    appointment_id INT NOT NULL,
    due_date DATE NOT NULL,
    priority VARCHAR(20) NOT NULL DEFAULT 'Medium',
    follow_up_status VARCHAR(20) NOT NULL DEFAULT 'Pending',
    notes VARCHAR(55),
    KEY fk_followup_appointment (appointment_id),
    CONSTRAINT fk_followup_appointment
        FOREIGN KEY (appointment_id) REFERENCES appointments(appointment_id),
    CONSTRAINT chk_followup_priority
        CHECK (priority IN ('Low','Medium','High')),
    CONSTRAINT chk_followup_status
        CHECK (follow_up_status IN ('Pending','Completed','Cancelled'))
);

-- 10. AppointmentStatusAudit
CREATE TABLE appointmentstatusaudit (
    audit_id INT AUTO_INCREMENT PRIMARY KEY,
    appointment_id INT NOT NULL,
    old_status VARCHAR(20) NOT NULL,
    new_status VARCHAR(20) NOT NULL,
    changed_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);