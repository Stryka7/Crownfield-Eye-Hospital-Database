 p.last_name,
    a.appointment_id,
    a.appointment_date,
    a.appointment_status
FROM Patients p
LEFT JOIN Appointments a
    ON p.patient_id = a.patient_id;


-- 4. SUBQUERY: Find patients with at least one booked appointment

SELECT
    patient_id,
    first_name,
    last_name
FROM Patients
WHERE patient_id IN (
    SELECT patient_id
    FROM Appointments
    WHERE appointment_status = 'Booked'
);