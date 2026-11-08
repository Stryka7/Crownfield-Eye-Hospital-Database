USE crownfieldeyehospital;

-- 1. STORED PROCEDURE
-- Retrieves appointments for a selected patient.
-- Input parameter: patient ID.

DROP PROCEDURE IF EXISTS GetPatientAppointments;

DELIMITER //

CREATE PROCEDURE GetPatientAppointments(
    IN p_patient_id VARCHAR(10)
)
BEGIN
    SELECT
        appointment_id,
        patient_id,
        clinician_id,
        clinic_id,
        appointment_date,
        appointment_time,
        appointment_status
    FROM Appointments
    WHERE patient_id = p_patient_id;
END //

DELIMITER ;


-- 2. TRIGGER
-- Records appointment status changes in the audit table.

DROP TRIGGER IF EXISTS trg_appointment_status_audit;

DELIMITER //

CREATE TRIGGER trg_appointment_status_audit
AFTER UPDATE ON Appointments
FOR EACH ROW
BEGIN
    IF OLD.appointment_status <> NEW.appointment_status THEN

        INSERT INTO AppointmentStatusAudit (
            appointment_id,
            old_status,
            new_status
        )
        VALUES (
            OLD.appointment_id,
            OLD.appointment_status,
            NEW.appointment_status
        );

    END IF;
END //

DELIMITER ;