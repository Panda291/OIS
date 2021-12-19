
-- *****************************************************************************************************************
-- *** Product and Warehouse Data from Mockeroo, other data I invented myself (to have more interesting queries) ***
-- *****************************************************************************************************************


--
-- PostgreSQL database dump
--

-- Dumped from database version 14.0
-- Dumped by pg_dump version 14.0

-- Started on 2021-11-12 16:09:37

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 209 (class 1259 OID 16521)
-- Name: Delivery; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Delivery" (
    "DeliveryUUID" integer NOT NULL,
    "IsOrder" boolean NOT NULL,
    "DestinationAddress" character varying(64) NOT NULL,
    "DeliveryService" character varying(32) NOT NULL,
    "TransportCosts" real NOT NULL,
    "DepartureTime" timestamp without time zone NOT NULL,
    "ArrivalTime" timestamp without time zone NOT NULL
);


ALTER TABLE public."Delivery" OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 16524)
-- Name: Delivery_DeliveryUUID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Delivery_DeliveryUUID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Delivery_DeliveryUUID_seq" OWNER TO postgres;

--
-- TOC entry 3367 (class 0 OID 0)
-- Dependencies: 210
-- Name: Delivery_DeliveryUUID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Delivery_DeliveryUUID_seq" OWNED BY public."Delivery"."DeliveryUUID";


--
-- TOC entry 211 (class 1259 OID 16525)
-- Name: Delivery_Employee; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Delivery_Employee" (
    "DeliveryUUID" integer NOT NULL,
    "FullName" character varying(64) NOT NULL,
    "HoursWorked" integer NOT NULL
);


ALTER TABLE public."Delivery_Employee" OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 16528)
-- Name: Employee; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Employee" (
    "FullName" character varying(32) NOT NULL,
    "HourlyRate" real NOT NULL,
    "Address" character varying(64)
);


ALTER TABLE public."Employee" OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 16531)
-- Name: Product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Product" (
    "ProductUUID" integer NOT NULL,
    "Price" real NOT NULL,
    "Volume" real NOT NULL,
    "Commision" real DEFAULT 0,
    CONSTRAINT "Product_Commision_check" CHECK ((("Commision" >= (0)::double precision) AND ("Commision" <= (1)::double precision)))
);


ALTER TABLE public."Product" OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 16536)
-- Name: Product_Delivery; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Product_Delivery" (
    "ProductUUID" integer NOT NULL,
    "DeliveryUUID" integer NOT NULL,
    "ProductAmount" integer NOT NULL
);


ALTER TABLE public."Product_Delivery" OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16539)
-- Name: Product_ProductUUID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Product_ProductUUID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Product_ProductUUID_seq" OWNER TO postgres;

--
-- TOC entry 3368 (class 0 OID 0)
-- Dependencies: 215
-- Name: Product_ProductUUID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Product_ProductUUID_seq" OWNED BY public."Product"."ProductUUID";


--
-- TOC entry 216 (class 1259 OID 16540)
-- Name: Product_Warehouse; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Product_Warehouse" (
    "ProductUUID" integer NOT NULL,
    "Address" character varying(64) NOT NULL,
    "ProductStock" integer NOT NULL
);


ALTER TABLE public."Product_Warehouse" OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16543)
-- Name: Warehouse; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Warehouse" (
    "Address" character varying(64) NOT NULL,
    "SpaceLimit" real NOT NULL
);


ALTER TABLE public."Warehouse" OWNER TO postgres;

--
-- TOC entry 3189 (class 2604 OID 16546)
-- Name: Delivery DeliveryUUID; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Delivery" ALTER COLUMN "DeliveryUUID" SET DEFAULT nextval('public."Delivery_DeliveryUUID_seq"'::regclass);


--
-- TOC entry 3191 (class 2604 OID 16547)
-- Name: Product ProductUUID; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Product" ALTER COLUMN "ProductUUID" SET DEFAULT nextval('public."Product_ProductUUID_seq"'::regclass);


--
-- TOC entry 3353 (class 0 OID 16521)
-- Dependencies: 209
-- Data for Name: Delivery; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Delivery" ("DeliveryUUID", "IsOrder", "DestinationAddress", "DeliveryService", "TransportCosts", "DepartureTime", "ArrivalTime") FROM stdin;
1	t	Avenue de la Couronne 27A, Bruxelles, Belgique	Zipit	1.99	2003-01-11 04:06:36	2003-01-11 02:06:36
2	t	Marvel Universe	Teleport	8.99	2009-04-16 04:06:36	2010-01-11 02:02:40
3	f	82755 Troy Pass	Teleport	4.99	2008-04-16 04:06:36	2010-01-11 02:02:40
4	f	82755 Troy Pass	Zipit	3.99	2005-04-30 04:06:36	2006-01-11 02:02:40
\.


--
-- TOC entry 3355 (class 0 OID 16525)
-- Dependencies: 211
-- Data for Name: Delivery_Employee; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Delivery_Employee" ("DeliveryUUID", "FullName", "HoursWorked") FROM stdin;
1	Micki Mouze	2
3	Hillary flinton	5
4	Hillary flinton	3
2	Alexandre DeCrow	12
\.


--
-- TOC entry 3356 (class 0 OID 16528)
-- Dependencies: 212
-- Data for Name: Employee; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Employee" ("FullName", "HourlyRate", "Address") FROM stdin;
Hillary flinton	25.4	82755 Troy Pass
Alexandre DeCrow	16.9	700 Oak Valley Plaza
Micki Mouze	30	8 Russell Court
Bill Cakes	13.3	5134 Fallview Avenue
\.


--
-- TOC entry 3357 (class 0 OID 16531)
-- Dependencies: 213
-- Data for Name: Product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Product" ("ProductUUID", "Price", "Volume", "Commision") FROM stdin;
105	116.9	9.74	0.25
106	113.06	7.27	0.83
107	73.08	0.84	0.01
108	104.47	6.86	0.92
109	144.04	4.73	0.29
110	74.48	6.78	0.26
111	21.77	6.66	0.62
112	176.16	9.91	0.88
113	146.99	0.46	0.41
114	99.45	7.68	0.23
115	69.67	2.7	0.8
116	21.61	8.99	0.95
117	122.44	8.96	0.6
118	49.32	5.85	0.5
119	99.81	9.73	0.51
120	168.08	1.69	0.48
121	5.12	5.18	0.01
122	118.41	2.65	0.01
123	113.42	0.81	0.85
124	151.04	7.97	0.76
125	191.38	7.24	0.99
126	77.09	9.37	0.43
127	149.8	8.33	0.26
128	193.56	9.62	0.27
129	120.9	8.14	0.77
130	5.49	8.44	0.03
131	68.33	7.96	0.66
132	147.49	8.2	0.25
133	152.44	6.81	0.25
134	27.66	9.96	0.73
135	96.92	9.8	0.39
136	22.3	5.03	0.38
137	150.68	4.04	0.53
138	183.71	7.16	0.74
139	192.27	7.27	0.56
140	123.61	9.8	0.02
141	180.24	7.78	0.17
142	1.15	9.5	0.6
143	194.02	6.33	0.18
144	117.45	9.63	0.11
145	34.97	9.41	0.67
146	71.74	5.41	0.55
147	35.53	2.78	0.29
148	46.03	8.89	0.27
149	101	2.86	0.78
150	73.19	4.13	0.48
151	70.73	0.37	0.14
152	119.67	3.02	0.59
153	64.59	5.69	0.01
154	91.24	0.19	0.62
155	66.17	7.24	0.44
156	127.36	2.49	0.02
157	50.17	9.39	0.58
158	141.81	4.03	0.4
159	59.63	1.69	0.66
160	176.66	2.52	0.44
161	154.39	5.64	0.35
162	176.03	5	0.46
163	54.57	8.45	0.82
164	111.23	1.62	0.32
165	34.22	9.84	0.29
166	50.23	1.32	0.88
167	180.91	6.42	0.14
168	95.37	9.87	0.37
169	9.44	7.07	0.19
170	173.28	9.14	0.74
171	180.02	2.64	0.06
172	161.77	4.47	0.15
173	138.07	6.53	1
174	189.4	2.97	0.55
175	22.22	0.81	0.31
176	21.3	2.53	0.85
177	40.78	8.75	0.02
178	139.21	7.41	0.76
179	113.37	6.18	0.03
180	26.85	0.98	0.47
181	125.12	7.08	0.24
182	37.08	0.24	0.38
183	43.37	5.72	0.52
184	134.79	3.07	0.7
185	197.25	7.94	0.68
186	147.37	9.45	0.54
187	189.04	4.42	0.18
188	78.17	3.93	0.7
189	193.52	9.58	0.94
190	10.13	8.25	0.55
191	76.33	6.43	0.73
192	170.39	4.65	0.19
193	158.63	5.53	0.95
194	11.25	5.93	0.57
195	31.52	9.34	0.28
196	30.58	7.95	0.05
197	111.73	8.01	0.92
198	108.75	3.91	0.42
199	36.06	8.44	0.26
200	166.98	5.75	0.41
201	120.68	3.7	0.61
202	176.37	3.31	0.67
203	142.98	9.53	0.23
204	155.55	9.84	0.95
\.


--
-- TOC entry 3358 (class 0 OID 16536)
-- Dependencies: 214
-- Data for Name: Product_Delivery; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Product_Delivery" ("ProductUUID", "DeliveryUUID", "ProductAmount") FROM stdin;
150	3	2
183	1	1
122	2	32
148	4	8
148	3	5
150	2	6
\.


--
-- TOC entry 3360 (class 0 OID 16540)
-- Dependencies: 216
-- Data for Name: Product_Warehouse; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Product_Warehouse" ("ProductUUID", "Address", "ProductStock") FROM stdin;
150	82755 Troy Pass	10
183	700 Oak Valley Plaza	4
122	8 Russell Court	264
148	5134 Fallview Avenue	0
\.


--
-- TOC entry 3361 (class 0 OID 16543)
-- Dependencies: 217
-- Data for Name: Warehouse; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Warehouse" ("Address", "SpaceLimit") FROM stdin;
00601 Nancy Point	664160.94
700 Oak Valley Plaza	491618.22
4 Kingsford Avenue	406722.97
89919 Jackson Street	239422.28
3 Sunbrook Terrace	101077.83
8 Russell Court	279763.34
6 Dayton Drive	190415.14
435 Roth Place	185040.25
63380 Anderson Street	124153.13
1589 Northridge Pass	585112.2
07169 Hintze Pass	286053.44
5134 Fallview Avenue	880164.6
3073 Ludington Alley	334160.28
032 Vernon Junction	195655.52
82755 Troy Pass	608078.75
5 Michigan Hill	39095.58
\.


--
-- TOC entry 3369 (class 0 OID 0)
-- Dependencies: 210
-- Name: Delivery_DeliveryUUID_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Delivery_DeliveryUUID_seq"', 4, true);


--
-- TOC entry 3370 (class 0 OID 0)
-- Dependencies: 215
-- Name: Product_ProductUUID_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Product_ProductUUID_seq"', 204, true);


--
-- TOC entry 3196 (class 2606 OID 16549)
-- Name: Delivery_Employee Delivery_Employee_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Delivery_Employee"
    ADD CONSTRAINT "Delivery_Employee_pkey" PRIMARY KEY ("DeliveryUUID", "FullName");


--
-- TOC entry 3194 (class 2606 OID 16551)
-- Name: Delivery Delivery_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Delivery"
    ADD CONSTRAINT "Delivery_pkey" PRIMARY KEY ("DeliveryUUID");


--
-- TOC entry 3198 (class 2606 OID 16553)
-- Name: Employee Employee_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Employee"
    ADD CONSTRAINT "Employee_pkey" PRIMARY KEY ("FullName");


--
-- TOC entry 3202 (class 2606 OID 16555)
-- Name: Product_Delivery Product_Delivery_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Product_Delivery"
    ADD CONSTRAINT "Product_Delivery_pkey" PRIMARY KEY ("ProductUUID", "DeliveryUUID");


--
-- TOC entry 3204 (class 2606 OID 16557)
-- Name: Product_Warehouse Product_Warehouse_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Product_Warehouse"
    ADD CONSTRAINT "Product_Warehouse_pkey" PRIMARY KEY ("ProductUUID", "Address");


--
-- TOC entry 3200 (class 2606 OID 16559)
-- Name: Product Product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Product"
    ADD CONSTRAINT "Product_pkey" PRIMARY KEY ("ProductUUID");


--
-- TOC entry 3206 (class 2606 OID 16561)
-- Name: Warehouse Warehouse_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Warehouse"
    ADD CONSTRAINT "Warehouse_pkey" PRIMARY KEY ("Address");


--
-- TOC entry 3207 (class 2606 OID 16562)
-- Name: Delivery_Employee Delivery_Employee_DeliveryUUID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Delivery_Employee"
    ADD CONSTRAINT "Delivery_Employee_DeliveryUUID_fkey" FOREIGN KEY ("DeliveryUUID") REFERENCES public."Delivery"("DeliveryUUID") MATCH FULL ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 3208 (class 2606 OID 16567)
-- Name: Delivery_Employee Delivery_Employee_FullName_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Delivery_Employee"
    ADD CONSTRAINT "Delivery_Employee_FullName_fkey" FOREIGN KEY ("FullName") REFERENCES public."Employee"("FullName") MATCH FULL ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 3210 (class 2606 OID 16572)
-- Name: Product_Delivery Product_Delivery_DeliveryUUID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Product_Delivery"
    ADD CONSTRAINT "Product_Delivery_DeliveryUUID_fkey" FOREIGN KEY ("DeliveryUUID") REFERENCES public."Delivery"("DeliveryUUID") ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 3211 (class 2606 OID 16577)
-- Name: Product_Delivery Product_Delivery_ProductUUID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Product_Delivery"
    ADD CONSTRAINT "Product_Delivery_ProductUUID_fkey" FOREIGN KEY ("ProductUUID") REFERENCES public."Product"("ProductUUID");


--
-- TOC entry 3212 (class 2606 OID 16582)
-- Name: Product_Warehouse Product_Warehouse_Address_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Product_Warehouse"
    ADD CONSTRAINT "Product_Warehouse_Address_fkey" FOREIGN KEY ("Address") REFERENCES public."Warehouse"("Address") MATCH FULL ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 3213 (class 2606 OID 16587)
-- Name: Product_Warehouse Product_Warehouse_ProductUUID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Product_Warehouse"
    ADD CONSTRAINT "Product_Warehouse_ProductUUID_fkey" FOREIGN KEY ("ProductUUID") REFERENCES public."Product"("ProductUUID") MATCH FULL ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 3209 (class 2606 OID 16592)
-- Name: Employee WorksAt; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Employee"
    ADD CONSTRAINT "WorksAt" FOREIGN KEY ("Address") REFERENCES public."Warehouse"("Address") MATCH FULL ON UPDATE CASCADE ON DELETE RESTRICT;


-- Completed on 2021-11-12 16:09:37

--
-- PostgreSQL database dump complete
--

