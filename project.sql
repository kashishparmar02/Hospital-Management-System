create database project;
use project;

CREATE TABLE Patient(
email varchar(50) PRIMARY KEY,
password varchar(30) NOT NULL,
name varchar(50) NOT NULL,
address varchar(60) NOT NULL,
gender VARCHAR(20) NOT NULL
);

CREATE TABLE MedicalHistory(
id int PRIMARY KEY,
date DATE NOT NULL,
conditions VARCHAR(100) NOT NULL, 
surgeries VARCHAR(100) NOT NULL, 
medication VARCHAR(100) NOT NULL
);

CREATE TABLE Doctor(
email varchar(50) PRIMARY KEY,
gender varchar(20) NOT NULL,
password varchar(30) NOT NULL,
name varchar(50) NOT NULL
);

CREATE TABLE Appointment(
id int PRIMARY KEY,
date DATE NOT NULL,
starttime TIME NOT NULL,
endtime TIME NOT NULL
);

CREATE TABLE PatientsAttendAppointments(
patient varchar(50) NOT NULL,
appt int NOT NULL,
concerns varchar(40) NOT NULL,
symptoms varchar(40) NOT NULL,
FOREIGN KEY (patient) REFERENCES Patient (email) ON DELETE CASCADE,
FOREIGN KEY (appt) REFERENCES Appointment (id) ON DELETE CASCADE,
PRIMARY KEY (patient, appt)
);

CREATE TABLE Schedule(
id int NOT NULL,
starttime TIME NOT NULL,
endtime TIME NOT NULL,
breaktime TIME NOT NULL,
day varchar(20) NOT NULL,
PRIMARY KEY (id, starttime, endtime, breaktime, day)
);

CREATE TABLE PatientsFillHistory(
patient varchar(50) NOT NULL,
history int NOT NULL,
FOREIGN KEY (patient) REFERENCES Patient (email) ON DELETE CASCADE,
FOREIGN KEY (history) REFERENCES MedicalHistory (id) ON DELETE CASCADE,
PRIMARY KEY (history)
);

CREATE TABLE Diagnose(
appt int NOT NULL,
doctor varchar(50) NOT NULL,
diagnosis varchar(40) NOT NULL,
prescription varchar(50) NOT NULL,
FOREIGN KEY (appt) REFERENCES Appointment (id) ON DELETE CASCADE,
FOREIGN KEY (doctor) REFERENCES Doctor (email) ON DELETE CASCADE,
PRIMARY KEY (appt, doctor)
);

CREATE TABLE DocsHaveSchedules(
sched int NOT NULL,
doctor varchar(50) NOT NULL,
FOREIGN KEY (sched) REFERENCES Schedule (id) ON DELETE CASCADE,
FOREIGN KEY (doctor) REFERENCES Doctor (email) ON DELETE CASCADE,
PRIMARY KEY (sched, doctor)
);

CREATE TABLE DoctorViewsHistory(
history int NOT NULL,
doctor varchar(50) NOT NULL,
FOREIGN KEY (doctor) REFERENCES Doctor (email) ON DELETE CASCADE,
FOREIGN KEY (history) REFERENCES MedicalHistory (id) ON DELETE CASCADE,
PRIMARY KEY (history, doctor)
);




INSERT INTO Patient (email, password, name, address, gender)
VALUES
('patient1@example.com', 'password123', 'Patient 1', 'Address 425', 'male'),
('patient2@example.com', 'password456', 'Patient 2', 'Address 662', 'male'),
('patient3@example.com', 'password789', 'Patient 3', 'Address 793', 'male'),
('patient4@example.com', 'passwordabc', 'Patient 4', 'Address 36', 'female'),
('patient5@example.com', 'passworddef', 'Patient 5', 'Address 355', 'male'),
('patient6@example.com', 'passwordghi', 'Patient 6', 'Address 946', 'female'),
('patient7@example.com', 'passwordjkl', 'Patient 7', 'Address 820', 'female'),
('patient8@example.com', 'passwordmno', 'Patient 8', 'Address 985', 'male'),
('patient9@example.com', 'passwordpqr', 'Patient 9', 'Address 648', 'male'),
('patient10@example.com', 'passwordstu', 'Patient 10', 'Address 772', 'female'),
('patient11@example.com', 'passwordvwx', 'Patient 11', 'Address 929', 'male'),
('patient12@example.com', 'passwordyz1', 'Patient 12', 'Address 550', 'female'),
('patient13@example.com', 'password234', 'Patient 13', 'Address 11', 'male'),
('patient14@example.com', 'password567', 'Patient 14', 'Address 667', 'male'),
('patient15@example.com', 'password890', 'Patient 15', 'Address 892', 'male'),
('patient16@example.com', 'passwordabc1', 'Patient 16', 'Address 536', 'male'),
('patient17@example.com', 'passworddef2', 'Patient 17', 'Address 711', 'female'),
('patient18@example.com', 'passwordghi3', 'Patient 18', 'Address 865', 'female'),
('patient19@example.com', 'passwordjkl4', 'Patient 19', 'Address 22', 'male'),
('patient20@example.com', 'passwordmno5', 'Patient 20', 'Address 483', 'female')
;


INSERT INTO MedicalHistory(id,date,conditions,surgeries,medication)
VALUES
(1, '9-01-14', 'Pain in abdomen', 'Heart Surgery', 'Crocin'),
(2, '19-01-14', 'Frequent Indigestion', 'none', 'none'),
(3, '19-01-14', 'Body Pain', 'none', 'Iodex'),
(4, '14-01-15', 'Cough and Cold', 'none', 'Benadryl'),
(5, '9-01-15', 'Headache', 'none', 'Aspirin'),
(6, '15-01-15', 'Fever', 'none', 'Paracetamol'),
(7, '9-01-16', 'Joint Pain', 'Physiotherapy', 'none'),
(8, '13-01-16', 'Diabetes', 'Insulin', 'none'),
(9, '17-01-17', 'Skin Rash', 'none', 'Calamine Lotion'),
(10, '19-01-17', 'High Blood Pressure', 'Beta Blockers', 'none'),
(11, '19-01-17', 'Muscle Cramps', 'none', 'Magnesium Tablets'),
(12, '12-01-18', 'Back Pain', 'Chiropractic Therapy', 'none'),
(13, '29-01-18', 'Migraine', 'none', 'Sumatriptan'),
(14, '19-01-18', 'Stomach Ulcer', 'Antacids', 'none'),
(15, '29-01-19', 'Anxiety', 'Counseling', 'none'),
(16, '29-01-19', 'Depression', 'Antidepressants', 'none'),
(17, '9-01-19', 'Insomnia', 'Sleeping Pills', 'none'),
(18, '19-01-20', 'Thyroid Disorder', 'Hormone Replacement Therapy', 'none'),
(19, '9-01-20', 'Asthma', 'Inhalers', 'none'),
(20, '9-01-20', 'Allergic Rhinitis', 'none', 'Nasal Spray');

INSERT INTO Doctor(email, password, name,gender)
VALUES
('doctor1@example.com', 'password123', 'Dr. Smith', 'male'),
('doctor2@example.com', 'password456', 'Dr. Lee', 'female'),
('doctor3@example.com', 'password789', 'Dr. Patel', 'male'),
('doctor4@example.com', 'password111', 'Dr. Williams', 'female'),
('doctor5@example.com', 'password222', 'Dr. Johnson', 'male'),
('doctor6@example.com', 'password333', 'Dr. Chen', 'female'),
('doctor7@example.com', 'password444', 'Dr. Brown', 'male'),
('doctor8@example.com', 'password555', 'Dr. Gupta', 'male'),
('doctor9@example.com', 'password666', 'Dr. Martinez', 'female'),
('doctor10@example.com', 'password777', 'Dr. Wilson', 'male'),
('doctor11@example.com', 'password888', 'Dr. Kim', 'female'),
('doctor12@example.com', 'password999', 'Dr. Taylor', 'male'),
('doctor13@example.com', 'password000', 'Dr. Singh', 'male'),
('doctor14@example.com', 'password111', 'Dr. Anderson', 'female'),
('doctor15@example.com', 'password222', 'Dr. Baker', 'male'),
('doctor16@example.com', 'password333', 'Dr. Chen', 'female'),
('doctor17@example.com', 'password444', 'Dr. Davis', 'male'),
('doctor18@example.com', 'password555', 'Dr. Gonzalez', 'female'),
('doctor19@example.com', 'password666', 'Dr. Hernandez', 'male'),
('doctor20@example.com', 'password777', 'Dr. Jackson', 'female');


INSERT INTO Appointment(id,date,starttime,endtime)
VALUES
(1, '19-01-15', '09:00', '10:00'),
(2, '19-01-16', '10:00', '11:00'),
(3, '19-01-18', '14:00', '15:00'),
(4, '19-01-19', '16:00', '17:00'),
(5, '19-01-21', '11:00', '12:00'),
(6, '19-01-22', '13:00', '14:00'),
(7, '19-01-23', '15:00', '16:00'),
(8, '19-01-25', '09:00', '10:00'),
(9, '19-01-26', '11:00', '12:00'),
(10, '19-01-28', '14:00', '15:00'),
(11, '19-01-29', '16:00', '17:00'),
(12, '19-01-31', '10:00', '11:00'),
(13, '19-02-01', '12:00', '13:00'),
(14, '19-02-02', '14:00', '15:00'),
(15, '19-02-04', '09:00', '10:00'),
(16, '19-02-05', '11:00', '12:00'),
(17, '19-02-07', '14:00', '15:00'),
(18, '19-02-08', '16:00', '17:00'),
(19, '19-02-10', '10:00', '11:00'),
(20, '19-02-11', '12:00', '13:00')
;

INSERT INTO PatientsAttendAppointments(patient,appt,concerns,symptoms)
VALUES
('patient1@example.com', 1, 'none', 'headache'),
('patient2@example.com', 2, 'infection', 'fever'),
('patient3@example.com', 3, 'nausea', 'vomiting'),
('patient4@example.com', 4, 'cold', 'cough'),
('patient5@example.com', 5, 'allergy', 'sneezing'),
('patient6@example.com', 6, 'injury', 'back pain'),
('patient7@example.com', 7, 'none', 'stomach ache'),
('patient8@example.com', 8, 'infection', 'sore throat'),
('patient9@example.com', 9, 'nausea', 'diarrhea'),
('patient10@example.com', 10, 'migraine', 'headache'),
('patient11@example.com', 11, 'cold', 'runny nose'),
('patient12@example.com', 12, 'allergy', 'itchy eyes'),
('patient13@example.com', 13, 'injury', 'knee pain'),
('patient14@example.com', 14, 'none', 'chest pain'),
('patient15@example.com', 15, 'infection', 'earache'),
('patient16@example.com', 16, 'nausea', 'indigestion'),
('patient17@example.com', 17, 'migraine', 'dizziness'),
('patient18@example.com', 18, 'cold', 'sore throat'),
('patient19@example.com', 19, 'allergy', 'hives'),
('patient20@example.com', 20, 'injury', 'sprained ankle')
;


INSERT INTO Schedule(id,starttime,endtime,breaktime,day)
VALUES
(001,'09:00','17:00','12:00','Monday'),
(001,'09:00','17:00','12:00','Tuesday'),
(001,'09:00','17:00','12:00','Wednesday'),
(001,'09:00','17:00','12:00','Thursday'),
(001,'09:00','17:00','12:00','Friday'),
(002,'09:00','17:00','12:00','Monday'),
(002,'09:00','17:00','12:00','Tuesday'),
(002,'09:00','17:00','12:00','Wednesday'),
(002,'09:00','17:00','12:00','Thursday'),
(002,'09:00','17:00','12:00','Friday'),
(003,'09:00','17:00','12:00','Monday'),
(003,'09:00','17:00','12:00','Tuesday'),
(003,'09:00','17:00','12:00','Wednesday'),
(003,'09:00','17:00','12:00','Thursday'),
(003,'09:00','17:00','12:00','Friday'),
(004,'09:00','17:00','12:00','Monday'),
(004,'09:00','17:00','12:00','Tuesday'),
(004,'09:00','17:00','12:00','Wednesday'),
(004,'09:00','17:00','12:00','Thursday'),
(004,'09:00','17:00','12:00','Friday')
;

INSERT INTO PatientsFillHistory(patient,history)
VALUES
('patient1@example.com', 1),
('patient2@example.com', 2),
('patient3@example.com', 3),
('patient4@example.com', 4),
('patient5@example.com', 5),
('patient6@example.com', 6),
('patient7@example.com', 7),
('patient8@example.com', 8),
('patient9@example.com', 9),
('patient10@example.com', 10),
('patient11@example.com', 11),
('patient12@example.com', 12),
('patient13@example.com', 13),
('patient14@example.com', 14),
('patient15@example.com', 15),
('patient16@example.com', 16),
('patient17@example.com', 17),
('patient18@example.com', 18),
('patient19@example.com', 19),
('patient20@example.com', 20)
;

INSERT INTO Diagnose(appt,doctor,diagnosis,prescription)
VALUES
(1, 'doctor1@example.com', 'Headache', 'Tylenol'),
(2, 'doctor2@example.com', 'Sore throat', 'Salt water gargles'),
(3, 'doctor3@example.com', 'Allergies', 'Claritin'),
(4, 'doctor4@example.com', 'Stomach ache', 'Pepto Bismol'),
(5, 'doctor5@example.com', 'Back pain', 'Heat therapy'),
(6, 'doctor6@example.com', 'Cold', 'Chicken soup'),
(7, 'doctor7@example.com', 'Fever', 'Advil'),
(8, 'doctor8@example.com', 'Joint pain', 'Ibuprofen'),
(9, 'doctor9@example.com', 'Nausea', 'Ginger ale'),
(10, 'doctor10@example.com', 'Anxiety', 'Deep breathing exercises'),
(11, 'doctor11@example.com', 'Insomnia', 'Melatonin'),
(12, 'doctor12@example.com', 'High blood pressure', 'Exercise and diet'),
(13, 'doctor13@example.com', 'Depression', 'Counseling'),
(14, 'doctor14@example.com', 'Acne', 'Benzoyl peroxide'),
(15, 'doctor15@example.com', 'Rash', 'Hydrocortisone cream'),
(16, 'doctor16@example.com', 'Migraine', 'Caffeine'),
(17, 'doctor17@example.com', 'Constipation', 'Fiber-rich diet'),
(18, 'doctor18@example.com', 'Diarrhea', 'Imodium'),
(19, 'doctor19@example.com', 'Cough', 'Robitussin'),
(20, 'doctor20@example.com', 'Flu', 'Tamiflu')
;

INSERT INTO DocsHaveSchedules(sched,doctor)
VALUES
(001, 'doctor1@example.com'),
(002, 'doctor4@example.com'),
(001, 'doctor5@example.com'),
(003, 'doctor6@example.com'),
(004, 'doctor7@example.com'),
(003, 'doctor8@example.com'),
(004, 'doctor9@example.com')
;


INSERT INTO DoctorViewsHistory(history,doctor)
VALUES
(1, 'doctor12@example.com'),
(2, 'doctor2@example.com'),
(3, 'doctor7@example.com'),
(4, 'doctor4@example.com'),
(5, 'doctor16@example.com'),
(6, 'doctor9@example.com'),
(7, 'doctor1@example.com'),
(8, 'doctor19@example.com'),
(9, 'doctor8@example.com'),
(10, 'doctor20@example.com'),
(11, 'doctor15@example.com'),
(12, 'doctor5@example.com'),
(13, 'doctor6@example.com'),
(14, 'doctor11@example.com'),
(15, 'doctor18@example.com'),
(16, 'doctor14@example.com'),
(17, 'doctor3@example.com'),
(18, 'doctor13@example.com'),
(19, 'doctor17@example.com'),
(20, 'doctor10@example.com')
;

show tables;

use project;
-- Query to get schedule of x doctor on y day --  
SELECT * 
FROM sCHEDULE
WHERE DAY = 'Tuesday'
AND id IN (
    SELECT appt
    FROM Diagnose
    WHERE doctor = 'doctor1@example.com'
);
--  Get medical history from patient id-- 
SELECT * FROM MedicalHistory
INNER JOIN PatientsFillHistory ON MedicalHistory.id = PatientsFillHistory.history
INNER JOIN Patient ON PatientsFillHistory.patient = Patient.email
WHERE Patient.email = 'patient1@example.com';
-- Get doctor detail from email-- 
SELECT * FROM Doctor
WHERE email = 'doctor1@example.com';

-- get patient detail from email-- 

SELECT * FROM Patient
WHERE email = 'patient1@example.com';

-- Get all schedule of doctor by email--
SELECT * FROM Schedule
INNER JOIN DocsHaveSchedules ON Schedule.id = DocsHaveSchedules.sched
INNER JOIN Doctor ON DocsHaveSchedules.doctor = Doctor.email
WHERE Doctor.email = 'doctor1@example.com';


SELECT * FROM MedicalHistory
INNER JOIN Diagnose ON MedicalHistory.id = Diagnose.appt
INNER JOIN Doctor ON Diagnose.doctor = Doctor.email
WHERE Doctor.email = 'doctor2@example.com';

SELECT Patient.name FROM Patient
INNER JOIN PatientsAttendAppointments ON Patient.email = PatientsAttendAppointments.patient
INNER JOIN Diagnose ON PatientsAttendAppointments.appt = Diagnose.appt
INNER JOIN Doctor ON Diagnose.doctor = Doctor.email
WHERE Doctor.name = 'Dr. Smith';


-- doctor name by its preccription
SELECT Doctor.name, Doctor.email FROM Doctor
INNER JOIN Diagnose ON Doctor.email = Diagnose.doctor
WHERE Diagnose.prescription = 'Exercise and diet';

-- patientname group by medicians
SELECT medication, GROUP_CONCAT(name SEPARATOR ', ') as patients
FROM MedicalHistory
INNER JOIN PatientsFillHistory ON MedicalHistory.id = PatientsFillHistory.history
INNER JOIN Patient ON PatientsFillHistory.patient = Patient.email
GROUP BY medication;

-- patientsname group by symptoms
SELECT symptoms, GROUP_CONCAT(name SEPARATOR ', ') as patients
FROM PatientsAttendAppointments
INNER JOIN Patient ON PatientsAttendAppointments.patient = Patient.email
GROUP BY symptoms;



