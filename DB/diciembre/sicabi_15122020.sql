--
-- PostgreSQL database dump
--

-- Dumped from database version 11.10 (Debian 11.10-1.pgdg90+1)
-- Dumped by pg_dump version 11.10 (Debian 11.10-1.pgdg90+1)

-- Started on 2020-12-15 23:51:33 CST

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


ALTER TABLE public.acceso OWNER TO postgres;

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
    biblioteca character varying,
    logotipo character varying
);


ALTER TABLE public.attr_generales OWNER TO postgres;

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


ALTER TABLE public.attr_generales_id_seq OWNER TO postgres;

--
-- TOC entry 3073 (class 0 OID 0)
-- Dependencies: 215
-- Name: attr_generales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.attr_generales_id_seq OWNED BY public.attr_generales.id;


--
-- TOC entry 217 (class 1259 OID 441882)
-- Name: cat_estados; Type: TABLE; Schema: public; Owner: raul
--

CREATE TABLE public.cat_estados (
    est_id smallint NOT NULL,
    est_abreviado character varying,
    est_estado character varying
);


ALTER TABLE public.cat_estados OWNER TO raul;

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


ALTER TABLE public.cat_modulo OWNER TO postgres;

--
-- TOC entry 3074 (class 0 OID 0)
-- Dependencies: 197
-- Name: COLUMN cat_modulo.fecha_inicio_acceso; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.cat_modulo.fecha_inicio_acceso IS 'Representa la fecha de inicio para poder acceder al módulo';


--
-- TOC entry 3075 (class 0 OID 0)
-- Dependencies: 197
-- Name: COLUMN cat_modulo.fecha_fin_acceso; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.cat_modulo.fecha_fin_acceso IS 'Representa la fecha de fin de acceso al módulo';


--
-- TOC entry 3076 (class 0 OID 0)
-- Dependencies: 197
-- Name: COLUMN cat_modulo.restriccion_modulo; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.cat_modulo.restriccion_modulo IS 'Representa la confirmación de la aplicación de restricción al módulo.';


--
-- TOC entry 218 (class 1259 OID 441922)
-- Name: cat_municipios; Type: TABLE; Schema: public; Owner: raul
--

CREATE TABLE public.cat_municipios (
    mun_id integer NOT NULL,
    est_id smallint NOT NULL,
    mun_municipio character varying NOT NULL
);


ALTER TABLE public.cat_municipios OWNER TO raul;

--
-- TOC entry 216 (class 1259 OID 441775)
-- Name: cat_paises; Type: TABLE; Schema: public; Owner: raul
--

CREATE TABLE public.cat_paises (
    pai_id smallint NOT NULL,
    pai_pais character varying(50),
    pai_abreviado character varying(4)
);


ALTER TABLE public.cat_paises OWNER TO raul;

--
-- TOC entry 198 (class 1259 OID 16505)
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
-- TOC entry 213 (class 1259 OID 433059)
-- Name: edi_sellos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.edi_sellos (
    sel_id integer NOT NULL,
    edi_id integer NOT NULL,
    sel_sello character varying NOT NULL,
    fecha_creacion date
);


ALTER TABLE public.edi_sellos OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 433057)
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
-- TOC entry 3077 (class 0 OID 0)
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
    fecha_creacion date,
    edi_activo boolean DEFAULT false NOT NULL,
    edi_rfc character varying,
    edi_colonia character varying,
    edi_calle character varying,
    edi_numero character varying,
    edi_cp character varying,
    edi_ciudad character varying[],
    edi_pais character varying,
    edi_entidad_federativa character varying,
    edi_delegacion character varying,
    edi_telefonos character varying,
    edi_email character varying,
    acreditador character varying
);


ALTER TABLE public.editoriales OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 433018)
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
-- TOC entry 3078 (class 0 OID 0)
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


ALTER TABLE public.historial OWNER TO postgres;

SET default_with_oids = false;

--
-- TOC entry 224 (class 1259 OID 444596)
-- Name: historial_actividades; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.historial_actividades (
    id integer NOT NULL,
    modulo character varying NOT NULL,
    elemento character varying NOT NULL,
    atributo character varying NOT NULL,
    actividad character varying NOT NULL,
    fecha date NOT NULL,
    valor_previo character varying NOT NULL,
    valor_actual character varying NOT NULL,
    usu_id integer NOT NULL
);


ALTER TABLE public.historial_actividades OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 444594)
-- Name: historial_actividades_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.historial_actividades_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.historial_actividades_id_seq OWNER TO postgres;

--
-- TOC entry 3079 (class 0 OID 0)
-- Dependencies: 223
-- Name: historial_actividades_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.historial_actividades_id_seq OWNED BY public.historial_actividades.id;


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


ALTER TABLE public.id_acceso_seq OWNER TO postgres;

--
-- TOC entry 3080 (class 0 OID 0)
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


ALTER TABLE public.id_historial_seq OWNER TO postgres;

--
-- TOC entry 3081 (class 0 OID 0)
-- Dependencies: 201
-- Name: id_historial_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.id_historial_seq OWNED BY public.historial.id_historial;


--
-- TOC entry 222 (class 1259 OID 444428)
-- Name: lib_autores; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lib_autores (
    lib_id integer NOT NULL,
    aut_id integer NOT NULL,
    aut_nombre character varying NOT NULL,
    aut_tipo character varying NOT NULL,
    aut_pais integer NOT NULL
);


ALTER TABLE public.lib_autores OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 444426)
-- Name: lib_autores_aut_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.lib_autores_aut_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.lib_autores_aut_id_seq OWNER TO postgres;

--
-- TOC entry 3082 (class 0 OID 0)
-- Dependencies: 221
-- Name: lib_autores_aut_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.lib_autores_aut_id_seq OWNED BY public.lib_autores.aut_id;


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


ALTER TABLE public.lib_submodulos OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 444412)
-- Name: libros; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.libros (
    lib_id integer NOT NULL,
    lib_titulo character varying NOT NULL,
    usu_id integer NOT NULL
);


ALTER TABLE public.libros OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 444410)
-- Name: libros_lib_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.libros_lib_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.libros_lib_id_seq OWNER TO postgres;

--
-- TOC entry 3083 (class 0 OID 0)
-- Dependencies: 219
-- Name: libros_lib_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.libros_lib_id_seq OWNED BY public.libros.lib_id;


--
-- TOC entry 209 (class 1259 OID 16712)
-- Name: seleccionBilingue; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."seleccionBilingue" (
    id integer NOT NULL,
    categoria character varying(100) NOT NULL,
    grado character varying(100) NOT NULL,
    biblioteca character varying(10) NOT NULL,
    "numPreseleccion" integer NOT NULL,
    "numSeleccion" integer NOT NULL,
    clasificacion character varying(100)
);


ALTER TABLE public."seleccionBilingue" OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 16710)
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
-- TOC entry 3084 (class 0 OID 0)
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
    grado character varying(100) NOT NULL,
    biblioteca character varying(10) NOT NULL,
    "numPreseleccion" integer NOT NULL,
    "numSeleccion" integer NOT NULL,
    categoria character varying(100) NOT NULL,
    clasificacion character varying(100),
    id_texto integer
);


ALTER TABLE public."seleccionMonolingue" OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 16677)
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
-- TOC entry 3085 (class 0 OID 0)
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
    categoria character varying NOT NULL,
    tipo_clasificacion character varying
);


ALTER TABLE public.texto OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 16662)
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
-- TOC entry 3086 (class 0 OID 0)
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


ALTER TABLE public.usuarios OWNER TO postgres;

--
-- TOC entry 2843 (class 2604 OID 433402)
-- Name: acceso id_acceso; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.acceso ALTER COLUMN id_acceso SET DEFAULT nextval('public.id_acceso_seq'::regclass);


--
-- TOC entry 2856 (class 2604 OID 441653)
-- Name: attr_generales id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attr_generales ALTER COLUMN id SET DEFAULT nextval('public.attr_generales_id_seq'::regclass);


--
-- TOC entry 2855 (class 2604 OID 433404)
-- Name: edi_sellos sel_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.edi_sellos ALTER COLUMN sel_id SET DEFAULT nextval('public.edi_sellos_sel_id_seq'::regclass);


--
-- TOC entry 2853 (class 2604 OID 433405)
-- Name: editoriales id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.editoriales ALTER COLUMN id SET DEFAULT nextval('public.editoriales_id_seq'::regclass);


--
-- TOC entry 2846 (class 2604 OID 433406)
-- Name: historial id_historial; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.historial ALTER COLUMN id_historial SET DEFAULT nextval('public.id_historial_seq'::regclass);


--
-- TOC entry 2859 (class 2604 OID 444599)
-- Name: historial_actividades id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.historial_actividades ALTER COLUMN id SET DEFAULT nextval('public.historial_actividades_id_seq'::regclass);


--
-- TOC entry 2858 (class 2604 OID 444431)
-- Name: lib_autores aut_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lib_autores ALTER COLUMN aut_id SET DEFAULT nextval('public.lib_autores_aut_id_seq'::regclass);


--
-- TOC entry 2857 (class 2604 OID 444415)
-- Name: libros lib_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.libros ALTER COLUMN lib_id SET DEFAULT nextval('public.libros_lib_id_seq'::regclass);


--
-- TOC entry 2852 (class 2604 OID 433407)
-- Name: seleccionBilingue id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."seleccionBilingue" ALTER COLUMN id SET DEFAULT nextval('public."seleccionBilingue_id_seq"'::regclass);


--
-- TOC entry 2851 (class 2604 OID 433408)
-- Name: seleccionMonolingue id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."seleccionMonolingue" ALTER COLUMN id SET DEFAULT nextval('public."seleccionMonolingue_id_seq"'::regclass);


--
-- TOC entry 2850 (class 2604 OID 433409)
-- Name: texto id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.texto ALTER COLUMN id SET DEFAULT nextval('public.texto_id_seq'::regclass);


--
-- TOC entry 3039 (class 0 OID 16495)
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
-- TOC entry 3057 (class 0 OID 441645)
-- Dependencies: 214
-- Data for Name: attr_generales; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.attr_generales (id, nombre_sistema, nombre_proceso, anio, ciclo, siglas, biblioteca, logotipo) FROM stdin;
1	Sistema de Captura Bibliográfica	Proceso de Selección de Libros del Rincón	2020	2020-2022	SICABIs	Escolares y de Aula	assets/imgs/logo21.png
\.


--
-- TOC entry 3060 (class 0 OID 441882)
-- Dependencies: 217
-- Data for Name: cat_estados; Type: TABLE DATA; Schema: public; Owner: raul
--

COPY public.cat_estados (est_id, est_abreviado, est_estado) FROM stdin;
1	Ags	Aguascalientes
2	BC	Baja California
3	BCS	Baja California Sur
4	Camp	Campeche
10	Dgo	Durango
11	Gto	Guanajuato
12	Gro	Guerrero
13	Hgo	Hidalgo
14	Jal	Jalisco
15	Mex	México
16	Mich	Michoacán
17	Mor	Morelos
18	Nay	Nayarit
19	NL	Nuevo León
20	Oax	Oaxaca
21	Pue	Puebla
22	Qro	Querétaro
23	QRoo	Quintana Roo
24	SLP	San Luis Potosí
25	Sin	Sinaloa
26	Son	Sonora
27	Tab	Tabasco
28	Tamps	Tamaulipas
29	Tlax	Tlaxcala
30	Ver	Veracruz
31	Yuc	Yucatán
32	Zac	Zacatecas
6	Col	Colima
7	Chis	Chiapas
8	Chih	Chihuahua
5	Coah	Coahuila
9	CdMx	Ciudad de México
\.


--
-- TOC entry 3040 (class 0 OID 16499)
-- Dependencies: 197
-- Data for Name: cat_modulo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cat_modulo (id_modulo, nombre, seudonimo, fecha_inicio_acceso, fecha_fin_acceso, restriccion_modulo) FROM stdin;
1	Convocatoria	convocatoria	2020-04-30	2021-01-01	\N
2	Acreditación de Editoriales	acreditacion	2020-05-01	2020-12-31	\N
3	Registro de Títulos	registro	2020-05-01	2020-05-22	\N
4	Entrega de Materiales	entrega	2020-05-01	2020-07-01	\N
5	Preeselección	preseleccion	2020-05-01	2020-10-31	\N
6	Entrega de materiales Preeselección	entrega	2020-05-01	2020-05-01	\N
7	Selección	seleccion	2020-05-01	2020-05-30	\N
8	Evaluación Técnica	evaluacion	2020-05-01	2020-05-01	\N
\.


--
-- TOC entry 3061 (class 0 OID 441922)
-- Dependencies: 218
-- Data for Name: cat_municipios; Type: TABLE DATA; Schema: public; Owner: raul
--

COPY public.cat_municipios (mun_id, est_id, mun_municipio) FROM stdin;
1	1	Aguascalientes
2	1	Asientos
3	1	Calvillo
4	1	Cosío
5	1	Jesús María
6	1	Pabellón de Arteaga
7	1	Rincón de Romos
8	1	San José de Gracia
9	1	Tepezalá
10	1	El Llano
11	1	San Francisco de los Romo
1	2	Ensenada
2	2	Mexicali
3	2	Tecate
4	2	Tijuana
5	2	Playas de Rosarito
1	3	Comondú
2	3	Mulegé
3	3	La Paz
8	3	Los Cabos
9	3	Loreto
1	4	Calkiní
2	4	Campeche
3	4	Carmen
4	4	Champotón
5	4	Hecelchakán
6	4	Hopelchén
7	4	Palizada
8	4	Tenabo
9	4	Escárcega
10	4	Calakmul
11	4	Candelaria
1	5	Abasolo
2	5	Acuña
3	5	Allende
4	5	Arteaga
5	5	Candela
6	5	Castaños
7	5	Cuatro Ciénegas
8	5	Escobedo
9	5	Francisco I. Madero
10	5	Frontera
11	5	General Cepeda
12	5	Guerrero
13	5	Hidalgo
14	5	Jiménez
15	5	Juárez
16	5	Lamadrid
17	5	Matamoros
18	5	Monclova
19	5	Morelos
20	5	Múzquiz
21	5	Nadadores
22	5	Nava
23	5	Ocampo
24	5	Parras
25	5	Piedras Negras
26	5	Progreso
27	5	Ramos Arizpe
28	5	Sabinas
29	5	Sacramento
30	5	Saltillo
31	5	San Buenaventura
32	5	San Juan de Sabinas
33	5	San Pedro
34	5	Sierra Mojada
35	5	Torreón
36	5	Viesca
37	5	Villa Unión
38	5	Zaragoza
1	6	Armería
2	6	Colima
3	6	Comala
4	6	Coquimatlán
5	6	Cuauhtémoc
6	6	Ixtlahuacán
7	6	Manzanillo
8	6	Minatitlán
9	6	Tecomán
10	6	Villa de Álvarez
1	7	Acacoyagua
2	7	Acala
3	7	Acapetahua
4	7	Altamirano
5	7	Amatán
6	7	Amatenango de la Frontera
7	7	Amatenango del Valle
8	7	Angel Albino Corzo
9	7	Arriaga
10	7	Bejucal de Ocampo
11	7	Bella Vista
12	7	Berriozábal
13	7	Bochil
14	7	El Bosque
15	7	Cacahoatán
16	7	Catazajá
17	7	Cintalapa
18	7	Coapilla
19	7	Comitán de Domínguez
20	7	La Concordia
21	7	Copainalá
22	7	Chalchihuitán
23	7	Chamula
24	7	Chanal
25	7	Chapultenango
26	7	Chenalhó
27	7	Chiapa de Corzo
28	7	Chiapilla
29	7	Chicoasén
30	7	Chicomuselo
31	7	Chilón
32	7	Escuintla
33	7	Francisco León
34	7	Frontera Comalapa
35	7	Frontera Hidalgo
36	7	La Grandeza
37	7	Huehuetán
38	7	Huixtán
39	7	Huitiupán
40	7	Huixtla
41	7	La Independencia
42	7	Ixhuatán
43	7	Ixtacomitán
44	7	Ixtapa
45	7	Ixtapangajoya
46	7	Jiquipilas
47	7	Jitotol
48	7	Juárez
49	7	Larráinzar
50	7	La Libertad
51	7	Mapastepec
52	7	Las Margaritas
53	7	Mazapa de Madero
54	7	Mazatán
55	7	Metapa
56	7	Mitontic
57	7	Motozintla
58	7	Nicolás Ruíz
59	7	Ocosingo
60	7	Ocotepec
61	7	Ocozocoautla de Espinosa
62	7	Ostuacán
63	7	Osumacinta
64	7	Oxchuc
65	7	Palenque
66	7	Pantelhó
67	7	Pantepec
68	7	Pichucalco
69	7	Pijijiapan
70	7	El Porvenir
71	7	Villa Comaltitlán
72	7	Pueblo Nuevo Solistahuacán
73	7	Rayón
74	7	Reforma
75	7	Las Rosas
76	7	Sabanilla
77	7	Salto de Agua
78	7	San Cristóbal de las Casas
79	7	San Fernando
80	7	Siltepec
81	7	Simojovel
82	7	Sitalá
83	7	Socoltenango
84	7	Solosuchiapa
85	7	Soyaló
86	7	Suchiapa
87	7	Suchiate
88	7	Sunuapa
89	7	Tapachula
90	7	Tapalapa
91	7	Tapilula
92	7	Tecpatán
93	7	Tenejapa
94	7	Teopisca
96	7	Tila
97	7	Tonalá
98	7	Totolapa
99	7	La Trinitaria
100	7	Tumbalá
101	7	Tuxtla Gutiérrez
102	7	Tuxtla Chico
103	7	Tuzantán
104	7	Tzimol
105	7	Unión Juárez
106	7	Venustiano Carranza
107	7	Villa Corzo
108	7	Villaflores
109	7	Yajalón
110	7	San Lucas
111	7	Zinacantán
112	7	San Juan Cancuc
113	7	Aldama
114	7	Benemérito de las Américas
115	7	Maravilla Tenejapa
116	7	Marqués de Comillas
117	7	Montecristo de Guerrero
118	7	San Andrés Duraznal
119	7	Santiago el Pinar
1	8	Ahumada
2	8	Aldama
3	8	Allende
4	8	Aquiles Serdán
5	8	Ascensión
6	8	Bachíniva
7	8	Balleza
8	8	Batopilas
9	8	Bocoyna
10	8	Buenaventura
11	8	Camargo
12	8	Carichí
13	8	Casas Grandes
14	8	Coronado
15	8	Coyame del Sotol
16	8	La Cruz
17	8	Cuauhtémoc
18	8	Cusihuiriachi
19	8	Chihuahua
20	8	Chínipas
21	8	Delicias
22	8	Dr. Belisario Domínguez
23	8	Galeana
24	8	Santa Isabel
25	8	Gómez Farías
26	8	Gran Morelos
27	8	Guachochi
28	8	Guadalupe
29	8	Guadalupe y Calvo
30	8	Guazapares
31	8	Guerrero
32	8	Hidalgo del Parral
33	8	Huejotitán
34	8	Ignacio Zaragoza
35	8	Janos
36	8	Jiménez
37	8	Juárez
38	8	Julimes
39	8	López
40	8	Madera
41	8	Maguarichi
42	8	Manuel Benavides
43	8	Matachí
44	8	Matamoros
45	8	Meoqui
46	8	Morelos
47	8	Moris
48	8	Namiquipa
49	8	Nonoava
50	8	Nuevo Casas Grandes
51	8	Ocampo
52	8	Ojinaga
53	8	Praxedis G. Guerrero
54	8	Riva Palacio
55	8	Rosales
56	8	Rosario
57	8	San Francisco de Borja
58	8	San Francisco de Conchos
59	8	San Francisco del Oro
60	8	Santa Bárbara
61	8	Satevó
62	8	Saucillo
63	8	Temósachic
64	8	El Tule
65	8	Urique
66	8	Uruachi
67	8	Valle de Zaragoza
2	9	Azcapotzalco
3	9	Coyoacán
4	9	Cuajimalpa de Morelos
5	9	Gustavo A. Madero
6	9	Iztacalco
7	9	Iztapalapa
8	9	La Magdalena Contreras
9	9	Milpa Alta
10	9	Álvaro Obregón
11	9	Tláhuac
12	9	Tlalpan
13	9	Xochimilco
14	9	Benito Juárez
15	9	Cuauhtémoc
16	9	Miguel Hidalgo
17	9	Venustiano Carranza
1	10	Canatlán
2	10	Canelas
3	10	Coneto de Comonfort
4	10	Cuencamé
5	10	Durango
6	10	General Simón Bolívar
7	10	Gómez Palacio
8	10	Guadalupe Victoria
9	10	Guanaceví
10	10	Hidalgo
11	10	Indé
12	10	Lerdo
13	10	Mapimí
14	10	Mezquital
15	10	Nazas
16	10	Nombre de Dios
17	10	Ocampo
18	10	El Oro
19	10	Otáez
20	10	Pánuco de Coronado
21	10	Peñón Blanco
22	10	Poanas
23	10	Pueblo Nuevo
24	10	Rodeo
25	10	San Bernardo
26	10	San Dimas
27	10	San Juan de Guadalupe
28	10	San Juan del Río
29	10	San Luis del Cordero
30	10	San Pedro del Gallo
31	10	Santa Clara
32	10	Santiago Papasquiaro
33	10	Súchil
34	10	Tamazula
35	10	Tepehuanes
36	10	Tlahualilo
37	10	Topia
38	10	Vicente Guerrero
39	10	Nuevo Ideal
1	11	Abasolo
2	11	Acámbaro
3	11	San Miguel de Allende
4	11	Apaseo el Alto
5	11	Apaseo el Grande
6	11	Atarjea
7	11	Celaya
8	11	Manuel Doblado
9	11	Comonfort
10	11	Coroneo
11	11	Cortazar
12	11	Cuerámaro
13	11	Doctor Mora
14	11	Dolores Hidalgo Cuna de la Independencia Nacional
15	11	Guanajuato
16	11	Huanímaro
17	11	Irapuato
18	11	Jaral del Progreso
19	11	Jerécuaro
20	11	León
21	11	Moroleón
22	11	Ocampo
23	11	Pénjamo
24	11	Pueblo Nuevo
25	11	Purísima del Rincón
26	11	Romita
27	11	Salamanca
28	11	Salvatierra
29	11	San Diego de la Unión
30	11	San Felipe
31	11	San Francisco del Rincón
32	11	San José Iturbide
33	11	San Luis de la Paz
34	11	Santa Catarina
35	11	Santa Cruz de Juventino Rosas
36	11	Santiago Maravatío
37	11	Silao de la Victoria
38	11	Tarandacuao
39	11	Tarimoro
40	11	Tierra Blanca
41	11	Uriangato
42	11	Valle de Santiago
43	11	Victoria
44	11	Villagrán
45	11	Xichú
46	11	Yuriria
1	12	Acapulco de Juárez
2	12	Ahuacuotzingo
3	12	Ajuchitlán del Progreso
4	12	Alcozauca de Guerrero
5	12	Alpoyeca
6	12	Apaxtla
7	12	Arcelia
8	12	Atenango del Río
9	12	Atlamajalcingo del Monte
10	12	Atlixtac
11	12	Atoyac de Álvarez
12	12	Ayutla de los Libres
13	12	Azoyú
14	12	Benito Juárez
15	12	Buenavista de Cuéllar
16	12	Coahuayutla de José María Izazaga
17	12	Cocula
18	12	Copala
19	12	Copalillo
20	12	Copanatoyac
21	12	Coyuca de Benítez
22	12	Coyuca de Catalán
23	12	Cuajinicuilapa
24	12	Cualác
25	12	Cuautepec
26	12	Cuetzala del Progreso
27	12	Cutzamala de Pinzón
28	12	Chilapa de Álvarez
29	12	Chilpancingo de los Bravo
30	12	Florencio Villarreal
31	12	General Canuto A. Neri
32	12	General Heliodoro Castillo
33	12	Huamuxtitlán
34	12	Huitzuco de los Figueroa
35	12	Iguala de la Independencia
36	12	Igualapa
37	12	Ixcateopan de Cuauhtémoc
38	12	Zihuatanejo de Azueta
39	12	Juan R. Escudero
40	12	Leonardo Bravo
41	12	Malinaltepec
42	12	Mártir de Cuilapan
43	12	Metlatónoc
44	12	Mochitlán
45	12	Olinalá
46	12	Ometepec
47	12	Pedro Ascencio Alquisiras
48	12	Petatlán
49	12	Pilcaya
50	12	Pungarabato
51	12	Quechultenango
52	12	San Luis Acatlán
53	12	San Marcos
54	12	San Miguel Totolapan
55	12	Taxco de Alarcón
56	12	Tecoanapa
57	12	Técpan de Galeana
58	12	Teloloapan
59	12	Tepecoacuilco de Trujano
60	12	Tetipac
61	12	Tixtla de Guerrero
62	12	Tlacoachistlahuaca
63	12	Tlacoapa
64	12	Tlalchapa
65	12	Tlalixtaquilla de Maldonado
66	12	Tlapa de Comonfort
67	12	Tlapehuala
68	12	La Unión de Isidoro Montes de Oca
69	12	Xalpatláhuac
70	12	Xochihuehuetlán
71	12	Xochistlahuaca
72	12	Zapotitlán Tablas
73	12	Zirándaro
74	12	Zitlala
75	12	Eduardo Neri
76	12	Acatepec
77	12	Marquelia
78	12	Cochoapa el Grande
79	12	José Joaquín de Herrera
80	12	Juchitán
81	12	Iliatenco
1	13	Acatlán
2	13	Acaxochitlán
3	13	Actopan
4	13	Agua Blanca de Iturbide
5	13	Ajacuba
6	13	Alfajayucan
7	13	Almoloya
8	13	Apan
9	13	El Arenal
10	13	Atitalaquia
11	13	Atlapexco
12	13	Atotonilco el Grande
13	13	Atotonilco de Tula
14	13	Calnali
15	13	Cardonal
16	13	Cuautepec de Hinojosa
17	13	Chapantongo
18	13	Chapulhuacán
19	13	Chilcuautla
20	13	Eloxochitlán
21	13	Emiliano Zapata
22	13	Epazoyucan
23	13	Francisco I. Madero
24	13	Huasca de Ocampo
25	13	Huautla
26	13	Huazalingo
27	13	Huehuetla
28	13	Huejutla de Reyes
29	13	Huichapan
30	13	Ixmiquilpan
31	13	Jacala de Ledezma
32	13	Jaltocán
33	13	Juárez Hidalgo
34	13	Lolotla
35	13	Metepec
36	13	San Agustín Metzquititlán
37	13	Metztitlán
38	13	Mineral del Chico
39	13	Mineral del Monte
40	13	La Misión
41	13	Mixquiahuala de Juárez
42	13	Molango de Escamilla
43	13	Nicolás Flores
44	13	Nopala de Villagrán
45	13	Omitlán de Juárez
46	13	San Felipe Orizatlán
47	13	Pacula
48	13	Pachuca de Soto
49	13	Pisaflores
50	13	Progreso de Obregón
51	13	Mineral de la Reforma
52	13	San Agustín Tlaxiaca
53	13	San Bartolo Tutotepec
54	13	San Salvador
55	13	Santiago de Anaya
56	13	Santiago Tulantepec de Lugo Guerrero
57	13	Singuilucan
58	13	Tasquillo
59	13	Tecozautla
60	13	Tenango de Doria
61	13	Tepeapulco
62	13	Tepehuacán de Guerrero
63	13	Tepeji del Río de Ocampo
64	13	Tepetitlán
65	13	Tetepango
66	13	Villa de Tezontepec
67	13	Tezontepec de Aldama
68	13	Tianguistengo
69	13	Tizayuca
70	13	Tlahuelilpan
71	13	Tlahuiltepa
72	13	Tlanalapa
73	13	Tlanchinol
74	13	Tlaxcoapan
75	13	Tolcayuca
76	13	Tula de Allende
77	13	Tulancingo de Bravo
78	13	Xochiatipan
79	13	Xochicoatlán
80	13	Yahualica
81	13	Zacualtipán de Ángeles
82	13	Zapotlán de Juárez
83	13	Zempoala
84	13	Zimapán
1	14	Acatic
2	14	Acatlán de Juárez
3	14	Ahualulco de Mercado
4	14	Amacueca
5	14	Amatitán
6	14	Ameca
7	14	San Juanito de Escobedo
8	14	Arandas
9	14	El Arenal
10	14	Atemajac de Brizuela
11	14	Atengo
12	14	Atenguillo
13	14	Atotonilco el Alto
14	14	Atoyac
15	14	Autlán de Navarro
16	14	Ayotlán
17	14	Ayutla
18	14	La Barca
19	14	Bolaños
20	14	Cabo Corrientes
21	14	Casimiro Castillo
22	14	Cihuatlán
23	14	Zapotlán el Grande
24	14	Cocula
25	14	Colotlán
26	14	Concepción de Buenos Aires
27	14	Cuautitlán de García Barragán
28	14	Cuautla
29	14	Cuquío
30	14	Chapala
31	14	Chimaltitán
32	14	Chiquilistlán
33	14	Degollado
34	14	Ejutla
35	14	Encarnación de Díaz
36	14	Etzatlán
37	14	El Grullo
38	14	Guachinango
39	14	Guadalajara
40	14	Hostotipaquillo
41	14	Huejúcar
42	14	Huejuquilla el Alto
43	14	La Huerta
44	14	Ixtlahuacán de los Membrillos
45	14	Ixtlahuacán del Río
46	14	Jalostotitlán
47	14	Jamay
48	14	Jesús María
49	14	Jilotlán de los Dolores
50	14	Jocotepec
51	14	Juanacatlán
52	14	Juchitlán
53	14	Lagos de Moreno
54	14	El Limón
55	14	Magdalena
56	14	Santa María del Oro
57	14	La Manzanilla de la Paz
58	14	Mascota
59	14	Mazamitla
60	14	Mexticacán
61	14	Mezquitic
62	14	Mixtlán
63	14	Ocotlán
64	14	Ojuelos de Jalisco
65	14	Pihuamo
66	14	Poncitlán
67	14	Puerto Vallarta
68	14	Villa Purificación
69	14	Quitupan
70	14	El Salto
71	14	San Cristóbal de la Barranca
72	14	San Diego de Alejandría
73	14	San Juan de los Lagos
74	14	San Julián
75	14	San Marcos
76	14	San Martín de Bolaños
77	14	San Martín Hidalgo
78	14	San Miguel el Alto
79	14	Gómez Farías
80	14	San Sebastián del Oeste
81	14	Santa María de los Ángeles
82	14	Sayula
83	14	Tala
84	14	Talpa de Allende
85	14	Tamazula de Gordiano
86	14	Tapalpa
87	14	Tecalitlán
88	14	Tecolotlán
89	14	Techaluta de Montenegro
90	14	Tenamaxtlán
91	14	Teocaltiche
92	14	Teocuitatlán de Corona
93	14	Tepatitlán de Morelos
94	14	Tequila
95	14	Teuchitlán
96	14	Tizapán el Alto
97	14	Tlajomulco de Zúñiga
98	14	San Pedro Tlaquepaque
99	14	Tolimán
100	14	Tomatlán
101	14	Tonalá
102	14	Tonaya
103	14	Tonila
104	14	Totatiche
105	14	Tototlán
106	14	Tuxcacuesco
107	14	Tuxcueca
108	14	Tuxpan
109	14	Unión de San Antonio
110	14	Unión de Tula
111	14	Valle de Guadalupe
112	14	Valle de Juárez
113	14	San Gabriel
114	14	Villa Corona
115	14	Villa Guerrero
116	14	Villa Hidalgo
117	14	Cañadas de Obregón
118	14	Yahualica de González Gallo
119	14	Zacoalco de Torres
120	14	Zapopan
121	14	Zapotiltic
122	14	Zapotitlán de Vadillo
123	14	Zapotlán del Rey
124	14	Zapotlanejo
125	14	San Ignacio Cerro Gordo
1	15	Acambay de Ruíz Castañeda
2	15	Acolman
3	15	Aculco
4	15	Almoloya de Alquisiras
5	15	Almoloya de Juárez
6	15	Almoloya del Río
7	15	Amanalco
8	15	Amatepec
9	15	Amecameca
10	15	Apaxco
11	15	Atenco
12	15	Atizapán
13	15	Atizapán de Zaragoza
14	15	Atlacomulco
15	15	Atlautla
16	15	Axapusco
17	15	Ayapango
18	15	Calimaya
19	15	Capulhuac
20	15	Coacalco de Berriozábal
21	15	Coatepec Harinas
22	15	Cocotitlán
23	15	Coyotepec
24	15	Cuautitlán
25	15	Chalco
26	15	Chapa de Mota
27	15	Chapultepec
28	15	Chiautla
29	15	Chicoloapan
30	15	Chiconcuac
31	15	Chimalhuacán
32	15	Donato Guerra
33	15	Ecatepec de Morelos
34	15	Ecatzingo
35	15	Huehuetoca
36	15	Hueypoxtla
37	15	Huixquilucan
38	15	Isidro Fabela
39	15	Ixtapaluca
40	15	Ixtapan de la Sal
41	15	Ixtapan del Oro
42	15	Ixtlahuaca
43	15	Xalatlaco
44	15	Jaltenco
45	15	Jilotepec
46	15	Jilotzingo
47	15	Jiquipilco
48	15	Jocotitlán
49	15	Joquicingo
50	15	Juchitepec
51	15	Lerma
52	15	Malinalco
53	15	Melchor Ocampo
54	15	Metepec
55	15	Mexicaltzingo
56	15	Morelos
57	15	Naucalpan de Juárez
58	15	Nezahualcóyotl
59	15	Nextlalpan
60	15	Nicolás Romero
61	15	Nopaltepec
62	15	Ocoyoacac
63	15	Ocuilan
64	15	El Oro
65	15	Otumba
66	15	Otzoloapan
67	15	Otzolotepec
68	15	Ozumba
69	15	Papalotla
70	15	La Paz
71	15	Polotitlán
72	15	Rayón
73	15	San Antonio la Isla
74	15	San Felipe del Progreso
75	15	San Martín de las Pirámides
76	15	San Mateo Atenco
77	15	San Simón de Guerrero
78	15	Santo Tomás
79	15	Soyaniquilpan de Juárez
80	15	Sultepec
81	15	Tecámac
82	15	Tejupilco
83	15	Temamatla
84	15	Temascalapa
85	15	Temascalcingo
86	15	Temascaltepec
87	15	Temoaya
88	15	Tenancingo
89	15	Tenango del Aire
90	15	Tenango del Valle
91	15	Teoloyucan
92	15	Teotihuacán
93	15	Tepetlaoxtoc
94	15	Tepetlixpa
95	15	Tepotzotlán
96	15	Tequixquiac
97	15	Texcaltitlán
98	15	Texcalyacac
99	15	Texcoco
100	15	Tezoyuca
101	15	Tianguistenco
102	15	Timilpan
103	15	Tlalmanalco
104	15	Tlalnepantla de Baz
105	15	Tlatlaya
106	15	Toluca
107	15	Tonatico
108	15	Tultepec
109	15	Tultitlán
110	15	Valle de Bravo
111	15	Villa de Allende
112	15	Villa del Carbón
113	15	Villa Guerrero
114	15	Villa Victoria
115	15	Xonacatlán
116	15	Zacazonapan
117	15	Zacualpan
118	15	Zinacantepec
119	15	Zumpahuacán
120	15	Zumpango
121	15	Cuautitlán Izcalli
122	15	Valle de Chalco Solidaridad
123	15	Luvianos
124	15	San José del Rincón
125	15	Tonanitla
1	16	Acuitzio
2	16	Aguililla
3	16	Álvaro Obregón
4	16	Angamacutiro
5	16	Angangueo
6	16	Apatzingán
7	16	Aporo
8	16	Aquila
9	16	Ario
10	16	Arteaga
11	16	Briseñas
12	16	Buenavista
13	16	Carácuaro
14	16	Coahuayana
15	16	Coalcomán de Vázquez Pallares
16	16	Coeneo
17	16	Contepec
18	16	Copándaro
19	16	Cotija
20	16	Cuitzeo
21	16	Charapan
22	16	Charo
23	16	Chavinda
24	16	Cherán
25	16	Chilchota
26	16	Chinicuila
27	16	Chucándiro
28	16	Churintzio
29	16	Churumuco
30	16	Ecuandureo
31	16	Epitacio Huerta
32	16	Erongarícuaro
33	16	Gabriel Zamora
34	16	Hidalgo
35	16	La Huacana
36	16	Huandacareo
37	16	Huaniqueo
38	16	Huetamo
39	16	Huiramba
40	16	Indaparapeo
41	16	Irimbo
42	16	Ixtlán
43	16	Jacona
44	16	Jiménez
45	16	Jiquilpan
46	16	Juárez
47	16	Jungapeo
48	16	Lagunillas
49	16	Madero
50	16	Maravatío
51	16	Marcos Castellanos
52	16	Lázaro Cárdenas
53	16	Morelia
54	16	Morelos
55	16	Múgica
56	16	Nahuatzen
57	16	Nocupétaro
58	16	Nuevo Parangaricutiro
59	16	Nuevo Urecho
60	16	Numarán
61	16	Ocampo
62	16	Pajacuarán
63	16	Panindícuaro
64	16	Parácuaro
65	16	Paracho
66	16	Pátzcuaro
67	16	Penjamillo
68	16	Peribán
69	16	La Piedad
70	16	Purépero
71	16	Puruándiro
72	16	Queréndaro
73	16	Quiroga
74	16	Cojumatlán de Régules
75	16	Los Reyes
76	16	Sahuayo
77	16	San Lucas
78	16	Santa Ana Maya
79	16	Salvador Escalante
80	16	Senguio
81	16	Susupuato
82	16	Tacámbaro
83	16	Tancítaro
84	16	Tangamandapio
85	16	Tangancícuaro
86	16	Tanhuato
87	16	Taretan
88	16	Tarímbaro
89	16	Tepalcatepec
90	16	Tingambato
91	16	Tingüindín
92	16	Tiquicheo de Nicolás Romero
93	16	Tlalpujahua
94	16	Tlazazalca
95	16	Tocumbo
96	16	Tumbiscatío
97	16	Turicato
98	16	Tuxpan
99	16	Tuzantla
100	16	Tzintzuntzan
101	16	Tzitzio
102	16	Uruapan
103	16	Venustiano Carranza
104	16	Villamar
105	16	Vista Hermosa
106	16	Yurécuaro
107	16	Zacapu
108	16	Zamora
109	16	Zináparo
110	16	Zinapécuaro
111	16	Ziracuaretiro
112	16	Zitácuaro
113	16	José Sixto Verduzco
1	17	Amacuzac
2	17	Atlatlahucan
3	17	Axochiapan
4	17	Ayala
5	17	Coatlán del Río
6	17	Cuautla
7	17	Cuernavaca
8	17	Emiliano Zapata
9	17	Huitzilac
10	17	Jantetelco
11	17	Jiutepec
12	17	Jojutla
13	17	Jonacatepec
14	17	Mazatepec
15	17	Miacatlán
16	17	Ocuituco
17	17	Puente de Ixtla
18	17	Temixco
19	17	Tepalcingo
20	17	Tepoztlán
21	17	Tetecala
22	17	Tetela del Volcán
23	17	Tlalnepantla
24	17	Tlaltizapán de Zapata
25	17	Tlaquiltenango
26	17	Tlayacapan
27	17	Totolapan
28	17	Xochitepec
29	17	Yautepec
30	17	Yecapixtla
31	17	Zacatepec
32	17	Zacualpan
33	17	Temoac
1	18	Acaponeta
2	18	Ahuacatlán
3	18	Amatlán de Cañas
4	18	Compostela
5	18	Huajicori
6	18	Ixtlán del Río
7	18	Jala
8	18	Xalisco
9	18	Del Nayar
10	18	Rosamorada
11	18	Ruíz
12	18	San Blas
13	18	San Pedro Lagunillas
14	18	Santa María del Oro
15	18	Santiago Ixcuintla
16	18	Tecuala
17	18	Tepic
18	18	Tuxpan
19	18	La Yesca
20	18	Bahía de Banderas
1	19	Abasolo
2	19	Agualeguas
3	19	Los Aldamas
4	19	Allende
5	19	Anáhuac
6	19	Apodaca
7	19	Aramberri
8	19	Bustamante
9	19	Cadereyta Jiménez
10	19	El Carmen
11	19	Cerralvo
12	19	Ciénega de Flores
13	19	China
14	19	Doctor Arroyo
15	19	Doctor Coss
16	19	Doctor González
17	19	Galeana
18	19	García
19	19	San Pedro Garza García
20	19	General Bravo
21	19	General Escobedo
22	19	General Terán
23	19	General Treviño
24	19	General Zaragoza
25	19	General Zuazua
26	19	Guadalupe
27	19	Los Herreras
28	19	Higueras
29	19	Hualahuises
30	19	Iturbide
31	19	Juárez
32	19	Lampazos de Naranjo
33	19	Linares
34	19	Marín
35	19	Melchor Ocampo
36	19	Mier y Noriega
37	19	Mina
38	19	Montemorelos
39	19	Monterrey
40	19	Parás
41	19	Pesquería
42	19	Los Ramones
43	19	Rayones
44	19	Sabinas Hidalgo
45	19	Salinas Victoria
46	19	San Nicolás de los Garza
47	19	Hidalgo
48	19	Santa Catarina
49	19	Santiago
50	19	Vallecillo
51	19	Villaldama
1	20	Abejones
2	20	Acatlán de Pérez Figueroa
3	20	Asunción Cacalotepec
4	20	Asunción Cuyotepeji
5	20	Asunción Ixtaltepec
6	20	Asunción Nochixtlán
7	20	Asunción Ocotlán
8	20	Asunción Tlacolulita
9	20	Ayotzintepec
10	20	El Barrio de la Soledad
11	20	Calihualá
12	20	Candelaria Loxicha
13	20	Ciénega de Zimatlán
14	20	Ciudad Ixtepec
15	20	Coatecas Altas
16	20	Coicoyán de las Flores
17	20	La Compañía
18	20	Concepción Buenavista
19	20	Concepción Pápalo
20	20	Constancia del Rosario
21	20	Cosolapa
22	20	Cosoltepec
23	20	Cuilápam de Guerrero
24	20	Cuyamecalco Villa de Zaragoza
25	20	Chahuites
26	20	Chalcatongo de Hidalgo
27	20	Chiquihuitlán de Benito Juárez
28	20	Heroica Ciudad de Ejutla de Crespo
29	20	Eloxochitlán de Flores Magón
30	20	El Espinal
31	20	Tamazulápam del Espíritu Santo
32	20	Fresnillo de Trujano
33	20	Guadalupe Etla
34	20	Guadalupe de Ramírez
35	20	Guelatao de Juárez
36	20	Guevea de Humboldt
37	20	Mesones Hidalgo
38	20	Villa Hidalgo
39	20	Heroica Ciudad de Huajuapan de León
40	20	Huautepec
41	20	Huautla de Jiménez
42	20	Ixtlán de Juárez
43	20	Heroica Ciudad de Juchitán de Zaragoza
44	20	Loma Bonita
45	20	Magdalena Apasco
46	20	Magdalena Jaltepec
47	20	Santa Magdalena Jicotlán
48	20	Magdalena Mixtepec
49	20	Magdalena Ocotlán
50	20	Magdalena Peñasco
51	20	Magdalena Teitipac
52	20	Magdalena Tequisistlán
53	20	Magdalena Tlacotepec
54	20	Magdalena Zahuatlán
55	20	Mariscala de Juárez
56	20	Mártires de Tacubaya
57	20	Matías Romero Avendaño
58	20	Mazatlán Villa de Flores
59	20	Miahuatlán de Porfirio Díaz
60	20	Mixistlán de la Reforma
61	20	Monjas
62	20	Natividad
63	20	Nazareno Etla
64	20	Nejapa de Madero
65	20	Ixpantepec Nieves
66	20	Santiago Niltepec
67	20	Oaxaca de Juárez
68	20	Ocotlán de Morelos
69	20	La Pe
70	20	Pinotepa de Don Luis
71	20	Pluma Hidalgo
72	20	San José del Progreso
73	20	Putla Villa de Guerrero
74	20	Santa Catarina Quioquitani
75	20	Reforma de Pineda
76	20	La Reforma
77	20	Reyes Etla
78	20	Rojas de Cuauhtémoc
79	20	Salina Cruz
80	20	San Agustín Amatengo
81	20	San Agustín Atenango
82	20	San Agustín Chayuco
83	20	San Agustín de las Juntas
84	20	San Agustín Etla
85	20	San Agustín Loxicha
86	20	San Agustín Tlacotepec
87	20	San Agustín Yatareni
88	20	San Andrés Cabecera Nueva
89	20	San Andrés Dinicuiti
90	20	San Andrés Huaxpaltepec
91	20	San Andrés Huayápam
92	20	San Andrés Ixtlahuaca
93	20	San Andrés Lagunas
94	20	San Andrés Nuxiño
95	20	San Andrés Paxtlán
96	20	San Andrés Sinaxtla
97	20	San Andrés Solaga
98	20	San Andrés Teotilálpam
99	20	San Andrés Tepetlapa
100	20	San Andrés Yaá
101	20	San Andrés Zabache
102	20	San Andrés Zautla
103	20	San Antonino Castillo Velasco
104	20	San Antonino el Alto
105	20	San Antonino Monte Verde
106	20	San Antonio Acutla
107	20	San Antonio de la Cal
108	20	San Antonio Huitepec
109	20	San Antonio Nanahuatípam
110	20	San Antonio Sinicahua
111	20	San Antonio Tepetlapa
112	20	San Baltazar Chichicápam
113	20	San Baltazar Loxicha
114	20	San Baltazar Yatzachi el Bajo
115	20	San Bartolo Coyotepec
116	20	San Bartolomé Ayautla
117	20	San Bartolomé Loxicha
118	20	San Bartolomé Quialana
119	20	San Bartolomé Yucuañe
120	20	San Bartolomé Zoogocho
121	20	San Bartolo Soyaltepec
122	20	San Bartolo Yautepec
123	20	San Bernardo Mixtepec
124	20	San Blas Atempa
125	20	San Carlos Yautepec
126	20	San Cristóbal Amatlán
127	20	San Cristóbal Amoltepec
128	20	San Cristóbal Lachirioag
129	20	San Cristóbal Suchixtlahuaca
130	20	San Dionisio del Mar
131	20	San Dionisio Ocotepec
132	20	San Dionisio Ocotlán
133	20	San Esteban Atatlahuca
134	20	San Felipe Jalapa de Díaz
135	20	San Felipe Tejalápam
136	20	San Felipe Usila
137	20	San Francisco Cahuacuá
138	20	San Francisco Cajonos
139	20	San Francisco Chapulapa
140	20	San Francisco Chindúa
141	20	San Francisco del Mar
142	20	San Francisco Huehuetlán
143	20	San Francisco Ixhuatán
144	20	San Francisco Jaltepetongo
145	20	San Francisco Lachigoló
146	20	San Francisco Logueche
147	20	San Francisco Nuxaño
148	20	San Francisco Ozolotepec
149	20	San Francisco Sola
150	20	San Francisco Telixtlahuaca
151	20	San Francisco Teopan
152	20	San Francisco Tlapancingo
153	20	San Gabriel Mixtepec
154	20	San Ildefonso Amatlán
155	20	San Ildefonso Sola
156	20	San Ildefonso Villa Alta
157	20	San Jacinto Amilpas
158	20	San Jacinto Tlacotepec
159	20	San Jerónimo Coatlán
160	20	San Jerónimo Silacayoapilla
161	20	San Jerónimo Sosola
162	20	San Jerónimo Taviche
163	20	San Jerónimo Tecóatl
164	20	San Jorge Nuchita
165	20	San José Ayuquila
166	20	San José Chiltepec
167	20	San José del Peñasco
168	20	San José Estancia Grande
169	20	San José Independencia
170	20	San José Lachiguiri
171	20	San José Tenango
172	20	San Juan Achiutla
173	20	San Juan Atepec
174	20	Ánimas Trujano
175	20	San Juan Bautista Atatlahuca
176	20	San Juan Bautista Coixtlahuaca
177	20	San Juan Bautista Cuicatlán
178	20	San Juan Bautista Guelache
179	20	San Juan Bautista Jayacatlán
180	20	San Juan Bautista Lo de Soto
181	20	San Juan Bautista Suchitepec
182	20	San Juan Bautista Tlacoatzintepec
183	20	San Juan Bautista Tlachichilco
184	20	San Juan Bautista Tuxtepec
185	20	San Juan Cacahuatepec
186	20	San Juan Cieneguilla
187	20	San Juan Coatzóspam
188	20	San Juan Colorado
189	20	San Juan Comaltepec
190	20	San Juan Cotzocón
191	20	San Juan Chicomezúchil
192	20	San Juan Chilateca
193	20	San Juan del Estado
194	20	San Juan del Río
195	20	San Juan Diuxi
196	20	San Juan Evangelista Analco
197	20	San Juan Guelavía
198	20	San Juan Guichicovi
199	20	San Juan Ihualtepec
200	20	San Juan Juquila Mixes
201	20	San Juan Juquila Vijanos
202	20	San Juan Lachao
203	20	San Juan Lachigalla
204	20	San Juan Lajarcia
205	20	San Juan Lalana
206	20	San Juan de los Cués
207	20	San Juan Mazatlán
208	20	San Juan Mixtepec -Dto. 08 -
209	20	San Juan Mixtepec -Dto. 26 -
210	20	San Juan Ñumí
211	20	San Juan Ozolotepec
212	20	San Juan Petlapa
213	20	San Juan Quiahije
214	20	San Juan Quiotepec
215	20	San Juan Sayultepec
216	20	San Juan Tabaá
217	20	San Juan Tamazola
218	20	San Juan Teita
219	20	San Juan Teitipac
220	20	San Juan Tepeuxila
221	20	San Juan Teposcolula
222	20	San Juan Yaeé
223	20	San Juan Yatzona
224	20	San Juan Yucuita
225	20	San Lorenzo
226	20	San Lorenzo Albarradas
227	20	San Lorenzo Cacaotepec
228	20	San Lorenzo Cuaunecuiltitla
229	20	San Lorenzo Texmelúcan
230	20	San Lorenzo Victoria
231	20	San Lucas Camotlán
232	20	San Lucas Ojitlán
233	20	San Lucas Quiaviní
234	20	San Lucas Zoquiápam
235	20	San Luis Amatlán
236	20	San Marcial Ozolotepec
237	20	San Marcos Arteaga
238	20	San Martín de los Cansecos
239	20	San Martín Huamelúlpam
240	20	San Martín Itunyoso
241	20	San Martín Lachilá
242	20	San Martín Peras
243	20	San Martín Tilcajete
244	20	San Martín Toxpalan
245	20	San Martín Zacatepec
246	20	San Mateo Cajonos
247	20	Capulálpam de Méndez
248	20	San Mateo del Mar
249	20	San Mateo Yoloxochitlán
250	20	San Mateo Etlatongo
251	20	San Mateo Nejápam
252	20	San Mateo Peñasco
253	20	San Mateo Piñas
254	20	San Mateo Río Hondo
255	20	San Mateo Sindihui
256	20	San Mateo Tlapiltepec
257	20	San Melchor Betaza
258	20	San Miguel Achiutla
259	20	San Miguel Ahuehuetitlán
260	20	San Miguel Aloápam
261	20	San Miguel Amatitlán
262	20	San Miguel Amatlán
263	20	San Miguel Coatlán
264	20	San Miguel Chicahua
265	20	San Miguel Chimalapa
266	20	San Miguel del Puerto
267	20	San Miguel del Río
268	20	San Miguel Ejutla
269	20	San Miguel el Grande
270	20	San Miguel Huautla
271	20	San Miguel Mixtepec
272	20	San Miguel Panixtlahuaca
273	20	San Miguel Peras
274	20	San Miguel Piedras
275	20	San Miguel Quetzaltepec
276	20	San Miguel Santa Flor
277	20	Villa Sola de Vega
278	20	San Miguel Soyaltepec
279	20	San Miguel Suchixtepec
280	20	Villa Talea de Castro
281	20	San Miguel Tecomatlán
282	20	San Miguel Tenango
283	20	San Miguel Tequixtepec
284	20	San Miguel Tilquiápam
285	20	San Miguel Tlacamama
286	20	San Miguel Tlacotepec
287	20	San Miguel Tulancingo
288	20	San Miguel Yotao
289	20	San Nicolás
290	20	San Nicolás Hidalgo
291	20	San Pablo Coatlán
292	20	San Pablo Cuatro Venados
293	20	San Pablo Etla
294	20	San Pablo Huitzo
295	20	San Pablo Huixtepec
296	20	San Pablo Macuiltianguis
297	20	San Pablo Tijaltepec
298	20	San Pablo Villa de Mitla
299	20	San Pablo Yaganiza
300	20	San Pedro Amuzgos
301	20	San Pedro Apóstol
302	20	San Pedro Atoyac
303	20	San Pedro Cajonos
304	20	San Pedro Coxcaltepec Cántaros
305	20	San Pedro Comitancillo
306	20	San Pedro el Alto
307	20	San Pedro Huamelula
308	20	San Pedro Huilotepec
309	20	San Pedro Ixcatlán
310	20	San Pedro Ixtlahuaca
311	20	San Pedro Jaltepetongo
312	20	San Pedro Jicayán
313	20	San Pedro Jocotipac
314	20	San Pedro Juchatengo
315	20	San Pedro Mártir
316	20	San Pedro Mártir Quiechapa
317	20	San Pedro Mártir Yucuxaco
318	20	San Pedro Mixtepec -Dto. 22 -
319	20	San Pedro Mixtepec -Dto. 26 -
320	20	San Pedro Molinos
321	20	San Pedro Nopala
322	20	San Pedro Ocopetatillo
323	20	San Pedro Ocotepec
324	20	San Pedro Pochutla
325	20	San Pedro Quiatoni
326	20	San Pedro Sochiápam
327	20	San Pedro Tapanatepec
328	20	San Pedro Taviche
329	20	San Pedro Teozacoalco
330	20	San Pedro Teutila
331	20	San Pedro Tidaá
332	20	San Pedro Topiltepec
333	20	San Pedro Totolápam
334	20	Villa de Tututepec de Melchor Ocampo
335	20	San Pedro Yaneri
336	20	San Pedro Yólox
337	20	San Pedro y San Pablo Ayutla
338	20	Villa de Etla
339	20	San Pedro y San Pablo Teposcolula
340	20	San Pedro y San Pablo Tequixtepec
341	20	San Pedro Yucunama
342	20	San Raymundo Jalpan
343	20	San Sebastián Abasolo
344	20	San Sebastián Coatlán
345	20	San Sebastián Ixcapa
346	20	San Sebastián Nicananduta
347	20	San Sebastián Río Hondo
348	20	San Sebastián Tecomaxtlahuaca
349	20	San Sebastián Teitipac
350	20	San Sebastián Tutla
351	20	San Simón Almolongas
352	20	San Simón Zahuatlán
353	20	Santa Ana
354	20	Santa Ana Ateixtlahuaca
355	20	Santa Ana Cuauhtémoc
356	20	Santa Ana del Valle
357	20	Santa Ana Tavela
358	20	Santa Ana Tlapacoyan
359	20	Santa Ana Yareni
360	20	Santa Ana Zegache
361	20	Santa Catalina Quierí
362	20	Santa Catarina Cuixtla
363	20	Santa Catarina Ixtepeji
364	20	Santa Catarina Juquila
365	20	Santa Catarina Lachatao
366	20	Santa Catarina Loxicha
367	20	Santa Catarina Mechoacán
368	20	Santa Catarina Minas
369	20	Santa Catarina Quiané
370	20	Santa Catarina Tayata
371	20	Santa Catarina Ticuá
372	20	Santa Catarina Yosonotú
373	20	Santa Catarina Zapoquila
374	20	Santa Cruz Acatepec
375	20	Santa Cruz Amilpas
376	20	Santa Cruz de Bravo
377	20	Santa Cruz Itundujia
378	20	Santa Cruz Mixtepec
379	20	Santa Cruz Nundaco
380	20	Santa Cruz Papalutla
381	20	Santa Cruz Tacache de Mina
382	20	Santa Cruz Tacahua
383	20	Santa Cruz Tayata
384	20	Santa Cruz Xitla
385	20	Santa Cruz Xoxocotlán
386	20	Santa Cruz Zenzontepec
387	20	Santa Gertrudis
388	20	Santa Inés del Monte
389	20	Santa Inés Yatzeche
390	20	Santa Lucía del Camino
391	20	Santa Lucía Miahuatlán
392	20	Santa Lucía Monteverde
393	20	Santa Lucía Ocotlán
394	20	Santa María Alotepec
395	20	Santa María Apazco
396	20	Santa María la Asunción
397	20	Heroica Ciudad de Tlaxiaco
398	20	Ayoquezco de Aldama
399	20	Santa María Atzompa
400	20	Santa María Camotlán
401	20	Santa María Colotepec
402	20	Santa María Cortijo
403	20	Santa María Coyotepec
404	20	Santa María Chachoápam
405	20	Villa de Chilapa de Díaz
406	20	Santa María Chilchotla
407	20	Santa María Chimalapa
408	20	Santa María del Rosario
409	20	Santa María del Tule
410	20	Santa María Ecatepec
411	20	Santa María Guelacé
412	20	Santa María Guienagati
413	20	Santa María Huatulco
414	20	Santa María Huazolotitlán
415	20	Santa María Ipalapa
416	20	Santa María Ixcatlán
417	20	Santa María Jacatepec
418	20	Santa María Jalapa del Marqués
419	20	Santa María Jaltianguis
420	20	Santa María Lachixío
421	20	Santa María Mixtequilla
422	20	Santa María Nativitas
423	20	Santa María Nduayaco
424	20	Santa María Ozolotepec
425	20	Santa María Pápalo
426	20	Santa María Peñoles
427	20	Santa María Petapa
428	20	Santa María Quiegolani
429	20	Santa María Sola
430	20	Santa María Tataltepec
431	20	Santa María Tecomavaca
432	20	Santa María Temaxcalapa
433	20	Santa María Temaxcaltepec
434	20	Santa María Teopoxco
435	20	Santa María Tepantlali
436	20	Santa María Texcatitlán
437	20	Santa María Tlahuitoltepec
438	20	Santa María Tlalixtac
439	20	Santa María Tonameca
440	20	Santa María Totolapilla
441	20	Santa María Xadani
442	20	Santa María Yalina
443	20	Santa María Yavesía
444	20	Santa María Yolotepec
445	20	Santa María Yosoyúa
446	20	Santa María Yucuhiti
447	20	Santa María Zacatepec
448	20	Santa María Zaniza
449	20	Santa María Zoquitlán
450	20	Santiago Amoltepec
451	20	Santiago Apoala
452	20	Santiago Apóstol
453	20	Santiago Astata
454	20	Santiago Atitlán
455	20	Santiago Ayuquililla
456	20	Santiago Cacaloxtepec
457	20	Santiago Camotlán
458	20	Santiago Comaltepec
459	20	Santiago Chazumba
460	20	Santiago Choápam
461	20	Santiago del Río
462	20	Santiago Huajolotitlán
463	20	Santiago Huauclilla
464	20	Santiago Ihuitlán Plumas
465	20	Santiago Ixcuintepec
466	20	Santiago Ixtayutla
467	20	Santiago Jamiltepec
468	20	Santiago Jocotepec
469	20	Santiago Juxtlahuaca
470	20	Santiago Lachiguiri
471	20	Santiago Lalopa
472	20	Santiago Laollaga
473	20	Santiago Laxopa
474	20	Santiago Llano Grande
475	20	Santiago Matatlán
476	20	Santiago Miltepec
477	20	Santiago Minas
478	20	Santiago Nacaltepec
479	20	Santiago Nejapilla
480	20	Santiago Nundiche
481	20	Santiago Nuyoó
482	20	Santiago Pinotepa Nacional
483	20	Santiago Suchilquitongo
484	20	Santiago Tamazola
485	20	Santiago Tapextla
486	20	Villa Tejúpam de la Unión
487	20	Santiago Tenango
488	20	Santiago Tepetlapa
489	20	Santiago Tetepec
490	20	Santiago Texcalcingo
491	20	Santiago Textitlán
492	20	Santiago Tilantongo
493	20	Santiago Tillo
494	20	Santiago Tlazoyaltepec
495	20	Santiago Xanica
496	20	Santiago Xiacuí
497	20	Santiago Yaitepec
498	20	Santiago Yaveo
499	20	Santiago Yolomécatl
500	20	Santiago Yosondúa
501	20	Santiago Yucuyachi
502	20	Santiago Zacatepec
503	20	Santiago Zoochila
504	20	Nuevo Zoquiápam
505	20	Santo Domingo Ingenio
506	20	Santo Domingo Albarradas
507	20	Santo Domingo Armenta
508	20	Santo Domingo Chihuitán
509	20	Santo Domingo de Morelos
510	20	Santo Domingo Ixcatlán
511	20	Santo Domingo Nuxaá
512	20	Santo Domingo Ozolotepec
513	20	Santo Domingo Petapa
514	20	Santo Domingo Roayaga
515	20	Santo Domingo Tehuantepec
516	20	Santo Domingo Teojomulco
517	20	Santo Domingo Tepuxtepec
518	20	Santo Domingo Tlatayápam
519	20	Santo Domingo Tomaltepec
520	20	Santo Domingo Tonalá
521	20	Santo Domingo Tonaltepec
522	20	Santo Domingo Xagacía
523	20	Santo Domingo Yanhuitlán
524	20	Santo Domingo Yodohino
525	20	Santo Domingo Zanatepec
526	20	Santos Reyes Nopala
527	20	Santos Reyes Pápalo
528	20	Santos Reyes Tepejillo
529	20	Santos Reyes Yucuná
530	20	Santo Tomás Jalieza
531	20	Santo Tomás Mazaltepec
532	20	Santo Tomás Ocotepec
533	20	Santo Tomás Tamazulapan
534	20	San Vicente Coatlán
535	20	San Vicente Lachixío
536	20	San Vicente Nuñú
537	20	Silacayoápam
538	20	Sitio de Xitlapehua
539	20	Soledad Etla
540	20	Villa de Tamazulápam del Progreso
541	20	Tanetze de Zaragoza
542	20	Taniche
543	20	Tataltepec de Valdés
544	20	Teococuilco de Marcos Pérez
545	20	Teotitlán de Flores Magón
546	20	Teotitlán del Valle
547	20	Teotongo
548	20	Tepelmeme Villa de Morelos
549	20	Heroica Villa Tezoatlán de Segura y Luna, Cuna de la Independencia de Oaxaca
550	20	San Jerónimo Tlacochahuaya
551	20	Tlacolula de Matamoros
552	20	Tlacotepec Plumas
553	20	Tlalixtac de Cabrera
554	20	Totontepec Villa de Morelos
555	20	Trinidad Zaachila
556	20	La Trinidad Vista Hermosa
557	20	Unión Hidalgo
558	20	Valerio Trujano
559	20	San Juan Bautista Valle Nacional
560	20	Villa Díaz Ordaz
561	20	Yaxe
562	20	Magdalena Yodocono de Porfirio Díaz
563	20	Yogana
564	20	Yutanduchi de Guerrero
565	20	Villa de Zaachila
566	20	San Mateo Yucutindoo
567	20	Zapotitlán Lagunas
568	20	Zapotitlán Palmas
569	20	Santa Inés de Zaragoza
570	20	Zimatlán de Álvarez
1	21	Acajete
2	21	Acateno
3	21	Acatlán
4	21	Acatzingo
5	21	Acteopan
6	21	Ahuacatlán
7	21	Ahuatlán
8	21	Ahuazotepec
9	21	Ahuehuetitla
10	21	Ajalpan
11	21	Albino Zertuche
12	21	Aljojuca
13	21	Altepexi
14	21	Amixtlán
15	21	Amozoc
16	21	Aquixtla
17	21	Atempan
18	21	Atexcal
19	21	Atlixco
20	21	Atoyatempan
21	21	Atzala
22	21	Atzitzihuacán
23	21	Atzitzintla
24	21	Axutla
25	21	Ayotoxco de Guerrero
26	21	Calpan
27	21	Caltepec
28	21	Camocuautla
29	21	Caxhuacan
30	21	Coatepec
31	21	Coatzingo
32	21	Cohetzala
33	21	Cohuecan
34	21	Coronango
35	21	Coxcatlán
36	21	Coyomeapan
37	21	Coyotepec
38	21	Cuapiaxtla de Madero
39	21	Cuautempan
40	21	Cuautinchán
41	21	Cuautlancingo
42	21	Cuayuca de Andrade
43	21	Cuetzalan del Progreso
44	21	Cuyoaco
45	21	Chalchicomula de Sesma
46	21	Chapulco
47	21	Chiautla
48	21	Chiautzingo
49	21	Chiconcuautla
50	21	Chichiquila
51	21	Chietla
52	21	Chigmecatitlán
53	21	Chignahuapan
54	21	Chignautla
55	21	Chila
56	21	Chila de la Sal
57	21	Honey
58	21	Chilchotla
59	21	Chinantla
60	21	Domingo Arenas
61	21	Eloxochitlán
62	21	Epatlán
63	21	Esperanza
64	21	Francisco Z. Mena
65	21	General Felipe Ángeles
66	21	Guadalupe
67	21	Guadalupe Victoria
68	21	Hermenegildo Galeana
69	21	Huaquechula
70	21	Huatlatlauca
71	21	Huauchinango
72	21	Huehuetla
73	21	Huehuetlán el Chico
74	21	Huejotzingo
75	21	Hueyapan
76	21	Hueytamalco
77	21	Hueytlalpan
78	21	Huitzilan de Serdán
79	21	Huitziltepec
80	21	Atlequizayan
81	21	Ixcamilpa de Guerrero
82	21	Ixcaquixtla
83	21	Ixtacamaxtitlán
84	21	Ixtepec
85	21	Izúcar de Matamoros
86	21	Jalpan
87	21	Jolalpan
88	21	Jonotla
89	21	Jopala
90	21	Juan C. Bonilla
91	21	Juan Galindo
92	21	Juan N. Méndez
93	21	Lafragua
94	21	Libres
95	21	La Magdalena Tlatlauquitepec
96	21	Mazapiltepec de Juárez
97	21	Mixtla
98	21	Molcaxac
99	21	Cañada Morelos
100	21	Naupan
101	21	Nauzontla
102	21	Nealtican
103	21	Nicolás Bravo
104	21	Nopalucan
105	21	Ocotepec
106	21	Ocoyucan
107	21	Olintla
108	21	Oriental
109	21	Pahuatlán
110	21	Palmar de Bravo
111	21	Pantepec
112	21	Petlalcingo
113	21	Piaxtla
114	21	Puebla
115	21	Quecholac
116	21	Quimixtlán
117	21	Rafael Lara Grajales
118	21	Los Reyes de Juárez
119	21	San Andrés Cholula
120	21	San Antonio Cañada
121	21	San Diego la Mesa Tochimiltzingo
122	21	San Felipe Teotlalcingo
123	21	San Felipe Tepatlán
124	21	San Gabriel Chilac
125	21	San Gregorio Atzompa
126	21	San Jerónimo Tecuanipan
127	21	San Jerónimo Xayacatlán
128	21	San José Chiapa
129	21	San José Miahuatlán
130	21	San Juan Atenco
131	21	San Juan Atzompa
132	21	San Martín Texmelucan
133	21	San Martín Totoltepec
134	21	San Matías Tlalancaleca
135	21	San Miguel Ixitlán
136	21	San Miguel Xoxtla
137	21	San Nicolás Buenos Aires
138	21	San Nicolás de los Ranchos
139	21	San Pablo Anicano
140	21	San Pedro Cholula
141	21	San Pedro Yeloixtlahuaca
142	21	San Salvador el Seco
143	21	San Salvador el Verde
144	21	San Salvador Huixcolotla
145	21	San Sebastián Tlacotepec
146	21	Santa Catarina Tlaltempan
147	21	Santa Inés Ahuatempan
148	21	Santa Isabel Cholula
149	21	Santiago Miahuatlán
150	21	Huehuetlán el Grande
151	21	Santo Tomás Hueyotlipan
152	21	Soltepec
153	21	Tecali de Herrera
154	21	Tecamachalco
155	21	Tecomatlán
156	21	Tehuacán
157	21	Tehuitzingo
158	21	Tenampulco
159	21	Teopantlán
160	21	Teotlalco
161	21	Tepanco de López
162	21	Tepango de Rodríguez
163	21	Tepatlaxco de Hidalgo
164	21	Tepeaca
165	21	Tepemaxalco
166	21	Tepeojuma
167	21	Tepetzintla
168	21	Tepexco
169	21	Tepexi de Rodríguez
170	21	Tepeyahualco
171	21	Tepeyahualco de Cuauhtémoc
172	21	Tetela de Ocampo
173	21	Teteles de Avila Castillo
174	21	Teziutlán
175	21	Tianguismanalco
176	21	Tilapa
177	21	Tlacotepec de Benito Juárez
178	21	Tlacuilotepec
179	21	Tlachichuca
180	21	Tlahuapan
181	21	Tlaltenango
182	21	Tlanepantla
183	21	Tlaola
184	21	Tlapacoya
185	21	Tlapanalá
186	21	Tlatlauquitepec
187	21	Tlaxco
188	21	Tochimilco
189	21	Tochtepec
190	21	Totoltepec de Guerrero
191	21	Tulcingo
192	21	Tuzamapan de Galeana
193	21	Tzicatlacoyan
194	21	Venustiano Carranza
195	21	Vicente Guerrero
196	21	Xayacatlán de Bravo
197	21	Xicotepec
198	21	Xicotlán
199	21	Xiutetelco
200	21	Xochiapulco
201	21	Xochiltepec
202	21	Xochitlán de Vicente Suárez
203	21	Xochitlán Todos Santos
204	21	Yaonáhuac
205	21	Yehualtepec
206	21	Zacapala
207	21	Zacapoaxtla
208	21	Zacatlán
209	21	Zapotitlán
210	21	Zapotitlán de Méndez
211	21	Zaragoza
212	21	Zautla
213	21	Zihuateutla
214	21	Zinacatepec
215	21	Zongozotla
216	21	Zoquiapan
217	21	Zoquitlán
1	22	Amealco de Bonfil
2	22	Pinal de Amoles
3	22	Arroyo Seco
4	22	Cadereyta de Montes
5	22	Colón
6	22	Corregidora
7	22	Ezequiel Montes
8	22	Huimilpan
9	22	Jalpan de Serra
10	22	Landa de Matamoros
11	22	El Marqués
12	22	Pedro Escobedo
13	22	Peñamiller
14	22	Querétaro
15	22	San Joaquín
16	22	San Juan del Río
17	22	Tequisquiapan
18	22	Tolimán
1	23	Cozumel
2	23	Felipe Carrillo Puerto
3	23	Isla Mujeres
4	23	Othón P. Blanco
5	23	Benito Juárez
6	23	José María Morelos
7	23	Lázaro Cárdenas
8	23	Solidaridad
9	23	Tulum
10	23	Bacalar
1	24	Ahualulco
2	24	Alaquines
3	24	Aquismón
4	24	Armadillo de los Infante
5	24	Cárdenas
6	24	Catorce
7	24	Cedral
8	24	Cerritos
9	24	Cerro de San Pedro
10	24	Ciudad del Maíz
11	24	Ciudad Fernández
12	24	Tancanhuitz
13	24	Ciudad Valles
14	24	Coxcatlán
15	24	Charcas
16	24	Ebano
17	24	Guadalcázar
18	24	Huehuetlán
19	24	Lagunillas
20	24	Matehuala
21	24	Mexquitic de Carmona
22	24	Moctezuma
23	24	Rayón
24	24	Rioverde
25	24	Salinas
26	24	San Antonio
27	24	San Ciro de Acosta
28	24	San Luis Potosí
29	24	San Martín Chalchicuautla
30	24	San Nicolás Tolentino
31	24	Santa Catarina
32	24	Santa María del Río
33	24	Santo Domingo
34	24	San Vicente Tancuayalab
35	24	Soledad de Graciano Sánchez
36	24	Tamasopo
37	24	Tamazunchale
38	24	Tampacán
39	24	Tampamolón Corona
40	24	Tamuín
41	24	Tanlajás
42	24	Tanquián de Escobedo
43	24	Tierra Nueva
44	24	Vanegas
45	24	Venado
46	24	Villa de Arriaga
47	24	Villa de Guadalupe
48	24	Villa de la Paz
49	24	Villa de Ramos
50	24	Villa de Reyes
51	24	Villa Hidalgo
52	24	Villa Juárez
53	24	Axtla de Terrazas
54	24	Xilitla
55	24	Zaragoza
56	24	Villa de Arista
57	24	Matlapa
58	24	El Naranjo
1	25	Ahome
2	25	Angostura
3	25	Badiraguato
4	25	Concordia
5	25	Cosalá
6	25	Culiacán
7	25	Choix
8	25	Elota
9	25	Escuinapa
10	25	El Fuerte
11	25	Guasave
12	25	Mazatlán
13	25	Mocorito
14	25	Rosario
15	25	Salvador Alvarado
16	25	San Ignacio
17	25	Sinaloa
18	25	Navolato
1	26	Aconchi
2	26	Agua Prieta
3	26	Alamos
4	26	Altar
5	26	Arivechi
6	26	Arizpe
7	26	Atil
8	26	Bacadéhuachi
9	26	Bacanora
10	26	Bacerac
11	26	Bacoachi
12	26	Bácum
13	26	Banámichi
14	26	Baviácora
15	26	Bavispe
16	26	Benjamín Hill
17	26	Caborca
18	26	Cajeme
19	26	Cananea
20	26	Carbó
21	26	La Colorada
22	26	Cucurpe
23	26	Cumpas
24	26	Divisaderos
25	26	Empalme
26	26	Etchojoa
27	26	Fronteras
28	26	Granados
29	26	Guaymas
30	26	Hermosillo
31	26	Huachinera
32	26	Huásabas
33	26	Huatabampo
34	26	Huépac
35	26	Imuris
36	26	Magdalena
37	26	Mazatán
38	26	Moctezuma
39	26	Naco
40	26	Nácori Chico
41	26	Nacozari de García
42	26	Navojoa
43	26	Nogales
44	26	Onavas
45	26	Opodepe
46	26	Oquitoa
47	26	Pitiquito
48	26	Puerto Peñasco
49	26	Quiriego
50	26	Rayón
51	26	Rosario
52	26	Sahuaripa
53	26	San Felipe de Jesús
54	26	San Javier
55	26	San Luis Río Colorado
56	26	San Miguel de Horcasitas
57	26	San Pedro de la Cueva
58	26	Santa Ana
59	26	Santa Cruz
60	26	Sáric
61	26	Soyopa
62	26	Suaqui Grande
63	26	Tepache
64	26	Trincheras
65	26	Tubutama
66	26	Ures
67	26	Villa Hidalgo
68	26	Villa Pesqueira
69	26	Yécora
70	26	General Plutarco Elías Calles
71	26	Benito Juárez
72	26	San Ignacio Río Muerto
1	27	Balancán
2	27	Cárdenas
3	27	Centla
4	27	Centro
5	27	Comalcalco
6	27	Cunduacán
7	27	Emiliano Zapata
8	27	Huimanguillo
9	27	Jalapa
10	27	Jalpa de Méndez
11	27	Jonuta
12	27	Macuspana
13	27	Nacajuca
14	27	Paraíso
15	27	Tacotalpa
16	27	Teapa
17	27	Tenosique
1	28	Abasolo
2	28	Aldama
3	28	Altamira
4	28	Antiguo Morelos
5	28	Burgos
6	28	Bustamante
7	28	Camargo
8	28	Casas
9	28	Ciudad Madero
10	28	Cruillas
11	28	Gómez Farías
12	28	González
13	28	Güémez
14	28	Guerrero
15	28	Gustavo Díaz Ordaz
16	28	Hidalgo
17	28	Jaumave
18	28	Jiménez
19	28	Llera
20	28	Mainero
21	28	El Mante
22	28	Matamoros
23	28	Méndez
24	28	Mier
25	28	Miguel Alemán
26	28	Miquihuana
27	28	Nuevo Laredo
28	28	Nuevo Morelos
29	28	Ocampo
30	28	Padilla
31	28	Palmillas
32	28	Reynosa
33	28	Río Bravo
34	28	San Carlos
35	28	San Fernando
36	28	San Nicolás
37	28	Soto la Marina
38	28	Tampico
39	28	Tula
40	28	Valle Hermoso
41	28	Victoria
42	28	Villagrán
43	28	Xicoténcatl
1	29	Amaxac de Guerrero
2	29	Apetatitlán de Antonio Carvajal
3	29	Atlangatepec
4	29	Atltzayanca
5	29	Apizaco
6	29	Calpulalpan
7	29	El Carmen Tequexquitla
8	29	Cuapiaxtla
9	29	Cuaxomulco
10	29	Chiautempan
11	29	Muñoz de Domingo Arenas
12	29	Españita
13	29	Huamantla
14	29	Hueyotlipan
15	29	Ixtacuixtla de Mariano Matamoros
16	29	Ixtenco
17	29	Mazatecochco de José María Morelos
18	29	Contla de Juan Cuamatzi
19	29	Tepetitla de Lardizábal
20	29	Sanctórum de Lázaro Cárdenas
21	29	Nanacamilpa de Mariano Arista
22	29	Acuamanala de Miguel Hidalgo
23	29	Natívitas
24	29	Panotla
25	29	San Pablo del Monte
26	29	Santa Cruz Tlaxcala
27	29	Tenancingo
28	29	Teolocholco
29	29	Tepeyanco
30	29	Terrenate
31	29	Tetla de la Solidaridad
32	29	Tetlatlahuca
33	29	Tlaxcala
34	29	Tlaxco
35	29	Tocatlán
36	29	Totolac
37	29	Ziltlaltépec de Trinidad Sánchez Santos
38	29	Tzompantepec
39	29	Xaloztoc
40	29	Xaltocan
41	29	Papalotla de Xicohténcatl
42	29	Xicohtzinco
43	29	Yauhquemehcan
44	29	Zacatelco
45	29	Benito Juárez
46	29	Emiliano Zapata
47	29	Lázaro Cárdenas
48	29	La Magdalena Tlaltelulco
49	29	San Damián Texóloc
50	29	San Francisco Tetlanohcan
51	29	San Jerónimo Zacualpan
52	29	San José Teacalco
53	29	San Juan Huactzinco
54	29	San Lorenzo Axocomanitla
55	29	San Lucas Tecopilco
56	29	Santa Ana Nopalucan
57	29	Santa Apolonia Teacalco
58	29	Santa Catarina Ayometla
59	29	Santa Cruz Quilehtla
60	29	Santa Isabel Xiloxoxtla
1	30	Acajete
2	30	Acatlán
3	30	Acayucan
4	30	Actopan
5	30	Acula
6	30	Acultzingo
7	30	Camarón de Tejeda
8	30	Alpatláhuac
9	30	Alto Lucero de Gutiérrez Barrios
10	30	Altotonga
11	30	Alvarado
12	30	Amatitlán
13	30	Naranjos Amatlán
14	30	Amatlán de los Reyes
15	30	Angel R. Cabada
16	30	La Antigua
17	30	Apazapan
18	30	Aquila
19	30	Astacinga
20	30	Atlahuilco
21	30	Atoyac
22	30	Atzacan
23	30	Atzalan
24	30	Tlaltetela
25	30	Ayahualulco
26	30	Banderilla
27	30	Benito Juárez
28	30	Boca del Río
29	30	Calcahualco
30	30	Camerino Z. Mendoza
31	30	Carrillo Puerto
32	30	Catemaco
33	30	Cazones de Herrera
34	30	Cerro Azul
35	30	Citlaltépetl
36	30	Coacoatzintla
37	30	Coahuitlán
38	30	Coatepec
39	30	Coatzacoalcos
40	30	Coatzintla
41	30	Coetzala
42	30	Colipa
43	30	Comapa
44	30	Córdoba
45	30	Cosamaloapan de Carpio
46	30	Cosautlán de Carvajal
47	30	Coscomatepec
48	30	Cosoleacaque
49	30	Cotaxtla
50	30	Coxquihui
51	30	Coyutla
52	30	Cuichapa
53	30	Cuitláhuac
54	30	Chacaltianguis
55	30	Chalma
56	30	Chiconamel
57	30	Chiconquiaco
58	30	Chicontepec
59	30	Chinameca
60	30	Chinampa de Gorostiza
61	30	Las Choapas
62	30	Chocamán
63	30	Chontla
64	30	Chumatlán
65	30	Emiliano Zapata
66	30	Espinal
67	30	Filomeno Mata
68	30	Fortín
69	30	Gutiérrez Zamora
70	30	Hidalgotitlán
71	30	Huatusco
72	30	Huayacocotla
73	30	Hueyapan de Ocampo
74	30	Huiloapan de Cuauhtémoc
75	30	Ignacio de la Llave
76	30	Ilamatlán
77	30	Isla
78	30	Ixcatepec
79	30	Ixhuacán de los Reyes
80	30	Ixhuatlán del Café
81	30	Ixhuatlancillo
82	30	Ixhuatlán del Sureste
83	30	Ixhuatlán de Madero
84	30	Ixmatlahuacan
85	30	Ixtaczoquitlán
86	30	Jalacingo
87	30	Xalapa
88	30	Jalcomulco
89	30	Jáltipan
90	30	Jamapa
91	30	Jesús Carranza
92	30	Xico
93	30	Jilotepec
94	30	Juan Rodríguez Clara
95	30	Juchique de Ferrer
96	30	Landero y Coss
97	30	Lerdo de Tejada
98	30	Magdalena
99	30	Maltrata
100	30	Manlio Fabio Altamirano
101	30	Mariano Escobedo
102	30	Martínez de la Torre
103	30	Mecatlán
104	30	Mecayapan
105	30	Medellín
106	30	Miahuatlán
107	30	Las Minas
108	30	Minatitlán
109	30	Misantla
110	30	Mixtla de Altamirano
111	30	Moloacán
112	30	Naolinco
113	30	Naranjal
114	30	Nautla
115	30	Nogales
116	30	Oluta
117	30	Omealca
118	30	Orizaba
119	30	Otatitlán
120	30	Oteapan
121	30	Ozuluama de Mascareñas
122	30	Pajapan
123	30	Pánuco
124	30	Papantla
125	30	Paso del Macho
126	30	Paso de Ovejas
127	30	La Perla
128	30	Perote
129	30	Platón Sánchez
130	30	Playa Vicente
131	30	Poza Rica de Hidalgo
132	30	Las Vigas de Ramírez
133	30	Pueblo Viejo
134	30	Puente Nacional
135	30	Rafael Delgado
136	30	Rafael Lucio
137	30	Los Reyes
138	30	Río Blanco
139	30	Saltabarranca
140	30	San Andrés Tenejapan
141	30	San Andrés Tuxtla
142	30	San Juan Evangelista
143	30	Santiago Tuxtla
144	30	Sayula de Alemán
145	30	Soconusco
146	30	Sochiapa
147	30	Soledad Atzompa
148	30	Soledad de Doblado
149	30	Soteapan
150	30	Tamalín
151	30	Tamiahua
152	30	Tampico Alto
153	30	Tancoco
154	30	Tantima
155	30	Tantoyuca
156	30	Tatatila
157	30	Castillo de Teayo
158	30	Tecolutla
159	30	Tehuipango
160	30	Álamo Temapache
161	30	Tempoal
162	30	Tenampa
163	30	Tenochtitlán
164	30	Teocelo
165	30	Tepatlaxco
166	30	Tepetlán
167	30	Tepetzintla
168	30	Tequila
169	30	José Azueta
170	30	Texcatepec
171	30	Texhuacán
172	30	Texistepec
173	30	Tezonapa
174	30	Tierra Blanca
175	30	Tihuatlán
176	30	Tlacojalpan
177	30	Tlacolulan
178	30	Tlacotalpan
179	30	Tlacotepec de Mejía
180	30	Tlachichilco
181	30	Tlalixcoyan
182	30	Tlalnelhuayocan
183	30	Tlapacoyan
184	30	Tlaquilpa
185	30	Tlilapan
186	30	Tomatlán
187	30	Tonayán
188	30	Totutla
189	30	Tuxpan
190	30	Tuxtilla
191	30	Ursulo Galván
192	30	Vega de Alatorre
193	30	Veracruz
194	30	Villa Aldama
195	30	Xoxocotla
196	30	Yanga
197	30	Yecuatla
198	30	Zacualpan
199	30	Zaragoza
200	30	Zentla
201	30	Zongolica
202	30	Zontecomatlán de López y Fuentes
203	30	Zozocolco de Hidalgo
204	30	Agua Dulce
205	30	El Higo
206	30	Nanchital de Lázaro Cárdenas del Río
207	30	Tres Valles
208	30	Carlos A. Carrillo
209	30	Tatahuicapan de Juárez
210	30	Uxpanapa
211	30	San Rafael
212	30	Santiago Sochiapan
1	31	Abalá
2	31	Acanceh
3	31	Akil
4	31	Baca
5	31	Bokobá
6	31	Buctzotz
7	31	Cacalchén
8	31	Calotmul
9	31	Cansahcab
10	31	Cantamayec
11	31	Celestún
12	31	Cenotillo
13	31	Conkal
14	31	Cuncunul
15	31	Cuzamá
16	31	Chacsinkín
17	31	Chankom
18	31	Chapab
19	31	Chemax
20	31	Chicxulub Pueblo
21	31	Chichimilá
22	31	Chikindzonot
23	31	Chocholá
24	31	Chumayel
25	31	Dzán
26	31	Dzemul
27	31	Dzidzantún
28	31	Dzilam de Bravo
29	31	Dzilam González
30	31	Dzitás
31	31	Dzoncauich
32	31	Espita
33	31	Halachó
34	31	Hocabá
35	31	Hoctún
36	31	Homún
37	31	Huhí
38	31	Hunucmá
39	31	Ixil
40	31	Izamal
41	31	Kanasín
42	31	Kantunil
43	31	Kaua
44	31	Kinchil
45	31	Kopomá
46	31	Mama
47	31	Maní
48	31	Maxcanú
49	31	Mayapán
50	31	Mérida
51	31	Mocochá
52	31	Motul
53	31	Muna
54	31	Muxupip
55	31	Opichén
56	31	Oxkutzcab
57	31	Panabá
58	31	Peto
59	31	Progreso
60	31	Quintana Roo
61	31	Río Lagartos
62	31	Sacalum
63	31	Samahil
64	31	Sanahcat
65	31	San Felipe
66	31	Santa Elena
67	31	Seyé
68	31	Sinanché
69	31	Sotuta
70	31	Sucilá
71	31	Sudzal
72	31	Suma
73	31	Tahdziú
74	31	Tahmek
75	31	Teabo
76	31	Tecoh
77	31	Tekal de Venegas
78	31	Tekantó
79	31	Tekax
80	31	Tekit
81	31	Tekom
82	31	Telchac Pueblo
83	31	Telchac Puerto
84	31	Temax
85	31	Temozón
86	31	Tepakán
87	31	Tetiz
88	31	Teya
89	31	Ticul
90	31	Timucuy
91	31	Tinum
92	31	Tixcacalcupul
93	31	Tixkokob
94	31	Tixmehuac
95	31	Tixpéhual
96	31	Tizimín
97	31	Tunkás
98	31	Tzucacab
99	31	Uayma
100	31	Ucú
101	31	Umán
102	31	Valladolid
103	31	Xocchel
104	31	Yaxcabá
105	31	Yaxkukul
106	31	Yobaín
1	32	Apozol
2	32	Apulco
3	32	Atolinga
4	32	Benito Juárez
5	32	Calera
6	32	Cañitas de Felipe Pescador
7	32	Concepción del Oro
8	32	Cuauhtémoc
9	32	Chalchihuites
10	32	Fresnillo
11	32	Trinidad García de la Cadena
12	32	Genaro Codina
13	32	General Enrique Estrada
14	32	General Francisco R. Murguía
15	32	El Plateado de Joaquín Amaro
16	32	General Pánfilo Natera
17	32	Guadalupe
18	32	Huanusco
19	32	Jalpa
20	32	Jerez
21	32	Jiménez del Teul
22	32	Juan Aldama
23	32	Juchipila
24	32	Loreto
25	32	Luis Moya
26	32	Mazapil
27	32	Melchor Ocampo
28	32	Mezquital del Oro
29	32	Miguel Auza
30	32	Momax
31	32	Monte Escobedo
32	32	Morelos
33	32	Moyahua de Estrada
34	32	Nochistlán de Mejía
35	32	Noria de Ángeles
36	32	Ojocaliente
37	32	Pánuco
38	32	Pinos
39	32	Río Grande
40	32	Sain Alto
41	32	El Salvador
42	32	Sombrerete
43	32	Susticacán
44	32	Tabasco
45	32	Tepechitlán
46	32	Tepetongo
47	32	Teúl de González Ortega
48	32	Tlaltenango de Sánchez Román
49	32	Valparaíso
50	32	Vetagrande
51	32	Villa de Cos
52	32	Villa García
53	32	Villa González Ortega
54	32	Villa Hidalgo
55	32	Villanueva
56	32	Zacatecas
57	32	Trancoso
58	32	Santa María de la Paz
\.


--
-- TOC entry 3059 (class 0 OID 441775)
-- Dependencies: 216
-- Data for Name: cat_paises; Type: TABLE DATA; Schema: public; Owner: raul
--

COPY public.cat_paises (pai_id, pai_pais, pai_abreviado) FROM stdin;
1	Afganistán	Afg
2	Albania	Alba
3	Alemania	Alem
4	Argelia	Arge
5	Arabia Saudita	Arab
6	Argentina	Arg
7	Australia	Aust
8	Bélgica	Bélg
9	Brasil	Bras
10	Bulgaria	Bulg
11	Canadá	Cana
12	Chile	Chil
13	China	Chin
14	Colombia	Colo
15	Corea Del Sur	Core
16	Costa Rica	Cost
17	Croacia	Croa
18	Dinamarca	Dina
19	Ecuador	Ecua
20	Egipto	Egip
21	El Salvador	El S
22	Emiratos Árabes Unidos	Emir
23	España	Espa
26	Filipinas	Fili
27	Finlandia	Finl
28	Francia	Fran
29	Grecia	Grec
30	Holanda	Hola
31	Hong Kong	Hong
32	Hungría	Hung
33	India	Indi
34	Indonesia	Indo
36	Israel	Isra
37	Italia	Ital
38	Japón	Japó
39	Jordania	Jord
40	Líbano	Líba
41	Malasia	Mala
42	Marruecos	Marr
43	México	Mex
44	Noruega	Noru
45	Nueva Zelanda	Nuev
46	Pakistán	Paki
47	Perú	Perú
48	Polonia	Polo
49	Portugal	Port
50	Puerto Rico	Puer
51	Reino Unido	Rein
52	República Checa	Repú
53	Rumania	Ruma
54	Rusia	Rusi
55	Singapur	Sing
56	Sudáfrica	Sudá
57	Suecia	Suec
58	Suiza	Suiz
59	Taiwán	Taiw
60	Tinidad & Tobago	Tini
61	Tailandia	Tail
62	Turquía	Turq
63	Ucrania	Ucra
64	Venezuela	Vene
65	Yugoslavia	Yugo
66	Guatemala	Guat
67	Belice	Beli
68	Honduras	Hon
69	Nicaragua	Nica
70	Panamá	Pana
71	Cuba	Cub
72	Bahamas	Bah
73	Jamaica	Jam
74	Haití	Ha
75	República Dominicana	Repd
76	Guyana	Guy
77	Surinam	Suri
78	Guayana Francesa	Guay
79	Bolivia	Bol
80	Paraguay	Par
81	Uruguay	Uru
82	Islandia	Isla
83	Estonia	Est
84	Letonia	Let
85	Lituania	Lit
86	Belarús	Bela
87	República De Moldova	Repm
88	República Eslovaca	Repe
89	Austria	Aus
90	Liechtenstein	Liec
91	Eslovenia	Eslo
93	Macedonia	Mac
94	Mónaco	Mon
95	Andorra	Ando
96	Luxemburgo	Lux
99	Inglaterra	Ing
98	Nacionalidad Desconocida	Zzz
92	Bosnia Herzegovina	Bosn
24	Estados Unidos De América	Esta
100	Vietnam	Vie
101	Angola	Ango
102	Irak	Irak
35	Irlanda	Irla
\.


--
-- TOC entry 3041 (class 0 OID 16505)
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
-- TOC entry 3056 (class 0 OID 433059)
-- Dependencies: 213
-- Data for Name: edi_sellos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.edi_sellos (sel_id, edi_id, sel_sello, fecha_creacion) FROM stdin;
\.


--
-- TOC entry 3054 (class 0 OID 433020)
-- Dependencies: 211
-- Data for Name: editoriales; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.editoriales (id, usu_id, edi_razonsocial, edi_grupoedit, edi_dirgeneral, edi_dirmail, edi_dircel, edi_repnombre, edi_repcargo, edi_repemail, edi_observaciones, fecha_creacion, edi_activo, edi_rfc, edi_colonia, edi_calle, edi_numero, edi_cp, edi_ciudad, edi_pais, edi_entidad_federativa, edi_delegacion, edi_telefonos, edi_email, acreditador) FROM stdin;
\.


--
-- TOC entry 3042 (class 0 OID 16511)
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
163	1	2020-05-19	0	0	23:01:41.20704-05
165	1	2020-05-19	0	0	23:12:15.767647-05
167	1	2020-05-19	0	0	23:22:55.282293-05
169	1	2020-05-20	0	0	01:48:29.72165-05
170	4	2020-05-20	0	0	02:42:24.222161-05
171	4	2020-05-20	0	0	02:44:54.595687-05
172	4	2020-05-20	0	0	02:46:32.276349-05
174	4	2020-05-20	0	0	02:54:59.376696-05
176	4	2020-05-20	0	0	03:38:43.710798-05
178	4	2020-05-20	0	0	04:49:21.910377-05
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
212	1	2020-06-09	0	0	20:39:26.04375-05
213	210	2020-06-09	0	0	20:40:08.526658-05
214	1	2020-06-09	0	0	20:40:22.527651-05
215	210	2020-06-09	0	0	20:40:57.211056-05
216	1	2020-06-09	0	0	20:41:15.991763-05
217	210	2020-06-09	0	0	20:41:45.472528-05
218	1	2020-06-09	0	0	20:43:41.637163-05
220	1	2020-06-09	0	0	21:08:33.333272-05
229	210	2020-06-12	0	0	18:33:34.56834-05
230	1	2020-06-12	0	0	18:33:51.741889-05
231	210	2020-06-12	0	0	18:34:41.296208-05
233	1	2020-06-12	0	0	18:38:51.40549-05
235	210	2020-06-12	0	0	18:53:15.107702-05
236	1	2020-06-12	0	0	18:54:20.753944-05
237	210	2020-06-12	0	0	18:54:57.903927-05
242	1	2020-06-19	0	0	01:02:52.791738-05
243	210	2020-06-19	0	0	02:47:56.797217-05
245	1	2020-06-19	0	0	02:58:17.725674-05
246	1	2020-06-19	0	0	03:22:27.384624-05
247	1	2020-07-14	0	0	18:02:35.721741-05
248	1	2020-07-14	0	0	18:41:34.465584-05
249	1	2020-07-15	0	0	18:31:55.721702-05
250	1	2020-07-15	0	0	22:40:45.068936-05
251	1	2020-07-16	0	0	02:30:52.654856-05
252	1	2020-07-16	0	0	07:58:41.745492-05
253	1	2020-07-16	0	0	14:03:42.014283-05
254	1	2020-07-17	0	0	16:28:07.737654-05
255	1	2020-07-17	0	0	22:42:00.104496-05
256	1	2020-07-18	0	0	14:01:36.365337-05
257	1	2020-07-18	0	0	21:48:44.808395-05
258	1	2020-07-19	0	0	13:42:59.673592-05
259	1	2020-07-20	0	0	00:35:13.824321-05
260	1	2020-07-20	0	0	14:52:13.992716-05
261	1	2020-07-21	0	0	22:01:57.680141-05
262	1	2020-07-25	0	0	12:40:34.107414-05
263	1	2020-07-26	0	0	11:18:26.403208-05
264	1	2020-07-26	0	0	17:17:10.71249-05
265	1	2020-07-28	0	0	08:57:34.436737-05
266	1	2020-07-31	0	0	13:47:04.918358-05
267	1	2020-08-02	0	0	11:33:55.583007-05
268	1	2020-08-03	0	0	17:47:27.325867-05
269	1	2020-08-04	0	0	12:18:44.921839-05
270	1	2020-08-04	0	0	15:18:50.582234-05
271	1	2020-08-04	0	0	20:10:46.362049-05
272	1	2020-08-06	0	0	11:51:07.210341-05
273	1	2020-08-06	0	0	14:41:38.840627-05
274	1	2020-08-13	0	0	18:03:15.958028-05
275	1	2020-08-14	0	0	11:31:55.914856-05
276	1	2020-08-14	0	0	21:18:17.571084-05
277	1	2020-08-15	0	0	20:11:59.2747-05
278	1	2020-08-15	0	0	23:13:02.258239-05
279	1	2020-08-16	0	0	12:59:07.435066-05
280	1	2020-08-16	0	0	23:06:10.112229-05
281	1	2020-08-18	0	0	13:42:55.409784-05
282	210	2020-08-18	0	0	13:57:37.98016-05
283	1	2020-08-18	0	0	14:04:17.26197-05
284	210	2020-08-18	0	0	14:05:21.722984-05
285	1	2020-08-21	0	0	13:47:28.441699-05
286	1	2020-09-03	0	0	19:07:21.491272-05
287	210	2020-09-03	0	0	19:08:35.743391-05
288	1	2020-09-03	0	0	19:08:57.044709-05
289	210	2020-09-03	0	0	19:09:31.466037-05
290	1	2020-09-04	0	0	00:00:13.333447-05
291	210	2020-09-04	0	0	00:02:01.165701-05
292	1	2020-09-07	0	0	17:49:59.92016-05
293	210	2020-09-07	0	0	17:50:12.478602-05
294	1	2020-09-07	0	0	18:10:48.096815-05
295	1	2020-09-07	0	0	21:17:07.893598-05
296	1	2020-09-21	0	0	00:22:14.29485-05
297	1	2020-09-21	0	0	00:46:34.20384-05
298	1	2020-09-21	0	0	22:14:05.110403-05
299	1	2020-09-21	0	0	23:05:02.238743-05
300	1	2020-09-21	0	0	23:09:07.625228-05
301	1	2020-09-22			00:55:13.642379-05
302	1	2020-09-23			00:50:59.471176-05
303	1	2020-09-23			01:37:52.520753-05
304	1	2020-09-23			01:40:17.209304-05
305	1	2020-09-24			16:40:54.457161-05
306	1	2020-09-24			20:20:28.211523-05
307	1	2020-09-25			02:20:01.632191-05
308	1	2020-09-25			14:11:37.566416-05
309	1	2020-09-25			18:33:43.072755-05
310	1	2020-09-26			14:41:31.981796-05
311	1	2020-09-26			21:16:48.18262-05
312	1	2020-09-27			16:08:53.043049-05
313	1	2020-09-27			20:26:05.738957-05
314	1	2020-09-28			09:44:11.358313-05
315	1	2020-09-29			20:00:40.034791-05
316	1	2020-10-02			12:29:57.334512-05
317	1	2020-10-02			12:33:01.883673-05
318	1	2020-10-02			13:02:37.252059-05
319	1	2020-10-02			16:24:12.567564-05
320	1	2020-10-02			17:45:33.900577-05
321	1	2020-10-02			17:55:38.4962-05
322	1	2020-10-02			18:30:05.925688-05
323	1	2020-10-02			18:59:19.033151-05
324	1	2020-10-02			22:08:19.53952-05
325	1	2020-10-03			09:13:52.67991-05
326	1	2020-10-03			11:48:32.172405-05
327	1	2020-10-03			22:10:50.878603-05
328	1	2020-10-05			02:55:23.617199-05
329	1	2020-10-05			03:27:20.091446-05
330	1	2020-10-05			15:20:45.531434-05
331	1	2020-10-05			19:47:26.828845-05
332	1	2020-10-06			03:57:58.348005-05
333	1	2020-10-06			19:36:43.514978-05
334	1	2020-10-08			22:00:27.00538-05
335	1	2020-10-13			21:08:45.990793-05
336	1	2020-10-14			14:25:23.599469-05
337	1	2020-10-16			16:21:29.207944-05
338	1	2020-10-21			14:43:28.152799-05
339	1	2020-10-21			15:08:55.552272-05
340	1	2020-11-04			21:03:23.376359-06
341	1	2020-11-04			22:52:48.872239-06
342	1	2020-11-05			15:32:57.213925-06
343	1	2020-11-05			18:05:31.303648-06
344	1	2020-11-05			18:29:30.323682-06
345	1	2020-11-05			18:34:48.89057-06
346	1	2020-11-17			22:08:51.988097-06
347	1	2020-11-19			18:27:17.875246-06
348	1	2020-11-21			22:21:13.592567-06
349	1	2020-11-22			15:44:41.798762-06
350	1	2020-11-22			20:40:49.837575-06
351	210	2020-11-22			22:07:58.429353-06
352	210	2020-11-22			22:36:49.937249-06
353	1	2020-11-25			23:08:21.099954-06
354	1	2020-11-25			23:36:52.743837-06
355	1	2020-11-27			15:17:26.39404-06
356	1	2020-11-27			15:28:05.077476-06
357	1	2020-11-27			15:34:57.63923-06
358	1	2020-11-27			20:38:13.737547-06
359	1	2020-11-28			01:08:13.404153-06
360	1	2020-11-28			01:11:53.446791-06
361	1	2020-11-28			01:13:18.888695-06
362	1	2020-11-29			19:02:23.574978-06
363	1	2020-11-29			21:38:19.409868-06
364	1	2020-11-29			23:34:37.890803-06
365	1	2020-11-30			00:17:26.578271-06
366	210	2020-11-30			01:12:44.159295-06
367	210	2020-11-30			02:51:35.785943-06
368	210	2020-11-30			02:58:01.876456-06
369	210	2020-11-30			03:03:35.368256-06
370	210	2020-11-30			03:05:20.33682-06
371	210	2020-11-30			18:02:29.464167-06
372	210	2020-11-30			18:45:59.309301-06
373	210	2020-12-01			01:34:17.791697-06
374	210	2020-12-01			01:38:46.926807-06
375	1	2020-12-01			01:44:48.839358-06
376	210	2020-12-01			01:52:03.975663-06
377	210	2020-12-01			02:06:59.486906-06
378	1	2020-12-01			02:11:19.460592-06
379	1	2020-12-01			18:46:34.8502-06
380	1	2020-12-01			19:10:42.194738-06
381	1	2020-12-01			19:16:11.631115-06
382	1	2020-12-03			20:55:41.169385-06
383	1	2020-12-03			22:06:15.792316-06
384	210	2020-12-03			22:22:33.326531-06
385	210	2020-12-03			22:49:47.274943-06
386	210	2020-12-03			23:05:16.779184-06
387	1	2020-12-08			20:11:29.925802-06
388	210	2020-12-08			20:11:46.721453-06
389	1	2020-12-08			20:25:32.371828-06
390	210	2020-12-08			20:40:10.545794-06
391	1	2020-12-08			20:41:08.582339-06
392	1	2020-12-08			20:45:45.363201-06
393	210	2020-12-08			21:00:00.73163-06
394	210	2020-12-08			21:29:12.027123-06
395	210	2020-12-08			23:23:26.580446-06
396	210	2020-12-08			23:35:51.711237-06
397	1	2020-12-09			00:49:21.474445-06
398	210	2020-12-09			00:52:47.994502-06
399	210	2020-12-09			00:55:50.448734-06
400	1	2020-12-09			00:58:18.441822-06
401	210	2020-12-09			01:02:39.246592-06
402	210	2020-12-14			20:48:02.246852-06
403	1	2020-12-14			22:35:23.52469-06
404	210	2020-12-14			23:53:35.112395-06
405	210	2020-12-15			19:13:14.330249-06
406	1	2020-12-15			22:06:54.122315-06
407	210	2020-12-15			22:19:53.922074-06
408	1	2020-12-15			22:37:39.890347-06
409	210	2020-12-15			22:39:27.210326-06
410	210	2020-12-15			22:40:32.444179-06
411	1	2020-12-15			22:40:49.717777-06
412	210	2020-12-15			22:49:12.327396-06
413	210	2020-12-15			23:32:51.145622-06
414	210	2020-12-15			23:39:32.090613-06
\.


--
-- TOC entry 3067 (class 0 OID 444596)
-- Dependencies: 224
-- Data for Name: historial_actividades; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.historial_actividades (id, modulo, elemento, atributo, actividad, fecha, valor_previo, valor_actual, usu_id) FROM stdin;
4	Convocatoria	2	fecha_fin_acceso	guardar_fechas_modulos	2020-10-03	2020-09-29	2020-09-30	1
5	Convocatoria	5	fecha_fin_acceso	guardar_fechas_modulos	2020-10-14	2020-05-06	2020-10-31	1
6	Convocatoria	2	fecha_fin_acceso	guardar_fechas_modulos	2020-11-04	2020-09-30	2020-12-31	1
7	Convocatoria	1	fecha_fin_acceso	guardar_fechas_modulos	2020-11-28	2020-12-30	2020-12-31	1
8	Convocatoria	1	fecha_inicio_acceso	guardar_fechas_modulos	2020-11-28	2020-05-02	2020-04-30	1
9	Convocatoria	1	fecha_fin_acceso	guardar_fechas_modulos	2020-11-28	2020-12-31	2021-01-01	1
\.


--
-- TOC entry 3065 (class 0 OID 444428)
-- Dependencies: 222
-- Data for Name: lib_autores; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.lib_autores (lib_id, aut_id, aut_nombre, aut_tipo, aut_pais) FROM stdin;
\.


--
-- TOC entry 3045 (class 0 OID 16523)
-- Dependencies: 202
-- Data for Name: lib_submodulos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.lib_submodulos (id_submodulo, url_sub, id_acceso, nombre) FROM stdin;
1	administrador/convocatoria/atributos_generales	3	Atributos Generales
3	administrador/convocatoria/clasificacion_indicativa	3	Tabla de clasificación Indicativa
2	administrador/convocatoria/fechas_vencimiento	3	Fechas
4	administrador/acreditacion/gestion_usuarios	5	Gestión de Usuarios
5	administrador/acreditacion/reportes_acreditacion	5	Reportes de Acreditación
6	administrador/acreditacion/acreditacion_editoriales	5	Acreditación de Editorial
7	acreditador/acreditacion/acreditacion_editoriales	14	Acreditacion de Editoriales
\.


--
-- TOC entry 3063 (class 0 OID 444412)
-- Dependencies: 220
-- Data for Name: libros; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.libros (lib_id, lib_titulo, usu_id) FROM stdin;
\.


--
-- TOC entry 3052 (class 0 OID 16712)
-- Dependencies: 209
-- Data for Name: seleccionBilingue; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."seleccionBilingue" (id, categoria, grado, biblioteca, "numPreseleccion", "numSeleccion", clasificacion) FROM stdin;
280	bilingue_primaria_secundaria	4pri	BA	5	0	primaria_secundaria
281	bilingue_preescolar_primaria	1pre	BA	5	3	preescolar_primaria
282	bilingue_preescolar_primaria	2pre	BA	5	3	preescolar_primaria
283	bilingue_preescolar_primaria	3pre	BA	5	3	preescolar_primaria
284	bilingue_preescolar_primaria	1pri	BA	5	3	preescolar_primaria
285	bilingue_preescolar_primaria	2pri	BA	5	3	preescolar_primaria
286	bilingue_preescolar_primaria	3pri	BA	5	3	preescolar_primaria
287	bilingue_preescolar_primaria	preescolar	BE	1	0	preescolar_primaria
288	bilingue_preescolar_primaria	primaria	BE	1	1	preescolar_primaria
\.


--
-- TOC entry 3050 (class 0 OID 16679)
-- Dependencies: 207
-- Data for Name: seleccionMonolingue; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."seleccionMonolingue" (id, grado, biblioteca, "numPreseleccion", "numSeleccion", categoria, clasificacion, id_texto) FROM stdin;
1635	4pri	BA	2	2	narrativa contemporánea: universal, latinoamericana y mexicana	primaria_secundaria	66
1636	primaria	BE	5	1	la naturaleza	preescolar_primaria	1
1637	5pri	BA	3	2	narrativa contemporánea: universal, latinoamericana y mexicana	primaria_secundaria	66
1638	preescolar	BE	5	3	enciclopedias, atlas y almanaques	preescolar_primaria	11
1639	preescolar	BE	5	3	los juegos, actividades y experimentos	preescolar_primaria	9
1640	primaria	BE	5	3	enciclopedias, atlas y almanaques	primaria_secundaria	59
1641	preescolar	BE	5	3	las palabras	preescolar_primaria	10
1642	preescolar	BE	5	3	las artes y los oficios	preescolar_primaria	8
1643	preescolar	BE	5	3	los lugares, la tierra y el espacio	preescolar_primaria	7
1644	preescolar	BE	5	3	la naturaleza	preescolar_primaria	1
1645	preescolar	BE	5	3	el cuerpo	preescolar_primaria	2
1646	preescolar	BE	5	3	las historias del pasado	preescolar_primaria	6
1647	preescolar	BE	5	3	las personas	preescolar_primaria	5
1648	preescolar	BE	5	3	los números y las formas	preescolar_primaria	3
1649	preescolar	BE	5	3	los objetos y su funcionamiento	preescolar_primaria	4
1650	1pri	BA	5	0	el cuerpo	preescolar_primaria	2
1651	1pre	BA	5	3	la naturaleza	preescolar_primaria	1
1652	2pre	BA	5	3	la naturaleza	preescolar_primaria	1
1653	1pri	BA	5	3	la naturaleza	preescolar_primaria	1
1654	2pri	BA	5	3	la naturaleza	preescolar_primaria	1
1655	3pri	BA	5	3	la naturaleza	preescolar_primaria	1
1656	3pre	BA	5	3	la naturaleza	preescolar_primaria	1
1657	1pre	BA	5	3	el cuerpo	preescolar_primaria	2
1658	2pre	BA	5	3	el cuerpo	preescolar_primaria	2
1659	3pre	BA	5	3	el cuerpo	preescolar_primaria	2
1660	2pri	BA	5	3	el cuerpo	preescolar_primaria	2
1661	3pri	BA	5	3	el cuerpo	preescolar_primaria	2
1662	1pre	BA	5	3	enciclopedias, atlas y almanaques	preescolar_primaria	11
1663	2pre	BA	5	3	enciclopedias, atlas y almanaques	preescolar_primaria	11
1664	3pre	BA	5	3	enciclopedias, atlas y almanaques	preescolar_primaria	11
1665	1pri	BA	5	3	enciclopedias, atlas y almanaques	preescolar_primaria	11
1666	2pri	BA	5	3	enciclopedias, atlas y almanaques	preescolar_primaria	11
1667	3pri	BA	5	3	enciclopedias, atlas y almanaques	preescolar_primaria	11
1668	4pri	BA	5	3	enciclopedias, atlas y almanaques	primaria_secundaria	59
1669	5pri	BA	5	3	enciclopedias, atlas y almanaques	primaria_secundaria	59
1670	6pri	BA	5	3	enciclopedias, atlas y almanaques	primaria_secundaria	59
1671	secundaria	BE	5	1	ciencias físico-químicas	primaria_secundaria	48
1672	primaria	BE	2	2	ciencias físico-químicas	primaria_secundaria	48
1673	preescolar	BE	1	0	cuentos de aventura y de viajes	preescolar_primaria	12
1674	preescolar	BE	1	0	cuentos de humor	preescolar_primaria	13
1675	primaria	BE	2	1	narrativa contemporánea: universal, latinoamericana y mexicana	primaria_secundaria	66
1676	secundaria	BE	5	3	narrativa contemporánea: universal, latinoamericana y mexicana	primaria_secundaria	66
1677	4pri	BA	1	1	ciencias físico-químicas	primaria_secundaria	48
\.


--
-- TOC entry 3048 (class 0 OID 16664)
-- Dependencies: 205
-- Data for Name: texto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.texto (id, clasificacion, tipo, categoria, tipo_clasificacion) FROM stdin;
49	de cuarto de primaria a tercero de secundaria	textos informativos	ciencias biológicas	primaria_secundaria
50	de cuarto de primaria a tercero de secundaria	textos informativos	ciencias de la salud y el deporte	primaria_secundaria
51	de cuarto de primaria a tercero de secundaria	textos informativos	matemáticas	primaria_secundaria
52	de cuarto de primaria a tercero de secundaria	textos informativos	tecnología	primaria_secundaria
53	de cuarto de primaria a tercero de secundaria	textos informativos	biografías	primaria_secundaria
54	de cuarto de primaria a tercero de secundaria	textos informativos	historia, cultura y sociedad	primaria_secundaria
55	de cuarto de primaria a tercero de secundaria	textos informativos	ciencias de la tierra y el espacio	primaria_secundaria
56	de cuarto de primaria a tercero de secundaria	textos informativos	artes y oficios	primaria_secundaria
57	de cuarto de primaria a tercero de secundaria	textos informativos	juegos, actividades y experimentos	primaria_secundaria
58	de cuarto de primaria a tercero de secundaria	textos informativos	diccionarios	primaria_secundaria
59	de cuarto de primaria a tercero de secundaria	textos informativos	enciclopedias, atlas y almanaques	primaria_secundaria
60	de cuarto de primaria a tercero de secundaria	textos literarios	narrativa de aventuras y de viajes	primaria_secundaria
61	de cuarto de primaria a tercero de secundaria	textos literarios	narrativa de ciencia ficción	primaria_secundaria
62	de cuarto de primaria a tercero de secundaria	textos literarios	narrativa de humor	primaria_secundaria
63	de cuarto de primaria a tercero de secundaria	textos literarios	narrativa de misterio y de terror	primaria_secundaria
64	de cuarto de primaria a tercero de secundaria	textos literarios	narrativa policiaca	primaria_secundaria
65	de cuarto de primaria a tercero de secundaria	textos literarios	narrativa de la vida cotidiana	primaria_secundaria
67	de cuarto de primaria a tercero de secundaria	textos literarios	narrativa histórica	primaria_secundaria
69	de cuarto de primaria a tercero de secundaria	textos literarios	diarios, crónicas y reportajes	primaria_secundaria
70	de cuarto de primaria a tercero de secundaria	textos literarios	mitos y leyendas	primaria_secundaria
71	de cuarto de primaria a tercero de secundaria	textos literarios	poesía de autor	primaria_secundaria
21	de preescolar a tercero de primaria	textos literarios	rimas, canciones, adivinanzas y juegos de palabras	preescolar_primaria
3	de preescolar a tercero de primaria	textos informativos	los números y las formas	preescolar_primaria
13	de preescolar a tercero de primaria	textos literarios	cuentos de humor	preescolar_primaria
8	de preescolar a tercero de primaria	textos informativos	las artes y los oficios	preescolar_primaria
5	de preescolar a tercero de primaria	textos informativos	las personas	preescolar_primaria
20	de preescolar a tercero de primaria	textos literarios	poesía	preescolar_primaria
10	de preescolar a tercero de primaria	textos informativos	las palabras	preescolar_primaria
17	de preescolar a tercero de primaria	textos literarios	cuentos clásicos	preescolar_primaria
19	de preescolar a tercero de primaria	textos literarios	mitos y leyendas	preescolar_primaria
6	de preescolar a tercero de primaria	textos informativos	las historias del pasado	preescolar_primaria
1	de preescolar a tercero de primaria	textos informativos	la naturaleza	preescolar_primaria
14	de preescolar a tercero de primaria	textos literarios	cuentos de misterio y de terror	preescolar_primaria
22	de preescolar a tercero de primaria	textos literarios	teatro y representaciones con títeres y marionetas	preescolar_primaria
4	de preescolar a tercero de primaria	textos informativos	los objetos y su funcionamiento	preescolar_primaria
18	de preescolar a tercero de primaria	textos literarios	diarios, crónicas y reportajes	preescolar_primaria
7	de preescolar a tercero de primaria	textos informativos	los lugares, la tierra y el espacio	preescolar_primaria
12	de preescolar a tercero de primaria	textos literarios	cuentos de aventura y de viajes	preescolar_primaria
11	de preescolar a tercero de primaria	textos informativos	enciclopedias, atlas y almanaques	preescolar_primaria
16	de preescolar a tercero de primaria	textos literarios	cuentos históricos	preescolar_primaria
2	de preescolar a tercero de primaria	textos informativos	el cuerpo	preescolar_primaria
15	de preescolar a tercero de primaria	textos literarios	cuentos de la vida cotidiana	preescolar_primaria
9	de preescolar a tercero de primaria	textos informativos	los juegos, actividades y experimentos	preescolar_primaria
72	de cuarto de primaria a tercero de secundaria	textos literarios	poesía popular	primaria_secundaria
73	de cuarto de primaria a tercero de secundaria	textos literarios	teatro	primaria_secundaria
68	de cuarto de primaria a tercero de secundaria	textos literarios	narrativa clásica	primaria_secundaria
48	de cuarto de primaria a tercero de secundaria	textos informativos	ciencias físico-químicas	primaria_secundaria
66	de cuarto de primaria a tercero de secundaria	textos literarios	narrativa contemporánea: universal, latinoamericana y mexicana	primaria_secundaria
\.


--
-- TOC entry 3046 (class 0 OID 16529)
-- Dependencies: 203
-- Data for Name: usuarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuarios (usu_id, id_perfil, id_modulo, usu_nombre, usu_login, usu_pass, usu_creador) FROM stdin;
4	4	4	Recepción	recepcion	123	1
1	1	1	Administrador	kyo	asian	0
210	2	2	Acreditadores	acreditadores	acreditadores3	1
757	2	2	Prueba4	prueba4	acreditador7	0
\.


--
-- TOC entry 3087 (class 0 OID 0)
-- Dependencies: 215
-- Name: attr_generales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.attr_generales_id_seq', 2, true);


--
-- TOC entry 3088 (class 0 OID 0)
-- Dependencies: 212
-- Name: edi_sellos_sel_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.edi_sellos_sel_id_seq', 103, true);


--
-- TOC entry 3089 (class 0 OID 0)
-- Dependencies: 210
-- Name: editoriales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.editoriales_id_seq', 1096, true);


--
-- TOC entry 3090 (class 0 OID 0)
-- Dependencies: 223
-- Name: historial_actividades_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.historial_actividades_id_seq', 9, true);


--
-- TOC entry 3091 (class 0 OID 0)
-- Dependencies: 200
-- Name: id_acceso_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.id_acceso_seq', 13, true);


--
-- TOC entry 3092 (class 0 OID 0)
-- Dependencies: 201
-- Name: id_historial_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.id_historial_seq', 414, true);


--
-- TOC entry 3093 (class 0 OID 0)
-- Dependencies: 221
-- Name: lib_autores_aut_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.lib_autores_aut_id_seq', 1, false);


--
-- TOC entry 3094 (class 0 OID 0)
-- Dependencies: 219
-- Name: libros_lib_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.libros_lib_id_seq', 1, false);


--
-- TOC entry 3095 (class 0 OID 0)
-- Dependencies: 208
-- Name: seleccionBilingue_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."seleccionBilingue_id_seq"', 288, true);


--
-- TOC entry 3096 (class 0 OID 0)
-- Dependencies: 206
-- Name: seleccionMonolingue_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."seleccionMonolingue_id_seq"', 1677, true);


--
-- TOC entry 3097 (class 0 OID 0)
-- Dependencies: 204
-- Name: texto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.texto_id_seq', 1, false);


--
-- TOC entry 2892 (class 2606 OID 441656)
-- Name: attr_generales attr_generales_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attr_generales
    ADD CONSTRAINT attr_generales_pkey PRIMARY KEY (id);


--
-- TOC entry 2886 (class 2606 OID 433028)
-- Name: editoriales editoriales_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.editoriales
    ADD CONSTRAINT editoriales_pkey PRIMARY KEY (id);


--
-- TOC entry 2896 (class 2606 OID 441921)
-- Name: cat_estados key_est_id; Type: CONSTRAINT; Schema: public; Owner: raul
--

ALTER TABLE ONLY public.cat_estados
    ADD CONSTRAINT key_est_id PRIMARY KEY (est_id);


--
-- TOC entry 2861 (class 2606 OID 16619)
-- Name: acceso key_id_acceso; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.acceso
    ADD CONSTRAINT key_id_acceso PRIMARY KEY (id_acceso);


--
-- TOC entry 2867 (class 2606 OID 16621)
-- Name: historial key_id_historial; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.historial
    ADD CONSTRAINT key_id_historial PRIMARY KEY (id_historial);


--
-- TOC entry 2863 (class 2606 OID 16623)
-- Name: cat_modulo key_id_modulo; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cat_modulo
    ADD CONSTRAINT key_id_modulo PRIMARY KEY (id_modulo);


--
-- TOC entry 2865 (class 2606 OID 16625)
-- Name: cat_perfil key_id_perfil; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cat_perfil
    ADD CONSTRAINT key_id_perfil PRIMARY KEY (id_perfil);


--
-- TOC entry 2894 (class 2606 OID 441879)
-- Name: cat_paises key_pai_id; Type: CONSTRAINT; Schema: public; Owner: raul
--

ALTER TABLE ONLY public.cat_paises
    ADD CONSTRAINT key_pai_id PRIMARY KEY (pai_id);


--
-- TOC entry 2872 (class 2606 OID 16627)
-- Name: usuarios key_usu_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT key_usu_id PRIMARY KEY (usu_id);


--
-- TOC entry 2902 (class 2606 OID 444436)
-- Name: lib_autores lib_autores_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lib_autores
    ADD CONSTRAINT lib_autores_pkey PRIMARY KEY (lib_id, aut_id);


--
-- TOC entry 2869 (class 2606 OID 16629)
-- Name: lib_submodulos lib_submodulos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lib_submodulos
    ADD CONSTRAINT lib_submodulos_pkey PRIMARY KEY (id_submodulo);


--
-- TOC entry 2900 (class 2606 OID 444420)
-- Name: libros libros_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.libros
    ADD CONSTRAINT libros_pkey PRIMARY KEY (lib_id);


--
-- TOC entry 2898 (class 2606 OID 444386)
-- Name: cat_municipios mun_id_key; Type: CONSTRAINT; Schema: public; Owner: raul
--

ALTER TABLE ONLY public.cat_municipios
    ADD CONSTRAINT mun_id_key PRIMARY KEY (mun_id, est_id);


--
-- TOC entry 2904 (class 2606 OID 444604)
-- Name: historial_actividades pk_historial_actividades; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.historial_actividades
    ADD CONSTRAINT pk_historial_actividades PRIMARY KEY (id);


--
-- TOC entry 2888 (class 2606 OID 433067)
-- Name: edi_sellos pk_sellos_edi_id_sel_sello; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.edi_sellos
    ADD CONSTRAINT pk_sellos_edi_id_sel_sello PRIMARY KEY (edi_id, sel_sello);


--
-- TOC entry 2882 (class 2606 OID 444629)
-- Name: seleccionBilingue seleccionBilingue_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."seleccionBilingue"
    ADD CONSTRAINT "seleccionBilingue_pkey" PRIMARY KEY (categoria, grado, biblioteca);


--
-- TOC entry 2878 (class 2606 OID 444627)
-- Name: seleccionMonolingue seleccion_monolingue_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."seleccionMonolingue"
    ADD CONSTRAINT seleccion_monolingue_pkey PRIMARY KEY (categoria, grado, biblioteca);


--
-- TOC entry 2876 (class 2606 OID 16672)
-- Name: texto texto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.texto
    ADD CONSTRAINT texto_pkey PRIMARY KEY (id);


--
-- TOC entry 2880 (class 2606 OID 16686)
-- Name: seleccionMonolingue unique_id_seleccionMonolingue; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."seleccionMonolingue"
    ADD CONSTRAINT "unique_id_seleccionMonolingue" UNIQUE (id);


--
-- TOC entry 2884 (class 2606 OID 16719)
-- Name: seleccionBilingue unique_seleccionBilingue_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."seleccionBilingue"
    ADD CONSTRAINT "unique_seleccionBilingue_id" UNIQUE (id);


--
-- TOC entry 2890 (class 2606 OID 433077)
-- Name: edi_sellos unique_sellos_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.edi_sellos
    ADD CONSTRAINT unique_sellos_id UNIQUE (sel_id);


--
-- TOC entry 2874 (class 2606 OID 433358)
-- Name: usuarios unique_usu_login; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT unique_usu_login UNIQUE (usu_login);


--
-- TOC entry 2870 (class 1259 OID 16630)
-- Name: idx_usu_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX idx_usu_id ON public.usuarios USING btree (usu_id);


--
-- TOC entry 2916 (class 2606 OID 444444)
-- Name: lib_autores fk_aut_pais_lib_autores; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lib_autores
    ADD CONSTRAINT fk_aut_pais_lib_autores FOREIGN KEY (lib_id) REFERENCES public.cat_paises(pai_id);


--
-- TOC entry 2912 (class 2606 OID 441755)
-- Name: editoriales fk_editoriales_usu_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.editoriales
    ADD CONSTRAINT fk_editoriales_usu_id FOREIGN KEY (usu_id) REFERENCES public.usuarios(usu_id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- TOC entry 2917 (class 2606 OID 444605)
-- Name: historial_actividades fk_historial_actividades; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.historial_actividades
    ADD CONSTRAINT fk_historial_actividades FOREIGN KEY (usu_id) REFERENCES public.usuarios(usu_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2915 (class 2606 OID 444439)
-- Name: lib_autores fk_lib_id_lib_autores; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lib_autores
    ADD CONSTRAINT fk_lib_id_lib_autores FOREIGN KEY (lib_id) REFERENCES public.libros(lib_id);


--
-- TOC entry 2911 (class 2606 OID 444646)
-- Name: seleccionMonolingue fk_seleccion_monolingue; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."seleccionMonolingue"
    ADD CONSTRAINT fk_seleccion_monolingue FOREIGN KEY (id_texto) REFERENCES public.texto(id) NOT VALID;


--
-- TOC entry 2913 (class 2606 OID 441731)
-- Name: edi_sellos fk_sellos_edi_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.edi_sellos
    ADD CONSTRAINT fk_sellos_edi_id FOREIGN KEY (edi_id) REFERENCES public.editoriales(id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- TOC entry 2914 (class 2606 OID 444421)
-- Name: libros fk_usu_id_libros; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.libros
    ADD CONSTRAINT fk_usu_id_libros FOREIGN KEY (usu_id) REFERENCES public.usuarios(usu_id) NOT VALID;


--
-- TOC entry 2905 (class 2606 OID 16631)
-- Name: acceso id_modulo_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.acceso
    ADD CONSTRAINT id_modulo_fk FOREIGN KEY (id_modulo) REFERENCES public.cat_modulo(id_modulo);


--
-- TOC entry 2908 (class 2606 OID 16636)
-- Name: lib_submodulos id_modulo_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lib_submodulos
    ADD CONSTRAINT id_modulo_fk FOREIGN KEY (id_acceso) REFERENCES public.acceso(id_acceso) ON UPDATE CASCADE;


--
-- TOC entry 2906 (class 2606 OID 16641)
-- Name: acceso id_perfil_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.acceso
    ADD CONSTRAINT id_perfil_fk FOREIGN KEY (id_perfil) REFERENCES public.cat_perfil(id_perfil);


--
-- TOC entry 2907 (class 2606 OID 441745)
-- Name: historial usu_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.historial
    ADD CONSTRAINT usu_id_fk FOREIGN KEY (usu_id) REFERENCES public.usuarios(usu_id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- TOC entry 2909 (class 2606 OID 16651)
-- Name: usuarios usu_permiso_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usu_permiso_fk FOREIGN KEY (id_modulo) REFERENCES public.cat_modulo(id_modulo);


--
-- TOC entry 2910 (class 2606 OID 16656)
-- Name: usuarios usuarios_usu_privilegio_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_usu_privilegio_fkey FOREIGN KEY (id_perfil) REFERENCES public.cat_perfil(id_perfil);


-- Completed on 2020-12-15 23:51:34 CST

--
-- PostgreSQL database dump complete
--

