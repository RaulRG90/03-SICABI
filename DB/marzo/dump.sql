--
-- PostgreSQL database dump
--

-- Dumped from database version 11.7
-- Dumped by pg_dump version 11.7

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
-- Name: acceso; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.acceso (
    id_acceso smallint NOT NULL,
    id_perfil smallint NOT NULL,
    id_modulo smallint NOT NULL,
    activo smallint DEFAULT 0 NOT NULL
);


ALTER TABLE public.acceso OWNER TO postgres;

--
-- Name: cat_modulo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cat_modulo (
    id_modulo smallint NOT NULL,
    nombre character varying(50),
    seudonimo character varying NOT NULL
);


ALTER TABLE public.cat_modulo OWNER TO postgres;

--
-- Name: cat_perfil; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cat_perfil (
    id_perfil smallint NOT NULL,
    nombre character varying(50) NOT NULL,
    seudonimo character varying NOT NULL
);


ALTER TABLE public.cat_perfil OWNER TO postgres;

--
-- Name: historial; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.historial (
    id_historial smallint NOT NULL,
    usu_id smallint NOT NULL,
    fecha date DEFAULT CURRENT_TIMESTAMP NOT NULL,
    latitude character varying,
    longitude character varying,
    tiempo time with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.historial OWNER TO postgres;

--
-- Name: id_acceso_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.id_acceso_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.id_acceso_seq OWNER TO postgres;

--
-- Name: id_acceso_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.id_acceso_seq OWNED BY public.acceso.id_acceso;


--
-- Name: id_historial_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.id_historial_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.id_historial_seq OWNER TO postgres;

--
-- Name: id_historial_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.id_historial_seq OWNED BY public.historial.id_historial;


SET default_with_oids = false;

--
-- Name: lib_submodulos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lib_submodulos (
    id_submodulo smallint NOT NULL,
    url_sub character varying NOT NULL,
    id_acceso smallint NOT NULL,
    nombre character varying NOT NULL
);


ALTER TABLE public.lib_submodulos OWNER TO postgres;

SET default_with_oids = true;

--
-- Name: usuarios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuarios (
    usu_id integer NOT NULL,
    id_perfil smallint DEFAULT 0 NOT NULL,
    id_modulo smallint DEFAULT 0 NOT NULL,
    usu_nombre character varying,
    usu_login character varying NOT NULL,
    usu_pass character varying NOT NULL,
    usu_creador character varying DEFAULT 0 NOT NULL
);


ALTER TABLE public.usuarios OWNER TO postgres;

--
-- Name: acceso id_acceso; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.acceso ALTER COLUMN id_acceso SET DEFAULT nextval('public.id_acceso_seq'::regclass);


--
-- Name: historial id_historial; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.historial ALTER COLUMN id_historial SET DEFAULT nextval('public.id_historial_seq'::regclass);


--
-- Data for Name: acceso; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.acceso (id_acceso, id_perfil, id_modulo, activo) FROM stdin;
7	1	3	1
5	1	2	1
3	1	1	1
8	1	4	1
9	1	5	1
11	1	6	1
12	1	7	1
13	1	8	1
\.


--
-- Data for Name: cat_modulo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cat_modulo (id_modulo, nombre, seudonimo) FROM stdin;
1	Convocatoria	convocatoria
2	Acreditación de Editoriales	acreditacion
3	Registro de Títulos	registro
4	Entrega de Materiales	entrega
5	Preeselección	preseleccion
6	Entrega de materiales Preeselección	entrega
7	Selección	seleccion
8	Evaluación Técnica	evaluacion
\.


--
-- Data for Name: cat_perfil; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cat_perfil (id_perfil, nombre, seudonimo) FROM stdin;
1	Administrador	administrador
2	Acreditador de Editoriales	acreditador
3	Editorial	editorial
4	Recepcion de Materiales	recepcion1
5	Representante de lectores	representante
7	Lector	lector
8	Recepcion de Materiales de Preeselección	recepcion2
9	Selección	seleccion
10	Validación Técnica	validacion
\.


--
-- Data for Name: historial; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.historial (id_historial, usu_id, fecha, latitude, longitude, tiempo) FROM stdin;
6	1	2020-03-06	19.3624649	-99.16906	10:03:04.305648-06
7	1	2020-03-06	19.3624649	-99.16906	10:03:17.647427-06
8	1	2020-03-06	19.3624535	-99.1690345	10:48:23.022293-06
9	1	2020-03-06	19.3624704	-99.1690129	10:54:20.795548-06
10	1	2020-03-06	19.3624571	-99.1690094	11:59:13.845353-06
11	1	2020-03-06	19.362487299999998	-99.16904380000001	12:16:43.346559-06
12	1	2020-03-06	19.3624773	-99.1689974	13:26:28.225356-06
13	1	2020-03-06	19.3624965	-99.16904439999999	13:57:57.637451-06
14	1	2020-03-06	19.3624615	-99.1690241	17:03:03.212457-06
15	1	2020-03-06	19.3624553	-99.16899760000001	17:47:56.93034-06
16	1	2020-03-06	19.3624553	-99.16899760000001	17:59:25.756916-06
17	1	2020-03-09	19.3625014	-99.16901229999999	09:48:31.621593-06
18	1	2020-03-09	19.3624463	-99.169017	16:58:37.427585-06
19	1	2020-03-09	19.3624463	-99.169017	16:58:49.211378-06
20	1	2020-03-10	19.362447000000003	-99.1690211	15:20:52.380852-06
21	1	2020-03-11	19.3624741	-99.1690692	10:16:48.065138-06
22	1	2020-03-11	19.3624992	-99.1690792	11:31:13.27973-06
23	1	2020-03-11	19.3624693	-99.16900899999999	12:17:25.325966-06
24	1	2020-03-11	0	0	12:21:54.683534-06
25	1	2020-03-11	19.3624634	-99.1690131	13:26:07.956061-06
26	1	2020-03-11	19.362500999999998	-99.16901589999999	13:45:58.356033-06
27	1	2020-03-11	19.3624534	-99.1690208	17:31:52.742157-06
28	1	2020-03-12			09:53:26.145892-06
29	1	2020-03-12	19.3624427	-99.1690057	15:52:45.258992-06
30	1	2020-03-12	19.362511599999998	-99.1690244	16:02:22.009415-06
31	1	2020-03-12	19.362467799999997	-99.1690161	16:32:45.222469-06
32	1	2020-03-12	19.362450499999998	-99.16897630000001	16:49:17.874152-06
33	1	2020-03-12	19.3624238	-99.16897329999999	17:20:07.763265-06
34	1	2020-03-12	19.3624501	-99.1689624	17:41:20.253818-06
35	1	2020-03-13	19.3624334	-99.16901349999999	10:17:27.743009-06
36	1	2020-03-13	19.362477	-99.1690558	12:14:03.464253-06
37	1	2020-03-13	19.362457	-99.1690386	12:53:11.293335-06
38	2	2020-03-13	19.362457	-99.1690386	12:54:07.440806-06
39	2	2020-03-13	19.362457	-99.1690386	12:55:09.433933-06
40	1	2020-03-13	19.362457	-99.1690386	12:58:12.761322-06
41	2	2020-03-13	19.3624619	-99.1690524	12:58:19.606659-06
42	2	2020-03-13	19.3624731	-99.1690082	13:00:24.13738-06
43	1	2020-03-13	19.3624731	-99.1690082	13:01:47.445256-06
44	2	2020-03-13	19.3624731	-99.1690082	13:02:03.015451-06
45	1	2020-03-13	19.362472099999998	-99.1690034	13:02:27.901835-06
46	2	2020-03-13	19.362472099999998	-99.1690034	13:04:26.053987-06
47	2	2020-03-13	19.362445599999997	-99.16902370000001	13:14:30.108608-06
48	1	2020-03-13	19.3624868	-99.1690101	13:14:51.468773-06
49	1	2020-03-13	19.362472	-99.1690552	13:34:28.77897-06
50	2	2020-03-13	19.362472	-99.1690552	13:40:29.442773-06
51	1	2020-03-13	19.362472	-99.1690552	13:41:01.306452-06
52	2	2020-03-13	19.362459299999998	-99.1690364	13:54:01.735324-06
53	1	2020-03-13	19.362459299999998	-99.1690364	13:54:13.760566-06
54	2	2020-03-13	19.3624615	-99.1690373	13:58:02.560675-06
55	1	2020-03-13	19.362444099999998	-99.1690221	14:00:01.498657-06
56	1	2020-03-13	19.3624819	-99.16907479999999	14:37:06.114026-06
\.


--
-- Data for Name: lib_submodulos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.lib_submodulos (id_submodulo, url_sub, id_acceso, nombre) FROM stdin;
1	administrador/convocatoria/generales	3	Atributos Generales
2	administrador/convocatoria/tabla	3	Tabla de clasificación Indicativa 
3	administrador/convocatoria/fechas	3	Fechas
\.


--
-- Data for Name: usuarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuarios (usu_id, id_perfil, id_modulo, usu_nombre, usu_login, usu_pass, usu_creador) FROM stdin;
1	1	1	Raul Retana Gervacio	kyo	asian	0
2	2	2	Acreditador	1	1	1
\.


--
-- Name: id_acceso_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.id_acceso_seq', 13, true);


--
-- Name: id_historial_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.id_historial_seq', 56, true);


--
-- Name: acceso key_id_acceso; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.acceso
    ADD CONSTRAINT key_id_acceso PRIMARY KEY (id_acceso);


--
-- Name: historial key_id_historial; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.historial
    ADD CONSTRAINT key_id_historial PRIMARY KEY (id_historial);


--
-- Name: cat_modulo key_id_modulo; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cat_modulo
    ADD CONSTRAINT key_id_modulo PRIMARY KEY (id_modulo);


--
-- Name: cat_perfil key_id_perfil; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cat_perfil
    ADD CONSTRAINT key_id_perfil PRIMARY KEY (id_perfil);


--
-- Name: usuarios key_usu_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT key_usu_id PRIMARY KEY (usu_id);


--
-- Name: lib_submodulos lib_submodulos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lib_submodulos
    ADD CONSTRAINT lib_submodulos_pkey PRIMARY KEY (id_submodulo);


--
-- Name: idx_usu_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX idx_usu_id ON public.usuarios USING btree (usu_id);


--
-- Name: acceso id_modulo_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.acceso
    ADD CONSTRAINT id_modulo_fk FOREIGN KEY (id_modulo) REFERENCES public.cat_modulo(id_modulo);


--
-- Name: lib_submodulos id_modulo_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lib_submodulos
    ADD CONSTRAINT id_modulo_fk FOREIGN KEY (id_acceso) REFERENCES public.acceso(id_acceso) ON UPDATE CASCADE;


--
-- Name: acceso id_perfil_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.acceso
    ADD CONSTRAINT id_perfil_fk FOREIGN KEY (id_perfil) REFERENCES public.cat_perfil(id_perfil);


--
-- Name: historial usu_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.historial
    ADD CONSTRAINT usu_id_fk FOREIGN KEY (usu_id) REFERENCES public.usuarios(usu_id);


--
-- Name: usuarios usu_permiso_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usu_permiso_fk FOREIGN KEY (id_modulo) REFERENCES public.cat_modulo(id_modulo);


--
-- Name: usuarios usuarios_usu_privilegio_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_usu_privilegio_fkey FOREIGN KEY (id_perfil) REFERENCES public.cat_perfil(id_perfil);


--
-- PostgreSQL database dump complete
--

