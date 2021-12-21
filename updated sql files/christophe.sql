--
-- PostgreSQL database dump
--

-- Dumped from database version 13.5 (Ubuntu 13.5-1.pgdg21.04+1)
-- Dumped by pg_dump version 13.5 (Ubuntu 13.5-1.pgdg21.04+1)

-- Started on 2021-12-21 18:27:50 CET

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
-- TOC entry 200 (class 1259 OID 16944)
-- Name: customers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customers (
    email character varying(255) NOT NULL,
    "phone number" character varying(255) NOT NULL,
    "full name" character varying(255) NOT NULL
);


ALTER TABLE public.customers OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 16950)
-- Name: delivery_methods; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.delivery_methods (
    id bigint NOT NULL,
    priority integer NOT NULL,
    "delivery type" character varying(255) NOT NULL,
    address character varying(255),
    customer_id character varying(255) NOT NULL,
    pickup_location character varying(255)
);


ALTER TABLE public.delivery_methods OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 16956)
-- Name: delivery_methods_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.delivery_methods_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.delivery_methods_id_seq OWNER TO postgres;

--
-- TOC entry 3189 (class 0 OID 0)
-- Dependencies: 202
-- Name: delivery_methods_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.delivery_methods_id_seq OWNED BY public.delivery_methods.id;


--
-- TOC entry 203 (class 1259 OID 16958)
-- Name: order_products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_products (
    "order" bigint NOT NULL,
    products character varying(36)
);


ALTER TABLE public.order_products OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 16963)
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id bigint NOT NULL,
    date timestamp(0) without time zone NOT NULL,
    "total price" double precision NOT NULL,
    delivery_method_id bigint NOT NULL
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 16966)
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_id_seq OWNER TO postgres;

--
-- TOC entry 3190 (class 0 OID 0)
-- Dependencies: 205
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- TOC entry 206 (class 1259 OID 16968)
-- Name: pickup_locations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pickup_locations (
    address character varying(255) NOT NULL
);


ALTER TABLE public.pickup_locations OWNER TO postgres;

--
-- TOC entry 3033 (class 2604 OID 16971)
-- Name: delivery_methods id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.delivery_methods ALTER COLUMN id SET DEFAULT nextval('public.delivery_methods_id_seq'::regclass);


--
-- TOC entry 3034 (class 2604 OID 16973)
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- TOC entry 3177 (class 0 OID 16944)
-- Dependencies: 200
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customers (email, "phone number", "full name") FROM stdin;
christophe@example.com	+32 400000001	Christophe Van den Eede
nastya@example.com	+32 400000002	Anastasia Nastya Krouglova
thomas@example.com	+32 400000003	Thomas Koelman
xhulio@example.com	+32 400000004	Xhulio Isufi
lars@example.com	+32 400000005	Lars Palinckx
\.


--
-- TOC entry 3178 (class 0 OID 16950)
-- Dependencies: 201
-- Data for Name: delivery_methods; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.delivery_methods (id, priority, "delivery type", address, customer_id, pickup_location) FROM stdin;
401	2	pick up	\N	christophe@example.com	example street 1, Brussel
402	1	mail to location	my street 0, Kontich	christophe@example.com	\N
403	1	mail to location	that one street 21, some place	nastya@example.com	\N
404	2	pick up	\N	nastya@example.com	other street 53, Antwerp
405	1	pick up	\N	thomas@example.com	example street 1, Brussel
\.


--
-- TOC entry 3180 (class 0 OID 16958)
-- Dependencies: 203
-- Data for Name: order_products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_products ("order", products) FROM stdin;
10002	809fcfb0-adc7-4540-bcc9-0cf75e5f160e
10003	a7380cd6-b6df-4a22-875f-a9c2b1d01aaf
10002	a7380cd6-b6df-4a22-875f-a9c2b1d01aaf
10003	e071343b-6c11-4c7c-91b0-494c6d6bef9b
\.


--
-- TOC entry 3181 (class 0 OID 16963)
-- Dependencies: 204
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (id, date, "total price", delivery_method_id) FROM stdin;
10002	2021-12-19 00:00:00	23.99	401
10003	2021-12-18 00:00:00	9.99	404
\.


--
-- TOC entry 3183 (class 0 OID 16968)
-- Dependencies: 206
-- Data for Name: pickup_locations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pickup_locations (address) FROM stdin;
example street 1, Brussel
other street 53, Antwerp
\.


--
-- TOC entry 3191 (class 0 OID 0)
-- Dependencies: 202
-- Name: delivery_methods_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.delivery_methods_id_seq', 405, true);


--
-- TOC entry 3192 (class 0 OID 0)
-- Dependencies: 205
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_id_seq', 10003, true);


--
-- TOC entry 3036 (class 2606 OID 16975)
-- Name: customers customers_email_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_email_unique UNIQUE (email);


--
-- TOC entry 3038 (class 2606 OID 16977)
-- Name: delivery_methods delivery_methods_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.delivery_methods
    ADD CONSTRAINT delivery_methods_pkey PRIMARY KEY (id);


--
-- TOC entry 3040 (class 2606 OID 16979)
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- TOC entry 3042 (class 2606 OID 16981)
-- Name: pickup_locations pickup_locations_address_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pickup_locations
    ADD CONSTRAINT pickup_locations_address_unique UNIQUE (address);


--
-- TOC entry 3043 (class 2606 OID 16982)
-- Name: delivery_methods delivery_methods_customer_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.delivery_methods
    ADD CONSTRAINT delivery_methods_customer_id_foreign FOREIGN KEY (customer_id) REFERENCES public.customers(email);


--
-- TOC entry 3044 (class 2606 OID 16987)
-- Name: delivery_methods delivery_methods_pickup_location_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.delivery_methods
    ADD CONSTRAINT delivery_methods_pickup_location_foreign FOREIGN KEY (pickup_location) REFERENCES public.pickup_locations(address);


--
-- TOC entry 3045 (class 2606 OID 16992)
-- Name: order_products order_products_order_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_products
    ADD CONSTRAINT order_products_order_foreign FOREIGN KEY ("order") REFERENCES public.orders(id);


--
-- TOC entry 3046 (class 2606 OID 16997)
-- Name: orders orders_delivery_method_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_delivery_method_id_foreign FOREIGN KEY (delivery_method_id) REFERENCES public.delivery_methods(id);


-- Completed on 2021-12-21 18:27:50 CET

--
-- PostgreSQL database dump complete
--

