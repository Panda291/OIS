--
-- PostgreSQL database dump
--

-- Dumped from database version 13.5 (Ubuntu 13.5-1.pgdg21.04+1)
-- Dumped by pg_dump version 13.5 (Ubuntu 13.5-1.pgdg21.04+1)

-- Started on 2021-12-21 18:28:39 CET

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
-- TOC entry 200 (class 1259 OID 17119)
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categories (
    cat_name character varying NOT NULL
);


ALTER TABLE public.categories OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 17125)
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    prod_id uuid NOT NULL,
    prod_name character varying,
    price double precision,
    brand character varying,
    description character varying,
    fk_subcategory character varying
);


ALTER TABLE public.products OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 17131)
-- Name: reviews; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reviews (
    review_id uuid NOT NULL,
    username character varying,
    num_stars real,
    text character varying,
    title character varying,
    deleted boolean,
    "timestamp" timestamp with time zone,
    fk_product uuid
);


ALTER TABLE public.reviews OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 17137)
-- Name: stock_warehouses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.stock_warehouses (
    fk_product_id uuid NOT NULL,
    quantity integer
);


ALTER TABLE public.stock_warehouses OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 17140)
-- Name: subcategories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.subcategories (
    subcat_name character varying NOT NULL,
    fk_category character varying
);


ALTER TABLE public.subcategories OWNER TO postgres;

--
-- TOC entry 3175 (class 0 OID 17119)
-- Dependencies: 200
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categories (cat_name) FROM stdin;
Warehouse
Clothing, shoes and jewelry
Electronics
Living and kitchen
\.


--
-- TOC entry 3176 (class 0 OID 17125)
-- Dependencies: 201
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (prod_id, prod_name, price, brand, description, fk_subcategory) FROM stdin;
068b36bc-9fbf-4e9d-9ce6-c5ade20ecfd5	Apples (1kg)	3	't Boertje	On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail 	Fruit
36b56090-967c-40e2-8bc2-69ca09ab75cf	Body Canon 7D Mark II	1389	Canon	Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit	Cameras
698f7a8d-20f6-4c53-9e63-9a8db683ef39	Body Canon 77D Mark I	600	Canon	Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?	Cameras
6a065e3f-7c90-4469-8ade-f028b3582384	Body Nikon 7N	899	Nikon	velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.	Cameras
a7380cd6-b6df-4a22-875f-a9c2b1d01aaf	Hazelnut bread	2.4	Kruidvat	quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? 	Bread
e071343b-6c11-4c7c-91b0-494c6d6bef9b	Body Canon 5D Mark III	1600	Canon	git, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure 	Cameras
7e6888d8-01de-4a25-8638-6b7b9b3d518c	Black jeans for women	45	H&M	At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident,	Women clothes
809fcfb0-adc7-4540-bcc9-0cf75e5f160e	Red dress with flowers	23	Zara	cause it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical 	Women clothes
aaaa3950-f8fa-47da-97a5-a12bfff2ff45	Apple pencil tops (4 pieces)	2	Chinez	perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut	Attributes
7714c190-1414-4739-b9e9-00b35c526279	Apple pencil	130	Apple	Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum	Attributes
\.


--
-- TOC entry 3177 (class 0 OID 17131)
-- Dependencies: 202
-- Data for Name: reviews; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reviews (review_id, username, num_stars, text, title, deleted, "timestamp", fk_product) FROM stdin;
05b44c81-dc3e-48c3-b828-69c920da15e0	Lucas	5	Apple for life	Apple is love, apple is life <3	f	2021-11-04 22:30:30.860602+01	7714c190-1414-4739-b9e9-00b35c526279
27507e9f-ee58-41a7-a87f-90f3c58b2ad0	Mattheo	4	Perfect Camera!	Camera excellent	f	2021-09-19 22:37:30.860602+02	36b56090-967c-40e2-8bc2-69ca09ab75cf
f199a710-2f08-462f-8945-f55f53dfc44b	Fangipano	1	Not fresh	Fruit is not fresh and soft	f	2021-10-08 20:37:30.860602+02	068b36bc-9fbf-4e9d-9ce6-c5ade20ecfd5
4d85bf84-7bda-4fdf-adb9-0220dd29ac7a	Marie	3	Nice body! But cannot film in 4k	Ok.	t	2021-11-12 21:37:30.860602+01	36b56090-967c-40e2-8bc2-69ca09ab75cf
6f6fa7be-e733-41ce-9b77-153aa1d7c2fc	Marie	2	Bad quality	Fucking bad quality.	t	2021-10-08 20:37:30.860602+02	aaaa3950-f8fa-47da-97a5-a12bfff2ff45
54b90e56-ce10-4c72-87b9-4505e395f273	Theo	5	Nice smell	Good product!	f	2021-11-04 22:30:30.860602+01	068b36bc-9fbf-4e9d-9ce6-c5ade20ecfd5
54b90e56-ce10-4c72-87b9-4505e395f274	Christophe Van den Eede	5	fits perfectly, very beautiful	pretty dress	f	2021-12-20 00:00:00+01	809fcfb0-adc7-4540-bcc9-0cf75e5f160e
54b90e56-ce10-4c72-87b9-4505e395f275	Thomas Koelman	0	horrible product, doesnt even work	bad	f	2021-11-15 00:00:00+01	7714c190-1414-4739-b9e9-00b35c526279
\.


--
-- TOC entry 3178 (class 0 OID 17137)
-- Dependencies: 203
-- Data for Name: stock_warehouses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.stock_warehouses (fk_product_id, quantity) FROM stdin;
068b36bc-9fbf-4e9d-9ce6-c5ade20ecfd5	5
36b56090-967c-40e2-8bc2-69ca09ab75cf	30
698f7a8d-20f6-4c53-9e63-9a8db683ef39	89
6a065e3f-7c90-4469-8ade-f028b3582384	73
7714c190-1414-4739-b9e9-00b35c526279	20
7e6888d8-01de-4a25-8638-6b7b9b3d518c	83
809fcfb0-adc7-4540-bcc9-0cf75e5f160e	28
a7380cd6-b6df-4a22-875f-a9c2b1d01aaf	74
aaaa3950-f8fa-47da-97a5-a12bfff2ff45	8
e071343b-6c11-4c7c-91b0-494c6d6bef9b	24
\.


--
-- TOC entry 3179 (class 0 OID 17140)
-- Dependencies: 204
-- Data for Name: subcategories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.subcategories (subcat_name, fk_category) FROM stdin;
Bread	Warehouse
Fruit	Warehouse
Vegetables	Warehouse
Man clothing	Clothing, shoes and jewelry
Women clothes	Clothing, shoes and jewelry
Cameras	Electronics
Printers	Electronics
\.


--
-- TOC entry 3032 (class 2606 OID 17147)
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (cat_name);


--
-- TOC entry 3034 (class 2606 OID 17149)
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (prod_id);


--
-- TOC entry 3036 (class 2606 OID 17151)
-- Name: reviews review_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT review_pkey PRIMARY KEY (review_id);


--
-- TOC entry 3038 (class 2606 OID 17153)
-- Name: stock_warehouses stock_warehouses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock_warehouses
    ADD CONSTRAINT stock_warehouses_pkey PRIMARY KEY (fk_product_id);


--
-- TOC entry 3040 (class 2606 OID 17155)
-- Name: subcategories subcategories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subcategories
    ADD CONSTRAINT subcategories_pkey PRIMARY KEY (subcat_name);


--
-- TOC entry 3044 (class 2606 OID 17156)
-- Name: subcategories fk_category; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subcategories
    ADD CONSTRAINT fk_category FOREIGN KEY (fk_category) REFERENCES public.categories(cat_name) NOT VALID;


--
-- TOC entry 3042 (class 2606 OID 17161)
-- Name: reviews fk_product; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT fk_product FOREIGN KEY (fk_product) REFERENCES public.products(prod_id) NOT VALID;


--
-- TOC entry 3043 (class 2606 OID 17166)
-- Name: stock_warehouses fk_product_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock_warehouses
    ADD CONSTRAINT fk_product_id FOREIGN KEY (fk_product_id) REFERENCES public.products(prod_id) NOT VALID;


--
-- TOC entry 3041 (class 2606 OID 17171)
-- Name: products fk_subcategory; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT fk_subcategory FOREIGN KEY (fk_subcategory) REFERENCES public.subcategories(subcat_name) NOT VALID;


-- Completed on 2021-12-21 18:28:39 CET

--
-- PostgreSQL database dump complete
--

