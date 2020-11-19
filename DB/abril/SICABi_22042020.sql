--
-- PostgreSQL database dump
--

-- Dumped from database version 11.7
-- Dumped by pg_dump version 11.7

-- Started on 2020-04-22 17:56:52

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
-- TOC entry 196 (class 1259 OID 24726)
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
-- TOC entry 215 (class 1259 OID 25506)
-- Name: attr_generales; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.attr_generales (
    id numeric NOT NULL,
    nombre_sistema character varying NOT NULL,
    nombre_proceso character varying NOT NULL,
    anio smallint NOT NULL,
    ciclo character varying
);


ALTER TABLE public.attr_generales OWNER TO postgres;

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


ALTER TABLE public.attr_generales_id_seq OWNER TO postgres;

--
-- TOC entry 2956 (class 0 OID 0)
-- Dependencies: 214
-- Name: attr_generales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.attr_generales_id_seq OWNED BY public.attr_generales.id;


--
-- TOC entry 197 (class 1259 OID 24730)
-- Name: cat_modulo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cat_modulo (
    id_modulo smallint NOT NULL,
    nombre character varying(50),
    seudonimo character varying NOT NULL
);


ALTER TABLE public.cat_modulo OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 24736)
-- Name: cat_perfil; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cat_perfil (
    id_perfil smallint NOT NULL,
    nombre character varying(50) NOT NULL,
    seudonimo character varying NOT NULL
);


ALTER TABLE public.cat_perfil OWNER TO postgres;

SET default_with_oids = false;

--
-- TOC entry 199 (class 1259 OID 24742)
-- Name: edi_sellos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.edi_sellos (
    sel_id integer NOT NULL,
    edi_id integer NOT NULL,
    sel_sello character varying NOT NULL
);


ALTER TABLE public.edi_sellos OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 24748)
-- Name: edi_sellos_sel_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.edi_sellos_sel_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.edi_sellos_sel_id_seq OWNER TO postgres;

--
-- TOC entry 2957 (class 0 OID 0)
-- Dependencies: 200
-- Name: edi_sellos_sel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.edi_sellos_sel_id_seq OWNED BY public.edi_sellos.sel_id;


--
-- TOC entry 201 (class 1259 OID 24750)
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
    edi_dirofis bigint,
    edi_dirrecados bigint,
    edi_repnombre character varying NOT NULL,
    edi_repcargo character varying NOT NULL,
    edi_repemail character varying NOT NULL,
    edi_observaciones character varying
);


ALTER TABLE public.editoriales OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 24756)
-- Name: editoriales_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.editoriales_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.editoriales_id_seq OWNER TO postgres;

--
-- TOC entry 2958 (class 0 OID 0)
-- Dependencies: 202
-- Name: editoriales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.editoriales_id_seq OWNED BY public.editoriales.id;


SET default_with_oids = true;

--
-- TOC entry 203 (class 1259 OID 24758)
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
-- TOC entry 204 (class 1259 OID 24766)
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
-- TOC entry 2959 (class 0 OID 0)
-- Dependencies: 204
-- Name: id_acceso_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.id_acceso_seq OWNED BY public.acceso.id_acceso;


--
-- TOC entry 205 (class 1259 OID 24768)
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
-- TOC entry 2960 (class 0 OID 0)
-- Dependencies: 205
-- Name: id_historial_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.id_historial_seq OWNED BY public.historial.id_historial;


SET default_with_oids = false;

--
-- TOC entry 206 (class 1259 OID 24770)
-- Name: lib_submodulos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lib_submodulos (
    id_submodulo smallint NOT NULL,
    url_sub character varying NOT NULL,
    id_acceso smallint NOT NULL,
    nombre character varying NOT NULL
);


ALTER TABLE public.lib_submodulos OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 24776)
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


ALTER TABLE public."seleccionBilingue" OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 24779)
-- Name: seleccionBilingue_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."seleccionBilingue_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."seleccionBilingue_id_seq" OWNER TO postgres;

--
-- TOC entry 2961 (class 0 OID 0)
-- Dependencies: 208
-- Name: seleccionBilingue_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."seleccionBilingue_id_seq" OWNED BY public."seleccionBilingue".id;


--
-- TOC entry 209 (class 1259 OID 24781)
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


ALTER TABLE public."seleccionMonolingue" OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 24784)
-- Name: seleccionMonolingue_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."seleccionMonolingue_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."seleccionMonolingue_id_seq" OWNER TO postgres;

--
-- TOC entry 2962 (class 0 OID 0)
-- Dependencies: 210
-- Name: seleccionMonolingue_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."seleccionMonolingue_id_seq" OWNED BY public."seleccionMonolingue".id;


--
-- TOC entry 211 (class 1259 OID 24786)
-- Name: texto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.texto (
    id integer NOT NULL,
    clasificacion character varying NOT NULL,
    tipo character varying NOT NULL,
    categoria character varying NOT NULL
);


ALTER TABLE public.texto OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 24792)
-- Name: texto_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.texto_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.texto_id_seq OWNER TO postgres;

--
-- TOC entry 2963 (class 0 OID 0)
-- Dependencies: 212
-- Name: texto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.texto_id_seq OWNED BY public.texto.id;


SET default_with_oids = true;

--
-- TOC entry 213 (class 1259 OID 24794)
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
-- TOC entry 2753 (class 2604 OID 24982)
-- Name: acceso id_acceso; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.acceso ALTER COLUMN id_acceso SET DEFAULT nextval('public.id_acceso_seq'::regclass);


--
-- TOC entry 2765 (class 2604 OID 25524)
-- Name: attr_generales id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attr_generales ALTER COLUMN id SET DEFAULT nextval('public.attr_generales_id_seq'::regclass);


--
-- TOC entry 2754 (class 2604 OID 24983)
-- Name: edi_sellos sel_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.edi_sellos ALTER COLUMN sel_id SET DEFAULT nextval('public.edi_sellos_sel_id_seq'::regclass);


--
-- TOC entry 2755 (class 2604 OID 24984)
-- Name: editoriales id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.editoriales ALTER COLUMN id SET DEFAULT nextval('public.editoriales_id_seq'::regclass);


--
-- TOC entry 2758 (class 2604 OID 24985)
-- Name: historial id_historial; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.historial ALTER COLUMN id_historial SET DEFAULT nextval('public.id_historial_seq'::regclass);


--
-- TOC entry 2759 (class 2604 OID 24986)
-- Name: seleccionBilingue id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."seleccionBilingue" ALTER COLUMN id SET DEFAULT nextval('public."seleccionBilingue_id_seq"'::regclass);


--
-- TOC entry 2760 (class 2604 OID 24987)
-- Name: seleccionMonolingue id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."seleccionMonolingue" ALTER COLUMN id SET DEFAULT nextval('public."seleccionMonolingue_id_seq"'::regclass);


--
-- TOC entry 2761 (class 2604 OID 24988)
-- Name: texto id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.texto ALTER COLUMN id SET DEFAULT nextval('public.texto_id_seq'::regclass);


--
-- TOC entry 2931 (class 0 OID 24726)
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
\.


--
-- TOC entry 2950 (class 0 OID 25506)
-- Dependencies: 215
-- Data for Name: attr_generales; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.attr_generales (id, nombre_sistema, nombre_proceso, anio, ciclo) FROM stdin;
1	Sistema de Captura Bibliográfica	Proceso de Selección de Libros del Rincón	2020	2020-2021
\.


--
-- TOC entry 2932 (class 0 OID 24730)
-- Dependencies: 197
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
-- TOC entry 2933 (class 0 OID 24736)
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
-- TOC entry 2934 (class 0 OID 24742)
-- Dependencies: 199
-- Data for Name: edi_sellos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.edi_sellos (sel_id, edi_id, sel_sello) FROM stdin;
4	1021	w
5	1021	w2
6	1021	w3
7	1022	w
8	1022	w2
9	1022	w3
\.


--
-- TOC entry 2936 (class 0 OID 24750)
-- Dependencies: 201
-- Data for Name: editoriales; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.editoriales (id, usu_id, edi_razonsocial, edi_grupoedit, edi_dirgeneral, edi_dirmail, edi_dircel, edi_dirofis, edi_dirrecados, edi_repnombre, edi_repcargo, edi_repemail, edi_observaciones) FROM stdin;
1021	\N	editorial	editorial	director	prueba@gmail.com	55555	0	0	repre	elrepre	prueba@gmail.com	obs
1022	\N	editorial S.A.	editorial S.A.	director	prueba2@gmail.com	55555	0	0	repre	elrepre	prueba2@gmail.com	obs
\.


--
-- TOC entry 2938 (class 0 OID 24758)
-- Dependencies: 203
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
72	1	2020-04-02	19.1904866	-99.0889225	11:12:34.599727-06
73	2	2020-04-02	19.1904866	-99.0889225	11:13:37.876567-06
74	1	2020-04-02	19.1904866	-99.0889225	11:25:15.71934-06
75	2	2020-04-02	19.1904866	-99.0889225	11:25:39.414594-06
76	2	2020-04-02	19.1904866	-99.0889225	11:34:08.263526-06
77	2	2020-04-02			11:34:55.56163-06
78	2	2020-04-02	19.1905721	-99.08900659999999	11:45:41.714408-06
79	2	2020-04-02	19.1905721	-99.08900659999999	11:46:41.699189-06
80	2	2020-04-02	19.1905721	-99.08900659999999	11:47:10.384492-06
81	2	2020-04-02	19.1905721	-99.08900659999999	11:47:25.935044-06
82	2	2020-04-02	19.1905721	-99.08900659999999	11:47:42.441142-06
83	1	2020-04-02	19.1905721	-99.08900659999999	11:49:07.980281-06
84	2	2020-04-02	19.1905721	-99.08900659999999	11:50:21.681188-06
85	1	2020-04-02	19.1905255	-99.0889686	11:59:38.374028-06
86	2	2020-04-02	19.1905255	-99.0889686	12:00:12.873287-06
87	1	2020-04-02	19.1905316	-99.0889997	15:28:07.144233-06
88	2	2020-04-02	19.1905316	-99.0889997	15:28:15.105829-06
89	1	2020-04-03	19.190543899999998	-99.08894939999999	11:29:39.732959-06
90	2	2020-04-03	19.1905108	-99.0889421	11:33:53.960891-06
91	1	2020-04-03	19.1905505	-99.0890134	11:52:48.210408-06
92	2	2020-04-03	19.1905355	-99.0890077	11:57:50.949906-06
93	1	2020-04-03	19.1905108	-99.0889421	12:04:58.469592-06
94	1	2020-04-03	19.1905108	-99.0889421	12:05:11.154363-06
95	1	2020-04-03	19.1905108	-99.0889421	12:05:32.434483-06
96	2	2020-04-03	19.1905251	-99.0889318	13:27:09.378507-06
97	1	2020-04-03	19.1905251	-99.0889318	13:27:20.330952-06
98	2	2020-04-03	19.1905418	-99.0889955	14:35:44.065389-06
99	1	2020-04-03	19.1905418	-99.0889955	14:39:36.376631-06
100	2	2020-04-03	19.1905418	-99.0889955	14:42:44.36222-06
101	2	2020-04-03	19.1905418	-99.0889955	14:57:05.789517-06
102	1	2020-04-03	19.1905505	-99.0890134	14:57:23.240741-06
103	1	2020-04-03	0	0	15:18:55.56199-06
104	2	2020-04-03	19.1905651	-99.0889808	15:27:15.263612-06
105	1	2020-04-03	19.1905651	-99.0889808	15:28:15.411094-06
106	1	2020-04-03	19.190535900000004	-99.08895179999999	16:43:21.8165-06
107	2	2020-04-03	19.190535900000004	-99.08895179999999	16:43:54.521698-06
108	1	2020-04-10	19.1905736	-99.0889691	12:54:35.505743-05
109	1	2020-04-10	19.1905114	-99.0889722	13:38:53.256239-05
110	2	2020-04-10	19.190548	-99.0890067	22:23:39.863904-05
111	1	2020-04-10	19.190548	-99.0890067	22:23:55.805252-05
112	1	2020-04-13	19.1905607	-99.08896399999999	14:29:12.690059-05
113	1	2020-04-13	19.1905263	-99.0889483	20:02:40.51108-05
114	1	2020-04-15	19.1905657	-99.08898529999999	11:34:04.590612-05
115	2	2020-04-15	19.1905657	-99.08898529999999	11:34:58.350698-05
116	1	2020-04-20	19.1905403	-99.08892349999999	14:21:16.13323-05
117	251	2020-04-20	19.190538	-99.08896879999999	14:46:46.964712-05
118	1	2020-04-20	19.190538	-99.08896879999999	14:47:15.048047-05
119	1	2020-04-20	19.190544499999998	-99.0889464	16:46:49.373601-05
120	1	2020-04-21	19.1905407	-99.0889219	11:26:49.540928-05
121	1	2020-04-21	19.1905739	-99.0889895	12:01:15.674226-05
122	343	2020-04-21	19.1905739	-99.0889895	12:11:54.67885-05
123	1	2020-04-21	19.1905739	-99.0889895	12:15:03.70443-05
124	1	2020-04-21	19.190569099999998	-99.0889873	13:15:17.316082-05
125	1	2020-04-21			15:30:52.857649-05
126	1	2020-04-21			18:47:32.190421-05
127	1	2020-04-22	19.1905391	-99.08897329999999	11:51:24.091363-05
128	1	2020-04-22	19.190557200000004	-99.0890509	16:10:57.632509-05
129	1	2020-04-22	19.190524699999997	-99.0889667	16:30:14.049778-05
130	1	2020-04-22	19.190580399999998	-99.08901279999999	17:17:11.158684-05
131	1	2020-04-22	19.190580399999998	-99.08901279999999	17:22:16.702063-05
132	1	2020-04-22	19.190557200000004	-99.0890509	17:24:54.360098-05
133	2	2020-04-22	19.1905364	-99.0889677	17:29:29.577669-05
134	1	2020-04-22	19.1905364	-99.0889677	17:32:58.168733-05
\.


--
-- TOC entry 2941 (class 0 OID 24770)
-- Dependencies: 206
-- Data for Name: lib_submodulos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.lib_submodulos (id_submodulo, url_sub, id_acceso, nombre) FROM stdin;
1	administrador/convocatoria/generales	3	Atributos Generales
3	administrador/convocatoria/fechas	3	Fechas
2	administrador/convocatoria/clasificacionIndicativa	3	Tabla de clasificación Indicativa 
5	acreditador/acreditacion/	14	Acreditacion
6	acreditador/acreditacion/historial	14	Historial
4	administrador/acreditacion/usuarios	5	Usuarios
\.


--
-- TOC entry 2942 (class 0 OID 24776)
-- Dependencies: 207
-- Data for Name: seleccionBilingue; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."seleccionBilingue" (id, clasificacion, grado, biblioteca, "numPreseleccion", "numSeleccion") FROM stdin;
41	de_prescolar_a_tercero_de_primaria_textos_bilingues	1pre	BE	11	10
42	de_prescolar_a_tercero_de_primaria_textos_bilingues	pri	BE	10	0
\.


--
-- TOC entry 2944 (class 0 OID 24781)
-- Dependencies: 209
-- Data for Name: seleccionMonolingue; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."seleccionMonolingue" (id, texto, grado, biblioteca, "numPreseleccion", "numSeleccion") FROM stdin;
718	1	2pre	BA	1	1
719	1	1pre	BA	5	5
720	1	1pri	BA	3	3
721	1	2pri	BA	4	4
722	1	3pri	BA	5	5
723	2	pre	BE	555	55
724	2	pri	BE	554	444
725	3	1pri	BA	1	1
726	6	1pre	BA	550	10
727	12	1pre	BA	1	1
728	12	pri	BE	-1	-1
729	13	pre	BE	1	1
730	13	1pre	BA	0	0
731	22	2pre	BA	1	1
732	48	4pri	BA	2	2
733	1	pre	BE	2	0
734	1	pri	BE	3	0
\.


--
-- TOC entry 2946 (class 0 OID 24786)
-- Dependencies: 211
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
-- TOC entry 2948 (class 0 OID 24794)
-- Dependencies: 213
-- Data for Name: usuarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuarios (usu_id, id_perfil, id_modulo, usu_nombre, usu_login, usu_pass, usu_creador) FROM stdin;
1	1	1	Raul Retana Gervacio	kyo	asian	0
2	2	2	Acreditador	1	1	1
251	2	2	raul	retana	123	1
343	2	2	isabel 	isabel	123	1
\.


--
-- TOC entry 2964 (class 0 OID 0)
-- Dependencies: 214
-- Name: attr_generales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.attr_generales_id_seq', 2, true);


--
-- TOC entry 2965 (class 0 OID 0)
-- Dependencies: 200
-- Name: edi_sellos_sel_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.edi_sellos_sel_id_seq', 9, true);


--
-- TOC entry 2966 (class 0 OID 0)
-- Dependencies: 202
-- Name: editoriales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.editoriales_id_seq', 1022, true);


--
-- TOC entry 2967 (class 0 OID 0)
-- Dependencies: 204
-- Name: id_acceso_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.id_acceso_seq', 13, true);


--
-- TOC entry 2968 (class 0 OID 0)
-- Dependencies: 205
-- Name: id_historial_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.id_historial_seq', 134, true);


--
-- TOC entry 2969 (class 0 OID 0)
-- Dependencies: 208
-- Name: seleccionBilingue_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."seleccionBilingue_id_seq"', 42, true);


--
-- TOC entry 2970 (class 0 OID 0)
-- Dependencies: 210
-- Name: seleccionMonolingue_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."seleccionMonolingue_id_seq"', 734, true);


--
-- TOC entry 2971 (class 0 OID 0)
-- Dependencies: 212
-- Name: texto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.texto_id_seq', 1, false);


--
-- TOC entry 2800 (class 2606 OID 25526)
-- Name: attr_generales attr_generales_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attr_generales
    ADD CONSTRAINT attr_generales_pkey PRIMARY KEY (id);


--
-- TOC entry 2777 (class 2606 OID 24904)
-- Name: editoriales editoriales_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.editoriales
    ADD CONSTRAINT editoriales_pkey PRIMARY KEY (id);


--
-- TOC entry 2767 (class 2606 OID 24906)
-- Name: acceso key_id_acceso; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.acceso
    ADD CONSTRAINT key_id_acceso PRIMARY KEY (id_acceso);


--
-- TOC entry 2783 (class 2606 OID 24908)
-- Name: historial key_id_historial; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.historial
    ADD CONSTRAINT key_id_historial PRIMARY KEY (id_historial);


--
-- TOC entry 2769 (class 2606 OID 24910)
-- Name: cat_modulo key_id_modulo; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cat_modulo
    ADD CONSTRAINT key_id_modulo PRIMARY KEY (id_modulo);


--
-- TOC entry 2771 (class 2606 OID 24912)
-- Name: cat_perfil key_id_perfil; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cat_perfil
    ADD CONSTRAINT key_id_perfil PRIMARY KEY (id_perfil);


--
-- TOC entry 2798 (class 2606 OID 24914)
-- Name: usuarios key_usu_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT key_usu_id PRIMARY KEY (usu_id);


--
-- TOC entry 2785 (class 2606 OID 24916)
-- Name: lib_submodulos lib_submodulos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lib_submodulos
    ADD CONSTRAINT lib_submodulos_pkey PRIMARY KEY (id_submodulo);


--
-- TOC entry 2791 (class 2606 OID 24918)
-- Name: seleccionMonolingue pk_seleccionMonolingue_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."seleccionMonolingue"
    ADD CONSTRAINT "pk_seleccionMonolingue_id" PRIMARY KEY (texto, grado, biblioteca);


--
-- TOC entry 2773 (class 2606 OID 24920)
-- Name: edi_sellos pk_sellos_edi_id_sel_sello; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.edi_sellos
    ADD CONSTRAINT pk_sellos_edi_id_sel_sello PRIMARY KEY (edi_id, sel_sello);


--
-- TOC entry 2787 (class 2606 OID 24922)
-- Name: seleccionBilingue seleccionBilingue_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."seleccionBilingue"
    ADD CONSTRAINT "seleccionBilingue_pkey" PRIMARY KEY (clasificacion, grado, biblioteca);


--
-- TOC entry 2795 (class 2606 OID 24924)
-- Name: texto texto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.texto
    ADD CONSTRAINT texto_pkey PRIMARY KEY (id);


--
-- TOC entry 2779 (class 2606 OID 24926)
-- Name: editoriales unique_editorial_dir_mail; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.editoriales
    ADD CONSTRAINT unique_editorial_dir_mail UNIQUE (edi_dirmail);


--
-- TOC entry 2781 (class 2606 OID 24928)
-- Name: editoriales unique_editorial_rep_mail; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.editoriales
    ADD CONSTRAINT unique_editorial_rep_mail UNIQUE (edi_repemail);


--
-- TOC entry 2793 (class 2606 OID 24930)
-- Name: seleccionMonolingue unique_id_seleccionMonolingue; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."seleccionMonolingue"
    ADD CONSTRAINT "unique_id_seleccionMonolingue" UNIQUE (id);


--
-- TOC entry 2789 (class 2606 OID 24932)
-- Name: seleccionBilingue unique_seleccionBilingue_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."seleccionBilingue"
    ADD CONSTRAINT "unique_seleccionBilingue_id" UNIQUE (id);


--
-- TOC entry 2775 (class 2606 OID 24934)
-- Name: edi_sellos unique_sellos_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.edi_sellos
    ADD CONSTRAINT unique_sellos_id UNIQUE (sel_id);


--
-- TOC entry 2796 (class 1259 OID 24935)
-- Name: idx_usu_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX idx_usu_id ON public.usuarios USING btree (usu_id);


--
-- TOC entry 2804 (class 2606 OID 24936)
-- Name: editoriales fk_editoriales_usu_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.editoriales
    ADD CONSTRAINT fk_editoriales_usu_id FOREIGN KEY (usu_id) REFERENCES public.usuarios(usu_id);


--
-- TOC entry 2807 (class 2606 OID 24941)
-- Name: seleccionMonolingue fk_seleccionMonolingue_texto; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."seleccionMonolingue"
    ADD CONSTRAINT "fk_seleccionMonolingue_texto" FOREIGN KEY (texto) REFERENCES public.texto(id) NOT VALID;


--
-- TOC entry 2803 (class 2606 OID 24946)
-- Name: edi_sellos fk_sellos_edi_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.edi_sellos
    ADD CONSTRAINT fk_sellos_edi_id FOREIGN KEY (edi_id) REFERENCES public.editoriales(id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- TOC entry 2801 (class 2606 OID 24951)
-- Name: acceso id_modulo_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.acceso
    ADD CONSTRAINT id_modulo_fk FOREIGN KEY (id_modulo) REFERENCES public.cat_modulo(id_modulo);


--
-- TOC entry 2806 (class 2606 OID 24956)
-- Name: lib_submodulos id_modulo_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lib_submodulos
    ADD CONSTRAINT id_modulo_fk FOREIGN KEY (id_acceso) REFERENCES public.acceso(id_acceso) ON UPDATE CASCADE;


--
-- TOC entry 2802 (class 2606 OID 24961)
-- Name: acceso id_perfil_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.acceso
    ADD CONSTRAINT id_perfil_fk FOREIGN KEY (id_perfil) REFERENCES public.cat_perfil(id_perfil);


--
-- TOC entry 2805 (class 2606 OID 24966)
-- Name: historial usu_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.historial
    ADD CONSTRAINT usu_id_fk FOREIGN KEY (usu_id) REFERENCES public.usuarios(usu_id);


--
-- TOC entry 2808 (class 2606 OID 24971)
-- Name: usuarios usu_permiso_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usu_permiso_fk FOREIGN KEY (id_modulo) REFERENCES public.cat_modulo(id_modulo);


--
-- TOC entry 2809 (class 2606 OID 24976)
-- Name: usuarios usuarios_usu_privilegio_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_usu_privilegio_fkey FOREIGN KEY (id_perfil) REFERENCES public.cat_perfil(id_perfil);


-- Completed on 2020-04-22 17:56:52

--
-- PostgreSQL database dump complete
--

