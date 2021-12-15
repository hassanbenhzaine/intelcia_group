CREATE TABLE "Admin"
(
	"AdminID" integer NOT NULL
)
;

CREATE TABLE "Chef"
(
	"ChefID" integer NOT NULL
)
;

CREATE TABLE "Client"
(
	"Activity" varchar(50),
	"Address" varchar(50),
	"Fax" varchar(50),
	"Name" varchar(50),
	"Phone" varchar(50),
	"ClientID" integer NOT NULL
)
;

CREATE TABLE "ClientAddress"
(
	"Address1" varchar(50),
	"Address2" varchar(50),
	"City" varchar(50),
	"Country" varchar(50),
	"State" varchar(50),
	"ZipCode" varchar(50),
	"ClientaddressID" integer NOT NULL,
	"ClientID" integer
)
;

CREATE TABLE "Company"
(
	"SocialReason" varchar(50),
	"CompanyID" integer NOT NULL
)
;

CREATE TABLE "Division"
(
	"Address" varchar(50),
	"Ca" varchar(50),
	"Location" varchar(50),
	"Name" varchar(50),
	"DivisionID" integer NOT NULL,
	"CompanyID" integer NOT NULL,
	"DivisionaddressID" integer NOT NULL
)
;

CREATE TABLE "DivisionAddress"
(
	"Address1" varchar(50),
	"Address2" varchar(50),
	"City" varchar(50),
	"Country" varchar(50),
	"State" varchar(50),
	"ZipCode" varchar(50),
	"DivisionaddressID" integer NOT NULL
)
;

CREATE TABLE "Employee"
(
	"Commission" real,
	"Remuneration" real,
	"Salary" real,
	"Specialization" varchar(50),
	"EmployeeID" integer NOT NULL,
	"DivisionID" integer NOT NULL,
	"TeamID" integer
)
;

CREATE TABLE "EmployeeHardware"
(
	"HardwareID" integer,
	"EmployeeID" integer
)
;

CREATE TABLE "EmployeeTask"
(
	"End" timestamp without time zone,
	"Start" timestamp without time zone,
	"EmployeetaskID" integer NOT NULL,
	"EmployeeID" integer,
	"TaskID" integer
)
;

CREATE TABLE "Hardware"
(
	"ComposedOf" varchar(50),
	"Name" varchar(50),
	"Reference" varchar(50),
	"Type" varchar(50),
	"HardwareID" integer NOT NULL
)
;

CREATE TABLE "Project"
(
	"Appelation" varchar(50),
	"Completion" timestamp without time zone,
	"Deadline" timestamp without time zone,
	"End" timestamp without time zone,
	"Label" varchar(50),
	"Start" timestamp without time zone,
	"Theme" varchar(50),
	"ProjectID" integer NOT NULL,
	"ChefID" integer,
	"ClientID" integer
)
;

CREATE TABLE "Task"
(
	"Cost" real,
	"Description" varchar(50),
	"Name" varchar(50),
	"TaskID" integer NOT NULL,
	"ProjectID" integer
)
;

CREATE TABLE "Team"
(
	"Competence" varchar(50),
	"TeamID" integer NOT NULL
)
;

CREATE TABLE "User"
(
	"Email" varchar(50),
	"FirstName" varchar(50),
	"LastName" varchar(50),
	"Password" varchar(50),
	"UserID" integer NOT NULL
)
;

ALTER TABLE "Admin" ADD CONSTRAINT "PK_Admin"
	PRIMARY KEY ("AdminID")
;

ALTER TABLE "Chef" ADD CONSTRAINT "PK_Chef"
	PRIMARY KEY ("ChefID")
;

ALTER TABLE "Client" ADD CONSTRAINT "PK_Client"
	PRIMARY KEY ("ClientID")
;

ALTER TABLE "ClientAddress" ADD CONSTRAINT "PK_ClientAddress"
	PRIMARY KEY ("ClientaddressID")
;

ALTER TABLE "Company" ADD CONSTRAINT "PK_Company"
	PRIMARY KEY ("CompanyID")
;

ALTER TABLE "Division" ADD CONSTRAINT "PK_Division"
	PRIMARY KEY ("DivisionID")
;

ALTER TABLE "DivisionAddress" ADD CONSTRAINT "PK_DivisionAddress"
	PRIMARY KEY ("DivisionaddressID")
;

ALTER TABLE "Employee" ADD CONSTRAINT "PK_Employee"
	PRIMARY KEY ("EmployeeID")
;

ALTER TABLE "EmployeeTask" ADD CONSTRAINT "PK_EmployeeTask"
	PRIMARY KEY ("EmployeetaskID")
;

ALTER TABLE "Hardware" ADD CONSTRAINT "PK_Hardware"
	PRIMARY KEY ("HardwareID")
;

ALTER TABLE "Project" ADD CONSTRAINT "PK_Project"
	PRIMARY KEY ("ProjectID")
;

ALTER TABLE "Task" ADD CONSTRAINT "PK_Task"
	PRIMARY KEY ("TaskID")
;

ALTER TABLE "Team" ADD CONSTRAINT "PK_Team"
	PRIMARY KEY ("TeamID")
;

ALTER TABLE "User" ADD CONSTRAINT "PK_User"
	PRIMARY KEY ("UserID")
;

ALTER TABLE "Admin" ADD CONSTRAINT "FK_Admin_User"
	FOREIGN KEY ("AdminID") REFERENCES "User" ("UserID") ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE "Chef" ADD CONSTRAINT "FK_Chef_Employee"
	FOREIGN KEY ("ChefID") REFERENCES "Employee" ("EmployeeID") ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE "Client" ADD CONSTRAINT "FK_Client_User"
	FOREIGN KEY ("ClientID") REFERENCES "User" ("UserID") ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE "ClientAddress" ADD CONSTRAINT "FK_ClientAddress_has a"
	FOREIGN KEY ("ClientID") REFERENCES "Client" ("ClientID") ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE "Division" ADD CONSTRAINT "FK_Division_Company"
	FOREIGN KEY ("CompanyID") REFERENCES "Company" ("CompanyID") ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE "Division" ADD CONSTRAINT "FK_Division_has a"
	FOREIGN KEY ("DivisionaddressID") REFERENCES "DivisionAddress" ("DivisionaddressID") ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE "Employee" ADD CONSTRAINT "FK_Employee_work in"
	FOREIGN KEY ("DivisionID") REFERENCES "Division" ("DivisionID") ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE "Employee" ADD CONSTRAINT "FK_Employee_User"
	FOREIGN KEY ("EmployeeID") REFERENCES "User" ("UserID") ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE "Employee" ADD CONSTRAINT "FK_Employee_grouped into"
	FOREIGN KEY ("TeamID") REFERENCES "Team" ("TeamID") ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE "EmployeeHardware" ADD CONSTRAINT "FK_EmployeeHardware_Hardware"
	FOREIGN KEY ("HardwareID") REFERENCES "Hardware" ("HardwareID") ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE "EmployeeHardware" ADD CONSTRAINT "FK_EmployeeHardware_Employee"
	FOREIGN KEY ("EmployeeID") REFERENCES "Employee" ("EmployeeID") ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE "EmployeeTask" ADD CONSTRAINT "FK_EmployeeTask_Employee"
	FOREIGN KEY ("EmployeeID") REFERENCES "Employee" ("EmployeeID") ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE "EmployeeTask" ADD CONSTRAINT "FK_EmployeeTask_Task"
	FOREIGN KEY ("TaskID") REFERENCES "Task" ("TaskID") ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE "Hardware" ADD CONSTRAINT "FK_Hardware_composed of"
	FOREIGN KEY ("HardwareID") REFERENCES "Hardware" ("HardwareID") ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE "Project" ADD CONSTRAINT "FK_Project_cordinated by"
	FOREIGN KEY ("ChefID") REFERENCES "Chef" ("ChefID") ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE "Project" ADD CONSTRAINT "FK_Project_realized for"
	FOREIGN KEY ("ClientID") REFERENCES "Client" ("ClientID") ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE "Task" ADD CONSTRAINT "FK_Task_have"
	FOREIGN KEY ("ProjectID") REFERENCES "Project" ("ProjectID") ON DELETE No Action ON UPDATE No Action
;
