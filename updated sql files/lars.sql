--
-- PostgreSQL database dump
--

-- Dumped from database version 13.5 (Ubuntu 13.5-1.pgdg21.04+1)
-- Dumped by pg_dump version 13.5 (Ubuntu 13.5-1.pgdg21.04+1)

-- Started on 2021-12-21 18:28:07 CET

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
-- TOC entry 200 (class 1259 OID 17006)
-- Name: Loyalty Card; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Loyalty Card" (
    card_id integer NOT NULL,
    order_counter integer,
    user_id_fkey integer,
    supplier_id_fkey integer
);


ALTER TABLE public."Loyalty Card" OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 17009)
-- Name: Order; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Order" (
    order_id integer NOT NULL,
    total_price real
);


ALTER TABLE public."Order" OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 17012)
-- Name: Product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Product" (
    product_id integer NOT NULL,
    name character varying(128)
);


ALTER TABLE public."Product" OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 17015)
-- Name: Rating; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Rating" (
    text character varying(1024),
    rating integer,
    user_id_fkey integer,
    supplier_id_fkey integer,
    rating_id integer NOT NULL
);


ALTER TABLE public."Rating" OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 17021)
-- Name: Supplier; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Supplier" (
    email character varying(64),
    supplier_id integer NOT NULL,
    name character varying(64),
    phone character(15)
);


ALTER TABLE public."Supplier" OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 17024)
-- Name: User; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."User" (
    user_id integer NOT NULL,
    email character varying(64),
    address character varying(128)
);


ALTER TABLE public."User" OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 17027)
-- Name: ordercontainsproduct; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ordercontainsproduct (
    product_id_fkey integer NOT NULL,
    order_id_fkey integer NOT NULL
);


ALTER TABLE public.ordercontainsproduct OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 17030)
-- Name: supplies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.supplies (
    supplier_id_fkey integer NOT NULL,
    product_id_fkey integer NOT NULL,
    price real
);


ALTER TABLE public.supplies OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 17033)
-- Name: userPlacesOrder; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."userPlacesOrder" (
    user_id_fkey integer NOT NULL,
    order_id_fkey integer NOT NULL
);


ALTER TABLE public."userPlacesOrder" OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 17036)
-- Name: userReturnsOrder; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."userReturnsOrder" (
    user_id_fkey integer NOT NULL,
    order_id_fkey integer NOT NULL,
    reason character varying(256)
);


ALTER TABLE public."userReturnsOrder" OWNER TO postgres;

--
-- TOC entry 3210 (class 0 OID 17006)
-- Dependencies: 200
-- Data for Name: Loyalty Card; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Loyalty Card" (card_id, order_counter, user_id_fkey, supplier_id_fkey) FROM stdin;
1	7	23	9
2	8	13	5
3	2	7	6
4	3	15	7
5	0	26	1
6	5	30	5
7	10	18	5
8	9	1	5
9	2	13	1
10	5	13	10
11	0	29	10
12	6	6	6
13	3	24	10
14	1	14	9
15	3	17	9
\.


--
-- TOC entry 3211 (class 0 OID 17009)
-- Dependencies: 201
-- Data for Name: Order; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Order" (order_id, total_price) FROM stdin;
1	806.51
2	514.86
3	446.7
4	377.7
5	414.7
6	986.56
7	971.64
8	447.3
9	992.09
10	31
11	62.62
12	19.21
13	468.52
14	873.32
15	317.54
16	317.01
17	173.5
18	780.5
19	200.35
20	814.19
21	851.95
22	147.3
23	793.83
24	154.56
25	58.45
26	50.54
27	1.4
28	190.98
29	151.43
30	803.12
31	478.89
32	817.66
33	340.15
34	412.55
35	603.7
36	564.03
37	391.21
38	706.13
39	198.37
40	620.47
\.


--
-- TOC entry 3212 (class 0 OID 17012)
-- Dependencies: 202
-- Data for Name: Product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Product" (product_id, name) FROM stdin;
1	Firefly
2	Explorer Sport Trac
3	Chariot
4	Fiesta
5	Suburban 1500
6	Grand Caravan
7	Sedona
8	Jetta
9	Santa Fe
10	Celica
11	Dakota
12	Laser
13	80
14	Mark VIII
15	Sierra 3500
16	Esteem
17	Montero
18	New Beetle
19	Expedition
20	Escalade ESV
21	Body Canon 7D Mark II
22	Red dress with flowers
\.


--
-- TOC entry 3213 (class 0 OID 17015)
-- Dependencies: 203
-- Data for Name: Rating; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Rating" (text, rating, user_id_fkey, supplier_id_fkey, rating_id) FROM stdin;
a nibh in quis justo maecenas rhoncus aliquam lacus morbi quis tortor id nulla ultrices aliquet maecenas leo odio condimentum id luctus nec	1	2	1	1
gravida sem praesent id massa id nisl venenatis lacinia aenean sit amet justo morbi ut odio cras mi pede malesuada in imperdiet et commodo vulputate justo in blandit ultrices enim lorem ipsum dolor sit amet consectetuer adipiscing elit proin	5	21	3	2
lorem integer tincidunt ante vel ipsum praesent blandit lacinia erat vestibulum sed magna at nunc commodo placerat praesent blandit nam nulla integer pede justo lacinia eget tincidunt eget tempus vel pede morbi porttitor lorem id ligula suspendisse ornare consequat lectus in est risus auctor sed tristique in tempus sit amet sem fusce consequat nulla nisl nunc nisl duis bibendum felis sed interdum venenatis turpis enim blandit mi	3	2	9	3
nulla suspendisse potenti cras in purus eu magna vulputate luctus cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus vivamus vestibulum sagittis sapien cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus etiam vel augue vestibulum rutrum rutrum neque	2	21	8	4
nam nulla integer pede justo lacinia eget tincidunt eget tempus vel pede morbi porttitor lorem id ligula suspendisse ornare consequat lectus in est risus auctor sed tristique	1	3	5	5
et ultrices posuere cubilia curae mauris viverra diam vitae quam suspendisse potenti nullam porttitor lacus at turpis donec posuere metus	4	25	3	6
mauris viverra diam vitae quam suspendisse potenti nullam porttitor lacus at turpis donec posuere metus vitae ipsum aliquam non mauris morbi	0	25	3	7
\.


--
-- TOC entry 3214 (class 0 OID 17021)
-- Dependencies: 204
-- Data for Name: Supplier; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Supplier" (email, supplier_id, name, phone) FROM stdin;
sbritzius0@webs.com	1	Lazz	137 539 3295   
pboam1@geocities.com	2	Quaxo	227 439 1998   
eisakovic2@ftc.gov	3	Buzzdog	679 603 5378   
lmettericke3@mit.edu	4	Voonder	857 682 0798   
fpedrocchi4@ucoz.com	5	Feedbug	651 102 8936   
oeidelman5@netvibes.com	6	Dabjam	911 930 4253   
shiscoe6@uiuc.edu	7	Roomm	891 811 4706   
acottel7@soundcloud.com	8	Tagopia	557 492 9293   
lsharland8@soup.io	9	Abatz	278 299 9180   
ltunney9@about.me	10	Topicstorm	414 512 2191   
\.


--
-- TOC entry 3215 (class 0 OID 17024)
-- Dependencies: 205
-- Data for Name: User; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."User" (user_id, email, address) FROM stdin;
1	qwyper0@facebook.com	4769 Morrow Lane
2	rblues1@t.co	3 Orin Way
3	fsnoad2@earthlink.net	5 Bartillon Court
4	egason3@cdbaby.com	91 Raven Hill
5	rlyford4@issuu.com	061 Kipling Avenue
6	hvanyatin5@slate.com	211 Hansons Road
7	vmeaton6@utexas.edu	8547 Lighthouse Bay Street
8	rsmallman7@elegantthemes.com	9 Blue Bill Park Terrace
9	sandretti8@de.vu	18995 Ronald Regan Pass
10	lbirdis9@si.edu	48 Emmet Street
11	rcattona@apple.com	198 Golf Crossing
12	jbartolomeob@bing.com	25 Oriole Terrace
13	ckilshawc@mapy.cz	8800 Jana Place
14	brandd@ibm.com	29945 Jackson Court
15	rmcdermottrowe@harvard.edu	87075 Grayhawk Park
16	lhollowsf@clickbank.net	52 Almo Point
17	ltuser_ideswellg@sogou.com	6 Westport Point
18	bpavierh@tripod.com	063 Acker Place
19	bsherrelli@epa.gov	1 Scott Court
20	tsheftonj@nps.gov	52 Roxbury Court
21	opowellk@ed.gov	972 Hoffman Alley
22	theeranl@com.com	08222 Ilene Trail
23	gaxtellm@princeton.edu	8399 Chinook Court
24	eflattmann@yale.edu	2 Summerview Junction
25	agrealyo@sbwire.com	4 Summerview Circle
26	lqualtrop@1688.com	3 Red Cloud Crossing
27	lambrogelliq@wiley.com	15139 Logan Plaza
28	jcunnellr@oakley.com	7 Westport Drive
29	taiskovitchs@t.co	25870 Heath Avenue
30	gsealovet@stanford.edu	43717 Scoville Court
5000000	test@test.test	nowhere
31	christophe@example.com	somewhere 5
32	nastya@example.com	somewhere 4
33	lars@example.com	somewhere 3
34	xhulio@example.com	somewhere 2
35	thomas@example.com	somewhere 1
\.


--
-- TOC entry 3216 (class 0 OID 17027)
-- Dependencies: 206
-- Data for Name: ordercontainsproduct; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ordercontainsproduct (product_id_fkey, order_id_fkey) FROM stdin;
11	21
15	32
12	7
8	8
9	4
14	11
19	6
14	17
7	14
8	10
16	31
1	7
5	2
8	2
15	15
12	40
3	7
12	21
11	23
6	14
8	1
15	16
8	25
13	33
2	24
\.


--
-- TOC entry 3217 (class 0 OID 17030)
-- Dependencies: 207
-- Data for Name: supplies; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.supplies (supplier_id_fkey, product_id_fkey, price) FROM stdin;
5	6	42.66
6	19	344.35
5	13	332.7
3	4	316.75
2	14	253.77
10	11	208.7
8	17	191.29
9	1	247.91
3	20	20
9	16	151.1
1	10	29.14
5	3	102.05
2	16	331.45
5	7	269.98
3	17	299.93
2	11	191.13
9	3	150.23
8	10	113.45
10	13	186.75
2	18	281.6
\.


--
-- TOC entry 3218 (class 0 OID 17033)
-- Dependencies: 208
-- Data for Name: userPlacesOrder; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."userPlacesOrder" (user_id_fkey, order_id_fkey) FROM stdin;
5	3
4	24
22	12
15	26
28	38
11	31
16	7
2	17
1	40
15	19
29	18
10	31
27	29
23	10
16	19
2	10
7	36
11	23
28	10
7	40
27	33
17	31
29	32
1	5
15	29
\.


--
-- TOC entry 3219 (class 0 OID 17036)
-- Dependencies: 209
-- Data for Name: userReturnsOrder; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."userReturnsOrder" (user_id_fkey, order_id_fkey, reason) FROM stdin;
7	36	libero nam dui proin leo odio porttitor id consequat in
15	19	a feugiat et eros vestibulum ac est
1	5	nulla integer pede justo lacinia
7	40	vulputate justo in blandit ultrices enim lorem ipsum dolor
5	3	amet eleifend pede libero quis orci nullam molestie nibh in
\.


--
-- TOC entry 3049 (class 2606 OID 17040)
-- Name: Loyalty Card Loyality Card_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Loyalty Card"
    ADD CONSTRAINT "Loyality Card_pkey" PRIMARY KEY (card_id);


--
-- TOC entry 3051 (class 2606 OID 17042)
-- Name: Order Order_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Order"
    ADD CONSTRAINT "Order_pkey" PRIMARY KEY (order_id);


--
-- TOC entry 3053 (class 2606 OID 17044)
-- Name: Product Product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Product"
    ADD CONSTRAINT "Product_pkey" PRIMARY KEY (product_id);


--
-- TOC entry 3055 (class 2606 OID 17046)
-- Name: Rating Rating_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Rating"
    ADD CONSTRAINT "Rating_pkey" PRIMARY KEY (rating_id);


--
-- TOC entry 3057 (class 2606 OID 17048)
-- Name: Supplier Supplier_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Supplier"
    ADD CONSTRAINT "Supplier_pkey" PRIMARY KEY (supplier_id);


--
-- TOC entry 3059 (class 2606 OID 17050)
-- Name: User User_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_pkey" PRIMARY KEY (user_id);


--
-- TOC entry 3061 (class 2606 OID 17052)
-- Name: ordercontainsproduct contains_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ordercontainsproduct
    ADD CONSTRAINT contains_pkey PRIMARY KEY (product_id_fkey, order_id_fkey);


--
-- TOC entry 3063 (class 2606 OID 17054)
-- Name: supplies supplies_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.supplies
    ADD CONSTRAINT supplies_pkey PRIMARY KEY (supplier_id_fkey, product_id_fkey);


--
-- TOC entry 3065 (class 2606 OID 17056)
-- Name: userPlacesOrder userPlacesOrder_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."userPlacesOrder"
    ADD CONSTRAINT "userPlacesOrder_pkey" PRIMARY KEY (user_id_fkey, order_id_fkey);


--
-- TOC entry 3067 (class 2606 OID 17058)
-- Name: userReturnsOrder userReturnsOrder_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."userReturnsOrder"
    ADD CONSTRAINT "userReturnsOrder_pkey" PRIMARY KEY (user_id_fkey, order_id_fkey);


--
-- TOC entry 3072 (class 2606 OID 17059)
-- Name: ordercontainsproduct order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ordercontainsproduct
    ADD CONSTRAINT order_id_fkey FOREIGN KEY (order_id_fkey) REFERENCES public."Order"(order_id);


--
-- TOC entry 3076 (class 2606 OID 17064)
-- Name: userPlacesOrder order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."userPlacesOrder"
    ADD CONSTRAINT order_id_fkey FOREIGN KEY (order_id_fkey) REFERENCES public."Order"(order_id);


--
-- TOC entry 3078 (class 2606 OID 17069)
-- Name: userReturnsOrder order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."userReturnsOrder"
    ADD CONSTRAINT order_id_fkey FOREIGN KEY (order_id_fkey) REFERENCES public."Order"(order_id);


--
-- TOC entry 3074 (class 2606 OID 17074)
-- Name: supplies product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.supplies
    ADD CONSTRAINT product_id_fkey FOREIGN KEY (product_id_fkey) REFERENCES public."Product"(product_id) NOT VALID;


--
-- TOC entry 3073 (class 2606 OID 17079)
-- Name: ordercontainsproduct product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ordercontainsproduct
    ADD CONSTRAINT product_id_fkey FOREIGN KEY (product_id_fkey) REFERENCES public."Product"(product_id);


--
-- TOC entry 3070 (class 2606 OID 17084)
-- Name: Rating supplier_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Rating"
    ADD CONSTRAINT supplier_id_fkey FOREIGN KEY (supplier_id_fkey) REFERENCES public."Supplier"(supplier_id) NOT VALID;


--
-- TOC entry 3075 (class 2606 OID 17089)
-- Name: supplies supplier_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.supplies
    ADD CONSTRAINT supplier_id_fkey FOREIGN KEY (supplier_id_fkey) REFERENCES public."Supplier"(supplier_id) NOT VALID;


--
-- TOC entry 3068 (class 2606 OID 17094)
-- Name: Loyalty Card supplier_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Loyalty Card"
    ADD CONSTRAINT supplier_id_fkey FOREIGN KEY (supplier_id_fkey) REFERENCES public."Supplier"(supplier_id) NOT VALID;


--
-- TOC entry 3071 (class 2606 OID 17099)
-- Name: Rating user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Rating"
    ADD CONSTRAINT user_id_fkey FOREIGN KEY (user_id_fkey) REFERENCES public."User"(user_id) NOT VALID;


--
-- TOC entry 3077 (class 2606 OID 17104)
-- Name: userPlacesOrder user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."userPlacesOrder"
    ADD CONSTRAINT user_id_fkey FOREIGN KEY (user_id_fkey) REFERENCES public."User"(user_id);


--
-- TOC entry 3079 (class 2606 OID 17109)
-- Name: userReturnsOrder user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."userReturnsOrder"
    ADD CONSTRAINT user_id_fkey FOREIGN KEY (user_id_fkey) REFERENCES public."User"(user_id);


--
-- TOC entry 3069 (class 2606 OID 17114)
-- Name: Loyalty Card user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Loyalty Card"
    ADD CONSTRAINT user_id_fkey FOREIGN KEY (user_id_fkey) REFERENCES public."User"(user_id) NOT VALID;


-- Completed on 2021-12-21 18:28:07 CET

--
-- PostgreSQL database dump complete
--

