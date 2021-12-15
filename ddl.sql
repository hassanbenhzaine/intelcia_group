CREATE TABLE "Admin"
(
	"AdminID" integer NOT NULL,
	CONSTRAINT "PK_Admin" PRIMARY KEY ("AdminID"),
	CONSTRAINT "FK_Admin_User" FOREIGN KEY ("AdminID") REFERENCES "User" ("UserID") ON DELETE No Action ON UPDATE No Action
)
;

CREATE TABLE "Chef"
(
	"ChefID" integer NOT NULL,
	CONSTRAINT "PK_Chef" PRIMARY KEY ("ChefID"),
	CONSTRAINT "FK_Chef_Employee" FOREIGN KEY ("ChefID") REFERENCES "Employee" ("EmployeeID") ON DELETE No Action ON UPDATE No Action
)
;

CREATE TABLE "Client"
(
	activity varchar(50),
	address varchar(50),
	fax varchar(50),
	name varchar(50),
	phone varchar(50),
	"ClientID" integer NOT NULL,
	CONSTRAINT "PK_Client" PRIMARY KEY ("ClientID"),
	CONSTRAINT "FK_Client_User" FOREIGN KEY ("ClientID") REFERENCES "User" ("UserID") ON DELETE No Action ON UPDATE No Action
)
;

CREATE TABLE "ClientAddress"
(
	address1 varchar(50),
	address2 varchar(50),
	city varchar(50),
	country varchar(50),
	state varchar(50),
	zip_code varchar(50),
	"ClientAddressID" integer NOT NULL,
	"ClientID" integer,
	CONSTRAINT "PK_ClientAddress" PRIMARY KEY ("ClientAddressID"),
	CONSTRAINT "FK_ClientAddress_has a" FOREIGN KEY ("ClientID") REFERENCES "Client" ("ClientID") ON DELETE No Action ON UPDATE No Action
)
;

CREATE TABLE "Company"
(
	social_reason varchar(50),
	"CompanyID" integer NOT NULL,
	CONSTRAINT "PK_Company" PRIMARY KEY ("CompanyID")
)
;

CREATE TABLE "Division"
(
	address varchar(50),
	ca varchar(50),
	location varchar(50),
	name varchar(50),
	"DivisionID" integer NOT NULL,
	"CompanyID" integer NOT NULL,
	"DivisionaddressID" integer NOT NULL,
	CONSTRAINT "PK_Division" PRIMARY KEY ("DivisionID"),
	CONSTRAINT "FK_Division_Company" FOREIGN KEY ("CompanyID") REFERENCES "Company" ("CompanyID") ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT "FK_Division_has a" FOREIGN KEY ("DivisionaddressID") REFERENCES "DivisionAddress" ("DivisionAddressID") ON DELETE No Action ON UPDATE No Action
)
;

CREATE TABLE "DivisionAddress"
(
	address1 varchar(50),
	address2 varchar(50),
	city varchar(50),
	country varchar(50),
	state varchar(50),
	zip_code varchar(50),
	"DivisionAddressID" integer NOT NULL,
	CONSTRAINT "PK_DivisionAddress" PRIMARY KEY ("DivisionAddressID")
)
;

CREATE TABLE "Employee"
(
	commission real,
	remuneration real,
	salary real,
	specialization varchar(50),
	"EmployeeID" integer NOT NULL,
	"DivisionID" integer NOT NULL,
	"TeamID" integer,
	CONSTRAINT "PK_Employee" PRIMARY KEY ("EmployeeID"),
	CONSTRAINT "FK_Employee_work in" FOREIGN KEY ("DivisionID") REFERENCES "Division" ("DivisionID") ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT "FK_Employee_User" FOREIGN KEY ("EmployeeID") REFERENCES "User" ("UserID") ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT "FK_Employee_grouped into" FOREIGN KEY ("TeamID") REFERENCES "Team" ("TeamID") ON DELETE No Action ON UPDATE No Action
)
;

CREATE TABLE "EmployeeHardware"
(
	"HardwareID" integer,
	"EmployeeID" integer,
	CONSTRAINT "FK_EmployeeHardware_Hardware" FOREIGN KEY ("HardwareID") REFERENCES "Hardware" ("HardwareID") ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT "FK_EmployeeHardware_Employee" FOREIGN KEY ("EmployeeID") REFERENCES "Employee" ("EmployeeID") ON DELETE No Action ON UPDATE No Action
)
;

CREATE TABLE "EmployeeTask"
(
	"end" timestamp without time zone,
	start timestamp without time zone,
	"EmployeeTaskID" integer NOT NULL,
	"EmployeeID" integer,
	"TaskID" integer,
	CONSTRAINT "PK_EmployeeTask" PRIMARY KEY ("EmployeeTaskID"),
	CONSTRAINT "FK_EmployeeTask_Employee" FOREIGN KEY ("EmployeeID") REFERENCES "Employee" ("EmployeeID") ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT "FK_EmployeeTask_Task" FOREIGN KEY ("TaskID") REFERENCES "Task" ("TaskID") ON DELETE No Action ON UPDATE No Action
)
;

CREATE TABLE "Hardware"
(
	composed_of varchar(50),
	name varchar(50),
	reference varchar(50),
	type varchar(50),
	"HardwareID" integer NOT NULL,
	CONSTRAINT "PK_Hardware" PRIMARY KEY ("HardwareID"),
	CONSTRAINT "FK_Hardware_composed of" FOREIGN KEY ("HardwareID") REFERENCES "Hardware" ("HardwareID") ON DELETE No Action ON UPDATE No Action
)
;

CREATE TABLE "Project"
(
	appelation varchar(50),
	completion timestamp without time zone,
	deadline timestamp without time zone,
	"end" timestamp without time zone,
	label varchar(50),
	start timestamp without time zone,
	theme varchar(50),
	"ProjectID" integer NOT NULL,
	"ChefID" integer,
	"ClientID" integer,
	CONSTRAINT "PK_Project" PRIMARY KEY ("ProjectID"),
	CONSTRAINT "FK_Project_cordinated by" FOREIGN KEY ("ChefID") REFERENCES "Chef" ("ChefID") ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT "FK_Project_realized for" FOREIGN KEY ("ClientID") REFERENCES "Client" ("ClientID") ON DELETE No Action ON UPDATE No Action
)
;

CREATE TABLE "Task"
(
	cost real,
	description varchar(50),
	name varchar(50),
	"TaskID" integer NOT NULL,
	"ProjectID" integer,
	CONSTRAINT "PK_Task" PRIMARY KEY ("TaskID"),
	CONSTRAINT "FK_Task_have" FOREIGN KEY ("ProjectID") REFERENCES "Project" ("ProjectID") ON DELETE No Action ON UPDATE No Action
)
;

CREATE TABLE "Team"
(
	competence varchar(50),
	"TeamID" integer NOT NULL,
	CONSTRAINT "PK_Team" PRIMARY KEY ("TeamID")
)
;

CREATE TABLE "User"
(
	email varchar(50),
	first_name varchar(50),
	last_name varchar(50),
	password varchar(50),
	"UserID" integer NOT NULL,
	CONSTRAINT "PK_User" PRIMARY KEY ("UserID")
)
;
