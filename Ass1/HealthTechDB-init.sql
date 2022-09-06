drop database if exists HealthTech;
create database HealthTech;
use HealthTech;

drop table if exists contact;

drop table if exists contactor;

drop table if exists patient;

drop table if exists carer;

drop table if exists worker;

-- CREATING PATIENT TABLE
create table patient (
patientID int NOT NULL, 
firstName varchar(30) NOT NULL, 
lastName varchar(30) NOT NULL,
phoneNumber varchar(20),
emailAddress varchar(40),
DOB date,
PRIMARY KEY (patientID)
);

-- CREATING CARER TABLE
create table carer (
carerID int NOT NULL, 
firstName varchar(30) NOT NULL, 
lastName varchar(30) NOT NULL,
phoneNumber varchar(20),
emailAddress varchar(40),
PRIMARY KEY (carerID)
);

-- CREATING CONTACTOR TABLE
create table contactor (
carerID int NOT NULL,
patientID int NOT NULL,
contactorType varchar(15) NOT NULL,
primary key (patientID, carerID),
foreign key (patientID) references patient(patientID),
foreign key (carerID) references carer(carerID)
);

-- CREATING WORKER TABLE
create table worker (
workerID int NOT NULL, 
firstName varchar(30) NOT NULL, 
lastName varchar(30) NOT NULL,
phoneNumber varchar(20),
emailAddress varchar(40),
workingDays varchar(10),
shift varchar(10),
PRIMARY KEY (workerID)
);

-- CREATING CONTACT TABLE
create table contact (
contactID int NOT NULL, 
contactDate date,
contactTime time,
contactInfo varchar(80),
carerID int NOT NULL,
patientID int NOT NULL,
workerID int NOT NULL,
PRIMARY KEY (contactID),
foreign key (carerID) references contactor(carerID),
foreign key (patientID) references contactor(patientID),
foreign key (workerID) references worker(workerID)
);

-- ALLOW UPlOAD OF DATA
SHOW VARIABLES LIKE "secure_file_priv";

-- IMPORTING CSV DATA FOR CARER
load data infile 'C:/Temp/BCDE214/carer_data.csv'
into table carer
fields terminated by ','
ignore 1 rows;

-- TESTING IMPORT
select * from carer;

-- IMPORTING CSV DATA FOR PATIENT
load data infile 'C:/Temp/BCDE214/patient_data.csv'
into table patient
fields terminated by ','
ignore 1 rows;

-- TESTING IMPORT
select * from patient;

-- IMPORTING CSV DATA FOR WORKER
load data infile 'C:/Temp/BCDE214/worker_data.csv'
into table worker
fields terminated by ','
ignore 1 rows;

-- TESTING IMPORT
select * from worker;

SET FOREIGN_KEY_CHECKS=0;
-- IMPORTING CSV DATA FOR CONTACTOR
load data infile 'C:/Temp/BCDE214/contactor_data.csv'
into table contactor
fields terminated by ','
ignore 1 rows;

-- TESTING IMPORT
select * from contactor;

SET FOREIGN_KEY_CHECKS=0;
-- IMPORTING CSV DATA FOR CONTACTOR
load data infile 'C:/Temp/BCDE214/contact_data.csv'
into table contact
fields terminated by ','
ignore 1 rows;

-- TESTING IMPORT
select * from contact;

