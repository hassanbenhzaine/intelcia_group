CREATE TABLE public."User" (
    id integer NOT NULL,
    email character varying,
    "firstName" character varying,
    "lastName" character varying
);


CREATE TABLE public."Admin" (
)
INHERITS (public."User");


CREATE TABLE public."Employee" (
    commission real,
    remuneration real,
    salary real,
    specialization character varying,
    "teamId" integer,
    "divisionId" integer
)
INHERITS (public."User");


CREATE TABLE public."Chef" (
)
INHERITS (public."Employee");


CREATE TABLE public."Client" (
    activity character varying,
    phone character varying,
    fax character varying,
    name character varying,
    "addressId" integer
)
INHERITS (public."User");


CREATE TABLE public."ClientAddress" (
    id integer NOT NULL,
    address1 character varying,
    address2 character varying,
    city character varying,
    "zipCode" character varying,
    country character varying,
    state character varying,
    "clientId" integer
);


CREATE TABLE public."Company" (
    "socialReason" character varying,
    id integer NOT NULL
);


CREATE TABLE public."Division" (
    ca character varying,
    location character varying,
    name character varying,
    id integer NOT NULL,
    "companyId" integer,
    "addresseId" integer
);


CREATE TABLE public."DivisionAddress" (
    address2 character varying,
    address1 character varying,
    city character varying,
    country character varying,
    state character varying,
    "zipCode" character varying,
    id integer NOT NULL
);



CREATE TABLE public."EmployeeHardware" (
    "hardwareId" integer,
    "employeeId" integer
);



CREATE TABLE public."EmployeeTask" (
    start timestamp without time zone,
    "end" timestamp without time zone,
    "employeeId" integer,
    "taskId" integer
);


CREATE TABLE public."Hardware" (
    name character varying,
    refererance character varying,
    type character varying,
    id integer NOT NULL,
    "partOf" integer
);



CREATE TABLE public."Project" (
    "chefId" integer,
    id integer NOT NULL,
    completion timestamp without time zone,
    deadline timestamp without time zone,
    start timestamp without time zone,
    "end" timestamp without time zone,
    appelation character varying,
    label character varying,
    theme character varying
);



CREATE TABLE public."Task" (
    cost real,
    description character varying,
    name character varying,
    id integer NOT NULL,
    "projectId" integer
);



CREATE TABLE public."Team" (
    id integer NOT NULL,
    competence character varying
);



ALTER TABLE ONLY public."Admin"
    ADD CONSTRAINT "Admin_pkey" PRIMARY KEY (id);



ALTER TABLE ONLY public."Chef"
    ADD CONSTRAINT "Chef_pkey" PRIMARY KEY (id);



ALTER TABLE ONLY public."ClientAddress"
    ADD CONSTRAINT "ClientAddress_pkey" PRIMARY KEY (id);



ALTER TABLE ONLY public."Client"
    ADD CONSTRAINT "Client_pkey" PRIMARY KEY (id);



ALTER TABLE ONLY public."Company"
    ADD CONSTRAINT "Company_pkey" PRIMARY KEY (id);



ALTER TABLE ONLY public."DivisionAddress"
    ADD CONSTRAINT "DivisionAddress_pkey" PRIMARY KEY (id);



ALTER TABLE ONLY public."Division"
    ADD CONSTRAINT "Division_pkey" PRIMARY KEY (id);



ALTER TABLE ONLY public."Employee"
    ADD CONSTRAINT "Employee_pkey" PRIMARY KEY (id);



ALTER TABLE ONLY public."Hardware"
    ADD CONSTRAINT "Hardware_pkey" PRIMARY KEY (id);



ALTER TABLE ONLY public."Project"
    ADD CONSTRAINT "Project_pkey" PRIMARY KEY (id);



ALTER TABLE ONLY public."Task"
    ADD CONSTRAINT "Task_pkey" PRIMARY KEY (id);



ALTER TABLE ONLY public."Team"
    ADD CONSTRAINT "Team_pkey" PRIMARY KEY (id);



ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_pkey" PRIMARY KEY (id);



ALTER TABLE ONLY public."ClientAddress"
    ADD CONSTRAINT "ClientAddress_clientId_fkey" FOREIGN KEY ("clientId") REFERENCES public."Client"(id);



ALTER TABLE ONLY public."Division"
    ADD CONSTRAINT "Division_addresseId_fkey" FOREIGN KEY ("addresseId") REFERENCES public."DivisionAddress"(id) NOT VALID;



ALTER TABLE ONLY public."Division"
    ADD CONSTRAINT "Division_companyId_fkey" FOREIGN KEY ("companyId") REFERENCES public."Company"(id) NOT VALID;



ALTER TABLE ONLY public."EmployeeHardware"
    ADD CONSTRAINT "EmployeeHardware_employeeId_fkey" FOREIGN KEY ("employeeId") REFERENCES public."Employee"(id);



ALTER TABLE ONLY public."EmployeeHardware"
    ADD CONSTRAINT "EmployeeHardware_hardwareId_fkey" FOREIGN KEY ("hardwareId") REFERENCES public."Hardware"(id) NOT VALID;



ALTER TABLE ONLY public."EmployeeTask"
    ADD CONSTRAINT "EmployeeTask_employeeId_fkey" FOREIGN KEY ("employeeId") REFERENCES public."Employee"(id) NOT VALID;



ALTER TABLE ONLY public."EmployeeTask"
    ADD CONSTRAINT "EmployeeTask_taskId_fkey" FOREIGN KEY ("taskId") REFERENCES public."Task"(id) NOT VALID;



ALTER TABLE ONLY public."Employee"
    ADD CONSTRAINT "Employee_divisionId_fkey" FOREIGN KEY ("divisionId") REFERENCES public."Division"(id) NOT VALID;



ALTER TABLE ONLY public."Employee"
    ADD CONSTRAINT "Employee_teamId_fkey" FOREIGN KEY ("teamId") REFERENCES public."Team"(id) NOT VALID;



ALTER TABLE ONLY public."Hardware"
    ADD CONSTRAINT "Hardware_composedOf_fkey" FOREIGN KEY ("partOf") REFERENCES public."Hardware"(id) NOT VALID;



ALTER TABLE ONLY public."Task"
    ADD CONSTRAINT "Task_projectId_fkey" FOREIGN KEY ("projectId") REFERENCES public."Project"(id);
