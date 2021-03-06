PGDMP         	                x            sicabi    11.7 (Debian 11.7-2.pgdg90+1)    11.7 (Debian 11.7-2.pgdg90+1)     \           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            ]           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            ^           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            _           1262    16494    sicabi    DATABASE     x   CREATE DATABASE sicabi WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'es_MX.UTF-8' LC_CTYPE = 'es_MX.UTF-8';
    DROP DATABASE sicabi;
             postgres    false            �            1259    16679    seleccionMonolingue    TABLE     	  CREATE TABLE public."seleccionMonolingue" (
    id integer NOT NULL,
    texto integer NOT NULL,
    grado character varying(10) NOT NULL,
    biblioteca character varying(10) NOT NULL,
    "numPreseleccion" integer NOT NULL,
    "numSeleccion" integer NOT NULL
);
 )   DROP TABLE public."seleccionMonolingue";
       public         postgres    false            �            1259    16677    seleccionMonolingue_id_seq    SEQUENCE     �   CREATE SEQUENCE public."seleccionMonolingue_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public."seleccionMonolingue_id_seq";
       public       postgres    false    207            `           0    0    seleccionMonolingue_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public."seleccionMonolingue_id_seq" OWNED BY public."seleccionMonolingue".id;
            public       postgres    false    206            �
           2604    16682    seleccionMonolingue id    DEFAULT     �   ALTER TABLE ONLY public."seleccionMonolingue" ALTER COLUMN id SET DEFAULT nextval('public."seleccionMonolingue_id_seq"'::regclass);
 G   ALTER TABLE public."seleccionMonolingue" ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    206    207    207            Y          0    16679    seleccionMonolingue 
   TABLE DATA               p   COPY public."seleccionMonolingue" (id, texto, grado, biblioteca, "numPreseleccion", "numSeleccion") FROM stdin;
    public       postgres    false    207   �       a           0    0    seleccionMonolingue_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public."seleccionMonolingue_id_seq"', 386, true);
            public       postgres    false    206            �
           2606    16684 -   seleccionMonolingue pk_seleccionMonolingue_id 
   CONSTRAINT     �   ALTER TABLE ONLY public."seleccionMonolingue"
    ADD CONSTRAINT "pk_seleccionMonolingue_id" PRIMARY KEY (texto, grado, biblioteca);
 [   ALTER TABLE ONLY public."seleccionMonolingue" DROP CONSTRAINT "pk_seleccionMonolingue_id";
       public         postgres    false    207    207    207            �
           2606    16686 1   seleccionMonolingue unique_id_seleccionMonolingue 
   CONSTRAINT     n   ALTER TABLE ONLY public."seleccionMonolingue"
    ADD CONSTRAINT "unique_id_seleccionMonolingue" UNIQUE (id);
 _   ALTER TABLE ONLY public."seleccionMonolingue" DROP CONSTRAINT "unique_id_seleccionMonolingue";
       public         postgres    false    207            �
           2606    16687 0   seleccionMonolingue fk_seleccionMonolingue_texto    FK CONSTRAINT     �   ALTER TABLE ONLY public."seleccionMonolingue"
    ADD CONSTRAINT "fk_seleccionMonolingue_texto" FOREIGN KEY (texto) REFERENCES public.texto(id) NOT VALID;
 ^   ALTER TABLE ONLY public."seleccionMonolingue" DROP CONSTRAINT "fk_seleccionMonolingue_texto";
       public       postgres    false    207            Y   �   x�]�+nD1DQ\o1��m�d�a��?H�ȗ^8myΣ��z���SM홫i�tM���2(K�*��F)/�'P�'`�'p�'��'��'��'��'��'��ր>���7�>�|�z���_� ��Ғ/�Sȗ�)���T��w���w:��W�&_~�������J�˿�
%��J諔��VB_G	�nJ�wW���
�=U��u�Ӄ������y�?���     