PGDMP         	                x            sicabi    11.7 (Debian 11.7-2.pgdg90+1)    11.7 (Debian 11.7-2.pgdg90+1)     Y           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            Z           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            [           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            \           1262    16494    sicabi    DATABASE     x   CREATE DATABASE sicabi WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'es_MX.UTF-8' LC_CTYPE = 'es_MX.UTF-8';
    DROP DATABASE sicabi;
             postgres    false            �            1259    16664    texto    TABLE     �   CREATE TABLE public.texto (
    id integer NOT NULL,
    clasificacion character varying NOT NULL,
    tipo character varying NOT NULL,
    categoria character varying NOT NULL
);
    DROP TABLE public.texto;
       public         postgres    false            �            1259    16662    texto_id_seq    SEQUENCE     �   CREATE SEQUENCE public.texto_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.texto_id_seq;
       public       postgres    false    205            ]           0    0    texto_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.texto_id_seq OWNED BY public.texto.id;
            public       postgres    false    204            �
           2604    16667    texto id    DEFAULT     d   ALTER TABLE ONLY public.texto ALTER COLUMN id SET DEFAULT nextval('public.texto_id_seq'::regclass);
 7   ALTER TABLE public.texto ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    204    205    205            V          0    16664    texto 
   TABLE DATA               C   COPY public.texto (id, clasificacion, tipo, categoria) FROM stdin;
    public       postgres    false    205   p
       ^           0    0    texto_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.texto_id_seq', 1, false);
            public       postgres    false    204            �
           2606    16672    texto texto_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.texto
    ADD CONSTRAINT texto_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.texto DROP CONSTRAINT texto_pkey;
       public         postgres    false    205            V     x��WKr�0]G��2S���.�i�QJHD���� ^e7[.6O"�r*�j� !^����nV7�䝓^XM��	�,�˪%��&�c��+�������h�Bt���u)��\D�:��=��������+��y~���H�}�!#��w�e�J�`YU5�;�<�<��<),6x�ּ#O�e�9�qO���AI�g������w����"�S���q���Q�-�%�5�P����UmJ�g��Yi"M[�4�V�ō��v�QOC�}�[2�%���F+���A�t´���9Wx:(zN�S�4��[��j
�ƁZ*rbq����JS޹�A!���j
�F@?)%R�La���������	GJ�[.\�a�ȥ�dg]R<�=��DM�Wi��z
K.�:+}��O�����M:eeM�C�lȼ�� g&��$g���c���(�C��,	 �!���7!\_��RDD� �$���?�j���S�r����|���?���[y �'��4�%�V��U��{_/��0V�}���~@�v�	L>, xn�(��?��[=�U�����U���sO?��j� ���j	j6J��eϗ`�e�����.�慔�a���e��_�]��kV��X�z��z��0jԅl��::wԅ5�Y��'A�.��5߿�6u!aG-��Aw��ddB�F�SB�oa:(c	Se�dC�V��>�E��#�au!�&�K����6:m�3�s��l��l3�\g��vc��g�0A��Pyǫp��������?H     