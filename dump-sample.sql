--
-- PostgreSQL database dump
--

-- Dumped from database version 13.4
-- Dumped by pg_dump version 13.4

-- Started on 2023-07-08 16:32:16 UTC

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 3 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: -
--

--CREATE SCHEMA public;


--
-- TOC entry 3003 (class 0 OID 0)
-- Dependencies: 3
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 200 (class 1259 OID 574383)
-- Name: SPOTLAR_CUPOM_DESCONTO; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."SPOTLAR_CUPOM_DESCONTO" (
    id bigint NOT NULL,
    codigo character varying,
    data_expiracao timestamp without time zone,
    data_criacao timestamp without time zone,
    max_utilizacao integer,
    min_compra integer,
    tp_desconto character varying,
    qtd_desconto integer,
    is_publico boolean,
    is_primeira_compra boolean
);


--
-- TOC entry 202 (class 1259 OID 574416)
-- Name: SPOTLAR_CUPOM_DESCONTO_LOG; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."SPOTLAR_CUPOM_DESCONTO_LOG" (
    id bigint NOT NULL,
    data_uso timestamp without time zone,
    id_compra bigint,
    codigo_cupom character varying
);


--
-- TOC entry 201 (class 1259 OID 574399)
-- Name: aax_spotlar_cupom_desconto_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.aax_spotlar_cupom_desconto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3004 (class 0 OID 0)
-- Dependencies: 201
-- Name: aax_spotlar_cupom_desconto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.aax_spotlar_cupom_desconto_id_seq OWNED BY public."SPOTLAR_CUPOM_DESCONTO".id;


--
-- TOC entry 203 (class 1259 OID 574421)
-- Name: aax_spotlar_cupom_desconto_log_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.aax_spotlar_cupom_desconto_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3005 (class 0 OID 0)
-- Dependencies: 203
-- Name: aax_spotlar_cupom_desconto_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.aax_spotlar_cupom_desconto_log_id_seq OWNED BY public."SPOTLAR_CUPOM_DESCONTO_LOG".id;


--
-- TOC entry 2858 (class 2604 OID 574401)
-- Name: SPOTLAR_CUPOM_DESCONTO id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."SPOTLAR_CUPOM_DESCONTO" ALTER COLUMN id SET DEFAULT nextval('public.aax_spotlar_cupom_desconto_id_seq'::regclass);


--
-- TOC entry 2859 (class 2604 OID 574423)
-- Name: SPOTLAR_CUPOM_DESCONTO_LOG id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."SPOTLAR_CUPOM_DESCONTO_LOG" ALTER COLUMN id SET DEFAULT nextval('public.aax_spotlar_cupom_desconto_log_id_seq'::regclass);


--
-- TOC entry 2994 (class 0 OID 574383)
-- Dependencies: 200
-- Data for Name: SPOTLAR_CUPOM_DESCONTO; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."SPOTLAR_CUPOM_DESCONTO" VALUES (1, 'spot30', '2024-07-07 23:59:00', '2023-07-07 23:17:19.638853', 50, 200, 'percentual', 30, false, false);
INSERT INTO public."SPOTLAR_CUPOM_DESCONTO" VALUES (2, 'spot10cliente', '2024-07-07 23:59:00', '2023-07-07 23:22:15.242288', 50, 200, 'fixo', 10, true, true);
INSERT INTO public."SPOTLAR_CUPOM_DESCONTO" VALUES (3, 'spot10', '2024-07-07 23:59:00', '2023-07-07 23:22:50.78034', 2, 200, 'fixo', 10, true, false);


--
-- TOC entry 2996 (class 0 OID 574416)
-- Dependencies: 202
-- Data for Name: SPOTLAR_CUPOM_DESCONTO_LOG; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."SPOTLAR_CUPOM_DESCONTO_LOG" VALUES (1, '2023-07-08 12:33:51.510265', 50, 'spot10');
INSERT INTO public."SPOTLAR_CUPOM_DESCONTO_LOG" VALUES (2, '2023-07-08 12:40:07.562941', 50, 'spot10');
INSERT INTO public."SPOTLAR_CUPOM_DESCONTO_LOG" VALUES (3, '2023-07-08 12:43:15.325571', 50, 'spot10');
INSERT INTO public."SPOTLAR_CUPOM_DESCONTO_LOG" VALUES (4, '2023-07-08 12:43:45.23785', 50, 'spot10');
INSERT INTO public."SPOTLAR_CUPOM_DESCONTO_LOG" VALUES (5, '2023-07-08 12:46:46.404809', 50, 'spot10');
INSERT INTO public."SPOTLAR_CUPOM_DESCONTO_LOG" VALUES (6, '2023-07-08 12:46:50.219502', 50, 'spot10');
INSERT INTO public."SPOTLAR_CUPOM_DESCONTO_LOG" VALUES (7, '2023-07-08 12:48:12.525312', 50, 'spot10');
INSERT INTO public."SPOTLAR_CUPOM_DESCONTO_LOG" VALUES (8, '2023-07-08 12:48:39.41396', 50, 'spot10');
INSERT INTO public."SPOTLAR_CUPOM_DESCONTO_LOG" VALUES (9, '2023-07-08 12:51:01.502788', 50, 'spot10');
INSERT INTO public."SPOTLAR_CUPOM_DESCONTO_LOG" VALUES (10, '2023-07-08 12:51:22.409463', 50, 'spot10');
INSERT INTO public."SPOTLAR_CUPOM_DESCONTO_LOG" VALUES (11, '2023-07-08 12:53:20.432075', 50, 'spot10');
INSERT INTO public."SPOTLAR_CUPOM_DESCONTO_LOG" VALUES (12, '2023-07-08 12:54:40.844462', 50, 'spot10');
INSERT INTO public."SPOTLAR_CUPOM_DESCONTO_LOG" VALUES (13, '2023-07-08 12:59:26.607169', 50, 'spot10');
INSERT INTO public."SPOTLAR_CUPOM_DESCONTO_LOG" VALUES (14, '2023-07-08 13:00:07.059676', 50, 'spot10');
INSERT INTO public."SPOTLAR_CUPOM_DESCONTO_LOG" VALUES (15, '2023-07-08 13:01:41.187119', 50, 'spot10');
INSERT INTO public."SPOTLAR_CUPOM_DESCONTO_LOG" VALUES (16, '2023-07-08 13:08:06.343166', 50, 'spot30');
INSERT INTO public."SPOTLAR_CUPOM_DESCONTO_LOG" VALUES (17, '2023-07-08 13:10:27.800927', 50, 'spot30');


--
-- TOC entry 3006 (class 0 OID 0)
-- Dependencies: 201
-- Name: aax_spotlar_cupom_desconto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.aax_spotlar_cupom_desconto_id_seq', 3, true);


--
-- TOC entry 3007 (class 0 OID 0)
-- Dependencies: 203
-- Name: aax_spotlar_cupom_desconto_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.aax_spotlar_cupom_desconto_log_id_seq', 17, true);


--
-- TOC entry 2863 (class 2606 OID 574420)
-- Name: SPOTLAR_CUPOM_DESCONTO_LOG SPOTLAR_CUPOM_DESCONTO_LOG_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."SPOTLAR_CUPOM_DESCONTO_LOG"
    ADD CONSTRAINT "SPOTLAR_CUPOM_DESCONTO_LOG_pkey" PRIMARY KEY (id);


--
-- TOC entry 2861 (class 2606 OID 574398)
-- Name: SPOTLAR_CUPOM_DESCONTO SPOTLAR_CUPOM_DESCONTO_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."SPOTLAR_CUPOM_DESCONTO"
    ADD CONSTRAINT "SPOTLAR_CUPOM_DESCONTO_pkey" PRIMARY KEY (id);


-- Completed on 2023-07-08 16:32:20 UTC

--
-- PostgreSQL database dump complete
--

