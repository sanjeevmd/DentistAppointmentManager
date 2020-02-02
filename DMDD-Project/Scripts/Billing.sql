/**********************************************************************************************************************/
/* Script       - Billing																							  */	
/* Version      - 1.0																								  */
/* Date Created - 11/12/2019																						  */
/* Author		- DeadLockers																						  */						
/**********************************************************************************************************************/


Alter Procedure [dbo].[Billing] @billingID int
as 
select ISNULL(sum(cost),0) as cost,firstName,Appointments.appointmentID,dbo.returnCost(Appointments.appointmentID) as DentistCost
from Appointments
inner join Patient on Patient.patientID = Appointments.patientID
left join PatientTreatment on PatientTreatment.appointmentID = Appointments.appointmentID
left join Treatment on Treatment.treatmentID = PatientTreatment.treatmentID
where Appointments.updateType = '2' and billingID = @billingID
group by Appointments.appointmentID,firstName
GO

insert into dbo.InstallationAudit(scriptName,scriptRunTime)
values('Billing 1.0', GETDATE())