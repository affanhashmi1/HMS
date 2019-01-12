create database dbHMS;

use dbHMS;

select * from sys.tables;

create table tbl_Admin(
	admin_Id int primary key identity,
	admin_Username nvarchar(50) not null unique,
	admin_Password nvarchar(32) not null
);

create table tbl_Department(
	department_Id int primary key identity,
	department_Name nvarchar(20) not null unique
);

insert into tbl_Department(department_Name) values
('Admin'),
('Doctor'),
('Finance'),
('HR'),
('IT'),
('Marketing'),
('Nurse'),
('Pharmacist'),
('Receptionist'),
('Security'),
('Store Keeper'),
('Surgeon'),
('Ward Boy');

create table tbl_Employee(
	employee_Id int primary key identity,
	employee_FirstName nvarchar(25) not null,
	employee_LastName nvarchar(25) not null,
	employee_Address nvarchar(max) not null,
	employee_City nvarchar(20) not null,
	employee_State nvarchar(20) not null,
	employee_ZipCode nvarchar(20) not null,
	employee_Country nvarchar(20) not null,
	employee_Contact nvarchar(20) not null unique,
	employee_Email nvarchar(100) not null unique,
	employee_CNIC nvarchar(20) not null unique,
	employee_Gender nvarchar(6) not null,
	employee_DateOfBirth date not null,
	employee_Qualification nvarchar(20) not null,
	employee_Username nvarchar(50) not null unique,
	employee_Password nvarchar(32) not null,
	employee_DateOfHire datetime not null,
	employee_fk_admin_Id int foreign key references tbl_Admin(admin_Id) not null,
	employee_fk_department_Id int foreign key references tbl_Department(department_Id) not null
);

create table tbl_Patient(
	patient_Id int primary key identity,
	patient_FirstName nvarchar(25) not null,
	patient_LastName nvarchar(25) not null,
	patient_Address nvarchar(max) not null,
	patient_City nvarchar(20) not null,
	patient_State nvarchar(20) not null,
	patient_ZipCode nvarchar(20) not null,
	patient_Country nvarchar(20) not null,
	patient_Contact nvarchar(20) not null unique,
	patient_Email nvarchar(100) not null unique,
	patient_CNIC nvarchar(20) not null unique,
	patient_Gender nvarchar(6) not null,
	patient_DateOfBirth date not null,
	--patient_Qualification nvarchar(20) not null,
	--patient_Username nvarchar(50) not null unique,
	--patient_Password nvarchar(32) not null,
	patient_Type nvarchar(20) not null,
	patient_DateOfAdmit datetime not null,
	patient_fk_employee_Id int foreign key references tbl_Employee(employee_Id) not null
);

-- Not executed queries...

create table tbl_Payroll(
	payroll_Id int primary key identity,
	payroll_Salary int not null,
	payroll_Allowances int not null,
	payroll_Deductions int not null,
	payroll_Leaves int not null,
	payroll_DateTime datetime not null,
	payroll_fk_admin_Id int foreign key references tbl_Admin(admin_Id) not null,
	payroll_fk_employee_Id int foreign key references tbl_Employee(employee_Id) not null
);

create table tbl_Payment(
	payment_Id int primary key identity,
	payment_Amount int not null,
	payment_DateTime datetime not null,
	payment_fk_patient_Id int foreign key references tbl_Patient(patient_Id) not null
);

create table tbl_Inventory(
	inventory_Id int primary key identity,
	inventory_Product nvarchar(20) not null unique,
	inventory_Quantity int not null,
	inventory_Price int not null,
	inventory_Status bit not null
);