PGDMP     +    1                x         
   SICABi2020    11.7    11.7 P    }           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            ~           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            �           1262    24725 
   SICABi2020    DATABASE     �   CREATE DATABASE "SICABi2020" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Spanish_Mexico.1252' LC_CTYPE = 'Spanish_Mexico.1252';
    DROP DATABASE "SICABi2020";
             postgres    false            �            1259    24726    acceso    TABLE     �   CREATE TABLE public.acceso (
    id_acceso smallint NOT NULL,
    id_perfil smallint NOT NULL,
    id_modulo smallint NOT NULL,
    activo smallint DEFAULT 0 NOT NULL
);
    DROP TABLE public.acceso;
       public         postgres    true            �            1259    24730 
   cat_modulo    TABLE     �   CREATE TABLE public.cat_modulo (
    id_modulo smallint NOT NULL,
    nombre character varying(50),
    seudonimo character varying NOT NULL
);
    DROP TABLE public.cat_modulo;
       public         postgres    true            �            1259    24736 
   cat_perfil    TABLE     �   CREATE TABLE public.cat_perfil (
    id_perfil smallint NOT NULL,
    nombre character varying(50) NOT NULL,
    seudonimo character varying NOT NULL
);
    DROP TABLE public.cat_perfil;
       public         postgres    true            �            1259    24742 
   edi_sellos    TABLE     �   CREATE TABLE public.edi_sellos (
    sel_id integer NOT NULL,
    edi_id integer NOT NULL,
    sel_sello character varying NOT NULL
);
    DROP TABLE public.edi_sellos;
       public         postgres    false            �            1259    24748    edi_sellos_sel_id_seq    SEQUENCE     �   CREATE SEQUENCE public.edi_sellos_sel_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.edi_sellos_sel_id_seq;
       public       postgres    false    199            �           0    0    edi_sellos_sel_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.edi_sellos_sel_id_seq OWNED BY public.edi_sellos.sel_id;
            public       postgres    false    200            �            1259    24750    editoriales    TABLE       CREATE TABLE public.editoriales (
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
    DROP TABLE public.editoriales;
       public         postgres    false            �            1259    24756    editoriales_id_seq    SEQUENCE     �   CREATE SEQUENCE public.editoriales_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.editoriales_id_seq;
       public       postgres    false    201            �           0    0    editoriales_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.editoriales_id_seq OWNED BY public.editoriales.id;
            public       postgres    false    202            �            1259    24758 	   historial    TABLE       CREATE TABLE public.historial (
    id_historial smallint NOT NULL,
    usu_id smallint NOT NULL,
    fecha date DEFAULT CURRENT_TIMESTAMP NOT NULL,
    latitude character varying,
    longitude character varying,
    tiempo time with time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.historial;
       public         postgres    true            �            1259    24766    id_acceso_seq    SEQUENCE     v   CREATE SEQUENCE public.id_acceso_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.id_acceso_seq;
       public       postgres    false    196            �           0    0    id_acceso_seq    SEQUENCE OWNED BY     F   ALTER SEQUENCE public.id_acceso_seq OWNED BY public.acceso.id_acceso;
            public       postgres    false    204            �            1259    24768    id_historial_seq    SEQUENCE     y   CREATE SEQUENCE public.id_historial_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.id_historial_seq;
       public       postgres    false    203            �           0    0    id_historial_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.id_historial_seq OWNED BY public.historial.id_historial;
            public       postgres    false    205            �            1259    24770    lib_submodulos    TABLE     �   CREATE TABLE public.lib_submodulos (
    id_submodulo smallint NOT NULL,
    url_sub character varying NOT NULL,
    id_acceso smallint NOT NULL,
    nombre character varying NOT NULL
);
 "   DROP TABLE public.lib_submodulos;
       public         postgres    false            �            1259    24776    seleccionBilingue    TABLE       CREATE TABLE public."seleccionBilingue" (
    id integer NOT NULL,
    clasificacion character varying(100) NOT NULL,
    grado character varying(10) NOT NULL,
    biblioteca character varying(10) NOT NULL,
    "numPreseleccion" integer NOT NULL,
    "numSeleccion" integer NOT NULL
);
 '   DROP TABLE public."seleccionBilingue";
       public         postgres    false            �            1259    24779    seleccionBilingue_id_seq    SEQUENCE     �   CREATE SEQUENCE public."seleccionBilingue_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public."seleccionBilingue_id_seq";
       public       postgres    false    207            �           0    0    seleccionBilingue_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public."seleccionBilingue_id_seq" OWNED BY public."seleccionBilingue".id;
            public       postgres    false    208            �            1259    24781    seleccionMonolingue    TABLE     	  CREATE TABLE public."seleccionMonolingue" (
    id integer NOT NULL,
    texto integer NOT NULL,
    grado character varying(10) NOT NULL,
    biblioteca character varying(10) NOT NULL,
    "numPreseleccion" integer NOT NULL,
    "numSeleccion" integer NOT NULL
);
 )   DROP TABLE public."seleccionMonolingue";
       public         postgres    false            �            1259    24784    seleccionMonolingue_id_seq    SEQUENCE     �   CREATE SEQUENCE public."seleccionMonolingue_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public."seleccionMonolingue_id_seq";
       public       postgres    false    209            �           0    0    seleccionMonolingue_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public."seleccionMonolingue_id_seq" OWNED BY public."seleccionMonolingue".id;
            public       postgres    false    210            �            1259    24786    texto    TABLE     �   CREATE TABLE public.texto (
    id integer NOT NULL,
    clasificacion character varying NOT NULL,
    tipo character varying NOT NULL,
    categoria character varying NOT NULL
);
    DROP TABLE public.texto;
       public         postgres    false            �            1259    24792    texto_id_seq    SEQUENCE     �   CREATE SEQUENCE public.texto_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.texto_id_seq;
       public       postgres    false    211            �           0    0    texto_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.texto_id_seq OWNED BY public.texto.id;
            public       postgres    false    212            �            1259    24794    usuarios    TABLE     ?  CREATE TABLE public.usuarios (
    usu_id integer NOT NULL,
    id_perfil smallint DEFAULT 0 NOT NULL,
    id_modulo smallint DEFAULT 0 NOT NULL,
    usu_nombre character varying,
    usu_login character varying NOT NULL,
    usu_pass character varying NOT NULL,
    usu_creador character varying DEFAULT 0 NOT NULL
);
    DROP TABLE public.usuarios;
       public         postgres    true            �
           2604    24982    acceso id_acceso    DEFAULT     m   ALTER TABLE ONLY public.acceso ALTER COLUMN id_acceso SET DEFAULT nextval('public.id_acceso_seq'::regclass);
 ?   ALTER TABLE public.acceso ALTER COLUMN id_acceso DROP DEFAULT;
       public       postgres    false    204    196            �
           2604    24983    edi_sellos sel_id    DEFAULT     v   ALTER TABLE ONLY public.edi_sellos ALTER COLUMN sel_id SET DEFAULT nextval('public.edi_sellos_sel_id_seq'::regclass);
 @   ALTER TABLE public.edi_sellos ALTER COLUMN sel_id DROP DEFAULT;
       public       postgres    false    200    199            �
           2604    24984    editoriales id    DEFAULT     p   ALTER TABLE ONLY public.editoriales ALTER COLUMN id SET DEFAULT nextval('public.editoriales_id_seq'::regclass);
 =   ALTER TABLE public.editoriales ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    202    201            �
           2604    24985    historial id_historial    DEFAULT     v   ALTER TABLE ONLY public.historial ALTER COLUMN id_historial SET DEFAULT nextval('public.id_historial_seq'::regclass);
 E   ALTER TABLE public.historial ALTER COLUMN id_historial DROP DEFAULT;
       public       postgres    false    205    203            �
           2604    24986    seleccionBilingue id    DEFAULT     �   ALTER TABLE ONLY public."seleccionBilingue" ALTER COLUMN id SET DEFAULT nextval('public."seleccionBilingue_id_seq"'::regclass);
 E   ALTER TABLE public."seleccionBilingue" ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    208    207            �
           2604    24987    seleccionMonolingue id    DEFAULT     �   ALTER TABLE ONLY public."seleccionMonolingue" ALTER COLUMN id SET DEFAULT nextval('public."seleccionMonolingue_id_seq"'::regclass);
 G   ALTER TABLE public."seleccionMonolingue" ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    210    209            �
           2604    24988    texto id    DEFAULT     d   ALTER TABLE ONLY public.texto ALTER COLUMN id SET DEFAULT nextval('public.texto_id_seq'::regclass);
 7   ALTER TABLE public.texto ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    212    211            i          0    24726    acceso 
   TABLE DATA               I   COPY public.acceso (id_acceso, id_perfil, id_modulo, activo) FROM stdin;
    public       postgres    false    196   9`       j          0    24730 
   cat_modulo 
   TABLE DATA               B   COPY public.cat_modulo (id_modulo, nombre, seudonimo) FROM stdin;
    public       postgres    false    197   �`       k          0    24736 
   cat_perfil 
   TABLE DATA               B   COPY public.cat_perfil (id_perfil, nombre, seudonimo) FROM stdin;
    public       postgres    false    198   8a       l          0    24742 
   edi_sellos 
   TABLE DATA               ?   COPY public.edi_sellos (sel_id, edi_id, sel_sello) FROM stdin;
    public       postgres    false    199   �a       n          0    24750    editoriales 
   TABLE DATA               �   COPY public.editoriales (id, usu_id, edi_razonsocial, edi_grupoedit, edi_dirgeneral, edi_dirmail, edi_dircel, edi_dirofis, edi_dirrecados, edi_repnombre, edi_repcargo, edi_repemail, edi_observaciones) FROM stdin;
    public       postgres    false    201   4b       p          0    24758 	   historial 
   TABLE DATA               ]   COPY public.historial (id_historial, usu_id, fecha, latitude, longitude, tiempo) FROM stdin;
    public       postgres    false    203   �b       s          0    24770    lib_submodulos 
   TABLE DATA               R   COPY public.lib_submodulos (id_submodulo, url_sub, id_acceso, nombre) FROM stdin;
    public       postgres    false    206   �h       t          0    24776    seleccionBilingue 
   TABLE DATA               v   COPY public."seleccionBilingue" (id, clasificacion, grado, biblioteca, "numPreseleccion", "numSeleccion") FROM stdin;
    public       postgres    false    207   Zi       v          0    24781    seleccionMonolingue 
   TABLE DATA               p   COPY public."seleccionMonolingue" (id, texto, grado, biblioteca, "numPreseleccion", "numSeleccion") FROM stdin;
    public       postgres    false    209   �i       x          0    24786    texto 
   TABLE DATA               C   COPY public.texto (id, clasificacion, tipo, categoria) FROM stdin;
    public       postgres    false    211   jj       z          0    24794    usuarios 
   TABLE DATA               n   COPY public.usuarios (usu_id, id_perfil, id_modulo, usu_nombre, usu_login, usu_pass, usu_creador) FROM stdin;
    public       postgres    false    213   �m       �           0    0    edi_sellos_sel_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.edi_sellos_sel_id_seq', 9, true);
            public       postgres    false    200            �           0    0    editoriales_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.editoriales_id_seq', 1022, true);
            public       postgres    false    202            �           0    0    id_acceso_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.id_acceso_seq', 13, true);
            public       postgres    false    204            �           0    0    id_historial_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.id_historial_seq', 100, true);
            public       postgres    false    205            �           0    0    seleccionBilingue_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public."seleccionBilingue_id_seq"', 38, true);
            public       postgres    false    208            �           0    0    seleccionMonolingue_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public."seleccionMonolingue_id_seq"', 668, true);
            public       postgres    false    210            �           0    0    texto_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.texto_id_seq', 1, false);
            public       postgres    false    212            �
           2606    24904    editoriales editoriales_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.editoriales
    ADD CONSTRAINT editoriales_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.editoriales DROP CONSTRAINT editoriales_pkey;
       public         postgres    false    201            �
           2606    24906    acceso key_id_acceso 
   CONSTRAINT     Y   ALTER TABLE ONLY public.acceso
    ADD CONSTRAINT key_id_acceso PRIMARY KEY (id_acceso);
 >   ALTER TABLE ONLY public.acceso DROP CONSTRAINT key_id_acceso;
       public         postgres    false    196            �
           2606    24908    historial key_id_historial 
   CONSTRAINT     b   ALTER TABLE ONLY public.historial
    ADD CONSTRAINT key_id_historial PRIMARY KEY (id_historial);
 D   ALTER TABLE ONLY public.historial DROP CONSTRAINT key_id_historial;
       public         postgres    false    203            �
           2606    24910    cat_modulo key_id_modulo 
   CONSTRAINT     ]   ALTER TABLE ONLY public.cat_modulo
    ADD CONSTRAINT key_id_modulo PRIMARY KEY (id_modulo);
 B   ALTER TABLE ONLY public.cat_modulo DROP CONSTRAINT key_id_modulo;
       public         postgres    false    197            �
           2606    24912    cat_perfil key_id_perfil 
   CONSTRAINT     ]   ALTER TABLE ONLY public.cat_perfil
    ADD CONSTRAINT key_id_perfil PRIMARY KEY (id_perfil);
 B   ALTER TABLE ONLY public.cat_perfil DROP CONSTRAINT key_id_perfil;
       public         postgres    false    198            �
           2606    24914    usuarios key_usu_id 
   CONSTRAINT     U   ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT key_usu_id PRIMARY KEY (usu_id);
 =   ALTER TABLE ONLY public.usuarios DROP CONSTRAINT key_usu_id;
       public         postgres    false    213            �
           2606    24916 "   lib_submodulos lib_submodulos_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.lib_submodulos
    ADD CONSTRAINT lib_submodulos_pkey PRIMARY KEY (id_submodulo);
 L   ALTER TABLE ONLY public.lib_submodulos DROP CONSTRAINT lib_submodulos_pkey;
       public         postgres    false    206            �
           2606    24918 -   seleccionMonolingue pk_seleccionMonolingue_id 
   CONSTRAINT     �   ALTER TABLE ONLY public."seleccionMonolingue"
    ADD CONSTRAINT "pk_seleccionMonolingue_id" PRIMARY KEY (texto, grado, biblioteca);
 [   ALTER TABLE ONLY public."seleccionMonolingue" DROP CONSTRAINT "pk_seleccionMonolingue_id";
       public         postgres    false    209    209    209            �
           2606    24920 %   edi_sellos pk_sellos_edi_id_sel_sello 
   CONSTRAINT     r   ALTER TABLE ONLY public.edi_sellos
    ADD CONSTRAINT pk_sellos_edi_id_sel_sello PRIMARY KEY (edi_id, sel_sello);
 O   ALTER TABLE ONLY public.edi_sellos DROP CONSTRAINT pk_sellos_edi_id_sel_sello;
       public         postgres    false    199    199            �
           2606    24922 (   seleccionBilingue seleccionBilingue_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public."seleccionBilingue"
    ADD CONSTRAINT "seleccionBilingue_pkey" PRIMARY KEY (clasificacion, grado, biblioteca);
 V   ALTER TABLE ONLY public."seleccionBilingue" DROP CONSTRAINT "seleccionBilingue_pkey";
       public         postgres    false    207    207    207            �
           2606    24924    texto texto_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.texto
    ADD CONSTRAINT texto_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.texto DROP CONSTRAINT texto_pkey;
       public         postgres    false    211            �
           2606    24926 %   editoriales unique_editorial_dir_mail 
   CONSTRAINT     g   ALTER TABLE ONLY public.editoriales
    ADD CONSTRAINT unique_editorial_dir_mail UNIQUE (edi_dirmail);
 O   ALTER TABLE ONLY public.editoriales DROP CONSTRAINT unique_editorial_dir_mail;
       public         postgres    false    201            �
           2606    24928 %   editoriales unique_editorial_rep_mail 
   CONSTRAINT     h   ALTER TABLE ONLY public.editoriales
    ADD CONSTRAINT unique_editorial_rep_mail UNIQUE (edi_repemail);
 O   ALTER TABLE ONLY public.editoriales DROP CONSTRAINT unique_editorial_rep_mail;
       public         postgres    false    201            �
           2606    24930 1   seleccionMonolingue unique_id_seleccionMonolingue 
   CONSTRAINT     n   ALTER TABLE ONLY public."seleccionMonolingue"
    ADD CONSTRAINT "unique_id_seleccionMonolingue" UNIQUE (id);
 _   ALTER TABLE ONLY public."seleccionMonolingue" DROP CONSTRAINT "unique_id_seleccionMonolingue";
       public         postgres    false    209            �
           2606    24932 -   seleccionBilingue unique_seleccionBilingue_id 
   CONSTRAINT     j   ALTER TABLE ONLY public."seleccionBilingue"
    ADD CONSTRAINT "unique_seleccionBilingue_id" UNIQUE (id);
 [   ALTER TABLE ONLY public."seleccionBilingue" DROP CONSTRAINT "unique_seleccionBilingue_id";
       public         postgres    false    207            �
           2606    24934    edi_sellos unique_sellos_id 
   CONSTRAINT     X   ALTER TABLE ONLY public.edi_sellos
    ADD CONSTRAINT unique_sellos_id UNIQUE (sel_id);
 E   ALTER TABLE ONLY public.edi_sellos DROP CONSTRAINT unique_sellos_id;
       public         postgres    false    199            �
           1259    24935 
   idx_usu_id    INDEX     H   CREATE UNIQUE INDEX idx_usu_id ON public.usuarios USING btree (usu_id);
    DROP INDEX public.idx_usu_id;
       public         postgres    false    213            �
           2606    24936 !   editoriales fk_editoriales_usu_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.editoriales
    ADD CONSTRAINT fk_editoriales_usu_id FOREIGN KEY (usu_id) REFERENCES public.usuarios(usu_id);
 K   ALTER TABLE ONLY public.editoriales DROP CONSTRAINT fk_editoriales_usu_id;
       public       postgres    false    201    213    2790            �
           2606    24941 0   seleccionMonolingue fk_seleccionMonolingue_texto    FK CONSTRAINT     �   ALTER TABLE ONLY public."seleccionMonolingue"
    ADD CONSTRAINT "fk_seleccionMonolingue_texto" FOREIGN KEY (texto) REFERENCES public.texto(id) NOT VALID;
 ^   ALTER TABLE ONLY public."seleccionMonolingue" DROP CONSTRAINT "fk_seleccionMonolingue_texto";
       public       postgres    false    211    2787    209            �
           2606    24946    edi_sellos fk_sellos_edi_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.edi_sellos
    ADD CONSTRAINT fk_sellos_edi_id FOREIGN KEY (edi_id) REFERENCES public.editoriales(id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 E   ALTER TABLE ONLY public.edi_sellos DROP CONSTRAINT fk_sellos_edi_id;
       public       postgres    false    199    2769    201            �
           2606    24951    acceso id_modulo_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.acceso
    ADD CONSTRAINT id_modulo_fk FOREIGN KEY (id_modulo) REFERENCES public.cat_modulo(id_modulo);
 =   ALTER TABLE ONLY public.acceso DROP CONSTRAINT id_modulo_fk;
       public       postgres    false    196    2761    197            �
           2606    24956    lib_submodulos id_modulo_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.lib_submodulos
    ADD CONSTRAINT id_modulo_fk FOREIGN KEY (id_acceso) REFERENCES public.acceso(id_acceso) ON UPDATE CASCADE;
 E   ALTER TABLE ONLY public.lib_submodulos DROP CONSTRAINT id_modulo_fk;
       public       postgres    false    2759    196    206            �
           2606    24961    acceso id_perfil_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.acceso
    ADD CONSTRAINT id_perfil_fk FOREIGN KEY (id_perfil) REFERENCES public.cat_perfil(id_perfil);
 =   ALTER TABLE ONLY public.acceso DROP CONSTRAINT id_perfil_fk;
       public       postgres    false    198    2763    196            �
           2606    24966    historial usu_id_fk    FK CONSTRAINT     x   ALTER TABLE ONLY public.historial
    ADD CONSTRAINT usu_id_fk FOREIGN KEY (usu_id) REFERENCES public.usuarios(usu_id);
 =   ALTER TABLE ONLY public.historial DROP CONSTRAINT usu_id_fk;
       public       postgres    false    213    2790    203            �
           2606    24971    usuarios usu_permiso_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usu_permiso_fk FOREIGN KEY (id_modulo) REFERENCES public.cat_modulo(id_modulo);
 A   ALTER TABLE ONLY public.usuarios DROP CONSTRAINT usu_permiso_fk;
       public       postgres    false    197    2761    213            �
           2606    24976 %   usuarios usuarios_usu_privilegio_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_usu_privilegio_fkey FOREIGN KEY (id_perfil) REFERENCES public.cat_perfil(id_perfil);
 O   ALTER TABLE ONLY public.usuarios DROP CONSTRAINT usuarios_usu_privilegio_fkey;
       public       postgres    false    2763    213    198            i   ;   x���	 0��0��ݥ����whR�1"�`��G�=���>o�(���2i������	�      j   �   x�]�;�0�g�=oV�:"!��b�����G��H!}������9�i-S�N�D���V�Xŷ)j)ʤ:O�Lkp	g�)��bU|�F[.C\AiBR��G
�G�Gq''�E����*�o����.�:��.#WvP����M�lH�)q�!��Ae�      k   �   x�u�1�0Eg�=��؊� 1�X�Kũ҈;1s�^��������v�}�J<Y��	(�g+!��rv���B5�@���8��l�1�4��x��q��&J��5�Nb�&^��-T=�/�ݿ�)�<�f4�to���˴��/�F�X�Av�^F�<�eT�D� �n%      l   .   x�3�4402�,�2�2��̠,c.s�(ieqYBY�\1z\\\ ]B
�      n   d   x�3402���LM�,�/�L�Ab�d�&ٜE��I�鹉�9z����� �i �E�E���9Ca~R1�����
�z�z�\4ˌ���ͺ=... ��D�      p   �  x��X[v#;�v�2:�%��r���[H�vg�̱�|%*@P@��A���t��ǃ��`��?��F�����ڤ����/Fކ��,�0�`�V@���uf�:��[�w���Y@Ӄ{�4[�R߻t��=�AtX$-*��h��\��,�D�@��q�4�a���w9D�#9x�!���-2�3_�r�S��ۆ�M��=�"h���T��H����A���~(\���
N�����5������by�N����ѳ(#��-�P��y��q���P��|������߹V�;����� �T=����su䤊>�:���E�h}���[d��7�IHR�=}��e��G^��
%l9f�X���1FGi�n��`���[=��.���F��<vHC߾4"YܺA%j�.몾�n!p�"#r��`j���s	��(�Y��H�s/�.?�^�4��#���DJ�!�@�o{E��s��E��B[��������Y1p�zZ���W����qAì������̀\�[l�Uo�DB��Q��̡��A�	���)?8���>�׊��$��f�,fh�K,<^�B|�'Pb�!j�j"�����ZYR��g�I���gCru��wC�����ga1�v=��U]2�w���E�ܖpp�l�k�@]SMe_������:�&��*%Fǹ3uO"��Ҍ]�� �[�j�c���FI7ɘ�F}k��Y�jF)^Jo�c����^&�mf^H#0:|��_�pk��?�-�h��Y�����/1�C�7��;A�]���|j2f����9V��d{����(��%h{�݅8=���Zn>�b{���_g��A��1�r��Њ[_�~�2 �{X\��W���=07���)�,1��s�+��L��M�dCO6�3a���F���%��ve�ƯA�ǊӚ�3c���q�^�6��2&���S*��Rn��8t{��3��n̼�{� RN�#�B�A��<v/��S��FKu�{��c`��l��8/�cP�fuH��y,_��z�`�Y��N�Yĺ�[e�+�Q
o����X�� �����N�����&�P("��P*�T"M�0�|���&RJ��[Ep}�'�ٜr�Q�w]����˅�"1A,b���"�!�|Y��Y7g:�ci����MÌJL���QF&����@�u�bT���� Z&bsf8�s��%�i+ٱ�_r�9�sL�a��G�(f¶��E�Q2k�du�c/�^�H��UM�	�TC�֧Г��j�D]��	cO�=]D݂Y��S��*���,h�-a��vɥ��.C�2O���0X���&g���!X��V$�+�G3S?[%y�S����5�7\!��N��|��K���G���H}i���KeM����v�Xȱ�'^�R��<h��a}R*}�s��[L�e�3�>���fi�0��2d͟��R��c�����I��*�S�����}}}�X>�"      s   �   x�}�M�0��3��	$�g��^wn���$�M���<���h"�7��{y9����=)�3���$E癲��ړ�
��福.����bMn��(��)�v���,I��'��y��>ScH(-��a�XI�ǩxΩ*���z������5&I����g��Ӈ�<� \��D|�k|�      t   ]   x�36�LI�/(J-N��I,�O�/I-JN-ʏg�&e��*J��2s2��KS�9�8�\9���؜L32�f �� �C�;!f��qqq ��I&      v   �   x�U�;
�0�zt�iv�r��.܅ܿ�胜���I;�
W��sb��)�(2�`��!
�D���Z{W�Q���D �;��s��#7<:2�a��9��� ���Q2��f୰hV��.\_'e�Ψ4��G+D�?�5֨?x-)�/d�:A      x     x��WKr�0]G��2S���.�i�QJHD���� ^e7[.6O"�r*�j� !^����nV7�䝓^XM��	�,�˪%��&�c��+�������h�Bt���u)��\D�:��=��������+��y~���H�}�!#��w�e�J�`YU5�;�<�<��<),6x�ּ#O�e�9�qO���AI�g������w����"�S���q���Q�-�%�5�P����UmJ�g��Yi"M[�4�V�ō��v�QOC�}�[2�%���F+���A�t´���9Wx:(zN�S�4��[��j
�ƁZ*rbq����JS޹�A!���j
�F@?)%R�La���������	GJ�[.\�a�ȥ�dg]R<�=��DM�Wi��z
K.�:+}��O�����M:eeM�C�lȼ�� g&��$g���c���(�C��,	 �!���7!\_��RDD� �$���?�j���S�r����|���?���[y �'��4�%�V��U��{_/��0V�}���~@�v�	L>, xn�(��?��[=�U�����U���sO?��j� ���j	j6J��eϗ`�e�����.�慔�a���e��_�]��kV��X�z��z��0jԅl��::wԅ5�Y��'A�.��5߿�6u!aG-��Aw��ddB�F�SB�oa:(c	Se�dC�V��>�E��#�au!�&�K����6:m�3�s��l��l3�\g��vc��g�0A��Pyǫp��������?H      z   E   x�3�4 ����ԒļD�Ԣ����|���|�����<N.#NtL.JM�,IL�/k3����� �'5     