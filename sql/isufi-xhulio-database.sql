CREATE DATABASE "isufi-xhulio-database"
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'English_United Kingdom.1252'
    LC_CTYPE = 'English_United Kingdom.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;


CREATE TABLE Address
(
  Street_Name VARCHAR(100) NOT NULL,
  Postal_Code INT NOT NULL,
  City_ VARCHAR(100) NOT NULL,
  Region VARCHAR(100) NOT NULL,
  Address_ID INT NOT NULL,
  Building_Number INT NOT NULL,
  PRIMARY KEY (Address_ID)
);



CREATE TABLE BranchEmployee
(
  First_Name VARCHAR(100) NOT NULL,
  Last_Name VARCHAR(100) NOT NULL,
  Employee_ID INT NOT NULL,
  Date_Of_Birth DATE,
  Gender VARCHAR(100) NOT NULL,
  Branch_ID INT NOT NULL,
  Supervize_Employee_ID INT,
  PRIMARY KEY (Employee_ID),
  FOREIGN KEY (Supervize_Employee_ID) REFERENCES BranchEmployee(Employee_ID)
);

CREATE TABLE e_commercial_branch
(
  Branch_ID INT NOT NULL,
  Contact_Number VARCHAR(100) NOT NULL,
  Branch_Name VARCHAR(100) NOT NULL,
  Employee_ID INT NOT NULL,
  PRIMARY KEY (Branch_ID),
  FOREIGN KEY (Employee_ID) REFERENCES BranchEmployee(Employee_ID)
);


CREATE TABLE Degree
(
  Year DATE NOT NULL,
  Institution_Name VARCHAR(100) NOT NULL,
  Type VARCHAR(100) NOT NULL,
  Major VARCHAR(100),
  Employee_ID INT NOT NULL,
  PRIMARY KEY (Type, Employee_ID)
);


CREATE TABLE Delivery_Companies
(
  Name VARCHAR(100) NOT NULL,
  Branch_ID INT NOT NULL,
  PRIMARY KEY (Name),
  FOREIGN KEY (Branch_ID) REFERENCES e_commercial_branch(Branch_ID)
);

CREATE TABLE Physical_Delivery_Points_Locations
(
  Delivery_Point_ID INT NOT NULL,
  Name VARCHAR(100) NOT NULL,
  Address_ID INT NOT NULL,
  PRIMARY KEY (Delivery_Point_ID),
  FOREIGN KEY (Name) REFERENCES Delivery_Companies(Name),
  FOREIGN KEY (Address_ID) REFERENCES Address(Address_ID)
);


CREATE TABLE Departments
(
  Department_Name VARCHAR(100) NOT NULL,
  Department_ID INT NOT NULL,
  Number_Of_Employees INT,
  Emp_ID INT NOT NULL,
  PRIMARY KEY (Department_ID)
);

CREATE TABLE DeliveryCompanyEmploye
(
  Emp_ID INT NOT NULL,
  First_Name VARCHAR(100) NOT NULL,
  Last_Name VARCHAR(100) NOT NULL,
  email VARCHAR(100) NOT NULL,
  Contact_Number VARCHAR(100) NOT NULL,
  Salary FLOAT NOT NULL,
  Department_ID INT NOT NULL,
  Supervize_Emp_ID INT,
  PRIMARY KEY (Emp_ID),
  FOREIGN KEY (Department_ID) REFERENCES Departments(Department_ID),
  FOREIGN KEY (Supervize_Emp_ID) REFERENCES DeliveryCompanyEmploye(Emp_ID)
);


CREATE TABLE Custemer
(
  Customer_ID INT NOT NULL,
  Name VARCHAR(100) NOT NULL,
  Surname VARCHAR(100) NOT NULL,
  email VARCHAR(100) NOT NULL,
  Phone_Number VARCHAR(100) NOT NULL,
  Department_ID INT NOT NULL,
  PRIMARY KEY (Customer_ID),
  FOREIGN KEY (Department_ID) REFERENCES Departments(Department_ID)
);

CREATE TABLE Courier
(
  Courier_ID INT NOT NULL,
  Last_Name VARCHAR(100) NOT NULL,
  First_Name VARCHAR(100) NOT NULL,
  Gender VARCHAR(100) NOT NULL,
  Date_Of_Birth DATE,
  Salary INT NOT NULL,
  Emp_ID INT NOT NULL,
  Department_ID INT NOT NULL,
  PRIMARY KEY (Courier_ID),
  FOREIGN KEY (Emp_ID) REFERENCES DeliveryCompanyEmploye(Emp_ID),
  FOREIGN KEY (Department_ID) REFERENCES Departments(Department_ID)
);

CREATE TABLE Delivery_Order
(
  Deliver_ID INT NOT NULL,
  Package_Weight INT NOT NULL,
  Stage VARCHAR(100) NOT NULL,
  Shipping_Type VARCHAR(100) NOT NULL,
  Comments VARCHAR(100) NOT NULL,
  Department_ID INT NOT NULL,
  Address_ID INT NOT NULL,
  Customer_ID INT NOT NULL,
  Courier_ID INT NOT NULL,
  PRIMARY KEY (Deliver_ID),
  FOREIGN KEY (Department_ID) REFERENCES Departments(Department_ID),
  FOREIGN KEY (Address_ID) REFERENCES Address(Address_ID),
  FOREIGN KEY (Customer_ID) REFERENCES Custemer(Customer_ID),
  FOREIGN KEY (Courier_ID) REFERENCES Courier(Courier_ID)
);





CREATE TABLE Call_Customer_Service
(
  Phone_Number VARCHAR(100) NOT NULL,
  Supporter_ID INT NOT NULL,
  Supporter_First_Name VARCHAR(100) NOT NULL,
  Supporter_Last_Name VARCHAR(100) NOT NULL,
  Review VARCHAR(100) NOT NULL,
  Department_ID INT NOT NULL,
  PRIMARY KEY (Supporter_ID),
  FOREIGN KEY (Department_ID) REFERENCES Departments(Department_ID)
);

CREATE TABLE Payments
(
  Payments_ID INT NOT NULL,
  PaymentDate DATE NOT NULL,
  Payment_Method VARCHAR(100) NOT NULL,
  Amount FLOAT NOT NULL,
  Customer_ID INT NOT NULL,
  PRIMARY KEY (Payments_ID),
  FOREIGN KEY (Customer_ID) REFERENCES Custemer(Customer_ID)
);





CREATE TABLE Delivery_Vehicles
(
  Plate_Number VARCHAR(100) NOT NULL,
  Type VARCHAR(100) NOT NULL,
  Brand_name VARCHAR(100) NOT NULL,
  Consumption VARCHAR(100) NOT NULL,
  Vechicle_Series_Number INT NOT NULL,
  Department_ID INT NOT NULL,
  Courier_ID INT NOT NULL,
  PRIMARY KEY (Vechicle_Series_Number),
  FOREIGN KEY (Department_ID) REFERENCES Departments(Department_ID),
  FOREIGN KEY (Courier_ID) REFERENCES Courier(Courier_ID)
);

CREATE TABLE Position_History
(
  Start_Date DATE NOT NULL,
  End_Date DATE NOT NULL,
  Position_Name VARCHAR(100) NOT NULL,
  Emp_ID INT NOT NULL,
  PRIMARY KEY (Position_Name, Emp_ID),
  FOREIGN KEY (Emp_ID) REFERENCES DeliveryCompanyEmploye(Emp_ID)
);



CREATE TABLE Is_Divided
(
  Name VARCHAR(100) NOT NULL,
  Department_ID INT NOT NULL,
  PRIMARY KEY (Name, Department_ID),
  FOREIGN KEY (Name) REFERENCES Delivery_Companies(Name),
  FOREIGN KEY (Department_ID) REFERENCES Departments(Department_ID)
);

CREATE TABLE Call
(
  Customer_ID INT NOT NULL,
  Supporter_ID INT NOT NULL,
  PRIMARY KEY (Customer_ID, Supporter_ID),
  FOREIGN KEY (Customer_ID) REFERENCES Custemer(Customer_ID),
  FOREIGN KEY (Supporter_ID) REFERENCES Call_Customer_Service(Supporter_ID)
);

-- BranchEmployee Table
INSERT INTO branchemployee (first_name, last_name, employee_id, date_of_birth, gender,
						   branch_id, supervize_employee_id)
VALUES ('Kristi', 'Cuni', 0, '2000-01-01', 'Male', 0, Null);

INSERT INTO branchemployee (first_name, last_name, employee_id, date_of_birth, gender,
						   branch_id, supervize_employee_id)
VALUES ('Rei', 'Balla', 1, '2000-07-07', 'Male', 0, 0);

INSERT INTO branchemployee (first_name, last_name, employee_id, date_of_birth, gender,
						   branch_id, supervize_employee_id)
VALUES ('Redon', 'Basha', 2, '2000-09-01', 'Male', 1, 0);

INSERT INTO branchemployee (first_name, last_name, employee_id, date_of_birth, gender,
						   branch_id, supervize_employee_id)
VALUES ('Lewis', 'Ziko', 3, '2000-01-01', 'Male', 2, 1);





-- Degree Table
INSERT INTO degree (year, institution_name, type, major, employee_id)
VALUES ('2017-08-10', 'VUB', 'Master Degree', 'Web Development', 0);
INSERT INTO degree (year, institution_name, type, major, employee_id)
VALUES ('2014-08-10', 'VUB', 'Bachelor Degree', 'Computer Engineer', 0);
INSERT INTO degree (year, institution_name, type, major, employee_id)
VALUES ('2017-08-10', 'VUB', 'Master Degree', 'Web Development', 1);
INSERT INTO degree (year, institution_name, type, major, employee_id)
VALUES ('2016-08-10', 'TU Delft', 'Bachelor Degree', 'Software Engineer', 2);
INSERT INTO degree (year, institution_name, type, major, employee_id)
VALUES ('2021-08-10', 'MIT', 'Bachelor Degree', 'Computer Science', 3);




-- e_commercial_branch TABLE
INSERT INTO e_commercial_branch (branch_id, contact_number, employee_id, branch_name)
VALUES (0, '0200 13', 0, 'Delivery Services');
INSERT INTO e_commercial_branch (branch_id, contact_number, employee_id, branch_name)
VALUES (1, '0200 14', 1, 'Suppliers');
INSERT INTO e_commercial_branch (branch_id, contact_number, employee_id, branch_name)
VALUES (2, '0200 15', 0, 'Customers');
INSERT INTO e_commercial_branch (branch_id, contact_number, employee_id, branch_name)
VALUES (3, '0200 16', 2, 'Warehouses');
INSERT INTO e_commercial_branch (branch_id, contact_number, employee_id, branch_name)
VALUES (4, '0200 14', 3, 'Products');



-- Delivery_Companies Table
INSERT INTO delivery_companies (name, branch_id) VALUES ('FedEx', 0);







-- Address Table
INSERT INTO address (street_name, postal_code, city_, region, address_id, building_number)
VALUES ('Rue du Bourgmestre', 1050, 'Brussels', 'Ixelles', 0, 15);

INSERT INTO address (street_name, postal_code, city_, region, address_id, building_number)
VALUES ('Chau. de Boondael', 1050, 'Brussels', 'Ixelles', 1, 445);

INSERT INTO address (street_name, postal_code, city_, region, address_id, building_number)
VALUES ('Pl. Sainte-Gudule', 1000, 'Brussels', 'Brussels Centre', 2, 10);

INSERT INTO address (street_name, postal_code, city_, region, address_id, building_number)
VALUES ('Chau. de Gand', 1080, 'Brussels', 'Molenbeek-Saint-Jean', 3, 389);

INSERT INTO address (street_name, postal_code, city_, region, address_id, building_number)
VALUES ('Rue Edith Cavell', 1180, 'Brussels', 'Uccle', 4, 34);

INSERT INTO address (street_name, postal_code, city_, region, address_id, building_number)
VALUES ('Rue du Chaudron', 1180, 'Brussels', 'Anderlecht', 5, 62);

INSERT INTO address (street_name, postal_code, city_, region, address_id, building_number)
VALUES ('Ebury St', 900, 'London', 'Belgravia', 6, 62);

INSERT INTO address (street_name, postal_code, city_, region, address_id, building_number)
VALUES ('City Center Altona Große', 22767, 'Hamburg', 'Neue Große Bergstraße', 7, 18);

INSERT INTO address (street_name, postal_code, city_, region, address_id, building_number)
VALUES ('Strada Trasimeno Ovest', 06127, 'Perugia PG', 'Moddona Alta', 8, 2);

INSERT INTO address (street_name, postal_code, city_, region, address_id, building_number)
VALUES ('R. Dona Maria', 2745, 'Lisbon', 'Queluz', 9, 5);






-- Physical_delivery_points_location TABLE
INSERT INTO physical_delivery_points_locations (delivery_point_id, name, address_id)
VALUES (0, 'FedEx', 0);
INSERT INTO physical_delivery_points_locations (delivery_point_id, name, address_id)
VALUES (1, 'FedEx', 1);
INSERT INTO physical_delivery_points_locations (delivery_point_id, name, address_id)
VALUES (2, 'FedEx', 2);
INSERT INTO physical_delivery_points_locations (delivery_point_id, name, address_id)
VALUES (3, 'FedEx', 3);




-- Depratments TABLE
INSERT INTO departments (department_name, department_id, number_of_employees, emp_id)
VALUES ('Customer Service', 0, 3, 0);
INSERT INTO departments (department_name, department_id, number_of_employees, emp_id)
VALUES ('Customer Support', 1, 2, 3);
INSERT INTO departments (department_name, department_id, number_of_employees, emp_id)
VALUES ('Orders', 2, 2, 5);
INSERT INTO departments (department_name, department_id, number_of_employees, emp_id)
VALUES ('Transportation', 3, 3, 7);
INSERT INTO departments (department_name, department_id, number_of_employees, emp_id)
VALUES ('Staff', 4, 7, 10);







-- call_customer_service TABLE
INSERT INTO call_customer_service (phone_number, supporter_id, supporter_first_name,
								  supporter_last_name, review, department_id)
VALUES ('+32 472 81 40 60', 0, 'Alvi', 'Fakaj', '9/10', 1);
INSERT INTO call_customer_service (phone_number, supporter_id, supporter_first_name,
								  supporter_last_name, review, department_id)
VALUES ('+32 472 81 40 61', 1, 'Orest', 'Cobo', '6/10', 1);



-- custemer TABLE
INSERT INTO custemer (customer_id, name, surname, email, phone_number, department_id)
VALUES (0, 'Kelt', 'Ahmetaj', 'keltahmetaj@gmail.com', '+32 573 90 87 43', 0);
INSERT INTO custemer (customer_id, name, surname, email, phone_number, department_id)
VALUES (1, 'Mila', 'Memaj', 'milamemaj@gmail.com', '+32 573 90 87 90', 0);
INSERT INTO custemer (customer_id, name, surname, email, phone_number, department_id)
VALUES (2, 'Yara', 'Bakker', 'yarabakker@gmail.com', '+31 573 78 78 78', 0);
INSERT INTO custemer (customer_id, name, surname, email, phone_number, department_id)
VALUES (3, 'Marin', 'Memaj', 'marinmemaj@gmail.com', '+32 573 78 71 11', 0);
INSERT INTO custemer (customer_id, name, surname, email, phone_number, department_id)
VALUES (4, 'Sokrat', 'Xhelilaj', 'sokratxhelilaj@yahoo.it', '+39 573 78 71 11', 0);
INSERT INTO custemer (customer_id, name, surname, email, phone_number, department_id)
VALUES (5, 'Thomas', 'Schmidt', 'thomasschidt@yahoo.com', '+49 573 78 72 22', 0);
INSERT INTO custemer (customer_id, name, surname, email, phone_number, department_id)
VALUES (6, 'Timo', 'Meyer', 'timomeyer@gmail.com', '+49 573 78 73 33', 0);
INSERT INTO custemer (customer_id, name, surname, email, phone_number, department_id)
VALUES (7, 'Santiago', 'Silva', 'ssilva@gmail.com', '+351 573 78 74 44', 0);
INSERT INTO custemer (customer_id, name, surname, email, phone_number, department_id)
VALUES (8, 'Jack', 'Sterling', 'jsterling@gmail.com', '+44 573 78 75 55', 0);
INSERT INTO custemer (customer_id, name, surname, email, phone_number, department_id)
VALUES (9, 'Julia', 'De Jong', 'juliadejond@gmail.com', '+31 111 78 75 55', 0);






-- call TABLE
INSERT INTO call (customer_id, supporter_id) VALUES (0, 1);
INSERT INTO call (customer_id, supporter_id) VALUES (1, 0);
INSERT INTO call (customer_id, supporter_id) VALUES (2, 1);
INSERT INTO call (customer_id, supporter_id) VALUES (3, 0);
INSERT INTO call (customer_id, supporter_id) VALUES (4, 0);
INSERT INTO call (customer_id, supporter_id) VALUES (5, 1);
INSERT INTO call (customer_id, supporter_id) VALUES (6, 0);
INSERT INTO call (customer_id, supporter_id) VALUES (7, 0);
INSERT INTO call (customer_id, supporter_id) VALUES (8, 0);
INSERT INTO call (customer_id, supporter_id) VALUES (8, 1);
INSERT INTO call (customer_id, supporter_id) VALUES (9, 1);
INSERT INTO call (customer_id, supporter_id) VALUES (9, 0);





-- payments Table
INSERT INTO payments (payments_id, paymentdate, payment_method, amount, customer_id)
VALUES (0, '2021-10-11', 'Visa Credid Card', 100, 0);
INSERT INTO payments (payments_id, paymentdate, payment_method, amount, customer_id)
VALUES (1, '2021-08-11', 'Visa Credid Card', 170, 0);
INSERT INTO payments (payments_id, paymentdate, payment_method, amount, customer_id)
VALUES (2, '2018-08-11', 'Master Credid Card', 30, 1);
INSERT INTO payments (payments_id, paymentdate, payment_method, amount, customer_id)
VALUES (3, '2019-08-11', 'Pay Pal', 80, 2);
INSERT INTO payments (payments_id, paymentdate, payment_method, amount, customer_id)
VALUES (4, '2019-08-21', 'Pay Pal', 60, 3);
INSERT INTO payments (payments_id, paymentdate, payment_method, amount, customer_id)
VALUES (5, '2019-06-29', 'Visa Credid Card', 15, 4);
INSERT INTO payments (payments_id, paymentdate, payment_method, amount, customer_id)
VALUES (6, '2019-07-29', 'Visa Credid Card', 70, 5);
INSERT INTO payments (payments_id, paymentdate, payment_method, amount, customer_id)
VALUES (7, '2020-07-29', 'Master Credid Card', 61, 6);
INSERT INTO payments (payments_id, paymentdate, payment_method, amount, customer_id)
VALUES (8, '2021-01-01', 'Pay Pal', 61, 7);
INSERT INTO payments (payments_id, paymentdate, payment_method, amount, customer_id)
VALUES (9, '2021-02-01', 'Pay Pal', 21, 8);
INSERT INTO payments (payments_id, paymentdate, payment_method, amount, customer_id)
VALUES (10, '2021-04-14', 'Pay Pal', 81, 9);
INSERT INTO payments (payments_id, paymentdate, payment_method, amount, customer_id)
VALUES (11, '2021-05-16', 'Pay Pal', 17, 9);
INSERT INTO payments (payments_id, paymentdate, payment_method, amount, customer_id)
VALUES (12, '2021-11-13', 'Pay Pal', 35, 9);






-- deliverycompanyemploye TABLE
INSERT INTO deliverycompanyemploye (emp_id, first_name, last_name, email, contact_number, salary,
					 department_id, supervize_emp_id)
VALUES (0, 'Denada', 'Rama', 'drama@gmail.com', '+32 472 82 90 78', 3790, 0, NULL);
INSERT INTO deliverycompanyemploye (emp_id, first_name, last_name, email, contact_number, salary,
					 department_id, supervize_emp_id)
VALUES (1, 'Raziena', 'Nelaj', 'rnelaj@gmail.com', '+32 472 82 90 87', 1200, 0, 0);
INSERT INTO deliverycompanyemploye (emp_id, first_name, last_name, email, contact_number, salary,
					 department_id, supervize_emp_id)
VALUES (2, 'Sonia', 'Memaj', 'smemaj@gmail.com', '+32 472 82 90 99', 2000, 0, 0);
INSERT INTO deliverycompanyemploye (emp_id, first_name, last_name, email, contact_number, salary,
					 department_id, supervize_emp_id)
VALUES (3, 'Marilena', 'Shkurti', 'mshkurti@gmail.com', '+32 472 82 90 22', 3278, 1, NULL);
INSERT INTO deliverycompanyemploye (emp_id, first_name, last_name, email, contact_number, salary,
					 department_id, supervize_emp_id)
VALUES (4, 'Silvia', 'Hoxhaj', 'shoxhaj@gmail.com', '+32 472 82 90 78', 2090, 1, 3);
INSERT INTO deliverycompanyemploye (emp_id, first_name, last_name, email, contact_number, salary,
					 department_id, supervize_emp_id)
VALUES (5, 'Mateo', 'Shkurtaj', 'shkurtaj_m@gmail.com', '+32 472 82 78 12', 2040, 2, NULL);
INSERT INTO deliverycompanyemploye (emp_id, first_name, last_name, email, contact_number, salary,
					 department_id, supervize_emp_id)
VALUES (6, 'Fjorelo', 'Van De Beek', 'fjorelovandebeek@gmail.com', '+32 472 82 22 58', 1990, 2, 1);
INSERT INTO deliverycompanyemploye (emp_id, first_name, last_name, email, contact_number, salary,
					 department_id, supervize_emp_id)
VALUES (7, 'Arabella', 'Visser', 'avisser@gmail.com', '+32 472 82 44 49', 5090, 3, NULL);
INSERT INTO deliverycompanyemploye (emp_id, first_name, last_name, email, contact_number, salary,
					 department_id, supervize_emp_id)
VALUES (8, 'Anki', 'Bijl', 'ankibijl@gmail.com', '+32 472 82 89 49', 2000, 3, 7);
INSERT INTO deliverycompanyemploye (emp_id, first_name, last_name, email, contact_number, salary,
					 department_id, supervize_emp_id)
VALUES (9, 'Caileb', 'Stenly', 'cstenly@gmail.com', '+32 472 82 56 56', 7090, 3, 7);
INSERT INTO deliverycompanyemploye (emp_id, first_name, last_name, email, contact_number, salary,
					 department_id, supervize_emp_id)
VALUES (10, 'Alexander', 'Dijaz', 'adijaz@gmail.com', '+32 472 11 11 11', 6090, 4, NULL);
INSERT INTO deliverycompanyemploye (emp_id, first_name, last_name, email, contact_number, salary,
					 department_id, supervize_emp_id)
VALUES (11, 'Chad', 'Rumey', 'cumey@gmail.com', '+32 472 82 56 65', 4570, 4, 10);
INSERT INTO deliverycompanyemploye (emp_id, first_name, last_name, email, contact_number, salary,
					 department_id, supervize_emp_id)
VALUES (12, 'Rex', 'Brockelman', 'rblockelman@gmail.com', '+32 472 69 69 69', 6969, 4, 4);










-- position_history TABLE;
INSERT INTO position_history (start_date, end_date, position_name, emp_id)
VALUES ('2020-05-16', '2020-05-16', 'Administrative manager', 0);
INSERT INTO position_history (start_date, end_date, position_name, emp_id)
VALUES ('2019-03-13', '2020-05-01', 'Administrative assistant', 0);
INSERT INTO position_history (start_date, end_date, position_name, emp_id)
VALUES ('2019-12-13', '2020-12-01', 'Secretary', 1);
INSERT INTO position_history (start_date, end_date, position_name, emp_id)
VALUES ('2017-12-13', '2019-12-01', 'Receptionist', 1);
INSERT INTO position_history (start_date, end_date, position_name, emp_id)
VALUES ('2017-12-13', '2021-07-01', 'Administrative Director', 2);
INSERT INTO position_history (start_date, end_date, position_name, emp_id)
VALUES ('2016-12-13', '2019-09-01', 'Executive Assistant', 3);
INSERT INTO position_history (start_date, end_date, position_name, emp_id)
VALUES ('2018-04-13', '2021-08-03', 'Bill Collector', 4);
INSERT INTO position_history (start_date, end_date, position_name, emp_id)
VALUES ('2013-12-13', '2017-12-01', 'File Clerk', 5);
INSERT INTO position_history (start_date, end_date, position_name, emp_id)
VALUES ('2018-05-13', '2019-06-01', 'Staff Assistant', 6);
INSERT INTO position_history (start_date, end_date, position_name, emp_id)
VALUES ('2019-07-13', '2021-08-14', 'Administrative Officer', 6);
INSERT INTO position_history (start_date, end_date, position_name, emp_id)
VALUES ('2015-02-15', '2017-12-29', 'Content Manager', 7);
INSERT INTO position_history (start_date, end_date, position_name, emp_id)
VALUES ('2017-12-30', '2019-01-01', 'Team Leader', 7);
INSERT INTO position_history (start_date, end_date, position_name, emp_id)
VALUES ('2012-06-28', '2019-09-09', 'Content Manager', 8);
INSERT INTO position_history (start_date, end_date, position_name, emp_id)
VALUES ('2013-03-18', '2018-06-16', 'Account Representative', 9);
INSERT INTO position_history (start_date, end_date, position_name, emp_id)
VALUES ('2007-02-13', '2012-02-13', 'Auditor', 9);
INSERT INTO position_history (start_date, end_date, position_name, emp_id)
VALUES ('2006-04-13', '2016-05-15', 'Head Of Operations', 10);
INSERT INTO position_history (start_date, end_date, position_name, emp_id)
VALUES ('2015-10-10', '2019-10-01', 'Creative Director', 11);
INSERT INTO position_history (start_date, end_date, position_name, emp_id)
VALUES ('2010-01-10', '2015-08-10', 'Assistant', 11);
INSERT INTO position_history (start_date, end_date, position_name, emp_id)
VALUES ('2000-03-13', '2007-12-01', 'Assistant', 12);
INSERT INTO position_history (start_date, end_date, position_name, emp_id)
VALUES ('2008-01-13', '2010-12-01', 'Office Manager', 12);
INSERT INTO position_history (start_date, end_date, position_name, emp_id)
VALUES ('2011-02-13', '2015-11-11', 'Administrative Director', 12);
INSERT INTO position_history (start_date, end_date, position_name, emp_id)
VALUES ('2016-01-29', '2021-12-01', 'Administrative Menager & Specialist', 12);





-- courier TABLE
INSERT INTO courier (courier_id, last_name, first_name, gender, date_of_birth, salary,
					emp_id, department_id)
VALUES (0, 'Caushaj', 'Xhon', 'Male', '1988-12-01', 2010, 10, 4);
INSERT INTO courier (courier_id, last_name, first_name, gender, date_of_birth, salary,
					emp_id, department_id)
VALUES (1, 'Zachau', 'Meggan', 'Female', '1999-03-14', 1810, 10, 4);
INSERT INTO courier (courier_id, last_name, first_name, gender, date_of_birth, salary,
					emp_id, department_id)
VALUES (2, 'Nicoelette', 'Gardner', 'Female', '1984-10-11', 2310, 10, 4);
INSERT INTO courier (courier_id, last_name, first_name, gender, date_of_birth, salary,
					emp_id, department_id)
VALUES (3, 'Mati', 'Brajen', 'Male', '2000-09-09', 1990, 10, 4);









-- delivery_vehicle TABLE
INSERT INTO delivery_vehicles (plate_number, type, brand_name, consumption, vechicle_series_number, 
							   department_id, courier_id)
VALUES ('2-CFD-007', 'Van', 'Mercedes-Benz', '8.2L/100km', 1771871, 3, 0);
INSERT INTO delivery_vehicles (plate_number, type, brand_name, consumption, vechicle_series_number, 
							   department_id, courier_id)
VALUES ('1-ALK-904', 'Van', 'Fiat', '15.2L/100km', 3661890, 3, 1);
INSERT INTO delivery_vehicles (plate_number, type, brand_name, consumption, vechicle_series_number, 
							   department_id, courier_id)
VALUES ('0-SQL-000', 'Van', 'Mercedes-Benz', '8.2L/100km', 1771981, 3, 2);
INSERT INTO delivery_vehicles (plate_number, type, brand_name, consumption, vechicle_series_number, 
							   department_id, courier_id)
VALUES ('6-PYF-123', 'Van', 'Peugeot', '10.4L/100km', 3653876, 3, 3);






-- delivery_order TABLE
INSERT INTO delivery_order (deliver_id, package_weight, stage, shipping_type, comments, department_id,
						   address_id, customer_id, courier_id)
VALUES (0, 13, 'Delivered', 'Express', 'Fragile Package', 2, 0, 0, 3);
INSERT INTO delivery_order (deliver_id, package_weight, stage, shipping_type, comments, department_id,
						   address_id, customer_id, courier_id)
VALUES (1, 7, 'Delivered', 'Express', 'Fragile Package', 2, 6, 0, 2);
INSERT INTO delivery_order (deliver_id, package_weight, stage, shipping_type, comments, department_id,
						   address_id, customer_id, courier_id)
VALUES (2, 2, 'Delivered', 'Standart', 'Fragile Package', 2, 7, 1, 1);
INSERT INTO delivery_order (deliver_id, package_weight, stage, shipping_type, comments, department_id,
						   address_id, customer_id, courier_id)
VALUES (3, 3, 'On The Way', 'Express', 'Non Fragile Package', 2, 2, 2, 0);
INSERT INTO delivery_order (deliver_id, package_weight, stage, shipping_type, comments, department_id,
						   address_id, customer_id, courier_id)
VALUES (4, 3, 'Delivered', 'Standart', 'Non Fragile Package', 2, 8, 3, 1);
INSERT INTO delivery_order (deliver_id, package_weight, stage, shipping_type, comments, department_id,
						   address_id, customer_id, courier_id)
VALUES (5, 12, 'On The Way', 'Standart', 'Fragile Package', 2, 2, 4, 2);
INSERT INTO delivery_order (deliver_id, package_weight, stage, shipping_type, comments, department_id,
						   address_id, customer_id, courier_id)
VALUES (6, 1, 'Delivered', 'Express', 'Fragile Package', 2, 3, 5, 3);
INSERT INTO delivery_order (deliver_id, package_weight, stage, shipping_type, comments, department_id,
						   address_id, customer_id, courier_id)
VALUES (7, 3, 'Delivered', 'Express', 'Fragile Package', 2, 7, 6, 0);
INSERT INTO delivery_order (deliver_id, package_weight, stage, shipping_type, comments, department_id,
						   address_id, customer_id, courier_id)
VALUES (8, 2, 'On The Way', 'Standart', 'Non Fragile Package', 2, 4, 7, 0);
INSERT INTO delivery_order (deliver_id, package_weight, stage, shipping_type, comments, department_id,
						   address_id, customer_id, courier_id)
VALUES (9, 3, 'Delivered', 'Express', 'Fragile Package', 2, 5, 8, 1);
INSERT INTO delivery_order (deliver_id, package_weight, stage, shipping_type, comments, department_id,
						   address_id, customer_id, courier_id)
VALUES (10, 1, 'On The Way', 'Standart', 'Non Fragile Package', 2, 2, 9, 3);
INSERT INTO delivery_order (deliver_id, package_weight, stage, shipping_type, comments, department_id,
						   address_id, customer_id, courier_id)
VALUES (11, 2, 'Delivered', 'Express', 'Fragile Package', 2, 1, 9, 2);










-- is_divided TABLE
INSERT INTO is_divided (name, department_id) VALUES ('FedEx', 0);
INSERT INTO is_divided (name, department_id) VALUES ('FedEx', 1);
INSERT INTO is_divided (name, department_id) VALUES ('FedEx', 2);
INSERT INTO is_divided (name, department_id) VALUES ('FedEx', 3);





-- Setting FK to BranchEmployee
ALTER TABLE BranchEmployee
ADD FOREIGN KEY (Branch_ID) REFERENCES e_commercial_branch(Branch_ID);

-- Setting FK to Departments
ALTER TABLE Departments
ADD FOREIGN KEY (Emp_ID) REFERENCES DeliveryCompanyEmploye(Emp_ID);

/* 
		Below Can find the functions that queries will use. 
*/

create function OrderCost(
	orderWeight float, orderType varchar(50), 
	destination varchar(50))
	
	returns float
	
	as $$
	declare orderCost float;
	
	begin
		
		if (orderWeight <= 5) then orderCost = 0;
		elseif (orderWeight > 5 and orderWeight <= 20) then orderCost = 20;
		else set orderCost = 50;
		end if;
		
		if orderType like 'Express' then  orderCost = orderCost + 67;
		else orderCost = orderCost + 0;
		end if;
		
		if destination = 'Brussels' then orderCost = orderCost + 12;
		else orderCost = orderCost + 76;
		end if;
		
		return (orderCost);
	
end;  
$$ language plpgsql;


create function Subtract_Tax(
	orderPayments float, 
	productCost float, 
	employeeSalary float,
	courierSalary float)
	
	returns float
	language plpgsql  
	as $$
	declare profit float;
	
	begin
		
		if (orderPayments - productCost - employeeSalary - courierSalary) > 0
		then profit = profit - 38.75/100*(orderPayments - productCost - employeeSalary - courierSalary);
		else profit = (orderPayments - productCost - employeeSalary - courierSalary);
		end if;
		
		
		
		return (profit);
	
end; $$


