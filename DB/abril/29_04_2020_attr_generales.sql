--
-- PostgreSQL database dump
--

-- Dumped from database version 11.7
-- Dumped by pg_dump version 11.7

-- Started on 2020-04-29 16:00:05

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

SET default_with_oids = true;

--
-- TOC entry 215 (class 1259 OID 25506)
-- Name: attr_generales; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.attr_generales (
    id numeric NOT NULL,
    nombre_sistema character varying NOT NULL,
    nombre_proceso character varying NOT NULL,
    anio smallint NOT NULL,
    ciclo character varying,
    siglas character varying,
    biblioteca character varying
);


--ALTER TABLE public.attr_generales OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 25504)
-- Name: attr_generales_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.attr_generales_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--ALTER TABLE public.attr_generales_id_seq OWNER TO postgres;

--
-- TOC entry 2871 (class 0 OID 0)
-- Dependencies: 214
-- Name: attr_generales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.attr_generales_id_seq OWNED BY public.attr_generales.id;


--
-- TOC entry 2740 (class 2604 OID 25524)
-- Name: attr_generales id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attr_generales ALTER COLUMN id SET DEFAULT nextval('public.attr_generales_id_seq'::regclass);


--
-- TOC entry 2865 (class 0 OID 25506)
-- Dependencies: 215
-- Data for Name: attr_generales; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.attr_generales (id, nombre_sistema, nombre_proceso, anio, ciclo, siglas, biblioteca) FROM stdin;
1	Sistema de Captura Bibliográfica	Proceso de Selección de Libros del Rincón	2020	2020-2022	SICABIs	Escolares
\.


--
-- TOC entry 2872 (class 0 OID 0)
-- Dependencies: 214
-- Name: attr_generales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.attr_generales_id_seq', 2, true);


--
-- TOC entry 2742 (class 2606 OID 25526)
-- Name: attr_generales attr_generales_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attr_generales
    ADD CONSTRAINT attr_generales_pkey PRIMARY KEY (id);


-- Completed on 2020-04-29 16:00:06

--
-- PostgreSQL database dump complete
--

