ROLLBACK;
-- Confirm the original value is restored
SELECT appointment_id, appointment_status
FROM Appointments
WHERE appointment_id = 3;

-- 4. TRANSACTION COMMIT EXAMPLE
-- COMMIT permanently saves changes.
-- This is an example only; do not execute
-- without a specific change you intend to keep.

-- START TRANSACTION;
-- UPDATE Appointments
-- SET appointment_status = 'Completed'
-- WHERE appointment_id = 3;
-- COMMIT;