PGDMP     8    	                x            sicabi    11.7 (Debian 11.7-2.pgdg90+1)    11.7 (Debian 11.7-2.pgdg90+1)     [           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            \           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            ]           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            ^           1262    16494    sicabi    DATABASE     x   CREATE DATABASE sicabi WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'es_MX.UTF-8' LC_CTYPE = 'es_MX.UTF-8';
    DROP DATABASE sicabi;
             postgres    false            �            1259    16712    seleccionBilingue    TABLE       CREATE TABLE public."seleccionBilingue" (
    id integer NOT NULL,
    clasificacion character varying(100) NOT NULL,
    grado character varying(10) NOT NULL,
    biblioteca character varying(10) NOT NULL,
    "numPreseleccion" integer NOT NULL,
    "numSeleccion" integer NOT NULL
);
 '   DROP TABLE public."seleccionBilingue";
       public         postgres    false            �            1259    16710    seleccionBilingue_id_seq    SEQUENCE     �   CREATE SEQUENCE public."seleccionBilingue_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public."seleccionBilingue_id_seq";
       public       postgres    false    209            _           0    0    seleccionBilingue_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public."seleccionBilingue_id_seq" OWNED BY public."seleccionBilingue".id;
            public       postgres    false    208            �
           2604    16715    seleccionBilingue id    DEFAULT     �   ALTER TABLE ONLY public."seleccionBilingue" ALTER COLUMN id SET DEFAULT nextval('public."seleccionBilingue_id_seq"'::regclass);
 E   ALTER TABLE public."seleccionBilingue" ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    209    208    209            X          0    16712    seleccionBilingue 
   TABLE DATA               v   COPY public."seleccionBilingue" (id, clasificacion, grado, biblioteca, "numPreseleccion", "numSeleccion") FROM stdin;
    public       postgres    false    209   �       `           0    0    seleccionBilingue_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public."seleccionBilingue_id_seq"', 2, true);
            public       postgres    false    208            �
           2606    16733 (   seleccionBilingue seleccionBilingue_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public."seleccionBilingue"
    ADD CONSTRAINT "seleccionBilingue_pkey" PRIMARY KEY (clasificacion, grado, biblioteca);
 V   ALTER TABLE ONLY public."seleccionBilingue" DROP CONSTRAINT "seleccionBilingue_pkey";
       public         postgres    false    209    209    209            �
           2606    16719 -   seleccionBilingue unique_seleccionBilingue_id 
   CONSTRAINT     j   ALTER TABLE ONLY public."seleccionBilingue"
    ADD CONSTRAINT "unique_seleccionBilingue_id" UNIQUE (id);
 [   ALTER TABLE ONLY public."seleccionBilingue" DROP CONSTRAINT "unique_seleccionBilingue_id";
       public         postgres    false    209            X   S   x�3�LI�/(J-N��I,�O�/I-JN-ʏg�&e&rp:9rpp�4$�&���A�Y��\���kT����� #&d     