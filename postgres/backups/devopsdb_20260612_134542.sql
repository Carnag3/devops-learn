--
-- PostgreSQL database dump
--

\restrict gdBs6KDnhgaYe49zSNe33mQNPlcKPteKxNjRZnWztWMzRgrzERWuJog7fbCsccY

-- Dumped from database version 16.14 (Ubuntu 16.14-0ubuntu0.24.04.1)
-- Dumped by pg_dump version 16.14 (Ubuntu 16.14-0ubuntu0.24.04.1)

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: servers; Type: TABLE; Schema: public; Owner: devopsuser
--

CREATE TABLE public.servers (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    ip_address character varying(20),
    status character varying(20) DEFAULT 'active'::character varying,
    created_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.servers OWNER TO devopsuser;

--
-- Name: servers_id_seq; Type: SEQUENCE; Schema: public; Owner: devopsuser
--

CREATE SEQUENCE public.servers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.servers_id_seq OWNER TO devopsuser;

--
-- Name: servers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: devopsuser
--

ALTER SEQUENCE public.servers_id_seq OWNED BY public.servers.id;


--
-- Name: servers id; Type: DEFAULT; Schema: public; Owner: devopsuser
--

ALTER TABLE ONLY public.servers ALTER COLUMN id SET DEFAULT nextval('public.servers_id_seq'::regclass);


--
-- Data for Name: servers; Type: TABLE DATA; Schema: public; Owner: devopsuser
--

COPY public.servers (id, name, ip_address, status, created_at) FROM stdin;
1	web-server-01	192.168.1.10	active	2026-06-11 08:52:23.773453
2	db-server-01	192.168.1.20	active	2026-06-11 08:53:49.510841
3	backup-server	192.168.1.30	standby	2026-06-11 08:56:43.478757
\.


--
-- Name: servers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: devopsuser
--

SELECT pg_catalog.setval('public.servers_id_seq', 3, true);


--
-- Name: servers servers_pkey; Type: CONSTRAINT; Schema: public; Owner: devopsuser
--

ALTER TABLE ONLY public.servers
    ADD CONSTRAINT servers_pkey PRIMARY KEY (id);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: pg_database_owner
--

GRANT ALL ON SCHEMA public TO devopsuser;


--
-- PostgreSQL database dump complete
--

\unrestrict gdBs6KDnhgaYe49zSNe33mQNPlcKPteKxNjRZnWztWMzRgrzERWuJog7fbCsccY

