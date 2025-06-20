PGDMP                      }            Admin_Project    17.2    17.2 8    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false                        0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false                       1262    16506    Admin_Project    DATABASE     �   CREATE DATABASE "Admin_Project" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Thai_Thailand.1252';
    DROP DATABASE "Admin_Project";
                     postgres    false            �            1259    16578 
   access_log    TABLE     �   CREATE TABLE public.access_log (
    log_id integer NOT NULL,
    user_id integer,
    action character varying(50),
    target_table character varying(50),
    target_id integer,
    access_time timestamp without time zone DEFAULT now()
);
    DROP TABLE public.access_log;
       public         heap r       postgres    false            �            1259    16577    access_log_log_id_seq    SEQUENCE     �   CREATE SEQUENCE public.access_log_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.access_log_log_id_seq;
       public               postgres    false    228                       0    0    access_log_log_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.access_log_log_id_seq OWNED BY public.access_log.log_id;
          public               postgres    false    227            �            1259    16565    patients    TABLE     �   CREATE TABLE public.patients (
    patient_id integer NOT NULL,
    name character varying(100),
    assigned_doctor integer,
    department_id integer
);
    DROP TABLE public.patients;
       public         heap r       postgres    false            �            1259    16564    patients_patient_id_seq    SEQUENCE     �   CREATE SEQUENCE public.patients_patient_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.patients_patient_id_seq;
       public               postgres    false    226                       0    0    patients_patient_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.patients_patient_id_seq OWNED BY public.patients.patient_id;
          public               postgres    false    225            �            1259    16526    permissions    TABLE     |   CREATE TABLE public.permissions (
    permission_id integer NOT NULL,
    permission_name character varying(50) NOT NULL
);
    DROP TABLE public.permissions;
       public         heap r       postgres    false            �            1259    16525    permissions_permission_id_seq    SEQUENCE     �   CREATE SEQUENCE public.permissions_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.permissions_permission_id_seq;
       public               postgres    false    222                       0    0    permissions_permission_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.permissions_permission_id_seq OWNED BY public.permissions.permission_id;
          public               postgres    false    221            �            1259    16534    role_permissions    TABLE     k   CREATE TABLE public.role_permissions (
    role_id integer NOT NULL,
    permission_id integer NOT NULL
);
 $   DROP TABLE public.role_permissions;
       public         heap r       postgres    false            �            1259    16517    roles    TABLE     j   CREATE TABLE public.roles (
    role_id integer NOT NULL,
    role_name character varying(50) NOT NULL
);
    DROP TABLE public.roles;
       public         heap r       postgres    false            �            1259    16516    roles_role_id_seq    SEQUENCE     �   CREATE SEQUENCE public.roles_role_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.roles_role_id_seq;
       public               postgres    false    220                       0    0    roles_role_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.roles_role_id_seq OWNED BY public.roles.role_id;
          public               postgres    false    219            �            1259    16549 
   user_roles    TABLE     _   CREATE TABLE public.user_roles (
    user_id integer NOT NULL,
    role_id integer NOT NULL
);
    DROP TABLE public.user_roles;
       public         heap r       postgres    false            �            1259    16508    users    TABLE     �   CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(50) NOT NULL,
    password character varying(255) NOT NULL
);
    DROP TABLE public.users;
       public         heap r       postgres    false            �            1259    16507    users_user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.users_user_id_seq;
       public               postgres    false    218                       0    0    users_user_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;
          public               postgres    false    217            A           2604    16581    access_log log_id    DEFAULT     v   ALTER TABLE ONLY public.access_log ALTER COLUMN log_id SET DEFAULT nextval('public.access_log_log_id_seq'::regclass);
 @   ALTER TABLE public.access_log ALTER COLUMN log_id DROP DEFAULT;
       public               postgres    false    227    228    228            @           2604    16568    patients patient_id    DEFAULT     z   ALTER TABLE ONLY public.patients ALTER COLUMN patient_id SET DEFAULT nextval('public.patients_patient_id_seq'::regclass);
 B   ALTER TABLE public.patients ALTER COLUMN patient_id DROP DEFAULT;
       public               postgres    false    225    226    226            ?           2604    16529    permissions permission_id    DEFAULT     �   ALTER TABLE ONLY public.permissions ALTER COLUMN permission_id SET DEFAULT nextval('public.permissions_permission_id_seq'::regclass);
 H   ALTER TABLE public.permissions ALTER COLUMN permission_id DROP DEFAULT;
       public               postgres    false    221    222    222            >           2604    16520    roles role_id    DEFAULT     n   ALTER TABLE ONLY public.roles ALTER COLUMN role_id SET DEFAULT nextval('public.roles_role_id_seq'::regclass);
 <   ALTER TABLE public.roles ALTER COLUMN role_id DROP DEFAULT;
       public               postgres    false    220    219    220            =           2604    16511    users user_id    DEFAULT     n   ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);
 <   ALTER TABLE public.users ALTER COLUMN user_id DROP DEFAULT;
       public               postgres    false    218    217    218            �          0    16578 
   access_log 
   TABLE DATA           c   COPY public.access_log (log_id, user_id, action, target_table, target_id, access_time) FROM stdin;
    public               postgres    false    228   |A       �          0    16565    patients 
   TABLE DATA           T   COPY public.patients (patient_id, name, assigned_doctor, department_id) FROM stdin;
    public               postgres    false    226   �A       �          0    16526    permissions 
   TABLE DATA           E   COPY public.permissions (permission_id, permission_name) FROM stdin;
    public               postgres    false    222   �A       �          0    16534    role_permissions 
   TABLE DATA           B   COPY public.role_permissions (role_id, permission_id) FROM stdin;
    public               postgres    false    223   
B       �          0    16517    roles 
   TABLE DATA           3   COPY public.roles (role_id, role_name) FROM stdin;
    public               postgres    false    220   <B       �          0    16549 
   user_roles 
   TABLE DATA           6   COPY public.user_roles (user_id, role_id) FROM stdin;
    public               postgres    false    224   rB       �          0    16508    users 
   TABLE DATA           <   COPY public.users (user_id, username, password) FROM stdin;
    public               postgres    false    218   �B                  0    0    access_log_log_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.access_log_log_id_seq', 1, false);
          public               postgres    false    227                       0    0    patients_patient_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.patients_patient_id_seq', 1, false);
          public               postgres    false    225            	           0    0    permissions_permission_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.permissions_permission_id_seq', 4, true);
          public               postgres    false    221            
           0    0    roles_role_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.roles_role_id_seq', 3, true);
          public               postgres    false    219                       0    0    users_user_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.users_user_id_seq', 4, true);
          public               postgres    false    217            V           2606    16584    access_log access_log_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.access_log
    ADD CONSTRAINT access_log_pkey PRIMARY KEY (log_id);
 D   ALTER TABLE ONLY public.access_log DROP CONSTRAINT access_log_pkey;
       public                 postgres    false    228            T           2606    16570    patients patients_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.patients
    ADD CONSTRAINT patients_pkey PRIMARY KEY (patient_id);
 @   ALTER TABLE ONLY public.patients DROP CONSTRAINT patients_pkey;
       public                 postgres    false    226            L           2606    16533 +   permissions permissions_permission_name_key 
   CONSTRAINT     q   ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_permission_name_key UNIQUE (permission_name);
 U   ALTER TABLE ONLY public.permissions DROP CONSTRAINT permissions_permission_name_key;
       public                 postgres    false    222            N           2606    16531    permissions permissions_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_pkey PRIMARY KEY (permission_id);
 F   ALTER TABLE ONLY public.permissions DROP CONSTRAINT permissions_pkey;
       public                 postgres    false    222            P           2606    16538 &   role_permissions role_permissions_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.role_permissions
    ADD CONSTRAINT role_permissions_pkey PRIMARY KEY (role_id, permission_id);
 P   ALTER TABLE ONLY public.role_permissions DROP CONSTRAINT role_permissions_pkey;
       public                 postgres    false    223    223            H           2606    16522    roles roles_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (role_id);
 :   ALTER TABLE ONLY public.roles DROP CONSTRAINT roles_pkey;
       public                 postgres    false    220            J           2606    16524    roles roles_role_name_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_role_name_key UNIQUE (role_name);
 C   ALTER TABLE ONLY public.roles DROP CONSTRAINT roles_role_name_key;
       public                 postgres    false    220            R           2606    16553    user_roles user_roles_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT user_roles_pkey PRIMARY KEY (user_id, role_id);
 D   ALTER TABLE ONLY public.user_roles DROP CONSTRAINT user_roles_pkey;
       public                 postgres    false    224    224            D           2606    16513    users users_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public                 postgres    false    218            F           2606    16515    users users_username_key 
   CONSTRAINT     W   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key;
       public                 postgres    false    218            \           2606    16585 "   access_log access_log_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.access_log
    ADD CONSTRAINT access_log_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);
 L   ALTER TABLE ONLY public.access_log DROP CONSTRAINT access_log_user_id_fkey;
       public               postgres    false    218    4676    228            [           2606    16571 &   patients patients_assigned_doctor_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.patients
    ADD CONSTRAINT patients_assigned_doctor_fkey FOREIGN KEY (assigned_doctor) REFERENCES public.users(user_id);
 P   ALTER TABLE ONLY public.patients DROP CONSTRAINT patients_assigned_doctor_fkey;
       public               postgres    false    4676    218    226            W           2606    16544 4   role_permissions role_permissions_permission_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.role_permissions
    ADD CONSTRAINT role_permissions_permission_id_fkey FOREIGN KEY (permission_id) REFERENCES public.permissions(permission_id);
 ^   ALTER TABLE ONLY public.role_permissions DROP CONSTRAINT role_permissions_permission_id_fkey;
       public               postgres    false    222    4686    223            X           2606    16539 .   role_permissions role_permissions_role_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.role_permissions
    ADD CONSTRAINT role_permissions_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.roles(role_id);
 X   ALTER TABLE ONLY public.role_permissions DROP CONSTRAINT role_permissions_role_id_fkey;
       public               postgres    false    223    220    4680            Y           2606    16559 "   user_roles user_roles_role_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT user_roles_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.roles(role_id);
 L   ALTER TABLE ONLY public.user_roles DROP CONSTRAINT user_roles_role_id_fkey;
       public               postgres    false    220    4680    224            Z           2606    16554 "   user_roles user_roles_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT user_roles_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);
 L   ALTER TABLE ONLY public.user_roles DROP CONSTRAINT user_roles_user_id_fkey;
       public               postgres    false    224    218    4676            �           0    16565    patients    ROW SECURITY     6   ALTER TABLE public.patients ENABLE ROW LEVEL SECURITY;          public               postgres    false    226            �           3256    16576 #   patients receptionist_insert_policy    POLICY     Z   CREATE POLICY receptionist_insert_policy ON public.patients FOR INSERT WITH CHECK (true);
 ;   DROP POLICY receptionist_insert_policy ON public.patients;
       public               postgres    false    226            �      x������ � �      �      x������ � �      �   D   x�3�,�L-�/(*�L�+)�2�LM�,�/H��9S+
�J�SK�L8s��S�K�S���b���� �T      �   "   x�3�4�2�4bc 6�2�|c ���� C�      �   &   x�3�tL����2�t�O.�/�2��+-*N����� ���      �      x�3�4�2�4�2�4����� A      �   C   x�3�LL���3��H,�HM�/H,..�/J1�2�L�O.�/2�2��+-*NŐ1�2�!�b���� �� �     