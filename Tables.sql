PGDMP                         |            NBR-6118    12.19    12.19                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    24586    NBR-6118    DATABASE     �   CREATE DATABASE "NBR-6118" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Portuguese_Brazil.1252' LC_CTYPE = 'Portuguese_Brazil.1252';
    DROP DATABASE "NBR-6118";
                postgres    false                       0    0    DATABASE "NBR-6118"    COMMENT     H   COMMENT ON DATABASE "NBR-6118" IS 'This database is based on NBR-6118';
                   postgres    false    2841            �            1259    24589 "   classes_de_agressividade_ambiental    TABLE     (  CREATE TABLE public.classes_de_agressividade_ambiental (
    id integer NOT NULL,
    classe_de_agressividade_ambiental character(5) NOT NULL,
    agressividade character varying(20),
    tipo_de_ambiente character varying(20),
    "risco_de_deterioração_da_estrutura" character varying(20)
);
 6   DROP TABLE public.classes_de_agressividade_ambiental;
       public         heap    postgres    false            �            1259    24587 )   classes_de_agressividade_ambiental_id_seq    SEQUENCE     �   CREATE SEQUENCE public.classes_de_agressividade_ambiental_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 @   DROP SEQUENCE public.classes_de_agressividade_ambiental_id_seq;
       public          postgres    false    203                       0    0 )   classes_de_agressividade_ambiental_id_seq    SEQUENCE OWNED BY     w   ALTER SEQUENCE public.classes_de_agressividade_ambiental_id_seq OWNED BY public.classes_de_agressividade_ambiental.id;
          public          postgres    false    202            �            1259    24629 #   exigencias_de_qualidade_do_concreto    TABLE     �   CREATE TABLE public.exigencias_de_qualidade_do_concreto (
    concreto character(100) NOT NULL,
    tipo character(5),
    classe_de_agressividade character(5) NOT NULL,
    valor character(5)
);
 7   DROP TABLE public.exigencias_de_qualidade_do_concreto;
       public         heap    postgres    false            �            1259    24616    tipos_agressividade_ambiental    TABLE     q   CREATE TABLE public.tipos_agressividade_ambiental (
    id integer NOT NULL,
    classe character(5) NOT NULL
);
 1   DROP TABLE public.tipos_agressividade_ambiental;
       public         heap    postgres    false            �            1259    24614 $   tipos_agressividade_ambiental_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tipos_agressividade_ambiental_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ;   DROP SEQUENCE public.tipos_agressividade_ambiental_id_seq;
       public          postgres    false    205                       0    0 $   tipos_agressividade_ambiental_id_seq    SEQUENCE OWNED BY     m   ALTER SEQUENCE public.tipos_agressividade_ambiental_id_seq OWNED BY public.tipos_agressividade_ambiental.id;
          public          postgres    false    204            �
           2604    24592 %   classes_de_agressividade_ambiental id    DEFAULT     �   ALTER TABLE ONLY public.classes_de_agressividade_ambiental ALTER COLUMN id SET DEFAULT nextval('public.classes_de_agressividade_ambiental_id_seq'::regclass);
 T   ALTER TABLE public.classes_de_agressividade_ambiental ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    203    202    203            �
           2604    24619     tipos_agressividade_ambiental id    DEFAULT     �   ALTER TABLE ONLY public.tipos_agressividade_ambiental ALTER COLUMN id SET DEFAULT nextval('public.tipos_agressividade_ambiental_id_seq'::regclass);
 O   ALTER TABLE public.tipos_agressividade_ambiental ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    204    205    205                      0    24589 "   classes_de_agressividade_ambiental 
   TABLE DATA           �   COPY public.classes_de_agressividade_ambiental (id, classe_de_agressividade_ambiental, agressividade, tipo_de_ambiente, "risco_de_deterioração_da_estrutura") FROM stdin;
    public          postgres    false    203   �                 0    24629 #   exigencias_de_qualidade_do_concreto 
   TABLE DATA           m   COPY public.exigencias_de_qualidade_do_concreto (concreto, tipo, classe_de_agressividade, valor) FROM stdin;
    public          postgres    false    206   �                 0    24616    tipos_agressividade_ambiental 
   TABLE DATA           C   COPY public.tipos_agressividade_ambiental (id, classe) FROM stdin;
    public          postgres    false    205   �                   0    0 )   classes_de_agressividade_ambiental_id_seq    SEQUENCE SET     W   SELECT pg_catalog.setval('public.classes_de_agressividade_ambiental_id_seq', 4, true);
          public          postgres    false    202                       0    0 $   tipos_agressividade_ambiental_id_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public.tipos_agressividade_ambiental_id_seq', 4, true);
          public          postgres    false    204            �
           2606    24623 F   tipos_agressividade_ambiental tipos_agressividade_ambiental_classe_key 
   CONSTRAINT     �   ALTER TABLE ONLY public.tipos_agressividade_ambiental
    ADD CONSTRAINT tipos_agressividade_ambiental_classe_key UNIQUE (classe);
 p   ALTER TABLE ONLY public.tipos_agressividade_ambiental DROP CONSTRAINT tipos_agressividade_ambiental_classe_key;
       public            postgres    false    205            �
           2606    24621 @   tipos_agressividade_ambiental tipos_agressividade_ambiental_pkey 
   CONSTRAINT     ~   ALTER TABLE ONLY public.tipos_agressividade_ambiental
    ADD CONSTRAINT tipos_agressividade_ambiental_pkey PRIMARY KEY (id);
 j   ALTER TABLE ONLY public.tipos_agressividade_ambiental DROP CONSTRAINT tipos_agressividade_ambiental_pkey;
       public            postgres    false    205            �
           2606    24632 c   exigencias_de_qualidade_do_concreto exigencias_de_qualidade_do_concret_classe_de_agressividade_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.exigencias_de_qualidade_do_concreto
    ADD CONSTRAINT exigencias_de_qualidade_do_concret_classe_de_agressividade_fkey FOREIGN KEY (classe_de_agressividade) REFERENCES public.tipos_agressividade_ambiental(classe);
 �   ALTER TABLE ONLY public.exigencias_de_qualidade_do_concreto DROP CONSTRAINT exigencias_de_qualidade_do_concret_classe_de_agressividade_fkey;
       public          postgres    false    206    205    2700            �
           2606    24624 G   classes_de_agressividade_ambiental fk_classe_de_agressividade_ambiental    FK CONSTRAINT     �   ALTER TABLE ONLY public.classes_de_agressividade_ambiental
    ADD CONSTRAINT fk_classe_de_agressividade_ambiental FOREIGN KEY (classe_de_agressividade_ambiental) REFERENCES public.tipos_agressividade_ambiental(classe);
 q   ALTER TABLE ONLY public.classes_de_agressividade_ambiental DROP CONSTRAINT fk_classe_de_agressividade_ambiental;
       public          postgres    false    2700    205    203               �   x�m���0�3E&@��,���۸�Rk'a'�`1R��
��>��5_:���� ,�{�[�Ln� �4#Y�o��035�aD(֠(Lt-$�v5s�Z&�X.
��Dr�E�K����w~�pz���tè��������#�:���y�{��R�         
  x�Ŕ�j�0F��)�@�8�][M^B��ɋ��1�$�l���B��A�b�dԱ4\kG�w�������L���\
���:�`��|����}�{��ɶ�!�٥g'K�K�Η��2��p�G}�v>��o��=��^"w�>3�94z�;=�OYw솾H����5ܔ$�.gp���i���9�&8hܪ�iƭ:e��'S%�(�')���o�݉�мe������Iq���
�^0)���.yĦZ�)A�:��k��FQt�� p         $   x�3��T .#NO��H\&��a ~� k��     