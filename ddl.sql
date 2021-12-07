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
	"Activity" varchar(50) NULL,
	"Address" varchar(50) NULL,
	"Fax" varchar(50) NULL,
	"Name" varchar(50) NULL,
	"Phone" varchar(50) NULL,
	"ClientID" integer NOT NULL
)
;

CREATE TABLE "Company"
(
	"Socialreason" varchar(50) NULL,
	"CompanyID" integer NOT NULL
)
;

CREATE TABLE "Division"
(
	"Address" varchar(50) NULL,
	"Ca" varchar(50) NULL,
	"Location" varchar(50) NULL,
	"Name" varchar(50) NULL,
	"DivisionID" integer NOT NULL,
	"CompanyID" integer NOT NULL
)
;

CREATE TABLE "Employee"
(
	"Commission" real NULL,
	"Remuneration" real NULL,
	"Salary" real NULL,
	"Specialization" varchar(50) NULL,
	"EmployeeID" integer NOT NULL,
	"DivisionID" integer NOT NULL,
	"TeamID" integer NULL
)
;

CREATE TABLE "EmployeeHardware"
(
	"HardwareID" integer NULL,
	"EmployeeID" integer NULL
)
;

CREATE TABLE "Employeetask"
(
	"End" timestamp without time zone NULL,
	"Start" timestamp without time zone NULL,
	"EmployeetaskID" integer NOT NULL,
	"EmployeeID" integer NULL,
	"TaskID" integer NULL
)
;

CREATE TABLE "Hardware"
(
	"Name" varchar(50) NULL,
	"Reference" varchar(50) NULL,
	"Type" varchar(50) NULL,
	"HardwareID" integer NOT NULL
)
;

CREATE TABLE "Project"
(
	"Appelation" varchar(50) NULL,
	"Completion" timestamp without time zone NULL,
	"Deadline" timestamp without time zone NULL,
	"End" timestamp without time zone NULL,
	"Label" varchar(50) NULL,
	"Start" timestamp without time zone NULL,
	"Theme" varchar(50) NULL,
	"ProjectID" integer NOT NULL,
	"ChefID" integer NULL,
	"ClientID" integer NULL
)
;

CREATE TABLE "Task"
(
	"Cost" double precision NULL,
	"Description" varchar(50) NULL,
	"Name" varchar(50) NULL,
	"TaskID" integer NOT NULL,
	"ProjectID" integer NULL
)
;

CREATE TABLE "Team"
(
	"Competence" varchar(50) NULL,
	"TeamID" integer NOT NULL
)
;

CREATE TABLE "User"
(
	"Email" varchar(50) NULL,
	"Firstname" varchar(50) NULL,
	"Lastname" varchar(50) NULL,
	"Password" varchar(50) NULL,
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

ALTER TABLE "Company" ADD CONSTRAINT "PK_Company"
	PRIMARY KEY ("CompanyID")
;

ALTER TABLE "Division" ADD CONSTRAINT "PK_Division"
	PRIMARY KEY ("DivisionID")
;

ALTER TABLE "Employee" ADD CONSTRAINT "PK_Employee"
	PRIMARY KEY ("EmployeeID")
;

ALTER TABLE "Employeetask" ADD CONSTRAINT "PK_Employeetask"
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

ALTER TABLE "Division" ADD CONSTRAINT "FK_Division_Company"
	FOREIGN KEY ("CompanyID") REFERENCES "Company" ("CompanyID") ON DELETE No Action ON UPDATE No Action
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

ALTER TABLE "Employeetask" ADD CONSTRAINT "FK_EmployeeTask_Employee"
	FOREIGN KEY ("EmployeeID") REFERENCES "Employee" ("EmployeeID") ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE "Employeetask" ADD CONSTRAINT "FK_EmployeeTask_Task"
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
