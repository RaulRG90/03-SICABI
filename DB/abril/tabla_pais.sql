PGDMP     3    %        
        x        	   baula2019    11.8 (Debian 11.8-1.pgdg90+1)    11.8 (Debian 11.8-1.pgdg90+1)     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            �           1262    16899 	   baula2019    DATABASE     {   CREATE DATABASE baula2019 WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'es_MX.UTF-8' LC_CTYPE = 'es_MX.UTF-8';
    DROP DATABASE baula2019;
             postgres    false            �            1259    16965 
   cat_paises    TABLE     �   CREATE TABLE public.cat_paises (
    pai_id smallint NOT NULL,
    pai_pais character varying(50),
    pai_abreviado character varying(4)
);
    DROP TABLE public.cat_paises;
       public         raul    true            �          0    16965 
   cat_paises 
   TABLE DATA               E   COPY public.cat_paises (pai_id, pai_pais, pai_abreviado) FROM stdin;
    public       raul    false    205   y       f           2606    113904    cat_paises key_pai_id 
   CONSTRAINT     W   ALTER TABLE ONLY public.cat_paises
    ADD CONSTRAINT key_pai_id PRIMARY KEY (pai_id);
 ?   ALTER TABLE ONLY public.cat_paises DROP CONSTRAINT key_pai_id;
       public         raul    false    205            �   �  x�U�=s�F�k���U���,�q��H�><O�ݚ�ǽ,IEV���R���;��c@e�i�y����b\LG���a������Q��6"�������(4�SS�\����[�v��f���~l{ۆ���al?���痮i���txh;�O]�A��@�	����'t��v�FĩR��qF'��{���\G���n�`�B8�ݨ*�t<o��B���g�d�*�5���|0"YѺi�7 �i-Gp��l�$���<�!����!��۝lIJ����?lDRл�kr�`
I)�;�w�*$�ܫ�J$5�NM��y��F���o��d0�4���o���&��tn��i�����4��|R����!��HK:�yH+����{� iM|�Y�@����U��/D�%w��)�%�&��8�B������n=]�'d]yYo؈,���=r��-n����k��ݪ��t���c�Ut-9��)���0Nw&���zra��'�4�n\���M#O���Ǧ�t�N���M O�fZ*H�<f-�n۾��
��N�蟃�I�{_�J�>���k���/��Ŋ�Zq�w�/ѝ�p�mE���H�����i�EJ��`�*Qd����y���B���S㇎e�J��x�.!�T�(�Xz��PT�u�IJ[����r���M��(K]量�(�ާ�2�c~�*�(SI�=kp�(3:�v�_(������[����P��_��Ԙ-o#�J}���j�v�(��w�^W�J]5׿�@�}���J�"�b����h��Ηх[L!��.�q���@Uh�XRs0���ߕ\t黝�+�QU?���NV��s���.=��\���Q2�,�ұ�Wn�O*��:�ۙ��PgRx�{�ǫ��KG�������~3I4��k�M'��D���Jڪ�Eh^��a�{��>=?��'���������\��d6i��uM���~~���%��X��֍��B�cq���g[�$��ǯ ��7
     