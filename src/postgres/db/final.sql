PGDMP      .                |           postgres    11.7 (Debian 11.7-2.pgdg90+1)    16.2 H    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    13067    postgres    DATABASE     t   CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'es_ES.UTF-8';
    DROP DATABASE postgres;
                postgres    false            �           0    0    DATABASE postgres    COMMENT     N   COMMENT ON DATABASE postgres IS 'default administrative connection database';
                   postgres    false    2954                        2615    2200    public    SCHEMA     2   -- *not* creating schema, since initdb creates it
 2   -- *not* dropping schema, since initdb creates it
                postgres    false            �           0    0    SCHEMA public    ACL     Q   REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;
                   postgres    false    6            �            1255    16384    actualizar_j01()    FUNCTION     �   CREATE FUNCTION public.actualizar_j01() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    IF NEW.j01 IS NULL THEN
        NEW.j01 := nextval('j01_secuencia');
    END IF;
    RETURN NEW;
END;
$$;
 '   DROP FUNCTION public.actualizar_j01();
       public          postgres    false    6            �            1255    16385    actualizar_j02()    FUNCTION     �   CREATE FUNCTION public.actualizar_j02() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    IF NEW.j02 IS NULL THEN
        NEW.j02 := nextval('j02_secuencia');
    END IF;
    RETURN NEW;
END;
$$;
 '   DROP FUNCTION public.actualizar_j02();
       public          postgres    false    6            �            1255    16386    actualizar_j03()    FUNCTION     �   CREATE FUNCTION public.actualizar_j03() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    IF NEW.j03 IS NULL THEN
        NEW.j03 := nextval('j03_secuencia');
    END IF;
    RETURN NEW;
END;
$$;
 '   DROP FUNCTION public.actualizar_j03();
       public          postgres    false    6            �            1255    16387    actualizar_j04()    FUNCTION     �   CREATE FUNCTION public.actualizar_j04() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    IF NEW.j04 IS NULL THEN
        NEW.j04 := nextval('j04_secuencia');
    END IF;
    RETURN NEW;
END;
$$;
 '   DROP FUNCTION public.actualizar_j04();
       public          postgres    false    6            �            1255    16388    calcular_j2_da_incassare()    FUNCTION     �   CREATE FUNCTION public.calcular_j2_da_incassare() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    NEW.j2_da_incassare := NEW.j2tot - NEW.j2_incassato;
    RETURN NEW;
END;
$$;
 1   DROP FUNCTION public.calcular_j2_da_incassare();
       public          postgres    false    6            �            1255    16389    calcular_j2_incassato()    FUNCTION     �   CREATE FUNCTION public.calcular_j2_incassato() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    NEW.j2_incassato := NEW.j2_incas_1 + NEW.j2_incas_2 + NEW.j2_incas_3;
    RETURN NEW;
END;
$$;
 .   DROP FUNCTION public.calcular_j2_incassato();
       public          postgres    false    6            �            1255    16390    calcular_j2cnpaia()    FUNCTION     �   CREATE FUNCTION public.calcular_j2cnpaia() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    NEW.j2cnpaia := NEW.j2imp * NEW.j2pcnpaia;
    RETURN NEW;
END;
$$;
 *   DROP FUNCTION public.calcular_j2cnpaia();
       public          postgres    false    6            �            1255    16391    calcular_j2iva()    FUNCTION     �   CREATE FUNCTION public.calcular_j2iva() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    NEW.j2iva := NEW.j2impiva * NEW.j2piva;
    RETURN NEW;
END;
$$;
 '   DROP FUNCTION public.calcular_j2iva();
       public          postgres    false    6            �            1255    16392    calcular_j2tot()    FUNCTION     �   CREATE FUNCTION public.calcular_j2tot() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    NEW.j2tot := NEW.j2impiva + NEW.j2iva;
    RETURN NEW;
END;
$$;
 '   DROP FUNCTION public.calcular_j2tot();
       public          postgres    false    6            �            1255    16393    calcular_total()    FUNCTION     �   CREATE FUNCTION public.calcular_total() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    NEW.j1tot_fat := NEW.j1fat_1 + NEW.j1fat_2 + NEW.j1fat_3;
    RETURN NEW;
END;
$$;
 '   DROP FUNCTION public.calcular_total();
       public          postgres    false    6            �            1255    16394 	   set_j03()    FUNCTION     �   CREATE FUNCTION public.set_j03() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  NEW.j03 = NEXTVAL('j03_seq');
  RETURN NEW;
END;
$$;
     DROP FUNCTION public.set_j03();
       public          postgres    false    6            �            1259    16395    j01_comm    TABLE     �  CREATE TABLE public.j01_comm (
    j01 integer NOT NULL,
    j03 character varying(500),
    j04 integer,
    j1impiva money,
    j1rif_offer character varying(40),
    j1rif_client character varying(500),
    j1dat date,
    j1titol character varying(500),
    j1note character varying(1000),
    j1fat_1 money,
    j1fat_1_rif character varying(500),
    j1fat_2 money,
    j1fat_2_rif character varying(500),
    j1fat_3 money,
    j1fat_3_rif character varying(500),
    j1tot_fat money,
    sel boolean,
    link_ordine text,
    j1_avanz numeric(10,2),
    j1_av_data date,
    CONSTRAINT j01_comm_j1_avanz_check CHECK (((j1_avanz >= (0)::numeric) AND (j1_avanz <= (100)::numeric)))
);
    DROP TABLE public.j01_comm;
       public            postgres    false    6            �            1259    16402    j01_comm_j01_seq    SEQUENCE     �   CREATE SEQUENCE public.j01_comm_j01_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.j01_comm_j01_seq;
       public          postgres    false    196    6            �           0    0    j01_comm_j01_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.j01_comm_j01_seq OWNED BY public.j01_comm.j01;
          public          postgres    false    197            �            1259    16404    j01_secuencia    SEQUENCE     v   CREATE SEQUENCE public.j01_secuencia
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.j01_secuencia;
       public          postgres    false    6            �            1259    16406    j02_fat    TABLE     b  CREATE TABLE public.j02_fat (
    j02 integer NOT NULL,
    j2num character varying(500),
    j2dat date,
    j01 integer,
    j03 integer,
    j04 integer,
    j2preset character varying(2000),
    j2imp money,
    j2pcnpaia numeric(5,2),
    j2cnpaia money,
    j2impiva money,
    j2piva numeric(5,2),
    j2iva money,
    j2tot money,
    j2note character varying(2000),
    j2_data_saldo date,
    pag_saldo boolean,
    j2_incas_1 money,
    j2_incas_2 money,
    j2_incas_3 money,
    j2_incassato money,
    j2_da_incassare money,
    ordid integer,
    j2_dat_inc_1 date,
    j2_dat_inc_2 date,
    j2_dat_pag_contr date,
    previs integer,
    CONSTRAINT j2_fat_j2pcnpaia_check CHECK (((j2pcnpaia >= (0)::numeric) AND (j2pcnpaia <= (100)::numeric))),
    CONSTRAINT j2_fat_j2piva_check CHECK (((j2piva >= (0)::numeric) AND (j2piva <= (100)::numeric)))
);
    DROP TABLE public.j02_fat;
       public            postgres    false    6            �            1259    16414    j02_secuencia    SEQUENCE     v   CREATE SEQUENCE public.j02_secuencia
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.j02_secuencia;
       public          postgres    false    6            �            1259    16416    j03_nomin_clienti    TABLE     �  CREATE TABLE public.j03_nomin_clienti (
    j03 integer NOT NULL,
    nomin character varying(250),
    plva character varying(15),
    cfisc character varying(20),
    nomcitta character varying(50),
    nomcap character varying(15),
    nomindirizzo character varying(180),
    nomprov character varying(25),
    nomnote character varying(300),
    codident character varying(15),
    pec character varying(30)
);
 %   DROP TABLE public.j03_nomin_clienti;
       public            postgres    false    6            �            1259    16422    j03_nomin_clienti_j03_seq    SEQUENCE     �   CREATE SEQUENCE public.j03_nomin_clienti_j03_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.j03_nomin_clienti_j03_seq;
       public          postgres    false    6    201            �           0    0    j03_nomin_clienti_j03_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.j03_nomin_clienti_j03_seq OWNED BY public.j03_nomin_clienti.j03;
          public          postgres    false    202            �            1259    16424    j03_secuencia    SEQUENCE     v   CREATE SEQUENCE public.j03_secuencia
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.j03_secuencia;
       public          postgres    false    6            �            1259    16426    j03_seq    SEQUENCE     p   CREATE SEQUENCE public.j03_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
    DROP SEQUENCE public.j03_seq;
       public          postgres    false    6            �            1259    16428    j04_cartelle    TABLE     s  CREATE TABLE public.j04_cartelle (
    j04 integer NOT NULL,
    j03 character varying(300),
    cartnomold character varying(300),
    cartref character varying(20),
    cartrif character varying(20),
    cartcoord character varying(25),
    cartpag character varying(400),
    cartdescr character varying(256),
    cartdata date,
    cartnote character varying(500)
);
     DROP TABLE public.j04_cartelle;
       public            postgres    false    6            �            1259    16434    j04_cartelle_j04_seq    SEQUENCE     �   CREATE SEQUENCE public.j04_cartelle_j04_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.j04_cartelle_j04_seq;
       public          postgres    false    6    205            �           0    0    j04_cartelle_j04_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.j04_cartelle_j04_seq OWNED BY public.j04_cartelle.j04;
          public          postgres    false    206            �            1259    16436    j04_secuencia    SEQUENCE     v   CREATE SEQUENCE public.j04_secuencia
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.j04_secuencia;
       public          postgres    false    6            �            1259    16438    j2_fat_j02_seq    SEQUENCE     �   CREATE SEQUENCE public.j2_fat_j02_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.j2_fat_j02_seq;
       public          postgres    false    199    6            �           0    0    j2_fat_j02_seq    SEQUENCE OWNED BY     B   ALTER SEQUENCE public.j2_fat_j02_seq OWNED BY public.j02_fat.j02;
          public          postgres    false    208            �
           2604    16440    j01_comm j01    DEFAULT     l   ALTER TABLE ONLY public.j01_comm ALTER COLUMN j01 SET DEFAULT nextval('public.j01_comm_j01_seq'::regclass);
 ;   ALTER TABLE public.j01_comm ALTER COLUMN j01 DROP DEFAULT;
       public          postgres    false    197    196            �
           2604    16441    j02_fat j02    DEFAULT     i   ALTER TABLE ONLY public.j02_fat ALTER COLUMN j02 SET DEFAULT nextval('public.j2_fat_j02_seq'::regclass);
 :   ALTER TABLE public.j02_fat ALTER COLUMN j02 DROP DEFAULT;
       public          postgres    false    208    199            �
           2604    16442    j03_nomin_clienti j03    DEFAULT     ~   ALTER TABLE ONLY public.j03_nomin_clienti ALTER COLUMN j03 SET DEFAULT nextval('public.j03_nomin_clienti_j03_seq'::regclass);
 D   ALTER TABLE public.j03_nomin_clienti ALTER COLUMN j03 DROP DEFAULT;
       public          postgres    false    202    201            �
           2604    16443    j04_cartelle j04    DEFAULT     t   ALTER TABLE ONLY public.j04_cartelle ALTER COLUMN j04 SET DEFAULT nextval('public.j04_cartelle_j04_seq'::regclass);
 ?   ALTER TABLE public.j04_cartelle ALTER COLUMN j04 DROP DEFAULT;
       public          postgres    false    206    205            x          0    16395    j01_comm 
   TABLE DATA           �   COPY public.j01_comm (j01, j03, j04, j1impiva, j1rif_offer, j1rif_client, j1dat, j1titol, j1note, j1fat_1, j1fat_1_rif, j1fat_2, j1fat_2_rif, j1fat_3, j1fat_3_rif, j1tot_fat, sel, link_ordine, j1_avanz, j1_av_data) FROM stdin;
    public          postgres    false    196   �\       {          0    16406    j02_fat 
   TABLE DATA           +  COPY public.j02_fat (j02, j2num, j2dat, j01, j03, j04, j2preset, j2imp, j2pcnpaia, j2cnpaia, j2impiva, j2piva, j2iva, j2tot, j2note, j2_data_saldo, pag_saldo, j2_incas_1, j2_incas_2, j2_incas_3, j2_incassato, j2_da_incassare, ordid, j2_dat_inc_1, j2_dat_inc_2, j2_dat_pag_contr, previs) FROM stdin;
    public          postgres    false    199   U�       }          0    16416    j03_nomin_clienti 
   TABLE DATA           �   COPY public.j03_nomin_clienti (j03, nomin, plva, cfisc, nomcitta, nomcap, nomindirizzo, nomprov, nomnote, codident, pec) FROM stdin;
    public          postgres    false    201   06      �          0    16428    j04_cartelle 
   TABLE DATA           �   COPY public.j04_cartelle (j04, j03, cartnomold, cartref, cartrif, cartcoord, cartpag, cartdescr, cartdata, cartnote) FROM stdin;
    public          postgres    false    205   iN      �           0    0    j01_comm_j01_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.j01_comm_j01_seq', 1, false);
          public          postgres    false    197            �           0    0    j01_secuencia    SEQUENCE SET     =   SELECT pg_catalog.setval('public.j01_secuencia', 308, true);
          public          postgres    false    198            �           0    0    j02_secuencia    SEQUENCE SET     =   SELECT pg_catalog.setval('public.j02_secuencia', 366, true);
          public          postgres    false    200            �           0    0    j03_nomin_clienti_j03_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.j03_nomin_clienti_j03_seq', 1, false);
          public          postgres    false    202            �           0    0    j03_secuencia    SEQUENCE SET     =   SELECT pg_catalog.setval('public.j03_secuencia', 173, true);
          public          postgres    false    203            �           0    0    j03_seq    SEQUENCE SET     5   SELECT pg_catalog.setval('public.j03_seq', 1, true);
          public          postgres    false    204            �           0    0    j04_cartelle_j04_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.j04_cartelle_j04_seq', 1, true);
          public          postgres    false    206            �           0    0    j04_secuencia    SEQUENCE SET     >   SELECT pg_catalog.setval('public.j04_secuencia', 1586, true);
          public          postgres    false    207            �           0    0    j2_fat_j02_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.j2_fat_j02_seq', 1, false);
          public          postgres    false    208            �
           2606    16445    j01_comm j01_comm_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public.j01_comm
    ADD CONSTRAINT j01_comm_pkey PRIMARY KEY (j01);
 @   ALTER TABLE ONLY public.j01_comm DROP CONSTRAINT j01_comm_pkey;
       public            postgres    false    196            �
           2606    16447 (   j03_nomin_clienti j03_nomin_clienti_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY public.j03_nomin_clienti
    ADD CONSTRAINT j03_nomin_clienti_pkey PRIMARY KEY (j03);
 R   ALTER TABLE ONLY public.j03_nomin_clienti DROP CONSTRAINT j03_nomin_clienti_pkey;
       public            postgres    false    201            �
           2606    16449    j04_cartelle j04_cartelle_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.j04_cartelle
    ADD CONSTRAINT j04_cartelle_pkey PRIMARY KEY (j04);
 H   ALTER TABLE ONLY public.j04_cartelle DROP CONSTRAINT j04_cartelle_pkey;
       public            postgres    false    205            �
           2606    16451    j04_cartelle uk_j04 
   CONSTRAINT     M   ALTER TABLE ONLY public.j04_cartelle
    ADD CONSTRAINT uk_j04 UNIQUE (j04);
 =   ALTER TABLE ONLY public.j04_cartelle DROP CONSTRAINT uk_j04;
       public            postgres    false    205            �
           2606    16674    j03_nomin_clienti uk_nomin 
   CONSTRAINT     V   ALTER TABLE ONLY public.j03_nomin_clienti
    ADD CONSTRAINT uk_nomin UNIQUE (nomin);
 D   ALTER TABLE ONLY public.j03_nomin_clienti DROP CONSTRAINT uk_nomin;
       public            postgres    false    201            �
           2620    16454 "   j02_fat actualizar_j2_da_incassare    TRIGGER     �   CREATE TRIGGER actualizar_j2_da_incassare BEFORE INSERT OR UPDATE ON public.j02_fat FOR EACH ROW EXECUTE PROCEDURE public.calcular_j2_da_incassare();
 ;   DROP TRIGGER actualizar_j2_da_incassare ON public.j02_fat;
       public          postgres    false    213    199            �
           2620    16455    j02_fat actualizar_j2_incassato    TRIGGER     �   CREATE TRIGGER actualizar_j2_incassato BEFORE INSERT OR UPDATE ON public.j02_fat FOR EACH ROW EXECUTE PROCEDURE public.calcular_j2_incassato();
 8   DROP TRIGGER actualizar_j2_incassato ON public.j02_fat;
       public          postgres    false    214    199            �
           2620    16456    j02_fat actualizar_j2cnpaia    TRIGGER     �   CREATE TRIGGER actualizar_j2cnpaia BEFORE INSERT OR UPDATE ON public.j02_fat FOR EACH ROW EXECUTE PROCEDURE public.calcular_j2cnpaia();
 4   DROP TRIGGER actualizar_j2cnpaia ON public.j02_fat;
       public          postgres    false    215    199            �
           2620    16457    j02_fat actualizar_j2iva    TRIGGER     �   CREATE TRIGGER actualizar_j2iva BEFORE INSERT OR UPDATE ON public.j02_fat FOR EACH ROW EXECUTE PROCEDURE public.calcular_j2iva();
 1   DROP TRIGGER actualizar_j2iva ON public.j02_fat;
       public          postgres    false    216    199            �
           2620    16458    j02_fat actualizar_j2tot    TRIGGER     �   CREATE TRIGGER actualizar_j2tot BEFORE INSERT OR UPDATE ON public.j02_fat FOR EACH ROW EXECUTE PROCEDURE public.calcular_j2tot();
 1   DROP TRIGGER actualizar_j2tot ON public.j02_fat;
       public          postgres    false    217    199            �
           2620    16459    j01_comm actualizar_total    TRIGGER     �   CREATE TRIGGER actualizar_total BEFORE INSERT OR UPDATE ON public.j01_comm FOR EACH ROW EXECUTE PROCEDURE public.calcular_total();
 2   DROP TRIGGER actualizar_total ON public.j01_comm;
       public          postgres    false    218    196            �
           2620    16460    j01_comm trigger_actualizar_j01    TRIGGER        CREATE TRIGGER trigger_actualizar_j01 BEFORE INSERT ON public.j01_comm FOR EACH ROW EXECUTE PROCEDURE public.actualizar_j01();
 8   DROP TRIGGER trigger_actualizar_j01 ON public.j01_comm;
       public          postgres    false    209    196            �
           2620    16461    j02_fat trigger_actualizar_j02    TRIGGER     ~   CREATE TRIGGER trigger_actualizar_j02 BEFORE INSERT ON public.j02_fat FOR EACH ROW EXECUTE PROCEDURE public.actualizar_j02();
 7   DROP TRIGGER trigger_actualizar_j02 ON public.j02_fat;
       public          postgres    false    210    199            �
           2620    16462 (   j03_nomin_clienti trigger_actualizar_j03    TRIGGER     �   CREATE TRIGGER trigger_actualizar_j03 BEFORE INSERT ON public.j03_nomin_clienti FOR EACH ROW EXECUTE PROCEDURE public.actualizar_j03();
 A   DROP TRIGGER trigger_actualizar_j03 ON public.j03_nomin_clienti;
       public          postgres    false    201    211            �
           2620    16463 #   j04_cartelle trigger_actualizar_j04    TRIGGER     �   CREATE TRIGGER trigger_actualizar_j04 BEFORE INSERT ON public.j04_cartelle FOR EACH ROW EXECUTE PROCEDURE public.actualizar_j04();
 <   DROP TRIGGER trigger_actualizar_j04 ON public.j04_cartelle;
       public          postgres    false    205    212            �
           2606    16479    j02_fat fk_j03    FK CONSTRAINT     v   ALTER TABLE ONLY public.j02_fat
    ADD CONSTRAINT fk_j03 FOREIGN KEY (j03) REFERENCES public.j03_nomin_clienti(j03);
 8   ALTER TABLE ONLY public.j02_fat DROP CONSTRAINT fk_j03;
       public          postgres    false    199    201    2793            �
           2606    16675    j01_comm fk_j03    FK CONSTRAINT     y   ALTER TABLE ONLY public.j01_comm
    ADD CONSTRAINT fk_j03 FOREIGN KEY (j03) REFERENCES public.j03_nomin_clienti(nomin);
 9   ALTER TABLE ONLY public.j01_comm DROP CONSTRAINT fk_j03;
       public          postgres    false    201    2795    196            �
           2606    33076    j04_cartelle fk_j03    FK CONSTRAINT     }   ALTER TABLE ONLY public.j04_cartelle
    ADD CONSTRAINT fk_j03 FOREIGN KEY (j03) REFERENCES public.j03_nomin_clienti(nomin);
 =   ALTER TABLE ONLY public.j04_cartelle DROP CONSTRAINT fk_j03;
       public          postgres    false    2795    205    201            �
           2606    16484    j01_comm fk_j04    FK CONSTRAINT     r   ALTER TABLE ONLY public.j01_comm
    ADD CONSTRAINT fk_j04 FOREIGN KEY (j04) REFERENCES public.j04_cartelle(j04);
 9   ALTER TABLE ONLY public.j01_comm DROP CONSTRAINT fk_j04;
       public          postgres    false    196    2797    205            �
           2606    16489    j02_fat fk_j04    FK CONSTRAINT     q   ALTER TABLE ONLY public.j02_fat
    ADD CONSTRAINT fk_j04 FOREIGN KEY (j04) REFERENCES public.j04_cartelle(j04);
 8   ALTER TABLE ONLY public.j02_fat DROP CONSTRAINT fk_j04;
       public          postgres    false    205    199    2797            x      x��}�r�ȱ�5�)��glw�BP�񍗢(m��j��P�"!5ΐ ���
�8����±��~�}���*�$���t�t�P*�*+�����"\��z�%b�tmp�s�ra~4M���|0X�8�0�;�_�,�6���i�kL�}�>��>a��m��.`Q�v��_��6x
��q��{���;a�Fsc>L�������Sߊ�e�F˄��0}֡��a�4��e�:�����Vc`�3��:pc\˸��g��ǌ} �vQ��=;�s�,�SbG�8�w�u�)����F���儆f�!����m�c�Ƈ����<=EI�����
��؆)V�f᧰>q���p�����í	Ẇ�&L�U�����	�؀-���W�,N���������2�eY,�u�C-�m��u�O�� ��p���;V�'\�`��v�2uY���9Rgx�|�O�o�o������JR���o�������&l��}���U�f���*L�,n#�&��^���Ib�+���ǅ���A,���I.��iri����<��L��C
�`��>�d�u�R܃�����|r1��]�f�Ĝ����l��qh��;1�2�x��@U��������9���O?�`��C��4��kn��}�d:����a��Q �ږ�-Q��lx1����9������XȆo�L��7��S6_�.�op9��ŘY���i���d�(]�Js��e�>��P��2�#�dq@����b����ɢ��᷿2i��Ga�"�껜� ��q�AN�|��noG����!�c���}��\O{a���7 v��a��񍎝����w&��\g(lb�u��G<���r���{�L��3q�׽ȕ�kG�lS..�6M��=���(V�s�:��`�d1� ��ň�M���bt5���_ӫ�!��i��s	{.>��ujc�l`E���ˤ�U�-C��8|��C锧�q~Ia���0���]Zh��z=y�P�5�\L|>�/h���IZ&��ju\�Dz̄s�'��o�VJ� �+,�K�=~���B�r�@7i���%.ۦ ��>i�8��t�������x��-�/A��˩b��h>�^�߳���ϓ�t�3�2t��^�f eҸ)4:����m5�m�h�(��h�Ѿ����q{v�&�-�=��/���No(3��%��DizJ|�)+�ō��� eȄ��n�'�7�#�t��~r1Yd?��'�E�o���T�mO��)0��z�0�$._�(H��6	��ڶ�� nm��2�3[�y��B�"��`��Y�܄$�4(��و�����h6a�*���rC��N�A�,����]_�]^�7�N����G�:��5x�yp��0��5��
�ڤa�!��_�K�o�,���
�o��`�����gX5s��4��B c�A�`�e��XpP�'��@��ډ�u�/�J`���룊C#z$�Q����_'� ������M��x�;lذ�(���F*��9 <rmC��a�/`iK&����m�N��Wit��������YP�u�4������&�~~=F�m�[��z��u9�`�=*r�t(� 1$��A����6��XĆ�fY�a�؇xᆂ�(�\��9��m���"���|tz:���|f�ż^�հ�,�3��-���ٮVhr\H� �L�m�~�pԋ�����P�H�oX�m�6+0J
���#�1ks�`�T[����IT
�� ��+d��T�W#`d�� 2�"й� �u3w�/d_49�u���i�X�ŒG�<���?�A3.N'��{M8
 ������\i�������C��{��f���O �����&��?�A:'�gBذ��d��._��p���c\�_6@��I�� [6-N�"v�I������@�N EQ!5�>R�j�02rk~Wap�)䃅fQ.�Na
ʩ6`�G�d�<EaNI��e�a�tռ�i��k6HY�p�=�L �����{L�J��h�8�$>F?ܕI���@�5���U>�!QPe�h��O�`�F,\�zJ˻�y܃ X��ֲ���`I/-��G��z�2K(��B(�C�	<w�N�px���:b��	�mo�[� �Dn��),<�g3z�����f�$�؁mD�p��}�l)y���>"�,�M:����77����������pX� ��%h��CD̬� �n�~x3;������$a��/!����0�K��
'����h�f��!���.N�r�t�x���x������鸎�h��W�����	�^�o� ���nB �E���tE�f��r�a����_���>�f0L�l��-S���D8�52--�x�M_���8��ЩDA4� ��j�g�uLx�b�y�|��n��0iW$�,��y�M����<%Ֆ������u��#�P"�sˤ�~����iw����Ъ	w�gIJ��Q�[G��B�M��b�fCn� =V�ޗ�gYp���\ �AEiX��fO+�'��-�7�Q��6`�a�ʛ0A݆��>y�˱ �r��w�QH>:)�o��' +�IJ��w�������`S�KZ�#-�`Z�[k/�*(j&��a�����n��|�1�ё��^C��!�C�&��n�^#X]#8/M�p�5B~�A�O�^��]�ƅ���ĆpV�o¾�$���>zZG	�8D+������I�2��u	���v8�d<j���^�w�>���DO���]Gr*�H��+��u��"��kG֭k��3!�l���H�=�/��1Ծ�	z�_v�W?�'�p� ڧ�V�=��%k_x��7����b��˝��'��\�;#t_*7�b���.�4�,��J0�;G�~����`��������YuB�+%���Mϲ�I
n$g�+�![�;L=�:������h޳��!���P�7[y����Y�N�F����d)��*أ<����`W9e���ph��V��n�K���G��c��� 5Z�h�p��\S�H5מuY�+xf��rN1}��)���S�R���Z��|;sd�x�n�x�Ǚ%�c6�(&,���o�3��9bǝ��l+�^m���9m�����D=N?zl�E�����b1�\�no���EG��6[Tz�L�1�d�G�q�A�<�Z��=GE(�0Y/Y��>��k; \�I}��{���x@��px�D����=��NT�A��`���g��
ȟ�њ�:¤�16����8�*�jx�_�I1�+�J�>�}�
��f���uЋN����xu�h�XzUpI���C�ؐ�qr�+���>�-~��\�+��������rd���2W�e
��b�����wZ[~��h�eA r�XcOa�a�>�t�#ţY=�0O��9����w�5Q�<Q۔�jK��ׯ`� #|`��Z�K� {�]���b8��t��\�rd�d�Gp�
��l�4���@o���^��^�c;����!�E8o���Pe�RaP�����ηk��'v9=���x:�O������!.Q�Qv��~'��)�Lai�"�&�<��d5d ��0�9|C����مk����)l�?������$�S���"t;�0p��?tb�:,�2��;:`�M��A��p��?��$��������B�קr��p���x��8"xZ2S
��K�<��琻P*9��)}�n�+��:GJ��Z��&��#�Jl)`"�IVp����s���C�Ai�	�=�k� ~�8���4�qDÍ�'��~J5+di����u�	�`���&h��m��N&>�����, �t6�.⦪�`[ْ9��y�A�N�d������Wў�X|/��v�[�9�d�`�`��*�]���"��%P����f��^��3��p�~&���bn=�6	�zvD��`�T�[�TV�����!d�    �;�`MİcX�}L�,(�����!�d ���FQ/|E�n��㫄iøencn�f��^�{�ta����!�N����gu-2l;��*%�����G�2U�$�4�*����5@B�]p��2�01; �Z\�;m���*�)O�6F�`���?=D�2��~��!�m���_�{0(	%���9X~�M�C�7�����D�=T�mZ�%`,���-�\�-�� ��b�н�D�D'",}�\������M�ӳ�(��>�.����`��=ǘ�
x��� iC�9Qj��(x�1��@%%zV+B¤#�Џ���l�.�z�,��[�&z��Î\� �נ�qt' ꤿ �:�����ˊba��g�X��`�zÇ���p'�]5l�-��Q�l&�8t���3��������;3[��W���Yg[łQG
 .����h�+��7;7�5lohV2�K�5il.J�2��rGp~��ń��	3+�:���[M�Fy�+���Қ�7^���0s�/�}�Q�F�t�(QG��9��>�_��?7��&3�|P����0�Bo�o�%���;<�����A�s�Ivw��%�	4B��.�Dt��7w��k��Q�D�|�B{����i����7<"ܔ��1:��.��C��e�	b��f.ֺw��^N) �G6��.���]V	 ��������&w�$�ޥ_�4	n��-1I�ks�d�������U�L���Dr<΋��,�5܅O OFbw��n�P�-ST��d�*�7��X40\g�+��u�j������@C�bMtN�3ת�k�zBo��H�Qr�9HB� k/��"���
��q1����5�K�7�˩/4��) f��ƾ�����'1S���<.��C��Q|b6s#w!K��}��i1a�Q=����V�Q�
�D�%j�Eؕ�\��R��ŌI����qHh��i��J���ŻT���ȫ���lx����x�y���F��F��t��F��7�+��ei�.�k|���2����ekT6�m���A
�f t���t��-f�;,�Ja;,j�'`ՏNO���(O�:�P�ᅋ���9�����֭%{5��͞�
B��U{����Λ�����"Kc@�9��%@U^;`��@`ƶGwi$�m�Ji�u��0��M�!��6؈!�ԭ�w�����4��I�BN�8�����K�j:�]���U�k�5���*]��r�W��Sf=�yճL5��NۢT@��� +}��vL����<h��R�:���;�:��r�*�Kc��(��F��.��|���|��먻\�>��dY.:a0N��ʒ8�p/{
�=9�mwe�X�ѵ��Li��$�4K�X�况0O�+�!�m#L�.&i�����
4��zC6���a�g���Z4P.鈝þFYg��;A��^19#�֩5��U����A�G`sY�ܹ-�LA�<Tw�~��>���=&��Oq�
.�6��V��
�Ui�*N<2�e3�[������T�#$�!�z0T��7uM��kO������S��=\����/a�A���я\�m�ڼ-��'!,t�GJ��
�>�A扯�8"�ܦ�c��\��	��������i/�Z�3�X�����6�dD�����t�6P�A�?�Ć:����}�B
Znݴ���\�l��?�:붗\ZܛH�ř��i�Y�N���2B��,Y�?�,ɐ� ��!�0v�*B��c-�H綁ۄ][�[V���O9)����v{���2l���]rj{���k�G�ù�� ��V첋 M�;��.�*9���ְ�����n˔տ���TL�>c�[�B���?�"Ge�J�G�	��K��|�u*1l�E��}�0�j�ǣ��2��>d���2�R��ͧW���lJE�H:�?� ���n�ҭ�*`a�d��	��d��4.J���S
��u�	s��{P�L�'����f�b8���W"9�<�N ��5�r{1�u�@n��tI�O�1lp��;�3�4�(g�*\~	&�ٿ�6)�p��e��:O�ɽ)�[
Bm���:kh���	 ᡟC�[�1-�4>��6z-��M���_�1�^9�|x|��ѠaG�M�&�r[�n�D�?2KXa�"~�x	�WFL���o2=Uaw��� �K�86�ʵ�͕�j����1�3Ӌ"�ed�I����J�`x�9��x�j���`-��u��a��>���c�uD�J9���ucR�/�G�4����q��p
<PP�(�IXJd��=pC�ʲ�mcuw[p���U���9@:5Fs{6�_M��
�xߓآ�@E�hU`���r9l��
I�^�O�F^��}�U�r�
G���\�R_�LX%���g�� d��6�U��3�b�[�3q�[�dvٽ{�W�����ڭ9�� �uv����l�6������{���Z?$ȳ�_��r�f,ow�eC��^lW��\�m���)�gߏҾ���i7H9*�<��v	���V�c�e�X ��J��Yϡ��jV��pŀ5��>.�W��R�y�ވr��I�/�4�Z,�<i(�O`��j�ĸ��Q�A��X �|����/�S�Au�e��e������� ɮȠ\V�I.gT3^��%f;�H��6��K��eO���F�¸��u�ϽjW���PgL��2k��i,��@��)��<�	�+��d��g����v7�RH7;�0Nyǣ,��1y��fF�8J����
D�1�)oT甦�2\�kM'es`�K]�Rd���,\?RK�Z~b
�����?,u��(淽�}�>T��Q`���mѤc��� ��$M>�=��J����;�
�skG]Q`�ã91n�hkj�eq��H]��h9�x���)�J,�X��y�k^����-ò��v�T��&iU&�T�։�_�Ѵ�΍*62^��pӕ����H>�e*����1_p��Vk���Pm��)�\Uc��
qmJl`z��7���լ�Ǣ����E���d���T�,��-��"����]\sB%S�GP�����j��\��9��C�u�,�t "�jn�A ��6XG�7�=�8D�A�e�q0��G�d7�21��u�-��q:��l� ��S�b�桫oM}`i�'ӫQ1�c����	_�/LB�帟�x�f�XS8�S�s�4���f�L�E���٪>�O��~�t_�A��(�Ή��vfl��QE�r�������B�IiuZ)r����w����Ý}!�tp#ݮl�c�2m>�Z���Pni/��,��B��1���֏�لOx�Ǹ̰ٿ<�ko]����~����&��Y�ǒ�&� 6�E�/n,��޼X|k�>P����eTQ\�^�6���A��[�X�ܵ\ T�Į2R��q�Sm8#u�'$f�h"���,�3�^�*(�
I�M�۩��i�^W���"��ƅ�<V�݃���a�{%=�0 \��yAf��(r�_J��������RSX
��^���7M��d>�g\uR)�e{|�y#+��vAa,A�X/�A��
��P�m)nP���v��&�c_U��N�%�&L��c.�k06�s��y8Q�+͵j���z�yy���J����x�EnQ��F[ڻ�
��U��;�R�`ہi*$�D��V?���3H5��&z �qϤ"�5��_'Nd����ƭ��XC�v��k|�ç�-D�<X���}�==����+����{	ww1���/w���PI&�T���%=^[8]�����*�U{�"k�� ����������oF�#u�Mד���1'�����c#9?�z4�p��aD�J�g��O��5�(�I_��� ;Hp����ֆxl�@j�w�`�Mx�h]�n�:E{��b�����ZLny)w����Rig��G5�9tU�����g���V��5��tKl��.'�>S}Ŀ~E��&H��m��z���B9��E]��9Zq�b�t!������    �ήz����n��xO_W���Y�+����$w�����\��$�����,�$�(��U�.�|2�4.k��pXl�z T��J�b�1�����/Iʶ�P=���%�o��x��R���i^a+�}���f�@��풍o�ک �����mJ�a�я稈�[���/[���D .T^��4�|9�@
�<�S#@�=��t���C�	�=�#t�����b��"�������7���b
b~vu�
N��X�5jI�B��\J���96Um1�ԓ�[�(<�a��s3���82�5�W�8 !g��r��9#P�����eq)�#"�8:<���K��
�֠&�S+�-�����7`�'T�=b�P����61������ov�wgӛ2�M�as�F,�0 f��?߫d���T�x��k̽I7��FKo_"ۿ�X�a�
�? aY+fɼ��/cpa�1�/:�A���U2���F���BkWa�n��^��b�����l��`�u��u)q
&�J˄c20� I�~�[��Z5�1����*]�bbt�*�I(�)KH��ʹ<�%V�o���
G�e���+]scS�k��	�մS��b �)6��,Z1JͫD��8��U��
�[!^ֈw�I$H�v��[�`�Q��S4bL�X���������rL 0�R��U�t"�:
����V���Qbv���|;���~��3A�y}k~k6"�
�z��^�B`�<KT����HL��\MY/+u�P��<�o?j5��������G ���"ޠc�<�|`��0�_��ws���Y�<������d �#J���|'�fn���0j���N8�`�zvUށNt|�D�H�!r�3V��|��x�6./��Z_�v7.pզ�(�Dc6EHOn��Ǭk�¼3�0�l�	�2��l����9��MA��Һ�!��'(��m�\�l��@iR-�S����kg��'=\b)�sĲ��V$$���.�%<�����"�XYz�uO�t���ȢuB�'DD��R�j`Nq�$�m�=�.��y��?��hي�������W�l�1ֈ��w�㷿e��>�ҷ��<��F����K�GT����A����n�� Rv�RFY��1lӝJ)M��u��Է �V�R>ƪ�7 ��Ҥ~3` ��,-�ew__vJS�\��>Z��r����jr�R�}�z�<[�K$#ر�C��0�m�xG��8�'�d���en����wK1D>C��YQ*��x�T׸�M�഍.O�F�;㟣�&T��oi����([�ݢ����t#'ʨ�.W�j#Ev���������(G�U��	�,��ն5z(�	&��v��N�K5�����8%IcD��g�2�jN(����{ӷ8�޿��=�%�e�1��`�|!T} jsA���	�]�q�}�������?Y9���<W��d��}\�@0�J������'�"�9]]�ߏo��&�����5���߫��G�,f�7��7+P�n�2�=;��f�$B��RS�D�a$�~��&;�u�Nnf窙��
L2��&OF!0�Ue�6[U@s� ���0�ݾ)�@r���V�t&+T�y6;��4�y�TpJqp<�KU�u�9�!��}`��)&�����wǨj�H������:Vt��<�1֪�HB��KV�+�}�i�P�B�&u:�96˭�ב�E��i=�`�'I�h�LtP���_�臃�F#kk��|2-;<�!n�u�*�풲D�e�P�4�;��yj�3��c� eC9�~�<�R �����+���
��]DH�{\le�5�9�JZ�p��1O,�z4E���#R�fp�!�}��%�"AZ�-�܆��lỹ.�3�|�T�G�ß&��>�@��Բln��
Q�F�n��	 �h�L_g �{۬?����G�ǜ����!��c��s��"`����,o�g���(%P��R�[��ax��4|i��<L�2`r�T��+*� ���[�]f/�-m�-���2�L����&��l�Y,5�ޒJl��c�7����2-vZ�VF)�]�Jw~�8B��l��cK��yʦ���48�����4��X),�r��RY�������4�D�^9�G��%r�U/ݤ��yT��
���Sl'-�th��p˲U�}�������Vn�����C���)7l�_��T��:�z�)ؠ I*+M�N�Yls��y��: >�*�f�ٽTk߇�h>eo��6GA��ı�7F9kJ�3��B�� �A���	t�(�"^�I�SJ5T�}և}�,���I�#E�+*��w�-�
b�Ԝ����t�)�B��K)�L�P�����n�W��d�t ���L�!��q.�5y`G��Z�}jE��X+��k}pJ�:z��h���{Y�'�yy��K@ �XK����ϙ�>�� �n�h���1�8����60F:�TtI�k�c�$����p�&iJw�`��D����6����b$���Ɋ&�.�^��:�dY�M�S�'�B�}y:~�λ��Yf�!(�Yn 	P����]Lی&K{�b�j�p��M�U�#Ԝ�X��2���3��+��%K �\��yu�0�D��@>+nN�S�y1�VŭI�F=���ک/%b�nd.��w�KdY�횛���ma�ӱiSx�6��E���3&�Rl@T|������y��{`˸c3� � "�;���T��T���˚K�U�$���ܫ'8���h�^W.������ߘ����ٱ�a����Ç���Ȯt�3�����y�V�,sD�H�oKw�t9k�����"�|��i$�;|@�T
���H�}��^~ m�T)ڠ�U���/��XӸ.����D]��uDꬎ�:U���%F���Įp�|�h3���y�%��;�,�chn\&9`x��Y���,4e�Eg�9�KJV`iW2��8�F_��F�U�����_ߎ��������([���q[�]a$mA�Vvu�%�M	U3�^�-�m�M��S�M�~���ׄ���<;JȖt�t��V��=��P_AYp��w��ˤ+�v�{2��1m��b� &��=,�R���)���(R����t�n�O- s�ԬD�U�����T�UĽ~��tz�2��U^6P��m�A�[L$O�$)1n��Ex�a"Sxۻ��'��nW���L�:<��}\����Aľ��EuK޳7��h�a��ہ�i����<y�������=.�H�b&:��n0+�D@Lg�fM�@8E�\��0Xq����51��t�y��oe��ͭ�c�,Ʊ<�T����.��+�/� u�I�&�"ԥ>I�Д5��4,[zv.F9r��p��t��ϣ��@�g0�	-�O���{����k�R�R_���^3W̒��s���t�ծ�"�ԕ�N�������D�-D� �<�6=_I?Wfb/B,.���~�dWr��~��l߾q�`���aF����1�9�<�V>��<FS�I��y 6ؼWϻ��j����t�J�L�t1��O����1s�X9� �۬�|��̧����SE,><'������?'���9
0(0Pׅ�#���2��я:>5#M���2_N�<`~�7��oѹ$fs�����U�ɂ�y�v�F����� -���*}��)��k���;�cq�<�U�*���V�OTvgM����d�|���W��F�C�;o��R��u+���m�x���|KYt������z����}S69�6�%c�Y+t}w�D6A��O)��R�3���HdZ���Vxuv2�B��73
�2v�
�s �#4@Nm��??�>*�ZXP���.W��̫p���8�ɃFD~�Q�Y0R�Q:0@�O��U���6^��D�����j[��a���]'��3����
�=F��xF�1����]�|L�ATKw왑@�gCϣ��}W��Tћ�e�dl=�?�BA)-��L�A���[S���aZoH�h
NV	{�@��9��?�ԉՃ�*��B�ֆ�?	�`&�@^_nq)u�G�,Og�� 8  P>�ri�L4��0����#J����"�3�(X�5��>�>&�a(Y]�N�M?���	�$�<.܅��|B��G��vMA�e��GU
���y�����_)`�o;j��ּ�-�C��@�ZT�i�q6b�  �f��{d_.0�m�e_#5~�ZE�8�/&��#��+��1i�@�`�8C����N/�B�(�hR1f��¥����Y��������n�^��Ԕ�]����������t�( �l�JJ}qEa~
WꞺhsm�[��{Z��i�e��������y\��<�8%)'Gۆ���ڇ�/ڮ��U��y�.��l4�^/~4m�]񛰌y�x`��[���&��oQ��s4!��QQh�*x��{���>J���}y��������v�٠�S�.\���T//��N��LyD�ܫK����}�B6oϒn��\9Q�� }t��(O�t~�G���vI��"�?��R����������嫲�<�S=J�.��M��%��� g@�ضib��1�i����ɡ_�5�as�DX��Ԟ �>
�����w��u[���.=��nA]��B��ªc���Щ�OE'�6��l��"ݖ�� �U�L1��3�'�9{ȝy�&O��C����R�,�Q6}t,M5�!5��ʺ<Fc�V�y\ӆoԣ����/��z�{~E��hS�`ivu�~9��rm,<؀i�Eo��:Ѣv�����6ύ��	�󣊷�,�(�ܼy��U
}�<n�!��`�|�D�o�F�ޘfc�E}��U���Y~�oRd��eO��hH�L.�XNʏ{�rV�j[����(B���y*�R~�*1an�R�|~��Ju��i���)� �����]�q@����d���zL��U}̒�Q�b��C�C�m�R�	�9!���)����[	���LèK�I�Xbj��C��U�t������:4�&������;�,�����:[�q��jGt�%�K�t1;M�x�i0*�v�ٿ���ub_[�����CM�-�ۗ�m����p����/R�j�j��)ރ�����~��w��?k�E�      {      x���rYr6x���h�*R��{T�l&	�h��5 ���`&d��+3�j�����ү��lnu�˙[��̓���= A��*5S�"2c��Ǐ/���>:��#�G�?�<$��������٘��]\���/���jV�w�W�Ͳ�����36/��*f%+W�e�^�lQ�f_�Ŧ�U��o�I�Z�IqW�j�f�Dn}[���)m=*��bQ�i��V��c�o��1[-g��},6s�����w�v�N�ww3�0��դd�c�t柤���������?�s�{~4���zIdo�ݛn��b]˗�x8X�;����������ñ�cx������ɢ��\2x�e	/��������U-o��ݒ��5��j��k��s[,��r��X�Vռ�K|�+<�X�`�e�Z����v�8����tYO����~1�����a��u5����Ő�[���)���Uߔ8�0֛�$aVa�n�٦�yW�பu=dwp/łnmY��w%�����ǀ���!�S�����X��M502�f�+lˬmA0��t���q���A���a8`��g��$1��tr5xa�^��E�OO�Q.犯+9�SO����\���d)g���X��lc�^�A��F+6dlR/V�Y���`��S�~Z���h��rZ-
1��;�./fҴZ��}���]�����q`��rE� �vu].�Y�c���77U�%7��Tr��R���n���P�T��X�+����������7�	|���jqs]�ށ��.A,�t;�����i����k���ł�Z��Y8�O���΋�_6�
ϻ�XG/y�H)1����8xx�cט����_^�V�^%C8NKW3�{��JW�g�;�R�EHL����<�q+���ǵd<��<���\�6	x[à!��@
n���H�;FH@D��
�}������r��6$Y�4�lR�p��$��B,Q������7���E"W�.*�B������<z5�a,o�����������.IH����s0���pGb��p�W�/��]����_�^��([�4�����T�L��*��b1-�j@x��E��&k��+�yoAA���o�{���1ǫ:�0恖���7���˃l�Db{��h�oRd�N7%��]ULP���ܗJ�U3�/�O��^�im�-������%Ĵ"q���=���B-ޜ�,�� ����a����h!��*oAp�zT�#���^�T����ry/ԙ#�;x�H'(��ǋ_J��K�<N#i@�J�glJ���Ӭ����ӓ��/.L ���?K��^��;sZ�Ž���@�a�0PZ6�!�y0���o�'�
&�_�	I��Bh_yK�lV�$�+
3���wOKcvY	�#�� 2қ�LE?����r��Ww�t��gЩ��r�ݯ67 �x�R�����
JH炖�к��P�ėh��Q/�9
k�\(ܳLƃW�;' ����o����ٖt�����\\���"��t0�nf��T�����3���z�*���D����E�)��|܁1Z�{Grq��q0
�l!����(!�{�z���� ź��ꗋ�=6�Hy���E����pM7�y�S�GX`��m�`��A�J��oy>�oL�8i�5Qhf\��/���!����M�ľ33�Aܘ1�C\̝�lP6s�H��������|�$Fh_.&��T���W09A@�Lʩ���-��<%�t2UZ���ȶA?tWZ�h�(|�Y%4�Bd=�k��� �g���C�%ߒ ��{�����Ж�Ӟ{gޡ���-��\)c㬼�\]�H'>�w��<�|�Tj�)�%m%|�[z��(;F�y��n�����$F�{�����t�d���(�a�-���E��)D�k��m1l+�0p�6$r��_{}�w���*�p'd�걧�,�)~�� �j����d}�<k{�0"S��SX~�F��&Q�٬�_�/u`��v��i���:݁i���Z�Fj��Q�r:W�O�.���e[X�e��~���s?<��Yyx��kPw����c���ŧ�F���dcnR�:�{��G�0���k�W�.)�����p�{������&���?�O���Cia`pLy�5���}��e����X�.F���A�Z�D\�2�5�`�*�@������`��V��V(��B�)���
���_�t�0���Έ�s	��N��<oO� r��t��I%����w��>��
7��m@������Ť֊Ύ����qg��Xk��T.�kp�ᯭ@-�z2ܔ���@���m�\"]�f�d"m�)좴�Z�*:/�9yt7�5>3���9���r]����3�8|b���|�k9���p��牏~-��(+lz���¸���0�����mcq.���%*N�ٔ�ٔ��\/QA68U����W2qa"݁ʕ^�S/ Z+��CM�yjk:��"*������ʇA(��F��s�=���x�Po+��}U�����9���������*���#?�����hh��w�^λ\$vx��(�yT��zVS��*h)�թ�ա�����J�ҹ��?,�)���8u�+��d|m$B����#w���~�"���h������}�q2�F2k�V����f��8g/��*)���J�EA8�3k��0�\����{������:��e.��/1����zIƀCJ��X,���l�	~�����}��K1�d������F(,�[i
4�t�L/<0��iyK<���'�iZ����q���'��-���h#v�[æl�a-V(#vXͯ`9���7�4�`�c���A�+=�(�<^&��=΃����@7ˑ��-�����S/M:<ۘ�hG��;\*��ɴ.�Ἑ���L����o��iu[�e1��M$^Wp�?� ��ӗO����Z���XS ;�|�R��j���mv�RK�G��p�G�6�x�]M�B#o�$Ǥ}������%?��kX`-br/k�`R����elk�p����А�G�ͳ�>��㯥n��'E�rK�T��X���)f�X�W�dܕ�@5�Pf�2W���<n|��g])oqhe'Ef��
e�NY�z�������p7����ڹX*��o*�ev�B��ճ�X�ɔ��wUc0��h9�GA;Z�i���pK֨S+�s�壮��XҤ�%r6/��d��}o�s�����Ã����{�v����'���kJ>�� �4Β�')�9Q�g���|������p���#J�d~�'Xk��� ��|�������
���D�:��ԴX'��|�!��g��b&���w}k��Țxauڐ	x�tH����p����������@�����οԃj�c�́A, DOs�P+��T� FA�x�^m��������ގw�}������������hCN�)q�������\���`c��
4D�L���W_hR�TM�/&�;�>�/�r�&pa�|io���"��,������q�a��hiHn�R��JLqF��:1���6��R��;0i1O"�Z�����%,d���̻�m�B�z`�b���
|�޽Pg5��uMѶ����(�,dH +��PN��E;�]���͆��!Y-&ޚ[��"wjA�F��D1+�����j���Ao�y���Q�-�r^��>Ҫ�o�*�(�U��5��(vX�@H�eg$�Oc��֞�.q��+bALrz��!�J/X�i�h-��C��� ��%y�0d���<j�}y�Z�&����Y����x�(���&�+7x�dDoб[�7�r�-˛j.��"�
I3�4b�ŃF��s�( Ϋw"5yc9���	�u� �(S�R.��g�w��`��>���Z31�L��˅@٨�G)co<�GO�+���;���ș��X�`ܜ�cz�h�V���%�����s�?�	�PR�����{W,oJP��g�i�n��>���0l8�� �70)    ��o8F66n������1,���uP�LIjcԑ��_�<.[�<3VX"��b*׊p���t��t�# ��XnR��Di� ��ʌN/-�s�'����s�yqd�w�#��h�>��R��{�aM:e��&���ic�3�>Df���B�# G`�����J�5���-�`�mT�0b`;㸇����`¢��]Z��oc��ʞ�Â�iS��K!-�;�T���7�<,
�[Znw�0$��'�t��A7������57�`��W���S�x:7Y[.[�8�M�#
A$5�3-�_2]��o�t� ,���b_FŊ0�Q*�/�>G��_�F1aR<H$��/��L��� ��|%�zv'l�i5��� d�Y<��!�3���X�1$�0�T)jVNN憬�,zi���FǼ]9i>e�[�Ҩ�@7`��K������,c<!o�c4���IA����λ����Oa_�	@2�Ob\���ů���oi�b���egaj"��l��2��F��ꔽ��7?A�\�+`!h�_�����~�.�7���J�6����0g`�ְJ�hZa�ϭͰ��c�l�m75��ߑc�؝����M���Lwxk�&A��E6��v�P� �S<ȶr�ു4`:��3	Hu%~O���ɩ:*~b�Ï���2�1���C���Q{��8�c�n�i�9즫y>�g���ط�pw,Qo��Z��3�w����Q6i�
�ɭJ�ϰ\�m�S�pIS̟�����6�
�>�#�l�X�?~{��m�_b�w�!k�il���Ҭ�\�R�؞�]D��/t/1�:rϢ_��*�UzR�W[1i!υ|�@O&��J�/YJ�c-��C��.&������J1�� ��y�\�u=��H���D�6�I��\�M�/����QZq��L�����*�rYN�K}�
K��S�%웆���+g?���)����=�0;U�{���}!fl�,�����	�t����yf����H
7[�t[��
R�b�[�o���S��:X]�,?��zѫǍ����e��	���d�?��EC	��܊Л%�Q�q�5���m�|�d$�J�>%ϵ�O@�;�ڞ�w�ȟ�S%y)M�����D��6�~$Wfx�'�1y���]W��b�f���c����)�|�ÍP��T�彽�9����R����֑[:{��r�F�]W�&���)!/ԡ����Ŕ�K��3	B����8k��'a׳�^�3Ί+�*0_�ܠp	�C*�DN��`�u ;�8�����6CwF�7�o��?of?	��NcS>�N��Y|P�w�DNl~�M[�!��P�t���@�U��S#�a���b�嬜�Z6a�L��Q%rȟ���Ў�
b�5�g��o.�lg���#������ĩa%�����V�vR����իy���;�yb��q
��;(��v���K>I�y#K��u�I���`YU���#2ZM���7�Yh���[)VB�5&���Ʊ��~4�sy��������M$�WX�N%������8x��$����U����f����T ���	V��kt��
C����y9���k��÷��r	�>����f緅�e�o*���#X�A'��rv4���Ԃ�g��8f��Y����?�6��9���n����]��r��1��OG��;f���vi��%$
�r~�w8d��>�~E���cNU�dV�����ʻGI`q��[r��N�
ݮӳaC�'���O'm��s?q�rQTt������Y1���� �7���� SŜ�ֺv��6'6�x��a;DY2��[��`ȣ��m�d�� ����n<HL�ྙ��h�N;��:!4-�\[e@o�����D�F{�n�ew��L���bR/E(�F����Pmݚ��⿿a0�'�͂
V�m�����J`<�Sר��B�-hV�N�)е\�pM- �v~U�N�;@w�B����T����yM��$�t�e��`R�P��&5�/�qt�BbA��Ă�>��$�/�"e�H�+{%l�D���3�w�7�w� t��y� ub�ж��f����̶!�!�U���d��M��������Kb,�i�HP%.
�ZȢ܌h�rA���fE��(�̪�"A�A��L�a��8{)��r�_l���$r��5��	��,�� �v�[�w�M���w�;�YE�"?���D(t���W����4�����Fj9��k
��-Ś�u�[��=
2j���̂����N�e����Uq��g����p�IF ��hWRv)�;I���$,I�4����ⱕ� ��}����1C�����</d�?{�x����c�А�n�#��(�����u�j��07�z �Y�,K��!��Wݷt�(�t<�q�ގ5D��I�����v뉈���j3�����+����z�ɛ������L�V�%��Q��xvU7t��\��Lz<M)� _/k�?/ČL�QMA!�_�$*xb�8�'`���3���*��:����Փ������ wi*!��T�S���_��^���)P���ԅBpʥ�,�/M
]E��!���%��1���0���D��^*V9扑O�'�`�R����c����(�Vy�E�8Ǵ��b��-�X�!"�*��9M�����J<!���T��X
�T��b���n"�����EF�,�I�g&�>����6�5H�9�<�:�s��G�Dj�$rk��t_�P:_��A�K�tf��Jfp��U�1�2+|y�NX�jG�j��͢�G���������ͻ R0q����z7V�ss�����~WB/Yd�n�,g��K��W׈��*�L��DLZ��UM�!��s��a�J�۪��4�ł���M�"�k����A�
\�\��$�������k	vk9T2ocG�+�`����l�\��L�$\�j`_k������>L�����Gӻq�Q�����
��1��p�B�e����t�4�ۼ���n;�8{�s��lO�e	J;�T�l�u�=�U9��t!L�ZX#b�PJ�g��(2 	��:���.�Q��IV��y#�Z�8��$4���a�14x��<�dl�-Ů���(k�>{=+���m��8xn�Ah!�Ί�|Wb��mg�����[�����EX&ɾ�y!
֩D�L��9g��������P��L]\���#�,~b��O�k�+%n\�Si"�x|���N�fAA���)k���#U	&�y������F�I�溰���׍�ܳ2��H����I�F���d�
�J���>x6�	�f���5��n�ƊP˺�F�f�����q�������[�����F@wdr���>u�%��#�����?/����n�$峆he޷��(n��y0ٚ��*�&�8��'���dA�޶�[�a�)a6I��R�-w�<,��������o�KSŊri	�ܐ���7H����'��Y=/��Wˌ4�W"��]�{U����C�6h!�M֪Է.�Wҡ����>��-���@N�tM"F�#��i�U�Q��9�Z})��w�_���b��|���$˚�#MQWJ��A�0�&)�����ӗ0�y&�/C��� ���D�$�rV�A)��� s�V�9J�R�QpO�9EX��2Ae��X�d���d�e�?U���d3؈!�mb�I��Ť��5��$���2#"LU�cҰӃ�q��X�ˊ��]Ef��ޭ[�8���ta�"x(u%(?��i:V�p�p���|?� d�S$���u!q��ƶv:�;le��4�i�!Z����=��^���HL��eH���葺�/G̗5��ی<��B�w���m��&�$�u,�z⩎6�x*P�8.cTKlmnh����b��>&��g��Ėp67�rJi$۳9-�_. Kn3n��i%c�c�����.{I���=�("�1G���~~�C1�J��c�#t_Y���ON�!:���E��>����ɍ�-\�    ���-S0��ߔ��Y��S�Bȭ�]ȁ !]1�@�.n��m���e�m^-�@yEp�D*�v%>P4�	���E����C����O)un��/�~l-tt�6�G��}��n���@� G�T�j60j6���ڣ��2�"�H�+1>EI���E[h�;ZT=��q	?���5��V|6e�GGj"&�:�$�{1u�����W��I��\��.�H�<�X�^����.w����h*����ˋ����J�Vet̀�����T�|]^]-qQ�U�r���V��)z2k���:X��	q���]=g�_�+�)T�5As�����u�&B͟~5�o�P����ּ�� -����z��P�J��!�r����O���`��軜u=���Z�+nsA}�\^��c]��vb��A�����GE�����v���An��C\&���
[1!|�A��*ˇw+I6�X���B�`Z��x�o�� â>���J�k�x�[�����Xk-�� q�#k�!�S�V�.XC1�)/�ԬSZ�UϜ1�۞�D��E����]����c��j9�2Tg6�LZ��Rߪ�\�����`�-�a��uL���ڮG5�E2�)�,�|�/��	���/}9D��<��%��T.�����a��n����?[��Dp�n�E3B17d�	�$P6����9Q|햫y�f��zs+�j��w|`�%XR@˂�ǝ�R�gL��D �DG�¾�o�y��ob:�q5y'�:�� �E�x�Ϳ�f���\� �	�e�J�"��#*�m�N"=��v��� ���j)�PKqj)N�6l)C�R�H�R�3"�����.h����D
��rƄ*��蒆���p�{���-�eǱ�u��t���^������Qm�%��mu].vKDK�R��Z�����4~�J�@ V}���fl�K܍�V�����bnɦ���FG7�&^��}��$�A��t�i�Y;�M�`�{�Єjh��SM�C��	�{�&�͊����x���{��L*k��Ԃ�eĔƼ�(��u�]�\�x��(�w��+�,u�Y�!��.����4"+�Ej�M��`j�� b�2@ǳ6O�ilǖ��9����q^���0/��,���_�
���%�*DuLH>����@@�} ��k�$�%i�����'�9h����p|Ę�Ou�ZֹuS��H1�Z����I���T^=P>����_���-��U)Kv�cp��1WƜjǝ���Nj�O��#�/TY�'n�f[|԰�L��9k3Y�M��f�x֚��N�ؐj����ř
�mV�&�H�b!���fj`���VQ��d�/�/�\�nB�dWL�$u���]=}�BOhx-��I�~���R�����8�\����.;~s�j�d���=�ü	�D��K���!���Qc��ς��<D��`������TT�^���n�e����*�!}X @E�F 2- A��oU FR���l�0���W+���xa��~��}�d��صu�t��t|�����>��58��j�������SҸ�����+�E��)"}Z����{b�*�~�x���.FX)�R�9Jؿ$M��1Jt|���G3��ǞxV�E1�rXqTSԌ��.>~�ԑb�.�ך ��z�֠��Kl�"���Af_�1r�E�s|lu!|������!���P�xF}(��ǵ,�P=xtY��?�dk��V�h٨�&�ê	.]4�Ol`zh���%��]���lY���DJD^l@��i�N_t*j�;@<�1�>O"��~�c�j��Ze���U1�[=�$�[����bZ�o+i��ueB��u����6��w�@��ҧ�Dճ��\	|��7������Ee�U�̔�/��)�2T�JTF�DT�+umܒ(*�Ks�J�k3f�Oqv�'�e��|�r6V��Xi*Jԓ�Ê,���җ�җ��r[_��$���9nX7��'O�/#0�23ɸ�dI88=9�#�����ś�1;?��89=`�������K��<LK���H�Q{ۚ����J��SE��������zI�@�=v�m��b��q����qAfY��m Q��g��c����g��8�}Ά����2�8fy�p�<���O��QI8�����Sr��X �9��2�(�tT�5oT�
r?ŵ*sy�t�QW���D +!���F���׸*OJ�x�YN�+�2���f��Q��)��@>IA� QY(��?4�\h��ز6��t��\�>�р��zI?�� �V���">�2�����$3�����QL��y�ݣpn{= #zơ��\��\��r�tP���QoJѫ��;�G��P!X���1������t�V۵v$�����_�Q���)3�}A�6f2�� �ʠ9pol����8��R{	ZQ�7�*E��f*��1M�z|:yv�2C#�����]E$?��J"$�-��5=�����Ŝ9H����{٠�K!l�����T���S��%&�g_U������$#�S�����݂��s��H� vߢ��{�v�e�+|�2��\{L����7C������==�2L_�6��CMl�������Q�g'1�[Y��u�ZĜ�V�ԩ�$doV��2��:�(�u�](��(�B�g�׶�k���
`alE�ntP�*XM�w(+�ei�W�����5~%�����;:�l���䠍����:V��wݛ�L��]sZ-WkYy��W�f��'�1<�Y
��.M���-�_�T�/S��V�����L�����?r��A��Z�辻��d$�o���}PD[Pmi>���xx����:�3�_ ޷  TEV2���x�Օ*I��wU�'�P�D�!��Z��h�l��*�s$�@pl*b����p�#͟��,�-��B����x�ڰ�ЅJ�ӿ�����~��DV�~[���{�}��B΀^b)9r����X�eM���_7k�V����������.p��ZM*@d�J�mm/�A���~�
$%�����0vUtS��jS�D.�I�-��Ǡ�(K1��|��K�&�Nx'+�m��c}���	��>�b�T�c`��lK���jMh�#l����X�A/�b�_��O�|�q�ދ��Ejq�Y���^�D�n�KS�4W7H�{�a�����h
���&d&!7� ��򣆬�%nl����^��/
�#.m(T n��\��M�zi�5��%�ļ�	nM|�]sB���K�o$�U�jDv��`��t�)�V�|fN�w$Ɣ��e���	��|UO&e��o�@�����H��[5��D�pNF�䔣|����q�89eE���1[Z�0��o�$�g�L���Զ1�YpGc;���sD��
���'����W秂��(P-RϘ��f;6�[l'�n�4�=P���W�&JYs��扗��i��zj����z�ei8�E@0��,�Ã��W4a�O�(�`���*F�#�HwB�9���?�M��Q&)G�(Sr�r��Qk�A�ӤRh(f�-6b
>^h�J$��]ߴ�p�vv�Ck��Nn�E���`�L�dic�7��ĨW���g�� nA�=����G��3_�BZ�:_�P0Al��h{��o�l��+�)Y9{F~�6s���Y�A��6Eo�A��ʹѵ �T��jCCqf����{N� R��	�����pl�������{ܧE�Ť9h��ϝ:�͚6.��R�\N�O��.���4���+���SiZ��k��I6&�#N~&2�������m�3ԮϻFB��*��E�h�������n��C�x]3���iit�nK�.mH>��н�Aȋ���L���yj���H��#�	���L~�!J�0Ff���Z������Nޜ�񛋓��W�{��ܻ�����h�JF��'R|8r�Ii��4��Bq_7H	�N_��Gd��n� #l��%�2�"pM�خ��Xff�=�,����?RJ��٭[����t��ҕ���X�    ��E/��H��X����)�n7��Wr�:�(V�͕�m���,��)c͵�DY�����V�3��Mx������h�J����~��~�J�271:�N�C�P�Y(��t۴�F�
`o{�[�(���s0�^#�A�$��*&v�U`�L�[]ǧ5����9�~_�V4$<�`��Ӑ�Tҟ���P��8��{���"�C���=��,9�"G��o�jHk���R�b-��fG;A�ty�[Ym�`V5sl篈/�Naa��_63U��tM-�0
�ڐ�+b
�ͯ*ip6�1�_��R��*�8��FwWku�"�1���8@֦,�Qc�b��m���J��������q\ʣ��A�X���xlPV"u"}L�kZ.�y%-'K��a��!Jj��O��8z+�#>6��+�iJ	x�	]�	�Q��q���� �vG�4����m*�<�L�(�^3�m���x�'� �&#M�Iz���UrUN�CYi ��E�9A�2�
8�`��⻻����E_���óWU}[�~���⁄�&�S��q鲞!b�}?g\���խ�ʤMW�����6�|6g�`I֓Q��n�Q����w��Ŏ>"�<"����`qh�'u3ZϤۄ��J5z�9m
��֤6ts
�e����^�6;�R�"d�<�o�$d��&P7���Jl�Jw��<D_�Hb��i/�AQ"����BV��ɞQv�g������]�=��+��w�x��r�G,��]��"M7����\b/1�D��F��.��(��5+r��<�T/ƟT/��Om}�eB�d=��~�V��ڢ�.��0�b��y���.~C"�gv���T��(�oMw�S��۵ k�E�| jY�WG:����"Y�:?U��-�(����[i^p)�4/Dk�4��&?��3���UӍ�+E�B.�\:��;�Eu�=�8)q[�����U-u�ʚ��0mB��B�d\��.� LZ�V�W�j�����:�)[��n�st�v��o:��s�f����s�i%����cI��D�|d��n&�ċ"�n'�u�N⥭9�:Ғy<���ގ���9���̱Ld�����Qn�O��dnW�w�u.�יVx�!�	��$�� ȏ���z&��])rpw�-Z�	�Q�5VV��%+/�,�9�,a���!�	��ܞ�<u��x�$����U1쨐!+a��	3�)��1������$l062A�����َ]�x��ג�'JA��#��چO�]ov�b�`��
D�(��u'���^����,�T��C�z,O�����E{-� �3Gb�{g��l:R�9AXۈA�h��(g�0�wT=eG�ٛ��j�8qf��|9��_FLH�d��6Њi�kY������)�qf�R2r��j�h���������������*	"�t�@���˾�"K�0�L<@���o�.�k�U�R���F�'�,��{"��!S�����f�«_.B�]���!�Գ.�:�MJ�߮�g���9Gf�8	2��='��z��Ǥ��\.��1H��S�J0�_ӫ `���e�e�û�@9� �NS����K3�~�r�L�Ŋ��V����#k�x�E�S^�m����T��^�b�Q~[�yB�0J&�����?!��G0/����B���9�  u�w����{���������08;8<�{{�.NNO��ƯvN���9;=��ƇG{g����;=��qz��݉�Y0���'�g'��b�
�x�w|q�^�ώ�;{o.���z�~?8>�5�IfA�ۑ	���H{��0S�����j�w	��6��9���!H%B�%�fA�t��M�g�[��d��Uj\�'Y)�{5��6D�gB���q�Q!��5Y��+���d���u<���` #���a���*a">V�x��O4j0|@堠�nB8]������$��� 	�����"7�c�5��7ʽ������lf�Ӳh��?�3%ԊL�����"�+dقk�2�P�L�t���ԡ܅d�  d��
p"2�&�<��<��p�ݓ�؀cHӽ�<0�N�]��7�HΡ8ԗ��3d�x=�@N��N����vǰ��·��ۃv|;��s��{ ����;;'�R�����'d�dF�gw�Y�gރ�5�̞i�ER��|�V�T�fP <�ˣU�C�C��b�^-��E�v�̰�m�'�G3w;n���=U��J(c�Վ�V�N�\���a�X�6"|B�sGcnW��o�/Ӧ���n�e�t��1�v�[\�L��^��E7\���)[�!���f�<��]���j<���0�����ӈU݂�[�X�������7g�8"��]�[TϢ�����P/��-�>��<�g��TnVM8�RϊIi3�.}+p"�+�l)�쪀��) ��]���p�Ioєh�����>�3'V��j1!�����Ր|��R���[���UT��-�-����P̾���iŞ��`�9����/��$��N%j�ͭ���+��;�+6�X������5:&�jnB��[�eľ�F귓|����4(���z�c���x�I(�e�U�/rtr�q�mv�yٮF���FQ�}���n�wz���^�x������t*��M�F*�%#x����G��?Y¼w����J�mL�,����]�U[{A������-SC��i�U-G(y�F ��9��iX�?��<%{^�Ă�1���ݼð�r`�'j?i�"���Z�|�p-�7�\A�z��֫�O��;�:!-[7��N��^0цE�k��(|z ��}>q���y��MS�.��t��-/�-���N�3���"I+,��G��8����:���­�z�x��C�������Aؒ��S��w���[��']�@��_F�IG?��7Ԧ�����<��Z��֘n��bBy���1X��
S2�">FvRI�J�$*���GvDp����5�!=�������)8��D��7�+0�h�\/� 2-e^ӊ����-��3eFZ)��b���z����Vp�hޛ7G{�\i�KD�;��(SoUB��0�$�,M�a9P3��TB��0f�>4p�,����Le���W�%��g��Aā�78����8�LD�g{�cPM�j2���G*	��v�ձͳ=�1<�8x;�`�-���\RC
)3�*@[4��C���R&`?� 3�#*ME��bd�.dq�µ%�)���9f�5�Q��	��A�ߕ����/��'	_���H<�s?J3]!����m�5Wŏ=��YJW�����3T�#%�)�e�b�/��T�cӎ��8��{i�,W�^���~�@b~��q�4� ��!����A֠�=�;��i��ȅRPvh��	��DHI`��3���D	K��y�S�Ĺ���b`u�k2h�͸5G-6cw�-E����L��3��H��}.L�<,����sf
.�a�dt�H��
�(10`S��A��`��wZ������]!_}c;*@���bIa'+t���(��0�rU^ۛ;�:66%��]���'A��0�3�v5FX��7����B��["L��s�E�YC�;5���~q7���kl"η�La��~���vBm�A���R �S�I�������`,V�m��\.,�2��I9U�!�hC]/�C�f{ G.h�0�;ᨁU`A,�G����E�7�x�Q�{�Q�M³A�F�[)�'iW�q0�TϹ,LԗFM��`H2?*T�T��6�;"���4��v���4���F�d�Vz:P,y۩\����'���wиv�~�73G5,��R��]��Z�i���5��$��#�]X8bon
,��~��?"'��]��貢2	�?+�.'��',�#���!��t����y?���ۚ�iǆ�D"6f�J>�'ݡ����'&��( �mw�J�>5�/B~I�M	�O6Ʈ�R�dq����\���=&ρ���m��ʨ(�]�6���㝒o����\� ��o�/���k�Hp�nS�^t�:dr;�1�ƭ	K[��F    Ë�Yp۰��$Q@)��x2Y!y;Y������R�P�bchA����P`]L���%@���x����?h�\:댅<���A�7A�⋑)��U�5>�a�}n$�0ÿ���\�=ɕ��kIa[?C)�#0i�Z����nr2���>��#Iv'�s2��;�6"�$z�M�H���"L,�Q��h[��YY�a6����0L��fV���0�8g`�0?�x�S�\�[�))��M�]H�u� F] ����Q���{��Kk� ���C����`������Uq� `=���T�4���,��$v:���Wr�x�T˃=����c��R��Ĉ�(��:ɣ"{��c.���zj�W�JTa �އy�6���Dc���nx<�)p��c�l>D=������&(
/.�A:��꣤Q�-�R�2�a�jؼ����~�&�MY���F�ڠ��$�4B�oAK��S���5v穉�2�1����7�4K��tb�w?��/pHX2�y~�8�;c�s?aG������]|��ؒ��\�}}|���Q��cd}��U#��c��}س�����9Ҩ����N�c/z2)��Rl�-�� (��s�{PFD_<m5#8�Va������Dn�*���o��|�AnR���Lqf��8�4�X��{�\4�;+a��Yu|�e�A���[@� .�ّn�u��£�|U���䩐7�7���H�Y��+8�zW�9����k/�쪂	C���O�I����������wJ˂���m]-��[Q�5��+��"7&��WO���k�m�컴���C�HU{HJ� f����=�z��/��EQ�K4��0J�6$���a"�;�zf�>�(��P��1ia�P�Uw�H��r��@Z�&��h�:���nт�i�`d���A�y��t�y V�� U�ε��7�8�^{�3S��M��_�l����o�C"�ܬ4�\�?o�t��*���Z�Tyu�4�_�y���A+fG�r����p�`��l��00za�bRQJ|$23"Nq�o�u�� z�NE�d\�.C��[nNh�p/���^�١�G��&�$Q5q�����y����봥��;����F�f�Ԫ$�b$�YI���;�!�C��˴Qk�C��B��SA��RSٹt�t4�!�?z�(GN��=����{���LI��ih����_7 	�AǕQ)MA�|�2���]ow"CDN�̗���㰡�#��G�qE�ZP��J�$�*ؔX.�xW��30�J3ؔ\��PX�\8�؈=�`u�Lp>+ej��&x���}C 
8ڳ�9�(�}s���`���ٍ������n��9D�Y�0�GV�mSNǬm����e[�	����~`�� �	�
��~#7�D�Qb,� �t��C�H���V�ݛ���#ٸ���T��u����>5����]���������43�ӆʾ/[~��W�t7�ʚˠ���s�-��T�
�r��h�mi"�ҩ c@@Z���R?���Tn�W����OT�n��^�"�`���o �LJ��A��֤�8���e����zP�.���#��ڀ��	Sɭ����EI�c1�+�:� S)@+�4����$g �G��� а���%$�6B���X4��;����n����Ek����2�'!�^�dt��}Z�DT�?��W'�bj����ׯ�w��<��"��L���������{s:�������y:>;����sr���z���okjӇCY6�ṟ�ZFy_��ƍZ��Ri&������pP�Fs�	B䬸���)�{�zd	�	���cÜҹ�]9�x��B.���a2�1з[���\=����QhE�ޚ�m\ѩ,ւ�Ld����R���}�Kٙ�h`h�C�:��DA8�J����g7V�Yl?+����m	o�"��3��ٚ"��z��*���$��ØǙH
�[<%������8E�f�1\�[�5��GY���V�[��֭x"�h��-��_�����bU�<��MWcA�Za��[}�d_3�Ŀ����*9X3
�FS����/������FoY�M��^��r�}�Ro
}�-���H��.m�E/*zicd����Z"�>p�5e=^j߭���&U>�����:�½��������s��]h{���c-��k�ⷈ��)1y�����o�2�͢��k�Ip5�A�����<�����`���'�'���_"=��@b�
D�q8L�:ާศ,�HaA��O<ܽ��@#Q�25���.��pp�K���Gt�6� �<5t҈�O�e�a�6R��M��vwjL�����%4X�\O16#B(.^�W�M#S>5�V��^ܩ�Ί�Y�ccO������z5�̫�dv����O~҄cb�i��"��1��:��b_�x�g4���~�b���nr��aO��9$Fad���T&�X���V�_�����/���|X�:�v�Em�O'�P�[�BFdH�pC;��\�nq]����}�
�F����l���t'&�J��pgg���#�`��Z����|�)z�Ax��c�N�y��+��˂h�Y<���(�s�O`�fl�ۀ���1�>F�L6�켠��$����	ˌ��V�S#�V�r���,�[�2�B��9��9%�E��+��'񔺌��@�PD~a^��`G�
���"+,��N��a	fU�F�l�dY����=d�����b!�҈(0y��Q��]Wow^2�H��ThqK�T�j1A�����oC��c
�_���(�kBٔ ����� O$�����pb껖�[�:�/ @�pr�;>>aGc�s�3>;:8;���J���?���JL��
̔?�U�v?jX<���p�S�vX����9I�A���ʑ�0_�8�6�O^�Ћ-6O4�Q��Tl����j
���-�펒��*?�`h�+:�|E�0H�Em�d|t:K��Td�Ku�x�1�F��>r:��%��<&"S4J�4�շ�m�E�Nrpi_�b��0�]��Y6�[�\�j� �J�{3�h1�9���}��p/���m��UW%ț���3�AN���8�E	k=ƾ�����@/>�0�ߡ��67�^���s���8x��1���x��s�@}����r��ˌo��ZB���f�.���QcjZ*	ש�\8'@_l}���\��� ,/W�à��"x2q,�Ǫ#AA����Ut��6����� �p���Lf���ȋ�t��_±��k��Z�o��)�>>�t�:�~�}塺oܔ!ڞ���u�d�6Db01�^��Z����{#2_��ݑuI1��<<�|����O���O��� �j���Y�S�h�������%���	����M-����V��=J�o���[JIUt�y�z�s�C����p�o��.��{� �=��#����YW;�PW�+�s�����+~b�=;t\.������.�?�e�1p�ɂ��3�b~���O�}W'��]����R��;��-��c/K�^��(Z�(��Lv��FNXRƮ������OO���
�y�����.����]5d�����J��;z�D�˟A�X�����> ���*�qkp^i����5�S9�V�t�J�Y���ւ�C9��$!�~��-U!��D����/݅`Ź�h��zA�©�rYLk�B�����N��:��`��%j������a� ���!l{In�5��zV��լ��� ��9p<q����ò��dC�uĆ@(DA '��Qn�c�����Ρ�*�������'�luJ�U��"X�@�=|�����ی�ܻ��ZȹH����8K��jL�7�V�cF��F�;��ف�_甀-_`���ބ^h��S����'��'�����;'GG{�ؗ��׋Fh�޽�ץ�.��G��#S��քu��d�Zy�cG�+��uj��G��fY��h�$X��y�p�K��W1�+���0����G��0�9U�]b�����"+�(��     E m�Ca �/�пoxhڏ
��C��x\(�끅F~�в��f���<L,�g��`F]d�<@Xh�+L�?�	7����֘S-�נ)f�:Ì&��Xo
o��b87�7�\#�Үeî���X����m(����D�c|��/�?������������_�F����;?�`����ϴ�8�zy��,�����\V��Z��'��9�����:���o�I �Kd�+&/1_d,8J�a(R	u��_���8xp��nh��Xǉ6��E�8^a�'�V�A,�4��|�R&��K��<{����9WŹ��'�}��cq�x֏�(V��������tl���(���K�� Ƙ�\�M.� �?��S�t����B��N�g�P*c�Oǔ�-�� ��d�
�FP���%^��gY�;�n���ҭ�C[�?D�q�T����tI^[��	z��l�N��i.�%�on��Z�/���)JDG�q�k����'��N��a�6,���}����kA|"k�^4��ۚ��&�]�>���u��=������yГޕ+��5w���pS�b����b�l9��� AW7U+]�!����W-�e-8�����p�(������ ge�0��a�*�^�w{Q��q���w�GPdX:8���&� ��I)�%� E�8�� �!W1� �Ի1��+҂���ܥ��i�0�.N.Ƈ{�C���9?QMo�[ʷ "��P�A���P1� b�!���B�+���P"�ʜ!����2,Wx��gv�{>�
R'n>�s��P��)
gCČPK�`������Y�6�����*a�G��/66P�w[�8_���� �����od*��D�O����;ZuPj����f��( ��їr�/�x��r<���e���_�кdC�՛V��&��@1��r�im�-���H����NgE���C���/���2ڹ����-�H��kaHE�^W��N@�����;����?���u�z�I�sچ�©4�	s/���ʼ,�nCa)7Rf�q���H����g���F�/����n�1Hd7���Y�0��U��<��#Ɉ#�U���Fqw�ܒYb�`�<
����@���:�;\-gr�R�9�i�k�t~�����4����F�8���|p���?G'���76>ޥ������.8.x�dT��ld�sa���J��¸6Z�.��J�NF�n�rE��/�Ng��`�g���Be
��n�M�w��\�T.�P���٣�z�7�����X�5�灱��d���j�T6�QC�Z@�zɮ�9�"�U�oE����?������Щ�;6��D�9�	89�`Й_���Q��nu?_�\���Ů�RA�}[7��5	�/VO<v����D�t�6�o\�����6�b<��ă@��t��@��u�����x�X�c�����V��B�&�-����k�P[�.��v3�����ۻ��i[RR#��K���̜������4�g��msY�_..���=������~tF~3��8x{p1�
�@�g'�{���w��o���'l�O�g�g��	B��S$�6��T��	�6�9�Q�FaQ��i�ݖUWEv�
��{��þ�^y���F����%�ʇe;q�Fy��D�7��'m}�*5k��XI��$���؁����Y�Cl��Zu�Cbw���+�x�w�	��I�����LE�\��d��
��uy�7����z�L��'�X����?���[(�qI�T�.Ш�Ƀ+��x2Ѣ�p������~t�����Rr�qݹg�N��]�}�<���UF `���n����j��z�������
k�|Ī|%��rKm�sJ���5�=s�m�έ]�%�T���Q}�\)���)̓D�1�~Ԝ�8�v;��b�ZH���۬Xa�)p��U�3�iȒ���zeMh�k�(�=��W���KC�ҬrvhA����W�M���~����t)d{R6)+;�%�v'g��
�ֽ�5���^��8-��]��[`M����oJ��W���l�/:PذV��%���e,�/Qi��_,��9'u����^�]���|)����b�ƺB�"\��<Eil���Vt���y�4�'5+J�K���ڬ�cA��R��S�����2���/�Ϗ�:�UD41��ugں����4I�H#PQ�cB�T��[��u�e�x!��|C�S����5�� q��Fj�s!��9*�qhH�^�آl}�9M��S��4�L���~��Jx���~�-��ҠÒ�����H'�1��E�I2�3e2�u�����0����MJ{�u����JF~P���}�"����OP����sdEȉ�a�g"��H�N��g���s+���ġ��L�t��m��r~��{�Ω��t>�ͫ��8g��ݳ��������a��c�4���(E�pɴ�E�0���Ey�����<�tSzlQ:L�6Ls>�܅{IOM\I�Sb�t�D��[�%A<-���A�u'�{{pp�^25���P|���ռ E�Ѻഘ�+�6�Bi��3��I�a��;�]�+v�h}_��Ƕ  ۲�i/�E{V�K� Qqd$.3E�ţ�zz�q3yj��kѺ���qv�9K���.IM��7�]�\��pM7\vO��8#fi�;� �s$}2�u0���΄&;������Q��3��Ò�dg�ұ�;�b�վn���ޒ	0�3-��y��w�E]�O�d>)�EYq0v�.Y���ŝXgH9���[�������(��X�a��`��T0yӆ�0q��mB=$��w"��ڭ�sͨ������-U����n�[,M%�E �D�pCJ)�6�������<�+D̳a��N�ہL�P�=:V���- T�2s���D���.� d� �oj2�����M&����`��N����y�JbtP���� ���- �0��%�_���[��a�=P+a��e&�6S/	\+�{I�*.�<H�W�$ �)>l����ͭ�[0t�?N��ǁS�Ёp�!��"����pO�4;�;{{�݁�(���?�CJP������;�8{Cm4�8a���Я�4��p��Z��Z�����8���Ӄ�=v6��#��ͷW��{x����<�	;8:=_����v��k���HEb�O�E%�5�h��4������١�z��ܒ0#��̝�Ų�n�p��]`1��zh.�N�u_��ҭj��nKѨI
�4��	.u��I�+s;$a�����Pc���uj��V��9�Q�/g�a��D���V�֚8"M�����f�J�������'z���R�"��rv�B�umn�B�cG��L)��o!bZ�Ȣ^*�J����#��z�x�Z�Ċs�N�n�<��#5�Έ��a� ����q��E�ƽ�ѶT�K R�g����>�X��=:�������N��o�
�j�?��}�qe�{Hoe����U�'󹳨���x<���{�:�Sً�C��wnn�} ��D��;t����v@��9������v����[�j�nzjKleĚ��8����Q�ązRY��F���Jb��Y����9ɧ���V�{�V!ђ�[(��XYǒ�8�ScI�wr_�!�Q;� ��6wdApG�#�Ľ0�0�v�CЮ����(S\���j��5��4M��#��e�d�(٬�IL."d����$[q�C|�b��A{3˱����<U_�ܢW�l�3�67�j��J�@fǾ��y�V0����nT�n�%I�L4Ld���K3��U+��
t�os].�$�Q�].� O�0�������v�1�s��%GK��Ā&"ؓ��X5���N�z�*#ٱ��X�Q���1�uy)bٗ�R$nvW,��qR.�㲏؏�"��+�R`I.����\t���I$��cw=����9;�c`�4�#��B\��[q�QA�    �9O2*�q���
u�OV	`��ˍ��Qĉ�0�d�bC䚇������0V��˱})s�$�6�5ٙ,a ��\<�-�1
�0�c��9K��v�2���~_�8I��������/J���c�me~��6�`}j��,�IGa��"��5�D^����� ��|�h�q �M�nA3/'L��d5Y�Ũ��ȣ��}ft����̠�@AFV���RIvr��)�����)� A.���x�B�0�G1��MR\pQ3֡8��p�������Q��,c2���COV�*K�I�.1�[ь�F��\ ×���D���6�D"�R��ZN0�xSַ�b�^��-}$��L=���5$v+�^
�e����IL�١�n����d��� ����ӮQ1���	�dW���nR��w��̑�}6-*0@l�`M�,m2չ���+��p$� F`��b�SɦD�O�e������#^ձ�������E�=E��%��c��L����~.��_��Sr~@�e
3�[�*�.c��x>LRk�3�M-:("���pL��:�%[c�����'Wگ %����M�H��d���q�J��w�f��4�G�*�2�\ƍ��^��©����A �K:T>��RN����.�F���� � m��ڣL�ܰ�cE]��]b��t`P�\P��AI\[6��ɰ�{��($>9l��k���1�;66E���hQ��Y,DDE�÷ �X0;Ba�8�1n�$N�8��!)�����E��L����X<�q,��0�
��*�vV���%ݤ�q���rv�<b���N��φKOD�A�7k����cQ��v����F&��zyػ�Ƣ�+�gQ���l�����Ó��e`��F�;��Z�`ĖMG̴�	[i,l��h�T���
�]�S��jE�H4�A��z^���k���kL�-�گ�5rD!�[�5sS��@"���+�S�� �����{���z��S3�n�`�EB1����Y�4f/����9ou�[�3���
���N�=��)3]�R?3�M�@��)@UL�R���k;�� �d@V�j<��V��R������bը��g��Dy���O����s#��R"�GHDƍD��e�te��L��ݒK:�3�^�p?zp�M���b���)L��4�R���}��`d��s��)B� �����o����o7��D�١=�ݛ�" �U-d�%�=0�Η�TI���j#/��Z��a$�G^���U�mr��i0L���'����C'<�csk�#QZ-��A4P J�7��y��QlLl��4�A	��FHrԲ�յ�	&�(i��.*Ak���G�Maf�:�=X�A�{F���<�Ɖ�z�b��Jg�C��� Ţ�Y�T0��%�E��F��h��
��[p �fW�.v�)�[,)Zl��(��`��!�9���VW��b�&���λWj���&�=�Ac9�^���
����C�/�o>5����I^�8w�C�E{v��Hv�Tz��$]�J���=�����e��5'��%����Z�䞽:?}��\�_YJ�?�am�*���V.f��f�[��]ZQ����	e����L����å7���(�3�?`(���m!��uy����jl�xv]��yy�΋�S�-�~�"�YJ�p!�.e���A�f����[��b��4�4�b��wv�2��6�F$�fDRE�����P����&r���B�K�n=�x0ȋ�]��9-�'�.SS�5{N�%y�yYd$�|s+Q_f,%���l���͑K}Q�+)=b#�D���;�o��k��-ȷS��5'D��i��d�X�)L���;�wGID����
6ެD���������+�Qo��B�8�Z=��ad�$�;�e�.8;t-M]�[��E	��d��Ӝ?O4�:fJ�Ce���J������w�r^˦s�I���p�*4̼4I�G��)�=�3�`Y��5�xu�h&�.�Cڽ�5��(a�c��O}�e�5��ޢ$�h���)5Aƹ���z":m���Z���h��WպQ����ŊA�Ⱥ�������� m�Y-.��Y
�,��z`�7�`N��١k)����Pԫ�qϾD�+6�P�g���p�� m�6�@֊�\�u�.Lۧ��a��C���K_�\�h`�b�)�*s4����e��޴��U�`�������/��Ƈ��*m��zjd)�+�����n�3K�eY�A`E��O�E�sasK�#3�m&OD8�ڡ+�۵�5��(0#�>��f�O>����J���P"&�R��oQ�èI|~z~*�e#C.w��ڽ�5L�(������F�$���k��z�TFDF��P��9�"�dIm[�?Yd�m`�`M�~�3���S�Sh_l�=�< �ut��FR2 �~|��?E�<b�M�b�0�48�@��͔&\V�?������*SY�"	Q�I�sDӪ�JZ��������|Gz�n�4�j�*Z!��[F�5�q��gx�Ws�g�6�~X�-����H�k�+(������2�v��|�y74���z�kv�G��j���M<�l�r�y?����ݜ�C��)��騏���<rT�a��ë7�YM�[@�>"X��G�!�{ɓ��z��L%y��}�g���۪t��y[�/IF$y�r���rc\�{Y��Zvj���.y~~+YP�.�YB|���hIU*~
� 2A��S��_���?ߖt����a}�*��ʹ���v�hY�?���b��o���d�-�V�㣳�޽>�8eg��{�dwa��꒎�&��ZѴ��m.�+���*�5���o���x�l�L�7	��cs���l�=��c=��M���7Z[��禿� 6���T�|�G���EUX�f��Y�a~t#��/��w����%9�ݤ�<��b��-�|�������l��/4[�;C�d������(��q=�N�����(G>�f���r�Y7��dZ�*":R��+7^g���	T��b��K�$&�ћ�a�HVm�?��<>�~8>=��ݿ����h�U�pn�m�-ήro�$5e�Q��%Y:�6˅��r�<
g���Y�{[9�c�Y����T �5]ѳ���wĉ�)�8�y�������˯��^�t�5�����`�-ǚ�(�ԘS�`�!(T���_n�.u�(��;љ&v����o���7�7nZ7�'��4E�٫NzI��?�v�Ҷ��IU��^bH�}q�xI������E��t0���]j��.cQi���!�j+P�6n2V2�c<d@��@�����d����˅���*^h�c�s�3p�r�)?nvu�Pk��K40AJ�z�Z'�Z)�Y��A��6 (��V*�������5�Ld֘���B�����ƌ'
��� ���ey�M��P�p�&������M~m=3�q��������d�E*"~[j�S�M�(YDcv��ItKt0�&�H
_�����}�=�5*�|y���#�y�B^ �Kɸ������"ឍ�ăA�c�E
�D5�yoz�k������?�фr�5ǃ�E��'������a.�kZBW��Ɖͭ:���y��ڂz��G�C���;�+��}}�\,�A��d������}���PԸ�b$%4yi	64�4K�&��_Ժn�p�ʃ÷8A��@�@����d�G�N����%�Y <���F�����1A�b�ǒ��A��4��w�����pڿ�{1���т_�6��m$�\�ܢ��D*�p���C�~	��͌p�l��������5L�Kfk��l�J��bH��!%����|��t�V&e�:���m���laW��WK0a�ߛ�v\7��XqaTC0���iz q!?"��m�1�_��������6��oYU<�@���j8�l̾����q�I��Ώ�F.XLј����kv<�e� �=ה=�)�+x�i�)��>"�t�v	����um:�`�4#�	g��6Ps��/�dyHA��튗����i�����slV�}2�d�nq�    [}/�Ti��"�i#EIL nA*�f{"V�)jR�}j3WM���}�9ď�5��o_ay~w�_
$�b;7+m,��ш�<��x�z���'�}�!�D����Ҭ'���N7��e�e���^j!�f;d��xG��Ĉ6s<$cu�Fyu�Z��m�
�N8�o�:%Xڴ����hw�r��e��AG#&����4��T:����b`�;�����v8k]�r.��T���5�Z�H��F+b`��s��"<�V����2��w�<���FI;��;�,#�j� 1����1{3��R�7�f�h�3x;k�#�Ai+� �%e-{F��Ԡ�[ɑ�c�|��i�<�@�X�ڹ\���!�08k�8��m��?�ݲ��F��U��q������Γ �Z���[�w��)��]�2��l�b�2�%���HfX�c��-}����b�؎�#�b!0��T�9��Ws����5~R�4G>qNexl�N��M�����D�ͣ�z�y�B�ۣFr���E"}�̤PJ�*��#��E�-�p$�\���I����>��dS�A�����M�#;�H���u���KO�t 1�us�{υ��!�(��v�˥�)�J؛�q"��W�G�)X.��7̑�������V�OD`v��c>��k����yd��n�j͟խ��ꛦ�ٯ�>����[��	?P��9��錬��hh��M&y�Z�8�X���m�4��i����4^���#L'�8� �wF�v+OPK)�I7�5	�Z�n^k$�&Q�	>|⇽���?�!�UU�\�T&�:?J�Ֆ�$H�L�	�I�љDI������X{K�k �9����kȋ��AFs;��[j���i����V�ݹ1��v��NC�������/.��m��Wf��lᔣ�������e�^��l�#���b��(�G*F�э?�G�Nwt@�2�)��cT6��o�$|�d�J���n���<,�I��&�Z�ގo�eQ�n""��~/wM��/��C������9ҮaR����j0[{N/I�k�����ڔ/֤or|R�>���I����2ѕ&�zs����$�6�X��/d������C�UIh�	�Fl����+� �LQ��MJ�������F�əz��Vִ��/v9M���Ar	,���j���R���bN�/���/�?"���y��:po���'?��o�n������J���e�.z�IK�1|L�(�~�K8�_�,�I��d��㤹Xa�4>�}��g$i��7��̡�6�p�C���v�����-� �[Z�Uz���@�{����LF"�e� V����3PI�*!J���;�}8��[�ߊ���RÂ9�B�fD0�o)a����?�����t���/���G����dڪ������I�),�!L�e�,��*�ä�O���@է8���YI$ح�veUXܕ��E�&�.��2|�e��j�{0�
qݺ�'��?��{�ҲW#�e��2 �K��%�i�=@xv�>;��y��gnA�,�~y�hw�R��n���S/����_��A��,���P�͍�;��C����C[L�d��4:Na\ P?��ߒ{��D����K��m�i�Mِ�jF��GCBTz������g�N��f8ۻ�Q�!c]�T	lmע�S�?'��~�!����;H�E���XP85}3�����刍��QF��G�E��z(�:�eS�费��7"�y(cz纙����`�|LU߮ӼY�����e>��*`�fIhw6}�~��OA�ه�^�~�}����_��~�ɠ/���=�NfP�){������C�=����%�����=Qd{���u�D��U�
/�r��ryZ���y��Y����B���&"/{-��D����N��F�E��Q�M��.��Rī\��֠���2���4$�&)���^cVD/��;��u�i�@�?�=U�әd<+Q��;�J���WH�F����;9����r���o�gy̶���;��2ԗ�w����,�$��Q��LF�U8�%Uٸ�K�N�g�_���F}�������=&:�sa嬄a?�N�C*�#[x�!�a<厙<q����ۇBe�7#����2]@���	0WI�͍�EԌ�#;-��X ������A�쌗���w�7�Ř�4����0�lZ��`���v)<E�"�l&�R�(V6�_����ţ�.@����](V)m�(�>�n=�@BJ��TY�T���J]F�D[���ro�A�Ui�Z�+��8��ِ�Qm��ݥ��s�O)d�"��G�fy��q��`c�ȳ2�Y��@t�c���2�$�L]M}��"J��G�:�Z]���E2V2�
ms�X?�P��+Z���K��pL�P��
5w9��������j��8B��b[|�>�w�M�j��C©�*,n%���X����M{�A�5f�7���N��`��-=Fo�h�nXq@i�JosGkLJ��A��`�f�v�[�����z���=�ѐ���f��)ƕS��G�#��X̿�o�'�"��"Ֆvw��w�no�sۚ�
hG�]͉��`y]��E�8��@�<�}��"���%Z�"~�^X�C6����� �@��n|�ҹo�N���
C�QS$|t�'�C�-a%_$9C�)1���DCBΝ�P�\�A�V���)����U΃��	jG�4<Q��Z���ٷ̯�V��z��O�g�o�xv~�.]�knf?G���l4Xb�Y�)���Fz���dÎ?�E�|km� ���Z��[��E�Ǫ�	O��.��	��2F�LTY�F�����{�!U��ʬF�*��'�`�ߜ��g��7o�����Së�}*<м�h���3+J�����OA���-��V�B�"R��U�_:��>+�i&Փp7��%ً�`wר_�������}}����B����:��(���+�Jb���LKZ�Al,i�"�Kpc�8�v�q��I}껎z��A|w�i��6��[��z������A<ۚ�_������!aM$с�<��g��s0+_�W���a�f��a; ��h��۸_���zq��w�Hrc���H4�۞�8���Ks1_�Ѥ�15��P�],��fu�4�Kx�A�L�*�o��4v�=lS�ysE�}�_��q�֮����Ӊ ˰j�0nj�8_53���������n�2�� �g[���X�Ȱ-��G��f��z�B2(o�$斕^s�}V�c�3���8�Fh�..�-�Iw�N�U:��;�z�ͧN�߼J3C�����>��m��Z	�[����21��5���N#�7��!T4�Q�P�y�MoL���sw�/ >���`O#;޹d8�%Cƺ%è��݅�ϙ�ۉ�W
�[d[W����pQǮ����X�؇��7ȣʽ\q�*����9Gt<�n)�.���i� �:�-����ޠW���<��th��3�ؔ�5��u~�1�i�I95�{⣁�2�nm1r��bB�xv�[�$��!^>Nf�����z5�j��c82c�v�Sl�=A�`ڤCR�ߑG�p�<�߮-�rd��F�<�rT��>D���Lq�{]}t�AMd��}����ӱϜ<f��G����� �L��i;����4�x�Jo�T��?qݷ���YZ�����h��+��n�G�^�5{���
�ʒ
Y^cb�s*a/?g�*��	�A �&l��Fe�Ǖ�=��S��ʐ%%쮕�D��U;AV[��O�=��Ve����[�VۦM�{�M���OR.�2l��	o���x3�I�t��Zפeb?�C���ح/�>a�K�� �`i�Y��n������پr��x�m���P2�C���T�a<X2��A�jhktKt0����h���FL�c|0�G�U�;ۃZ�ᯗA/Qcp��	�I�I��d���'��+����S��T+���RG���ƣǉytKt�]����p�� ��e��c��ȏ�/�J��5Lx7}� ��d�*3ǚE�@l�jգ0$�)Y>w��~(�|[V����+=�|ڪ�߷=aՓ���P���d�N0    ^�>��cq�:����Պ�E��D�D�w��Эk���h�z򆙐�.a%���Q���I�b�U�m���-�Ö��T���x��/V$�'>�#ܨBa���'d�A�~���ި��l�0t�~��)�5܏8�	��zyY"K��Ga�&Ϭ�U"��vѵ�ޟ�n��0��m!��2_rj�DV����V=��u�v���e�n��S#.x�"�Wf,�A��^m��Ci�t�G�\�y����j%Z�3�U˾
^X��ܩ;�Uo����`�����~��!���{�{ț�A���\p��4��bN�9����W�<�\��WY��*	�J�� ׌�=�C�ݗd���%��/G���j�e��7��4a
5܄{J�6u�� �S)iB(xo��m��`~�wjC:3��;dMػ���)�/���=:d��>��X%W	R�hQV5�/�����/�sGKh��˫9Ȕ}}�5Z��[��E^eYY��6��;ė��p\tKt0,`��Ե��;$#�Rm�pA6��$.��V�٢��=��2[XΓ��g�ZtY���d��g���`bVt�!�0��;�����E��\$��<��l��M)޼��@����)��Խ�.�#�sʁ��$��R��0����ň@_:3��\fӫߤ��+vD�X0{����M�Я��r��
^/�]�C,�d3h*B�	�A�q^��t��)�E�j��~B_�@��myRra5��Y�׸]u �m��Ȥ!Q����9n�-n1�~���̖F�H�y�ڼI����C��຦z�WD��&�C�?�	^�"c��b-x���3b4!+b5�*LGcrP�r)�59Q
��B��ZP������n���
5J��\!�M��.������̩/��&p�
<Ó��Y�g��%�$_�^X�����=J�V�����e���LF����0���7������������{覓g
N�|��GZ��#��R�X��b����������3��$8_�	J�"p9F��)�L�vȀ��y7���g�q���/��{��|�
'4ߕ��n���ǃ
�&N7���e�mb���Yv��#����-@T�^��8��Fm���GN<��K}u���� ��~<.�o�2T�]�ZSW��J�P���Ua��AB�-����7l�����':�C������۬�'�Դ�-�j�Lv.4A�����7���7W��C�w�n�F�8"P��s=՛�<��?�5���7�%�Ƃ3��1"@�#1��twu��_�0v�7����v��ܛ���O��/��'mD�}Z�uؚ�d����1�L��Ui｡�i%+��T�g5ᢳ��#��F�oA�C�o�X�T���� h���=mI�����q3��w��9#����W�$�n.��m����OZb�IE_�9��5�'!��)p2�PzO�LdV���cj�����.� ��)l��1������ӯ�a��.����"A��#U��ߺ�n�:e;�Q�ᐮ�u��S
x��=1�"`�P�(�#�X��a�r�b/2���+u�b4��Ye�_��N���~�"�K<�l�U�ȶg�x�"�z"S0T7��)�*�Gi�DZ#���ȫ=�3'�� �4S�����X=���r���5��C����	��9.R�Ɣ7�~1*;�)}�q���n�*�.���<�Q�*d��F�
��*������k���3�SCP;��n�O��O�S��m�7�2�u�A\	87�q������Lw�ֶ��25Z��3�➈������%�/k����8M�����$���4S��������j�����׀|�E�@��I�rꭑ�����6��w�ՠ�YZk;϶�n������5�pƨN0ܸ�GԂ�o����`�A��,��t&*Ȳ�'����q���x����5��
�Ҙ�9�vv ?a=O�:��3�%���-SںP��AJ
Q`3���k�AJ���Q�(e��`Sx"�Չ-r�& ��%��3<��mLOܺdH ������!��c�/1Y����/�U�U"��O*^ڃݢ���`{�R����>'m��֤2�ЉVz�=�D��K��c�L�1�0���J�&ƛ��`�J�덓e&�,�x�,-1�v���J��v9ɹGD�T/�l@�󨁲�(C��N�����gH����	�����F�ը\V�5[o��P�C2[p�����'����(���88���|CA'�?�gRM
'p:>M�[���-T�(활N�[�LNg��RE���,i(�����1:g��9H���HC*�%�$��~�;_&ig���7������%���oȾ �n\�����ˋ���7���W�U�?Y�#�V��9z��`�����r\#�`R�6�R���!(�1Y��1����$y�9������<������0�ز�3��	�v�TK��r����01�*��ΓBV�h�ۖ�>.�C�~��n��k�4L,䓢��Bw(0=��&�������G1:jO�q�D�A�����z�1	ͳ&�����{��� �a�p�0��g��D�?\�Ҽ?���~CY4u�������P|^���%O�t�d�~���0߶%R����=9��w��ܽ]pĐ��V�2�X�6����	4���]���	<C�>[x,��j1i�b��[ta���Q�/��xv�2��R#�H1�pΩg� ���?�k\S�������UXEeZ��uYec�5(�YOY[w���4�%��Vџ�m7�ا�h��i���8�kV��5D�"oq)K�0��J���E���p�`�aA�
<�J�G����K<�K?2>P"�M|U���JX2L���gC����EW���*�ʔ(�oO��L��plY"���̑+��,M��Gf@Q]�va-D��b/��$.K�2��AE�`z*���n���~a����%է��=��=�]��z�ܭ���U��ts��؝suGu�����kMl�w��?���^h�aE�cx�脝�;�ay�ҷ�M?"����f�������,]B+s(PE��D���Ki�w��3MH�i,�����r��L>]�
����f,W���r�����G��[��%���gB��z�C&;Z��,���v����79�}�zz�a���}T�,�i�����eo���sYB+!�v�>����B*PY�0+Tܹ�H剞lW��4�PK.FGanb�G�oX����@4�z<�g[�m���:�@��PQ7 ��~������2R���Bj������� �ω���~>����/���������
�f�j���s������s���U�����?
r�=:7D6�8��e��߱"cA�fk���sAv����WU����[�+T���ZZN�j����=[]Q��j���`_�6�P�ZPq��k*CV�VS�0&V$��ƙ>�E��� l�0MO����ڞm����4�t�,SY�d��<�Q��ȩݢ���Ҳ�QI�
Z4�x��E/wb������B���s��O`e�۵�i�}C#[ı���H��4.��(����*��[�I��Ͻ^MtO|4d�`+7��R�+�*�g�nukd������4_������bI}�+����LYdj�M�/�U�r��9{uv2f߁w�X��φrh͊�����e��׋���9�,�E�i/�.�{�^�������	G�钽]�.���/����U�Y� 7M�V����*��U��\d2)�,�*�����I�fc՞].��s��/�'>ڮd|�Xɤ�hWr�K�0	v�Ua��=�b��}Kw����&�Rϻ����5��ı��.8�Ԭ�K�i2��D����V���S�6��p}�Iڨ�{�+�\[Ӥ�fؽ�";f��Ր��["����F�@pb�6����b��t܈��~�#l�8�ߨ��/v��B��4�K�;��Z�������(;��4��_�F�9�j��ߖn��8�    GZ��BG�ď����0
�iPRن�fY�0�/��
l��,��jhSA�>�M��Ņ�*^����G4�����b7�����)�Y�a��Xl
��K~T��W������\��6��hO��'*��8܎|�zq9��hu5����G|}��l���cݳ�:������!h9�4�Ld.���������D+�˽ʀ�B�5Rj��jX�n��R�UV�����N�=��]#�on��`�+�"�d��B��'-���/]�;�&�g�:W5�N\Xő�ۛ�þq���kO��������}u}#6S��W��^ ����P�n��<��d�c~ф����n���x�Ly�_;����]�Ly��0�d�˝�B.4₢��X����gAw��[d%�}��ݳEV�b��'��==�����G�,JjS+��5�XT�T[��i5�:�Q����H��U<�)�V�l�sUJ�OF�����N[�D��F��;^�0�a�W�AM
�(L��vPa6�� �_Ζ��n�Ɣ��6���C��T
<�D��z���g�TO��>tf;��K�̍i��3����F�҈	�v�+JOҚ�TE��u&���3����.��ud�Cp3��M�*M<,Ug��J���ӵ�1��溡�E���ɕ�/V�%'����4��d����CD�o��O��	I<L��l�m|^���k۩1�q��ڪ�K�����	�I�u@!����v\\xg/Y�#_���*�B�wv[Մ^P������OgS�.m��5��.�׮���\�����d��g?����J�Bt����|�e��	p�����M+w�c�=��	�9Z����a(���J���\�֊���pm�0��S]�$�58���9ϳE�R�\5_��7[|��KaL	h�\{�4�qk�&!c����K�~��x�\҅���1��ƙ	�S�Mqi�G���+Ƌ���^���ֶ��2�\�� <����>�d��*{s��+�|������(slf�$#�
\Cu۷��5� t��l!�s��O@��8¤:�G��˼��s�ǜ�3�ϧ%���+V���?����U��-�5-r�wG�7�6N���b}���<��N3d�l� hLkȿ��b��U}�+J_@"H$�����*a@)� �z������]aݏX3�ga��^\�Џ:�q�kv|E�5~:zǯ^ÿ�>�N?|8�i�4ρ�D����88�����w�p����^����r����^fj*��i�$���t��%�PYV����W�Ir
_=�����$kk�oV+�"�\Mѩ��h2�n����/��`&n*�J=���%�\rx���ʪҕ0�j��B�v�X;�b�)�[DZ�M��ϔ7��Xƺz@�s��[�d�5�[{��m}H3�GUi�k+$���07τ=�t�"b�n��t�pF�4$Z'�����,~���O�@�ی(~�W�Px�3.����DI�����xQ%�	�W�<)�R�(/�._���I�ڭ�Z�C�e�$��z={fϞ٠g��yfH��I���#�1���+��4J�r�vw���[z^j��0�V���eF���H��g)��<��LVŵ�C���f�͜�͔	˱�v�ق�U��i lF5�~',z`t0d��d���zf��LBD���i��Pב2���[i��4�ޤ���7�|5��zv�Vc��kBP��9��5S��0e��B�@ck��bc�-`oj���k���q�jJ����Lob8���={�� ����h�����R�4���}�G�̎�zͼ��<`G��ȜDR�����\����O�@�)�'>^��u湡�A�o�u��?����f��0��5�P����Jx)l[��i1�f��iv���P$���H�T��jV����"�'>���/΋H�J�9�]y���<։)ڋ֎�]Cz� G���9�L��wk��e��g�pY�5F���|f5p`�^I�kM~�2�ү�ڛ����,�у?h�g�y?��=��ì�s���E!mҥ���)q�P&)ݯ���d��~%���X�c�}<�^ƥՐ�M���R_�g�3��0�q�>p$�4��Ӝؗ�_3�-�z�g���H����x�y��ʤ,yo%�n��	�r�B5��G���EEp�<�����!4�`<Z�_Y@\�w�W�?�>}x4�xx|�'@Wf������e�0%���o��>�JV�TGl�SN��)�!@��P��a�Q4^:�A��ms�Q����e&��ﬓ���*5�@zb;�p�f't��T���Av�7m��[�'��X�3&�۞�f�$����-_n`��s(��\8ȣ'�]�z�Vyrû����^zN/u�K]�0|Cf��k;`Ǆ5.V���, Pu�|?Ƀ��cw���W���1F�)"��HkģE�c�-�1�x�@��P�Eo�^��.gQo�����
��_�W#?�g�[w���:\�{h��Y-d��hw{�F�ϸBO�.�[de���Wn]��p ��d��4;í,�R�p#1��t����m�^9���n����t����hk / ��"+��-�!��!��h�/3������0"�
���';%j���g'�oq*���M�F`�)�3J{њI{��q�̆.��i�bxG�f�Q�)�R�'���O�${�{�	16my��IGzX7��3�!ڊ�.�FA��0�O��K!�Hc2w�
 �$�;	E�2M�y.'��z��G�GCjci/$��Y�>������o���C����B\�ߢpc7$ąY��Q����,M2X�U;�Ϩ'v`�htO|�5�Bq�"����jd�� �L�.�mw+�L~;�0���f�w���J'��������v��2�c���W��-:Q���*ܶ��@�v2@�]v M`b-
)�ƇҴ�q�DO�z���w�1"�z
������uW�˚!Y&�t�c������R�_�Ñ=*t~넱_|��I�+��+e��U��x:I]�Jk��"ҘGv�p)����zݘ�����6�I��.�_��o�--�U��Ks1GE`K���׻�V���Q�T���ز���`^�!�<g�+�ڱ�qM�,�a�� ���VN����)���C۳��p�Wz���Pq��3z`t�]7����n>��O�Z���C�ڽ]˚6�\�
�@��@�� ���/���UIU�q�;��Ӈf��e!���
�����:�?�~�D詊��*
�r�j�")�E聖
aô���zp	$z@��[��F����T�6Gg~��"�5��QG����E�+����r.��A��Q���|E��CN�n?n��8��T���+m��0��5Mt[�~)#�3,��e<���h��9zf��pn����:��_�W��G�/d[�(]{���g8�e�T�WEhL�*m�ֺ⹭�OťŌdU��j\6&�:ѿ1&�2Z|��h��AM��ʸ ��3�\�C���O߽�(
�mW����E���a6.)�܎���
ǰ��IQ��"\��A��Ɠ��8�.�h�����g�. #��t!��tA�.��4�g �2���]��{=��T`%��2�9�>�� ~@KD3��T��3*l 6q$~��gyY�(�v�N�]Sϓ��A�缠�L�`n+���y`/u��r'u��V�+�}W?/+��iW�}��z�]�Y�˱J�D ��T�>�}���`��fJ��՜x���={�[�ic��݇؁�����E����{�X���/(~w���'�>ڼ�QZ�˗k��"�2���xe����M'��r�Y4%� P���Vr��(f���i�ݾơ���,@8:�O�������I?�~7�]l����sN:��?�= ���;���]�ju�yU�h7v��q�;����#s��A�^����v����	�r0�2J�*,gq�qP��uЇ���!�������Bi�O�.<;���%�%4A���- �  S���ElD"S��u���M��#�����P�oJC�[l��-~���}��s���F(t�$�vz�k�x@GAT���HD)���\���<1����?V=`������]�����õ�^n���y�Z����A�a�$�M|��׆��6hP�?Z7>��@;�_?�\s��_5ԛg�O������u� e�-��YF_t_�ac���`c�x�J"w�U��i�ܺhn-�l���;�G���-h	_���*"�2�ɺ�F�ǋ9���:�����A��f�\�	8����xv9y�V��֋�y+K~3'�����	���-��0m�v���wY�S�����2�!�o�WW�����ܟ�gs���O�����ee3[`�>|�N�y���_����{^'�Ƣ�ZW�Qߢ�ʦ��;irP���4�Ͻ�^�.LKe��;O �wL��x�J�h�dn�	J��|P��ƞ����\87S���gI�����*"S�>/i�'i%���y��-=p݉J�?D���@P����I~�~�v�������}��陎#��Rn�g����?@����x3�!3L!Z��X�ץ�NTҵ|Q��g�O&\	ERe�^�3餴 ���*��@^�%z� �� ���_M὿�`�*� ���6!�5ao�TU��L��S��v���������q[S���4��@?�天5��q$��Q���=��^��"��CQ��ɇ,Π�*{��xVI�0<DR�0Y>2��-[���ז�\��F`�`��[�.s��p�� C>G��(1n��?.bwC����cE ������>TiX/�.���d۬����6�x�A�OmD8��y� H���seIM"@�8I1��?h?*C�`������"3P�'���Ƕ�9^y�[̳��fD�8��U���9�s}���|L ��YgiA2�S��S����	!P����f�E6��7`�0�4������dBKֈ�u�~�����q ��+�����Eq�8���wK�W㇜�ט#\�W iM���������t={蹯n�V�2*�V�8�*�ʎeΒRp{p\mύ]�sӮO�Ki��w��=v��no}����!����a�:�s}u��\FmD?χ͒���w�P��      }      x��[Ms�F�=W��:�=j4�?|YC$ņ�_P�X���jMU8 �����Þ���9�����e �����a[ U����|�2�d��qȣ��(YF��lq���!{�1]w�
tݰز(e^0���cY��<�<��i���s���Ζ��۴,x<
���{3�?�I�f�L��3�ww�h2"��i<Ԙe8���46.�Z����C�D���C%8ę���-�G�k���;�my�גC�4/xx��,�����]ݠ��k��R��
~����U�� <��o�+k�I�ݕ!�U����Q
X��L%�Rrގ�eѢ֩�_$�{�͞�#c�ߥ��-_�J�nxxv����֡i��?Ȫ´H�*nhs���#�6��Uw�jҨ��m��\��N�s�-�w�y��D�'W��N�_7}ó �e�N��Ԣ��bA�V��Ƨ�\A����#��,�p�<%a��@T�U�_XXm;�C[���eڛ��;�>�,�prX�2D6sLK��� �m�͞񽚽��j�۹��w�Z-4�@�j-��i,Zrݴ\���~FS�e)��%�p)�J���\[i$~P�+��l���eJ�ŢJd[��l$?
��9��6j��)7p��Od)�@O	��)_�r[��ݷ���p�tf6m��k/h�,V2͊�j/�r*�E����x����vH��0K�{����(a�|����n��`�9Oyg0DKb�BׄN�Z-fQ��A��L���>C��+Ფ:�a�i��+��������-V�z�ӓ]Mװ�7`g(I�xI�l����%#�ߗ�ӃT���^�{ϴUSq  �N�)~�A���n�7�2Z�?�	X���e&i�S�Mɇ2h�-��FU�/0 � &��d=+P�a��/B--�l�CJ	M�M���R�@'A��M/��{���-�iڝ0���Sϖ��ƀcI�����U2�g�elۡm[��-��8��,�(r�îP�9�i�T�*$�"Π4���8���|����q�%�6�SX��-hkVE�RC_���sH}0�/�� H�X��n'sO��l�X�n��w�D��(����Z4i���� i+���f��|]T��g���J@+�V	�-�U^d�t���)�\���Ǻσt�jq�jvj��.�� ����N�~I�>�c�`M����H����B �T,�ǋI�8Sݘ ����� �-����>}S��1��Ɔ5�U���Ib7b'�JYp���&��>F��j+�X��O_*fX�����|����_���~����yFl�w��yn`#+����V�s������g��go4r�K�\�ЄB�^�t6�Ɍ[��uxr�uS�o)ćb+ծ����:%#Nv;A1��B;줽[��_�@�����d�)�`�0�/���Z�+ʭl�?�:o�,¾�;�Sh��-�y�h?k*~�y�f���V$K����)��x:����N̏���D���/e����}���sU-�C�/��	��|��Fอh���Ҫ�싖=W�h#B:J�6� �Xl(_�K�^�ֳ�ۛ��)���amt����i�h�iw|�=_^�g�r.��"Z���?<��o㭺Kd�"� ��*/G,�}Aؑ�� v��E��FV���ً�Z��}�Y3`G��s�v���ӻ�u>�'��$�Pߪ�/������+@|C�P��J0��v��Fg-�b4�Q���*e����������}��A�{�I_�џ��R^� $�
^��ͅ�z+�XM�1��g������o\�P��/���p��N�5���^�[�Eœ��g0V�M�I����W�^� �ud8y���G~���0[]�q��w�D�6-b�p��c�g���T��/9��y�*vh���\�s.��IW^)�EX�f˙�%�1�+�@�z��@��u�1~��;n����Z�H;�h�
�4;ʷ��s q�D�p��Od�|_��pv@#�Z��v;�Ö��Oī��%٢����ꪵ������`EK6�t�~�17�q?0�!�P}S����&�����4���ӈ�������os�@9'*D<sw��9�+*�~9��*��k浃=���Bכ8���= P��׳��ob��P}��h}�5�VrM;qf�U���P���W�e?�$��X�k�����6#�V0`��8�:���T���oDб��ٮɸ�;�Ƣ�x���͈�P�C�L+��=˱�����@F�6��4l�ۯ*��rO��nS��]�!R$��� �����č�`���*ݷ�9>QE���Vg�$I���Z
�I�a�M��\�D� e�ZS��FmS�;�[3~��ek�i���Ԅ���U#rB���Nܨ;S�ǉ�RuG�ZQM
���CF��!Vd����ߡ���+���b��8]8�"n;Knw������Uk�����Fu���NVy皧�qBC���k�PhD��� ��Om ���,��~��6$ш��F���}�r�Q�g3�A�a�|��Q��E��L��jU�H�`2�ơe��:�}������b���އ5����muP[���Ju:RU�h���	j����1@o{=Rj��,��cS��>5y�=`2Lg��4�;S����&���Eڄ��h
�Oẳ� O;"|��ƣ�N��
�o��g��َ�#)t�U��>X�Q��&�����\x0��DVl�{I�E0��^����Z�����P*j�}���>�GI�����~�+�ܣ�/6����h=pP=/@1��|�}���}�n��#ⷛ��MkT��耑C��rу��mR�Q	�6́�Uu�s<�������ܝF���X�K]����Ĭ.f��³��<���C�z�6�Z{L�|������=�b�g�*{�Q��
2�g� W�V)�R�����銺�{��1S�ze�1��\+6�R��Rٸ��o2��;��>���2.�l��_Id����}��'fx���IC�S�Ap��k��(T���|[����0����}�a��(B>��=Fs>���d6��I�l-P���=�7#1م�p�v��d�FuB7�0I�������� �����CO�~g�������"������U��5d��p��@{��Ƿ�{`nV.�"��w	�����?ˬ�?KT������#��P�"�Ϡi�e>���<�����'�Jɐ߂�@8RQ����>刧r��!_�bm�x��KA��W�Oy�\�K3�}f�WTo p���-Ӧ�1�T>�ϴ�}K�c�<�2O��jv�{>�nF�2_y�9
��K���Ǫk��֬����Iӆ��h+������jK���wa�����-'(a��Mg`���:Q�t�g��^W㼥��x9��1нGò���B��P0���k�͎
���^P��fV�p2���P7���,فv�HSU��w]���X�P����hXC���(+��6�C�[��wb��{�ơB�BY��踭,��N��!�K�u�'���33����ǯ�(�U�m�
����p��7Z�g�B�NH�y�]nA�	#����&���H�B���ᩛ0�E0ˡv�sa�TY�}C����|�o	u)ŀ�E0�5l[�;Oy}������r~�/��`>	��2�Q�/�P��Sw��<���d��b�5�N�0y�6jYl�bO�#7�QG ��-5d�$J��)5��9\A6�n�7-`T}��}~{�ڋ�O[���c�m����R5��C�o�R{���*��5.�H+Ꝣ�_=���>H�m���G[�U�p����m6R�@P�&z:�>	uH�$��d�f�*����k:&7d��G�A���*��:�2���)M��N����.�`��E��1M_\��6w���E�CQ��.��a��{��BHS��c�w09�Og�?��q�����:��n�Ʉ5��0Yr}�ņ� �]���.�x}��~�>�g���f\ ������� ����X|}�͖�8��\v}�Ǣ�|6�> �����vSC���`)T�q�ug2��b $  �<�,�_5���!e~�,߾p��_�~ہ���U�s�E��6DU�Eۧ�5�E������t9�q�s�#R���ɴ��2KN�A��?=
���b	 2[�̓jM�ݱL�6�T�J��yn6�6-m���v�dn��eF3ą @�Q��͈��������o�Ǭ�����2{�T�aU�5���7��R�(� ��]+x,i�`�����pE�
��������T%]��7Ⱥ���b7^�������gl�ĬOR���]��d��n
m�jwi�5��_OԵ*����n�E�J(�K�.��D��JՕa��]RD�<�;�-���[��}�l��y��=Z)`0�:^p^Dr���_q��e�9�Z���O7KJ��x a���[���<r_���_]��]@2|��	h��C�%�jx�@� 3�M7b(_�^�𖺄��trl`�ƣ�t4P;�,�x}%��|��k�����R��E��MQ�]���4j�h6�O�qT߃U�B��t��@���xz�B��nj��&�YBM�c��=I����f
vF����~'Qҝ�����୮*�[��q���m\�x�������O��Z�~�F�m��o�\5^�q����+���6<���(Ί���T�zo-	T^��^X����	�':�FU�AyF�qӆR�ez�b���Ѝڀ��X6D���?L3U1��e�#�����ۖ�{��z�Z��>�*Vς�O2�/�Qӊ�9��3݀nSwn�%�n;���a8���[�T��SW��b���ί���5��RM�~��A��5Q?^�i%!z��h0o%��,��W���:|�jM��Y'�%�I~c��"�7<\�
�~\�g�СT�Pc����_<�ڜ�P�>m�P�ѷ}�����]�d�l:�=��$8vk��-��:�� *�Q����O��_�z-��i=���N �iQ�B�SnՁp{��6tG(F�Y-6Qg��\:JO�닼��J]����1�te%��
�XN}�|��_�zR�=����1�-��3ݾ��]�h:�Sw)�G?.F-Z��w�|л�l�(�]U�>�]Yw3��{ ���:�����0��Z�����(��G��7\��}��3_�t��ߦ�G�q�DmM繙(�[�9��Q�4n	�E`�B9܉��9��z��P�J�:�����{���d��7���p�z0��!�,Bh��]�耆n&p���Ԓkr�$,�S�kYJ�A ���ӌ��e��ɦ|r4߳|�Rm�]����%�:R�]�5�TtM=����HՁ�}ٶD�%��6����us�E<V�t�՛��p�����4��NF��w�d<{`�$���?�Gg	vhI�MQH����9?�����b6��;�3u�y�Ð�3l�2��b͆�ؓ:���u��ԅU>��t\��ڲς��Y->�úր5u��l�v��/[����Z����;zgW���l�"m��c���p�ޝ-�(M�l�K4�%򼩺k��D�#�ywJ�ZMb�4�#������qisB�H�i>��o��<�H�f�L�Uw}u�;g��b4�̙�`C��F���%v�n܍��P����������c�w�؝�,/����~�۫�ݯi���*m���6����꜒���=�^���sy �cӶB�|��+�M_T��Bf�w#��B�G�7t�Q�@� Ž�_*ٷ�A:�Sy�ht�\�q�d�]Q�b��1y F}��0U�7�q�6r�)B����܈��
�nf���ب>)��@� �#�`g�8L��*��JDH��'/lB����ˬ�y�ҍR]oɺj�ы���xە����m�1ox��SާB��|d@A� |A^e9gk�jr�ܐ7��A*���p�S7B��"��׽�rK 8��e��鎝yӲ\������r��<�Q(���TY��NRsc�wmԯ�gI5�ΨMKe]��F{G� �������>��O�2\FM_Y_����A���|�Q�Dp|?_h~��ߟ�Oo��?pN�y���9Q���K�Q|e����<���7}������>����������|�޽{���Ko3      �      x��Kw�H�&�V�
[eD��t|O��<I1��W��2ۏo 
R�E��PG��Ŭg����l��@�=��j��32�i�ٵ��������0T����@M�e8�?1�,�k]��m�-Iw���!٤���L�����ڵF�������b9Z��z>��<�`��N���ŻS���&=*������U-��t�Zj9��z>�X٦���˗�
���:�����:���p�P�Ɠp4����6�Rj�N�&��]ڗ��<���N�ܢ�)y�T��G��{��$��'��M�~n����	�&2k����������*P��z=/rD�*/�G�?���"\��p>���k�k�	�s<��+�[�b>���>슕�-�`�=�E���!�����_G��+���� ֍�+V��/�l���5[H�wn���)}o?^��F�e���Ԁ3X_�<cN�.�o�O����k��W<ѷ�9��� +�\q>q�}���P�6]��e?p�^s>��l<R�-W�ƧS��U�c?m4[^ř>���a5�c ���\ٻ�]R�I|:�7p��pW#���F��W��U\,A����O
o1�=��[˟���Bm�@V���v9����kv�I|��ċY���uj�)z�&��6�l~K4%b�A�Z�&�!��]�R7��m�`��.9���G�fZ�$[͂�Z-JY����n��t�s�FGx�$��p���d�����'�M���W���S��1����֦~�͎�p���!�F\5Y\͗��˗E�8�/����H��"��8����	H��l�8O�1��a;DHe_Nl����o�pL�&yO6	F�[�C���`��[>���C�'?'hE�^F�'f�Ȏy1�`���1���2A�Qv�nD�]jS���V=׷u����5�8|X��Q����Vx��ʹ&Έu[��~����4���+���XK�e����^!�Z]~&�Y�K��h�UH�}z�}6+��X��K/�.�{0�r7��� �+���c�%zE�xk̆}�@ �ap�;���@�>�h���˷�vM�Wh�vS��͸��T����_�)W��my�zI���@���[w`�/G(:*��� M������ ��tyӗ��#�����v/��z7����7����a���:�6�ˀ�u�3A6m _�8b�̘}gW_�O�P��Y���\6)����kGL��q>��rj��"���y���G�J� ���!���O����r�!��|��Vƹ�-������M�;h��&�Q�ϊv�d��wωy�V`G���r-N��Pz)��1�J=�e��;*��,��[��C�b��wct��,�BMrKt��֣)�2;�t��v7�M����%�1N����:�YhE>�קAv��V�Ʌ�;°K��%�D��n��_�hY���&Q�&B1��@Ͽ$�.1�����l�������+M�^�m"�\-�zޅO�����y�/[���}�//D�BD��Ǜ�����d���]�ܿ����X�p��~����Ӽ��1���R	�<,W���`�t<� ��A0E�u�"���[b��j.��LO<��-�>�w0�1�3���r�*����8�)^�+޴'o*Q��3�Z��j�J�z�\�j��k\��^×�����:W-��U�~X;^��x���6\�s��/׹5����x�-R�x��\o�Ѿ��`�D���n�\©��M����g�Z�� ��3���ЗD��[S/��ql�L�KMPv���w�o�qI�x�-����{^�;!G��s<�G�C2S�#6���Z��Y 1e��I�XT�Z�Y`bM�U��ks7�`��3�#���OYBCz�x��*��%Cf�������j**?��} 9��ip멗�'�Xcv�	V��t�w#xx0 k��g�����O@uRy侎ǳ�.͌X�f�0X��D��*߄:\�%��@3d��w�S 	:����i=X�ձ~@��FoS�߾儿�wo�I���͌�����K��*ߔN�������J�N�P$�"�6uR�t'FM����hY��C`���FK4�l@��/��S��9�^g	O��-���r?j�M�)���|�a����m�=l2j�p0�A���@�4:��Dkp���Q�"݃1 O �~����h&ô���6�!�U0"���U�q��-^ٷ�����K֗�a��$�o ��ga=���$E�q�|�|%�h��"��S%w���ww���%�d+PƇC��Z9�K6�ǁ�x�@�S���?���X���c���V#u�̀���t�Z�+��%��n�����}���Ϭ(�::��c4�Z�B�ZիX�Z�^�K�M�Wc:��xK��������k�����6�|&�)�$=��zh��U��x��,X�ԙ�I2�J��i-���=%ћ�,G��,�p �(~ϒ�|��r�j�,�`=��%�<��T��D�2S �U�o%GFY�K��#{v�4c-`9?d|�)��"CG������Go/�V�}=�ڎ�w��7���2�]���^׵�$�@�u%D��Q<\�[e�Ľ�c��3�������V��!z5w�#N�r���������E8�͵�|�St8$�!V�a�[r�O�y"��f�u�.�����o�)�C�� 3��J0 �O8���Pn�r�.X<�&��?ŀ����}�v0l�`<w�Sn���ʕu&��ѪR�K�I	���3��2�(J��>�V��3���ā�s��»`�\��U&��w\]ű��r<,`�����%�š7r���t�r?�9��6�s�Ha���������Z����Аn��3���J^�7נo������1Z���H�ʣ�������a���r>�@2���>�ᒅZS�VgP�c&3�	��'��Z��΀��o��1U���|<�μ��Y���<lV^��Nf�v8�..[��q�o��5RhwP�(Bv����=I�!���Qt���w���艰L^r2~��$��%8B���/�Q��f��	���)��3��a~*ֺm�0�<��y`$�����+���ϗ� �Fs����*ނV9d	q��zZgc��w�w��X�z>Q���|�s�xh�y����M���t��x��,z����
�_��E��ԑ�Ip~~Q�-(�7���C�`�%�	����p��ȯ������h�J��o�?���������s�a����$�I�_Cd�O�!h�(��q��N�Uk�R����#�G���W�7�x��+�a�Q/�Z��3���R0%� ?!�T߇�{�{:��a���n��,��~}�ܼ�ݦ�O�9���3�5�_���(���6�lJ��+d�A"���j���A�͍b�� �E&�s$��'La�sR|G���9D�6��A=~���d]?S��߀Kra�8�����&�u�p������[��t�k
�9W7�=G߲���a����
&��ʍ&���	�a}
��x���.��<o6�
v�l�_Gc	yM6��xGh���3Rf-��j 
PK�fӻqv�O>�Ԝ��r���}���v� 3>?ɶ���n\�p�OCo5���J����*q����}��P8���7�ڢ�9JgL�"�Ct�`� ��.G��e�wt�F�ȷ7�w���|1B��4w������1�P�7�qr���7&zJN�7C���h0ǘkEx�z"��F�p��`��%B�Q�����V/��~��g6x��.:����@�J����[�^�^���߱k3��P�ϡ��^���@E��(h#�2�ȏ���H�\�b���ppsk`5�B�rK���p�+V����10xf�ۗ >�X9�Q���o6�0�
W�p^�~�>�O<��g�@������!�i}\�*X�B�.|1�e�\��}�*���B���F�򂝍�
2A�k(�i�S�k�@�ԃ�����7vA�rh���>�(�l��x�R��m(4/^��$k=����ج    &*��x& HP��)V�
q�0������8����|0_U�?}�~�3q>
OZ+�&��G����\��	����gt�y�����4^���R@���=ِ�����2����3f�Oj���D���M����|������(�nK-W�����ڰ~!��s�/��T��w���V��"���@�`��s���'� ���U?�Þ`��������$�G5�p� 1x��8�k	*�9>�9��-�D1���b���D��)�}��c~��� �}�6����v���0�Ӣ�Vi�
�ot���ܺ��#z���"�8U�6=��R�v&�8X�B�Ğ��>�N�A��pF��~l�c��ȤpM����1��`�͚����} ��ub��]��~�^첵X�����.!b�m򜯍�8a�&;P��F{�,K���ލK6X�0
��a��e�(.Sf�wq����qB�Ϸ}��Rsq`mAG�B��u��|#���]kj�G���p�F�+�8)"K�59�h���m�T���eΠ���-��%U!]��(�a�^Ο"�+PT�w���_�[��e�H]����y�Q��B%~x�є�fΥ��jr����F�:愎50
{x3��]�^��&�N����E�5�V�"b��;�I��C���j��IN�<�'�����`D'�̬�Ի,����S|��A�@C��-^����K�d���	��w��9��>�U�S��	��!6rB���Ug�Y�1hV\>r[��#~�٣�Я5�������TސhO~͖u>4鼦��F�-a�̐"��Ѕf��LZ���k�ڴ���(j�E��Eu>�ٔz1������Z]�P$nU�f��N��.�����M�/	:>ao7���4�:��| �
Xis#GWun�"�f9*��^g�����>e�Ćy.�)`�u摶���Ls,M�0���=��@M�b�DĨ�Fm2�K�F����A�b+�
�Y�-�-WJ��-�����'��ܱ>&�d��?���ٯI|�7���׈&<7�wz���
�jrހ5X͵��OAxP�h>l����4�$�9�c����W�B�Q��s�i��{|8��5���K��Z��6i])!aY�yO"f^��T>m�tM�f��`"��ں�	���t;o�Tm��ɠ����#:W�~����pˊ;����5�8Pz�(<���?,����mRYo�')Dޚ�� ]6&LY�j�$}�w1l��;�� H��Y��8�qn�f��"dYI
G*����Y&����v.ׅ~�|�a#�"Z
��|ȋL����%q�
������[|<f�{��ڝS�x0kQ]�l���|:}�\��f�뵫�P��tm]�ł�_[�S�Ef�80[-
td�I�c*�o�K�l>��%�=�<��j�VNQS�/�}�ʶ_C���*�1\ؔ��h�1�'jL��� �Q�����5xy�b�q���d Ǔp��G�K��J�^�P`���,����j�@�� Wԑ�(p���J�|Ͽ�����+CƬʊm�W��߲��2�.����F������V�:M�J(��_�J�|�ؠ�k������+4:�&+zB&�j���[>����N�S�=x��:�ۤ�L�0��:(�:ʪ�	����:&���(##�61	W�*Ͼ�j�5�ހ+-Ê���>�{%��+"`����7��9�G��*\�5�_B����#0�N�-�J�<s�UF���j�-��}3�f��A�/{L����Ϲv]Ɋr��.�����@��z勣�۾�����%X����u�
v�6�ѓ<�� �Lq�ު(*����X�\Tz~fxCY
��}T�����Y�F�d_KC���R��)Ѫ=�#Y�5�9��x!��y�|��9����b��t��n�dxiqG$�%�l1j��Y��7`�%;��aV^��쑪yD�	
`��z�eI�IOqt:�`��ޙk����U��ƙŵ&�EE��5�}�o9r���*��:}��쀖z�n�5�_�I��l����=X�(���U �8�DG�4B6�vB���)��HJ�SIm�f{W�ȗb���(�2��X{��ھ�%�9�5�n�	2�jp/ѕA��h��\;���r��6�����a�=���q�Z�@�m!�0�i~H�!b��L"�������E��ā~�3N�ň��kC�����Ʀ����)���I��p� �DE���uF�AF�9~Iv	�]�|���s�g͂�����^cFϤmT���4�ܰ��,V|-�DP��E�8Ġ�t��%A�K��a���K$���J��O5M��I�r��n]�!���c��ҿ�0zp!���0)���n�n����A�!��A�2�v�h���$'��]N�Ք��^��Z�;Y��MTy��y[N���d���z��D���_G�LNC����)�b+:�ZK%.H�Y!��������i|���AQ�=�u�^�톄_��m���&8��[
4:��ON�*�\�>γ`��9&�E'�/��+�{M���и�2���m���J�˕��W��+�Kk�|��;g�5[K�_/�kqb溟z,w�`��R��&V��y����f&��t-�q?���:�Ś=���~�b����-т-���A��|� q��h��R�Ccp�����`��;D!+���x�g�E�@�鏬n1οZVmM��tz�甭)C�X����R���n9 �y?��r5�������9�I�8r�z���A�����R����)��v�'�<�	�S�%h5/a<�'����ڶ�� �?����p�*�tMgK���\���Ҩ�}�j�&�2.e�������34l%8��dU�Z�]�e�7e㕛����ƭ� t�vTxN@ei��ˁ�c�ߣ����-ͺ˱�C��O	e��)l��`�Zn�w�x����*�1��.�Y��²Б~�A�阾����Z�Q��
-%ds��j]pz�#�o�s5[�x-�U��]�?��>����Z�rBw����3=+����f-�o��^Q����*[̞+���MЮ��/#���*pБ������w�V��Y��#fO��ag��S�N��^��*�T���OkI��I�s��Y�iCrA:������0�@qiN;l���"]ksj�`%u���{m�-�-:&��v�M@����QD�w��+i��j�����&&pl۶nz��)�O��v�Ąd7��'�V�C�ǇR� w��fC޳{��z��ì��u�^�э-�h�i�KQVd�)��Iѯj��	���:=� �G� ���58eE��8�3	@� n�T���Krx�X��#R&�+�_�U�-���μ�eobo�A�1K�b�O���V̄W�&�cw3gۤ|O��Msx���{|��k`�K����u�?
���.'jj���.�݃�O�wHb��Izx���)��G�~��E�}g�Y�u�C}���/D�T��Ww���xT�]���.��<���9��0�g�`�I��a��4z���
F:ܭ�*��f��?�n'~�
w��bl����0)^k�ĸ��YElI�mJ�ʐ����R9�ߑ�0LH+:��?�G���dZeDYXk�k�i�1�g[�e��~�P��f��?D�P��8�mw2l�s����Fnv��HF��|_��[�L9�����eF\���r��g�u�Yc�L4���}�\/&�Z=����M��&��ǩ�z�i�l~�©�Wl�.r�P`������Y����c�J�֓� bȅ_����r����T�;Q����T�q@2�Q$x-ߌG�s��N��M��k��v��H6.;10j�Z	Ȅ�3=���,�49ݲ�.X�����.��m����?��ĺ�!����>ުa�dYZ��|�c���_��X.c�'���x��Y��2Mw��8&͏�[�}���>#+1�%�M2z�1o]�0�տ���2n�qv:�����$R�hC���!�]�l��a
ڡ     ����x�5�- :+�����	�=��^��c}p��l�����Fa���-kqo�\*����J@2�����	/.f����6'|LUY81�em���˶�w�� �����.e�m%*���ܞ_��d�g�n�R�tM/Y�c���x��`ڜ���S�nv��v\qɔYܒks1��z����[@e������*�&�X���Y�X�$��7)?�E�Xr�e����|aq�F�ݐ�sl��~�h���L�h�'�խb�Vڃ���:.��=-�O�S]�%[0.�78}�c�ɩHYK�.X|��ֲ�;"DH��oq���_��f�J�/E���5���=|�D��^:`�с'��;��d��-y����	L6��0ʼ{K6>�����B,U5r��i['�t�+G��=�����"�L�D'XP��_JBRjl����э2yňG�\rϢP�Y~[��{��t���עb�wI46tǮ*߭͹�{��n��+�t��iۜ\���w%e��8ﴋ��Ò�p���=h6��g�>a�ݒ�t3`��K��G���T��@.�wܧ8r�UϪ�.�߼p9M�����{�8UU�!�<#Q,5/��%nE6�Ú \9^�n��k('I����VRk�n��>s^#^�����0�����q�el���0&@s\�(���q��a!�+�s�K9�P��(f]E�	�X��l����S�Г�Yn!ڦH[�5_��]�o��V�d�Q�7>�2Ǹ�p�8عf�����jj8�'ڔi���d��{^Xj w���ଙ�+�#�r򶎨�`�ȱT��n�B�4��B�A+b�8�miz>_�(J=| (��mE����!�[�.@�/����ժ�D�'�e$�sV��W�n=����EWZ�r�U{��n��pW!9�N�ΨVdBD�@{M���c����	e|�.-hIP�E��߶^�j�Z��$���_�(Wr.WcK$�~J�ٯBq��#I��=K�X�;��K=+�Ϲ9�V�4w2��d��WѷQp�7i�.ƽQ��e!��ޞ��x�ĖLK�	,����Ʋ�)��]�P�զȚ�yݚi�kϩ+���#q�du��M�q�ˮ:Gp�������%A�jjfN���l<X�xG�!z�a[ �n\M�h�Hr�S�c�G.-�F��-��6=�F2W��u�p�B�p���9䐣�"?G�}ˡ��9rx�&���9b��Z����N��XL:�C�f���:���94��\�}^���!ٽ��ox�l^�T��FDNi�Q|�[u������f@	咮E���5%�����@�J2���d>r�S��۬H��㎐��Z�'��Jt�����.�(DIi5?���mm�?'`�OZWY�g��t�ȼGJp�
. 6��p��*\��T�<Sph�v3�+x��=�ѿ%Qɛq`�l���l</ZL�**�f�����X���i-V6QS��bVL[H���w=�w� H췄!�bcP
2}�j(�TY�����2&�w��J1�ڽ(ws�hR��D��jG�H8�4z�'�w�f��^l#�lZ��*�kQ�8h����HH����1��J wŕ��ˀDa�&��dt���i����pA�EQA.��{�w����:�x��!��G�=�֕�*���6���_���Y�!�˓�uĳ�Vמ��B�>�TR�a��'7��X7`�z��Ǐ��9���r�p�q���#���S�-���)ƹ�ٜ����~D���`�k� ?��ݫ��do^>�S|��B��c���Ś:�e"���w�Fw��t�&9��	���L7����ca�Wsq	�������~J+�_"xY<�1ǂ����ب�y���+���[=�l+�u���<�%�ÂR����N~)���[��[���L�7�!����Ϙ�Z�����_��C��tD_�q&�r���7�6�e줺�T�\�L�,�*g ��ǐ�o���T}A��x��8�u�i��
|�3ū��>A�ou�:$��Q9�k������&�=��ƚ��%��^Q�|�����=�N���ԭ��~ら���K_��-1^#�kz���@��$gxd*�R(�a���|��c�v���K��b�ҝC�#�Q��`dP�nX�!�è(�D�	ţ��^p���{P�ˑ��_Ȯ\,�cK(��$#8��]^�X����Ff�+:U��h8r�\!�;��U��U�@�l��CF�]�����Pa!��DSs0,�г`����:�sw�]Y�lr¨�CK���'�\S�CYSE����j6^�@�,K {���i'۬�< �ݞ����(�A�UXc%�|Bt&�݉��Y��<���S
�%鵕�����kSp�)n�>1_�QR$�G����<u����܂���HG����7͍.Bjh�J1��##�"�1�:��(M�D	�
�b3m���mL衦�K��pJ�VE�_��Cu��p P�q�G@G���/쑟k�\H�5~n-��8Lq��aq����z�2\���&��%yt8�b�A7W.����ǚ���>��2ֱt�E��*�Q�G�C+�|�Z6�}EeqS��C7��B1vl<��C��tqf�AMb9�����q�Zs����Ҧ����Q���`5q���Ivs� ��9~=�FY�[������5v�`�����x���t-�Qh!u���
1{	�s���k�^�1M���<�e{N�9�D����L���\��9N��W�Q�	<���rj��sh��7�Cq��c���̕�j��Dя-�JoU3�K�cX�5K�ݗ�>)h�Op��OJ2��ép�S�z*��&%��An����ܢ�]d�=8bh��2��䀜ŗ�}#�t��2�ɵ��*߄_����D�]�K���a���H��!���6ݙ&��V~���P�YE����7h�B*���ʊHH������o���ak��֯.���ϵK_�%�j3��r����Fd>Z���/�0]͸��)K�"��k�ʣu�����~�ˉ����ø ��M�?�ĩ���E)�'5i�C�}�Ry�y��{͞-Xޢ?��Q�F�g�sb��쫕l��4��=-����Hπ=�_�v�8,�r^�ٶ�6���k^_����"���j���V�h���j�;�}%��:��4
�ؒ PQ4�z*�E�=��dn���F����� ~���]�����}>�Bރn�Bץ�2��ɚ�9��WlD4k�ِ�yJ*�&�X��~_�;:ꓓ�a����Nߞ���F�Kw?�=Ա�M��x�1�����bo_�^���G��c��ܚ)p����y9�~�ƍ �dpm�^۬ZNܙy5�{v�E�❌�-y��mέ� ��P�?�Y`(�\�����
����}�������c������u8*�O�k�P�m�i����iO�N݌?-9�~�=X��H��G��E,Ҥ�A��$aGk�}Z��,�Z�R {v�4U��t=��w-��iE��%#jg�p���v��[A��jĚi���h�K���I:��`��|	 V�cq8w'���~}���z��ڔQ-J�h�l���7��Ƴ�����{2�s�]���ѼP=d���K*���Xq//����	C|SGbJH$�F����O��Kv���q�V;����k-.�a��"���i��-�
h3���'<v/��|���Z¢�U�Lp2��Y;2�����>���oO	���� �`?w�	��������W��x�=T�������t�km%��4Ԁr�ܚ ��c�0Э���l���J�����x2��w#��#8å9��!~K^�	V��i��6[��I[�i�_���m�ۧx�� V~6.����Oq �x6�/o��#��G�4��E���4D�{AՒ��⪸n�JS����7[��9
<H&��Je���`�����<y���q	�A�� A����G�C�Sv{-m]â#�n�����!�I��V_���g)�\���=��tw6�J���X�_~�m42M�[��:U��u���U�Yc �H�L�*�x����� b�\?��    /���k6;ԉ}4�����S��澒�QK���W�룼��qF��7�˴�)�
�|K��b��K[�r�`.�ە�
0̞�G�R������VS���Hx����*\9�~%
V�����?��7��}ga�jA��va�+b�ob���F�a*̆����X+.o}p�tO�S�,�8���)�(�,��"�#:��w�|x؇J��t�}�=G���L�y�`#U�-8\L=vq�9KS,3��%,��\Q�U:X�,�����K|�__���v��9�� �����ձ���RQ���<.�	���7[ �{D`a�$@ݏ��;�J�����l�$�7���3��.m���tKve�il4���K%@a��s��S�Ty��#Qf�[��P��a}_b���DSx/�<`�L���/%y ��_�G �N���_���$:�4��Y����)�g��dO�{.�NJ"�:�t�HK�u�tVs2r��v(>v��bG`^��wu�ĽD���o����&��E�e�=�T4��2����ݻӔL�h.�w�
�H��8W��-4�tn��-,�^����Sǣ�Y�w�/�>?�+�ɊT���J�e�Ц�*��YS/S�֌�Fj
do+�Znb�GY��ϒ֪�gQ?�7�9K8?�rV����v
�H�2+O��8��`cɲSz '^zGr�as�GzF���`ۛ��Pl���]QS$$!�	Z��G%9@2@��Ez���+��gp��z��b�a@B劄�6'��%(@�X�qb�+g�`��~��0�m�3���^�6�un|Z�=��+|�?��0o���c�O$Nj������	�(�-9��}�Δ��EB���)��'�K�B0l�rH���]h��ba��rE`�w*��^T�ETc��Kp���(B���v�-�v*�v�}�n�[���q���u�Dy<�]ԁ�+9����.+����ID�g/�_�e��A�!��I)��b͋�������l�`��j����^��V�7�n%��r��",����n�0s�9\�o
P\̥`��0�I�)v�9��[hG�v�m��:��G��j�v�)z�7��-� <���9��/�r��<o�bWs�H�J�)5i�Y�U~)	+����t��$�S\�*��]q;Шǎ	���o�>���'̰P�)ܺ��9bк�=��a��SI�0�N�D9ky�	�f�"��n5݊�!Aܹ���}B��0����k�R�D���l�4�gw�4����-&��(� �k�z���ď6��R�|�A��x�P�qҺ�I�Mu��97C��OY�� ��e���y���r�d�`I
F�\8+�
�a*�	�7)��DE!��~�wP�gm>����p��M��j>��ս<��fcbl��
��\�.�R��˼Q�����F�l~�:�w��j�����@P�D�a�#h�C��0�J� ����y��eT��`F�Q/{�3`,K�*Ƒ%[0%?7ڟ`��*~�G���
��/S�x�]���!�=#��ƥ�$�C,��p�Ɨt��I*lg�L?������y�[��9s�%�=�P+��&8�j��`>_�D� ӡ�ك��qJ�0�j޽�]���Eqh'WZ��z���X�s�sM��!��˅�rP�p�t&�U����D��Wg�3�	L5�/�΢�ǂ�*��+�L�(nTa[C��Q;%�ߺ���
�4z2�O�\0�_��E�EӲ��qr�:b��e�ȘᄅE<F�q�'�<?�x=�>L(x��a�l�Yx�<�X�*�Db�u4U븍`�9��Se���01�[b#��2�*�i(<�4�&X���x�#��e��̒���u�%�8��tg�~��S�J.|����2#N�ˋ���ɮ�J�g)��]�9�ȓj�^�󫄻�c���|*�$=�2�KS�H+�U�YV�dQ��6[������.p�̱�Ӓ�Jrv�ӧ>n��꩷EY���y���"�Cz��~=Ψ���4��B��t��W'Hc�(��X����ʜF�:�a`�nU�x���B/ʱ�m�����W���L����G�9��73�m`@�m�o�����1���r�M�K<b)V9�qr��K�L�"��90bG�#�MW���9�<Z$.,b�9���	�!������ �����16��/�Ԑ	�S�=U��y��tK�(5p��.c�V�D���v0��F ��9fwz��Zz�ɫ����1
�02�!P��o���G��b-��*�񄏌 _��wϭ$�r�@����i���
���Neh+ ���t6*��7up����d�T��y��,�c�:���$PbQ����+����� V��1����*3�Z5�69��MI��$�Z8�����L�d��ɜ��R:Tb�3���銴�E^m:-1u9��0*���v�8�Ҫ�^	sc�t��,|s��{#�A䨉rH]��)��]�%ڙ�Z�瀨c�}���t}��P/�aG��r?���7\Ň7x��%L��F�vI���H����U:�:˻U7�L@�w�q�ݾ)�oy92RXUԒ�f�Ip��p^є��F��ri �m���O�;,2�r��R�aپ]����[�af�*z`:[�N�%����I�1�pi�e#�UF���VI#��^���\R�{	@(�b+vEqr���aK=Lq�E�T�!`��V�(��� ��f�"* �+�����K�P5 U�#\WU^�v�,�/|�G��v����>h{�R�n�B
cg�[2�7`�_����Om���Ez���O���Âĭ��92,����z�w4�2$E�7�ۡPZl9���!�Y[)bq�J��!4��h"�g �
�}tƔ��`��8�O��A�*���aSě��+|O��%�ߩ�rFV�q�C��H7��
+'*�Rh���vѳMyV�����'tq?t�=��B�TUU�q���)]�2���n�ʇ�3<���I�uT�e|���,��\$�����`e�}�˜\���&챩$^�q�"f�2ueW�����Տ)��.�hݦM����S��q��_M��0D���Ϣ���S��M�O�f"7`F�)�|>#�װ}ށ��&C0�F�$���HF�+�W���鎦H��}�J&y�r��1�r��E�2(d
�y
q��D���R��p���i$�*���,n�V��åC�}ǧ-�Zaj%�]���{�	Vr��٠V�p�b4�pa,!xS4^"2��J��7��=9r���������_��?ȿm���hz�I�"��g\��Ke7m�l;�����p���E��dL���L�N[���Ҫ^����]$ӓ�>8�a�"�� �P&'���A7*b��dxibFs%	��!P�?�h,
VCO��T"(�~��!�kY?��� w%a'����B�/}�æ���*��_-�fd�k��xg}���~�Y�[�W&<rK�zָF{������Em4�2���۱-�|8��ı�
���/�o�S㊝����8!����q�T�Y�Q`�F�{�uCE�~���&.Î��e3��6�Q�/��3��+�g�
%�Ȼ�oS��qh�O�[�߹���}Ao@݉s�v�w��)( �ܚM!v+&�tK�7�qU2�nNV|#�3#V� %���)�U�L/6�n9~�M��6����"�rb�Z�2����'&I���7=���5�w�[��WB��C��;��'�dV����K�Ϻ�ӧ�).���:�<�T�L� �}�;��^���l~_<$cH"֞,������@���om��;��<�͡*�FA�������2�[��L��)�un�,��N�Wk�:�f�Wku��ߪad���v^��%�%��5x2����W8�;U2΀��~S������:��XV0D�b�밺ź
Ԗנ�a�.Z�}�����q���I���Hf��씟�Q$���f���\�u��t[4��L_{��y�-���t��_�t��d���ݧ{��O��"x�$*x�Y�=�=گ�'    i	[�,yiQ>h��+r@v7%If-I�9�0�|����dK+Q�z�����Ѝ8E_w�?��������7�`���:��G���P'��A��8Ut��<4C8�y�x{�
��/��7���|\:�9���rp�p��NC���oΩ�{0�G�i�ķ�iG��ɾ
H;��V��)P�T�a��f@2�����8�粓,ix~�^�M��KUҗb�����f�q8^�=�:$aZ��Cz-=]��P��	�FSo�_u����t{���Y(��WF�Y�[�G*�18R��(�����Pw '�U�	�o���I���e�T����rk`�֞h6��j�D�*C,�;N���tc���L*�VSvR���) �>p'���_��Z�́е0���aT_,�@�p��b\~�})�(��E�<T�,��mc(n�y&�a�x�fN$PQ�S|�Y�Ƿ�4	����)�jF���9@8�"�p�xN�E�'�zH��M��3$	�X���xYk]l_���jߩ)��ns����K��ѵo�TB��t�\\!���?���j��kE��E�����P�`6����T����f�S8�'���|*���9������>�"����<
B�r���ve���/�ŧ]��,�H��;4-���.ު��#JRz�םF�p����S�u�u�o�{Qآ��+0*�}��-��Pq�����t�ƓL{��r��B�//��d�����&��zB��>!��v|�16�lMB�IE|L;y��ޢ$��}����� ^p�3Ev����n��*�'�CQ�!��%�:Z�6%�u���_�)������k�A���8$�:ݒ9ZVx�^�ҡ{Z����2G����00���_boCϬ���c��p����,2S
�c:=��'? !+jUౚ��i�6:?G�۠L�s�<�*�B}��
}m.2P�n�\s�LY���/ٺJ��F��E��؞�t�!�7W�]-S(t��z`�5���e�I�~,���=�b�g��b�|�dmE i�����ԟU�����L��@�-�/���Ϥ�0@q ��#�.�h��p(��L\K�ײ��}�Rh���U�w�[��E���Љ�;9��K��f˔��"0$}>Ƕ���~��A�B�"Zq��hq����@�}�]��1�8%�>�ȈPVf;S�&bx�n�uv���Ec��Sb�-e�����)���qb=��@Z�H��5Rه�b��j�	�>���ȦE[���R����}�`���Шʊ}�X�u���ىq��ˈ��X��~Ij���PeY�S�@UdMu�bJ�$HL����$#BM'�D����ie/�,V�O�~j��O�:�'zD[?��j�j��s� *�&��4�jS܂�8c*J�(1G�1�j-��ZY��t�Z����!/����`�Zyγm):��t&@ �~�*HP	��
�C��O�O�OmCTLi|,�v�0y��h�8B" g�κ�$�%����:s㸰i���7K/��L(%�,%�����#�U�v.R�PU�A6�ܠ�k��|:]�5A��U��V~���&t�b>��h��C��K�"���hd�T붥~&� ��_L7i#����=��`����౨��Y%ISe�I"��O��.�4e�Sj>��NC߳��.`��.=Y[7LoRg�G�����2$���Zh��B;��`_1�
���|2|���d����U��]N{�_�:b����e�'fC���M@��pV�n�c �t�(pl���Z��&�̂O'<Sb����g-+f�a8z̦%�V9DD"����Z-�QKs�N`Y����F�g��4~��u���FF��CZ[4�	ȅ�Va�������p��C��*�e����%���F����䤸�t�'ҟ܍f�!<�v���:L���nk�ЫB�F�S,jJyG�r��������#�7dk�.�c�h��0��r�j�(��	ȑ�k��@�R"=�e��lҷ����؆�@����׋�0���hv�pn �-��ءX&��}�AҼ����L��<�S_�T�'N�1=���Zt�5��b�1�AD��r*��fb)Ņ�z!���/S��`j�1�QOgz�&����
��eM-�Z̗K��	.��a���rœF�#xdGo��4p�˂-����j���\˼�,[!%���c��pt���f�;��XV��B��V�#x\����3J�'��'�W���B��\��])e#��"5��w٧�P֎��h(�^�S�R��6���<P��FK�2a�1����{>���B��leq��>e������b��{v����̐\
O�}%��.i�i>��'������T�l^�5$� ��=�e!�U�Uշt��}��3��֍�C����SJ3=RO4���/>�;����"����m�[����Y"~��|�t�� ͮ�F�C���]tt�qdk9Zcֽ�E�sD������p:��c�3D�� >E����U�86�ZBR���p�"��:�Ǻ����%��|ag���)h�8?=a@���gq�5�PbQ<��BR�fKat\����9I3br3�s������5	�L8h�q�:����_Ї��O�0Xun��{��U1��us��[]��Mp�CR��Y'ld��*p:v̏�d]n"*�#J`L����c�	�ޥ#�5��o��_���@QP �������{6ɑD�!y>�dyCq���}|.z��L'�ce�@�6s���z9�_�"_�Hu��`�z`��VYm,���i��s�1H���Y�n�E)W�7�Uš�ł|�d�:���;4(3Rk=n�m4
W��8��XFk�5�O��4�Cjpl�V�!�}dY|v�my��q%/�����`�O:#�g2��Z/�
�π/�hqC��4H0��k)`��*%�&p6Ң�ż���0g�Y8�m���X3�:��Ѐg)cƐuy����o`�@����w��J�B����Q��[�U8���h�9�g,�++��N����p3-��ZO(��e��N��`F�!d�gV�M!B����=D�@�m����'��ߐIU�~��b�S��������*f�%���ܛ<r���_k8����d�Z��~&�/�>���R�f�.)�Ԫ���_���C����\WtH7���w�?���������n�&�lډ���[a�fG9v��yy�p���A�A/M�<�X����٧�G�pVW&�l.�꓌�Dh���5=�u@��P�'<���Q��
���[-d���6 �H8����`�9L�FT��$�[Wm�/z}�{�f��r �\F-늆���f1���F'� �S�X�N;TԈ;M���0��CB]?�tƳ~FS^�2��$=��,l�Ml6��K�z.�H@B���j��k�{���y>Z�m~|��&z�r�P �������f�c���7ʛ�5��j�U�l�m��*�=��ҹ#��ލ��V�dH-�U��[Ԃ�W���D.N.ē�MM�Z�ײ�^ǈ��n�j��'n���7�2���v �� ��g�����ԭ��ڿ��A�׺�'�_�Wi׬BN�D�3Gm.���Y Ax�	VH]IЁ>���L�쇔���.�d4���<X���~5E���{*QE�
 �I����2�r]���0�f8"|$\��ê�M��/ZD�?G���P�vo���Q�)x�`Z�' �.	�n�KD�))����������O��茲�O�\���zƉ�}����!�>��R����47��7�UxߩK�\��&�b�w�`��[=.�ύ�m���PkYw$��M�"�D�ӛv����WW�u�Ȇو{7�����ch�%"�Sߚ�+:%(�� i�<�%�̷4:Q𴈾����G9�.�1�MIa:�`Ԏ{V3��#�=r��\)&��E.W�"��7jvS��9h�MP�dB�NԤ
��b#������^.!u� ��?�q�`Ѱ���H����)�i���M#Ǉ0\�{%�,�'c�[.��)�q    �����U��>�'ɣ��/�q���~q����|nP�k����g*�ڨ�j1Z��1�N�S%
�R%��{x7P�bw�Zѧ�����gR��+O�\�\[�	�h��k���)29^��}�0%F�n�����[��Pqm(�E�97�i�1
�o��d��Z�4�L^��&���.<<>�+��Ggt�Crp�2�l�����r��ߒc��
�r�`$�V�}����q�KeۥH�<��y�����
y%��18!��t�v.������slp��Y`S�zIvl�d�Ӣi����U�K�S�C5?�?���}Q�2�]�L���&�(�-�V�X�ʞ2*���D��[�rH^ӌ�\��Ul�g�Ʌ��
C�k9q�J|S�6�]�Dd,��<�j��F@r��
�P.�G��;�!3jb�u+}�o�6�}r~Kt�!��S�|��c�+4XC��K������LI��2�Aw̆�F�gi;�Z{v9
�d��"��NG.�o6�%Qv��S��ԓ~���òرJ�V�ƿ�:�)���%���c��؃�=E��z����PGW��(G�q\YǒYX�u�];��h�>�o�K�4%[�����q^�d�z?�VY�g���UX7OI��=��۝������^�j�Aw�������Zy>�=�~��z���nqI�-k��O����Tm�-���	skB�k2���w�-���MF-�k/;��t��Jv�r��z�sGޝ��4Y$
,�F�1�zF�1R���k�(��D�2cǬ�Ŕ�fOX͐F�����[n]��:9��������{����c�4�W��XU`�P���1��
��w�V��W����8 �q�d��Ɖ�%=��}��H�lL����EL��hD�'�<��9ੈ)|�	7�e�I�VeyE?�w��q�۸��G,ߣ̝ܧ~�CG��!���Me7�6������exx�����Gi��7��b����a(��]z�D�6x:/	lS	6�n:S܆�F���"df�i/���A�k����j�=,|�~+:��/��_!Z�OTx�f�p�z�q�ۀ�a�o|�bHb;�8��҃�}�{��4��&����S{��M�ǯ̒ɷ��{�����NC��;z_E��ٓfli�֓lf�ݿ�]�����d�[��}�j��O��^��Ǔ̶�>������sJ��vag�����-�������Ȓ|3��_rL��:t/E��05V�5�_^�J&N���qf��-�g���M�;p����/��H	OGY��p�X�RI�3=ˊ���i�d}�m�{��X���T�o���>�J#�(�W[p�p�)��f=c�������{e�#��4����2� �)�b@Q&�3۝��3���� �,2������:��`4�g�>��k��Ǎ;Z��݉2p<��a���t�Z������s&{G	�g�~�[^l����Gɚy�?珣�@�V��!�c�%'�o})�~�K�>�v4E���>��н���o���V����7�ه!��qsq5��WxZ�۬Vխ���*�^e��xu�ȅ��d1%��4@�=Q�W���JO�\���6d�$������1s���d��j_{��m�%A7��PSx�g�X�L�I��؛;}=s-��ީgY~^�JjKeڑ�^k�|�J�����z^�=�$x�pbAi���h�Ih�c�"X!��/'��t5���E%�&&t��Y+&��d��.�d�r rΦbL�7�w`����hcߟ1s�f���j��h�������Z�+b�_L�U땱�0�u[*�E�VZ�Z�%�LQU�����_�"�9���*U|_u�{���Xޕ�:�CMN�$����D��ݝB�E�#?��V9VE�ػ�c�0�A��!�D~�#yN3f�[��U�\N��Q�3����eCp���E�����m�-:�"�*w٦������sq�-���l�Glc�;��GJ���oh?{-����v8�ޫ��x��mb=c$=u�ҝ}��H���D��ם�_�Ϫ�������RFi�E�iS���0DW��z�FS2x���T�N.[;��r��~Q��oYݑ���CBU�*KR��y-O���]�{�~��l���]��Ռ,�d'��%�?Q�#��I?��k���db&�1*�̏-�!�V���w�N>Q;�O�����8��ǂ֠6��j����7�ɦ?R3���S��L�?n$yL�u�u�Cƈ���x,���u�(��M����g^c�]@.5hbT����/���|Ul�n��g�1v��`o/����󝕳5GYl��o���/emQ�7��wr� �`��YI@��z��:Ea`��X/�%qg��[�u·�����?�k����d��cԹ�RW���oO��e$����k!������A�s�Ӯlc�]x��)=%'<Oo-�_����}��F,�A²�nJ�7u��c.��{h�����kj���T���X���g_�p�э��˾�L8�[�Y=���tN�Y-�;r[��hε+���Ř�A��j�j�ξTG�2��t�m��/�(�� �b9Z�g������V�!�$N�/��ֆ���C�v]�-X,��S_M�u0�t}'�V�e��	�I@Ӷ9d�5�6�r[-i�[xi�Y�:�S�%�tW�ۖ�s���)~<�2��!j���ˀM�&�KM�����!.��~�	t�&�r�0���C���O>�!2�>Ê��j��oT/Y��˟S�~�{�V�{�le�^S��
r�灏��*��}���_��k�ub�Q<:#�4��jG�Z�Xu>ĥdU�q��"��m�������cXqJL���5���R�ʄ!���N�X�T�TQP����	���_&b�(Z<^�Ќ�� c"��,b�(S2Z/L9�K�5��h���b�2��c;�8�\��G�� |��8����4̋�����BA��wn� b<'20���ԧ�k9�V�G/���A���wp��{GW/3ธ���aK���7S�E��+G�H8Y0}��@�0X���Y����fͣ'�+v\��EU����.F��M��n����᯦�����nU�'J�H�k`@��n���yc.t,}e��QW)
Tq���qB�|8JTfu�IN"ԕ�Qx�:>|K^w〮���I{X�$il,�@�R-H1�����6�Kf�f�ӶR�(����g�;��"/��M��=1�',���D�v�c��nJ��cJ�܈d�$Q�1���O"}�*��Iq�{:�"{�3�~�����w�aV���J��$7��[�ǀ�i��^y�s�3_�7��A7xS�?ym��
� ��s�NXd�u��ӫ�"-�|�[�"���	�dpb�g�z� q�;��)�-��%4a�џֆ%��1֬>sQD�Х�o���5|�h�0tY��b���ǽ�L�H�1�����Nh�l�cV&���x���� �Lb����^�z9�MQ���qj��ߒ׃.��ӯ�o�!��$��6;y։�s�����HrE�t��Mqr���gR���?��)��q��o�y��BA�n}�k���ֶ�<����5��$�1��^��_�?��@�5}������ԟ3��ȢP��&:=Dn���S/ۘ��������\F�7���3^�͆�؏!W+��d'�\K��[�G1�rHt��VK�[t2h�H1�������	wL�=`iL-�b�a�| ��--/�2*�'k��!ߨ���6/�	��¦ٙ��m��a'��,����=Ed���Mn���j?ܨ$Җ3E��� �w2���������@=�߇���� �©bYځ+����~���g_�ʹ�nw"��⓶T!Px�H�NZ���|oC��o��$�=R�no� z�<"������������Rf��\чz�+"�m/�yle^�l8��bY���~�#IO����}:�u(�x�X�Uz� #x�u��Ì��w�_�(O$��ŉ�<w�F�e�!�����h��a��l��|~ݙxv�p�Hp����H�����/,z'@:#`�m��G��    #���`�P�glZ�d�'E��3f�+=���+���~����>�݈^C;�r���fGT�|<��G� W�����p;�&��>��_M�Uf���n!AQ"f~(��s]4���GK'�����_��)k"�ꇏ&+�b\�f?t��ہ^9<``����b�{�"�3S/�f�:�	��0&!M㣼��ed �뵦��i%��l��@���7ȫIK!��'mar��t�M�-Zh,���3�^N�I����x�6���G0Y�SWa�AIr�i�v�vr$���n�"��-���)$��? .U5�/?�LM!����8�o"��J4 �4D[���y��t��Ds���s��%������r�,rE^V
�v�zN�dէx'J���DD- ��{j�#���O��L��#|���>o�W��aS�o5m��j����U��D�:�ش�1oF;�k`S�9�}�9�Y	)2^�taQH/��v[�H����4�����((ywF���N�ez*�s�(� �.�y��7;��V�<h�����֧�G����y7x��� �"���]*$������y�S�A���$y0b◗�t��)[s�X����4��6x H������H׵�?#{p�D���J$�GbD�R�j�f�������|����v�-p���~�oB���K��۹����O����D�Z��V11�#9Wj����7^����X��H��c�s8 Ĩ��{Ĳ��̉Z	 �t���V��i5�P�&V#��s)��;���}�Ƞ^��Y$��?�}�m����xpg8:̏�ѕ^�fUԧu���)�+�ASN�3R�/�R�N��櫪�1�����5�㼱.߃-LX��z�U�U͆��8��2�bt��f�����e��N�1�{	�C���Oq������m����Pc��	��'�"��ce*��O��o�k=k\#~X��{L�Z�[��������:Ϳ��֊�bt8e�TpHp�4 r�+�\m=lbj�\IV��]�<)~D���_�w���:H���	�g�?z�߾�ԩ�&��*0N���Vo~�@���U��Py�4}��Ma�,����n8~�'WB��#lӯVtu�so3c%Ξ/��߼$G|�=N�� \Q�\ϥ�-h5t\���᰹�g�P�	C����y	&鷰���
�ӀT��e�
�y������!X�ov�40�M��$�S}R�< ���X��I��)�CݠY���� ?�x�&�S�������:���GI��y��@Q.�ʲ�h���+p�����p�[f��A�k�M�����J������ҒJ�����͋W}�_� Lq���V�W����x��chW��NsQ���ʞ,nc�s^iJZ������Z&��V�!�����
����_���~T�;�O���y�����/S�m~KTp{w����]�A5�'5���R��hUl�DyhU�뵮���x�k_���ഀ{�bY�g�����S]�-G�v��|:�D�e�Y}��h���d���n�Y(�c�s����V?�`�"k|����R� C&!��go�?��٬�Ȟ�WS�����}y�����I�z������kl��<�/#��+���݌zTJ��4�F �
T��y�=�9��X���@z=:=�|F��M��f�w"K9���*��H\S������`o���7��?�ڿ{�:mx[������0E��6��k+���T*V��&r��j��h6CԾT�"	��o����9v�h��p����x0��~vN�k�(�]|���� ç='x�ؼ�=yF��;)����/�n,��3!aZF�ҭ�� :FH�Q��(�9��'e��b)z:b�{�g�����k/���C����Pf����4�|�;$�T1�GUJ��1���N�&d���v�Ai����X��K��DW�㿋5���&����F�sMw�;���[|���K
�z?O �����{���@�=|�B��I���,ȶv�T�l:�Z���)��J�!6\Idƿ��myF�F+������j:#�QS�P��p���s4|U5o����B����}���WT�{f����g���O�^X�?̤rS�J�e��f�����,eg2���.�c|v��,mh0<�;Ӧ�C�^�f�l�M�K�.ԍ�,	�0�"0��9z�>���Y����K��ny�h�*<r���Q�x !N/Z��؅�l~d�qE�@n;����� ���ם^6[�v�f�Y;p���
>����_��(K�SnD��y|���\\"1�)n�nl-�`(k�����l�]�$��n��d�e�f��k�� ��.�� _�_��\$.���x6��N��-yHƢ�~dCkΉ�n ����G���m��Q���M�����I�l	��R|����Q�M�<;�?f**fXL)CW+{�ڦ!�����!]
��+&��Oy�QZ�i������ݟ�р:��V�{���yxZV�1.�E�i"y��i�^d�v���DS��$u������� �1���Z���t=�7L�Q����o��q~��#���q�P�����?ZP5�(I��P��z�i=��~�1�PIp��<���u�߽�	I�Cz����GQ���:-{T�Î��(I_�X! nD}��P�Á@��d]��HLHle ͛���Ed�')ߡg��_FRoF�&�����Y0�^O/��b��)�I�`�P���n4��^�S3(Rۑ����)���U�o�P���A�)$�sm)il1�A~�X�ٷ��i�P���B��`���$P3i���&%�LQ2�~�{�q3j�ph���Kh�ܽn�:��I����r�08�������k?�E�jX��	3�_p�܄f�j"��"����~�k("��;���5����+�׬[c����x𛽢Sd�	�:�bP O��.�����|� %Ͻ��å;,/�V�=��E���q�|�-����0�>�v���
f]w��3���0���Z�w�9B1@���#x����h��>�}�X����>�`�~�e��h���:�>1ғ�3�A-pw8, oh}�p�R�S�h��Vۢ�Z���2�&���l
�Ң��[d������~Kt� �j��5|䤀�2�֧���5��Po��YY��2���w��idI�7�����!���R�c!��G�X@��"6JP�k( Ow���c�S̾���Zd{��	SyN�K��K`W��S?��d̎�R��q?/�8���V�G�ߦŌ�Nk�x`�s$���[�!57@ͲK7hk#��c��Y��E�y,P��d𞨍ƜՍ�{{>�1�C�l�QW��Ghǉmy�ꓜ�$��B��ޛ\���+O;1}�.ta��A� v�2�Mm��A�U�H�R�5�B{!��$� �
.�����.�T��^�� S�$�	њy����s{7�m/���B �ʏ��HZ������݁�E� :�5P��  ��~Y_��Q����(����N��!�P!Y�9�m�ˊ+IS�TQz<M�4pbmEǖtX��A����Ck%H�PN�(��
g␦:%̒,�K'�E�W�7�I����e��Y��r���G}�rF}��>�����������5��a���7?���ʚq2�Tc�T]�p�$v<���R|�c	�/\I��r[gD��}Si
����6�>#˘N�v�]�-ɮ��V��?&����'����>~�Q:�[�&D���7��9���w�'�]Mm��mB�]JGi���]����Dh\0�hCG��֨���s��4�p�ZV�RS��y7EĒKl؆�ͳ��)�6�hm��
 ��5�m$��Y�Q�L~�y��^=ߛ)h�g|��:�Ws~�|`|,qzx[Dm_�vc�~Q�1Q'}T��Ơr�:dN<��9dǼC�4�׽ɸFp�@㒠>k�Q<�������C3��oO/N��B#���[+o���8��wrl�tVZ��T,��*�-�[�$skM��z���	�����1�KhD���� �j���4�    ��P�>��e�Hr����i��IX�i��K#�:�ue#MR�&f�t|�VBu��ڶ��^8���C���\8O��6�)����)Q��v��а��߹c���-i��oU�(�us�Ә��#B����7dGS-|U #��A~�t����9�/�(LQ��K�{����#VP5�&z?�|c$��J\�[���IM�i��5]4��j*�О�%-�Z{��@M�:G&�}�}���jS����r��
M:��R��*l��9�����r�8i��/�j��>~Tڿ��H�"��?n�z�sκ�c�0�0�p���~�\ZG��t���/���(fmև���ʥ?d8�����|&���9�bσ\���E�r0bV���ϧ��-w�J�&]��~���*����Ooe	�ʵ[�0Nz�S��e�9E���+��W*��/ڰ$��>��;ml18�x� ��)Y���k�V/P��U�vw��1�s;:�3����69l!Jgc%�簾��q���w��;��[��Tjeik�t�je�n���;xL�+�dx�����c8b��Ӊ�J�ta�C;ɨE�D�uLNPX��:�/g��
3$�m���xv&�(>��p^㻥)*��ɷ���-�y 5t�=�6'B�^� ��o;��4[���##Z���!��=��Q����f(cF�%Sq$$Na��n��?Z�<�	 �(� �y�2��"Ks��։�Ǯ�.&�z�U�.^�U���H8�K�J�}V���u�;?�s�x�0]��t?a[�I��+*S���hۃ�gW%=˗Ĕ���/�8�9��<�_��ߎ�<ʢ{�r�!V7� ��!�Q����zQ���͵���hʫ��V�I^m����������Bʨ%�|7�#}7�j4N��j�x��f��EtZ��ٶ �Z��Ԫ�`�yy�|���|�P��zɀ͟���"���K��Z��T���v(`MD����Ԙ3�F�"ow�`G���C��
��d�	ѿZ�ٸ���P�!�W$}K<�X�`�� ZK��r��&��wGݡ�T'���>1���P!�)��RR�)�K21�9&�L�����g{�T�{���\��V��E���z�V����XS�f	�.�3"�k�8Q�����<F��H[�ƂJ
��Y������8.�A���Q"@U9ι�e����:�!g`|�Tѵ���Hݼ��P,S�r���$�ݿ=����rVh1k��n]�4��F�EO��5�?ꇼ�g��A�Բ+Ût����<�%ɇ�?�!��܄�<ҋ��[L��c���M�K�]����6'H��u�w�R7]���bR�8�x�����
������#w��$1RWe�1T)ءN�$k����Q*�P�������z:�2��@���1��p�}WULJL�{Qz�M.m��4��dF4�y�T~Q��O^]ȔVg�W��<)_�.�Xݣ�iE{]>"��z�.7�@|�].��G���R�:�,��� �:x?O�Ȧ%wԗT2�9	A޺yb44���iI���K8�7��,�H�:�Q����Ҥ��F�h�K^Qr*_�����K�ZIvzO��l��K�Z����f%D��4��h�-U�P�G�x����ז@	.G˒���Ű���C��[P��y[��t�(��}�4�;'C�L��H(� K��5nG�A��R{�w�Ţ\K�2�d��8{&�^�;��w�t
�-<�ke�nul.�����4"�g���B��yωλSw�+a��]����}҅6Q��N0'MUTr��ɨ$����ak��qIy�2��v*�8+�v��I��b�.EӴ�q�������dg���n�z��;�׫��u]L��eL <l��_�;y�0�X6�!�u���1W؜�mv��Q�k�[�r�&��b��x&�d8�:�]�.ٌ�����Fq�u���w�G����X��l�N�s��U0l�"k�WsӳT����exqV� �4.��@��u�8��$�5�I�᪁s�t�AX�[�no0�8�ڷ��qma�}:�V�8���Q���n�W]��Tn�K���ˉ�w�.���K���X�_X��s��,���]�v]�|0�˰�D�3��=�/	�x�FY���i�vwt��H*���^P�����_X���&���,ؔf�\��	(��&m	�А�(�����ƀ�㝓I�a�'��1I�8�@�/k�&��4�><�O�ږ���o;(�v��	)��O@=W��|V��(��s��#����tA�g��E�w������?t{�Ft���4��8Y�,����3�p���2P�tw�^�5mjKW��'�}�~���$O��������C
a�+`�����t�=e�!�Q�1�"���l+#� ,yt��#�G����E%߷�B����]M�k
��]8e���7��oQ����Hll3�2�BI���`$��k��?WlF�e��So
d�)`x_�/�����z�T���3u�P�^!M�XXǘ��[�#�эlp��~+�J�B�޹VL�y٨S�<Mr�Ö�nz|^��6�V �,9��AԚ@�B��/h�XF���&�Ѥ{y5 7-��J���ܶ�̶���5�a举�@b��#�� ��X�RyÇ�V�S#��}�%��8���qw�x��+�8�}=w|����ގQ�<At��BE��IDZa��ʿ���x ���x�oo0ӻ�#��N�W]Hv�%��[�!���dീ�Zp�մ����S:���ʏ���f�v�4%����@�b9�O��C�h'��2��u�]�Ȩ�/�Nkޒf� �uKg3���,�m���󚆥!)N�'0�׎/�m��)��&)��x���_�Kq�R;-�p��m �C�0u
��te3ybL�&'�O��R�Ԛ�|Z���e����tk����ꂪ����Qj�(�uČ8�)+ؿ��� e`�+-]ͯ9(�a���)��L�{�2�`��L�V��~�r�F����=�S��G)�������Z`�▝��kB�8Bw���������=��o�o�8�q�{h4PG�F���!�C8ݾ��U��G:{���v�v���!��K��u븄��ʑ�@j�G	83�Yd��dh�;�m��N,*p��e2{��/;��p0�R��B�;�;)ҦqF���k�'�v �?_�j�Ϋ$��>z)���aI�E��-��e)U�c�;IMj!Q)-$L\ihk�{���lf	�,!р����3��l�Pl�'�^�H���h��'1B����\<�h46=�%,ó���oՐ�9]Q�w���s>C �EtE�+f����&v�����_� � �ʕ�68�;n��JbH��'/���Ut��F�s�{uI_��؋����.��@�>�J�%I}��0�|*�ۿ�\�x왐�	�	I��S�9�g�K�4��O�wȐ��3��)�&ʎ}���K��e�VC��/�+���v�;���<����(p4����^��z9�V��޾XW!�����Q�@��͗�}��*O�>�w��*��]=\���A�9�]%1�@��9rҥ�ue�>�	��H�9`�<��������Ი���N¸�(rH�X'V|TE�i��|����jqO�o�|�����?��0��+�<��;w6j�V�X�4���i�CI��ϋ�gd%m��;^��s=���JT�h�N4�j��J6G�쫵�cN��j��/ӭ�ex�*i!L��M��b��|& ���2�9�w�Q|���D�l��9�T��b��|��o:�[�T�b����Шm����~��B���n��f�&u��fV��7�)��-qgc�6�DB�r�L(Ы}�z�d� ���otZD�����`����09�֏e7��N��r &I����=m�� �	
X��J5��{󹄓�USI��QKj��:}ia�-���U�[����5�3`"�o����5��5{%=��uK�l�e��J�Q�G����H�=�
e����;����@H����z     �G{�΍Z�F=��jX��e�F�ݱvC��� 9�X�eo�J1������2���;�1�Jz�i�z����)ʌ&�k.����@D���V��T&'J=W�#@�����畬�R���<u�q��0u\b�-�k�zԔ�,�yR1�OȘ8��׳B��N��?���E_�{���^_�ǧ#4��[�D�w�G#��[�}�f�`Zg�9D?#�nAFY�� �C�S�ɗ�������F�`_��#?�P�!�����@��SD
�SG՚Og�^�i�P��ʂp�~r�����z�� 8��	)eE&���"�Tp�^��!��ĝ��o�@=�1�g'E{�4�kfo���������KE��o�=�����6'@��I�5���N��E�"�U<T4ky�s�DZ�۳�i������~N�R� 1�i�Ш�3�޶�����ۂ���!_뫖�&�[�Y���$Ξ��+x��m�!]���G!VU�p">}Χ'���I���"����e�I�����%8�I419(�.m�d��.GU_�ٯ{���,�s�dJ�����i2R���=-�Ff�I�JH����8�(V�kGr�\����m%n@` �D>(�4���0���O%	�G��KJ��N��ұͻ�@+��$L��\XO����Fi�@\_�Z"q:ۄi�jW*�_������T�:��)��WjOƯy	x߭CVJ��ȝ������&���NvX��!����`��b0�����`��!�=YY�,�y�jX&�g���s;N=u��ڭ�oJ��r�v�m˟�Pi��o)�:\{��F�fжn�n� �Iy2D}(7����HA���h�z(t����K��{�ҙ�@:Q�e�Xx��S�i�_���[PE\9��HV���	(ᙽP���.,;��O+@[2��-�M-�h���{��9W��b�D���v��+j�rhJ�"�E��PPYl	ɋS�s1x~;& /��ǙY���b�,,�D�
^�331yE��sm�v�oGY�k8�b�X�j#6���ˮI/��&Y��7x�L/�>�8�$^:�0ݳ�q��7�ԙ����K�U�R��ƌ�Ţն/��l��3�ڻ.� 87Z�)+7f�S�c��CIZX����0�J��2%s4������_4ڽ��'�u��r�L[fQ��Ϛc�'�쩔�t� $5n�%��=�Z6�= %u)�����A�� YӤvȶ�[$���c�鎚 
IfҩbM���d2Vty�|���疜:�Q�Ϋb9#�)︢h�;��aH"�c�~*�9$J��a�0��k�]��i�(忸��fp��03މ���(�Y�,����w�Yܺ�H�<!xb��r6�FZ���o��8ͦ�b��z�4������Xb����3���w��rV:a��;j��7�珕xsv�����/��:�o�n�:���>��K)��������*�� 8�T���֟�U�gj���*�$mk�*�>_?p(�i��nR��*!�g_���H�W~G�z��z�Y\�߆k�j��pZ ��`����q����\V�Z�����*_@�A�3�����f��ȕ�����ȭԀ66��c��zPw����8T�RM �peU�%G��I�R�0��H�jQ���D�K�?=�d����M�I���7��D�%���о��f#M$4
��۪��滔�e��/���RZ�
�T��y%�]��C;���v�_e�PR��A�4����xw�*Hp�d�+�P�� �ؒT���k�kt���j%r�_>�}�
rך�M���MS'H2m����3�����x�=2ǙJv!;��-.�u1����Οe7�i���Zs?�F1M]���S��<��#�T�:�ף��m��Q���E�t܎�C�^�t��K�E0%U��|���h6P��Jl���]��㢒ٖ@e��J9��IlQ��M/¡�-�$�;�ϵ ���(�#{#sz���V�`�ֵVBS֥�cV��k)�C�z���%:���S�8�s��H���ר��_����^�i�2:U��@}K��V�����E�5���HG��`?!��Ôce�J�V��_L���
=P���1��]ݩ˓na��x~w5��̢���3�S��(>z�t#�9@��m���f-�xǻ'_�1k�1\�I�Bi��͝k�NE{�3x
*wsK*m]Uu�L'�U��v؇��q�q�|Q:���,I�ې!��"2�k���8� ��
K��E�9Kaq�mcG���y�-�rZ����%1w�h�v��UWP���':���U^�K��x�O����_�J��6:��/׾m����#�f��l�o�;D�3u&��|��|#5�t�Ev2Pqj������z�͎�F��Z7�s/,�^�:<bo��p�Cd�j/D��nz/]���������f�`/���J�ۣ;Jڭ^��MO�f���O�3x"�=NZi�h�Mj�iI�����m�;2D�x�ڴ`�r~��zTDM"q���\.}4F5(�_���T2{�3CY�I�g;L\�;��͢x�y�a��o.����R���r���l�Mfd�@5/�@��Ǣ���a-��q��A�:KV/�Y�x��?Вk%�~�T�\C�{"ERB��+,g�3�^�����K�y�E�G�s�%e �6e&RK�$���S���VQU�����r:SQFe����p`���� |�:^�^;t����P�јOb�+Bj{;�\���x�P��иTh�)�dXd�+ز|�6D���D�ʅ'2[�E�^:��"n_U,� 6��s�z��h#�Q=銌��Y����?m�1C:�Zw�����s93|ƺ0��ZI����LL~�Pb������ÐϨ�@%D!Ɠ�/
1�}C6л{(7��V��h5�g#H{R>�'pΐ�9qA�.I���a�4* �<2^ud�$��4��lQw�X�YT�-��^�և���
���3_x�k5�JW�ܼ�6j�rܩ"Y�r��Gn��<���|G��F�F��,�L
j�SA�\�̵I+9��y�)?�H�q�q��$]Ș��4c4��w��irp�~9YV�s���f����tB��k��NMSn�������a���1�2�O��r;����4B�X���|�rhǂ����t�
>�1ӤR�	ث��:��y���ND(`�K�6��w7t3�����l����T�D������� �#�/�d�R�����H���D|�V�~�({�� ���b%K+��4[�i�rE^L1�v��G��p�O���S{V��6R�l�<�Y�J���;U!&��t*�]Uua�d/՘O���s`A-���tLv�4�E�o���M�!����Q�̑��
./X/d���(���Gd+l[�D���^K�.ƶp,IY�|�9�S��Il�Cv7&��52[����MW��ԛ�mi��S��E�3A��'���UԬ��%ݞ�I����'���b�k1���2����$���,���wธ"���^ut�KL��X^��Ql���*�2�FՈ��~�"E�X��{��KKJ�Wrl�BS�Q���%��4Z�#��4��۝�m��O���A�7Yj����K]����ӧ�6*����>����[�S��N�����t�|�f�G������U�LŴ@G3	��e0�r���.:r땭�L[����6m'��u�p+i����m����A�w�ϠnC��I=����k�;�7;�����*(�&z�Z h�F�7]�`�.�x�)�-*~��2{o3\b?:|t=���|BO�9RoЁ�߉�;�9���~��F�?�G4�����ׁ*Ks)��N� ��쵼�����.3��"\]]�� ];H���o9���ڛ� 9C}���K���8	:|%�cU#��j�8Fi�VVD|f+������3��h<�P��3��=K��y�H�GZ-�s}m4���=tRM�*��C#h�~�]�SĭK`w�Υ�L#$����J��o=�'���&�צ���eɭF�RV�v��*z���l�(������D�r��} �  ,�H�Dh�C��G����޾A$�,����2R":p��� ٳ�g�%CZ�p�%�n���gf�R�������ȃ;����zo5�b�Az� �����@��ݐ�#q"��������hرR5�˅=��RO[����'����ߌILL���y�vK�(�\���A�*�q�@��_o8M��W:Zrj��=7+�=�Nk�h>��)��<xݵw�b�2�6�k<Ǩ	 ��`NFE��{������C]J�-j�^�MPM�8��1qQwڙ�Ӻ,�Z�1HC��d��ٳO�$��>p�`]|z��!S�
ǞM}3fbq[8k:*���{�u����;
ؽ���e�z͎���-�]�?П���\��G�\>��M�҅g_�3�\��1�)'�ڵ�7�돵t��#�p�����+5��;8="��@�NG��YA�� �d�)�����)z3�Q����J��*ı7RIh��r�'kX���SY�Qq��,����<�8
[�'n'���������w<m�zFyܲI��Ο�2��nG��<A�Y���G����P5/���m�px��=߁�+CM�թ�%_�$>1�N�<��P`�]:��Hx7H(�?��fΖ&G���'"�:�Q��H��u����X�N���&�l�c_�@��C,�L�DC����^yV��3F;j�挃�&��ǅB�$�.�����(��I3��{�������^[4I��'t׹���<���8h��2�҆*Y�6Ht<��T��l����W��ԓ�
�=,��R1���rN:���b�*@uA�1�Z`��R������i{��;)Cg�y(4��I;��׎�1V��*��),��"�W�Ѿ&�t�q�!��2�j�+y��}��ㆣ�s���;��	W%����]��*�#�v׉�D�-Cs�I�R	�ycU��W�{�^�1xx�{)���6���>���e<��zMK�Qz��3-W�3 ��/eڪ�(���%������eI֑<���ā��Z�a̽�rǓ~��ҏ����	8VC zL:i_q�@й�#�3� xmOɅ9%f�#�4��t�����M狓�+�cy�DdV*+M�0�f��k{`[S�97dU��M1���i�	+�'��8Ƌ&���t(t�f���p�����?9=;�4�<v��i�I��,k�4������cv���� �O7�*�3?�YXj�{a3����GdQ��[ W�D���[EN	��!ٙ�Zvڙ����������>��ɭ�?�/0hE���c��w�����3t�L��O�����ty:m��?�L����,���Rr۾�7�b'*�Y�����(��k�Ⱥ�����W7����ays}su�|0�_�ܿz7$�����K����7��;ʤ����9����5�F��w����������ڽ     