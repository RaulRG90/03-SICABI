--
-- PostgreSQL database dump
--

-- Dumped from database version 11.8 (Debian 11.8-1.pgdg90+1)
-- Dumped by pg_dump version 11.8 (Debian 11.8-1.pgdg90+1)

-- Started on 2020-06-01 09:45:54 CDT

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
-- TOC entry 196 (class 1259 OID 16495)
-- Name: acceso; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.acceso (
    id_acceso smallint NOT NULL,
    id_perfil smallint NOT NULL,
    id_modulo smallint NOT NULL,
    activo smallint DEFAULT 0 NOT NULL
);



--
-- TOC entry 214 (class 1259 OID 441645)
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



--
-- TOC entry 215 (class 1259 OID 441651)
-- Name: attr_generales_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.attr_generales_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;



--
-- TOC entry 3013 (class 0 OID 0)
-- Dependencies: 215
-- Name: attr_generales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.attr_generales_id_seq OWNED BY public.attr_generales.id;


--
-- TOC entry 197 (class 1259 OID 16499)
-- Name: cat_modulo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cat_modulo (
    id_modulo smallint NOT NULL,
    nombre character varying(50),
    seudonimo character varying NOT NULL,
    fecha_inicio_acceso date,
    fecha_fin_acceso date,
    restriccion_modulo boolean
);



--
-- TOC entry 3014 (class 0 OID 0)
-- Dependencies: 197
-- Name: COLUMN cat_modulo.fecha_inicio_acceso; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.cat_modulo.fecha_inicio_acceso IS 'Representa la fecha de inicio para poder acceder al módulo';


--
-- TOC entry 3015 (class 0 OID 0)
-- Dependencies: 197
-- Name: COLUMN cat_modulo.fecha_fin_acceso; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.cat_modulo.fecha_fin_acceso IS 'Representa la fecha de fin de acceso al módulo';


--
-- TOC entry 3016 (class 0 OID 0)
-- Dependencies: 197
-- Name: COLUMN cat_modulo.restriccion_modulo; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.cat_modulo.restriccion_modulo IS 'Representa la confirmación de la aplicación de restricción al módulo.';


--
-- TOC entry 198 (class 1259 OID 16505)
-- Name: cat_perfil; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cat_perfil (
    id_perfil smallint NOT NULL,
    nombre character varying(50) NOT NULL,
    seudonimo character varying NOT NULL
);



SET default_with_oids = false;

--
-- TOC entry 213 (class 1259 OID 433059)
-- Name: edi_sellos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.edi_sellos (
    sel_id integer NOT NULL,
    edi_id integer NOT NULL,
    sel_sello character varying NOT NULL,
    fecha_creacion date
);



--
-- TOC entry 212 (class 1259 OID 433057)
-- Name: edi_sellos_sel_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.edi_sellos_sel_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;



--
-- TOC entry 3017 (class 0 OID 0)
-- Dependencies: 212
-- Name: edi_sellos_sel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.edi_sellos_sel_id_seq OWNED BY public.edi_sellos.sel_id;


--
-- TOC entry 211 (class 1259 OID 433020)
-- Name: editoriales; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.editoriales (
    id integer NOT NULL,
    usu_id integer,
    edi_razonsocial character varying NOT NULL,
    edi_grupoedit character varying,
    edi_dirgeneral character varying NOT NULL,
    edi_dirmail character varying NOT NULL,
    edi_dircel bigint NOT NULL,
    edi_repnombre character varying NOT NULL,
    edi_repcargo character varying NOT NULL,
    edi_repemail character varying NOT NULL,
    edi_observaciones character varying,
    fecha_creacion date
);



--
-- TOC entry 210 (class 1259 OID 433018)
-- Name: editoriales_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.editoriales_id_seq
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;



--
-- TOC entry 3018 (class 0 OID 0)
-- Dependencies: 210
-- Name: editoriales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.editoriales_id_seq OWNED BY public.editoriales.id;


SET default_with_oids = true;

--
-- TOC entry 199 (class 1259 OID 16511)
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



--
-- TOC entry 200 (class 1259 OID 16519)
-- Name: id_acceso_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.id_acceso_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;



--
-- TOC entry 3019 (class 0 OID 0)
-- Dependencies: 200
-- Name: id_acceso_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.id_acceso_seq OWNED BY public.acceso.id_acceso;


--
-- TOC entry 201 (class 1259 OID 16521)
-- Name: id_historial_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.id_historial_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;



--
-- TOC entry 3020 (class 0 OID 0)
-- Dependencies: 201
-- Name: id_historial_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.id_historial_seq OWNED BY public.historial.id_historial;


SET default_with_oids = false;

--
-- TOC entry 202 (class 1259 OID 16523)
-- Name: lib_submodulos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lib_submodulos (
    id_submodulo smallint NOT NULL,
    url_sub character varying NOT NULL,
    id_acceso smallint NOT NULL,
    nombre character varying NOT NULL
);



--
-- TOC entry 209 (class 1259 OID 16712)
-- Name: seleccionBilingue; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."seleccionBilingue" (
    id integer NOT NULL,
    clasificacion character varying(100) NOT NULL,
    grado character varying(10) NOT NULL,
    biblioteca character varying(10) NOT NULL,
    "numPreseleccion" integer NOT NULL,
    "numSeleccion" integer NOT NULL
);



--
-- TOC entry 208 (class 1259 OID 16710)
-- Name: seleccionBilingue_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."seleccionBilingue_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;



--
-- TOC entry 3021 (class 0 OID 0)
-- Dependencies: 208
-- Name: seleccionBilingue_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."seleccionBilingue_id_seq" OWNED BY public."seleccionBilingue".id;


--
-- TOC entry 207 (class 1259 OID 16679)
-- Name: seleccionMonolingue; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."seleccionMonolingue" (
    id integer NOT NULL,
    texto integer NOT NULL,
    grado character varying(10) NOT NULL,
    biblioteca character varying(10) NOT NULL,
    "numPreseleccion" integer NOT NULL,
    "numSeleccion" integer NOT NULL
);



--
-- TOC entry 206 (class 1259 OID 16677)
-- Name: seleccionMonolingue_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."seleccionMonolingue_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;



--
-- TOC entry 3022 (class 0 OID 0)
-- Dependencies: 206
-- Name: seleccionMonolingue_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."seleccionMonolingue_id_seq" OWNED BY public."seleccionMonolingue".id;


--
-- TOC entry 205 (class 1259 OID 16664)
-- Name: texto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.texto (
    id integer NOT NULL,
    clasificacion character varying NOT NULL,
    tipo character varying NOT NULL,
    categoria character varying NOT NULL
);



--
-- TOC entry 204 (class 1259 OID 16662)
-- Name: texto_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.texto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;



--
-- TOC entry 3023 (class 0 OID 0)
-- Dependencies: 204
-- Name: texto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.texto_id_seq OWNED BY public.texto.id;


SET default_with_oids = true;

--
-- TOC entry 203 (class 1259 OID 16529)
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



--
-- TOC entry 2808 (class 2604 OID 433402)
-- Name: acceso id_acceso; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.acceso ALTER COLUMN id_acceso SET DEFAULT nextval('public.id_acceso_seq'::regclass);


--
-- TOC entry 2820 (class 2604 OID 441653)
-- Name: attr_generales id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attr_generales ALTER COLUMN id SET DEFAULT nextval('public.attr_generales_id_seq'::regclass);


--
-- TOC entry 2819 (class 2604 OID 433404)
-- Name: edi_sellos sel_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.edi_sellos ALTER COLUMN sel_id SET DEFAULT nextval('public.edi_sellos_sel_id_seq'::regclass);


--
-- TOC entry 2818 (class 2604 OID 433405)
-- Name: editoriales id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.editoriales ALTER COLUMN id SET DEFAULT nextval('public.editoriales_id_seq'::regclass);


--
-- TOC entry 2811 (class 2604 OID 433406)
-- Name: historial id_historial; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.historial ALTER COLUMN id_historial SET DEFAULT nextval('public.id_historial_seq'::regclass);


--
-- TOC entry 2817 (class 2604 OID 433407)
-- Name: seleccionBilingue id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."seleccionBilingue" ALTER COLUMN id SET DEFAULT nextval('public."seleccionBilingue_id_seq"'::regclass);


--
-- TOC entry 2816 (class 2604 OID 433408)
-- Name: seleccionMonolingue id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."seleccionMonolingue" ALTER COLUMN id SET DEFAULT nextval('public."seleccionMonolingue_id_seq"'::regclass);


--
-- TOC entry 2815 (class 2604 OID 433409)
-- Name: texto id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.texto ALTER COLUMN id SET DEFAULT nextval('public.texto_id_seq'::regclass);


--
-- TOC entry 2988 (class 0 OID 16495)
-- Dependencies: 196
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
14	2	2	1
15	3	3	1
16	4	4	1
\.


--
-- TOC entry 3006 (class 0 OID 441645)
-- Dependencies: 214
-- Data for Name: attr_generales; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.attr_generales (id, nombre_sistema, nombre_proceso, anio, ciclo, siglas, biblioteca) FROM stdin;
1	Sistema de Captura Bibliográfica	Proceso de Selección de Libros del Rincón	2020	2020-2022	SICABIs	Aula
\.


--
-- TOC entry 2989 (class 0 OID 16499)
-- Dependencies: 197
-- Data for Name: cat_modulo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cat_modulo (id_modulo, nombre, seudonimo, fecha_inicio_acceso, fecha_fin_acceso, restriccion_modulo) FROM stdin;
1	Convocatoria	convocatoria	2020-05-01	2020-05-01	\N
2	Acreditación de Editoriales	acreditacion	2020-05-01	2020-06-02	\N
3	Registro de Títulos	registro	2020-05-01	2020-05-01	\N
4	Entrega de Materiales	entrega	2020-05-01	2020-05-01	\N
5	Preeselección	preseleccion	2020-05-01	2020-05-01	\N
6	Entrega de materiales Preeselección	entrega	2020-05-01	2020-05-01	\N
7	Selección	seleccion	2020-05-01	2020-05-01	\N
8	Evaluación Técnica	evaluacion	2020-05-01	2020-05-01	\N
\.


--
-- TOC entry 2990 (class 0 OID 16505)
-- Dependencies: 198
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
-- TOC entry 3005 (class 0 OID 433059)
-- Dependencies: 213
-- Data for Name: edi_sellos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.edi_sellos (sel_id, edi_id, sel_sello, fecha_creacion) FROM stdin;
\.


--
-- TOC entry 3003 (class 0 OID 433020)
-- Dependencies: 211
-- Data for Name: editoriales; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.editoriales (id, usu_id, edi_razonsocial, edi_grupoedit, edi_dirgeneral, edi_dirmail, edi_dircel, edi_repnombre, edi_repcargo, edi_repemail, edi_observaciones, fecha_creacion) FROM stdin;
\.


--
-- TOC entry 2991 (class 0 OID 16511)
-- Dependencies: 199
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
40	1	2020-03-13	19.362457	-99.1690386	12:58:12.761322-06
43	1	2020-03-13	19.3624731	-99.1690082	13:01:47.445256-06
45	1	2020-03-13	19.362472099999998	-99.1690034	13:02:27.901835-06
48	1	2020-03-13	19.3624868	-99.1690101	13:14:51.468773-06
49	1	2020-03-13	19.362472	-99.1690552	13:34:28.77897-06
51	1	2020-03-13	19.362472	-99.1690552	13:41:01.306452-06
53	1	2020-03-13	19.362459299999998	-99.1690364	13:54:13.760566-06
55	1	2020-03-13	19.362444099999998	-99.1690221	14:00:01.498657-06
56	1	2020-03-13	19.3624819	-99.16907479999999	14:37:06.114026-06
57	1	2020-03-23	0	0	16:45:39.732172-06
58	1	2020-03-23	0	0	20:59:36.053608-06
59	1	2020-03-23	0	0	23:38:25.092579-06
60	1	2020-03-24	0	0	09:57:23.157303-06
61	1	2020-03-24	0	0	13:48:25.412772-06
62	1	2020-03-25	0	0	13:07:11.87163-06
63	1	2020-03-25	0	0	21:00:08.075373-06
64	1	2020-03-25	0	0	21:10:04.887467-06
65	1	2020-03-26	0	0	12:30:25.561444-06
66	1	2020-03-27	0	0	12:21:02.975185-06
67	1	2020-03-30	0	0	14:15:27.197872-06
68	1	2020-03-30	0	0	15:56:12.832453-06
69	1	2020-03-30	0	0	21:59:17.758095-06
70	1	2020-04-01	0	0	00:07:02.659668-06
71	1	2020-04-01	0	0	11:57:38.320223-06
72	1	2020-04-02	0	0	20:19:35.770124-06
73	1	2020-04-03	0	0	01:15:42.242866-06
74	1	2020-04-03	0	0	21:21:31.897163-06
75	1	2020-04-06	0	0	18:25:39.358479-05
76	1	2020-04-07	0	0	02:56:46.62897-05
77	1	2020-04-07	0	0	14:15:14.105589-05
78	1	2020-04-07	0	0	14:47:39.074495-05
85	1	2020-04-07	0	0	18:40:43.93718-05
89	1	2020-04-09	0	0	04:01:40.976292-05
90	1	2020-04-09	0	0	20:06:31.573367-05
91	1	2020-04-09	0	0	22:45:10.444974-05
92	1	2020-04-10	0	0	10:40:11.164456-05
93	1	2020-04-10	0	0	15:34:31.052992-05
94	1	2020-04-10	0	0	15:59:13.387073-05
95	1	2020-04-10	0	0	21:12:40.864096-05
96	1	2020-04-14	0	0	18:26:44.248261-05
97	1	2020-04-15	0	0	03:25:50.395504-05
98	1	2020-04-15	0	0	23:57:43.074138-05
106	1	2020-04-20	0	0	12:44:54.026694-05
107	1	2020-04-20	0	0	13:10:05.494083-05
110	1	2020-04-20	0	0	16:29:09.615977-05
112	1	2020-04-21	0	0	11:22:45.816796-05
114	1	2020-04-21	0	0	12:16:45.564515-05
115	1	2020-04-21	0	0	13:14:23.515366-05
116	1	2020-04-21	0	0	18:47:49.070688-05
135	1	2020-04-22	0	0	19:39:16.354519-05
136	1	2020-04-22	0	0	19:40:55.742284-05
137	1	2020-04-23	0	0	20:08:58.263937-05
138	1	2020-04-26	0	0	19:07:54.937045-05
139	1	2020-04-27	0	0	00:45:54.547141-05
140	1	2020-04-27	0	0	11:46:29.037073-05
141	1	2020-04-27	0	0	23:34:52.421185-05
142	1	2020-05-03	0	0	15:35:58.475789-05
143	1	2020-05-03	0	0	19:50:27.086751-05
144	1	2020-05-04	0	0	01:14:07.220987-05
145	1	2020-05-04	0	0	01:23:01.775602-05
146	1	2020-05-04	0	0	01:34:13.538761-05
148	1	2020-05-05	0	0	22:22:42.064851-05
149	1	2020-05-05	0	0	22:38:45.268053-05
151	1	2020-05-05	0	0	22:59:51.242326-05
152	1	2020-05-06	0	0	00:37:10.527765-05
153	1	2020-05-07	0	0	02:07:57.877561-05
155	1	2020-05-12	0	0	02:38:19.227921-05
156	1	2020-05-17	0	0	16:22:34.52908-05
157	1	2020-05-18	0	0	16:46:52.383744-05
158	1	2020-05-19	0	0	19:42:27.427621-05
160	1	2020-05-19	0	0	22:25:44.728123-05
161	3	2020-05-19	0	0	22:53:14.108071-05
162	3	2020-05-19	0	0	23:01:22.521198-05
163	1	2020-05-19	0	0	23:01:41.20704-05
164	3	2020-05-19	0	0	23:08:09.095987-05
165	1	2020-05-19	0	0	23:12:15.767647-05
166	3	2020-05-19	0	0	23:12:46.16557-05
167	1	2020-05-19	0	0	23:22:55.282293-05
168	3	2020-05-19	0	0	23:26:15.185637-05
169	1	2020-05-20	0	0	01:48:29.72165-05
170	4	2020-05-20	0	0	02:42:24.222161-05
171	4	2020-05-20	0	0	02:44:54.595687-05
172	4	2020-05-20	0	0	02:46:32.276349-05
173	3	2020-05-20	0	0	02:53:56.303528-05
174	4	2020-05-20	0	0	02:54:59.376696-05
175	3	2020-05-20	0	0	03:16:33.306384-05
176	4	2020-05-20	0	0	03:38:43.710798-05
177	3	2020-05-20	0	0	03:43:34.50259-05
178	4	2020-05-20	0	0	04:49:21.910377-05
179	3	2020-05-20	0	0	07:34:43.518593-05
180	1	2020-05-20	0	0	11:40:43.25405-05
181	1	2020-05-20	0	0	16:51:19.051227-05
182	1	2020-05-27	0	0	23:29:30.459251-05
183	1	2020-05-28	0	0	01:30:03.30942-05
184	1	2020-05-29	0	0	00:43:06.149529-05
185	1	2020-05-29	0	0	15:30:36.319758-05
186	1	2020-05-30	0	0	15:26:15.325884-05
187	1	2020-05-30	0	0	20:22:59.120313-05
189	1	2020-05-31	0	0	01:24:18.229268-05
191	1	2020-05-31	0	0	01:32:18.548109-05
192	1	2020-05-31	0	0	04:53:53.97621-05
194	1	2020-05-31	0	0	04:55:15.696052-05
196	1	2020-05-31	0	0	04:59:32.297866-05
197	1	2020-05-31	0	0	13:29:28.757773-05
199	1	2020-05-31	0	0	14:01:33.968755-05
201	1	2020-05-31	0	0	14:15:29.849463-05
203	1	2020-05-31	0	0	18:33:15.21953-05
205	1	2020-06-01	0	0	03:01:48.030394-05
208	1	2020-06-01	0	0	03:30:10.525422-05
209	1	2020-06-01	0	0	06:54:13.975172-05
211	1	2020-06-01	0	0	06:57:17.667786-05
\.


--
-- TOC entry 2994 (class 0 OID 16523)
-- Dependencies: 202
-- Data for Name: lib_submodulos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.lib_submodulos (id_submodulo, url_sub, id_acceso, nombre) FROM stdin;
1	administrador/convocatoria/generales	3	Atributos Generales
3	administrador/convocatoria/fechas	3	Fechas
4	acreditador/acreditacion	14	Acreditacion de Editoriales
6	administrador/acreditacion/reportes	5	Reportes de Acreditación
7	editorial/registro/registro_titulos	15	Registro de Títulos
2	administrador/convocatoria/clasificacion_indicativa	3	Tabla de clasificación Indicativa 
11	recepcion/entrega/entrega_titulos	16	Entrega de Títulos
12	recepcion/entrega/editoriales_participantes	16	Editoriales Participantes
13	recepcion/entrega/formato_cajas	16	Formato Para Cajas
9	editorial/registro/datos_editorial	15	Datos de Editorial
10	editorial/registro/cambiar_contrasenia	15	Cambiar Contraseña
8	editorial/registro/formatos_oficiales	15	Formatos Oficiales
\.


--
-- TOC entry 3001 (class 0 OID 16712)
-- Dependencies: 209
-- Data for Name: seleccionBilingue; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."seleccionBilingue" (id, clasificacion, grado, biblioteca, "numPreseleccion", "numSeleccion") FROM stdin;
44	de_prescolar_a_tercero_de_primaria_textos_bilingues	1pre	BA	10	10
45	de_prescolar_a_tercero_de_primaria_textos_bilingues	2pre	BA	10	10
46	de_prescolar_a_tercero_de_primaria_textos_bilingues	3pre	BA	10	10
\.


--
-- TOC entry 2999 (class 0 OID 16679)
-- Dependencies: 207
-- Data for Name: seleccionMonolingue; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."seleccionMonolingue" (id, texto, grado, biblioteca, "numPreseleccion", "numSeleccion") FROM stdin;
781	1	3pri	BA	10	10
782	1	2pri	BA	10	10
783	1	1pri	BA	10	10
784	1	3pre	BA	10	10
785	1	2pre	BA	10	10
786	1	1pre	BA	10	10
787	2	pri	BE	10	10
788	2	pre	BE	10	10
789	2	3pri	BA	10	10
790	2	2pri	BA	10	10
791	2	1pri	BA	10	10
792	2	3pre	BA	10	10
793	2	2pre	BA	10	10
794	2	1pre	BA	10	10
795	3	1pri	BA	10	10
796	3	3pre	BA	10	10
797	3	2pre	BA	10	10
798	3	1pre	BA	10	10
799	12	1pre	BA	10	10
800	13	1pre	BA	10	10
801	48	5pri	BA	10	10
802	48	4pri	BA	10	10
803	1	pre	BE	10	10
\.


--
-- TOC entry 2997 (class 0 OID 16664)
-- Dependencies: 205
-- Data for Name: texto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.texto (id, clasificacion, tipo, categoria) FROM stdin;
1	de prescolar a tercero de primaria	textos informativos	la naturaleza
2	de prescolar a tercero de primaria	textos informativos	el cuerpo
3	de prescolar a tercero de primaria	textos informativos	los números y las formas
4	de prescolar a tercero de primaria	textos informativos	los objetos y su funcionamiento
5	de prescolar a tercero de primaria	textos informativos	las personas
6	de prescolar a tercero de primaria	textos informativos	las historias del pasado
7	de prescolar a tercero de primaria	textos informativos	los lugares, la tierra y el espacio
8	de prescolar a tercero de primaria	textos informativos	las artes y los oficios
9	de prescolar a tercero de primaria	textos informativos	los juegos, actividades y experimentos
10	de prescolar a tercero de primaria	textos informativos	las palabras
11	de prescolar a tercero de primaria	textos informativos	enciclopedia, atlas y almanaques
12	de prescolar a tercero de primaria	textos literarios	cuentos de aventura y de viajes
13	de prescolar a tercero de primaria	textos literarios	cuentos de humor
14	de prescolar a tercero de primaria	textos literarios	cuentos de misterio y de terror
15	de prescolar a tercero de primaria	textos literarios	cuentos de la vida cotidiana
16	de prescolar a tercero de primaria	textos literarios	cuentos historicos
17	de prescolar a tercero de primaria	textos literarios	cuentos clásicos
18	de prescolar a tercero de primaria	textos literarios	diarios, crónicas y reportajes
19	de prescolar a tercero de primaria	textos literarios	mitos y leyendas
20	de prescolar a tercero de primaria	textos literarios	poesía
21	de prescolar a tercero de primaria	textos literarios	rimas, canciones, adivinanzas y juegos de palabras
22	de prescolar a tercero de primaria	textos literarios	teatro y representaciones con títeres y marionetas
48	de cuarto de primaria a tercero de secundaria	textos informativos	ciencia físico-químicas
49	de cuarto de primaria a tercero de secundaria	textos informativos	ciencias biológicas
50	de cuarto de primaria a tercero de secundaria	textos informativos	ciencias de la salud y el deporte
51	de cuarto de primaria a tercero de secundaria	textos informativos	matemáticas
52	de cuarto de primaria a tercero de secundaria	textos informativos	tecnología
53	de cuarto de primaria a tercero de secundaria	textos informativos	biografías
54	de cuarto de primaria a tercero de secundaria	textos informativos	historia, cultura y sociedad
55	de cuarto de primaria a tercero de secundaria	textos informativos	ciencias de la tierra y el espacio
56	de cuarto de primaria a tercero de secundaria	textos informativos	artes y oficios
57	de cuarto de primaria a tercero de secundaria	textos informativos	juegos, actividades y experimentos
58	de cuarto de primaria a tercero de secundaria	textos informativos	diccionarios
59	de cuarto de primaria a tercero de secundaria	textos informativos	enciclopedias, atlas y almanaques
60	de cuarto de primaria a tercero de secundaria	textos literarios	narrativa de aventuras y de viajes
61	de cuarto de primaria a tercero de secundaria	textos literarios	narrativa de ciencia ficción
62	de cuarto de primaria a tercero de secundaria	textos literarios	narrativa de humor
63	de cuarto de primaria a tercero de secundaria	textos literarios	narrativa de misterio y de terror
64	de cuarto de primaria a tercero de secundaria	textos literarios	narrativa policiaca
65	de cuarto de primaria a tercero de secundaria	textos literarios	narrativa de la vida cotidiana
66	de cuarto de primaria a tercero de secundaria	textos literarios	narrativa contemporanea a universal b latinoamericana y c mexicana
67	de cuarto de primaria a tercero de secundaria	textos literarios	narrativa histórica
69	de cuarto de primaria a tercero de secundaria	textos literarios	diarios, crónicas y reportajes
70	de cuarto de primaria a tercero de secundaria	textos literarios	mitos y leyendas
71	de cuarto de primaria a tercero de secundaria	textos literarios	poesía de autor
72	de cuarto de primaria a tercero de secundaria	textos literarios	poesía popular
73	de cuarto de primaria a tercero de secundaria	textos literarios	teatro
68	de cuarto de primaria a tercero de secundaria	textos literarios	narrativa clásica
\.


--
-- TOC entry 2995 (class 0 OID 16529)
-- Dependencies: 203
-- Data for Name: usuarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuarios (usu_id, id_perfil, id_modulo, usu_nombre, usu_login, usu_pass, usu_creador) FROM stdin;
4	4	4	Recepción	recepcion	123	1
210	2	2	Acreditador	acreditador	123	1
3	3	3	Editorial	editorial	1234	1
1	1	1	Administrador	kyo	asian	0
248	3	8	Recepcion3	rep	1235	1
\.


--
-- TOC entry 3024 (class 0 OID 0)
-- Dependencies: 215
-- Name: attr_generales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.attr_generales_id_seq', 2, true);


--
-- TOC entry 3025 (class 0 OID 0)
-- Dependencies: 212
-- Name: edi_sellos_sel_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.edi_sellos_sel_id_seq', 16, true);


--
-- TOC entry 3026 (class 0 OID 0)
-- Dependencies: 210
-- Name: editoriales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.editoriales_id_seq', 1025, true);


--
-- TOC entry 3027 (class 0 OID 0)
-- Dependencies: 200
-- Name: id_acceso_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.id_acceso_seq', 13, true);


--
-- TOC entry 3028 (class 0 OID 0)
-- Dependencies: 201
-- Name: id_historial_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.id_historial_seq', 211, true);


--
-- TOC entry 3029 (class 0 OID 0)
-- Dependencies: 208
-- Name: seleccionBilingue_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."seleccionBilingue_id_seq"', 46, true);


--
-- TOC entry 3030 (class 0 OID 0)
-- Dependencies: 206
-- Name: seleccionMonolingue_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."seleccionMonolingue_id_seq"', 803, true);


--
-- TOC entry 3031 (class 0 OID 0)
-- Dependencies: 204
-- Name: texto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.texto_id_seq', 1, false);


--
-- TOC entry 2857 (class 2606 OID 441656)
-- Name: attr_generales attr_generales_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attr_generales
    ADD CONSTRAINT attr_generales_pkey PRIMARY KEY (id);


--
-- TOC entry 2847 (class 2606 OID 433028)
-- Name: editoriales editoriales_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.editoriales
    ADD CONSTRAINT editoriales_pkey PRIMARY KEY (id);


--
-- TOC entry 2822 (class 2606 OID 16619)
-- Name: acceso key_id_acceso; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.acceso
    ADD CONSTRAINT key_id_acceso PRIMARY KEY (id_acceso);


--
-- TOC entry 2828 (class 2606 OID 16621)
-- Name: historial key_id_historial; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.historial
    ADD CONSTRAINT key_id_historial PRIMARY KEY (id_historial);


--
-- TOC entry 2824 (class 2606 OID 16623)
-- Name: cat_modulo key_id_modulo; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cat_modulo
    ADD CONSTRAINT key_id_modulo PRIMARY KEY (id_modulo);


--
-- TOC entry 2826 (class 2606 OID 16625)
-- Name: cat_perfil key_id_perfil; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cat_perfil
    ADD CONSTRAINT key_id_perfil PRIMARY KEY (id_perfil);


--
-- TOC entry 2833 (class 2606 OID 16627)
-- Name: usuarios key_usu_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT key_usu_id PRIMARY KEY (usu_id);


--
-- TOC entry 2830 (class 2606 OID 16629)
-- Name: lib_submodulos lib_submodulos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lib_submodulos
    ADD CONSTRAINT lib_submodulos_pkey PRIMARY KEY (id_submodulo);


--
-- TOC entry 2839 (class 2606 OID 16684)
-- Name: seleccionMonolingue pk_seleccionMonolingue_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."seleccionMonolingue"
    ADD CONSTRAINT "pk_seleccionMonolingue_id" PRIMARY KEY (texto, grado, biblioteca);


--
-- TOC entry 2853 (class 2606 OID 433067)
-- Name: edi_sellos pk_sellos_edi_id_sel_sello; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.edi_sellos
    ADD CONSTRAINT pk_sellos_edi_id_sel_sello PRIMARY KEY (edi_id, sel_sello);


--
-- TOC entry 2843 (class 2606 OID 16733)
-- Name: seleccionBilingue seleccionBilingue_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."seleccionBilingue"
    ADD CONSTRAINT "seleccionBilingue_pkey" PRIMARY KEY (clasificacion, grado, biblioteca);


--
-- TOC entry 2837 (class 2606 OID 16672)
-- Name: texto texto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.texto
    ADD CONSTRAINT texto_pkey PRIMARY KEY (id);


--
-- TOC entry 2849 (class 2606 OID 433030)
-- Name: editoriales unique_editorial_dir_mail; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.editoriales
    ADD CONSTRAINT unique_editorial_dir_mail UNIQUE (edi_dirmail);


--
-- TOC entry 2851 (class 2606 OID 433032)
-- Name: editoriales unique_editorial_rep_mail; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.editoriales
    ADD CONSTRAINT unique_editorial_rep_mail UNIQUE (edi_repemail);


--
-- TOC entry 2841 (class 2606 OID 16686)
-- Name: seleccionMonolingue unique_id_seleccionMonolingue; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."seleccionMonolingue"
    ADD CONSTRAINT "unique_id_seleccionMonolingue" UNIQUE (id);


--
-- TOC entry 2845 (class 2606 OID 16719)
-- Name: seleccionBilingue unique_seleccionBilingue_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."seleccionBilingue"
    ADD CONSTRAINT "unique_seleccionBilingue_id" UNIQUE (id);


--
-- TOC entry 2855 (class 2606 OID 433077)
-- Name: edi_sellos unique_sellos_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.edi_sellos
    ADD CONSTRAINT unique_sellos_id UNIQUE (sel_id);


--
-- TOC entry 2835 (class 2606 OID 433358)
-- Name: usuarios unique_usu_login; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT unique_usu_login UNIQUE (usu_login);


--
-- TOC entry 2831 (class 1259 OID 16630)
-- Name: idx_usu_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX idx_usu_id ON public.usuarios USING btree (usu_id);


--
-- TOC entry 2865 (class 2606 OID 441755)
-- Name: editoriales fk_editoriales_usu_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.editoriales
    ADD CONSTRAINT fk_editoriales_usu_id FOREIGN KEY (usu_id) REFERENCES public.usuarios(usu_id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- TOC entry 2864 (class 2606 OID 16687)
-- Name: seleccionMonolingue fk_seleccionMonolingue_texto; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."seleccionMonolingue"
    ADD CONSTRAINT "fk_seleccionMonolingue_texto" FOREIGN KEY (texto) REFERENCES public.texto(id) NOT VALID;


--
-- TOC entry 2866 (class 2606 OID 441731)
-- Name: edi_sellos fk_sellos_edi_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.edi_sellos
    ADD CONSTRAINT fk_sellos_edi_id FOREIGN KEY (edi_id) REFERENCES public.editoriales(id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- TOC entry 2858 (class 2606 OID 16631)
-- Name: acceso id_modulo_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.acceso
    ADD CONSTRAINT id_modulo_fk FOREIGN KEY (id_modulo) REFERENCES public.cat_modulo(id_modulo);


--
-- TOC entry 2861 (class 2606 OID 16636)
-- Name: lib_submodulos id_modulo_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lib_submodulos
    ADD CONSTRAINT id_modulo_fk FOREIGN KEY (id_acceso) REFERENCES public.acceso(id_acceso) ON UPDATE CASCADE;


--
-- TOC entry 2859 (class 2606 OID 16641)
-- Name: acceso id_perfil_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.acceso
    ADD CONSTRAINT id_perfil_fk FOREIGN KEY (id_perfil) REFERENCES public.cat_perfil(id_perfil);


--
-- TOC entry 2860 (class 2606 OID 441745)
-- Name: historial usu_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.historial
    ADD CONSTRAINT usu_id_fk FOREIGN KEY (usu_id) REFERENCES public.usuarios(usu_id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- TOC entry 2862 (class 2606 OID 16651)
-- Name: usuarios usu_permiso_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usu_permiso_fk FOREIGN KEY (id_modulo) REFERENCES public.cat_modulo(id_modulo);


--
-- TOC entry 2863 (class 2606 OID 16656)
-- Name: usuarios usuarios_usu_privilegio_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_usu_privilegio_fkey FOREIGN KEY (id_perfil) REFERENCES public.cat_perfil(id_perfil);


-- Completed on 2020-06-01 09:45:56 CDT

--
-- PostgreSQL database dump complete
--

