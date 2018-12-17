--
-- PostgreSQL database dump
--

-- Dumped from database version 10.5
-- Dumped by pg_dump version 10.5

-- Started on 2018-12-16 19:39:25

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 12924)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2876 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 204 (class 1259 OID 62186)
-- Name: accesstoken; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.accesstoken (
    id text NOT NULL,
    ttl integer DEFAULT 1209600,
    scopes text,
    created timestamp with time zone,
    userid integer
);


ALTER TABLE public.accesstoken OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 62169)
-- Name: acl; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.acl (
    model text,
    property text,
    accesstype text,
    permission text,
    principaltype text,
    principalid text,
    id integer NOT NULL
);


ALTER TABLE public.acl OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 62167)
-- Name: acl_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.acl_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.acl_id_seq OWNER TO postgres;

--
-- TOC entry 2877 (class 0 OID 0)
-- Dependencies: 200
-- Name: acl_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.acl_id_seq OWNED BY public.acl.id;


--
-- TOC entry 197 (class 1259 OID 62022)
-- Name: continent; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.continent (
    name text NOT NULL,
    ancestria_snp numeric(10,2) DEFAULT 0 NOT NULL,
    id integer NOT NULL
);


ALTER TABLE public.continent OWNER TO postgres;

--
-- TOC entry 196 (class 1259 OID 62020)
-- Name: continent_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.continent_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.continent_id_seq OWNER TO postgres;

--
-- TOC entry 2878 (class 0 OID 0)
-- Dependencies: 196
-- Name: continent_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.continent_id_seq OWNED BY public.continent.id;


--
-- TOC entry 203 (class 1259 OID 62178)
-- Name: custom_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.custom_user (
    first_name text NOT NULL,
    last_name text NOT NULL,
    realm text,
    username text,
    password text NOT NULL,
    email text NOT NULL,
    emailverified boolean,
    verificationtoken text,
    id integer NOT NULL
);


ALTER TABLE public.custom_user OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 62176)
-- Name: custom_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.custom_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.custom_user_id_seq OWNER TO postgres;

--
-- TOC entry 2879 (class 0 OID 0)
-- Dependencies: 202
-- Name: custom_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.custom_user_id_seq OWNED BY public.custom_user.id;


--
-- TOC entry 199 (class 1259 OID 62032)
-- Name: population; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.population (
    name text NOT NULL,
    result_percentage numeric(10,2) DEFAULT 0 NOT NULL,
    id integer NOT NULL,
    continentid integer
);


ALTER TABLE public.population OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 62027)
-- Name: population_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.population_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.population_id_seq OWNER TO postgres;

--
-- TOC entry 2880 (class 0 OID 0)
-- Dependencies: 198
-- Name: population_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.population_id_seq OWNED BY public.population.id;


--
-- TOC entry 208 (class 1259 OID 62212)
-- Name: role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.role (
    id integer NOT NULL,
    name text NOT NULL,
    description text,
    created timestamp with time zone,
    modified timestamp with time zone
);


ALTER TABLE public.role OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 62210)
-- Name: role_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.role_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.role_id_seq OWNER TO postgres;

--
-- TOC entry 2881 (class 0 OID 0)
-- Dependencies: 207
-- Name: role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.role_id_seq OWNED BY public.role.id;


--
-- TOC entry 206 (class 1259 OID 62197)
-- Name: rolemapping; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rolemapping (
    id integer NOT NULL,
    principaltype text,
    principalid text,
    roleid integer
);


ALTER TABLE public.rolemapping OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 62195)
-- Name: rolemapping_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.rolemapping_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rolemapping_id_seq OWNER TO postgres;

--
-- TOC entry 2882 (class 0 OID 0)
-- Dependencies: 205
-- Name: rolemapping_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.rolemapping_id_seq OWNED BY public.rolemapping.id;


--
-- TOC entry 2715 (class 2604 OID 62172)
-- Name: acl id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.acl ALTER COLUMN id SET DEFAULT nextval('public.acl_id_seq'::regclass);


--
-- TOC entry 2712 (class 2604 OID 62026)
-- Name: continent id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.continent ALTER COLUMN id SET DEFAULT nextval('public.continent_id_seq'::regclass);


--
-- TOC entry 2716 (class 2604 OID 62181)
-- Name: custom_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.custom_user ALTER COLUMN id SET DEFAULT nextval('public.custom_user_id_seq'::regclass);


--
-- TOC entry 2714 (class 2604 OID 62036)
-- Name: population id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.population ALTER COLUMN id SET DEFAULT nextval('public.population_id_seq'::regclass);


--
-- TOC entry 2719 (class 2604 OID 62215)
-- Name: role id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role ALTER COLUMN id SET DEFAULT nextval('public.role_id_seq'::regclass);


--
-- TOC entry 2718 (class 2604 OID 62200)
-- Name: rolemapping id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rolemapping ALTER COLUMN id SET DEFAULT nextval('public.rolemapping_id_seq'::regclass);


--
-- TOC entry 2864 (class 0 OID 62186)
-- Dependencies: 204
-- Data for Name: accesstoken; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.accesstoken (id, ttl, scopes, created, userid) FROM stdin;
hOjcWwyzjnHA1imIjg75yEiW9N1SUnY0knbhQcnxjiR7KpPL0bdl6L7SKVNqiAhW	1209600	\N	2018-12-16 22:07:30.376+00	1
4sN2pAOwJHvCKPYhLTCyGRjFjz7tdD9LxEz6cFHkahjdMZuYmTuHqqdGMKfQ0HZW	1209600	\N	2018-12-16 22:10:18.003+00	1
\.


--
-- TOC entry 2861 (class 0 OID 62169)
-- Dependencies: 201
-- Data for Name: acl; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.acl (model, property, accesstype, permission, principaltype, principalid, id) FROM stdin;
\.


--
-- TOC entry 2857 (class 0 OID 62022)
-- Dependencies: 197
-- Data for Name: continent; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.continent (name, ancestria_snp, id) FROM stdin;
Africa	38.70	26
Asia	19.80	27
Oceania	2.60	28
America	21.90	29
Europa	16.90	30
\.


--
-- TOC entry 2863 (class 0 OID 62178)
-- Dependencies: 203
-- Data for Name: custom_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.custom_user (first_name, last_name, realm, username, password, email, emailverified, verificationtoken, id) FROM stdin;
Michael	Martinez	\N	\N	$2a$10$I0goF5PKRstfWbLVIaoKCe7a3Vfumc1I7rlmoQZYbqE9VkbPgb7Va	jcampos123@hotmail.com	\N	\N	1
\.


--
-- TOC entry 2859 (class 0 OID 62032)
-- Dependencies: 199
-- Data for Name: population; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.population (name, result_percentage, id, continentid) FROM stdin;
BIAKA 	0.90	171	29
ASHKENASI	0.30	183	30
NMAKRANI	0.11	193	27
MAYA	0.23	203	26
YRI	0.43	174	29
MBUTI	0.87	173	29
LWK	1.30	180	29
JUDIOS ROMANOS	0.90	182	30
IRLANDESES	0.33	191	30
CEU	0.22	192	30
KACHARI	0.34	197	27
PIMA MX	0.65	202	26
ZARAMO	0.12	177	29
SARDINIANS	0.12	186	30
THOTI	0.95	196	27
HAUSA	0.45	178	29
ADYGEI	0.35	187	30
MICRONESIOS	0.67	198	28
MASAI	0.87	179	29
GRIEGOS	2.56	188	30
SAMOANS	0.23	199	28
YORUBA	0.20	175	29
TSI	0.10	184	30
KUWAITI	0.32	194	27
KERALA	0.67	195	27
QUECHUA	0.10	204	26
IBO	0.43	176	29
CHAGGA	1.67	181	29
UNGAROS	0.67	189	30
SF CHINISSE	0.90	200	26
LISONGO	0.56	172	29
IBS	0.50	185	30
CHUVASH	0.98	190	30
TW CHINISSE	0.45	201	26
\.


--
-- TOC entry 2868 (class 0 OID 62212)
-- Dependencies: 208
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.role (id, name, description, created, modified) FROM stdin;
\.


--
-- TOC entry 2866 (class 0 OID 62197)
-- Dependencies: 206
-- Data for Name: rolemapping; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rolemapping (id, principaltype, principalid, roleid) FROM stdin;
\.


--
-- TOC entry 2883 (class 0 OID 0)
-- Dependencies: 200
-- Name: acl_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.acl_id_seq', 1, false);


--
-- TOC entry 2884 (class 0 OID 0)
-- Dependencies: 196
-- Name: continent_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.continent_id_seq', 30, true);


--
-- TOC entry 2885 (class 0 OID 0)
-- Dependencies: 202
-- Name: custom_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.custom_user_id_seq', 1, true);


--
-- TOC entry 2886 (class 0 OID 0)
-- Dependencies: 198
-- Name: population_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.population_id_seq', 204, true);


--
-- TOC entry 2887 (class 0 OID 0)
-- Dependencies: 207
-- Name: role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.role_id_seq', 1, false);


--
-- TOC entry 2888 (class 0 OID 0)
-- Dependencies: 205
-- Name: rolemapping_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.rolemapping_id_seq', 1, false);


--
-- TOC entry 2729 (class 2606 OID 62207)
-- Name: accesstoken accesstoken_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accesstoken
    ADD CONSTRAINT accesstoken_pkey PRIMARY KEY (id);


--
-- TOC entry 2725 (class 2606 OID 62192)
-- Name: acl acl_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.acl
    ADD CONSTRAINT acl_pkey PRIMARY KEY (id);


--
-- TOC entry 2721 (class 2606 OID 62041)
-- Name: continent continent_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.continent
    ADD CONSTRAINT continent_pkey PRIMARY KEY (id);


--
-- TOC entry 2727 (class 2606 OID 62205)
-- Name: custom_user custom_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.custom_user
    ADD CONSTRAINT custom_user_pkey PRIMARY KEY (id);


--
-- TOC entry 2723 (class 2606 OID 62043)
-- Name: population population_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.population
    ADD CONSTRAINT population_pkey PRIMARY KEY (id);


--
-- TOC entry 2734 (class 2606 OID 62221)
-- Name: role role_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2731 (class 2606 OID 62209)
-- Name: rolemapping rolemapping_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rolemapping
    ADD CONSTRAINT rolemapping_pkey PRIMARY KEY (id);


--
-- TOC entry 2732 (class 1259 OID 62222)
-- Name: rolemapping_principalid_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX rolemapping_principalid_idx ON public.rolemapping USING btree (principalid);


-- Completed on 2018-12-16 19:39:25

--
-- PostgreSQL database dump complete
--

