PGDMP     (                    x        	   baula2019    11.8 (Debian 11.8-1.pgdg90+1)    11.8 (Debian 11.8-1.pgdg90+1)     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            �           1262    16899 	   baula2019    DATABASE     {   CREATE DATABASE baula2019 WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'es_MX.UTF-8' LC_CTYPE = 'es_MX.UTF-8';
    DROP DATABASE baula2019;
             postgres    false            �            1259    16950    cat_estados    TABLE     �   CREATE TABLE public.cat_estados (
    est_id smallint NOT NULL,
    est_abreviado character varying,
    est_estado character varying
);
    DROP TABLE public.cat_estados;
       public         raul    true            �          0    16950    cat_estados 
   TABLE DATA               H   COPY public.cat_estados (est_id, est_abreviado, est_estado) FROM stdin;
    public       raul    false    202   ~       f           2606    113896    cat_estados key_est_id 
   CONSTRAINT     X   ALTER TABLE ONLY public.cat_estados
    ADD CONSTRAINT key_est_id PRIMARY KEY (est_id);
 @   ALTER TABLE ONLY public.cat_estados DROP CONSTRAINT key_est_id;
       public         raul    false    202            �   y  x�]�Mn�0��3��	���Q ���UP E7��Ф����m�̢�A댁n
�{�{G3�>�S(ir��l*�o�ިj9{�[�����K�9�t�����`=��S��ɟ�5ls�m!Oo�2'
�Q���x��v '��`�f���\��ޯV�:�Ǜ��/��
��B�z{�!P���w�/�{�vf��Q��]҄��C1c��Ƚ���=w�8~Y�y���9����]��:����z�r��-�^��
��E L��x�$Q*�^�W��'ǽ��������X~bS�s�e��Q�@�h���68��	WЎ6��T_�i�I!~p�/�x�b�kh��
�-�`�[�v��m��     