PGDMP     )    -        	        y         
   markettest    13.3    13.3 %    ?           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            ?           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            ?           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            ?           1262    16419 
   markettest    DATABASE     f   CREATE DATABASE markettest WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Spanish_Spain.1252';
    DROP DATABASE markettest;
                postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
                postgres    false            ?           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                   postgres    false    3            ?            1259    16422    cliente    TABLE     ?   CREATE TABLE public.cliente (
    id integer NOT NULL,
    apellidos character varying(255),
    dni character varying(255),
    email character varying(255),
    nombres character varying(255),
    telefono character varying(255)
);
    DROP TABLE public.cliente;
       public         heap    postgres    false    3            ?            1259    16420    cliente_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.cliente_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.cliente_id_seq;
       public          postgres    false    201    3            ?           0    0    cliente_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.cliente_id_seq OWNED BY public.cliente.id;
          public          postgres    false    200            ?            1259    16433    detalle_venta    TABLE     ?   CREATE TABLE public.detalle_venta (
    id bigint NOT NULL,
    cantidad integer,
    producto_id bigint NOT NULL,
    venta_id bigint NOT NULL
);
 !   DROP TABLE public.detalle_venta;
       public         heap    postgres    false    3            ?            1259    16431    detalle_venta_id_seq    SEQUENCE     }   CREATE SEQUENCE public.detalle_venta_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.detalle_venta_id_seq;
       public          postgres    false    203    3            ?           0    0    detalle_venta_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.detalle_venta_id_seq OWNED BY public.detalle_venta.id;
          public          postgres    false    202            ?            1259    16441    producto    TABLE     ?   CREATE TABLE public.producto (
    id bigint NOT NULL,
    nombre character varying(255),
    precio numeric(10,2) DEFAULT 0.00
);
    DROP TABLE public.producto;
       public         heap    postgres    false    3            ?            1259    16439    producto_id_seq    SEQUENCE     x   CREATE SEQUENCE public.producto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.producto_id_seq;
       public          postgres    false    3    205            ?           0    0    producto_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.producto_id_seq OWNED BY public.producto.id;
          public          postgres    false    204            ?            1259    16450    venta    TABLE     ^   CREATE TABLE public.venta (
    id bigint NOT NULL,
    fecha date,
    cliente_id integer
);
    DROP TABLE public.venta;
       public         heap    postgres    false    3            ?            1259    16448    venta_id_seq    SEQUENCE     u   CREATE SEQUENCE public.venta_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.venta_id_seq;
       public          postgres    false    207    3            ?           0    0    venta_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.venta_id_seq OWNED BY public.venta.id;
          public          postgres    false    206            5           2604    16425 
   cliente id    DEFAULT     h   ALTER TABLE ONLY public.cliente ALTER COLUMN id SET DEFAULT nextval('public.cliente_id_seq'::regclass);
 9   ALTER TABLE public.cliente ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    200    201    201            6           2604    16436    detalle_venta id    DEFAULT     t   ALTER TABLE ONLY public.detalle_venta ALTER COLUMN id SET DEFAULT nextval('public.detalle_venta_id_seq'::regclass);
 ?   ALTER TABLE public.detalle_venta ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    203    202    203            7           2604    16444    producto id    DEFAULT     j   ALTER TABLE ONLY public.producto ALTER COLUMN id SET DEFAULT nextval('public.producto_id_seq'::regclass);
 :   ALTER TABLE public.producto ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    205    204    205            9           2604    16453    venta id    DEFAULT     d   ALTER TABLE ONLY public.venta ALTER COLUMN id SET DEFAULT nextval('public.venta_id_seq'::regclass);
 7   ALTER TABLE public.venta ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    207    206    207            ?          0    16422    cliente 
   TABLE DATA           O   COPY public.cliente (id, apellidos, dni, email, nombres, telefono) FROM stdin;
    public          postgres    false    201            ?          0    16433    detalle_venta 
   TABLE DATA           L   COPY public.detalle_venta (id, cantidad, producto_id, venta_id) FROM stdin;
    public          postgres    false    203            ?          0    16441    producto 
   TABLE DATA           6   COPY public.producto (id, nombre, precio) FROM stdin;
    public          postgres    false    205            ?          0    16450    venta 
   TABLE DATA           6   COPY public.venta (id, fecha, cliente_id) FROM stdin;
    public          postgres    false    207            ?           0    0    cliente_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.cliente_id_seq', 2, true);
          public          postgres    false    200            ?           0    0    detalle_venta_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.detalle_venta_id_seq', 3, true);
          public          postgres    false    202            ?           0    0    producto_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.producto_id_seq', 6, true);
          public          postgres    false    204            ?           0    0    venta_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.venta_id_seq', 7, true);
          public          postgres    false    206            ;           2606    16430    cliente cliente_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.cliente DROP CONSTRAINT cliente_pkey;
       public            postgres    false    201            =           2606    16438     detalle_venta detalle_venta_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.detalle_venta
    ADD CONSTRAINT detalle_venta_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.detalle_venta DROP CONSTRAINT detalle_venta_pkey;
       public            postgres    false    203            ?           2606    16447    producto producto_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.producto
    ADD CONSTRAINT producto_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.producto DROP CONSTRAINT producto_pkey;
       public            postgres    false    205            A           2606    16455    venta venta_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.venta
    ADD CONSTRAINT venta_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.venta DROP CONSTRAINT venta_pkey;
       public            postgres    false    207            D           2606    16466 !   venta fka7yaj59nfh3gft0h38o5bv472    FK CONSTRAINT     ?   ALTER TABLE ONLY public.venta
    ADD CONSTRAINT fka7yaj59nfh3gft0h38o5bv472 FOREIGN KEY (cliente_id) REFERENCES public.cliente(id);
 K   ALTER TABLE ONLY public.venta DROP CONSTRAINT fka7yaj59nfh3gft0h38o5bv472;
       public          postgres    false    207    2875    201            C           2606    16461 )   detalle_venta fkhj0bf0515yg7equ11ab4xgq3f    FK CONSTRAINT     ?   ALTER TABLE ONLY public.detalle_venta
    ADD CONSTRAINT fkhj0bf0515yg7equ11ab4xgq3f FOREIGN KEY (venta_id) REFERENCES public.venta(id);
 S   ALTER TABLE ONLY public.detalle_venta DROP CONSTRAINT fkhj0bf0515yg7equ11ab4xgq3f;
       public          postgres    false    203    207    2881            B           2606    16456 )   detalle_venta fkmi06vmeg5th7wdow1mxcqg78e    FK CONSTRAINT     ?   ALTER TABLE ONLY public.detalle_venta
    ADD CONSTRAINT fkmi06vmeg5th7wdow1mxcqg78e FOREIGN KEY (producto_id) REFERENCES public.producto(id);
 S   ALTER TABLE ONLY public.detalle_venta DROP CONSTRAINT fkmi06vmeg5th7wdow1mxcqg78e;
       public          postgres    false    2879    203    205            ?   X   x?3?H-J?)I??01573716??*?9??&f??%??rz?&?qZ?X???r???V?5?r?????f???? 4r??qqq J??      ?      x?3?4?4?4?2?4?F\1z\\\ W?      ?   H   x?3?6?4260?30?2??I,(?/?46??rzd???r?@?8?9? c??Ԕ??bNc07F??? ??*      ?      x?3?4202?50?5??4?2B???qqq g??      %    ?           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            ?           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            ?           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            ?           1262    16419 
   markettest    DATABASE     f   CREATE DATABASE markettest WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Spanish_Spain.1252';
    DROP DATABASE markettest;
                postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
                postgres    false            ?           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                   postgres    false    3            ?            1259    16422    cliente    TABLE     ?   CREATE TABLE public.cliente (
    id integer NOT NULL,
    apellidos character varying(255),
    dni character varying(255),
    email character varying(255),
    nombres character varying(255),
    telefono character varying(255)
);
    DROP TABLE public.cliente;
       public         heap    postgres    false    3            ?            1259    16420    cliente_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.cliente_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.cliente_id_seq;
       public          postgres    false    201    3            ?           0    0    cliente_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.cliente_id_seq OWNED BY public.cliente.id;
          public          postgres    false    200            ?            1259    16433    detalle_venta    TABLE     ?   CREATE TABLE public.detalle_venta (
    id bigint NOT NULL,
    cantidad integer,
    producto_id bigint NOT NULL,
    venta_id bigint NOT NULL
);
 !   DROP TABLE public.detalle_venta;
       public         heap    postgres    false    3            ?            1259    16431    detalle_venta_id_seq    SEQUENCE     }   CREATE SEQUENCE public.detalle_venta_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.detalle_venta_id_seq;
       public          postgres    false    203    3            ?           0    0    detalle_venta_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.detalle_venta_id_seq OWNED BY public.detalle_venta.id;
          public          postgres    false    202            ?            1259    16441    producto    TABLE     ?   CREATE TABLE public.producto (
    id bigint NOT NULL,
    nombre character varying(255),
    precio numeric(10,2) DEFAULT 0.00
);
    DROP TABLE public.producto;
       public         heap    postgres    false    3            ?            1259    16439    producto_id_seq    SEQUENCE     x   CREATE SEQUENCE public.producto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.producto_id_seq;
       public          postgres    false    3    205            ?           0    0    producto_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.producto_id_seq OWNED BY public.producto.id;
          public          postgres    false    204            ?            1259    16450    venta    TABLE     ^   CREATE TABLE public.venta (
    id bigint NOT NULL,
    fecha date,
    cliente_id integer
);
    DROP TABLE public.venta;
       public         heap    postgres    false    3            ?            1259    16448    venta_id_seq    SEQUENCE     u   CREATE SEQUENCE public.venta_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.venta_id_seq;
       public          postgres    false    207    3            ?           0    0    venta_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.venta_id_seq OWNED BY public.venta.id;
          public          postgres    false    206            5           2604    16425 
   cliente id    DEFAULT     h   ALTER TABLE ONLY public.cliente ALTER COLUMN id SET DEFAULT nextval('public.cliente_id_seq'::regclass);
 9   ALTER TABLE public.cliente ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    200    201    201            6           2604    16436    detalle_venta id    DEFAULT     t   ALTER TABLE ONLY public.detalle_venta ALTER COLUMN id SET DEFAULT nextval('public.detalle_venta_id_seq'::regclass);
 ?   ALTER TABLE public.detalle_venta ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    203    202    203            7           2604    16444    producto id    DEFAULT     j   ALTER TABLE ONLY public.producto ALTER COLUMN id SET DEFAULT nextval('public.producto_id_seq'::regclass);
 :   ALTER TABLE public.producto ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    205    204    205            9           2604    16453    venta id    DEFAULT     d   ALTER TABLE ONLY public.venta ALTER COLUMN id SET DEFAULT nextval('public.venta_id_seq'::regclass);
 7   ALTER TABLE public.venta ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    207    206    207            ?          0    16422    cliente 
   TABLE DATA           O   COPY public.cliente (id, apellidos, dni, email, nombres, telefono) FROM stdin;
    public          postgres    false    201          ?          0    16433    detalle_venta 
   TABLE DATA           L   COPY public.detalle_venta (id, cantidad, producto_id, venta_id) FROM stdin;
    public          postgres    false    203   b        ?          0    16441    producto 
   TABLE DATA           6   COPY public.producto (id, nombre, precio) FROM stdin;
    public          postgres    false    205   %        ?          0    16450    venta 
   TABLE DATA           6   COPY public.venta (id, fecha, cliente_id) FROM stdin;
    public          postgres    false    207   R        ?           0    0    cliente_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.cliente_id_seq', 2, true);
          public          postgres    false    200            ?           0    0    detalle_venta_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.detalle_venta_id_seq', 3, true);
          public          postgres    false    202            ?           0    0    producto_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.producto_id_seq', 6, true);
          public          postgres    false    204            ?           0    0    venta_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.venta_id_seq', 7, true);
          public          postgres    false    206            ;           2606    16430    cliente cliente_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.cliente DROP CONSTRAINT cliente_pkey;
       public            postgres    false    201            =           2606    16438     detalle_venta detalle_venta_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.detalle_venta
    ADD CONSTRAINT detalle_venta_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.detalle_venta DROP CONSTRAINT detalle_venta_pkey;
       public            postgres    false    203            ?           2606    16447    producto producto_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.producto
    ADD CONSTRAINT producto_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.producto DROP CONSTRAINT producto_pkey;
       public            postgres    false    205            A           2606    16455    venta venta_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.venta
    ADD CONSTRAINT venta_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.venta DROP CONSTRAINT venta_pkey;
       public            postgres    false    207            D           2606    16466 !   venta fka7yaj59nfh3gft0h38o5bv472    FK CONSTRAINT     ?   ALTER TABLE ONLY public.venta
    ADD CONSTRAINT fka7yaj59nfh3gft0h38o5bv472 FOREIGN KEY (cliente_id) REFERENCES public.cliente(id);
 K   ALTER TABLE ONLY public.venta DROP CONSTRAINT fka7yaj59nfh3gft0h38o5bv472;
       public          postgres    false    207    2875    201            C           2606    16461 )   detalle_venta fkhj0bf0515yg7equ11ab4xgq3f    FK CONSTRAINT     ?   ALTER TABLE ONLY public.detalle_venta
    ADD CONSTRAINT fkhj0bf0515yg7equ11ab4xgq3f FOREIGN KEY (venta_id) REFERENCES public.venta(id);
 S   ALTER TABLE ONLY public.detalle_venta DROP CONSTRAINT fkhj0bf0515yg7equ11ab4xgq3f;
       public          postgres    false    203    207    2881            B           2606    16456 )   detalle_venta fkmi06vmeg5th7wdow1mxcqg78e    FK CONSTRAINT     ?   ALTER TABLE ONLY public.detalle_venta
    ADD CONSTRAINT fkmi06vmeg5th7wdow1mxcqg78e FOREIGN KEY (producto_id) REFERENCES public.producto(id);
 S   ALTER TABLE ONLY public.detalle_venta DROP CONSTRAINT fkmi06vmeg5th7wdow1mxcqg78e;
       public          postgres    false    2879    203    205           