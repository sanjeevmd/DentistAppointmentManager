/**********************************************************************************************************************/
/* Script       - Greenfield Dentist Database																		  */	
/* Version      - 5.0																								  */
/* Date Created - 12/08/2019																						  */
/* Author		- DeadLockers																						  */						
/**********************************************************************************************************************/

Use [Dentist]
Go
/**Company table**/
IF (EXISTS (SELECT * 
                 FROM INFORMATION_SCHEMA.TABLES 
                 WHERE TABLE_SCHEMA = 'dbo' 
                 AND  TABLE_NAME = 'Company'))
BEGIN
	DROP table Company
End 
Go
Create table Company(
companyID int identity(1,1) primary key,
[name] varchar(50) not null,
emailID varchar(50) not null
)
Go

insert into Company ([name],emailID)
values('Progress Corporation','progresscorporation@outlook.com'),('GEICO','geicocorporation@outlook.com'),('Dental Diagnositics','dentaldiagnosticsusa@gmail.com'),
('Portal Instruments','portalInstruments@outlook.com'),('TetraScience','TetraScienceusa@gmail.com'),('ACE Surgical Supply','acesurgicals@ace.com'),
('BrasselerUSA','braseelerusa@outlook.com'),('ThomasNet','thomasnet@hotmail.com'),('Karlschumacher','schumacher@hotmail.com'),
('3M','3musa@gmail.com'),('Danaher','danaherdentals@outlook.com'),('Dentsply Sirona','dentsplysironausa@gmail.com'),
('Henry Schein','henryscheinsurgicals@gmail.com'),('Patterson Companies','patterson@outlook.com'),('Technavio Surgicals','technaviosurgicals@outlook.com')
Go
print 'Company Table populated'
Go


/** CompanyContacts table **/
IF (EXISTS (SELECT * 
                 FROM INFORMATION_SCHEMA.TABLES 
                 WHERE TABLE_SCHEMA = 'dbo' 
                 AND  TABLE_NAME = 'CompanyContacts'))
BEGIN
	DROP table CompanyContacts
End 
Go
create table CompanyContacts(
contactID int identity(1,1) primary key,
companyID int foreign key references Company(companyID),
contactName varchar(50) not null,
contactNumber char(10) not null,
department varchar(30)
)
Go
insert into CompanyContacts (companyID,contactName,contactNumber)
values(1,'Margery Tyrell','8575882345'),(8,'Rickon Stark','8675884356'),(4,'Jon Targaereyen','3458576547'),(2,'Mercylla','9870989876'),
(7,'Robert Baratheon','7620983628'),(6,'Cersei Lannister','1230984567'),(5,'Arya Stark','8794729856'),(7,'WhiteWalker','7943634589'),
(8,'Neddard Stark','3432942839'),(9,'Eddard Stark','9082315798'),(5,'Rickon Targaereyen','8789889999'),(6,'Jon Snow','2874980982'),
(11,'Jaime Lannister','8347834753'),(12,'Ser Varys','2349859383'),(13,'LittleFinger','5894589344'),(14,'Petyr Baelish','5435798939'),
(6,'Denaerys Targaereyen','8428825503'),(15,'Tommen Baratheon','4892719437'),(15,'Tyrion Lannister','4220924395'),(8,'Nimmeriya','1235940903')
Go 
print 'CompanyContacts Table populated'
Go

--------------------------------------------------------Company-----------------------------------------------------------

/** Patient table **/
IF (EXISTS (SELECT * 
                 FROM INFORMATION_SCHEMA.TABLES 
                 WHERE TABLE_SCHEMA = 'dbo' 
                 AND  TABLE_NAME = 'Patient'))
BEGIN
	DROP table Patient
End 
Go
Create table Patient(
patientID int identity(1,1) primary key,
patientHRN varchar(10) not null,
firstName varchar(50) not null,
middleName varchar(50) ,
lastName varchar(50),
gender char(1),
contactNumber char(10),
emailID varchar(50),
dob date
)
Go
print 'Patient Table Created'
Go

Insert into Patient (patientHRN,firstName,lastName,gender,contactNumber,emailID,dob)
values ('DP001','Harish','Sivaprakash','M',8575882341, 'harish_ks@gmail.com','1995-09-22'),
('DP002','Sridhar','Paneerselvam','M',8575882345, 'sridharprasad.p@gmail.com','1995-06-27'),
('DP003','Gayathri','Reddiar','F',9897891234, 'gayu.huhu@gmail.com','1994-11-11'),
('DP004','Keshav','Kanth','M',8575882342, 'keshav,.ka@gmail.com','1995-12-26'),
('DP005','Sanjeev','Dharani','M',8575882346, 'sanjeev.ma@gmail.com','1995-05-31'),
('DP006','Hemalatha','Sekar','F',9443215066, 'hemasekar07@gmail.com','1970-09-22'),
('DP007','Sekar','Narayanasamy','M',9345215066, 'sekar.h@gmail.com','1962-03-01'),
('DP008','Lekhiya','Keshav','F',8575882343, 'keshav,.ka@gmail.com','1997-02-13'),
('DP009','Sanjay','Manoj','M',8575882340, 'sanjay.ma@gmail.com','1995-05-30'),
('DP010','Naveen','Jangid','M',9343432429,'naveenjangid@gmail.com','2016-03-02')


/**PatientAddress table**/ 
IF (EXISTS (SELECT * 
                 FROM INFORMATION_SCHEMA.TABLES 
                 WHERE TABLE_SCHEMA = 'dbo' 
                 AND  TABLE_NAME = 'PatientAddress'))
BEGIN
	DROP table PatientAddress
End 
Go
Create table PatientAddress(
addressID int identity(1,1) primary key,
patientID int foreign key references Patient(patientID) not null,
street varchar(50) not null,
aptNumber char(5),
city varchar(25) not null,
[state] char(2)  not null,
zipCode char(5) not null
)
Go
Insert into PatientAddress(patientID,street,aptNumber,city,[state],zipCode)
values(2,'226 Parker Hill','16','Boston','MA',02120),
(2,'226 Parker Hill','15','Boston','MA',02120),
(1,'226 Parker Hill','14','Boston','MA',02120),
(3,'226 Parker Hill','16','Boston','MA',02120),
(4,'226 Parker Hill','16','Boston','MA',02120),
(4,'226 Parker Hill','15','Boston','MA',02120),
(5,'226 Parker Hill','16','Boston','MA',02120),
(6,'226 Parker Hill','15','Boston','MA',02120),
(6,'226 Parker Hill','16','Boston','MA',02120),
(7,'226 Parker Hill','16','Boston','MA',02120),
(7,'226 Parker Hill','19','Boston','MA',02120),
(8,'226 Parker Hill','13','Boston','MA',02120),
(9,'226 Parker Hill','17','Boston','MA',02120)
Go
print 'PatientAddress Table created'
Go

/** PatientAllergies table **/
IF (EXISTS (SELECT * 
                 FROM INFORMATION_SCHEMA.TABLES 
                 WHERE TABLE_SCHEMA = 'dbo' 
                 AND  TABLE_NAME = 'PatientAllergies'))
BEGIN
	DROP table PatientAllergies
End 
Go
Create table PatientAllergies(
allergyID int identity(1,1) primary key,
patientID int foreign key references Patient(patientID) not null,
description varchar(500) not null,
type varchar(50) not null
)
Go
Insert into PatientAllergies(patientID,description,type)
values(1,'overdosing of acetaminophen (Tylenol®)','Drug Allergy'),
(8,'Drug interaction of acetaminophen (Tylenol®) with sulphur','Drug Allergy'),
(1,'Soy food allergic','Food Allergy'),
(4,'Nonsteroidal anti-inflammatory drugs like ibuprofen and naproxen','Drug Allergy'),
(2,'Antiseizure drugs -- carbamazepine (Tegretol), lamotrigine (Lamictal), phenytoin','Drug Allergy'),
(6,'Muscle relaxers given by IV -- atracurium, succinylcholine, or vecuronium','Drug Allergy'),
(7,'Insulin','Drug Allergy')
print 'PatientAllergies Table Created'
Go

--PatientInsurance
IF (EXISTS (SELECT * 
                 FROM INFORMATION_SCHEMA.TABLES 
                 WHERE TABLE_SCHEMA = 'dbo' 
                 AND  TABLE_NAME = 'PatientInsurance'))
BEGIN
	DROP table PatientInsurance
End 
Go
Create table PatientInsurance(
patientInsuranceID int identity(1,1) primary Key,
patientID int foreign key references Patient(patientID) not null,
companyID int foreign key references Company(companyID) not null,
insuranceNumber char(20) not null
)
Go
Insert into PatientInsurance(patientID,companyID,insuranceNumber)
values(1,2,'123QWE123'),
(8,1,'12NM89T67'),
(1,7,'652MI4I99'),
(7,6,'M87RV84RT'),
(2,5,'O90428POTE'),
(6,9,'BCQ54438E'),
(3,11,'VWQFI73HF'),
(3,8,'ASVQEAF49'),
(4,7,'BAS63T4VE'),
(5,6,'ASQW135HV'),
(6,13,'FG36365UP'),
(9,14,'JE943RWDN')
print 'PatientInsurance Table Created'
Go

---------------------------------------------------------Patient---------------------------------------------------------


/** Location Table **/
Create table Location (
locationID int identity(1,1) primary key,
[name] varchar(50) not null,
type char(2) not null,
parentLocationID int foreign key references Location(locationID)
)
Go
insert into location ([name],type,parentLocationID)
values('SouthBuilding','BU',1),('EastBuilding','BU',1),('WestBuilding','BU',1),
('102','RO',2),('103','RO',2), ('103','RO',2), ('104','RO',2),('105','RO',2) ,('106','RO',2), ('107','RO',2),('108','RO',2), ('109','RO',2), ('110','RO',2),
('201','RO',4),('202','RO',4),('203','RO',4),('204','RO',4),('205','RO',4),('206','RO',4),('207','RO',4),('208','RO',4),('209','RO',4),('210','RO',4),('211','RO',4),
('301','RO',5),('302','RO',5),('303','RO',5),('304','RO',5),('305','RO',5),('306','RO',5),('307','RO',5),('308','RO',5),('309','RO',5),('310','RO',5),('311','RO',5),
('401','RO',6),('402','RO',6),('403','RO',6),('404','RO',6),('405','RO',6),('406','RO',6),('407','RO',6),('408','RO',6),('409','RO',6),('410','RO',6),('411','RO',6)
print 'Location Table created'
Go

---------------------------------------------------------Location---------------------------------------------------------

/** Dentist **/
IF (EXISTS (SELECT * 
                 FROM INFORMATION_SCHEMA.TABLES 
                 WHERE TABLE_SCHEMA = 'dbo' 
                 AND  TABLE_NAME = 'Dentist'))
BEGIN
	DROP table Dentist
End 
Go
Create table Dentist(
dentistID int identity(1,1) primary key,
dentistHRN varchar(20) not null,
firstName varchar(50) not null,
middleName varchar(50),
lastName varchar(50),
doj date,
emailID varchar(50),
gender char(1),
contactNumber char(10) not null,
aptNumber char(5),
street varchar(50) not null,
city varchar(25) not null,
[state] char(2) not null,
zipCode char(5) not null,
cost decimal(18,2) not null
)
Go
Insert into Dentist(dentistHRN,firstName,middleName,lastName,doj,emailID,gender,contactNumber,aptNumber,street,city,state,zipCode,cost) 
values('DE001','Jason',Null,'Momoa','2017-09-18','jasonmomoa@gmail.com','M','8577636433','223','Parker Hill Avenue','Boston', 'MA', '02150',20),
('DE002','Emilia',Null,'Clarke','2016-11-11','emiliaclarke@gmail.com','F','8576885654','1','Jamaica Plain','Boston', 'MA', '02130',25),
('DE003','Kit',Null,'Harington','2017-09-01','kitharington@gmail.com','M','8772335786','6','Chinatown','Boston', 'MA', '02111',35),
('DE004','Sophie',Null,'Turner','2019-01-01','sophieturner@gmail.com','F','8324326454','11','Kenmore Square','Boston', 'MA', '02115',15),
('DE005','Maisie',Null,'Williams','2018-08-02','maisiewilliams@gmail.com','F','8989546323','221','Roxbury Crossing','Boston', 'MA', '02120',50),
('DE006','Peter',Null,'Dinklage','2016-07-11','peterdinklage@gmail.com','M','8225367471','23','Hyde Park','Boston', 'MA', '02136',40),
('DE007','Lena',Null,'Headey','2015-07-27','lenaheadey@gmail.com','F','8112783993','36','Suffolk County','Boston', 'MA', '02211',30),
('DE008','George',Null,'Martin','2018-01-25','georgemartin@gmail.com','M','8893323842','120','Heath Street','Boston', 'MA', '02228',28),
('DE009','Issac',Null,'Hempstead','2017-08-24','issachempstead@gmail.com','M','8555092223','20','Financial District','Boston', 'MA', '02110',35),
('DE010','Nathalie',Null,'Emmanuel','2019-01-13','nathalieemmanuel@gmail.com','F','8112126879','9','Chelsea','Boston', 'MA', '02150',40)
print 'Dentist Table Created'
Go




/** UserAccount Table **/
IF (EXISTS (SELECT * 
                 FROM INFORMATION_SCHEMA.TABLES 
                 WHERE TABLE_SCHEMA = 'dbo' 
                 AND  TABLE_NAME = 'UserAccount'))
BEGIN
	DROP table UserAccount
End 
Go
create table UserAccount
(
userID int primary key identity(1,1),
userName varchar(20) not null,
[password] varbinary(300) not null,
[role] varchar(10) not null,
dentistID int foreign key references Dentist(dentistID)
)
Go
Insert into UserAccount(userName,[password],[role],dentistID)
values('jason',ENCRYPTBYPASSPHRASE('key','jason') ,'dentist',1),
('emilia',ENCRYPTBYPASSPHRASE('key','emilia') ,'dentist',2),
('kit',ENCRYPTBYPASSPHRASE('key','kit') ,'dentist',3),
('sophie',ENCRYPTBYPASSPHRASE('key','sophie') ,'dentist',4),
('maisie',ENCRYPTBYPASSPHRASE('key','maisie') ,'dentist',5),
('peter',ENCRYPTBYPASSPHRASE('key','peter') ,'dentist',6),
('lena',ENCRYPTBYPASSPHRASE('key','lena') ,'dentist',7),
('george',ENCRYPTBYPASSPHRASE('key','george') ,'dentist',8),
('issac',ENCRYPTBYPASSPHRASE('key','issac') ,'dentist',9),
('nathalie',ENCRYPTBYPASSPHRASE('key','nathalie') ,'dentist',10)
print 'UserAccount Table Created'
Go

Insert into dbo.UserAccount
(userName,password,role,dentistID)
values('admin',ENCRYPTBYPASSPHRASE('key','admin'),'admin',null)
Go
print 'UserAccount admin values Inserted'
Go

Create procedure ReturnPassword @userName varchar(20)
as
begin
select  CONVERT(varchar(10), DECRYPTBYPASSPHRASE('key',password))  from UserAccount where userName = @userName;
end
Go
print 'returnPassword procedure created'
Go

---------------------------------------------------------UserAccount---------------------------------------------------------

------------------------------------------------------------------------------------------------------------------
/** STORED PROCEDURE FOR INSERTING VALUES INTO DENTIST AND USERACCOUNT ENTITIES **/

CREATE procedure [dbo].[DentistRegistration](@HRN varchar(max),
@fName varchar(max), @Mname varchar(max), @Lname varchar(max), @contact char(10), @email varchar(max), @gender char(1),
@doj datetime, @aptnum varchar(10), @street varchar(max), @city varchar(max),@state char(2)
,@username varchar(10), @password varchar(max),@role varchar(10),@zipcode char(5))
as 
begin
declare @id int

begin
Insert into dbo.dentist(dentistHRN,firstName,middleName,lastName,contactNumber,emailID,gender,doj,aptNumber,street,city,[state],zipcode)
values(@HRN,@fName,@mname, @lname, @contact, @email, @gender, @doj, @aptnum,@street,@city,@state,@zipcode)
set @id = @@IDENTITY
end
begin
Insert into dbo.userAccount(userName,[password],[role],dentistID)
values(@username,ENCRYPTBYPASSPHRASE('key',@password) ,@role,@id)
end
end
Go
------------------------------------------------------------------------------------------------------------------

/** DentistLicense Table **/
Create table DentistLicense(
licenseID int identity(1,1) primary key,
dentistID int foreign key references Dentist(dentistID) not null,
licenseNumber char(16) not null,
[state] char(2) not null,
expiry date not null
)
Go
Insert into DentistLicense(dentistID,licenseNumber,[state],expiry)
values(1,'DN8735','MA','2023-08-04'),
(1,'DL5221','MA','2023-08-04'),
(2,'DN7438','MA','2020-03-27'),
(2,'DN7552','MA','2020-06-07'),
(3,'DN1839','MA','2021-02-28'),
(4,'DN8835','MA','2024-06-06'),
(4,'DF8537','MA','2022-02-13'),
(4,'DH8712','MA','2020-06-16'),
(5,'DN6121','MA','2019-12-31'),
(6,'DN9823','MA','2022-11-16'),
(6,'DN3232','MA','2023-01-05'),
(6,'DH5613','MA','2021-04-17'),
(6,'DN0285B','MA','2024-09-09'),
(7,'DN7343','MA','2019-12-25'),
(8,'DN0545','MA','2019-10-08'),
(9,'DN4909A','MA','2021-05-21'),
(10,'DN8451D','MA','2020-07-30')
print 'DentistLicense Table created'
Go

select * from Location

/** DentistSchedule Table **/
Create table DentistSchedule(
scheduleID int identity(1,1) primary key,
dentistID int foreign key references Dentist(dentistID) not null,
locationID int not null foreign key references Location(locationID),
[dayOfWeek] char(1) not null,
startTime time not null,
endTime time not null
)
Go
Insert into DentistSchedule(dentistID,locationID,dayOfWeek,startTime,endTime) 
values(1,3,'1','09:00:00','14:00:00'),
(1,7,'1','14:00:00','17:00:00'),
(1,3,'2','09:00:00','17:00:00'),
(1,9,'3','09:00:00','11:00:00'),
(1,8,'3','12:00:00','14:00:00'),
(1,9,'3','15:00:00','17:00:00'),
(1,10,'4','09:00:00','17:00:00'),
(1,11,'5','09:00:00','13:00:00'),
(1,11,'5','13:30:00','17:00:00'),
(1,12,'6','09:00:00','17:00:00'),
(1,13,'7','09:00:00','14:00:00'),

(2,13,'1','09:00:00','17:00:00'),
(2,7,'2','09:00:00','13:30:00'),
(2,10,'2','14:00:00','17:00:00'),
(2,14,'3','09:00:00','17:00:00'),
(2,16,'4','09:00:00','12:00:00'),
(2,15,'4','12:30:00','14:00:00'),
(2,16,'4','14:00:00','17:00:00'),
(2,17,'5','09:00:00','14:00:00'),
(2,18,'5','15:00:00','17:00:00'),

(3,24,'1','09:00:00','10:30:00'),
(3,19,'1','12:00:00','17:00:00'),
(3,19,'2','09:00:00','17:00:00'),
(3,20,'3','09:00:00','15:00:00'),
(3,21,'4','09:00:00','14:00:00'),
(3,21,'4','14:30:00','17:00:00'),
(3,21,'5','09:00:00','12:00:00'),
(3,20,'5','12:00:00','14:00:00'),
(3,21,'5','14:00:00','17:00:00'),
(3,22,'6','10:00:00','16:00:00'),
(3,23,'7','11:00:00','14:00:00'),

(4,25,'1','09:00:00','17:00:00'),
(4,26,'3','09:00:00','17:00:00'),
(4,27,'5','09:00:00','17:00:00'),
(4,28,'7','09:00:00','17:00:00'),

(5,28,'2','09:00:00','17:00:00'),
(5,27,'3','09:00:00','17:00:00'),
(5,26,'4','09:00:00','17:00:00'),
(5,25,'5','09:00:00','17:00:00'),

(6,32,'1','09:00:00','17:00:00'),
(6,33,'2','09:00:00','17:00:00'),
(6,34,'3','09:00:00','17:00:00'),
(6,34,'4','09:00:00','17:00:00'),
(6,33,'5','09:00:00','17:00:00'),
(6,32,'6','09:00:00','14:00:00'),

(7,39,'1','14:00:00','17:00:00'),
(7,38,'2','09:00:00','14:00:00'),
(7,37,'3','14:00:00','17:00:00'),
(7,37,'4','09:00:00','14:00:00'),
(7,38,'5','14:00:00','17:00:00'),
(7,39,'6','09:00:00','14:00:00'),
(7,33,'7','09:00:00','14:00:00'),

(8,40,'1','09:00:00','15:00:00'),
(8,41,'1','15:00:00','17:00:00'),
(8,41,'2','09:00:00','15:00:00'),
(8,42,'2','15:00:00','17:00:00'),
(8,42,'3','09:00:00','15:00:00'),
(8,43,'3','15:00:00','17:00:00'),
(8,43,'4','09:00:00','15:00:00'),
(8,44,'4','15:00:00','17:00:00'),
(8,44,'5','09:00:00','15:00:00'),
(8,45,'5','15:00:00','17:00:00'),
(8,46,'6','09:00:00','14:00:00'),
(8,46,'7','09:00:00','14:00:00'),

(9,17,'1','10:00:00','14:00:00'),
(9,18,'2','10:00:00','14:00:00'),
(9,19,'3','10:00:00','14:00:00'),
(9,38,'4','10:00:00','14:00:00'),
(9,37,'5','10:00:00','14:00:00'),
(9,21,'6','09:00:00','17:00:00'),
(9,10,'7','09:00:00','17:00:00'),

(10,30,'1','11:00:00','16:00:00'),
(10,31,'2','12:00:00','17:00:00'),
(10,45,'3','11:00:00','16:00:00'),
(10,19,'4','12:00:00','17:00:00'),
(10,10,'5','12:00:00','17:00:00')
Go
print 'DentistSchedule Table created'
Go

---------------------------------------------------------Dentist---------------------------------------------------------


/** Appointment Billing Table **/
Create table AppointmentBilling (
billingID int primary key identity(1,1),
comments varchar(100) ,
billTime datetime not null
)
Go
insert into AppointmentBilling(comments,billTime)
values(null,GETDATE()),
(null,'2019-11-11 23:00:00'),
(null,'2019-12-01 14:25:00'),
(null,'2017-01-31 01:19:20'),
(null,'2018-06-07 20:32:30'),
(null,'2017-07-20 13:23:13'),
(null,'2018-09-02 17:57:20'),
(null,'2019-10-25 19:18:08'),
(null,'2018-03-18 22:29:20'),
(null,'2017-05-05 10:10:10')
print 'AppointmentBilling Table created'
Go

/** Appointments Table**/
Create table Appointments(
appointmentID int primary key identity(1,1),
patientID int not null foreign key references Patient(patientID),
dentistID int not null foreign key references Dentist(dentistID),
locationID int not null foreign key references Location(locationID),
billingID int foreign key references AppointmentBilling(billingID),
startTime datetime not null,
endTime datetime ,
updateType char(1) not null
)
Go
Insert into Appointments(patientID,dentistID,locationID,startTime,endTime,updateType)
values (1,2,7,'2019-12-16 14:00:00','2019-12-16 15:00:00',1),
(2,1,7,'2019-12-16 15:00:00','2019-12-16 16:00:00',1),
(5,3,33,'2019-12-15 09:00:00','2019-12-15 10:00:00',1),
(2,4,40,'2019-12-15 09:00:00','2019-12-15 10:00:00',1),
(5,6,41,'2019-12-21 09:00:00','2019-12-21 10:00:00',1),
(7,5,12,'2019-12-21 09:00:00','2019-12-21 12:00:00',1),
(5,7,37,'2019-12-12 11:00:00','2019-12-12 14:00:00',1),
(3,8,43,'2019-12-18 15:00:00','2019-12-18 17:00:00',1),
(4,8,41,'2019-12-17 09:00:00','2019-12-17 15:00:00',1),
(6,9,26,'2019-12-12 15:00:00','2019-12-12 17:00:00',1),
(7,10,26,'2019-12-12 13:00:00','2019-12-12 15:00:00',1),
(10,1,20,'2019-12-13 12:00:00','2019-12-13 13:00:00',1)
print 'Appointments Table created'
Go

---------------------------------------------------------Appointment---------------------------------------------------------
 

/** Teeth Table **/
Create table Teeth(
toothID int primary key identity(1,1),
[name] varchar(50) not null,
[description] varchar(max),
position char(2) not null
)
Go
insert into Teeth(name,description,position)
values ('Second Molar',null,'UR'),('First Molar',null,'UR'),('Second Bicuspid',null,'UR'),('First Bicuspid',null,'UR'),('Canine',null,'UR'),('lateral Incisor',null,'UR'),('Central Incisor',null,'UR'),('Third Molar',null,'UR'),
('Second Molar',null,'UL'),('First Molar',null,'UL'),('Second Bicuspid',null,'UL'),('First Bicuspid',null,'UL'),('Canine',null,'UL'),('lateral Incisor',null,'UL'),('Central Incisor',null,'UL'),('Third Molar',null,'UL'),
('Second Molar',null,'LL'),('First Molar',null,'LL'),('Second Bicuspid',null,'LL'),('First Bicuspid',null,'LL'),('Canine',null,'LL'),('lateral Incisor',null,'LL'),('Central Incisor',null,'LL'),('Third Molar',null,'LL'),
('Second Molar',null,'LR'),('First Molar',null,'LR'),('Second Bicuspid',null,'LR'),('First Bicuspid',null,'LR'),('Canine',null,'LR'),('lateral Incisor',null,'LR'),('Central Incisor',null,'LR'),('Third Molar',null,'LR')
print 'Teeth table created'
Go

select * from Teeth

/** PatientTeeth **/
select * from Teeth


Go
Create table PatientTeeth(
patientToothID int primary key identity(1,1),
patientID int not null foreign key references Patient(patientID),
toothID int not null foreign key references Teeth(toothID),
updateDate datetime not null,
isRemoved bit not null
)
Go
insert into PatientTeeth(patientID,toothID,updateDate,isRemoved)
values(1,1,GETDATE(),0),(1,2,GETDATE(),0),(1,3,GETDATE(),0),(1,4,GETDATE(),0),(1,5,GETDATE(),0),(1,6,GETDATE(),0),(1,7,GETDATE(),0),(1,8,GETDATE(),0),
	  (1,9,GETDATE(),0),(1,10,GETDATE(),0),(1,11,GETDATE(),0),(1,12,GETDATE(),0),(1,13,GETDATE(),0),(1,14,GETDATE(),0),(1,15,GETDATE(),0),(1,16,GETDATE(),0),
	  (1,17,GETDATE(),0),(1,18,GETDATE(),0),(1,19,GETDATE(),0),(1,20,GETDATE(),0),(1,21,GETDATE(),0),(1,22,GETDATE(),0),(1,23,GETDATE(),0),(1,24,GETDATE(),0),
	  (1,25,GETDATE(),0),(1,26,GETDATE(),0),(1,27,GETDATE(),0),(1,28,GETDATE(),0),(1,29,GETDATE(),0),(1,30,GETDATE(),0),(1,31,GETDATE(),0),(1,32,GETDATE(),0),
	  (2,1,GETDATE(),0),(2,2,GETDATE(),0),(2,3,GETDATE(),0),(2,4,GETDATE(),0),(2,5,GETDATE(),0),(2,6,GETDATE(),0),(2,7,GETDATE(),0),(2,8,GETDATE(),0),
	  (2,9,GETDATE(),0),(2,10,GETDATE(),0),(2,11,GETDATE(),0),(2,12,GETDATE(),0),(2,13,GETDATE(),0),(2,14,GETDATE(),0),(2,15,GETDATE(),0),(2,16,GETDATE(),0),
	  (2,17,GETDATE(),0),(2,18,GETDATE(),0),(2,19,GETDATE(),0),(2,20,GETDATE(),0),(2,21,GETDATE(),0),(2,22,GETDATE(),0),(2,23,GETDATE(),0),(2,24,GETDATE(),0),
	  (2,25,GETDATE(),0),(2,26,GETDATE(),0),(2,27,GETDATE(),0),(2,28,GETDATE(),0),(2,29,GETDATE(),0),(2,30,GETDATE(),0),(2,31,GETDATE(),0),(2,32,GETDATE(),1),
	  (3,1,GETDATE(),0),(3,2,GETDATE(),0),(3,3,GETDATE(),0),(3,4,GETDATE(),0),(3,5,GETDATE(),0),(3,6,GETDATE(),0),(3,7,GETDATE(),0),(3,8,GETDATE(),0),
	  (3,9,GETDATE(),0),(3,10,GETDATE(),0),(3,11,GETDATE(),0),(3,12,GETDATE(),0),(3,13,GETDATE(),0),(3,14,GETDATE(),0),(3,15,GETDATE(),0),(3,16,GETDATE(),0),
	  (3,17,GETDATE(),0),(3,18,GETDATE(),0),(3,19,GETDATE(),0),(3,20,GETDATE(),0),(3,21,GETDATE(),0),(3,22,GETDATE(),0),(3,23,GETDATE(),0),(3,24,GETDATE(),0),
	  (3,25,GETDATE(),0),(3,26,GETDATE(),0),(3,27,GETDATE(),0),(3,28,GETDATE(),0),(3,29,GETDATE(),0),(3,30,GETDATE(),0),(3,31,GETDATE(),0),(3,32,GETDATE(),1),
	  (4,1,GETDATE(),0),(4,2,GETDATE(),0),(4,3,GETDATE(),0),(4,4,GETDATE(),0),(4,5,GETDATE(),0),(4,6,GETDATE(),0),(4,7,GETDATE(),0),(4,8,GETDATE(),0),
	  (4,9,GETDATE(),0),(4,10,GETDATE(),0),(4,11,GETDATE(),0),(4,12,GETDATE(),0),(4,13,GETDATE(),0),(4,14,GETDATE(),0),(4,15,GETDATE(),0),(4,16,GETDATE(),0),
	  (4,17,GETDATE(),0),(4,18,GETDATE(),0),(4,19,GETDATE(),0),(4,20,GETDATE(),0),(4,21,GETDATE(),0),(4,22,GETDATE(),0),(4,23,GETDATE(),0),(4,24,GETDATE(),0),
	  (4,25,GETDATE(),0),(4,26,GETDATE(),0),(4,27,GETDATE(),0),(4,28,GETDATE(),0),(4,29,GETDATE(),0),(4,30,GETDATE(),0),(4,31,GETDATE(),0),(4,32,GETDATE(),0),
	  (5,1,GETDATE(),0),(5,2,GETDATE(),0),(5,3,GETDATE(),0),(5,4,GETDATE(),0),(5,5,GETDATE(),0),(5,6,GETDATE(),0),(5,7,GETDATE(),0),(5,8,GETDATE(),0),
	  (5,9,GETDATE(),0),(5,10,GETDATE(),0),(5,11,GETDATE(),0),(5,12,GETDATE(),0),(5,13,GETDATE(),0),(5,14,GETDATE(),0),(5,15,GETDATE(),0),(5,16,GETDATE(),0),
	  (5,17,GETDATE(),0),(5,18,GETDATE(),0),(5,19,GETDATE(),0),(5,20,GETDATE(),0),(5,21,GETDATE(),0),(5,22,GETDATE(),0),(5,23,GETDATE(),0),(5,24,GETDATE(),0),
	  (5,25,GETDATE(),0),(5,26,GETDATE(),0),(5,27,GETDATE(),0),(5,28,GETDATE(),0),(5,29,GETDATE(),0),(5,30,GETDATE(),0),(5,31,GETDATE(),0),(5,32,GETDATE(),1),
	  (6,1,GETDATE(),0),(6,2,GETDATE(),0),(6,3,GETDATE(),0),(6,4,GETDATE(),0),(6,5,GETDATE(),0),(6,6,GETDATE(),0),(6,7,GETDATE(),0),(6,8,GETDATE(),0),
	  (6,9,GETDATE(),0),(6,10,GETDATE(),0),(6,11,GETDATE(),0),(6,12,GETDATE(),0),(6,13,GETDATE(),0),(6,14,GETDATE(),0),(6,15,GETDATE(),0),(6,16,GETDATE(),0),
	  (6,17,GETDATE(),0),(6,18,GETDATE(),0),(6,19,GETDATE(),0),(6,20,GETDATE(),0),(6,21,GETDATE(),0),(6,22,GETDATE(),0),(6,23,GETDATE(),0),(6,24,GETDATE(),0),
	  (6,25,GETDATE(),0),(6,26,GETDATE(),0),(6,27,GETDATE(),0),(6,28,GETDATE(),0),(6,29,GETDATE(),0),(6,30,GETDATE(),0),(6,31,GETDATE(),0),(6,32,GETDATE(),0),
	  (7,1,GETDATE(),0),(7,2,GETDATE(),0),(7,3,GETDATE(),0),(7,4,GETDATE(),0),(7,5,GETDATE(),0),(7,6,GETDATE(),0),(7,7,GETDATE(),0),(7,8,GETDATE(),0),
	  (7,9,GETDATE(),0),(7,10,GETDATE(),0),(7,11,GETDATE(),0),(7,12,GETDATE(),0),(7,13,GETDATE(),0),(7,14,GETDATE(),0),(7,15,GETDATE(),0),(7,16,GETDATE(),0),
	  (7,17,GETDATE(),0),(7,18,GETDATE(),0),(7,19,GETDATE(),0),(7,20,GETDATE(),0),(7,21,GETDATE(),0),(7,22,GETDATE(),0),(7,23,GETDATE(),0),(7,24,GETDATE(),0),
	  (7,25,GETDATE(),0),(7,26,GETDATE(),0),(7,27,GETDATE(),0),(7,28,GETDATE(),0),(7,29,GETDATE(),0),(7,30,GETDATE(),0),(7,31,GETDATE(),0),(7,32,GETDATE(),1),
	  (8,1,GETDATE(),0),(8,2,GETDATE(),0),(8,3,GETDATE(),0),(8,4,GETDATE(),0),(8,5,GETDATE(),0),(8,6,GETDATE(),0),(8,7,GETDATE(),0),(8,8,GETDATE(),0),
	  (8,9,GETDATE(),0),(8,10,GETDATE(),0),(8,11,GETDATE(),0),(8,12,GETDATE(),0),(8,13,GETDATE(),0),(8,14,GETDATE(),0),(8,15,GETDATE(),0),(8,16,GETDATE(),0),
	  (8,17,GETDATE(),0),(8,18,GETDATE(),0),(8,19,GETDATE(),0),(8,20,GETDATE(),0),(8,21,GETDATE(),0),(8,22,GETDATE(),0),(8,23,GETDATE(),0),(8,24,GETDATE(),0),
	  (8,25,GETDATE(),0),(8,26,GETDATE(),0),(8,27,GETDATE(),0),(8,28,GETDATE(),0),(8,29,GETDATE(),0),(8,30,GETDATE(),0),(8,31,GETDATE(),0),(8,32,GETDATE(),0),
	  (9,1,GETDATE(),0),(9,2,GETDATE(),0),(9,3,GETDATE(),0),(9,4,GETDATE(),0),(9,5,GETDATE(),0),(9,6,GETDATE(),0),(9,7,GETDATE(),0),(9,8,GETDATE(),0),
	  (9,9,GETDATE(),0),(9,10,GETDATE(),0),(9,11,GETDATE(),0),(9,12,GETDATE(),0),(9,13,GETDATE(),0),(9,14,GETDATE(),0),(9,15,GETDATE(),0),(9,16,GETDATE(),0),
	  (9,17,GETDATE(),0),(9,18,GETDATE(),0),(9,19,GETDATE(),0),(9,20,GETDATE(),0),(9,21,GETDATE(),0),(9,22,GETDATE(),0),(9,23,GETDATE(),0),(9,24,GETDATE(),0),
	  (9,25,GETDATE(),0),(9,26,GETDATE(),0),(9,27,GETDATE(),0),(9,28,GETDATE(),0),(9,29,GETDATE(),0),(9,30,GETDATE(),0),(9,31,GETDATE(),0),(9,32,GETDATE(),0),
	  (10,1,GETDATE(),0),(10,2,GETDATE(),0),(10,3,GETDATE(),0),(10,4,GETDATE(),0),(10,5,GETDATE(),0),(10,6,GETDATE(),0),(10,7,GETDATE(),0),(10,8,GETDATE(),0)
Go	  
print 'PatientTeeth table created'
Go

Create view ViewPatientTeeth
as 
select name,patientToothID,patientID from Teeth
inner join PatientTeeth
on PatientTeeth.toothID = Teeth.toothID
where PatientTeeth.isRemoved = 0 or isRemoved is null
Go
print 'ViewPatientTeeth View created'

---------------------------------------------------------Teeth---------------------------------------------------------

/** Treatment Table **/
Create table Treatment(
treatmentID int primary key identity(1,1),
[name] varchar(50) not null,
cost decimal(18,2) not null,
[description] varchar(max)
)
insert into Treatment ([name],cost,[description])
values('Gum Surgery',200.00,null),('Fillings', 300, null),('Cleaning', 100, null),('Bonding',200,null),('Braces',1000,null),
('Bridges and Implants',1200,null),('Crowns and Caps',800,null),('Dentures',600,null),('Extractions',500,null),('Root Canals',1800,null),
('Sealants',400,null),('Teeth Whitening',700,null),('Veneers',400,null)
Go
print 'Treatment table created'
Go

/** PatientTreatment Table **/
Create table PatientTreatment(
patientTreatmentID int primary key identity(1,1),
appointmentID int not null foreign key references Appointments(appointmentID),
treatmentID int not null foreign key references Treatment(treatmentID),
patientToothID int foreign key references PatientTeeth(patienttoothID), 
)

Insert into PatientTreatment (appointmentID,treatmentID,patientToothID)
values(1,3,NULL),
(1,6,24),
(1,10,23),
(2,8,63),
(2,12,NULL),
(3,10,143),
(3,8,156),
(4,7,55),
(4,3,NULL),
(5,2,139),
(5,1,NULL),
(6,13,NULL),
(6,6,222),
(6,4,212),
(6,4,199),
(7,1,null),
(7,8,145),
(8,3,70),
(8,12,null),
(8,2,93),
(8,5,77),
(9,13,108),
(9,10,127),
(9,11,117),
(10,4,181),
(11,7,207),
(12,6,289),
(12,8,292)
---------------------------------------------------------Treatment---------------------------------------------------------

/** Payment Table **/
Create table Payment(
paymentID int primary key identity(1,1),
billingID int not null foreign key references AppointmentBilling(billingID),
paymentCost Decimal(18,2) not null,
patientInsuranceID int foreign key references PatientInsurance(patientInsuranceID), 
paymentType char(10) not null,
paymentDate datetime not null,
status tinyint not null
)

Insert into Payment(billingID,paymentCost,patientInsuranceID,paymentType,paymentDate,status)
values (3,100,10,'Debit','2019-12-12 19:00:00',3),
(6,200,6,'Debit','2019-12-12 14:00:00',3)

/** Notes Table **/
Create table Notes(
notesID int primary key identity(1,1),
appointmentID int not null foreign key references Appointments(appointmentID),
description varchar(max) not null
)
Go
print 'Notes table created'
Go
insert into notes(appointmentID,Description)
values(1,'patient requested for Root Canal treatment'),(2,'Patient will use Religare Health Insurance'),(3,'Patient is allergic to Sulphate')

/** Prescription Table **/
Create table Prescription(
prescriptionID int primary key identity(1,1),
appointmentID int not null foreign key references Appointments(appointmentID),
medicationID UniqueIdentifier not null,
form char(2)
)
Go
print 'Prescription table created'
Go
insert into Prescription(appointmentID,medicationID,form)
values(1,NEWID(),'OR'),(2,newid(),'IJ'),(3,NEWID(),'OR'),(4,newid(),'IJ'),(5,newid(),'OR'),(6,newid(),'IJ'),(7,newid(),'OR'),(8,newid(),'IJ'),
(9,newid(),'OR'),(10,newid(),'IJ')
Go

select * from EquipmentCatalogue
/** Equipment Catalogue **/
Create table EquipmentCatalogue(
equipmentCatalogueID int primary key identity(1,1),
name varchar(50) not null,
description varchar(max) 
)
print 'Equipment Catalogue table created'
insert into EquipmentCatalogue(name,description)
values('X-ray Imaging Equipment',null),
('Sterilization Equipment',null),
('Dental Chair',null),
('Utility Equipment',null),
('Dental Laser',null),
('Dental Impression Equipment',null),
('Dental Centrifuge',null),
('Endodontic Equipment',null),
('Dental CAD/CAM',null),
('Air Turbines',null),
('Dental Air Polishing',null),
('Intraoral Camera',null),
('Extraoral Camera',null),
('Surgical Microscope',null),
('Dental Sleep Medicine Equipment',null)

select * from Company
/** Equipment Table **/
Create table Equipment(
equipmentID int primary key identity(1,1),
equipmentCatalogueID int not null foreign key references EquipmentCatalogue(equipmentCatalogueID),
locationID int not null foreign key references Location(locationID),
companyID int not null foreign key references Company(companyID),
nextMaintenance datetime,
purchaseDate date not null
)
print 'Equipment table created'
insert into Equipment (equipmentCatalogueID,locationID,companyID,nextMaintenance,purchaseDate)
values (1,5,1,'2019-12-16 16:00:00','2017-08-23'),(2,7,1,'2020-02-05 12:00:00','2016-01-02'),(3,6,4,'2019-12-29 15:00:00', '2015-01-06'),
(4,23,5,'2022-12-16 18:00:00','2017-02-03'),(5,20,6,'2022-07-01 12:00:00','2018-01-02'),(6,30,3,'2020-03-09 08:00:00', '2019-03-09'),
(7,26,4,'2021-06-27 20:00:00','2017-05-20'),(8,15,8,'2021-09-18 16:00:00','2017-05-06'),(9,18,5,'2020-05-21 09:30:00', '2017-12-12'),
(8,40,7,'2020-01-05 13:00:00','2017-06-13'),(10,36,9,'2020-11-22 10:00:00','2019-07-09'),(14,29,7,'2021-01-01 20:00:00', '2019-10-08')

/** Supply Catalogue **/
Create table SupplyCatalogue(
supplyCatalogueID int primary key identity(1,1),
name varchar(50) not null,
description varchar(max) 
)
print 'Supply Catalogue table created'
insert into SupplyCatalogue(name,description)
values('Headrest Cover',null),
('Towel',null),
('Tissue',null),
('Tongue Depressor',null),
('Needle',null),
('Anesthetic Syringe',null),
('Crown',null),
('Gloves',null),
('Handpiece',null),
('Mouth Tray',null),
('Dental Tip',null),
('Face Mask',null),
('Evacuator',null),
('Mixing Pad',null),
('Lead Glass',null)

/** Supply Table **/
Create table Supply(
supplyID int primary key identity(1,1),
supplyCatalogueID int not null foreign key references SupplyCatalogue(supplyCatalogueID),
locationID int not null foreign key references Location(locationID),
companyID int not null foreign key references Company(companyID),
supplyCount integer
)
print 'Supply table created'

insert into Supply(companyID,locationID,supplyCatalogueID,supplyCount)
values(15,10,1,10),
(14,15,2,120),
(13,46,3,250),
(12,44,4,20),
(11,30,5,35),
(11,30,15,35),
(4,30,13,10),
(14,30,1,44),
(7,30,5,125),
(10,32,6,22),
(9,26,7,45),
(8,28,8,80),
(7,23,9,30),
(6,35,10,76),
(5,17,11,15),
(4,16,12,105),
(3,34,13,44),
(2,41,14,18),
(1,29,15,49),
(9,12,7,45),
(3,14,6,30),
(12,37,4,23),
(13,38,9,56),
(5,11,11,11)
----------------------------------------------------------------------------------------------------------------------------

Go
CREATE TRIGGER UpdateAssociatedTooth on PatientTreatment
After Insert 
AS DECLARE @tooth INT,
           @treatmentID INT,
	  	   @treatmentName varchar(50)

SELECT @tooth = ins.patienttoothID FROM inserted ins;
SELECT @treatmentID = ins.treatmentID FROM INSERTED ins;
select @treatmentName = Treatment.name from Treatment where treatmentID = @treatmentID
	     
If(@treatmentName = 'Extractions')
BEGIN
if(@tooth is not null )
Begin
	Update PatientTeeth set isRemoved = 1
	where patientToothID = @tooth
End
END
GO


----------------------------------------------------------------------------------------------------------------------------
USE [populateDentist]
GO

/** Object:  StoredProcedure [dbo].[Billing]    Script Date: 12/12/2019 11:55:44 AM **/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
create table Systemconfig(
ID int identity(1,1),
name varchar(50) not null,
value decimal(18) not null
)
insert into Systemconfig
(name,value) values('block',20),('RescheduleFee',5),('MissedFee',5),('CancelFee',5)
Go
Create function [dbo].[returnCost](
@appointmentID int
)
returns decimal(18,2) As
Begin
	declare @cost decimal(18,2)
	declare @dentistID int
	declare @minutes int
	declare @block int
	select @block = value from dbo.Systemconfig where name = 'block';
	select @dentistID = dentistID,@minutes = DATEDIFF(MINUTE,startTime,endTime) from Appointments where appointmentID = @appointmentID
	select @cost= cost from Dentist where dentistID = @dentistID
	return (@minutes/@block) * @cost
end
Go
Create Procedure [dbo].[Billing] @billingID int
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
values('GreenFieldDatabaseScript5.0', GETDATE())