use healthtech;

-- log useful contact information for documentation - patient info, person who made contact, worker info and action taken
create or replace view ContactLog as
	select
		c.contactID as "contactNumber",
        c.contactDate,
        c.contactTime,
        p.patientID, 
		concat(p.firstName, " ", p.lastName) as "patientName", 
        cr.contactorType,
		if(cr.contactorType like '%carer%', concat(ca.firstName, " ", ca.lastName), concat(p.firstName, " ", p.lastName)) as "contactorName",
        concat(w.firstName, " ", w.lastName) as "workerName",
        c.contactInfo
	from contact c
    inner join worker w
		on w.workerID = c.workerID
    inner join contactor cr
		on cr.patientID = c.patientID and cr.carerID = c.carerID
    inner join patient p
		on p.patientID = cr.patientID
    inner join carer ca 
		on ca.carerID = cr.carerID;
        
select * from contactlog;

-- contact information for the contactor
create or replace view ContactorDetails as
	select 
		cr.contactorType,
		if(cr.contactorType like '%carer%', 
            concat(ca.firstName, " ", ca.lastName), 
            concat(p.firstName, " ", p.lastName)) as "contactorName",
		if(cr.contactorType like '%carer%', 
            (ca.phoneNumber), 
            p.phoneNumber) as "phoneNumber",
		if(cr.contactorType like '%carer%', 
            (ca.emailAddress), 
            p.emailAddress) as "emailAddress"
		from contactor cr
        inner join patient p
			on p.patientID = cr.patientID
		inner join carer ca 
			on ca.carerID = cr.carerID;
            
select * from ContactorDetails;

-- Get worker information
create or replace view WorkerDetails as
	select
		concat(firstName, " ", lastName) as "workerName",
        concat(workingDays, " ", shift, "shift") as "workingHours",
        phoneNumber,
        emailAddress
	from worker;

-- select day shift
select * from WorkerDetails
where workingHours like '%day%';


