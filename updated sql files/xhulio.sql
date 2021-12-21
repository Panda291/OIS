--
-- PostgreSQL database dump
--

-- Dumped from database version 13.5 (Ubuntu 13.5-1.pgdg21.04+1)
-- Dumped by pg_dump version 13.5 (Ubuntu 13.5-1.pgdg21.04+1)

-- Started on 2021-12-21 18:29:28 CET

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 217 (class 1255 OID 17464)
-- Name: ordercost(double precision, character varying, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.ordercost(orderweight double precision, ordertype character varying, destination character varying) RETURNS double precision
    LANGUAGE plpgsql
    AS $$
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
$$;


ALTER FUNCTION public.ordercost(orderweight double precision, ordertype character varying, destination character varying) OWNER TO postgres;

--
-- TOC entry 218 (class 1255 OID 17465)
-- Name: subtract_tax(double precision, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.subtract_tax(orderpayments double precision, productcost double precision, employeesalary double precision, couriersalary double precision) RETURNS double precision
    LANGUAGE plpgsql
    AS $$
	declare profit float;
	
	begin
		
		if (orderPayments - productCost - employeeSalary - courierSalary) > 0
		then profit = profit - 38.75/100*(orderPayments - productCost - employeeSalary - courierSalary);
		else profit = (orderPayments - productCost - employeeSalary - courierSalary);
		end if;
		
		
		
		return (profit);
	
end; $$;


ALTER FUNCTION public.subtract_tax(orderpayments double precision, productcost double precision, employeesalary double precision, couriersalary double precision) OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 200 (class 1259 OID 17254)
-- Name: address; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.address (
    street_name character varying(100) NOT NULL,
    postal_code integer NOT NULL,
    city_ character varying(100) NOT NULL,
    region character varying(100) NOT NULL,
    address_id integer NOT NULL,
    building_number integer NOT NULL
);


ALTER TABLE public.address OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 17259)
-- Name: branchemployee; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.branchemployee (
    first_name character varying(100) NOT NULL,
    last_name character varying(100) NOT NULL,
    employee_id integer NOT NULL,
    date_of_birth date,
    gender character varying(100) NOT NULL,
    branch_id integer NOT NULL,
    supervize_employee_id integer
);


ALTER TABLE public.branchemployee OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 17439)
-- Name: call; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.call (
    customer_id integer NOT NULL,
    supporter_id integer NOT NULL
);


ALTER TABLE public.call OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 17379)
-- Name: call_customer_service; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.call_customer_service (
    phone_number character varying(100) NOT NULL,
    supporter_id integer NOT NULL,
    supporter_first_name character varying(100) NOT NULL,
    supporter_last_name character varying(100) NOT NULL,
    review character varying(100) NOT NULL,
    department_id integer NOT NULL
);


ALTER TABLE public.call_customer_service OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 17339)
-- Name: courier; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.courier (
    courier_id integer NOT NULL,
    last_name character varying(100) NOT NULL,
    first_name character varying(100) NOT NULL,
    gender character varying(100) NOT NULL,
    date_of_birth date,
    salary integer NOT NULL,
    emp_id integer NOT NULL,
    department_id integer NOT NULL
);


ALTER TABLE public.courier OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 17329)
-- Name: custemer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.custemer (
    customer_id integer NOT NULL,
    name character varying(100) NOT NULL,
    surname character varying(100) NOT NULL,
    email character varying(100) NOT NULL,
    phone_number character varying(100) NOT NULL,
    department_id integer NOT NULL
);


ALTER TABLE public.custemer OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 17279)
-- Name: degree; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.degree (
    year date NOT NULL,
    institution_name character varying(100) NOT NULL,
    type character varying(100) NOT NULL,
    major character varying(100),
    employee_id integer NOT NULL
);


ALTER TABLE public.degree OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 17284)
-- Name: delivery_companies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.delivery_companies (
    name character varying(100) NOT NULL,
    branch_id integer NOT NULL
);


ALTER TABLE public.delivery_companies OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 17354)
-- Name: delivery_order; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.delivery_order (
    deliver_id integer NOT NULL,
    package_weight integer NOT NULL,
    stage character varying(100) NOT NULL,
    shipping_type character varying(100) NOT NULL,
    comments character varying(100) NOT NULL,
    department_id integer NOT NULL,
    address_id integer NOT NULL,
    customer_id integer NOT NULL,
    courier_id integer NOT NULL
);


ALTER TABLE public.delivery_order OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 17399)
-- Name: delivery_vehicles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.delivery_vehicles (
    plate_number character varying(100) NOT NULL,
    type character varying(100) NOT NULL,
    brand_name character varying(100) NOT NULL,
    consumption character varying(100) NOT NULL,
    vechicle_series_number integer NOT NULL,
    department_id integer NOT NULL,
    courier_id integer NOT NULL
);


ALTER TABLE public.delivery_vehicles OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 17314)
-- Name: deliverycompanyemploye; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.deliverycompanyemploye (
    emp_id integer NOT NULL,
    first_name character varying(100) NOT NULL,
    last_name character varying(100) NOT NULL,
    email character varying(100) NOT NULL,
    contact_number character varying(100) NOT NULL,
    salary double precision NOT NULL,
    department_id integer NOT NULL,
    supervize_emp_id integer
);


ALTER TABLE public.deliverycompanyemploye OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 17309)
-- Name: departments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.departments (
    department_name character varying(100) NOT NULL,
    department_id integer NOT NULL,
    number_of_employees integer,
    emp_id integer NOT NULL
);


ALTER TABLE public.departments OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 17269)
-- Name: e_commercial_branch; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.e_commercial_branch (
    branch_id integer NOT NULL,
    contact_number character varying(100) NOT NULL,
    branch_name character varying(100) NOT NULL,
    employee_id integer NOT NULL
);


ALTER TABLE public.e_commercial_branch OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 17424)
-- Name: is_divided; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.is_divided (
    name character varying(100) NOT NULL,
    department_id integer NOT NULL
);


ALTER TABLE public.is_divided OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 17389)
-- Name: payments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payments (
    payments_id integer NOT NULL,
    paymentdate date NOT NULL,
    payment_method character varying(100) NOT NULL,
    amount double precision NOT NULL,
    customer_id integer NOT NULL
);


ALTER TABLE public.payments OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 17294)
-- Name: physical_delivery_points_locations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.physical_delivery_points_locations (
    delivery_point_id integer NOT NULL,
    name character varying(100) NOT NULL,
    address_id integer NOT NULL
);


ALTER TABLE public.physical_delivery_points_locations OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 17414)
-- Name: position_history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.position_history (
    start_date date NOT NULL,
    end_date date NOT NULL,
    position_name character varying(100) NOT NULL,
    emp_id integer NOT NULL
);


ALTER TABLE public.position_history OWNER TO postgres;

--
-- TOC entry 3266 (class 0 OID 17254)
-- Dependencies: 200
-- Data for Name: address; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.address (street_name, postal_code, city_, region, address_id, building_number) FROM stdin;
Rue du Bourgmestre	1050	Brussels	Ixelles	0	15
Chau. de Boondael	1050	Brussels	Ixelles	1	445
Pl. Sainte-Gudule	1000	Brussels	Brussels Centre	2	10
Chau. de Gand	1080	Brussels	Molenbeek-Saint-Jean	3	389
Rue Edith Cavell	1180	Brussels	Uccle	4	34
Rue du Chaudron	1180	Brussels	Anderlecht	5	62
Ebury St	900	London	Belgravia	6	62
City Center Altona Große	22767	Hamburg	Neue Große Bergstraße	7	18
Strada Trasimeno Ovest	6127	Perugia PG	Moddona Alta	8	2
R. Dona Maria	2745	Lisbon	Queluz	9	5
\.


--
-- TOC entry 3267 (class 0 OID 17259)
-- Dependencies: 201
-- Data for Name: branchemployee; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.branchemployee (first_name, last_name, employee_id, date_of_birth, gender, branch_id, supervize_employee_id) FROM stdin;
Kristi	Cuni	0	2000-01-01	Male	0	\N
Rei	Balla	1	2000-07-07	Male	0	0
Redon	Basha	2	2000-09-01	Male	1	0
Lewis	Ziko	3	2000-01-01	Male	2	1
\.


--
-- TOC entry 3282 (class 0 OID 17439)
-- Dependencies: 216
-- Data for Name: call; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.call (customer_id, supporter_id) FROM stdin;
0	1
1	0
2	1
3	0
4	0
5	1
6	0
7	0
8	0
8	1
9	1
9	0
\.


--
-- TOC entry 3277 (class 0 OID 17379)
-- Dependencies: 211
-- Data for Name: call_customer_service; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.call_customer_service (phone_number, supporter_id, supporter_first_name, supporter_last_name, review, department_id) FROM stdin;
+32 472 81 40 60	0	Alvi	Fakaj	9/10	1
+32 472 81 40 61	1	Orest	Cobo	6/10	1
\.


--
-- TOC entry 3275 (class 0 OID 17339)
-- Dependencies: 209
-- Data for Name: courier; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.courier (courier_id, last_name, first_name, gender, date_of_birth, salary, emp_id, department_id) FROM stdin;
0	Caushaj	Xhon	Male	1988-12-01	2010	10	4
1	Zachau	Meggan	Female	1999-03-14	1810	10	4
2	Nicoelette	Gardner	Female	1984-10-11	2310	10	4
3	Mati	Brajen	Male	2000-09-09	1990	10	4
\.


--
-- TOC entry 3274 (class 0 OID 17329)
-- Dependencies: 208
-- Data for Name: custemer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.custemer (customer_id, name, surname, email, phone_number, department_id) FROM stdin;
0	Kelt	Ahmetaj	keltahmetaj@gmail.com	+32 573 90 87 43	0
1	Mila	Memaj	milamemaj@gmail.com	+32 573 90 87 90	0
2	Yara	Bakker	yarabakker@gmail.com	+31 573 78 78 78	0
3	Marin	Memaj	marinmemaj@gmail.com	+32 573 78 71 11	0
4	Sokrat	Xhelilaj	sokratxhelilaj@yahoo.it	+39 573 78 71 11	0
5	Thomas	Schmidt	thomasschidt@yahoo.com	+49 573 78 72 22	0
6	Timo	Meyer	timomeyer@gmail.com	+49 573 78 73 33	0
7	Santiago	Silva	ssilva@gmail.com	+351 573 78 74 44	0
8	Jack	Sterling	jsterling@gmail.com	+44 573 78 75 55	0
9	Julia	De Jong	juliadejond@gmail.com	+31 111 78 75 55	0
10	Christophe	Van den Eede	christophe@example.com	+32 400 00 00 01	0
11	Anastasia	Nastya Krouglova	nastya@example.com	+32 400 00 00 02	0
12	Thomas	Koelman	thomas@example.com	+32 400 00 00 03	0
13	Xhulio	Isufi	xhulio@example.com	+32 400 00 00 04	0
14	Lars	Palinckx	lars@example.com	+32 400 00 00 05	0
\.


--
-- TOC entry 3269 (class 0 OID 17279)
-- Dependencies: 203
-- Data for Name: degree; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.degree (year, institution_name, type, major, employee_id) FROM stdin;
2017-08-10	VUB	Master Degree	Web Development	0
2014-08-10	VUB	Bachelor Degree	Computer Engineer	0
2017-08-10	VUB	Master Degree	Web Development	1
2016-08-10	TU Delft	Bachelor Degree	Software Engineer	2
2021-08-10	MIT	Bachelor Degree	Computer Science	3
\.


--
-- TOC entry 3270 (class 0 OID 17284)
-- Dependencies: 204
-- Data for Name: delivery_companies; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.delivery_companies (name, branch_id) FROM stdin;
FedEx	0
\.


--
-- TOC entry 3276 (class 0 OID 17354)
-- Dependencies: 210
-- Data for Name: delivery_order; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.delivery_order (deliver_id, package_weight, stage, shipping_type, comments, department_id, address_id, customer_id, courier_id) FROM stdin;
0	13	Delivered	Express	Fragile Package	2	0	0	3
1	7	Delivered	Express	Fragile Package	2	6	0	2
2	2	Delivered	Standart	Fragile Package	2	7	1	1
3	3	On The Way	Express	Non Fragile Package	2	2	2	0
4	3	Delivered	Standart	Non Fragile Package	2	8	3	1
5	12	On The Way	Standart	Fragile Package	2	2	4	2
6	1	Delivered	Express	Fragile Package	2	3	5	3
7	3	Delivered	Express	Fragile Package	2	7	6	0
8	2	On The Way	Standart	Non Fragile Package	2	4	7	0
9	3	Delivered	Express	Fragile Package	2	5	8	1
10	1	On The Way	Standart	Non Fragile Package	2	2	9	3
11	2	Delivered	Express	Fragile Package	2	1	9	2
\.


--
-- TOC entry 3279 (class 0 OID 17399)
-- Dependencies: 213
-- Data for Name: delivery_vehicles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.delivery_vehicles (plate_number, type, brand_name, consumption, vechicle_series_number, department_id, courier_id) FROM stdin;
2-CFD-007	Van	Mercedes-Benz	8.2L/100km	1771871	3	0
1-ALK-904	Van	Fiat	15.2L/100km	3661890	3	1
0-SQL-000	Van	Mercedes-Benz	8.2L/100km	1771981	3	2
6-PYF-123	Van	Peugeot	10.4L/100km	3653876	3	3
\.


--
-- TOC entry 3273 (class 0 OID 17314)
-- Dependencies: 207
-- Data for Name: deliverycompanyemploye; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.deliverycompanyemploye (emp_id, first_name, last_name, email, contact_number, salary, department_id, supervize_emp_id) FROM stdin;
0	Denada	Rama	drama@gmail.com	+32 472 82 90 78	3790	0	\N
1	Raziena	Nelaj	rnelaj@gmail.com	+32 472 82 90 87	1200	0	0
2	Sonia	Memaj	smemaj@gmail.com	+32 472 82 90 99	2000	0	0
3	Marilena	Shkurti	mshkurti@gmail.com	+32 472 82 90 22	3278	1	\N
4	Silvia	Hoxhaj	shoxhaj@gmail.com	+32 472 82 90 78	2090	1	3
5	Mateo	Shkurtaj	shkurtaj_m@gmail.com	+32 472 82 78 12	2040	2	\N
6	Fjorelo	Van De Beek	fjorelovandebeek@gmail.com	+32 472 82 22 58	1990	2	1
7	Arabella	Visser	avisser@gmail.com	+32 472 82 44 49	5090	3	\N
8	Anki	Bijl	ankibijl@gmail.com	+32 472 82 89 49	2000	3	7
9	Caileb	Stenly	cstenly@gmail.com	+32 472 82 56 56	7090	3	7
10	Alexander	Dijaz	adijaz@gmail.com	+32 472 11 11 11	6090	4	\N
11	Chad	Rumey	cumey@gmail.com	+32 472 82 56 65	4570	4	10
12	Rex	Brockelman	rblockelman@gmail.com	+32 472 69 69 69	6969	4	4
\.


--
-- TOC entry 3272 (class 0 OID 17309)
-- Dependencies: 206
-- Data for Name: departments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.departments (department_name, department_id, number_of_employees, emp_id) FROM stdin;
Customer Service	0	3	0
Customer Support	1	2	3
Orders	2	2	5
Transportation	3	3	7
Staff	4	7	10
\.


--
-- TOC entry 3268 (class 0 OID 17269)
-- Dependencies: 202
-- Data for Name: e_commercial_branch; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.e_commercial_branch (branch_id, contact_number, branch_name, employee_id) FROM stdin;
0	0200 13	Delivery Services	0
1	0200 14	Suppliers	1
2	0200 15	Customers	0
3	0200 16	Warehouses	2
4	0200 14	Products	3
\.


--
-- TOC entry 3281 (class 0 OID 17424)
-- Dependencies: 215
-- Data for Name: is_divided; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.is_divided (name, department_id) FROM stdin;
FedEx	0
FedEx	1
FedEx	2
FedEx	3
\.


--
-- TOC entry 3278 (class 0 OID 17389)
-- Dependencies: 212
-- Data for Name: payments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payments (payments_id, paymentdate, payment_method, amount, customer_id) FROM stdin;
0	2021-10-11	Visa Credid Card	100	0
1	2021-08-11	Visa Credid Card	170	0
2	2018-08-11	Master Credid Card	30	1
3	2019-08-11	Pay Pal	80	2
4	2019-08-21	Pay Pal	60	3
5	2019-06-29	Visa Credid Card	15	4
6	2019-07-29	Visa Credid Card	70	5
7	2020-07-29	Master Credid Card	61	6
8	2021-01-01	Pay Pal	61	7
9	2021-02-01	Pay Pal	21	8
10	2021-04-14	Pay Pal	81	9
11	2021-05-16	Pay Pal	17	9
12	2021-11-13	Pay Pal	35	9
\.


--
-- TOC entry 3271 (class 0 OID 17294)
-- Dependencies: 205
-- Data for Name: physical_delivery_points_locations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.physical_delivery_points_locations (delivery_point_id, name, address_id) FROM stdin;
0	FedEx	0
1	FedEx	1
2	FedEx	2
3	FedEx	3
\.


--
-- TOC entry 3280 (class 0 OID 17414)
-- Dependencies: 214
-- Data for Name: position_history; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.position_history (start_date, end_date, position_name, emp_id) FROM stdin;
2020-05-16	2020-05-16	Administrative manager	0
2019-03-13	2020-05-01	Administrative assistant	0
2019-12-13	2020-12-01	Secretary	1
2017-12-13	2019-12-01	Receptionist	1
2017-12-13	2021-07-01	Administrative Director	2
2016-12-13	2019-09-01	Executive Assistant	3
2018-04-13	2021-08-03	Bill Collector	4
2013-12-13	2017-12-01	File Clerk	5
2018-05-13	2019-06-01	Staff Assistant	6
2019-07-13	2021-08-14	Administrative Officer	6
2015-02-15	2017-12-29	Content Manager	7
2017-12-30	2019-01-01	Team Leader	7
2012-06-28	2019-09-09	Content Manager	8
2013-03-18	2018-06-16	Account Representative	9
2007-02-13	2012-02-13	Auditor	9
2006-04-13	2016-05-15	Head Of Operations	10
2015-10-10	2019-10-01	Creative Director	11
2010-01-10	2015-08-10	Assistant	11
2000-03-13	2007-12-01	Assistant	12
2008-01-13	2010-12-01	Office Manager	12
2011-02-13	2015-11-11	Administrative Director	12
2016-01-29	2021-12-01	Administrative Menager & Specialist	12
\.


--
-- TOC entry 3078 (class 2606 OID 17258)
-- Name: address address_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.address
    ADD CONSTRAINT address_pkey PRIMARY KEY (address_id);


--
-- TOC entry 3080 (class 2606 OID 17263)
-- Name: branchemployee branchemployee_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.branchemployee
    ADD CONSTRAINT branchemployee_pkey PRIMARY KEY (employee_id);


--
-- TOC entry 3100 (class 2606 OID 17383)
-- Name: call_customer_service call_customer_service_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.call_customer_service
    ADD CONSTRAINT call_customer_service_pkey PRIMARY KEY (supporter_id);


--
-- TOC entry 3110 (class 2606 OID 17443)
-- Name: call call_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.call
    ADD CONSTRAINT call_pkey PRIMARY KEY (customer_id, supporter_id);


--
-- TOC entry 3096 (class 2606 OID 17343)
-- Name: courier courier_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.courier
    ADD CONSTRAINT courier_pkey PRIMARY KEY (courier_id);


--
-- TOC entry 3094 (class 2606 OID 17333)
-- Name: custemer custemer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.custemer
    ADD CONSTRAINT custemer_pkey PRIMARY KEY (customer_id);


--
-- TOC entry 3084 (class 2606 OID 17283)
-- Name: degree degree_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.degree
    ADD CONSTRAINT degree_pkey PRIMARY KEY (type, employee_id);


--
-- TOC entry 3086 (class 2606 OID 17288)
-- Name: delivery_companies delivery_companies_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.delivery_companies
    ADD CONSTRAINT delivery_companies_pkey PRIMARY KEY (name);


--
-- TOC entry 3098 (class 2606 OID 17358)
-- Name: delivery_order delivery_order_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.delivery_order
    ADD CONSTRAINT delivery_order_pkey PRIMARY KEY (deliver_id);


--
-- TOC entry 3104 (class 2606 OID 17403)
-- Name: delivery_vehicles delivery_vehicles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.delivery_vehicles
    ADD CONSTRAINT delivery_vehicles_pkey PRIMARY KEY (vechicle_series_number);


--
-- TOC entry 3092 (class 2606 OID 17318)
-- Name: deliverycompanyemploye deliverycompanyemploye_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deliverycompanyemploye
    ADD CONSTRAINT deliverycompanyemploye_pkey PRIMARY KEY (emp_id);


--
-- TOC entry 3090 (class 2606 OID 17313)
-- Name: departments departments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departments
    ADD CONSTRAINT departments_pkey PRIMARY KEY (department_id);


--
-- TOC entry 3082 (class 2606 OID 17273)
-- Name: e_commercial_branch e_commercial_branch_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.e_commercial_branch
    ADD CONSTRAINT e_commercial_branch_pkey PRIMARY KEY (branch_id);


--
-- TOC entry 3108 (class 2606 OID 17428)
-- Name: is_divided is_divided_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.is_divided
    ADD CONSTRAINT is_divided_pkey PRIMARY KEY (name, department_id);


--
-- TOC entry 3102 (class 2606 OID 17393)
-- Name: payments payments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_pkey PRIMARY KEY (payments_id);


--
-- TOC entry 3088 (class 2606 OID 17298)
-- Name: physical_delivery_points_locations physical_delivery_points_locations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.physical_delivery_points_locations
    ADD CONSTRAINT physical_delivery_points_locations_pkey PRIMARY KEY (delivery_point_id);


--
-- TOC entry 3106 (class 2606 OID 17418)
-- Name: position_history position_history_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.position_history
    ADD CONSTRAINT position_history_pkey PRIMARY KEY (position_name, emp_id);


--
-- TOC entry 3112 (class 2606 OID 17454)
-- Name: branchemployee branchemployee_branch_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.branchemployee
    ADD CONSTRAINT branchemployee_branch_id_fkey FOREIGN KEY (branch_id) REFERENCES public.e_commercial_branch(branch_id);


--
-- TOC entry 3111 (class 2606 OID 17264)
-- Name: branchemployee branchemployee_supervize_employee_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.branchemployee
    ADD CONSTRAINT branchemployee_supervize_employee_id_fkey FOREIGN KEY (supervize_employee_id) REFERENCES public.branchemployee(employee_id);


--
-- TOC entry 3134 (class 2606 OID 17444)
-- Name: call call_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.call
    ADD CONSTRAINT call_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.custemer(customer_id);


--
-- TOC entry 3127 (class 2606 OID 17384)
-- Name: call_customer_service call_customer_service_department_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.call_customer_service
    ADD CONSTRAINT call_customer_service_department_id_fkey FOREIGN KEY (department_id) REFERENCES public.departments(department_id);


--
-- TOC entry 3135 (class 2606 OID 17449)
-- Name: call call_supporter_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.call
    ADD CONSTRAINT call_supporter_id_fkey FOREIGN KEY (supporter_id) REFERENCES public.call_customer_service(supporter_id);


--
-- TOC entry 3122 (class 2606 OID 17349)
-- Name: courier courier_department_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.courier
    ADD CONSTRAINT courier_department_id_fkey FOREIGN KEY (department_id) REFERENCES public.departments(department_id);


--
-- TOC entry 3121 (class 2606 OID 17344)
-- Name: courier courier_emp_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.courier
    ADD CONSTRAINT courier_emp_id_fkey FOREIGN KEY (emp_id) REFERENCES public.deliverycompanyemploye(emp_id);


--
-- TOC entry 3120 (class 2606 OID 17334)
-- Name: custemer custemer_department_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.custemer
    ADD CONSTRAINT custemer_department_id_fkey FOREIGN KEY (department_id) REFERENCES public.departments(department_id);


--
-- TOC entry 3114 (class 2606 OID 17289)
-- Name: delivery_companies delivery_companies_branch_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.delivery_companies
    ADD CONSTRAINT delivery_companies_branch_id_fkey FOREIGN KEY (branch_id) REFERENCES public.e_commercial_branch(branch_id);


--
-- TOC entry 3124 (class 2606 OID 17364)
-- Name: delivery_order delivery_order_address_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.delivery_order
    ADD CONSTRAINT delivery_order_address_id_fkey FOREIGN KEY (address_id) REFERENCES public.address(address_id);


--
-- TOC entry 3126 (class 2606 OID 17374)
-- Name: delivery_order delivery_order_courier_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.delivery_order
    ADD CONSTRAINT delivery_order_courier_id_fkey FOREIGN KEY (courier_id) REFERENCES public.courier(courier_id);


--
-- TOC entry 3125 (class 2606 OID 17369)
-- Name: delivery_order delivery_order_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.delivery_order
    ADD CONSTRAINT delivery_order_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.custemer(customer_id);


--
-- TOC entry 3123 (class 2606 OID 17359)
-- Name: delivery_order delivery_order_department_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.delivery_order
    ADD CONSTRAINT delivery_order_department_id_fkey FOREIGN KEY (department_id) REFERENCES public.departments(department_id);


--
-- TOC entry 3130 (class 2606 OID 17409)
-- Name: delivery_vehicles delivery_vehicles_courier_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.delivery_vehicles
    ADD CONSTRAINT delivery_vehicles_courier_id_fkey FOREIGN KEY (courier_id) REFERENCES public.courier(courier_id);


--
-- TOC entry 3129 (class 2606 OID 17404)
-- Name: delivery_vehicles delivery_vehicles_department_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.delivery_vehicles
    ADD CONSTRAINT delivery_vehicles_department_id_fkey FOREIGN KEY (department_id) REFERENCES public.departments(department_id);


--
-- TOC entry 3118 (class 2606 OID 17319)
-- Name: deliverycompanyemploye deliverycompanyemploye_department_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deliverycompanyemploye
    ADD CONSTRAINT deliverycompanyemploye_department_id_fkey FOREIGN KEY (department_id) REFERENCES public.departments(department_id);


--
-- TOC entry 3119 (class 2606 OID 17324)
-- Name: deliverycompanyemploye deliverycompanyemploye_supervize_emp_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deliverycompanyemploye
    ADD CONSTRAINT deliverycompanyemploye_supervize_emp_id_fkey FOREIGN KEY (supervize_emp_id) REFERENCES public.deliverycompanyemploye(emp_id);


--
-- TOC entry 3117 (class 2606 OID 17459)
-- Name: departments departments_emp_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departments
    ADD CONSTRAINT departments_emp_id_fkey FOREIGN KEY (emp_id) REFERENCES public.deliverycompanyemploye(emp_id);


--
-- TOC entry 3113 (class 2606 OID 17274)
-- Name: e_commercial_branch e_commercial_branch_employee_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.e_commercial_branch
    ADD CONSTRAINT e_commercial_branch_employee_id_fkey FOREIGN KEY (employee_id) REFERENCES public.branchemployee(employee_id);


--
-- TOC entry 3133 (class 2606 OID 17434)
-- Name: is_divided is_divided_department_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.is_divided
    ADD CONSTRAINT is_divided_department_id_fkey FOREIGN KEY (department_id) REFERENCES public.departments(department_id);


--
-- TOC entry 3132 (class 2606 OID 17429)
-- Name: is_divided is_divided_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.is_divided
    ADD CONSTRAINT is_divided_name_fkey FOREIGN KEY (name) REFERENCES public.delivery_companies(name);


--
-- TOC entry 3128 (class 2606 OID 17394)
-- Name: payments payments_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.custemer(customer_id);


--
-- TOC entry 3116 (class 2606 OID 17304)
-- Name: physical_delivery_points_locations physical_delivery_points_locations_address_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.physical_delivery_points_locations
    ADD CONSTRAINT physical_delivery_points_locations_address_id_fkey FOREIGN KEY (address_id) REFERENCES public.address(address_id);


--
-- TOC entry 3115 (class 2606 OID 17299)
-- Name: physical_delivery_points_locations physical_delivery_points_locations_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.physical_delivery_points_locations
    ADD CONSTRAINT physical_delivery_points_locations_name_fkey FOREIGN KEY (name) REFERENCES public.delivery_companies(name);


--
-- TOC entry 3131 (class 2606 OID 17419)
-- Name: position_history position_history_emp_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.position_history
    ADD CONSTRAINT position_history_emp_id_fkey FOREIGN KEY (emp_id) REFERENCES public.deliverycompanyemploye(emp_id);


-- Completed on 2021-12-21 18:29:28 CET

--
-- PostgreSQL database dump complete
--

