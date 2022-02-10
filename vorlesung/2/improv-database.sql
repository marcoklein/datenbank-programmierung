--
-- PostgreSQL database dump
--

-- Dumped from database version 11.6 (Debian 11.6-1.pgdg90+1)
-- Dumped by pg_dump version 13.0

-- Started on 2021-01-05 18:59:56

-- Alle Datensätze sind unter [CC BY-SA 3.0 DE](https://improwiki.com/de/lizenz) lizenziert und wurden von [Improwiki.com](https://improwiki.com) erhoben.

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
-- TOC entry 2934 (class 0 OID 0)
-- Dependencies: 3
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

--
-- TOC entry 199 (class 1259 OID 16398)
-- Name: license; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.license (
    id integer NOT NULL,
    version integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL,
    "sourceTitle" character varying NOT NULL,
    "authorName" character varying NOT NULL,
    "authorUrl" character varying NOT NULL,
    "licenseName" character varying NOT NULL,
    "licenseUrl" character varying NOT NULL,
    modifications character varying DEFAULT ''::character varying NOT NULL
);


--
-- TOC entry 198 (class 1259 OID 16396)
-- Name: license_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.license_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2935 (class 0 OID 0)
-- Dependencies: 198
-- Name: license_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.license_id_seq OWNED BY public.license.id;


--
-- TOC entry 197 (class 1259 OID 16387)
-- Name: migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.migrations (
    id integer NOT NULL,
    "timestamp" bigint NOT NULL,
    name character varying NOT NULL
);


--
-- TOC entry 196 (class 1259 OID 16385)
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2936 (class 0 OID 0)
-- Dependencies: 196
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- TOC entry 203 (class 1259 OID 16428)
-- Name: part; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.part (
    id integer NOT NULL,
    version integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL,
    title character varying NOT NULL,
    content character varying NOT NULL,
    "sourceUrl" character varying NOT NULL,
    "sourceDate" timestamp without time zone NOT NULL,
    "licenseId" integer
);


--
-- TOC entry 202 (class 1259 OID 16426)
-- Name: part_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.part_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2937 (class 0 OID 0)
-- Dependencies: 202
-- Name: part_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.part_id_seq OWNED BY public.part.id;


--
-- TOC entry 204 (class 1259 OID 16443)
-- Name: part_tags_tag; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.part_tags_tag (
    "partId" integer NOT NULL,
    "tagId" integer NOT NULL
);


--
-- TOC entry 201 (class 1259 OID 16412)
-- Name: tag; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tag (
    id integer NOT NULL,
    version integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL,
    title character varying NOT NULL
);


--
-- TOC entry 200 (class 1259 OID 16410)
-- Name: tag_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tag_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2938 (class 0 OID 0)
-- Dependencies: 200
-- Name: tag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tag_id_seq OWNED BY public.tag.id;


--
-- TOC entry 2767 (class 2604 OID 16401)
-- Name: license id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.license ALTER COLUMN id SET DEFAULT nextval('public.license_id_seq'::regclass);


--
-- TOC entry 2766 (class 2604 OID 16390)
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- TOC entry 2774 (class 2604 OID 16431)
-- Name: part id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.part ALTER COLUMN id SET DEFAULT nextval('public.part_id_seq'::regclass);


--
-- TOC entry 2771 (class 2604 OID 16415)
-- Name: tag id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tag ALTER COLUMN id SET DEFAULT nextval('public.tag_id_seq'::regclass);


--
-- TOC entry 2923 (class 0 OID 16398)
-- Dependencies: 199
-- Data for Name: license; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.license VALUES (1, 1, '2020-12-02 22:03:37.392183', '2020-12-02 22:03:37.392183', 'Orlando Alliteration', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (2, 1, '2020-12-02 22:03:37.720903', '2020-12-02 22:03:37.720903', 'Buchstabe vermeiden', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (3, 1, '2020-12-02 22:03:37.892333', '2020-12-02 22:03:37.892333', 'ABC-Spiel', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (4, 1, '2020-12-02 22:03:38.05275', '2020-12-02 22:03:38.05275', 'Alliteration', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (5, 1, '2020-12-02 22:03:38.192598', '2020-12-02 22:03:38.192598', 'Ausschneiden und Einfügen', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (6, 1, '2020-12-02 22:03:38.36209', '2020-12-02 22:03:38.36209', 'Charakter-Reigen', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (7, 1, '2020-12-02 22:03:38.507594', '2020-12-02 22:03:38.507594', 'Domino', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (8, 1, '2020-12-02 22:03:38.625159', '2020-12-02 22:03:38.625159', 'Amerikanische Sitcom', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (9, 1, '2020-12-02 22:03:38.764722', '2020-12-02 22:03:38.764722', 'Sprach-Mix', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (10, 1, '2020-12-02 22:03:38.896302', '2020-12-02 22:03:38.896302', 'Stimmchen', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (11, 1, '2020-12-02 22:03:39.044259', '2020-12-02 22:03:39.044259', 'Wort-für-Wort-Geschichte', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (12, 1, '2020-12-02 22:03:39.189453', '2020-12-02 22:03:39.189453', 'Letztes Wort - erstes Wort', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (13, 1, '2020-12-02 22:03:39.556', '2020-12-02 22:03:39.556', 'Zitatdelle', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (14, 1, '2020-12-02 22:03:39.685151', '2020-12-02 22:03:39.685151', 'Übersetzer', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (15, 1, '2020-12-02 22:03:39.822831', '2020-12-02 22:03:39.822831', 'Expedition', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (16, 1, '2020-12-02 22:03:39.988854', '2020-12-02 22:03:39.988854', 'Springer', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (17, 1, '2020-12-02 22:03:40.47219', '2020-12-02 22:03:40.47219', 'Papagei', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (18, 1, '2020-12-02 22:03:40.647018', '2020-12-02 22:03:40.647018', '"3 frei" - Drei Sätze frei', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (19, 1, '2020-12-02 22:03:40.787154', '2020-12-02 22:03:40.787154', 'Gefühlsreplay', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (20, 1, '2020-12-02 22:03:40.919878', '2020-12-02 22:03:40.919878', 'Blind Date', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (21, 1, '2020-12-02 22:03:41.06605', '2020-12-02 22:03:41.06605', 'Genre-Freeze', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (22, 1, '2020-12-02 22:03:41.205969', '2020-12-02 22:03:41.205969', 'Gefühlstaxi', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (23, 1, '2020-12-02 22:03:41.595128', '2020-12-02 22:03:41.595128', 'Emotionaler Arbeitsplatz', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (24, 1, '2020-12-02 22:03:41.737055', '2020-12-02 22:03:41.737055', 'Dichte mit Gefühl', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (25, 1, '2020-12-02 22:03:41.892168', '2020-12-02 22:03:41.892168', 'Gefühlsquadrat', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (26, 1, '2020-12-02 22:03:42.027208', '2020-12-02 22:03:42.027208', 'Achterbahn', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (27, 1, '2020-12-02 22:03:42.171782', '2020-12-02 22:03:42.171782', 'Gefühlspunkte', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (28, 1, '2020-12-02 22:03:42.298596', '2020-12-02 22:03:42.298596', 'Sing dein Gefühl', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (29, 1, '2020-12-02 22:03:42.436357', '2020-12-02 22:03:42.436357', 'Großes Kino', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (30, 1, '2020-12-02 22:03:42.557612', '2020-12-02 22:03:42.557612', 'Trizophrenie', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (31, 1, '2020-12-02 22:03:42.67801', '2020-12-02 22:03:42.67801', 'Toaster', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (32, 1, '2020-12-02 22:03:42.822221', '2020-12-02 22:03:42.822221', 'Szene mit der Wand', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (33, 1, '2020-12-02 22:03:42.942167', '2020-12-02 22:03:42.942167', 'Freeze Tag', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (34, 1, '2020-12-02 22:03:43.074538', '2020-12-02 22:03:43.074538', 'Superhelden Pyramide', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (35, 1, '2020-12-02 22:03:43.201648', '2020-12-02 22:03:43.201648', 'Drehtür', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (36, 1, '2020-12-02 22:03:43.314553', '2020-12-02 22:03:43.314553', 'Der Anhalter', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (37, 1, '2020-12-02 22:03:43.428565', '2020-12-02 22:03:43.428565', 'Quintett', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (38, 1, '2020-12-02 22:03:43.554201', '2020-12-02 22:03:43.554201', 'Zeitreise', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (39, 1, '2020-12-02 22:03:43.691859', '2020-12-02 22:03:43.691859', 'Preisverleihung', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (40, 1, '2020-12-02 22:03:43.81888', '2020-12-02 22:03:43.81888', 'Der rote Faden', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (41, 1, '2020-12-02 22:03:43.956666', '2020-12-02 22:03:43.956666', 'Ding auf Ding', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (42, 1, '2020-12-02 22:03:44.09743', '2020-12-02 22:03:44.09743', 'Wachsen und Schrumpfen', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (43, 1, '2020-12-02 22:03:44.236732', '2020-12-02 22:03:44.236732', 'Dutch Square', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (44, 1, '2020-12-02 22:03:44.375543', '2020-12-02 22:03:44.375543', 'Letzter Satz - erster Satz', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (45, 1, '2020-12-02 22:03:44.538869', '2020-12-02 22:03:44.538869', 'Miniszenenkette', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (46, 1, '2020-12-02 22:03:44.672336', '2020-12-02 22:03:44.672336', 'Szenenmarathon', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (47, 1, '2020-12-02 22:03:44.80193', '2020-12-02 22:03:44.80193', 'Promiachterbahn', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (48, 1, '2020-12-02 22:03:44.933024', '2020-12-02 22:03:44.933024', 'Kontakt-Fünfer', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (49, 1, '2020-12-02 22:03:45.048545', '2020-12-02 22:03:45.048545', 'Reden bei Berührung', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (50, 1, '2020-12-02 22:03:45.191751', '2020-12-02 22:03:45.191751', 'Singen bei Berührung', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (51, 1, '2020-12-02 22:03:45.357614', '2020-12-02 22:03:45.357614', 'Refrain Groove', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (52, 1, '2020-12-02 22:03:45.499054', '2020-12-02 22:03:45.499054', 'Blindes Musical', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (53, 1, '2020-12-02 22:03:45.636678', '2020-12-02 22:03:45.636678', 'Madrigal', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (54, 1, '2020-12-02 22:03:45.808081', '2020-12-02 22:03:45.808081', 'Serenade II', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (55, 1, '2020-12-02 22:03:45.935429', '2020-12-02 22:03:45.935429', 'Serenade', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (56, 1, '2020-12-02 22:03:46.097385', '2020-12-02 22:03:46.097385', 'Singender Geschichtenerzähler', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (57, 1, '2020-12-02 22:03:46.225911', '2020-12-02 22:03:46.225911', 'Duett', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (58, 1, '2020-12-02 22:03:46.37861', '2020-12-02 22:03:46.37861', 'Wachsen und Schrumpfen gesungen', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (59, 1, '2020-12-02 22:03:46.516447', '2020-12-02 22:03:46.516447', 'Anette, die Nette', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (60, 1, '2020-12-02 22:03:46.629911', '2020-12-02 22:03:46.629911', 'Musik-Café', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (61, 1, '2020-12-02 22:03:46.75071', '2020-12-02 22:03:46.75071', 'Song Contest', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (62, 1, '2020-12-02 22:03:46.910991', '2020-12-02 22:03:46.910991', 'Klapphörnchen', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (63, 1, '2020-12-02 22:03:47.073377', '2020-12-02 22:03:47.073377', 'Sing was du denkst', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (64, 1, '2020-12-02 22:03:47.249171', '2020-12-02 22:03:47.249171', 'Gesungenes "Die"', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (65, 1, '2020-12-02 22:03:47.396692', '2020-12-02 22:03:47.396692', 'Lied mit Schluss', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (66, 1, '2020-12-02 22:03:47.526639', '2020-12-02 22:03:47.526639', 'Biografischer Song', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (67, 1, '2020-12-02 22:03:47.678183', '2020-12-02 22:03:47.678183', 'Modernes Musical', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (68, 1, '2020-12-02 22:03:47.807256', '2020-12-02 22:03:47.807256', 'Balladensänger', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (69, 1, '2020-12-02 22:03:47.936426', '2020-12-02 22:03:47.936426', 'Operetten-Persiflage', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (70, 1, '2020-12-02 22:03:48.065412', '2020-12-02 22:03:48.065412', 'Gleichzeitiges Reden', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (71, 1, '2020-12-02 22:03:48.220563', '2020-12-02 22:03:48.220563', 'Dialog singen', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (72, 1, '2020-12-02 22:03:48.387302', '2020-12-02 22:03:48.387302', 'Das klingt nach einem Lied', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (73, 1, '2020-12-02 22:03:48.531905', '2020-12-02 22:03:48.531905', 'Sing mit dem Ding', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (74, 1, '2020-12-02 22:03:48.652206', '2020-12-02 22:03:48.652206', 'Stummfilm', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (75, 1, '2020-12-02 22:03:48.763047', '2020-12-02 22:03:48.763047', 'Rampensau-Singen', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (76, 1, '2020-12-02 22:03:48.909654', '2020-12-02 22:03:48.909654', 'Gegensätzliches Doppelduo-Singen', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (77, 1, '2020-12-02 22:03:49.038495', '2020-12-02 22:03:49.038495', 'Singender Ratgeber', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (78, 1, '2020-12-02 22:03:49.183579', '2020-12-02 22:03:49.183579', 'Expertenspiel', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (79, 1, '2020-12-02 22:03:49.328748', '2020-12-02 22:03:49.328748', 'Die Entschuldigung', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (80, 1, '2020-12-02 22:03:49.453716', '2020-12-02 22:03:49.453716', 'Aufklärung des Verbrechens', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (81, 1, '2020-12-02 22:03:49.58031', '2020-12-02 22:03:49.58031', 'Die Eheberatung', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (82, 1, '2020-12-02 22:03:49.724456', '2020-12-02 22:03:49.724456', 'Boris', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (83, 1, '2020-12-02 22:03:49.85409', '2020-12-02 22:03:49.85409', 'Reklamation', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (84, 1, '2020-12-02 22:03:49.98059', '2020-12-02 22:03:49.98059', 'Marionettenspiel', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (85, 1, '2020-12-02 22:03:50.115188', '2020-12-02 22:03:50.115188', 'Da Doo Ron Ron', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (86, 1, '2020-12-02 22:03:50.258263', '2020-12-02 22:03:50.258263', 'Der Prophet', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (87, 1, '2020-12-02 22:03:50.372521', '2020-12-02 22:03:50.372521', 'Arbeitsamt', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (88, 1, '2020-12-02 22:03:50.489945', '2020-12-02 22:03:50.489945', 'Synchro Replay', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (89, 1, '2020-12-02 22:03:50.624997', '2020-12-02 22:03:50.624997', 'Cluedo', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (90, 1, '2020-12-02 22:03:50.786735', '2020-12-02 22:03:50.786735', 'Frageszene', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (91, 1, '2020-12-02 22:03:50.932126', '2020-12-02 22:03:50.932126', 'Du auch hier?', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (92, 1, '2020-12-02 22:03:51.071996', '2020-12-02 22:03:51.071996', 'Dr. Allwissend', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (93, 1, '2020-12-02 22:03:51.221625', '2020-12-02 22:03:51.221625', 'Briefwechsel', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (94, 1, '2020-12-02 22:03:51.328387', '2020-12-02 22:03:51.328387', 'Interview rückwärts', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (95, 1, '2020-12-02 22:03:51.458757', '2020-12-02 22:03:51.458757', 'Wort für Wort cross', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (96, 1, '2020-12-02 22:03:51.662546', '2020-12-02 22:03:51.662546', 'Worlds Worst (Der schlechteste...der Welt)', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (97, 1, '2020-12-02 22:03:51.817691', '2020-12-02 22:03:51.817691', 'Orakel', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (98, 1, '2020-12-02 22:03:51.946806', '2020-12-02 22:03:51.946806', 'Nachrichten', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (99, 1, '2020-12-02 22:03:52.085226', '2020-12-02 22:03:52.085226', 'Radio Mix', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (100, 1, '2020-12-02 22:03:52.217623', '2020-12-02 22:03:52.217623', 'Hörspiel', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (101, 1, '2020-12-02 22:03:52.345363', '2020-12-02 22:03:52.345363', 'Drei Telefonate', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (102, 1, '2020-12-02 22:03:52.497611', '2020-12-02 22:03:52.497611', 'Stegreifrede', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (103, 1, '2020-12-02 22:03:52.630375', '2020-12-02 22:03:52.630375', 'Blitzrunde', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (104, 1, '2020-12-02 22:03:52.765768', '2020-12-02 22:03:52.765768', 'Das Gewissen', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (105, 1, '2020-12-02 22:03:52.897506', '2020-12-02 22:03:52.897506', 'Ein-Wort-Geschichte', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (106, 1, '2020-12-02 22:03:53.033585', '2020-12-02 22:03:53.033585', 'Rückwärtsgehen', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (107, 1, '2020-12-02 22:03:53.166238', '2020-12-02 22:03:53.166238', 'Fortlaufende Geschichte ("Die")', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (108, 1, '2020-12-02 22:03:53.305372', '2020-12-02 22:03:53.305372', 'Fortlaufende Geschichte (Genres)', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (109, 1, '2020-12-02 22:03:53.413362', '2020-12-02 22:03:53.413362', 'Drei Tote', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (110, 1, '2020-12-02 22:03:53.534865', '2020-12-02 22:03:53.534865', 'Urlaubsreise', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (111, 1, '2020-12-02 22:03:53.656402', '2020-12-02 22:03:53.656402', 'Fragendes Kind', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (112, 1, '2020-12-02 22:03:53.791886', '2020-12-02 22:03:53.791886', 'Superszene', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (113, 1, '2020-12-02 22:03:54.187284', '2020-12-02 22:03:54.187284', 'Filmjournal', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (114, 1, '2020-12-02 22:03:54.306628', '2020-12-02 22:03:54.306628', 'Satz vervollständigen', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (115, 1, '2020-12-02 22:03:54.430986', '2020-12-02 22:03:54.430986', 'Marlowe', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (116, 1, '2020-12-02 22:03:54.55862', '2020-12-02 22:03:54.55862', 'Fingerzeig', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (117, 1, '2020-12-02 22:03:54.677932', '2020-12-02 22:03:54.677932', 'Typewriter', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (118, 1, '2020-12-02 22:03:54.806028', '2020-12-02 22:03:54.806028', 'Zugerufene Begriffe sofort einbauen', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (119, 1, '2020-12-02 22:03:54.953256', '2020-12-02 22:03:54.953256', 'Wie geht''s weiter?', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (120, 1, '2020-12-02 22:03:55.09593', '2020-12-02 22:03:55.09593', 'Souffleur', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (121, 1, '2020-12-02 22:03:55.363577', '2020-12-02 22:03:55.363577', 'Hupe und Glöckchen', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (122, 1, '2020-12-02 22:03:55.719502', '2020-12-02 22:03:55.719502', 'Gromolo-Switch', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (123, 1, '2020-12-02 22:03:56.074534', '2020-12-02 22:03:56.074534', 'Davor oder danach', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (124, 1, '2020-12-02 22:03:56.311623', '2020-12-02 22:03:56.311623', 'Einer für alle', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (125, 1, '2020-12-02 22:03:56.674041', '2020-12-02 22:03:56.674041', 'Halbwertzeit', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (126, 1, '2020-12-02 22:03:57.345493', '2020-12-02 22:03:57.345493', 'Wort-Replay', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (127, 1, '2020-12-02 22:03:57.564827', '2020-12-02 22:03:57.564827', 'Tod in einer Minute', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (128, 1, '2020-12-02 22:03:57.775316', '2020-12-02 22:03:57.775316', 'Märchenreplay', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (129, 1, '2020-12-02 22:03:58.108472', '2020-12-02 22:03:58.108472', 'Replay der hohen Künste', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (130, 1, '2020-12-02 22:03:58.354146', '2020-12-02 22:03:58.354146', 'Genrereplay', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (131, 1, '2020-12-02 22:03:58.72627', '2020-12-02 22:03:58.72627', 'Aus der Sicht von', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (132, 1, '2020-12-02 22:03:58.961279', '2020-12-02 22:03:58.961279', 'Das Buch', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (133, 1, '2020-12-02 22:03:59.210798', '2020-12-02 22:03:59.210798', 'Clickbait', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (134, 1, '2020-12-02 22:03:59.436339', '2020-12-02 22:03:59.436339', 'RECLAM-Spiel', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (135, 1, '2020-12-02 22:03:59.575989', '2020-12-02 22:03:59.575989', 'Horoskop', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (136, 1, '2020-12-02 22:03:59.710787', '2020-12-02 22:03:59.710787', 'Was nicht passieren darf', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (137, 1, '2020-12-02 22:03:59.813604', '2020-12-02 22:03:59.813604', 'Bücherparade', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (138, 1, '2020-12-02 22:03:59.952958', '2020-12-02 22:03:59.952958', 'Zitate', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (139, 1, '2020-12-02 22:04:00.074322', '2020-12-02 22:04:00.074322', 'Zettelspiel', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (140, 1, '2020-12-02 22:04:00.207443', '2020-12-02 22:04:00.207443', 'Stunt-Double', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (141, 1, '2020-12-02 22:04:00.364805', '2020-12-02 22:04:00.364805', 'Zahl Ding Farbe', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (142, 1, '2020-12-02 22:04:00.513283', '2020-12-02 22:04:00.513283', 'Mäusefallen', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (143, 1, '2020-12-02 22:04:00.627197', '2020-12-02 22:04:00.627197', 'Hut ab', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (144, 1, '2020-12-02 22:04:00.760426', '2020-12-02 22:04:00.760426', 'Sitzen Stehen Liegen', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (145, 1, '2020-12-02 22:04:00.896916', '2020-12-02 22:04:00.896916', 'Szene auf zwei Stockwerken', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (146, 1, '2020-12-02 22:04:01.020583', '2020-12-02 22:04:01.020583', 'Das Ding', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (147, 1, '2020-12-02 22:04:01.176181', '2020-12-02 22:04:01.176181', 'Gebärdendolmetscher', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (148, 1, '2020-12-02 22:04:01.338604', '2020-12-02 22:04:01.338604', 'Lebendige Szenerie', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (149, 1, '2020-12-02 22:04:01.500665', '2020-12-02 22:04:01.500665', 'Switch, Swop, Change', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (150, 1, '2020-12-02 22:04:01.640912', '2020-12-02 22:04:01.640912', 'Weiße Mäuse', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (151, 1, '2020-12-02 22:04:01.773708', '2020-12-02 22:04:01.773708', 'Reiz und Reaktion', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (152, 1, '2020-12-02 22:04:01.929755', '2020-12-02 22:04:01.929755', 'Alltagsolympiade', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (153, 1, '2020-12-02 22:04:02.095006', '2020-12-02 22:04:02.095006', 'Neue Wahl', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (154, 1, '2020-12-02 22:04:02.238457', '2020-12-02 22:04:02.238457', 'Peinliche Situationen', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (155, 1, '2020-12-02 22:04:02.376839', '2020-12-02 22:04:02.376839', 'Theatertod', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (156, 1, '2020-12-02 22:04:02.562387', '2020-12-02 22:04:02.562387', 'Zielstandbild', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (157, 1, '2020-12-02 22:04:02.736461', '2020-12-02 22:04:02.736461', 'Sagte sie/er nicht', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (158, 1, '2020-12-02 22:04:02.932102', '2020-12-02 22:04:02.932102', 'Die Erfindung von ...', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (159, 1, '2020-12-02 22:04:03.084053', '2020-12-02 22:04:03.084053', 'Der gute, der schlechte und der furchtbare Rat', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (160, 1, '2020-12-02 22:04:03.249913', '2020-12-02 22:04:03.249913', 'Wo ist Thomas?', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (161, 1, '2020-12-02 22:04:03.394951', '2020-12-02 22:04:03.394951', 'Rollback', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (162, 1, '2020-12-02 22:04:03.54551', '2020-12-02 22:04:03.54551', 'Drei Regeln', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (163, 1, '2020-12-02 22:04:03.662634', '2020-12-02 22:04:03.662634', 'Einer schweigt', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (164, 1, '2020-12-02 22:04:03.792696', '2020-12-02 22:04:03.792696', 'Sprechende Tiere', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (165, 1, '2020-12-02 22:04:03.932216', '2020-12-02 22:04:03.932216', 'Sagte er', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (166, 1, '2020-12-02 22:04:04.069597', '2020-12-02 22:04:04.069597', 'Prequel - sequel', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (167, 1, '2020-12-02 22:04:04.183492', '2020-12-02 22:04:04.183492', 'Tod in einer Minute', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (168, 1, '2020-12-02 22:04:04.316774', '2020-12-02 22:04:04.316774', 'Letzter Satz', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (169, 1, '2020-12-02 22:04:04.457533', '2020-12-02 22:04:04.457533', 'Fundus', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (170, 1, '2020-12-02 22:04:04.605696', '2020-12-02 22:04:04.605696', 'Gefundene Gegenstände', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (171, 1, '2020-12-02 22:04:04.748144', '2020-12-02 22:04:04.748144', 'Bring dein Ding', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (172, 1, '2020-12-02 22:04:05.16366', '2020-12-02 22:04:05.16366', 'Entfremdete Gegenstände', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (173, 1, '2020-12-02 22:04:05.320581', '2020-12-02 22:04:05.320581', 'Klassischer Statuswechsel', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (174, 1, '2020-12-02 22:04:05.503518', '2020-12-02 22:04:05.503518', 'Hackordnung', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (175, 1, '2020-12-02 22:04:05.630061', '2020-12-02 22:04:05.630061', 'Wechsel-Zweier-Synchro', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (176, 1, '2020-12-02 22:04:05.770319', '2020-12-02 22:04:05.770319', 'Farbwechsel', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (177, 1, '2020-12-02 22:04:05.906549', '2020-12-02 22:04:05.906549', 'Potpourri', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (178, 1, '2020-12-02 22:04:06.026082', '2020-12-02 22:04:06.026082', 'Rollentausch', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (179, 1, '2020-12-02 22:04:06.149615', '2020-12-02 22:04:06.149615', 'Bingo', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (180, 1, '2020-12-02 22:04:06.271319', '2020-12-02 22:04:06.271319', 'Weiter in meinem Genre', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (181, 1, '2020-12-02 22:04:06.422235', '2020-12-02 22:04:06.422235', 'Orte-Switch', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (182, 1, '2020-12-02 22:04:06.576547', '2020-12-02 22:04:06.576547', 'Diashow', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (183, 1, '2020-12-02 22:04:06.709457', '2020-12-02 22:04:06.709457', 'Der böse Zwilling', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (184, 1, '2020-12-02 22:04:06.823938', '2020-12-02 22:04:06.823938', 'Solo-Dreieck', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (185, 1, '2020-12-02 22:04:06.944881', '2020-12-02 22:04:06.944881', 'Bandwurm', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (186, 1, '2020-12-02 22:04:07.084647', '2020-12-02 22:04:07.084647', 'Schizo Blind date', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (187, 1, '2020-12-02 22:04:07.210982', '2020-12-02 22:04:07.210982', 'Tierachterbahn', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (188, 1, '2020-12-02 22:04:07.337185', '2020-12-02 22:04:07.337185', 'Verkaufs-Show', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (189, 1, '2020-12-02 22:04:07.479595', '2020-12-02 22:04:07.479595', 'Blind Synchro', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (190, 1, '2020-12-02 22:04:07.597618', '2020-12-02 22:04:07.597618', 'Double Speech', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (191, 1, '2020-12-02 22:04:07.710028', '2020-12-02 22:04:07.710028', 'Zweier-Synchro', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (192, 1, '2020-12-02 22:04:07.816244', '2020-12-02 22:04:07.816244', 'Dreier-Synchro', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (193, 1, '2020-12-02 22:04:07.942682', '2020-12-02 22:04:07.942682', 'Jasager', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (194, 1, '2020-12-02 22:04:08.082133', '2020-12-02 22:04:08.082133', 'Playback Show', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (195, 1, '2020-12-02 22:04:08.228715', '2020-12-02 22:04:08.228715', 'Positiv sein (Übung)', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (196, 1, '2020-12-02 22:04:08.376452', '2020-12-02 22:04:08.376452', '4 Satz Geschichte', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (197, 1, '2020-12-02 22:04:08.559666', '2020-12-02 22:04:08.559666', 'Szenenmix 10x20', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (198, 1, '2020-12-02 22:04:08.786938', '2020-12-02 22:04:08.786938', 'Ja genau, und weil...', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (199, 1, '2020-12-02 22:04:08.906993', '2020-12-02 22:04:08.906993', 'Glücklicherweise, unglücklicherweise', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (200, 1, '2020-12-02 22:04:09.027802', '2020-12-02 22:04:09.027802', 'Ja genau, und dann...', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (201, 1, '2020-12-02 22:04:09.157785', '2020-12-02 22:04:09.157785', 'Geschenke pflücken', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (202, 1, '2020-12-02 22:04:09.293806', '2020-12-02 22:04:09.293806', 'Exzellenzen Spiel', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (203, 1, '2020-12-02 22:04:09.412027', '2020-12-02 22:04:09.412027', 'Bank einnehmen', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (204, 1, '2020-12-02 22:04:09.532107', '2020-12-02 22:04:09.532107', 'Geschichte erzählen', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (205, 1, '2020-12-02 22:04:09.648287', '2020-12-02 22:04:09.648287', 'Büroklammer Spiel', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (206, 1, '2020-12-02 22:04:09.808534', '2020-12-02 22:04:09.808534', 'Würzburger Opernball', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (207, 1, '2020-12-02 22:04:09.948085', '2020-12-02 22:04:09.948085', 'Ich hab ne bessere Idee!', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (208, 1, '2020-12-02 22:04:10.077968', '2020-12-02 22:04:10.077968', 'Ja, aber', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (209, 1, '2020-12-02 22:04:10.223082', '2020-12-02 22:04:10.223082', 'Stören', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (210, 1, '2020-12-02 22:04:10.372144', '2020-12-02 22:04:10.372144', 'Absonderlicher Nachbar', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (211, 1, '2020-12-02 22:04:10.480644', '2020-12-02 22:04:10.480644', 'Spit-Fire', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (212, 1, '2020-12-02 22:04:10.610128', '2020-12-02 22:04:10.610128', 'Best Side Story', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (213, 1, '2020-12-02 22:04:10.764554', '2020-12-02 22:04:10.764554', 'Kreuzverhör', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (214, 1, '2020-12-02 22:04:10.88001', '2020-12-02 22:04:10.88001', 'Sanfte Manipulation - Dressur', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (215, 1, '2020-12-02 22:04:11.217314', '2020-12-02 22:04:11.217314', 'Boom Boom Chicago', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (216, 1, '2020-12-02 22:04:11.447888', '2020-12-02 22:04:11.447888', 'König', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (217, 1, '2020-12-02 22:04:11.572627', '2020-12-02 22:04:11.572627', 'Jeopardy', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (218, 1, '2020-12-02 22:04:11.693935', '2020-12-02 22:04:11.693935', 'Andere Reaktion', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (219, 1, '2020-12-02 22:04:11.919331', '2020-12-02 22:04:11.919331', 'Szenenmix 10 mal 20', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (220, 1, '2020-12-02 22:04:12.318357', '2020-12-02 22:04:12.318357', 'Zweierassoziation', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (221, 1, '2020-12-02 22:04:12.440356', '2020-12-02 22:04:12.440356', 'Ich bin ein Baum', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (222, 1, '2020-12-02 22:04:12.568018', '2020-12-02 22:04:12.568018', 'Five Things (Fünf Dinge)', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (223, 1, '2020-12-02 22:04:12.690359', '2020-12-02 22:04:12.690359', 'Wortschwung', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (224, 1, '2020-12-02 22:04:12.811522', '2020-12-02 22:04:12.811522', 'Assoziationskreis', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (225, 1, '2020-12-02 22:04:12.917306', '2020-12-02 22:04:12.917306', 'Assoziation Substantiv Adjektiv', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (226, 1, '2020-12-02 22:04:13.039477', '2020-12-02 22:04:13.039477', 'Dissoziation', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (227, 1, '2020-12-02 22:04:13.171147', '2020-12-02 22:04:13.171147', 'Assoziationsrunde', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (228, 1, '2020-12-02 22:04:13.317764', '2020-12-02 22:04:13.317764', 'Lunge leer', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (229, 1, '2020-12-02 22:04:13.454491', '2020-12-02 22:04:13.454491', 'Atemübung', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (230, 1, '2020-12-02 22:04:13.576181', '2020-12-02 22:04:13.576181', 'Zwerchfell-Training', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (231, 1, '2020-12-02 22:04:13.697276', '2020-12-02 22:04:13.697276', 'Mimik raten', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (232, 1, '2020-12-02 22:04:13.825609', '2020-12-02 22:04:13.825609', 'Künstlich weinen', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (233, 1, '2020-12-02 22:04:13.936881', '2020-12-02 22:04:13.936881', 'Genießen von Speis'' und Trank', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (234, 1, '2020-12-02 22:04:14.053365', '2020-12-02 22:04:14.053365', 'Laut-stumm-Spiel', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (235, 1, '2020-12-02 22:04:14.171548', '2020-12-02 22:04:14.171548', 'Ja - Nein', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (236, 1, '2020-12-02 22:04:14.282595', '2020-12-02 22:04:14.282595', 'Mantra', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (237, 1, '2020-12-02 22:04:14.399027', '2020-12-02 22:04:14.399027', 'Mimik', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (238, 1, '2020-12-02 22:04:14.517016', '2020-12-02 22:04:14.517016', 'Beschimpfung', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (239, 1, '2020-12-02 22:04:14.645753', '2020-12-02 22:04:14.645753', 'Steigerung', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (240, 1, '2020-12-02 22:04:14.780566', '2020-12-02 22:04:14.780566', 'Ball-Metamorphose', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (241, 1, '2020-12-02 22:04:14.923361', '2020-12-02 22:04:14.923361', 'Zeitlupenschlägerei', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (242, 1, '2020-12-02 22:04:15.061021', '2020-12-02 22:04:15.061021', 'Nach der Katastrophenmitteilung', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (243, 1, '2020-12-02 22:04:15.179702', '2020-12-02 22:04:15.179702', 'Wartezimmer', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (244, 1, '2020-12-02 22:04:15.311607', '2020-12-02 22:04:15.311607', 'Ampel', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (245, 1, '2020-12-02 22:04:15.439739', '2020-12-02 22:04:15.439739', 'Mimik spiegeln', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (246, 1, '2020-12-02 22:04:15.562345', '2020-12-02 22:04:15.562345', 'Figur entwickeln', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (247, 1, '2020-12-02 22:04:15.676606', '2020-12-02 22:04:15.676606', 'Szenenanfänge', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (248, 1, '2020-12-02 22:04:15.799443', '2020-12-02 22:04:15.799443', 'Ergänzungsübung', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (249, 1, '2020-12-02 22:04:15.952872', '2020-12-02 22:04:15.952872', 'Statue - Szenenanfang', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (250, 1, '2020-12-02 22:04:16.085473', '2020-12-02 22:04:16.085473', 'Neue Wahl  - Basisinformationen', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (251, 1, '2020-12-02 22:04:16.231369', '2020-12-02 22:04:16.231369', 'Stille Post - Monolog', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (252, 1, '2020-12-02 22:04:16.369969', '2020-12-02 22:04:16.369969', 'Genre Talkshow', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (253, 1, '2020-12-02 22:04:16.591148', '2020-12-02 22:04:16.591148', 'Hologramm', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (254, 1, '2020-12-02 22:04:16.821687', '2020-12-02 22:04:16.821687', 'Charakterübung', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (255, 1, '2020-12-02 22:04:16.945954', '2020-12-02 22:04:16.945954', 'Betty Plum', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (256, 1, '2020-12-02 22:04:17.077257', '2020-12-02 22:04:17.077257', 'Person entwickeln', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (257, 1, '2020-12-02 22:04:17.235663', '2020-12-02 22:04:17.235663', 'Führender Körperteil', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (258, 1, '2020-12-02 22:04:17.375944', '2020-12-02 22:04:17.375944', 'Das innere Tier', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (259, 1, '2020-12-02 22:04:17.60778', '2020-12-02 22:04:17.60778', 'Der heilige Gral', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (260, 1, '2020-12-02 22:04:17.73256', '2020-12-02 22:04:17.73256', 'Fast Food Laban', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (261, 1, '2020-12-02 22:04:17.851922', '2020-12-02 22:04:17.851922', 'Fast Food Stanislawski', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (262, 1, '2020-12-02 22:04:18.090154', '2020-12-02 22:04:18.090154', 'Zoom und Gefühl', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (263, 1, '2020-12-02 22:04:18.363804', '2020-12-02 22:04:18.363804', 'Geschichten gleichzeitig erzählen', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (264, 1, '2020-12-02 22:04:18.499475', '2020-12-02 22:04:18.499475', 'Perlenkette', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (265, 1, '2020-12-02 22:04:18.753766', '2020-12-02 22:04:18.753766', 'Entdeckung des Kinds in einem', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (266, 1, '2020-12-02 22:04:18.876766', '2020-12-02 22:04:18.876766', 'Es war einmal - Modell', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (267, 1, '2020-12-02 22:04:19.240684', '2020-12-02 22:04:19.240684', 'Fantasiegeschichte mit Fragen', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (268, 1, '2020-12-02 22:04:19.384904', '2020-12-02 22:04:19.384904', 'Voranbringen und Illustrieren', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (269, 1, '2020-12-02 22:04:19.522284', '2020-12-02 22:04:19.522284', 'HED', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (270, 1, '2020-12-02 22:04:19.734749', '2020-12-02 22:04:19.734749', 'Ich bin ein Star', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (271, 1, '2020-12-02 22:04:19.939288', '2020-12-02 22:04:19.939288', 'Wahrheit und Lüge', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (272, 1, '2020-12-02 22:04:20.084339', '2020-12-02 22:04:20.084339', 'Boing - Wusch - Zwong', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (273, 1, '2020-12-02 22:04:20.204974', '2020-12-02 22:04:20.204974', 'Begriffskreis', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (274, 1, '2020-12-02 22:04:20.34641', '2020-12-02 22:04:20.34641', 'Verschobener Fragenkreis', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (275, 1, '2020-12-02 22:04:20.487568', '2020-12-02 22:04:20.487568', 'Assoziationskreis mit Wiederholung', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (276, 1, '2020-12-02 22:04:20.625783', '2020-12-02 22:04:20.625783', 'You', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (277, 1, '2020-12-02 22:04:20.770831', '2020-12-02 22:04:20.770831', 'Am laufenden Band', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (278, 1, '2020-12-02 22:04:20.915759', '2020-12-02 22:04:20.915759', 'Schnittmuster', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (279, 1, '2020-12-02 22:04:21.095072', '2020-12-02 22:04:21.095072', 'Ich packe meine Koffer und nehme mit', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (280, 1, '2020-12-02 22:04:21.248331', '2020-12-02 22:04:21.248331', 'Neues Haus', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (281, 1, '2020-12-02 22:04:21.401911', '2020-12-02 22:04:21.401911', 'ZoomSchwartzMakeafikeliano', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (282, 1, '2020-12-02 22:04:21.547935', '2020-12-02 22:04:21.547935', 'Kreiskrabbeln', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (283, 1, '2020-12-02 22:04:21.666876', '2020-12-02 22:04:21.666876', 'Vortritt - Rücktritt', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (284, 1, '2020-12-02 22:04:21.790579', '2020-12-02 22:04:21.790579', 'Hey und Ho', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (285, 1, '2020-12-02 22:04:21.909098', '2020-12-02 22:04:21.909098', 'Rhythmusübungen', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (286, 1, '2020-12-02 22:04:22.033418', '2020-12-02 22:04:22.033418', 'Maschine', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (287, 1, '2020-12-02 22:04:22.155347', '2020-12-02 22:04:22.155347', 'Der schlafende Mensch', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (288, 1, '2020-12-02 22:04:22.297662', '2020-12-02 22:04:22.297662', 'Blinzelmörder', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (289, 1, '2020-12-02 22:04:22.432456', '2020-12-02 22:04:22.432456', 'Bilder bauen', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (290, 1, '2020-12-02 22:04:22.567347', '2020-12-02 22:04:22.567347', 'Wo ist...?', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (291, 1, '2020-12-02 22:04:22.677974', '2020-12-02 22:04:22.677974', 'Der strenge Chef', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (292, 1, '2020-12-02 22:04:22.79053', '2020-12-02 22:04:22.79053', 'Namenskreis', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (293, 1, '2020-12-02 22:04:22.91525', '2020-12-02 22:04:22.91525', 'Imitationskreis', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (294, 1, '2020-12-02 22:04:23.050975', '2020-12-02 22:04:23.050975', 'Wahrnehmungskreis', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (295, 1, '2020-12-02 22:04:23.197132', '2020-12-02 22:04:23.197132', 'Geräuschdusche', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (296, 1, '2020-12-02 22:04:23.317976', '2020-12-02 22:04:23.317976', 'Folge dem Folgenden', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (297, 1, '2020-12-02 22:04:23.422598', '2020-12-02 22:04:23.422598', 'Hot Spot', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (298, 1, '2020-12-02 22:04:23.546409', '2020-12-02 22:04:23.546409', 'Bewegungsimpuls durch Berührung', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (299, 1, '2020-12-02 22:04:23.680936', '2020-12-02 22:04:23.680936', 'Routinehandlungen interessanter machen', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (300, 1, '2020-12-02 22:04:23.954868', '2020-12-02 22:04:23.954868', 'Bewegungsimpulsen folgen', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (301, 1, '2020-12-02 22:04:24.110496', '2020-12-02 22:04:24.110496', 'Was machst du', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (302, 1, '2020-12-02 22:04:24.2273', '2020-12-02 22:04:24.2273', 'Multitasking', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (303, 1, '2020-12-02 22:04:24.340603', '2020-12-02 22:04:24.340603', 'Auf Linie', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (304, 1, '2020-12-02 22:04:24.504811', '2020-12-02 22:04:24.504811', 'Dinge anders benennen', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (305, 1, '2020-12-02 22:04:24.641211', '2020-12-02 22:04:24.641211', 'Gegenteil', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (306, 1, '2020-12-02 22:04:24.773139', '2020-12-02 22:04:24.773139', 'Überforderung des Zuhörers', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (307, 1, '2020-12-02 22:04:24.918063', '2020-12-02 22:04:24.918063', 'Gesangsassoziation', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (308, 1, '2020-12-02 22:04:25.152086', '2020-12-02 22:04:25.152086', 'Glockenturm', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (309, 1, '2020-12-02 22:04:25.361276', '2020-12-02 22:04:25.361276', 'Gähnübung', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (310, 1, '2020-12-02 22:04:25.467406', '2020-12-02 22:04:25.467406', 'Einsingen', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (311, 1, '2020-12-02 22:04:25.592668', '2020-12-02 22:04:25.592668', 'Sologesang mit Tempowechsel', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (312, 1, '2020-12-02 22:04:25.738602', '2020-12-02 22:04:25.738602', 'Vokalsingen', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (313, 1, '2020-12-02 22:04:25.865297', '2020-12-02 22:04:25.865297', 'Ton abnehmen', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (314, 1, '2020-12-02 22:04:25.98766', '2020-12-02 22:04:25.98766', 'Gesangskreis mit Refrain', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (315, 1, '2020-12-02 22:04:26.12892', '2020-12-02 22:04:26.12892', 'Ton treffen', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (316, 1, '2020-12-02 22:04:26.338673', '2020-12-02 22:04:26.338673', 'Emotionales Singen', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (317, 1, '2020-12-02 22:04:26.457547', '2020-12-02 22:04:26.457547', 'Stimmvolumentraining', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (318, 1, '2020-12-02 22:04:26.58767', '2020-12-02 22:04:26.58767', 'Nachtigall', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (319, 1, '2020-12-02 22:04:26.733306', '2020-12-02 22:04:26.733306', 'Gesangskreis', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (320, 1, '2020-12-02 22:04:26.856996', '2020-12-02 22:04:26.856996', 'Roboter', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (321, 1, '2020-12-02 22:04:27.007361', '2020-12-02 22:04:27.007361', 'Handflächen berühren', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (322, 1, '2020-12-02 22:04:27.136885', '2020-12-02 22:04:27.136885', 'Raubkatzen-Nadel', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (323, 1, '2020-12-02 22:04:27.27164', '2020-12-02 22:04:27.27164', 'Spiegelübungen', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (324, 1, '2020-12-02 22:04:27.381647', '2020-12-02 22:04:27.381647', 'Führungsübungen', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (325, 1, '2020-12-02 22:04:27.519356', '2020-12-02 22:04:27.519356', 'Vorgehen - Nachgehen', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (326, 1, '2020-12-02 22:04:27.800498', '2020-12-02 22:04:27.800498', 'Gegenstand pantomimisch umdefinieren', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (327, 1, '2020-12-02 22:04:27.922993', '2020-12-02 22:04:27.922993', 'Raum einrichten (Übung)', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (328, 1, '2020-12-02 22:04:28.046721', '2020-12-02 22:04:28.046721', 'Danke', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (329, 1, '2020-12-02 22:04:28.167134', '2020-12-02 22:04:28.167134', 'Größer machen', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (330, 1, '2020-12-02 22:04:28.308533', '2020-12-02 22:04:28.308533', 'Namensdialog', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (331, 1, '2020-12-02 22:04:28.57946', '2020-12-02 22:04:28.57946', 'Gestenkette', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (332, 1, '2020-12-02 22:04:28.720308', '2020-12-02 22:04:28.720308', 'Pantomime mit Handzeichengeben', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (333, 1, '2020-12-02 22:04:28.843979', '2020-12-02 22:04:28.843979', 'Rauminstallation', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (334, 1, '2020-12-02 22:04:28.970748', '2020-12-02 22:04:28.970748', 'Reimkreis 2', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (335, 1, '2020-12-02 22:04:29.109419', '2020-12-02 22:04:29.109419', 'Was ist ein Was?', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (336, 1, '2020-12-02 22:04:29.253002', '2020-12-02 22:04:29.253002', 'Reimkreis', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (337, 1, '2020-12-02 22:04:29.396955', '2020-12-02 22:04:29.396955', 'Bauernregel', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (338, 1, '2020-12-02 22:04:29.532775', '2020-12-02 22:04:29.532775', 'Zug um Zug', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (339, 1, '2020-12-02 22:04:29.658182', '2020-12-02 22:04:29.658182', 'Raumlauf', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (340, 1, '2020-12-02 22:04:29.797949', '2020-12-02 22:04:29.797949', 'Klatschen zu dritt', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (341, 1, '2020-12-02 22:04:29.951568', '2020-12-02 22:04:29.951568', 'Ah - Stirb', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (342, 1, '2020-12-02 22:04:30.072046', '2020-12-02 22:04:30.072046', 'Hut klauen', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (343, 1, '2020-12-02 22:04:30.189546', '2020-12-02 22:04:30.189546', 'Bipeldibipeldibopp', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (344, 1, '2020-12-02 22:04:30.353028', '2020-12-02 22:04:30.353028', 'Kennedy', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (345, 1, '2020-12-02 22:04:30.547972', '2020-12-02 22:04:30.547972', 'Klatschkreis', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (346, 1, '2020-12-02 22:04:30.708861', '2020-12-02 22:04:30.708861', 'Gehen mit Geschwindigkeitsstufen', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (347, 1, '2020-12-02 22:04:30.848316', '2020-12-02 22:04:30.848316', 'Vokalkette', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (348, 1, '2020-12-02 22:04:31.013328', '2020-12-02 22:04:31.013328', 'Gedankenspiel', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (349, 1, '2020-12-02 22:04:31.284677', '2020-12-02 22:04:31.284677', 'Mehrköpfiger Experte', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (350, 1, '2020-12-02 22:04:31.542537', '2020-12-02 22:04:31.542537', 'Active Post', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (351, 1, '2020-12-02 22:04:31.675542', '2020-12-02 22:04:31.675542', 'Big Booty', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (352, 1, '2020-12-02 22:04:31.874754', '2020-12-02 22:04:31.874754', 'Gromolokreis', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (353, 1, '2020-12-02 22:04:32.03563', '2020-12-02 22:04:32.03563', 'Partner-Entspannungsübung', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (354, 1, '2020-12-02 22:04:32.181606', '2020-12-02 22:04:32.181606', 'Hilfe!', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (355, 1, '2020-12-02 22:04:32.299307', '2020-12-02 22:04:32.299307', 'Groovelicious', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (356, 1, '2020-12-02 22:04:32.431708', '2020-12-02 22:04:32.431708', 'Es ist Dienstag', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (357, 1, '2020-12-02 22:04:32.699736', '2020-12-02 22:04:32.699736', 'Statusraten', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (358, 1, '2020-12-02 22:04:32.843349', '2020-12-02 22:04:32.843349', 'Einer zuviel', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (359, 1, '2020-12-02 22:04:32.980452', '2020-12-02 22:04:32.980452', 'Statusgruppe', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (360, 1, '2020-12-02 22:04:33.108303', '2020-12-02 22:04:33.108303', 'Statuskette', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (361, 1, '2020-12-02 22:04:33.218', '2020-12-02 22:04:33.218', 'Begegnungen', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (362, 1, '2020-12-02 22:04:33.331796', '2020-12-02 22:04:33.331796', 'Tanzen mit "Lichtpunkt"', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (363, 1, '2020-12-02 22:04:33.474611', '2020-12-02 22:04:33.474611', 'Choreographie-Übung', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (364, 1, '2020-12-02 22:04:33.620071', '2020-12-02 22:04:33.620071', 'Summtore', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (365, 1, '2020-12-02 22:04:33.780016', '2020-12-02 22:04:33.780016', 'Fallen lassen', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (366, 1, '2020-12-02 22:04:33.931493', '2020-12-02 22:04:33.931493', 'Menschliche Wand', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (367, 1, '2020-12-02 22:04:34.06413', '2020-12-02 22:04:34.06413', 'Gehen mit Aggregatzuständen', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (368, 1, '2020-12-02 22:04:34.179451', '2020-12-02 22:04:34.179451', 'Gehen und Stehen', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (369, 1, '2020-12-02 22:04:34.416053', '2020-12-02 22:04:34.416053', 'Festgehalten bewegen, dann gehen', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (370, 1, '2020-12-02 22:04:34.570967', '2020-12-02 22:04:34.570967', 'Wasserpflanze', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (371, 1, '2020-12-02 22:04:34.691616', '2020-12-02 22:04:34.691616', 'Lästerschwestern', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (372, 1, '2020-12-02 22:04:34.928466', '2020-12-02 22:04:34.928466', 'Gefühlskreis 2', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (373, 1, '2020-12-02 22:04:35.039438', '2020-12-02 22:04:35.039438', 'Liebe - Hass - Angst', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (374, 1, '2020-12-02 22:04:35.143508', '2020-12-02 22:04:35.143508', 'Kino', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (375, 1, '2020-12-02 22:04:35.250208', '2020-12-02 22:04:35.250208', 'Gefühlskreis 3', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (376, 1, '2020-12-02 22:04:35.387997', '2020-12-02 22:04:35.387997', 'Gefühlskreis', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (377, 1, '2020-12-02 22:04:35.53073', '2020-12-02 22:04:35.53073', 'Obstkreis', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (378, 1, '2020-12-02 22:04:35.668186', '2020-12-02 22:04:35.668186', 'Lachparade', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (379, 1, '2020-12-02 22:04:35.945184', '2020-12-02 22:04:35.945184', 'Gesichtsmaske abnehmen', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (380, 1, '2020-12-02 22:04:36.091347', '2020-12-02 22:04:36.091347', 'I have a Mango', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (381, 1, '2020-12-02 22:04:36.31954', '2020-12-02 22:04:36.31954', 'Gerüchte', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (382, 1, '2020-12-02 22:04:36.460093', '2020-12-02 22:04:36.460093', 'Whiskeymixer', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (383, 1, '2020-12-02 22:04:36.589386', '2020-12-02 22:04:36.589386', 'Ausserirdischer Tiger Kuh', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (384, 1, '2020-12-02 22:04:36.853404', '2020-12-02 22:04:36.853404', 'König von Siam', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (385, 1, '2020-12-02 22:04:36.968976', '2020-12-02 22:04:36.968976', 'Blinzeln-Platzwechsel', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (386, 1, '2020-12-02 22:04:37.099677', '2020-12-02 22:04:37.099677', 'Fred Schneider', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (387, 1, '2020-12-02 22:04:37.244227', '2020-12-02 22:04:37.244227', 'Ruf und Antwort', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (388, 1, '2020-12-02 22:04:37.378061', '2020-12-02 22:04:37.378061', 'Johannes', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (389, 1, '2020-12-02 22:04:37.526037', '2020-12-02 22:04:37.526037', 'Scharade - falsch verstehen', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (390, 1, '2020-12-02 22:04:37.674409', '2020-12-02 22:04:37.674409', 'Zählen im Kreis mit Gesten', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (391, 1, '2020-12-02 22:04:38.086652', '2020-12-02 22:04:38.086652', 'Kitty wants a corner', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (392, 1, '2020-12-02 22:04:38.23265', '2020-12-02 22:04:38.23265', 'Samurai', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (393, 1, '2020-12-02 22:04:38.361072', '2020-12-02 22:04:38.361072', 'Geräuschball', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (394, 1, '2020-12-02 22:04:38.479063', '2020-12-02 22:04:38.479063', '1-2-3-4-5-6-7-8', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (395, 1, '2020-12-02 22:04:38.612083', '2020-12-02 22:04:38.612083', 'Mr. Hit me', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (396, 1, '2020-12-02 22:04:38.945521', '2020-12-02 22:04:38.945521', 'Gemeinsam zählen', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (397, 1, '2020-12-02 22:04:39.334035', '2020-12-02 22:04:39.334035', 'Bunny - Bunny', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (398, 1, '2020-12-02 22:04:39.465505', '2020-12-02 22:04:39.465505', 'Genmanipulierte Maus', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (399, 1, '2020-12-02 22:04:39.732637', '2020-12-02 22:04:39.732637', 'Barney', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (400, 1, '2020-12-02 22:04:39.854435', '2020-12-02 22:04:39.854435', 'Schneller Tod', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (401, 1, '2020-12-02 22:04:39.991257', '2020-12-02 22:04:39.991257', 'Zip Zoom Boing', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (402, 1, '2020-12-02 22:04:40.23057', '2020-12-02 22:04:40.23057', 'Gordischer Knoten', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (403, 1, '2020-12-02 22:04:40.438499', '2020-12-02 22:04:40.438499', 'Namenssilben', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (404, 1, '2020-12-02 22:04:40.542174', '2020-12-02 22:04:40.542174', 'Das Monster', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (405, 1, '2020-12-02 22:04:40.669743', '2020-12-02 22:04:40.669743', 'Zwei Kreise', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (406, 1, '2020-12-02 22:04:40.787011', '2020-12-02 22:04:40.787011', 'Die ulkige Ulrike', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (407, 1, '2020-12-02 22:04:40.913031', '2020-12-02 22:04:40.913031', 'Luftballons', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (408, 1, '2020-12-02 22:04:41.46508', '2020-12-02 22:04:41.46508', 'Vier Ecken', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (409, 1, '2020-12-02 22:04:41.581921', '2020-12-02 22:04:41.581921', 'Namen abklatschen', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (410, 1, '2020-12-02 22:04:41.717522', '2020-12-02 22:04:41.717522', 'Gruppenbildung', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (411, 1, '2020-12-02 22:04:41.831319', '2020-12-02 22:04:41.831319', 'Körper verstecken', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (412, 1, '2020-12-02 22:04:42.589745', '2020-12-02 22:04:42.589745', 'Simon says', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (413, 1, '2020-12-02 22:04:42.714282', '2020-12-02 22:04:42.714282', 'Bums', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (414, 1, '2020-12-02 22:04:42.846628', '2020-12-02 22:04:42.846628', '3 X anders', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (415, 1, '2020-12-02 22:04:42.988927', '2020-12-02 22:04:42.988927', 'Klick - Peng', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (416, 1, '2020-12-02 22:04:43.113604', '2020-12-02 22:04:43.113604', 'Schwert des Samurai', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (417, 1, '2020-12-02 22:04:43.474995', '2020-12-02 22:04:43.474995', 'Fangenspiele', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (418, 1, '2020-12-02 22:04:43.723924', '2020-12-02 22:04:43.723924', 'Au ja', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (419, 1, '2020-12-02 22:04:43.965174', '2020-12-02 22:04:43.965174', 'Haus - Bewohner - Flut', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (420, 1, '2020-12-02 22:04:44.229788', '2020-12-02 22:04:44.229788', 'Wer hat Angst vorm Schwarzen Mann?', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (421, 1, '2020-12-02 22:04:44.361525', '2020-12-02 22:04:44.361525', 'Sträflingslauf', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (422, 1, '2020-12-02 22:04:44.598655', '2020-12-02 22:04:44.598655', 'Begrüßung', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (423, 1, '2020-12-02 22:04:44.722762', '2020-12-02 22:04:44.722762', 'Ritter, Pferde und Kavaliere', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (424, 1, '2020-12-02 22:04:45.126614', '2020-12-02 22:04:45.126614', 'Online Adaption für einen Raumlauf', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (425, 1, '2020-12-02 22:04:45.361187', '2020-12-02 22:04:45.361187', 'Namen mit Körper schreiben', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (426, 1, '2020-12-02 22:04:45.496552', '2020-12-02 22:04:45.496552', 'Sympathie - Antipathie', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (427, 1, '2020-12-02 22:04:45.638445', '2020-12-02 22:04:45.638445', 'Follow the King', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (428, 1, '2020-12-02 22:04:45.881329', '2020-12-02 22:04:45.881329', 'Dreieck', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (429, 1, '2020-12-02 22:04:46.002586', '2020-12-02 22:04:46.002586', 'Feuer - Wasser - Wind', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (430, 1, '2020-12-02 22:04:46.133262', '2020-12-02 22:04:46.133262', 'Autowaschanlage', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (431, 1, '2020-12-02 22:04:47.291891', '2020-12-02 22:04:47.291891', 'Menschen, Hände, Füße', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (432, 1, '2020-12-02 22:04:47.440369', '2020-12-02 22:04:47.440369', 'Moleküle bilden', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (433, 1, '2020-12-02 22:04:47.565838', '2020-12-02 22:04:47.565838', 'Be my fan', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (434, 1, '2020-12-02 22:04:48.831512', '2020-12-02 22:04:48.831512', 'Virus', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (435, 1, '2020-12-02 22:04:49.800519', '2020-12-02 22:04:49.800519', 'Eisblock', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (436, 1, '2020-12-02 22:04:49.914701', '2020-12-02 22:04:49.914701', 'Handschlange', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (437, 1, '2020-12-02 22:04:50.027261', '2020-12-02 22:04:50.027261', 'Die Endlosschlange', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (438, 1, '2020-12-02 22:04:50.165888', '2020-12-02 22:04:50.165888', 'Drill Sergeant', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');
INSERT INTO public.license VALUES (439, 1, '2020-12-02 22:04:50.299407', '2020-12-02 22:04:50.299407', 'Fingerschnipsen', 'Improwiki.com', 'https://improwiki.com/de', 'CC BY-SA 3.0 DE', 'https://improwiki.com/de/lizenz', 'Verweise entfernt, Text angepasst');


--
-- TOC entry 2921 (class 0 OID 16387)
-- Dependencies: 197
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.migrations VALUES (1, 1605381212500, 'InitialSchema1605381212500');


--
-- TOC entry 2927 (class 0 OID 16428)
-- Dependencies: 203
-- Data for Name: part; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.part VALUES (1, 1, '2020-12-02 22:03:37.392183', '2020-12-02 22:03:37.392183', 'Orlando Alliteration', 'Es wird eine freie Szene gespielt. Allerdings teilt das Publikum jedem Spieler vor Spielbeginn einen Buchstaben zu. Die Spieler müssen nun jedes Wort mit Ihrem Buchstaben beginnen lassen. Dabei müssen nicht immer sinnvolle Wörter enstehen, hauptsächlich ist der Beginn des Wortes mit dem vorgegebenen Buchstaben.

*   Vorgaben aus dem Publikum: die Buchstaben und evtl. ein Ort

**Video Alliterationsspiel:** Der Eifelturm (Die Impronauten aus Basel CH)

www.impronauten.ch', 'https://improwiki.com/de/spiele/orlando-alliteration', '2020-11-14 07:44:12.87', 1);
INSERT INTO public.part VALUES (2, 1, '2020-12-02 22:03:37.720903', '2020-12-02 22:03:37.720903', 'Buchstabe vermeiden', 'Einer der Spieler hat die Aufgabe, bei seinem Reden auf der Bühne einen bestimmten. vorher vorgegebenen Buchstaben zu vermeiden. Spricht er ihn gleichwohl aus, wird er "bestraft", z.B. indem er mit einem anderen Spieler ausgewechselt wird.

**Beispiel**: Der Buchstabe "n" ist dem Spieler A verboten.

A: "Liebling, Lichtspielhaus heute"?

B: "Ich möchte in La La Land! Hast Du die Kinogutscheine?"

A: "Ja, die habe ich hier, linksseitig verstaut" => A wird ausgewechselt', 'https://improwiki.com/de/buchstabenspiele/buchstabe-vermeiden', '2020-11-14 07:44:13.454', 2);
INSERT INTO public.part VALUES (3, 1, '2020-12-02 22:03:37.892333', '2020-12-02 22:03:37.892333', 'ABC-Spiel', '## Inhaltsverzeichnis

*   Basisspiel
*   Varianten
    *   Jeder Satz
    *   Letzter ist Erster
    *   Weitere

## Basisspiel

Das jeweils erste Wort im Dialog beginnt mit dem nächsten Buchstaben im Alphabet. Das Spiel geht bis der Buchstabe "Z" erreicht ist. Das ABC-Spiel ist daher auch unter dem Namen Alphabetspiel bekannt.

Beispiel:

*   Erster Spieler: "**A**bends bekomme ich immer Hunger. Das ist nicht gut für meine Figur!"
*   Zweiter Spieler: "**B**esonders lecker finde ich Schnitzel."
*   Erster Spieler: "**C**urrywurst esse ich lieber. Am Besten mit Pommes."
*   usw.

Für die Zuschauer ist es anschaulich, wenn der jeweils anstehende Buchstabe auf einem vom Moderator gehaltenen DIN-A-4-Blatt zu lesen ist - dh. je Buchstabe ein Blatt! Man kann z.B. mit Hilfe des Schreibprogramms Word einzelne Buchstabe so groß formatieren, dass Sie ausgedruckt genau auf eine Seite passen.

## Varianten

### Jeder Satz

_Jeder_ Satz - auch desselben Spielers - muss mit dem nächsten Buchstaben des Alphabetes anfangen.

Beispiel:

*   Erster Spieler: "**A**bends bekomme ich immer Hunger. **B**esonders beim Biertrinken."
*   Zweiter Spieler: "**C**urrywurst esse ich am liebsten. **D**azu dann einen schönen Rotwein, aber nicht zu kalt. **E**intopf mag ich überhaupt nicht!"
*   Erster Spieler: "**F**rische Erdbeeren dann als Nachtisch..."  
    
*   usw.

### Letzter ist Erster

Beim Sprecherwechsel muss der Spieler mit dem Buchstaben beginnen, mit dem der andere geendet hat.

Beispiel:

*   A: "Hallo Herr Wachtmeiste**r**!"
*   B: "**R**uhe bitte! Ich bin gerade an einem sehr schwierigen Fal**l**!"
*   A: "**L**assen sie mich raten: Ein Mor**d**?"
*   B: "**D**as, und nichts anderes! Ein grausiges Verbreche**n**!"
*   A: "**N**ei**n**!!!"
*   B: "**N**iemand hat damit gerechnet. Die alte Witwe..."
*   usw.

### Weitere

*   Man fängt nicht bei A an, sondern bei einem vom Zuschauer vorgegebenen Buchstaben.

*   ABC-Spiel rückwärts. Man fängt bei Z an und hört bei A auf

*   ABC-Spiel über Kreuz: Spieler A fängt bei A and und hört bei Z auf, Spieler B fängt bei Z an und hört bei A auf

*   ABC-Spiel auf Zeit: Innerhalb einer vorgegebenen Zeit, muss man mit dem Alphabet durch sein (z.B. 120 sec., 90 sec., 60 sec.)

Alle Varianten sind miteinander kombinierbar.

', 'https://improwiki.com/de/buchstabenspiele/abc-spiel', '2020-11-14 07:44:13.587', 3);
INSERT INTO public.part VALUES (4, 1, '2020-12-02 22:03:38.05275', '2020-12-02 22:03:38.05275', 'Alliteration', 'Es wird eine freie Szene gespielt. Allerdings fragt man das Publikum nach einem Buchstaben bevor das Spiel beginnt. Alle Spieler müssen nun jedes Wort mit diesem Buchstaben beginnen lassen. Dabei müssen nicht immer sinnvolle Wörter enstehen, wichtig ist der Beginn des Wortes mit dem vorgegebenen Buchstaben.

*   Vorgaben aus dem Publikum: der Buchstabe und evtl. ein Startort.

Seltene Anfangsbuchstaben, insbesondere "X" und "Y", vielleicht auch "C", kann man ausschließen. Das Spiel besteht verständlicherweise häufig nur aus sehr kurzen (Einwort-) Sätzen, anspruchsvolle Dialoge und eine dramaturgisch ausgefeilte Handlung sind bei diesem Spiel, das eher ein Gagspiel ist, selten.

## Varianten:

*   Einzelne Spieler (derselben) Szene können immer mal wieder ausgewechselt werden; mit dem Spielerwechsel kommt der nächste Buchstabe im Alphabet dran.

', 'https://improwiki.com/de/buchstabenspiele/alliteration', '2020-11-14 07:44:13.231', 4);
INSERT INTO public.part VALUES (5, 1, '2020-12-02 22:03:38.192598', '2020-12-02 22:03:38.192598', 'Ausschneiden und Einfügen', 'Die Spieler spielen eine normale Szene, basierend auf dem Vorschlag des Publikums. Zu jeder Zeit kann der Moderator "Cut" rufen, um einen Spieler aus der Szene zu entfernen ("rauszuschneiden"). Wurde ein Spieler "ausgeschnitten", verlässt er die Bühne. Die verbleibenden Spieler spielen dann so weiter, als wenn der Charakter immer noch auf der Bühne wäre. Der Moderator kann auch Spieler wieder zurück in die Szene "einfügen", das funktioniert zum Beispiel gut, nachdem dieser Spieler (der ja nicht physisch auf der Bühne ist) von den anderen Spielern in der Szene dazu bestimmt wurde, etwas zu tun (eine Aktivität).', 'https://improwiki.com/de/charakter-figur-spiele/ausschneiden-und-einfuegen', '2020-11-14 07:44:13.383', 5);
INSERT INTO public.part VALUES (6, 1, '2020-12-02 22:03:38.36209', '2020-12-02 22:03:38.36209', 'Charakter-Reigen', 'An diesem Spiel sind mindestens 3 Spieler beteiligt. Der erste Spieler geht als ein bestimmter Charakter (Figur) auf die Bühne. Dieser Charakter erzählt etwas über sich. Nach ein gewissen Zeit betritt ein zweiter Spieler - im Rahmen _derselben, nicht unterbrochenen_ Szene - die Bühne. Er spielt einen anderen Charakter. Beide Charaktere interagieren miteinander, schließlich verlässt der erste (begründet) die Bühne. Nun ist der zweite Charakter allein auf der Bühne und erzählt etwas über sich. Auch hier kommt nach einer gewissen Zeit ein weiterer Charakter, der dritte, auf die Bühne. Interagieren, Solo usw. auch hier. Dieser Ablauf kann sich einige Runden fortsetzen, d.h. jeder Schauspieler spielt dann mehrere Charaktere.  
Dies allein ist schon als Spiel geeignet. Es kann aber auch Ausgangsspiel für eine Langform sein, indem das Publikum nach Spielende abgefragt wird, welchen der gesehenen Charaktere es als Protagonisten der nun folgenden Langform erleben will.

## Hinweise und Tipps

Gegebenenfalls darf man hinsichtlich des Ortes oder der Zeit switchen, z.B. wenn ein Charakter bei seinem Vorstellungs-Solo aus seiner Vergangenheit erzählt und dann der neue Charakter die Bühne im Rahmen einer entsprechenden Rückblende betritt.', 'https://improwiki.com/de/spiele/charakter-reigen', '2020-11-14 07:44:13.545', 6);
INSERT INTO public.part VALUES (7, 1, '2020-12-02 22:03:38.507594', '2020-12-02 22:03:38.507594', 'Domino', 'An diesem Spiel sind vier Personen beteiligt. Spieler A und B spielen eine beliebige Szene. Nach einer gewissen Zeit, i.d.R. wenn ein Beat erreicht ist, ist die Szene zu Ende. Einer der beiden - A - verlässt nun begründet die Spielfläche. Spieler B hat nun eine Soloszene. Er hält einen (inneren) Monolog über irgendein ihn als Figur bzw. Charakter betreffendes/bewegendes Thema. Das sollte nur indirekt etwas mit der vorangegangenen Szene zu tun haben, es geht eher darum, eine weitere Facette der dargestellten Figur kennenzulernen. Wenn B seine Soloszene beendet hat, kommt C auf die Bühne. Nun spielen C und B eine Szene, die wiederum mit den vorangegangenen zwei Szenen (direkt) nichts zu tun hat. B bleibt aber als Figur/Charakter erhalten. Nach einer gewissen Zeit ist auch diese Zweierszene zu Ende. Nun verlässt B (begründet) die Spielfläche und Figur/Charakter C hat ihre/seine Soloszene, die auch wiederum nur indirekt etwas mit den vorangegangenen Szenen zu tun hat. Danach spielen C und D, dann spielt D sein Solo. Schließlich kommt A und spielt mit D, die Szenenfolge endet mit einem Solo von A.

Es geht hier nicht (weniger) darum, eine zusammenhängende Geschichte zu erzählen, sondern darum, die dargestellten Charaktere zu entwickeln. Denn in den drei Szenen, die jede Figur spielt, kann immer wieder eine neue Facette der dargestellten Persönlichkeit gezeigt werden.

### Schema

  A und B
  B
  B und C
  C
  C und D
  D
  D und A
  A', 'https://improwiki.com/de/spiele/domino', '2020-11-14 07:44:13.707', 7);
INSERT INTO public.part VALUES (16, 1, '2020-12-02 22:03:39.988854', '2020-12-02 22:03:39.988854', 'Springer', '3 Spieler, aber nur zwei spielen.

Der Dritte spielt jeweils mit dem einen eine Person, indem beide Wort für Wort abwechselnd einen Satz bilden. Dann springt der Springer zu der anderen Person und bildet mit ihr einen Satz. usw.', 'https://improwiki.com/de/dialogspiele/springer', '2020-11-14 07:44:13.927', 16);
INSERT INTO public.part VALUES (8, 1, '2020-12-02 22:03:38.625159', '2020-12-02 22:03:38.625159', 'Amerikanische Sitcom', 'Dies ist eine spezielle Spielvariante indem eine amerikanische Sitcom und ihre Eigenheiten improvisiert werden. Solch eine Sitcom kann selbstverständlich auch mit anderen Vorgaben oder auch als Langform (mit mehr Plotanteil) improvisiert werden.

1 Spieler K spielt das Kind der Familie, 1 Spieler H spielt das Haustier, 1 Spieler N spielt den Nachbar, 1 Spieler M spielt ein Elternteil (Mutter/Vater) und ein Zuschauer, der auf die Bühne geholt wurde, spielt das andere Elternteil (Mutter / Vater).

Als Vorgaben können bei diesem Spiel zum Beispiel abgefragt werden:

*   1 Tick/Macke für das Kind
*   ein Haustier und ein Trick, den das Haustier beherrscht
*   eine Nationalität für den Nachbar
*   sowie eine leichte psychologische (Neurose) für Spieler M (Mutter/Vater)
*   für den Zuschauer wird nichts abgefragt
*   Als letztes wird eine Moral für die Geschichte abgefragt.

Das Publikum kann nun instruiert werden, mitzumachen und zwar auf folgende Art und Weise (vorher einmal üben):

*   Wenn das Kind seinen Tick/Macke benennt , raunen alle Zuschauer: "Ahhhh"
*   Wenn das Haustier seinen Trick zeigt, klatschen alle Zuschauer wie wild
*   Wenn der Nachbar auf die Bühne kommt, rufen die Zuschauer: "Wuf, Wuuf Wuuf".
*   Wenn Spieler M (Mutter oder Vater) einen Satz beenden, rufen sie "Buuuh".
*   Wenn der Zuschauer auf der Bühne irgendetwas sagt, lachen die Zuschauer so laut sie können

Dann wird eine ganz normale Szene gespielt mit allen Empfehlungen, die man im Improtheater so beachten kann. Die Reaktionen der Zuschauer auf die Aktionen der Spieler sind ein Spass, aber quasi auch nur ein Bonus und sollten nicht die ganze Zeit im Mittelpunkt stehen.

Ziel ist es, eine Szene zu spielen, eine einfache, kleine Geschichte im Stile der amerikanischen Sitcoms zu erzählen und am Ende zur vorgebenen Moral zu gelangen.

Dieses Spiel sollte nicht zu lange gespielt werden, weil die Zuschauer sonst zu lange gefordert werden und schnell ermüden könnten.

Die Szene sollte starten mit dem Wissen, dass das Ziel ist, zur (vorgegebenen) Moral der Geschichte zu gelangen.', 'https://improwiki.com/de/spiele/amerikanische-sitcom', '2020-11-14 07:44:13.633', 8);
INSERT INTO public.part VALUES (9, 1, '2020-12-02 22:03:38.764722', '2020-12-02 22:03:38.764722', 'Sprach-Mix', 'Zwei Spieler. Einer redet eine Fantasiesprache (Gromolo) und der Andere Deutsch. Beide bekommen zum Beispiel eine gemeinsame Tätigkeit. Der Deutsche versteht den Gromolosprecher und behauptet immer, was dieser sagt oder will oder wünscht. Der Gromolosprecher hat durch Ausdruck, Emotion, Laustärke und Betonung ebenfalls die Möglichkeit zu "behaupten". Jeder überrascht dadurch den Anderen und jeder muss annehmen.

Ein sehr gutes Behauptungsspiel und und auch eine gute Übung sich wieder gegenseitig zuzuhören.', 'https://improwiki.com/de/dialogspiele/sprach-mix', '2020-11-14 07:44:13.69', 9);
INSERT INTO public.part VALUES (10, 1, '2020-12-02 22:03:38.896302', '2020-12-02 22:03:38.896302', 'Stimmchen', 'Stimmchen ist ein Spiel (oder eine Übung) für zwei Spieler. Spieler A agiert auf der Bühne, während Spieler B nur mit seiner Stimme spielt.

Spieler A ist auf der Bühne, zu einem beliebigem Zeitpunkt ist das ''Stimmchen'' (Spieler B) zu hören. Die Spieler müssen nun beide gemeinsam entwickeln, von wo die Stimme kommt und wer oder was die Stimme ist.

Beispiel: Spieler A auf der Bühne

B: (leise) Hallo.  
A: Was ist das ?  
B: (lauter) Haallo ...  
A: Jetzt höre ich schon Stimmen, ts ts.  
B: Kannst Du mich denn nicht sehen?  

... und so weiter entwickeln die beiden Spieler die Figur des Stimmchen. Vielleicht gehört Stimmchen zu einem kleinem Mäuschen, einem Blatt das im Wind fliegt oder ist das schlechte Gewissen von Spieler A.

**Variante:** Die Unterhaltung mit dem Gegenstand wird durch einen Spieler C, der die Bühne betritt unterbrochen, denn dieser hört die Stimme nicht und wundert sich, mit dem Spieler A sich unterhält. Evtl. hört der Spieler C aber auch die Stimme.

', 'https://improwiki.com/de/dialogspiele/das-stimmchen', '2020-11-14 07:44:13.855', 10);
INSERT INTO public.part VALUES (11, 1, '2020-12-02 22:03:39.044259', '2020-12-02 22:03:39.044259', 'Wort-für-Wort-Geschichte', 'Es wird von zwei bis drei Spielern eine beliebige Szene mit oder ohne Vorgabe des Publikums gespielt.  
Dabei sagt jeder abwechselnd immer nur ein Wort, wodurch gemeinsam eine Geschichte entsteht.

**Varianten:**

1\. Ein Spieler darf immer nur ein Wort sagen, der zweite Spieler sagt immer nur Zwei-Wort-Sätze und der dritte Spieler spricht nur in Drei-Wort-Sätzen.

2\. Ein Spieler koordiniert und vier andere spinnen eine Geschichte.  
Am besten fragt man hierbei das Publikum nach einem Thema.  
Dann zeigt der Koordinator jeweils auf die Person, die an der Reihe ist.  
Jede Person sagt immer nur ein Wort, außer wenn der Koordinator öfter hintereinander(bis zu 3 Mal) auf diese Person deutet. Dadurch gibt es nie eine eindeutige Reihenfolge, was das ganze noch ein wenig anspruchsvoller macht. Braucht eine Person zu lange, um ein Wort zu finden, kann das Publikum entscheiden, sie durch eine andere Person zu ersetzen. Man kann das Spiel auch noch erweitern, indem alle Satzzeichen mitgesprochen werden müssen und als ein Wort gelten. Klingt als Text sehr spröde, ist aber in der Durchführung sehr unterhaltsam.

', 'https://improwiki.com/de/dialogspiele/wort-fuer-wort-geschichte', '2020-11-14 07:44:13.814', 11);
INSERT INTO public.part VALUES (12, 1, '2020-12-02 22:03:39.189453', '2020-12-02 22:03:39.189453', 'Letztes Wort - erstes Wort', 'An diesem Spiel sind zwei Spieler beteiligt. Es wird eine beliebige Vorgabe eingeholt. Das Besondere ist, dass im Dialog der beiden das jeweils letzte Worte des einen Spielers das erste des anderen sein muss.

_Beispiel:_  
A: Wie komme ich denn zum Bahnhof?  
B: Bahnhof --- lassen sie mich überlegen. Sie gehen erst nach links, dann liegt auf der rechten Seite eine Treppe, die gehen sie hoch.  
A: Hoch gelegen der Bahnhof, was?  
B: Was meinen sie, wie mich das immer anstrengt.  
usw.', 'https://improwiki.com/de/dialogspiele/letztes-wort-erstes-wort', '2020-11-14 07:44:13.85', 12);
INSERT INTO public.part VALUES (13, 1, '2020-12-02 22:03:39.556', '2020-12-02 22:03:39.556', 'Zitatdelle', 'Eine freie Szene wird mit der Anforderung so viele Zitat (Sprichwörter, Redewendungen, geflügelte Sätze, Weisheiten) wie möglich in den Dialog einzubauen improvisiert. Die Schwierigkeit besteht darin, den Gang der Handlung nicht zum Erliegen zu bringen.

In der extremen Variante dürfen ausschließlich Zitate als gesprochener Text verwendet werden. Durch den meist postulierenden Charakter von Zitaten ist jedoch ein auf Fortentwicklung gerichteter Dialog kaum zu improvisieren.

Als Vorgabe kann ein Zitat aus dem Publikum dienen, dass die Szene inspiriert oder mit dem sie begonnen oder beendet werden soll.

Unter dem Namen Zitatdelle wurde dieses Spiel von Felix Jahnke (FSE) entwickelt.

', 'https://improwiki.com/de/dialogspiele/zitatdelle', '2020-11-14 07:44:14.514', 13);
INSERT INTO public.part VALUES (14, 1, '2020-12-02 22:03:39.685151', '2020-12-02 22:03:39.685151', 'Übersetzer', 'Ein Spieler ist im Urlaub in Gromololand. Er beschwert sich bei einem Hotelmitarbeiter über etwas Schlimmes in seinem Hotelzimmer. Da er sich aber mit dem Hotelmitarbeiter (der nur Gromolo spricht und versteht) nicht verständigen kann, kommt ein zweiter Hotelmitarbeiter als Übersetzer hinzu, der jetzt zwischen dem aufgebrachten Hotelgast und dem Hotelmitarbeiter hin und her übersetzt.

**Vorgabe des Publikums**: Etwas, worüber sie sich im Urlaub schon mal beschwert hatten (Ameisen im Bett, fehlender Strandblick etc.).

## Tipps

*   Der Übersetzer führt natürlich die Szene, weil nur er den anderen Hotelmitarbeiter versteht.
*   Der Hotelmitarbeiter, der nur Gromolo spricht, sollte viel mit Gesten arbeiten, um es dem Übersetzer leichter zu machen.

## Variante

Es kommt später in der Szene ein vierter Spieler dazu. Er ist ein Hotelgast, der nur Kauderwelsch spricht und jetzt natürlich den Übersetzer zusätzlich in Beschlag nimmt. Besonders witzig werden hier die Passagen, in denen der Übersetzer von Gromolo in Kauderwelsch und zurück übersetzt.', 'https://improwiki.com/de/dialogspiele/der-ubersetzer', '2020-11-14 07:44:13.948', 14);
INSERT INTO public.part VALUES (15, 1, '2020-12-02 22:03:39.822831', '2020-12-02 22:03:39.822831', 'Expedition', 'Bei diesem Spiel für 4 Personen gibt es einen Moderator und einen Experten, welcher eine Expedition unternommen hat. Dieser spricht aber nur Landessprache (Gromolo). Daher gibt es außerdem zwei Dolmetscher. Ein Dolmetscher übersetzt die Fragen des Moderators nach Gromolo, der zweite übersetzt die Antworten des Experten ins Deutsche.

Auf der Bühne sieht das Bild wie folgt aus: Experte, Übersetzer, Moderator, Übersetzer.

Vom Publikum wird nun ein Ort oder ein Land erfragt, welches bereist wurde, und, was der Experte dort entdeckt hat, z.B. fliegende Kugelschreiber in Alaska.

Dann stellt der Moderator seine Fragen, ca. 6-8, evtl. am Ende noch eine Frage aus dem Publikum.', 'https://improwiki.com/de/dialogspiele/expedition', '2020-11-14 07:44:13.971', 15);
INSERT INTO public.part VALUES (17, 1, '2020-12-02 22:03:40.47219', '2020-12-02 22:03:40.47219', 'Papagei', 'Ein Spiel für mindestens 3 Spieler.

Ein Spieler A wird ausgewählt, er ist der "Papagei", bzw. Plagiator.

Nach einer Vorgabe beginnen die anderen Spieler eine ganz normale Szene. Wenn der "Papagei" spricht, darf er/sie dabei jedoch ausschließlich Sätze verwenden, die von den anderen Spielern schon gesagt wurden. Wichtig ist dabei, dass er die Sätze dabei nicht ändert oder anpasst, sondern versucht, sie exakt 1:1 wiederzugeben

### Hinweise

Die Szene sollte alle Komponenten einer guten Szene enthalten: gut definierte Charaktere, ein klares Setting, eine sich fortlaufend entwickelnde Handlung. Auch der "Papagei" sollte in eine klare Figur gehen und sich nicht allein nur auf das Gimmick des Plagiierens der Sätze der anderen verlassen, sondern dies eher als Zusatz betrachten.

Die plagiierten Sätze sollten zwar wörtlich exakt wiedergegeben werden, aber sie können vom "Papagei" mit einer anderen Intonation/Ausdruck (z.B. sarkastisch, traurig, flüsternd, euphorisch) ausgesprochen werden, um ihnen eventuell neue Bedeutung zu geben.

Der "Papagei" sollte versuchen, sich so viele Sätze wie möglich zu merken. Einige Spieler können sich vielleicht nur 3 Sätze merken, andere bis zu 7. Wichtig ist, dass der "Papagei", wenn er einen Satz wiederholt hat, diesen "wegschmeisst" und sich einen neuen Satz "merkt".

Um das Ganze interessanter zu gestalten, sollte der "Papagei" darüber hinaus mit den Sätzen spielen, d.h. nicht direkt nachdem ein Satz gesagt wurde, diesen auch sofort wiederholen, sondern stattdessen vielleicht einen Satz, der vorher, ganz am Anfang gesagt wurde. Dann später einen Satz der später kam usw, um dem ganzen Abwechslung zu verleihen. Der "Papagei" ist angehalten, die Sätze in seinem Charakter gesprochen, ganz natürlich klingend zu wiederholen, so dass die Zuschauer zwar merken, dass die Sätze geklaut sind, er dabei aber nicht unnatürlich wirkt oder seinen Charakter zu "verrät".

Die anderen Spieler können den "Papagei" ganz normal und natürlich wie einen normalen Charakter in der Szene anspielen und nicht in Versuchung fallen, ihn als naives Kind, oder geistig umnachtete Person zu definieren. Ansonsten nehmen sie dem Charakter die Bedeutung seiner Figur. Die anderen Spieler sollten auch nicht der Versuchung verfallen, die Sätze des "Papageis" eventuell zu wiederholen, sondern stattdessen die Szene ganz natürlich und organisch nach vorne treiben.', 'https://improwiki.com/de/dialogspiele/papagei', '2020-11-14 07:44:14.056', 17);
INSERT INTO public.part VALUES (18, 1, '2020-12-02 22:03:40.647018', '2020-12-02 22:03:40.647018', '"3 frei" - Drei Sätze frei', 'Da häufig zu viel gesprochen und zu wenig dargestellt wird, ist das ein nettes Spiel und eine nette Übung:

Jeder Spieler hat für die kommende Szene nur drei Sätze frei. Um das zu visualisieren bekommt jeder drei Karten/Zettel/Papierstücke an die Kleidung befestigt (> einfach etwas Kreppband nehmen). Wer einen Satz gesagt hat, nimmt einen Zettel ab, knüllt ihn zusammen und wirft ihn weg.

Der Witz daran: Man kann sparsam mit seinen Sätzen sein (und sich quasi duellieren, wer das letzte Wort hat), man kann verschwenderisch sein und schon für ein "Hatschi!" einen Satz verbraten, und man kann die anderen mit seinem Satz herausfordern/definieren/Aufgaben geben, die können aber weniger blocken.

Schön ist es, wenn weniger gesprochen wird - und das auch noch "gerechtfertigt": z.B. "Pssst - die anderen schlafen noch..." (kann man auch mit Gestik rüberbringen). Aber man sollte nicht ins gestikulierendes Spiel verfallen, sondern darauf achten natürliche Bewegungen zu nutzen. Spieler verfallen oftmals in den Zwang, keine Worte zu nutzen. So ist es bei diesem Spiel auch wieder nicht gemeint.', 'https://improwiki.com/de/dialogspiele/drei-saetze-frei', '2020-11-14 07:44:14.058', 18);
INSERT INTO public.part VALUES (19, 1, '2020-12-02 22:03:40.787154', '2020-12-02 22:03:40.787154', 'Gefühlsreplay', 'Mit Vorgabe einer alltäglichen Handlung (oder etwas anderes) wird von zwei bis drei Spielern eine kurze Szene gespielt.

Diese wird danach zwei oder dreimal verschieden gefühlsbetont wiederholt (Replay).

Dabei ist die Wahl der Gefühle dem Publikum überlassen, man sollte aber möglichst gegensätzliche Gefühle wählen.

Beispiel für Gefühle: verliebt, wütend, müde, durchgedreht, albern...', 'https://improwiki.com/de/gefuehlsspiele/gefuehlsreplay', '2020-11-14 07:44:14.175', 19);
INSERT INTO public.part VALUES (20, 1, '2020-12-02 22:03:40.919878', '2020-12-02 22:03:40.919878', 'Blind Date', 'Zwei Personen treffen sich zum ersten Mal und erkennen, dass sie für einander bestimmt sind!

Vorgaben:

*   Geschlecht, Alter, Name und einen Beruf und / oder ein geheime Sehnsucht für jede Person
*   Der Ort an dem sie sich treffen.

Variante: Schizo Blind date

_siehe auch:_ Das verflixte siebte Jahr', 'https://improwiki.com/de/gefuehlsspiele/blind-date', '2020-11-14 07:44:14.176', 20);
INSERT INTO public.part VALUES (21, 1, '2020-12-02 22:03:41.06605', '2020-12-02 22:03:41.06605', 'Genre-Freeze', 'Es spielen zwei Zweierteams, jedes bekommt ein Genre vom Publikum genannt.  
Das erste Team beginnt eine Szene. Der Spielleiter stoppt irgendwann und das Team wird ausgetauscht. Die Szene wird an der Stelle fortgesetzt, an der sie gestoppt wurde.  
Ab dem zweiten Wechsel spielen die Teams in ihrem Genre weiter.  
Dadurch, dass das Genre wiederkommt, und nicht wie bei der Genreachterbahn oder beim Genrereplay immer ersetzt wird, gibt es einen Wiedererkennungseffekt.', 'https://improwiki.com/de/gefuehlsspiele/genre-freeze', '2020-11-14 07:44:14.291', 21);
INSERT INTO public.part VALUES (22, 1, '2020-12-02 22:03:41.205969', '2020-12-02 22:03:41.205969', 'Gefühlstaxi', '2 mal 2 Stühle sind das Taxi. Zum Anfang sitzen 3 Spieler im Taxi. Spieler A vorne ist der Fahrer, Spieler B ist der Beifahrer und Spieler C sitzt hinten, hinter dem Fahrer.

Spieler D steht an der Strasse, ruft das Taxi und will mitgenommen werden. Spieler D hat dabei ein bestimmtes Gefühl oder eine bestimmte Haltung oder einen Subtext. Spieler A, mimt, dass er das Taxi anhält und lässt Spieler D hinten, hinter dem Beifahrersitz einsteigen.

Ab da übernehmen alle Spieler im Taxi das Gefühl von Spieler D. Dies kann gerne langsam immer noch etwas größer gemacht werden, als es schon war.

Irgendwann steigt Spieler A aus Gründen aus (z.B. "Muss mal kurz Zigaretten holen") und damit wird der vorherige Beifahrer Spieler B zum Fahrer des Taxis. Spieler C rückt von hinten auf den Beifahrersitz vor und Spieler D rückt auf den Platz hinter den Fahrersitz. Noch behalten alle Spieler das letzte Gefühl bei.

Nun steht ein neuer Spieler an der Strasse mit einem neuen Gefühl/Haltung, auch dieser wird wiedermitgenommen (steigt wieder hinten ein) und auch dessen Eigenschaften werden wieder sofort von allen Insassen des Taxis übernommen. Usw. usf.

_Siehe auch:_ Der Anhalter', 'https://improwiki.com/de/gefuehlsspiele/gefuehlstaxi', '2020-11-14 07:44:14.316', 22);
INSERT INTO public.part VALUES (23, 1, '2020-12-02 22:03:41.595128', '2020-12-02 22:03:41.595128', 'Emotionaler Arbeitsplatz', '_Auch bekannt als "Gefühle reinbringen"_

An einem vom Publikum bestimmten Arbeitsplatz spielen drei Spieler. Jeder erhält ein Gefühl zugeordnet.

Beispiel: Spieler A hat Trauer als Gefühl A beginnt und führt traurig den Arbeitsplatz ein. Nun kommt B der Liebe als Gefühl hat. Nun spielen beide das Gefühl von B bis C kommt der ein neues Gefühl mit bringt, z.B. Hass. Nun verläßt jemand die Szene, also z.B. Spieler A , der Hass bleibt, bis Spieler A erneut auf der Szene auftaucht und sein Gefühl (Trauer) mitbringt (Vorsicht: wenn Spieler C die Szene verlässt, muss noch jemand anderer folgen, da sonst kein Wechsel stattfinden kann wenn er wieder kommt, während sein Gefühl noch aktiv ist)', 'https://improwiki.com/de/gefuehlsspiele/emotionaler-arbeitsplatz', '2020-11-14 07:44:14.434', 23);
INSERT INTO public.part VALUES (24, 1, '2020-12-02 22:03:41.737055', '2020-12-02 22:03:41.737055', 'Dichte mit Gefühl', 'Drei oder vier Spieler sind beteiligt. Der Moderator fragt die Zuschauer nach einem beliebigen Satz. Weiterhin lässt er sich für jeden der drei oder vier Spieler ein Gefühle geben. Die Spieler verteilen sich auf der Bühne, nehmen eine Körperhaltung ein, in der sie "einfrieren". Einer nach dem anderen tritt nun nach vorn und hat die Aufgabe, beginnend mit dem vorgebenen Satz ein spontanes Gedicht zu sprechen bzw. seinen Monolog in Form sich reimender Verse zu sprechen. Dabei bleibt der Spieler die ganze Zeit in dem vorgegebenen Gefühl. Nach Monologeende geht der Spieler wieder in den Hintergrund und "friert" ein.

Die darzustellenden Gefühle sollten kontrastreich, positive und negative Gefühle ausgewogen vertreten sein.

Das Spiel kann man auch als _Poetry Slam_ laufen lassen.', 'https://improwiki.com/de/gefuehlsspiele/dichte-mit-gefuehl', '2020-11-14 07:44:14.598', 24);
INSERT INTO public.part VALUES (25, 1, '2020-12-02 22:03:41.892168', '2020-12-02 22:03:41.892168', 'Gefühlsquadrat', 'Die Bühne wird in vier quadratische Bereiche eingeteilt. Jedem der Bereiche wird durch Publikumszuruf ein „Gefühl“ zugeordnet (bspw. Hass, Liebe, Eifersucht, Trauer). Nun gibt das Publikum bspw. noch einen Ort vor, an dem die zu improvisierende Szene entstehen soll. Die Spieler entwickeln nun eine zusammenhängende Geschichte, wobei sich die Charaktere frei auf der Bühne bewegen können, jedoch je nach Standort („Gefühlsquadrat“) Ihre Figur unterschiedlich ausspielen, also in der entsprechenden Emotion einfärben.

Variante: Statt Gefühlen gibt es die Felder: Reden - Gromolo - Pantomime/Gesten - Buchstabe vermeiden (Begriffe mit diesem Buchstaben müssen vermieden werden, bei Fehlern wird der Spieler ausgewechselt)

_Siehe auch_

*   Dutch Square
*   Gefühlspunkte', 'https://improwiki.com/de/gefuehlsspiele/gefuehlsquadrat', '2020-11-14 07:44:14.478', 25);
INSERT INTO public.part VALUES (26, 1, '2020-12-02 22:03:42.027208', '2020-12-02 22:03:42.027208', 'Achterbahn', 'Vor dem Start der Szene werden die Zuschauer nach Gefühlen oder Genres gefragt. Der Moderator sorgt dafür, dass ausreichend positive und negative Gefühle vorhanden sind. (Faustregel: Ca. 8 Emotionen/Genres)

Nun wird eine freie Szene begonnen. Der Moderator friert die Szene ein und

*   gibt entweder einer Figur ein Gefühl (_Gefühlsachterbahn_ (s. a. Gefühlsliste)) Ansage: "Spieler 1 weiter in Trauer"

oder

*   allen Spielern ein Genre (_Genreachterbahn_ (s. a. Genreliste) Ansage: "weiter als Western"

und lässt die Szene weiterlaufen.

## Tipps und Hinweise

*   Variante: Beide bzw. alle auf der Bühne spielen jeweils das gleiche Gefühl nach der Ansage.

## Verwandt

*   Musik 6 (eine Musikstile-Achterbahn mit sechs Musikstilen, die für alle Spieler gelten (wie bei der Genre-Achterbahn)
*   Replays (Gefühlsreplay, Genrereplay)

', 'https://improwiki.com/de/gefuehlsspiele/achterbahn-der-gefuehle', '2020-11-14 07:44:14.708', 26);
INSERT INTO public.part VALUES (27, 1, '2020-12-02 22:03:42.171782', '2020-12-02 22:03:42.171782', 'Gefühlspunkte', 'Es werden zwei gut sichtbare Punkte auf die Bühne geklebt. Jedem der beiden Punkte wird durch Publikumszuruf ein „Gefühl“ zugeordnet (am besten gegensätzliche, z.B. Hass-Liebe, Eifersucht-Gleichgültigkeit, Trauer-Freude, ...).

Nun gibt das Publikum noch einen Ort vor, an dem die zu improvisierende Szene entstehen soll. Die Spieler entwickeln nun eine zusammenhängende Geschichte, wobei sich die Charaktere frei auf der Bühne bewegen können, jedoch je nach Standort („Gefühlspunkt“) ihre Figur unterschiedlich ausspielen, also in der entsprechenden Emotion einfärben. Die Emotion wird immer stärker, je näher die/der Spieler/in dem Gefühlspunkt kommt. Auf dem Gefühlspunkt gibt es dann den völligen Gefühlsausbruch!

Etwas ähnlich ist das Spiel "Gefühlsquadrat".

### Tipps und Hinweise

*   Wichtig ist es, nicht nur die Extreme auf den Gefühlspunkten zu spielen, sondern auch die Abstufungen der Gefühle zwischen diesen.
*   Zusätzlich zum Ort kann man sich auch noch Gegenstände oder Raum- oder Ortsdetails geben lassen, die an dem betreffenden Gefühlspunkt vorhanden sind. Das kann z.B. im vorgebenen Wohnzimmer ein Sessel an dem einen Gefühlspunkt sein und an dem anderen Gefühlspunkt ein Fernseher. Oder in der vorgegebenen Wüste die Wasserstelle an dem einen und der Korb des Schlangenbeschwörers mit der darin enthaltenen Schlange an dem anderen Gefühlspunkt.
*   Die (größeren) Bewegungen zwischen den Gefühlspunkten sollten begründet erfolgen und nicht wilkürlich erscheinen.', 'https://improwiki.com/de/gefuehlsspiele/gefuehlspunkte', '2020-11-14 07:44:14.764', 27);
INSERT INTO public.part VALUES (28, 1, '2020-12-02 22:03:42.298596', '2020-12-02 22:03:42.298596', 'Sing dein Gefühl', 'Bei diesem Spiel geht es darum, dass der Moderator irgendwann während des Spieles die Szene unterbricht und zu einem der Spieler sagt: "Sing dein Gefühl!" Der Musiker spielt daraufhin eine balladenhafte (ggf. auch eine andersartige z.B. aggressive) Begleitmusik, der Spieler singt von seinem Gefühl, das ihn aktuell in diesem Moment im Rahmen seiner Figur bewegt und natürlich auch von den Umständen, die zu diesem Gefühl geführt haben, d.h., dass auch im Rahmen des Singens natürlich die Geschichte (behutsam) vorangetrieben werden kann.  
Der Moderator kann eine Gesangsunterbrechung während des Spiels immer wieder dann initiieren, wenn es sich anbietet, etwa weil sich aufgrund eines Geschehens oder einer Äußerung die emotionale Situation eines Spielers verändert hat.  
Das klingt simpel, kann aber ungewöhnlich eindrucksvoll sein, weil die Spieler plötzlich und schnell mit Musikunterstützung in ihre Emotion kommen und sich dadurch das Gefühl deutlich den Zuschauern vermittelt. Wenn sich dann das Gesungene noch reimt, ist das Staunen der Zuschauer groß.

_Siehe auch_ Sing was du denkst; Das klingt nach einem Lied', 'https://improwiki.com/de/gefuehlsspiele/sing-dein-gefuehl', '2020-11-14 07:44:14.627', 28);
INSERT INTO public.part VALUES (29, 1, '2020-12-02 22:03:42.436357', '2020-12-02 22:03:42.436357', 'Großes Kino', 'Drei bis vier Spieler (nicht mehr!) sitzen nebeneinander wie in einer Kinoreihe.

Jeder Spieler bekommt ein starkes Gefühl. Alle Spieler starren konzentriert auf die imaginäre Leinwand. 5-4-3-2-1-Los. Alle Spieler schauen den gemeinsamen Film (Genre oder Titel völlig egal) an, aber jeder in seiner eigenen, zugeteilten Emotion. Mit wenig oder kaum Kontakt zum anderen.

Vier Spieler erhalten dadurch den kompletten Fokus und der Zuschauer kann sich kaum entscheiden, welche Emotion am spannendsten ist. Maximal eine bis 1,5 Minuten spielbar, denn dann sind die Emotionen erschöpft. Tolle Übung für Spieler und tolle Unterhaltung für den Zuschauer.

Siehe auch: Kino.', 'https://improwiki.com/de/gefuehlsspiele/grosses-kino', '2020-11-14 07:44:14.746', 29);
INSERT INTO public.part VALUES (30, 1, '2020-12-02 22:03:42.557612', '2020-12-02 22:03:42.557612', 'Trizophrenie', 'Ein Spiel für vier Spieler.

Es spielen allerdings jeweils nur zwei Charaktere auf der Bühne. Einer der beiden ist trizophren. Das heißt, er hat eine multiple Persönlichkeit, welche aus **drei** Personen besteht, die von drei Spielern abwechselnd gespielt wird.

Die drei bekommen vom Publikum jeweils ein Gefühl zugeordnet, mit welchem sie ihre Figur spielen. Für den zweiten Spieler der Szene ist sie aber nur eine Person. Er muss lediglich versuchen, mit den Gefühlsaufwallungen dieser "einen" Person klarzukommen, welche sich ergeben, wenn der jeweilige Vorgänger per Klatschen abgelöst wurde und nun in seinem Gefühl weiterspielt.

**Video Trizophrenie:** Pilot und Stewardess (Die Impronauten aus Basel CH www.impronauten.ch

Variante: Schizo Blind date', 'https://improwiki.com/de/spiele/trizophrenie', '2020-11-14 07:44:14.853', 30);
INSERT INTO public.part VALUES (38, 1, '2020-12-02 22:03:43.554201', '2020-12-02 22:03:43.554201', 'Zeitreise', 'Zunächst wird eine neutrale Szene gespielt die auf einem Vorschlag des Publikums basiert. Die danach folgenden Szenen sollen sich aus dieser Grundszene ableiten.

**Beschreibung**

Die erste Szene muss einige starke Charaktere geschaffen haben. Der ersten Szene nachfolgend wird der Moderator beginnen Zeitsprünge zu nennen: fünf Minuten vorher, zehn Jahre später. Jede Angabe eines Zeitsprunges des Moderatoren ist ein Signal für eine neue Szene. Jede Szene wird irgendwie mit der anfänglichen Szene verbunden, durch die Charaktere, den Ort oder die Konsequenzen.

**Variationen**

Seid variabel in den Zeitsprüngen. Es ist auch möglich zu rufen: null Sekunden ab jetzt, oder 5Mio Jahre in der Vergangenheit.', 'https://improwiki.com/de/wiki/improtheater/zeitreise', '2020-11-14 07:44:15.195', 38);
INSERT INTO public.part VALUES (52, 1, '2020-12-02 22:03:45.499054', '2020-12-02 22:03:45.499054', 'Blindes Musical', 'Das ist eine musikalische Version des Zettelspiels: Das Publikum wird gebeten, einen einfache Satz auf zuvor zur Verfügung gestellte Zettel zu schreiben. Entweder werden die beschrifteten Zettel auf der Bühne verteilt oder die Spieler stecken sie in die Tasche. Jedenfalls nehmen die Spieler mehrfach während der Szene einen Zettel zur Hand und fangen unverzüglich mit dem darauf stehenden Satz an, ein Lied zu singen. Der Satz sollte möglichst sinnvoll in die Szene integriert werden.', 'https://improwiki.com/de/wiki/improtheater/blindes_musical', '2020-11-14 07:44:16.077', 52);
INSERT INTO public.part VALUES (31, 1, '2020-12-02 22:03:42.67801', '2020-12-02 22:03:42.67801', 'Toaster', '4 bis 6 Spieler hocken gut verteilt auf der Bühne.

Der Spielleiter pfeift oder klatscht nun in unterschiedlichen Abständen in die Hände. Bei jedem Signal stehen beliebig viele Spieler pfeilschnell auf, setzen sich hin, bleiben stehen oder sitzen. Das entscheidet jeder Spieler für sich. Dadurch ergeben sich sehr viele verschiedene Spielerkonstellationen. Alle Spieler, welche stehen, spielen _eine_ Szene, bis der Spielleiter erneut klatscht. Sobald sich die Konstellation ändert, beginnt eine komplett neue Szene.

Zu Anfang erfragt der Spielleiter beim Publikum einen Überbegriff, unter dem die Szenerie laufen soll, z.B. Landwirtschaft, Verkehr, Urlaub

Dieses Spiel kann man endlos spielen, von daher obliegt es dem Spielleiter, es irgendwann zu beenden. Das kann geschehen, wenn beispielsweise bei einem Signal alle Spieler auf der Bank sitzen.

**Hinweise und Anmerkungen**

*   Das Spiel ist - neben Freeze Tag - gut als Startspiel bei einem Auftritt geeignet.
*   Es eignet sich gut, um die Angst vor Soloszenen zu verringern, denn wenn man plötzlich allein dasteht, muss man halt schnell irgendwas allein hinzaubern.
*   Das Hocken auf dem Boden hat den Vorteil, dass die Spieler mehr im Raum agieren können: Beim Klatschen können sie sich am Szenenende dort hinhocken, wo sie gerade gespielt haben.
*   Als Vorgabe kann ein Ort genommen werden, an dem alle Szenen spielen sollen, z.B. Schulhof - wobei die Szenen nicht alle auf _demselben_ Schulhof spielen müssen!

**Varianten**

*   Statt des Spielleiters kann ein hockender Spieler klatschen und anschließend spielen.
*   Wenn eine Spielerkonstellation wiederholt aufsteht, wird die vorher in dieser Konstellation etablierte Szene fortgesetzt. Das kann nahtlos geschehen, es können aber auch Stunden, Tage etc. inzwischen vergangen sein. Wichtig ist nur, dass die gleichen Leute die gleiche Szene weiterspielen.
*   Die Spieler sitzen auf Stühlen, d.h. die Szenen spielen sich größtenteils auf verbaler Ebene ab, da man von seinem Platz nicht weg gehen kann.', 'https://improwiki.com/de/wiki/improtheater/toaster', '2020-11-14 07:44:14.944', 31);
INSERT INTO public.part VALUES (32, 1, '2020-12-02 22:03:42.822221', '2020-12-02 22:03:42.822221', 'Szene mit der Wand', 'An diesem Spiel sind vier Spieler beteiligt, die zwei Personen darstellen.

In der Mitte der Bühne steht eine Wand, hinter der sich immer zwei Spieler so stellen, dass sie während des Spielens der anderen beiden Spieler nicht von den Zuschauern gesehen werden können.

Der Spielleiter fragt die Zuschauer nach zwei Räumen in einem Gebäude. z.B. Badezimmer und Wohnzimmer oder Kinderzimmer und Dachboden. Der Bereich links der Wand steht für das eine Zimmer, der Bereich rechts der Wand für das andere.

Zwei Spieler (die anderen beiden stehen hinter der Wand) beginnen nun in einem der Räume mit ihrem Spiel. Nachdem die Szene etabliert ist, wechselt einer oder wechseln beide begründet in den anderen Raum. Dabei gehen sie hinter die Wand, bleiben dort stehen und werden von dem anderen Spieler abgelöst, der für die andere Seite "zuständig" ist und der entsprechend auf der anderen Seite der Wand herauskommen. Immer wieder wird im Rahmen des Spieles einzeln oder zu zweit zwischen den Räumen gewechselt, je häufiger desto besser, denn davon lebt das Spiel. Wichtig: es bleibt immer derselbe Spieler auf derselben (einen) Seite für die von ihm gespielte Person "zuständig"!  
Wichtig ist es, keine Pausen zu haben, d.h. in dem Moment, in dem der eine Spieler auf der einen Seite hinter den Wand verschwindet, muss sein "Alter Ego" auf der anderen Seiten mit gleichem Schritttempo, gleicher Mimik und Körperhaltung hervortreten.  
Wichtig sind häufige Seiten- bzw. Raumwechsel mit möglichst originellen Körperhaltungen bzw. Bewegungen, sonst ist es nicht witzig.

Die "Wand" kann auch ein zwei Meter langes Stück schwarzer Stoff sein, das, an einer Holzstange festgetackert, von der Decke (bzw. von der Stange) herunterhängt.

## Variante

Es wird ohne Wand gespielt. Der linke bzw. der rechte Bühnenrand hat die Funktion der "Wand". Wenn also einer Spieler nach rechts (raus) geht, dann kommt sein Alter Ego auf der linken Seite auf die Bühne und umgekehrt.

', 'https://improwiki.com/de/wiki/improtheater/szene_mit_der_wand', '2020-11-14 07:44:15.642', 32);
INSERT INTO public.part VALUES (33, 1, '2020-12-02 22:03:42.942167', '2020-12-02 22:03:42.942167', 'Freeze Tag', '**Freeze Tag** ist auch bekannt als **Switch**, **Zap**, **Kettenimpro**, **Kinoimpro**, **Impro Total**, **Springmaus**, **Red Light - Green Light**, **Szenenmarathon**, oder **Abklatschen**.

Alle sind beteiligt, eine Szene spielen immer nur zwei.

Zwei Spieler starten und spielen eine kurze Szene. Wenn ein Beat erreicht ist, klatscht einer der nicht beteiligten Spieler in die Hände und/oder ruft "Freeze!". Die Darstellenden stoppen sofort und frieren in der Haltung ein, die sie gerade haben. Der Spieler, der geklatscht hat, tippt einen der beiden Spieler an und übernimmt exakt dessen Haltung. Es startet ein komplett neue Szene. Die beiden Spieler nehmen dabei ihre Haltungen als Grundlage für ihr Tun in der neuen Szene. In der Regel kommt die Spielidee für die neue Szene von dem neuen Spieler.

Den Reiz des Spiels macht aus, die genaue Haltung detailgenau zu kopieren und diese in einem neuem Kontext zu rechtfertigen. Dafür ist ein genaues Beobachten der Szene und der Haltungen vor der Übernahme sehr wichtig. Damit das möglich ist, sind die Szenen mit viel Körperlichkeit und Haltungsänderungen zu spielen. Beenden sollte man die Szene dann, wenn gerade ein Beat erreicht ist, z.B. nach einem Gag. Wenn die Spieler währenddessen auch noch eine spannende Körperhaltung eingenommen haben ist das um so besser...

Die Spieler auf der Bühne sollten versuchen Ihr Spiel so zu gestallten, dass sie auch gut körperliche Angebote machen. Das macht es den außenstehenden Spielern einfacher, die Szene mit einem Freeze Tag zu unterbrechen.

Freeze Tag wird oft auch als erstes Spiel in einer Show gespielt, da es vom Charakter her sich gut eignet "reinzukommen" und das Publikum versteht, wie Improtheater funktioniert.

**Beginnen** kann man das Spiel auf unterschiedliche Weise:

*   Man lässt einen oder zwei Spieler durch jemanden aus dem Publikum "verbauen".
*   Die Spieler bewegen sich mit dem ganzen Körper wirr auf der Bühne und frieren nach einem Klatschen aus dem Publikum ein.

**Variationen:**

*   **Blind Freeze:** Die Spieler stellen sich in einer Reihe auf, der jeweils erste mit dem Rücken zur Szene. Der zweite (oder der letzte) in der Reihe setzt den Freeze, der erste dreht sich um und übernimmt.
*   **Publikums Freeze:** Die Zuschauer dürfen in die Hände klatschen und freezen
*   Vor jeder neuen Szene wird schnell (!) eine Vorgabe vom Publikum abgefragt.
*   Bei allen Szenen ist eine Vorgabe oder ein bestimmtes Thema zu beachten.
*   _Szenenmarathon/Retro/Director''s Cut/Reprise:_ Im Rahmen einer Zugabe werden Elemente (Personen, Situationen) aus Spielen des vergangenen Auftritts in die Freeze-Tag-Szenen eingebaut (siehe Szenenmarathon)
*   Es werden in jeder Kurzszene Sätze vorgelesen von Zetteln, die die Zuschauer ausgefüllt haben (_siehe_ Zettelspiel). Denkbar auch als Resteverwertung übrig gebliebener Zettel am Ende der Show (siehe Szenenmarathon).

Als Vorübung bietet sich Statue - Szenenanfang an.

Siehe auch: Szenenmarathon; Einfrieren; Miniszenenkette; Orte-Switch

', 'https://improwiki.com/de/spiele/freeze_tag', '2020-11-14 07:44:15.149', 33);
INSERT INTO public.part VALUES (34, 1, '2020-12-02 22:03:43.074538', '2020-12-02 22:03:43.074538', 'Superhelden Pyramide', 'Es ist auch als Übung geeignet, um das größer machen von kleinen Angeboten zu üben.

Das Publikum wird nach dem Namen eines Superhelden gefragt und einer Katastrophe/einem Problem, dass es zu lösen gilt.

Ein Spieler beginnt eine Szene und versucht, das Problem zu lösen, schafft es aber nicht, sondern macht es evtl. nur noch schlimmer und ruft den nächsten Superhelden (den Namen des Superhelden improvisiert er selbstverständlich, evtl. passend oder total unpassend zum Problem).

Der nächste Superheld kommt und versucht zu helfen und schafft es ebenfalls nicht, das Problem zu lösen und macht es noch schlimmer. Er ruft wieder den nächsten usw. Die Superhelden nehmen dabei jeweils einen bestimmten Charakter ein, u.a. inspiriert durch ihren Namen.

Bis alle Spieler auf der Bühne sind. Danach gehen die Superhelden wieder einer nach dem anderen ab (mit einem Grund), bis der erste Superheld nur noch alleine auf der Bühne ist. Er beendet die Szene dann, indem er das Problem entweder löst oder nicht.

### Variation

*   Statt einer großen Katastrophe kann der erste Superheld (z.B.: "Mr. Saubermann") auch einfach nur mit einer einfachen Tätigkeit starten (z.B.. Abwaschen). Daraus wird dann nach und nach ein Problem, das schliesslich zur Katastrophe wird. Der letzte Superheld, der auf die Bühne kommt, löst dann das Problem.', 'https://improwiki.com/de/wiki/improtheater/superhelden_pyramide', '2020-11-14 07:44:14.958', 34);
INSERT INTO public.part VALUES (35, 1, '2020-12-02 22:03:43.201648', '2020-12-02 22:03:43.201648', 'Drehtür', 'Ein Spiel für 3-10 Spieler. Als Übung geeignet, um Angebot und Annahme zu trainieren.

Alle stehen im Kreis. Ein Spieler steht im Mittelpunkt und wird im schnellen Wechsel von den anderen Spielern angespielt (bespielt). Die geschieht, indem einer der Spieler aus dem Kreis nach innen tritt, auf den Spieler in der Mitte zugeht und jeweils ein Angebot in Form eines Satzes mit dazu passender Gestik, Mimik und Handlung macht, auf das der Mittelpunktspieler sofort reagiert. Danach tritt er in den Kreis zurück.  
Direkt danach kommt schon der nächste Spieler mit dem nächsten Angebot, usw. Zwischen den Angeboten ist immer ein impliziter Schnitt, der aber nicht jedes Mal gesagt wird.

Dieses Spiel eignet sich zum Beispiel gut dafür, das Leben einer Person in Szenenfragmenten (wie in einem Zeitraffer-Film) zu zeigen, von der Kindheit bis zum Tod. Wer die Person ist und welche Sache eine Rolle in ihrem Leben spielen soll, gibt das Publikum vor. Zum Beispiel kann man einen Prominenten einen beliebigen anderen Beruf ergreifen lassen.

Beispiel (D "steht in der Drehtür"):

*   A: (spielt D wie eine Mutter ihr Kind an) "Nun iß schön deinen Brei, damit du groß und stark wirst!"
*   D: (spielt Kind) "Aber ich bin schon satt, Mami."
*   B: (klopft D auf die Schulter) "Heute ist ein wichtiger Tag in deinem Leben! Ich bin stolz auf dich!"
*   D: (spielt aufgeregt) "Ich bin schon so gespannt auf die Schule!"
*   C: (spielt einen blöden Mitschüler) "Hey! Was hast du denn für alberne Klamotten an!"
*   D: (wird wütend) "Sag das nochmal, und ich geb dir eins auf die Nase!"
*   A: (betupft D das Gesicht) "Mein armer Bub. Das muß ich dem Schuldirektor melden!"
*   D: (spielt verletzt) "Aua - nicht hinkommen!"
*   usw.

Die anderen Spieler können ihre einmal gewählte Rolle beibehalten; wenn es das Spiel erfordert, aber auch wechseln (zum Beispiel kann die Spielerin der Mutter zwei Angebote später die Geliebte des nun erwachsenen Mannes spielen).

## Tipps und Hinweise

*   Schnell spielen, keine Pausen entstehen lassen. Wichtig ist auch, größere Zeitsprünge zu machen, damit das Spiel zu einem Ende kommt.', 'https://improwiki.com/de/wiki/improtheater/drehtuer', '2020-11-14 07:44:15.133', 35);
INSERT INTO public.part VALUES (36, 1, '2020-12-02 22:03:43.314553', '2020-12-02 22:03:43.314553', 'Der Anhalter', 'Zwei Spieler sitzen nebeneinander in einem Auto. Einer fährt, einer ist Beifahrer. Dann sehen beide einen Anhalter am Straßenrand stehen. Sie halten an und nehmen ihn mit. Der Anhalter wird nun zum Beifahrer, der Beifahrer zum Fahrer und der Fahrer steigt aus und wird zum nächsten Anhalter.

Wichtig ist, daß der Anhalter immer einen bestimmten Charakter oder ein bestimmtes Gefühl (siehe Gefühlsliste) bzw. einen Tick mitbringt. Dieses Gefühl überträgt sich dann Stück für Stück auf den Fahrer des Wagens (oder schlagartig auf alle Insassen; vergl. Emotionaler Arbeitsplatz)

Man kann diese Spiel auch mit vier Spielern spielen. Der vierte könnte dann immer auf der Rückbank sitzen, so daß immer drei Leute zur selben Zeit im Auto sitzen.

_Siehe auch:_ Gefühlstaxi', 'https://improwiki.com/de/wiki/improtheater/der_anhalter', '2020-11-14 07:44:15.088', 36);
INSERT INTO public.part VALUES (37, 1, '2020-12-02 22:03:43.428565', '2020-12-02 22:03:43.428565', 'Quintett', 'Es werden zunächst fünf verschiedene Szenen angespielt. Nun entscheiden die Zuschauer, welche von diesen fünf Szenen herausfällt. Die verbliebenen vier werden weiter gespielt. Wieder entscheidet das Publikum, welche von den Vieren herausfällt. Das geht so weiter, bis schließlich am Ende eine Szene übrig bleibt.

Variante: Die Szene wird als "Quartett" gespielt, d.h. es wird mit vier Szenen angefangen.', 'https://improwiki.com/de/wiki/improtheater/quintett', '2020-11-14 07:44:15.271', 37);
INSERT INTO public.part VALUES (53, 1, '2020-12-02 22:03:45.636678', '2020-12-02 22:03:45.636678', 'Madrigal', '## Version 1

Vier Spieler/innen stellen sich nebeneinander auf die Bühne. Es werden vier unterschiedliche Begriffe/Sätze abgefragt:  
Zum Beispiel:  
Für Stimme 1: der Namen einer bekannten Persönlichkeit (eines bekannten Politikers),  
für 2: ein einfacher Spruch aus der Werbung,  
für 3: eine Bauernweisheit oder ein Sprichwort,  
für 4: ein typischer Satz, den Eltern ihren Kindern sagen.

Für alle vier gilt, dass sie zunächst immer im gleichem Rhythmus und mit gleicher Melodie singen. Wobei wichtig ist, nicht nur unterschiedliche Melodien zu wählen, sondern auch unterschiedliche Rhythmen.

**PHASE 1**:  
Stimme 1 ist für den Rhythmus zuständig und fängt allein an, immer den Namen zu singen. Dann folgt 2., diese Gesangsstimme ist grundsätzlich für den Bass zuständig. 3. und 4. sind die Melodiestimmen und setzen auch nacheinander ein.

Beispiel:

Stimme 1 singt kontinuierlich z.B. „Leut! - häuser!“ - kurze Pause - „Schnarren“ - kurze Pause - „Berger!“ - kurze Pause - wiederholen.

Stimme 2 singt z.B. „Nihichts“ - kurze Pause „ist unmöglich“ - kurze Pause - wiederholen.

Stimme 3 singt z.B. „Der Krug geht zum Brunnen, bis er zerbricht“. - kurze Pause - wiederholen.

Stimme 4 singt z.B. „Danke“ - Pause - „sagt man!“ - kurze Pause - wiederholen.

**PHASE 2**:  
Wenn alle vier Stimmen etabliert sind und eine gewisse Zeit immer das Gleiche gesungen haben, können Stimme 3 und 4 jeweils nacheinander ein Solo singen, bei dem sie Melodie und Rhythmus abwandeln - nicht jedoch ihren Text! Nach den Soli endet Phase 2 mit dem „Gesangsgeflecht“ aus Phase 1.

**PHASE 3**:  
Zeitversetzt, ohne dass eine bestimmte Reihenfolge eingehalten wird, wandelt jeder spontan zwei bis drei Mal Text, Rhythmus und Melodie mehr oder weniger ab, indem er Wortelemente der Anderen einbaut, wobei jede Abwandlung einige Male wiederholt wird.

Beispiel:

Stimme 1 singt „Leut! - häuser!“ - kurze Pause - „geht zum Brunnen“ - kurze Pause - Wiederholung. Stimme 3 beschließt, zunächst noch ihre Ursprungsversion zu singen und fängt irgendwann später an mit: „Kruhug“ - kurze Pause - „nicht schnarren!“. Stimme 2 singt. „Danke“ - kurze Pause - „ist unmöglich, sagt man!“ - Wiederholung -. Auch Stimme 4 singt zunächst noch ihre Ursprungsversion und variiert (nicht zeitgleich mit Stimme 3) dann irgendwann: „Der Brunnen“ - Pause - „sagt nichts!“. Währenddessen ist Stimme 1 zur Ursprungsversion zurückgekehrt. Stimme 2 wechselt nun zu: "Der Kruhug ist unmöglich sagt der Brunnen." usw.

Wichtig ist, gelegentlich zu seinem Ursprungs-Gesangsmodell zurückzukehren. Sonst wird es zu chaotisch.

**PHASE 4**:  
Aufmerksam sich gegenseitig zuhören: Irgendwann soll sich einer der abgewandelten gesungenen Sätze herauskristallisieren, der schließlich von allen gemeinsam im Chor gesungen wird. Alle hören zur gleichen Zeit mit dem gleichen abgewandelten gesungenen Satz auf.

Tips und Hinweise:

*   Das Spiel ist gut als Startspiel nach der Pause geeignet.
*   In Phase 1 sollten die Sänger nicht zu schnell einsetzen.
*   Man sollte in der Gesangsphrase Pausen vermeiden, weil es schwieriger ist, diese Pausen kontinuierlich hinsichtlich ihrer Dauer einzuhalten.
*   Nicht zu schwere Melodien wählen, dann man muss sich nach dem Solo (der Abwandlung) von Phase 2 wieder an die Ausgangsfassung erinnern!

## Version 2

Bei diesem Spiel wird zunächst vom Publikum für jeden der Singenden ein mehrsilbiges Wort erfragt. Nur dieses Wort darf er die ganze Zeit wiederholen. Je nach Anzahl der Beteiligten hat nun jede/r eine bestimmte Funktion

*   Stimme 1 beginnt und gibt mit ihrem Wort den Rhythmus vor, indem sie monoton und kontinuierlich ihr Wort wiederholt. (Hilfreich ist ein Wort, das etwas wie Percussion klingt, z.B. "Quatschkopf"; man kann z.B. das Publikum um ein Wort mit "tsch" bitten.)
*   Stimme 2 kann mit Hilfe ihres Wortes den Takt vorgeben, z.B. 3/4-Takt (z.B. _Buch_ecker, betontes „Buch“)
*   Stimme 3 singt mit ihrem Wort den Grundton.
*   Stimme 4 singt die Harmonien zu dem Grundton.
*   Stimme 5 improvisiert letztendlich mit seinem Wort eine Melodie, die zu Rhythmus, Takt und Harmonie passt.

Schließlich gibt es noch einen _Dirigenten_. Er weist z.B. einzelne oder alle zum zeitweiligen Leise-Singen an, evtl. auch einen zum Laut-Singen oder einen oder alle zur kurzzeitigen Pause. Der Dirigent zeigt schließlich auch das gemeinsame Ende an.

_Variante_: Die Aufgaben der Sänger eins und zwei, sowie drei und vier können bei weniger Beteiligten zusammengefasst werden.

Dieses Spiel ist gut als Zugabe geeignet.', 'https://improwiki.com/de/wiki/improtheater/madrigal', '2020-11-14 07:44:16.178', 53);
INSERT INTO public.part VALUES (39, 1, '2020-12-02 22:03:43.691859', '2020-12-02 22:03:43.691859', 'Preisverleihung', 'Ein Spiel ab 3 Spieler.

Ein Spieler geht auf die Bühne und ruft einen Spieler B auf die Bühne. Dabei definiert er für Spieler B einen Charakter, einen Tick oder eine besondere Eigenschaft, für die er ausgezeichnet werden soll. Diese Definition kann totaler Nonsens sein.

Spieler A ruft zum Beispiel: "Frederik gewinnt den Preis für das am längsten dauernde Lachen!" Spieler A geht ab und Spieler B kommt dann auf die Bühne und geht kurz in seinen Charakter (lacht) und hält dann - wie bei den Oscars - eine ganz kurze Dankesrede (vielleicht mit Begründung, wieso er das geschafft hat). Dann ruft er den nächsten Spieler C auf und definiert auch für diesen einen Grund für den Preis, z.B.: "Sarah gewinnt den Preis dafür, die schönste Mischung aus dem Stereotyp von Spaniern und Deutschen zu sein." Spieler B geht ab und Spielerin C kommt auf die Bühne, stellt die genannten stereotype Eigenschaften dar, hält ihre Dankesrede, ruft den nächsten Spieler usw. usf.

Das Spiel eignet sich auch gut als Übung, um schnell zwischen unterschiedlichen Charakteren zu wechseln und Angebote groß zu machen.', 'https://improwiki.com/de/wiki/improtheater/preisverleihung', '2020-11-14 07:44:15.32', 39);
INSERT INTO public.part VALUES (40, 1, '2020-12-02 22:03:43.81888', '2020-12-02 22:03:43.81888', 'Der rote Faden', 'Ein realer Gegenstand aus dem Publikum wird auf die Bühne gelegt. Der Gegenstand ist wirklich der Gegenstand, der er ist. Dieser Gegenstand gibt den Ort der ersten Szene vor, d.h. der Ort inspiriert einen Ort, an dem so ein Gegenstand liegen kann.

### Beispiele

*   Messer -> Zirkusmanage (vom Messerwerfer liegengelassenes Messer)
*   Trommelstöcke -> Probenraum einer Band
*   Kamm -> Friseursalon

An diesem ersten Ort werden solange verschiedene (zusammenhängende) Szenen gespielt, bis ein Spieler den Gegenstand nimmt und mit diesem Gegenstand den gedachten Ort verlässt. Er nimmt den Gegenstand mit in den nächsten Raum/Ort, wo dann weitergespielt wird.

Z.B. ein kleptomanischer Kunde im Friseursalon steckt den Kamm ein und geht damit raus auf die Straße. Dann spielen die nächsten Szenen auf der Straße (mit Spaziergänger, Autofahrern, Hundebesitzer mit Hunden...), solange, bis der Kleptomane mit dem Kamm in der Tasche die Bank betritt. Hier zieht er den Kamm aus der Tasche, kämmt sich und läßt ihn dann im Schalterraum der Bank liegen...

Die Szenen müssen nicht zusammenhängen, der rote Faden wird von dem Gegenstand gebildet. Wieviele Personen jeweils spielen variiert auch. Beim roten Faden kann auf der Bühne auch mal nichts passieren und der Gegenstand liegt unbeachtet rum.

Sehr schön ist es, den Gegenstand eine gewisse Zeit gar nicht zu beachten. Er ist einfach da und inspiriert für neue typische Szenen an diesem Ort.', 'https://improwiki.com/de/wiki/improtheater/der_rote_faden', '2020-11-14 07:44:15.438', 40);
INSERT INTO public.part VALUES (41, 1, '2020-12-02 22:03:43.956666', '2020-12-02 22:03:43.956666', 'Ding auf Ding', 'Dieses Spiel setzt voraus, dass vor seinem Beginn bereits einige Gegenstände zur Verfügung stehen - etwa im Rahmen einer "Bring dein Ding"-Show. Aber der Moderator kann auch einfach unmittelbar vor Beginn des Spieles die Zuschauer um Gegenstände bitten.

Der Moderator lässt sich vom Publikum einen alten (handwerklichen) Beruf geben. Im Rahmen der nun beginnenden Szenenfolge geht ein Spieler auf der Bühne, der eben die Ausübung dieses Berufs darstellt und typische Tätigkeiten ausführt. Er bleibt die ganze Zeit auf der Bühne und wird in jeder Szene von den Anderen bespielt. Diese kommen hintereinander in **rascher** Abfolge mit wechselnden Gegenständen auf die Bühne, es kommt zu einem Dialog mit dem Bespielten und sie gehen wieder ab. Idealerweise entsteht eine Geschichte, d.h. zumindest ein Teil der dargestellten Personen und Gegenstände sind im Laufe der Szenenfolge Bestandeile einer zusammenhängenden Geschichte.

### Beispiel

Der zu bespielende Person ist ein Hufschmied. Die 1. Person kommt mit einer Toilettenrolle auf die Bühne, entrollt sie ein Stück weit, schaut darauf, als wenn sie etwas abliest und sagt zum Hufschmied: "Der König hat verfügt, dass ihr ab sofort den Zehnten als Steuern abzuführen habt", danach kurzer Dialog - usw. - Geht ab.

Die 2. Person kommt auf die Bühne mit einem Sparschwein. "Können Sie meiner Emma ein paar Hufe schmieden", sagt sie z.B. und geht ab. (im weiteren Verlauf ergibt sich, dass diese Geschichte nicht weitergeht)

Die 3. Person kommt auf die Bühne mit einer Flasche. Sie könnte z.B. einen Zeitsprung ankündigen und sagen: "Vater, das Elixir ist ausgelaufen!". Der Hufschmied definiert im Rahmen seiner Reaktion, dass es sich um ein Steuerbefreiungs-Elixir handelte. Auch hier entwickelt sich ein kurzer Dialog. Die 3. Person geht ab. Der Hufschmied schmiedet.

Schließlich: Eine 4. Person kommt mit einem Regenschirm auf die Bühne, den sie als Schwert definiert, usw.

### Hinweise und Tipps

*   Ein Spieler kann in jeder der Szenen jeweils eine andere Person darstellen. Er kann aber auch als dieselbe Person einige Szenen später wieder auftauchen, aber dann unter Umständen mit einem anderen Gegenstand.
*   Dieses Spiel kann auch als Variante des Zettelspiels gespielt werden: Statt mit einem Gegenstand die Bühne zu betreten, heben die Spieler eine Zettel auf und lesen ihn vor.', 'https://improwiki.com/de/wiki/improtheater/ding_auf_ding', '2020-11-14 07:44:15.562', 41);
INSERT INTO public.part VALUES (42, 1, '2020-12-02 22:03:44.09743', '2020-12-02 22:03:44.09743', 'Wachsen und Schrumpfen', '_Auch bekannt als "Tannenbaum", "Pyramide", "Space Jump" oder "Zappen"_

Der erste Spieler etabliert und spielt allein eine Szene. Ein zweiter Spieler kommt hinzu - damit ist die Szene zuende - und etabliert und spielt mit dem ersten Spieler eine völlig neue Szene, die mit der ersten nichts gemein hat. Ein dritter Spieler tritt hinzu, etabliert und spielt mit den anderen eine weitere Szene und so fort. Sind alle Spieler auf der der Bühne und ist die letzte Szene gespielt, verlassen die Spieler in umgekehrter Reihenfolge wieder die Bühne, also angefangen mit dem letzten Spieler. Der Abgang sollte immer begründet und motiviert geschehen. Verlässt ein Spieler die Bühne, so fallen die verbliebenen Spieler wieder in die Szene zurück in der sie waren, bevor der Spieler, der gerade abgegangen ist, die Bühne betreten hat. Schließlich ist nur noch der Spieler auf der Bühne, der auch zu Anfang die erste Szene gespielt hat.

Spieleranzahl: 4 oder 5 Länge: ca. 10 Minuten

## Probleme und Hinweise

*   Manchmal ist es so, dass man die Szene vergessen hat, in die man "zurückfällt".
*   Man muss beim Szenenwechsel nicht die Haltungen übernehmen wie beim Freeze Tag.
*   Manchmal sind Zeitsprünge zwischen der ersten und der zweiten, der "Schrumpf-Szene" sinnvoll.
*   Jeder der Spieler lässt sich eine Vorgabe geben, die (nur) in der von ihm etablierten Szene maßgeblich ist. Die Vorgaben sollten aus unterschiedlichen Bereichen stammen (Farbe, Beruf, Werkzeug, Hobby, Tick z.B.).

## Variante

Die Personen und der Ort bleiben gleich, die jeweils hereinkommenden Spieler haben eine vorher abgefragte Emotion, die sie und die anderen ausspielen, sobald der betreffende einzelne Schauspieler die Bühne betreten hat.  
Wichtig hier: Fokus beachten und einen Raum bzw. ein Ereignis in einem Raum abfragen, an dem/bei dem sich viele Leute aufhalten (z.B. Großraumbüro, Polterabend).

', 'https://improwiki.com/de/wiki/improtheater/wachsen_und_schrumpfen', '2020-11-14 07:44:15.62', 42);
INSERT INTO public.part VALUES (43, 1, '2020-12-02 22:03:44.236732', '2020-12-02 22:03:44.236732', 'Dutch Square', 'auch bekannt unter:

*   Dreh Links, Dreh Rechts
*   Square Dance
*   Genredreieck
*   Bermudadreieck
*   Spieluhr

Beim Spiel _Dutch Square_ befinden sich vier Spieler auf der Bühne, wobei immer nur zwei miteinander eine Szene spielen. Diese beiden stehen vorn (Spieler A links und Spieler B rechts). Die anderen beiden Spieler stehen im hinteren Teil der Bühne (C hinten links, D hinten rechts), so dass sich ein "Quadrat" ergibt.

Jedem Spieler wird vom Publikum ein Genre zugeordnet (TV, Film); das Genre des jeweils vorne rechts stehenden Spielers ist das maßgebende des jeweiligen Spiels.

Das vorne stehende Spielerpaar beginnt mit dem Spielen (Genre von Spieler B).

Spieler C und D können an einer beliebigen Stelle klatschen, dann dreht sich das Viereck im Uhrzeigersinn, sodass nun Spieler D mit Spieler B eine neue Szene spielt, wobei Spieler D sein Genre mitbringt. Beim erneuten Wechsel spielt Spieler C mit Spieler D in Spieler Cs Genre. Jede Konstellation spielt eine völlig andere Szene, welche mit den drei anderen Szenen nichts zu tun hat. Sobald sich das Viereck vier Mal gedreht hat, wird die jeweilige Geschichte fortgesetzt (wobei Zeitsprünge in die Zukunft möglich sind), sodass vier Geschichten entstehen.

Jedes Spielerpaar spielt grundsätzlich drei Mal, wobei das Schema: Erste Szene: Basisinformationen und Positiv sein, zweite Szene: Konflikt oder Problem und dritte Szene: Lösung hilfreich ist.

Es wird darauf hin gearbeitet, dass alle vier Geschichten beendet werden können.

**Varianten:**

*   Es sind nur drei Spieler auf der Bühne, d.h. es gibt nur 3 Paare und Geschichten
*   Statt eines Genres wird für jedes der vier (drei) Spielerpaare eine beliebige Vorgabe abgefragt.
*   Vom Publikum wird nur eine Vorgabe erfragt; jede der vier (drei) Geschichten muss irgend etwas mit dieser Vorgabe zu tun haben
*   Es können auch vier (drei) verschiedene Szenen in _einem_ vorgegebenen Genre gespielt werden.
*   Es sind Links- und Rechtsdrehungen möglich.
*   Der Moderator veranlasst die Drehungen.
*   Jedes Spielpaar spielt mehr als drei Mal.

', 'https://improwiki.com/de/wiki/improtheater/dutch_square', '2020-11-14 07:44:15.785', 43);
INSERT INTO public.part VALUES (129, 1, '2020-12-02 22:03:58.108472', '2020-12-02 22:03:58.108472', 'Replay der hohen Künste', '1\. Neutrale Szene, Vorgabe kann ein Ort, Gegenstand oder eine Beziehung sein.

2\. Szene wird wiederholt. Besonderheit: es wird in Reimen gesprochen.

3\. Szene wird getanzt. Ausdruck.

4\. Es wird eine Oper oder ein Musical dargestellt.

siehe auch Genrereplay

', 'https://improwiki.com/de/wiki/improtheater/replay_der_hohen_kuenste', '2020-11-14 07:44:19.348', 129);
INSERT INTO public.part VALUES (130, 1, '2020-12-02 22:03:58.354146', '2020-12-02 22:03:58.354146', 'Genrereplay', 'Das Genrereplay ist eines der beliebtesten Spiele beim Improtheater. Zunächst wird eine beliebige Vorgabe (z.B. eine alltäglichen Handlung) eingeholt und zwei bis drei Spieler spielen eine neutrale Szene. Diese Szene sollte nicht zu lang und nicht zu kompliziert sein.

Nach dem Ende dieser Szene wird das Publikum gebeten, ein beliebiges (Film-, Fernseh- oder Theater-) Genre zu nennen. (
Es folgen noch ein oder zwei weitere Replay-Szenen in anderen Genres.

Beispielgenres: Western, Science Fiction, Sitcom, Dauerwerbesendung...

**Tipps und Hinweise:**

*   Man muss/kann sich nicht sklavisch an den Handlungsablauf, die Figuren und Gegenstände der Ausgangsszene halten, sondern muss sie dem Genre anpassen. Das kann durchaus großzügig geschehen, nur die wichtigen, prägenden Handlungselemente der Ausgangsszene sollten immer vorhanden sein.
*   Es ist hilfreich, die typischen Merkmale (Klischees) der gängigsten Genres zu kennen. Es kann auch nicht schaden, sich mal einen typischen Film (z.B. Bollywood) anzuschauen.
*   Wenn man bestimmte Genres nicht spielen will, nennt man sie bei der Anfangsmoderation als Beispiel. ("Bitte nennen sie mir mal ein Filmgenre. Filmgenres sind z.B. Science Fiction oder Heimatfilm").
*   Unbekannte oder abwegige Genrevorschläge kann man ablehnen (z.B. "Hatten wir letzte Woche erst"). Man kann auch nachfragen, was das betreffende Genre auszeichnet (z.B. "Was sind denn die typischen Merkmale eines Fassbinder-Films?").

## Literaturgenres

Eine interessante Abwandlung des Genrereplay ist das Abfragen und Spielen nur von Büchergenres - wobei der Begriff im weitesten Sinne gemeint ist. Hier ist das Spielen von Genres möglich, die bei Filmgenres nicht möglich sind.  
Etwa:  
Kochbuch, Fahrrad-/Autoreparaturbuch, Bilderbuch, Telefonbuch, Comic, Reiseführer, Lyrikband, Briefmarkenkatalog, Versandhauskatalog, allgemeines Lexikon, Wörterbuch, Reimlexikon, Kreuzworträtselbuch, Mathematik-Schulbuch, Terminkalender, Tagebuch, (leeres) Notizbuch, Führerscheinfragen-Buch, Krankheiten-Nachschlagewerk, Bibel, Bastelbuch, Pflanzenbestimmbuch, Vogelbestimmbuch, Gartengestaltungsbuch, Gesetzessammlung, Gästebuch, Poesiealbum, Atlas, Fotoband, Gebrauchsanweisung.  
Hier ist es spannend und witzig, wie man die spezifischen Eigenschaften der jeweiligen Buchgattung versuchen kann, in Worte bzw. in Spielhandlung umzusetzen.  
Daneben gibt es natürlich Literaturgenres, die es entsprechend auch als Filmgenres gibt wie Kriminalgeschichte, Liebesroman, Historienschinken usw.

**Weitere Tipps:**

*   Theatersportspiele, aber richtig! - 4. Genre-Replay

Siehe auch: Märchenreplay

zurück zur Spieleliste', 'https://improwiki.com/de/wiki/improtheater/genrereplay', '2020-11-14 07:44:19.583', 130);
INSERT INTO public.part VALUES (44, 1, '2020-12-02 22:03:44.375543', '2020-12-02 22:03:44.375543', 'Letzter Satz - erster Satz', 'An diesem Spiel sind 2 Gruppen zu je 2 Spielern beteiligt, die jeweils zu zweit links und rechts der Bühne stehen.

Die erste Gruppe A spielt nach beliebiger Vorgabe eine Szene. Der Moderator sagt an einer bestimmten Stelle „Stopp“ (siehe Schnitt/Beat) und wiederholt den letzten gesprochenen Satz. Dieser Satz ist nun der _erste_ Satz für eine Szene der anderen Gruppe B. Nach einer gewissen Spielzeit sagt der Moderator wiederum „Stopp“ und wiederholt den _letzten_ Satz dieser Szene. Dieser ist nun der erste Satz der Gruppe A, die ihre Eingangsgeschichte fortsetzt.

Dieses Ping-Pong-Spiel findet einige Male statt, wobei jede der beiden Gruppen jeweils bei ihrer Geschichte bleibt.

Tipps:

*   Statt des Moderators kann auch einer der Spieler der gerade nicht spielenden Gruppe Stopp sagen und damit das Spielen der anderen Gruppe unterbrechen.
*   Gegen Ende der Szenenfolgen sollten die Wechsel schneller geschehen.
*   Die beiden Geschichten sollten (zunächst) nichts miteinander zu tun haben (außer den "zufällig" gleichen Sätzen) und völlig unterschiedliche Orte, Situationen, Beziehungen haben.
*   Wenn es passt, kann man gegen Ende versuchen, die beiden Geschichten zu einer zusammenzuführen.', 'https://improwiki.com/de/wiki/improtheater/letzter_satz_-_erster_satz', '2020-11-14 07:44:15.809', 44);
INSERT INTO public.part VALUES (45, 1, '2020-12-02 22:03:44.538869', '2020-12-02 22:03:44.538869', 'Miniszenenkette', 'Zwei Spieler bekommen als Vorgabe vom Publikum einen "sinnlichen Begriff". Dann haben sie die Aufgabe, innerhalb einer vorgegebenen Zeit (z.B. 90 Sekunden) soviele Miniszenen wie möglich nach dem Freeze Tag\-Prinzip (allerdings ohne Spielerwechsel) zu spielen, die alle mit diesem Begriff zu tun haben müssen.

Sobald der Szenenanfang steht und der Bezug zum vorgegebenen Begriff erkennbar ist, ruft der Spielleiter "Punkt", die Spieler frieren für einen Sekundenbruchteil ein und spielen dann aus dieser Haltung heraus - sonst darf sie der Spielleiter mit "unsauberes Freeze" in die Ausgangshaltung zurückschicken - sofort einen neuen Szenenanfang. Auf diese Weise entsteht eine Kette von Miniszenen mit denselben zwei Spielern: Szenen, die immer neue Rollen und Orte bringen, aber alle auf irgend eine Weise mit dem vorgegebenen Begriff zu tun haben.

Da das Spiel auf Zeit geht, üben die Spieler dabei, möglichst schnell Figur, Ort und Handlung zu definieren.

Als Vorübung bietet sich Statue - Szenenanfang an.', 'https://improwiki.com/de/wiki/improtheater/miniszenenkette', '2020-11-14 07:44:15.381', 45);
INSERT INTO public.part VALUES (46, 1, '2020-12-02 22:03:44.672336', '2020-12-02 22:03:44.672336', 'Szenenmarathon', '**Szenenmarathon** ist eine Variante von Freeze Tag für den Schluss einer Impro-Show.

Beliebig viele Spieler finden sich auf der Bühne ein. Es spielen immer nur zwei Spieler eine kurze Szene. Durch Klatschen wird die Szene eingefroren und einer der Spieler wird durch den Klatscher ausgetauscht. Dann beginnt eine völlig neue Szene. Das geschieht so oft wie man will, die einzelnen Szenen dauern in der Regel nicht länger als 30 Sekunden.

Dabei versuchen die Spieler, vorher in der Show gespielte Szenen einfließen zu lassen und eventuell weiterzuspinnen.

**Beispiel:** In einem der gespielten Szenen wurde die Loreley von ihrem Felsen gelockt und der Posten neu besetzt. Im Szenenmarathon übergibt die alte Loreley schließlich das Amt offiziell an die neue Loreley.

Durch den Wiedererkennungseffekt ist das besonders amüsant für die Zuschauer.

', 'https://improwiki.com/de/wiki/improtheater/szenenmarathon', '2020-11-14 07:44:15.753', 46);
INSERT INTO public.part VALUES (47, 1, '2020-12-02 22:03:44.80193', '2020-12-02 22:03:44.80193', 'Promiachterbahn', 'Die Szene wird von 2-3 Spielern gespielt.

Davor lässt sich der Spielleiter vom Publikum mehrere promis oder berühmte Persönlichkeiten / Figuren zurufen.

Wie bei der Achterbahn (Gefühle) und der Genreachterbahn ordnet er den Spielern während der Szene Promis zu.

Die Spieler müssen fortan den Charakter, die Eigenheiten des ihm zugeordneten Promis übernehmen.

_Beispiele:_

*   Napoleon - Hand im Hemd
*   Donald Duck - schnattern
*   Boris Becker - "ähm" sagen', 'https://improwiki.com/de/wiki/improtheater/promiachterbahn', '2020-11-14 07:44:15.861', 47);
INSERT INTO public.part VALUES (48, 1, '2020-12-02 22:03:44.933024', '2020-12-02 22:03:44.933024', 'Kontakt-Fünfer', 'Der Spielleiter lässt sich aus dem Publikum fünf beliebige Möglichkeiten geben, wie Menschen in Körperkontakt kommen können. Etwa Füßeln, Nasereiben, Boxen, Tanzen, Auf-die-Schulter-klopfen. Aufgabe jedes der zwei Spieler auf der Bühne ist es nun, alle fünf Berührungsformen mindestens ein Mal sinnvoll bzw. passend in die Szene einzubauen.', 'https://improwiki.com/de/wiki/improtheater/kontakt-fuenfer', '2020-11-14 07:44:15.888', 48);
INSERT INTO public.part VALUES (49, 1, '2020-12-02 22:03:45.048545', '2020-12-02 22:03:45.048545', 'Reden bei Berührung', 'Es wird eine Szene von zwei Spielern gespielt, bei Bedarf mit Vorgaben aus dem Publikum.

Gesprochen werden darf allerdings immer nur dann, wenn der eine Spieler den anderen berührt und dann darf auch nur derjenige sprechen, welcher die Berührung durchführt. Dauerberührungen wie "Händchen halten" sind verboten.

Es kommt dadurch zu einem Wechsel von stummen mit gesprochenen Abschnitten. Die Komik entsteht durch die Notwendigkeit der Spieler, den anderen irgendwo/irgendwie zu berühren, um ihm etwas sagen zu können.

Variante: Eine Berührung gilt immer in beiden Richtungen, d.h. sobald der Kontakt da ist, dürfen beide sprechen, egal von wem die Berührung ausging. Sobald der Kontakt abreißt, müssen beide wieder schweigen und können nur noch pantomimisch spielen.', 'https://improwiki.com/de/wiki/improtheater/reden_bei_beruehrung', '2020-11-14 07:44:15.979', 49);
INSERT INTO public.part VALUES (50, 1, '2020-12-02 22:03:45.191751', '2020-12-02 22:03:45.191751', 'Singen bei Berührung', 'Zwei oder mehr Spieler improvisieren eine Szene.

Es gilt die Regel: sobald sich zwei Spieler berühren, müssen sie singen.

Durch Berühren und Loslassen können die Spieler selbst steuern, wann und wieviel sie singen mögen.

', 'https://improwiki.com/de/wiki/improtheater/singen_bei_beruehrung', '2020-11-14 07:44:15.957', 50);
INSERT INTO public.part VALUES (51, 1, '2020-12-02 22:03:45.357614', '2020-12-02 22:03:45.357614', 'Refrain Groove', 'Beim **Refrain Groove** (auch bekannt als **Abschluss Song**) platzieren sich auf der Bühne 5 bis 7 Spieler/Sänger nebeneinander. Der Spielleiter Vorgaben das Publikum nach einem Satz. Der Musiker spielt eine eingängige, einfache Melodie. Die Spieler/Sänger stehen locker und bewegen sich leicht im Takt der Musik. Der erste in der Reihe singt nun vier sich reimende Zeilen auf die vorgegebene Musik - der Text sollte zu dem aus dem Publikum genannten Satz passen. Der zweite macht das Gleiche mit einem neuen Vierzeiler. Der dritte Spieler/Sänger ist für den Refrain zuständig. Er sollte besonders sangesfest sein, weil er sich - ebenso wie der Musiker - die Melodie des Refrains merken muss. Er singt mehrfach als Refrain den aus dem Publikum vorgegeben Satz, die anderen Spieler stimmen ein. Danach kommen vierter und fünfter Spieler/Sänger mit ihrem Vierzeiler dran, dann singt wieder die dritte Person den Refrain. Es folgen sechster und siebter Spieler/Sänger und Refrain. Der Gesang sollte "groovend", engagiert und mitreißend sein. Man kann mit dem Musiker vereinbaren, dass er an einem bestimmten Moment ein Solo einbaut, z.B. vor der Refrain-Wiederholung am Ende.

### Ablaufschema für 5 Spieler A, B, C, D, E:

*   A: 1. Strophe
*   B: 2. Strophe
*   C: Refrain (alle stimmen ein)
*   D: 3. Strophe
*   E: 4. Strophe
*   C: Refrain (alle stimmen ein)
*   evtl. Solo des Musikers
*   Alle: Refrain-Wiederholung und Ende

_Variante_: Man fängt mit dem Refrain an.

### Ergänzende Hinweise

*   Refrain Groove ist gut geeignet als letztes Stück des Abends, also als Zugabe. Wenn es gut läuft, werden die Zuschauer den Veranstaltungsort beschwingt mit Melodie und Refrain im Kopf verlassen!  
    
*   Statt eines vorgegebenen Satzes kann man auch einen vom Publikum vorgegebenen Begriff besingen.
*   Gut kommen auch gemeinsame Tanzeinlagen während des Singens, gemeinsames, koordiniertes Schnippsen usw.
*   sinnvoll kann es sein, (auch hier) eine Geschichte zu erzählen, also wenn z.B. die Kartoffel besungen werden, nicht abstrakt durch alle Spieler deren Vor- und Nachteile zu besingen, sondern die Kartoffel in eine Geschichte einzubinden, z.B. vom Bauern, der auf einem Wochenmarkt, wo er Kartoffeln verkauft, seine Traumfrau kennenlernt.', 'https://improwiki.com/de/wiki/improtheater/refrain_groove', '2020-11-14 07:44:16.057', 51);
INSERT INTO public.part VALUES (54, 1, '2020-12-02 22:03:45.808081', '2020-12-02 22:03:45.808081', 'Serenade II', 'Vier Spieler stehen hintereinander, alle mit Blickrichtung Publikum (bzw. Blickrichtung Rücken). Ihre Aufgabe ist es, ein vorgegebenes Thema zu besingen. Die Musik kommt vom Musiker. Nur der jeweils vorne stehende Spieler singt zum Thema. Wenn er keine Lust mehr hat oder ihm nichts mehr einfällt, hört er auf und geht nach hinten, ist nun also der Letzte in der Reihe. Nun muss die ehemals 2. Person in der Reihe (weiter-)singen. Auch sie kann jederzeit aufhören und nach hinten gehen. Aber auch dem jeweiligen Spieler hinter dem ersten, singenden ist es erlaubt, diesen jederzeit abzulösen. Dazu wird dieser deutlich sichtbar angetippt (z.B. auf den Oberarm) oder weggeschoben und muss dann auch sofort nach hinten.

Nach einer gewissen Zeit, wenn die Zuschauer mit dem Spielprinzip vertraut sind, darf die strenge Regel etwas gelockert werden, z.B., indem sich zum Finale hin die strenge Reihe nach hinten auflöst und alle vier gleichzeitig singen (z.B. einen passenden, prägnanten Abschlusssatz mehrmals gemeinsam singen). Oder z.B. kann/darf das Ablösen häufiger/hektischer werden oder es ist auch sanftes (!) Wegschubsen erlaubt.

## Hinweise und Tipps

*   Schön ist, dass man die Verantwortung jederzeit an die hinter einem stehende Person abgeben kann, das nimmt Druck. Das gilt insbesondere für Leute, die beim Singen unsicher sind. Der "Druck" ist geringer, weil sie wissen, dass sie jederzeit aufhören können.
*   "Alphatiere" und Rampensäue, die gerade zu ihrem großen musikalischen Wurf ansetzen wollen, kann man einfach ablösen. Das kann komisch sein.
*   Zu dritt geht das Spiel auch.

Siehe auch: Rampensau-Singen', 'https://improwiki.com/de/wiki/improtheater/serenade_ii', '2020-11-14 07:44:16.207', 54);
INSERT INTO public.part VALUES (55, 1, '2020-12-02 22:03:45.935429', '2020-12-02 22:03:45.935429', 'Serenade', '(Für beliebig viele Personen)

Der Erste singt den Refrain, möglichst einfach zu merkender Text, eine, maximal zwei verschiedene Zeilen.

Diese wiederholt er solange, bis er sie intus hat.

Dann gibt er unbemerkt der zweiten Person ein Zeichen, dass dieser ohne Pause seine Strophe, welche zum Refrain passt, singen kann, ein möglichst gereimter Vierzeiler, es folgt der Refrain, gesungen von Person 1.

Darauf folgt Strophe zwei, gesungen von Person 3, welche sich nur auf den Refrain, **nicht** auf Strophe eins bezieht, gefolgt Person 1 mit dem Refrain.

Person 4 kommt mit der dritten Strophe, und Person 1 mit dem Refrain, danach der Refrain und die Steigerung, großes Finale, nocheinmal (evtl. eine Tonart höher) der Refrain von allen mit gutem Liedschluss (ausklingen lassen, letzte Wörter wiederholen, letzte Zeile doppelt etc.)', 'https://improwiki.com/de/wiki/improtheater/serenade', '2020-11-14 07:44:16.206', 55);
INSERT INTO public.part VALUES (56, 1, '2020-12-02 22:03:46.097385', '2020-12-02 22:03:46.097385', 'Singender Geschichtenerzähler', 'Bei diesem Spiel wird die Geschichte eingeleitet, begleitet und abgeschlossen durch einen singenden Geschichtenerzähler (sG). Dieser steht an der Seite, in der Nähe des begleitenden Musikers. Der sG lässt sich vom Publikum eine Vorgabe geben und fängt dann an, eine Geschichte erzählend zu singen. Wenn er sein Singen beendet hat, fangen die Schauspieler an zu sprechen und zu agieren. Immer wenn er es für passend hält, fängt der sG wieder an zu singen. Hierzu tritt es nach vorn, bleibt aber immer an der Seite stehen. Tritt der sG nach vorn, beenden die Schauspieler ihre Szene. Der sG kann zusammenfassen, neue Impulse geben, Zeitsprünge initiieren, Gedanken von Figuren wiedergeben u.v.m. Irgendwann beendet er das Singen und tritt wieder zurück und die nächste Szene der Geschichte beginnt. Dieses Wechselspiel passiert mehrere Male. Wenn die Schauspieler ihre letzte Szene gespielt haben, tritt der sG zum abschließenden Singen vor. Das kann z.B. die „Moral von der Geschichte“ sein oder ein Ausblick in die Zukunft der Figuren.

Hinweise und Tipps:

*   Immer wenn der sG singt, tritt der nach vorn. Wenn er schweigt, steht er hinten. Wichtig ist, dass er immer an der Seite bleibt. Den zentralen Bereich der Bühne hat er den agierenden Schauspielern zu überlassen. Lediglich am Ende, beim "abschließenden Singen" darf er den zentralen Bereich der Bühne betreten.
*   Das Gesungene muss sich nicht reimen und muss nicht eine Form mit Strophe/Refrain haben.
*   Sowohl der sG als auch die agierenden Schauspieler geben sich wechselseitig Impulse.

Siehe auch: Typewriter', 'https://improwiki.com/de/wiki/improtheater/singender_geschichtenerzaehler', '2020-11-14 07:44:16.346', 56);
INSERT INTO public.part VALUES (57, 1, '2020-12-02 22:03:46.225911', '2020-12-02 22:03:46.225911', 'Duett', '**Duett 1:**  
Zwei Sänger blicken sich an. A singt seine vierzeilige Strophe. B singt seine vierzeilige Strophe. Währenddessen singt A seine noch einmal für sich, danach singen beide jeweils ihre Strophe zum Publikum.

**Duett 2:**  
wie Duett 1, nur dass die vierte Zeile von A, B auch in seine Strophe integrieren muss, beim darauffolgenden gemeinsamen Singen singen am Schluss beide die gleiche Zeile und wiederholen diese danach noch einmal.

**Duett 3:**  
wie Duett 2, allerdings folgt nach den beiden Strophen eine Zwischensequenz zum Thema gesungen von einem Sänger C. Danach singen A und B jeder seine Strophe, letzte Zeile ist wieder gleich und wird gemeinsam gesungen und noch einmal wiederholt.

**Duett 4:**  
wie Duett 3, allerdings wird die Zwischensequenz von den beiden Sängern A und B gemeinsam gesungen, und zwar wie folgt: A: seine Strophe, vierte Zeile muss sich Sänger B merken. B: seine Strophe mit der vierten Zeile von A gemeinsame Strophe: B: Zeile 1 A: Zeile 2 mit Reim auf Zeile 1 A: Zeile 3 B: Zeile 4 mit Reim auf Zeile 3 Danach singt jeder seine Strophe, wobei die letzte Zeile wieder die gleiche ist und zweimal gesungen wird.

**Duett 5:**  
Wie Duett 4, allerdings singen beide die Zwischensequenz gemeinsam, das heißt lippensynchron, dabei sollte möglichst ein einfacher Text genommen werden, evtl. mit Wiederholung. Gefolgt von den beiden einzelnen Strophen, welche jeder für sich singt, zum Publikum gewandt, letzte Zeile ist wieder gleich und wird gemeinsam und zweimal gesungen.', 'https://improwiki.com/de/wiki/improtheater/duett', '2020-11-14 07:44:16.332', 57);
INSERT INTO public.part VALUES (58, 1, '2020-12-02 22:03:46.37861', '2020-12-02 22:03:46.37861', 'Wachsen und Schrumpfen gesungen', 'An diesem Spiel können sich 4 bis 5 Personen beteiligen.

Der Moderator lässt sich eine Vorgabe geben. Diese fließt in die erste Gesangs-Szene ein. Hierzu tritt der erste Spieler auf die Bühne und singt Lied A solo. Nach einer gewissen Zeit wird das Lied beendet (der Musiker hört auf zu spielen) und ein zweiter Spieler tritt neben den ersten. Es fängt nun ein komplett neues (anderes) Lied B an, an dem nun beide Sänger beteiligt sind. Die Form ist gleichgültig (Duett, einer Strophe, der andere Refrain, beide Refrain usw.). Auch hier wird nach einer gewissen Zeit das Lied B beendet und der dritte Spieler kommt hinzu. Wiederum fängt ein neues Lied C an, an dem nun drei Sänger beteiligt sind. Nach den gleichen Regeln geht es so weiter bis zum vierten oder fünften Sänger. Danach nimmt die Zahl der Sänger wieder ab. Das heißt, es wird nun spiegelbildlich zu dem gesungen, wie oben beschrieben (fünf mit Lied E – ) vier mit Lied D – drei mit Lied C – zwei mit Lied B – einer mit Lied A. Am Ende der jeweiligen Gesangsszene geht der betreffende Spieler ab. Die Sänger greifen dabei jeweils Thema oder Geschichte wieder auf, das/die sie nun fortführen, der Musiker spielt wieder die gleiche Melodie und auch die Sänger versuchen sich an ihren Gesang zu erinnern.

Tipps und Hinweise:

*   Es ist schön, wenn die Lieder alle thematisch irgendwie zusammenhängen.
*   Damit sich Musiker und Sänger gut an ihre Melodie der jeweiligen Szene erinnern können, sollte die Liedgestaltung sehr unterschiedlich sein. Ggf. dauert es eine gewisse Zeit, bis sich die Sänger beim "Schrumpfen" wieder an ihre Melodie erinnern.

Siehe auch: Wachsen und Schrumpfen', 'https://improwiki.com/de/wiki/improtheater/wachsen_und_schrumpfen_gesungen', '2020-11-14 07:44:16.455', 58);
INSERT INTO public.part VALUES (59, 1, '2020-12-02 22:03:46.516447', '2020-12-02 22:03:46.516447', 'Anette, die Nette', 'Anette, die Nette, ist eine unglaublich freundliche Person, die mit ihrem Haustier spazieren geht. Immer wieder trifft sie auf Leute die kleine Probleme haben, die sie prompt löst. Die anderen Personen belohnen sie dafür mit einem Lied.

Dieses einfache Spiel kommt auch deswegen beim Publikum gut an, weil es angenehm positiv ist. Es gibt zwar kleine Probleme, aber die Grundtendenz ist und bleibt immer positiv. Dieses Positive strahlt auch die bespielte Hauptfigur aus.', 'https://improwiki.com/de/wiki/improtheater/anette_die_nette', '2020-11-14 07:44:16.545', 59);
INSERT INTO public.part VALUES (60, 1, '2020-12-02 22:03:46.629911', '2020-12-02 22:03:46.629911', 'Musik-Café', 'Der Spielleiter fragt das Publikum nach dem Namen des Cafés. In diesem Café treffen sich nun 3 bis 4 Spieler und unterhalten sich über dies und das.

Sobald es eine gewichtige Frage zu klären gibt, wird diese von dem, der sie beantworten muss, ans Publikum gestellt. Es folgt ein Lied mit der vom Publikum gegebenen Antwort als Thema.

Danach wird die Cafészene fortgesetzt, bis jeder einmal gesungen hat.

Beispiel für eine gewichtige Frage: _Warum hat dich deine Frau verlassen?_

Beispiel für eine belanglose Frage: _Wie spät ist es?_', 'https://improwiki.com/de/wiki/improtheater/musik-cafe', '2020-11-14 07:44:16.438', 60);
INSERT INTO public.part VALUES (61, 1, '2020-12-02 22:03:46.75071', '2020-12-02 22:03:46.75071', 'Song Contest', 'Das Publikum wird gebeten, drei oder vier Länder zu nennen, welche den Song Contest vertreten sollen.

Des weiteren bekommt jeder der singenden Darsteller eine Vorgabe in Form eines Titels, evtl. gibt es auch nur ein Thema zu dem alle Nationen singen sollen. Jeder Darsteller vertritt sein Land, in dem er in Kauderwelsch (Gromolo) singt. Der Auftritt sollte aber landestypisch sein, so dass man das jeweilige Land auch ohne die Sprache zu verstehen identifizieren kann.

Üblicherweise besteht der Contest höchstens aus 4 Ländern.

Nach den Auftritten erfolgt ein kurzes Replay von 15-20 Sekunden in umgekehrter Reihenfolge.

Danach entscheidet das Publikum durch Applaus, welcher Auftritt der Beste war. Dieser wird dann erneut vorgetragen, diesmal allerdings mit der deutschen Übersetzung des gesungenen Textes.

', 'https://improwiki.com/de/wiki/improtheater/song_contest', '2020-11-14 07:44:16.625', 61);
INSERT INTO public.part VALUES (62, 1, '2020-12-02 22:03:46.910991', '2020-12-02 22:03:46.910991', 'Klapphörnchen', 'Das Klapphörnchen ist Revue-Song, welcher am Ende eines Auftrittes die besten gespielten Szenen im Gesang wierdergeben oder diese als Fortsetztung weitersingen. Empfehlung: 4 Verse pro SpielerIn, Reimen wenn möglich, aber nicht notwendig, MusikerIn empfehlenswert.', 'https://improwiki.com/de/wiki/improtheater/klapphoernchen', '2020-11-14 07:44:16.529', 62);
INSERT INTO public.part VALUES (63, 1, '2020-12-02 22:03:47.073377', '2020-12-02 22:03:47.073377', 'Sing was du denkst', 'An diesem Spiel sind vier Spieler/innen beteiligt. Zwei agieren auf der Bühne, zwei, die Sänger/innen, sind am Rande der Bühne. Sie sind jeweils für einen der Spielenden "zuständig".

Bei diesem Spiel geht es darum, dass der Moderator irgendwann in einem passenden Moment während des Spieles die Szene unterbricht und einem der Sänger am Rand aufträgt zu singen, was "sein" Spieler auf der Bühne denkt. Der Musiker spielt daraufhin eine Begleitmusik und der Sänger singt in Ich-Form von dem, was sein Alter-Ego auf der Bühne aktuell in diesem Moment im Rahmen seiner Figur denkt und bewegt.

Der Moderator kann eine Gesangsunterbrechung während des Spiels immer wieder dann initiieren, wenn es sich anbietet, etwa weil sich aufgrund eines Geschehens oder einer Äußerung die Situation eines Spielers verändert hat.  

Siehe auch Sing dein Gefühl', 'https://improwiki.com/de/wiki/improtheater/sing_was_du_denkst', '2020-11-14 07:44:16.753', 63);
INSERT INTO public.part VALUES (64, 1, '2020-12-02 22:03:47.249171', '2020-12-02 22:03:47.249171', 'Gesungenes "Die"', 'Die Spielregeln entsprechen denen von Fortlaufende Geschichte ("Die"), mit dem Unterschied, dass die Geschichte nicht erzählt, sondern gesungen wird.

Da bei einem Lied häufig Wiederholungen benutzt werden, schaltet sich nach einer Weile der Spielleiter ein und schließt Wortwiederholungen gänzlich aus. Wer sich nicht daran hält, scheidet aus und stirbt einen Theatertod.', 'https://improwiki.com/de/wiki/improtheater/gesungenes_die', '2020-11-14 07:44:16.77', 64);
INSERT INTO public.part VALUES (65, 1, '2020-12-02 22:03:47.396692', '2020-12-02 22:03:47.396692', 'Lied mit Schluss', 'Zur Melodie, welche der Musiker vorgibt wird ein Solo mit mehreren Strophen und Refrain gesungen. Nach der letzten Strophe wird der Refrain mehrfach wiederholt und man findet in Übereinkunft mit der Musikbegleitung einen Schluss (letztes Wort ausklingen lassen, letztes Wort wiederholen, evtl. letzte Zeile leise wiederholen, mit den Armen eine Geste machen, welche der Musiker versteht...)

siehe auch Refrain Groove', 'https://improwiki.com/de/wiki/improtheater/lied_mit_schluss', '2020-11-14 07:44:16.771', 65);
INSERT INTO public.part VALUES (66, 1, '2020-12-02 22:03:47.526639', '2020-12-02 22:03:47.526639', 'Biografischer Song', 'Der Moderator bittet jemanden aus dem Publikum auf die Bühne. Dieser darf sich auf einen Stuhl setzen. Es werden einige biografische Daten abgefragt wie z.B. Name, Hobby, liebste Tätigkeit, Beruf usw. Hilfreich ist es, auch emotional relevante Infos abzufragen, z.B. "Wohin würden Sie gerne mal reisen?"

Zwei Spieler besingen nun den Zuschauer. Einer steht links, einer rechts vom Stuhl. Immer derjenige, den der Zuschauer gerade anschaut, muss singen (dies wurde der/dem Zuschauer/in vorher gesagt). In den Liedtext werden die abgefragten biografischen Infos eingebaut. Immer dann, wenn der Zuschauer die Blickrichtung wechselt, dann wechselt auch sofort der Sänger innerhalb des fortlaufenden Liedes.

Meist sind die Besungenen gerührt. Das Spiel ist auch gut geeignet für Privatauftritte auf Geburtstagen oder Jubiläen.', 'https://improwiki.com/de/wiki/improtheater/biografischer_song', '2020-11-14 07:44:16.669', 66);
INSERT INTO public.part VALUES (67, 1, '2020-12-02 22:03:47.678183', '2020-12-02 22:03:47.678183', 'Modernes Musical', 'Das Publikum gibt einen Titel vor.

Sämtliche Spieler tanzen in modernen Tänzen über die Bühne. Es gibt keinen Text, keinen Gesang, aber alles passt irgendwie zusammen.', 'https://improwiki.com/de/wiki/improtheater/modernes_musical', '2020-11-14 07:44:16.861', 67);
INSERT INTO public.part VALUES (68, 1, '2020-12-02 22:03:47.807256', '2020-12-02 22:03:47.807256', 'Balladensänger', 'Ein Spieler ist der Balladensänger, dieser fängt an, unter Einbeziehung einer Vorgabe zu singen. Ein zweiter Spieler spielt in Zeitlupe genau das, was/worüber der Sänger gerade singt. Beide beeinflussen sich gegenseitig. Es muss nicht unbedingt eine Ballade sein, jeder Musikstil ist möglich.', 'https://improwiki.com/de/wiki/improtheater/balladensaenger', '2020-11-14 07:44:16.86', 68);
INSERT INTO public.part VALUES (69, 1, '2020-12-02 22:03:47.936426', '2020-12-02 22:03:47.936426', 'Operetten-Persiflage', 'Im Englischen wird dieses Spiel **sudden song** (plötzliches Lied) genannt.

Zwei oder drei Spieler improvisieren eine Szene nach einer beliebigen Vorgabe. Immer dann, wenn der Klavier- oder Keyboardspieler anfängt zu spielen, müssen die Spieler augenblicklich von Sprache zu Gesang überwechseln. Der Wechsel erfolgt meistens mitten im Satz - in diesen Übergängen liegt die besondere Komik dieses Spiels.

Die Szene geht entweder inhaltlich in gesungener Dialogform weiter (Advance, ähnlich wie bei Dialog singen) oder der singende Spieler schwelgt in einer Solo-Arie (Extend). Auch ein Duett ist möglich.

Sobald der Musiker aufhört zu spielen - auch das kann plötzlich und unerwartet kommen - wird wieder normal weitergesprochen, als ob nichts gewesen wäre. So wechselt die Szene zwischen gesprochen und gesungenen Abschnitten, und es entsteht die Persiflage einer Operette.', 'https://improwiki.com/de/wiki/improtheater/operetten-persiflage', '2020-11-14 07:44:16.869', 69);
INSERT INTO public.part VALUES (131, 1, '2020-12-02 22:03:58.72627', '2020-12-02 22:03:58.72627', 'Aus der Sicht von', 'Ein Replayspiel, mit 3 Spielern. Man beginnt mit einer neutralen Szene. Wenn diese beendet ist, wird sie wiederholt, aus der Sicht eines der drei Spieler. Das heißt, dass die anderen zwei versuchen größer zu spielen. Sie versuchen auch ihren Charakter so zu spielen wie der dritte ihn wahrgenommen haben könnte.', 'https://improwiki.com/de/wiki/improtheater/aus_der_sicht_von', '2020-11-14 07:44:19.445', 131);
INSERT INTO public.part VALUES (70, 1, '2020-12-02 22:03:48.065412', '2020-12-02 22:03:48.065412', 'Gleichzeitiges Reden', 'Zwei Spieler stehen nebeneinander. Sie schauen sich an und sind (zeitweilig aber auch) dem Publikum zugewandt. Entsprechende der Vorgabe reden sie über ein bestimmtes Thema. Die Besonderheit ist, dass sie gleichzeitig die gleichen Worte bzw. die gleiche Buchstabenlaute aussprechen, also versuchen, wie eine Person zu reden. Das kann zu verlangsamtem Sprechtempo, gedehnten Vokalen und angefangenen, aber abgebrochenen Worten führen, weil man dem Wort der anderen Spielers Vorrang gegeben hat. Meist ist es so, dass jeweils einer der beiden zeitweilig die Wortführerschaft übernimmt. Wichtig ist, grundsätzlich langsam zu reden, um die Chance auf wortgleiches Reden zu ermöglichen. Manchmal ist die Fortsetzung des Satzes klar, dann kann man gemeinsam auch schneller den Satz vollenden. Wenn z.B. beide anfangen: "Der Fisch schwimmt...", dann ist eigentlich klar, dass sie gemeinsam "...im Wasser" sagen werden und dies - weil naheliegend - auch grundsätzlich tun sollten.

## Variante: Singen

Man kann auch parallel _singen_. Das geht, insbesondere mit Musiker\-Begleitung, sogar etwas leichter.', 'https://improwiki.com/de/wiki/improtheater/gleichzeitiges_reden', '2020-11-14 07:44:16.973', 70);
INSERT INTO public.part VALUES (71, 1, '2020-12-02 22:03:48.220563', '2020-12-02 22:03:48.220563', 'Dialog singen', 'In Zweierteams beginnt man einen Dialog über irgendetwas (Wetter, Alltag...) Nach kurzer Zeit setzt die Musik ein und man redet nicht miteinander, sondern singt das, was man sagen wollte. Man darf aber nicht den Fehler machen, zusammen zu singen, denn dann ist es kein Dialog mehr, sondern ein Duett.

Der Musiker wechselt mittendrin das Tempo und ungewollt ändert sich auch das Gefühl in der Szene, der Inhalt wird hektischer etc. zum Schluss hin wird der Musiker langsam und automatisch findet das Gespräch irgendwie ein Ende, ohne dass man unbedingt darauf hingesteuert hat.', 'https://improwiki.com/de/wiki/improtheater/dialog_singen', '2020-11-14 07:44:16.974', 71);
INSERT INTO public.part VALUES (72, 1, '2020-12-02 22:03:48.387302', '2020-12-02 22:03:48.387302', 'Das klingt nach einem Lied', 'Es wird eine beliebige Szene gespielt, mit oder ohne Vorgaben vom Publikum.

Fällt ein bedeutungsschwerer Satz, stoppt der Spielleiter die Szene, wiederholt den Satz und behauptet: "Das klingt nach einem Lied!". Nun muss das Thema in einem kurzen Lied durch den Darsteller besungen werden, welcher den Satz ausgesprochen hat. Der genannte Satz sollte wortwörtlich in dem Lied vorkommen.

Die anderen Darsteller können mitsingen, beispielsweise den Refrain, oder sie tanzen im Hintergrund mit. Die Szene dauert mindestens solange, bis jeder einmal ein Solo gesungen hat, am Ende kann es ein gemeinsames Abschlusslied geben.

_Beispiel_ mit der Gruppe Theaterlust http://de.youtube.com/watch?v=QAismTccDAY

_Variationen:_

*   Es werden vorab Musikgenres abgefragt, in denen jeweils gesungen werden soll. D.h. der Spielleiter bestimmt nicht nur den zu singenden Satz, sondern auch das jeweilige Musikgenre.
*   Es werden die Zuschauer (evtl. eine Sitzreihe oder alle) gebeten, an passender Stelle "Das klingt nach einem Lied!" zu rufen. Die Einbindung des Publikums kann aber dazu führen, dass in den nachfolgenden Szenen immer wieder die Aufforderung aus dem Publikum kommt. Daher empfielt es sich diese Variaton in der 2. Hälfte oder am Ende einer Show zu spielen.

_Siehe auch:_ Sing dein Gefühl', 'https://improwiki.com/de/wiki/improtheater/das_klingt_nach_einem_lied', '2020-11-14 07:44:17.005', 72);
INSERT INTO public.part VALUES (73, 1, '2020-12-02 22:03:48.531905', '2020-12-02 22:03:48.531905', 'Sing mit dem Ding', 'Zwei oder mehr Spieler improvisieren eine Szene. Ein Gegenstand liegt zu Anfang in der Mitte der Bühne. Der erste Spieler kann durch sein Spiel definieren, was dieser Gegenstand sein soll. Der Gegenstand spielt eine wichtige Rolle in der Szene.

Es gilt die Regel: sobald ein Spieler das "Ding" berührt, muss er singen.

Durch Berühren und Loslassen des "Dings" können die Spieler selbst steuern, wann und wieviel sie singen mögen.

', 'https://improwiki.com/de/wiki/improtheater/sing_mit_dem_ding', '2020-11-14 07:44:17.691', 73);
INSERT INTO public.part VALUES (74, 1, '2020-12-02 22:03:48.652206', '2020-12-02 22:03:48.652206', 'Stummfilm', 'Das Spiel Stummfilm zeichnet sich dadurch aus, dass - angelehnt an die Filme vom Anfang des vorigen Jahrhunderts - die Spieler agieren, ohne zu sprechen. Stattdessen machen sie theatralische, große, übertriebene Bewegungen und Handlungen. Es kann ein "Kino" der großen Emotionen sein. Ein tragisches oder ein Happy End(e) schließen den Stummfilm in der Regel ab.

Stummfilm funktioniert am besten mit Musikbegleitung.

Variante: Die Spieler können zwischendurch kurze Erklärungen in ein, zwei Worten einbauen, indem sie pantomimisch den eingeblendenten Text (wie im Stummfilm) mit den Armen als Plakat hochhalten und (obwohl es ein Stummfilm ist) kurz sprechen.

Dies sollte aber eher als Effekt genutzt werden, eigentlich sollte man die Szene auch so verstehen, denn wenn man von den Einblendungen abhängig ist, hat man den Gedanken "Das Publikum (oder die Mitspieler) verstehen nicht, was ich tue".', 'https://improwiki.com/de/wiki/improtheater/stummfilm', '2020-11-14 07:44:17.086', 74);
INSERT INTO public.part VALUES (75, 1, '2020-12-02 22:03:48.763047', '2020-12-02 22:03:48.763047', 'Rampensau-Singen', 'Alle Spieler stellen sich in eine Schlange. Der Erste tritt vor und singt ein beliebiges bekanntes Lied. Noch bevor ihm der Text ausgeht, stürmt der Nächste vor, schiebt ihn von der Bühne, behauptet, viel besser singen zu können und singt nun sein Lied. Der erste stellt sich in der Schlange wieder hinten an. usw.

siehe auch Gesangsassoziation, Serenade II', 'https://improwiki.com/de/wiki/improtheater/rampensau-singen', '2020-11-14 07:44:17.073', 75);
INSERT INTO public.part VALUES (76, 1, '2020-12-02 22:03:48.909654', '2020-12-02 22:03:48.909654', 'Gegensätzliches Doppelduo-Singen', 'Der Moderator lässt sich vom Publikum ein bestimmtes, umfassendes Themengebiet geben (z.B. "Schule"). Auf der Bühne stehen zwei Paare. Das eine Paar fängt an und besingt sehr positiv ein bestimmtes Thema aus dem anfangs erfragten umfassenden Themenkomplex. Das kann gemeinsames Singen im Duett sein, Wechselgesang usw., alle Möglichkeiten des Singens zu zweit sind erlaubt. Nach einer gewissen Zeit fängt das andere Duo an (das erste hört auf) und besingt das gleiche Thema unter negativen Aspekten. Auch hier sind wiederum alle Gesangsformen und auch Stile erlaubt. Dann fängt wieder das erste Duo an, das - positiv - einen weiteren Begriff aus dem anfangs bestimmten Themengebiet besingt. Usw.

_Beispiel:_ Das erste Duo schildert die positiven Aspekte des Lehrerberuf in den leuchtendsten Farben. Das zweite besingt die negativen Gesichtspunkte von Lehrern. In der zweiten Runde werden Schultafeln erst positiv, dann negativ gewürdigt. usw.

_Hinweise und Tipps:_

*   Das Spiel ist grundsätzlich nur sinnvoll mit musikalischer Begleitung.
*   Es ist eine kurze Form. Bei zu vielen besungenen Begriffen wird es schnell langweilig!', 'https://improwiki.com/de/wiki/improtheater/gegensaetzliches_doppelduo-singen', '2020-11-14 07:44:17.112', 76);
INSERT INTO public.part VALUES (77, 1, '2020-12-02 22:03:49.038495', '2020-12-02 22:03:49.038495', 'Singender Ratgeber', 'Ein Musikspiel. Ein Spieler spielt den Ratgeber oder auch Berater. Alle seine Kunden haben ein Problem (kann der Moderator z.B. vom Publikum erfragen) . Oft wird dieses Spiel mit 3 Kunden gespielt, die nacheinander in das Büro des Beraters kommen. Nach einer kurzen Begrüßung wird nun das Problem vom Kunden vorgesungen. Der Berater hört sich alles an und präsentiert selber wiederum eine Lösung für das Problem - ebenfalls gesungen.

*   Alle 3 Kunden sollten jeweils klar unterscheidbare Figuren sein
*   Die Songs können in unterschiedlichen Genres vorgetragen werden, zumindest aber auch hier, klar unterscheidbar voneinander.
*   Auch die Probleme sollten wenn möglich klar unterscheidbar sein', 'https://improwiki.com/de/wiki/improtheater/singender_ratgeber', '2020-11-14 07:44:17.167', 77);
INSERT INTO public.part VALUES (78, 1, '2020-12-02 22:03:49.183579', '2020-12-02 22:03:49.183579', 'Expertenspiel', '**Spieler:** 3, Experte, Expertenarme, Moderator

Der Experte wird zu Beginn des Spiels - von einem Zuschauer begleitet - aus dem Saal geschickt (oder er muss sich die Ohren zuhalten). Vom Publikum wird ein wissenschaftlicher Begriff oder eine Erfindung erfragt, die der Experte raten muss und die es nicht gibt. Auf der Bühne wird nun eine Expertenrunde gezeigt, welche aus einem Moderator und einem "armlosen" Experten besteht. Moderator und Expertenarme kennen den Begriff.

Der "Experten" wird hereingeholt. Alle drei nehmen auf Stühlen Platz. Hilfreich ist es, wenn der "Experte" auf einem Stuhl ohne Rückenlehne sitzt. Das erleichert dem hinter ihm sitzenden Spieler das ungehinderte Gestikulieren nach vorne.

Der Experte verschränkt seine Arme nach hinten, der Spieler "Expertenarme" steckt seine Arme nach vorne zwischen den Armen des Experten (oberhalb des Ellenbogens) und dessen Rumpf durch und verschwindet ansonsten möglichst unsichtbar hinter dem Vorderspieler. Der Vorderspieler spricht und der Hinterspieler macht die passenden Armbewegungen. Dabei kann er mit seinen Bewegungen Vorgaben für den Sprechenden machen und Hilfen geben. Der Moderator stellt den Experten vor und interviewt ihn. Ziel ist es, dass Moderator und Arme dem Experten dezente Hinweise auf den zu ratenden Begriff geben, damit dieser ihn am Ende errät.

## Hinweise und Tipps

*   Der Experte muss die Arme konsequent als seine "verkaufen", er darf nicht auf die Arme gucken, als gehörten sie nicht zu ihm, er muss immer klar machen, dass er genau weiß, wovon er spricht (auch wenn er in Wirklichkeit keine Ahnung hat). Er sollte konkrete Dinge behaupten. Gesichts- und Körperausdruck und Stimme des Experten müssen zu den Armbewegungen passen, d.h. größere und energischere Bewegungen der Arme müssen zu einem entsprechend expressiveren Ausdruck des Experten führen.
*   Die Armbewegungen sollten abwechslungsreich und ausdrucksstark sein, sie sollten nicht nur den zu beschreibenden Gegenstand darstellen, sondern auch die Emotionen des Experten ausdrücken.
*   Witzige Gimmicks sind Alltagsbewegungen, wie Kratzen, mit den Haaren spielen, in der Nase popeln, in die Tasche fassen etc., Trinken (Plastikbecher!).
*   Die "Kunst" des Moderators besteht darin, den Mittelweg zu finden zwischen deutlicher Hilfestellung und verbaler "Vernebelung". Insbesondere wenn die Szene droht, zu lang zu werden, können die Hinweise des Moderators etwas deutlicher werden.
*   Die Beteiligten können auch stehen.
*   Es ist insbesondere für die hintere Person, die die Arme spielt, sehr schweißtreibend. Sie sollte auch darauf achten, dass ihr Kopf möglichst überhaupt nicht zu sehen ist.

## Varianten

*   Auch Fragen aus dem Publikum sind möglich.

*   Der Experte kennt das Thema oder die Erfindung. In diesem Fall ist es kein Ratespiel mehr, sondern eine wissenschaftliche Runde, bei der der Experte den Zuschauern erklärt, worum es bei dem Thema/der Erfindung eigentlich geht.

*   Der Experte stammt aus einem fernen Land und ist unserer Sprache nicht mächtig und spricht nur Gromolo (Kauderwelsch). In diesem Fall gibt es einen Dolmetscher, der die Ausführungen des Experten übersetzt und gleichzeitig die Fragen des Moderators an den Experten.

*   Es handelt sich nicht um einen Experten, sondern um einen Angeklagten vor Gericht, der seine Tat schildern soll (**mögliche Vorgaben**: Tatort, Tatopfer, Tatwaffe und Tatmotiv). - Beispiel mit der Gruppe Impronauten http://de.youtube.com/watch?v=gFZPo\_uTh0o

*   Es handelt sich nicht um einen Experten, sondern um einen Verdächtigen bei einem Polizeiverhör, der seine Tat schildern soll (**mögliche Vorgaben**: Tatort, Tatopfer, Tatwaffe und Tatmotiv).

*   Es handelt sich nicht um einen Experten, sondern um einen Touristen der einem Boulevardjournalisten eine ganz heiße Story verkaufen will. Er hat nämlich am Flughafen einen Promi gesehen der was geschmuggelt hat. (**Vorgaben**: der Prominente, der Gegenstand den der Promi schmuggelt, Zielland der Schmuggelware.)', 'https://improwiki.com/de/wiki/improtheater/expertenspiel', '2020-11-14 07:44:17.343', 78);
INSERT INTO public.part VALUES (79, 1, '2020-12-02 22:03:49.328748', '2020-12-02 22:03:49.328748', 'Die Entschuldigung', 'Ein Impro-Spieler muss kurz vor die Tür. In der Zwischenzeit bestimmt das Publikum einen Grund, durch welchen der Rate-Spieler zu spät zur Arbeit gekommen ist. ( bspw. die Straßenbahn ist nicht weiter gefahren, weil der Straßenbahnfahrer bewusstlos geworden ist). Jeder kennt den Grund, der Chef, das Publikum – nur eben der zu spät gekommene nicht. Es ist nun Aufgabe des „Zuspät-Kommers“ zu erraten, aus welchem Grund er denn nun eigentlich zu spät gekommen ist. Dies muss der seinem Chef erklären, der ihm subtile Hinweise gibt und ihn damit in die richtige Richtung lenkt.

Beispiel: Der Zuspätkommende rät ins Blaue hinein: "Wissen Sie, meine Frau ist heute früh auf dem Honig ausgerutscht, den mein Sohn fallen gelassen hat, und hat sich den Arm gebrochen."  
Daraufhin lenkt der Chef ihn in die richtige Richtung, indem er ihm zu verstehen gibt, dass er damit völlig falsch liegt: "Ihre Frau hat sich doch letzte Woche erst das Bein gebrochen, also das glaube ich Ihnen jetzt ehrlich gesagt nicht."

Sieht man dem ratenden Spieler seine Ratlosigkeit an, können andere Spieler helfend eingreifen, indem sie als Mitarbeiter oder Sekretärin in den Laden oder ins Büro kommen, oder den Chef anrufen und kurze versteckte Hinweise geben.

Beispiel: (siehe oben)

Der ratende Spieler weiß noch nicht, dass er mit der Straßenbahn gefahren ist. Ein Mitarbeiter kommt herein und sagt, dass er heute fast beim Schwarzfahren erwischt worden wäre.

Variante: Bei der _Kündigung_ wird nicht der Grund für das Zuspätkommen zur Arbeit erraten, sondern der Kündigungsgrund.', 'https://improwiki.com/de/wiki/improtheater/die_entschuldigung', '2020-11-14 07:44:17.444', 79);
INSERT INTO public.part VALUES (80, 1, '2020-12-02 22:03:49.453716', '2020-12-02 22:03:49.453716', 'Aufklärung des Verbrechens', 'Es handelt sich um eine Kombination aus Boris und Expertenspiel.

Ähnlich wie bei Boris muss auch hier ein Verbrechen aufgeklärt werden, welches sich aus **Ort**, **Person** und **Mordwaffe** zusammensetzt. Diese drei Begriffe werden vom Publikum vorgegeben.

Ähnlich wie bei Expertenspiel werden die Arme des Angeklagten von einem anderen Spieler gespielt, welcher auch das Verbrechen kennt und mit seinen Armen Hinweise geben muss. Der Kommissar kennt das Verbrechen ebenso und gibt außerdem Hinweise.

**Videos Mörder-Hände-Ratespiel:**  

Mörder-Ratespiel: Eichhörnchen(Die Impronauten aus Basel) www.impronauten.ch  
Mörder-Ratespiel: Einkaufswagen im Kuhstall (Die Impronauten aus Basel) www.impronauten.ch', 'https://improwiki.com/de/wiki/improtheater/aufklaerung_des_verbrechens', '2020-11-14 07:44:17.574', 80);
INSERT INTO public.part VALUES (81, 1, '2020-12-02 22:03:49.58031', '2020-12-02 22:03:49.58031', 'Die Eheberatung', 'Ein Spiel für drei Spieler. Ein Spieler ist der Therapeut, die beiden anderen Spieler sind das zu therapierende Ehepaar. Der erste Ehepartner wird hinausgeschickt.

Das Publikum wählt ein Tier für den hinausgeschickten Ehepartner aus. Der erste Ehepartner kommt wieder rein und der zweite Ehepartner wird hinausgeschickt. Nun wählt das Publikum ein Tier für den zweiten Ehepartner aus.

Bei der Eheberatung müssen die beiden Ehepartner nun ihr eigenes Tier und dessen Charaktereigenschaften erraten. Da der Partner und der Therapeut das Tier kennen, können und sollen sie auch, versteckte Hinweise geben.

Das Ratespiel ist gelöst, wenn sich das Paar wieder versöhnt, indem man den Kosenamen (in Form des Tieres) sagt, welches der Ehepartner benutzt. z.B. mein Bienchen, mein Wüstenschiffchen...

**Variante:** Man kennt nicht das Tier des Anderen, sondern man weiß sein eigenes Tier. Man nimmt von Anfang an dessen Charaktereigenschaften an und hat die Aufgabe, das Tier des Partners zu erraten und einen passenden Kosenamen finden. Diese Variante ist eine spielerische Form der Übung Das innere Tier.

### Tipps und Hinweise

*   Bei der Variante liegt der Schwerpunkt mehr auf der Darstellung/den Ausdruck des dargestellten (eigenen) Charakters.
*   Es ist wichtig, bei der Darstellung des Tieres nicht zu offensichtlich zu sein.
*   Die Frage ist, ob die Tierfigur unbedingt erraten werden muss bzw. ob man, um eine überlange Laberszene zu vermeiden, irgendwann ein Tier (in Form des Kosenamens) ausspricht, auch wenn es falsch oder ungenau geraten wurde.
*   Es sollten keine speziellen Tierbezeichnungen zu raten sein, also z.B. nicht der bengalische Tiger oder die Wüstenspringmaus. Man sollte also als Vorgabe allgemein gängige Tier-(gattungs-)Oberbegriffe erfragen, z.B. nach typischen Tieren, die in einem Zoo vorkommen.
*   Die Figuren sind und bleiben Menschen, aber eben mit "tierischen" Eigenschaften und Verhaltensweisen. Wenn also z.B. die "Schnecke" auf dem Boden herumkriecht, dann sollte das aufgrund einer menschlichen Intention erfolgen, z.B., dass jemand seine Kontaktlinsen sucht.', 'https://improwiki.com/de/wiki/improtheater/die_eheberatung', '2020-11-14 07:44:17.338', 81);
INSERT INTO public.part VALUES (82, 1, '2020-12-02 22:03:49.724456', '2020-12-02 22:03:49.724456', 'Boris', 'Szene für 3 Darsteller.

Es gibt einen Kommisar, welcher ein Verbrechen aufklären muss. Es gibt einen Sekretär, welcher versteckte Hinweise gibt und einen Angeklagten, welcher ein Verbrechen gestehen muss, von dem er keinen blassen Schimmer hat, da er hinausgeschickt wird, wenn das Publikum nach der Art des Verbrechens gefragt wird.

Und es gibt Boris. Boris ist der gefürchtete Geist, welcher im Schrank steckt und mit dem der Kommisar dem Angeklagten droht, sollte dieser nicht gestehen. Boris ist unsichtbar, aber sehr schnell und kann verdammt gut quälen. Der Angeklagte kennt Boris nur vom Hören-Sagen, hat aber mächtig Angst vor ihm.

Der Kommisar muss nun durch geschicktes Ausfragen des Angeklagten diesen auf die richtige Spur lenken, damit dieser ein Geständnis ablegen kann.

Der Sekretär unterstützt den Kommisar, indem er ihm oder dem Angeklagten zustimmt und versteckte Hinweise gibt, welche das Verbrechen spezifizieren.

Hat der Angeklagte sein Verbrechen erraten, gesteht er und das Spiel ist aus.', 'https://improwiki.com/de/wiki/improtheater/boris', '2020-11-14 07:44:17.578', 82);
INSERT INTO public.part VALUES (83, 1, '2020-12-02 22:03:49.85409', '2020-12-02 22:03:49.85409', 'Reklamation', 'Ein Impro-Spieler muss kurz vor die Tür. In der Zwischenzeit bestimmt das Publikum einen Gegenstand, den derjenige nun reklamieren muss ( bspw. einen „Briefmarkenbefeuchtungsmaschinen-Schwamm“ ). Jeder kennt diesen Gegenstand, der Verkäufer, das Publikum – nur eben der Umtauschende nicht. Durch geschicktes Fragen ist es nun Aufgabe des „Umtauschers“ zu erraten, welchen Gegenstand er denn nun eigentlich umtauscht.

Sieht man dem ratenden Spieler seine Ratlosogkeit an, können andere Spieler helfend eingreifen, indem sie als Mitarbeiter oder Kunde in den Laden kommen und kurze versteckte Hinweise geben.

Beispiel: bei einem Optiker

Der ratende Spieler weiß noch nicht, dass er sich bei einem Optiker befindet. Ein Kunde tritt an den Verkäufer heran und fragt, wo es denn einen Spiegel zum Betrachten gibt.

', 'https://improwiki.com/de/wiki/improtheater/reklamation', '2020-11-14 07:44:17.674', 83);
INSERT INTO public.part VALUES (84, 1, '2020-12-02 22:03:49.98059', '2020-12-02 22:03:49.98059', 'Marionettenspiel', 'Auch bekannt als Puppets.

Zwei Darsteller stehen bewegungslos auf der Bühne und werden von zwei Leuten aus dem Publikum bewegt. Diese haben u.a. darauf zu achten, dass der Bewegungsradius des Kopfes eingeschränkt ist.

Ein kurzes Zupfen am Knie bedeutet, das Bein zu heben. Die Puppenspieler aus dem Publikum bewegen nun Kopf, Gliedmaßen und Körper der Darsteller.

Die Spieler spielen d.h. reden nun in der Szene, die fast völlig von den Bewegungen abhängt. Sie können aber auch versuchen, ihre Bewegungen zu steuern, in dem sie eindeutige Hinweise geben, die ihre Puppenspieler daraufhin umsetzen.

Zum Beispiel: "Wo ist der Kirchturm, ich kann ihn nicht sehen, ich sehe nur meine Füße".

Tipp: Es ist hilfreich, wenn der Moderator ganz am Anfang am Beispiel eines Spielers zeigt, wie sich die "Marionetten" bewegen lassen und er ausdrücklich darauf hinweist, dass die Marionettenführer nicht reden müssen. Beides erhöht der Bereitschaft, freiwillig auf die Bühne zu kommen!

', 'https://improwiki.com/de/spiele/puppets', '2020-11-14 07:44:18.434', 84);
INSERT INTO public.part VALUES (132, 1, '2020-12-02 22:03:58.961279', '2020-12-02 22:03:58.961279', 'Das Buch', 'Der Spielleiter fragt, ob jemand ein Buch (Prosa) dabei hat.

Einer der Spieler nimmt das Buch und darf nur zufällig ausgesuchte Sätze aus dem Buch vorlesen/sagen.

Die anderen Spieler ergänzen die Szene mit ihrem Handeln und Sprechen.', 'https://improwiki.com/de/wiki/improtheater/das_buch', '2020-11-14 07:44:19.54', 132);
INSERT INTO public.part VALUES (85, 1, '2020-12-02 22:03:50.115188', '2020-12-02 22:03:50.115188', 'Da Doo Ron Ron', 'Voraussetzung für diese Übung ist, dass man das Lied "Da Doo Ron Ron" von den Crystals kennt. (Hörprobe bei Amazon)

Die Spieler stehen im Kreis. Der erste Spieler singt den ersten Textteil, alle den Refrain "Da doo ron-ron-ron, da doo ron-ron". Der nächste Spieler singt den nächsten Textteil und alle wieder den Refrain usw. Bezogen auf den Originaltext wäre der Ablauf folgendermaßen:

**Spieler 1:** I met him on a Monday and my heart stood still

**Alle:** Da doo ron-ron-ron, da doo ron-ron

**Spieler 2:** Somebody told me that his name was Bill

**Alle:** Da doo ron-ron-ron, da doo ron-ron

**Alle:** Yeah!

**Spieler 3:** My heart stood still

**Alle:** Yeah!

**Spieler 4:** His name was Bill

**Spieler 5:** And when he walked me home

**Alle:** Da doo ron-ron-ron, da doo ron-ron

Nachdem sich die Melodie eingeprägt hat, singen die Einzelspieler improvisierte Texte, z. B.:

**Spieler 1:** Am Montag Abend ärgre ich mich nie.

**Alle:** Da doo ron-ron-ron, da doo ron-ron

**Spieler 2:** Ich freu mir lieber ein Loch ins Knie

**Alle:** Da doo ron-ron-ron, da doo ron-ron

**Alle:** Yeah!

**Spieler 3:** Ich bin so froh!

**Alle:** Yeah!

**Spieler 4:** Wie König Salomo.

**Spieler 5:** Ich fall'' auf den Po.

**Alle:** Da doo ron-ron-ron, da doo ron-ron

So geht es reihum weiter. In erster Linie geht es darum den Rhytmus der Melodie zu halten. Fällt einem Spieler grade kein Text ein, kann er auch Gromolo oder Lalala singen. Der Fluss der Melodie soll in jedem Fall gehalten werden.', 'https://improwiki.com/de/wiki/improtheater/da_doo_ron_ron', '2020-11-14 07:44:17.229', 85);
INSERT INTO public.part VALUES (86, 1, '2020-12-02 22:03:50.258263', '2020-12-02 22:03:50.258263', 'Der Prophet', 'Ein Spieler verlässt den Raum. Dieser wird später der **Prophet**, der die **Prophezeiung** erraten muss, die nun vom Publikum eingeholt wird. Es werden zwei Aussagen vom Publikum erfragt, die danach in eine Wenn-Dann-Beziehung gesetzt werden.

Beispiele:

*   Wenn es junge Hunde regnet, dann geht der Ofen aus.
*   Wenn alle satt sind, dann fällt der Strom aus.
*   Wenn Deutschland ein Tor schiesst, dann verliert der Weihnachtsmann seinen Bart.

Der **Prophet** wird dann wieder in den Raum gerufen und von seinen 2 bis 3 Jüngern begrüßt. Er prophezeit nun ins Blaue hinein. Die Jünger versuchen, durch ihre Reaktion den Propheten auf die richtige Prophezeiung zu bringen.', 'https://improwiki.com/de/wiki/improtheater/der_prophet', '2020-11-14 07:44:17.694', 86);
INSERT INTO public.part VALUES (87, 1, '2020-12-02 22:03:50.372521', '2020-12-02 22:03:50.372521', 'Arbeitsamt', 'Ein Spieler verläßt den Saal. Das Publikum wird gebeten einen außergewöhnlichen Beruf zu nennen. Der Spieler wird wieder hereingebeten, setzt sich hinter seinen Schreibtisch und ist nun Berater im Arbeitsamt. Arbeitssuchende kommen zu Ihm und wollen genau den zu eratenden Job haben, benennen diesen aber natürlich nicht.', 'https://improwiki.com/de/wiki/improtheater/arbeitsamt', '2020-11-14 07:44:17.765', 87);
INSERT INTO public.part VALUES (88, 1, '2020-12-02 22:03:50.489945', '2020-12-02 22:03:50.489945', 'Synchro Replay', 'Zunächst wird eine Grundszene von 2 bis 3 Spielern gespielt. Dieselbe Anzahl Spieler geht vor die Tür und sieht diese Szene nicht. Dann werden die Spieler hereingeholt. Jetzt wird Ihnen die Grundszene nochmal vorgespielt, aber ohne Ton. Die neuen Spieler synchronsieren diese Stummszene. So entsteht eine neue Geschichte, trotz gleicher Bewegungen.

Dieses Spiel kann auch in einem Match eingesetzt werden. Dann muß jedes Team die Grundszene einmal synchronisieren.', 'https://improwiki.com/de/spiele/synchro_replay', '2020-11-14 07:44:17.784', 88);
INSERT INTO public.part VALUES (89, 1, '2020-12-02 22:03:50.624997', '2020-12-02 22:03:50.624997', 'Cluedo', 'Ein Pantomime-Spiel für 4 Spieler.

Drei Spieler werden vor die Tür geschickt. Der Spielleiter erfragt beim Publikum einen Ort, einen Beruf und einen Gegenstand.

Dann wird der Erste hineingebeten. Der Spieler, welcher die drei Begriffe kennt, stellt diese nun der Reihe nach pantomimisch dar. Der erste Rate-Spieler macht die Handlungen mit, solange bis er den Ort erraten hat, dann gibt er dem Spieler die Hand und dieser stellt als Nächstes den Beruf dar, zuletzt dann den Gegenstand.  
Hat der erste Rate-Spieler auch den Gegenstand erraten, bringt er den Spieler damit um, welcher ihm den Gegenstand pantomimisch dargestellt hat.

Jetzt erfolgt die gleiche Vorgehensweise zwischen Spieler eins und Spieler zwei, welche hineingebeten wird.  
Am Ende stellt Spieler zwei Spieler drei die drei Begriffe pantomomisch dar, dieser benennt sie, sobald er sie erraten hat.

Zur Auflösung (falls ein Begriff falsch interpretiert wurde) sagen die beiden ersten ratenden Spieler, was sie gesehen haben.

Manchmal kommt es sogar vor, dass zwischendurch etwas anderes dargestelt wurde, am Ende aber trotzdem wieder das Richtige herauskommt.

**Variante**

Die Spieler können sich alle in einer Reihe aufstellen. Alle schauen dabei nach links. Der erste Spieler überlegt sich einen Bewegungsablauf, z.B. Zähneputzen. Der Spieler tippt seinem Nachbarn auf die Schulter. Der dreht sich um und sieht zu wie der erste Spieler den Bewegungsablauf vormacht. Wenn der zweite Spieler verstanden hat, was er nachmachen soll, tippt er dem dritten Spieler auf die Schulter, der dreht sich um und so weiter. So kann man das Spiel auch mit mehreren Spielern machen und es geht etwas flotter als in der initialen Beschreibung.

Das Spiel könnte man auch als pantomimische "Stille Post" bezeichnen.', 'https://improwiki.com/de/wiki/improtheater/cluedo', '2020-11-14 07:44:17.82', 89);
INSERT INTO public.part VALUES (90, 1, '2020-12-02 22:03:50.786735', '2020-12-02 22:03:50.786735', 'Frageszene', 'Bei dieser Übung findet der Dialog der Spieler nur in Frageform statt. Jeder Satz, der von den Spielern verwendet wird, muss in Form einer Frage formuliert werden. Das widerspricht zwar der Improtheaterregel, (möglichst) keine Fragen zu stellen, gleichwohl soll in dieser Übung mit Fragen eine Geschichte gebaut werden. Damit dies funktioniert, müssen die Fragen so aufgebaut sein, dass sie eine neue Information in die Geschichte einbringen. Am besten sollte die Frage bereits bestehende Informationen erweitern. Wichtig ist auch, dass die Spieler bei ihren Fragen alle zuvor gegebenen Informationen akzeptieren und darauf achten müssen, dass keine Widersprüche entstehen.

Beispiel:

A: Liebling, wollen wir heute ins Kino gehen?

B: Gibt es denn in Westerland überhaupt noch ein Kino?

A: Sieglinde, soll ich mal unten am Empfang anrufen und mich nach einem Kino und nach dem Kinoprogramm erkundigen?

B: Bist Du so nett, Heinrich?

A: Aber meinst Du, dass Du trotz Deines Rheumas in der Lage wärst, einige Meter zum Kino zu laufen?

usw.

Diese Übung kann man gut als "Die"-Szene spielen. Macht ein Spieler einen Fehler und stellt keine Frage, dann ruft das Publikum "Stirb!" und der Spieler wird durch einen neuen Spieler ersetzt.

Die Spieler sollten nicht zu sehr darauf achten, keine Fehler zu machen. Es macht mehr Spaß, etwas mit dem Tempo zu spielen, das Risiko zu erhöhen und dann unter Umständen wegen eines Fehlers ausgetauscht zu werden. Nichts ist langweiliger. als jemand der auf gar keinen Fall Fehler machen möchte.', 'https://improwiki.com/de/wiki/improtheater/frageszene', '2020-11-14 07:44:18.026', 90);
INSERT INTO public.part VALUES (91, 1, '2020-12-02 22:03:50.932126', '2020-12-02 22:03:50.932126', 'Du auch hier?', 'Ein Schizo-Ratespiel als Übung, die aber auch auf der Bühne funktioniert: Zwei Spieler verlassen den Raum. Das Publikum wird nun nach Vorgaben für Orte und Beziehungen gefragt. Jeder Spieler bekommt einen Ort (von dem der jeweils andere Spieler nichts weiß) und beide gemeinsam eine Beziehung (welche beiden genannt wird). Die Spieler dürfen ihren eigenen Ort nicht verraten, aber während der Szene immer wieder Hinweise einstreuen. Der Ort muss gegenseitig erraten werden, die Spieler verlassen ihre Rolle so lange nicht, bis beide Orte genannt wurden. Damit ist die Szene sofort beendet.', 'https://improwiki.com/de/wiki/improtheater/du_auch_hier', '2020-11-14 07:44:17.869', 91);
INSERT INTO public.part VALUES (92, 1, '2020-12-02 22:03:51.071996', '2020-12-02 22:03:51.071996', 'Dr. Allwissend', '**Dr. Allwissend ist ein wahnsinnig intelligenter Mann der in einem Interview zu einem speziellen Thema befragt wird und von drei Spielern gleichzeitig gespielt wird.**

## Inhaltsverzeichnis

*   Regeln
*   Vorgaben
*   Tipps
*   siehe auch

## Regeln

Dr. Allwissend wird von drei Spielern (alternativ auch nur zwei) gespielt die nebeneinander sitzen und nur **Wort für Wort** reden dürfen. Also es wird jeder Spieler nur ein Wort sagen und zwar in der Reihenfolge **Eins-Zwei-Drei-Eins-usw.** Ein weiterer Spieler spielt den Interviewer der Dr. Allwissend befragt/interviewt.

## Vorgaben

Da es sich um einen allwissenden Doktor handelt, kann man hier wunderbar absurde Dinge abfragen. Zum Beispiel ein Tier erfragen und dann nach einer Tätigkeit die zu diesem Tier gar nicht passt. ("surfende Eisbären")

## Tipps

*   Der Interviewer sollte aufmerksam sein, wenn sich die drei Spieler des "Dr. Allwissend" mal verhaspeln und nachhaken. ("Ach ja, das müssen sie mir mal genauer erklären.") Und wenn man es nicht komplett albern machen will, kann der Interviewer mit Suggestivfragen dem Dr. Allwissend die Antwort leichter machen.

*   Man kann hier natürlich am Ende des Interviews auch mal Fragen zum Thema direkt vom Publikum einholen und das Publikum damit noch mehr einbinden.

', 'https://improwiki.com/de/wiki/improtheater/dr_allwissend', '2020-11-14 07:44:18.082', 92);
INSERT INTO public.part VALUES (93, 1, '2020-12-02 22:03:51.221625', '2020-12-02 22:03:51.221625', 'Briefwechsel', 'Das Format dauert 7-15 Minuten. Variante kann über eine ganze Hälfte gespielt werden.

Das Publikum bestimmt, welchen zwei Personen bei einem Briefwechsel gefolgt wird (männl., weibl., etc.).

Zwei (entsprechende) Spieler setzen sich dann in die Mitte der Bühne auf zwei dem Publikum zugewandte bereitgestellte Stühle.

Die restlichen Spieler können sich hinter den Spielern sichtbar hinten an der Wand platzieren (oder bleiben im Off).  
Nun werden die beiden Personen kreiert (Name, Alter, Beruf). Eine Beziehung zwischen den Figuren wird nicht eingeholt und somit den Spielern selbst überlassen.

Einer der beiden fängt an, seinen Brief, den er abschicken wird, laut zu formulieren, während er ins Publikum spricht. Sobald dieser fertig ist, antwortet der andere und so weiter.

Kurze Gesprächspausen nutzend können die anderen Spieler an die Seite eines der Spieler herantreten und einen "Brief von außen" einbringen, um die Figur und seine derzeitige Lage runder zu gestalten, Geheimnisse damit einzubringen, die nicht weiter thematisiert werden. Ein Spieler tritt an die Seite eines der Briefeschreiber, legt ihm als Zeichen die Hand auf die Schulter und beginnt nach der, zwischen den Lesenden entstandenen Pause seinen "Brief von außen" einzubringen (vom Vermieter, der Mutter, Arbeitgeber etc.).

Das Ende wird jedesmal selbst gefunden, durch abruptes Enden eines Schreibers, ein angekündigtes Treffen etc.

VARIANTE: Nach dem Briefwechsel werden die Stühle weggeräumt und die Geschichte wird dort ansetzend weitergespielt, ebenso können Rückblicke gespielt werden...

Am Ende werden die zwei Stühle wieder in der Mitte der Bühne platziert und es gibt einen kurzen abschließenden Briefwechsel (Zeitsprünge können selbst bestimmt oder vom Publikum eingeholt werden).', 'https://improwiki.com/de/wiki/improtheater/briefwechsel', '2020-11-14 07:44:18.07', 93);
INSERT INTO public.part VALUES (94, 1, '2020-12-02 22:03:51.328387', '2020-12-02 22:03:51.328387', 'Interview rückwärts', 'Dieses Spiel besteht aus einem fiktiven Interview. Das Besondere ist, dass es mit dem letzten Satz anfängt und mit dem ersten Satz endet, die Dialogabfolge also rückwärts verläuft. Bestehen Antwort oder Frage aus mehreren Sätzen, sind diese allerdings in der richtigen Reihenfolge.

D.h. die Antwort kommt immer vor der Frage. Der Interviewer muss sich die zur Antwort passende Frage ausdenken. Der Interviewte hat das Spiel in der Hand, und kann den Interviewer in die Scheiße reiten, z.B. mit kurzen Antworten wie: "Ja!", "Nö".

Der Interviewer kann den Spieß aber umdrehen, indem er zu Beginn seiner Frage auf die _vorherige_ Antwort Bezug nimmt, z.B. "Das ist aber schön, dass Sie das in Gedichtform vortragen. Zur nächsten Frage: ..." oder "Danke für das nette Lied. Meine nächste Frage ..." Dann muss der Interviewte diese Handlung in die nächste Antwort einbauen.

Beispiel:

B: "Das war Herr Müller, Regisseur des Films "Rolle rückwärts."  
A: "Auf Wiederseh''n!"  
B: "Herr Müller, vielen Dank für das Gespräch."  
A: "Der Film kommt am Donnerstag in die Kinos."  
B: "Wann läuft der Film an?"  
(...)  
A: "Gesundheit!"  
B: "Hatschi!!!"  
(...)  
A: "Ich freue mich auch, hier zu sein.  
B: "Guten Abend meine Damen und Herren. Ich freue mich, heute mit Otto Müller, Regisseur des Films ''Rolle rückwärts'' sprechen zu können."

Gute Vorgaben sind: - ein Beruf - ein Thema ein Gegenstand', 'https://improwiki.com/de/wiki/improtheater/interview_rueckwaerts', '2020-11-14 07:44:18.193', 94);
INSERT INTO public.part VALUES (95, 1, '2020-12-02 22:03:51.458757', '2020-12-02 22:03:51.458757', 'Wort für Wort cross', 'Vier Personen sitzen paarweise gegenüber und bilden somit ein Kreuz. Sie sitzen so nah beieinander, dass sich die Knie jeweils berühren. Jeder Teilnehmer konzentriert sich auf seinen gegenübersitzenden Partner. Beide Paare beginnen nun zeitgleich Wort für Wort eine Geschichte zu erzählen. Die übrig gebliebenen Teilnehmer gehen langsam im Kreis um die zwei Paare und hören sich diesen Mix an. Es wird sich anhören, als ob man im Radio nach einem Sender sucht, aber keinen findet. Nach 2-3 Minuten beendet man die Übung. Erstaunlicherweise fühlen sich die beiden Paare in keinster Weise durch das jeweilige Paar "gestört". Je konzentrierter man bei seinem Partner bleibt, desto weniger stört das andere Paar. Fazit: eine tolle Übung für Konzentration und Aufmerksamkeit. Und die anderen Teilnehmer haben einen großen Spaß, alleine durch das Zuhören.', 'https://improwiki.com/de/wiki/improtheater/wort_fuer_wort_cross', '2020-11-14 07:44:18.147', 95);
INSERT INTO public.part VALUES (96, 1, '2020-12-02 22:03:51.662546', '2020-12-02 22:03:51.662546', 'Worlds Worst (Der schlechteste...der Welt)', 'Ein Spiel für schnelle Gags und kurze Lacher.

Der Moderator fragt das Publikum z.B.

*   nach einem Beruf (Polizist)
*   einem Hobby (Fussballspieler)
*   einer bestimmten Person (Queen of England)
*   einer Rolle (Ehemann)
*   einer bestimmten Aktion (Werbespot für Bier)
*   oder nach einer Situation (Heiratsantrag).

Die Spieler stellen sich dazu in einer Linie nebeneinander auf. Die Spieler müssen nun schnell hintereinander einen Gag dazu bringen und zwar am besten immer den schlechtmöglichsten Fall darstellen. Wenn es also z.B. heisst "Der schlechteste Pilot der Welt", dann könnten sie kurz einen angetrunkenen Piloten mimen oder einen Piloten der Flugangst hat, oder ähnliches.

Die Spieler können für den Gag einzeln nach vorne treten oder auch zusammen. Nach jedem Gag macht der Moderator oder das Publikum ein "Mööp". Danach folgt der nächste Gag. Wenn alle Gags zu einer Vorgabe erschöpft zu sein scheinen, dann die nächste Vorgabe spielen.

Sofort auf den ersten Impuls hören. Muss nicht immer der größte Brüller sein.

Eignet sich nicht nur als Übung um Schnelligkeit zu trainieren, sondern auch als Aufwärmspiel zu Anfang einer Show.

Ein sehr ähnliches Spiel ist: Blitzrunde

', 'https://improwiki.com/de/wiki/improtheater/worlds_worst_der_schlechteste_der_welt', '2020-11-14 07:44:18.312', 96);
INSERT INTO public.part VALUES (134, 1, '2020-12-02 22:03:59.436339', '2020-12-02 22:03:59.436339', 'RECLAM-Spiel', 'Die Zuschauer dürfen aus einer Auswahl von gelben RECLAM-Heften eines auswählen. Auf der Bühne spielt ein Spieler eine Figur aus diesem RECLAM-Heft (z.B. Mephisto in "Faust"). Seine Aufgabe besteht einzig und allein darin die Textstellen seiner Figur vorzulesen. Dazwischen ergänzt einer oder ergänzen mehrere Spieler die Szene mit ihrem Gedankengut. Es wird unmittelbar auf das zuvor Vorgelesene reagiert, das natürlich zum Teil sinnlos oder unverständlich ist und überhaupt nicht zur Szene passt. Insoweit besteht eine gewisse Ähnlichkeit zum Zettelspiel.', 'https://improwiki.com/de/wiki/improtheater/reclam-spiel', '2020-11-14 07:44:19.679', 134);
INSERT INTO public.part VALUES (97, 1, '2020-12-02 22:03:51.817691', '2020-12-02 22:03:51.817691', 'Orakel', 'Alle Spieler stellen sich zusammen in ein oder zwei Reihen auf, je nach Anzahl, bei zwei Reihen sollten die Größeren hinten stehen.

Alle schunkeln langsam von einem Bein auf das andere, damit sich ein gemeinschaftliches Gefühl ergibt. Die Antworten können dann auch im Takt der Schwingung gegeben werden, das vereinfacht die Anpassung der Sprechgeschwindigkeit.

Nun wird das Publikum gebeten, Fragen zu stellen, die sie schon immer mal beantwortet haben wollten.

Das Orakel beantwortet nun diese Fragen mit einer Stimme. Ist eine Antwort zu undeutlich gewesen, kann sie vom Spielleiter noch einmal gefordert werden.

Dieses Spiel eignet sich gut als Zugabe.', 'https://improwiki.com/de/wiki/improtheater/orakel', '2020-11-14 07:44:18.287', 97);
INSERT INTO public.part VALUES (98, 1, '2020-12-02 22:03:51.946806', '2020-12-02 22:03:51.946806', 'Nachrichten', 'In der Pause schreiben die Zuschauer auf Zettel einfache Sätze die nicht zwingend logisch sein müssen. **Nach der Pause setzen sich zwei Spieler auf die Bühne und spielen ein Nachrichtensprecherduo. In dieser Nachrichtensendung müssen natürlich die Zettel eingebaut werden.**

## Inhaltsverzeichnis

*   Hinweise
*   Vorgaben
*   Varianten
*   siehe auch

## Hinweise

*   Ideal nach der Pause bei einer längeren Show. Kann aber auch gefährlich sein. Da dieses Spiel etwas das Tempo rausnehmen kann.
*   Die Sprecher sollten bevor sie einen Zettel vorlesen etwas Einleitendes sagen wie: "Kommen wir jetzt zum Ausland. Timbuktu..."
*   Nach dem Vorlesen natürlich versuchen den geschriebenen Text einen Sinn geben. In einen Kontext setzen.

## Vorgaben

*   Es ist nützlich dem Publikum Beispielsätze zu nennen bevor die Zettel ausgegeben werden. Damit man nicht nur profane Sätze oder nur total alberne Sätze auf den Zetteln findet.
*   Schreiben sie auf was sie heute gemacht haben. Z.B.: "Ich hatte eine Autopanne."
*   Schreiben sie auf was sie heute in der Zeitung gelesen haben. Z.B.: "Dax bricht ein."
*   Schreiben sie etwas Unsinniges auf. Z.B.: "Wenn Schweine um die Ecke fliegen, werden alle Omas im Lotto gewinnen."

## Varianten

*   Es können punktuell weitere Spieler eingebaut werden. Studiogast, eine Live-Schaltung zu einem Auslandskorrespondenten, Kommentar wie in der Tagesschau, Wetterfee etc.

', 'https://improwiki.com/de/wiki/improtheater/nachrichten', '2020-11-14 07:44:18.33', 98);
INSERT INTO public.part VALUES (99, 1, '2020-12-02 22:03:52.085226', '2020-12-02 22:03:52.085226', 'Radio Mix', 'Die Spieler stehen in einer Reihe mit der Front zu den Zuschauern. Jedem Spieler wird ein Radiosender zugeordnet. In zufälliger Reihenfolge wechseln nun die Sender (Spieler) und das Publikum hört einen Ausschnitt des jeweiligen Programms. Musikalische Unterstützung ist hier sehr wichtig.', 'https://improwiki.com/de/wiki/improtheater/radio_mix', '2020-11-14 07:44:18.164', 99);
INSERT INTO public.part VALUES (100, 1, '2020-12-02 22:03:52.217623', '2020-12-02 22:03:52.217623', 'Hörspiel', 'Die Szene führt zurück in die Zeiten des guten alten Dampfradios. Das Licht ist aus und die Augen geschlossen. Wichtig hierbei ist die Geschichte, die Stimmen und die Sound Effekte. Es sollten am besten Dinge beschrieben werden, die sich ansonsten auf der Bühne nicht spielen lassen. Ein schöner (Stereo-) Effekt lässt sich erzielen, wenn die Spieler sich an entgegengesetzten Enden der Bühne befinden.', 'https://improwiki.com/de/wiki/improtheater/hoerspiel', '2020-11-14 07:44:18.367', 100);
INSERT INTO public.part VALUES (101, 1, '2020-12-02 22:03:52.345363', '2020-12-02 22:03:52.345363', 'Drei Telefonate', 'Drei Spieler stellen sich in einer Reihe auf. Sie lassen sich vom Publikum drei möglichst unterschiedliche Themen geben. In der ersten, der Startrunde, fängt der Erste mit entsprechender Gestik/Körperhaltung an, mit einer fiktiven Person zu telefonieren. Nach einigen Sätzen, die in das Thema einführen und den fiktiven Gesprächspartner "vorstellen", beginnt der zweite Spieler mit passender Gestik/Körperhaltung sein Telefongespräch, nach einigen Sätzen der dritte Spieler. Nachdem nun die drei Spieler ihr Telefongespräch "vorgestellt" haben, macht der dritte Spieler eine kurze Redepause. Das kann (muss aber nicht) einer der anderen beiden Spieler zum Anlass nehmen, mit eben diesem Wort sein Telefongespräch fortzusetzen. Reagieren die anderen zwei Spieler nicht, telefoniert der bisherigen Spieler weiter. Hauptaufgabe nach der Startrunde ist jedenfalls, immer das letzte Wort des anderen Spielers als erstes Wort des sich fortsetzenden eigenen Telefongesprächs zu benutzen. Die Reihenfolge der Wechsel ist beliebig. Sehr kurze Pausen im Redefluss deuten anderen Spielern an, dass sie nun einhaken können.

## Tipps und Hinweise

*   In der ersten Runde gilt die Regel "letztes Wort übernehmen" noch nicht!
*   Die jeweiligen Wechsel dürfen nicht zu lange dauern, sonst wird es langweilig.
*   Der jeweilige Spieler sollte sich die Sätze seines fiktiven Gesprächspartners vorstellen, während er - selbst schweigend - diesem "zuhört". Das macht das Telefongespräch plausibler bzw. authentischer.
*   Die zum Wechsel einladenden Pausen können ggf. auch die Pausen sein, die wegen des beginnenden fiktiven Redens des Telefonpartners im Rahmen des Dialogs entstehen.', 'https://improwiki.com/de/wiki/improtheater/drei_telefonate', '2020-11-14 07:44:18.415', 101);
INSERT INTO public.part VALUES (102, 1, '2020-12-02 22:03:52.497611', '2020-12-02 22:03:52.497611', 'Stegreifrede', 'Dies ist eine Übung, die oft in diversen Rednerclubs zum Einsatz kommt.

Vor dem Spiel werden diverse Begriffe aus allen möglichen Bereichen auf kleine Zettel geschrieben, zum Beispiel "Katzen", "der Spaß am Tanzen", "Weihnachten", "Wenn du ein Tier wärst, dann wärst du ein..", "Dein Lieblingsurlaubsland", "Angst vor Horrorfilmen" usw. usf. Der Kreativität der Vorgaben auf den Zetteln sind hier kaum Grenzen gesetzt.

Ein Spieler zieht nun einen Zettel und hält nun ausgehend von dem Begriff eine kurze Rede. Auf keinen Fall zu lange, aber mindestens 1-2 Minuten (Spielleiter legt Grenze fest). Wenn er innerhalb der 2 Minuten zu lange zögert und nicht weitererzählt oder ihm gar nichts einfällt, muss er von vorne anfangen und erneut einen Zettel ziehen.

Einigen Spielern hilft es, wenn sie nicht aus der Ich-Perspektive erzählen, sondern dafür vorher in eine imaginäre Figur schlüpfen und dann dazu über das Thema referieren.

Um zum Thema zu reden, gibt es verschiedene Strategien. Man sollte das Erste nehmen, was man damit assoziiert. Wenn einem dazu garnichts einfällt, kann man einfach auch über das etwas ähnliches reden, was man damit in Verbindung bringt (Zum Beispiel: "Ich mag ja keine Horrofilme, aber den letzten Film, den ich im Kino gesehen habe, war James Bond und da..."). Am authentischsten ist es, wenn man zu dem Begriff (zum Beispiel: Hund) eine kleine Anekdote aus seinem Leben erzählen kann. Man kann aber auch einfach Thesen aufstellen und Pro und Kontra Argumente dazu aufzählen ("Ich bin gegen Hunde in der Stadt, da sie zuviel Dreck machen und zu laut bellen usw."). Oder man schweift ab und erzählt davon, dass der Hund der beste Freund des Menschen ist und redet über Freundschaften. Oder man erzählt Hundewitze, oder oder oder....

Ziel ist es die Fähigkeit zu üben zu jeder Vorgabe etwas sagen zu können und im Moment zu sein und auf den Punkt im Moment Geschichten erzählen zu können.

Diese Übung kann in der Probe auch als Wettkampf gespielt werden. Man bildet zum Beispiel zwei Gruppen und aus jeder Gruppe wird immer ein neuer Spieler vorgeschickt, der die Rede hält. Scheitert ein Spieler bei der vorgegebenen Redezeit, so gibt es Punktabzug für die Gruppe oder sie muss einen Spieler an die andere Gruppe abgeben, den sich die andere Gruppe aussuchen darf.', 'https://improwiki.com/de/wiki/improtheater/stegreifrede', '2020-11-14 07:44:18.496', 102);
INSERT INTO public.part VALUES (103, 1, '2020-12-02 22:03:52.630375', '2020-12-02 22:03:52.630375', 'Blitzrunde', 'Ein Spiel für schnelle Gags. Der Moderator fragt das Publikum nach einem Ort oder einer Situation. Die Spieler müssen nun schnell hintereinander einen Gag dazu bringen. Meistens mit Sätzen oder Sachen, die man an diesem Ort oder in dieser Situation auf keinen Fall sagen bzw. machen sollte. Sofort auf den ersten Impuls hören. Muss nicht immer der größte Brüller sein.

Eingnet sich super als Aufwärmspiel zu Anfang einer Show.

', 'https://improwiki.com/de/wiki/improtheater/blitzrunde', '2020-11-14 07:44:18.418', 103);
INSERT INTO public.part VALUES (135, 1, '2020-12-02 22:03:59.575989', '2020-12-02 22:03:59.575989', 'Horoskop', 'Der Moderator fragt nach einem Sternzeichen und liest dann aus einer Zeitschrift die aktuelle Horoskopvorhersage vor. Die Spieler spielen dann eine Szene, in denen alle Horoskop-Vorhersagen eintreffen und den Ratschlägen aus dem Horoskop gefolgt wird, so unsinnig sie im Kontext der Szene auch sein mögen.', 'https://improwiki.com/de/wiki/improtheater/horoskop', '2020-11-14 07:44:19.663', 135);
INSERT INTO public.part VALUES (104, 1, '2020-12-02 22:03:52.765768', '2020-12-02 22:03:52.765768', 'Das Gewissen', 'Zwei Spieler beginnen eine normale Szene. Immer wenn es im weiteren Szenenverlauf passt, sprechen zwei weitere Spieler nun das Gewissen der jeweiligen Spieler. Diese können im Off stehen und ein Mikrofon benutzen. Besser ist es aber, wenn sie direkt hinter demjenigen Spieler stehen, dessen Gewissen sie sind. Das Gewissen spricht in direkter Rede zu dem Spieler, kommentiert und macht ihm Vorschriften oder äußert Zweifel. Der Spieler kann, muss aber nicht mit seinem Gewissen in Dialog treten.

Interessant wird es, wenn das Gewissen im Gegensatz zu den Handlungen bzw. Äußerungen des Spielers steht. So kann z.B.ein Pärchen seinen zehnten Hochzeitstag feiern, beide machen sich Komplimente und freuen sich über die glückliche Beziehung. Das Gewissen der Spieler offenbart jedoch ganz andere Gedanken. Vielleicht denkt sie gerade an die Erledigungen, die sie noch am nächsten Tag machen muss, oder er denkt an seine Geliebte.

### Variationen

*   Jeder Gewissensspieler spielt das Gewissen von jeweils einem Spieler
*   Beide Gewissensspieler spielen beide das Gewissen _eines_ Spieler (einer ist das gute, der andere das böse Gewissen, sozusagen Engelchen und Teufelchen)', 'https://improwiki.com/de/wiki/improtheater/das_gewissen', '2020-11-14 07:44:18.545', 104);
INSERT INTO public.part VALUES (105, 1, '2020-12-02 22:03:52.897506', '2020-12-02 22:03:52.897506', 'Ein-Wort-Geschichte', 'Ein-Wort-Geschichten gibt es in mehreren Formen:

## Alle in einer Reihe

4 oder 5 Spieler stellen sich in einer Reihe auf. Das Publikum gibt den Titel der Geschichte vor und nun erzählen die Spieler eine Geschichte, wobei jeder immer nur ein Wort sagt. Die Erzählung folgt in der Reihenfolge, in der die Spieler stehen.

## Zwei Spieler

Hier gibt es zwei Formen:

*   Alle sind beteiligt, aber jeweils zwei sind aktiv auf der Bühne. Die Beiden lassen sich vom Publikum einen Begriff geben. Inspiriert von dem Begriff erzählen sie abwechselnd eine Geschichte, wobei jeder immer nur ein Wort sagt. Wenn einer zu lange zögert, Verlegenheitsäußerungen wie "äh" von sich gibt oder die Geschichte unlogisch, absurd oder blöd ist, dann dürfen die Zuschauer "möp" sagen. Derjenige Spieler, der das "möp" ausgelöst hat, tritt an die Seite bzw. geht von der Bühne und wird durch einen anderen Spieler abgelöst. Die beiden Spieler auf der Bühne lassen sich einen neuen Begriff geben und erzählen eine neue Geschichte, bis auch diese durch eine "Möp" beendet wird... usw. Das setzt sich beliebig lange fort.

*   Die beiden stellen sich Schulter an Schulter und "verschmelzen zu einer Person". Dann erzählen sie eine Geschichte (in der Gegenwartsform), wobei jeder immer nur ein Wort sagt. Die Bewegungen dazu führen beide Spieler synchron aus.

Tipp: Hilfreich ist, wenn jedes Wort von einer Handlung (Veränderung der Pose) begleitet wird (wie bei der Übung Ja genau, und dann...). Weiterhin bringt es viel, wenn die Worte etwas gedehnt und mit viel stimmlicher Variation gesprochen werden ("Ich! ... neeeehme ... den ... kleiiiiinen ... Hammerrrr! ... uuund ...")', 'https://improwiki.com/de/wiki/improtheater/ein-wort-geschichte', '2020-11-14 07:44:18.577', 105);
INSERT INTO public.part VALUES (106, 1, '2020-12-02 22:03:53.033585', '2020-12-02 22:03:53.033585', 'Rückwärtsgehen', 'Das _Walking backwards into the future_ ist eine Übung, kann aber auch als Auftrittsspiel genutzt werden.

Ein Spieler steht vorne an der Bühne. Sechs beliebige Gegenstände, die er vorher nicht gesehen hat, werden in einer Reihe hinter den Spieler gelegt. Nun fängt der Spieler an eine Geschichte zu erzählen. Dabei geht er langsam rückwärts. Stößt er auf einen Gegenstand, hebt er diesen auf und versucht ihn in die Geschichte einzubauen. Die Geschichte sollte einen Anfang und ein Ende haben und wenn möglich auch den für eine Geschichte typischen Spannungsbogen aufweisen. Es geht also nicht darum die Namen der eingebauten Gegenstände zu nennen, sondern in erster Linie eine Geschichte zu erzählen.

Bei einem Auftritt lässt man sich die sechs Gegenstände vom Publikum geben.

', 'https://improwiki.com/de/wiki/improtheater/rueckwaertsgehen', '2020-11-14 07:44:18.623', 106);
INSERT INTO public.part VALUES (107, 1, '2020-12-02 22:03:53.166238', '2020-12-02 22:03:53.166238', 'Fortlaufende Geschichte ("Die")', 'Die Spieler stellen sich in eine Reihe auf. Der Spielleiter (Moderator oder jemand aus dem Publikum) signalisiert (schnippst/klatscht) Spieler an, die daraufhin unverzüglich anfangen, eine Geschichte zum abgefragten Titel zu erzählen. Sobald der Spielleiter das Signal einem anderen Spieler zuwirft, redet dieser OHNE UNTERBRECHUNG weiter. Es darf kein "äh", "öh" oder sonstige Pause entstehen, auch nicht, wenn mitten im Wort unterbrochen wurde. Der nächste Spieler führt das Wort ab der Stelle zu Ende, er wiederholt es nicht.

Variante für 2 Teams: Bei Fehlern fliegt der jeweilige Spieler raus. Ist von einer Mannschaft niemand mehr "im Rennen", hat sie verloren.

Kombinierbar mit "Bestrafung" für die Rausgeflogenen. z.B. Theatertod (kurze Sterbe-Pantomime mit gegebenem Gegenstand aus dem Publikum) - Der Clou: die Geschichte geht danach nahtlos weiter, auch wenn mitten im Wort unterbrochen wurde!

', 'https://improwiki.com/de/wiki/improtheater/fortlaufende_geschichte_die', '2020-11-14 07:44:18.639', 107);
INSERT INTO public.part VALUES (108, 1, '2020-12-02 22:03:53.305372', '2020-12-02 22:03:53.305372', 'Fortlaufende Geschichte (Genres)', 'Die Spieler stellen sich in eine Reihe auf. Sie oder der Moderator fragen den Titel eines Buches ab, das es noch nicht gibt. Außerdem fragt jeder ein bestimmtes Buchgenre ab (z.B. Bibel, Kriminalroman, Gedichteband, Horror, Kochbuch). Sie erzählen nun fortlaufend eine Geschichte. Wenn Sie dran sind, setzen sie die Geschichte in dem typischen Stil und Inhalt ihres abgefragten Buchgenres fort.

', 'https://improwiki.com/de/wiki/improtheater/fortlaufende_geschichte_genres', '2020-11-14 07:44:18.638', 108);
INSERT INTO public.part VALUES (109, 1, '2020-12-02 22:03:53.413362', '2020-12-02 22:03:53.413362', 'Drei Tote', 'Drei (oder vier) Spieler stellen sich in einer Reihe auf die Bühne und für jeden wird vom Publikum eine Todesart abgefragt. Die Spieler stellen nun die Toten dar, die erzählen, wie es zu ihrem Tod gekommen ist. Ziel ist, dass alle zur gleichen Zeit am gleichen Ort sterben. Alle Spieler drehen sich jetzt um und stehen mit dem Rücken zum Publikum. Der Erste dreht sich um und stellt seine Figur kurz vor. Dann dreht er sich wieder um und der nächste stellt sich vor bis alle einmal durch sind. In dieser ersten Runde soll einfach nur der Charakter der Figur definiert werden. Die Figuren können miteinander verwandt sein, sie können aber auch völlig unabhängig voneinander sein. In der zweiten Runde wird der Ort eingeführt, es drehen sich wieder alle nacheinander um und erzählen. Der erste Spieler führt mit seiner Erzählung den Ort ein, die anderen übernehmen den Ort. Im besten Falle sind am Ende der Runde alle an einem Ort und können in der dritten und letzten Runde alle erzählen, wie sie gestorben sind.

Hinweise:

*   In den ersten zwei Durchläufen auf die Charaktere und den Ort konzentrieren und diese unabhängig von der Todesart wählen (nicht schon auf den Tod des Charakters hinarbeiten) - so fällt das Finale und das Verknüpfen der Geschichten spannender aus.

Varianten:

*   Die Spieler liegen flach auf der Bühne, die Füße Richtung Zuschauer, und richten sich - zum Publikum gewandt - nur auf, wenn und solange sie reden.
*   Die Vorstellung der Figur kann entfallen.
*   Die Spieler sitzen vornübergebeugt auf einem Stuhl, nur der Redende richtet sich jeweils auf.
*   Es sind nicht genau drei Runden, sondern die Spieler sprechen, wenn ihnen danach ist, ggf. auch nicht in einer bestimmten Reihenfolge.
*   Es wird keine Todesart abgefragt, sondern irgendetwas anderes.
*   Auch bekannt als Sarg-Spiel, passt gut zu Halloween und zum Genre Horrorfilm.', 'https://improwiki.com/de/wiki/improtheater/drei_tote', '2020-11-14 07:44:18.756', 109);
INSERT INTO public.part VALUES (110, 1, '2020-12-02 22:03:53.534865', '2020-12-02 22:03:53.534865', 'Urlaubsreise', 'Zwei Spieler sitzen nebeneinander auf zwei Stühlen und schauen die ganze Zeit nur geradeaus ins Publikum. Der Spielleiter fragt das Publikum nach einem (Urlaubs-) Ort, zu dem man nicht reisen möchte.

Nachdem dieser ausgesucht wurde, fangen die Spieler immer abwechselnd von der Urlaubsreise zu diesem Ort zu erzählen. Die Besonderheit: Der eine erzählt immer sehr positiv, der andere immer sehr negativ. Immer nach ein paar Sätzen stoppt der Spielleiter und gibt dem jeweils anderen das Wort, der den unterbrochenen Bericht nun positiv oder negativ je nach festgelegter Grundhaltung weitererzählt. Die beiden Spieler sind nicht im Dialog, sondern reden wie eine Person, die spontan zwischen den Extremen wechselt.

Natürlich kann das Erzählte gestisch und mimisch unterstrichen werden. Der Schwerpunkt dieses Spieles liegt aber schon beim Reden.', 'https://improwiki.com/de/wiki/improtheater/urlaubsreise', '2020-11-14 07:44:18.76', 110);
INSERT INTO public.part VALUES (111, 1, '2020-12-02 22:03:53.656402', '2020-12-02 22:03:53.656402', 'Fragendes Kind', 'Man lässt sich vom Publikum eine typische Frage geben, die ein Kind einem Erwachsenen stellen würde, z.B. "Warum ist der Himmel blau?"

Nun stellt sich ein Spieler auf die Bühne und ist das Kind, das diese Frage stellt. Die anderen Spieler kommen nun einzeln und nacheinander auf die Bühne und beantworten dem Kind (zugewandt) - kindgerecht - die gestellte Frage. Es sind realistische, phantasievolle, abwegige Erklärungen erlaubt. Nach der Erklärung geht jeder wieder ab.

Nachdem alle ihre Antwort gegeben haben, kommt ein weiteres "Kind" auf die Bühne, stellt die gleiche Frage an das Kind, das bereits auf der Bühne ist. Dessen Aufgabe ist es nun, die Frage unter Verwendungen und fantasievoller Verknüpfung möglichst viele Antworten der "Erwachsenen" zu geben. Dabei geht es nicht darum, die einzelnen Antworten einzeln aufzuzählen, sondern die Antworten inhaltlich möglichst wirr durcheinander zu mischen und aus den Versatzstücken etwas Neues zu schaffen, eine neue fantastische bzw. fantasievolle Beantwortung der gestellten Frage.', 'https://improwiki.com/de/wiki/improtheater/fragendes_kind', '2020-11-14 07:44:18.745', 111);
INSERT INTO public.part VALUES (112, 1, '2020-12-02 22:03:53.791886', '2020-12-02 22:03:53.791886', 'Superszene', '## Regie

An diesem Spiel können sich drei bis fünf Personen beteiligen. Jeder der Spieler ist für eine der Geschichten verantwortlich, ist ihr Regisseur. Er moderiert die Szene an, fragt das Publikum nach Vorgaben und kann - wenn er will - beliebige weitere Anforderungen stellen, z.B. die Form seines Spieles bestimmen (z.B. Reimen, ABC-Spiel, Genre). Die anderen Spieler spielen nun die Szene. Zu gegebener Zeit beendet der Regisseur die Szene. Danach ist der nächste Spieler dran, der nun in die Rolle des Regisseurs schlüpft. Auch er moderiert die Szene an und gestaltet sie mit Vorgaben usw. Auch hier wird gespielt. Das geht so weiter, bis alle drei bis fünf Spieler einmal Regie geführt haben. Danach ist die Spielrunde zu Ende. Die gespielten Szenen werden jeweils kurz von den Regisseuren skizziert und angepriesen, sie machen deutlich, warum die Zuschauer unbedingt die Fortsetzung sehen sollten. Denn darum geht es: Die Zuschauer entscheiden nun, welche Geschichten sie weitersehen wollen. Über jede gespielte Szene wird durch Applaus abgestimmt. Die Szene mit dem geringsten Applaus fällt raus.

Danach beginnt die zweite Runde. Die einzelnen, vom jeweiligen Regisseur moderierten Geschichten werden fortgesetzt, wobei sich der Regisseur jeweils eine weitere Vorgabe vom Publikum holt, aber auch zusätzlich den Spielern noch weitere Vorgaben machen kann. Im Übrigen läuft diese Runde wie die erste, aber eben ohne das ausgeschiedene Spiel. Auch nach dieser Spielrunde scheidet ein Regisseur mit seiner Geschichte aus.

Je nach Zahl der Spieler = Regisseure gibt es also drei bis fünf Spielrunden. Am Ende bleibt eine Geschichte übrig, die "Superszene", also die Geschichte, die das Publikum durchgängig interessant fand.

Hinweise und Tipps:

*   Die Regisseure preisen nur ihre Geschichte an, die der anderen wird nicht kommentiert oder gar schlecht gemacht.
*   Es geht darum, das Interesse der Zuschauer am Fortgang der Geschichte zu wecken und/oder aufrechtzuerhalten, denn alle wollen, dass die Szene die nächste Runde erreicht.
*   Es ist sinnvoll, die jeweilige Szene mit einem "Cliffhanger" zu beeenden, dass heißt, ein offener Ausgang der Szene, der die Zuschauer neugierig und gespannt auf den Fortgang der Geschichte (in der nächsten Runde) macht.
*   Der jeweilige Regisseur kann, muss aber nicht die laufende Szene unterbrechen, um Regieanweisungen zu geben (z.B. "Neue Wahl", wenn ihm ein Szenenverlauf nicht gefällt) oder um das Publikum zu befragen
*   Es geht um kreatives Zusammenspielen, d.h. auch wenn die Regisseure (vermeintliche) Konkurrenten sind, versuchen doch alle, in jeder Szene ihr Bestes zu geben.

## Genre

Der Moderator fragt zu Beginn vier oder fünf Genres ab. Es folgen vier bzw. fünf eigenständige Szenen, die jeweils in einem der unterschiedlichen Genres gespielt werden. Danach ist die erste Spielrunde zu Ende. Der Moderator skizziert die gespielten Szenen. Die Zuschauer entscheiden nun, welche Geschichten sie weitersehen wollen. Über jede gespielte Szene wird durch Applaus abgestimmt. Die Szene mit dem geringsten Applaus fällt raus. In der zweiten Runde werden die verbliebenen Geschichten fortgesetzt. Im Übrigen läuft diese Runde wie die erste, aber eben ohne das ausgeschiedene Spiel. Auch nach dieser Spielrunde scheidet ein Spiel aus. Am Ende bleibt eine Geschichte übrig, die "Superszene", also die Geschichte, die das Publikum durchgängig interessant fand.', 'https://improwiki.com/de/wiki/improtheater/superszene', '2020-11-14 07:44:18.962', 112);
INSERT INTO public.part VALUES (113, 1, '2020-12-02 22:03:54.187284', '2020-12-02 22:03:54.187284', 'Filmjournal', 'Am Rande der Bühne führen ein Regisseur und ein Kulturjournalist ein Gespräch über den neuesten Film des Regisseurs. Dieser wird in Ausschnitten dargestellt. Dabei können folgende Besonderheiten auftreten: Schneller Vorlauf/Rücklauf, Zeitlupe, Wechsel zwischen Originalsprache und Deutsch (vgl. Gromolo-Switch).

**Varianten:**

*   Nur der Kulturjournalist stellt dem Zuschauer den Film vor.
*   Kulturjournal - Der Moderator und ein Kulturjournalist oder Filmkritiker unterhalten sich über den Film.
*   Im Rahmen des Kulturjournals wird eine Oper vorgestellt, d.h. die Akteure singen. Beispiel mit drama-light: http://de.youtube.com/watch?v=hSWOWpnNHgU

_Tipp:_ Wenn der Moderator "Stopp" sagt, ist die jeweilige Szene zuende und die Spieler verlassen den Spielbereich. Wenn er "Pause" sagt, dann frieren sie nur ein und können so direkt weiterspielen - z.B. für Zeitlupe, schneller Rücklauf...', 'https://improwiki.com/de/wiki/improtheater/filmjournal', '2020-11-14 07:44:18.857', 113);
INSERT INTO public.part VALUES (114, 1, '2020-12-02 22:03:54.306628', '2020-12-02 22:03:54.306628', 'Satz vervollständigen', 'Es werden zwei Freiwillige aus dem Publikum geholt, die auf zwei Stühlen links und rechts auf der Bühne Platz nehmen.

Zwei Spieler spielen nun eine Szene. Einem Spieler "gehört" der linke, dem anderen der rechte Freiwillige. Immer wenn während der Szene ein Spieler beim Sprechen plötzlich abbricht und "seinem" Freiwilligen die Hand auf die Schulter legt oder mit der Hand auf ihn zeigt, muss dieser den momentan abgebrochenen Satz vervollständigen. Die Spieler wiederholen den Satz und spielen weiter.', 'https://improwiki.com/de/wiki/improtheater/satz_vervollstaendigen', '2020-11-14 07:44:18.867', 114);
INSERT INTO public.part VALUES (115, 1, '2020-12-02 22:03:54.430986', '2020-12-02 22:03:54.430986', 'Marlowe', 'Die Geschichte wird in dem Stil des _Privatdetektives Phil Marlowe_ von einem Autor in Monologen erzählt. Ähnlich wie bei Typewriter oder Filmjournal bietet dies eine Rahmengeschichte, zu der die anderen Schauspieler in weiteren Szenen auftreten. Allerdings kann in diesen Szenen der Hauptdarsteller und Autor _Marlowe_ ebenfalls mit auftreten.

Als Vorgaben werden vom Publikum hierfür ein Titel und/oder ein Genre eingeholt.

Siehe auch Genre Film noir', 'https://improwiki.com/de/wiki/improtheater/marlowe', '2020-11-14 07:44:18.967', 115);
INSERT INTO public.part VALUES (116, 1, '2020-12-02 22:03:54.55862', '2020-12-02 22:03:54.55862', 'Fingerzeig', 'Dieses Spiel ist auch bekannt unter dem Namen: Schüttelregie.

An diesem Spiel sind drei Spieler und drei Zuschauer beteiligt.

Vor Beginn des Spieles werden drei Zuschauer ausgewählt, die sich nun auf oder in unmittelbarer Nähe der Bühne aufstellen. Außerdem erhalten die drei Spieler die Nummern 1 bis 3. Ggfls. kann man ihnen ein Schild mit der Nummer an die Kleidung kleben oder heften. Die drei ausgewählten Zuschauer haben folgende Aufgabe: Immer dann, wenn der Moderator die laufende Szene unterbricht, muss jeder von ihnen zur gleichen Zeit - und ohne sich mit den anderen zwei abzustimmen - einen, zwei oder drei Finger zeigen, damit signalisieren sie, welcher Spieler entsprechend der ihm zugeordneten Zahl nach der Unterbrechung weiterspielen soll.  
Vor Beginn der Szene wird noch eine beliebige Vorgabe abgefragt.

**Beispiel:**

Spieler 2 ist allein auf der Bühne. Nach der Unterbrechung zeigen zwei Zuschauer drei Finger, einer zwei, also kommt zu Beginn der zuvor unterbrochenen Szene Spieler 3 dazu und spielt nun mit Spieler 2 die Szene bis zur nächsten Unterbrechung und Abfrage. Nach einer erneuten Unterbrechung zeigt ein Zuschauer einen Finger, die zwei anderen drei Finger: In der folgenden Szene ist Spieler 2 nicht dabei; Spieler 1 und Spieler 3 sind auf der Bühne.

Bei drei unterschiedlichen Voten der Zuschauer sind drei Spieler auf der Bühne, bei drei gleichen Voten wird eine Soloszene gespielt.', 'https://improwiki.com/de/wiki/improtheater/fingerzeig', '2020-11-14 07:44:19.018', 116);
INSERT INTO public.part VALUES (117, 1, '2020-12-02 22:03:54.677932', '2020-12-02 22:03:54.677932', 'Typewriter', 'Es wird der Titel eines Buch abgefragt, das es noch nicht gibt. Einer der Spieler ist der Erzähler. Er befindet sich am Rande der Bühne. Er sitzt auf einem Stuhl und bearbeitet eine fiktive Schreibmaschine bzw. - moderner - eine fiktive Computertastatur. Er erzählt die Geschichte, die er gerade eintippt. Sobald er einige Elemente erzählt hat, übernehmen bzw. berücksichtigen die Spieler dies und starten die Szene. Beide - Spieler und Schriftsteller - beeinflussen sich gegenseitig. Die Spieler etwa können durch bestimmtes Handeln die Erzählung des Schriftsteller beeinflussen, der Schriftsteller kann - wenn es dramaturgisch erforderlich ist - den Handlungsort wechseln, neue Figuren einführen, mit Kippen oder Rückblenden arbeiten. Er kann - ausnahmsweise (!) - auch Dialoge "erzwingen": "Horst schrie verärgert: ..." Als Typewriter sollten nur erfahrene Spieler agieren, die sich mit der Dramaturgie von Improszenen gut auskennen. Der Schwerpunkt des Bühnengeschehens liegt bei den agierenden Schauspieler, der Typwriter hat eher die Funktion eines Stichwortgebers, Nothelfers und Initiators und schafft den Rahmen durch Anfangs- und Endmonolog.

Siehe auch: Singender Geschichtenerzähler', 'https://improwiki.com/de/wiki/improtheater/typewriter', '2020-11-14 07:44:18.962', 117);
INSERT INTO public.part VALUES (118, 1, '2020-12-02 22:03:54.806028', '2020-12-02 22:03:54.806028', 'Zugerufene Begriffe sofort einbauen', 'Zwei oder drei Spieler improvisieren eine Szene nach einer beliebigen Vorgabe. Der Spielleiter oder ein Freiwilliger ruft immer wieder x-beliebige Begriffe ein, die von den Spielern sofort in die Szene eingebaut werden müssen - natürlich irgendwie plausiblel.

Der Einrufer sollte möglichst Begriffe wählen, die so wenig wie möglich mit der momentanen Szene zu tun haben. Das ergibt die lustigsten Momente - und wenn den Spielern der schnelle und geschickte Einbau dieser "absurden Exoten" gut gelingt, ist das Publikum besonders beeindruckt.

Man kann auch zwei Einrufer nehmen, die links und rechts der Spielfläche stehen und sich mit ihren Zurufen abwechseln.

Dieses Spiel ist sehr ähnlich wie die Erzähl-Übung Spit-Fire, aber hier werden die Begriffe nicht in eine erzählte Geschichte, sondern in eine gespielte Szene eingebaut.

_Siehe auch_ Souffleur', 'https://improwiki.com/de/wiki/improtheater/zugerufene_begriffe_sofort_einbauen', '2020-11-14 07:44:19.083', 118);
INSERT INTO public.part VALUES (119, 1, '2020-12-02 22:03:54.953256', '2020-12-02 22:03:54.953256', 'Wie geht''s weiter?', '## Als Spiel

Es beginnt eine Improszene mit üblichen Vorgaben. Nach einer gewissen Zeit sagt der Moderator „Stopp“ und die Spieler frieren ein. Der Moderator fragt das Publikum nun allgemein, wie es weiter gehen soll. Möglich sind auch konkretere Fragen, z.B. „Was sagt jetzt A zu B?“ oder „Welches Gefühl hat B jetzt?“. Die Spieler setzen ihr Spiel unter Berücksichtigung der Vorgabe des Publikums fort. Nach einer gewissen Zeit wird wieder unterbrochen und gefragt, wie es weiter gehen soll usw.

Häufig entwickelt sich das Spiel aufgrund der Vorgaben des Publikums so, dass schließlich alle Spieler des Abends auf der Bühne spielen.

* * *

## Als Übung

Unter dem Titel _What''s next_ bzw. _Wie geht''s weiter_ gibt es auch eine Übung. Ein Spieler spielt hierbei alleine; er bekommt Anweisungen von einem oder mehreren Partnern. Zu Beginn der Übung fragt er "Was passiert zuerst?". Er bekommt eine Tätigkeit genannt, die er ausführen soll. Dies soll immer nur eine kleine Tätigkeit sein. Nachdem er diese Tätigkeit ausgeführt hat, fragt der Spieler "What''s next?". Er bekommt die nächste Tätigkeit genannt und führt diese aus.

*   A: Was passiert zuerst?
*   B: Du öffnest das Auto.
*   A öffnet pantomimisch eine Autotür
*   A: Was passiert als nächstes?
*   B: Du steigst in das Auto
*   ... usw.

Ziel der Übung ist es, kleine Aktionen pantomimisch sauber durchzuführen. Der Spieler soll selber keine Interpretation der Szene geben, sondern nur das tun, was im gesagt wurde (also in dem obigen Beispiel nicht bereits in das Auto einsteigen). Diese Aktionen müssen nicht aufeinander aufbauen.

Variante

Es spielen zwei Spieler, die abwechselnd von einem jeweils eigenem Partner gesagt bekommen, was sie machen sollen. Eine besonders interessante Variante wurde von den Crumbs vorgeschlagen. Es spielen ein Mann und eine Frau. Jeweils die Männer unter den Zuschauern sagen dem Mann, was er zu tun hat. Entsprechend tun dies die Frauen für die Spielerin. Diese Zuordnung kann auch getauscht werden.', 'https://improwiki.com/de/wiki/improtheater/wie_geht_s_weiter', '2020-11-14 07:44:19.117', 119);
INSERT INTO public.part VALUES (120, 1, '2020-12-02 22:03:55.09593', '2020-12-02 22:03:55.09593', 'Souffleur', 'Ein Freiwilliger aus dem Publikum wird auf einen Stuhl mittig vor die Bühne gesetzt. Dann wird mit 2 Spielern auf der Bühne eine Szene improvisiert. Immer, wenn ein Spieler nicht mehr weiter weiß, ruft er nach dem "Souffleur", und dieser muss ihm dann den Text eingeben.

Beispiel:

*   A: "Liebst du mich denn überhaupt noch?"
*   B (zum Souffleur): "Souffleur!"
*   Souffleur: "Aber ganz sicher, mein Schatz!"
*   B (zu A, laut und theatralisch): "Aber ganz sicher, mein Schatz! Für dich würde ich einen Ozean durchschwimmen!"
*   usw.

**Variante**: Das ganze Publikum darf soufflieren. Immer wenn ein Spieler sich auf der Bühne laut und vernehmlich räuspert, darf das Publikum das fehlende Wort einrufen. Der Spieler nimmt das gerufene Wort, egal was es ist, natürlich sofort an.

Beispiel:

*   A: "Was schaust du denn so komisch?"
*   B: "Ich wollte dir schon lange etwas ..."
*   Publikum: "sagen!"
*   B: "...sagen. Es gibt da in meinem Leben eine ..."
*   Publikum: "Katze!"
*   B: "Katze. Die hab ich mal von meiner Mutter bekommen. Ich halte sie im Keller versteckt, damit sie niemand sieht."
*   usw.

_Siehe auch:_ Zugerufene Begriffe sofort einbauen', 'https://improwiki.com/de/wiki/improtheater/souffleur', '2020-11-14 07:44:19.131', 120);
INSERT INTO public.part VALUES (121, 1, '2020-12-02 22:03:55.363577', '2020-12-02 22:03:55.363577', 'Hupe und Glöckchen', '_Auch bekannt als "Erster Kuss"._

Ein Freiwilliger aus dem Publikum wird auf der Bühne platziert (am Besten auf einem Stuhl sitzend) und bekommt eine Hupe und ein Glöckchen. Dann wird eine Szene improvisiert. Wichtig ist: Es muss **viel** behauptet werden! Der Freiwillige hupt, wenn eine bestimmte Behauptung nicht stimmt, er klingelt mit dem Glöcken,wenn die Behauptung stimmt. Hupe bedeutet für die Spieler sofort "Neue Wahl" - der letzte Satz wird gestrichen und durch einen anderen Satz ersetzt.

Die Spieler sollten darauf achten, Pausen zu setzen: Damit wird der Freiwillige "gezwungen", eine Pro- oder Contra-Entscheidung zu treffen. Des Weiteren sollte man beachten, dass nicht mehrere Angebote gleichzeitig kommen, so dass nicht klar wird, zu was der Freiwillige klingelt und hupt.

Meist wird ein wichtiges persönliches Ereignis, das der Freiwillige wirklich erlebt hat, nachgespielt (z.B. Familientreffen, erster Kuss).

**Beispiel** mit dem Improtheater _Im freien Fall_: http://de.youtube.com/watch?v=QHT4UWdu8Ko&amp;', 'https://improwiki.com/de/wiki/improtheater/hupe_und_gloeckchen', '2020-11-14 07:44:19.155', 121);
INSERT INTO public.part VALUES (133, 1, '2020-12-02 22:03:59.210798', '2020-12-02 22:03:59.210798', 'Clickbait', '## Hintergrund

_Mit Clickbaiting bzw. Klickköder wird medienkritisch ein Prozess bezeichnet, Inhalte im World Wide Web mit einem Clickbait (deutsch etwa „Klickköder“) anzupreisen. Clickbaits dienen dem Zweck, höhere Zugriffszahlen \[...\] zu erzielen._

_Ein Clickbait besteht in der Regel aus einer reißerischen Überschrift, die eine sogenannte Neugierlücke (englisch curiosity gap) lässt. Sie teilt dem Leser gerade genügend Informationen mit, um ihn neugierig zu machen, aber nicht ausreichend, um diese Neugier auch zu befriedigen._ (Quelle: Wikipedia)

## Spielablauf

Die Zuschauer wählen aus einem weniger seriösen Online-Medium ihrer Wahl (z.B. BuzzFeed, Huffington Post, Focus Online, likemag.com, heftig.de) eine möglichst reißerisch und rätselhaft anmutende Schlagzeile aus, z.B. _„Er wohnte auf einer Insel inmitten von 13 Mio. Menschen. Keiner beachtete ihn, bis eine Frau hinsah.“_ (Likemag.com). Die Aufgabe der Spieler ist es nun, das Geheimnis um die Geschichte dahinter zu lüften.

Quelle: improgruppe.de', 'https://improwiki.com/de/wiki/improtheater/clickbait', '2020-11-14 07:44:19.569', 133);
INSERT INTO public.part VALUES (122, 1, '2020-12-02 22:03:55.719502', '2020-12-02 22:03:55.719502', 'Gromolo-Switch', 'Ein Gromolo\-Switch (Kauderwelsch-Switch) ist als eigenständiges Spiel möglich, kann aber auch in jedes beliebige Spiel eingebaut werden. Dabei obliegt es dem Spielleiter, die Szene durch ein Zeichen bzw. Geräusch (Klatschen) von einer Sekunde auf die nächste von deutsch auf Gromolo oder umgekehrt umzuschalten.

Die Darsteller spielen ohne Unterbrechung weiter. Das Spiel wirkt nur dann, wenn wirklich kein Übergang im Redefluss zu hören ist, auch z.B. keine Atempause! So wird im besten Fall mitten im gesprochenen Satz zwischen den beiden Sprachen umgeschaltet.

Der Switch kann beliebig oft stattfinden, auch die Dauer der Gromolo/deutsch-Parts sind unterschiedlich lang. Wichtig ist, dass auch während der Gromolophase die Szene weiterläuft, etwas geschieht. Wichtig ist auch, dass die einzelnen Phasen nicht zu lang sind und gegen Ende der Szene zunehmend kürzer werden.

Eigentlich entstand dieses Spiel, wie so viele Improspiele, aus einer Übung heraus. Das Sprechen in Gromolo reduziert zum einen die Kommunikation auf die Art und Weise wie gesprochen wird und zum anderen müssen die Darstellen vermehrt Köpersprache, Gestik und Mimik einsetzen.

Es sollen keine übertriebenen gestischen Dartstellungen bemüht werden. Die Spieler neigen oft dazu etwas pantomimisch zu erklären, da die anderen Spieler oder das Publikum die Sprache nicht versteht. Die Darsteller sollen sich auch in der Gromolo-Unterhaltung so verhalten, als verstünden sie ganz genau was Ihr Gegenüber meint oder sagt. Auch dem Publikum soll nicht durch extravagantes Spiel die Handlung erklärt werden.

Ist man gezwungen etwas "scharadenmäßig" zu erklären, dann läuft etwas anderes schief. Es ist im übrigen auch gar nicht nötig, dass jede Handlung eindeutig ist, denn gerade die Mehrdeutigkeiten der einzelnen Handlungen machen den Reiz als Spiel aus.

Es verhält sich ähnlich einem Film in einer fremden Sprache. Auch hier versteht man nicht jedes Detail, dennoch erschliesst sich einem die grobe Rahmenhandlung.

Desweiteren können die Rücksprünge in die deutsche Sprache genutzt werden, um einige Dinge, die vielleicht unklar waren, zu definieren.

Es kann aber auch großen Spaß machen, bewusst eine gewisse Ungewissheit im Raum stehen zu lassen und gerade mit diesem nicht genau definierten Umstand zu spielen.

', 'https://improwiki.com/de/wiki/improtheater/gromolo-switch', '2020-11-14 07:44:19.214', 122);
INSERT INTO public.part VALUES (123, 1, '2020-12-02 22:03:56.074534', '2020-12-02 22:03:56.074534', 'Davor oder danach', 'Bei diesem Spiel führt das Publikum durch Entscheidungen indirekt Regie.

2 oder auch mehr Spieler spielen eine Startszene.

Nach der Szene wird nun das Publikum gefragt: "Davor oder danach?". "Davor" bedeutet, dass die Zuschauer als nächstes eine Szene sehen, die zeitlich vor der Startszene spielt, "Danach" bedeutet, dass die nächste Szene zeitlich nach der Startszene spielt.

Die entsprechende Szene wird nun gespielt (z.B. zeitlich vor der Startszene). Danach wird das Publikum wieder gefragt ob "Davor oder Danach?".

Kommt es dazu, dass durch die Entscheidung des Publikums eine Szene wiederholt wird, so kann diese Szene wie eine Replayszene gespielt werden und Details hinzugefügt oder auch angepasst werden und Informationen aus den anderen Szenen mit hineingebracht werden.

### Variation

*   Diese Übung kann auch als Langform gespielt werden, um eine ganze Geschichte zu erzählen.

Ein sehr ähnliches Spiel (nur stufenloser) ist Vorwärts rückwärts.', 'https://improwiki.com/de/wiki/improtheater/davor_oder_danach', '2020-11-14 07:44:19.241', 123);
INSERT INTO public.part VALUES (124, 1, '2020-12-02 22:03:56.311623', '2020-12-02 22:03:56.311623', 'Einer für alle', 'An diesem Spiel nehmen drei Personen teil. Zunächst wird eine normale Improszene gespielt. Wichtig ist, dass in dieser Szene viel Bewegung, viel Action ist und dass alle drei auch reden. Gut ist es auch, wenn die drei sehr unterschiedliche, prägnante Figuren sind. In der nächsten Runde verschwindet einer von den drei Spielern von der Bühne. Nun wird die gleiche Szene wiederholt. Aber das Handeln und Reden des verschwundenen Spielers wird nun zusätzlich zu der eigenen Rolle von einem der beiden auf der Bühne verbliebenen Spielern übernommen: Er muss also, je nach dem, wen er von den beiden Figuren spielt, jeweils deren Position, Haltung, Charakter immer wieder übernehmen und damit wechseln und somit auf der Bühne "herumspringen". Für die dritte Wiederholung der Szene verschwindet auch der zweite Spieler. Der verbleibende Spieler - derselbe, der auch in der 2. Runde zwei Personen gespielt hat - muss nun dieselbe Szene allein spielen und verkörpert dabei drei Personen. Daher muss er natürlich dauernd Position, Haltung und Figur wechseln. Das ist ziemlich anstrengend :-)', 'https://improwiki.com/de/wiki/improtheater/einer_fuer_alle', '2020-11-14 07:44:19.346', 124);
INSERT INTO public.part VALUES (125, 1, '2020-12-02 22:03:56.674041', '2020-12-02 22:03:56.674041', 'Halbwertzeit', 'Auch _Fast Forward_ genannt

Eine Szene wird innerhalb von einer Minute gespielt, danach wird sie innerhalb von 30, 15, 7, 3 und 1 Sekunde wiederholt.  
Diese Verkürzung führt dazu, dass sich die Szene zunehmend auf das Wesentliche reduziert. In der Regel wird selbst eine schwache Ausgangsszene durch die slapstickartig wirkenden Verkürzungen zum Lacherfolg.

## Tipps und Hinweise

*   Hilfreich ist es, als Vorgabe nach einer dramatischen Situation zu fragen.
*   In der Ausgangsszene muss viel Handlung passieren: Platzwechsel, Dialoge, Dramatik usw.
*   Wichtig ist es, in den kürzeren/kurzen Folgeszenen immer die wichtigen Ankerpunkte der Handlung der Ausgangsszene auftauchen zu lassen. Auch in der letzten, kürzesten Szenen. Das Spiel lebt von der Wiederholung genau dieser, die Szene prägenden Ankerpunkte. Und natürlich freut sich das Publikum an den sich abkämpfenden, hektischen und am Schluss atemlosen Spielern.

**Variante**: Die Ausgangsszene hat eine beliebige Länge, die erste Verkürzung ist dann auf eine Minute.

## Begriffsherkunft

Die Halbwertszeit die Zeitspanne, nach der eine mit der Zeit abnehmende Größe die Hälfte des anfänglichen Werts erreicht. Im Bereich der Physik gibt es z.B. die Anwendung dieses Begriffes, wenn es um Radioaktivität geht. Nach Ablauf der Halbwertszeit hat die die Radioaktivität eines Stoffes halbiert. Die Halbwertszeit des radioaktiven Kohlenstoffisotops C14 beträgt ungefähr 5700 Jahre, d.h. nach 5700 ist in einem Stück Holz nur noch die Hälfte es C14-Isotops übrig, im Vergleich zu der Menge, die das Holz hatte als es noch im Wachstum befindlich war. So kann man dann auch das Alter von ehemals lebenden Gewebe errechnen.', 'https://improwiki.com/de/wiki/improtheater/halbwertzeit', '2020-11-14 07:44:19.344', 125);
INSERT INTO public.part VALUES (126, 1, '2020-12-02 22:03:57.345493', '2020-12-02 22:03:57.345493', 'Wort-Replay', 'Zunächst wird wie bei allen Replays eine freie Szene gespielt. Hierbei sollte darauf geachtet werden, dass die Spieler viel Reden und auch lange Sätze machen. Bei der ersten Wiederholung darf nun jeder Spieler nur noch in 3-Wort-Sätzen reden, Bei der zweiten ist je nur ein Wort erlaubt. Auch dieses Replay reduziert die Anfangszene aufs wesentliche, jedoch leidet durch die fehlende Zeitvorgabe nicht die Pantomime.', 'https://improwiki.com/de/wiki/improtheater/wort-replay', '2020-11-14 07:44:19.446', 126);
INSERT INTO public.part VALUES (127, 1, '2020-12-02 22:03:57.564827', '2020-12-02 22:03:57.564827', 'Tod in einer Minute', 'An diesem Spiel sind zwei Spieler beteiligt. Sie lassen sich eine beliebige Vorgabe. Sie spielen eine normale Szene. Aufgabe ist, dass einer von beiden innerhalb einer Minute sterben muss. Der Überlebende spielt Solo, bis der Moderator die Szene beendet.

## Anderes Spiel, gleicher Name

Außerdem gibt es ein Spiel unter dem gleichen Namen als Variante des Spiels Halbwertzeit:

Zwei Spieler beginnen eine Szene (evtl. mit Vorgaben des Publikums) bei der innerhalb einer Minute eine der beiden Figuren sterben muss. Nun wird die selbe Szene wiederholt, jedoch wird jetzt nur noch eine halbe Minute gespielt. Dann 15 Sekunden, 8, 4, 2, 1 Sekunden.', 'https://improwiki.com/de/wiki/improtheater/tod_in_einer_minute_halbwertzeit', '2020-11-14 07:44:19.542', 127);
INSERT INTO public.part VALUES (128, 1, '2020-12-02 22:03:57.775316', '2020-12-02 22:03:57.775316', 'Märchenreplay', 'Von den Zuschauern wird ein bekanntes Märchen als Vorgabe eingeholt. Dieses Märchen wird dann in einer neutralen Szene kurz gespielt.

Anschließend wird das Märchen in einem anderen Genre wiederholt (siehe Genreliste), welches vorher vom Publikum bestimmt wurde.', 'https://improwiki.com/de/wiki/improtheater/maerchenreplay', '2020-11-14 07:44:19.343', 128);
INSERT INTO public.part VALUES (136, 1, '2020-12-02 22:03:59.710787', '2020-12-02 22:03:59.710787', 'Was nicht passieren darf', 'Wie beim Zettelspiel werden hier Zettel vor dem Beginn oder in der Pause verteilt. Diese haben den Vordruck

_Was nicht passieren darf..._

Der Zuschauer soll einsetzen was oder wo nicht passieren darf, z.B.:

Was nicht passieren darf _beim Kaffeetrinken_

Die Zettel werden eingesammelt und in einem Spiel vom Moderator z.B. aus einem Hut gezogen.

Die Spieler spielen kurze Einzelszenen, in denen sie zeigen _was nicht passieren darf_ (hier z.B. Salz mit Zucker verwechseln).

Kommt keine Szene mehr von den Spielern, so wird ein neuer Zettel gezogen.

Filmbeispiel von Whose Line: https://www.youtube.com/watch?v=X4oDTGsCCqY', 'https://improwiki.com/de/wiki/improtheater/was_nicht_passieren_darf', '2020-11-14 07:44:19.696', 136);
INSERT INTO public.part VALUES (137, 1, '2020-12-02 22:03:59.813604', '2020-12-02 22:03:59.813604', 'Bücherparade', 'Diese Langform kann in zwei Varianten gespielt werden. In beiden Varianten wird das Publikum zunächst gebeten, Gedichtbände, Kurzgeschichten, eigene Poesie usw. mitzubringen. Einige der mitgebrachten Bücher werden ausgewählt und von einem Zuschauer wahllos auf der Bühne stehend (!) platziert. Das Buch, welches am zentralsten Punkt auf der Bühne liegt, wird als erste Inspiration gebraucht. Ein Spieler blättert es durch und ein Zuschauer sagt "Stopp!". Von der aufgeschlagenen Seite wird ein kurzer Abschnitt dem Publikum vorgelesen. Die Szene beginnt.

_Variante 1_  
Es gibt einen Schnitt, wenn  
a) ein Buch umfällt - dann muss dieses direkt genommen, daraus - wie beschrieben - zitiert und der Text in die Geschichte eingebaut werden  
oder  
b) ein Spieler nicht weiter weiß und sich ein Buch schnappt und - wie beschrieben - daraus zitiert.  
Die Geschichte bleibt dieselbe, die Texte werden eingebaut.

_Variante 2_  
Die Szene läuft weiter, bis ein (anderes) Buch umfällt. Daraus wird wie oben beschrieben zitiert. Jedes Buch erzählt eine neue Geschichte. Es werden so vor der Pause zwischen 6 - 10 Stories angespielt. Nach der Pause wird das Publikum gefragt, welche Geschichten es zu Ende sehen möchten. Diese Bücher werden auf den Bühnenrand gestellt. Die Geschichten werden zu Ende gespielt. (Geht eine Geschichte nicht weiter oder hat man Lust, kann immer wieder aus dem betreffenden Buch zitiert werden).

_Tipps und Hinweise_

*   Meist stoßen die Spieler versehentlich im Spiel ein Buch um. Wenn die Geschichte klemmt, wird charmant ein Buch extra umgestoßen.
*   Je nach Bühnengröße werden mehr oder weniger Bücher aufgestellt.

_Diese Langform wurde von den Impro-Leck-TuEllen im Mai 2010 uraufgeführt._', 'https://improwiki.com/de/wiki/improtheater/buecherparade', '2020-11-14 07:44:19.725', 137);
INSERT INTO public.part VALUES (138, 1, '2020-12-02 22:03:59.952958', '2020-12-02 22:03:59.952958', 'Zitate', 'Die Zuschauer werden vor dem Auftritt gebeten, berühmte Zitate auf kleinen Zetteln aufzuschreiben. Diese werden dann den Darstellern gereicht, die sie in ihren Taschen verstauen.

Die Darsteller beginnen dann mit einer Szene zu einem bestimmten Thema, und bringen die Zitate an geigneter Stelle ein. Wichtig ist, zu den Zitaten entsprechend zu reagieren.

', 'https://improwiki.com/de/wiki/improtheater/zitate', '2020-11-14 07:44:19.768', 138);
INSERT INTO public.part VALUES (139, 1, '2020-12-02 22:04:00.074322', '2020-12-02 22:04:00.074322', 'Zettelspiel', 'Beim Zettelspiel haben die Spieler die Aufgabe - nach dem Etablieren der Szene -, während des Spieles immer wieder einmal einen Zettel aufzunehmen und den darauf stehenden Satz möglichst sinnvoll in ihr Spiel zu integrieren. Sobald sie auf den Zettel geschaut haben, ist der Satz auszusprechen. Lediglich handeln dürfen sie noch bis zum Aussprechen des gelesenen Satzes. Auch das Aufnehmen des Zettels sollte in das Spiel sinnvoll integriert werden ("Oh, jetzt ist mir mein Ohrring ''runtergefallen").

Beschriftet werden die Zettel von den Zuschauern. Vor dem Spiel (sinnvoll: unmittelbar vor der Pause der ersten Halbzeit) werden die Zuschauer gebeten, auf ihren Zettel _gut leserlich_ einen _einfachen_ Satz zu schreiben.

Vor Beginn des Spiels werden die Zettel mit dem Text nach unten auf der Bühne verteilt.

## Hinweise und Tipps

*   Denkbar und hilfreich ist, grundsätzlich vor dem Einbauen des Satzes einen "Doppelpunkt-Satz" zu sagen.  
    

Beispiele:  

"Seit meiner Pubertät habe ich folgendes Lebensmotto: ..."  

"Ich krieg immer die Panik, wenn morgens mein Chef zu mir sagt: ..."  

"Weißt Du, welcher Gedanke mir gerade durch den Kopf geht: ..."  

"Gestern hat Holger zu mir gesagt: ..."  

Es folgt dann jeweils der Zuschauersatz.

*   Problematisch kann sein, wenn zu viele Zettel zur Verfügung stehen. Entweder wird eine überschaubare Zahl von Zetteln vor Spielbeginn ausgelost oder es werden nicht alle Zettel von den Spieler aufgenommen. Bleiben Zettel liegen, kann man sie ggf. noch in nachfolgende Spiele einbauen, z.B. beim Potpourri.
*   Der vorgelesene Zettel sollte entweder eingesteckt oder zusammengeknüllt auf den Boden geworfen werden, denn sonst besteht die Gefahr, dass er später ein 2. Mal vorgelesen wird.
*   Nur bei wirklich unzumutbaren Texten sollte man auf das Vorlesen verzichten.
*   Varianten:
    *   Ein Zettel ist immer nur dann aufzuheben, wenn der Moderator klatscht.
    *   Die Zettel werden im Rahmen von Freeze Tag aufgehoben.

', 'https://improwiki.com/de/wiki/improtheater/zettelspiel', '2020-11-14 07:44:19.961', 139);
INSERT INTO public.part VALUES (140, 1, '2020-12-02 22:04:00.207443', '2020-12-02 22:04:00.207443', 'Stunt-Double', 'Zwei Spieler initiieren eine möglichst actionreiche Szene. Immer wenn etwas Gefährliches passiert, ruft einer der beiden Spieler: Stunt-Double. Dann werden die beiden Spieler durch zwei andere Spieler ersetzt, die dann die Szene an genau dieser Stelle weiterspielen. Vorzugsweise tun sie dies in Zeitlupe und schmücken jede Bewegung bis ins kleinste Detail aus.

Die Stunt-Doubles können nicht nur bei gefählichen Szenen zum Einsatz kommen, sondern immer dann, wenn den anderen beiden Spieler danach ist bzw. etwas kommt, das sie nicht spielen möchten. Prima Spiel zum Foppen der beiden Stunt-Spieler.', 'https://improwiki.com/de/wiki/improtheater/stunt-double', '2020-11-14 07:44:19.812', 140);
INSERT INTO public.part VALUES (141, 1, '2020-12-02 22:04:00.364805', '2020-12-02 22:04:00.364805', 'Zahl Ding Farbe', 'Dieses Spiel wird mit drei Spielern gespielt. Für einen der drei Spieler wird eine Zahl von den Zuschauern eingeholt, für den zweiten Spieler ein Gegenstand und für den letzten Spieler eine Farbe.

Jedem Spieler ist somit sein persönliches Signalwort zugewiesen worden. Die Szene beginnt in der Regel mit einer Person. Sie holt sich nach dem Etablieren der Szene über ein Signalwort eine weitere Person dazu. Die Regel lautet: Fällt in irgendeinem Satz in der Szene eines der drei Signalworte, so muss der betreffende Spieler die Spielfläche betreten, falls er - außerhalb der Szene - am Rand steht. Demgegenüber muss er in der fortlaufenden Szene begründet die Spielfläche verlassen, wenn sein Signalwort fällt. Begründet die Szene verlassen heißt, dass man nicht einfach sang- und klanglos die Bühne verlässt. Es muss einen plausiblen Grund dafür geben, der möglichst mit der laufenden Szene zu tun haben sollte. Den sollte man kurz ansprechen, z.B. "ich hol'' mal eben das ...."

Durch Benutzen der Signalbegriffe kann man kann also seine Mitspieler beliebig auf die Spielfläche holen oder sie wegschicken.  

_Tipps und Hinweise:_

*   Man kann sich als Spieler auch selbst rausschicken, wenn man sein eigenes Schlüsselwort sagt. Von dieser Möglichkeit sollte aber nicht unbedingt bzw. nur sehr sparsam Gebrauch gemacht werden. Insbesondere wenn der Betreffende gerade allein auf der Bühne ist, ist die Szene zuende. :-)
*   Manchmal fällt das gleiche Schlüsselwort mehrfach hintereinander. Man muss also ggf. ganz schnell hintereinander rein und wieder rausgehen bzw. umgekehrt. Wenn jemand häufig raus- und reingeschickt wird, wird es besonders hektisch/witzig, allerdings besteht dann die Gefahr, dass die Geschichte darunter leidet.
*   Auch wenn das Spiel eher ein anspruchsloseres Slapstickspiel ist, muss man sich auf das Fallen seines Schlüsselwortes konzentrieren und sollte versuchen, eine Geschichte hinzubekommen.

_Varianten:_

*   Man kann beliebige Begriffe abfragen.
*   Wenn ein Musiker beteiligt ist, muss er anfangen zu spielen, wenn sein Schlüsselwort fällt, und aufhören, wenn es wieder fällt. Die anderen Spieler können dazu singen.', 'https://improwiki.com/de/spiele/zahl-ding-farbe', '2020-11-14 07:44:19.947', 141);
INSERT INTO public.part VALUES (148, 1, '2020-12-02 22:04:01.338604', '2020-12-02 22:04:01.338604', 'Lebendige Szenerie', 'Ein weiteres lustiges, albernes Kurzform-Spiel. Der Gastgeber bittet um einen Vorschlag für eine Situation oder einen Tagesablauf an einem Ort.

Zwei Spieler spielen dann eine Szene mit den anderen Spielern als Requisiten. Z. B. wenn ein Spieler eine Jacke anzieht, "mimt" einer der anderen Spieler die Jacke um ihn gewickelt und so weiter. Die Spieler können manchmal nur über die Requisiten reden, mit denen sie die anderen Spieler zum Handeln auffordern wollten (in Improvisationsszenen sollte man das in der Regel vermeiden).

Lustiges Spiel, viel Bewegung, also auch ein gutes körperliches Aufwärmen.

Ähnlich Das Ding', 'https://improwiki.com/de/wiki/improtheater/lebendige_szenerie', '2020-11-14 07:44:20.144', 148);
INSERT INTO public.part VALUES (142, 1, '2020-12-02 22:04:00.513283', '2020-12-02 22:04:00.513283', 'Mäusefallen', 'Der Bühnenboden wird mit Mäusefallen präpariert. Es dürfen schon eine ganze Menge sein, so dass es schwierig wird, über die Bühne zu gehen, ohne in eine solche Falle zu treten. Dann werden den Spielern die Augen verbunden und sie ziehen die Schuhe aus, am besten auch noch die Socken, so dass sie barfuß spielen. Die Szene wird also blind und mit nackten Füßen gespielt. Die Spieler sollten nicht zu vorsichtig über die Bühne gehen, denn das Treten in eine Falle ist ja eigentlich beabsichtigt.

Für das Publikum kann dies ein großer Spaß sein, gerade weil die Vorstellung, blind durch einen Raum mit Mausefallen zu laufen, schon absurd erscheint. Wichtig ist, dass das Setting dem Publikum vorher richtig erklärt wird und so die Spannung ("hoffentlich tritt er nicht in die Falle") erhöht wird. Der größte Effekt wird erzielt, wenn das Publikum mit den Spielern mitleiden kann und darf.

Ich habe dieses Spiel auch schon gesehen, wobei die Spieler kaum darauf reagiert haben wenn eine Mäusefalle an Ihrem Fuss zu schnappte. Damit ging dann auch jegliche Wirkung im Publikum verloren. Natürlich müssen die Spieler auch so spielen, dass sie nicht gerne in die Fallen treten möchten und wenn es passiert, dann tut es natürlich auch weh. Das darf und soll auch gezeigt werden.', 'https://improwiki.com/de/wiki/improtheater/maeusefallen', '2020-11-14 07:44:19.913', 142);
INSERT INTO public.part VALUES (143, 1, '2020-12-02 22:04:00.627197', '2020-12-02 22:04:00.627197', 'Hut ab', 'Dieses Spiel ist besonders für Theatersport-Matches geeignet, da es eine Gewinner- und eine Verlierer-Mannschaft gibt. Voraussetzung ist ein Hut aus der Requisite.

Von jeder Mannschaft steht je ein Spieler auf der Bühne und sie spielen eine Szene. Der Spieler ohne Hut muss nun versuchen dem Spieler mit Hut selbigen abzunehmen. Dies kann durch Ablenkung geschehen oder durch geschicktes Spielen.

Beispiele:

*   **Ablenkung:** Kuck mal da hinten, ein fliegender Fisch - Spieler dreht sich um, Hut wird abgenommen.
*   **Geschickt:** Spieler schaut auf ein Ohr, macht eine überraschte Miene und fragt beispielsweise: "Du hast aber einen schönen Ohrring. Den muss ich mir aber genauer anschauen." Der Spieler mit Hut passt nicht gut genug auf und der Hut wird weggeschnappt.
*   **Raffiniert:** Findet der Spieler ohne Hut einen triftigen Grund, den Hutträger dazu zu bringen, ihm den Hut zu geben, muss dieser den Hut freiwillig rausrücken, alles andere wäre "Blocken der Szene". Es sei denn, er hat wiederum auch eine sehr gute Ausrede, warum er den Hut nicht weggeben muss.

Eindeutige Fehlgriffe, bei denen sich ein Spieler duckt und knapp neben den Hut gegriffen wird, werden in Zeitlupe wiederholt. Solche Fehlversuche gelten allerdings trotzdem als "weggeschnappt". Kurzzeitiges Festhalten des Hutes ist in soweit gestattet, als dass der Hutträger einen triftigen Grund hat, etwa "Oh, jetzt hätte der Wind beinahe meinen Hut weggeblasen."

Der Spieler, dessen Hut weggeschnappt wird, wird durch einen Mitspieler seiner Mannschaft ausgetauscht. Danach wird eine komplett neue Szene gespielt.

Dies geschieht solange, bis in einer Mannschaft alle Spieler "verbraucht" wurden.

', 'https://improwiki.com/de/wiki/improtheater/hut_ab', '2020-11-14 07:44:19.994', 143);
INSERT INTO public.part VALUES (144, 1, '2020-12-02 22:04:00.760426', '2020-12-02 22:04:00.760426', 'Sitzen Stehen Liegen', 'An diesem Spiel sind drei Personen beteiligt. Es wird eine Szene gespielt, in der jeweils einer der Darsteller liegt, einer sitzt und einer steht. Diese "Balance" (einer sitzt, einer steht, einer liegt) ist während des Spiels aufrecht zu erhalten. Wechselt also einer der Spieler seine "Ebene", muss unverzüglich einer der zwei anderen die aktuell nicht dargestellte "Ebene" einnehmen. Nicht übernehmen muss man die konkrete Körperhaltung (Gestik) des Anderen! Die Ebenenwechsel sind im Spiel zu rechtfertigen.

Richtig witzig wird es, wenn es viele Haltungsänderungen gibt, also immer wieder jemand gezwungen wird sich zu bewegen und diese (im normalen Leben abnorme) Veränderung zu begründen.

Zweck: Dier Wahrnehmung der Handlungen der anderen wird verbessert und durch den "Bewegungszwang" wird geübt, "Talking heads" bzw. Laberszenen zu vermeiden.

''Sitzen Stehen Liegen'' ist auch als Spiel vor Zuschauern denkbar.

## Varianten

(4 \[3\] Darsteller)

*   _Knien_ + Sitzen Stehen (Liegen)
*   _Bücken_ + Sitzen Stehen (Liegen)

## Tipps und Hinweise

*   Wenn es keine Bühne gibt, sollten die Szenen ohne Liegen stattfinden, denn die liegende Person ist dann für viele nicht zu sehen!

', 'https://improwiki.com/de/wiki/improtheater/sitzen_stehen_liegen', '2020-11-14 07:44:20.038', 144);
INSERT INTO public.part VALUES (145, 1, '2020-12-02 22:04:00.896916', '2020-12-02 22:04:00.896916', 'Szene auf zwei Stockwerken', 'Es wird eine Szene improvisiert, die auf zwei verschiedenen Stockwerken eines Gebäudes spielt. Die Spieler können das darstellen, indem sie die Bühnenfläche "unsichtbar" in zwei Hälften teilen und durch ihre Dialoge sowie ihre Blickrichtungen nach oben bzw. nach unten klar machen, wer momentan im oberen und wer im unteren Stockwerk ist. Wichtig ist, dass man die Illusion der geteilten Bühne nicht zerstört, indem man einen falschen "geradeaus"- Augenkontakt herstellt, während man auf den verschiedenen Ebenen spielt.

Natürlich können die Spieler auch mal zwischendurch zwischen den Stockwerken wechseln, über eine pantomimisch gespielte Treppe oder Leiter o. ä.

Als Vorgabe bietet sich die Frage an das Publikum nach einem Gebäude an.

Das gleiche Prinzip lässt sich natürlich auch in vielen anderen Fällen einsetzen, zum Beispiel in einer Szene, die auf einem Schiff spielt oder im Gebirge.

', 'https://improwiki.com/de/wiki/improtheater/szene_auf_zwei_stockwerken', '2020-11-14 07:44:20.051', 145);
INSERT INTO public.part VALUES (146, 1, '2020-12-02 22:04:01.020583', '2020-12-02 22:04:01.020583', 'Das Ding', '**Das Ding** ist ein Spiel, um einen Mitspieler zur Schadenfreude der Zuschauer zu ärgern.

Es wird eine beliebige Szene mit mindestens zwei Schauspielern gespielt. Ein Schauspieler mimt in der Szene alle Gegenstände, die genannt werden. Die anderen Spieler können den _menschlichen Gegenstand_ zur Belustigung der Zuschauer durch die Szene jagen, indem sie die benutzten Gegenstände in schneller Abfolge wechseln.

_Beispiel_ mit der Gruppe Clinclowns http://de.youtube.com/watch?v=crs6uc9w0o4

Ähnlich Lebendige Szenerie', 'https://improwiki.com/de/wiki/improtheater/das_ding', '2020-11-14 07:44:20.085', 146);
INSERT INTO public.part VALUES (147, 1, '2020-12-02 22:04:01.176181', '2020-12-02 22:04:01.176181', 'Gebärdendolmetscher', 'In der Szene wird eine beliebige Interviewsituation dargestellt, beispielsweise wird ein Experte zu einem bestimmten Thema befragt. Das Besondere ist, dass ein dritter Spieler das Erzählte für Gehörlose "übersetzt" und die entsprechenden passenden Gesten, Gesichtsausdrücke und Bewegungen macht.

Das Spiel steht und fällt mit dem Körpereinsatz und Einfallsreichtum des Gebärdendolmetscher, der im Wesentlichen den Fokus hat.

## Tipps und Hinweise

*   Der Gebärdendolmetscher schaut _immer_ Richtung Zuschauer
*   er wirkt ernst und konzentriert
*   gleiche Begriffe - gleiche Gebärden
*   die Sprecher sollten bestimmte witzig dargestellte Begriffe immer wieder verwenden, das kommt gut an beim Publikum, z.B. auch Begriffe, bei deren Darstellung sich der Gebärdendolmetscher quälen/anstrengen muss (z.B. "Fallen")
*   Konzentration auf die Begriffe, nicht auf die Zusammenhänge
*   möglichst keine Gebärdenpausen machen
*   wenn es multitaskingmäßig geht, zusätzlich die Begriffe mit dem Mund stumm und überdeutlich artikulieren

', 'https://improwiki.com/de/wiki/improtheater/gebaerdendolmetscher', '2020-11-14 07:44:20.127', 147);
INSERT INTO public.part VALUES (190, 1, '2020-12-02 22:04:07.597618', '2020-12-02 22:04:07.597618', 'Double Speech', 'Ein Spieler synchronisiert alle anderen Spieler und spricht auch sich selbst. Dieses Spiel kann im Grunde mit beliebig vielen Spielern gespielt werden. In der Praxis spielt man aber nur mit 3 bis 4 Spielern.

**Video Double Speech:**  
Double Speech: Fahrlerher(Die Impronauten aus Basel) www.impronauten.ch', 'https://improwiki.com/de/spiele/double_speech', '2020-11-14 07:44:21.556', 190);
INSERT INTO public.part VALUES (149, 1, '2020-12-02 22:04:01.500665', '2020-12-02 22:04:01.500665', 'Switch, Swop, Change', 'Für dieses Spiel benötigt man 4 Spieler, die zusammen 2 Personen darstellen. So bilden jeweils die Spieler A-B und C-D ein Team. B ist der Auswechselspieler von A und D ist der Auswechselspieler von C. Als Vorgabe dienen Berufe oder ein Ort. B und D positionieren sich am Bühnenrand. Nun beginnen A und C eine normal Szenen zu spielen, bis einer der folgenden Begriffe von den Spielern oder Auswechselspielern gerufen wird:

\- Switch: Der Spieler und der Auswechselspieler tauschen. D.h. B übernimmt die Rolle von A. A stellt sich an den Bühnenrand.  
\- Swop: Beide Paare tauschen mit ihrem jeweiligen Auswechselspieler. Sind zum Beispiel B und C auf der Bühne, so tauscht B mit A und C tauscht mit D.  
\- Change: Die beiden Spieler auf der Bühne tauschen ihre ROLLEN. War bisher B eine alte Oma und C ein fieser Türsteher, so ist nun B der Türsteher und C die Oma. Der Rollentausch bleibt solange erhalten bis wieder jemand "Change" ruft. "Swop" und "Switch" ändern, somit nichts am Rollentausch und theoretisch kann jeder der 4 Spieler jede Rolle einnehmen.  
  

Das Spiel klingt zunächst recht kompliziert, bringt aber durch schnelle Wechsel viel Action und Witz in die Szene.  
  

## Tipps und Hinweise

*   Die Teams bleiben immer erhalten. C kann und ist also zu keinem Zeitpunkt der Auswechselspieler von A.
*   Die Rollen sollten markant sein, damit es den Spielern leicht fällt Eigenschaften und Verhaltensweisen schnell zu übernehmen, sonst kann es schnell passieren, dass sich die beiden Rollen immer ähnlicher werden.  
    
*   Wechsel zu beginn langsam durchführen, damit Personen und Orte etabliert werden können.  
    
*   Etwas Schlimmes (z.B. eine Enttäuschung "Neeeeeeeiiiiinnnnn!") jeden der Spieler einmal schnell durchleben zu lassen, bringt sehr viel Witz. Ebenso lassen sich tolle "Selbstgespräche" durch wiederholendes "Change" rufen, führen. ;)', 'https://improwiki.com/de/wiki/improtheater/switch_swop_change', '2020-11-14 07:44:20.169', 149);
INSERT INTO public.part VALUES (150, 1, '2020-12-02 22:04:01.640912', '2020-12-02 22:04:01.640912', 'Weiße Mäuse', 'Zwei Spieler spielen eine "pseudo-ernste" Szene. Immer, wenn einer der beiden lachen muss, _oder wenn jemand im Publikum lacht (!)_, bekommt er vom bereitstehenden Schiedsrichter eine "weiße Maus" (diese süßen, Marshmallow-ähnlichen Schaumzuckerdinger) in den Mund gesteckt.

(Dass dabei eine lustige Szene entsteht, ist klar... Mit der Zeit werden die Münder immer voller und das Sprechen fällt schwerer...)

**Tipp:** Hinter dem Bühnenvorhang einen Eimer o.ä. zum Ausspucken bereithalten. Im Szenenapplaus mit dem überfüllten Mund kurz ab- und mit leerem Mund wieder auftreten.', 'https://improwiki.com/de/spiele/weisse-maeuse', '2020-11-14 07:44:20.17', 150);
INSERT INTO public.part VALUES (151, 1, '2020-12-02 22:04:01.773708', '2020-12-02 22:04:01.773708', 'Reiz und Reaktion', 'Jeder Spieler bekommt eine Reaktion zugeteilt, die er auszuüben hat, wenn ein anderer Spieler den Reiz dafür gibt.

## Beispiel

Spieler A muss auf einem Bein hüpfen,wenn Spieler B sich die Nase kratzt. Spieler B muss hinfallen, wenn Spieler C lacht, usw. Dabei müssen die Spieler selber herausfinden, welche Reaktion sie bei den anderen bei welchem Reiz auslösen. Am Anfang weiß jeder nur, welche Reaktion er selbst auf den Reiz eines anderen hin ausübt.', 'https://improwiki.com/de/wiki/improtheater/reiz_und_reaktion', '2020-11-14 07:44:20.213', 151);
INSERT INTO public.part VALUES (152, 1, '2020-12-02 22:04:01.929755', '2020-12-02 22:04:01.929755', 'Alltagsolympiade', 'Das Publikum wird nach einer Alltagstätigkeit gefragt oder nach einer Sportart, die es noch nicht gibt (z.B. Zwiebelnschneiden-WM, Den-Tisch-decken-Wettkampf, Die Meisterschaft im Sich-mit-allen-Wassern-Waschen usw.).

Auf der Bühne kämpfen nun zwei Darsteller in Zeitlupe um den Sieg in dieser Disziplin. Am Rande der Bühne sitzen zwei Sportreporter und kommentieren die Ereignisse - oder ein Sportreporter und ein Experte. Fouls und unfaire Mittel, welche zum Sieg führen, sind erlaubt. Am Ende gibt es meistens einen Sieger, weil der Gegner durch unlautere Mittel aus dem Rennen geworfen wurde. In den seltensten Fällen versöhnen sich die Gegner.

**Tipps und Hinweise**

*   Wichtig: Der Reiz des Spiels steht und fällt mit dem konsequenten Durchhalten des Zeitlupentempos! Am besten so langsam wie möglich und niemals schneller werden.
*   Es empfiehlt sich, vor dem eigentlichen Wettkampf eine (kommentierte) Aufwärmphase der Spieler durchzuführen - natürlich auch in Zeitlupe!
*   Die Sportreporter können abwechslungsreich kommentieren, indem sie aufgeregt auf einen Höhepunkt des Spiels hinsteuern, vielleicht auch gerade dann, wenn es überhaupt nicht danach aussieht. Dann können sie zwischendurch die Eigenheiten und eventuelle "Regeln" des Spiels erklären. Abgewechselt von Hintergrundinformationen über die Figuren oder nebensächliche Dinge ("Spieler A trägt heute wieder sein rotes T-Shirt von H&M für 4,95 und setzt damit ein klares Zeichen!"). Sie können sich mit dem Experten/anderen Reporter abwechseln: "Ich glaube Spieler A hat sich mit der Bewegung keinen Gefallen getan, Was denkst du, Paul?"). Und dann natürlich auch schweigende Pausen einbauen.

Beispiel mit _Theater im Biss_: http://de.youtube.com/watch?v=pmnWKvAp2u4

', 'https://improwiki.com/de/wiki/improtheater/alltagsolympiade', '2020-11-14 07:44:20.318', 152);
INSERT INTO public.part VALUES (153, 1, '2020-12-02 22:04:02.095006', '2020-12-02 22:04:02.095006', 'Neue Wahl', 'Das Spiel ist für zwei Spieler und einen spielleitenden "Rufer". Die Spieler spielen eine freie Szene, solange bis der "Rufer" sagt: "Neue Wahl". Der Spieler, der zuletzt etwas gesagt hat, muss seinen letzten Satz durch einen neuen Satz ersetzen. Die zuletzt gesagten Worte haben keine Bedeutung mehr und werden als nicht existent behandelt und werden komplett aus dem Gedächnis der Szene gestrichen.

Ein kleines Beispiel:

*   Hans: Guten Tag, wie geht es dir?
*   Peter: Ganz gut, ich habe einen neuen Job.
*   Rufer: Neue Wahl!
*   Peter: Schlecht, seit drei Tagen Kopfschmerzen.
*   Rufer: Neue Wahl!
*   Peter: Ausgezeichnet. Ich habe gleich ein Date.
*   Rufer: Neue Wahl!
*   Peter: Mein Hund ist tot.
*   Rufer: Neue Wahl!
*   Peter: Gut, ich bin auf den Weg in den Urlaub.
*   Hans: Wohin geht es denn?
*   Peter: Nach Italien.
*   Rufer: Neue Wahl!
*   Peter: Nach Alaska.
*   Rufer: Neue Wahl!
*   Peter: Nach Schweden.
*   Rufer: Neue Wahl!
*   Peter: Ins Schweigekloster.
*   Hans: Oh. Warum das denn?
*   Peter: Weil ich Burn-Out habe.
*   Rufer: Neue Wahl!
*   Peter: Weil ich zum Christentum konvertiert bin.

usw.

Gute Spieler schaffen es die Geschichte voranzutreiben, Anfänger produzieren oft nur Trivialitäten und erfüllen zwar die Regel und wählen eine neue Aktion, eine neue Antwort, bringen aber nicht die Szene voran.

Peter wendet in dem Beispiel zwei Strategien an. Zum einen nennt er einfach das Gegenteil des vorher Gesagten (Ganz gut, .../ Schlecht ...), zum anderen wiederholt er einfach den Anfang des ersten Satzes nochmal und ersetzt nur das Ende durch ein neues Wort. Das kann man machen und es ist nichts Verwerfliches dabei, allerdings verliert man so die Möglichkeit etwas wirklich Neues und Überraschendes in die Szene einzubringen (nach Italien / nach Alaska / nach Schweden).

Oft setzen sich die Spieler dem Druck aus etwas Intelligentes oder Originelles sagen zu müssen. Das ist aber gar nicht nötig. Die Aufgabe des Rufers ist es auch, die Dinge, die wirklich unsinnig sind, auszusortieren und "Neue Wahl" zu rufen, bis etwas erscheint, mit dem man gut arbeiten kann.

Das Spiel sieht auf den ersten Blick sehr einfach aus, aber jeder weiß, dass es nach einer bestimmten Anzahl von neuen Wahlen schwierig wird, Alternativen anzubieten. Die Aufgabe des Rufers ist es auch, den Spieler an seine Grenzen zu bringen.

Das Publikum möchte sehen, dass der Spieler schwitzt und an seine Grenzen gehen muss. Aber es möchte auch niemanden leiden sehen. Ungeübte Spieler sollten also auch nicht allzusehr geröstet werden, denn die Zuschauer wollen niemanden sehen, der sich auf der Bühne unwohl fühlt.

Ein guter "Rufer" weiß daher, wie weit er gehen kann und weit er aber auch gehen sollte.

Oft hört man Dialoge wie diesen:

*   Peter: "Ich hätte gerne drei Brötchen."
*   Rufer: "Neue Wahl!"
*   Peter: "Ich hätte gerne eine Luftpumpe."
*   Rufer: "Neue Wahl!"
*   Peter: "Ich hätte gerne ein Ballkleid."
*   Hans: "Welche Größe haben Sie denn?"

Der Rufer bricht hier viel zu früh ab. Der Spieler hat einfach immer nur das letzte Wort ersetzt und nicht wirklich unterschiedliche Angebote gemacht. Gute Spieler können die ersten Wahlen quasi reflexartig anbieten. So ist zwar die Regel des Spieles erfüllt, aber weder der Spieler hat für sich das Beste herausgeholt (sich selbst zu überraschen), noch hat das Publikum seinen Spaß, da das Spiel nur routiniert heruntergespielt wird. Im obigen Beispiel hätte der "Rufer" noch einige Male mehr unterbrechen können.

Die Spieler sollten auch darauf achten, dass sie dem Rufer genug Gelegenheiten zum Unterbrechen bieten. Das Schlimmste, was passieren kann, ist, dass die Spieler in eine Unterhaltung verfallen, über sich reden, keine Pausen lassen.

Es sollten genug Pausen angeboten werden (diese können sehr kurz sein, aber sie sollten da sein).

Wie bei jeder Szene ist es hilfreich, dem "Rufer" Aktionen anzubieten. Eine neue Wahl muss sich nicht nur auf gesprochenes Wort beziehen. Der Rufer kann auch bitten eine Aktion auf eine andere Art und Weise auszuführen. Beispiel: Betritt ein Spieler einen Raum und öffnet eine imaginäre Zimmertür durch das Herabdrücken einer Klinke, so kann der "Rufer" sagen:

*   R: "Komm anders rein!".
*   Der Spieler öffnet die Tür nun ganz, ganz vorsichtig.
*   R: "Neue Wahl"
*   Der Spieler geht durch eine Schwingtür.
*   R: "Neue Wahl"
*   Der Spieler tritt die Tür mit dem Fuss auf mit gezogener Waffe in der Hand.
*   R: "Neue Wahl"
*   Der Spieler öffnet die Tür mit einer Fernbedienung.

Das Spiel ist auch gut als Übung geeignet, um Angebote machen zu trainieren.

Siehe auch: Neue Wahl - Basisinformationen

', 'https://improwiki.com/de/wiki/improtheater/neue_wahl', '2020-11-14 07:44:20.475', 153);
INSERT INTO public.part VALUES (154, 1, '2020-12-02 22:04:02.238457', '2020-12-02 22:04:02.238457', 'Peinliche Situationen', 'PEINLICHE SITUATIONEN (wer hat noch mehr/andere spielbare???)

Du hast bei Deinem Freund, deiner Freundin übernachtet, der/die bei seinen/ihren Eltern wohnt. Die Familie ist schon ganz gespannt und freut sich, Dich kennenzulernen. Die Nacht war voller Heimlichtuerei, aber toll. Morgens duschst Du, aber die Tür lässt sich nicht abschließen. Die Eltern sind Alt-68’er Hippies wie die ‘Fockers‘, die keinerlei körperliche Berüh-rungsängste kennen. Also können alle gleichzeitig duschen, Zähne putzen, auf die Toilette gehen, sich waschen, Frühstücken im Bad ???…. etc. Vielleicht ist die Familie noch größer – Geschwister, Großeltern, Onkel, Tanten, Nachbarn, … etc. kommen ins Bad??? Wie endet die Szene?

Du bist mit Freunden shoppen. Im Schlussverkauf gibt es „das geile Teil“ (Shirt, Cap, Jeans, etc. …), das der Freund/die Freundin unbedingt haben muss, noch genau einmal. Letz-te Gelegenheit: Jetzt oder nie! Der Freund / die Freundin hat leider massiv zu wenig Geld aber Du hast eine Karte (eigene, von den Eltern ???) dabei. Mit großer Geste erklärst Du Dich bereit, zu zahlen. Peinlich, peinlich: die Karte ist gesperrt und wird eingezogen! Wie endet die Szene?

Ihr seid in der Schule. Es ist Pause - und Ihr steht mit Euren Freunden zusammen. Da kommt Eure Mutter in die Schule, um Euch Euer Pausenbrot zu bringen, das Ihr morgens ver-gessen habt oder um Euch daran zu erinnern, dass Ihr am Nachmittag direkt zur Nachhilfe gehen sollt. Mutter ist sehr peinlich angezogen und geschminkt und tut so, als wäre sie Anfang 20. Außerdem macht sie dem Jungen, für den Ihr Euch interessiert schöne Augen und flirtet mit ihm – mit Eurem Lehrer übrigens auch. WAS TUT IHR ???

Du/Ihr sitzt im Bus. Fahrkartenkontrolle! Einer ist (oder mehrere oder alle sind) Schwarzfah-rer. Was tun? Wie verhalten sich die Nicht-Schwarzfahrer? Wie kann man den Kontrolleur überzeugen – überreden, bestechen, verführen –, kein Bußgeld zu kassieren? Wie endet die Szene?

Ihr seid auf Klassenfahrt Für eine Woche seid Ihr im Landheim an der Küste. Mit Euch hält sich dort noch eine 9te Klasse auf mit doofen, arroganten Mädchen aber mit sehr süßen Jungs. Um sich näher kennen zu lernen, organisiert Ihr selbst alle zusammen eine Party – Ihr bastelt die Deko, besorgt Getränke, organisiert eine kräftige Anlage und sucht Eure Lieblingsmusik aus. Während Ihr feiert und tanzt kommen Eure Lehrer (die sich auch näher gekommen sind) und tanzen mit – leider denken sie, dass sie viel freier, interessanter und cooler tanzen können als Ihr – wie peinlich! Entweder, Ihr geht alle zusammen und lasst die Lehrer alleine tanzen (aber wohin?) oder Ihr bringt Sie irgendwie dazu, Euch in Ruhe zu lassen. Was könnt Ihr tun?

Eure Eltern sind nicht zuhause - (bei der Arbeit, bei Bekannten, beim Einkaufen, etc.). Ihr müsst deswegen auf Eure jüngeren Geschwister und/oder Cousins/Cousinen aufpassen. Um etwas mit ihnen zu unternehmen habt ihr 50.-€ bekommen und könnt damit in den Zoo oder zu McDonalds oder ins Kino (… etc.) mit ihnen gehen. Plötzlich kommt Eure Schulleiterin mit ihren Kindern dazu und setzt sich ausgerechnet auf den einzigen freien Platz – neben Euch! Das Problem ist: ausgerechnet an diesem Morgen wart ihr nicht in der Schule WAS TUT IHR ???

Ihr seid eine Fee - und geht mit dem Prinzen (der Prinzessin) spazieren, der kleine Drache fliegt um Euch herum und alle haben Spaß. Plötzlich wird es dunkel und laut und es riecht nach verbranntem Laub. Die Drachenfamilie kommt, um ihren Kleinen zu holen, aber der hat ge-nauso viel Angst wie ihr. Ihr versteckt Euch irgendwo, so dass die Drachen Euch nicht finden können. Nur durch den Zauber der Hexe Ypsilon könnt Ihr Euch retten, doch die ist schwer zu erreichen. WAS TUT IHR ???

Du hast Geburtstag. Du bist mit deinen Freunden (deiner Familie) zusammen. Es klingelt an der Tür. Draußen stehen 1000 Leute, die mit Dir feiern wollen. Du hast aus Versehen bei fb den „öffentlich“-Button nicht weggeklickt! Teilt Euch auf: einige sind echte Freunde, einige ‚nur‘ Klassenkameraden, einige sind schon besoffen, einige verliebt, …. (unendliche Variationen). Was sagen Deine Freunde, Deine Familie? Wie endet die Szene?', 'https://improwiki.com/de/wiki/improtheater/peinliche_situationen', '2020-11-14 07:44:20.414', 154);
INSERT INTO public.part VALUES (155, 1, '2020-12-02 22:04:02.376839', '2020-12-02 22:04:02.376839', 'Theatertod', 'Ein **Theatertod** wird zu verschiedenen Anlässen inszeniert. Meist geschieht das, wenn ein Spieler eine Vorgabe nicht eingehalten hat (z.B. bei drei Gegenständen, welche eingebaut werden sollten, eine vergessen hat), oder eine Spielregel verletzt hat.

Beim Theatertod hat der Spieler (in einer Soloszene) eine Minute Zeit, pantomimisch an einem Gegenstand zu sterben, welcher vom Publikum vorgeben wird.

', 'https://improwiki.com/de/spiele/theatertod', '2020-11-14 07:44:20.282', 155);
INSERT INTO public.part VALUES (156, 1, '2020-12-02 22:04:02.562387', '2020-12-02 22:04:02.562387', 'Zielstandbild', 'An diesem Spiel sind zwei oder drei Spieler beteiligt.

Zu Beginn des Spiels wird ein Zuschauer auf die Bühne gebeten, der die zwei oder drei Spieler "verbauen" soll. Das heißt, er gibt ihnen unterschiedliche Körperhaltungen, Kopfhaltungen, Gestiken usw. Die Spieler frieren in ihrer Figur kurz ein und versuchen sie sich möglichst genau zu merken.

Denn nun nehmen sie ihre normale entspannte Körperhaltung ein. Es wird eine Vorgabe erfragt und sie beginnen zu spielen. Ihre Aufgabe ist es, das Spiel so zu entwickeln, dass es mit den gemerkten Körperhaltungen endet. D.h. zum Schluss frieren die Spieler in der gemeinsam eingenommen Figur ein, die der Zuschauer vorgegeben hatte. Das Schwierige ist, dass sich diese Schlussfigur wie selbstverständlich aus der gespielten Szene ergeben haben muss.', 'https://improwiki.com/de/wiki/improtheater/zielstandbild', '2020-11-14 07:44:20.417', 156);
INSERT INTO public.part VALUES (157, 1, '2020-12-02 22:04:02.736461', '2020-12-02 22:04:02.736461', 'Sagte sie/er nicht', '## Ablauf

_Sagte sie/er nicht_ ist ein einfaches Spiel, bei dem der Spielleiter nach einer prägnanten Behauptung eines der Spieler mit der Bemerkung "sagte er (bzw. sie) nicht!" kurz unterbricht. Daraufhin hat der betreffende Spieler ein neues Angebot zu machen und die "alte" Behauptung gilt in der weiterlaufenden Szene als nicht gesprochen. Dies geschieht in der laufenden Szene mehrere Male.

## Hinweise

*   Das Spiel ist ein naheliegendes Korrekturspiel und/oder zeigt den Spielern selbst die vielfältigen Möglichkeiten des Behauptens auf.
*   die Spieler sollen möglichst viele Behauptungen aufstellen
*   die Spieler sollen möglichst gegensätzliche Alternativbehauptungen aufstellen.
*   in derselben Spielsituation kann mehrfach hintereinander "sagte er (bzw. sie) nicht!" gesagt werden, bis der Spielleiter "zufrieden" ist.

', 'https://improwiki.com/de/wiki/improtheater/sagte_sie_er_nicht', '2020-11-14 07:44:20.414', 157);
INSERT INTO public.part VALUES (191, 1, '2020-12-02 22:04:07.710028', '2020-12-02 22:04:07.710028', 'Zweier-Synchro', 'Zwei Darsteller spielen auf der Bühne eine Szene und werden von zwei anderen Spielern neben der Bühne synchronisiert. Die Darsteller machen die passenden Mundbewegungen.

**Varianten:**

*   Blind Synchro
*   Wechsel-Zweier-Synchro

', 'https://improwiki.com/de/spiele/zweier-synchro', '2020-11-14 07:44:21.602', 191);
INSERT INTO public.part VALUES (158, 1, '2020-12-02 22:04:02.932102', '2020-12-02 22:04:02.932102', 'Die Erfindung von ...', 'Der Spielleiter fragt die Zuschauer nach einem beliebigen Alltagsgegenstand.

Die beiden Spieler fangen nun eine beliebige Szene an - gegebenenfalls noch mit einer Vorgabe wie Beziehung, Ort usw. - und stellen dar, wie dieser Gegenstand erfunden wurde.

Natürlich geht es nicht darum zu erraten, wie dieser Gegenstand _wirklich_ erfunden wurde, sondern die Spieler entwickeln im Laufe ihres Spiels eine mehr oder wenige phantasievolle/phantastische Idee, am Anfang habe sie natürlich nicht den Schimmer einer Ahnung..

Man kann auch einen aus dem Publikum gereichten Gegenstand nehmen, auch im Rahmen einer Show Bring dein Ding.', 'https://improwiki.com/de/wiki/improtheater/die_erfindung_von', '2020-11-14 07:44:20.538', 158);
INSERT INTO public.part VALUES (159, 1, '2020-12-02 22:04:03.084053', '2020-12-02 22:04:03.084053', 'Der gute, der schlechte und der furchtbare Rat', 'Bekannt unter dem englischen Namen: The Good, the Bad, and the Ugly. Das Publikum wird nach einem Problem oder einer Fragestellung gefragt, für das die Zuschauer gerne einen Ratschlag oder eine Auskunft hätten. 3 Spieler gehen nun auf die Bühne und geben jeweils einen Rat. Einer gibt einen guten Rat (der sollte auch tatsächlich gut sein), der zweite gibt einen schlechten Rat und der dritte einen ganz furchtbaren Rat (noch schlimmer als der schlechte Rat). Nachdem die Ratschläge gegeben wurden, kommen nun Spieler auf die Bühne und spielen kurz den jeweiligen Rat in kurzen Szenen mit 3-6 Sätzen an. Dann verlassen sie schnell wieder die Bühne und die 3 Spieler geben neue Ratschläge zu einem neuen Problem.

Das Spiel kann dann an einem Höhepunkt (in einer Szene zum Beispiel) beendet werden.', 'https://improwiki.com/de/wiki/improtheater/der_gute_der_schlechte_und_der_furchtbare_rat', '2020-11-14 07:44:20.514', 159);
INSERT INTO public.part VALUES (160, 1, '2020-12-02 22:04:03.249913', '2020-12-02 22:04:03.249913', 'Wo ist Thomas?', 'Ein Spiel für mehrere Personen, das man als kurze Form, aber auch mit mehr Story drumherum als längere Form aufführen könnte.

Alle Szenen handeln davon, dass eine Person gesucht wird. Der Moderator fragt die Zuschauer zum Anfang nach dem Namen dieser Person (z.B. Thomas).

Danach beginnt die erste Szene damit, dass eine Figur Thomas sucht und dabei auf andere Figuren trifft. In der ersten Szene stellt sich oft schon heraus, wieso die Person ihn sucht (z.B. Rache, schuldet ihm Geld, möchte ihm ein Geständnis machen, möchte ihn einfach wiedersehen usw.). Alle Szenen werden so gespielt, dass die Figur von den anderen Spielern Hinweise bekommt, wo sich Thomas aufhalten könnte ("Ich glaube, ich habe ihn gesehen, vorhin in diesem einen Cafe. Er traf sich da mit einer Frau."). Die Person folgt dann diesen Hinweisen, in der Hoffnung Thomas endlich zu finden.

Nach und nach zeichnet sich (auch in den Köpfen der Zuschauer) ein Bild von der Figur von Thomas und seinem Leben.

Thomas taucht aber letztendlich nie auf und wird niemals gefunden.

### Ideen

Um die Suche nach Thomas herum können weitere Handlungsstränge angespielt werden. Man könnte zum Beispiel mehr über die Figuren erfahren, die Thomas Hinweise geben. Das Ganze kann in eine viel größere Geschichte eingebettet sein. Oder man könnte noch mehr über die Vergangenheit und Anekdoten von Thomas erfahren (Rückblenden, Erzählungen und Geschichten der Figuren u.ä.). Theoretisch kann man soviel Story dazu improvisieren wie man möchte. Dabei kann man dann aber letztendlich immer wieder auf die Suche nach Thomas zurückkommen, die sich wie ein roter Faden durch die ganze Geschichte zieht und der Story und den Spielern Orientierung gibt.

### Tipps und Hinweise

*   Zusätzlich zum Namen sollte man sich eine weitere Vorgabe geben lassen, z.B. das Alter der gesuchten Person.
*   Die "interne" Frage, die die Spieler beantworten, sollte lauten: Warum ist Thomas verschwunden?
*   Schwierig kann es werden, ein passendes, befriedigendes Ende der Geschichte zu finden.', 'https://improwiki.com/de/wiki/improtheater/wo_ist_thomas', '2020-11-14 07:44:20.595', 160);
INSERT INTO public.part VALUES (161, 1, '2020-12-02 22:04:03.394951', '2020-12-02 22:04:03.394951', 'Rollback', 'Eine Szene wird angespielt. Eine dritte Person (Spieler oder Moderator ) befindet sich am Bühnenrand und stoppt irgendwann. Nun wird zu einem markanten Ereignis aus der bisherigen Szene zurückgegangen. Von da aus wird die Geschichte nun anders erzählt. Das kann mehrfach geschehen. Wichtig ist, die Stopps verschieden schnell zu machen.

Variante: Die Spieler müssen (nur) entweder den letzten Satz oder die letzte Tätigkeit streichen und durch etwas Neues ersetzen.

', 'https://improwiki.com/de/wiki/improtheater/rollback', '2020-11-14 07:44:20.652', 161);
INSERT INTO public.part VALUES (162, 1, '2020-12-02 22:04:03.54551', '2020-12-02 22:04:03.54551', 'Drei Regeln', 'Der Moderator fragt drei personenbezogene Regeln ab, die die Spieler in der Szene beachten sollen. Zum Beispiel, dass sie nur einen Arm haben, kein Wort sprechen dürfen, das ein "s" enthält und verliebt sein sollen. Gegebenenfalls kann man auch gezielt abfragen: Also z.B. nach körperlicher Besonderheit – welchen Buchstaben weglassen (es empfiehlt sich, keine Vokale zu nehmen, also gleich nach Konsonanten zu fragen)? – welches Gefühl?', 'https://improwiki.com/de/wiki/improtheater/drei_regeln', '2020-11-14 07:44:20.739', 162);
INSERT INTO public.part VALUES (163, 1, '2020-12-02 22:04:03.662634', '2020-12-02 22:04:03.662634', 'Einer schweigt', 'An diesem Spiel sind drei Spieler beteiligt. Besonderheit ist, dass einer der drei während der ganzen Szene kein Wort sagen darf. Ansonsten ist dem Schweigenden alles andere erlaubt: Bewegen, Handeln, Emotionen zeigen. Die zwei anderen spielen eine normale Szene. Wichtig ist, dass alle drei von vornherein eine Gruppe bilden, dass sie etwas verbindet: 3 Arbeitskollegen, 3 sich kennende Mitglieder einer Fitnessclubs z.B.', 'https://improwiki.com/de/wiki/improtheater/einer_schweigt', '2020-11-14 07:44:20.613', 163);
INSERT INTO public.part VALUES (164, 1, '2020-12-02 22:04:03.792696', '2020-12-02 22:04:03.792696', 'Sprechende Tiere', 'Die Spieler holen sich als Vorgabe eine Tierart vom Publikum. Dann spielen sie eine Szene, bei der beide diese Tierart verkörpern. (Zum Beispiel Mutter und Sohn Hummel.)

Die Tiere können sprechen und sind auch sonst recht anthropomorph (zum Beispiel geht das Kind vielleicht auf die Hummelschule, die Mutter benutzt Antifaltencreme für ihre zerknitterten Flügel oder ähnliches). Sie haben aber auch die typischen Vorlieben und Lebenssorgen ihrer Tierart.', 'https://improwiki.com/de/wiki/improtheater/sprechende_tiere', '2020-11-14 07:44:20.561', 164);
INSERT INTO public.part VALUES (165, 1, '2020-12-02 22:04:03.932216', '2020-12-02 22:04:03.932216', 'Sagte er', 'Eine "Schizo-Übung" (bzw. ein synchro-verwandtes Spiel) für zwei Spieler. Die Regeln bestimmen, dass jeder Spieler zwar frei reden, aber nicht frei handeln kann. Jeder bestimmt dafür die körperlichen Handlungen des jeweils anderen Spielers.

Dies geht dadurch, dass B nach jeder wörtlichen Rede von A für einen Satz "zum Erzähler wird" und den Zuschauern sagt, was der andere "bei diesen Worten tat". Dieser tut das Gesagte dann sofort.

Beispiel:

*   A: "Einen wunderschönen guten Morgen!"
*   B: ", sagte er und verbeugte sich höflich."
*   (A verbeugt sich)
*   B: "Wo bleibt mein Kaffee?"
*   A: ", fragte sie ihn ungehalten und machte ein versäuertes Gesicht."
*   (B macht eine saure Miene)
*   A: "Oh je, der Kaffee..."
*   B: ", fiel es dem Butler wieder ein und er schlug die Hände zusammen, wobei er eine Vase umstieß."
*   (A schlägt die Hände zusammen und stößt dabei eine Vase um)
*   B: "Ja, ist er denn von Sinnen!?"
*   A: ", tobte die Herzogin erzürnt und raufte sich das Haar." (usw.)

## Tipps

**Tipp 1:** Die Handlungsanweisungen schön (voll) körperlich ausspielen.

**Tipp 2:** Es sollte zum einen Wert auf ein gewisses Tempo gelegt werden, zum anderen sollte die Aktion, die man dem anderen Spieler mit auf den Weg gibt groß sein. Aussagen wie: "Sagte er und guckte komisch" sollten möglichst vermieden werden, da sie das Spiel nicht vorantreiben.

## Hinweise

Witzig wird es für die Zuschauer, wenn die Spieler ihre spezielle Macht, die sie bei diesem Spiel über einander haben, zu ihrem eigenen Vorteil ausnutzen und dem anderen frecherweise Handlungsanweisungen geben, die zwar dessen Worten nicht direkt zuwiderlaufen, die dieser aber dabei wohl nicht gedacht hätte. Lustig wird es aber auch, wenn die Spieler sich bei den Regieanweisungen für den anderen selbst in eine missliche Situation manövrieren.

Diese Übung ist umgekehrt und deshalb etwas schwieriger als die meisten anderen Regiespiele, in denen vom Autor/Regisseur zuerst die Handlung beschrieben wird (die die Spieler zeitgleich pantomimisch ausführen) und die Figuren erst aus der bereits etablierten Handlung heraus die Aufforderung zum Sprechen bekommen (Erzähler: "Darauf erhob sie in einer wilden Geste drohend ihren Zeigefinger und donnerte:"...). Hier gibt es dagegen nur zwei Spieler, die Rede kommt _vor_ der Handlung, und jeder spielt zugleich sich selbst und den Erzähler (und dadurch auch quasi den anderen) - eine besondere Herausforderung!

Als Spiel vor Publikum ist die Übung eher weniger geeignet.

**Sinn der Übung**: Reden von Handlung trennen, nicht nur sich selbst, sondern auch die andere Person im Geiste "mitspielen", Regieanweisungen geben und nehmen.', 'https://improwiki.com/de/wiki/improtheater/sagte_er', '2020-11-14 07:44:20.716', 165);
INSERT INTO public.part VALUES (166, 1, '2020-12-02 22:04:04.069597', '2020-12-02 22:04:04.069597', 'Prequel - sequel', 'Es wird eine normale Szene gespielt. Danach hat das Publikum die Wahl: Soll in einer weiteren Szene die Vorgeschichte (Prequel) oder die Nachgeschichte (Sequel) in Bezug auf die gerade gespielten Szene gespielt werden?  
Gegebenfalls kann der Moderator nach dem Spielen der zweiten Szene noch eine dritte folgen lassen, dieses Mal (auch wieder) mit der Wahl "vor" oder "nach" der Szene, wobei "vor" oder "nach" sich nun auf die erste oder auf die zweite Szene beziehen kann. Letzteres sollte der Moderator nach dramaturgischen Gesichtspunkten entscheiden.

Siehe auch: Spokes', 'https://improwiki.com/de/wiki/improtheater/prequel_-_sequel', '2020-11-14 07:44:20.717', 166);
INSERT INTO public.part VALUES (167, 1, '2020-12-02 22:04:04.183492', '2020-12-02 22:04:04.183492', 'Tod in einer Minute', 'An diesem Spiel sind zwei Spieler beteiligt. Sie lassen sich eine beliebige Vorgabe. Sie spielen eine normale Szene. Aufgabe ist, dass einer von beiden innerhalb einer Minute sterben muss. Der Überlebende spielt Solo, bis der Moderator die Szene beendet.

## Anderes Spiel, gleicher Name

Außerdem gibt es ein Spiel unter dem gleichen Namen als Variante des Spiels Halbwertzeit:

Zwei Spieler beginnen eine Szene (evtl. mit Vorgaben des Publikums) bei der innerhalb einer Minute eine der beiden Figuren sterben muss. Nun wird die selbe Szene wiederholt, jedoch wird jetzt nur noch eine halbe Minute gespielt. Dann 15 Sekunden, 8, 4, 2, 1 Sekunden.', 'https://improwiki.com/de/spiele/tod_in_einer_minute', '2020-11-14 07:44:20.766', 167);
INSERT INTO public.part VALUES (168, 1, '2020-12-02 22:04:04.316774', '2020-12-02 22:04:04.316774', 'Letzter Satz', 'Im Vorfeld wird das Publikum nach einem Satz gefragt, welcher als Schlusssatz in die Szene eingebaut werden muss. Es folgt eine beliebige Szene, welche mit dem vorgegebenen Satz enden muss.

## Varianten

*   Zusätzlich wird das Publikum nach dem ersten Satz gefragt, also dem Satz, mit dem die Szene beginnen soll.
*   Das Publikum wird gefragt, ob jemand ein Buch dabei hat, und es wird der letzte (und der erste) Satz aus diesem Buch genommen.', 'https://improwiki.com/de/wiki/improtheater/letzter_satz', '2020-11-14 07:44:20.799', 168);
INSERT INTO public.part VALUES (169, 1, '2020-12-02 22:04:04.457533', '2020-12-02 22:04:04.457533', 'Fundus', 'Bei dieser Langform werden im Zuschauerraum diverse Gegenstände aus dem Theaterfundus (können auch Gegenstände aus dem eigenen Estrich, Keller, Brockenhaus = Second-Hand-Laden usw. sein) aufgestellt. Ca. 20 - 30 Gegenstände werden vom Publikum ausgesucht. Nun gilt es, die Geschichte dieser Gegenstände zu spielen bzw. eine Geschichte inspiriert vom Gegenstand entstehen zu lassen.

_Diese Langform wurde von den Impro-Leck-TuEllen im Mai 2010 uraufgeführt._

Siehe auch: Gefundene Gegenstände', 'https://improwiki.com/de/wiki/improtheater/fundus', '2020-11-14 07:44:20.846', 169);
INSERT INTO public.part VALUES (170, 1, '2020-12-02 22:04:04.605696', '2020-12-02 22:04:04.605696', 'Gefundene Gegenstände', 'In der Langform **Gefundene Gegenstände** (_found objects_) bringen die Spieler Gegenstände, die sie tagsüber gefunden haben, mit auf die Bühne. Es handelt sich zwar um ganz gewöhnliche Gegenstände, aber sie haben die Spieler am betreffenden Tag auf irgend eine Art und Weise berührt. Die erste Szene ist ganz konkret von diesen Gegenständen inspiriert, z.B. kann sie an dem Ort spielen, an dem der Gegenstand gefunden wurde. Der Gegenstand kann in seiner konkreten Funktion eine Rolle spielen oder auch in späteren Szenen in einer übertragenen Bedeutung.

', 'https://improwiki.com/de/wiki/improtheater/gefundene_gegenstaende', '2020-11-14 07:44:20.898', 170);
INSERT INTO public.part VALUES (171, 1, '2020-12-02 22:04:04.748144', '2020-12-02 22:04:04.748144', 'Bring dein Ding', 'Es wird nach Gegenständen gefragt, die das Publikum dabei hat. Einer der vorgeschlagenen Gegenstände wird auf die Bühne gegeben und bespielt, dh. die folgende Szene hat mehr oder weniger mit diesem konkreten Gegenstand des Zuschauers zu tun. Die Bezeichnung _Bring dein Ding_ oder auch _Ding Show_ bezieht sich aber eher auf abendfüllende oder Halbzeitformate. D.h. es werden mehrere aufeinanderfolgende, nicht zusammenhängende Szenen gespielt, die jeweils einen neuen Zuschauergegenstand betreffen. Es gibt mehrere Möglichkeiten, wie man nach der letzten "Ding-Szene" weiter verfährt. Man kann die Szenen einfach so "nebeneinander" stehen lassen (unbefriedend); denkbar sind mit den "Ding-Szenen" gegenständlich oder inhaltlich zusammenhängende Folgeszenen, z.B. kann man das Publikum abschließend abstimmen lassen, welche Szene (mit welchem Gegenstand) die beste war und dann die betreffende Geschichte weiter spielen. Eine andere Möglichkeit ist, mehrere Runden zu spielen, wobei in jeder Runde eine Geschichte per Abstimmung ausscheidet, ähnlich wie beim Spiel Superszene.

## Hinweise und Tipps

*   Man kann die Show öffentlich unter das Motto "Bring dein Ding" stellen und die Zuschauer bereits im Ankündigungstext auffordern, interessante und ungewöhnliche Gegenstände mitzubringen.
*   Um den Spielablauf nicht immer wieder zu lange zu unterbrechen, kann man bereits vor dem Beginn _aller_ Spiele die Gegenstände sammeln. Man lässt jedem Sachspender jeweils einen Umschlag zukommen, in diesen wird dann der Gegenstand gesteckt. Die so gefüllten Umschläge werden durch das Publikum nach vorn gereicht, dort aufbewahrt und vor jedem Spiel wird jeweils ein Umschlag geöffnet. So bleibt der Überraschungseffekt für die Spieler erhalten.
*   Denkbar ist auch, eine "Verkaufsshow" zu machen, in der der Gegenstand angepriesen wird. Oder aber man gibt vor, dass der Gegenstand alles sein kann, nur nicht das, was er ist (Entfremdete Gegenstände). Oder man kombiniert beides.
*   Eine abschließende Verknüpfung _aller_ ausgehändigten Gegenstände ist mit dem Spiel Rückwärtsgehen denkbar, wobei hier die Gegenstände bekannt sind, aber nicht die Reihenfolge bekannt ist, in der sie liegen. Denkbar z.B. als Zugabe.', 'https://improwiki.com/de/showformate/bring-dein-ding', '2020-11-14 07:44:20.991', 171);
INSERT INTO public.part VALUES (172, 1, '2020-12-02 22:04:05.16366', '2020-12-02 22:04:05.16366', 'Entfremdete Gegenstände', 'Das Publikum wird gebeten, den Spielern beliebige Gegenstände zu übergeben, die es bei sich hat.

Die Spieler müssen diese Gegenstände in ihre Szene einbauen, doch dürfen diese Gegenstände nicht ihrer eigentlichen Funktion entsprechend eingesetzt werden.

Beispiel: Ein Schlüsselbund steht für einen Hut, ein leeres Bierglas ist die Fernbedienung eines Fernsehers.

', 'https://improwiki.com/de/wiki/improtheater/entfremdete_gegenstaende', '2020-11-14 07:44:20.911', 172);
INSERT INTO public.part VALUES (173, 1, '2020-12-02 22:04:05.320581', '2020-12-02 22:04:05.320581', 'Klassischer Statuswechsel', 'Ein klassischer Statuswechsel wird von zwei Personen gespielt. Das Publikum gibt zum Beispiel einen Beruf vor. Der erste Darsteller hat einen sehr hohen Status, der zweite einen sehr niedrigen Status. Diesen gilt es nun in der Szene langsam zu kippen. Es ist eher Aufgabe der Person im Tiefstatus, das Statuskippen auszulösen. Allerdings kann die Person im Hochstatus durch ihr Spielen und Reden einen Auslöser anbieten. Wichtig ist es Geduld zu haben und abzuwarten, bis sich in der Szene eine Anlass/Grund für das Statuskippen ergibt.

Lustig kann es sein, wenn nicht die "üblichen" Statusverhältnisse herrschen, also z.B. zu Anfang der Angestellte und nicht sein Chef den Hochstatus hat.

**Variante**: Das Kippen geschieht zwar begründet, aber sehr schnell.', 'https://improwiki.com/de/wiki/improtheater/klassischer_statuswechsel', '2020-11-14 07:44:21.008', 173);
INSERT INTO public.part VALUES (192, 1, '2020-12-02 22:04:07.816244', '2020-12-02 22:04:07.816244', 'Dreier-Synchro', 'Jeder Spieler spielt seine eigene Figur mimisch, während ein anderer die Stimme übernimmt. Spieler A spricht Spieler B, Spieler B spricht Spieler C und Spieler C spricht Spieler A. Wenn Spieler A spricht muss Spieler B (der ja von A synchronisiert wird) seine Lippen dazu bewegen. Besonders witzig ist es, wenn ein Mann eine Frau mit hoher Stimme synchronisiert und umgekehrt.

Am Anfang der Szene kann man eine Sprechprobe machen, bei der sich die Spieler mit ihren jeweiligen Stimmen vorstellen.

_Hinweise_:  
Die Szene funktioniert nur dann, wenn wirklich immer daran gedacht wird, dass die Mundbewegungen zu machen sind.  
Kein einfaches Spiel, für Anfänger nicht geeignet. Erfordert viel Übung, Konzentration und Aufmerksamkeit.

Andere Bezeichnungen:

*   A spricht B spricht C (oder A singt B singt C)

', 'https://improwiki.com/de/spiele/dreier-synchro', '2020-11-14 07:44:21.589', 192);
INSERT INTO public.part VALUES (174, 1, '2020-12-02 22:04:05.503518', '2020-12-02 22:04:05.503518', 'Hackordnung', 'Eine Übung bzw. ein Spiel für drei Spieler. Die Spieler bilden eine Statuskette (A hat den höchsten Status, B den mittleren, C den tiefsten). Es gelten nun folgende Regeln:

*   A spricht nur mit B (stellt Fragen und erteilt Befehle)
*   B "reicht nur durch" (gibt die Fragen und Befehle an C weiter und gibt Antworten und Rückmeldungen von C an A zurück). B spielt dabei einen klassischen "Radfahrer" (oben buckeln, unten treten)
*   C ist einerseits der Depp, andererseits aber de Facto der Lenker der ganzen Szene. Er beantwortet die Fragen von B, führt die Befehle aus und gibt Rückmeldungen.

## Inhaltsverzeichnis

*   Varianten
    *   allgemein
    *   Die drei Ganoven
*   Siehe auch

## Varianten

### allgemein

*   Der Statusniedrigere wird mit einem Luftballon geschlagen.

### Die drei Ganoven

Auf diesen Basisregeln aufbauend, kann man z.B. eine lustige Szene mit folgenden Zusatzregeln spielen:

*   Die Spieler sind drei etwas minderbemittelte Ganoven, die eine Gaunertat ausführen wollen (z.B. eine Bank ausrauben) - was, kommt als Vorgabe vom Publikum.
*   Alle drei tragen einen Hut (Mütze, Kappe, o.ä.). Jeder hat die Angewohnheit, wenn er wütend wird, seinen Hut zu Boden zu schleudern und einen Tick auszuführen. Der Tick wird auch vom Publikum vorgegeben und kann auch etwas völlig Absurdes sein (z.B. ein Lied singen, bügeln...)
*   In diesem Tick-Zustand muss er so lange bleiben, bis ihm von seinem Nächst-Untergebenen der Hut wieder aufgesetzt wird.
*   C darf sich als einziger seinen Hut selbst wieder aufsetzen.

', 'https://improwiki.com/de/wiki/improtheater/hackordnung', '2020-11-14 07:44:21.077', 174);
INSERT INTO public.part VALUES (175, 1, '2020-12-02 22:04:05.630061', '2020-12-02 22:04:05.630061', 'Wechsel-Zweier-Synchro', 'An diesem Spiel sind vier Personen beteiligt. Jeweils zwei Darsteller spielen auf der Bühne eine Szene und werden von zwei anderen Spielern am Rande der Bühne synchronisiert. Wichtig ist, dass die Darsteller die passenden Mundbewegungen machen. Nach einem Klatschen eines der Spieler oder - Variante - des Moderators wechseln die Personen die Funktion, dh. die Synchronsprecher werden die (stummen) Spieler, die die Mundebewegungen machen, die bisherigen Spieler werden nun Synchronsprecher. Es beginnt nun eine völlig andere Szene! Nach einer gewissen Zeit wird wieder geklatscht, die Paare wechseln erneut und die erste Szene wird fortgesetzt. Bei erneutem Klatschen und Wechsel wird die zweite Szene fortgesetzt usw. Diese Wechsel geschehen einige Male.

Wichtig ist:

*   Die Szene steht und fällt mit den Mundbewegungen.
*   Die Wechsel sollten möglichst rasch erfolgen.

**siehe auch:**

*   Blind Synchro
*   Zweier-Synchro

Zurück zur Spieleliste', 'https://improwiki.com/de/spiele/wechsel-zweier-synchro', '2020-11-14 07:44:21.139', 175);
INSERT INTO public.part VALUES (176, 1, '2020-12-02 22:04:05.770319', '2020-12-02 22:04:05.770319', 'Farbwechsel', 'Dem Publikum werden drei Farben vorgegeben, z.B. rot, gelb und blau. Es soll nun zu diesen Farben Orte erfinden z.B Hölle, Wüste und Kühlhaus. Die Bühne wird nun in eines der vorgegebenen Lichter getaucht. Die Spieler etablieren nun bei gelbem Licht eine Szene in der Wüste, bei rotem Licht eine Szene in der Hölle und bei blauem Licht eine Szene im Kühlhaus. Die Beleuchtung auf der Bühne wird nun zwischen den drei Farben hin und her wechseln. Die Spieler reagieren, indem sie zwischen den einzelnen Spielorten wechseln, je nach vorgegebener Farbe.', 'https://improwiki.com/de/wiki/improtheater/farbwechsel', '2020-11-14 07:44:21.106', 176);
INSERT INTO public.part VALUES (177, 1, '2020-12-02 22:04:05.906549', '2020-12-02 22:04:05.906549', 'Potpourri', 'Eine beliebige Szene mit beliebiger Vorgabe wird gespielt. Das Besondere ist: Der Moderator unterbricht immer wieder und verlangt dann eine bestimmte Spielweise. Hier ist vieles denkbar, was es auch an Spielen gibt.

**Beispiel:**

Moderator: "Stopp! Und jetzt sehen wir die Szene weiter als Western!" (siehe Genrereplay)

Spielen als Western, dann:

Moderator: "Stopp! Und jetzt darf kein "s" in den Worten vorkommen."

Spielen und wie verlangt ohne "s" sprechen.

Moderator (zum Publikum): "Stopp! Wie geht''s weiter?"

Weiter spielen und den entsprechenden Vorschlag des Publikum umsetzen.

Moderator sagt "Stopp", wiederholt den letzten Satz und: "Das klingt nach einem Lied"!

usw.

In dieses Spiel kann man insbesondere auch die Spiele packen, die an diesem Abend nicht vorgekommen sind! Auch ist es möglich, ein anderes Spiel durch derartige Einwürfe "aufzupeppen".', 'https://improwiki.com/de/wiki/improtheater/potpourri', '2020-11-14 07:44:21.186', 177);
INSERT INTO public.part VALUES (178, 1, '2020-12-02 22:04:06.026082', '2020-12-02 22:04:06.026082', 'Rollentausch', 'Rollentausch ist ein Spiel für zwei oder drei Spieler. Die Spieler müssen auf Zuruf die Rollen untereinander tauschen. Spieler A nimmt die Position und den Charakter von Spieler B ein, Spieler B von Spieler C und C schließlich von A. Ein recht kompliziertes Spiel, welches hohe Aufmerksamkeit von Spielern und Publikum erfordert.', 'https://improwiki.com/de/wiki/improtheater/rollentausch', '2020-11-14 07:44:21.187', 178);
INSERT INTO public.part VALUES (179, 1, '2020-12-02 22:04:06.149615', '2020-12-02 22:04:06.149615', 'Bingo', 'Eine Szene mit 3 Personen wird gespielt.

Sobald während der Szene von den Darstellern eine Zahl ausgesprochen wird, wechseln sie die Positionen und spielen die Figur der Person weiter, deren Platz sie nun eingenommen haben. Das kann mitunter sehr hektisch zugehen, wenn die Darsteller mit Absicht viele Zahlen einflechten.

Beispiel:

A: Das ist doch schon 5 Monate her.

(Wechsel)

A - nun in der Rolle von B: Ich dachte, es waren nur 4.

(Wechsel)

C - in der Rolle von A: Wir haben das schon 1000 Mal besprochen.

(Wechsel)

...', 'https://improwiki.com/de/wiki/improtheater/bingo', '2020-11-14 07:44:21.264', 179);
INSERT INTO public.part VALUES (180, 1, '2020-12-02 22:04:06.271319', '2020-12-02 22:04:06.271319', 'Weiter in meinem Genre', '2 bis 3 Spieler spielen eine Szene. Jeder Spieler bekommt davor vom Publikum ein Genre zugewiesen.

Sobald ein Spieler die Szene mit dem Satz _Weiter in meinem Genre_ unterbricht, wird die komplette Szene in diesem Genre fortgesetzt. Und zwar solange, bis ein anderer Spieler ebenso unterbricht und sein Genre weitergespielt wird.', 'https://improwiki.com/de/wiki/improtheater/weiter_in_meinem_genre', '2020-11-14 07:44:21.176', 180);
INSERT INTO public.part VALUES (181, 1, '2020-12-02 22:04:06.422235', '2020-12-02 22:04:06.422235', 'Orte-Switch', 'Beim Spiel Orte-Switch lässt sich der Moderator vom Publikum zunächst mehrere höchst unterschiedliche Orte geben, außerdem eine weitere beliebige Vorgabe. Es sind mindestens zwei Spieler auf der Bühne. Der Moderator lässt das Spiel an einem beliebigen der genannten Orte beginnen. Nach einer gewissen Zeit stoppt der Moderator die Szene, die Spieler frieren in der Bewegung ein, und er nennt einen weiteren der anfangs genannten Orte. Ähnlich wie beim Freeze Tag müssen die Spieler aus der eingefrorenen Haltung heraus nun eine völlig neue Szene beginnen. Irgendwann wird wieder gestoppt und es folgt ein weiterer Ort. So geht es weiter, bis alle Orte mit ihren jeweiligen Szenen etabliert sind. Danach wechseln die etablierten Orte in beliebiger, vom Moderator vorgegebener Reihenfolge immer dann, wenn er ein Zeichen gibt. Auch bei diesen Ortswechseln frieren die Spieler jeweils kurz ein und setzen die zu dem betreffenden Ort gehörende (anfangs etablierte) Szene fort.

Tipps und Hinweise:

*   Wichtig ist, die eingefrorene Haltung als Ausgangspunkt für das Spielen in der nächsten Szene zu nehmen, das heißt, genau die eingefrorene Körperhaltung und -gestik muss bei der nächsten Szene anfangs eine wichtige Rolle spielen! Daraus bezieht das Spiel seine Wirkung und seinen Witz. Beispiel: Fummelt die Verkäuferin der Käuferin im Dessousladen am Po herum, wird die Szene gestoppt und frieren die Spieler an, dann muss es bei einer Folgeszene in einer Spielbank für die Hände am Po natürlich einen Grund geben!
*   Wenn der Moderator die Spieler quälen will, dann stoppt er jeweils bei Körperhaltungen und -kombinationen, die in der nächsten Szene am anderen Ort besonders schwer zu begründen bzw. einzubauen sind.
*   Frage zu den Orten könnte z.B. sein: Nennen sie Orte, an denen Geld ausgegeben wird.
*   wie oft einer der Orte angespielt wird, kann aus dramaturgischen Gründen unterschiedlich sein. An einem Ort ist die betreffende Geschichte vielleicht nach dem vierten Mal zu Ende, an dem anderen erst mit dem sechsten Mal
*   bei Gedächtnisschwäche sollte sich der Moderator die Orte aufschreiben

', 'https://improwiki.com/de/wiki/improtheater/orte-switch', '2020-11-14 07:44:21.365', 181);
INSERT INTO public.part VALUES (182, 1, '2020-12-02 22:04:06.576547', '2020-12-02 22:04:06.576547', 'Diashow', 'Mehrere Spieler stellen pantomimisch eine Szene dar. Ein Moderator beschreibt dann spontan, was auf diesem Bild zu sehen ist. Auf ein bestimmtes Kommando ändern die Spieler Haltung und Position. Ein neues Bild entsteht. Die Aufgabe des Moderators ist es zum einen zu erklären was auf den einzelnen Bildern zu sehen ist, zum anderen eine Geschichte zu entwickeln, die die einzelnen Bilder miteinander verbindet. Ziel des Spieles ist es, den Vortragenden so sehr wie möglich in Schwierigkeiten zu bringen, indem man möglichst Absurdes darstellt, oder eine Szenerie darstellt, die mit dem vorherigen "Dia" offenbar nichts zu tun hat. Der Vortragende muss diese beiden Dias dann irgendwie in eine Verbindung bringen und einen möglichst konsistenten Vortrag halten.

**Variante:** Der Spielleiter fragt nach einem Thema (Urlaubsreise wohin, wissenschaftliches Thema). Nun beginnt der Vortragende zunächst mit ein paar einleitenden Worten, wie bei einem Diavortrag üblich. Schließlich sagt er: "Und hier sehen sie, wie ..." und die Darsteller bauen die dazu passende "Skulptur" auf. Auf ein Signal der Vortragenden (Betätigen der Fernbedienung) verschwindet das Bild, das heißt die Skulptur verschwindet. Wieder spricht der Vortragende ein paar verbindende Worte um dann das nächste Dia (Skulptur) anzukündigen. usw. Die Skulptur beinhaltet eventuell für den Vortragenden überraschende Komponenten, die er natürlich in seinen Diavortrag einbauen muss.', 'https://improwiki.com/de/wiki/improtheater/diashow', '2020-11-14 07:44:21.307', 182);
INSERT INTO public.part VALUES (183, 1, '2020-12-02 22:04:06.709457', '2020-12-02 22:04:06.709457', 'Der böse Zwilling', 'Der Moderator lässt sich eine Beziehung zwischen zwei Personen oder eine Tätigkeit geben. Zwei Spieler beginnen die Szene zu spielen. Die Szene wird an einem beliebigen Punkt gestoppt und einer der Spieler wird durch einen anderen Schauspieler ersetzt. Dieser ist der böse Zwilling der Person, die er gerade ersetzt hat. Dieser Zwilling tut etwas böses, schreckliches, skuriles und wechselt danach den ursprünglichen Spieler wieder ein. Dieser muss nun sein merkwürdiges Verhalten rechtfertigen.', 'https://improwiki.com/de/wiki/improtheater/der_boese_zwilling', '2020-11-14 07:44:21.284', 183);
INSERT INTO public.part VALUES (184, 1, '2020-12-02 22:04:06.823938', '2020-12-02 22:04:06.823938', 'Solo-Dreieck', 'Anders als beim normalen Dreieck, dreht man das Ganze einfach um. Zwei Spieler stehen hinten und einer vorne. Rotiert wird wie gewöhnlich. Man sieht daher drei verschiedene Soloszenen. Vieles ist dabei möglich. Vortrag, Telefonat, eine Tätigkeit, Warten...usw. Es entstehen viele witzige Figuren, die sich nach jeder Runde verändern. Eine gute Übung, um selbstsicherer zu werden und an der Präsenz zu arbeiten.', 'https://improwiki.com/de/wiki/improtheater/solo-dreieck', '2020-11-14 07:44:21.356', 184);
INSERT INTO public.part VALUES (185, 1, '2020-12-02 22:04:06.944881', '2020-12-02 22:04:06.944881', 'Bandwurm', 'Zwei Spieler (A und B) etablieren eine Szene. A redet über eine Person und definiert sie in Haltung, Sprache und er definiert auch die Situation in der er mit dieser Person zu tun gehabt hat. Ist die dritte Person hinreichend definiert, übernimmt Spieler B den Charakter dieser dritten Person in der Situation die vorher von Spieler A beschrieben wurde.

Nun spricht Spieler B von einer anderen Person, definiert Charakter und Situation. Dann schlüpft Spieler A in die Rolle dieses Charakers.

Dieses Wechselspiel zwischen Spieler A und Spieler B geschieht solange bis die Spieler wieder zu den ersten beiden Typen zurückkehren.

Es ist wichtig den Personen markante Merkmale bei der Beschreibung zu geben, damit ein möglichst starker Wechsel zwischen den einzelnen Teilszenen stattfindet.', 'https://improwiki.com/de/wiki/improtheater/bandwurm', '2020-11-14 07:44:21.396', 185);
INSERT INTO public.part VALUES (186, 1, '2020-12-02 22:04:07.084647', '2020-12-02 22:04:07.084647', 'Schizo Blind date', 'Bei diesem Spiel begegnen sich zwei Personen - Singles -, die sich noch nicht kennen. Wie im realen Leben geht es darum, sich kennenzulernen und zu sehen, ob es passt, man sich sympathisch findet, man sich unterhalten kann usw.

Das Besondere: Einer der beiden ist eine gestörte Persönlichkeit: Er bzw. sie hat einen Tick, eine Phobie oder Manie und ein ungewöhnliches Hobby. Aber auch weitere Persönlichkeitsstörungen sind möglich, etwa Schizophrenie, Trizophrenie, Manisch-depressiv-Sein (in raschem Wechsel), plötzliche Dialekts-"Anfälle", Schlafkrankheit (Narkolepsie), Fetischismus u.v.m. Dass das natürlich beim "normalen" Gegenüber gewisse Reaktionen auslöst, ist klar. Die Szene wirkt witziger, wenn die/der Andere die wahrgenommenen Störungen nicht verbal anspricht.

Die Persönlichkeitsstörungen werden vor Beginn des Spiels beim Publikum abgefragt.

### Varianten

*   Eine der beiden Personen wird von drei Spielern gespielt, die abwechselnd agieren. Die normale Person spielt so, als würde sie den Wechsel nicht merken. Die drei Spieler erhalten zu der Personenbeschreibung (Vorgabe) noch jeweils eine weitere Eigenschaft. Üblich: Spieler 1 einen Tick, Spieler 2 ein Hobby und Spieler 3 eine Phobie.

*   Anstatt eines Blind Dates findet ein Bewerbungsgespräch statt, bei dem der Chef die gestörte Persönlichkeit ist und von drei Spielern gespielt wird. Sehr schön, weil der Bewerber für gewöhnlich im Tiefstatus alle "Macken" seines zukünftigen Arbeitgebers hinnehmen muss, da er ja den Job haben will - oder vielleicht auch nicht.

*   Man kann dieses Format auch als "Beichte" spielen - wobei der Pfarrer die gestörte Persönlichkeit ist und von drei Spielern dargestellt wird. Der Beichtende sieht den Pfarrer im Beichtstuhl für gewöhnlich nicht und kann dadurch um so irritierter von dessen Kapriolen sein. Ähnlich wie beim Bewerbungsgespräch (s.o.) kann man auch hier sehr schön mit Hoch- und Tiefstatus (Pfarrer vs. Sündiger) arbeiten.

siehe auch Blind Date

', 'https://improwiki.com/de/wiki/improtheater/schizo_blind_date', '2020-11-14 07:44:21.478', 186);
INSERT INTO public.part VALUES (187, 1, '2020-12-02 22:04:07.210982', '2020-12-02 22:04:07.210982', 'Tierachterbahn', 'Die Szene wird von 2-3 Spielern gespielt.

Davor lässt sich der Spielleiter vom Publikum mehrere Tiere zurufen.

Wie bei der Achterbahn (Gefühle) und der Genreachterbahn ordnet er den Spielern während der Szene Tiere zu.

Die Spieler müssen fortan den Charakter des ihm zugeordneten Tiers übernehmen.

## Beispiele

:

*   Schnecke - sehr langsam
*   Karpfen - Glubschaugen
*   Giraffe - langer Hals', 'https://improwiki.com/de/wiki/improtheater/tierachterbahn', '2020-11-14 07:44:21.498', 187);
INSERT INTO public.part VALUES (188, 1, '2020-12-02 22:04:07.337185', '2020-12-02 22:04:07.337185', 'Verkaufs-Show', 'Eine Person sitzt abgesetzt von den Spielern.

2 Spieler (auch 3) spielen nun Verkäufer eines Teleshopping\-Senders.

Die einzelnd sitzende Person synchronisiert die Verkäufer und preist einen Artikel an, den das Publikum zuvor bestimmt hat. Die Verkäufer sind "typisch":

*   Völlig überdrehte Begeisterung für ein Produkt
*   Unterhaltung zu zweit mit Fassungslosigkeit ("Nein - Wirklich?", "Es ist unglaublich")
*   Telefonnummer und Anzahl der vorrätigen Ware durchsagen

Dies kann ein (oder mehrere) konkretes Produkt sein oder ein Phantasiename (z.B. _Stapl-o-mat_ oder _Polywechs 2000_).

### Tipp

Dieses Spiel sollte nicht zu oft auf die Bühne gebracht werden. Es kann, wie bei vielen anderen Spielen auch, schnell passieren, dass nur noch nach Schema-F gespielt wird. Gerade das spielen von ''typischen'' Verkäufern führt zu einer ständigen Widerholung einer immer (in der Struktur) gleichen Szene. Das wird auf die Dauer für das Publikum, aber auch für die Spieler langweilig und entspricht dann auch nicht mehr dem Geist des Improtheaters. Gerade Anfängergruppen neigen dazu solche Spiele vermehrt ins Programm zu nehmen. Leider tun sie sich damit keinen Gefallen, wenn sie immer wieder ähnliche Szenen spielen. Deswegen sollte hier versucht werden, die typische Verkaufsshow um Elemente zu erweitern. Zum Beispiel könnten die Verkäufter Charaktereigenschaften ganz anderer Gengres übernehmen, so dass man eine Verkaufsshow im Stile eines Märchens oder eines Krimis aufführt.

', 'https://improwiki.com/de/spiele/verkaufs-show', '2020-11-14 07:44:21.618', 188);
INSERT INTO public.part VALUES (189, 1, '2020-12-02 22:04:07.479595', '2020-12-02 22:04:07.479595', 'Blind Synchro', 'Zwei Darsteller spielen auf der Bühne eine Szene und werden von zwei anderen Spielern, welche mit dem Rücken zur Bühne sitzen synchronisiert. Die Darsteller machen die passenden Mundbewegungen.

**Video Blind Synchro:**  
Blind Synchro: Die Killerkartoffel (Die Impronauten aus Basel) www.impronauten.ch', 'https://improwiki.com/de/spiele/blind_synchro', '2020-11-14 07:44:21.459', 189);
INSERT INTO public.part VALUES (193, 1, '2020-12-02 22:04:07.942682', '2020-12-02 22:04:07.942682', 'Jasager', 'Ein Zuschauer wird auf die Bühne gebeten und nimmt dort auf einem zentral platzierten Stuhl Platz. Zwei Schauspieler spielen nun nach Einholung einer Vorgabe eine ganz normale Szene. Die Besonderheit ist, dass der Zuschauer an der Szene immer wieder beteiligt wird. Er wird immer wieder in der laufenden Szene von einem der beiden Spielern angesprochen und etwas gefragt. Seine Aufgabe ist es dann nur, "JA" zu sagen. Andere Wort sind ihm nicht erlaubt. Tipps und Hinweise:

*   Die zwei Spieler und der Ja-Sagende sollten eine persönliche Beziehung haben, der Ja-Sager könnte etwa der Bruder oder der Chef sein,
*   Das immer wieder angeforderte "Ja" kann zu absurden, widersprüchlichen Situationen und Sachverhaltsschilderungen führen, etwa wenn beide Spieler sich bei Streit oder konträren Positionen eine Bestätigung vom Zuschauer holen,
*   auch ein nur "nein" sagender Zuschauer ist denkbar, allerdings besteht die Gefahr, dass die Szene schwer oder gar nicht vorankommt, weil das wiederholte "Nein" als Blockieren wirkt.', 'https://improwiki.com/de/wiki/improtheater/jasager', '2020-11-14 07:44:21.715', 193);
INSERT INTO public.part VALUES (194, 1, '2020-12-02 22:04:08.082133', '2020-12-02 22:04:08.082133', 'Playback Show', 'Dieses Aufwärm- und Übungsspiel muss vorbereitet werden. Zunächst sind kurze Musikstücke aus möglichst unterschiedlichen Stilrichtungen und Zeiten auf Tonträger auszusuchen. Also am Besten z.B. von Barockmusik bis Techno, von gregorianischen Gesängen bis Punk.

Die jeweils 30 bis 50 Sekunden sollten einen prägnanten Ausschnitt des Musiktitels repräsentieren (z.B. Refrain) und Gesang enthalten. Diese Ausschnitte werden nun in einer möglichst abwechslungsreichen Mischung ohne Pausen auf einem Tonträger bzw. in einer Datei ohne Pause aneinander gehängt.

In der Trainingsstunde wird der Tonträger/die Datei abgespielt. Die Teilnehmer stellen sich locker versetzt halbkreisförmig auf. Fängt ein neues Musikstück an, tritt einer der Teilnehmer vor die Gruppe und macht als Frontsänger passsende Mund- und Körperbewegungen zu dem gerade laufenden Stück, die anderen begleiten ihn passend, z.B. als Chor (wenn im Stück ein Chor vorkommt), als Band bzw. Orchester oder als Ballett o.ä. Fängt ein neues Stück an, tritt der Playback-Singende in den Halbkreis zurück und ein anderer tritt vor und "singt" und macht die passenden Körper- bzw. Tanzbewegungen usw.

Mit Hilfe dieses Spiels/dieser Übung wärmt man sich nicht nur rasch auf, es können Fokus (nehmen und geben), Präsenz und Zusammenspiel geübt werden.', 'https://improwiki.com/de/wiki/improtheater/playback_show', '2020-11-14 07:44:21.743', 194);
INSERT INTO public.part VALUES (195, 1, '2020-12-02 22:04:08.228715', '2020-12-02 22:04:08.228715', 'Positiv sein (Übung)', 'Bei dieser Übung geht es darum, das Positivsein zu üben.

Eine normale Szene fängt an. Aufgabe der Spieler ist es jedoch, die ganze Zeit über **penetrant** positiv zu sein. Sobald einer der Spieler den Hauch einer negativen Äußerung von sich gibt, wird im Sinne von Neue Wahl der letzte Satz getilgt. dh. die Handlung wird so fortgesetzt, als wenn der letze Satz nicht gesagt worden wäre. Zusätzlich möglich ist es, den betreffenden Spieler auszutauschen.

Es wird deutlich, wie schwer es ist, (dauerhaft) positiv zu sein. Es gibt leider die weit verbreitete Tendenz negativ zu sein bzw. negativ anzufangen.', 'https://improwiki.com/de/wiki/improtheater/positiv_sein_uebung', '2020-11-14 07:44:21.716', 195);
INSERT INTO public.part VALUES (196, 1, '2020-12-02 22:04:08.376452', '2020-12-02 22:04:08.376452', '4 Satz Geschichte', 'Die Spieler stellen sich im Kreis oder in einer Reihe auf, um kurze Geschichten zu erzählen. Dabei sagt jeder Spieler jeweils nur einen Satz. Die 4 Sätze sind nach dem Modell: **Einleitung/Routine => Problem -=> Lösung => Moral** aufgebaut.

Dabei beginnt **Spieler 1** mit dem Einleitungssatz, z.B.: "Es war einmal in Japan, da zog ein junger Samurai in seinen ersten großen Kampf."

**Spieler 2** etabliert jetzt in seinem Satz das Problem, z.B.: "Der Samurai hatte jedoch große Angst vor dem Tod, bettelte um Gnade und ergab sich seinem Gegner und wurde daraufhin von allen verachtet und mit Schande bedacht."

**Spieler 3** etabliert jetzt in seinem Satz die Lösung z.B.: "Bis er als alter Samurai der durch die Erfahrung sehr viel gelernt und die Angst komplett verloren hatte, erneut auf seinen früheren Gegner traf und ihn schließlich doch noch besiegte."

**Spieler 4** fasst jetzt die "Moral der Geschichte" zusammen, z.B.: "Und die Moral von der Geschichte: Wer immer wieder aufsteht, wenn er hinfällt, wird irgendwann erfolgreich sein."

Diese Übung eignet sich gut um ein beliebtes Grundmuster des Geschichtenerzählens zu trainieren und dabei in einem Satz auf den Punkt zu kommen.

Eine ähnliche Übung ist das Es war einmal - Modell.', 'https://improwiki.com/de/wiki/improtheater/4_satz_geschichte', '2020-11-14 07:44:21.763', 196);
INSERT INTO public.part VALUES (197, 1, '2020-12-02 22:04:08.559666', '2020-12-02 22:04:08.559666', 'Szenenmix 10x20', 'Ziel dieser Übung (Szenen-Mix) ist es, in kürzester Zeit sehr deutlich zu machen, worum es in einer Szene geht. Es trainiert die Erstellung von starken Angeboten.

Es werden 10 unterschiedliche Szenen mit 2 Spielern kurz hintereinander gespielt. Jede der 10 Szenen dauert nur 20 Sekunden (oder eine andere vom Spielleiter gewählte Länge: 10s, 30s, 1min....). Der Spielleiter stoppt die Zeit und nach 20 Sekunden springen zwei neue Spieler auf die Bühne und starten eine neue Szene.

Da die Spieler nicht viel Zeit haben, können sie sich sicher genug fühlen, mehr zu tun und mehr in der Szene zu riskieren, Angebote zu machen und groß auf Angebote zu reagieren.

*   Variationen: Nachdem alle 10 Szenen durchgespielt wurden, kann der Spielleiter aus den gespielten einige Szenen auswählen (z. B. die letzten beiden gespielten Szenen) und die Spieler an der Stelle, an der sie zuvor beendet wurden, weiterspielen lassen. Nach 1 Minute können Sie zur nächsten Szene wechseln.

*   Um weitere Hilfe zu leisten, können die Szenen immer nach einer bestimmten Zeit (z. B. nach 1 Minute) gestoppt und dann kurz in der Gruppe zusammengefasst werden, was in der Szene bisher tatsächlich passiert ist und welche Möglichkeiten es noch gibt, diese Szene weiter zu spielen (schärft das gemeinsame Szenenverständnis).', 'https://improwiki.com/de/wiki/improtheater/szenenmix_10x20', '2020-11-14 07:44:22.55', 197);
INSERT INTO public.part VALUES (198, 1, '2020-12-02 22:04:08.786938', '2020-12-02 22:04:08.786938', 'Ja genau, und weil...', 'Eine Übung für zwei Spieler. Die beiden sitzen Schulter an Schulter auf zwei Stühlen und spielen quasi _eine_ Person, und zwar einen Experten, der von seinem Fachgebiet, oder einen Erfinder, der von seiner sensationellen Erfindung erzählt. Was es ist, wird vom Publikum vorgegeben.

Beide sprechen abwechselnd, wobei jeder den Satz seines Vorgängers bestätigend wiederholt und ergänzt.

Beispiel:

*   A: Ich bin Experte für Weißwürste.
*   B: Ja genau, und weil ich Experte für Weißwürste bin, habe ich die Weißwürste genauestens untersucht.
*   A: Ja genau, und weil ich die Weißwürste genauestens untersucht habe, habe ich entdeckt, dass sie dick machen.
*   B: Ja genau, und weil die Weißwürste dick machen...

Die Übung trainiert das Annehmen in seiner Extemform: zu _allem_ "Ja genau" sagen - und darauf sofort aufzubauen und es somit zu rechtfertigen. Außerdem vermittelt die für die Improvisation wichtige Erfahrung, dass man die Entwicklung der Geschichte zu keinem Zeitpunkt vorherplanen kann, sondern immer wieder auf unvorhergesehene neue Angebote reagieren muss. Durch diese Übung wird der/die Spieler/in in ein sehr konstruktives sogenanntes Yes-Setting versetzt welches ihn/sie dazu bereit macht zu jeder Zeit positiv auf eine neu eingebrachte Idee zu reagieren.

Im Unterschied zu "Ja genau, und dann..." ist bei dieser Übung kein Handeln gefordert, sondern sie bleibt im rein Verbalen. Sie ist gut für Anfänger-Workshops geeignet.', 'https://improwiki.com/de/wiki/improtheater/ja_genau_und_weil', '2020-11-14 07:44:22.658', 198);
INSERT INTO public.part VALUES (199, 1, '2020-12-02 22:04:08.906993', '2020-12-02 22:04:08.906993', 'Glücklicherweise, unglücklicherweise', 'Diese Übung kann im Kreis mit mehreren Spielern, aber auch als Paarübung zu zweit gespielt werden.

Es wird Satz für Satz eine Geschichte erzählt, wobei jeder Spieler immer jeweils einen Satz sagt. Der erste Satz der Geschichte ist ein ganz einfacher einleitender Satz. Danach beginnen die Sätze immer abwechselnd mit "Glücklicherweise..." und "Unglücklicherweise..." (oder auch: "Leider..."), d.h. erst ist etwas positiv und dann wieder negativ.

Nichsdestotrotz gilt trotzdem immer schon das vorher Gesagte. Durch einen nachfolgenden Satz darf das vorher Gesagte nicht ignoriert oder ausgelöscht werden.

Das Ziel ist es mit jedem Satz immer eine entsprechende Lösung zu finden und dabei am besten das Naheliegendste zu verwenden.

Wie in allen Geschichten sind Wiedereinführungen von am Anfang Gesagtem natürlich immer vorteilhaft für die Geschichte.

## Beispiel:

Die Spieler stellen sich im Kreis auf:

*   Spieler A: "Gestern stieg ich ein Flugzeug nach New York City."
*   Spieler B: "Leider ist mein Flug in Turbulenzen geraten."
*   Spieler C: "Zum Glück hat es nicht allzu lange gedauert."
*   Spieler D: "Leider verursachten die Turbulenzen einen Triebwerksausfall."
*   Spieler E: "Zum Glück waren Fallschirme an Bord."
*   Spieler F: "Leider gab es nicht genug für alle."
*   usw. usf...', 'https://improwiki.com/de/wiki/improtheater/gluecklicherweise_ungluecklicherweise', '2020-11-14 07:44:22.469', 199);
INSERT INTO public.part VALUES (200, 1, '2020-12-02 22:04:09.027802', '2020-12-02 22:04:09.027802', 'Ja genau, und dann...', 'Eine Übung für zwei Spieler. Die Beiden haben gemeinsam etwas erlebt und erzählen davon, während sie es nachspielen. Die Spieler stehen nebeneinander Schulter an Schulter. Alle Bewegungen werden gemeinsam (synchron) gemacht (ähnlich wie bei Wort für Wort für zwei Spieler).

Die beiden sagen abwechselnd, was als nächstes passiert ist. Jeder Spieler bestätigt das, was der andere gerade gesagt hat, mit den Worten: "Ja genau und dann..." Wichtig ist, dass jeder Satz von einer Handlung (Veränderung der Pose) begleitet sein muss!

Beispiel:

*   A: "Weißt du noch, wie wir zur Tür reingekommen sind?" (A und B öffnen die Tür)
*   B: "Ja genau und dann haben wir die Tür wieder zugemacht." (A und B schließen die Tür)
*   A: "Ja genau und dann haben wir uns umgeschaut." (A und B schauen sich um)
*   B: "Ja genau und dann..." usw.

Man kann die Übung mit oder ohne Vorgabe machen (mit Vorgabe, z. B. Titel oder Ort der Geschichte, ist es leichter).

**Sinn der Übung:** Annehmen, ins Handeln kommen, gemeinsam eine Geschichte entwickeln

Siehe auch die verwandten Übungen "Ja genau und weil..." (Experten) und "Geschichte erzählen".', 'https://improwiki.com/de/wiki/improtheater/ja_genau_und_dann', '2020-11-14 07:44:22.603', 200);
INSERT INTO public.part VALUES (201, 1, '2020-12-02 22:04:09.157785', '2020-12-02 22:04:09.157785', 'Geschenke pflücken', 'Die Spieler stehen im Kreis. Einer beginnt und pflückt einen beliebigen Gegenstand aus der Luft. Er hält ihn in einer bestimmten Weise und überreicht ihn seinem Nachbarn als Geschenk. Dieser freut sich riesig, sagt, was es ist und bedankt sich. Dann legt er das Geschenk ab und pflückt ein neues Geschenk aus der Luft, usw.

Beispiel:

*   A pflückt einen länglichen Gegenstand und überreicht ihn B: "Hier, das schenk ich dir."
*   B: "Ui, toll! Ein Maschinengewehr! Sowas hab ich mir schon immer gewünscht! Danke!"
*   B legt das Maschinengewehr ab und pflückt einen etwa melonengroßen, schweren Gegenstand: "Hier, ein Geschenk für dich!"
*   C: "Oh, wow, eine Bowlingkugel! Klasse!" usw.

Der eine Spieler macht also eine gestische Vorgabe und der andere Spieler definiert dann konkret, was es ist. (Wie immer gilt: nimm die erste Assoziation, versuche nicht, originell zu sein.) Der Überreichende muss natürlich sofort das verbale Angebot des Beschenkten annehmen (auch wenn er sich einen ganz anderen Gegenstand gedacht hatte). Die beiden können, wenn sie wollen, auch ruhig noch 1 bis 2 freundliche Sätze miteinander wechseln, z.B. die Besonderheiten des Geschenks herausstreichen, wofür sie es brauchen können, o.ä.

Tipp: Man kann sich einen imaginären Baum vorstellen, von dessen Ästen die Geschenke hängen. Die Größe, Form usw. der Geschenke darf natürlich so abwechslungsreich wie möglich sein.', 'https://improwiki.com/de/wiki/improtheater/geschenke_pfluecken', '2020-11-14 07:44:22.551', 201);
INSERT INTO public.part VALUES (202, 1, '2020-12-02 22:04:09.293806', '2020-12-02 22:04:09.293806', 'Exzellenzen Spiel', 'Dieses aus Österreich stammende Spiel lässt sich gut als Übung für Behaupten und Annehmen nutzen. Außerdem (nebenbei) Hoch- und Tiefstatus.  
Es wird von zwei Personen gespielt: Der Exzellenz und seinem Hofrat, der als Lehrer herhalten muss. Der Hofrat stellt der Exzellenz eine einfache Frage, wobei die Formulierung immer bereits die korrekte Antwort beinhaltet. Gleichwohl gibt die Exzellenz eine offenkundig falsche Antwort. Daraufhin ist es wiederum Aufgabe und hoheitliche Pflicht des Hofrats zu begründen, warum die offenkundig falsche Antwort der Exzellenz natürlich völlig korrekt ist.

#### _Beispiele:_

Hofrat: "Eure ehrwürdige hochwohlgeborene Exzellenz: Wie lange dauerte der 30jährige Krieg?"  
Exzellenz: "Der 30jährige Krieg? Genau 15 Jahre!"  
Hofrat: "Völlig richtig, Eure ehrwürdige hochwohlgeborene Exzellenz, denn zur Zeit des 30jährigen Krieges konnte man ja nur bei Tag, nicht aber bei Nacht Krieg führen"

Hofrat: "Eure ehrwürdige hochwohlgeborene Exzellenz: Welche Farbe hat mein grüner Wams."  
Exzellenz: "Ihr Wams ist tiefrot!"  
Hofrat: "Völlig richtig, Eure ehrwürdige hochwohlgeborene Exzellenz, denn für Farbenblinde wie sie sieht er ja rot aus!"', 'https://improwiki.com/de/wiki/improtheater/exzellenzen_spiel', '2020-11-14 07:44:22.794', 202);
INSERT INTO public.part VALUES (203, 1, '2020-12-02 22:04:09.412027', '2020-12-02 22:04:09.412027', 'Bank einnehmen', '3 SpielerInnen, mehrere Stühle auf der Bühne stellen eine Bank dar. 1 Spieler sitzt auf der Bank, die beiden anderen müssen versuchen diesen innerhalb einer gespielten Szene zum Verlassen der Bank zu bewegen. Angebot müssen dabei angenommen werden. Beispiel 1: A sitzt auf der Bank, B beginnt die Szene und mimt einen Ertrinkenden. A bleibt sitzen. Das ist okay, da es höchstens eine moralische Verpflichtung zum Retten gibt. Beispiel 2: A sitzt auf der Bank, B kommt mit einer Planierraupe angefahren und fordert A zum Verlassen der Bank auf, weil das Gelände planiert werden soll. A muss weichen, es sei denn A begründet dass er Aktivist von Robin Wood ist und gegen das Plattmachen des Parks ist und sich zu Demonstrationszwecken angekettet hat. Dann muss B aufgeben und C startet einen neuen Versuch in einer neuen Szene an einem neuen Ort A von der Bank zu holen und diese selber einzunehmen.', 'https://improwiki.com/de/wiki/improtheater/bank_einnehmen', '2020-11-14 07:44:22.687', 203);
INSERT INTO public.part VALUES (204, 1, '2020-12-02 22:04:09.532107', '2020-12-02 22:04:09.532107', 'Geschichte erzählen', 'Zweierteam - beide erzählen zusammen eine Geschichte.

Der erste beginnt, z.B. "Lass uns Urlaub machen."

Der zweite fängt seinen Satz immer mit **JA** an. z.B. "Ja, lass uns in die Berge fahren."

Dann kommt wieder der erste mit: "Ja, lass uns mit dem Bus hinfahren. etc."

Ziel der Übung ist es, Angebote immer anzunehmen und nie zu blocken und **NEIN** zu sagen.

Siehe auch die verwandten Übungen "Ja genau, und dann..." (Erzählen mit Pantomime) und "Ja genau, und weil..." (Experten)', 'https://improwiki.com/de/wiki/improtheater/geschichte_erzaehlen', '2020-11-14 07:44:22.709', 204);
INSERT INTO public.part VALUES (334, 1, '2020-12-02 22:04:28.970748', '2020-12-02 22:04:28.970748', 'Reimkreis 2', '**Reimkreis AABB:**

Einer reimt eine Zeile, der nächste im Kreis reimt auf diese Zeile, der Dritte fängt einen neuen Reim an und der Vierte reimt auf die dritte Zeile, die Strophe ist damit beendet. Beim Nächsten im Kreis fängt ein neues Gedicht zu einem neuen Thema an.

**Reimkreis ABAB:**

Wie beim Reimkreis AABB, nur dass der Dritte auf den Ersten reimt und der Vierte auf den Zweiten.

**Reimkreis ABCB:**

Wie beim Reimkreis AABB, allerdings muss sich nur die vierte Zeile auf die Zweite reimen.

siehe auch Reimen', 'https://improwiki.com/de/wiki/improtheater/reimkreis_2', '2020-11-14 07:44:27.297', 334);
INSERT INTO public.part VALUES (205, 1, '2020-12-02 22:04:09.648287', '2020-12-02 22:04:09.648287', 'Büroklammer Spiel', 'Dies ist eine gute Übung zum Erkennen von Mustern (Patterns) und dem größer machen von Angeboten, die bereits gemacht wurden. Diese Übung eignet sich auch gut als eine von vielen Vorbereitungsübungen für einen Harold. Sie trainiert das Abstrahieren.

Alle Spieler stellen sich in einer Reihe auf. Ein Spieler tritt nach vorne und benennt, welches Objekt er ist und seine Funktion, beispielsweise:

*   "Ich bin eine Büroklammer und ich halte lose Papiere fest zusammen.".

Dann tritt ein zweiter Spieler nach vorne und sagt welches Objekt er ist und welche gleiche Funktion er hat:

*   "Ich bin ein Gummiband und ich halte lose Briefe fest zusammen".

Ab diesem Punkt ist das Muster etabliert und jeder Spieler tritt nun einer nach dem anderen nach vorne und macht das Muster (Pattern) größer.

*   "Ich bin eine Schnur und ich halte lose, recyclebare Zeitungen fest zusammen"
*   "Ich bin eine Kette und ich halte aneinandergekettete Strafgefangene fest zusammen"
*   "Ich bin Religion und ich halte einzelne, freie Gemeinden fest zusammen

Das Ganze wird solange wiederholt und größer gemacht, bis es nicht mehr weitergeht, danach mit einem neuen Objekt und einer neuen Funktion wieder von vorne beginnen.

## Quellen

improvencyclopedia.org', 'https://improwiki.com/de/wiki/improtheater/bueroklammer_spiel', '2020-11-14 07:44:22.672', 205);
INSERT INTO public.part VALUES (206, 1, '2020-12-02 22:04:09.808534', '2020-12-02 22:04:09.808534', 'Würzburger Opernball', 'Diese Übung ist eine Erweiterung einer Ein-Wort-Geschichte.

Es werden Pärchen gebildet, welche in Tanzposition, bevorzugt Walzer, stehen. Die Paare beginnen einen Dialog, und zwar Wort-für-Wort, jeweils abwechselnd eine Dialogzeile für den Mann, dann die Frau. Beide Spieler zusammen sprechen also auch für beide Figuren.

Dazu begeben sich die Spieler in einen Tanzrhythmus, das kann ein klassischer Walzer sein, aber auch jeder beliebige andere Tanz.

Jedes Pärchen bekommt eine Soloszene als Übung, anschließend beginnen die Paare alle zu Tanzen und unterhalten sich untereinander - jedes Pärchen weiterhin Wort für Wort, Mann oder Frau.

Wir haben diese Aufwärmübung an einem launigen Probentag entdeckt und hatten extrem viel Spaß damit.', 'https://improwiki.com/de/wiki/improtheater/wuerzburger_opernball', '2020-11-14 07:44:22.825', 206);
INSERT INTO public.part VALUES (207, 1, '2020-12-02 22:04:09.948085', '2020-12-02 22:04:09.948085', 'Ich hab ne bessere Idee!', '3 Spieler stehen nebeneinander, leicht im Halbkreis.

Der mittlere beginnt, eine Geschichte zu erzählen. Jede Aktion, jede Idee, die die Aussenspieler ok finden bejahren sie euphorisch mit "jajajaja!" - wenn jemand aber mit dem Hergang nicht glücklich ist, ruft er "ich hab ne bessere Idee!", geht in die Mitte und erzählt weiter, bis wieder ein anderer der Meinung ist, er habe eine bessere Idee.', 'https://improwiki.com/de/wiki/improtheater/ich_hab_ne_bessere_idee', '2020-11-14 07:44:22.76', 207);
INSERT INTO public.part VALUES (208, 1, '2020-12-02 22:04:10.077968', '2020-12-02 22:04:10.077968', 'Ja, aber', 'Bei dieser Übung finden sich die Spieler in Paaren zusammen und führen nun einen Dialog. A macht einen Vorschlag, während B einen Grund findet, den Vorschlag nicht umsetzen zu müssen. Sein Satz beginnt dabei mit "Ja, aber". Anschließend macht B einen neuen Vorschlag, sodass sich nun A eine Ausrede ausdenken muss.

A:" Lass uns doch gemeinsam die schwere Kiste vom Schrank holen."  
B: "Ja, aber ich habe es doch so schlimm mit dem Rücken. Lass uns lieber ins Schwimmbad gehen."  
A.: "Ja, aber ich kann doch gar nicht schwimmen..."  

Bei der Übung geht es darum zu trainieren nicht mit "Nein" zu antworten und damit komplett zu blocken, sondern stattdessen einen Gegenvorschlag zu machen und seinem Mitspieler Alternativen anzubieten. Auf diese Weise wird die Szene am Leben erhalten, gleichzeitig kann der Spieler unangenehmen Vorschlägen aus dem Weg gehen.', 'https://improwiki.com/de/wiki/improtheater/ja_aber', '2020-11-14 07:44:22.779', 208);
INSERT INTO public.part VALUES (209, 1, '2020-12-02 22:04:10.223082', '2020-12-02 22:04:10.223082', 'Stören', 'Bei dieser Übung wird Blockieren bzw. werden vermeintlich oder tatsächlich "unpassende" Spielangebote zum "Programm" gemacht.

Zwei spielen, zwei stören. Es beginnt eine normale Szene, sobald alles einigermaßen etabliert ist, geht ein oder gehen zwei "Störer" auf die Bühne und versuchen immer wieder die beiden Spieler mit "unpassenden" Spielangeboten aus dem Spielfluss zu bringen. Sie gehen als unterschiedliche Personen, Tiere oder Objekte auf die Bühne

Beispiel:

Szene in Backstube mit Meister und Lehrling - plötzlich taucht ein Angler auf. Die Spieler bauen den Angler als jemanden ein, der Fische für''s Fischbrötchen liefert. Plötzlich wird mit dem Presslufthammer gearbeitet: Die Backstube wird renoviert. Einer der "Störer" ordnet als Moderator unmotiviert eine Rückblende an. Später steigt plötzlich ein Roboter aus dem Backofen ... usw.

Die Übung härtet ab und macht fit für das Annehmen unpassender, nicht so passender, überraschender oder überflüssiger Spielangebote.', 'https://improwiki.com/de/wiki/improtheater/stoeren', '2020-11-14 07:44:22.912', 209);
INSERT INTO public.part VALUES (210, 1, '2020-12-02 22:04:10.372144', '2020-12-02 22:04:10.372144', 'Absonderlicher Nachbar', 'Die Spieler stehen im Kreis. Reihum wendet man sich jeweils zu seinem Nachbarn und sagt irgendetwas Ungewöhnliches/Absurdes/Unmögliches, das einem an diesem "auffällt". Dieser muss das annehmen, aufnehmen und erklären und erläutern.

**Beispiel:**

*   A (erstaunt): Mensch Helga, aus Deiner linken Schulter wächst ja ein riesiger Knollenblätterpilz!
*   Helga (stolz): Ja, den habe ich aus Paris. Dort gibt es einen neuen Modezaren, der lässt das seinen treuen Kundinnen einpflanzen. Das macht sich gerade bei einem Abendkleid mit großem Ausschnitt sehr eindrucksvoll wie du siehst. - Ich muss den Pilz jeden Morgen gießen, der wächst bestimmt jeden Tag einen Zentimeter. Und das Tolle: Er spürt mein Stimmungen. Wenn ich traurig bin, dann ..."
*   usw.', 'https://improwiki.com/de/wiki/improtheater/absonderlicher_nachbar', '2020-11-14 07:44:22.883', 210);
INSERT INTO public.part VALUES (211, 1, '2020-12-02 22:04:10.480644', '2020-12-02 22:04:10.480644', 'Spit-Fire', 'Einer lässt sich ein Thema vorgeben und erzählt eine Geschichte. Links und rechts von ihm stehen zwei weitere Spieler, die ihm immer wieder irgendwelche Wörter zurufen. Der Erzähler muss jedes Wort sofort in die Geschichte einbauen.

Natürlich wird es besonders lustig, wenn die Wörter mit der momentan erzählten Geschichte so gar nichts wie möglich zu tun haben, um den Erzähler in möglichst große Schwierigkeiten beim Einbauen zu bringen.

Die Wörter können auch vom Publikum eingerufen werden.', 'https://improwiki.com/de/wiki/improtheater/spit-fire', '2020-11-14 07:44:22.924', 211);
INSERT INTO public.part VALUES (212, 1, '2020-12-02 22:04:10.610128', '2020-12-02 22:04:10.610128', 'Best Side Story', '2 Teams stehen sich gegenüber.

Team 1 beginnt mit einer "Ja genau, und weil..."-Geschichte. Jeder Spieler tritt nach und nach einen Schritt nach vorne und treibt die Story seines Teams vorwärts.

Immer wenn das andere Team merkt, dass auf der anderen Seite der Erzähler uninspiriert schwätzt oder einen Hänger hat, schreien sie "Wir haben eine bessere Geschichte!" - und es tritt aus diesem Team einer nach vorne und beginnt eine neue "Ja genau, und weil..."-Geschichte, die Team 2 entsprechend wieder beenden kann.

Es ist im Grunde eine Kombination aus Ja genau, und weil... und Ich hab ne bessere Idee!', 'https://improwiki.com/de/wiki/improtheater/best_side_story', '2020-11-14 07:44:22.899', 212);
INSERT INTO public.part VALUES (213, 1, '2020-12-02 22:04:10.764554', '2020-12-02 22:04:10.764554', 'Kreuzverhör', 'Es bilden sich Dreiergruppen.  
Einer ist Verbrecher, zwei sind Polizisten, die ihn verhören. Aufgabe des Verbrechers ist es, immer "ja" zu sagen oder zuzustimmen.  
Nach einigen Minuten wird gewechselt.

Durch diese Übung wird das Akzeptieren trainiert.', 'https://improwiki.com/de/wiki/improtheater/kreuzverhoer', '2020-11-14 07:44:22.977', 213);
INSERT INTO public.part VALUES (214, 1, '2020-12-02 22:04:10.88001', '2020-12-02 22:04:10.88001', 'Sanfte Manipulation - Dressur', 'Eine schöne Übung zum Zuhören und eingrooven der Spielpartner untereinander.

Spieler A verlässt den Raum, die anderen Spieler legen eine Tätigkeit oder eine Aktion fest (zum Beispiel: Auto waschen, Gangnam Style tanzen, Akten ordnen).

Nun kommt Spieler A zurück und spielt mit Spieler B eine Szene. Spieler B muss nun Spieler A dazu bringen, diese Aktion auszuführen. Dabei sollte Spieler B niemals offensichtliche Hinweise geben oder die Aktion selbst aussprechen. Also wenn es darum geht Akten zu ordnen, sollte er nicht so etwas sagen wie: "Schau mal, wie unordentlich die Akten da rumliegen.", oder "Oh, ein Aktenordner, was man damit wohl alles machen kann?".

Es sollte also nicht darum gehen, dass Spieler A ins Denken und Raten kommt. Wenn Spieler A ein Angebot macht, sollte Spieler B es zunächst einmal voller Freude annehmen und dann schauen, was sich daraus entwickeln kann, wie er es sanft und in eine entsprechende andere Richtung lenken kann.

Spieler A und Spieler B müssen hier genau zuhören, was gesagt wird, subtile kleine Details sind wichtig.

### Variationen

Spieler A kann natürlich nicht nur zu Tätigkeiten, sondern auch zu anderen Sachen manipuliert werden, z.B. einen bestimmten Satz auszusprechen, sich auf eine bestimmte Art und Weise zu bewegen (hüpfen), zu singen usw. usf.', 'https://improwiki.com/de/wiki/improtheater/sanfte_manipulation_-_dressur', '2020-11-14 07:44:23.03', 214);
INSERT INTO public.part VALUES (215, 1, '2020-12-02 22:04:11.217314', '2020-12-02 22:04:11.217314', 'Boom Boom Chicago', 'Diese (Aufwärm-) Übung trainiert das schnelle Etablieren von Szeneninformationen.

1.  ) Spieler 1 beginnt die Szene, indem er mit einer körperlichen Aktivität (Routine) beginnt (bspw. Kaffee kochen).
2.  ) Spieler 2 betritt die Szene und macht in 1-2 Sätzen die Beziehung der beiden Figuren klar.
3.  ) Spieler 1 antwortet und kreiert in 1-2 Sätzen ein einfaches Problem (Konflikt), welches die beiden haben oder was entstanden sein könnte.
4.  ) Spieler 3 betritt die Szene als Figur und löst das Problem (ganz plakativ) mit einem Satz/einer Aktion.
5.  ) Alle Spieler, auf der Bühne und im Off rufen danach gemeinsam: "Tadaaaaaa!"

Die nächste Szene beginnt.

Die Szenen können ruhig in schneller Abfolge gespielt werden. Bei der Lösung des Problems gar nicht zuviel nachdenken, sondern einfach als Figur eine Lösung präsentieren. Es geht bei dieser Übung um den fortlaufenden Beat, darum, dass ohne viel Nachdenken aus der Gruppe heraus immer wieder solche neuen Szenen gebaut werden.

Siehe auch: CROW, ROTZ, CBZO', 'https://improwiki.com/de/wiki/improtheater/boom_boom_chicago', '2020-11-14 07:44:23.079', 215);
INSERT INTO public.part VALUES (216, 1, '2020-12-02 22:04:11.447888', '2020-12-02 22:04:11.447888', 'König', '## König 1

Einer ist **König**. Er sitzt auf einem Stuhl (Thron) und sagt, welches Gefühl er von Mitspielern vorgeführt haben möchte. Diese treten einzeln vor. Sie versuchen, dieses Gefühl darzustellen bzw. es tatsächlich zu fühlen bzw. auszulösen. Wird dieses Gefühl beim König (auch) ausgelöst, wird er durch den Darstellenden abgelöst. Löst der Darsteller beim König nichts aus, sagt dieser: "Hinweg mit dir!" o.ä. und der nächste Spieler darf es probieren.

## König 2

Der Spieler, der den König darstellt, setzt sich auf einen Stuhl (Thron) und denkt sich einen Charakter aus, den er darstellen möchte, ohne dies seinen Mitspielern mitzuteilen. Ziel der Mitspieler ist es nun, einzeln vor den König zu treten, ihm etwas anzubieten, zu überbringen oder zu fragen etc. und daraufhin von ihm akzeptiert zu werden, so dass sie in seinen Palast dürfen. Gefällt dem König nicht, wie und was ihm angeboten wird, oder wie schnell und nah jemand an ihn herantritt, so weist er den Mitspieler zurück. Nun darf es jemand anders versuchen. Bereits abgewiesene Spieler, aber auch erfolgreiche Spieler können mit einem anderen Angebot versuchen, doch noch/bzw. erneut in den Palast zu kommen, dh. jeder hat mehrere Versuche frei. .', 'https://improwiki.com/de/wiki/improtheater/koenig', '2020-11-14 07:44:23.079', 216);
INSERT INTO public.part VALUES (217, 1, '2020-12-02 22:04:11.572627', '2020-12-02 22:04:11.572627', 'Jeopardy', 'Diese Übung trainiert das Behaupten und das schnelle Kombinieren. Es kann sowohl als Paarübung zu zweit als auch im Kreis mit mehreren Spielern gespielt werden.

Ähnlich wie in der TV Spielshow "Jeopardy" wird hier zunächst von einem Spieler eine Antwort formuliert (eine x-beliebige Aussage). Der nächste Spieler formuliert danach (u. A. durch Assoziation) eine Frage, auf die diese Antwort passt. Je kürzer zunächst die Antwort ausfällt, desto mehr Freiheiten gibt das dem Spieler, der daraufhin die dazu passende Frage formuliert.

Der Kreativität sind hierbei keine Grenzen gesetzt. Eine sehr fortgeschrittene Variante wäre es, mit Hilfe dieser Übung eine fortlaufende Geschichte zu erzählen.

## Beispiel:

*   Spieler A: "Ich fuhr an der Tankstelle vorbei." (Antwort)
*   Spieler B: "Warum bist du denn ohne Sprit mit dem Auto liegengeblieben?" (Frage)

oder

*   Spieler A: "5 Minuten" (Antwort)
*   Spieler B: "Wie lange kochst du normalerweise Eier?" (Frage)', 'https://improwiki.com/de/wiki/improtheater/jeopardy', '2020-11-14 07:44:23.141', 217);
INSERT INTO public.part VALUES (218, 1, '2020-12-02 22:04:11.693935', '2020-12-02 22:04:11.693935', 'Andere Reaktion', 'Eine Übung, um starke Reaktionen/Angebote und klare Charaktere zu üben.

Es wird eine Zwei Personen Szene gespielt. Spieler A ist der Initiator und macht ein verbales Startangebot. Spieler B reagiert darauf. Nachdem die Szene (2-3min) vorbei ist, kann kurz in der Gruppe diskutiert werden, ob Spieler B "positiv" oder "negativ" reagiert hat.

Dann wird diesselbe Szene noch einmal gespielt, Spieler A gibt dasselbe Startangebot, nur diesmal reagiert Spieler B genau entgegengesetzt wie in der ersten Szene.

Spieler B kann auch durch eine Charaktereigenschaft klassifiert werden (reagiert er wütend, fröhlich, gelassen auf das Angebot/die Situation).

Gut beobachtet werden kann hier, wie eine unterschiedliche Reaktion auf dasselbe Startangebot zu einer komplett anderen Szene und einer komplett anderen Beziehung der Szenencharaktere führen kann.

Ein ähnliches Spiel ist Neue Wahl', 'https://improwiki.com/de/wiki/improtheater/andere_reaktion', '2020-11-14 07:44:23.176', 218);
INSERT INTO public.part VALUES (219, 1, '2020-12-02 22:04:11.919331', '2020-12-02 22:04:11.919331', 'Szenenmix 10 mal 20', 'Das Ziel dieser Übung ist es in kürzester Zeit ganz klar zu machen, worum es in einer Szene geht. Es trainiert das Machen von großen, starken Angeboten.

Es werden kurz hintereinander 10 Szenen mit jeweils 2 Spielern angespielt. Jede der 10 Szenen dauert nur 20 Sekunden (oder eine andere vom Übungsleiter gewählte Länge: 10s, 30s, 1min..). Der Übungsleiter stoppt jeweils die Zeit und nach 20 Sekunden springen zwei neue Spieler auf die Bühne und starten eine neue Szene.

Da die Spieler nicht viel Zeit haben, können Sie sich dadurch eventuell mehr zutrauen und in der Szene mehr riskieren und Angebote und Reaktionen auf Angebote groß machen.

*   Variationen: Nachdem alle 10 Szenen durchgespielt wurden, kann der Übungsleiter von diesen ein paar Szenen auswählen (zum Beispiel die beiden zuletzt gespielten Szenen) und diese von den Spielern an der Stelle weiterspielen lassen (z.B. 1 Minute lang), wo sie vorher geendet haben. Nach 1 Minute kann dann zur nächsten Szene gewechselt werden.

*   Um noch weitere Hilfestellungen zu geben, können die weitergespielten Szenen immer nach einer festen Zeit gestoppt werden (z.B. immer jeweils nach 1 min) und dann kurz rekapituliert werden, was bisher eigentlich in der Szene geschehen ist und welche Möglichkeiten es eventuell gibt, diese Szene weiterzuspielen. Wurden gegebene Angebote auch tatsächlich angenommen und berücksichtigt?', 'https://improwiki.com/de/wiki/improtheater/szenenmix_10_mal_20', '2020-11-14 07:44:23.101', 219);
INSERT INTO public.part VALUES (220, 1, '2020-12-02 22:04:12.318357', '2020-12-02 22:04:12.318357', 'Zweierassoziation', 'Das Spiel geht ab vier Personen, allerdings macht es mit mehr Leuten deutlich mehr Spaß.

Die Spieler bilden einen Kreis. Zwei beliebige treten in die Mitte des Kreises. Die außen im Kreis verbliebenen zählen nun herunter von drei auf eins. Bei "eins" sagen die zwei Spieler in der Mitte des Kreises gleichzeitig einen ihnen spontan einfallenden Begriff; danach stellen sie sich zwischen die Anderen in den Kreis zurück. Nun versuchen alle _in Gedanken_, einen Begriff zu assoziieren, der mit BEIDEN genannten Begriffen zu tun hat. Zwei andere gehen nun in das Kreisinnere. Die im Kreis außen Verbliebenen zählen nun wieder bis eins herunter. Bei "eins" sagen die zwei Spieler in der Mitte des Kreises gleichzeitig den soeben von ihnen jeweils gedanklich assoziierten Begriff. Wenn das zwei unterschiedliche Begriffe sind, dann gehen diese zwei auch wieder zu den Anderen in den Kreis zurück und es geht so lange mit wechselnden Assoziationen durch wechselnde Spieler weiter, wie oben beschrieben, bis Folgendes passiert: Wenn schließlich irgendwann zwei im Kreisinneren stehende Spieler die gleiche Begriffassoziation hatten und ausgesprochen haben, dann ist die Freude groß und es geht mit neuen Begriffen von vorne los.

## Beispiel:

Die Spieler in der Mitte sagen gleichzeitig:  
"Buch" und "Blut"  
Danach sagen zwei anderen Spieler im Kreis ihre Assoziation zu "Buch" und "Blut":  
"Medizinstudium" und "Schnittverletzung"  
Da die Begriffe nicht übereinstimmen, gibt es eine nächste Runde. Hier sagen nun zwei andere Spieler im Kreis gleichzeitig:  
"Pflaster".  
\- Freude und Ende -

## Hinweise und Tipps

*   Da die gleichzeitig gesprochenen Begriffe häufig von den anderen nicht alle verstanden werden, wiederholen die beiden im Kreis danach noch einmal hintereinander ihren soeben ausgesprochenen Begriff.
*   Die Folgeassoziationen entstehen also bereits dann, wenn man im Kreisrund steht, werden aber erst dann, wenn man in der Mitte steht, laut ausgesprochen. Sie sind also nicht, wie in der ersten Runde, unmittelbar nach der "Eins" spontan.', 'https://improwiki.com/de/wiki/improtheater/zweierassoziation', '2020-11-14 07:44:23.22', 220);
INSERT INTO public.part VALUES (221, 1, '2020-12-02 22:04:12.440356', '2020-12-02 22:04:12.440356', 'Ich bin ein Baum', 'Eine sehr beliebte Kettenübung, gut für Impro-Anfänger geeignet.

Die Spieler stehen um die Bühne/Raummitte herum. Ein Spieler A geht in die Mitte, macht eine Pose und sagt dazu, wen oder was er darstellt. Zum Beispiel hebt er die Arme über den Kopf und sagt "Ich bin ein Baum". Ein zweiter Spieler B kommt dazu, ergänzt das Bild und sagt ebenfalls, wer oder was er ist. Ein dritter Spieler C kommt hinzu und ergänzt die Angebote von A und B.

Wenn nun das Bild fertig gestellt ist, tritt A ab und nimmt einen der beiden Spieler mit. Der andere Spieler verbleibt auf der Bühne und wiederholt seinen Satz (ohne seine Pose zu ändern). Damit liefert er ein Angebot für ein neues Bild.

Diese Übung kann mit beliebig vielen Spielern stattfinden.

**Beispiel**

*   **A:** Ich bin ein Baum.
*   **B:** Ich bin der Hund, der an den Baum pinkelt.
*   **C:** Ich bin der Mann, dem der Hund gehört.
*   **A:** (tritt ab) Ich nehme den Mann mit.
*   **B:** Ich bin ein Hund.

Es ergibt sich automatisch, dass nicht nur Bilder dargestellt werden, sondern auch bildliche Darstellungen von abstrakten Begrifflichkeiten.

**Beispiel**

*   **A:** Ich bin ein Baum.
*   **B:** Ich bin sauerer Regen (Spieler B symbolisiert Regen, der auf Spieler A fällt).
*   **C:** Ich bin der Naturschutz (Spannt einen Schirm über Spieler A auf)
*   **A:** (tritt ab) Ich nehme den Naturschutz mit.
*   **B:** Ich bin (saurer) Regen. (Spieler B bleibt in der Mitte stehen)

Dieses Spiel kann auch erweitert werden, wenn man mit mehreren Spieler Bilder baut. Dann geht die Übung über in eine Maschine bauen. Zum Beispiel eine Maschine die einen Baum fällt und ihn zu Bleistiften verarbeitet.

siehe auch Danke', 'https://improwiki.com/de/wiki/improtheater/ich_bin_ein_baum', '2020-11-14 07:44:23.341', 221);
INSERT INTO public.part VALUES (222, 1, '2020-12-02 22:04:12.568018', '2020-12-02 22:04:12.568018', 'Five Things (Fünf Dinge)', 'Alle Spieler stellen sich im Kreis auf. Ein Spieler fängt an, seinen rechten Nebenmann zu fragen: „Nenne mir fünf Dinge, die…“, wobei er sich überlegt, was für fünf Dinge das sein sollen (z.B. „… die Du nicht in Deinem Bett finden willst!“). Der Spieler rechts neben ihm nennt – möglichst schnell und ohne nachzudenken, das ist das Ziel des Spiels – ein Ding nach dem Anderen. Nach dem ersten Ding ruft die Gruppe laut „Eins“, nach dem zweiten Ding „Zwei“ usw. Sind fünf Dinge genannt, ruft die gesamte Gruppe laut „Fünf Dinge!“ und der Spieler, der eben die fünf Dinge genannt hat, fragt seinen rechten Nebenmann nach fünf _anderen_ Dingen (z.B. „Nenne mir fünf Dinge, die du vor deinem Tod machen willst!“).

**Ziel des Spiels:** Geschwindigkeit (bei den fünf Dingen nicht nachdenken) und Rhythmus.

**Hinweise:**

*   Die abgefragten Dinge können völlig unterschiedlich sein und müssen keinem Muster folgen.
*   Wichtig ist, dass sie wie aus der Pistole geschossen genannt werden und der Gefragte nicht lange überlegt.
*   Die Antworten, also die fünf Dinge, müssen sich nicht unbedingt sinngemäß auf die Fragen beziehen.
*   Das Ausrufen der Zahlen oder "Fünf Dinge!" kann auch auf Englisch erfolgen, also "Five things!"

**Variante:**

*   Statt einer festen Reihenfolge steht eine Person anfangs in der Mitte und sucht sich eine beliebige Person im Kreis aus, stellt sich vor sie und fragt nach den fünf Dingen. Wenn die Person fertig geantwortet hat, tauscht sie die Position mit der Person in der Mitte und fragt ihrerseits eine beliebige Person, usw. ➝ so muss man die ganze Zeit aufmerksam sein, weil man nie weiß, wann man dran ist.', 'https://improwiki.com/de/wiki/improtheater/five_things_fuenf_dinge', '2020-11-14 07:44:23.275', 222);
INSERT INTO public.part VALUES (223, 1, '2020-12-02 22:04:12.690359', '2020-12-02 22:04:12.690359', 'Wortschwung', 'Bei dieser Übung stehen sich jeweils zwei gegenüber. Beide beginnen ihre Arme gleichzeitig nach vorne bis etwa Brusthöhe und dann nach hinten zu schwingen. Zunächst drei Mal nach vorn und nach hinten. Sind ihre Arme zum vierten Mal vorne-oben sagen beide zur gleichen Zeit ein frei assoziiertes Wort. Beim nächsten Schwung assoziieren sie auf das vorherige Wort ihres Gegenübers. Usw. Das heißt beide reden immer gleichzeitig. Fällt einem der Spieler nicht rechtzeitig ein Wort ein, geht es von vorn los, d.h. drei Mal wortloses Schwingen, dann assoziieren.

Bei dieser nicht leichten Übung wird auch das Scheitern trainiert!

zurück zu den Übungen', 'https://improwiki.com/de/wiki/improtheater/wortschwung', '2020-11-14 07:44:23.276', 223);
INSERT INTO public.part VALUES (224, 1, '2020-12-02 22:04:12.811522', '2020-12-02 22:04:12.811522', 'Assoziationskreis', 'Alle Spieler bilden einen Kreis. Einer im Kreis sagt ein Wort zu seinem Nachbarn Dieser assoziiert zu diesem Begriff ein neues Wort und sagt dies dem nächsten Spieler, usw.

Dabei ist es nicht von Bedeutung, möglichst originelle Assoziationen zu haben. Als Grundregel gilt: _Es gibt keine "falsche" Antwort._ Damit soll die "Zensur im Kopf" ausgeschaltet werden. Auch die Wiederholung von bereits genannten Begrifen ist erlaubt.

Wichtig ist das Finden eines gemeinsamen Rhythmusses und das Entstehen eines gewissen Flusses von Begrifflichkeiten (_Flow_). Man wird sehen, daß es mit einer gewissen Geschwindigkeit leichter fällt zu Assoziieren, da das Nachdenken erschwert wird.

Man sollte darauf achten, wirklich auf das zuletzt gehörte Wort zu assoziieren und nicht auf ein Wort, das 2 oder 3 Stationen vorher dran war.

Fortgeschrittene sollten bei der Übung darauf achten, vorzugsweise eher auf das "Bild" als auf das "Wort" zu assoziieren. Beispiel:

*   "Feuerwehr" - "Auto" ist eine Wortassoziation ("Feuerwehrauto" ist ein Begriff)
*   "Feuerwehr" - "Hochhaus" ist eine Bildassoziation (die Feuerwehr löscht ein brennendes Hochhaus)
*   "Schnee" - "O Weh" ist eine Wortassoziation (Reim)
*   "Schnee" - "Yeti" ist eine Bildassoziation (im Schnee steht ein Yeti)

**Variante:** Man assoziiert zunächst nur gedanklich einen Begriff und assoziiert auf diesen dann einen weiteren, den man ausspricht. Beispiel:  
A: "Haus"  
B: denkt "Schlüssel", spricht: "Metall"

', 'https://improwiki.com/de/wiki/improtheater/assoziationskreis', '2020-11-14 07:44:23.429', 224);
INSERT INTO public.part VALUES (412, 1, '2020-12-02 22:04:42.589745', '2020-12-02 22:04:42.589745', 'Simon says', 'Eine Person leitet an, die anderen folgen den Anweisungen. Aber nur wenn vor der Aufforderung "Simon says" gesagt wird. Sagt die leitende Person "hinsetzen", müssen alle stehenbleiben, wer sich hinsetzt oder die Bewegung andeutet ist draußen. Nur bei "Simon says: Hinsetzen" ist Hinsetzen richtig, und wer stehenbleibt fliegt raus. Bis schließlich eine Person übrig bleibt. Diese kann die neue anleitende Person sein, wenn eine zweite Runde gespielt werden soll.', 'https://improwiki.com/de/wiki/improtheater/simon_says', '2020-11-14 07:44:31.692', 412);
INSERT INTO public.part VALUES (225, 1, '2020-12-02 22:04:12.917306', '2020-12-02 22:04:12.917306', 'Assoziation Substantiv Adjektiv', 'Zwei stehen sich gegenüber, die anderen stellen sich in zwei gleich langen Schlangen an. Der erste nennt ein Substantiv und stellt sich hinten an der anderen Schlange an. Der zweite assoziiert zum Substantiv eine Eigenschaft und stellt sich an der ersten Gruppe an. Der nächste aus der ersten Gruppe assoziiert wiederum ein Substantiv zur genannten Eigenschaft usw. Jeder assoziiert somit abwechselnd ein Substantiv und ein Adjektiv. Ist der Ablauf klar, kann das Tempo erhöht werden.

_Siehe auch_ Assoziieren', 'https://improwiki.com/de/wiki/improtheater/assoziation_substantiv_adjektiv', '2020-11-14 07:44:23.315', 225);
INSERT INTO public.part VALUES (226, 1, '2020-12-02 22:04:13.039477', '2020-12-02 22:04:13.039477', 'Dissoziation', 'Der Spieler "assoziiert" Worte hintereinander, die _nichts_ miteinander zu tun haben. Wird ein passendes Wort assoziiert oder denkt der Spieler zu lange nach, kommt der Nächste dran. Einer (z.B. der Übungsleiter) entscheidet darüber.

Beispiel:

Hund, Molekül, Sargträger, Wolle, Gitarre, Noten -> Nächster

Bei dieser Übung zeigt sich, dass Assoziieren das Normale ist und dass es schwierig ist, _nicht_ zu assoziieren.

_Siehe auch_ Assoziieren', 'https://improwiki.com/de/wiki/improtheater/dissoziation', '2020-11-14 07:44:23.4', 226);
INSERT INTO public.part VALUES (227, 1, '2020-12-02 22:04:13.171147', '2020-12-02 22:04:13.171147', 'Assoziationsrunde', 'Alle laufen durch den Raum bis einer mit einem lauten Tritt auf den Boden stehen bleibt und auf einen Spieler zeigt.

Dann bleiben alle stehen. Derjenige, welcher zuerst stehen geblieben ist, nennt demjenigen, auf den er zeigt ein x-beliebiges Wort.Der nächste assoziiert etwas mit diesem Wort und nennt seine Assoziation und zeigt auf einen weiteren Spieler.

Das geht solange, bis einer stockt. Dann laufen alle weiter und ein anderer bleibt stehen.

Die Assoziationen sollten möglichst schnell geschehen.

Es ist darauf zu achten, dass man wirklich auf das letztgenannte Wort assoziiert und nicht auf eins, was drei Stationen vorher gefallen ist.

z.B. Kaffee - Bohne - Erbse - Prinzessin - Märchen - Buch - Seite...

_Siehe auch_ Assoziieren', 'https://improwiki.com/de/wiki/improtheater/assoziationsrunde', '2020-11-14 07:44:23.425', 227);
INSERT INTO public.part VALUES (228, 1, '2020-12-02 22:04:13.317764', '2020-12-02 22:04:13.317764', 'Lunge leer', 'Die Spieler atmen tief ein und gehen dann kreuz und quer durch den Raum, währenddessen atmen sie kontinuierlich mit einem tonlosen "sch"-Zischen aus. Es wird solange gegangen, ausgeatmet und "sch" gemacht, wie noch Luft in der Lunge ist, dh. es wird versucht, den letzten Rest Luft aus der Lunge zu pressen. Erst wenn die Lunge leer ist, bleibt jeder individuell stehen, schließt die Augen, atmet ruhig einige Mal ein und aus und entspannt sich. Wenn der Betreffende wieder bereit und in der Lage ist weiter zu gehen, öffnet er die Augen und geht bewusst und (kon-) zentriert (wie wenn er die Bühne betritt) wieder los, kreuz und quer durch den Raum, mit "sch"-Laut und Ausatmen bis zum letzten Luftrest – usw.

Mit dieser Übung wird die Atmung (auch das Zwerchfell) angesprochen/aktiviert, daneben werden Konzentration, Zentrierung und Präsenz geübt.', 'https://improwiki.com/de/wiki/improtheater/lunge_leer', '2020-11-14 07:44:23.499', 228);
INSERT INTO public.part VALUES (229, 1, '2020-12-02 22:04:13.454491', '2020-12-02 22:04:13.454491', 'Atemübung', 'Die folgende Übung ist jedoch nur für "Ausatmer" geeignet. Bei der professionellen Stimmbildung werden alle Menschen in "Einatmer" und "Ausatmer" unterteilt. Klicken Sie http://www.hagena.info/1.html, um den eigenen Atemtyp herauszufinden. Ist allerdings nur was für Leute, die mit Esoterik was am Hut haben.

Man singt einen anhaltenden Ton, achtet aber darauf, dass man dabei durch den Bauch atmet, diesen also langsam einzieht. Die Brust bleibt dabei immer gleich.

Der Effekt dessen ist, dass man dann, wenn man keine Luft mehr übrig hat, einfach nur die Bauchmuskeln wieder entspannen muss, und automatisch einatmet, weil man die Luft nicht reinpresst, sondern sie reingezogen wird.

Damit hat man beim Singen längere Zeit ein gleiches Stimmvolumen, da die Brust ja gleich groß bleibt. Außerdem muss man sich nicht überlegen, wo man am besten eine Atempause macht, da diese praktisch fast entfällt, weil die Zeit, die man zwischendurch zum Einatmen benötigt, verringert wird und automatisch geschieht.', 'https://improwiki.com/de/wiki/improtheater/atemuebung', '2020-11-14 07:44:23.513', 229);
INSERT INTO public.part VALUES (230, 1, '2020-12-02 22:04:13.576181', '2020-12-02 22:04:13.576181', 'Zwerchfell-Training', 'Das Zwerchfell-Training ist eine Vorübung zum Gesangstraining.  
Die Gruppe stellt sich im Kreis auf.  
Der Leiter Spielleiter gibt den Takt vor und alle stimmen ein.  
Es werden folgende drei Konsonanten so laut wie es geht gesprochen, allerdings ohne Mitlaut (Vokal).  
**P - T - K**.

Diese werden ein paar Mal wiederholt, dann gibt der Spielleiter ein Zeichen und sie werden doppelt so schnell gesprochen, also **PP - TT - KK**. Es folgt: **PPP - TTT - KKK**, **PPPP - TTTT - KKKK** und letztendlich **PPPPP - TTTTT - KKKKK**.

Dabei wird die Hand auf den Bauch gelegt um das Zwerchfell zu spüren, dieses muss sich bei der Übung schnell bewegen.

Nach gleichem Schema wiederholt man die Übung mit den Lauten: **F - S - Sch** bis zum **FFFFF - SSSSS - SchSchSchSchSch**.

Die erste Übung dient zum Training des unteren Zwerchfells, die zweite ist für das obere Zwerchfell. Den Unterschied spürt man, wenn man die Hand auf den Bauch legt.', 'https://improwiki.com/de/wiki/improtheater/zwerchfell-training', '2020-11-14 07:44:23.532', 230);
INSERT INTO public.part VALUES (231, 1, '2020-12-02 22:04:13.697276', '2020-12-02 22:04:13.697276', 'Mimik raten', 'Ein Spieler (A) kniet sich hinter einen Stuhl o.ä. so, dass die anderen nur seinen Kopf sehen. Dann bekommt er vom Spielleiter Gefühle eingeflüstert, die er nur mittels Mimik ausdrücken soll (d.h. ohne den Einsatz von Sprache oder Gestik). Die anderen Spieler versuchen, das Gefühl zu erraten.', 'https://improwiki.com/de/wiki/improtheater/mimik_raten', '2020-11-14 07:44:23.623', 231);
INSERT INTO public.part VALUES (232, 1, '2020-12-02 22:04:13.825609', '2020-12-02 22:04:13.825609', 'Künstlich weinen', 'Ich zeige euch jetzt wie ihr künstlich weinen könnt, weil ich viele Einträge gesehen hab wo man an etwas trauriges denken müsst, ich zeige es euch heute anders. Ihr müsst solange es geht nicht blinzeln, dann einmal blinzeln und wiederholen. Das macht man dann 5 min. lang und dann kommen die Tränen. Wenn ihr es echter wirken lassen wollt, dann müsst ihr noch schniefen und das wars auch schon!', 'https://improwiki.com/de/wiki/improtheater/kuenstlich_weinen', '2020-11-14 07:44:23.593', 232);
INSERT INTO public.part VALUES (233, 1, '2020-12-02 22:04:13.936881', '2020-12-02 22:04:13.936881', 'Genießen von Speis'' und Trank', 'Bei dieser Übung trainiert man, wie man Speisen und Getränke zu sich nimmt und übt gleichzeitig natürlich auch Pantomime und Körperausdruck allgemein.

*   _Wie isst man (heißhungrig) Obst?_  
    

... einen Apfel, Kirschen, Erdbeeren, Bananen, Ananas, ein Stück Erdbeertorte usw.

*   _Wie isst man (gierig) Süßigkeiten?_  
    

... einen Schokoriegel, Gummibärchen, einen Schokoweihnachtsmann, ein Überraschungsei usw.

*   _Wie trinkt man unterschiedliche Getränke aus den typischen Gläsern?_  
    

... säuerlichen Wein, einen kalten Sekt, ein warmes Bier, heißen Kaffee, kalte Limonade, einen guten Whiskey usw.

Wichtig ist es, die ausgeführten Bewegungen zu steigern und wichtig ist die damit verbundene Stimm- und Lautbildung.

**Variante:** Das Zu-Sich-Nehmen von Speisen und Getränken, die man grundsätzlich nicht mag oder die man gerade in den Mund genommen hat und die nun zu sauer, zu bitter, zu süß, verdorben, zäh, zu weich, zu heiß, zu kalt usw. sind.', 'https://improwiki.com/de/wiki/improtheater/geniessen_von_speis_und_trank', '2020-11-14 07:44:23.673', 233);
INSERT INTO public.part VALUES (234, 1, '2020-12-02 22:04:14.053365', '2020-12-02 22:04:14.053365', 'Laut-stumm-Spiel', 'Gefühle und besonders Gefühlsausbrüche werden ja oft von Lauten begleitet. Ein erstaunter Mensch sagt spontan "Ooohh!". Ein angeekelter Mensch "Iiiih" usw. Diese Grundlaute kann man sich zunutze machen, um die Mimik und den Ausdruck zu üben und sich einzuprägen. Außerdem gibt diese Übung auf der Bühne eine Mimik-Sicherheit, wenn man sich unhörbar den Buchstaben auf das Gesicht zaubert.

_**Übung:**_

Alle Mitspieler stehen im Kreis. Der Leiter gibt die Laute vor und alle lautieren gleichzeitig auf Kommando (1, 2, 3 und...!). Der gleiche Buchstabe wird mehrere Male wiederholt und dabei die Lautstärke gesteigert. Gleichzeitig fordert man die Mitspieler auf, die Intensität, das Verzerren des Gesichtsausdrucks zu steigern. Ist man bei einer befriedigend Ausdrucksweise angekommen, lautet die Aufforderung an die Mitspieler, das Gesicht nach dem Lautieren einzufrieren, zu halten. Das prägt die Mimik noch mehr ein. Als Letztes werden die Mitspieler aufgefordert, den immer noch gleichen Buchstaben pantomimisch darzustellen, also mit gleicher Intensität wie das Laute und Verzerrte, dies jedoch ohne einen Ton von sich zu geben. Natürlich ist es insgesamt hilfreich, wenn die Gestik unterstützend eingesetzt wird.

Beispiele (natürlich ausbaufähig und nuancierbar):

**Aaa!** Freude, Erwartung, Genuss, Schmerz usw.

**Ohh!** Erstaunen, Verwunderung, Skepsis usw.

**Uuh!** Unangenehm, Abwehr, Schmerz, Ekel

**Iiih!** Ekel, Zweifel, Frage

**Mmmh!** Genuss, Überlegung, Nachdenken

usw. usw.

Ein netter Nebeneffekt dieser Übung ist, dass sich Komplexe abbauen und man freier im Ausdruck wird, weil sich ja alle gleichzeitig blamieren. :-)', 'https://improwiki.com/de/wiki/improtheater/laut-stumm-spiel', '2020-11-14 07:44:23.672', 234);
INSERT INTO public.part VALUES (235, 1, '2020-12-02 22:04:14.171548', '2020-12-02 22:04:14.171548', 'Ja - Nein', 'Es werden Paare gebildet, und jedes Paar unterhält sich. Allerdings einzig und allein mit Benutzung der beiden Worte "Ja" und "Nein". Ein Gesprächspartner sagt immer nur "Ja", der andere immer nur "Nein". Nach einer Weile wird gewechselt.  
Trotzdem wird man feststellen, dass eine Unterhaltung möglich ist und primär die Körpersprache und die ausgedrückten Gefühle zählen.

  
  

#### Variante:

Die Spieler sagen sich anstatt "Ja" und "Nein", "Komm her" und "Geh Weg". Dabei sollen sie möglichst viele Gefühlslagen (Gestik, Mimik, Stimme) und Lautstärken ausprobieren, sich jedoch körperlich nicht berühren. Wie reagiert der Partner? Übernehme ich seine Stimmung oder reagiere ich mit dem kompletten Gegenteil?  
Auch bei dieser Variante stehen die Körpersprache und die ausgedrückten Gefühle im Vordergrund, wobei die Spieler zusätzlich zum Ausprobieren möglichst verschiedener Gefühle ermutigt werden und die Reaktionen ihres Partner studieren sollen.  
Die Übung kann sehr inspirierend sein und zeigen was allein Nuancen in der Stimmlage ausmachen und mit uns und unserem Gegenüber machen können.  
Nach einer Weile wird der Satz gewechselt.', 'https://improwiki.com/de/wiki/improtheater/ja_-_nein', '2020-11-14 07:44:23.71', 235);
INSERT INTO public.part VALUES (236, 1, '2020-12-02 22:04:14.282595', '2020-12-02 22:04:14.282595', 'Mantra', '## Reden

Es sitzen sich zwei Spieler gegenüber. Sie unterhalten sich über ein banales Thema.

Dann das gleiche noch einmal, aber nun versuchen sie, während sie reden und zuhören, an einen bestimmten Satz zu denken und ihn auch zu fühlen z.B. „ich bin ungeduldig“ oder „ich fühle mich verunsichert“.

Die Zuschauer geben Rückmeldung, ob sich an ihrer Wahrnehmung der Spieler etwas geändert hat.

## Szene

Der Spielleiter gibt beiden Spielern einen bestimmten Satz oder eine Regel vor. Dies tut er, ohne dass die Zuschauer die "geheime" Vorgabe vorher erfahren. Dann wird eine Szene unter Berücksichtigung dieser "geheimen" Vorgabe gespielt.

Vorgabe kann z.B. ein Satz sein, wie oben unter Reden beschrieben, aber auch z.B., dass die Spieler das ABC-Spiel machen sollen oder dass sie eine bestimmten Buchstaben vermeiden sollen.

Nach Ende der Szene geben die Zuschauer Rückmeldung, ob ihnen an der Spielweise etwas aufgefallen ist - was i.d.R. der Fall ist. Es könnte z.B. langsamer gespielt worden sein oder konzentrierter, abwesend(er) usw.', 'https://improwiki.com/de/wiki/improtheater/mantra', '2020-11-14 07:44:23.731', 236);
INSERT INTO public.part VALUES (237, 1, '2020-12-02 22:04:14.399027', '2020-12-02 22:04:14.399027', 'Mimik', 'Alle gehen durch den Raum. Der Spielleiter benennt ein Gesichtsteil (Nase, Ohren, Stirn, Augen, Mund, Backen, Zunge, etc.) und jeder bewegt dieses Gesichtsteil so extrem er nur kann in alle Richtungen.

**Beispiel für Mund:** Breit grinsen, Schmollen, Küssen, weit öffnen...', 'https://improwiki.com/de/wiki/improtheater/mimik', '2020-11-14 07:44:23.764', 237);
INSERT INTO public.part VALUES (238, 1, '2020-12-02 22:04:14.517016', '2020-12-02 22:04:14.517016', 'Beschimpfung', 'Bei diesem Aufwärm- und Übungsspiel bilden sich Paare, die sich in einiger Entfernung gegenüberstehen. Sie gehen nun langsam aufeinander zu und beschimpfen sich dabei mit Gemüse- und/oder Früchtenamen wie "Du Pampelmuse!", "Du Apfelsine!". Je näher sich die beiden kommen, desto lauter und extremer wird es, wenn sie wieder auseinandergehen, schwächen sich die Beschimpfungen wieder ab.', 'https://improwiki.com/de/wiki/improtheater/beschimpfung', '2020-11-14 07:44:23.766', 238);
INSERT INTO public.part VALUES (239, 1, '2020-12-02 22:04:14.645753', '2020-12-02 22:04:14.645753', 'Steigerung', 'Die Spieler stehen im Kreis. Einer macht zu seinem Nachbarn eine dezente Geste oder Bewegung ggfls. begleitet von einem Wort oder Ton. Der Nächste macht das Gleiche, aber ein wenig stärker. So geht es reihum, immer ein wenig gesteigert - bis es nicht mehr geht. Dann fängt derjenige, der keine Steigerungsmöglichkeit mehr sieht, eine neue Runde an.

**Variation:** Wenn die Geste oder Bewegung nicht mehr gesteigert werden kann, wird sie vom Nächsten wieder langsam abgeschwächt, bis sie kaum noch wahrzunehmen ist.

## Geht da noch mehr?

Diese Übung ist eine Variante von "Steigerung", bei der Paare gebildet werden, die sich im Raum verteilen. Einer (A) macht irgendeine klitzekleine Geste. Der andere (B) ist von dieser schauspielerischen Leistung total begeistert, zeigt diese Begeisterung, und fragt zugleich "Geht da noch mehr?" A wiederholt nun die Geste, diesmal ein kleines bisschen größer. B ist noch begeisterter, usw.

Ziel ist, A durch dieses Feedback und das Prinzip der Steigerung aus sich herauszuholen, bis die kleine Handlung in ihr absolutes Maximum eskaliert. Die Stimme darf natürlich auch dazugenommen werden.

Dann wechseln die Partner die Rollen.

**Sinn der Übung:** Gut für Anfänger, die beim Schauspielen noch gehemmt sind! Die ganze Bandbreite der körperlichen Ausdrucksmöglichkeiten kennenlernen, Hemmungen abbauen, Spaß durch positives Feedback (Begeisterung)', 'https://improwiki.com/de/wiki/improtheater/steigerung', '2020-11-14 07:44:23.847', 239);
INSERT INTO public.part VALUES (240, 1, '2020-12-02 22:04:14.780566', '2020-12-02 22:04:14.780566', 'Ball-Metamorphose', 'Die Spieler stehen im Kreis. Sie werfen sich einen imaginären Ball zu. Vor jedem Wurf ändert der Ball seinen Charakter. Bei dem einen Spieler ist er z.B. schwer, beim nächsten dreckig, er ist groß, glitschig, ohne Luft, elektrisch geladen, klein, heiß usw. Der aufnehmende Spieler übernimmt zunächst den dargestellten Charakter des Balls, während er sich zum Nachbarn dreht, um diesem den Ball zuzuwerfen, verändert sich der imaginäre Ball.

Siehe auch: Geräuschball', 'https://improwiki.com/de/wiki/improtheater/ball-metamorphose', '2020-11-14 07:44:23.825', 240);
INSERT INTO public.part VALUES (428, 1, '2020-12-02 22:04:45.881329', '2020-12-02 22:04:45.881329', 'Dreieck', 'Jeder Spieler nimmt sich zunächst zwei andere Spieler als Bezugspersonen, ohne seine Auswahl zu verraten. Aufgaben aller Spieler ist es nun, sich dauernd im Raum zu bewegen und jederzeit mit den anderen beiden ein gleichschenkliges Dreieck zu bilden. Da die betreffenden zwei Spieler vermutlich andere Spieler für "ihr" jeweiliges Dreieck ins Auge gefasst haben, ist die Gruppe dauernd in Bewegung, weil jeder natürlich sein Dreieck bilden bzw. erhalten will.

Ähnlich ist Sympathie - Antipathie', 'https://improwiki.com/de/wiki/improtheater/dreieck', '2020-11-14 07:44:31.769', 428);
INSERT INTO public.part VALUES (241, 1, '2020-12-02 22:04:14.923361', '2020-12-02 22:04:14.923361', 'Zeitlupenschlägerei', 'Die Spieler tragen eine pantomimische Schlägerei in Zeitlupe aus. Die Gestik und Mimik ist dabei ausladend und gerne auch etwas übertrieben. Wichtig ist, dass beide austeilen und einstecken. Die Spieler sollen nicht zu oft ausweichen, sondern auch "volle Kanne getroffen" werden und sowohl das Schlagen als auch das Getroffenwerden maximal ausspielen.

Das Spiel kann entweder paarweise gespielt werden, oder die ganze Gruppe kämpft zugleich, "jeder gegen jeden".

Die Übung ist zum Aufwärmen geeignet, gut zum Hemmungen- und Frust-Abbauen, und trainiert außerdem den Ausdruck.', 'https://improwiki.com/de/wiki/improtheater/zeitlupenschlaegerei', '2020-11-14 07:44:23.889', 241);
INSERT INTO public.part VALUES (242, 1, '2020-12-02 22:04:15.061021', '2020-12-02 22:04:15.061021', 'Nach der Katastrophenmitteilung', 'Bei dieser Übung sitzen sich zwei Spieler schräg gegenüber, dh. sie sind schräg dem Mitspieler und schräg den zuschauenden Spielern zugewandt. Aufgabe beider Spieler ist es, ohne Sprechen, nur mit Mimik und Gestik (auch Aufstehen, Herum- und Weggehen ist erlaubt) ihr Gefühlsleben NACH einer schlimmen, unangenehmen, peinlichen oder schrecklichen Mitteilung darzustellen. Diese Mitteilung wird von den zuschauenden Spielern vorgeschlagen. Beispiele:

*   "Ich bin von deinem besten Freund schwanger!"
*   "Du bist nicht meine leibliche Tochter, sondern adoptiert!"
*   "Mama, ich habe Vater umgebracht!"
*   "Ich bin bankrott, ich muss sie entlassen!"

Die Szene beginnt also unmittelbar NACH der Katastrophenmitteilungen. Und BEIDE gehen in ihre Emotion(en) und reagieren natürlich auch aufeinander, aber alles ohne Reden!', 'https://improwiki.com/de/wiki/improtheater/nach_der_katastrophenmitteilung', '2020-11-14 07:44:23.837', 242);
INSERT INTO public.part VALUES (243, 1, '2020-12-02 22:04:15.179702', '2020-12-02 22:04:15.179702', 'Wartezimmer', 'Vier Spieler sitzen nebeneinander auf der Bühne. Sie befinden sich in einem Wartezimmer beim Arzt. Jeder der Vier sucht sich einen Spieler, den er liebt, einen den er hasst und einen der ihm stinkt (geruchstechnisch).

Dann wird frei improvisiert und man unterhält sich über dies und das und macht den restlichen Spielern, welche das Publikum bilden klar, zu welcher Person man welches Gefühl zeigt..

Eindeutige Sätze wie "Ich liebe dich", "Du stinkst mir aber" oder "Ich kann Sie nicht leiden" darf man nicht einflechten, das wäre zu einfach. Die Stühle dürfen außerdem nicht aus Sympathie- oder Antipathiegründen verrückt werden.

Nach einer Weile stoppt der Spielleiter die Szene und das Publikum errät, wer wen liebt, hasst und wer wem stinkt. Die vier Spieler auf der Bühne sagen nicht, ob es richtig ist.

Falls es bei dem einen oder anderen nicht deutlich genug rübergekommen ist, wird weitergespielt und diejenigen müssen dies nun deutlicher zum Ausdruck bringen.

Besonders schwierig wird es, wenn sich über Kreuz unterhalten wird, was schon mal vorkommen kann, da die vier Stühle nebeneinander stehen. Man sollte aber darauf achten, dass nicht hinter dem Rücken der anderen Spieler geredet wird, da diese dies dann eventuell nicht mitbekommen.', 'https://improwiki.com/de/wiki/improtheater/wartezimmer', '2020-11-14 07:44:23.938', 243);
INSERT INTO public.part VALUES (244, 1, '2020-12-02 22:04:15.311607', '2020-12-02 22:04:15.311607', 'Ampel', 'Bei dieser Übung trainiert man Wahrnehmung, Gehen, Begegnung, Status, Haltung, Figur

Spielidee: Die typische und allen bekannte Situation – zwei Gruppen stehen sich an einer belebten (breiten!) Straße an den Fußgängerampeln gegenüber – wird als Impro gespielt. Eine dritte Gruppe beobachtet möglichst genau. Beide Gruppen stehen und schauen (Ampel, Gegenüber, Straße). Auf den Impuls eines Spielers gehen alle los (grün), begegnen sich (Status), weichen aus, rempeln, etc. Alle nehmen dabei eine Haltung ein oder geben sich eine Figur/Rolle. Es wird nichts verabredet! An den beiden Enden des Raumes wird umgedreht, an den Ampeln wieder angehalten, das Spiel beginnt von vorne (mit und ohne Sprache möglich). Anregung: Die Gesichter werden leer, man beobachtet die eigene Gruppe und die Gruppe gegenüber, einer geht zu früh los und zuckt zurück, Autos werden mit dem Blick verfolgt und vielleicht kommentiert, ein LKW fährt durch Pfütze und vorne werden alle nass, es regnet, schneit, ist heiß, Ampel geht kaputt … Die beiden imaginären Ampeln und der Zebrastreifen werden vor Spielbeginn installiert.', 'https://improwiki.com/de/wiki/improtheater/ampel', '2020-11-14 07:44:23.984', 244);
INSERT INTO public.part VALUES (245, 1, '2020-12-02 22:04:15.439739', '2020-12-02 22:04:15.439739', 'Mimik spiegeln', 'Ein Spieler (A) steht den anderen Spielern gegenüber, die sich in einem leichten Halbkreis vor ihm anordnen, so dass er sie alle gut sehen kann. Die anderen Spieler spiegeln fortwährend die Mimik von A, zunächst (a) so präzise wie möglich. Später kann man auch die Variante spielen, dass die anderen Spieler die Mimik von A (b) leicht oder (c) stark übertrieben (karikiert) spiegeln.

A kann entweder frei irgendwelche Mimik ausprobieren, oder er bekommt vom Spielleiter Gefühle eingeflüstert, die er darstellen soll. Anhand des vielfachen Spiegels bekommt A ein fortwährendes Feedback darüber, was er gerade ausdrückt und wie seine Mimik auf die Zuschauer wirkt.', 'https://improwiki.com/de/wiki/improtheater/mimik_spiegeln', '2020-11-14 07:44:23.948', 245);
INSERT INTO public.part VALUES (246, 1, '2020-12-02 22:04:15.562345', '2020-12-02 22:04:15.562345', 'Figur entwickeln', 'Wir gehen durch den Raum und stellen uns eine Person vor. Alter, Beruf, Sorgen usw. Wir bewegen uns wie diese Person. Dann stellen sich alle an den Rand. Einer tritt vor und bewegt sich wieder wie die Person, die er soeben entwickelt hat. Er geht eine Runde durch den Raum. Die anderen folgen ihm und versuchen die Körperhaltung, die Bewegung möglichst exakt zu imitieren. Schließlich tritt der Vormachende an den Rand und schaut sich die anderen an, die ihn weiterhin imitieren und noch eine Runde durch den Raum gehen.

siehe auch Charakter; Figur', 'https://improwiki.com/de/wiki/improtheater/figur_entwickeln', '2020-11-14 07:44:24.002', 246);
INSERT INTO public.part VALUES (247, 1, '2020-12-02 22:04:15.676606', '2020-12-02 22:04:15.676606', 'Szenenanfänge', 'Bei dieser Übung bilden alle Spieler zwei Reihen. Jeweils zwei stehen sich gegenüber und schauen sich an. In schneller Abfolge fängt nun jedes Paar jeweils eine Szene an. Es geht darum, dass durch Wort und Tat die Basisinformationen vermittelt werden: Wer sind die beiden (Name, Figur) , in welcher Beziehung stehen sie zueinander, wo sind sie? Ggfls. werden auch schon Angebote gemacht. Sind die Basisinformationen gegeben, wird die Szene abgebrochen und das nächste Paar startet.

## Varianten

*   Jeweils einer macht nur eine prägnante Handlung, der andere ergänzt verbal (z.B. einer tapeziert hektisch, der andere sagt: "Liebling, der Vermieter kommt schon heute Abend!").
*   Ergänzungsübung', 'https://improwiki.com/de/wiki/improtheater/szenenanfaenge', '2020-11-14 07:44:24.043', 247);
INSERT INTO public.part VALUES (248, 1, '2020-12-02 22:04:15.799443', '2020-12-02 22:04:15.799443', 'Ergänzungsübung', 'Die Spieler stellen sich auf zwei gegenüberliegenden Seiten der Bühne in zwei Reihen (Warteschlangen) auf. Ein Spieler aus Reihe A beginnt eine beliebige Szene. Sobald hinreichend klar ist, wer er ist, zum Beispiel ein Einbrecher, kommt ein Spieler aus der anderen Reihe dazu und ergänzt ihn passend zu seiner Rolle. Zum Beispiel als Hausbesitzer oder als Polizist oder als Konkurrenz-Einbrecher oder als die Frau des Einbrechers - es gibt immer mehr als nur eine Möglichkeit zur Ergänzung. Die Szene wird abgebrochen, sobald der Einstieg vollendet ist, und ein neuer Spieler beginnt eine neue Szene. Es geht bei dieser Übung nur darum, den "ergänzenden Einstieg" zu üben.

Es soll darauf geachtet werden, dass die Rollen ausreichend komplementär sind. Eine Einbrecher und sein Komplize sind höchstens dann interessant, wenn sie charakterlich sehr unterschiedlich sind. Eine ähnliche Figur ist keine gute Ergänzung.

Generell ist es eine gute Idee, auch emotional zu kontrastieren. Wenn der erste Spieler also melancholisch ist, ist der andere fröhlich, wenn der erste Hochstatus spielt, kommt der zweite mit Tiefstatus dazu (siehe Gegensätze)', 'https://improwiki.com/de/wiki/improtheater/ergaenzungsuebung', '2020-11-14 07:44:24.116', 248);
INSERT INTO public.part VALUES (249, 1, '2020-12-02 22:04:15.952872', '2020-12-02 22:04:15.952872', 'Statue - Szenenanfang', 'Eine Vorübung für Freeze Tag und andere Einfrier- oder Statuenspiele.

Die Spieler bilden Paare. Zunächst zeigt man an einem Paar, wie die Übung geht. Einer wird vom anderen zu einer beliebigen Statue modelliert. Dann tritt der Modellierer zurück und die "Statue" hat die Aufgabe, aus dieser Haltung heraus mit möglichst _einem Satz_:

1.  die Haltung zu rechtfertigen
2.  klarzumachen, wer sie ist (zumindest ungefähr)
3.  eventuell auch wo.

Das ist eine ganz schöne Herausforderung!

Wie macht man die eigene Rolle klar? Hierzu gibt es z.B. folgende Möglichkeiten:

*   **indem man den Partner definiert**. Beispiele:
    *   "Mami, ich mag nicht mehr in den Kindergarten!"
    *   "Schurke! An deinem Schwert klebt das Blut meiner Tochter!"
*   **indem man auf eine typische Tätigkeit hinweist**. Beispiele:
    *   "So, jetzt nehmt mal alle eure Hefte raus."
    *   "Bitte nehmen Sie Platz! Waschen und Schneiden, wie immer?"
*   **durch den Tonfall und die Sprache**. Beispiel:
    *   (hohe Stimme) "Hi hi hi hi! Das Süppchen ist ein guuuuuter Trank!"
    *   (lässige Stimme, langsam und "cool") "Hallo ... Joe. Du kommst spät."
*   **die Körpersprache, Gestik und Mimik** unterstützt die Rolle.
*   möglich, aber eher nicht empfehlenswert ist die Methode, indem man ein **Selbstgespräch** beginnt. Beispiel:
    *   "Was bin ich doch für ein genialer Wissenschaftler! Diese Erfindung wird mich berühmt machen!"

Es geht nur um den Szenenanfang, um die Vermittlung von Basisinformationen, die Geschichte wird nicht weitergespielt. Der Partner kann dem Spieler Feedback geben, was er als Zuschauer für eine Figur in ihm gesehen hat. Die Spieler wechseln sich ab.', 'https://improwiki.com/de/wiki/improtheater/statue_-_szenenanfang', '2020-11-14 07:44:24.12', 249);
INSERT INTO public.part VALUES (250, 1, '2020-12-02 22:04:16.085473', '2020-12-02 22:04:16.085473', 'Neue Wahl  - Basisinformationen', 'Bei dieser Übung geht es darum, die alsbaldige Äußerung oder Darstellung von Basisinformationen und den schnellen Wechsel zu üben (siehe auch ROTZ, CROW, CBZO).  
Basisinformationen sind insbesondere:

*   _Wer_ sind die Personen auf der Bühne?
*   In welcher _Beziehung_ und/oder in welchem _Status_ stehen sie zueinander?
*   _Wo_ sind sie?

(Eventuell auch:)

*   Welche _Routinen_ oder _Handlung_ verrichten sie?
*   In welchem _Genre_ und/oder welcher Epoche/Zeit spielt die Szene?
*   Worum geht es? (_Konflikt, Problem, Versprechen_) (meist später in der Szene)

An der Übung nehmen zwei Spieler und ein Spielleiter teil, wobei ein Spieler je Durchgang meist der Hauptakteur ist. Die Spieler beginnen und agieren/reden, bis der Spielleiter sagt: "Neue Wahl". Es geht immer nur um die Vermittlung der o.g. Basisinformationen. Der Spieler, der zuletzt eine der Basisinformationen geäußert hat, muss seinen letzten Satz durch einen neuen Satz ersetzen oder seine letzte Handlung, die eine Basisinformation vermittelt hat, durch eine neue ersetzen. (Nur) Die zuletzt gesagten Worte haben keine Bedeutung mehr bzw. die zuletzt gemacht Handlung hat keine Bedeutung mehr und werden/wird als nicht existent behandelt und komplett aus dem "Gedächtnis" gestrichen.  
Es geht um Übung, nicht um eine "schöne" Szene. Die wird es in der Regel nicht geben, weil sie immer wieder sehr schnell unterbrochen/zerhackt wird. Der jeweilige Durchgang kann sehr kurz sein, je nach dem, wie viel Basisinformationen bereits mit den ersten Sätzen oder den ersten Handlungen gegeben wurden.

**Beispiele**

(SL: NW = Spielleiter: "Neue Wahl") (in Klammern und eingerückt jeweils die Basisinformation)

Beispiel 1:

A: "Liebling?"...

(_Beziehung_: Ehepaar oder Liebespaar)  

SL: NW  
A: "Frau Schneider, geben sie mir bitte mal die Akte Müller?"

(_Personen/Beziehung/Status_: Chef-Mitarbeiterin; ein _Name_; _Ort_: Büro)  

SL: NW  
A: Dreht an einem Hebel.

(_Handlung_ ohne spezifische Information, könnte Bedienen eines technischen Geräts sein)  

B: "Mama, ich bin hungrig!"

(_Personen/Beziehung_: Mutter-Kinder; _Ort_: vermutlich in der Küche beim Bedienen des Herds; feststehend: Drehen am Hebel)  

SL: NW  
A: "Kapitän, der Antimaterie-Transmitter fährt jetzt auf Voll-Last!"

(_Personen/Beziehung/Status_: Raumschiff-Crew-Mitglied und Kapitän; _Ort_: Raumschiff-Brücke; _Zeit/Genre_: Zukunft/Science Fiction; feststehend: Drehen am Hebel).  

B: "Mary, beschleunigen sie jetzt auf Überlichtgeschwindigkeit!

(_Name/Statusbestätigung_)  

Beispiel 2:

B tapeziert.

(_Routine/Handlung_)  

SL: NW  
B schraubt eine Birne an der Decke ein.

(_Handlung_)  

SL: NW  
B hustet heftig.

(_Handlung_)  

A horcht B ab.

(Husten steht fest und bleibt. _Person_: Arzt; _Beziehung_: noch unklar, eher unpersönlich)  

A: "Frau Schneider, ich verschreibe ihnen ein hustenlösendes Mittel."

(2. _Person_: Patient; _Beziehung_: Arzt-Patient; _Name_; _Ort_: vermutlich Praxis)  

SL: NW  
A: "Frau Müller, als Betriebsarzt muss ich ihre Staublunge der Geschäftsleitung melden!"

(Husten und abhorchender Arzt stehen bereits fest, neu: Konkretisierung _Person_: Arzt zu Betriebsarzt; 2. _Person_: Arbeitnehmer; _Beziehung/Status_: Arzt und Arbeitnehmer; _Name_; _Problem_)  

Beispiel 3:

A: "Hagen, reiche er mir den Speer"

(_Zeit/Epoche_: Mittelalter; evtl. _Genre_: Deutsche Rittersage; _Name_; _Sprache_: altertümlich)  

SL: NW  
A kocht und schmeckt ab.

(_Routine/Handlung_; _Ort_: evtl. Küche)  

B: "Liebling, Tisch 2 wartet schon eine Stunde!"

(Kochen und Abschmecken stehen fest. _Beziehung_: Ehepaar oder Liebespaar; _Ort_ nun definitiv: Küche eines Restaurants).  

A: Helga, sag'' ihnen, dass es durch die Vorweihnachtszeit einfach ziemlich voll ist!"

(_Name_; _Zeit_; evtl. _Problem_).', 'https://improwiki.com/de/wiki/improtheater/neue_wahl_-_basisinformationen', '2020-11-14 07:44:24.343', 250);
INSERT INTO public.part VALUES (251, 1, '2020-12-02 22:04:16.231369', '2020-12-02 22:04:16.231369', 'Stille Post - Monolog', 'Der Spielleiter und 2 Spieler bleiben im Raum

Spieler A bekommt nun eine Vorgabe und hält dazu einen Monolog in einer im Moment entwickelten Figur. Spieler B schaut ihm dabei zu. Dann verlässt Spieler A, der den Monolog hielt, den Raum. Spieler C, der draußen gewartet hat, betritt nun den Raum und nimmt die Position von Spieler B ein. Spieler B, der eben noch zugeschaut hat, versucht nun den Monolog genau so wiederzugeben, wie er ihn von Spieler A gesehen hat (inklusive der Mimik und Gestik). Dabei schaut ihm Spieler C zu. Danach verlässt dann Spieler B den Raum und Spieler D kommt herein. Nun hält Spieler C den Monolog usw.

Am Ende kehrt Spieler A in den Raum zurück und schaut sich den Monolog nun von dem letzten Spieler an. Danach kann er zusammen mit dem Spielleiter den anderen mitteilen, welche Details sich verändert haben, was neu dazugedichtet und was weggelassen wurde.

Eine Übung, die das genaue Zuhören/Zusehen, das Annehmen von kleinsten Details und das Kopieren von Figuren trainert. Außerdem wird damit trainiert, die Details, die man eventuell vergessen hat, glaubwürdig improvisiert "dazuzulügen".', 'https://improwiki.com/de/wiki/improtheater/stille_post_-_monolog', '2020-11-14 07:44:24.231', 251);
INSERT INTO public.part VALUES (252, 1, '2020-12-02 22:04:16.369969', '2020-12-02 22:04:16.369969', 'Genre Talkshow', 'Bei den Talkshows sind zwei Typen zu unterscheiden.

*   die überwiegend abends laufenden, seriösen Diskussionssendungen,
*   die nachmittags bei den privaten Fernsehsendern laufenden vordergründig und boulevardesk angelegten "Diskussions"-Sendungen

## Inhaltsverzeichnis

*   Boulevard-Talk
    *   Charaktere
    *   Elemente
    *   Themen
    *   Sprache, Auftreten der Gäste
    *   Typische Abläufe
    *   Wendepunkte
*   Seriöse Talkshow
    *   Charaktere
    *   Elemente
    *   Themen
    *   Sprache, Auftreten der Gäste
    *   Typische Abläufe
    *   Wendepunkte

## Boulevard-Talk

### Charaktere

*   Verwandte
*   Jugendliche
*   Arbeitslose
*   Überraschungsgast
*   Möchtegernstar
*   Der/Die Untreue"
*   "Der/Die Betrogene"
*   "Schlampe"
*   Angehörige "bildungsferner" Schichten
*   "Vaterschaftsanzweifler"
*   Paradiesvogel - extrem aussehend z.B. viele Piercings, Gesichtstätowierungen, extrem dick usw.
*   _Moderator/in_ mitfühlend, aber auch manchmal kopfschüttelnd  
    

### Elemente

*   Moderator/in
*   Stühle, Sofas auf der einen Seite, Publikum auf der anderen Seite
*   Schattenwand
*   Kameraleute
*   Gäste/Publikum
*   eventuell Experten
*   Lügendetektor
*   Entscheidungstür
*   Wand, auf die der Schatten einer Person geworfen wird, damit dieser anonym bleibt

### Themen

*   Vaterschaftstest
*   Heiratsanträge
*   unerwiderte Liebe
*   Internetliebe
*   Streit, Nachbarschaftsstreit
*   Beichten, Geständnisse, Doppelleben
*   Unvereinbare Positionen zu Themen wie Arbeitslosigkeit, Schlampigkeit, Kindern usw.

### Sprache, Auftreten der Gäste

*   prollig
*   Schreien
*   falsche Redewendungen
*   Dialekte
*   pöbeln
*   Weinen, Lachen
*   extreme Gefühlsausbrüche
*   extreme Ansichten
*   Provozieren der anderen Talkgäste

### Typische Abläufe

*   einen rausschicken, den anderen erst mal alleine befragen
*   "Hast du eine Ahnung, warum du hier sein könntest?"
*   Aufzählen von Frauen, die nichts damit zu tun haben (Ich glaube, es ist wegen Susi, Annika, Katrin?)
*   sich widersprechende Aussagen: "Wir sind zusammen/getrennt" – "Nein, sind wir nicht"
*   "Ich hab dir das gesagt, du hast mir das nicht gesagt"
*   "XY schuldet mir noch Geld"
*   Statement bei der Vorstellung "Ich bin die XY und ich...."
*   Zwischeneinwürfe aus dem Publikum, befragt von der Moderatorin
*   laute Parteinahme im Publikum (Zustimmung, Ablehnung, demonstratives, ungläubiges Lachen, Kopfschütteln usw.)
*   per SMS .... Schluss gemacht, kennengelernt
*   Internet – treffen sich zum ersten Mal
*   jemand nur per Telefon, möchte nicht ins Studio
*   hinten bleiben, nicht ins Studio
*   Rausstürmen nach Streit
*   alle reden durcheinander (nur kurz sinnvoll wegen Fokus)
*   Ich kann singen und ich zeige es, Möchtegernstar
*   Ich habe ein Geheimnis, ich muss etwa beichten (Ich bin eigentlich ein Mann, eine Frau, ich habe dich betrogen, ich führe ein Doppelleben, bin Stripperin)
*   Ich habe Kontakt mit geheimnisvollen Mächten
*   "Triff eine Entscheidung"

### Wendepunkte

*   Versöhnungen (oder zumindest Angebote)
*   Eine unerwartete Person ins Studio bringen
*   Ergebnis eines Testes (Lügendetektor, Vaterschaftstest) verkünden
*   um Verzeihung bitten

## Seriöse Talkshow

### Charaktere

*   Prominente
*   Politiker
*   Verbands-/Interessenvertreter
*   Künstler (Schauspieler, Schriftsteller, Sänger, Musiker, Regisseur)
*   Experte
*   Journalisten
*   Betroffener zum Thema
*   _ein_ Auffälliger zur Auflockerung (Nina Hagen, Klaus Kinski)

### Elemente

*   Moderator/in/en oder Interviewer
*   Stühle, Sessel, Sofas auf der einen Seite, Publikum auf der anderen Seite
*   Kameraleute
*   Gäste/Publikum
*   Dekoration

### Themen

*   aktuelle politische Fragen
*   Veröffentlichung eines Buches, Filmes, einer CD, eine Tournee
*   personenbezogene Themen (Krankheiten, Probleme, einschneidende Erlebnisse)
*   Lebenslauf der betreffenden Person, Würdigung ihres Lebens, Anekdoten aus ihrem Leben
*   Informationsvermittlung (Experte)

### Sprache, Auftreten der Gäste

*   _Politiker_ geschwätzig, nichtssagend, Wortblasen, agil
*   _Experten_ seriös, objektiv
*   _Verbands-/Interessenvertreter_ einseitig, evtl. auch geschwätzig, nichtssagend, Wortblasen
*   _Künstler_ macht subtil Werbung für sein (letztes) Werk, spricht über sein Werk
*   _Betroffener_ kann nicht gut reden, wirkt medienunerfahren, stottert, verhaspelt sich, wirkt unsicher

### Typische Abläufe

*   Unterbrechungen durch Einspielfilme, Schautafeln, Fotos, Musik
*   Übersetzung bei ausländischem Gast
*   Einleitungstext des Moderators
*   Schlussworte des Moderators
*   Getränke werden eingeschenkt/getrunken
*   Interviewform
*   Kontroversen und Streit in der Regel höflich und meist sachlich
*   Leute aus dem Publikum werden gefragt
*   laute Ablehnung/Zustimmung aus dem Publikum bei kontroversen Themen
*   Moderator bemüht sich um (eigene) Objektivität
*   Gast kommt zu spät erst während der Sendung

### Wendepunkte

*   heftig Angegriffener verlässt erregt das Studio
*   _Betroffener_ verliert die Selbstkontrolle
*   einer der Diskussionsteilnehmer verlässt die typische Rolle (z.B. Politiker erzählt Höchstpersönliches von sich)', 'https://improwiki.com/de/wiki/improtheater/genre_talkshow', '2020-11-14 07:44:24.439', 252);
INSERT INTO public.part VALUES (253, 1, '2020-12-02 22:04:16.591148', '2020-12-02 22:04:16.591148', 'Hologramm', 'Die Spieler stehen im Kreis. Aufgabe ist es, ein für jeden plausibles Bild einer fiktiven Person zu entwickeln. Reihum trägt jeder ein Merkmal bei. Angefangen wird mit den Basisinformationen wie zum Beispiel Name, Alter, Größe, Beruf usw., danach kommen Verfeinerungen wie Charaktermerkmale, Familie, Fehler, Konflikte. Sobald ein neues, gerade genanntes Merkmal für einen der (anderen) Spieler nicht stimmig ist, meldet er dies. Sofort wird die weitere Beschreibung abgebrochen und der Spieler, der die Runde gerade mit seiner "Störungsmeldung" beendet hatte, fängt mit einer neuen Figur an.

_Variante:_

Nach zwei Merkmal-Runden geht jemand in die Mitte und versucht die entwickelte Figur in einem kurzen Solo zu spielen/darzustellen.

_Siehe auch_ Charakter', 'https://improwiki.com/de/wiki/improtheater/hologramm', '2020-11-14 07:44:24.254', 253);
INSERT INTO public.part VALUES (254, 1, '2020-12-02 22:04:16.821687', '2020-12-02 22:04:16.821687', 'Charakterübung', 'Alle gehen durch den Raum, jeder mit einem bestimmten Charakter. Immer wenn man sich begegnet, spricht man ein zwei Sätze miteinander, und dabei wird der Charakter langsam ausgetauscht.

**Variante:** Der Charakter wird beibehalten.

**Variante 2:** Es werden Filmcharaktere genommen.', 'https://improwiki.com/de/wiki/improtheater/charakteruebung', '2020-11-14 07:44:24.351', 254);
INSERT INTO public.part VALUES (255, 1, '2020-12-02 22:04:16.945954', '2020-12-02 22:04:16.945954', 'Betty Plum', 'diese Übung ist auch unter dem Namen: Hologramm bekannt.

Die Gruppe der Spieler (empfohlen 4) einigen sich auf Namen und Charakteristika einer Person. Fällt niemandem mehr etwas ein, oder wird eine Idee eines Mitspielers nicht angenommen, beginnt das Spiel wieder von vorn.

*   Beispiel:

A: Juliane, B: 24 Jahre, C: schwanger D: rothaarig, B: nein, blond…

Hier endet das Spiel, weil kein Gruppenkonsens mehr vorhanden ist. Die so geschaffenen Figuren können danach dann auch als Grundlage für Szenen dienen.

### Quellen

http://www.impro-theater.de/dmdocuments/spielesammlung\_zapalot.pdf', 'https://improwiki.com/de/wiki/improtheater/betty_plum', '2020-11-14 07:44:24.429', 255);
INSERT INTO public.part VALUES (256, 1, '2020-12-02 22:04:17.077257', '2020-12-02 22:04:17.077257', 'Person entwickeln', 'Die Spieler bewegen sich im Raum. Wenn der Spielleiter/Trainer "stopp" sagt, frieren alle in ihrer Haltung ein. Der Spielleiter fragt einzelne Spieler: "Wer bist Du?" Diese anworten aus der aktuellen Haltung heraus und geben bestimmte Grunddaten an und vielleicht (zusätzliche) prägnante Angaben über die betreffende Person, z.B.: "Hans, 53 Jahre, fettleibig, unverheiratet."  
Möglich ist auch, zusätzlich eine kleine Geschichte zu erzählen. Beispiel zu Hans "Schon als Kind haben sie mich gehänselt. In der Pubertät habe ich dann 10 kg zugenommen und ich wurde im Sportunterricht gemobbt. Sogar der Lehrer zog über mich her."  
Nach der Vorstellung bewegen sich aller wieder im Raum. Und nach einem erneuten Stopp stellt sich jemand anders vor. Usw.

**Variante 1**  
Der Spielleiter stellt ergänzende Fragen

*   Wer bist Du?
*   Was ist Dein Beruf?
*   Wie läuft diese Person

**Variante 2**  
Die Spieler (mit den entwickelten Personen) laufen durch den Raum. Bei einer Begegnung begrüßen sie sich und tauschen die Personen.', 'https://improwiki.com/de/wiki/improtheater/person_entwickeln', '2020-11-14 07:44:24.343', 256);
INSERT INTO public.part VALUES (275, 1, '2020-12-02 22:04:20.487568', '2020-12-02 22:04:20.487568', 'Assoziationskreis mit Wiederholung', 'Im ersten Teil der Übung werden in mehreren Runden von den Spielern Begriffe assoziiert wie in _Assoziationskreis_ beschrieben. Nach Ende der letzten Runde fängt nun der zweite Teil der Übung an. Aufgabe ist es nun, sich an alle seine eigenen Begriffe zu erinnern und sie auszusprechen und zwar in der Reihenfolge, wie man sie im ersten Teil der Übung ausgesprochen hatte. D.h. es geht wieder von vorne los und jeder sagt den Begriff, den er im Anschluss an seine Vorderfrau oder seinen Vordermann gesagt hatte. Das geht leichter als man denkt! Ggf. helfen die Anderen.

Deutlich schwierigere _Variante_: Das ganze läuft rückwärts. Das heißt, in der Wiederholungsphase fängt man mit dem letzten Begriff des ersten Übungsteils an und endet mit dem ersten Begriff des ersten Übungsteils.', 'https://improwiki.com/de/wiki/improtheater/assoziationskreis_mit_wiederholung', '2020-11-14 07:44:25.14', 275);
INSERT INTO public.part VALUES (257, 1, '2020-12-02 22:04:17.235663', '2020-12-02 22:04:17.235663', 'Führender Körperteil', 'Diese Übung dient der Körperwahrnehmung und zur Vorbereitung der (einfachen) Charakterarbeit.

Die Spieler gehen durch den Raum (Raumlauf). Der Spielleiter gibt einen Körperteil vor, z.B. "Becken", "linke Schulter“, "Stirn", "rechtes Knie" oder "Bauch", welches die Führung beim Laufen übernimmt. Die Spieler versuchen, die Anweisung umzusetzen, indem sie eine bestimmte Gang- bzw. Bewegungsart entwickeln, bei der der angegebene Körperteil führt. Anschließend nennt der Spielleiter einen anderen Körperteil, der die Führung übernehmen soll, usw.

Es gibt nun verschiedene Möglichkeiten, wie weiter zu verfahren ist:

*   Wir stellen uns bzw. der Übungsleiter stellt Fragen wie: ”Wer könnte so laufen?” oder ”In welchen Situationen laufe ich so?”
*   Die Spieler sollen aus diesem Gang einen Charakter entwickeln, d.h. sich überlegen, wie eine Person, die so läuft, wohl sein würde (Status, Sprache, Beruf etc.).
*   Die Spieler merken sich die verschiedenen Charaktere, die sie während des Raumlaufs entwickelt haben, denn anschließend können kleine Szenen mit diesen Charakteren angespielt werden.
*   Immer wenn wir von einem neuen Körperteil geführt werden, beobachten wir dabei unsere Gefühle und andere Verhaltensweisen (z.B. schnelleres Gehen, veränderte Körperhaltung, veränderte Bewegungsabläufe). Nach der Übung können wir dann über Empfindungen und Erkenntnisse sprechen.

_Siehe auch_: Bewegungsimpuls durch Berührung', 'https://improwiki.com/de/wiki/improtheater/fuehrender_koerperteil', '2020-11-14 07:44:24.471', 257);
INSERT INTO public.part VALUES (258, 1, '2020-12-02 22:04:17.375944', '2020-12-02 22:04:17.375944', 'Das innere Tier', 'Der Spielleiter schreibt unterschiedliche Tierarten auf kleine Zettel. Diese werden verdeckt an die Spieler verteilt. Die Spieler verraten nicht, welches Tier sie gezogen haben. Ihre Aufgabe ist nun, sich das Wesen dieses Tieres vorzustellen (Tempo, Sprechweise, Interessen usw.) und danach einen entsprechenden Charakter zu spielen. Hierzu treten sie einzeln auf die Bühne und stellen sich jeweils ausführlich vor.  
Es geht **nicht** darum, typische Bewegungen oder Laute des Tieres zu machen, damit die Zuschauer das Tier erraten! Denn Sinn dieser Übung ist es, die Figurentwicklung zu erleichtern! Die innere Vorstellung eines Tieres ist lediglich ein Mittel, um sich einen bestimmten (menschlichen) Charakter, einen Typen zu erarbeiten!  
Allerdings können die Zuschauer zur Auflockerung im Anschluss versuchen zu erraten, welches Tier zugrunde gelegt wurde. Es geht aber um die Figurenentwicklung. Das "dargestellte" Tier ist letztlich egal.

_Variante bzw. Ergänzung:_  
Zwei unterschiedliche "innere Tiere" begegnen sich sprechend und agierend auf der Bühne (als den Einzeldarstellungen nachfolgende Übung oder gleich zu Beginn ohne Vorstellung der einzelnen Charaktere)

_Beispiele_:

\- - - Faultier - - - Zebra - - - Amöbe - - - Ameise - - - Dinosaurier - - - Zecke - - - Erdmännchen - - - Würgeschlange - - - Rochen - - - Chamäleon - - - Uhu - - - Kohlmeise - - - Rabe - - -

_Siehe auch_: Die Eheberatung', 'https://improwiki.com/de/wiki/improtheater/das_innere_tier', '2020-11-14 07:44:24.488', 258);
INSERT INTO public.part VALUES (259, 1, '2020-12-02 22:04:17.60778', '2020-12-02 22:04:17.60778', 'Der heilige Gral', '"Der heilige Gral" ist eine Übung, die die Arbeit an Charakteren vorbereiten kann. Die Übung geht wie folgt:

Alle Teilnehmer stellen sich in einem weiten Kreis auf. Eine Person fängt an und stellt sich in die Mitte. In einem bestimmten Charakter (Stimme, Akzent, Körperhaltung) geht sie auf einen beliebigen Spieler innerhalb des Kreises zu und sagt "Ich gebe Dir den heiligen Gral" (dabei übergibt sie den Gral virtuell). Die andere Person nimmt den Gral an und sagt, im gleichen Charakter wie die Person, von der sie den Gral erhalten hat: "Ich habe den heiligen Gral!" Die Personen links und rechts der Person, die gerade den Gral erhalten hat, steigern den Charakter (in Stimme & Körperlichkeit) und sagen: "Toll, er / sie hat den heiligen Gral!" Die Personen noch eins weiter links bzw. rechts steigern den Charakter noch weiter und sagen: "Großartig, er / sie hat den heiligen Gral!" Idealerweise sprechen die Personen links und rechts dabei jeweils aus einem Mund.

Dann geht die Übung weiter, indem die Person, die den Gral erhalten hat, los geht, sich einen neuen Charakter wählt und in diesem den Gral an einen anderen Mitspieler übergibt.', 'https://improwiki.com/de/wiki/improtheater/der_heilige_gral', '2020-11-14 07:44:24.533', 259);
INSERT INTO public.part VALUES (260, 1, '2020-12-02 22:04:17.73256', '2020-12-02 22:04:17.73256', 'Fast Food Laban', '**Fast Food Laban** ist eine Übung, mit der Charaktere aufgrund von Bewegungstypen entwickelt werden können. Grundlage ist eine vereinfachte Anwendung der Bewegungsstudien des Choreographen und Bewegungstheoretikers Rudolf von Laban.

Bewegungstypen werden aus den folgenden 3 Kategorien kombiniert:

*   Zeit / Phrasierung: plötzlich oder fortwährend
*   Gewicht: Leicht oder schwer
*   Raum: Direkt oder indirekt

Daraus ergeben sich 8 Kombinationen, wie sich die Figuren verhalten/sprechen können:

*   Schlagen : Plötzlich / Schwer / Direkt (Türen knallen, polternd reden)
*   Hieb : Plötzlich / Schwer / Indirekt
*   Antippen : Plötzlich / Leicht / Direkt
*   Huschen : Plötzlich / Leicht / Indirekt
*   Schieben : Fortwährend / Schwer / Direkt
*   Wringen : Fortwährend / Schwer / Indirekt
*   Gleiten : Fortwährend / Leicht / Direkt
*   Streicheln : Fortwährend / Leicht / Indirekt

### Variationen

Als Vorbereitung für die Bewegungstypen kann mit einer Raumlauf Übung begonnen werden. Den Spielern können dabei Anweisungen gegeben werden, wie z.B.:

*   Seid eine "horizontale" oder "vertikale" Person
*   Seid "aufwärts" gerichtet oder "abwärts" gerichtet
*   Seid "schwer" oder "leicht"

Danach kann man probieren, zu den Bewegungen eine Phrasierung hinzuzufügen: Seid plötzlich "leicht" (wie ein Vogel, der gerade losfliegt). Seid fortwährend "leicht" (Wie ein Luftballon) Eine schöne Inspiration ist es auch, im Hintergrund Musik zu spielen (zu welchem Bewegungstyp verleitet euch die Musik?). Dann kann man mit der Wirkung auf Figuren experimentieren: Wie würde sich eine "vertikale" Person bewegen, was für eine Figur wäre das (ein General?), wie würde sich eine fortwährend leichte Person verhalten (Bekifft? Betrunken?), welche Eigenschaften hätte eine plötzlich leichte Person (aufreizend?).

### Quellen

Beschrieben von Keith Johnstone in seinem Buch:

*   "Theaterspiele", Alexander Verlag Berlin 1998. ISBN 3-89581-001-0', 'https://improwiki.com/de/wiki/improtheater/fast_food_laban', '2020-11-14 07:44:24.616', 260);
INSERT INTO public.part VALUES (261, 1, '2020-12-02 22:04:17.851922', '2020-12-02 22:04:17.851922', 'Fast Food Stanislawski', '2 Spieler spielen eine Szene. Als Vorgabe können Sie einen Titel oder einen Ort bekommen. Die Spieler bekommen jedoch einen Subtext für ihre zu spielende Figur. Der Fokus und die Konzentration des Spielers liegen dabei in dieser Übung ganz auf dem Subtext, ohne ihn zu benennen. Dies ist eine tolle Technik, um eine Figur zu erschaffen.

Subtexte könnten zum Beispiel sein:

1.  Du willst den anderen verführen
2.  Du bist ein Nerd
3.  Dir gefällt es, Leute zum Lachen zu bringen
4.  Du möchtest andere Leute beeindrucken
5.  Du bist eine fiese Person
6.  Du versuchst, normal zu erscheinen
7.  Du bist ein Optimist/Pessimist
8.  Du wirst niemals eine Freundin/Freund finden

### Hinweise

Wenn diese Technik in einem Workshop geübt wird, kann es eine gute Idee sein, die Spieler vorher zu fragen, wie sie sich mit einem gegebenen Subtext verhalten würden. Es sollte dabei Wert auf Wahrhaftigkeit (wahrhaftiges Schauspiel) gelegt werden. Die Technik kann nicht nur in Übungssituationen, sondern auch jederzeit in einer Aufführung verwendet werden - einfach mit einem Subtext auf die Bühne springen.

Eine Übung, die zum Beispiel auch mit Fast Food Laban kombiniert werden kann.

### Reference

Beschrieben von Keith Johnstone in seinem Buch:

*   "Theaterspiele", Alexander Verlag Berlin 1998. ISBN 3-89581-001-0

Das Buch enthält einen Anhang mit Listen von Anweisungen, wie man mit einem bestimmten Subtext spielen kann.', 'https://improwiki.com/de/wiki/improtheater/fast_food_stanislawski', '2020-11-14 07:44:24.685', 261);
INSERT INTO public.part VALUES (429, 1, '2020-12-02 22:04:46.002586', '2020-12-02 22:04:46.002586', 'Feuer - Wasser - Wind', 'Alle gehen durch den Raum in einem vorgeklatschten Rhythmus, bis der Spielleiter **Feuer**, **Wasser** oder **Wind** ruft. Bei **Feuer** werfen sich alle auf den Boden. Bei **Wind** stellen sich alle schnell an die Wand und bei **Wasser** auf ein höhergelegenes Möbelstück (Stuhl, Tisch etc.)', 'https://improwiki.com/de/wiki/improtheater/feuer_-_wasser_-_wind', '2020-11-14 07:44:31.77', 429);
INSERT INTO public.part VALUES (262, 1, '2020-12-02 22:04:18.090154', '2020-12-02 22:04:18.090154', 'Zoom und Gefühl', 'Bei dieser Übung agiert einer der Spieler (A) auf der Spielfläche, ein anderer (B) sitzt seitlich am Rand. Nach Vorgabe erzählt A einen typischen Ablauf aus seinem Alltag. Das kann z.B. sein: "Was macht du morgens nach dem Aufstehen?" Dieser typische Ablauf ist nun relativ detailliert zu erzählen und dabei durch Handlung und Gestik zu veranschaulichen. B hat die Aufgabe, gelegentlich in den Vortrag "Zoom!" reinzurufen. Aufgabe von A ist es dann, das gerade geschilderte noch genauer und ausschmückender zu erzählen. Wenn er also z.B. gerade von seinem Frühstücksei erzählt, ist dies mit Details anzureichern, z.B. der Farbe des Eies, ob es ein Bio-Ei ist, sein Haltbarkeitsdatum, wo er die Eier kauft usw. Wenn B "zurück!" sagt, geht die Ursprungsgeschichte weiter, ohne die Details. Weiterhin kann B im Laufe der weiteren Schilderung ein Gefühl reinrufen. Dann hat A den Ablauf in diesem Gefühl zu schildern. Erzählt A z.B., dass er mit seiner WG-Mitbewohnerin frühstückt und gibt B nun "Langeweile" vor, dann hat er von seinem Frühstück mit der Mitwohnerin und/oder von ihr als Person gelangweilt zu erzählen. Sowohl "Zoom" als auch Gefühl kann B jeweils mehrfach anfordern.

Mit Hilfe dieser Übung kann man trainieren, zu interessanteren Figuren und Spielideen zu kommen.

## Hinweise und Tipps

*   Zoom oder Gefühl sollten jeweils in einem gewissen zeitlichen Abstand vorgegeben werden.
*   Man kann innerhalb der Zoomschilderung noch ein weiteres Zoom verlangen. Wenn also im obigen Beispiel gerade berichtet wird, dass A das Ei bei Bauer Wilfried kauft, dann könnte nach einem weiteren "Zoom" nun von dem Bauernhof von Bauer Wilfried und von seinen Hühnern berichtet werden.
*   Es geht auch darum, den Spieler zu quälen, also gerne auch ein unpassendes Gefühl reinzurufen.
*   Die Grundschilderung sollte autobiografisch sein, die Details nach dem "Zoom" und die Gefühle müssen es nicht sein.', 'https://improwiki.com/de/wiki/improtheater/zoom_und_gefuehl', '2020-11-14 07:44:24.618', 262);
INSERT INTO public.part VALUES (263, 1, '2020-12-02 22:04:18.363804', '2020-12-02 22:04:18.363804', 'Geschichten gleichzeitig erzählen', 'Eine Übung für 2 Spieler. Beide beginnen gleichzeitig mit dem ersten Satz ihrer Geschichte. Dann erzählt Spieler 1 die Geschichte von Spieler 2 weiter, indem er mit dem zweiten Satz der Geschichte von Spieler 2 fortfährt. Gleichzeitig erzählt Spieler 2 den zweiten Satz der Geschichte von Spieler 1 weiter.

Spieler 1: "Es war einmal ein kleiner Marienkäfer." Gleichzeitig sagt Spieler 2: "Es war Thomas Geburtstag und er hatte seinen einzigen Freund eingeladen."

Dann Spieler 1: "Sein Freund hatte ihm als Geschenk 2 Flugtickets nach Mallorca mitgebracht." Gleichzeitig sagt Spieler 2: "Der Marienkäfer lebte zusammen mit seinen Geschwistern auf einem kleinen Blatt..."

So geht es immer hin und her. Die Sätze sollten möglichst kurz sein, damit das gleichzeitige Erzählen ausbalanciert ist.

Diese Übung erfordert gutes Zuhören und sofortiges Behaupten.

Um es einfacher zu machen, kann für die Geschichten auch ein Modell, wie 3 Satz Geschichte oder 4 Satz Geschichte zugrunde gelegt werden.', 'https://improwiki.com/de/wiki/improtheater/geschichten_gleichzeitig_erzaehlen', '2020-11-14 07:44:24.735', 263);
INSERT INTO public.part VALUES (264, 1, '2020-12-02 22:04:18.499475', '2020-12-02 22:04:18.499475', 'Perlenkette', 'Ein Spiel für beliebig viele Spieler, am besten aber mehr als 3, um eine kleine Geschichte zu erzählen.

Alle Spieler stellen sich in einer Linie auf.

*   Spieler 1 tritt zwei Schritte nach vorne und geht ganz nach rechts und sagt einen Satz, der fortan das Ende der Geschichte markiert, z.B.: "Glücklich ritten die beiden zusammen dem Sonnenaufgang entgegen.".

*   Spieler 2 tritt nun zwei Schritte nach vorne und geht nach ganz links und sagt einen Satz, der fortan den Anfangssatz der Geschichte markiert, z.B.: "Fabian erwachte in seinem Heuhotel und blickte aus dem Fenster hinaus.".

*   Danach werden alle schon bereits gesagten Sätze der Geschichte jeweils noch einmal von den Spielern wiederholt und zwar von links nach rechts, also am Anfang der Anfangssatz und dann der Endsatz.

*   Die Aufgabe der verbleibenden Spieler ist es nun, den Mittelteil der Geschichte zu füllen und die einzelnen Sätze zu einer zusammenhängenden Geschichte zusammenzubringen.

*   Nach jedem neuen Spieler werden alle schon bereits gesagten Sätze der Geschichte wiederholt

*   Die Perlenkette ist vollständig, wenn alle Spieler in einer neuen Linie stehen. Die Geschichte ist damit beendet.

Je nachdem, ob sich die neuen Spieler rechts oder links von einem Spieler positionieren, bedeutet das, dass der Satz in der Geschichte danach folgt (rechts davon) oder davor (links davon). Links vom Spieler 2 mit dem Anfangssatz der Geschichte und rechts vom Spieler 1 mit dem Endsatz der Geschichte sollte sich niemand positionieren.

Neue Spieler könne sich aber zwischen zwei schon stehende Spieler positionieren und dort einen Satz mit einbauen.

Wichtig ist bei diesem Spiel, gut zuzuhören, was bereits gesagt wurde und diese Angebote nicht zu verwerfen oder zu übergehen. Es hilft, neue Sätze so spezifisch wie möglich zu machen.

Bei vielen Spielern bietet es sich an, bei den Sätzen zwischen Beschreibungen ("der Himmel verdunkelte sich, die Temperatur fiel schlagartig und es legte sich Angstschweiss über Fabians Gesicht") und Sätzen, die die Handlung vorantreiben, abzuwechseln.', 'https://improwiki.com/de/wiki/improtheater/perlenkette', '2020-11-14 07:44:24.732', 264);
INSERT INTO public.part VALUES (265, 1, '2020-12-02 22:04:18.753766', '2020-12-02 22:04:18.753766', 'Entdeckung des Kinds in einem', 'Es werden Paare gebildet. Einer erzählt nun eine Geschichte der Form von Fragen: "Wollen wir in den Park gehen?" "Wollen wir dort die Enten füttern?"...  
Der andere hat nur die Aufgabe das Vorhaben zu bejahen oder zu verneinen. Allerdings so kindlich wie möglich. Also er flüstert viele leise kurze "Ja"s oder "Nein"s begleitet von hektischem Kopfnicken oder -schütteln. Und dabei soll er so begeistert wie möglich sein, auch beim Nein.  
Diese Übung dient dazu, dem anderen eine gute Zeit zu bereiten. Denn wenn er sieht, dass dem anderen die Geschichte gefällt, fühlt er sich automatisch gut, und das ist ein wichtiger Punkt auf der Bühne. Durch das Begeisterte Ja und Nein wird sehr viel positive Energie ausgestrahlt, welche ebenso dazu beiträgt, dass die Geschichte automatisch voran geht.  
Hat derjenige, welcher die Geschichte hört und "Ja" und "Nein" sagen muss das Gefühl, es geht ihm zu langsam vorwärts, kann er auch "und jetzt?" fragen.  
Nach einer Weile werden die Rollen getauscht.', 'https://improwiki.com/de/wiki/improtheater/entdeckung_des_kinds_in_einem', '2020-11-14 07:44:24.841', 265);
INSERT INTO public.part VALUES (266, 1, '2020-12-02 22:04:18.876766', '2020-12-02 22:04:18.876766', 'Es war einmal - Modell', 'Die Teilnehmer stellen sich im Kreis oder Halbkreis auf und versuchen eine Geschichte zu erzählen, der folgendes Modell zu Grunde liegt:

1.  Es war einmal ? Info (ein Fischer namens Fiete)
2.  Jeden Tag ? Info (fuhr er zum Dorschfischen hinaus auf den großen Teich)
3.  Bis eines Tages ? Info (der Motor des Kutters versagte)
4.  Und aufgrund der Tatsache, dass der Motor versagte ? Info (trieb er immer weiter auf das Meer hinaus
5.  Und aufgrund der Tatsache, dass er immer weiter auf….
6.  Und aufgrund…
7.  ....
8.  Bis eines Tages ? Info (eine Horde Delfine ihn ins Schlepptau nahm und zurückbrachte)
9.  Und seit diesem Tage ? Info(heißt sein Schiff „Flipper“)

_Übernommen wurde die Übung von dieser Seite:_ Zap-a-Lot Impro-Übungen', 'https://improwiki.com/de/wiki/improtheater/es_war_einmal_-_modell', '2020-11-14 07:44:24.788', 266);
INSERT INTO public.part VALUES (267, 1, '2020-12-02 22:04:19.240684', '2020-12-02 22:04:19.240684', 'Fantasiegeschichte mit Fragen', 'Eine ruhige, angenehme Übung für zwei Spieler:

Ein Spieler (A) liegt mit geschlossenen Augen entspannt auf einer Isomatte und erzählt eine Geschichte (ohne Vorgabe). Der andere Spieler (B) sitzt daneben und stellt immer wieder zwischendurch Fragen. B beginnt mit der Eingangsfrage "Wo bist du?". Die weiteren Fragen beziehen sich auf das Erzählte ("Wie sieht das Zimmer aus?", "Wieviele Fenster hat der Raum?", "Wo befindet sich die Tür?", "Was passiert dann?") und helfen dem Erzähler, das Bild zu konkretisieren.

Durch die Fragen hilft der zweite Spieler sehr wirkungsvoll beim Erfinden der Geschichte mit, obwohl er keine Aussagen macht. Außerdem entsteht dadurch eine Art Zwiegespräch, was die Aufgabe des freien, ungeplanten Erzählens sehr viel einfacher macht.

**Tipp:** Man kann die Übung zunächst mit 2 Spielern vor der Gruppe vorführen und dann die Gruppe die Übung in Paaren durchführen lassen, sofern sich die Paare an akustisch ausreichend getrennte Orte begeben können.

**Sinn der Übung:** Eine ansprechende, bildhafte Geschichte aus dem Nichts entstehen lassen. Die Geschichte muss nicht spannend oder dramatisch sein. Wichtig ist, den Effekt des "Kopfkinos" dabei zu erfahren: wie durch wenige einfache Worte Bilder vor dem geistigen Auge entstehen.', 'https://improwiki.com/de/wiki/improtheater/fantasiegeschichte_mit_fragen', '2020-11-14 07:44:24.831', 267);
INSERT INTO public.part VALUES (268, 1, '2020-12-02 22:04:19.384904', '2020-12-02 22:04:19.384904', 'Voranbringen und Illustrieren', 'Die Spieler beginnen eine Szene. Von außen entweder nur vom Trainernoder auch von allen, die zuschauen, werden je nach Situation zwei Kommandos hineingerufen, nach denen sich alle Spielenden richten. Es sind die beiden Begriffe “Voranbringen” und “Illustrieren”.

Immer dann, wenn "Voranbringen" gerufen wird, konzentrieren sich die Spieler ausschließlich auf die Handlung und bringen diese voran. Das heißt, sie etablieren die spielenden Personen (das “Wer”), das “Was” der Szene, und spielen dann eine Handlung dazu (das “Wie”) (siehe auch Basisinformationen). Wenn ein Ort etabliert wird, bringt das ebenfalls die Szene voran, das Ausgestalten des Raumes ist eine andere Sache. Das Problem wird gesteigert, eine Lösung gefunden, vielleicht wird dabei auch das “Warum”, der Hintergrund der Handlung, ausgebaut. Während des "Voranbringens" fügen die Spielenden der Umgebung nichts hinzu, sondern führen nur neue Informationen über das wer, wen, warum und wo ein. Sie können einen neuen Charakter einführen etc., aber jedes Angebot muss die Geschichte voranbringen.

Wenn “Illustrieren” gerufen wird, verschiebt sich der Fokus auf das Erforschen, Beschreiben und Entdecken des Vorhandenen und Etablierten. Während des "Illustrierens" werden Handlung und Vorantreiben der Geschichte ignoriert. Stattdessen vertiefen sich die Spieler in ihre Umgebung, ihre Innenwelt oder in die (statische) Situation. Zum Beispiel wird das Waschbecken, an dem ihr Charakter steht, zum Fokus. Die Wasserhähne werden erforscht, die Form wird beschrieben, um was für einen Designstil handelt es sich, ist die Oberfläche sauber oder schmutzig, ist das Waschbecken neu oder älter etc. Folge des Illustrierens ist, dass Umgebung, Innenwelt oder vorhandene Situation viel realer und anschaulicher geworden sind. Dies wiederum inspiriert und beflügelt die Spieler und ermöglicht es dem Publikum sich noch mehr auf die Geschichte einzulassen.

_Variante:_

Bei dieser Variante können gleichzeitig mehrere Kleingruppen üben:

Die Übung ist für 3 Personen. A und B erzählen gemeinsam eine Geschichte, wobei A _nur_ in die Advance - und B _nur_ in die Extend-Richtung erzählt. Der dritte Spieler C zeigt mit ausgestrecktem Arm immer auf denjenigen von A und B, der im Moment dran ist (Wechsel jederzeit möglich). Es soll darauf geachtet werden, dass A wirklich nur Advance- und B nur Extend-Sätze sagt (manchmal ganz schön schwierig!). Diese Übung konzentriert sich zum Einen auf den Beitrag des Gespielten zur Story, und zum Anderen auf das Entdecken der Umwelt. Das Ziel der Übung ist es, den Spielern genau bewusst zu machen, wann und wie sie mit ihrem Spiel die Geschichte voranbringen und wann nicht.

_Siehe auch_ Advance-Extend', 'https://improwiki.com/de/wiki/improtheater/voranbringen_und_illustrieren', '2020-11-14 07:44:24.89', 268);
INSERT INTO public.part VALUES (269, 1, '2020-12-02 22:04:19.522284', '2020-12-02 22:04:19.522284', 'HED', 'Ein Spieler erzählt eine Geschichte. Drei andere Spieler geben dem Erzähler ein Zeichen (Berührung, Laut, Geste) wenn sie mehr **H**andlung, mehr **E**motion oder mehr **D**etails hören möchten. Jeder der drei ist jeweils für einen der drei Aspekte zuständig.  
Details können zum Beispiel sein: Geruch, Temperatur, Wetter, Farben, Töne.', 'https://improwiki.com/de/wiki/improtheater/hed', '2020-11-14 07:44:24.891', 269);
INSERT INTO public.part VALUES (270, 1, '2020-12-02 22:04:19.734749', '2020-12-02 22:04:19.734749', 'Ich bin ein Star', 'Alle Spieler stellen sich in einer Reihe auf, sodass vor ihnen noch genug Platz ist. Nun geht einer nach dem anderen nach vorne und stellt sich vor die Reihe. Dann sagt er/sie "Ich bin \[Name\] und bin ein Star!". Der Rest der Leute in der Reihe lässt dabei einen kräftigen Jubel los und feiert den Star. Posieren ist dabei natürlich erlaubt.

Es geht in diesem Spiel darum den Applaus "auszuhalten", Hemmungen abzubauen und jeden einzelnen aus der Gruppe mal richtig zu feiern.', 'https://improwiki.com/de/wiki/improtheater/ich_bin_ein_star', '2020-11-14 07:44:24.986', 270);
INSERT INTO public.part VALUES (271, 1, '2020-12-02 22:04:19.939288', '2020-12-02 22:04:19.939288', 'Wahrheit und Lüge', 'Ein Spiel zum Kennenlernen. Alle Spieler stellen sich in einem Kreis auf. Dann erzählt jeder seinen Namen und zwei Dinge. Eine Aussage ist wahr, die zweite ist gelogen. Wenn alle Spieler dran waren, fängt der erste Spieler an, zeigt auf jemanden und nennt dessen Name und die beiden Dinge. Dieser Spieler fährt fort mit einem anderen Spieler und so weiter. Nach ein paar Runden werden dann alle zu allen Spielern befragt, was sie für eine Lüge halten und welche Aussage wohl der Wahrheit entspricht.', 'https://improwiki.com/de/wiki/improtheater/wahrheit_und_luege', '2020-11-14 07:44:25.013', 271);
INSERT INTO public.part VALUES (272, 1, '2020-12-02 22:04:20.084339', '2020-12-02 22:04:20.084339', 'Boing - Wusch - Zwong', '1\. Teil Jeder Spieler denkt sich drei „Comic-Wörter“ aus. Zu jedem „Wort“ findet er eine Bewegung. Dies übt er ein paar Mal. Auf ein Zeichen des Spielleiters gehen alle durch den Raum und stellen sich gegenseitig mit ihrem „neuen“ Namen vor.

2\. Teil Wenn man sich kennt, werden erste Freundschaften geschlossen und jeweils 2 Spieler heiraten und nehmen einen Doppelnamen an. Jetzt muss man den Namen vom anderen lernen und es entsteht ein Name aus sechs „Worten“. Die Paare laufen durch den Raum, begrüßen andere Paare und stellen sich namentlich vor.', 'https://improwiki.com/de/wiki/improtheater/boing_-_wusch_-_zwong', '2020-11-14 07:44:25.015', 272);
INSERT INTO public.part VALUES (273, 1, '2020-12-02 22:04:20.204974', '2020-12-02 22:04:20.204974', 'Begriffskreis', 'Im Kreis werden kreuz und quer von Spieler zu Spieler wechselnde Begriffe aus einer Begriffsfamilie weitergegeben, z.B. Gemüsesorten, Sportarten, Städtenamen. Pro Durchgang (Runde) kommt jeder ein Mal dran. Für die folgenden Durchgänge muss man sich Vorfrau/-mann und gesagten Begriff merken und den eigenen weitergegebenen und dessen Empfänger. In den Folgerunden wird nämlich die erste Runde reproduziert, dh. es werden exakt die gleichen Begriffe von den gleichen Personen empfangen und auch die gleichen Begriffe an die gleichen Personen weitergegeben, wie in der ersten Runde. Nach einigen Runden haben sich Begriffe und "Sender" und "Empfänger" hoffentlich eingeprägt, denn danach gibt es eine neue Runde mit neuen Begriffen aus einem anderen Themenbereich. Wichtig: Auch die Reihenfolge der Personen ist nun anders! Auch hier gibt es einige Runden mit den neuen Begriffen und der neuen Personenabfolge.

**Es geht darum, dass letztlich versucht werden muss, die beiden Runden zur gleichen Zeit laufen zu lassen.**

_Beispiel:_ Beginn mit Spielleiter an C: "Berlin", sofort danach an F: "Handball". Währenddessen schon C an B: "Düsseldorf". F an H: "Fechten" usw.

In der Regel geht irgendwann eine der beiden Begriffsfolgen verloren. Dann muss man neu starten. "Profis" schaffen auch noch eine dritte Begriffsfolge (Runde) gleichzeitig.

Eine gute Aufmerksamkeits- und Konzentrationsübung.

_Hinweise und Tipps_:

*   In der ersten Runde legen die bereits Angesprochenen als Merkhilfe ihre Hand auf den Kopf.
*   Selbstverständlich ist immer Blickkontakt der gerade Aktiven.
*   Wenn man merkt, dass der Angesprochene den Begriff nicht hört, ihn solange wiederholen, bis er reagiert (also seinen Begriff weitergibt).
*   Sehr viel schwieriger ist es, wenn man während der Übung im Raum umhergeht!
*   es kommt immer wieder vor, dass Spieler zur gleichen Zeit von ihren - verschiedenen - "Vorpersonen" angesprochen werden. Dann "Ruhe bewahren", und die eigenen "Nachpersonen" nacheinander ansprechen.
*   es ist normal, wenn die parallel laufenden Begriffsrunden unterschiedliche und/oder wechselnde Tempi haben.
*   Nicht (lange) überlegen und diskutieren, wer warum seinen Begriff "verbaselt" hat...

Siehe auch Wahrnehmungskreis', 'https://improwiki.com/de/wiki/improtheater/begriffskreis', '2020-11-14 07:44:25.137', 273);
INSERT INTO public.part VALUES (274, 1, '2020-12-02 22:04:20.34641', '2020-12-02 22:04:20.34641', 'Verschobener Fragenkreis', 'Wir stehen im Kreis, einer geht in den Kreis, stellt sich einer der Personen gegenüber und bekommt von dieser eine einfache Frage gestellt. Dann geht er zum Nachbarn. Von diesem bekommt er auch eine einfache Frage gestellt. Dies geschieht reihum. Die konkrete Frage wird jedoch dem Fragesteller nicht beantwortet, dies geschieht erst als Antwort nach der Frage des 4. Fragestellers, dh. die jeweilige Antwort verschiebt sich auf die 4. nachfolgende Person. Fällt der Person im Kreis die richtige Antwort nicht mehr ein, kommt der Nächste dran.

**Beispiel:**

X ist der Befragte im Kreis.

1\. Spieler A zu X „In welchem Jahr bist du geboren?“  
Antwort von X an A: Schweigen.  
X geht zu Spieler B (usw.).

2\. Spieler B zu X: „Wie lautet dein Vorname?“  
Antwort von X an B: Schweigen.  

3\. Spieler C zu X: „Was gibt 2+2 ?“  
Antwort von X an C: Schweigen.

4\. Spieler D zu X: „Was ist das Gegenteil von schwarz?“  
Antwort von X an D: „1968“ (Antwort auf Frage 1).

5\. Spieler E zu X: „Wie heißt Dein Wohnort?“  
Antwort von X an E: „Markus“ (Antwort auf Frage 2).

usw.

Auch der Letzte in der Runde stellt noch eine Frage. Er bekommt die Antwort auf die Frage des Viertletzten. Die Fragen des Letzten, Vorletzten und des Drittletzten bleiben unbeantwortet!

Bei dieser schweren Übung werden Gedächtnis und Schizo-Denken trainiert. Häufig weiß man schon die 3. Antwort nicht mehr.', 'https://improwiki.com/de/wiki/improtheater/verschobener_fragenkreis', '2020-11-14 07:44:25.12', 274);
INSERT INTO public.part VALUES (276, 1, '2020-12-02 22:04:20.625783', '2020-12-02 22:04:20.625783', 'You', 'Dieses Spiel ist quasi eine Variante von Begriffskreis bzw. eigentlich die zehnmal kompliziertere Überform. :)

Die Spieler stellen sich in einem Kreis auf.

Ein Spieler beginnt das Spiel, in dem er zielgenau und mit Blickkontakt auf jemanden zeigt und "You" sagt. Der Spieler, der das "You" erhält, gibt es wieder auf dieselbe Art weiter. Das geht solange, bis jeder es einmal hatte. Der letzte Spieler gibt das "You" wieder an den ersten. Ziel dabei ist es, sich zu merken, von wem man es bekommen hat und wem man es gibt um dieselbe Kette endlos wiederholen zu können.

**Zweite Kette**

Ist die erste Kette sicher, fügt man eine zweite mit anderer Reihenfolge hinzu, beispielsweise einen Begriffskreis, man gibt also ein Überthema vor (z.B. Obst) und jeder muss dann dazu einen Begriff weitergeben (z.B. Apfel) Die beiden Ketten lässt man dann gleichzeitig durchlaufen.

**Weitere Ketten**

\- Man wirft unterschiedlich große oder farbige Bälle.

\- Platzwechsel (Spieler A geht auf Platz von Spieler B, B auf den Platz von C)

\- mehr Begriffe

\- einen Stock im Kreis immer dem Nachbarn weitergeben (ist zwar keine herkömmliche Kette, erfüllt aber seinen Zweck ;) )

\- Geräusche (emotional (z.B. fröhlich) oder situativ (z.B. auf einem Pferderennen))

**Tipps**

Wenn jemand nicht reagiert, einfach so lange bestimmt das You sagen, bis er reagiert.

Regelmäßig spielen, um die Konzentrationsfähigkeit zu steigern. Dann werden es auch mehr Ketten. Mit einer sehr geübten Gruppe haben wir bis zu 5 Ketten geschafft, wer schafft mehr? ;)', 'https://improwiki.com/de/wiki/improtheater/you', '2020-11-14 07:44:25.263', 276);
INSERT INTO public.part VALUES (277, 1, '2020-12-02 22:04:20.770831', '2020-12-02 22:04:20.770831', 'Am laufenden Band', '2 Spieler stehen sich gegenüber. Spieler 1 zählt 30 Sekunden lang Begriffe auf, die ihm einfallen (i.d.R. ergibt sich eine assoziative Kette). Anschließend zählt Spieler 2 30 Sekunden lang die Begriffe auf, an die er sich erinnert. Fallen ihm keine Begriffe mehr ein, wiederholt er den letzgenannten so lange, bis ihm etwas einfällt. (i.d.R. kommt nach der 5. oder 6. Wiederholung eines Begriffes dann doch plötzlich noch ein „neuer“ Begriff zum Vorschein)', 'https://improwiki.com/de/wiki/improtheater/am_laufenden_band', '2020-11-14 07:44:25.195', 277);
INSERT INTO public.part VALUES (278, 1, '2020-12-02 22:04:20.915759', '2020-12-02 22:04:20.915759', 'Schnittmuster', 'Die Spieler stehen im Kreis. Ein Themenkreis wird ausgewählt oder vorgegeben, z. B. Berufe. Einer der Spieler fängt an und sagt zu einem beliebigen anderen im Kreis einen Beruf; beides merkt er sich. Der so Angesprochene merkt sich seinen Vormann oder seine Vorfrau und sagt zu einem weiteren Spieler einen anderen Beruf, auch er merkt sich beides usw. Jeder wird nur ein Mal angesprochen. Ist der letzte Spieler der Runde angesprochen, wendet sich dieser an den Ersten und sagt diesem einen Beruf. Es ergibt sich so ein geschlossenes "Schnittmuster" (englisch _Pattern_), welches alle Spieler kreuz und quer miteinander verbindet. Zum Erkennen der bereits Beteiligten können diese in der ersten Runde eine Hand auf den Kopf legen. In der nächsten und in den folgenden Runden wird mit den gleichen Begriffen die Reihenfolge der ersten Runde wiederholt. Wenn sich Reihenfolge und Berufe eingeprägt haben, wird die erste Runde eingestellt.

Es gibt nun eine zweite Runde, für die ein anderes Thema festgelegt wird, z. B. Gemüse- oder Obstnamen. Es fängt ein anderer Spieler an, der nun auch eine andere Person anspricht. Der so Angesprochene sagt zu einem weiteren Spieler ein anderes Gemüse oder eine andere Obstsorte usw. Ist der letzte Spieler dieser Runde angesprochen, wendet sich dieser an den Ersten der zweiten Runde und sagt diesem nun eine Obst- oder Gemüsesorte. Damit ist auch dieses "Schnittmuster" geschlossen. In der nächsten und in den folgenden Runden wird mit den gleichen Begriffen die Reihenfolge der ersten Gemüse-/Obst-Runde wiederholt.

Wenn sich Reihenfolge und Obst oder Gemüse eingeprägt haben, wird diese zweite Runde nun ergänzt um die Begriffe und die Personenreihenfolge der erste Runde. D.h. es laufen nun GLEICHZEITIG im Kreis zwei Begriffsfolgen; die beiden Schnittmuster werden "übereinander" gelegt.

## Grundregeln

Es sind folgende Grundregeln zu beachten:  
1\. Es wird immer genau die gleiche Reihenfolge eingehalten, die beim ersten Durchgang des jeweiligen Musters etabliert wurde.  
2\. Jeder, der seinen Begriff weitergeben will, achtet darauf, dass der Empfänger aufmerksam ist und insbesondere seinen Begriff weitergibt!(Blickkontakt). Kann keine Aufmerksamkeit hergestellt werden, muss der eigene Begriff so lange wiederholt werden, bis der Empfänger den Brgriff gehört und seinen weitergegeben hat.  
3\. Jeder achtet auf diejenigen, die ihm Begriffe zusenden wollen und wendet sich denjenigen zu.

Dieses Spiel erfordert eine hohes Maß an Konzentration und Aufmerksamkeit. Mutige können noch eine dritte Runde hinzufügen aus einer dritten Begriffsgruppe (Automarken, Vornamen, Ortsnamen usw.).

Geht eine Begriffsgruppe verloren (was nach einer gewisse Zeit normal ist) wird diese vom Ersten der betreffenden Runde neu gestartet.

## Varianten

*   **Haptisches Schnittmuster:** Ein Ball o. ä. wird nach der oben beschriebenen Regel von einem zum Anderen geworfen. Dieses Muster wird mit den Begriffsmustern kombiniert.

*   **Platzwechsel:** Als neues Muster wird eines etabliert, bei dem die Spieler die Plätze wechseln. Der erste Spieler zeigt auf einen anderen, sagt "Du!" und geht langsam auf dessen Platz. Der so angesprochene sucht sich einen anderen aus, auf den er zeigt und auf dessen Platz er geht usw. Ist das Schnittmuster geschlossen, wechseln alle Spieler reihum die Plätze. Wird dieses Muster mit anderen kombiniert, ergibt sich die zusätzliche Schwierigkeit, das die anzusprechenden Personen an unterschiedlichen Orten zu identifizieren sind.

*   **Raumlauf:** Wenn das Schnittmuster etabliert ist, kann der Kreis aufgelöst werden. Die Spieler laufen beliebig durch den Raum und werfen sich die Begriffe zu.

', 'https://improwiki.com/de/wiki/improtheater/schnittmuster', '2020-11-14 07:44:25.301', 278);
INSERT INTO public.part VALUES (279, 1, '2020-12-02 22:04:21.095072', '2020-12-02 22:04:21.095072', 'Ich packe meine Koffer und nehme mit', 'Die Gruppe bildet einen Kreis. Der erste sagt: "Ich packe meine Koffer und nehme mit" und fügt einen Gegenstand hinzu, welchen er mitnimmt. Das muss nicht zwangsläufig etwas sein, was man auf eine Reise mitnimmt, oder überhaupt mitnehmen kann. Es kann auch "die Freundin", "die AOL-Arena" oder etwas anderes Absurdes sein, denn es geht schließlich nach Absurdistan. Der nächste im Kreis fängt genauso an: "Ich packe meine Koffer und nehme mit", dann zählt er sämtliche Gegenstände seiner Vorredner auf, am Ende fügt er einen neuen Gegenstand hinzu. Dann kommt der Nächste im Kreis dran usw.

## Variante als Kennenlernspiel

Der erste Teilnehmer beginnt z.B. mit: "Mein Name ist Stefan, ich wohne in Stuttgart und esse gern, Spaghetti." Dann kommt der nächste Teilnehmer an die Reihe. Er wiederholt **alle** Sätze **aller** vorherigen Teilnehmer und fügt dann seinen eigenen Teil hinten an: "Du heißt Stepfan, wohnst in Stuttgart und isst Spaghetti, mein Name ist Judith, ich komme aus Jüllich und esse gerne Joghurt"', 'https://improwiki.com/de/wiki/improtheater/ich_packe_meine_koffer_und_nehme_mit', '2020-11-14 07:44:25.104', 279);
INSERT INTO public.part VALUES (280, 1, '2020-12-02 22:04:21.248331', '2020-12-02 22:04:21.248331', 'Neues Haus', '**Neues Haus** ist eine _Konzentrationsübung_ mit Blinzeln.

Die Spieler stehen im Kreis. Der Erste, Spieler A, blinzelt möglichst unauffällig einem Anderen, Spieler B, zu. Dieser signalisiert mit einem diskreten Kopfnicken, dass er den Blick registriert hat. Nachdem Spieler B mit dem Kopf genickt hat, darf Spieler A losgehen und den Platz von Spieler B (sein _neues Haus_) einnehmen. Währenddessen sucht Spieler B ein eigenes neues Haus, indem er einem weiteren Spieler C zublinzelt. Sobald es dieser ihm wiederum durch Zunicken erlaubt hat, geht Spieler B in Richtung Spieler C los und macht damit – hoffentlich rechtzeitig – den Platz für Spieler A frei usw. ...

Das Spiel erfordert Konzentration und Zuvorkommen der anderen Mitspieler. Wichtig ist, daß ein Spieler, der ein neues Haus sucht, nicht losläuft _bevor_ er ein neues Haus gefunden hat. Die anderen Mitspieler dürfen also nicht gezwungen werden, ihren Platz frei zu machen. Andererseits sollen sie möglichst so zuvorkommend sein, anderen Spielern ihren Platz anzubieten.

Die Konzentration steigt je schneller die Spieler durch den Kreis gehen. Da ein Spieler bereits losgehen kann, nachdem er einen neuen Platz erhalten hat, können sich somit mehrere Spieler gleichzeitig auf einem "Umzug" in ein _Neues Haus_ befinden.

Siehe auch Blinzeln-Platzwechsel und Blinzelmörder.

zurück zu den Aufwärmspielen', 'https://improwiki.com/de/wiki/improtheater/neues_haus', '2020-11-14 07:44:25.362', 280);
INSERT INTO public.part VALUES (281, 1, '2020-12-02 22:04:21.401911', '2020-12-02 22:04:21.401911', 'ZoomSchwartzMakeafikeliano', 'Die Gruppe bildet einen Kreis.  
Es gibt drei Impulse:  
Zoom: Ein Zoom kann an jeden Spieler weitergegeben werden, allerdings nicht an einen, von dem man ein "Schwartz" oder ein "Makeafikeliano" bekommt.  
Schwartz: Ein Schwartz ist ein Zoom, welches man an den "Zoom"-Sager zurückgibt.  
Makeafikeliano: Ein Makeafikeliano ist ein Zoom, welches man - wie ein Schwartz - an den Spieler zurückgibt, von dem man den Impuls bekommen hat, man schaut dabei aber einen anderen Spieler an.  
  
Bei folgenden Fehlern wird man aus dem Kreis ausgeschlossen:  
Man passt nicht auf und reagiert nicht oder zu langsam.  
Man bekommt ein Zoom und gibt ein Zoom an den Gleichen zurück.  
Man bekommt ein Schwartz und gibt ein Zoom an den Schwartzsager zurück.  
Man gibt ein Makeafikeliano mit Blick an den Zoom/Schwartzsager zurück.  
Ein Makeafikeliano wird weitergegeben und man wird dabei angeschaut. Da der Impuls nicht einem selbst gilt, darf man auch nicht reagieren. Reagiert man doch, fliegt man auch raus.  
Folgt ein Makefikeliano auf ein Makefikeliano, muss man arg aufpassen, weil es dann auf den Vorvormann zurückgeht.  
  
Die letzten beiden Personen, welche übrig bleiben, haben gewonnen.', 'https://improwiki.com/de/wiki/improtheater/zoomschwartzmakeafikeliano', '2020-11-14 07:44:25.4', 281);
INSERT INTO public.part VALUES (282, 1, '2020-12-02 22:04:21.547935', '2020-12-02 22:04:21.547935', 'Kreiskrabbeln', 'Die Spieler (6-14) sitzen im Kreis auf dem Boden. Zunächst empfiehlt sich eine ruhige Einstimmung, z.B. eine Atemübung. Dann beginnt, wer immer will, langsam und genüsslich (wie ein Käfer) durch den Kreis auf die andere Seite zu krabbeln. Falls ein "Hindernis" im Weg ist, zum Beispiel ein anderer Spieler, wird es einfach überkrabbelt.

Sinn der Übung: Körperkontakt, Vertrauen', 'https://improwiki.com/de/wiki/improtheater/kreiskrabbeln', '2020-11-14 07:44:25.377', 282);
INSERT INTO public.part VALUES (283, 1, '2020-12-02 22:04:21.666876', '2020-12-02 22:04:21.666876', 'Vortritt - Rücktritt', 'Die Spieler stehen im Kreis, fassen sich an die Hände und schauen sich gegenseitig an. Nach einer gewissen Zeit sagt der Spielleiter "eins". Es vergeht wieder eine gewisse Zeit, er sagt "zwei". Wenn er dann nach einer gewissen Zeit "drei" sagt, gehen die Spieler - ohne sich mit Worten oder Zeichen verständigt zu haben - gleichzeitig entweder einen Schritt nach vorn oder nach hinten. Im Idealfall haben alle intuitiv die gleiche Richtung gewählt.', 'https://improwiki.com/de/wiki/improtheater/vortritt_-_ruecktritt', '2020-11-14 07:44:25.454', 283);
INSERT INTO public.part VALUES (284, 1, '2020-12-02 22:04:21.790579', '2020-12-02 22:04:21.790579', 'Hey und Ho', 'Man nimmt zwei beliebige Gegenstände. Zunächst wird von A ein Gegenstand an den rechten Partner B im Kreis weitergegeben. Folgender Dialog:

A: "Das ist Hey!"  

B: "Wer?"  

A: "Hey!"  

B: Ah, Hey!  

Der Spieler B wendet sich nun seinem Nachbarn C zu und gibt "Hey" mit genau dem selben Satz weiter. Auf die Frage von C: "Wer?" darf B aber nicht selber "Hey" antworten, sondern er muss, da er vergesslich ist, zunächst zurück fragen zu seinem Geber, also zu A. Nur dieser darf die Frage "Wer?" beantworten. Ebenso wie die Frage wird auch die Antwort von A: "Hey" wieder durch den Kreis gegeben. Je weiter es im Kreis voran geht, desto mehr der Teilnehmenden geben also die Rückfrage "Wer" weiter, bis sie schließlich B an A stellt und er die Antwort "Hey" erhält, die B dann an C, C an D usw. gibt. Der Gegenstand selbst wird nicht zurückgegeben.

Beispiel mit bereits fünf beteiligten Spielern:

D an E: "Das ist Hey!"  

E an D: "Wer?"  

D an C: "Wer?"  

C an B: "Wer?"  

B an A: "Wer?"  

A an B: "Hey!"  

B an C: "Hey!"  

C an D: "Hey!"  

D an E: "Hey!"  

E an D: "Ah, Hey!"  

E an F: "Das ist Hey!" usw.

Wenn "Hey" einige Spieler passiert hat, geht dasselbe mit "Ho" los - allerdings in die entgegengesetzte Richtung. Brenzlig und fehlerträchtig wird es, wenn schließlich bei einem Spieler "Hey" und "Ho" bzw. die Wer-Frage zusammentreffen. Dann gilt besonders: Wer zuviel nachdenkt, hat schon verloren. Einfach machen :-)', 'https://improwiki.com/de/wiki/improtheater/hey_und_ho', '2020-11-14 07:44:25.514', 284);
INSERT INTO public.part VALUES (285, 1, '2020-12-02 22:04:21.909098', '2020-12-02 22:04:21.909098', 'Rhythmusübungen', 'Zu den Rhythmusübungen zählen Übungen und Aufwärmspiele, die ein rhythmisches Element enthalten.

## Inhaltsverzeichnis

*   Ali Baba und die 40 Räuber
*   Big Booty
*   Concentration
*   Klatschkreis
*   Klatschkreis II
*   Ruf und Antwort
*   Peter - Paul

## Ali Baba und die 40 Räuber

Bei dieser Konzentrationsübung bilden die Spieler einen Kreis. Wir erzeugen einen gemeinsamen Rhythmus, indem wir alle im Chor gleichmäßig immer wieder sagen: „Ali Baba und die 40 Räuber“. Haben wir den gemeinsamen Rhythmus gefunden, fängt Person A an - während gerade „Ali Baba...“ gesagt wird - ein Mal eine einfache Bewegung/Geste zu machen. Beim nächsten „Ali Baba“ wiederholt nun Nachbar B diese Bewegung. Währenddessen macht A eine neue Bewegung, die nun B, während er die erste macht, beobachten und sich merken muss, weil er beim nächsten „Ali Baba“ auch diese wiederholen muss. Das setzt sich reihum so fort, das heißt am Schluss wiederholt jeder im Kreis kontinuierlich die Bewegung seines Nachbarn vom vorigen „Ali Baba“. Erst wenn sich der Kreis „geschlossen“ hat, macht A keine neue Bewegung mehr, sondern muss genau so wie die anderen die Bewegung seines Nachbarn wiederholen.

## Big Booty

Siehe Big Booty.

## Concentration

Siehe Big Booty.

## Klatschkreis

Siehe Klatschkreis.

## Klatschkreis II

Diese Übung kommt aus dem Bereich der Musik, es handelt sich um ein zunächst nicht ganz einfaches Rhythmusspiel.

Die Spieler bilden einen Kreis mit Blickrichtung nach innen. Die nebeneinander stehenden Spieler stehen jeweils insgesamt etwas weniger als zwei Unterarmlängen voneinander entfernt. Beide Arme werden nun angewinkelt, die Hände sind geöffnet, es sieht so aus, als wenn man mit jeder Hand jeweils ein Tablett trägt, allerdings zeigt beim rechten Arm die Handinnenfläche nach unten (beim linken also nach oben) und die (Unter-) Arme sind eher zur Seite als nach vorn gerichtet. Die Handinnenflächen der jeweiligen Nachbarn stehen sich in geringem Abstand gegenüber. Nun geschieht Folgendes: Es wird in die Hände geklatscht, indem jeder gleichzeitig auf die Handinnenflächen seines jeweiligen Nachbarn zur Rechten und zur Linken schlägt, anschließend bewegen sich die Unterarme nach vorn und wir klatschen in unsere eigenen Hände, wobei die Handinnenflächen sich in eine senkrechte Position drehen, dann gehen die Unterarme wieder zur Seite, es wird wie soeben beschrieben die Hand des Nachbarn beklatscht. Dann wieder nach vorne klatschen. Nach dem dritten seitlichen Klatschen kommt das Schwierigste: Statt nach vorn zu klatschen drehen wir "nur" schnell unsere Hände und klatschen - im Takt bleibend - umgedreht in die Hand des Nachbarn, dann das Gleiche wie bereits beschrieben, d.h. es wird in die eigenen Hände nach vorn geklatscht. Das geschieht auch 2 (vorne klatschen) bzw. 3 Mal (seitlich klatschen), dann werden wieder die Hände gedreht usw. Das alles machen alle im gleichen Takt bzw. Rhythmus!! Um einen (gleichmäßigen und einheitlichen) Takt zu erreichen, zählen wir an, dann geben wir die Kommandos "Klatschen - vorn - Klatschen - vorn - Klatschen \[-\] - Klatschen - vorn" usw. Später muss das natürlich nach dem Einzählen möglichst rasch ohne Ansage funktionieren (da das Drehen keinen eigenen Taktschlag hat, kann es eigentlich nicht angesagt werden).

Die Schwierigkeit lässt sich noch steigern, indem man gleichzeitig auf seinem Platz kontinuierlich Seitschritte macht (rechts - Seit an, links - Seit an), ggfls. in einem vom Klatschen-Takt versetzten Takt. Eine weitere Steigerung der Schwierigkeit ist es, wenn alle gemeinsam etwas sprechen oder singen.

## Ruf und Antwort

Siehe Ruf und Antwort.

## Peter - Paul

Siehe Big Booty.', 'https://improwiki.com/de/wiki/improtheater/rhythmusuebungen', '2020-11-14 07:44:25.617', 285);
INSERT INTO public.part VALUES (286, 1, '2020-12-02 22:04:22.033418', '2020-12-02 22:04:22.033418', 'Maschine', 'Es wird der Name einer "verrückten" Maschine abgefragt, also einer Maschine, die es so nicht gibt.

In schneller Abfolge bauen die Spieler die Maschine auf, indem jeder Spieler einen Baustein der Maschine darstellt. Er tut dies durch seine Körperhaltung und eine sich wiederholende Bewegung. Nacheinander kommen die einzelnen Spieler auf die Spielfläche und ergänzen die laufende "Maschine". Schön ist es , wenn die menschlichen Komponenten der Maschine interagieren. Z.B. kann ein Hand immer wieder etwas greifen, weiterreichen, loslassen und die Hand eines Anderen fängt den fiktiven Gegenstand immer wieder auf. Wenn die Maschine vollständig ist (alle Spieler auf der Bühne sind), wird die Maschine immer schneller, bis sie explodiert.', 'https://improwiki.com/de/wiki/improtheater/maschine', '2020-11-14 07:44:25.556', 286);
INSERT INTO public.part VALUES (287, 1, '2020-12-02 22:04:22.155347', '2020-12-02 22:04:22.155347', 'Der schlafende Mensch', 'Die Wahrnehmung der Theaterspielerinnen und Spieler können durch die Übung erweitert werden.

In der Mitte des Raumes liegt ein schlafender Mensch. Ein einzelner oder auch die Gruppe konfrontieren sich hockend oder kniend ihm gegenüber. bzw. um ihn herum. Aufgabe ist es, sich dem schlafenden Menschen in kleinen Bewegungszügen zu nähern, mit leichten Spannungsmomenten des Zögerns, des Wartens, ob er sich bewegt oder reagiert, durchsetzt mit Momenten vorsichtigen Zurückweichens, erneuter Zuwendung bis zum Antippen des Gegenstandes und der Flucht zum Ausgangspunkt.', 'https://improwiki.com/de/wiki/improtheater/der_schlafende_mensch', '2020-11-14 07:44:25.64', 287);
INSERT INTO public.part VALUES (288, 1, '2020-12-02 22:04:22.297662', '2020-12-02 22:04:22.297662', 'Blinzelmörder', 'Alle Spieler gehen durch den Raum. Vorher hat der Spielleiter einen auserkoren, welcher mit einem Blinzeln töten kann. Dieser muss nun möglichst unauffällig so viele wie möglich töten, in dem er sie anblinzelt. Wer getroffen ist, fällt tot um und bleibt liegen.

Gleichzeitig müssen alle versuchen, herauszufinden, wer der Mörder ist. Sobald einer es weiß, ruft er laut seinen Namen. Stimmt seine Vermutung nicht, stirbt er auch.

**Varianten**

*   Der Spielleiter wählt einen Blinzelmörder und einen Polizisten aus. Der Blinzelmörder kann immer noch durch ein einfaches Blinzeln töten. Blinzelt er jedoch den Polizisten an, so wird er festgenommen und hat verloren. Den anderen Spielern ist es nicht gestattet den Mörder zu entlarven, auch wenn sie ihn beim Blinzeln erwischt haben.
*   Der Ermordete geht noch zehn Schritte, bevor er tot umfällt. So wird die Suche nach dem Mörder erschwert.
*   Wenn ein Spieler meint, den Mörder herausgefunden zu haben, geht er zum Spielleiter und teilt nur diesem seine Vermutung mit. So kann der Mörder nicht im Ausschlußverfahren von den Verbleibenden ermittelt werden.

Das Spiel macht noch mehr Spaß, wenn die Spieler versuchen eine Szene zu spielen, z.B. eine Gesellschaft auf einem Kreuzfahrtschiff um die Jahrhundertwende. Jeder Spieler übernimmt einen Charakter in diesem Bild und versucht diesen auch überzeugend das Spiel hindurch zu spielen.

**Ziel**

*   Schulung der Wahrnehmung

', 'https://improwiki.com/de/wiki/improtheater/blinzelmoerder', '2020-11-14 07:44:25.638', 288);
INSERT INTO public.part VALUES (289, 1, '2020-12-02 22:04:22.432456', '2020-12-02 22:04:22.432456', 'Bilder bauen', 'Die Spieler gehen durch den Raum (Raumlauf). Der Spielleiter gibt Gegenstände, Berufe oder Räume vor, z.B. "Klavier", "Polizist" oder "in der Straßenbahn". Die Spieler bauen sofort das Gesagte irgendwie mit ihren Körpern als Standbild nach. Zum Beispiel könnten zwei Spieler das Klavier bilden, einer geht davor auf alle Viere als Klavierhocker und einer setzt sich darauf und mimt den Klavierspieler. Wenn das Bild steht, sagt der Spielleiter, was er in den Figuren zu erkennen glaubt, und diese können darauf sagen, was sie eigentlich darstellen wollten. Dann dürfen sich die eingefrorenenen Spieler wieder lösen und gehen alle wieder durch den Raum, bis das nächste Bild gerufen wird. Die Spielleiter-Rolle (wer das Bild nennt) kann reihum wechseln.

Lernziel ist, sich ohne Absprachen zu gruppieren und zu sehen, was dem Gesamtbild noch fehlt, um an der benötigten Stelle einzuspringen.

Diese Übung ist gut geeignet für einen Workshop mit Impro-Anfängern. Sie ist eng verwandt mit Ich bin ein Baum und dem Spiel Diashow.', 'https://improwiki.com/de/wiki/improtheater/bilder_bauen', '2020-11-14 07:44:25.731', 289);
INSERT INTO public.part VALUES (290, 1, '2020-12-02 22:04:22.567347', '2020-12-02 22:04:22.567347', 'Wo ist...?', 'Die Spieler bewegen sich **aufmerksam** kreuz und quer im Raum. Irgendwann sagt der Spielleiter „Stopp“ und alle bleiben stehen und schließen die Augen. Nach einigen Sekunden nennt der Spielleiter den Namen eines der Anwesenden. Aufgabe der Anderen ist es, sich zu erinnern, wo die genannte Person zuletzt war. Sie deuten mit dem ausgestreckten Arm dorthin, wo sie die betreffende Person vermuten. Schließlich dürfen alle die Augen öffnen und überprüfen, ob sie in die richtige Richtung gezeigt haben. Dies wird mehrfach wiederholt.

Mit dieser Übung werden Wahrnehmung und Achtsamkeit geschärft.

Der Spielleiter kann die Leute gelegentlich irritieren, indem er plötzlich nach einem Gegenstand fragt, der in dem Raum vorhanden ist. Z.B. „Wo hängt die Uhr?“', 'https://improwiki.com/de/wiki/improtheater/wo_ist', '2020-11-14 07:44:25.744', 290);
INSERT INTO public.part VALUES (291, 1, '2020-12-02 22:04:22.677974', '2020-12-02 22:04:22.677974', 'Der strenge Chef', 'Drei Spieler sitzen nebeneinander auf drei Stühlen. In der Mitte sitzt der Chef, links und rechts sitzen seine Untergebenen. Der Chef versucht nun seine Mitarbeiter zu unterweisen und mit ihnen zu sprechen. Dabei kann er sich natürlich nur immer einem Spieler zuwenden. Der andere ist jeweils eine treulose Seele: immer wenn sich sein Chef abwendet, zieht er Grimassen und verulkt den Chef. Merkt der Chef dies, dann wirft er diesen Mitarbeiter hinaus und er wird durch einen neuen ersetzt.

Siehe auch Einer zuviel', 'https://improwiki.com/de/wiki/improtheater/der_strenge_chef', '2020-11-14 07:44:25.753', 291);
INSERT INTO public.part VALUES (292, 1, '2020-12-02 22:04:22.79053', '2020-12-02 22:04:22.79053', 'Namenskreis', '### Namenskreis 1

Es bilden sich Zweierteams.

Die Spieler tauschen ihre Namen.

Es muss eine Person allein übrigbleiben, diese behält ihren Namen und ruft nun einen der Mitspieler, welcher dann schnell zu ihr geht. Sein Nebenmann im Zweierteam, dessen Namen er angenommen hat, versucht ihn mit dem Arm oder der Hand aufzuhalten. Hat er ihn berührt, darf er nicht gehen. Hat es einer geschafft, seinen Platz zu verlassen, ergibt sich eine neue Namenskostellation, denn das neu gebildete Team wechselt nun ihre Namen und der neue Alleinspieler ruft jemanden zu sich. Das Spiel eignet sich gut, um sich neue Namen einzuprägen.

### Namenskreis 2

Die Spieler stehen im Kreis. Ein Ball wird von Spieler zu Spieler geworfen. Beim Werfen wird der Name des Spielers genannt, an der der Ball als nächstes geworfen werden soll.

**Beispiel:** Michael wirf zu Cordula und sagt Stefan. Cordula fängt den Ball und wirf diesen anschließend zu Stefan und sagt dabei Ulrike. Nun fängt Stefan den Ball und wirf ihn zu Ulrike ...', 'https://improwiki.com/de/wiki/improtheater/namenskreis', '2020-11-14 07:44:25.849', 292);
INSERT INTO public.part VALUES (293, 1, '2020-12-02 22:04:22.91525', '2020-12-02 22:04:22.91525', 'Imitationskreis', 'Die Spieler stehen im Kreis. Es wird ein Schnittmuster definiert, wodurch jeder einen "Vorgänger" und einen "Nachfolger" hat, der ihm ungefähr im Kreis gegenüber steht. Jeder sieht nun seinen Vorgänger an und imitiert fortwährend jede seiner Bewegungen. Es herrscht kein Augenkontakt zwischen zwei Spielern: B kopiert A, C kopiert B, D kopiert C usw. Mit der Zeit schaukeln sich kleine zufällige Bewegungen von selber immer mehr auf, bis der ganze Kreis eskaliert.

Sinn der Übung: Wahrnehmung, genaues Kopieren, Enthemmung.', 'https://improwiki.com/de/wiki/improtheater/imitationskreis', '2020-11-14 07:44:25.826', 293);
INSERT INTO public.part VALUES (294, 1, '2020-12-02 22:04:23.050975', '2020-12-02 22:04:23.050975', 'Wahrnehmungskreis', 'Im Kreis werden in zwei Richtungen Laute und Gesten weitergegeben.

**Hase:** Beide Zeigefinger nach oben an die Kopfseite halten als Ohren, den nächsten anschauen und "iiiiiih" sagen.

**Jäger:** Dem nächsten leicht ans Schienbein hauen und "umpf" rufen.

**Opa:** Hand hinters Ohr und "Häh?" fragen.

**Gott:** Arme von oben nach unten im Halbkreis bewegen und "Ommmm" sagen.

Zuerst wird nur eine Figur weitergegeben, dann die zweite in die entgegengesetzte Richtung, dann eine dritte und evtl. noch die vierte. Geht eine Figur verloren, wird von vorn begonnen.

Siehe auch Begriffskreis', 'https://improwiki.com/de/wiki/improtheater/wahrnehmungskreis', '2020-11-14 07:44:25.868', 294);
INSERT INTO public.part VALUES (295, 1, '2020-12-02 22:04:23.197132', '2020-12-02 22:04:23.197132', 'Geräuschdusche', 'Ein Spieler stellt sich in die Mitte und schließt seine Augen. Die anderen Teilnehmer stehen oder gehen um Ihn herum. Dabei machen sie allerhand Geräusche (Wind, Tiere, Maschinen). Versucht dabei einen Spannungbogen zu entwickeln. Fangt langsam und leise an und hört auch so auf. Während dieser Übung darf niemand sprechen.', 'https://improwiki.com/de/wiki/improtheater/geraeuschdusche', '2020-11-14 07:44:25.91', 295);
INSERT INTO public.part VALUES (296, 1, '2020-12-02 22:04:23.317976', '2020-12-02 22:04:23.317976', 'Folge dem Folgenden', 'Unter dem Begriff **Folge dem Folgenden** versteht man das Prinzip, dass mehrere Spieler eine bestimmte Handlung gleichzeitig ausführen, ohne dass es einen designierten Initiator für den genauen Zeitpunkt gibt. Im Unterschied zu anderen Übungen gibt es hier _keine_ klare Trennung von Führen und Folgen, sondern jeder "folgt dem Folgenden".

Das funktioniert, wenn jeder völlig aufmerksam auf die anderen achtet und bereit ist, dem gemeinsamen Impuls, wenn er ihn wahrnimmt, sofort (gleichzeitig mit allen anderen) zu folgen. Woher der Impuls kam, von welchem Spieler (oder anderem Ereignis, z.B. einem Geräusch) "die Zündung ausging", lässt sich im Idealfall im Nachhinein nicht mehr feststellen.

Hierzu gibt es mehrere Übungen.

### Gehen und Stehen

Die Spieler werden in zwei Gruppen eingeteilt und verteilen sich gemischt im Raum. Gruppe A steht still und Gruppe B geht umher. Irgendwann gibt es einen gemeinsamen Impuls dafür, dass Gruppe B gleichzeitig anhält und dafür zeitgleich Gruppe A losgeht. Nach einer Weile wird wieder Gruppe A stehenbleiben und B geht wieder, usw. Alle Mitglieder von einer Gruppe geben so gleichzeitig ihren Bewegungsimpuls an alle Mitglieder der anderen Gruppe ab.

Siehe dazu auch Gehen und Stehen.

### Gemeinsam klatschen

Die Spieler stehen im Kreis und schließen die Augen. Irgendwann kommt der gemeinsame Impuls, in die Hände zu klatschen. Nach einer Weile kommt wieder ein Klatschimpuls. Die Spieler sollen sich bemühen, so gleichzeitig wie möglich zu klatschen. Nach einiger Zeit gelingt das erstaunlich gut.

Das Ende der Übung ergibt sich automatisch: die Zeiten zwischen den Klatschern werden von selbst immer kürzer, so dass es schließlich eskaliert. Dies ist ein "Naturgesetz" und jedesmal beobachtbar, wenn man die Übung mit irgendeiner Gruppe macht.', 'https://improwiki.com/de/wiki/improtheater/folge_dem_folgenden', '2020-11-14 07:44:25.981', 296);
INSERT INTO public.part VALUES (297, 1, '2020-12-02 22:04:23.422598', '2020-12-02 22:04:23.422598', 'Hot Spot', 'Die Spieler bilden einen Kreis. Ein Spieler geht in die Mitte. Er beginnt ein Lied zu singen und die anderen Spieler versuchen einzustimmen. Fällt einem der umstehenden Spieler ein neues Lied ein, welches in einer Beziehung zum dem aktuellen Lied steht (Text, Melodie, Stimmung), dann löst er den Spieler in der Mitte ab und beginnt das neue Lied zu singen.

**Wichtig:** Das Spiel muß zügig gespielt werden. Der Sänger in der Mitte darf keinen Hänger haben und sollte schnell ausgetauscht werden.

_Siehe auch:_ Gesangsassoziation', 'https://improwiki.com/de/wiki/improtheater/hot_spot', '2020-11-14 07:44:26.012', 297);
INSERT INTO public.part VALUES (298, 1, '2020-12-02 22:04:23.546409', '2020-12-02 22:04:23.546409', 'Bewegungsimpuls durch Berührung', 'Die Spieler bilden Paare und verteilen sich im Raum. Einer (A) steht mit geschlossenen Augen. Der andere (B) tippt ihn nun leicht an den verschiedensten Körperstellen an. An der Berührungsstelle bekommt A jeweils aus sich heraus einen Bewegungsimpuls, den entsprechenden Körperteil irgendwie zu bewegen.

Nach einer Weile wird gewechselt.

Anschließend kann man folgende Varianten versuchen:

*   ein Gefühl wird vorgegeben, das A bei der Berührung empfindet und zeigt (mit der Bewegung, unterstützt durch Mimik und Stimme), z.B.:
    *   Glücksgefühl (Freude)
    *   Hassgefühl
    *   belustigt sein / Lachen
    *   (weitere siehe Gefühlsliste)
*   A empfindet und zeigt bei jedem Berührungsimpuls ein anderes Gefühl

Sinn der Übung: das Gefühl in einen Körperteil "hinein empfinden", das Gefühl zusammen mit einer Bewegung ausdrücken.

Tipp: Die Übung wirkt ziemlich "stark", sowohl für A als auch B, der durch seine Berührungen ja erst die Reaktion von A auslöst. Deshalb mit einem positiven Gefühl beginnen und enden.', 'https://improwiki.com/de/wiki/improtheater/bewegungsimpuls_durch_beruehrung', '2020-11-14 07:44:26.754', 298);
INSERT INTO public.part VALUES (306, 1, '2020-12-02 22:04:24.773139', '2020-12-02 22:04:24.773139', 'Überforderung des Zuhörers', 'Eine Übung für 4 Spieler um das genaue Zuhören durch leichte sensorische Überforderung zu trainieren.

Ein Spieler Z stellt sich in die Mitte und ist der Zuhörer. Links, rechts, sowie vor ihm steht jeweils ein weiterer Spieler. Der zuhörende Spieler Z muss nun folgendes tun:

*   Permanent die Bewegungen des Spielers vor ihm spiegeln, also die Bewegungen 1:1 kopieren.
*   Dabei abwechselnd einfache arithmetische Fragen des linken Spielers beantworten, z.B.: "Wieviel ist 9\*9+3?)
*   Dabei abwechselnd einfache persönliche Fragen vom rechten Spieler beantworten, z.B.: "Wie heißt deine Mutter mit Vornamen?"

Wenn der zentrale Spieler eine Bewegung "verpasst" oder eine Frage nicht gleich beantwortet, sagt der jeweilige Spieler, dem nicht gefolgt wurde solange "Beep beep beep beep", bis die Frage beantwortet ist oder die Bewegung gespiegelt wird. Nach ein paar Minuten geht jeder Spieler einen Platz weiter und das Ganze beginnt von vorne, damit jeder mal an der Reihe und Zuhörer ist.', 'https://improwiki.com/de/wiki/improtheater/ueberforderung_des_zuhoerers', '2020-11-14 07:44:26.3', 306);
INSERT INTO public.part VALUES (299, 1, '2020-12-02 22:04:23.680936', '2020-12-02 22:04:23.680936', 'Routinehandlungen interessanter machen', 'Diese Übung trainiert das im Moment bleiben in einer Routine oder alltäglichen Handlung, ohne vorauszuplanen. Die Idee ist, dass jede noch so banal erscheinende Handlung weiterentwickelt und interessanter gemacht werden kann.

Eine Routinehandlung (z.B. Blumen gießen) wird stufenlos weiterentwickelt, so dass man die Handlung nicht einfach nur abschließt und zu einer vollkommen anderen Handlung übergeht. Die Handlung wird als Auslöser gesehen und im Prozess wird diese Handlung "größer gemacht" ohne abrupt zu einer vollkommen vorausgeplanten und ausgedachten anderen Handlung überzugehen. Alles ergibt sich aus der Konsequenz der Starthandlung.

Diese Übung kann zunächst mit einem Spieler gespielt werden (später auch mit mehren).

Der Spieler mimt eine alltägliche Tätigkeit, zum Beispiel "Zeitung lesen". Er könnte dann zum Beispiel nach einer Weile etwas Interessantes in der Zeitung entdecken, was zum Beispiel kleingedruckt ist. Der Spieler könnte dann eine Lupe holen, um die Buchstaben zu entziffern und findet nach und nach heraus, was der Zeitungstext bedeutet. Er erkennt darin zum Beispiel seine eigene Todesanzeige.

Darüber ist der Spieler vielleicht so überrascht und erstaunt, dass er den Text immer wieder leise vor sich herliest und herstammelt und schließlich beginnt, ihn lauter vorzulesen. Der Spieler könnte dann im Verlauf immer lauter werden und ihn am Ende Buchstabe für Buchstabe schreiend vorlesen und dabei mit den Fingern und der Hand auf die Zeitung einschlagen usw.

*   In einer nächsten Phase dieser Übung nimmt man die Starthandlung zum Anlass und macht sie auch interessanter. Dabei entdeckt man dann aber evtl. eine neue willkürliche Richtung, die man fortsetzen kann, zum Beispiel eine neue Handlung, die man nun interessanter machen kann. Auch dies verhindert, dass man diese Handlungen vorher planen kann. Zum Beispiel könnte ein Spieler gerade die Handlung einen Tisch polieren interessanter machen und haucht dabei auch den Tisch an, Dann könnte die Handlung "Anhauchen des Tisches " zu seiner neuen Handlung werden, die er interessanter macht.

### Verweise

*   Eine verwandte Übung, die daneben auch eine Technik zum Geschichten erzählen ist, ist Routine unterbrechen .', 'https://improwiki.com/de/wiki/improtheater/routinehandlungen_interessanter_machen', '2020-11-14 07:44:26.064', 299);
INSERT INTO public.part VALUES (300, 1, '2020-12-02 22:04:23.954868', '2020-12-02 22:04:23.954868', 'Bewegungsimpulsen folgen', 'Die Spieler legen sich entspannt auf den Boden (mit möglichst viel Platz um sich herum, eventuell auf Isomatten) und schließen die Augen.

Nun spüren sie in ihren Körper hinein. Wenn sie irgendeinen Bewegungsimpuls spüren, folgen sie ihm. Das kann ein Zucken mit irgendeinem Körperteil sein, oder auch mal eine größere Bewegung. Was sich dabei ergibt, ist völlig egal, es braucht keine "Bedeutung zu haben" und auch niemandem peinlich zu sein (alle sind ja auch blind). Es geht nur darum, die inneren Impulse zu spüren und ihnen zu folgen.

Nach etwa 5 Minuten beendet der Spielleiter die Übung, die Spieler kommen im Sitzkreis zusammen und berichten über ihre Erfahrungen.

Variante: Man kann die Übung auch im Stehen machen.

Siehe auch: Bewegungsimpuls durch Berührung', 'https://improwiki.com/de/wiki/improtheater/bewegungsimpulsen_folgen', '2020-11-14 07:44:26.08', 300);
INSERT INTO public.part VALUES (301, 1, '2020-12-02 22:04:24.110496', '2020-12-02 22:04:24.110496', 'Was machst du', 'Bei dieser Übung stehen zwei Spieler stehen auf der Bühne.

A fragt B: "Was machst du?"

B sagt das, was ihm gerade einfällt, z.B. "Ich ernte Kartoffeln."

Daraufhin macht A genau das, was B gerade gesagt hat und erntet Kartoffeln.

Dann fragt B: "Was machst du?" und A antwortet etwas völlig anderes: "Ich besteige den Mount Everest", woraufhin B den Mount Everest besteigt.

Das Ganze sollte möglichst schnell erfolgen.

Stockt einer der Spieler, wird er durch einen anderen ausgetauscht.

_Variante:_  
Die Übung kann auch mit mehreren Spieler gemacht werden. Dabei wechselt die Aktion nicht zwischen zwei Spielern hin und her, sondern man bildet einen Kreis und die Aktion wandert immer eine Person weiter. Dies ist aber eher eine Vorübung zu der Variant mit zwei Spielern. Die Spieler haben die Möglichkeit des Vorrausplanens, was bei der Zweier-Variante viel schwieriger ist.', 'https://improwiki.com/de/wiki/improtheater/was_machst_du', '2020-11-14 07:44:26.19', 301);
INSERT INTO public.part VALUES (302, 1, '2020-12-02 22:04:24.2273', '2020-12-02 22:04:24.2273', 'Multitasking', 'An dieser Übung sind drei Personen beteiligt. Eine Person A steht bereit in der Mitte, zwei andere stehen vor ihr. Die eine - B - macht mit dem Oberkörper langsam einfache Bewegungen, die andere - C - mit dem Unterbau. Beides muss A gleichzeitig spiegelbildlich nachmachen. Weiterhin stellen B und C abwechselnd Fragen, die A beantworten muss. Einer stellt einfache Rechenaufgabe, der andere stellt persönliche Fragen.

Nach einer gewissen Zeit wird gewechselt.

**Varianten:** Keine persönlichen Fragen, sondern es wird nach Assoziationen gefragt.  
Vier Beteiligte, etwas einfacher: B und C stellen nur Fragen, der vierte macht die nachzumachenden Bewegungen.', 'https://improwiki.com/de/wiki/improtheater/multitasking', '2020-11-14 07:44:26.168', 302);
INSERT INTO public.part VALUES (303, 1, '2020-12-02 22:04:24.340603', '2020-12-02 22:04:24.340603', 'Auf Linie', 'Alle Spieler stehen nebeneinander auf einer Linie, mit Blickrichtung nach vorn. Am linken und am rechten Ende der Reihe muss Platz bleiben, vor und hinter den Spielern auch.

1\. Phase  
Je nach Anweisung des Spielleiters bewegen sich alle einheitlich. Wenn der Spielleiter "vor" sagt, gehen alle einen Schritt nach vorn, wenn er "zurück" sagt, gehen alle nach hinten. Gleiches gilt hinsichtlich eines Seitschritts nach links und rechts.

2\. Phase  
Wie oben, aber links/rechts (oder vor/zurück) sind vertauscht. Wenn der Spielleiter "links" sagt, machen alle einen Seitschritt nach rechts, wenn er "rechts" sagt, gibt es einen Seitschritt nach links. Vor und zurück (oder links/rechts) bleiben unverändert.

3\. Phase  
Wie oben, aber nun ist bei allen vier Anweisungen das Gegenteil gemeint. "Links" gesagt meint rechts. "Vor" meint zurück usw.

4\. Phase  
Nun sind die Begriff wie folgt zu übersetzen:  
"vor" = nach rechts,  
"rechts" = nach hinten,  
"zurück" = nach links,  
"links" = nach vorn.  
Man kann versuchen, es sich so zu merken: Alles Anweisungen sind so zu verstehen, dass sich die auszuführende Bewegung im Uhrzeigersinne um ein Viertel (eine Viertelstunde) "verschiebt".', 'https://improwiki.com/de/wiki/improtheater/auf_linie', '2020-11-14 07:44:26.205', 303);
INSERT INTO public.part VALUES (304, 1, '2020-12-02 22:04:24.504811', '2020-12-02 22:04:24.504811', 'Dinge anders benennen', 'Die Spieler gehen im Raum umher und benennen die Dinge im Raum. Dabei sollten sie die entsprechenden Gegenstände anfassen. Also zum Beispiel: "Wand." "Ecke." "Heizkörper." usw. Das ganze etwa 1 bis 2 Minuten lang.

Anschließend machen sie diese Übung erneut, benennen diesmal aber die Dinge anders. Zum Beispiel fasst einer an den Stuhl und sagt "Apfelmus". Einer fasst an den Boden und sagt "Handtasche". Dabei fällt das spontane rasche Benennen von Gegenständen leichter, wenn man gedanklich eine Assoziationskette bildet.

Danach kommen die Spieler zusammen und berichten über ihre Erfahrungen. Hat sich der Raum in ihrer Wahrnehmung verändert? (Vielen wird der Raum nun subjektiv kleiner oder vertrauter erscheinen, vielleicht sind auch die Farben intensiver oder die Konturen klarer.)

Dieses Aufwärmspiel ist sehr gut, um sich mit einem neuen Raum vertraut zu machen. Außerdem trainiert es das "Schizo-Denken".', 'https://improwiki.com/de/wiki/improtheater/dinge_anders_benennen', '2020-11-14 07:44:26.317', 304);
INSERT INTO public.part VALUES (305, 1, '2020-12-02 22:04:24.641211', '2020-12-02 22:04:24.641211', 'Gegenteil', 'Der Spielleiter bittet die Teilnehmer, das Gegenteil von dem zu tun, was er vorgibt.

Beispiele:

leise sprechen = laut sprechen

vorwärts gehen = rückwärts gehen

aufstehen = hinlegen

Oder: als Variante von Neue Wahl, in der der Spieler das Gegenteil des letzten Satzes behauptet, sobald der Spielleiter "Im Gegenteil" ruft.', 'https://improwiki.com/de/wiki/improtheater/gegenteil', '2020-11-14 07:44:26.256', 305);
INSERT INTO public.part VALUES (307, 1, '2020-12-02 22:04:24.918063', '2020-12-02 22:04:24.918063', 'Gesangsassoziation', 'Einer tritt in die Mitte und fängt ein bekanntes Lied an, noch bevor er den Text verliert, sollte ein anderer ihn ablösen und ein Lied singen, welches mit dem Thema des Vorliedes zu tun hat. Fällt einem nichts ein, singt man ein anderes Lied, und es wird daraufhin neu assoziiert.

siehe auch Assoziieren, Rampensau-Singen, Hot Spot', 'https://improwiki.com/de/wiki/improtheater/gesangsassoziation', '2020-11-14 07:44:26.42', 307);
INSERT INTO public.part VALUES (308, 1, '2020-12-02 22:04:25.152086', '2020-12-02 22:04:25.152086', 'Glockenturm', 'Die Improgruppe bildet einen Kreis und jeder umarmt seinen Nachbarn. Dabei schauen alle auf den Boden in der Mitte des Kreises. Alle schwingen im Rhythmus hin und her von einem auf das andere Bein und singen im Rhythmus mit tiefer, klangvoller Stimme: "Bimm - Bamm - Bimm - Bamm...".  
Irgendwann fängt der erste an, ein kleines Glöckchen darzustellen, in dem es eine Alternativmelodie bimmelt, welche aber trotzdem zum Takt der großen Glocke passt.  
Danach kommt der Nebenmann dran, bis die Runde ein oder zweimal durchlaufen wurde.  
  

**Variante:** Jeder spricht einen Zwei- oder Vierzeiler, was ihm gerade einfällt im Takt zum Glocken-Bimm-Bamm. Das muss nicht gereimt sein.', 'https://improwiki.com/de/wiki/improtheater/glockenturm', '2020-11-14 07:44:26.405', 308);
INSERT INTO public.part VALUES (309, 1, '2020-12-02 22:04:25.361276', '2020-12-02 22:04:25.361276', 'Gähnübung', 'Alle Spieler gehen durch den Raum und Gähnen, so laut es nur geht.  
Man wird merken, dass die Laute dabei von ziemlich weit hinten kommen.  
Dann versucht man leise zu sprechen, allerdings immer noch so, als würde man gerade gähnen, also indem der Kehlkopf ziemlich weit unten hängt.  
Im nächsten Schritt redet man nun immer lauter.  
Der Effekt ist, man kann sehr einfach laut reden, ohne sich groß anstrengen zu müssen.  
Zum Vergleich kann man versuchen ganz normal eine Weile sehr laut zu reden. Man wird feststellen, dass das viel anstrengender ist.  
  
Diese Übung dient als Vorbereitung zum Singen, kann aber auch sonst auf der Bühne von Nützen sein.', 'https://improwiki.com/de/wiki/improtheater/gaehnuebung', '2020-11-14 07:44:26.445', 309);
INSERT INTO public.part VALUES (310, 1, '2020-12-02 22:04:25.467406', '2020-12-02 22:04:25.467406', 'Einsingen', '**Übung 1:**  
Alle singen ein bekanntes einfaches Lied (Hänschen Klein, verschiedene Kanons (Theo, spann den Wagen an), etc.) in verschiedenen Tonlagen, welche vom Musiker vorgegeben werden.  
  
**Übung 2:**  
Der Musiker gibt einen Ton vor, alle stimmen ein und halten den Ton.  
  
**Übung 3:**  
Der Musiker gibt einen Akkord vor, alle stimmen ein. Dabei wird es vorkommen, dass unterschiedliche Töne gesungen werden, da ein Akkord auch aus unterschiedlichen Tönen besteht.  
  
**Übung 4:**  
Der Musiker spielt mehrere Akkorde hintereinander und alle stimmen ein, es passen immer mehrere Töne, manchmal muss man den Ton nicht wechseln, obwohl der Akkord gewechselt hat.  
  
**Übung 5:**  
Der Musiker spielt mehrere Akkorde hintereinander, und alle singen ihre Töne mit, versuchen dann aber auch mal ein paar Töne außerhalb des Akkords zu singen und kreieren damit eine Melodie. Die Töne können auch mehrere Tonlagen darunter oder darüber liegen und man wird merken, dass es trotzdem passt, solange man wieder zum Grundton zurück findet.  
Die Töne können dabei lang oder auch kurz gesungen werden.  
  
(Hilfreich ist bei allen Übungen, wenn man sich frei im Raum bewegt, da man dann immer andere Töne von den verschiedenen Personen hört und mal näher und weiter vom Musiker und der Musikquelle entfernt ist.)', 'https://improwiki.com/de/wiki/improtheater/einsingen', '2020-11-14 07:44:26.535', 310);
INSERT INTO public.part VALUES (311, 1, '2020-12-02 22:04:25.592668', '2020-12-02 22:04:25.592668', 'Sologesang mit Tempowechsel', '(mit oder ohne Vorgabe eines Themas)

Der Musiker sucht sich eine Melodie und einen Musikstil.

Der Spieler singt einen Vierzeiler oder mehr, dann ändert sich plötzlich das Tempo, der Sänger wechselt mit.

Langsame Melodie - langsam gesungen, flotte Melodie - schnell gesungen.

Danach andersherum: Langsame Melodie, aber schnell gesungen, flotte Melodie aber langsam gesungen, das Verblüffende daran ist, es funktioniert trotzdem, und es gibt einen ganz besonderen Effekt.', 'https://improwiki.com/de/wiki/improtheater/sologesang_mit_tempowechsel', '2020-11-14 07:44:26.491', 311);
INSERT INTO public.part VALUES (312, 1, '2020-12-02 22:04:25.738602', '2020-12-02 22:04:25.738602', 'Vokalsingen', 'Alle stellen sich entspannt und gerade im Kreis auf. Es werden folgende Vokale gesungen:  
**I - E - A - O - U**.  
Die Reihenfolge wird dabei nicht verändert.  
Man stellt sich dabei vor, dass das **I** durch die Stirn gesungen wird,  
das **E** nach schräg oben durch die Augen,  
das **A** geradeaus durch den Mund,  
das **O** nach schräg unten durch die Brust,  
und das **U** nach ganz unten durch die Beine.  
  
Dabei werden die Vokale sehr lang gedehnt und es darf kein harter Übergang zwischen ihnen zu hören sein.  
Der weiche Übergang vom **E** zum **A** ist dabei besonders schwierig.  
Diese Übung wird ein paar Mal wiederholt.  
Man wird feststellen, dass die Stimme von Anfang zum Ende ungewollt immer tiefer wird.', 'https://improwiki.com/de/wiki/improtheater/vokalsingen', '2020-11-14 07:44:26.558', 312);
INSERT INTO public.part VALUES (313, 1, '2020-12-02 22:04:25.865297', '2020-12-02 22:04:25.865297', 'Ton abnehmen', 'Die Spieler stehen im Kreis. Der erste fängt an und singt einen beliebigen Ton auf einem beliebigen Vokal. Sein Nachbar "nimmt diesen Ton ab". Wenn der erste hört, dass sein Nachbar den richtigen Ton hat, verstummt er. Der Nachbar verändert nun den Ton irgendwie (möglichst in einem gleitenden Übergang, nicht abrupt), d.h. in Tonhöhe, Vokalfarbe und/oder Lautstärke, und gibt den veränderten Ton an den nächsten im Kreis weiter. Beim "Ton-geben" und "-nehmen" wenden sich die Spieler jeweils die Köpfe zu.

Die Übung trainiert die die Fähigkeit, einen gehörten Ton exakt zu treffen und nachzusingen. Sie ist daher gut als Eingangsübung für beliebige Gesangsarbeit geeignet.

Auch als Paarübung zu zweit möglich. Die Paare sollten dazu möglichst in verschiedene Ecken/Räume gehen, damit sie sich nicht stören.', 'https://improwiki.com/de/wiki/improtheater/ton_abnehmen', '2020-11-14 07:44:26.577', 313);
INSERT INTO public.part VALUES (314, 1, '2020-12-02 22:04:25.98766', '2020-12-02 22:04:25.98766', 'Gesangskreis mit Refrain', 'Vier singen eine Strophe, jeder eine Zeile, Reimform ist egal, der Fünfte fasst das Thema in einem Refrain zusammen, in einem Zwei- oder Vierzeiler. Nach einer kurzen Pause: Die nächsten Vier singen eine neue Strophe zu einem anderen Thema.

**Variation:**

Die nächsten Vier singen eine weitere Strophe zum gleichen Thema, danach wiederholt der Refrainsänger der ersten Strophe seinen Refrain, evtl. singen dann alle den Refrain mit, dann gibt es vielleicht noch eine dritte und vierte Strophe, jeweils mit Refrain.', 'https://improwiki.com/de/wiki/improtheater/gesangskreis_mit_refrain', '2020-11-14 07:44:26.617', 314);
INSERT INTO public.part VALUES (315, 1, '2020-12-02 22:04:26.12892', '2020-12-02 22:04:26.12892', 'Ton treffen', 'Ein bekanntes Lied ("Alle meine Entchen", "Hänschen Klein" etc.) wird gesungen. Dabei wird jede Silbe aber nur so kurz wie möglich angesungen.

Diese Übung dient dazu, schneller den richtigen Ton zu treffen, denn durch das kurze Singen der Töne bleibt einem kaum Zeit, den richtigen Ton zu treffen oder eventuell einen falschen zu korrigieren.', 'https://improwiki.com/de/wiki/improtheater/ton_treffen', '2020-11-14 07:44:26.635', 315);
INSERT INTO public.part VALUES (316, 1, '2020-12-02 22:04:26.338673', '2020-12-02 22:04:26.338673', 'Emotionales Singen', 'Alle singen ein bekanntes einfaches Lied (z.B. Hänschen Klein oder verschiedene Kanons \[Theo,\]) ohne Musikbegleitung.  
Der Spielleiter gibt irgendwann eine Emotion vor und alle singen mit dieser Emotion weiter.  
z.B. verliebt, lustig, wütend, verachtend, schüchtern (siehe auch Gefühlsliste).

Siehe auch Sing dein Gefühl', 'https://improwiki.com/de/wiki/improtheater/emotionales_singen', '2020-11-14 07:44:26.679', 316);
INSERT INTO public.part VALUES (317, 1, '2020-12-02 22:04:26.457547', '2020-12-02 22:04:26.457547', 'Stimmvolumentraining', 'Vorübung: Gähnübung

Ein vorgegebener Ton wird gesungen. Dabei wird der Rachen so weit wie möglich geöffnet, wie beim Gähnen, ohne dabei den Mund allzuweit zu öffnen. Man bewegt dazu am besten nur den Unterkiefer so weit wie möglich nach unten, um den Mundraum zu erweitern und den Ton so weit wie möglich hinten zu singen. Das ist stimmschonender, als wenn der Ton vorn gesungen wird, besonders bei hohen Tönen.

Der vorgegebene Ton wird eine Zeit lang gehalten, dann geht der Tonangebende einen Ton höher. Jeder geht solange mit, bis er das Gefühl hat, nicht mehr höher singen zu können.', 'https://improwiki.com/de/wiki/improtheater/stimmvolumentraining', '2020-11-14 07:44:26.718', 317);
INSERT INTO public.part VALUES (318, 1, '2020-12-02 22:04:26.58767', '2020-12-02 22:04:26.58767', 'Nachtigall', 'Eine Übung zum Warmmachen, Einsingen und Rhythmus halten. Die Spieler werden in zwei gleich große Gruppen eingeteilt. Beide Gruppen singen als Chor jeweils das gleiche Lied bloß mit Unterschieden beim Singen des "Hey!" am Ende jeder Zeile.

Beide Gruppen beginnen gleichzeitig zu singen. Gruppe 1 startet mit (von 1x Hey! bis hoch zu 5x Hey!):

*   "Auf einem Baum in Kalifornien, da sitzt ne kleine Nachtigall und die singt La La La, Hey!".
*   "Auf einem Baum in Kalifornien, da sitzt ne kleine Nachtigall und die singt La La La, Hey! Hey!".
*   "Auf einem Baum in Kalifornien, da sitzt ne kleine Nachtigall und die singt La La La, Hey! Hey! Hey!".
*   "Auf einem Baum in Kalifornien, da sitzt ne kleine Nachtigall und die singt La La La, Hey! Hey! Hey! Hey!".
*   "Auf einem Baum in Kalifornien, da sitzt ne kleine Nachtigall und die singt La La La, Hey! Hey! Hey! Hey! Hey!".

Gruppe 2 startet erst mit 5x Hey und geht dann runter auf 1x Hey, mit:

*   "Auf einem Baum in Kalifornien, da sitzt ne kleine Nachtigall und die singt La La La, Hey! Hey! Hey! Hey! Hey!".
*   "Auf einem Baum in Kalifornien, da sitzt ne kleine Nachtigall und die singt La La La, Hey! Hey! Hey! Hey!".
*   "Auf einem Baum in Kalifornien, da sitzt ne kleine Nachtigall und die singt La La La, Hey! Hey! Hey!".
*   "Auf einem Baum in Kalifornien, da sitzt ne kleine Nachtigall und die singt La La La, Hey! Hey!".
*   "Auf einem Baum in Kalifornien, da sitzt ne kleine Nachtigall und die singt La La La, Hey!".

Im letzten Durchgang sollten beide Gruppen zusammen auf dem letzten "Hey!" synchron gemeinsam enden.', 'https://improwiki.com/de/wiki/improtheater/nachtigall', '2020-11-14 07:44:26.765', 318);
INSERT INTO public.part VALUES (319, 1, '2020-12-02 22:04:26.733306', '2020-12-02 22:04:26.733306', 'Gesangskreis', '**Gesangskreis AABB:**  
Es gibt Musikbegleitung vom Musiker.  
Einer singt eine Zeile, der nächste im Kreis reimt singend auf diese Zeile, der Dritte fängt einen neuen Reim an zu singen und der Vierte reimt singend auf die dritte Zeile, die Strophe ist damit beendet. Beim Nächsten im Kreis fängt ein neues Lied zu einem neuen Thema an.  
  
**Gesangskreis ABAB:**  
Wie beim Gesangskreis AABB, nur dass der Dritte auf den Ersten reimt und der Vierte auf den Zweiten.  
  
**Gesangskreis ABCB:**  
Wie beim Gesangskreis AABB, allerdings muss sich nur die vierte Zeile auf die Zweite reimen.  

siehe auch Reimen', 'https://improwiki.com/de/wiki/improtheater/gesangskreis', '2020-11-14 07:44:26.791', 319);
INSERT INTO public.part VALUES (320, 1, '2020-12-02 22:04:26.856996', '2020-12-02 22:04:26.856996', 'Roboter', 'Spieler gehen paarweise zusammen. Spieler A formt aus Spieler B eine Statue und schaltet diese dann per Knopfdruck an. B ist dann ein Roboter, der eine bestimmte Arbeit ausführt die er aus dem Gefühl der Statue heraus assoziert. Der Roboter entscheidet, welche Art von Arbeit dies ist z.B. Staubsaugen. Spieler A nimmt das Angebot des Roboters an und nutzt ihn für diese Art von Arbeit. Schaltet ihn anschließend wieder aus und die Spieler tauschen ihre Rollen.', 'https://improwiki.com/de/wiki/improtheater/roboter', '2020-11-14 07:44:26.853', 320);
INSERT INTO public.part VALUES (321, 1, '2020-12-02 22:04:27.007361', '2020-12-02 22:04:27.007361', 'Handflächen berühren', 'An dieser Übung sind zwei Spieler beteiligt. Einer geht voraus, der andere folgt. Immer wieder bleibt der Vorausgehende stehen (der ihm Folgende dann natürlich auch) und nimmt eine feste Position ein, in der er eine seiner Handflächen in beliebiger (aber erreichbarer) Position und Höhe platziert. Gleichzeitig benennt er irgendein konkretes äußeres Körperbestandteil des Anderen, wie z.B. linke Augenbraue, Schultern (ggf. mit beiden Handflächen), Nasenspitze, rechter Vorderfuß usw., mit dem dieser die präsentierte Handfläche berühren soll. Wenn das geschehen ist, was durchaus mit gewissen Verrenkungen und Anstrengungen verbunden sein kann, gehen beide wieder kurze Zeit hintereinander. Dann geht es von vorne los, aber mit einer anderen Handhaltung und -höhe und einem anderen Körperbestandteil, usw.', 'https://improwiki.com/de/wiki/improtheater/handflaechen_beruehren', '2020-11-14 07:44:26.852', 321);
INSERT INTO public.part VALUES (322, 1, '2020-12-02 22:04:27.136885', '2020-12-02 22:04:27.136885', 'Raubkatzen-Nadel', 'Die Übung ist sehr einfach, aber hervorragend geeignet, um Complicité zu üben und sich aufeinander einzuschwingen.

Die Mitte des Raumes wird durch einen Gegenstand (ein Tuch, ein Stuhl,...) gekennzeichnet. Zwei SpielerInnen stehen sich gegenüber und bewegen sich jeweils spiegelverkehrt zueinander. Wie Raubkatzen oder Boxer, die sich gegenseitig sondieren, schleichen Sie umeinander, jeweils mit dem gleichen Abstand zur Mitte. Dabei können sie sich auch näher kommen, wieder entfernen, die Richtung und/oder Geschwindigkeit ändern, sich jagen, umarmen... Der Raum ist quasi mittig auf einer Nadel gelagert und die Personen müssen versuchen, ihn im Gleichgewicht zu lassen. Wer jeweils führt, wird nicht abgesprochen.

Ziel ist dabei nicht, schneller als der/die andere zu sein, sondern - im Gegenteil - zu spüren (und spüren zu lassen), wann der/die andere die Richtung wechselt.', 'https://improwiki.com/de/wiki/improtheater/raubkatzen-nadel', '2020-11-14 07:44:26.896', 322);
INSERT INTO public.part VALUES (323, 1, '2020-12-02 22:04:27.27164', '2020-12-02 22:04:27.27164', 'Spiegelübungen', 'Es bilden sich jeweils Paare, die sich gegenüberstehen. Einer der beiden macht langsame Bewegungen, die der andere (wie ein Spiegel) nachmacht. Der erste Spieler ist also die Person vor dem Spiegel, der ander Spieler ist der Spiegel. Nach einer gewissen Zeit wird gewechselt. Später kann man versuchen diese klaren Rollen aufzuheben. Jeder ist Spiegel und jeder ist vor dem Spiegel. Nutzt dabei den ganzen Raum. Nutzt dabei auch alle Ebenen: Sitzen, Stehen, Liegen.

## Inhaltsverzeichnis

*   Variante
*   Variante 2

*   Gegenspiegel
*   Spiegelgeschichte

#### Variante

Die Spieler können auch Kontakt aufnehmen, d.h. der Spiegel wird berührt. So können die Spieler zum Beispiel die Handflächen aneinander legen. Sie können sich aber auch sonstwo berühren.

#### Variante 2

Ein dritter Spieler ruft dem Spiegelbild Wörter zu, worauf dieser assoziieren muss, ohne dabei die Aufgabe des Spiegelbilds zu vergessen. Siehe "Multitasking".

## Gegenspiegel

Versucht genau das Gegenteil von dem zu tun was Ihr im Spiegel seht. Steht der eine, setzt sich der andere vielleicht hin. Putzt sich der eine die Zähne, isst der andere vielleicht einen Apfel. Das Gegenteil einer Aktion kann sehr unterschiedlich interpretiert werden.

## Spiegelgeschichte

Nutz bei dieser Spiegelübung den ganzen Raum. Bewegt Euch hindurch und vielleicht entsteht dabei eine kleine Geschichte. Hier sollten wieder beide Spieler gleichzeitig Spiegel und Gespiegelter sein.', 'https://improwiki.com/de/wiki/improtheater/spiegeluebungen', '2020-11-14 07:44:27.019', 323);
INSERT INTO public.part VALUES (324, 1, '2020-12-02 22:04:27.381647', '2020-12-02 22:04:27.381647', 'Führungsübungen', 'Dies sind verschiedene Paarübungen, bei denen ein Spieler die Augen schließt und vom anderen auf verschiedene Weisen durch den Raum geführt wird. Ziel ist es dabei, dem sehenden Partner voll zu vertrauen und mit geschlossenen Augen ein Gefühl für den Raum um sich herum zu bekommen. Außerdem wird hier (körperlich) das Impro-Prinzip "Führen und Folgen" geübt.

In allen Varianten sollten nach einigen Minuten die Partner die Rollen tauschen. Anschließend unterhalten sich die Leute (zu zweit und/oder im Kreis) über ihre Erfahrungen.

Tipp: es kann zur Partnerfindung nützlich sein, die Spieler anzuweisen, dass sich etwa gleichgroße zusammenfinden sollen (in manchen Varianten, z.B. "Laut geben", ist das aber egal).

## Inhaltsverzeichnis

*   Führen am Finger
*   Roboter
*   Laut geben
*   Geführte Kamera
*   Führungshand
*   Stockübung
*   Pilot

## Führen am Finger

Die Teilnehmer bilden Paare. Sie stellen sich gegenüber und berühren sich mit den Fingerspitzen des Zeigefingers der linken oder rechten Hand. Die Finger sollten sich möglichst nur ganz leicht berühren. Einer der beiden schließt die Augen und lässt sich von dem anderen durch den Raum führen.

## Roboter

Die Teilnehmer bilden Paare. Einer von beiden schließt die Augen und wird zu einem Roboter, der vom anderen durch den Raum gelenkt wird. Die Lenkung funktioniert so:

*   Antippen an der Wirbelsäule zwischen den Schultern: vorwärts
*   Antippen an der linken/rechten Schulter: drehen
*   Hand oben auf den Kopf legen: Notbremse!

## Laut geben

Die Teilnehmer bilden Paare. Einer von den beiden schließt die Augen. Der Andere gibt nun in kurzen Abständen immer wieder einen kurzen, gleichartigen Laut von sich, zum Beispiel "pip pip pip" oder "toc toc toc". Er bewegt sich dabei durch den Raum, geht vielleicht auch einmal in die Hocke oder dreht eine scharfe Kurve. Der andere muss versuchen, ihm aufgrund der Laute zu folgen. Der Führende muss natürlich darauf achten, dass es keine Zusammenstöße mit den Anderen oder mit Gegenständen gibt. Es wird vereinbart, dass der Blinde sich nur dann bewegen darf, solange er das Geräusch hört, und sofort stehenbleibt, sobald es verstummt.

## Geführte Kamera

Die Teilnehmer bilden Paare. Einer von den beiden schließt die Augen. Der Andere führt in durch den Raum und richtet seinen Kopf wie eine Kamera auf einen Gegenstand aus. Dann drückt er ihn leicht auf den Kopf (wie den Auslöser einer Kamera). Daraufhin öffnet der ''blinde'' Spieler für wenige Sekunden die Augen und nimmt das Bild auf, welches er sieht. Dann schließt er wieder seine Augen und wird zum nächsten Objekt geführt.

Man kann diese Übung auch gut mit "Roboter" verbinden, der Geführte wird dann zu einem "Fotografier-Roboter".

## Führungshand

Die Teilnehmer bilden Paare. In jedem Paar führt ein Spieler (A) und der andere (B) folgt. B schließt bei dieser Variante _nicht_ die Augen. A hält seine Handfläche ca. 20 cm vor B''s Gesicht. B folgt nun mit seinem Kopf und seinem ganzen Körper jeder Bewegung der Hand, so dass der Abstand zwischen der Hand und seinem Gesicht immer konstant bleibt. A kann dadurch B beliebig lenken (rauf und runter, vorwärts, rückwärts, drehend, neigend usw.) und B folgt völlig willenlos, wie eine Puppe, der Hand.

Man kann oft die Beobachtung machen, dass die Spieler bei dieser Übung sehr schöne, anmutige Bewegungen ausführen - die sie sonst vielleicht nie in dieser Art gemacht hätten.

## Stockübung

An dieser Übung sind 2 Spieler beteiligt. Außerdem ist ein Besenstiel erforderlich. An jedem Ende des Stocks steht ein Spieler und drückt mit dem Handteller der flachen, dem jeweils anderen Spieler zugewandten Hand gegen den zunächst in etwa waagerechten Stock. Dieser darf nicht (nie) gefasst/gegriffen werden. Eine dauerhafte Verbindung zwischen beiden Spielern - ohne dass der Stock herunterfällt - besteht also nur, wenn beide einen hinreichenden Druck auf den Stock ausüben. Einer der beiden ist der Führende, er geht, bewegt sich und schiebt dabei den Stock. Er darf dabei auch Verrenkungen machen, stehenbleiben, auch alle ihm möglichen Höhen zwischen Boden und Decke nutzen usw. Der andere, der "Getriebene", muss permanent reagieren, d.h. in jeder Situation Gegendruck ausüben, indem er die Bewegungen ausgleicht bzw. mitmacht, denn die Aufgabe ist, trotz der permanenten Bewegungen den Stock nicht herunterfallen zu lassen.

## Pilot

Einem Spieler werden die Augen verbunden, und der Raum ist voller Hindernisse (stellen Sie ein paar Stühle auf). Die Idee ist, dass der Rest der Gruppe den Spieler mit verbundenen Augen mittels Anweisungen durch den Raum führt. Eine Mögliche Interpretation dieser Übung ist die eines Piloten in einem Flugzeug, daher ist diese Übung auch unter dem Namen "Pilot" bekannt. Der blinde Spieler ist ein "Flugzeug", das sich im Nebel verirrt, den die "Fluglotsen" von ihrem "Tower" aus nun heruntersteuern. Die anderen Spieler können z.B. auch auf einem Stuhl stehen, um eine bessere Übersicht zu haben. Das Flugzeug hat auch nur noch wenig Treibstoff und muss sich daher beeilen zum Ziel zu kommen (der Tower). Das Flugzeug darf sich nur nach vorn bewegen, kann aber natürlich auch noch links und rechts fliegen. Die Fluglotsen müssen darauf achten, die Anweisungen aus der Sicht des Piloten zu geben.

Tipps und Hinweise:

*   Zunächst langsam anfangen.
*   Es geht um das Zusammenwirken, nicht um "austricksen".
*   Wenn ein bisschen Übung da ist, kann zwischen Führen und Geführtwerden immer wieder spontan gewechselt werden.', 'https://improwiki.com/de/vertrauensuebungen/sich-fuehren-lassen', '2020-11-14 07:44:27.035', 324);
INSERT INTO public.part VALUES (325, 1, '2020-12-02 22:04:27.519356', '2020-12-02 22:04:27.519356', 'Vorgehen - Nachgehen', 'Ein Spieler geht durch den Raum und installiert dabei verschiedene Hindernisse. Er zeigt pantomimisch was es für Hindernisse sind (ein Dornenbusch, eine Schlucht) und auch wie er diese Hindernisse überwindet. Danach folgen ihm die anderen Spieler. Jeder Spieler muß nun versuchen die vorher installierten Hindernisse auf eine neue Art und Weise zu überwinden.

vergleiche auch Follow the King', 'https://improwiki.com/de/wiki/improtheater/vorgehen_-_nachgehen', '2020-11-14 07:44:26.98', 325);
INSERT INTO public.part VALUES (333, 1, '2020-12-02 22:04:28.843979', '2020-12-02 22:04:28.843979', 'Rauminstallation', 'Es werden Paare gebildet. Der erste Spieler bereitet in der Küche eine Party oder ein Essen vor. Dazu etabliert er einen Raum, installiert pantomimisch Tisch, Stühle, Schränke, Waschbecken, Teller, Tassen, alles was man in der Küche so vorfindet. Der zweite beobachtet alles genau und kommt nach einer Weile zu Gast. Beide unterhalten sich nun und achten gegenseitig darauf, dass der andere nicht durch Tische läuft und den Raum so benutzt, wie er installiert wurde.

Später werden die Rollen getauscht.', 'https://improwiki.com/de/wiki/improtheater/rauminstallation', '2020-11-14 07:44:27.241', 333);
INSERT INTO public.part VALUES (326, 1, '2020-12-02 22:04:27.800498', '2020-12-02 22:04:27.800498', 'Gegenstand pantomimisch umdefinieren', 'Bei dieser Übung geht es darum, einen realen Gegenstand (zum Beispiel einen Schuh, einen Ball oder einen Hut) umzudefinieren, so dass möglichst schnell erkennbar wird, was der Gegenstand für eine neue Bedeutung hat. Das Ganze nur pantomimisch, ohne Worte ("Geräusche" sind erlaubt). Zum Beispiel kann sich der Spieler den Schuh ans Ohr halten und so tun, als wäre es sein Handy. Oder er wiegt ihn im Arm, als wäre er sein Baby.

**Ablauf:** 1, 2 oder 3 Spieler machen die Übung, die anderen schauen zu. Die Spieler stellen sich nebeneinander und schließen die Augen. Der Spielleiter holt einen Gegenstand (z.B. aus einem mitgebrachten Sack, so dass die Spieler ihn nicht vorher sehen) und gibt ihn einem der Spieler in die Hand. Die Spieler öffnen die Augen und es geht los. Sowie das Publikum erkennt, was der Gegenstand neu darstellen soll, ruft es dieses hinaus, und der Gegenstand wird dem nächsten Spieler gegeben, der etwas anderes aus ihm macht. Die Übung kann auf Zeit gespielt werden (wieviele verschiedene Dinge schafft der Spieler / das Team in 60 Sekunden?). Wiederholungen und "zu ähnliche" Gegenstände sind verboten und zählen nicht. Mit mehreren Spielern ist die "Pantomime-Staffel" einfacher, weil jeder Spieler zwischendurch kleine Pausen bekommt.

**Variante:** Das Publikum ist still, der Spielleiter ruft einfach "Punkt", wenn der Gegenstand für ihn erkennbar ist. Ein anderer stoppt die Zeit.

**Anmerkung:** im Prinzip kann man aus jedem beliebigen Gegenstand ein "Baby" oder ein "Handy" machen. Fortgeschrittene Spieler sollten sich daher bemühen, sich von der Form des konkreten Gegenstands inspirieren zu lassen und lieber etwas Ungewöhnliches zu machen, als auf bekannte "Standards" zurückzugreifen.

', 'https://improwiki.com/de/wiki/improtheater/gegenstand_pantomimisch_umdefinieren', '2020-11-14 07:44:27.089', 326);
INSERT INTO public.part VALUES (327, 1, '2020-12-02 22:04:27.922993', '2020-12-02 22:04:27.922993', 'Raum einrichten (Übung)', 'Ein bestimmter Raum wird zunehmend detaillierter festgelegt. Das geschieht wie folgt:  
Der Erste geht durch eine imaginäre, pantomimisch dargestellte Tür und beginnt pantomimisch ein Objekt zu bespielen, z.B. eine Kaffeemaschine, indem er sich einen Kaffee macht. Danach geht er durch die Tür ab. Der Zweite macht das Gleiche wie die vorherige Person und zusätzlich eine weitere Pantomime, die ein zweites Raumobjekt veranschaulicht. Geht ab. Der Dritte benutzt die zwei Gegenstände wie die ersten beiden und fügt pantomimisch einen dritten Gegenstand dazu usw.

Varianten:

*   Die Gegenstände der Vorgänger müssen zwar benutzt bzw. bespielt werden, aber in beliebiger Reihenfolge.
*   Es werden alle Gegenstände der Vorgänger bespielt, aber nicht unbedingt mit der gleichen Handlung.

', 'https://improwiki.com/de/wiki/improtheater/raum_einrichten_ubung', '2020-11-14 07:44:27.077', 327);
INSERT INTO public.part VALUES (328, 1, '2020-12-02 22:04:28.046721', '2020-12-02 22:04:28.046721', 'Danke', 'Spieler A tritt auf die Bühne und nimmt eine beliebige Haltung (Körperstellung) ein. Spieler B kommt hinzu und nimmt eine Haltung ein, die die Haltung von A erläutert. Spieler A bedankt sich, daß seiner Haltung ein Sinn gegeben wurde und tritt ab. Spieler B verbleibt in seiner Haltung.

Nun tritt Spieler C auf die Bühne und gibt wiederum eine ergänzende Haltung für die Haltung von B, usw...

siehe auch Ich bin ein Baum', 'https://improwiki.com/de/wiki/improtheater/danke', '2020-11-14 07:44:27.113', 328);
INSERT INTO public.part VALUES (329, 1, '2020-12-02 22:04:28.167134', '2020-12-02 22:04:28.167134', 'Größer machen', 'Diese Übung ist hilfreich für Spieler, die zu sprachlastig sind. Ein Spieler beginnt eine Szene. Sobald der Trainer klatscht, muss der Spieler genau die Handlung, die er beim Klatschen gerade machte, weitermachen und darf nicht in der Handlung voranschreiten. Wenn er also beispielsweise gerade einen Aktenkoffer öffnete, darf er nur "einen Aktenkoffer öffnen" spielen. Er kann und soll das Öffnen größer machen, spektakulärer – aber er darf nicht in der Handlung voranschreiten, ihm ist also zum Beispiel nicht erlaubt, etwas aus dem Aktenkoffer herauszunehmen.

Variante: Bei einem zweiten Klatschen darf der Spieler die Handlung wieder vorantreiben.

Siehe auch: Routinehandlungen interessanter machen', 'https://improwiki.com/de/wiki/improtheater/groesser_machen', '2020-11-14 07:44:27.147', 329);
INSERT INTO public.part VALUES (330, 1, '2020-12-02 22:04:28.308533', '2020-12-02 22:04:28.308533', 'Namensdialog', 'Bei dieser Übung lassen sich die zwei Spieler jeweils einen Namen geben. In der nun zu spielenden Szene darf jeder immer nur den Namen des Anderen sagen, weitere Wort sind nicht erlaubt. Die Spieler sind also gezwungen, Ausdruck, Gefühl und Bewegung (Pantomime) zu zeigen. Die Namen dürfen natürlich in wechselnder Lautstärke, Intonation, Geschwindigkeit, Emotion usw. ausgesprochen werden. Wichtig: Es ist kein Gromolo\-Ersatz! Das heißt,der jeweilige Name soll nicht jeweils mehrmals/vielfach schnell hintereinander ausgesprochen werden.', 'https://improwiki.com/de/wiki/improtheater/namensdialog', '2020-11-14 07:44:27.166', 330);
INSERT INTO public.part VALUES (331, 1, '2020-12-02 22:04:28.57946', '2020-12-02 22:04:28.57946', 'Gestenkette', 'Die Spieler stehen locker im weiten Kreis, so dass es ihnen möglich ist, auch ausladende Bewegungen und Gesten zu machen. In der Startrunde macht jeder eine übertrieben ausgeprägt dargestellte haushaltstypische Bewegung. Das kann z.B. Staub saugen sein oder Wäsche aufhängen. Diese Bewegung bleibt der betreffenden Person zugeordnet. Haben alle nacheinander eine Bewegung gemacht, startet nun der Hauptteil der Übung. Der Starter macht seine ihm zugeordnete Bewegung und eine beliebige von einem der anderen. Danach kommt die Person dran, die der Starter mit seiner soeben gemachten zweiten Bewegung definiert hat. Auch diese Person beginnt zunächst mit der ihr zugeordneten Bewegung und macht danach wiederum eine fremde einer der anderen Personen im Kreis. Diese ihre zweite Bewegung definiert wiederum den Nachfolgenden usw.

## Tipps und Hinweise:

*   Wichtig ist, dass die Bewegungen immer übertrieben, ausgeprägt und engagiert gemacht werden.
*   Die Wechsel müssen schnell und zackig gehen.
*   Wer etwas falsch macht (z.B. sich nicht mehr an Bewegungen - eigene oder fremde - erinnert), kann "bestraft" werden, z.B. indem er Tod in einer Minute spielen muss.', 'https://improwiki.com/de/wiki/improtheater/gestenkette', '2020-11-14 07:44:27.209', 331);
INSERT INTO public.part VALUES (332, 1, '2020-12-02 22:04:28.720308', '2020-12-02 22:04:28.720308', 'Pantomime mit Handzeichengeben', 'Ein Spieler improvisiert irgendwelche Pantomime (ohne Thema, ohne Vorgabe). Hinter ihm steht eine Formation von 4 bis 5 anderen Spielern in einer Reihe, die ihn kopieren.

Die restlichen Spieler bilden das Publikum und heben immer langsam(!) die Hand, wenn ihnen langweilig ist. Dadurch erhält der Spieler ein Feedback, welches ihm anzeigt, wann er das Publikum in Spannung hält. Immer, wenn ihm droht, die Spannung zu verlieren (mehrere Hände erheben sich langsam), muss er sich schnell etwas einfallen lassen, um sie wiederzugewinnen.

Hierbei kann Hektik entstehen - der Spieler kann aber auch erfahren, dass man mit Ruhe und _Präsenz_, zum Beispiel bloß mit einem interessanten Gesichtsausdruck, genauso gut oder noch besser das Publikum in Spannung und Aufmerksamkeit halten kann.

Hinweis: das mit den Handzeichen ist etwas hart (nichts für Anfänger), aber hilfreich. Die noch brutalere Variante (nur für Hartgesottene!) ist, dass die "Zuschauer" aufstehen und den Raum verlassen, wenn ihnen langweilig ist.

Die Spieler, die hinter dem Vormacher stehen und ihn kopieren, helfen vor allem psychologisch, "ihm den Rücken zu stärken", so dass dieser bei dieser Übung nicht ganz alleine auf der Bühne stehen muss. Außerdem sorgen sie durch ihre Kopier-Aufgabe für zusätzliche Unterhaltung des Publikums.', 'https://improwiki.com/de/wiki/improtheater/pantomime_mit_handzeichengeben', '2020-11-14 07:44:27.21', 332);
INSERT INTO public.part VALUES (335, 1, '2020-12-02 22:04:29.109419', '2020-12-02 22:04:29.109419', 'Was ist ein Was?', 'Ein Aufwärmspiel, in dem schnell gereimt wird.

Alle Spieler stellen sich im Kreis auf und schnipsen langsam einen Rhythmus mit den Fingern. Spieler A beginnt dann mit einem Satz in der Form: "Was ist ein was, ohne ein was?", also z.B.:

*   "Was ist ein Kind ohne die **Mutter**?"

Der nächste Spieler B im Kreis versucht nun einen ebenso aufgebauten Satz darauf zu reimen, also z.B.:

*   "Was ist ein Brot ohne die **Butter**?"

Dann ist der nächste Spieler an der Reihe und versucht wieder einen Satz auf "Butter" zu reimen. Es wird so lange gereimt, bis einem Spieler nichts mehr einfällt, er einen Fehler macht, oder er aus dem Fingerschnips Rhythmus kommt. Dann ruft die ganze Gruppe:

*   "**Oooohh. Was ist ein Was ist ein Was ist ein Was?**".

Der nächste Spieler im Kreis beginnt nun mit einem neuen Satz, der ebenfalls wieder in der Form aufgebaut ist, also z.B.: "Was ist die Wirtschaft ohne **Boom**?" - "Was ist Berühmtheit ohne **Ruhm**?" usw.

### Hinweise

*   Sätze möglichst einfach halten, so dass auf die Worte am Ende auch gereimt werden kann (Reime möglich sind).
*   Auf einige Wörter am Ende gibt es wenige oder manchmal auch fast gar keine Reime, dann zum Beispiel mit Halbreimen oder ähnlichen Reimen arbeiten, oder neu beginnen.
*   Sätze und Reime müssen nicht unbedingt alle einen Sinn ergeben, es geht bei der Übung in erster Linie auch ums schnelle Reagieren und den Gruppenrhythmus.
*   Die Sätze können in einer erweiterten Version auch als Vorgaben dazu genutzt werden, daraus kleine Szenen anzuspielen.', 'https://improwiki.com/de/wiki/improtheater/was_ist_ein_was', '2020-11-14 07:44:27.365', 335);
INSERT INTO public.part VALUES (336, 1, '2020-12-02 22:04:29.253002', '2020-12-02 22:04:29.253002', 'Reimkreis', 'Einer im Kreis sagt ein Wort, zeigt auf einen anderen, welcher ein Wort sagt, dass sich auf das Erste reimt, usw. Fällt einem kein Reim ein, sagt er ein anderes Wort und der Nächste reimt auf dieses, usw.', 'https://improwiki.com/de/wiki/improtheater/reimkreis', '2020-11-14 07:44:27.306', 336);
INSERT INTO public.part VALUES (337, 1, '2020-12-02 22:04:29.396955', '2020-12-02 22:04:29.396955', 'Bauernregel', 'Ein Spiel, um Reimen und Rhythmus in der Gruppe zu üben.

Alle Spieler stellen sich im Kreis auf. Nun wird im Kreis im Uhrzeigersinn herum Wort für Wort (jeder Spieler nur ein Wort) eine Bauernregel aufgesagt, nach dem (Reim-) Schema der bekannten Bauernregeln.

Beispiel:

*   "Wenn die Bäume zweimal blühen, wird sich Winter bis Mai hinziehen."

Diese Übung kann aufgrund der Reime und des Rhythmus schwierig werden, deshalb wenn man sich verhaspelt, hier einfach nach dem "Scheiter heiter!"-Prinzip von vorne beginnen. Die Reime müssen nicht unbedingt alle Sinn machen. Der Spass und das gleichmässige Fliessen der Wörter stehen hier zunächst im Vordergrund. Trotzdem bietet es sich an ein wenig in Reimen vorauszudenken und es besonders dem Nebenmann mit den Wörtern nicht allzu schwer zu machen.

### Variationen

*   Statt Wort für Wort können die Spieler auch nur Silbe für Silbe sprechen, also "Wenn(1)-die(2)-Bäu(3)-me(4)-zwei(5)-mal(6)-blü(7)-hen(8)..."', 'https://improwiki.com/de/wiki/improtheater/bauernregel', '2020-11-14 07:44:27.381', 337);
INSERT INTO public.part VALUES (338, 1, '2020-12-02 22:04:29.532775', '2020-12-02 22:04:29.532775', 'Zug um Zug', 'Auf dem Boden werden 9 Zettel in 3 x 3 Reihen in gleichem Abstand verteilt. Zwei Spieler stellen sich auf jeweils einen der Zettel. Grundsatz: Es darf erst geredet werden, NACHDEM man sich zu einem anderen Zettel bewegt und auf diesen gestellt hat. Es darf sich nur in einer gerade Linie zwischen zwei Zetteln bewegt werden, wobei es nicht einer der benachbarten Zettel sein muss. Man darf also z.B. von dem Zettel hinten rechts zu jedem der Zettel in der vorderen Reihe gehen.  

1\. Übung: Die Spieler bewegen sich und agieren danach ohne Sprechen: Gefühl, Ausdruck, Gesten

2\. Übung: Die Spieler sagen jeweils nach dem Platzwechsel einen Satz in Gromolo. Auch hier geht es um Ausdruck und Gefühl.

3\. Übung: Die Spieler sagen EINEN Satz auf Deutsch nach dem Platzwechsel. Auch hier geht es wiederum um Ausdruck und Gefühl.

Mit diesem Spiel trainiert man neben Ausdruck von Emotionen auch Präsenz, das Hervorrufen von Spannung und das Prinzip von Aktion und Reaktion. Man erfährt, dass es nicht unbedingt auf viel Reden ankommen. Außerdem wird die Ausnutzung des vorhandenen Raumes geübt.

Varianten:

*   Das Spiel ist natürlich auch mit 4 x 4 = 16 Zetteln/Feldern möglich.
*   Jede Übung endet nach 3 Aktionen/Wechseln je Spieler.

_Siehe auch_ Aktion und Reaktion', 'https://improwiki.com/de/wiki/improtheater/zug_um_zug', '2020-11-14 07:44:27.478', 338);
INSERT INTO public.part VALUES (339, 1, '2020-12-02 22:04:29.658182', '2020-12-02 22:04:29.658182', 'Raumlauf', 'Unter dem Begriff **Raumlauf** werden Aufwärmspiele zusammengefasst, die gemeinsam haben, dass die Spieler dabei im Raum (bzw. auf der Bühne) herumgehen. Manche Raumlauf-Varianten sind sehr ruhig und entspannt, andere dagegen können auch mal ganz schön turbulent werden.

Sie eignen sich gut als Opener für den Beginn eines Impro-Übungstreffs oder -Workshops.

## Inhaltsverzeichnis

*   Grundübung
*   Ankommen
*   Zusatzregeln
*   Vorstellungs-Vorgaben
*   Lustig und Ernst
*   Atome und Moleküle
*   Gehen, Stehen, Laufen, Umfallen, Folgen
*   Gangart
*   Feind und Beschützer
*   Rollen und Tausch
*   Sonstige Raumlauf-Varianten

## Grundübung

Die Spieler gehen entweder kreuz und quer oder in einer Richtung nahe den Wänden durch den Raum und achten dabei auf folgendes:

*   ihre Atmung
*   ihre Entspannung
*   ihren Blick, ihre Haltung und Gangart
*   den Raum möglichst gut auszufüllen (wie Luftmoleküle)
*   alle etwa das gleiche Tempo zu haben
*   den Boden bewusst zu spüren (geht am besten ohne Schuhe)
*   die anderen anzuschauen und bewusst wahrzunehmen
*   zu lächeln :-)

## Ankommen

Raumlauf wie oben. Der Spielleiter sagt zwischendurch: "Wer angekommen ist, soll die Hand heben (Variante: und/oder stehenbleiben)".

"Angekommen sein" heißt, den Alltag und die Gedanken, die einen vom Tag her noch immer beschäftigen, loszulassen, und nun wirklich auch geistig anwesend und bereit für die kommenden Übungen zu sein.

## Zusatzregeln

Raumlauf wie oben. Der Spielleiter gibt etwa jede halbe Minute eine neue Anweisung vor:

*   die oben unter "Grundübung" genannten Punkte, dann:
*   viele Richtungswechsel machen (auch abrupte)
*   Tempo ändern (langsam, normal, schnell)
*   nur noch in einem vom Spielleiter immer enger eingegrenzten Raum bewegen
*   anhalten dürfen
*   gleichmäßige Verteilung im Raum, es dürfen keine Lücken entstehen (Bild: Man befindet sich auf einer Eisscholle und muss beachten, dass diese kippt, wenn das Gewicht nicht gleichmäßig verteilt ist).
*   andere behindern und ihnen den Weg versperren können
*   "herumalbern" dürfen

Wichtig: Es soll darauf geachtet werden, dass die bisherigen Regeln weiter gelten und befolgt werden!

## Vorstellungs-Vorgaben

Raumlauf wie oben. Der Spielleiter gibt nun Vorgaben, wie die Spieler gehen sollen:

*   über glühendheißen Sand
*   wie auf weichem, kühlen Moos
*   durch hohes Gras
*   wie Zwerge in einem riesigen Wald
*   durch seichtes Wasser
*   durch einen Sumpf
*   auf einem Trampolin hüpfend
*   die Schwerkraft nimmt immer mehr zu
*   die Schwerkraft nimmt immer mehr ab (wie auf dem Mond)
*   in Zeitlupe
*   wie Marionetten
*   wie in der Lotterie gewonnen
*   schüchtern und ängstlich
*   einen schweren Koffer tragen
*   usw.

## Lustig und Ernst

Raumlauf wie oben. Nun wird die Gruppe in zwei Hälften geteilt, die eine bekommt die Vorgabe "lustig sein", die andere die Vorgabe "ernst sein". Nun gehen die Gruppen durcheinander durch den Raum und versuchen sich gegenseitig (ohne Berühren!) mit ihrer lustigen/ernsten Stimmung anzustecken, gleichzeitig sich durch nichts von ihrer Stimmung abbringen zu lassen. (Tipp: Hilfreich ist die Vorstellung, dass die Lustigen gerade vom Ernst der anderen immer lustiger werden, und die Ernsten von der Albernheit der Lustigen immer ernster.)

Nach einer Weile ruft der Spielleiter "Switch" und die Gruppen wechseln die Stimmung.

Die Übung kann natürlich auch mit anderen Gefühls-Gegensatzpaaren gemacht werden.

## Atome und Moleküle

Raumlauf wie oben, die Spieler sind "Atome". Der Spielleiter sagt Zahlen an; worauf sich sofort eine entsprechende Zahl Spieler zu einem "Molekül" zusammenfinden. Wer übrig bleibt, scheidet bei dieser Aufwärmübung _nicht_ aus. Siehe Moleküle bilden.

## Gehen, Stehen, Laufen, Umfallen, Folgen

Raumlauf wie oben. Auf ein Signal des Spielleiters bekommt jeder Spieler die Wahl aus folgenden Möglichkeiten:

*   Gehen (wie bisher)
*   Stehen
*   Laufen (schneller)
*   Umfallen
*   einem anderen Spieler zu folgen

## Gangart

Alle laufen durch den Raum, bis einer eine bestimmte Gangart etabliert. Das kann auch Springen, Hüpfen rückwärts, auf einem Bein hüpfen, auf allen Vieren krabbeln sein. Es gibt unendlich viele Möglichkeiten. Alle anderen gehen dann auch in dieser Gangart, bis ein anderer eine neue anbringt. Ist die Wahrnehmung gut, stockt das Ganze nie und es gibt nicht gleichzeitig zwei Gangarten.

## Feind und Beschützer

Raumlauf wie oben. Jeder Spieler sucht sich nun gedanklich einen anderen aus (der Raumlauf geht die ganze Zeit weiter). Der andere ist nun sein "Feind". Nun sucht sich jeder Spieler noch einen anderen aus. Dieser ist nun sein "Beschützer". Dann versucht jeder Spieler, so zu gehen, dass sein Beschützer immer zwischen ihm und seinem Feind ist.

Anmerkung: Das wird in der Praxis nie bei allen gehen, folglich entsteht sofort ein komplexes und interessantes (weil gegenseitig abhängiges) Fluchtmuster, bei dem die Spieler schließlich in irgendwelchen Ecken landen...

Siehe auch Sympathie - Antipathie.

## Rollen und Tausch

Raumlauf wie oben. Nun wählt jeder Spieler für sich eine Figur, die er typisch in Haltung und Gangart wiedergibt (z.B. Großmutter, König, Clown, Hexe, feine Dame, Gangster, Cowboy, etc.). Nun begegnen sich die Spieler paarweise und vertauschen ihre Figuren. Es wird nun wieder gegangen, jeder fühlt sich in die neue Rolle hinein und kostet sie aus. Nach einer Weile wieder Begegnung und Rollentausch usw.

## Sonstige Raumlauf-Varianten

*   Au ja
*   Bilder bauen
*   Begrüßung
*   Dinge anders benennen
*   Fangenspiele
*   Feuer - Wasser - Wind
*   Follow the King
*   Gehen und Stehen', 'https://improwiki.com/de/wiki/improtheater/raumlauf', '2020-11-14 07:44:27.727', 339);
INSERT INTO public.part VALUES (340, 1, '2020-12-02 22:04:29.797949', '2020-12-02 22:04:29.797949', 'Klatschen zu dritt', 'Diese Übung funktioniert mit jeweils drei Spielern (A, B und C). Spieler A klatscht Spieler B zu. Daraufhin muss der "nicht beteiligte" Spieler, also Spieler C, einen Klatscher an einen Spieler seiner Wahl aussenden, z.B. B, woraufhin dann A wieder als nächstes dran ist, einen Klatscher an einen der anderen beiden Spieler zu senden. Idealerweise spielt man dieses Spiel in möglichst hohem Tempo, was jedoch erfahrungsgemäß gar nicht so einfach ist.', 'https://improwiki.com/de/wiki/improtheater/klatschen_zu_dritt', '2020-11-14 07:44:27.468', 340);
INSERT INTO public.part VALUES (341, 1, '2020-12-02 22:04:29.951568', '2020-12-02 22:04:29.951568', 'Ah - Stirb', 'Alle Spieler stellen sich in einem Kreis auf, und schauen auf den Boden. Der Spielleiter ruft irgendwann "Jetzt!" und jeder schaut einem anderen Mitspieler in die Augen. Treffen sich zwei Blicke, fallen beide mit lautem Schrei tot um.

Der Kreis wird wieder geschlossen und die Runde geht weiter, bis am Ende einer übrig bleibt!

auch bekannt als "Kevin allein zu Haus" oder "Schreikreis".

Variante: Insbesondere auch für kleine Gruppe (ab 4) ist folgende Variante geeignet: Man schreit nur, aber fällt nicht tot um und verlässt den Kreis nicht. D.h. es ist - in schneller Folge - immer wieder die gleiche Anzahl von Spielern beteiligt.', 'https://improwiki.com/de/wiki/improtheater/ah_-_stirb', '2020-11-14 07:44:27.554', 341);
INSERT INTO public.part VALUES (342, 1, '2020-12-02 22:04:30.072046', '2020-12-02 22:04:30.072046', 'Hut klauen', 'Zwei oder mehrere Spieler sind auf der Bühne und entwickeln eine einfache Szene. Jeder Spieler hat einen Hut auf. Ziel der Spieler ist es, den anderen Spielern den Hut zu klauen. Ein Spieler, dessen Hut geklaut wurde, verläßt die Bühne. Der Spieler, welcher als letzter seinen Hut behält, hat gewonnen.

_Variante_: Anstelle von Hüten können auch Tücher am Gürtel (rückseitig) befestigt werden.

Diese Übung kann auch bei einem Auftritt verwendet werden, um den (die) Spieler zu bestimmen, der (die) die nächste Szene spielt (spielen).

Dieses Spiel gibt es auch in etwas anderer Art und Weise bei einem Auftritt als Spiel auf der Bühne, siehe Hut ab.

', 'https://improwiki.com/de/wiki/improtheater/hut_klauen', '2020-11-14 07:44:27.596', 342);
INSERT INTO public.part VALUES (343, 1, '2020-12-02 22:04:30.189546', '2020-12-02 22:04:30.189546', 'Bipeldibipeldibopp', 'Ein Spieler steht in der Mitte eines Kreises.  
Er sagt zu irgendeinem Bipeldibipeldibop, dieser muss in der Zeit des Aufsagens schnell Bop sagen, wenn er es verpasst, tritt er in die Mitte.  
Sagt der in der Mitte irgendetwas anderes außer Bipeldibipeldibop und der andere im Kreis sagt trotzdem Bop, muss der Bopsager nun in die Mitte.

Desweiteren gibt es Figuren, welche von drei Kreisspielern gespielt werden.

Figuren siehe Kennedy.', 'https://improwiki.com/de/wiki/improtheater/bipeldibipeldibopp', '2020-11-14 07:44:27.592', 343);
INSERT INTO public.part VALUES (344, 1, '2020-12-02 22:04:30.353028', '2020-12-02 22:04:30.353028', 'Kennedy', 'Bei diesem - zum Teil ein wenig makaberen - Aufwärmspiel stehen die Spieler im Kreis, einer steht in der Mitte des Kreises. Der Spieler in der Mitte zeigt auf einen der Spieler. Mit dem Zeigen sagt er einen bestimmten Begriff. Nun muss der Spieler, auf den gezeigt wurde, gemeinsam mit den Spielern links und rechts von ihm schnellstmöglich die mit der Nennung des Begriffs geforderte Figur darstellen. Wenn es bei einem der drei Beteiligten zu langsam geht oder er eine falsche Figur stellt, muss der Betreffende in die Mitte des Kreises.  
Um die Rechtzeitigkeit festzustellen, kann der Spieler in der Mitte auch zählen. Z.B. "Waschmaschine 1 2 3 4 5". Der Spieler und seine beiden Nachbarn haben solange Zeit, die Figur zu formen, bis die "5" gefallen ist.

Man fängt mit wenigen Figuren an, damit sich diese einprägen und steigert dann deren Anzahl.

Folgende Figuren sind möglich (ergänzbar):

M = Mittlerer Spieler  
N = die Nachbarn, also die beiden Spieler links und rechts

*   **Kennedy** M: Vornübergebeugt, auf die Erde blickend; N: Gestreckter Arm mit Faust, nur der Zeigefinger ist gestreckt (= Waffe) und auf den Kopf von M gerichtet, die andere Hand umfasst das Handgelenk der gestreckten Hand

*   **Jesus** M: Steht gekreuzigt, das heißt mit seitlich ausgestreckten Armen, das eine Bein über das andere geschlagen, der Kopf hängt schrägt geneigt nach vorn; N: Knien betend vor M.

*   **James Bond** M: Steht lässig auf einem Fuß, mit dem anderen leicht angewinkelte Bein nur auf den Fußspitzen. Den gestreckten Zeigefinger (= Waffe) hält er unter den Mund, und bläst in diesen, das heißt in die "Mündung" der Waffe hinein, Rest der Hand ist zur Faust geballt. N: Stützen sich mit beiden Händen auf die Schulter von M und sagen dahinschmelzend: "Oh James!"

*   **Exhibitionist** M: Öffnet weit seinen imaginären Mantel. N: Gucken ihn an und kreischen.

*   **Elefant** M: Fasst mit der einen Hand seine Nase, der andere - gestreckte - Arm geht über die Armbeuge des Armes schräg nach unten/vorn (Rüssel). N: Stellen mit beiden Armen, die jeweils einen zu M offenen Halbkreis bilden, die Ohren dar.

*   **Nashorn** M: Nimmt eine Hand mit ausgestrecktem Zeigefinger an die Nase (Nashorn). N: Stellen mit Zeigefinger und Daumen der jeweils linken oder rechten Hand, die einen zu M offenen Halbkreis bilden, die Ohren dar (kleinere Ohren als bei Elefant).

*   **Känguruh** M: Streckt die gefalteten Hände weit von sich (Beutel). N: Stecken die Köpfe von unten durch die Arme, als würden sie aus dem Beutel schauen.

*   **Kotzendes Känguruh** M: Streckt die gefalteten Hände weit von sich (Beutel). N: Beugen sich über den Beutel und kotzen hinein.

*   **Kamikaze** M: Die Spitzen der Zeigefinger und der Daumen der linken und rechten Hand berühren sich, bilden damit eine liegende Acht und werden vor die Augen gehalten (Brille) -- besser noch: Die _Brille_ wird mit den Handflächen an die Wangen gelegt, so dass diese die _Bändel_ einer alten Fliegermütze ergeben und die (zwangsläufig) ausgestreckten Ellenbogen vom M die _Tragflächen des Flugzeuges_ ergeben. N: Strecken die jeweils M abgewendeten Arme gerade nach außen (Flügel).

*   **Flugzeug** M: Hält das Steuer und macht eindeutige Motorengeräusche wie "brrrrrr" etc. N: Bilden die Flügel (vgl. Kamikaze).

*   **McDonalds** M: Beugt sich nach vorn und kotzt. N: Klopfen M auf den Rücken.

*   **Broiler** M: Dreht sich mehrfach mit angelegten gestreckten Arme um sich selbst. N: Fassen sich an die Hände, M. dreht sich also innerhalb der Arme.

*   **Toaster** M: Hüpft mehrfach mit angelegten gestreckten Armen hoch. N: Fassen sich an die Hände, M. hüpft also innerhalb der Arme.

*   **Kaputter Toaster** Wie Toaster, nur hüpfen hier die N und M steht.

*   **Mixer 1** M: Streckt die Arme gerade nach oben. N: Drehen sich im Kreis.

*   **Mixer 2** M: Streckt die Arme schräg seitlich nach oben, so hoch, dass N unter die nach unten geöffneten Hände von M passen. N: Drehen sich unter der jeweiligen Hand um ihre Achse.

*   **Waschmaschine:** M: Bückt sich nach vorn und dreht die Arme vor dem Körper. N: Machen das Gleiche, nur in die Richtung des mittleren Spielers gedreht.

*   **Atomkraftwerk:** M: streckt die Arme mit Fäusten in die Luft und ruft "Bumm!". N: mit dem Rücken zu M. Sagen: "Strahl, strahl, strahl" und zeigen mit den Händen die entweichende Strahlung des AKWs an.

*   **Laterne** M. Steht gerade und streckt die Arme nach oben. N: Heben jeweils ein Bein Richtung "Laterne" und pinkeln damit die "Laterne" an.

*   **Palme** M: Bildet mit seinen ausgesteckten Armen die Palmwedel. N: bewegen die Hüfte und sagen: "Hulahula"

*   **Lokomotive** M: Streckt seine Arme aus und klappt die Hände wie blinkende Lichter auf und zu. N: machen mit ihren Armen kreisförmige Bewegungen wie Räder.

*   **Die drei Mexikaner**: Alle drei Spieler rücken zusammen und tun so, als ob sie auf kleinen Gitarren Luftgitarre spielen und singen dabei "Lalalala".

_Asynchrone Figuren:_ (Jeder Spieler muss sich eine Rolle heraussuchen und die drei Spieler müssen sich schnell und unbemerkt einigen.)

*   **Die Drei Affen** Ein Spieler hält sich den Mund, einer die Ohren und der dritte die Augen zu.

*   **Feuerwehr** Ein Spieler pumpt Wasser, einer hält die Spritze und der Dritte dreht eine Hand über dem Kopf und imitiert das Geräusch einer Feuerwehrsirene.

*   **Band** Ein Spieler singt "La-la-la", einer spielt Gitarre und der dritte Schlagzeug.', 'https://improwiki.com/de/wiki/improtheater/kennedy', '2020-11-14 07:44:27.804', 344);
INSERT INTO public.part VALUES (345, 1, '2020-12-02 22:04:30.547972', '2020-12-02 22:04:30.547972', 'Klatschkreis', 'Als **Klatschkreis** werden verschiedene Aufwärmspiele bzw. Rhythmusübungen bezeichnet, bei denen die Spieler im Kreis stehen und ein Signal - meist ein Klatschen - nach einem festen Muster oder zufällig durch den Kreis gesendet wird. Es gibt viele verschiedene Spielvarianten und man kann leicht neue Varianten erfinden.

## Klassischer Klatschkreis

Alle Spieler stehen im Kreis. Einer beginnt und sendet ein Klatschsignal an einen beliebigen anderen Spieler. Dabei wichtig: Immer Augenkontakt herstellen und mit den klatschenden Händen deutlich auf den Empfänger zeigen. Das ist wichtig, damit das Signal sauber ankommt, insbesondere wenn später die Geschwindigkeit angezogen wird. Der Empfänger sendet das Klatschsignal weiter an den nächsten Spieler usw. Ziel der Übung ist als Gruppe in einen "Flow" zu kommen: Das heißt, jeder ist hochaufmerksam, aber gleichzeitig locker und entspannt ist. Das Weitergeben des Signals geschieht automatisch ohne nachzudenken. Dass der Flow erreicht ist, zeigt sich darin, dass das Klatschen einen gleichmäßigen Rhythmus bekommt.

Tipp: es hilft, locker in der Hüfte dazustehen (wie ein Cowboy) oder leicht auf seinem Platz zu federn (wie ein Martial-Arts-Kämpfer, jederzeit reaktionsbereit). Tipp 2: Lächeln und Mimik nicht vergessen!

**Häufige Fehler**: Viele Übungen verkommen im Laufe der Zeit zu Ritualen und der eigentliche Sinn der Übung und die damit verbundenen Ziele gehen verloren. Bei dieser Übung werden oft folgende Fehler gemacht:

**Blicklose Weitergabe**: Der Empfänger des Klatschimpulses wird nicht angeschaut, sondern es wird einfach ''blind'' geklatscht. Es soll aber kein Automatismus entstehen, sondern die Aufmerksamkeit zu meinen Mitspielern soll immer wieder aufs Neue aufgebaut werden. Erst wenn der (Blick-)Kontakt hergestellt ist wird der Klatschimpuls weitergegeben. So wie ich auch in einer Szene den Kontakt zu meinem Mitspieler aufbaue, um dann mit Ihm zu interagieren, so baue ich auch bei dieser Übung erst den Kontakt auf und lasse dann eine Aktion folgen.

**Zu schnelles Erhöhen der Geschwindigkeit**: Oft wird das Klatschen im Kreis mit erhöhter Geschwindigkeit vorangetrieben, obwohl die Gruppe noch keinen gemeinsamen Rhythmus gefunden hat. So wie Spieler in einer gelungenen Szene einen gemeinsamen Rhythmus haben, so sollen sie ihn auch im Klatschkreis haben. Erst wenn dieser gemeinsame Rhythmus gefunden ist, dann kann mit der Geschwindigkeit gespielt werden. Dabei ist Geduld gefragt, denn manche Spiele brauchen vielleicht länger als andere um den Rhythmus der Gruppe zu fühlen, um diesen dann aufzunehmen. Solange nicht die ganze Gruppe den Rhythmus aufgenommen hat, wird auch nicht die Geschwindigkeit erhöht.

## Varianten

*   Das Klatschsignal wird nicht an einen beliebigen Spieler gegeben, sondern wandert im Kreis herum; jeder gibt es an seinen Nachbarn weiter. Dies ist als Einstiegsvariante brauchbar. Allerdings ist hier die Gefahr, dass die Spieler, nachdem sie dran waren, "abschalten" und nicht die ganze Zeit konzentriert dabei sind (weil sie jederzeit drankommen können).
    *   Dito, aber bei Doppelklatsch wird die Richtung gewechselt.
    *   Dito, aber Spieler können sich auch unter einem Klatscher wegducken; das Signal geht dann an den nächsten weiter, der sich nicht geduckt hat.

*   Der Adressat des Klatschens muss gleichzeitig klatschen. Danach dreht er sich zu einem beliebigen Mitspieler um und klatscht ihm zu. Dieser muss ebenfalls gleichzeitig klatschen. Gelingt das gleichzeitige Klatschen nicht, wird es wiederholt. Wichtig ist, in einen gleichmäßigen Rhythmus zu kommen.

*   Zusätzlich zum Klatschen kann man Wörter senden (in zunehmender Schwierigkeit aufgelistet):
    *   das Wort "Zip!" (gesprochen Sipp).
    *   ein beliebiges Soundword, z.B. "Puff!", "Zapp!", "Pling!", "Tschak!", "Fong!", "Piep!", "Klung!", "Boing!"...
    *   Zip Zap Zop - diese drei Wörter werden zyklisch gesprochen (mit summendem S: Sib Säb Sob Sib Säb Sob Sib Säb Sob...)
    *   Zip Zoom Boing - es gibt ein Wort für "linken Nachbarn", eines für "rechten Nachbarn" und eines für "durch den Kreis".

*   Schnipskreis - statt eines Klatschens gibt man nur ein Schnipsen mit den Fingern weiter.

*   Assoziationskreis - statt eines Klatschens gibt man Wörter weiter: der erste sendet ein Wort, jeder weitere Spieler assoziiert auf das Wort seines Vorgängers. Man ersetzt hier sinnvollerweise das Klatschen durch eine klare Zeigegeste. Beispiel: "Baum" - "Haus" - "Tür" - "Fenster" - "offen" - "stehen" - "still" - "sein" - "haben" - "nix" ... auch hier wichtig: einen Takt finden und in den Flow kommen. Nicht nachdenken, es gibt beim Assoziieren kein falsches Wort!

*   Ein-Wort-Geschichte - wie Assoziationskreis, aber die Wörter ergeben eine Geschichte. Hierbei muss man das Tempo reduzieren. Ziel ist ein langsamer, aber möglichst gleichmäßiger Takt. Es hilft ein gemeinsamer Klatsch-/Bewegungsrhythmus, bei dem z.B. immer (von 4 Schlägen) auf die "1" das nächste Wort gesagt wird.

*   Schnittmuster

', 'https://improwiki.com/de/aufwaermspiele/klatschkreis', '2020-11-14 07:44:27.825', 345);
INSERT INTO public.part VALUES (346, 1, '2020-12-02 22:04:30.708861', '2020-12-02 22:04:30.708861', 'Gehen mit Geschwindigkeitsstufen', 'Die Spieler stehen im Raum verteilt. Aufgabe ist, in sich steigerndem Tempo kreuz und quer durch den Raum zu gehen. Der Spielleiter sagt "Stufe 1" an. Wir gehen extrem langsam durch den Raum, sozusagen extremste Zeitlupe. Trotzdem hat jede/r in jeder Stufe immer sein eigenes Tempo, das durchaus erheblich von dem der anderen abweichen kann. Nach einer gewissen Zeit sagt der Spielleiter "Stufe 2" an: Wir gehen ein wenig schneller. Das setzt sich fort bis "Stufe 10", in der wir so schnell wie möglich durch den Raum gehen.

Der Spielleiter fordert alle auf, stehen zu bleiben; es folgt der zweite Teil der Übung. Er sagt nun wahllos irgendwelche Stufen an und die Spieler versuchen sich jeweils an ihr Tempo zu erinnern, das sie im ersten Teil der Übung für die genannte Stufe gewählt hatten und gehen in dem entsprechenden Tempo wieder durch den Raum.

Kann gut mit Gehen mit Aggregatzuständen kombiniert werden.', 'https://improwiki.com/de/wiki/improtheater/gehen_mit_geschwindigkeitsstufen', '2020-11-14 07:44:27.854', 346);
INSERT INTO public.part VALUES (347, 1, '2020-12-02 22:04:30.848316', '2020-12-02 22:04:30.848316', 'Vokalkette', 'Diese Übung ist für eine größere Gruppe geeignet.

Die Spieler stehen im Kreis. Der Spielleiter schickt zwei Vokale in den Kreis. Zunnächst spricht er zu seinem rechten oder linken Nachbarn ein "a". Dieser sagt danach wiederum ein "a" zu seinem nächsten Nachbarn, aber anders ausgesprochen, denn jeder Spieler soll den gleichen Vokal unterschiedlich gestalten: Kurz oder lang, hoch oder tief, gesprochen oder gesungen usw. Wenn Spieler wollen, können sie Pausen machen, bis sie ihr "a" weitergeben. Gelegentlich _sollen_ sie Sprechpausen machen, denn sonst kann der zweite Laut nicht los- bzw. weitergeschickt werden: Die erste Sprechpause nutzt der Spielleiter, um den zweiten Laut/Vokal in die Runde zu schicken. Zu demselben Nachbarn wie beim "a" spricht er nun ein "o". Dieses "o" geht nun - auch individuell gestaltet - im Kreis herum. Aber wichtig: Es darf immer nur dann an den nächsten Nachbarn weitergeleitet werden, wenn in der "a"-Kette eine bewusste Sprechpause gelassen wurde.

## Vorübung/ähnliche Übung

*   Ein vom Spielleiter vorgegebener Vokal wird reihum weitergegeben. Der Vokal soll so kurz wie möglich gesprochen werden und die Pausen sollen möglichst kurz sein. Tonhöhe und Lautstärke dürfen variiert werden. Der Spielleiter kann mit der (Stopp-)Uhr messen, wie lange es dauert, bis der Laut wieder bei ihm ankommt.

Mit dieser Übung werden insbesondere das Zusammenspiel und das Aufeinander achten trainiert.', 'https://improwiki.com/de/wiki/improtheater/vokalkette', '2020-11-14 07:44:27.822', 347);
INSERT INTO public.part VALUES (348, 1, '2020-12-02 22:04:31.013328', '2020-12-02 22:04:31.013328', 'Gedankenspiel', 'Zwei Spieler kommen auf die Bühne und treffen sich rein zufällig an einem Ort, welcher vorgegeben wird.  
Beide haben sich lange nicht gesehen und unterhalten sich scheinbar freundlich über ihre Familien, Freunde, Arbeit, etc. In ihrem Kopf sieht es anders aus. Sie denken in Wirklichkeit über ihr Gegenüber völlig anders.  
Diese Gedanken teilen sie dem Publikum (meistens Mitspieler der Übungsrunde) mit, indem sie den Kopf in deren Richtung drehen. Das Gegenüber hört zwar die Gedanken, darf sie aber nicht beachten und muss seinerseits auch freundlich reden, aber darf schlecht über den anderen denken und jedem seine Gedanken mitteilen.', 'https://improwiki.com/de/wiki/improtheater/gedankenspiel', '2020-11-14 07:44:27.902', 348);
INSERT INTO public.part VALUES (349, 1, '2020-12-02 22:04:31.284677', '2020-12-02 22:04:31.284677', 'Mehrköpfiger Experte', 'Mindestens drei Spieler bilden eine Figur, einen mehrköpfigen Experten. Sie stellen sich dafür nebeneinander und legen dabei die Arme um die Schultern des benachbarten Spielers. So hat dieser dreiköpfige Experte auch einen linken und einen rechten Arm und kann sich somit wie eine normale Person bewegen.

Der Experte spricht mit einer Stimme, d.h. alle drei Spieler sprechen zur gleichen Zeit und versuchen dabei das Gleiche zu sagen. Wenn die Spieler langsam genug sprechen kann dies hervorragend funktionieren.

Dieser Experte kann in eine ''normale'' Szene eingebaut werden, oder im Rahmen eines Expertenspieles auftauchen. In diesem Expertenspiel wird der Experte von einem Moderator zu einem Thema befragt und versucht diese Fragen zu beantworten.

Der Moderator sollte darauf achten, daß die Fragen nicht zu kurz beantwortet werden können. Es empfehlen sich als Fragen mit wieso, weshalb, warum.

**Variante:** Orakel', 'https://improwiki.com/de/wiki/improtheater/mehrkoepfiger_experte', '2020-11-14 07:44:27.951', 349);
INSERT INTO public.part VALUES (350, 1, '2020-12-02 22:04:31.542537', '2020-12-02 22:04:31.542537', 'Active Post', 'Aktive Post ist eine Mischung aus _Activity_ und _Stille Post_.

**Für 5 Spieler:** Ein Spieler übernimmt die Spielleitung und nennt oder zeigt Spieler Nr. 1 einen Begriff aus zwei zusammengesetzten Wörtern (z.B.: Ameisenhaufen). Nr. 1 muss nun Nr. 2 den Begriff pantomimisch darstellen. Nr. 2 soll nun Nr. 3 den Begriff zeichnen. Nr. 3 erklärt nun Nr. 4 den Begriff und dieser benennt ihn, erst hier wird aufgelöst. Nur die Erklärung des jeweiligen Vorgängers darf gesehen / gehört werden.

Für die einzelnen Schritte ist nur 1 Minute Zeit und der Begriff wird immer weitergegeben ohne wirklich zu wissen, ob er richtig verstanden wurde, erst der Letzte in der Reihe darf mögliche Lösungen nennen.

Die Reihenfolge vom Zeichnen und Pantomime kann auch getauscht werden – das verbale Erklären sollte der Einfachheit halber am Ende stehen (es ist einfacher die Augen zu schließen oder sich wegzudrehen, als die Ohren zuzuhalten und wirklich nichts zu hören).

Bei einer Variante mit **4 Spielern**, denkt sich der jeweils erste den Begriff aus.', 'https://improwiki.com/de/wiki/improtheater/active_post', '2020-11-14 07:44:27.984', 350);
INSERT INTO public.part VALUES (351, 1, '2020-12-02 22:04:31.675542', '2020-12-02 22:04:31.675542', 'Big Booty', 'Bei diesem Sing/Rhythmusspiel stellen sich die Teilnehmer im Halbkreis oder in Hufeisenform auf. Die Varianten **Big Booty**, **Peter - Paul** und **Concentration** unterscheiden sich vor allem durch den Namen des "ersten Spielers" und durch den Grundrhythmus.

Siehe auch Rhythmusübungen.

## Big Booty

Es wird durchnummeriert, wobei der erste Spieler Big Booty (oder _Big Buddy_) ist. Es geht darum, singenderweise einen Rhythmus zu erreichen, zu halten und zu steigern und gleichzeitig Fehler zu vermeiden.

Der Anfang wird bei Big Booty gemacht. Der Spieler, der an der Reihe ist, nennt im Takt erst seine Nummer, dann die Nummer des Spielers, der als nächstes an der Reihe sein soll.

Wer einen Fehler macht, muss sich am Ende der Reihe anstellen, wodurch die Nummerierungen automatisch neu vergeben werden. Ein Fehler wurde gemacht, wenn ein Spieler nicht im Takt bleibt oder einfach den Aufruf seiner Nummer verpasst.

Zur Verdeutlichung ein Beispiel:  
_Alle:_ Big Booty, Big Booty, Big Booty - ooooh yeah  
_Big Booty:_ Big Booty ? Number 1  
_Number 1:_ Number 1 ? Big Booty  
_Big Booty:_ Big Booty ? Number 6  
_Number 6:_ Number 6 ? Number 7  
Number 7: Number 7 ? Number 7 (FEHLER!)  
_Alle:_ Ooh shit !!!  

Number 7 muss sich hinten anschließen, es wird aufgerückt, dadurch neue Nummern, das Spiel geht unmittelbar und ohne Pause weiter.

_Alle:_ Big Booty, Big Booty, Big Booty - ooooh yeah  
_Big Booty:_ Big Booty ? Number 5  
_Number 5:_ Number 5 ? Number 2  
usw.  

**Variante**: Die Nennung der eigenen Nummer muß nicht unbedingt als Fehler gelten.

## Peter - Paul

Der erste Spieler ist Peter, der zweite Paul. Alle weiteren Spieler werden wie bei Big Booty durchnummeriert. Alle Spieler klatschen den Rhythmus indem sie mit den Händen auf die Oberschenkel, anschließend in die Hände klatschen und abschließend den "Anhalterdaumen" der rechten Hand über die rechte Schulter und dann den Anhalterdaumen der linken Hand über die linke Schulter zeigen lassen. Wenn der Anhalterdaumen über die Schulter zeigt, wird wie bei Big Booty erst die eigene Nummer und dann die Nummer eines zweiten Spielers genannt. Peter gibt den Takt vor und kann ihn beliebig steigern oder verlangsamen, indem er sich mehrfach selber aufruft.

Wer einen Fehler begeht muß sich hinten im Kreis anstellen und wird _Doof_. Bei weiteren Fehlern des Spielers _Doof_ kann er _Doppel-Doof_, _3fach Doof_, ... werden.

## Concentration

Eine weitere Variante dieses Aufwärmspiels. Hier sitzen die Spieler; der gemeinsame Rhythmus ist wie bei "Peter - Paul", allerdings wird auf 3 und 4 statt des "Anhalterdaumens rechts und links mit den Fingern geschnippt. Auf diese beiden Schnipser wird gesprochen. Es gibt einen Einzählvers "Con - cen - tra - tion - Concen - tration - now be - gins", den alle zu Beginn sagen (und auch jedesmal, wenn man nach einem Fehler neu anfängt), damit alle "in den Groove kommen". Bei den Namen gibt es auch hier wieder Varianten, z.B. heißt der erste Spieler "Chef", der zweite "Vize", dann "Drei", "Vier" usw.

**Variante:** Als deutscher Einzählvers: "Fünf Millionen Hunderttausend"

**Schreibvarianten**: (ja, das sieht komisch aus, aber auch danach haben einige Spieler gesucht): big boothie, bigbotty, bigg booty, big boty, big booti, bigboty, big boodie, big boody, big butty

', 'https://improwiki.com/de/wiki/improtheater/big_booty', '2020-11-14 07:44:28.099', 351);
INSERT INTO public.part VALUES (352, 1, '2020-12-02 22:04:31.874754', '2020-12-02 22:04:31.874754', 'Gromolokreis', 'Alle Spieler bilden einen Kreis. Einer tritt in die Mitte und erklärt anhand von einigen Gesten etwas in Gromolo (Kauderwelsch). Nachdem er seinen Platz im Kreis wieder eingenommen hat, tritt sein Nebenmann in die Mitte und übersetzt nun mit Hilfe der gleichen Gesten, was sein Vorredner denn erklärt hat.

Es sollte jeder mindestens einmal Gromolo-Sprecher und einmal Übersetzer spielen.', 'https://improwiki.com/de/wiki/improtheater/gromolokreis', '2020-11-14 07:44:27.999', 352);
INSERT INTO public.part VALUES (360, 1, '2020-12-02 22:04:33.108303', '2020-12-02 22:04:33.108303', 'Statuskette', 'In den beiden Versionen der **Statuskette** können beliebig viele Spieler den Status proben.

## Version 1

Es wird eine Situation vorgegeben, zum Beispiel Gast im Restaurant. Dieser hat den absoluten Hochstatus.

Nun werden die Wünsche oder Beschwerden des Hochstatus-Spielers die Statuskette hinabgegeben. Dabei hat jeder der nebeneinander stehenden Spieler nach unten hin einen Hochstatus, nach oben einen Niedrigstatus.

Beispiel für eine Kette: Restaurantgast -> Kellner -> Koch -> Küchengehilfe -> Auszubildender.  
Die Spielenden agieren nicht alle zur gleichen Zeit, sondern es sind immer nur zwei aktiv. Beispiel: Der Gast bemängelt, dass das Fleisch zäh ist, der Kellner entschuldigt das buckelnd, wendet sich dann um zum Koch, und gibt diesem wütend die Schuld. Danach schreit der Koch seinen Küchengehilfen an usw.

Wenn ein Spieler rebelliert, d.h. seinen Status nicht einhält (also Hochstatus spielt, wo Niedrigstatus erforderlich ist oder Niedrigstatus einnimmt, obwohl er Hochstatus hat), dann wandert er aus der Kette an den letzten Platz mit absoluten Niedrigstatus.

## Version 2

Spieler A etabliert allein auf der Bühne eine Szene. Nach einer gewissen Zeit kommt ein weiterer Spieler B auf die Bühne und hat im Vergleich zum bereits Anwesenden einen höheren Status. Die beiden Spieler agieren auf der Bühne, dann verlässt der Spieler A begründet die Bühne. Nach kurzer Zeit kommt ein neuer Spieler C auf die Bühne, er hat im Vergleich zu Spieler B Hochstatus. Diese Kette permanent steigenden Status'' setzt sich mit jedem Spieler fort. Umgekehrt geht die Übung natürlich auch, d.h. jeder neue Spieler hat Tiefstatus.

Beispiel:

1\. (mit Ortswechseln) Buchverkäufer -> Chef -> Kunde -> Ehefrau des Kunden -> Mutter der Ehefrau -> Altenpflegerin der Mutter -> Priester (der ihr die Beichte abnimmt) -> Papst -> Gott

2\. (ohne Ortswechsel) Leiche -> Finder der Leiche -> Dorfpolizist -> Kriminalpolizist -> Staatsanwalt -> Bürgermeister

Es müssen nicht unbedingt "normale" Statusunterschiede sein. Es wäre also auch denkbar, mit einem Arzt zu beginnen, demgegenüber die Sprechstundenhilfe Hochstatus hat.

Ein Spiel auf Basis einer Statuskette ist z.B. Hackordnung in der Form "Die drei Ganoven".

Siehe auch die Übung Statusgruppe', 'https://improwiki.com/de/wiki/improtheater/statuskette', '2020-11-14 07:44:28.335', 360);
INSERT INTO public.part VALUES (353, 1, '2020-12-02 22:04:32.03563', '2020-12-02 22:04:32.03563', 'Partner-Entspannungsübung', 'Eine Entspannungs- und Lockerungsübung, die man an einem langen Impro-Übungstag auch gut zwischendurch einbauen kann. Empfehlenswert auch für Gesangs-Workshops.

Die Gruppe bildet Paare mit etwa gleicher Körpergröße und verteilt sich im Raum.

### 1\. Phase: Wirbel für Wirbel abrollen

Einer der Partner (A) schließt die Augen und läßt seinen Atem frei fließen. Der andere (B) berührt ihn mit den Fingerspitzen links und rechts an der Nackenwirbelsäule und markiert dort einen spürbaren Druckpunkt. Der Druckpunkt wandert nun Zentimeter um Zentimeter langsam die Wirbelsäule hinunter. An der Stelle des Druckpunkts entspannt sich der Rücken, so dass sich A langsam, Wirbel für Wirbel, "wie ein Farnblatt" abrollt, bis er schließlich ganz entspannt nach unten hängt. A''s Beine stehen dabei aufrecht (Knie nicht durchgedrückt) und seine Arme hängen schlaff herunter; zum Schluss werden sie etwa den Boden berühren. Wichtig ist, dass A auch sein Gesicht entspannt, den Mund halboffen und den Kiefer locker lässt (B sollte das zwischendurch in der folgenden Phase immer wieder testen, indem er A''s Kopf und Körper leicht hin- und herschlenkern lässt). A "spürt in seine Entspannung und in seine Atmung hinein".

### 2\. Phase: Abstreifen/Abklopfen

B streift bzw. klopft A nun mit beiden Händen ab (immer abwärts gerichtet): zuerst den Rücken (beim Klopfen vorsichtig), dann den Po und die Beine hinunter, rundrum um die Oberschenkel und Waden, die Füße fest "in den Boden hineindrücken" für einen guten Stand, auch die Schultern, Ober- und Unterarme. B kann Klopfen mit Abstreifen abwechseln. Beim Abklopfen kann B auch seine Hände geschlossen halten, dabei aber die Handgelenke ganz locker machen. Das Ganze ist eine Massage, die A passiv und entspannt über sich ergehen lassen und genießen kann. Dabei wird die gesamte Muskulatur gelockert und "lebendig gemacht".

### 3\. Phase: Wirbel für Wirbel aufrichten

Nun gibt B wieder einen Druckpunkt an A''s Lendenwirbelsäule, der ganz langsam nach oben wandert. B sollte darauf achten, dass A sich dabei nicht schneller aufrichtet, als der Druckpunkt vorgibt. Wichtig ist, A zum Schluss anzuweisen, dass er seinen Kopf nicht selbst aufrichtet, sondern zunächst noch hängen läßt. Das Aufrichten des Kopfes macht B für A: B umfasst von hinten mit beiden Händen seitlich A''s Kiefer und Kopf und richtet den Kopf auf, hält ihn noch 3 Sekunden, während A nun die Augen wieder öffnet, und gibt ihn dann frei. A darf sich nun, wenn er möchte, bei B bedanken!

Dann wechseln A und B die Rollen.

**Sinn der Übung:** Entspannung, Lockerung, Passivität (in diesem Fall das Massiertwerden) genießen, Scheu vor Körperkontakt verlieren.', 'https://improwiki.com/de/wiki/improtheater/partner-entspannungsuebung', '2020-11-14 07:44:28.132', 353);
INSERT INTO public.part VALUES (354, 1, '2020-12-02 22:04:32.181606', '2020-12-02 22:04:32.181606', 'Hilfe!', '2-4 Spieler improvisieren eine Szene nach einer beliebigen Vorgabe. Der Rest der Spieler schaut zu und hält sich bereit. Wann immer ein Spieler sich überfordert fühlt, ihm nichts mehr einfällt, oder er einfach keine Lust mehr hat, ruft er "Hilfe!" und es kommt sofort ein anderer Spieler von außen und löst ihn ab.

Diese Übung ist gut für Impro-Anfänger geeignet, um ihnen die Angst vor dem Steckenbleiben zu nehmen. Die erwünschte Nebenwirkung ist, dass die Spieler mutiger spielen, weil sie wissen, dass sie jederzeit gehen können und ein anderer das, was immer sie "angezettelt haben", "ausbaden muss". So kann man z.B. jederzeit etwas sehr Gewagtes/Freches sagen und sofort darauf mit einem schelmischen "Hilfe!" abgehen...

Das gleiche Prinzip findet sich im Spiel Stunt-Double.', 'https://improwiki.com/de/wiki/improtheater/hilfe', '2020-11-14 07:44:28.106', 354);
INSERT INTO public.part VALUES (355, 1, '2020-12-02 22:04:32.299307', '2020-12-02 22:04:32.299307', 'Groovelicious', 'Impulskreis "Groovelicious":

Die Improgruppe bildet einen Kreis und gibt folgende Impulse weiter:

\- Man schwingt beide Arme von unten (als würde man schwungvoll einen Medizinball werfen) in Richtung Nebenmann gefolgt von einem "Wusch".

\- Man wirft dem Nebenmann einen imaginären Basketball von oben zu, man kann dazu auch ein kleines Luftsprüngchen machen, gefolgt von einem "Hepp".

\- Man tippt den Nebenmann mit einem Finger an und sagt "Dingdong". Der Nebenmann dreht sich daraufhin einmal um die eigene Achse.

\- Man zeigt auf den Nebenmann und sagt "Fuck You". Der Nebenmann tauscht daraufhin mit seinem anderen Nebenmann die Plätze und zwar mit einem ziemlich "angepissten" Gesichtsausdruck, der zum Ausdruck bringt, dass sie darauf echt keinen Bock haben.

\- Man ruft "Panik" und alle rennen wild durcheinander, schreien und werfen die Arme in die Luft, bis man wieder einen neugeordneten Kreis gebildet hat.

\- Man beugt sich nach vorn in die Mitte des Kreises, die Arme nach unten, alle anderen machen es einem gleich und dann wird langsam "Groovelishes" gerufen, wobei man beim Höhepunkt des Wortes ("lish") die Arme in die Luft streckt und wieder in die ursprüngliche Form des Kreises zurückkehrt. Der Impuls und die Richtung kann beliebig oft gewechselt werden.', 'https://improwiki.com/de/wiki/improtheater/groovelicious', '2020-11-14 07:44:28.088', 355);
INSERT INTO public.part VALUES (356, 1, '2020-12-02 22:04:32.431708', '2020-12-02 22:04:32.431708', 'Es ist Dienstag', 'Zwei Spieler begegnen sich. Einer sagt einen belanglosen Satz, so was wie "Es ist Dienstag." Dieser erste Satz ist entscheidend und wird immer größer gemacht, übertreiben bis zum Geht-nicht-mehr.

Es geht schon in die Richtung Teleshopping, da das Ding (Schuh, Fernseher, Sonnenbräuner etc.) Sachen kann, die unglaublich sind.', 'https://improwiki.com/de/wiki/improtheater/es_ist_dienstag', '2020-11-14 07:44:28.172', 356);
INSERT INTO public.part VALUES (357, 1, '2020-12-02 22:04:32.699736', '2020-12-02 22:04:32.699736', 'Statusraten', 'Bei dieser Übung wird der Ausdruck eines Status'' geübt und man bekommt die Rückmeldung, ob die Anderen den dargestellten Status tatsächlich so wahrgenommen haben.

Es gibt 11 Statusstufen: Die Ziffer 0 bezeichnet die niedrigste/tiefste, 10 die höchste Stufe.

Der Übungsleiter gibt einem Spieler/einer Spielerin die zu zeigende Statusstufe vor. Die Anderen dürfen das nicht sehen; er kann das z.B. schweigend hinter einer Wand mit Hilfe der Zahl seiner ausgestreckten Finger deutlich machen oder er kann die Zahlen auf Kärtchen schreiben und eine davon der Spielerin/dem Spieler zeigen. Diese/r tritt nun mit dem bereits "verinnerlichten" Status vor die Anderen und sagt einen vor Beginn der Übung vereinbarten Satz. Dann geht sie/er - immer noch in dem vorgegebenen Status - wieder ab.

Auf "Kommando" zeigen die Anderen gleichzeitig mit Hilfe der Zahl ihrer ausgestreckten Finger an, welchen Status sie gesehen/erlebt haben und können dies im Anschluss begründen.

_siehe auch_: Statusgruppe', 'https://improwiki.com/de/wiki/improtheater/statusraten', '2020-11-14 07:44:28.228', 357);
INSERT INTO public.part VALUES (358, 1, '2020-12-02 22:04:32.843349', '2020-12-02 22:04:32.843349', 'Einer zuviel', 'Diese Übung kann man mit 3 bis 5 Spielern machen. Wie schon der Name sagt, ist ein Spieler zuviel auf der Bühne. Ein Spieler muß also von der Gruppe ausgeschlossen werden, dabei will natürlich jeder zu der Gruppe gehören und nicht selber der Ausgeschlossene sein. In dieser Übung wird der Status trainiert. Es etabliert sich sehr schnell eine Hackordnung in der Gruppe, an deren Ende aber keiner stehen will.

Siehe auch Der strenge Chef', 'https://improwiki.com/de/wiki/improtheater/einer_zuviel', '2020-11-14 07:44:28.204', 358);
INSERT INTO public.part VALUES (359, 1, '2020-12-02 22:04:32.980452', '2020-12-02 22:04:32.980452', 'Statusgruppe', 'Drei Übungen, in denen in einer Gruppe der Status geübt werden kann:

## Inhaltsverzeichnis

*   Vierer
*   Party
*   Wohngemeinschaft
*   Varianten für _Vierer_ und _Wohngemeinschaft_
*   Tipps und Hinweise

## Vierer

Am Anfang ziehen vier Spieler verdeckt vier Zettel, auf denen ihr Status notiert ist.

*   1 = Hochstatus
*   4 = Tiefstatus
*   2 und 3 liegen entsprechend dazwischen.

Der Übungsleiter gibt nun eine typische Situation vor, in der mehrere Leute agieren können, z.B. (Großraum-) Büro, Hotel (-lobby). Ohne von dem Status der anderen zu wissen, wird nun eine Szene improvisiert, in welcher jeder seinen Status behaupten muss, gleichzeitig aber auch darauf zu achten hat, welche Status seine Mitspieler haben, denn zu Beginn kennt ja jeder nur seinen eigenen Status.  
Wichtig ist, dass Status 1 und Status 4 nicht miteinander reden sollten. Zwischendrin fragt der Übunsleiter die restlichen Spieler, welche das Publikum bilden, wer welchen Status innehat. Ist dies falsch oder unklar, müssen die Spieler auf der Bühne dies deutlicher darstellen.

## Party

Am Anfang ziehen 4 bis 10 Spieler verdeckt jeweils einen Zettel, auf denen ihr Status notiert ist. Sie kennen den Status der anderen also nicht. Dabei ist 1 der höchste Status und 10 oder eine niedrigere Zahl ist - entsprechend der Anzahl der Teilnehmenden - der Tiefststatus. Die Zahlen dazwischen entsprechen dem jeweiligen "Zwischenstatus". Nun wird frei eine Szene auf einer Party improvisiert. Alle versuchen miteinander zu interagieren. Nach Ende der Szene stellen sich die Spieler entsprechend ihrer Statuseinschätzung in einer Reihe auf - wobei es der Höchst- und der Tiefststatus einfach haben, denn sie kennen ihre jeweilige Position in der Reihe schon. Etwaige Zuschauer können ggf. auch noch ihren Kommentar geben, z.B. weil sie die Status'' anders wahrgenommen haben. Schließlich lösen die Spieler ihren Status auf.

## Wohngemeinschaft

Drei Spieler sitzen auf der Bühne nebeneinander und bilden eine WG (Wohngemeinschaft). Ein vierter Spieler möchte in diese WG aufgenommen werden und kommt zu Besuch, um sich vorzustellen.  
Sobald jeder seinen Platz eingenommen hat, verteilt der Übungsleiter kleine Zettelchen mit den Nummern 1-4, welche wie oben den Status symbolisieren. Es folgt eine frei improvisierte Szene, in welcher jeder seinen Status behaupten muss, gleichzeitig aber auch darauf zu achten hat, welche Status seine Mitspieler haben, denn zu Beginn kennt ja jeder nur seinen eigenen Status.  
Zwischendrin fragt der Übungsleiter die restlichen Spieler, welche das Publikum bilden, wer welchen Status innehat. Ist dies falsch oder unklar, müssen die Spieler auf der Bühne dies deutlicher darstellen.

## Varianten für _Vierer_ und _Wohngemeinschaft_

*   Während der laufenden Szene unterbricht der Übungsleiter, die Statuszettel werden neu gezogen und der entsprechende Status wird im weiteren Spiel beachtet: Die unterbrochene Szene wird mit dem "neu gezogenen" Status fortgesetzt.
*   Der Übungsleiter unterbricht und sagt einen Statustausch zweier Spieler an, z.B. "Die 2 wird die 4 und die 4 die 2".

## Tipps und Hinweise

*   Auch der Übungsleiter kennt den Status der Spieler nicht.
*   Neben dem Status ist es - da mehr als 2 Spieler auf der Bühne sind - auch wichtig, laufend auf den Fokus zu achten!
*   Schneller geht das Finden des Status'', wenn eine der Extremfiguren (Höchst-/Tiefststatus) die Szene beginnt und ihren Status dabei deutlich macht. Dann ist es nämlich für die anderen einfach(er), ihren Status zu definieren. Als - weitere - Strategie könnte sich z.B. entwickeln, dass danach die jeweils andere Extremfigur als 2. Person in der Szene agiert. Wenn die Spieler derartige "Tricks" spitzgekriegt haben, kann der Übungsleiter dem vorbeugen, indem er eine Person _bestimmt_, die die Szene _beginnen_ soll.

_Siehe auch_: Statusraten', 'https://improwiki.com/de/wiki/improtheater/statusgruppe', '2020-11-14 07:44:28.394', 359);
INSERT INTO public.part VALUES (361, 1, '2020-12-02 22:04:33.218', '2020-12-02 22:04:33.218', 'Begegnungen', 'Die Gruppe wird in As und Bs aufgeteilt. Beide Gruppen laufen im Raum umher. Zunächst haben die As Hochstatus und bewegen sich entsprechend. Die Bs haben Tiefstatus und bewegen sich entsprechend. Die As nehmen Augenkontakt zu den Bs auf. Die Bs schauen weg. Dabei wird nicht geredet. Danach wird gewechselt, die Bs schauen hin und die As schauen weg. Im Anschluss wird darüber geredet, wie man sich in den unterschiedlichen Rollen gefühlt hat.', 'https://improwiki.com/de/wiki/improtheater/begegnungen', '2020-11-14 07:44:28.32', 361);
INSERT INTO public.part VALUES (362, 1, '2020-12-02 22:04:33.331796', '2020-12-02 22:04:33.331796', 'Tanzen mit "Lichtpunkt"', '**Musik:** Jean-Jaques Goldman: "chansons pour les pieds", No. 5 "tournent les violons".

Bei dieser Partnerübung führt die impulsgebende Person den Tänzer/die Tänzerin an der ausgestreckten Hand, Tänzer/in bleibt im Prinzip auf der Stelle, kann aber die Füße auch lösen (aber nicht umherlaufen). Tänzer/in hat die Augen geschlossen. Vorstellung: An der eigenen ausgestreckten Hand leuchtet ein Lichtpunkt, dem man mit den (inneren) Augen folgt. Ziel: Sich der Führung hingeben, in kleinen bis ganz großen Bewegungen führen, sich von der Musik leiten lassen.', 'https://improwiki.com/de/wiki/improtheater/tanzen_mit_lichtpunkt', '2020-11-14 07:44:28.422', 362);
INSERT INTO public.part VALUES (363, 1, '2020-12-02 22:04:33.474611', '2020-12-02 22:04:33.474611', 'Choreographie-Übung', 'Die Spieler stellen sich im Raum / auf der Bühne in einer rautenförmigen Formation auf (alle mit Blick zum Publikum). Je nach Spielerzahl z.B.:

             \*
          \*     \*   (für 4 Spieler)
             \*

             \*
          \*  \*  \*   (für 5 Spieler)
             \*

             \*
           \*   \*
         \*       \*  (für 8 Spieler)
           \*   \*
             \*

Nun machen die Spieler irgendwelche Bewegungen, und zwar synchron. Dies funktioniert nach dem "Vogelschwarmprinzip": immer derjenige führt, der "die Nase vorn hat" - also derjenige Spieler, der in der aktuellen Blickrichtung keinen anderen Spieler vor sich hat. Alle anderen Spieler kopieren die Bewegungen des momentanen Anführers. Durch die Änderung der Blickrichtung wird die Führungsrolle abgegeben. Dieser Wechsel sollte für das Publikum möglichst glatt und unmerklich sein. Die Darbietung endet, wenn es für das Publikum "nach einem Ende ausschaut" (mit Applaus).

Tipp: nicht zu schnelle Bewegungen machen, dafür ausdrucksstarke.

Varianten:

*   Töne dazunehmen (der Anführer gibt Töne/Geräusche/Worte/etc. vor)
*   während der Übung Musik spielen lassen (inspiriert zu passenden Bewegungen)
*   bei großen Gruppen: entweder Vierergruppen bilden und diese nacheinander auftreten lassen, und der Rest spielt Publikum. Oder mit einer großen Gesamtformation mit allen Spielern beginnen und nach und nach während der Übung die Formation(en) halbieren, so dass getrennte kleinere Unterformationen entstehen (dadurch kommen auch diejenigen dran, die vorher im Inneren der Formation standen).

Sinn der Übung: Führen und Folgen, aufeinander achten (Gruppe), Erlernen des Grundprinzips für improvisierte Choreographie

Nebenbeobachtung: Bei dieser Übung ist es interessant, dass Frauen und Männer beim Führen oft unwillentlich in "geschlechtertypische" Bewegungen verfallen - auch wenn sie sich sonst überhaupt nicht mit derartigen Rollenklischees identifizieren.', 'https://improwiki.com/de/wiki/improtheater/choreographie-ubung', '2020-11-14 07:44:28.525', 363);
INSERT INTO public.part VALUES (364, 1, '2020-12-02 22:04:33.620071', '2020-12-02 22:04:33.620071', 'Summtore', 'Bei dieser Übung stehen sich die Spieler zu zweit gegenüber. Die überall im Raum verteilten Paare berühren sich mit den Händen ihrer erhobenen Arme. Jede/r summt nun kontinuierlich in einer beliebigen Tonhöhe. Ein weiterer Spieler - A - summt nicht. Er steht irgendwo im Raum und hat die Augen geschlossen. Seine Aufgabe ist es nun, auf das Summen zu hören und sich jeweils aufgrund des Summens so zu orientieren, dass es ihm gelingt, zwischen jeweils zwei der zusammenstehenden Spieler durchzugehen. Hat er deren "Tor" passiert, können diese beiden mit dem Summen aufhören, und Spieler A versucht nun das nächste "Tor" zu orten und zu durchschreiten. Das geht so lange, bis alle "Tore" gefunden wurden. Der Spielleiter oder ein anderer der noch nicht oder nicht mehr beteiligter Spieler achtet darauf, dass Spieler A nicht gegen die Wände oder sonstige Gegenstände läuft.

Mit Hilfe dieser Übung können Aufmerksamkeit, Vertrauen und Wahrnehmung trainiert werden, außerdem macht es _Spaß_ :-)', 'https://improwiki.com/de/vertrauensuebungen/summtore', '2020-11-14 07:44:28.521', 364);
INSERT INTO public.part VALUES (365, 1, '2020-12-02 22:04:33.780016', '2020-12-02 22:04:33.780016', 'Fallen lassen', '## Kleingruppe

Es werden drei Spieler gebraucht. Ein Spieler stellt sich zwischen die anderen beiden Spieler. Er schließt seine Augen, macht seinen Körper steif und beginnt sich langsam nach vorne fallen zu lassen. Der Spieler vor Ihm fängt Ihn auf und stößt ihn leicht zum anderen Spieler.

## Größere Gruppe

Die Spieler bilden einen engen Kreis. Ein Spieler stellt sich in die Mitte, schließt die Augen, macht seinen Körper steif und beginnt sich langsam in eine beliebige Richtung fallen zu lassen. Die Leute, in deren Richtung er fällt, fangen ihn rechtzeitig vorsichtig auf und schieben/schubsen ihn sanft (!) in eine andere Richtung. Dort wird er wieder aufgefangen usw.

Wichtig ist bei beiden Varianten, dass der Spieler in der Mitte seinen Körper steif lässt! Beide Spiele haben viel mit Vertrauen zu tun. Das darf man nicht enttäuschen!', 'https://improwiki.com/de/vertrauensuebungen/fallen-lassen', '2020-11-14 07:44:28.562', 365);
INSERT INTO public.part VALUES (366, 1, '2020-12-02 22:04:33.931493', '2020-12-02 22:04:33.931493', 'Menschliche Wand', 'Diese Übung ist für größere Gruppen - mindestens 10 - geeignet. Bis auf einen Spieler - A - stellen sich alle anderen eng nebeneinander längs einer Wand mit Blickrichtung auf A. Sie sollten einen stabilen Stand haben und ggf. vorsorglich die angewinkelten Arme mit den Handflächen nach vorne strecken. A steht einige Meter von der menschlichen Wand entfernt. A schließt die Augen. Seine Aufgabe ist es nun, mit den geschlossenen Augen auf die menschliche Wand zuzulaufen und darauf zu vertrauen, dass ihn die anderen abbremsen und stoppen. Jeder in seinem Tempo, ggf. auch ein zweites Mal. Manche stoppen kurz vor der „Wand“ ab, andere schreien/kreischen, während sie auf die „Wand“ zulaufen.  
Klar ist, dass zwischen A und menschlicher Wand keine Gegenstände stehen dürfen und dass ein völlig verquer laufender Spieler rechtzeitig gewarnt bzw. gestoppt werden muss.

Mit Hilfe dieser Übung kann Mut und Vertrauen trainiert werden - und Achtsamkeit für sich und die Anderen.', 'https://improwiki.com/de/vertrauensuebungen/die-menschliche-wand', '2020-11-14 07:44:28.613', 366);
INSERT INTO public.part VALUES (367, 1, '2020-12-02 22:04:34.06413', '2020-12-02 22:04:34.06413', 'Gehen mit Aggregatzuständen', 'Beim durch den Raum gehen werden Zahlen von -2 bis +2 angesagt die für unterschiedliche Aggregatzuständen stehen:

**0** Normale, angemessene Spannung im Körper

**+1** angespannt und etwas steif

**\-1** locker und weich in den Gelenken

**+2** sehr angespannt und steif, das Gehen fällt eher schwer

**\-2** sehr locker und elastisch in den Gelenken - beinahe wie besoffen

wildes Mischen der Aggregatzustände um Abwechslung zu schaffen. Kann gut mit Gehen mit Geschwindigkeitsstufen kombiniert werden.', 'https://improwiki.com/de/wiki/improtheater/gehen_mit_aggregatzustaenden', '2020-11-14 07:44:28.674', 367);
INSERT INTO public.part VALUES (368, 1, '2020-12-02 22:04:34.179451', '2020-12-02 22:04:34.179451', 'Gehen und Stehen', '## Grundsätzlich Stehen

Die Leute verteilen sich gleichmäßig im Raum und bleiben _stehen_. Der Spielleiter sagt nun eine Zahl und so viele Leute dürfen sich jetzt kreuz und quer durch den Raum bewegen, die anderen bleiben stehen. Nach einer gewissen Zeit sagt er eine andere Zahl, dementsprechend ändert sich die Zahl derjenigen, die sich durch den Raum bewegen. Die Schwierigkeit ist, dass sich ohne Absprache die korrekte Zahl der sich Bewegenden ergeben muss.

## Grundsätzlich Gehen

Die Spieler _gehen_ durch den Raum (siehe Raumlauf). Ein Spieler geht jedoch nicht, sondern steht. Die Regel lautet nun, dass immer genau ein Spieler stehen muss - egal wer. Ein Gehender kann also den Stehenden ablösen, indem er selbst stehen bleibt. Oder der Stehende kann von selbst loslaufen, und sofort muss ein (!) anderer dafür stehenbleiben. Man kann den Impuls also geben oder nehmen. Möglich ist auch, dass immer zwei oder drei gleichzeitig stehen müssen.

## Varianten

*   (zu grds. Gehen) statt zu stehen, muss immer einer (bzw. zwei, drei) _knien_ ("um das Protokoll am Hofe des Königs zu erfüllen"...) -> witziger
*   (zu grds. Gehen) einer _kniet_, einer _liegt_!
*   (zu grds. Stehen) Einer der Gehenden hat einen _Tick_, der von den Anderen übernommen wird - hier muss man sich also noch gegebenenfalls einig sein, wessen Tick man übernimmt.
*   (zu grds. Stehen) Alle stehen _nebeneinander_ in einer Reihe. Es darf sich immer nur einer zur gleichen Zeit nach vorne oder - rückwärts gehend - nach hinten bewegen. Zahl, Art und Geschwindigkeit der Schritte ist dabei egal. Die Bewegung darf nur "gerade" nach vorne und hinten erfolgen, dh. alle bleiben in ihrer "Bahn". Das dauert einige Minuten und ggfls. entwickelt sich ein ganz eigener Rhythmus oder eine spezifische Dynamik.

Diese Übung trainiert die Aufmerksamkeit und Rundumwahrnehmung, weil jeder ständig auf jeden achten muss. Konflikte (wenn z.B. zwei statt einem gleichzeitig stehenbleiben) müssen vermieden und gegebenenfalls schnell durch Blickverständigung oder körperliche Signale aufgelöst werden.

', 'https://improwiki.com/de/wiki/improtheater/gehen_und_stehen', '2020-11-14 07:44:28.748', 368);
INSERT INTO public.part VALUES (377, 1, '2020-12-02 22:04:35.53073', '2020-12-02 22:04:35.53073', 'Obstkreis', 'Die Spieler stehen im Kreis. Jeder denkt sich eine Emotion und eine Obstsorte aus. (Kann auch doppelt sein). Nun fängt einer an und geht zu einer der anderen Spieler im Kreis und sagt zu dieser Person das Obst in seiner Emotion, also z.B. wütend ''Pampelmuse!''. Die angesprochene Person geht wiederum zu einer einer anderen und sagt zu dieser das Obst in ihrer Emotion.

Schwieriger: Die Emotion während des Zugehens auf die andere Person verbunden mit einem Status mit einbringen

Siehe auch: Beschimpfung', 'https://improwiki.com/de/wiki/improtheater/obstkreis', '2020-11-14 07:44:29.069', 377);
INSERT INTO public.part VALUES (369, 1, '2020-12-02 22:04:34.416053', '2020-12-02 22:04:34.416053', 'Festgehalten bewegen, dann gehen', 'Eine ruhige Übung zur Körperwahrnehmung. Zunächst gehen alle durch den Raum. Dann finden sich die Spieler zu Paaren, die etwa gleich groß sind, zusammen.

In jedem Paar stellt sich einer hinter den anderen und hält ihn mit beiden Händen an der Hüfte fest, so dass sein Becken fest arretiert ist. Nun bewegt sich der festgehaltene Spieler oberhalb des Beckens in allen Bewegungsachsen, die ihm zur Verfügung stehen (links, rechts, vor, zurück, hinauf, hinunter, drehend, auch alle Bewegungsachsen von Kopf und Armen erkunden... wie weit komme ich in welche Richtung? Kann ich meinen Partner anschauen?). Nach etwa 2 Minuten läßt ihn der andere los und die zuvor festgehaltenen Spieler gehen wieder frei durch den Raum. Ist ihre Haltung/ihr Gang/ihr Körpergefühl im Vergleich zu vorher verändert?

Dann kommen die Spieler wieder zu ihrem Partner. Diesmal werden sie an der Taille festgehalten und dürfen sich nur unterhalb davon bewegen, der Oberkörper bleibt starr, der Kopf geradeaus und die Arme hängen unbewegt herab. Welche Bewegungsradien gibt es hier für die Beine? Nach 2 Minuten werden sie wieder losgelassen und gehen durch den Raum; wiederum sollen sie auf Veränderungen achten.

Als letztes werden die Spieler am Kopf festgehalten. Der andere Spieler legt dazu von hinten seine Hände an die Seiten ihres Kopfes und arretiert den Kopf in dieser Position. Nun dürfen sie alles unterhalb des Kopfes bewegen, in sämtlichen Dreh- und Richtungsachsen und Kombinationen. Wiederum nach 2 Minuten freilassen und die Veränderung auf den Gang beobachten!

Anschließend (oder zwischendurch) tauschen die Partner, damit alle in den Genuss dieser Übung kommen.', 'https://improwiki.com/de/wiki/improtheater/festgehalten_bewegen_dann_gehen', '2020-11-14 07:44:28.719', 369);
INSERT INTO public.part VALUES (370, 1, '2020-12-02 22:04:34.570967', '2020-12-02 22:04:34.570967', 'Wasserpflanze', 'Zwei Spieler sind beteiligt. Einer hat einen festen Stand und schließt die Augen. Der Spielleiter schildert ihm jetzt das Bild einer Wasserpflanze, die fest im Boden verwurzelt ist und langsam und nachhaltig auf Berührungen reagiert. Der betreffende Spieler darf sich aber auch (zusätzlich) etwas vorstellen, z.B. die Art des Wassers (Meer, Fluss), die Farbe und Form der Blüte, des Stengels usw. Wenn die "Wasserpflanze" das Bild verinnerlicht hat, fängt der andere Spieler an, die Wasserpflanze immer wieder an beliebigen und wechselnden Körperstellen anzutippen oder (sanft) anzustoßen. Die "Wasserpflanze" gibt nun sanft nach, der Spieler = Wasserpflanze bewegt sich so, wie er sich die Bewegung einer Wasserpflanze vorstellt, die so angestoßen/berührt wurde. Also langsames Bewegen in Richtung des Impulses, entweder des Körperteils, vielleicht sogar des ganzen Körpers, langsames Zurückschwingen, vielleicht nochmaliges geringes Hin- und Zurückpendeln. Die Tendenz ist immer nach oben (Auftrieb), dh. die Blüte (Kopf) strebt auch nach einer Berühung nach oben und in die Ruhe bis zur nächsten Berührung.', 'https://improwiki.com/de/wiki/improtheater/wasserpflanze', '2020-11-14 07:44:28.773', 370);
INSERT INTO public.part VALUES (371, 1, '2020-12-02 22:04:34.691616', '2020-12-02 22:04:34.691616', 'Lästerschwestern', 'Lästerschwestern trainiert die Konzentration und die Wahrnehmung.

Es werden zwei Gruppen (A und B) gebildet, die beide gleich groß sind. Gruppe A stellt sich Schulter an Schulter in einen kleinen Kreis in die Mitte des Raumes und flüstert so leise wie möglich irgendetwas, ab und zu nennen sie dabei Namen aus Gruppe B. Gruppe B muss in einem Abstand von einem Meter ständig im Kreis um Gruppe A gehen. Jeder Spieler der Gruppe B versucht nun, seinen Namen aus Gruppe A herauszuhören. Hört jemand aus Gruppe B seinen Namen, tippt er denjenigen aus Gruppe A an, der den Namen gesagt hat. Stimmt das, verlassen beide die Spielfläche. Stimmt das nicht, schüttelt derjenige aus Gruppe A den Kopf und wendet sich wieder zum Kreis A. Das geht so lange, bis alle Spieler die Spielfläche verlassen haben.

Das Ganze kann man leichter und schwerer machen, indem die Spieler aus Gruppe A lauter oder leiser werden.

Wichtig zu beachten ist, dass der Abstand von einem Meter eingehalten werden muss. Die Leute aus B kommen nämlich automatisch immer näher an Gruppe A.', 'https://improwiki.com/de/wiki/improtheater/laesterschwestern', '2020-11-14 07:44:28.818', 371);
INSERT INTO public.part VALUES (372, 1, '2020-12-02 22:04:34.928466', '2020-12-02 22:04:34.928466', 'Gefühlskreis 2', 'Die Spieler stehen im Kreis. Einer sagt zu seinem Nachbarn einen einfachen Satz in einer bestimmten Emotion und mit passender Gestik. Der Nachbar sagt den gleichen Satz in einer anderen Emotion mit passender Gestik.', 'https://improwiki.com/de/wiki/improtheater/gefuehlskreis_2', '2020-11-14 07:44:28.9', 372);
INSERT INTO public.part VALUES (373, 1, '2020-12-02 22:04:35.039438', '2020-12-02 22:04:35.039438', 'Liebe - Hass - Angst', 'Alle gehen in den Raumlauf.

Wenn der Trainer sagt "Liebe", sucht jeder sich sofort einen Partner mit dem er / sie "Liebe macht". Die Spieler dürfen alles machen, außer sich zu berühren (dass man mitunter gegen den anderen stößt ist unvermeidlich, aber man darf auf keinen Fall die Hände benutzen). Nach ein paar Sekunden (gefühlt etwa 1/2 Minute) wird aufgelöst und alle gehen wieder in den Raumlauf.

Dann sagt der Trainer "Hass" und alle müssen sich sofort wieder einen Partner suchen (einen anderen als bei "Liebe") und sich gegenseitig richtig hassen, auch wieder ohne Berührung des anderen. Dann wird aufgelöst und die Leute gehen in den Raumlauf.

Liebe und Hass werden ein paar Mal durchgespielt, dabei kommen immer wieder die gleichen Partner zusammen wie beim ersten Mal.

Anschließend sagt der Trainer "Angst" und jeder sucht sich einen dritten Partner (andere Person als bei Liebe und Hass), und man hat Angst voreinander.

Am Ende sagt der Trainer willkürlich "Liebe", "Hass", "Angst" in wechselnder Abfolge und lässt die Leute immer kürzer zusammen gehen (wie gesagt, immer wieder die gleichen Partner zu den gleichen Gefühlen), zum Schluss richtig schnell (man hat dann etwa 2 - 5 Sekunden für jedes Gefühl).', 'https://improwiki.com/de/wiki/improtheater/liebe_-_hass_-_angst', '2020-11-14 07:44:28.958', 373);
INSERT INTO public.part VALUES (374, 1, '2020-12-02 22:04:35.143508', '2020-12-02 22:04:35.143508', 'Kino', 'Drei Spieler sitzen in einer Reihe nebeneinander. Da sie sich im Kino befinden, schauen sie gespannt in eine Richtung auf eine Filmleinwand. Irgendwann zeigt sich bei allen Dreien das gleiche Gefühl. Dieses Gefühl steigert sich langsam bei ihnen im gleichen Maße, bis es extrem übersteigert ist. Bei diesem Spiel wird nicht geredet.

Neben der Darstellung von Gefühlen geht es auch um die Koordination und darum, sich irgendwann - ohne Worte – auf das gleiche Gefühl zu einigen.', 'https://improwiki.com/de/wiki/improtheater/kino', '2020-11-14 07:44:28.981', 374);
INSERT INTO public.part VALUES (375, 1, '2020-12-02 22:04:35.250208', '2020-12-02 22:04:35.250208', 'Gefühlskreis 3', 'Im Kreis wird aus einem x-beliebigen Buch vorgelesen, je emotionsloser der Text, desto besser kann man sich auf das Gefühl konzentrieren, z.B. eine Gebrauchsanweisung oder ein Sachbuch.  
Der Lesende bekommt ein Gefühl (Emotion) genannt, in welcher er lesen soll.  
(siehe auch Gefühlsliste)', 'https://improwiki.com/de/wiki/improtheater/gefuehlskreis_3', '2020-11-14 07:44:29.017', 375);
INSERT INTO public.part VALUES (376, 1, '2020-12-02 22:04:35.387997', '2020-12-02 22:04:35.387997', 'Gefühlskreis', 'Einer gibt ein (möglichst positives) Gefühl weiter. Der Nebenmann macht das Gefühl nach. Sobald beide das gleiche Gefühl haben, sagt Spieler A, welcher das Gefühl etabliert hat: "Das ist schüchtern" oder wenn es besser passt: "Ich bin schüchtern". Spieler B fragt: "Was ist das?" Spieler A sagt erneut: "Das ist schüchtern." Dann gibt Spieler B an Spieler C ein anderes Gefühl weiter.', 'https://improwiki.com/de/wiki/improtheater/gefuehlskreis', '2020-11-14 07:44:29.353', 376);
INSERT INTO public.part VALUES (378, 1, '2020-12-02 22:04:35.668186', '2020-12-02 22:04:35.668186', 'Lachparade', 'Es stehen vier oder fünf Spieler nebeneinander in einer Reihe und schauen geradeaus. Der erste in der Reihe - A - beginnt lauthals loszulachen. Nach einigen Sekunden des Lachens wendet er den Kopf und schaut weiter lachend die neben ihm stehende Person - B - an. Daraufhin dreht diese ihm das Gesicht zu, d.h. beide schauen sich nun an. Nun fängt auch B an zu lachen. Beide Lachenden schauen nun wieder nach vorn. Nach einigen Sekunden wendet B den Kopf und schaut die neben ihm stehende Person C an. C wendet daraufhin das Gesicht B zu und fängt nun auch an zu lachen. Beide schauen danach wieder nach vorn, d.h. A, B und C lachen. Diese Kette setzt sich fort bis zur letzten Person in der Reihe, d.h. irgendwann lachen alle fünf bzw. vier nach vorn.

Der nach vorn lachende A hört nun auf zu lachen und wendet sein ernstes Gesicht dem B zu. Daraufhin dreht B ihm das Gesicht zu, d.h. beide schauen sich nun an. Nun hört auch B auf zu lachen. A schaut nun NICHT wieder nach vorn, sondern blickt weiter ernst Richtung B. B wendet nun langsam seinen Kopf von A direkt nach C und schaut C an. C wendet daraufhin das Gesicht B zu und auch sein Lachen erstirbt. Diese Kette setzt sich fort bis zur letzten Person in der Reihe, d.h. irgendwann schauen alle vier oder fünf ernst zur Seite. Also wichtig: Im Unterschied zum ersten Durchgang blicken alle zur Seite!

Diese Übung ist anstrengend, befreiend und wach machend zugleich.  
Möglicherweise ist diese auch für Zuschauer eindrucksvolle Übung auch für''s öffentliche Aufführen geeignet.', 'https://improwiki.com/de/wiki/improtheater/lachparade', '2020-11-14 07:44:29.079', 378);
INSERT INTO public.part VALUES (379, 1, '2020-12-02 22:04:35.945184', '2020-12-02 22:04:35.945184', 'Gesichtsmaske abnehmen', 'Alle Teilnehmer stehen im Kreis und sehen sich an. Eine Person beginnt. Sie schneidet eine Grimasse und zeigt sie nur der Person, die links von ihr steht. Diese Person nimmt die Grimasse auf und zeigt sie allen in die Runde. Dann überlegt sich diese Person eine neue Grimasse und zeigt sie wieder nur der Person links von ihr. Diese nimmt die Grimasse auf und zeigt sie in die Runde. Das wiederholt sich, bis alle an der Reihe waren.

### Variation:

Die Aufgabe kann wiederholt werden und zusätzlich kann ein Geräusch zur Grimasse ergänzt werden.', 'https://improwiki.com/de/wiki/improtheater/gesichtsmaske_abnehmen', '2020-11-14 07:44:29.818', 379);
INSERT INTO public.part VALUES (380, 1, '2020-12-02 22:04:36.091347', '2020-12-02 22:04:36.091347', 'I have a Mango', 'Die Teilnehmer stehen im Kreis. Der Anleiter gibt den Text vor und die TN wiederholen diesen so laut wie sie können. I have a Mango - TN wiederholen - And my Body go relaxe relaxe relaxe (wird nach jedem Ausruf wiederholt, dabei geht der Körper in eine rhythmische Bewegung). I cut the Mango - TN wiederholen - And my Body go relaxe relaxe relaxe (wird nach jedem Ausruf wiederholt, dabei geht der Körper in eine rhythmische Bewegung). I eat the Mango - TN wiederholen - And my Body go relaxe relaxe relaxe (wird nach jedem Ausruf wiederholt, dabei geht der Körper in eine rhythmische Bewegung). I shit the Mango - TN wiederholen - And my Body go relaxe relaxe relaxe (wird nach jedem Ausruf wiederholt, dabei geht der Körper in eine rhythmische Bewegung). I clean the Mango - TN wiederholen - And my Body go relaxe relaxe relaxe (wird nach jedem Ausruf wiederholt, dabei geht der Körper in eine rhythmische Bewegung).

Gute Übung um Energie aufzubauen und diese auch wieder los zulassen.', 'https://improwiki.com/de/wiki/improtheater/i_have_a_mango', '2020-11-14 07:44:29.835', 380);
INSERT INTO public.part VALUES (381, 1, '2020-12-02 22:04:36.31954', '2020-12-02 22:04:36.31954', 'Gerüchte', 'Alle Spieler im Kreis. Ein schnelles Aufwärmspiel um das Machen von Angeboten, das Annehmen und Größermachen desselben zu üben.

Ein Spieler A fragt seinen Nachbarn Spieler B im Kreis, ob er schon das Gerücht über XYZ gehört hat: z.B.: "Hast du schon gehört, dass zwei Löwen aus dem Zoo ausgebrochen sind?"

Spieler B nimmt das nun auf, fügt etwas hinzu und macht das Gerücht größer: "Ja und ich habe auch gehört, dass man sie noch nicht wieder eingefangen hat und sie wohl mit der UBahn von Steakhaus zu Steakhaus fahren."

Danach kichern Spieler A und B zusammen kurz. Spieler B gibt dann ein neues Gerücht weiter an Spieler C im Kreis usw.

', 'https://improwiki.com/de/wiki/improtheater/geruechte', '2020-11-14 07:44:29.934', 381);
INSERT INTO public.part VALUES (382, 1, '2020-12-02 22:04:36.460093', '2020-12-02 22:04:36.460093', 'Whiskeymixer', 'Wichtig für dieses Aufwärmspiel sind die drei Wörter "Whiskeymixer", "Wachsmaske" und "Messwechsel".

Alle Spieler stellen sich im Kreis auf. Im Uhrzeigersinn wird das Wort "Whiskeymixer" möglichst schnell herum gegeben. Sagt ein Spieler "Messwechsel", wird die Richtung gewechselt und das Wort "Wachsmaske" wird entgegen dem Uhrzeigersinn weitergegeben. Das A und O des Spiels ist dabei Geschwindigkeit: Zögert ein Spieler oder fängt an zu lachen, muss er bzw. sie einmal um den Kreis laufen.

_Hinweise und Tipps_

*   Versprecher sind bei diesem Spiel explizit erlaubt!
*   Man kann auf das Kreislaufen verzichten - dann ist das Aufwärmspiel eher noch witziger.
*   Ob "Wasmaxe" oder "Wiximixi", irgendwann verspricht sich jeder mal und es ist jedes Mal wieder witzig!
*   Für Perfektionisten ein Spiel, das Grenzerfahrungen vermittelt ;-)
*   Ein schönes, schnelles Spiel um den Kopf freizubekommen.', 'https://improwiki.com/de/wiki/improtheater/whiskeymixer', '2020-11-14 07:44:29.886', 382);
INSERT INTO public.part VALUES (383, 1, '2020-12-02 22:04:36.589386', '2020-12-02 22:04:36.589386', 'Ausserirdischer Tiger Kuh', '### Synonym

Stein Schere Papier

### Beschreibung

Ein einfaches Aufwärmspiel, um die Gruppe intuitiv aufeinander einzugrooven und etwas über den Geist der Gruppe (Wohin "bewegt" sich die Gruppe?) zu lernen.

Das Spiel funktioniert ein wenig wie das bekannte "Stein, Schere, Papier" nur mit anderem Ziel und für mehrer als 2 Spieler.

Alle Spieler stellen sich im Kreis auf. Es gibt drei unterschiedliche "Figuren".

*   Der Ausserirdische: Die Finger beider Hände links und rechts auf den Kopf legen, wie kleine Antennen und dabei "Biep, biep" rufen.
*   Der Tiger: Mit der Hand eine Tigerkralle andeuten und wie ein Tiger "Roar" rufen.
*   Die Kuh: Beide Hände auf den Bauch legen und "Muh" rufen.

Ein Spieler oder der Spielleiter zählen dann von 1 bis 3 hoch. Bei "3!" mimt jeder Spieler eine dieser 3 Figuren.

Das Ziel ist es, dass alle Spieler exakt diesselbe Figur darstellen. Je mehr Spieler im Kreis sind, desto länger kann dies dauern.

### Variationen

*   Dieses Spiel kann natürlich auch mit anderen Figuren, Tieren oder Objekten gespielt werden (Dinosaurier, James Bond, Programmierer, Kühlschrank, Jukebox usw.).
*   Das Spielziel kann auch umgedreht werden und in jeder Runde scheiden dann die Spieler, welche die Figuren darstellen, die am seltensten vorkommen, raus.

', 'https://improwiki.com/de/wiki/improtheater/ausserirdischer_tiger_kuh', '2020-11-14 07:44:30.081', 383);
INSERT INTO public.part VALUES (384, 1, '2020-12-02 22:04:36.853404', '2020-12-02 22:04:36.853404', 'König von Siam', 'Beim König von Siam sitzt oder steht man im Kreis. Ein Spieler ist der König, die anderen werden reihum nummeriert, der Letzte hat allerdings keine Nummer, sondern ist "der Letzte".

Der König von Siam hat seine Krone verloren, nun ist die Frage wer sie gefunden hat, und so geht auch das Spiel:

**König**: Der König von Siam hat seine Krone verloren. Nummer x hat sie gefunden!  
**Nummer x**: Ich nicht, meine Herr!  
**König**: Wer dann, mein Herr?  
**Nummer x**: Nummer y, mein Herr!

Nun muss Nummer y sofort entrüstet verneinen:  
**Nummer y**: Ich nicht mein Herr!  
**Nummer x**: Wer dann, mein Herr?  
**Nummer y**: Nummer z, mein Herr!

Nun muss Nummer z ablehnen und so weiter.  
Wer sich vertut, zu langsam ist, sein Sprüchlein falsch sagt, der wird zum "Letzten", und alle anderen werden entsprechend neu nummeriert.

Wichtig ist bei dem Spiel, das Tempo hoch zu halten, und wenn der König entscheidet dass irgendwer zum Letzten wird, dann ist das so.', 'https://improwiki.com/de/wiki/improtheater/koenig_von_siam', '2020-11-14 07:44:29.948', 384);
INSERT INTO public.part VALUES (385, 1, '2020-12-02 22:04:36.968976', '2020-12-02 22:04:36.968976', 'Blinzeln-Platzwechsel', 'Einer (A) steht in der Mitte eines großen Kreises, den alle anderen Spieler bilden. Nun suchen die Spieler im Kreis Augenkontakt zueinander. Wenn sich zwei Augenpaare gefunden haben, blinzeln sich die beiden Spieler heimlich zu, um sich "geheim zu verständigen", rennen dann gleichzeitig los und tauschen so schnell es geht die Plätze. A muss versuchen, einem der Beiden den Platz wegzuschnappen.

Am Anfang tauschen oft nur Spieler den Platz, die nebeneinander stehen. Dann hat aber der Spieler in der Mitte keine Chance einen freien Platz zu ergattern. Die Spieler im Kreis müssen also den Einsatz erhöhen, um dem Spieler in der Mitte auch die Möglichkeit zu geben, einen freien Platz zu bekommen. Das Spiel wird gerade dann lustig, wenn man das Risiko immer weiter vergrößert und nicht mehr "auf Sicherheit" geht. Wie immer ist nicht das Gewinnen das Ziel, sondern das alle Beteiligten Spass an der Sache haben.

**Sinn:** Ein spaßiges Aufwärmspiel, das den Weitwinkelblick trainiert. Gut für neue Gruppen (und nebenbei auch für Kindergeburtstage geeignet).

Siehe auch die Übungen Blinzeln und Blinzelmörder.', 'https://improwiki.com/de/wiki/improtheater/blinzeln-platzwechsel', '2020-11-14 07:44:29.999', 385);
INSERT INTO public.part VALUES (386, 1, '2020-12-02 22:04:37.099677', '2020-12-02 22:04:37.099677', 'Fred Schneider', 'Dieses Aufwärmspiel hat seinen Namen von Fred Schneider, dem Sänger der Musikgruppe B52s. Fred Schneider hat in den Liedern eine sehr markante Art sein Sprechgesangseinlagen vorzutragen.

Jeder Spieler versucht dabei die Stimme von Fred Schneider so gut wie möglich zu imitieren.

Alle Spieler stellen sich dazu in den Kreis, schnipsen mit den Fingern in einem gemeinsamem Rhythmus und rufen zusammen: "Hey, Fred Schneider, was machst du grad?", dabei zeigt Spieler A auf einen Spieler B.

Spieler B versucht nun im Rhythmus zu bleiben und im Stile von Fred Schneider schnell etwas zu rappen, was er gerade tut. Das kann der größte Unsinn sein ("Ich sitz auf nem Elefanten und rasiere einen Affen" o.ä.) usw. Danach rufen alle wieder "Hey, Fred Schneider, was machst du grad?" und Spieler B zeigt auf Spieler C usw. usf.

Der Gruppenrhythmus und Spass steht im Vordergrund, je schneller es gespielt wird, desto absurder, aber auch lustiger werden oft die Fred Schneider Passagen, weil die Spieler keine Chance zum Nachdenken haben.

', 'https://improwiki.com/de/wiki/improtheater/fred_schneider', '2020-11-14 07:44:29.978', 386);
INSERT INTO public.part VALUES (387, 1, '2020-12-02 22:04:37.244227', '2020-12-02 22:04:37.244227', 'Ruf und Antwort', 'Alle Spieler bilden einen Kreis. Dann machen alle gemeinsam einen Wechselschritt mit Klatschen, der den Grundtakt vorgibt und die ganze Zeit über aufrecht erhalten wird.

 Füße:       links - ran - rechts - ran - usw.
 Klatschen:          \*              \*

Nun singt einer einen Takt in Gromolo\-"Afrikanisch" vor, und alle wiederholen das Gesungene im nächsten Takt. Beispiel:

*   Einer: "Umbwa Nugambe"
*   Alle: "Umbwa Nugambe"
*   Einer: "Salam bananu"
*   Alle: "Salam bananu"
*   Einer: "Ma O-Enu"
*   Alle: "Ma O-Enu"
*   Einer: "Wasam banai"
*   Alle: "Wasam banai"
*   usw.

Die Übung ist sehr simpel, bringt aber ein Super-Feeling! Wenn das gut klappt, geht die Rolle des Vorsängers reihum, jeder kommt einmal dran.

## Variante: 2 Takte

Es werden immer _zwei_ Takte vorgesungen und wiederholt. Beispiel:

*   Einer: "Sasam oe, wanau madamba"
*   Alle: "Sasam oe, wanau madamba"
*   Einer: "Uruduku tschu mi-gwom ba dah"
*   Alle: "Uruduku tschu mi-gwom ba dah"
*   usw.

## Variante: Irgendein Gromolo

Die Vorgabe/Assoziation "Afrikanisch" wird weggelassen, die Spieler singen einfach irgendein Gromolo, das sich auch nicht an irgendeinem existierenden Sprachklang orientieren muss.

## Weitere Variante

Das Gleiche mit sinnvollem Text. Wenn möglich, auch noch gereimt. Eine Vorgabe ("Titel des Liedes") ist hilfreich. Beispiel: Titel = "Die Katze im Kühlschrank":

*   Einer: "Ich hab eine kleine Miezekatze..."
*   Alle: "Ich hab eine kleine Miezekatze..."
*   Einer: "Die ist ziemlich schlau..."
*   Alle: "Die ist ziemlich schlau..."
*   usw.

Die Wiederholung gibt dem Nächsten ein bisschen Zeit, sich die nächste Zeile auszudenken. Das macht dieses Aufwärmspiel etwas einfacher als das Spiel Fortlaufende Geschichte ("Die").

', 'https://improwiki.com/de/wiki/improtheater/ruf_und_antwort', '2020-11-14 07:44:30.181', 387);
INSERT INTO public.part VALUES (388, 1, '2020-12-02 22:04:37.378061', '2020-12-02 22:04:37.378061', 'Johannes', 'Ein Aufwärmspiel zum Kennenlernen der Spielernamen und zum schnellen Reagieren. Die Spieler stellen sich im Kreis auf. Spieler A ist der "Johannes".

*   Spieler A schaut/blinzelt nun einen Spieler B im Kreis an.
*   Gleichzeitig ruft er den Namen eines anderen Spielers C
*   Spieler A (Johannes) geht nun auf den Platz von Spieler B
*   Spieler B geht auf den Platz von Spieler C
*   Spieler C geht auf den Platz von Spieler A
*   Spieler C ist nun der neue "Johannes" und beginnt von vorn.

Gut zum Kennenlernen. Nach und nach immer weiter die Geschwindigkeit erhöhen.

Ein ähnliches Spiel ist Blinzeln-Platzwechsel.', 'https://improwiki.com/de/wiki/improtheater/johannes', '2020-11-14 07:44:30.118', 388);
INSERT INTO public.part VALUES (389, 1, '2020-12-02 22:04:37.526037', '2020-12-02 22:04:37.526037', 'Scharade - falsch verstehen', 'Dieses Aufwärmspiel funktioniert wie das Gesellschaftsspiel Scharade.

Ein Spieler bekommt vom Spielleiter einen einfach zu erratenden Begriff, am besten ein zusammengesetztes Hauptwort oder einen Titel (eines bekannten Films, Buchs). Der Spielleiter nennt noch die Kategorie des Begriffs (z.B. Sprichwort).

Der Spieler versucht dann wie bei Scharade den Begriff vor der Gruppe nur pantomimisch darzustellen ohne Geräusche zu machen, Wörter in die Luft zu malen oder dabei zu sprechen. Da es sich um einen einfach zu erratenden Begriff handelt, versuchen die anderen Spieler nun absichtlich die pantomischen Bewegungen umzuinterpretieren und dabei so viel wie möglich absurde Ideen reinzurufen. Zum Beispiel die bekannte Körperhaltung aus dem Film "Titanic" interpretieren als "betrunkener Jesus" o.ä.

Ähnlich wie bei dem Spiel "Neue Wahl" ist es das Ziel zu behaupten und so viele wie mögliche Interpretationen der Pantomime reinzurufen, die nichts mit dem zu erratenden Begriff zu tun haben, aber doch irgendwie stimmen könnten. Die Runde ist beendet, wenn die Spieler keine neuen Begriffe mehr reinrufen oder wenn ein Spieler einen richtigen Begriff genannt hat.', 'https://improwiki.com/de/wiki/improtheater/scharade_-_falsch_verstehen', '2020-11-14 07:44:30.037', 389);
INSERT INTO public.part VALUES (390, 1, '2020-12-02 22:04:37.674409', '2020-12-02 22:04:37.674409', 'Zählen im Kreis mit Gesten', 'Ein Kreis wird gebildet.

Spieler 1 beginnt zu zählen indem er "1" ruft und klopft sich dabei entweder auf die linke oder rechte Schulter. Beim Klopfen auf die linke Schulter ist sein linker, bei Klopfen auf rechte Schulter sein rechter Nachbar dran, weiterzuzählen und "2" zu rufen. Auch dieser klopft sich dann wieder auf die Schulter usw.

Dieser Impuls geht solange im Kreis hin- und her, bis man bei dem Spieler ist, der die Zahl "7" ruft.

Dieser Spieler klopft sich nun nicht mehr auf die Schulter, sondern hält stattdessen entweder die rechte oder die linke Hand über den Kopf parallel zur Schulter. Die rechte Hand über dem Kopf zeigt nun an, dass sein linker Nachbar dran ist, die linke Hand über dem Kopf zeigt an, dass nun sein rechter Nachbar dran ist.

Dieser nächste Nachbar beginnt nun wieder erneut bei "1" und klopft sich wieder auf die rechte oder linke Schulter wie oben usw. usf..

## Variationen

*   Statt von 1 bis 7 kann auch von 1 bis 5 oder zu jeder anderen ungeraden Zahl gezählt werden. Dies kann auch abwechselnd erfolgen, um es noch schwieriger zu machen: Eine Runde 1 bis 5, dann eine Runde 1 bis 7 usw.
*   Das Rufen der Zahlen kann weggelassen werden; man klopft sich nur stumm auf die Schulter.
*   Wenn ein Spieler einen Fehler macht, muss er einmal um den Kreis herumlaufen und sich an anderer Stelle als vorher wieder in den Kreis einreihen.
*   Noch schwieriger: Zwei Impulse gleichzeitig herumgehen lassen.', 'https://improwiki.com/de/wiki/improtheater/zaehlen_im_kreis_mit_gesten', '2020-11-14 07:44:30.194', 390);
INSERT INTO public.part VALUES (391, 1, '2020-12-02 22:04:38.086652', '2020-12-02 22:04:38.086652', 'Kitty wants a corner', 'Mindestens acht Spieler stehen in einem großen Kreis, einer steht in der Mitte. Dieser stellt sich nun vor einen anderen Spieler und sagt: „Kitty wants a corner!“ Der wendet seinen Kopf dem linken oder rechten Nachbarn zu und sagt: „Go and see my neighbor“. Währenddessen versuchen zwei beliebige Spieler im Kreis Blickkontakt aufzunehmen und sich auf diese Weise darüber zu verständigen, die Plätze zu tauschen. Daraufhin tun sie das schnellstmöglich, Kitty muss versuchen, dies zu bemerken und vor dem anderen in eine der kurzzeitig freigewordenen Lücken stoßen. Gelingt ihm das, ist der andere die neue Kitty. Gelingt es ihm nicht, sagt Kitty zu einem anderen Spieler „Kitty wants a corner!“ usw.

(Ein Spiel von Viola Spolin)

', 'https://improwiki.com/de/wiki/improtheater/kitty_wants_a_corner', '2020-11-14 07:44:30.146', 391);
INSERT INTO public.part VALUES (392, 1, '2020-12-02 22:04:38.23265', '2020-12-02 22:04:38.23265', 'Samurai', 'Die Spieler stehen im Kreis.

Der Erste - A - hebt die ausgestreckten Arme über den Kopf, wo beide Hände ein fiktives Schwert halten. Dieses Schwert schlägt der Spieler mit einem lauten und kämpferischen "Ha!" auf den Schädel eines beliebigen anderen Spielers - B - (nicht unbedingt die unmittelbaren Nachbarn rechts/links).

Spieler B setzt sich nun gegen den Schlag von A zur Wehr, indem er sein fiktives, schräg nach oben gerichtet Schwert mit beiden Händen gehalten oberhalb seines Kopfes erhebt. Dabei ruft B laut "He!"

Die beiden Spieler links und rechts von B schlagen daraufhin mit ihrem fiktiven, von beiden Händen gefassten Schwert auf den Rumpf von B und schreien während des Schlags laut und kämpferisch "Hu!".

Der am Rumpf "getroffene" Spieler B schlägt nun wiederum mit einem lauten und kämpferischen "Hu!" in Richtung Kopf eines beliebigen anderen Spielers C.

Nun wiederholt sich das soeben Beschriebene in anderer Besetzung. C schlägt mit "Ha" auf den Kopf eines anderen Spielers D usw.

Je schneller und gleichmäßiger es läuft, desto besser.

Siehe auch Schneller Tod

', 'https://improwiki.com/de/wiki/improtheater/samurai', '2020-11-14 07:44:30.271', 392);
INSERT INTO public.part VALUES (393, 1, '2020-12-02 22:04:38.361072', '2020-12-02 22:04:38.361072', 'Geräuschball', 'Die Spieler stehen im Kreis. Sie werfen sich einen imaginären Ball zu. Bei jedem Wurf macht der Werfer ein Geräusch. Der Fänger wiederholt dieses Geräusch wenn er den Ball fängt. Dann gibt er den Ball mit einem neuen Geräusch an einen anderen Spieler weiter.

siehe auch: Ball-Metamorphose', 'https://improwiki.com/de/wiki/improtheater/geraeuschball', '2020-11-14 07:44:30.304', 393);
INSERT INTO public.part VALUES (394, 1, '2020-12-02 22:04:38.479063', '2020-12-02 22:04:38.479063', '1-2-3-4-5-6-7-8', 'Bei dieser Aufwärmübung werden einzeln nacheinander die jeweils schräg nach oben ausgestreckten Arme und die ausgestreckten, vom Boden etwas abgehobenen Beine (aus-) geschüttelt. In der ersten Runde acht Mal der rechte Arm (der linke Arm hängt runter, wir stehen mit beiden Füßen auf dem Boden), dann der linke Arm (der rechte Arm hängt runter, beide Füße stehen), das rechte Bein (beide Arme hängen runter) und schließlich acht Mal das linke Bein. Zu jedem Mal Schütteln wird parallel von allen laut gezählt, also z.B. in der ersten Runde vier Mal 1 bis 8. Mit jeder Schüttelrunde wird es 1 X weniger, dh. bei der nächsten Runde schütteln wir - laut zählend - jeden Arm, jedes Bein nur noch 7 Mal. Nach der 3. Runde, also ab dem 5-Mal-Schütteln bewegen wir uns und zählen wir schneller. Es geht runter bis eins.

Die Übung gibt Energie und macht locker!

Variante: Zusätzlich wird zwischen Arm- und Beinbewegungen noch das Becken seitwärts nach links und rechts bewegt, also z.B. beim "Achter" links/rechts einzeln abwechselnd jeweils vier Mal.

', 'https://improwiki.com/de/wiki/improtheater/1-2-3-4-5-6-7-8', '2020-11-14 07:44:30.272', 394);
INSERT INTO public.part VALUES (395, 1, '2020-12-02 22:04:38.612083', '2020-12-02 22:04:38.612083', 'Mr. Hit me', 'Alle Spieler stehen im Kreis. Ein Spieler läuft los und tippt einen anderen an der Schulter an. Der, der angetippt wurde, sagt den Namen eines 3. Spielers. Der genannte Spieler läuft dann los und tippt jemand anderes an, der wiederum einen Namen sagen muss (wenn der Spieler, der gelaufen ist, den anderen angetippt hat, stellt er sich neben ihn in den Kreis).

Beispiel: Spieler A läuft los und tippt Spieler B an. Spieler B sagt "Spieler C!". Spieler C muss daraufhin los laufen und einen anderen Spieler antippen.

Tipp: Dieses Spiel funktioniert sogar mit nur vier Spielern. Wenn man sich sehr eng im Kreis aufstellt, muss man nicht einmal los laufen sondern kann die anderen Spieler direkt antippen.', 'https://improwiki.com/de/wiki/improtheater/mr_hit_me', '2020-11-14 07:44:30.367', 395);
INSERT INTO public.part VALUES (396, 1, '2020-12-02 22:04:38.945521', '2020-12-02 22:04:38.945521', 'Gemeinsam zählen', 'Die Spieler stehen in einem engen Kreis mit geschlossenen Augen oder schauen alle auf den Boden. Nun wird in der Gruppe bis 21 hochgezählt. Spontan kann irgendein Spieler jeweils die nächsthöhere Zahl sagen, es ist keine Reihenfolge der Spieler vorgegeben. Es kann passieren, dass die Zahlen kurz hintereinander gesagt werden, es kann aber auch zu einer längeren Sprechpause kommen. Wenn zwei oder mehrere Spieler dieselbe Zahl gleichzeitig sagen, muss wieder bei eins begonnen werden.

Dieses Aufwärmspiel dient dazu, die Konzentration zu schärfen und ein Gespür für die Mitglieder in der Gruppe zu finden.

### Varianten

*   Statt mit Zahlen kann die Übung auch mit Buchstaben gespielt werden. Dann wird von A bis Z buchstabiert, oder so weit, bis jeder Mitspieler einen Buchstaben gesagt hat.

', 'https://improwiki.com/de/wiki/improtheater/gemeinsam_zaehlen', '2020-11-14 07:44:30.38', 396);
INSERT INTO public.part VALUES (397, 1, '2020-12-02 22:04:39.334035', '2020-12-02 22:04:39.334035', 'Bunny - Bunny', 'Ein rhythmisches Aufwärmspiel im Kreis, je mehr mitmachen, desto spaßiger. Die Untergrenze sind fünf Spielerinnen und Spieler.

Die Spielenden stehen im Kreis. Es gibt drei Elemente, 1. Den Grundrhythmus ("Hoh, Hoh, ..."), 2. Den Bunny-Bunny Impuls ("Bunny-Bunny, Bunny-Bunny ... ") und 3. Das Ruckitucki ("Ruckitucki - Ruckitucki ... ") jeweils links und rechts vom "Bunny-Bunny"

1\. Alle sagen während des ganzen Spiels rhythmisch "Hoh, Hoh, Hoh, Hoh...", federn dazu in den Knien und schwingen die Arme locker von außen nach innen vor dem Körper.

2\. Zusätzlich zu dem Grundrhythmus läuft ein Impuls kreuz und quer durch den Kreis, indem immer eine Person "Bunny-Bunny, Bunny-Bunny" sagt. Während eines "Hoh''s" des Grundrhythmus'' das erste "Bunny - Bunny", das ist der Annahme-Teil, und während des nächsten "Hoh''s" noch einmal "Bunny - Bunny", das ist der Abgabe-Teil. Während des Annahme-Teils macht der Spieler dazu eine Geste an eine beliebige Person gerichtet: Beide Mittel- und Zeigefinger werden den eigenen Augen zugewandt und dabei während jedes "Bunny"''s einmal eingeknickt. Der zweite Teil ist der Abgabe-Teil, wo das "Bunny Bunny", genau so gesagt wird, nur die Geste nicht zu den eigenen Augen sondern den Augen eines beliebigen anderen Mitspielers im Kreis zugewandt ist. Dieser macht bei den nächsten beiden "Hoh''s" genau dasselbe. Damit der Impuls eindeutig ist muss sehr deutlich weitergegeben werden, also in Schulterhöhe und mit Augenkontakt.

3\. Parallel zu dem Bunny-Bunny sagen jeweils die Nachbarn zur linken und zur rechten Seite der Person, bei der gerade das "Bunny-Bunny" ist, dieser Person zugewandt "Ruckitucki - Ruckitucki", und unterstützen dies durch Tanzbewegungen indem sie die angewinkelten Arme und die Schultern vor und zurück bewegen.

Das Spiel endet automatisch, weil der Grundrhythmus von allein schneller wird. Der Lustigste Teil ist wenn er irgendwann so schnell ist, dass es nicht mehr möglich ist so schnell den Bunny-Bunny Impuls weiterzugeben.', 'https://improwiki.com/de/wiki/improtheater/bunny_-_bunny', '2020-11-14 07:44:30.419', 397);
INSERT INTO public.part VALUES (411, 1, '2020-12-02 22:04:41.831319', '2020-12-02 22:04:41.831319', 'Körper verstecken', '**Beschreibung**

Eine hervorragende Übung, um sich kennenzulernen und zu lernen, sich gegenseitig zu vertrauen und zu berühren.

5 Freiwillige, 4 davon müssen die fünfte Person verstecken und dafür nichts als ihre Körper verwenden. Die anderen Schüler stehen um die Gruppe herum und versuchen Teile der Kleidung, der Schuhe oder der Haut des Fünften zu sehen.

Es ist für die anderen Schüler ein großer Spaß, zu beobachten und unbedeckte Teile der Person zu finden.

**Varianten** Versuch dieses Spiel mit immer weniger "Versteckern". Wenn die Aufgabe unmöglich wird, sag ihnen, dass sie Teile von Wänden verwenden können. Es ist natürlich an einfachsten eine Ecke zu verwenden, aber lass sie das selbst rausfinden.', 'https://improwiki.com/de/wiki/improtheater/koerper_verstecken', '2020-11-14 07:44:31.022', 411);
INSERT INTO public.part VALUES (398, 1, '2020-12-02 22:04:39.465505', '2020-12-02 22:04:39.465505', 'Genmanipulierte Maus', 'Die Spieler stehen zusammen mit dem Spielleiter im Kreis. Dieser setzt eine unsichtbare Maus auf den Boden, die nun unter den Füßen der Spieler hindurch rennt. Die Spieler müssen dazu in die Höhe springen, und zwar immer so, dass die Füße den Boden nicht gleichzeitig, sondern nacheinander verlassen. Zuerst geht derjenige Fuß hoch, von welcher Seite die Maus kommt. In derselben Reihenfolge, in der sie hochgingen, setzen die Füße auch wieder nacheinander auf dem Boden auf.

Zunächst rennt die Maus einfach im Kreis herum. Es sollte eine möglichst flüssige, wellenartige Bewegung entstehen.

Nach einigen Runden kann der Spielleiter einen Richtungswechsel vornehmen und die Maus in der Gegenrichtung laufen lassen.

Anschließend wird die Maus wieder eingefangen. Nun kommt eine "genmanipulierte" Maus zum Einsatz. Diese ist etwas gestört und rennt unter jedem Spieler dreimal durch. Jeder Spieler muss also dreimal in die Luft springen: das erste Mal kommt die Maus von links, das zweite Mal von rechts und das dritte Mal wieder von links.

 ----A ⇨
   ⇦ A--
   --A----B ⇨
        ⇦ B--
        --B----C ⇨
             ⇦ C--
             --C----D ⇨ usw.', 'https://improwiki.com/de/wiki/improtheater/genmanipulierte_maus', '2020-11-14 07:44:30.515', 398);
INSERT INTO public.part VALUES (399, 1, '2020-12-02 22:04:39.732637', '2020-12-02 22:04:39.732637', 'Barney', 'Ein kleines, nettes Aufwärmspiel zum Üben von Schnelligkeit und Reaktion. Alle Spieler stellen sich im Kreis auf.

Nun fangen alle Spieler an, langsam in einem gemeinsamen Rhythmus mit den Fingern zu schnipsen. Ein Spieler stellt sich in die Mitte des Kreises, das ist der "Barney". "Barney" ruft nun einen zufälligen Buchstaben des Alphabets, z.B. "B" und deutet dann auf einen Spieler A im Kreis. Dieser Spieler A bildet jetzt mit dem Buchstaben "**B**" einen Satz und zwar nach folgendem Schema:

*   ein Vorname oder Subjekt mit dem Anfangsbuchstaben "**B**"
*   ein Verb mit dem Anfangsbuchstaben "**b**"
*   ein Adjektiv mit dem Anfangsbuchstaben "**b**"
*   ein Objekt mit dem Anfangsbuchstaben "**B**" ... in
*   einem Land/Ort mit dem Anfangsbuchstaben "**B**".

Also beispielsweise könnte der Spieler A nun rufen:

*   "**B**eatrix **b**aut **b**eheizbare **B**assrollen in **B**ergen.".

Schafft der Spieler A dabei im Rhythmus des Fingerschnipsens zu bleiben, ruft "Barney" in der Mitte nun einen neuen zufälligen Buchstaben des Alphabets, z.B. "K" und zeigt dann auf einen neuen Spieler. Kommt der Spieler A jedoch aus dem Rhythmus oder macht einen Fehler, so geht er als der neue "Barney" in die Mitte und der alte "Barney" nimmt stattdessen seinen Platz im Kreis ein.

Der Gruppenrhythmus des Fingerschnippsens kann dann im Laufe des Spiels allmählich schneller werden.

### Variation

*   Dieses Spiel kann gleichzeitig noch mit Bewegungen verbunden werden, um auch körperliches Aufwärmen mit einzubauen, z.B. können alle Spieler einen Fuß kreisen lassen, oder mit den Armen rudern o.ä.
*   Dieses Spiel kann statt einem Spieler in der Mitte auch so gespielt werden. Es wird auf einen Spieler im Kreis gezeigt. Dieser sagt den Satz auf. Nachdem er den Satz gesagt hat, stellen zwei andere Spieler diesen Satz kurz bildlich/pantomimisch dar. Im nächsten Schritt kann der gesagte Satz dann auch als kurze Szene angespielt werden (3 kurze Sätze in der Szene).', 'https://improwiki.com/de/wiki/improtheater/barney', '2020-11-14 07:44:30.607', 399);
INSERT INTO public.part VALUES (400, 1, '2020-12-02 22:04:39.854435', '2020-12-02 22:04:39.854435', 'Schneller Tod', 'Eine (etwas makabre) Übung für zwischendurch, um durch Schnelligkeit die Müdigkeit der Spieler zu vertreiben:

Die Spieler stehen im Kreis. Nacheinander tritt jetzt jeder Spieler in die Mitte, schreit "Massaker!!" und tötet alle seine Mitspieler auf eine bestimmte Art, die er sich vorher ausgedacht hat (z.B. Handgrante, Augen ausstechen, Von oben nach unten mit einem Schwert spalten ...). Diese stellt er auf jedes der "Opfer" bezogen, gestisch ausdrucksvoll dar. Die "Getöteten" fallen jeweils theatralisch zu Boden.

Bekannt auch unter _Massaker_.

Siehe auch Samurai', 'https://improwiki.com/de/wiki/improtheater/schneller_tod', '2020-11-14 07:44:30.474', 400);
INSERT INTO public.part VALUES (401, 1, '2020-12-02 22:04:39.991257', '2020-12-02 22:04:39.991257', 'Zip Zoom Boing', 'Ein Spieler fängt an, in die Hände zu klatschen, dabei zeigt er entweder nach links oder nach rechts mit den Händen und dem Blick.

*   Klatschen nach Links wird mit einem "Zip" kommentiert.
*   Klatschen nach Rechts wird mit einem "Zoom" kommentiert.

Der "Angeklatschte" muss so schnell wie möglich, am besten noch \*im\* Klatschen des Nachbarns reagieren und den "Klatscher" weitergeben, Richtung beliebig. Das Klatschen darf also auch zurückgegeben werden und die Richtung ändern.

Anstatt nach links oder rechts kann das Klatschen auch mit einem "Boing" an einen beliebigen Spieler im Kreis weitergegeben werden. Ganz wichtig: Blickkontakt und deutliches Zeigen.

', 'https://improwiki.com/de/wiki/improtheater/zip_zoom_boing', '2020-11-14 07:44:30.532', 401);
INSERT INTO public.part VALUES (402, 1, '2020-12-02 22:04:40.23057', '2020-12-02 22:04:40.23057', 'Gordischer Knoten', 'Die Spieler bilden einen engen Kreis. Sie schließen alle die Augen und strecken dann die Arme nach vorn. Nun versucht jeder, mit seinen beiden Händen jeweils eine andere Hand zu ergreifen. Hat jeder zwei andere Hände gefunden, werden die Augen geöffnet. Die Hände dürfen während des ganzen Spiels nicht losgelassen werden. Aufgabe ist nun, den "Knoten" so zu "entwirren", dass sich am Ende ein normaler Kreis bildet. Hierzu müssen die Leute Verrenkungen machen, über oder unter die Armen von anderen steigen usw.

**Anmerkung**: es ist nicht garantiert, dass ein einziger großer Kreis möglich ist. Es können auch zwei oder mehrere Kreise sein, die ineinander verhakt oder getrennt voneinander sind. Das bestimmt der Zufall. Ziel ist jedenfalls immer, die Struktur weitest möglich zu entwirren.

Das Spiel ist gut für die Gruppenbildung (gemeinsames Ziel, an den Händen fassen, Körperkontakt).

## Variante

Jeder Spieler bekommt einen Holzstab von ca. 1 m Länge und hält ihn senkrecht mit der rechten Hand unten und dem rechten Zeigefinger unter dem Stabende. Dann legt jeder Spieler seinen linken Zeigefinger oben auf einen beliebigen anderen Stab. So entsteht eine geschlossene Kette aus Spielern und Stäben. Nun soll der Knoten entwirrt werden. Die Stäbe werden dabei nach Möglichkeit nur an ihren beiden Enden mit leichtem Fingerdruck (Gefühl!) gehalten. Beim Entwirren sind in dieser Variante somit zusätzlich die Impro-Prinzipien _Führen und Folgen_ und "auf den Partner achten" wichtig, damit kein Stab runterfällt.', 'https://improwiki.com/de/wiki/improtheater/gordischer_knoten', '2020-11-14 07:44:30.631', 402);
INSERT INTO public.part VALUES (403, 1, '2020-12-02 22:04:40.438499', '2020-12-02 22:04:40.438499', 'Namenssilben', 'Großartiges Kennenlernspiel das hilft, sich die Namen der Teilnehmer zu merken.

Die Teilnehmer bilden einen Kreis. Die erste Person sagt ihren Namen und macht zu jeder Silbe ihres Namens eine Geste.

**Beispie**l: Peter. Der Name Peter besteht aus zwei Silben (Pe-ter). Also macht Peter zu jeder Silbe eine Geste. Peter sagt "Pe" und stampft mit einem Bein auf den Boden. Peter sagt "ter" und fasst sich mit Daumen und Zeigefinger an seine Nase.

Jeder Spieler wiederholt dieses Muster mit seinem eigenen Namen. Haben alle Teilnehmer Gesten zu Ihren Silben gemacht, so beginnt die nächste Stufe.

Jetzt sagt ein Spieler den Namen einer anderen Person und macht die Gesten, die diese Person zum eigenen Namen vorher gemacht hat. Danach wiederholt diese Person den eigenen Namen und die eigenen Gesten. Danach ruft sie einen Namen einer anderen Person auf (und macht dabei natürlich die passenden Gesten)', 'https://improwiki.com/de/wiki/improtheater/namenssilben', '2020-11-14 07:44:30.733', 403);
INSERT INTO public.part VALUES (404, 1, '2020-12-02 22:04:40.542174', '2020-12-02 22:04:40.542174', 'Das Monster', 'Spieler A steht in der Mitte eines großen Kreises, den alle anderen Spieler bilden. A ist das Monster. Er bewegt sich mit nach vorne ausgestreckten Armen, schreckliche Geräusche ausstoßend und mit fürchterlicher Miene auf einen der Spieler - B - zu. Dieser schaut hilfesuchend einen anderen Spieler - C - an. Wenn C den Blick bemerkt, sagt er den Namen eines beliebigen weiteren Spielers - D - . Daraufhin wendet sich A von B ab und geht auf D zu. D sucht nun Blickkontakt mit einem anderen Spieler. Dieser bemerkt das und sagt den Namen eines Spielers usw. Das Monster (A) verwandelt sich dann in einen normalen Menschen, wenn es ihm gelingt, sein "Opfer" zu berühren, bevor der vom Opfer angeschaute Spieler einen Namen ausgesprochen hatte. In diesem Fall verwandelt sich das Opfer in das Monster.

**Sinn:** Ein spaßiges Aufwärmspiel, das die Aufmerksamkeit trainiert.', 'https://improwiki.com/de/wiki/improtheater/das_monster', '2020-11-14 07:44:30.635', 404);
INSERT INTO public.part VALUES (405, 1, '2020-12-02 22:04:40.669743', '2020-12-02 22:04:40.669743', 'Zwei Kreise', 'Ein simples Spiel um schnell und auf kurzweilige Weise die Namen der anderen zu lernen.

Zuerst wird _ein_ Kreis mit allen Teilnehmern gebildet. Dann sollte eine kurze Namensrunde geschehen, wobei jeder einmal seinen Namen nennt.  
Daraufhin fängt jemand an, indem er auf jemanden zeigt und gleichzeitig dessen Namen sagt. Diese Person wiederum zeigt auf jemand anders und sagt dessen Namen. Das geht dann immer so weiter.  
Wenn jedoch jemand stockt/zögert oder einen Fehler macht (falscher Name oder falsche Aussprache) muss die Person den Kreis verlassen und bildet nun neben dem ersten Kreis einen zweiten Kreis (vorerst allein).  
Sobald andere Personen Fehler machen müssen sie ebenfalls in den zweiten Kreis. Im zweiten Kreis gelten die gleichen Regeln wie im ersten. Wenn z.B. nur zwei Personen im zweiten Kreis sind zeigen sie die ganze Zeit abwechselnd aufeinander und sagen den Namen des Gegenüber. Wenn im zweiten Kreis ein Fehler gemacht wird bzw. jemand stockt/zögert muss er jedoch wieder in den ersten Kreis.  
So gibt es ein ständiges Pendeln zwischen den zwei Kreisen.

**Hinweise:**

*   Das Zeigen & Namensagen sollte möglichst zügig und eventuell in einem Rhythmus geschehen
*   So ist es natürlich wahrscheinlicher, dass es zu Stocken und Fehlern kommt, aber in diesem Spiel kann man nicht verlieren, weil man ja im anderen Kreis gleich wieder die Chance bekommt weiter die Namen zu üben :)', 'https://improwiki.com/de/wiki/improtheater/zwei_kreise', '2020-11-14 07:44:30.776', 405);
INSERT INTO public.part VALUES (406, 1, '2020-12-02 22:04:40.787011', '2020-12-02 22:04:40.787011', 'Die ulkige Ulrike', 'Dieses Spiel dient in neuen Gruppen dazu, die anderen, insbesondere ihre Namen kennenzulernen.

Die Spieler stehen im Kreis. Einer geht einen Schritt nach vorn, macht eine beliebige Bewegung und sagt einen Satz mit einem Eigenschaftswort und seinem Namen, wobei beide mindestens den gleichen Anfangsbuchstaben aufweisen müssen (Alliteration).

Also z.B. „Ich bin die ulkige Ulrike.“ – „Ich bin der kluge Klaus.“ – „Ich bin die vorsichtige Vanessa.“

Der Betreffende tritt wieder zurück. Danach treten die Anderen einen Schritt nach vorn, imitieren die Bewegung und wiederholen den Satz, allerdings beginnend mit: "du bist...."', 'https://improwiki.com/de/wiki/improtheater/die_ulkige_ulrike', '2020-11-14 07:44:30.811', 406);
INSERT INTO public.part VALUES (407, 1, '2020-12-02 22:04:40.913031', '2020-12-02 22:04:40.913031', 'Luftballons', 'Welche Gruppe hat die meiste Puste? Finde heraus, welche Gruppe die stärksten Lungen hat, indem Sie versucht, Ihren Ballon länger in der Luft zu halten als die anderen Teams. Die Gruppen dürfen nur Ihre eigene Luft nutzen.

**Empfohlenes Alter:**

"Luftballons" ist ein Spiel, das sich ideal für die Altersgruppe von 10 bis 25 Jahren eignet.

**Empfohlene Personenzahl:**

Dieses Spiel wird am besten mit Gruppen ab 8 Personen gespielt. Für kleine Gruppen ist es nicht ideal.

**Benötigtes Material**

Um dieses Spiel spielen zu können, benötigen Sie die folgenden Materialien:

\- Luftballons - Eine Stoppuhr für jedes Team - Optional: kleine Papier- oder Kunststofffächer

**Vorbereitungen:**

Wenn Sie möchten, können Sie jedes Team ihre Ballons aufblasen lassen, aber um das Spiel fairer zu machen, ist es besser, wenn Sie alle Ballons für jedes Team vorzeitig aufblasen. Achten Sie darauf, Ersatzballons aufzublasen, falls Ballons zerplatzen.

Teilen Sie die Gruppe in verschiedene Teams auf. Die Teams sollten idealerweise aus 3-5 Personen bestehen. Sie können dieses Spiel mit so vielen Teams spielen, wie Sie möchten. Geben Sie jedem Team einen Ballon sowie einen Papier- oder Plastikfan.

Wählen Sie aus jedem Team einen Spieler, der als Zeitnehmer fungiert. Geben Sie ihnen einen der Stoppuhren, um die Zeit aufzuzeichnen, die ihr Team den Ballon in der Luft hält, ohne ihn zu berühren. Weisen Sie die Spieler darauf hin, dass die Regeln des Spiels sind, dass Sie den Ballon nicht berühren dürfen, sobald er sich in der Luft befindet. Ballons müssen so lange wie möglich in der Luft gehalten werden, ohne berührt zu werden und ohne den Boden zu berühren. Jedes Mal, wenn ein Ballon von einem Teammitglied berührt wird oder den Boden berührt, muss die Zeit auf der Stoppuhr auf Null zurückgesetzt werden.

**Tipp:** Versuchen Sie, jedem Team einen anderen farbigen Ballon zu geben, damit es keine Verwechslungen geben kann, wenn sich die Teams an irgendeinem Punkt überschneiden.

**Das Spielende:** Das Team, das es schafft, den Ballon über die längste Zeit in Folge in der Luft zu halten, ist der Gewinner. Beobachten Sie die Teams während des Spiels, um sicherzustellen, dass sie die Zeit richtig nehmen.', 'https://improwiki.com/de/wiki/improtheater/luftballons', '2020-11-14 07:44:30.799', 407);
INSERT INTO public.part VALUES (408, 1, '2020-12-02 22:04:41.46508', '2020-12-02 22:04:41.46508', 'Vier Ecken', 'Ein gutes Kennenlernspiel für den Anfang des Schuljahres oder als witziger Weg, Leute besser miteinander bekannt zu machen. Vier Ecken (auch als Vier Quadrate bekannt) ist eine einfache Aktivität bei der Schüler durch den Gebrauch handgemalter Karten einander zeigen, wer sie sind. Dieser Eisbrecher ist für jede Altersgruppe geeignet und funktioniert mit kleinen und mittelgroßen Gruppen. Es dauert normalerweise ca. 15 Minuten, je nachdem wie viel Zeit man für das Gespräch über die Bilder zulassen will. Man braucht Papier und Schreibutensilien. Keine Sorge, künstlerische Fähigkeiten sind keine Voraussetzung für dieses Eisbrecherspiel - man soll einfach Spaß haben und einander ermutigen, kreativ zu sein während man illustriert wer man ist.

**Vorbereitung für Vier Ecken**

Jeder Spieler bekommt einen Stift und ein Blatt Papier. Jede Person teilt ihr Blatt in vier Quadrate, entweder durch zweimaliges Falten in der Mitte (längs und quer) oder schlicht indem man je eine Linie längs und eine quer sich in der Mitte kreuzen lässt. In jedem Viereck beschreibt jede Person sich in Form von Zeichnungen. Die vier Themen sollten im Voraus gewählt werden. Links oben könnte jeder zum Beispiel seine "Lieblingshobbys" zeichnen, rechts oben dagegen der "beste Urlaubsort der Welt" illustriert werden könnte und unten links etwas wie "Wenn du ein Tier wärest, welches wäre es dann?" und unten rechts so etwa "Was sind die wichtigsten Dinge in deinem Leben?". Man soll sich frei fühlen, so kreativ, hypothetisch oder tiefgehend zu sein, wie man will.

Fünf bis zehn Minuten reichen zum Zeichnen. Wenn alle fertig sind, sammeln sie sich und sprechen in der Gruppe über die Zeichnungen. Dieser Eisbrecher ist ein toller Weg für Schüler zu zeigen und zu erzählen, was sie einzigartig macht!', 'https://improwiki.com/de/wiki/improtheater/vier_ecken', '2020-11-14 07:44:30.894', 408);
INSERT INTO public.part VALUES (409, 1, '2020-12-02 22:04:41.581921', '2020-12-02 22:04:41.581921', 'Namen abklatschen', 'Ein weiteres Aufwärm und Namensspiel.

Die Spieler formen einen Kreis und strecken eine Hand zur Kreismitte aus. Ein Spieler Z stellt sich in die Mitte des Kreises.

Nun beginnt ein Spieler A aus dem Kreis den Namen eines anderen Spielers B aus dem Kreis zu rufen. Bevor dieser gerufene Spieler B nun wiederum einen Namen eines anderen Spielers rufen kann, versucht Spieler Z die Hand von Spieler B abzuklatschen.

*   Gelingt Spieler Z dies nicht, so versucht er es beim nächsten Spieler C, dessen Name gerufen wird.
*   Gelingt es Spieler Z, Spieler B abzuklatschen bevor dieser einen neuen Namen rufen kann, dann geht Spieler B in die Kreismitte, Spieler Z reiht sich in den Kreis ein und das Spiel beginnt erneut von vorne.', 'https://improwiki.com/de/wiki/improtheater/namen_abklatschen', '2020-11-14 07:44:30.897', 409);
INSERT INTO public.part VALUES (410, 1, '2020-12-02 22:04:41.717522', '2020-12-02 22:04:41.717522', 'Gruppenbildung', 'Der Spielleiter gibt vor, nach welchen Kriterien die Leute im Raum verteilt Gruppen bilden sollen.

Es sagt zum Beispiel:

Es stellen sich alle zusammen,

*   mit gleicher Augenfarbe,
*   die im gleichen Monat Geburtstag haben,
*   mit der gleichen Geschwisteranzahl,
*   gleicher T-Shirt-Farbe,
*   gleichem Sternzeichen,
*   die im gleichen Jahrzehnt Geburtstag haben,

usw.

Dieses Aufwärmspiel ist insbesondere für Gruppen geeignet, die sich noch nicht so gut kennen.

## Variante

Die Spieler bilden keine Gruppen, sondern reihen sich in einer Linie nach einem bestimmten Kriterium sortiert auf, zum Beispiel:

*   nach der Größe
*   nach dem Alter
*   nach der Haarfarbe (hell - dunkel)
*   jeder summt einen beliebigen Ton, dann Aufstellen nach der Tonhöhe

usw.', 'https://improwiki.com/de/wiki/improtheater/gruppenbildung', '2020-11-14 07:44:30.943', 410);
INSERT INTO public.part VALUES (413, 1, '2020-12-02 22:04:42.714282', '2020-12-02 22:04:42.714282', 'Bums', 'Ein Warmup zur Konzentration.

Alle Spieler stellen sich im Kreis auf. Im Kreis herum wird nun abwechselnd hochgezählt, Spieler 1 sagt "1", Spieler 2 sagt "2" usw.

Ist jedoch ein Spieler an der Reihe, dessen Zahl eine 7 enthält (wie 7, 17, 27 usw.) oder durch 7 teilbar ist (wie 7, 14, 21, 28 usw.) so sagt er statt der Zahl: "Bumms".

Macht der jeweilige Spieler einen Fehler, so beginnt die Gruppe mit dem Zählen von vorne.

Eine Reihe geht beispielsweise so: "1-2-3-4-5-6-Bumms-8-9-10-11-12-13-Bumms-15-16-Bumms-18-...usw.).

Das Spiel dann immer schneller spielen und die Spieler zu Fehlern zwingen.

### Variationen

*   Andere Zahlen als die 7 nehmen (5,6,9). Mehr Zahlen einführen (7 und 8!).
*   Statt "Bums" eine Geste machen (Um die eigene Achse drehen, Hand vor den Kopf halten, Hand auf die Schulter des Nachbarn legen, Hüpfen usw.), oder etwas anderes sagen (Namen von Prominenten, Farben, Tiernamen, den Namen des Spielers der zuletzt mit einem "Bums" an der Reihe war usw.), hier gibt es unzählige Möglichkeiten', 'https://improwiki.com/de/wiki/improtheater/bums', '2020-11-14 07:44:31.058', 413);
INSERT INTO public.part VALUES (414, 1, '2020-12-02 22:04:42.846628', '2020-12-02 22:04:42.846628', '3 X anders', 'Zwei Personen stehen sich gegenüber.

**Runde 1**

Sie zählen wechselseitig mehrfach "eins", "zwei", "drei". Automatisch wechselt so immer die "eins".

*   Spieler 1: "Eins"
*   Spieler 2: "Zwei"
*   Spieler 1: "Drei"
*   Spieler 2: "Eins"
*   Spieler 1: "Zwei"
*   Spieler 2: "Drei"
*   usw.

**Runde 2**

Die Eins wird ersetzt durch eine beliebige, danach immer gleiche Bewegung, z.B. auf die Brust schlagen. "Zwei" und "drei" werden weiterhin gesprochen.

*   Spieler 1: auf die Brust schlagen.
*   Spieler 2: "Zwei"
*   Spieler 1: "Drei"
*   Spieler 2: auf die Brust schlagen.
*   Spieler 1: "Zwei"
*   Spieler 2: "Drei"
*   usw.

Auch dies wird mehrfach wiederholt.

**Runde 3**

Auch die Zwei wird nun durch eine Handlung ersetzt, z.B. Zunge raustrecken.

*   Spieler 1: auf die Brust schlagen.
*   Spieler 2: Zunge rausstrecken
*   Spieler 1: "Drei"
*   Spieler 2: auf die Brust schlagen.
*   Spieler 1: Zunge rausstrecken
*   Spieler 2: "Drei"
*   usw.

Auch dies wird mehrfach wiederholt.

**Runde 4**

Nun wird auch die Drei durch eine Handlung ersetzt, z.B. Winken.

*   Spieler 1: auf die Brust schlagen.
*   Spieler 2: Zunge rausstrecken
*   Spieler 1: Winken
*   Spieler 2: auf die Brust schlagen.
*   Spieler 1: Zunge rausstrecken
*   Spieler 2: Winken
*   usw.

Auch dies wird mehrfach wiederholt.', 'https://improwiki.com/de/wiki/improtheater/3_x_anders', '2020-11-14 07:44:31.118', 414);
INSERT INTO public.part VALUES (415, 1, '2020-12-02 22:04:42.988927', '2020-12-02 22:04:42.988927', 'Klick - Peng', 'Bei diesem Aufwärmspiel, das ein wenig an "Schere, Stein, Papier" bzw. an das Spiel "Schnick, Schnack, Schnuck" erinnert, stehen sich zwei Spieler gegenüber. Sie bewegen sich immer im gleichen Takt, d.h. sie schlagen sich jeweils zur gleichen Zeit mit beiden Hände auf ihre Oberschenkel. Für den nächsten gemeinsamen und gleichzeitig gestarteten Handlungsimpuls stehen ihnen drei Möglichkeiten zur Auswahl: Sie können ihren **Revolver spannen** - Oberarme sind annähernd horizontal, die Unterarme sind nach oben ausgestreckt, Faust, nur der Zeigefinger ist gestreckt, "_klick_" wird gesagt ODER sie schützen sich, indem sie die **Arme verschränken** ODER sie **schießen**, indem die Arme angewinkelt sind, d.h. die Unterarme sind nach vorn gerichtet mit Faust, nur der Zeigefinger ist gestreckt und es wird "geschossen" und "_peng_" gesagt. Danach schlagen sich beide wieder zur gleichen Zeit auf die Oberschenkel. Dann wieder spannen, schießen oder schützen usw.

Je nach Kombination geschieht folgendes:

Wenn beide das Gleiche machen, passiert nichts in Bezug auf den Anderen: Die virtuellen Kugeln stoßen zusammen und sind damit wirkungslos oder beide haben die Arme verschränkt oder beide spannen ihren Revolver.

Wenn einer schießt, und der Andere spannt gerade den Revolver: Pech gehabt, er ist tot.

Einer schießt, der andere verschränkt seine Arme, er ist geschützt und nicht tot.

Wichtig: Bevor man schießen kann, muss man den Revolver zunächst gespannt haben.

Beispiel:

1\. Sekunde: Beide schlagen sich gleichzeitig auf die Schenkel  
2\. Sekunde: A und B spannen gleichzeitig  
3\. Sekunde: Beide schlagen sich gleichzeitig auf die Schenkel  
4\. Sekunde: A schießt, zur gleichen Zeit verschränkt B die Arme  
5\. Sekunde: Beide schlagen sich gleichzeitig auf die Schenkel  
6\. Sekunde: B spannt erneut, A verschränkt gleichzeitig die Arme  
7\. Sekunde: Beide schlagen sich gleichzeitig auf die Schenkel  
8\. Sekunde: A spannt, gleichzeitig schießt B, A ist tot.  
... neue Runde...', 'https://improwiki.com/de/wiki/improtheater/klick_-_peng', '2020-11-14 07:44:31.203', 415);
INSERT INTO public.part VALUES (416, 1, '2020-12-02 22:04:43.113604', '2020-12-02 22:04:43.113604', 'Schwert des Samurai', 'Zeitlupenübung, die Arme sind Schwerter mit giftiger Spitze. Wird ein Spieler woanders als an seinen Armen getroffen, so stirbt er einen langsamen, qualvollen Tod. Die Spieler müssen sich zunächst ruhig und langsam durch den Raum bewegen. Der Spielleiter eröffnet den Kampf: „Der Kampf möge beginnen!“ Bei jedem Berühren der „Schwerter“ müssen die Spieler ein lautes „Kling“ oder ein anderes Schwertgeräusch von sich geben. Wer sich zu schnell bewegt, wird disqualifiziert. Sieger ist der Samurai, der übrig bleibt.', 'https://improwiki.com/de/wiki/improtheater/schwert_des_samurai', '2020-11-14 07:44:31.159', 416);
INSERT INTO public.part VALUES (417, 1, '2020-12-02 22:04:43.474995', '2020-12-02 22:04:43.474995', 'Fangenspiele', 'Fangenspiele sind gut zu Beginn eines Übungsabends, oder auch für zwischendurch, um wieder wach zu werden. Einige Fangenspiele sind auch gute Mittel, um in neuen Gruppen die Angst vor Körperkontakt abzubauen.

## Inhaltsverzeichnis

*   Alphabetfangen
*   Namen rufen
*   Kettenfangen
*   Wer hat Angst vorm Schwarzen Mann
*   Fangen mit Hot Spot
*   Fangen mit Durchkrabbeln
*   Blinde Kuh
*   Möhrenziehen
*   Teufel und Liebende
*   Fangen mit ohne Boden
*   Fischer, Fischer, wie tief ist das Wasser?
*   Wäscheklammern klauen
*   Wäscheklammern verteilen
*   Wolf - Schaf - Steine

## Alphabetfangen

Dieses Spiel lehnt an das Fangenspielen an, welches wohl jeder kennt. Hierbei kann man sich vor dem Fänger schützen, indem man anfangs vor der Berührung ein Wort mit dem Anfangsbuchstaben "A" sagt. Bei jedem Fangversuch muss man ein neues Wort mit "A" am Anfang nennen. Zum Fänger werden diejenigen, denen kein Wort mehr einfällt, die ein bereits genanntes Wort wiederholen oder diejenigen, die berührt wurden, bevor sie ein Wort sagen konnten. Mit jedem neuen Fänger kommt der nächste Buchstabe im Alphabet dran, dh. beim zweiten Fänger können sich die anderen Spieler schützen, indem Sie ein Wort mit "B" am Anfang nennen. So geht es immer weiter bis man wieder bei A anlangt. Das Spiel wird etwas schwieriger, wenn man nur einsilbige Worte sagen darf.

## Namen rufen

Die Spieler können sich vor dem Gefangenwerden schützen, indem sie, wenn es brenzlig wird, den Namen eines anderen Spielers rufen. Dieser ist dann sofort der neue Fänger. (Lustig wird es, wenn man einen Spieler aufruft, der z.B. im Moment hinter dem aktuellen Fänger steht und diesen gleich wieder abklatschen kann...)

## Kettenfangen

Zwei Spieler fassen sich an die Hand und bilden ein Pärchen. Dieses Pärchen versucht nun zusammen andere Spieler abzuschlagen. Der Partner darf dabei nicht verloren gehen. Der abgeschlagene Spieler kommt nun als drittes Glied in die Kette. Nun müssen die drei Spieler zusammen neue Spieler fangen. Wird ein vierter Spieler gefangen, teilen sich die jetzt vier Spieler in zwei Pärchen auf. Der letzte Spieler, der nicht in einer Kette ist hat gewonnen.

## Wer hat Angst vorm Schwarzen Mann

→ Hauptartikel: Wer hat Angst vorm Schwarzen Mann?

Der Fänger ist der „Schwarze Mann“ und steht meist etwa 10 Meter von den anderen entfernt auf der gegenüberliegenden Seite eines Platzes oder Raumes. Wenn er ruft: „Wer hat Angst vorm Schwarzen Mann?“ wird mit „Niemand!“ geantwortet, dann auf „Und wenn er (aber) kommt?“ mit „Dann laufen/rennen wir (davon)!“ oder mit „Dann kommt er eben!“. Die beiden Parteien rennen nun entgegengesetzt auf die andere Seite bis zur rettenden Wand bzw. Begrenzung. Der Fänger versucht dabei soviele wie möglich durch Antippen zu fangen. Diese helfen im nächsten Durchlauf dem Schwarzen Mann beim Fangen. Der Letzte, der übrig bleibt, hat gewonnen und ist meist im nächsten Spiel der Fänger. Im Bestreben um politische Korrektheit wird das Spiel heute manchmal in Wer hat Angst vorm bösen/wilden/blöden Mann/weißen Hai usw. umbenannt.

## Fangen mit Hot Spot

Der Fänger versucht die anderen durch Berühren zu fangen. Ist ihm dies gelungen, fassen sich alle an die Körperstelle (Hot Spot) an, an der der Gefangene berührt wurde. Dort fassen sie sich solange an bis ein neuer Spieler gefangen wurde.

## Fangen mit Durchkrabbeln

Wurde man vom Fänger erwischt, bleibt man stehen und stellt sich mit gespreizten Beinen hin. Man wird erlöst sobald ein ''freier'' Spieler durch die Beine krabbelt. Während er das tut, darf er natürlich nicht gefangen werden. Stehen alle, hat der Fänger gewonnen. Sind viele Spieler da, wird ihm das wahrscheinlich nie gelingen. Dieses Spiel heißt auch "Katz und Maus".

## Blinde Kuh

Dem Fänger werden die Augen verbunden. Er muss nun versuchen einen der anderen Spieler zu Fangen. Ist Ihm dies gelungen, muss er durch Ertasten seines Opfers erraten, wen er gefangen hat. Liegt er falsch, bleibt er der Fänger.

## Möhrenziehen

Möhrenziehen ist ein Spiel, bei dem alle aktiv sind. Ein Spieler wird ausgewählt, dieser ist der Bauer. Die anderen legen sich in einem großen oder mehreren kleinen Kreisen hin und halten sich an den Händen fest; verboten ist es, sich einzuhaken und anderswo festzuklammern. Immer wenn eine Möhre rausgezogen wird, also wenn die anderen sie nicht mehr halten können, wird die Möhre zum Bauern. Das geht solange, bis nur noch eine "rauszuziehende" Möhre übrig ist.

## Teufel und Liebende

Der Fänger ist der "Teufel". Wen er fängt, der ist der neue Teufel. Spieler können sich vor der Teufelskralle in Sicherheit bringen, indem sie einen anderen Spieler umarmen (sie sind dann Liebende).

Variante: Die Liebenden müssen sich nicht nur umarmen, sondern dabei auch "Verheiratet!" rufen. Der Teufel kann sie mit "Geschieden!" wieder trennen.

## Fangen mit ohne Boden

Eine weitere Variante: Zwei Spieler können sich vor dem Fänger in Sicherheit bringen, indem einer der beiden nicht den Boden berührt. Hierzu dürfen keine Hilfsmittel wie Stühle oder Tische verwendet werden.

## Fischer, Fischer, wie tief ist das Wasser?

Auf diese Frage antwortet der „Fischer“ mit einer Zahl (3 m tief; 100 m tief etc.). Auf die darauf folgende Frage der Spielgruppe: „Wie kommen wir hinüber?“ gibt der Fänger eine Bewegungsart wie rückwärts laufen, krabbeln oder hüpfen an. Nun müssen sowohl er als auch die Teilnehmer versuchen mit dieser Bewegungsart die andere Seite zu erreichen, wobei der „Fischer“ versucht möglichst viele Fische zu fangen. Der letzte Fisch wird neuer Fischer.

## Wäscheklammern klauen

Ein Fangspiel bei dem man richtig ins Schwitzen kommen kann. An alle Spieler werden Wäscheklammern verteilt. Jeder bekommt die gleiche Anzahl. Diese Klammern befestigt man nun an seiner Kleidung. Ziel ist es nun, die Wäscheklammern der anderen Spieler zu klauen und auch an seine Kleidung zu klemmen. Wer nach einer bestimmten Zeit die meisten Klammern an seinen Klamotten hat, der hat gewonnen.

## Wäscheklammern verteilen

Wie in _Wäscheklammern klauen_, jetzt wird aber versucht nicht möglichst viele Klammern zu klauen, sondern die eigenen Klammern an die Kleidung der anderen Spieler zu stecken. Der Spieler, der als erster keine Klammern mehr hat, ist Sieger.

## Wolf - Schaf - Steine

Fangspiel zum Aufwärmen für große Gruppen:

Ein Spieler ist der Wolf, ein Spieler das Schaf, alle anderen Spieler stehen paarweise eingehakt ("Steine") verteilt im Raum. Der Wolf versucht das Schaf zu fangen (abklatschen). Ist das Schaf abgeklatscht worden, wird das Schaf zum Wolf und der Wolf zum Schaf.

Ein Schaf, kann auch die Flucht abbrechen, indem es an einem Spielerpaar (Stein) anhält und sich einhakt. Der zweite Spieler des Paares (an dem sich das Schaf nicht eingehakt wird), wird dann zum Wolf und der Wolf zum Schaf.

**Variante bei geringerer Spieleranzahl:** Je ein Spieler ist ein Stein. Die Steine hocken auf dem Boden. Das Schaf hockt sich auf die Stelle des Steins, wird zum Stein, der Stein selber zum Wolf und der Wolf zum Schaf.

Dieses Spiel ist auch als _Prinzessin - Drache - Türme_ bekannt.', 'https://improwiki.com/de/wiki/improtheater/fangenspiele', '2020-11-14 07:44:31.466', 417);
INSERT INTO public.part VALUES (418, 1, '2020-12-02 22:04:43.723924', '2020-12-02 22:04:43.723924', 'Au ja', 'Dieses Aufwärmspiel ist auch bekannt als _Au ja - Lasst uns ..._

Alle in der Gruppe laufen durch den Raum. Einer schlägt vor, irgendetwas zu tun,  
z.B. "Wir hüpfen auf einem Bein."  
Daraufhin rufen alle "Au ja" und hüpfen auf einem Bein, bis ein weiterer Spieler etwas anderes vorschlägt.  
Manchmal ergeben sich dadurch sogar ungewollt kleine Geschichten.  
  
**Beispiel:**  
"Wir hüpfen auf einem Bein"  
"Wir stolpern und fallen hin"  
"Wir halten uns das Knie"  
"Wir ruhen uns aus"  
...', 'https://improwiki.com/de/wiki/improtheater/au_ja', '2020-11-14 07:44:31.294', 418);
INSERT INTO public.part VALUES (419, 1, '2020-12-02 22:04:43.965174', '2020-12-02 22:04:43.965174', 'Haus - Bewohner - Flut', 'Dieses Aufwärmspiel ist nur für eine etwas größere Gruppe = 13 Personen und mehr geeignet.  
Es bilden sich jeweils Dreiergruppen. Jeweils zwei Personen stehen sich mit etwas Abstand gegenüber und bilden ein "Haus", indem sie ihre Arme schräg nach oben strecken und sich die Handflächen bzw. die Innenseiten der Finger berühren. In diesem Haus, zwischen den Armen, steht jeweils ein Bewohner. Die "Häuser" und "Bewohner" stehen kreuz und quer verteilt im Raum. Es bleibt eine externe Person übrig. Die ruft nun nach Belieben entweder "Haus", "Bewohner" oder "Flut".

*   Bei "Haus" bleiben (nur) die Bewohner auf ihrem Platz stehen, die anderen müssen sich bewegen und bilden am Platz eines anderen Bewohners ein neues Haus, gerne bzw. voraussichtlich in anderer Zweier-Kombination. Auch die bislang externe Person beteiligt sich. Der Langsamste bleibt übrig und ist nun die neue "externe Person".
*   Bei "Bewohner" bleiben die Häuser auf ihrem Platz stehen, die Bewohner müssen sich bewegen und suchen sich ein neues (anderes) Haus. Auch die bislang externe Person beteiligt sich. Der Langsamste bleibt übrig und ist nun die neue "externe Person".
*   Bei "Flut" bewegen sich alle und bilden neuer Häuser mit neuen Bewohnern. Auch die bislang externe Person beteiligt sich. Der Langsamste bleibt übrig und ist nun die neue "externe Person".', 'https://improwiki.com/de/wiki/improtheater/haus_-_bewohner_-_flut', '2020-11-14 07:44:31.386', 419);
INSERT INTO public.part VALUES (430, 1, '2020-12-02 22:04:46.133262', '2020-12-02 22:04:46.133262', 'Autowaschanlage', 'Die ist nicht so sehr ein Aufwärmspiel, sondern vielmehr ein Abwärmspiel um den Abschluß eines Trainigsabends zu genießen.

Die Spieler stehen sich in einer Reihe paarweise auf Armlänge gegenüber und bilden die Autowaschanlage. Nacheinander läuft jetzt jeder Spieler einmal langsam durch die Waschanlage.

Jedes Paar _putzt_ dann den gerade durchlaufenden Spieler. Das erste Paar macht z.B. eine Grobreinigung (durch Massage), das zweite Paar _wäscht_ (= streichelt) den Oberkörper, ... usw.', 'https://improwiki.com/de/wiki/improtheater/autowaschanlage', '2020-11-14 07:44:31.851', 430);
INSERT INTO public.part VALUES (420, 1, '2020-12-02 22:04:44.229788', '2020-12-02 22:04:44.229788', 'Wer hat Angst vorm Schwarzen Mann?', '"Wer hat Angst vorm Schwarzen Mann?" ist ein Laufspiel für mehrere Spieler, das sich besonders im Sportunterricht in Grundschulen sowie bei Jugendlagern einiger Beliebtheit erfreut.

Das Spiel ist für mehr als etwa acht Spieler gedacht. Nach oben sind nahezu keine Grenzen gesetzt. Als Spielfeld dient eine möglichst große, ebene Fläche im Freien mit einer Spielrandbegrenzung.

## Spielregeln

Der Fänger ist der „Schwarze Mann“ und steht meist etwa 15 Meter von den anderen entfernt auf der gegenüberliegenden Seite eines Platzes oder Raumes. Wenn er ruft: „Wer hat Angst vorm Schwarzen Mann?“ wird mit „Niemand!“ geantwortet, dann auf „Und wenn er (aber) kommt?“ mit „Dann laufen wir (davon)!/Dann reißen wir aus!“ Die beiden Parteien rennen nun entgegengesetzt auf die andere Seite bis zur rettenden Wand bzw. Begrenzung. Der Fänger versucht dabei so viele wie möglich durch Antippen zu fangen. Diese helfen im nächsten Durchlauf dem Schwarzen Mann beim Fangen. Der Letzte, der übrig bleibt, hat gewonnen und ist meist im nächsten Spiel der Fänger.

## Geschichte

Schwarzer Mann in einem Schweizer Kinderbuch von 1860 Das Kinderspiel lässt sich auf die Kinderschreckfigur des Schwarzen Mannes zurückführen, die im ganzen deutschsprachigen Gebiet bekannt ist. Je nach Region und Zeit verstand man darunter verschiedene Wesen: eine dunkle schattenhafte Gestalt oder einen Mann mit schwarzer Kleidung. Andere Behauptungen, das Spiel stamme von Bunkerarbeiten ab 1939 am Schwarzen Mann, einem Berg der Eifel, entbehren jeder Grundlage, da das Spiel deutlich älter ist.

Der Liederforscher Franz Magnus Böhme beschrieb hingegen 1897, dass der Begriff auf den „Schwarzen Tod“ (die Pest um 1348) zurückzuführen sei. Das würde auch das Spielprinzip folgerichtig erklären: Jeder, der von der Pest befallen wird (im Spiel: angetippt wird), ist selber Träger des „Schwarzen Todes“ und gehört zum Heer des „Schwarzen Mannes“, das die Seuche ausbreitet.', 'https://improwiki.com/de/wiki/improtheater/wer_hat_angst_vorm_schwarzen_mann', '2020-11-14 07:44:31.402', 420);
INSERT INTO public.part VALUES (421, 1, '2020-12-02 22:04:44.361525', '2020-12-02 22:04:44.361525', 'Sträflingslauf', 'Alle Spieler gehen hintereinander im Kreis, wie Sträflinge im Gefängnishof. Sie gehen in einem rhythmischen Gleichschritt. Wenn nun irgendeiner im Kreis in die Hände klatscht, wendet sich die ganze Gruppe gleichzeitig um und geht in der Gegenrichtung weiter.

Wenn das nach einigen Malen gut klappt, kann man den Richtungswechsel auch ohne Klatschen machen: irgendjemand dreht sich spontan um und alle folgen.

Eine eher ruhige Konzentrationsübung, die die Wahrnehmung und das Gruppengefühl stärkt.', 'https://improwiki.com/de/wiki/improtheater/straeflingslauf', '2020-11-14 07:44:31.489', 421);
INSERT INTO public.part VALUES (422, 1, '2020-12-02 22:04:44.598655', '2020-12-02 22:04:44.598655', 'Begrüßung', 'Die Spieler laufen durch den Raum. Wenn immer sich zwei Spieler begegnen, entwickeln sie gemeinsam ein Begrüßungsritual. Wenn sich die Spieler wieder begegnen, begrüßen sie sich auf die gemeinsam entwickelte Weise.

**Variante:** Ein Spielleiter kann auch verschiedene Vorgaben geben wie sich die Spieler begrüßen sollen. Zum Beispiel: begrüßt euch Misstrauisch, Traurig, Überglücklich oder Verliebt! Wenn der Spielleiter die Vorgaben immer schneller wiederholt, gibt es einen "Gefühls-Switch", die Spieler sind darauf konzentriert, den Partner zu dem jeweiligen Gefühl wiederzufinden, und das Gefühl ändert sich automatisch so schnell, wie der Spielleiter ruft. Er oder sie sollte mit maximaler Geschwindigkeit aufhören, zwei Gefühle pro Sekunde.', 'https://improwiki.com/de/wiki/improtheater/begruessung', '2020-11-14 07:44:31.502', 422);
INSERT INTO public.part VALUES (423, 1, '2020-12-02 22:04:44.722762', '2020-12-02 22:04:44.722762', 'Ritter, Pferde und Kavaliere', 'Die Teilnehmer bewegen sich auf dem Spielfeld und warten darauf, dass die Worte "Ritter", "Pferde" oder "Kavaliere" gerufen werden.

Wenn eines der Worte gerufen wird, müssen sie so schnell wie möglich einen Partner finden, mit dem sie die entsprechende Aktion durchführen können.

Ritter - Eine Person kniet sich auf ein Knie und die andere Person setzt sich auf ihren Oberschenkel.

Pferde - Eine Person kniet auf allen Vieren, während die andere auf ihrem Rücken sitzt.

Kavaliere - Spieler A streckt seine Arme aus; Spieler B springt in die Arme von Spieler A wie eine Dame in Not.', 'https://improwiki.com/de/wiki/improtheater/ritter_pferde_und_kavaliere', '2020-11-14 07:44:31.562', 423);
INSERT INTO public.part VALUES (424, 1, '2020-12-02 22:04:45.126614', '2020-12-02 22:04:45.126614', 'Online Adaption für einen Raumlauf', 'Jeder Teilnehmer überlegt sich ein Signal aus dem Bereich Mimik oder Gestik. Nun gehen alle aus der Kamera und es beginnt eine Person: 1) Auftritt 2) Signal kann kontinuierlich bzw. rhythmisch sein, kann nur manchmal kommen... 3) nacheinander kommen die restlichen Spieler und machen ihr Signal 4) , wenn alle da sind kommt es zum Signalrausch: alle dürfen sich umschauen und Signale von Anderen übernehmen... 5) wie 2. nur mit Abtritt: sobald der 1. geht , ist der Signalrausch beendet. Jeder macht nun wieder sein Signal... 6) der letzte Spieler verlässt die Kamera - Ende

Ziel des Spiels: Regelmäßiger Auf- und Abtritt der gesamten Gruppe; D. h. 15 Leute brauchen ca. 5 Minuten zum Auftritt, dann sollen auch nur 5 Minuten beim Abtritt gebraucht werden;

In der Live-Version mit Gruppe geht und erhöht gleichzeitig das Tempo und verlangsamt es dann wieder gleichzeitig mit der Vorgabe: Das höchste Tempo soll in x Minuten erreicht sein;', 'https://improwiki.com/de/wiki/improtheater/online_adaption_fuer_einen_raumlauf', '2020-11-14 07:44:31.574', 424);
INSERT INTO public.part VALUES (425, 1, '2020-12-02 22:04:45.361187', '2020-12-02 22:04:45.361187', 'Namen mit Körper schreiben', 'Man schreibt seinen Namen mit einem Körperteil in die Luft. Zunächst mit der Nase, dem Bauchnabel, dem Ellenbogen, dann vielleicht dem Ohr und dem Knie. Man kann seinen Namen von rechts nach links oder umgekehrt schreiben. Weiter kann versucht werden den Namen ''in den Raum'' hineinzuschreiben.', 'https://improwiki.com/de/wiki/improtheater/namen_mit_koerper_schreiben', '2020-11-14 07:44:31.656', 425);
INSERT INTO public.part VALUES (426, 1, '2020-12-02 22:04:45.496552', '2020-12-02 22:04:45.496552', 'Sympathie - Antipathie', 'Alle Spieler laufen durch den Raum. Jeder sucht sich einen aus, den er sympathisch findet und einen, den er nicht ausstehen kann.  
Dann gibt der Spielleiter ein Startzeichen und es gilt nun, so nah wie möglich an denjenigen zu kommen, welcher einem symphathisch ist und einen größtmöglichen Abstand zu dem zu finden, welcher einem nicht sympathisch ist.  
Das kann mitunter sehr hektisch zugehen, je mehr Spieler daran beteiligt sind.  
Im Idealfall ergibt sich eine große Traube, welche vor einigen anderen Spielern flieht, oder aber gar eine große lange Schlange, weil jeder vor dem anderen flieht und sich gleichzeitig an den Vormann hängt.

## Variante

Als Variante kann man sich auch einen Spieler A aussuchen, den man vor einem Spieler B beschützen will. Man beschützt den Spieler A, indem man versucht zwischen A und B zu kommen.

Ähnlich ist Dreieck', 'https://improwiki.com/de/wiki/improtheater/sympathie_-_antipathie', '2020-11-14 07:44:31.672', 426);
INSERT INTO public.part VALUES (427, 1, '2020-12-02 22:04:45.638445', '2020-12-02 22:04:45.638445', 'Follow the King', '**Follow the King** oder auch **Academy of silly walks** (in Anlehnung an Monty Python):

Die Spieler laufen in einer Kette durch den Raum. Der erste ist der ''König'', der den Weg vorgibt.

Der König kann nun besonders abstrus durch den Raum laufen, über imaginäre Gegenstände hüpfen, durch Tunnel kriechen, ... etc. und die nachfolgenden Mitspieler müssen genau diese Aktionen durchführen.

Es ist darauf zu achten, daß die imaginären Gegenstände an ihrem Punkt verbleiben, an dem sie der König etabliert hat, also nicht alle gleichzeitig z.B. über ein Hindernis springen, sondern nur an dem Ort, an dem es der König etabliert hat.

Nach einer gewissen Zeit verlässt der König den Anfang der Kette und schließt sich hinten an. Der nun Erste ist der neue König.

Die Übung kann fortgesetzt werden mit der Endlosschlange.', 'https://improwiki.com/de/wiki/improtheater/follow_the_king', '2020-11-14 07:44:31.779', 427);
INSERT INTO public.part VALUES (431, 1, '2020-12-02 22:04:47.291891', '2020-12-02 22:04:47.291891', 'Menschen, Hände, Füße', 'Wir bewegen uns kreuz uns quer durch den Raum. Der Spielleiter sagt "Stopp" und im Anschluss daran drei Zahlen. Die erste Zahl steht für die Zahl der Spieler, die sich - schnell - zusammenfinden müssen. Dieses Zusammenfinden drückt sich dadurch aus, dass diese Personen durch Körperkontakt - an welcher Stelle auch immer - miteinander verbunden sind. Die zweite Zahl steht für die Anzahl der Hände, mit der die Gruppe den Boden berühren darf, die dritte Zahl steht für die Anzahl der Füße, mit denen die Gruppe den Boden berühren darf. Mit anderen, weiteren Körperteilen darf der Boden nicht berührt werden.

Sagt also beispielsweise bei einer Übungsgruppe von 12 Leuten der Spielleiter "3-3-2", dann finden sich spontan 4 Gruppen mit jeweils 3 Spielern zusammen, diese dürfen sich -- pro Gruppe! -- jeweils mit drei Händen und zwei Füßen abstützen. Es entstehen so interessante, witzige "Standbilder". Wobei es schon ziemlich akrobatisch ist, wenn in einer Gruppe eine Person ohne Fußabstützen auskommen muss (wie im Beispiel). Daher sollte man grundsätzlich jeder Person einen Fuß "zubilligen".

Es können auch andere/weitere Körperteile in das Spiel einbezogen werden (Kopf, Po), dann muss dies aber ausdrücklich angesagt bzw. vereinbart werden.', 'https://improwiki.com/de/wiki/improtheater/menschen_haende_fuesse', '2020-11-14 07:44:31.853', 431);
INSERT INTO public.part VALUES (432, 1, '2020-12-02 22:04:47.440369', '2020-12-02 22:04:47.440369', 'Moleküle bilden', 'Alle laufen im Raum herum, bis der Spielleiter eine Zahl ruft. Schlagartig bilden sich Gruppen in der Anzahl der gerufenen Zahl. Diese umarmen sich und setzen sich hin. Wer übrig bleibt, scheidet aus. Verblüffend ist, dass es selbst dann hektisch zugeht, wenn die Bildung der Gruppen aufgeht.

**Beispiel:** 9 Spieler, es fällt die Zahl 3.

Das Spiel kenne ich von Manuel Wolff, der es wiederum von Arwe von der Gruppe Samvirkelaaget aus Norwegen kennt, welche es erfunden hat.', 'https://improwiki.com/de/wiki/improtheater/molekuele_bilden', '2020-11-14 07:44:31.96', 432);
INSERT INTO public.part VALUES (433, 1, '2020-12-02 22:04:47.565838', '2020-12-02 22:04:47.565838', 'Be my fan', 'Die Spieler gehen durch den Raum und spielen Schnick-Schnack-Schnuck mit der ersten Person, die sie dabei treffen. Wer verliert, wird Fan des Gewinners, d.h. er oder sie stellt sich hinter den anderen und feuert ihn an. Diese Teams gehen gemeinsam weiter, bis sie die nächste Person treffen. Die jeweils ersten spielen wieder Schnick-Schnack-Schnuck, die Verlierer werden wieder zu Fans der Gewinner und reihen sich hinten ein – so lang weiter spielen, bis alle eine große Reihe bilden.

**Zusatz:** Schnick-Schnack-Schnuck – auch Schere, Stein, Papier genannt: zwei Teilnehmer stehen sich gegen über und sagen „Schnick, Schnack, Schnuck“, während sie jeweils eine geballte Hand hin und her schwingen - bei „Schnuck“ zeig jeder mit seiner Hand symbolisch etwas an, darüber entscheidet sich, wer gewinnt.

**Mögliche Symbole:** Schere – Zeige- und Mittelfinger deuten die schneide Bewegung an. Papier – flache Hand Stein – geballte Faust, Knöchel zeigen nach oben

**Lösung:** Schere schneidet Papier = Schere gewinnt Papier wickelt Stein ein = Papier gewinnt Stein schleift Schere = Stein gewinnt', 'https://improwiki.com/de/wiki/improtheater/be_my_fan', '2020-11-14 07:44:31.881', 433);
INSERT INTO public.part VALUES (434, 1, '2020-12-02 22:04:48.831512', '2020-12-02 22:04:48.831512', 'Virus', 'Man benötigt für dieses Warm-up einen Ball, eine Plastikflasche oder Ähnliches. Der Spieler, der diesen Gegenstand hat, ist der Virus. Der Virus kann sich bewegen und andere Spieler infizieren indem er sie berührt. Danach reicht der Virus den Gegenstand weiter. Die schon infizierten Spieler jagen nun die gesunden Spieler, aber nur der Spieler mit dem Gegenstand kann gesunde Spieler infizieren. Die infizierten Spieler müssen den Gegenstand also schnell herumreichen, um gesunde Spieler infizieren zu können.', 'https://improwiki.com/de/wiki/improtheater/virus', '2020-11-14 07:44:31.961', 434);
INSERT INTO public.part VALUES (435, 1, '2020-12-02 22:04:49.800519', '2020-12-02 22:04:49.800519', 'Eisblock', 'Dies ist eine Aufwärmübung für den Beginn einer Probe.

Die Spieler stehen ganz steif und unbeweglich wie in einem Eisblock festgefroren. Doch so langsam kommt die Sonne und schmilzt den Eisblock von oben nach unten ab. Zunächst werden die Haare freigelegt und die Spieler können ein wenig die Kopfhaut bewegen. Das Eis schmilzt weiter, so langsam können die Augenbrauen und die Ohren bewegt werden. Schließlich sind auch die Augen frei und wir können auch mit den Augen rollen.

Das Eis schmilzt weiter, gibt die Nase frei, mit der wir rümpfen können, den Mund für die ersten Töne, den Unterkiefer und den Hals. Wir können schon den ganzen Kopf bewegen und das Eis schmilzt weiter Schulter, Oberarme, Oberkörper kommen langsam frei (Die Hände sind noch festgefroren). Weiter kommen Hüfte und Hände frei, dann die Knie, die wir bewegen können. Wenn schließlich auch die Füße frei sind, bewegen wir unseren Körper endlich in alle Richtungen, weil das Eis geschmolzen ist und gehen durch den Raum und verrenken uns in der Freude endlich dem Eis entkommen zu sein.

Die Übung kann fortgesetzt werden mit einem Raumlauf.

_Varianten:_

*   Die Übung kann auch rückwärts gespielt werden.
*   Während des "Schmelzens" nehmen wir einen bestimmten Charakter an, den wir schließlich während des abschließenden Raumlaufens vollends entfalltet haben.', 'https://improwiki.com/de/wiki/improtheater/eisblock', '2020-11-14 07:44:32.095', 435);
INSERT INTO public.part VALUES (436, 1, '2020-12-02 22:04:49.914701', '2020-12-02 22:04:49.914701', 'Handschlange', 'Bei diesem schnellen Aufwärmspiel ist die Aufgabe, dass sich die flachen Handflächen von maximal drei Spielern gleichzeitig berühren dürfen. Am Anfang streckt der erste seinen Arm aus, der zweite berührt mit einer beliebigen Hand die angebotene Handfläche und hält die Verbindung -allerdings ohne zuzufassen. Weiterhin bietet er die Handfläche seiner anderen Hand für einen beliebigen Dritten an. Dieser berührt nun die Hand und bietet dann auch seine andere Hand einer vierten Person an. In dem Moment, in dem die vierte Person den Kontakt hergestellt hat, muss die erste Verbindung getrennt werden. Dh. es dürfen sich immer nur drei Personen berühren. Das geht möglichst schnell immer so weiter. Die zu berührende Hand kann auch einmal ganz hoch oder ganz tief gehalten werden.

Siehe auch: Die Endlosschlange', 'https://improwiki.com/de/wiki/improtheater/handschlange', '2020-11-14 07:44:32.078', 436);
INSERT INTO public.part VALUES (437, 1, '2020-12-02 22:04:50.027261', '2020-12-02 22:04:50.027261', 'Die Endlosschlange', 'Je mehr Spieler, desto besser: Der erste Spieler bietet seine rechte oder linke Hand an. Ein Spieler kommt hinzu nimmt diese Hand und bietet wiederum seine frei Hand an. Ein weiterer Spieler kommt, nimmt diese freie Hand und bietet wiederum seine freie Hand den restlichen Spielern an. Irgenwann bilden alle Spieler zusammen eine Schlange. Dann löst sich der Anfangsspieler vom Kopf der Schlange und nimmt die Hand des letzten Spielers. Dann verläßt der Spieler, der jetzt am Kopf der Schlange steht, seine Position und huscht zum Ende der Schlange. Das Lösen und Verbinden muss ein fließender Prozess sein und darf nie abreißen. Es sollte natürlich noch erwähnt werden, dass die Spieler nicht einfach nur so dastehen und ihre Hand ausstrecken, sondern möglichst chaotische Verrenkungen machen und so versuchen, es den anderen schwer zu machen, ihre Hand zu erreichen.

Siehe auch: Handschlange', 'https://improwiki.com/de/wiki/improtheater/die_endlosschlange', '2020-11-14 07:44:32.082', 437);
INSERT INTO public.part VALUES (438, 1, '2020-12-02 22:04:50.165888', '2020-12-02 22:04:50.165888', 'Drill Sergeant', 'Dieses Aufwärmspiel funktioniert ähnlich wie Au ja und Simon says.

Alle stehen wie bei der Armee schnurstracks in einer Reihe. Der Gruppenleiter wählt eine Person als Drill Sergeant aus. Diese stellt sich dann vor die Truppe und gibt Kommandos. Dies können für die Armee typische Kommandos sein, wie "Stillgestanden!" oder "Rechts – um!", aber auch auch absurde Kommandos wie "Auf ein Bein stellen!", "Suppe kochen!" oder "Brief an die Mutter schreiben". Es ist immer gut sowohl konkrete, bewegungsreiche Kommandos als auch absurdere Kommandos, die freier interpretiert werden können, einzubauen.

Nach einigen Kommandos oder wenn ihm nichts mehr einfällt ernennt der Drill Sergeant jemand aus der Reihe als neuen Drill Seargant und schließt sich seinerseits der Truppe an. Das geht solange bis jeder einmal Drill Sergeant war.', 'https://improwiki.com/de/wiki/improtheater/drill_sergeant', '2020-11-14 07:44:32.175', 438);
INSERT INTO public.part VALUES (439, 1, '2020-12-02 22:04:50.299407', '2020-12-02 22:04:50.299407', 'Fingerschnipsen', 'Gruppe mit beiden Händen in Fingerschnipshaltung (Waffe!), sobald man in Augenkontakt mit jemandem tritt, muss mit den Fingern geschnipst werden. Die Person, die als letzte geschnipst hat ist tot und erstarrt. Sie kann nur durch die Person, die sie getötet hat, durch erneutes Fingerschnipsen wieder belebt werden. Das Spiel muss immer weitergehen, d.h. es müssen immer mindestens 2 Personen leben.', 'https://improwiki.com/de/wiki/improtheater/fingerschnipsen', '2020-11-14 07:44:32.165', 439);


--
-- TOC entry 2928 (class 0 OID 16443)
-- Dependencies: 204
-- Data for Name: part_tags_tag; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.part_tags_tag VALUES (1, 1);
INSERT INTO public.part_tags_tag VALUES (1, 2);
INSERT INTO public.part_tags_tag VALUES (2, 1);
INSERT INTO public.part_tags_tag VALUES (2, 2);
INSERT INTO public.part_tags_tag VALUES (3, 1);
INSERT INTO public.part_tags_tag VALUES (3, 2);
INSERT INTO public.part_tags_tag VALUES (4, 1);
INSERT INTO public.part_tags_tag VALUES (4, 2);
INSERT INTO public.part_tags_tag VALUES (5, 1);
INSERT INTO public.part_tags_tag VALUES (5, 3);
INSERT INTO public.part_tags_tag VALUES (6, 1);
INSERT INTO public.part_tags_tag VALUES (6, 4);
INSERT INTO public.part_tags_tag VALUES (6, 3);
INSERT INTO public.part_tags_tag VALUES (7, 1);
INSERT INTO public.part_tags_tag VALUES (7, 3);
INSERT INTO public.part_tags_tag VALUES (7, 4);
INSERT INTO public.part_tags_tag VALUES (8, 1);
INSERT INTO public.part_tags_tag VALUES (8, 5);
INSERT INTO public.part_tags_tag VALUES (8, 3);
INSERT INTO public.part_tags_tag VALUES (9, 1);
INSERT INTO public.part_tags_tag VALUES (9, 6);
INSERT INTO public.part_tags_tag VALUES (10, 1);
INSERT INTO public.part_tags_tag VALUES (10, 6);
INSERT INTO public.part_tags_tag VALUES (11, 1);
INSERT INTO public.part_tags_tag VALUES (11, 6);
INSERT INTO public.part_tags_tag VALUES (12, 1);
INSERT INTO public.part_tags_tag VALUES (12, 6);
INSERT INTO public.part_tags_tag VALUES (13, 1);
INSERT INTO public.part_tags_tag VALUES (13, 6);
INSERT INTO public.part_tags_tag VALUES (14, 1);
INSERT INTO public.part_tags_tag VALUES (14, 6);
INSERT INTO public.part_tags_tag VALUES (15, 1);
INSERT INTO public.part_tags_tag VALUES (15, 6);
INSERT INTO public.part_tags_tag VALUES (16, 1);
INSERT INTO public.part_tags_tag VALUES (16, 6);
INSERT INTO public.part_tags_tag VALUES (17, 1);
INSERT INTO public.part_tags_tag VALUES (17, 6);
INSERT INTO public.part_tags_tag VALUES (17, 7);
INSERT INTO public.part_tags_tag VALUES (18, 1);
INSERT INTO public.part_tags_tag VALUES (18, 6);
INSERT INTO public.part_tags_tag VALUES (19, 1);
INSERT INTO public.part_tags_tag VALUES (19, 8);
INSERT INTO public.part_tags_tag VALUES (19, 9);
INSERT INTO public.part_tags_tag VALUES (20, 1);
INSERT INTO public.part_tags_tag VALUES (20, 8);
INSERT INTO public.part_tags_tag VALUES (20, 10);
INSERT INTO public.part_tags_tag VALUES (21, 1);
INSERT INTO public.part_tags_tag VALUES (21, 8);
INSERT INTO public.part_tags_tag VALUES (21, 4);
INSERT INTO public.part_tags_tag VALUES (22, 1);
INSERT INTO public.part_tags_tag VALUES (22, 8);
INSERT INTO public.part_tags_tag VALUES (22, 4);
INSERT INTO public.part_tags_tag VALUES (23, 1);
INSERT INTO public.part_tags_tag VALUES (23, 8);
INSERT INTO public.part_tags_tag VALUES (24, 1);
INSERT INTO public.part_tags_tag VALUES (24, 8);
INSERT INTO public.part_tags_tag VALUES (24, 11);
INSERT INTO public.part_tags_tag VALUES (25, 1);
INSERT INTO public.part_tags_tag VALUES (25, 8);
INSERT INTO public.part_tags_tag VALUES (26, 1);
INSERT INTO public.part_tags_tag VALUES (26, 8);
INSERT INTO public.part_tags_tag VALUES (26, 10);
INSERT INTO public.part_tags_tag VALUES (27, 1);
INSERT INTO public.part_tags_tag VALUES (27, 8);
INSERT INTO public.part_tags_tag VALUES (28, 1);
INSERT INTO public.part_tags_tag VALUES (28, 8);
INSERT INTO public.part_tags_tag VALUES (28, 12);
INSERT INTO public.part_tags_tag VALUES (29, 1);
INSERT INTO public.part_tags_tag VALUES (29, 8);
INSERT INTO public.part_tags_tag VALUES (29, 13);
INSERT INTO public.part_tags_tag VALUES (30, 1);
INSERT INTO public.part_tags_tag VALUES (30, 8);
INSERT INTO public.part_tags_tag VALUES (30, 10);
INSERT INTO public.part_tags_tag VALUES (31, 1);
INSERT INTO public.part_tags_tag VALUES (31, 4);
INSERT INTO public.part_tags_tag VALUES (32, 1);
INSERT INTO public.part_tags_tag VALUES (32, 4);
INSERT INTO public.part_tags_tag VALUES (32, 14);
INSERT INTO public.part_tags_tag VALUES (33, 1);
INSERT INTO public.part_tags_tag VALUES (33, 4);
INSERT INTO public.part_tags_tag VALUES (33, 10);
INSERT INTO public.part_tags_tag VALUES (34, 1);
INSERT INTO public.part_tags_tag VALUES (34, 4);
INSERT INTO public.part_tags_tag VALUES (34, 3);
INSERT INTO public.part_tags_tag VALUES (34, 14);
INSERT INTO public.part_tags_tag VALUES (35, 1);
INSERT INTO public.part_tags_tag VALUES (35, 4);
INSERT INTO public.part_tags_tag VALUES (35, 15);
INSERT INTO public.part_tags_tag VALUES (36, 1);
INSERT INTO public.part_tags_tag VALUES (36, 4);
INSERT INTO public.part_tags_tag VALUES (37, 1);
INSERT INTO public.part_tags_tag VALUES (37, 4);
INSERT INTO public.part_tags_tag VALUES (38, 1);
INSERT INTO public.part_tags_tag VALUES (38, 4);
INSERT INTO public.part_tags_tag VALUES (38, 10);
INSERT INTO public.part_tags_tag VALUES (39, 1);
INSERT INTO public.part_tags_tag VALUES (39, 4);
INSERT INTO public.part_tags_tag VALUES (39, 11);
INSERT INTO public.part_tags_tag VALUES (39, 3);
INSERT INTO public.part_tags_tag VALUES (40, 1);
INSERT INTO public.part_tags_tag VALUES (40, 16);
INSERT INTO public.part_tags_tag VALUES (40, 4);
INSERT INTO public.part_tags_tag VALUES (41, 1);
INSERT INTO public.part_tags_tag VALUES (41, 4);
INSERT INTO public.part_tags_tag VALUES (41, 16);
INSERT INTO public.part_tags_tag VALUES (42, 1);
INSERT INTO public.part_tags_tag VALUES (42, 4);
INSERT INTO public.part_tags_tag VALUES (43, 1);
INSERT INTO public.part_tags_tag VALUES (43, 4);
INSERT INTO public.part_tags_tag VALUES (44, 1);
INSERT INTO public.part_tags_tag VALUES (44, 4);
INSERT INTO public.part_tags_tag VALUES (45, 1);
INSERT INTO public.part_tags_tag VALUES (45, 4);
INSERT INTO public.part_tags_tag VALUES (46, 1);
INSERT INTO public.part_tags_tag VALUES (46, 4);
INSERT INTO public.part_tags_tag VALUES (46, 10);
INSERT INTO public.part_tags_tag VALUES (47, 1);
INSERT INTO public.part_tags_tag VALUES (47, 4);
INSERT INTO public.part_tags_tag VALUES (47, 10);
INSERT INTO public.part_tags_tag VALUES (48, 1);
INSERT INTO public.part_tags_tag VALUES (48, 17);
INSERT INTO public.part_tags_tag VALUES (49, 1);
INSERT INTO public.part_tags_tag VALUES (49, 17);
INSERT INTO public.part_tags_tag VALUES (50, 1);
INSERT INTO public.part_tags_tag VALUES (50, 12);
INSERT INTO public.part_tags_tag VALUES (50, 17);
INSERT INTO public.part_tags_tag VALUES (51, 1);
INSERT INTO public.part_tags_tag VALUES (51, 12);
INSERT INTO public.part_tags_tag VALUES (52, 1);
INSERT INTO public.part_tags_tag VALUES (52, 18);
INSERT INTO public.part_tags_tag VALUES (52, 12);
INSERT INTO public.part_tags_tag VALUES (53, 1);
INSERT INTO public.part_tags_tag VALUES (53, 12);
INSERT INTO public.part_tags_tag VALUES (54, 1);
INSERT INTO public.part_tags_tag VALUES (54, 12);
INSERT INTO public.part_tags_tag VALUES (54, 14);
INSERT INTO public.part_tags_tag VALUES (55, 1);
INSERT INTO public.part_tags_tag VALUES (55, 12);
INSERT INTO public.part_tags_tag VALUES (55, 19);
INSERT INTO public.part_tags_tag VALUES (56, 1);
INSERT INTO public.part_tags_tag VALUES (56, 12);
INSERT INTO public.part_tags_tag VALUES (57, 1);
INSERT INTO public.part_tags_tag VALUES (57, 12);
INSERT INTO public.part_tags_tag VALUES (58, 1);
INSERT INTO public.part_tags_tag VALUES (58, 12);
INSERT INTO public.part_tags_tag VALUES (59, 1);
INSERT INTO public.part_tags_tag VALUES (59, 12);
INSERT INTO public.part_tags_tag VALUES (60, 1);
INSERT INTO public.part_tags_tag VALUES (60, 12);
INSERT INTO public.part_tags_tag VALUES (61, 1);
INSERT INTO public.part_tags_tag VALUES (61, 12);
INSERT INTO public.part_tags_tag VALUES (62, 1);
INSERT INTO public.part_tags_tag VALUES (62, 12);
INSERT INTO public.part_tags_tag VALUES (63, 1);
INSERT INTO public.part_tags_tag VALUES (63, 12);
INSERT INTO public.part_tags_tag VALUES (64, 1);
INSERT INTO public.part_tags_tag VALUES (64, 12);
INSERT INTO public.part_tags_tag VALUES (65, 1);
INSERT INTO public.part_tags_tag VALUES (65, 12);
INSERT INTO public.part_tags_tag VALUES (66, 1);
INSERT INTO public.part_tags_tag VALUES (66, 5);
INSERT INTO public.part_tags_tag VALUES (66, 12);
INSERT INTO public.part_tags_tag VALUES (66, 20);
INSERT INTO public.part_tags_tag VALUES (67, 1);
INSERT INTO public.part_tags_tag VALUES (67, 12);
INSERT INTO public.part_tags_tag VALUES (68, 1);
INSERT INTO public.part_tags_tag VALUES (68, 12);
INSERT INTO public.part_tags_tag VALUES (69, 1);
INSERT INTO public.part_tags_tag VALUES (69, 12);
INSERT INTO public.part_tags_tag VALUES (70, 1);
INSERT INTO public.part_tags_tag VALUES (70, 11);
INSERT INTO public.part_tags_tag VALUES (70, 12);
INSERT INTO public.part_tags_tag VALUES (71, 1);
INSERT INTO public.part_tags_tag VALUES (71, 12);
INSERT INTO public.part_tags_tag VALUES (72, 1);
INSERT INTO public.part_tags_tag VALUES (72, 12);
INSERT INTO public.part_tags_tag VALUES (73, 1);
INSERT INTO public.part_tags_tag VALUES (73, 12);
INSERT INTO public.part_tags_tag VALUES (73, 16);
INSERT INTO public.part_tags_tag VALUES (74, 1);
INSERT INTO public.part_tags_tag VALUES (74, 12);
INSERT INTO public.part_tags_tag VALUES (75, 1);
INSERT INTO public.part_tags_tag VALUES (75, 12);
INSERT INTO public.part_tags_tag VALUES (75, 19);
INSERT INTO public.part_tags_tag VALUES (76, 1);
INSERT INTO public.part_tags_tag VALUES (76, 12);
INSERT INTO public.part_tags_tag VALUES (77, 1);
INSERT INTO public.part_tags_tag VALUES (77, 12);
INSERT INTO public.part_tags_tag VALUES (78, 1);
INSERT INTO public.part_tags_tag VALUES (78, 21);
INSERT INTO public.part_tags_tag VALUES (79, 1);
INSERT INTO public.part_tags_tag VALUES (79, 21);
INSERT INTO public.part_tags_tag VALUES (80, 1);
INSERT INTO public.part_tags_tag VALUES (80, 21);
INSERT INTO public.part_tags_tag VALUES (81, 1);
INSERT INTO public.part_tags_tag VALUES (81, 21);
INSERT INTO public.part_tags_tag VALUES (82, 1);
INSERT INTO public.part_tags_tag VALUES (82, 21);
INSERT INTO public.part_tags_tag VALUES (83, 1);
INSERT INTO public.part_tags_tag VALUES (83, 21);
INSERT INTO public.part_tags_tag VALUES (84, 1);
INSERT INTO public.part_tags_tag VALUES (84, 5);
INSERT INTO public.part_tags_tag VALUES (84, 21);
INSERT INTO public.part_tags_tag VALUES (84, 20);
INSERT INTO public.part_tags_tag VALUES (85, 1);
INSERT INTO public.part_tags_tag VALUES (85, 12);
INSERT INTO public.part_tags_tag VALUES (85, 19);
INSERT INTO public.part_tags_tag VALUES (86, 1);
INSERT INTO public.part_tags_tag VALUES (86, 21);
INSERT INTO public.part_tags_tag VALUES (87, 1);
INSERT INTO public.part_tags_tag VALUES (87, 21);
INSERT INTO public.part_tags_tag VALUES (88, 1);
INSERT INTO public.part_tags_tag VALUES (88, 22);
INSERT INTO public.part_tags_tag VALUES (88, 9);
INSERT INTO public.part_tags_tag VALUES (88, 21);
INSERT INTO public.part_tags_tag VALUES (89, 1);
INSERT INTO public.part_tags_tag VALUES (89, 21);
INSERT INTO public.part_tags_tag VALUES (89, 23);
INSERT INTO public.part_tags_tag VALUES (90, 1);
INSERT INTO public.part_tags_tag VALUES (90, 24);
INSERT INTO public.part_tags_tag VALUES (90, 15);
INSERT INTO public.part_tags_tag VALUES (90, 11);
INSERT INTO public.part_tags_tag VALUES (91, 1);
INSERT INTO public.part_tags_tag VALUES (91, 21);
INSERT INTO public.part_tags_tag VALUES (92, 1);
INSERT INTO public.part_tags_tag VALUES (92, 11);
INSERT INTO public.part_tags_tag VALUES (93, 1);
INSERT INTO public.part_tags_tag VALUES (93, 11);
INSERT INTO public.part_tags_tag VALUES (94, 1);
INSERT INTO public.part_tags_tag VALUES (94, 11);
INSERT INTO public.part_tags_tag VALUES (95, 1);
INSERT INTO public.part_tags_tag VALUES (95, 25);
INSERT INTO public.part_tags_tag VALUES (95, 26);
INSERT INTO public.part_tags_tag VALUES (95, 28);
INSERT INTO public.part_tags_tag VALUES (95, 11);
INSERT INTO public.part_tags_tag VALUES (95, 31);
INSERT INTO public.part_tags_tag VALUES (95, 29);
INSERT INTO public.part_tags_tag VALUES (95, 30);
INSERT INTO public.part_tags_tag VALUES (95, 27);
INSERT INTO public.part_tags_tag VALUES (95, 32);
INSERT INTO public.part_tags_tag VALUES (95, 33);
INSERT INTO public.part_tags_tag VALUES (96, 1);
INSERT INTO public.part_tags_tag VALUES (96, 11);
INSERT INTO public.part_tags_tag VALUES (96, 3);
INSERT INTO public.part_tags_tag VALUES (96, 34);
INSERT INTO public.part_tags_tag VALUES (96, 35);
INSERT INTO public.part_tags_tag VALUES (97, 1);
INSERT INTO public.part_tags_tag VALUES (97, 11);
INSERT INTO public.part_tags_tag VALUES (98, 1);
INSERT INTO public.part_tags_tag VALUES (98, 11);
INSERT INTO public.part_tags_tag VALUES (98, 18);
INSERT INTO public.part_tags_tag VALUES (99, 1);
INSERT INTO public.part_tags_tag VALUES (99, 11);
INSERT INTO public.part_tags_tag VALUES (100, 1);
INSERT INTO public.part_tags_tag VALUES (100, 11);
INSERT INTO public.part_tags_tag VALUES (101, 1);
INSERT INTO public.part_tags_tag VALUES (101, 11);
INSERT INTO public.part_tags_tag VALUES (102, 1);
INSERT INTO public.part_tags_tag VALUES (102, 36);
INSERT INTO public.part_tags_tag VALUES (102, 11);
INSERT INTO public.part_tags_tag VALUES (102, 31);
INSERT INTO public.part_tags_tag VALUES (103, 1);
INSERT INTO public.part_tags_tag VALUES (103, 35);
INSERT INTO public.part_tags_tag VALUES (103, 34);
INSERT INTO public.part_tags_tag VALUES (103, 11);
INSERT INTO public.part_tags_tag VALUES (104, 1);
INSERT INTO public.part_tags_tag VALUES (104, 11);
INSERT INTO public.part_tags_tag VALUES (104, 3);
INSERT INTO public.part_tags_tag VALUES (104, 31);
INSERT INTO public.part_tags_tag VALUES (105, 1);
INSERT INTO public.part_tags_tag VALUES (105, 5);
INSERT INTO public.part_tags_tag VALUES (105, 11);
INSERT INTO public.part_tags_tag VALUES (105, 31);
INSERT INTO public.part_tags_tag VALUES (106, 1);
INSERT INTO public.part_tags_tag VALUES (106, 16);
INSERT INTO public.part_tags_tag VALUES (106, 11);
INSERT INTO public.part_tags_tag VALUES (106, 31);
INSERT INTO public.part_tags_tag VALUES (107, 1);
INSERT INTO public.part_tags_tag VALUES (107, 11);
INSERT INTO public.part_tags_tag VALUES (108, 1);
INSERT INTO public.part_tags_tag VALUES (108, 11);
INSERT INTO public.part_tags_tag VALUES (109, 1);
INSERT INTO public.part_tags_tag VALUES (109, 11);
INSERT INTO public.part_tags_tag VALUES (110, 1);
INSERT INTO public.part_tags_tag VALUES (110, 11);
INSERT INTO public.part_tags_tag VALUES (111, 1);
INSERT INTO public.part_tags_tag VALUES (111, 11);
INSERT INTO public.part_tags_tag VALUES (112, 1);
INSERT INTO public.part_tags_tag VALUES (112, 37);
INSERT INTO public.part_tags_tag VALUES (112, 20);
INSERT INTO public.part_tags_tag VALUES (113, 1);
INSERT INTO public.part_tags_tag VALUES (113, 20);
INSERT INTO public.part_tags_tag VALUES (114, 1);
INSERT INTO public.part_tags_tag VALUES (114, 20);
INSERT INTO public.part_tags_tag VALUES (114, 5);
INSERT INTO public.part_tags_tag VALUES (115, 1);
INSERT INTO public.part_tags_tag VALUES (115, 20);
INSERT INTO public.part_tags_tag VALUES (116, 1);
INSERT INTO public.part_tags_tag VALUES (116, 5);
INSERT INTO public.part_tags_tag VALUES (116, 20);
INSERT INTO public.part_tags_tag VALUES (117, 1);
INSERT INTO public.part_tags_tag VALUES (117, 20);
INSERT INTO public.part_tags_tag VALUES (118, 1);
INSERT INTO public.part_tags_tag VALUES (118, 20);
INSERT INTO public.part_tags_tag VALUES (119, 1);
INSERT INTO public.part_tags_tag VALUES (119, 20);
INSERT INTO public.part_tags_tag VALUES (119, 23);
INSERT INTO public.part_tags_tag VALUES (120, 1);
INSERT INTO public.part_tags_tag VALUES (120, 20);
INSERT INTO public.part_tags_tag VALUES (120, 5);
INSERT INTO public.part_tags_tag VALUES (121, 1);
INSERT INTO public.part_tags_tag VALUES (121, 20);
INSERT INTO public.part_tags_tag VALUES (121, 5);
INSERT INTO public.part_tags_tag VALUES (122, 1);
INSERT INTO public.part_tags_tag VALUES (122, 20);
INSERT INTO public.part_tags_tag VALUES (122, 10);
INSERT INTO public.part_tags_tag VALUES (123, 1);
INSERT INTO public.part_tags_tag VALUES (123, 9);
INSERT INTO public.part_tags_tag VALUES (123, 20);
INSERT INTO public.part_tags_tag VALUES (124, 1);
INSERT INTO public.part_tags_tag VALUES (124, 9);
INSERT INTO public.part_tags_tag VALUES (124, 14);
INSERT INTO public.part_tags_tag VALUES (125, 1);
INSERT INTO public.part_tags_tag VALUES (125, 9);
INSERT INTO public.part_tags_tag VALUES (125, 14);
INSERT INTO public.part_tags_tag VALUES (126, 1);
INSERT INTO public.part_tags_tag VALUES (126, 9);
INSERT INTO public.part_tags_tag VALUES (127, 1);
INSERT INTO public.part_tags_tag VALUES (127, 7);
INSERT INTO public.part_tags_tag VALUES (128, 1);
INSERT INTO public.part_tags_tag VALUES (128, 9);
INSERT INTO public.part_tags_tag VALUES (129, 1);
INSERT INTO public.part_tags_tag VALUES (129, 9);
INSERT INTO public.part_tags_tag VALUES (130, 1);
INSERT INTO public.part_tags_tag VALUES (130, 9);
INSERT INTO public.part_tags_tag VALUES (131, 1);
INSERT INTO public.part_tags_tag VALUES (131, 9);
INSERT INTO public.part_tags_tag VALUES (132, 1);
INSERT INTO public.part_tags_tag VALUES (132, 18);
INSERT INTO public.part_tags_tag VALUES (133, 1);
INSERT INTO public.part_tags_tag VALUES (133, 18);
INSERT INTO public.part_tags_tag VALUES (134, 1);
INSERT INTO public.part_tags_tag VALUES (134, 18);
INSERT INTO public.part_tags_tag VALUES (135, 1);
INSERT INTO public.part_tags_tag VALUES (135, 18);
INSERT INTO public.part_tags_tag VALUES (135, 7);
INSERT INTO public.part_tags_tag VALUES (136, 1);
INSERT INTO public.part_tags_tag VALUES (136, 18);
INSERT INTO public.part_tags_tag VALUES (137, 1);
INSERT INTO public.part_tags_tag VALUES (137, 18);
INSERT INTO public.part_tags_tag VALUES (137, 37);
INSERT INTO public.part_tags_tag VALUES (138, 1);
INSERT INTO public.part_tags_tag VALUES (138, 18);
INSERT INTO public.part_tags_tag VALUES (139, 1);
INSERT INTO public.part_tags_tag VALUES (139, 18);
INSERT INTO public.part_tags_tag VALUES (140, 1);
INSERT INTO public.part_tags_tag VALUES (140, 10);
INSERT INTO public.part_tags_tag VALUES (140, 14);
INSERT INTO public.part_tags_tag VALUES (141, 1);
INSERT INTO public.part_tags_tag VALUES (141, 14);
INSERT INTO public.part_tags_tag VALUES (142, 1);
INSERT INTO public.part_tags_tag VALUES (142, 14);
INSERT INTO public.part_tags_tag VALUES (143, 1);
INSERT INTO public.part_tags_tag VALUES (143, 14);
INSERT INTO public.part_tags_tag VALUES (143, 16);
INSERT INTO public.part_tags_tag VALUES (144, 1);
INSERT INTO public.part_tags_tag VALUES (144, 14);
INSERT INTO public.part_tags_tag VALUES (144, 32);
INSERT INTO public.part_tags_tag VALUES (145, 1);
INSERT INTO public.part_tags_tag VALUES (145, 7);
INSERT INTO public.part_tags_tag VALUES (145, 14);
INSERT INTO public.part_tags_tag VALUES (146, 1);
INSERT INTO public.part_tags_tag VALUES (146, 14);
INSERT INTO public.part_tags_tag VALUES (147, 1);
INSERT INTO public.part_tags_tag VALUES (147, 14);
INSERT INTO public.part_tags_tag VALUES (148, 1);
INSERT INTO public.part_tags_tag VALUES (148, 14);
INSERT INTO public.part_tags_tag VALUES (149, 1);
INSERT INTO public.part_tags_tag VALUES (149, 10);
INSERT INTO public.part_tags_tag VALUES (149, 14);
INSERT INTO public.part_tags_tag VALUES (150, 1);
INSERT INTO public.part_tags_tag VALUES (150, 14);
INSERT INTO public.part_tags_tag VALUES (151, 1);
INSERT INTO public.part_tags_tag VALUES (151, 14);
INSERT INTO public.part_tags_tag VALUES (152, 1);
INSERT INTO public.part_tags_tag VALUES (152, 7);
INSERT INTO public.part_tags_tag VALUES (153, 1);
INSERT INTO public.part_tags_tag VALUES (153, 7);
INSERT INTO public.part_tags_tag VALUES (153, 15);
INSERT INTO public.part_tags_tag VALUES (154, 1);
INSERT INTO public.part_tags_tag VALUES (154, 7);
INSERT INTO public.part_tags_tag VALUES (155, 1);
INSERT INTO public.part_tags_tag VALUES (155, 7);
INSERT INTO public.part_tags_tag VALUES (156, 1);
INSERT INTO public.part_tags_tag VALUES (156, 7);
INSERT INTO public.part_tags_tag VALUES (156, 5);
INSERT INTO public.part_tags_tag VALUES (157, 1);
INSERT INTO public.part_tags_tag VALUES (157, 7);
INSERT INTO public.part_tags_tag VALUES (157, 38);
INSERT INTO public.part_tags_tag VALUES (158, 1);
INSERT INTO public.part_tags_tag VALUES (158, 7);
INSERT INTO public.part_tags_tag VALUES (158, 16);
INSERT INTO public.part_tags_tag VALUES (159, 1);
INSERT INTO public.part_tags_tag VALUES (159, 7);
INSERT INTO public.part_tags_tag VALUES (160, 1);
INSERT INTO public.part_tags_tag VALUES (160, 7);
INSERT INTO public.part_tags_tag VALUES (160, 37);
INSERT INTO public.part_tags_tag VALUES (161, 1);
INSERT INTO public.part_tags_tag VALUES (161, 7);
INSERT INTO public.part_tags_tag VALUES (162, 1);
INSERT INTO public.part_tags_tag VALUES (162, 7);
INSERT INTO public.part_tags_tag VALUES (163, 1);
INSERT INTO public.part_tags_tag VALUES (163, 7);
INSERT INTO public.part_tags_tag VALUES (164, 1);
INSERT INTO public.part_tags_tag VALUES (164, 7);
INSERT INTO public.part_tags_tag VALUES (165, 1);
INSERT INTO public.part_tags_tag VALUES (165, 7);
INSERT INTO public.part_tags_tag VALUES (165, 38);
INSERT INTO public.part_tags_tag VALUES (166, 1);
INSERT INTO public.part_tags_tag VALUES (166, 7);
INSERT INTO public.part_tags_tag VALUES (167, 1);
INSERT INTO public.part_tags_tag VALUES (167, 7);
INSERT INTO public.part_tags_tag VALUES (168, 1);
INSERT INTO public.part_tags_tag VALUES (168, 7);
INSERT INTO public.part_tags_tag VALUES (169, 1);
INSERT INTO public.part_tags_tag VALUES (169, 37);
INSERT INTO public.part_tags_tag VALUES (169, 16);
INSERT INTO public.part_tags_tag VALUES (170, 1);
INSERT INTO public.part_tags_tag VALUES (170, 37);
INSERT INTO public.part_tags_tag VALUES (170, 16);
INSERT INTO public.part_tags_tag VALUES (171, 1);
INSERT INTO public.part_tags_tag VALUES (171, 16);
INSERT INTO public.part_tags_tag VALUES (171, 39);
INSERT INTO public.part_tags_tag VALUES (172, 1);
INSERT INTO public.part_tags_tag VALUES (172, 16);
INSERT INTO public.part_tags_tag VALUES (173, 1);
INSERT INTO public.part_tags_tag VALUES (173, 40);
INSERT INTO public.part_tags_tag VALUES (174, 1);
INSERT INTO public.part_tags_tag VALUES (174, 40);
INSERT INTO public.part_tags_tag VALUES (175, 1);
INSERT INTO public.part_tags_tag VALUES (175, 10);
INSERT INTO public.part_tags_tag VALUES (175, 22);
INSERT INTO public.part_tags_tag VALUES (176, 1);
INSERT INTO public.part_tags_tag VALUES (176, 10);
INSERT INTO public.part_tags_tag VALUES (177, 1);
INSERT INTO public.part_tags_tag VALUES (177, 10);
INSERT INTO public.part_tags_tag VALUES (178, 1);
INSERT INTO public.part_tags_tag VALUES (178, 10);
INSERT INTO public.part_tags_tag VALUES (179, 1);
INSERT INTO public.part_tags_tag VALUES (179, 10);
INSERT INTO public.part_tags_tag VALUES (180, 1);
INSERT INTO public.part_tags_tag VALUES (180, 10);
INSERT INTO public.part_tags_tag VALUES (181, 1);
INSERT INTO public.part_tags_tag VALUES (181, 10);
INSERT INTO public.part_tags_tag VALUES (182, 1);
INSERT INTO public.part_tags_tag VALUES (182, 10);
INSERT INTO public.part_tags_tag VALUES (183, 1);
INSERT INTO public.part_tags_tag VALUES (183, 10);
INSERT INTO public.part_tags_tag VALUES (184, 1);
INSERT INTO public.part_tags_tag VALUES (184, 10);
INSERT INTO public.part_tags_tag VALUES (185, 1);
INSERT INTO public.part_tags_tag VALUES (185, 10);
INSERT INTO public.part_tags_tag VALUES (186, 1);
INSERT INTO public.part_tags_tag VALUES (186, 10);
INSERT INTO public.part_tags_tag VALUES (187, 1);
INSERT INTO public.part_tags_tag VALUES (187, 10);
INSERT INTO public.part_tags_tag VALUES (188, 1);
INSERT INTO public.part_tags_tag VALUES (188, 22);
INSERT INTO public.part_tags_tag VALUES (189, 1);
INSERT INTO public.part_tags_tag VALUES (189, 22);
INSERT INTO public.part_tags_tag VALUES (190, 1);
INSERT INTO public.part_tags_tag VALUES (190, 22);
INSERT INTO public.part_tags_tag VALUES (191, 1);
INSERT INTO public.part_tags_tag VALUES (191, 22);
INSERT INTO public.part_tags_tag VALUES (192, 1);
INSERT INTO public.part_tags_tag VALUES (192, 22);
INSERT INTO public.part_tags_tag VALUES (193, 1);
INSERT INTO public.part_tags_tag VALUES (193, 5);
INSERT INTO public.part_tags_tag VALUES (194, 1);
INSERT INTO public.part_tags_tag VALUES (194, 38);
INSERT INTO public.part_tags_tag VALUES (194, 19);
INSERT INTO public.part_tags_tag VALUES (194, 41);
INSERT INTO public.part_tags_tag VALUES (195, 1);
INSERT INTO public.part_tags_tag VALUES (195, 38);
INSERT INTO public.part_tags_tag VALUES (196, 1);
INSERT INTO public.part_tags_tag VALUES (196, 31);
INSERT INTO public.part_tags_tag VALUES (197, 42);
INSERT INTO public.part_tags_tag VALUES (197, 43);
INSERT INTO public.part_tags_tag VALUES (197, 13);
INSERT INTO public.part_tags_tag VALUES (198, 42);
INSERT INTO public.part_tags_tag VALUES (198, 43);
INSERT INTO public.part_tags_tag VALUES (198, 15);
INSERT INTO public.part_tags_tag VALUES (199, 42);
INSERT INTO public.part_tags_tag VALUES (199, 43);
INSERT INTO public.part_tags_tag VALUES (199, 31);
INSERT INTO public.part_tags_tag VALUES (200, 42);
INSERT INTO public.part_tags_tag VALUES (200, 43);
INSERT INTO public.part_tags_tag VALUES (200, 15);
INSERT INTO public.part_tags_tag VALUES (201, 42);
INSERT INTO public.part_tags_tag VALUES (201, 36);
INSERT INTO public.part_tags_tag VALUES (201, 15);
INSERT INTO public.part_tags_tag VALUES (201, 43);
INSERT INTO public.part_tags_tag VALUES (202, 42);
INSERT INTO public.part_tags_tag VALUES (202, 40);
INSERT INTO public.part_tags_tag VALUES (202, 15);
INSERT INTO public.part_tags_tag VALUES (202, 43);
INSERT INTO public.part_tags_tag VALUES (203, 42);
INSERT INTO public.part_tags_tag VALUES (203, 43);
INSERT INTO public.part_tags_tag VALUES (204, 42);
INSERT INTO public.part_tags_tag VALUES (204, 31);
INSERT INTO public.part_tags_tag VALUES (204, 43);
INSERT INTO public.part_tags_tag VALUES (205, 42);
INSERT INTO public.part_tags_tag VALUES (205, 36);
INSERT INTO public.part_tags_tag VALUES (205, 38);
INSERT INTO public.part_tags_tag VALUES (205, 43);
INSERT INTO public.part_tags_tag VALUES (206, 42);
INSERT INTO public.part_tags_tag VALUES (206, 43);
INSERT INTO public.part_tags_tag VALUES (207, 42);
INSERT INTO public.part_tags_tag VALUES (207, 43);
INSERT INTO public.part_tags_tag VALUES (207, 31);
INSERT INTO public.part_tags_tag VALUES (208, 42);
INSERT INTO public.part_tags_tag VALUES (208, 43);
INSERT INTO public.part_tags_tag VALUES (208, 27);
INSERT INTO public.part_tags_tag VALUES (209, 42);
INSERT INTO public.part_tags_tag VALUES (209, 43);
INSERT INTO public.part_tags_tag VALUES (210, 42);
INSERT INTO public.part_tags_tag VALUES (210, 43);
INSERT INTO public.part_tags_tag VALUES (211, 42);
INSERT INTO public.part_tags_tag VALUES (211, 43);
INSERT INTO public.part_tags_tag VALUES (211, 31);
INSERT INTO public.part_tags_tag VALUES (212, 42);
INSERT INTO public.part_tags_tag VALUES (212, 43);
INSERT INTO public.part_tags_tag VALUES (213, 42);
INSERT INTO public.part_tags_tag VALUES (213, 43);
INSERT INTO public.part_tags_tag VALUES (214, 42);
INSERT INTO public.part_tags_tag VALUES (214, 38);
INSERT INTO public.part_tags_tag VALUES (214, 43);
INSERT INTO public.part_tags_tag VALUES (214, 33);
INSERT INTO public.part_tags_tag VALUES (215, 42);
INSERT INTO public.part_tags_tag VALUES (215, 15);
INSERT INTO public.part_tags_tag VALUES (215, 24);
INSERT INTO public.part_tags_tag VALUES (216, 42);
INSERT INTO public.part_tags_tag VALUES (216, 44);
INSERT INTO public.part_tags_tag VALUES (216, 15);
INSERT INTO public.part_tags_tag VALUES (216, 3);
INSERT INTO public.part_tags_tag VALUES (216, 40);
INSERT INTO public.part_tags_tag VALUES (217, 42);
INSERT INTO public.part_tags_tag VALUES (217, 15);
INSERT INTO public.part_tags_tag VALUES (217, 36);
INSERT INTO public.part_tags_tag VALUES (218, 42);
INSERT INTO public.part_tags_tag VALUES (218, 15);
INSERT INTO public.part_tags_tag VALUES (218, 13);
INSERT INTO public.part_tags_tag VALUES (218, 3);
INSERT INTO public.part_tags_tag VALUES (219, 42);
INSERT INTO public.part_tags_tag VALUES (219, 13);
INSERT INTO public.part_tags_tag VALUES (219, 15);
INSERT INTO public.part_tags_tag VALUES (220, 42);
INSERT INTO public.part_tags_tag VALUES (220, 36);
INSERT INTO public.part_tags_tag VALUES (220, 29);
INSERT INTO public.part_tags_tag VALUES (221, 42);
INSERT INTO public.part_tags_tag VALUES (221, 23);
INSERT INTO public.part_tags_tag VALUES (221, 36);
INSERT INTO public.part_tags_tag VALUES (222, 42);
INSERT INTO public.part_tags_tag VALUES (222, 36);
INSERT INTO public.part_tags_tag VALUES (222, 38);
INSERT INTO public.part_tags_tag VALUES (223, 42);
INSERT INTO public.part_tags_tag VALUES (223, 36);
INSERT INTO public.part_tags_tag VALUES (224, 42);
INSERT INTO public.part_tags_tag VALUES (224, 36);
INSERT INTO public.part_tags_tag VALUES (225, 42);
INSERT INTO public.part_tags_tag VALUES (225, 36);
INSERT INTO public.part_tags_tag VALUES (226, 42);
INSERT INTO public.part_tags_tag VALUES (226, 36);
INSERT INTO public.part_tags_tag VALUES (227, 42);
INSERT INTO public.part_tags_tag VALUES (227, 36);
INSERT INTO public.part_tags_tag VALUES (228, 42);
INSERT INTO public.part_tags_tag VALUES (228, 45);
INSERT INTO public.part_tags_tag VALUES (229, 42);
INSERT INTO public.part_tags_tag VALUES (229, 45);
INSERT INTO public.part_tags_tag VALUES (229, 19);
INSERT INTO public.part_tags_tag VALUES (230, 42);
INSERT INTO public.part_tags_tag VALUES (230, 45);
INSERT INTO public.part_tags_tag VALUES (230, 19);
INSERT INTO public.part_tags_tag VALUES (231, 42);
INSERT INTO public.part_tags_tag VALUES (231, 46);
INSERT INTO public.part_tags_tag VALUES (232, 42);
INSERT INTO public.part_tags_tag VALUES (232, 46);
INSERT INTO public.part_tags_tag VALUES (232, 38);
INSERT INTO public.part_tags_tag VALUES (233, 42);
INSERT INTO public.part_tags_tag VALUES (233, 46);
INSERT INTO public.part_tags_tag VALUES (233, 23);
INSERT INTO public.part_tags_tag VALUES (234, 42);
INSERT INTO public.part_tags_tag VALUES (234, 46);
INSERT INTO public.part_tags_tag VALUES (234, 44);
INSERT INTO public.part_tags_tag VALUES (235, 42);
INSERT INTO public.part_tags_tag VALUES (235, 27);
INSERT INTO public.part_tags_tag VALUES (235, 46);
INSERT INTO public.part_tags_tag VALUES (235, 44);
INSERT INTO public.part_tags_tag VALUES (236, 42);
INSERT INTO public.part_tags_tag VALUES (236, 46);
INSERT INTO public.part_tags_tag VALUES (237, 42);
INSERT INTO public.part_tags_tag VALUES (237, 46);
INSERT INTO public.part_tags_tag VALUES (238, 42);
INSERT INTO public.part_tags_tag VALUES (238, 46);
INSERT INTO public.part_tags_tag VALUES (238, 26);
INSERT INTO public.part_tags_tag VALUES (239, 42);
INSERT INTO public.part_tags_tag VALUES (239, 46);
INSERT INTO public.part_tags_tag VALUES (239, 47);
INSERT INTO public.part_tags_tag VALUES (240, 42);
INSERT INTO public.part_tags_tag VALUES (240, 46);
INSERT INTO public.part_tags_tag VALUES (241, 42);
INSERT INTO public.part_tags_tag VALUES (241, 23);
INSERT INTO public.part_tags_tag VALUES (241, 48);
INSERT INTO public.part_tags_tag VALUES (241, 46);
INSERT INTO public.part_tags_tag VALUES (242, 42);
INSERT INTO public.part_tags_tag VALUES (242, 46);
INSERT INTO public.part_tags_tag VALUES (242, 44);
INSERT INTO public.part_tags_tag VALUES (243, 42);
INSERT INTO public.part_tags_tag VALUES (243, 46);
INSERT INTO public.part_tags_tag VALUES (243, 44);
INSERT INTO public.part_tags_tag VALUES (244, 42);
INSERT INTO public.part_tags_tag VALUES (244, 29);
INSERT INTO public.part_tags_tag VALUES (244, 46);
INSERT INTO public.part_tags_tag VALUES (244, 40);
INSERT INTO public.part_tags_tag VALUES (244, 32);
INSERT INTO public.part_tags_tag VALUES (245, 42);
INSERT INTO public.part_tags_tag VALUES (245, 46);
INSERT INTO public.part_tags_tag VALUES (246, 42);
INSERT INTO public.part_tags_tag VALUES (246, 3);
INSERT INTO public.part_tags_tag VALUES (246, 46);
INSERT INTO public.part_tags_tag VALUES (247, 42);
INSERT INTO public.part_tags_tag VALUES (247, 24);
INSERT INTO public.part_tags_tag VALUES (248, 42);
INSERT INTO public.part_tags_tag VALUES (248, 24);
INSERT INTO public.part_tags_tag VALUES (249, 42);
INSERT INTO public.part_tags_tag VALUES (249, 3);
INSERT INTO public.part_tags_tag VALUES (249, 24);
INSERT INTO public.part_tags_tag VALUES (250, 42);
INSERT INTO public.part_tags_tag VALUES (250, 24);
INSERT INTO public.part_tags_tag VALUES (251, 42);
INSERT INTO public.part_tags_tag VALUES (251, 32);
INSERT INTO public.part_tags_tag VALUES (251, 33);
INSERT INTO public.part_tags_tag VALUES (251, 3);
INSERT INTO public.part_tags_tag VALUES (252, 42);
INSERT INTO public.part_tags_tag VALUES (252, 49);
INSERT INTO public.part_tags_tag VALUES (252, 3);
INSERT INTO public.part_tags_tag VALUES (252, 31);
INSERT INTO public.part_tags_tag VALUES (253, 42);
INSERT INTO public.part_tags_tag VALUES (253, 3);
INSERT INTO public.part_tags_tag VALUES (254, 42);
INSERT INTO public.part_tags_tag VALUES (254, 3);
INSERT INTO public.part_tags_tag VALUES (255, 42);
INSERT INTO public.part_tags_tag VALUES (255, 3);
INSERT INTO public.part_tags_tag VALUES (255, 29);
INSERT INTO public.part_tags_tag VALUES (256, 42);
INSERT INTO public.part_tags_tag VALUES (256, 3);
INSERT INTO public.part_tags_tag VALUES (257, 42);
INSERT INTO public.part_tags_tag VALUES (257, 32);
INSERT INTO public.part_tags_tag VALUES (257, 3);
INSERT INTO public.part_tags_tag VALUES (258, 42);
INSERT INTO public.part_tags_tag VALUES (258, 3);
INSERT INTO public.part_tags_tag VALUES (259, 42);
INSERT INTO public.part_tags_tag VALUES (259, 3);
INSERT INTO public.part_tags_tag VALUES (260, 42);
INSERT INTO public.part_tags_tag VALUES (260, 3);
INSERT INTO public.part_tags_tag VALUES (260, 23);
INSERT INTO public.part_tags_tag VALUES (261, 42);
INSERT INTO public.part_tags_tag VALUES (261, 3);
INSERT INTO public.part_tags_tag VALUES (261, 44);
INSERT INTO public.part_tags_tag VALUES (262, 42);
INSERT INTO public.part_tags_tag VALUES (262, 3);
INSERT INTO public.part_tags_tag VALUES (262, 31);
INSERT INTO public.part_tags_tag VALUES (262, 44);
INSERT INTO public.part_tags_tag VALUES (263, 42);
INSERT INTO public.part_tags_tag VALUES (263, 31);
INSERT INTO public.part_tags_tag VALUES (263, 33);
INSERT INTO public.part_tags_tag VALUES (264, 42);
INSERT INTO public.part_tags_tag VALUES (264, 31);
INSERT INTO public.part_tags_tag VALUES (264, 33);
INSERT INTO public.part_tags_tag VALUES (265, 42);
INSERT INTO public.part_tags_tag VALUES (265, 31);
INSERT INTO public.part_tags_tag VALUES (266, 42);
INSERT INTO public.part_tags_tag VALUES (266, 31);
INSERT INTO public.part_tags_tag VALUES (267, 42);
INSERT INTO public.part_tags_tag VALUES (267, 31);
INSERT INTO public.part_tags_tag VALUES (268, 42);
INSERT INTO public.part_tags_tag VALUES (268, 31);
INSERT INTO public.part_tags_tag VALUES (269, 42);
INSERT INTO public.part_tags_tag VALUES (269, 31);
INSERT INTO public.part_tags_tag VALUES (270, 42);
INSERT INTO public.part_tags_tag VALUES (270, 41);
INSERT INTO public.part_tags_tag VALUES (270, 38);
INSERT INTO public.part_tags_tag VALUES (271, 42);
INSERT INTO public.part_tags_tag VALUES (271, 50);
INSERT INTO public.part_tags_tag VALUES (271, 51);
INSERT INTO public.part_tags_tag VALUES (272, 42);
INSERT INTO public.part_tags_tag VALUES (272, 29);
INSERT INTO public.part_tags_tag VALUES (272, 50);
INSERT INTO public.part_tags_tag VALUES (273, 42);
INSERT INTO public.part_tags_tag VALUES (273, 29);
INSERT INTO public.part_tags_tag VALUES (273, 50);
INSERT INTO public.part_tags_tag VALUES (274, 42);
INSERT INTO public.part_tags_tag VALUES (274, 30);
INSERT INTO public.part_tags_tag VALUES (274, 50);
INSERT INTO public.part_tags_tag VALUES (275, 42);
INSERT INTO public.part_tags_tag VALUES (275, 50);
INSERT INTO public.part_tags_tag VALUES (276, 42);
INSERT INTO public.part_tags_tag VALUES (276, 47);
INSERT INTO public.part_tags_tag VALUES (276, 25);
INSERT INTO public.part_tags_tag VALUES (276, 50);
INSERT INTO public.part_tags_tag VALUES (277, 42);
INSERT INTO public.part_tags_tag VALUES (277, 50);
INSERT INTO public.part_tags_tag VALUES (278, 42);
INSERT INTO public.part_tags_tag VALUES (278, 47);
INSERT INTO public.part_tags_tag VALUES (278, 25);
INSERT INTO public.part_tags_tag VALUES (278, 50);
INSERT INTO public.part_tags_tag VALUES (278, 30);
INSERT INTO public.part_tags_tag VALUES (279, 42);
INSERT INTO public.part_tags_tag VALUES (279, 50);
INSERT INTO public.part_tags_tag VALUES (280, 42);
INSERT INTO public.part_tags_tag VALUES (280, 29);
INSERT INTO public.part_tags_tag VALUES (281, 42);
INSERT INTO public.part_tags_tag VALUES (281, 35);
INSERT INTO public.part_tags_tag VALUES (281, 47);
INSERT INTO public.part_tags_tag VALUES (281, 29);
INSERT INTO public.part_tags_tag VALUES (282, 42);
INSERT INTO public.part_tags_tag VALUES (282, 29);
INSERT INTO public.part_tags_tag VALUES (283, 42);
INSERT INTO public.part_tags_tag VALUES (283, 29);
INSERT INTO public.part_tags_tag VALUES (284, 42);
INSERT INTO public.part_tags_tag VALUES (284, 29);
INSERT INTO public.part_tags_tag VALUES (284, 47);
INSERT INTO public.part_tags_tag VALUES (285, 42);
INSERT INTO public.part_tags_tag VALUES (285, 35);
INSERT INTO public.part_tags_tag VALUES (285, 47);
INSERT INTO public.part_tags_tag VALUES (285, 29);
INSERT INTO public.part_tags_tag VALUES (286, 42);
INSERT INTO public.part_tags_tag VALUES (286, 23);
INSERT INTO public.part_tags_tag VALUES (286, 29);
INSERT INTO public.part_tags_tag VALUES (287, 42);
INSERT INTO public.part_tags_tag VALUES (287, 29);
INSERT INTO public.part_tags_tag VALUES (288, 42);
INSERT INTO public.part_tags_tag VALUES (288, 29);
INSERT INTO public.part_tags_tag VALUES (289, 42);
INSERT INTO public.part_tags_tag VALUES (289, 29);
INSERT INTO public.part_tags_tag VALUES (290, 42);
INSERT INTO public.part_tags_tag VALUES (290, 29);
INSERT INTO public.part_tags_tag VALUES (291, 42);
INSERT INTO public.part_tags_tag VALUES (291, 29);
INSERT INTO public.part_tags_tag VALUES (292, 42);
INSERT INTO public.part_tags_tag VALUES (292, 29);
INSERT INTO public.part_tags_tag VALUES (293, 42);
INSERT INTO public.part_tags_tag VALUES (293, 29);
INSERT INTO public.part_tags_tag VALUES (294, 42);
INSERT INTO public.part_tags_tag VALUES (294, 29);
INSERT INTO public.part_tags_tag VALUES (295, 42);
INSERT INTO public.part_tags_tag VALUES (295, 29);
INSERT INTO public.part_tags_tag VALUES (295, 32);
INSERT INTO public.part_tags_tag VALUES (296, 42);
INSERT INTO public.part_tags_tag VALUES (296, 29);
INSERT INTO public.part_tags_tag VALUES (297, 42);
INSERT INTO public.part_tags_tag VALUES (297, 19);
INSERT INTO public.part_tags_tag VALUES (297, 34);
INSERT INTO public.part_tags_tag VALUES (298, 42);
INSERT INTO public.part_tags_tag VALUES (298, 34);
INSERT INTO public.part_tags_tag VALUES (298, 44);
INSERT INTO public.part_tags_tag VALUES (299, 42);
INSERT INTO public.part_tags_tag VALUES (299, 23);
INSERT INTO public.part_tags_tag VALUES (299, 32);
INSERT INTO public.part_tags_tag VALUES (299, 34);
INSERT INTO public.part_tags_tag VALUES (300, 42);
INSERT INTO public.part_tags_tag VALUES (300, 34);
INSERT INTO public.part_tags_tag VALUES (300, 32);
INSERT INTO public.part_tags_tag VALUES (301, 42);
INSERT INTO public.part_tags_tag VALUES (301, 30);
INSERT INTO public.part_tags_tag VALUES (302, 42);
INSERT INTO public.part_tags_tag VALUES (302, 30);
INSERT INTO public.part_tags_tag VALUES (303, 42);
INSERT INTO public.part_tags_tag VALUES (303, 30);
INSERT INTO public.part_tags_tag VALUES (304, 42);
INSERT INTO public.part_tags_tag VALUES (304, 30);
INSERT INTO public.part_tags_tag VALUES (304, 48);
INSERT INTO public.part_tags_tag VALUES (305, 42);
INSERT INTO public.part_tags_tag VALUES (305, 30);
INSERT INTO public.part_tags_tag VALUES (306, 42);
INSERT INTO public.part_tags_tag VALUES (306, 33);
INSERT INTO public.part_tags_tag VALUES (306, 30);
INSERT INTO public.part_tags_tag VALUES (307, 42);
INSERT INTO public.part_tags_tag VALUES (307, 19);
INSERT INTO public.part_tags_tag VALUES (308, 42);
INSERT INTO public.part_tags_tag VALUES (308, 19);
INSERT INTO public.part_tags_tag VALUES (309, 42);
INSERT INTO public.part_tags_tag VALUES (309, 19);
INSERT INTO public.part_tags_tag VALUES (310, 42);
INSERT INTO public.part_tags_tag VALUES (310, 19);
INSERT INTO public.part_tags_tag VALUES (311, 42);
INSERT INTO public.part_tags_tag VALUES (311, 19);
INSERT INTO public.part_tags_tag VALUES (312, 42);
INSERT INTO public.part_tags_tag VALUES (312, 19);
INSERT INTO public.part_tags_tag VALUES (313, 42);
INSERT INTO public.part_tags_tag VALUES (313, 19);
INSERT INTO public.part_tags_tag VALUES (314, 42);
INSERT INTO public.part_tags_tag VALUES (314, 19);
INSERT INTO public.part_tags_tag VALUES (315, 42);
INSERT INTO public.part_tags_tag VALUES (315, 19);
INSERT INTO public.part_tags_tag VALUES (316, 42);
INSERT INTO public.part_tags_tag VALUES (316, 19);
INSERT INTO public.part_tags_tag VALUES (316, 44);
INSERT INTO public.part_tags_tag VALUES (317, 42);
INSERT INTO public.part_tags_tag VALUES (317, 19);
INSERT INTO public.part_tags_tag VALUES (318, 42);
INSERT INTO public.part_tags_tag VALUES (318, 19);
INSERT INTO public.part_tags_tag VALUES (318, 52);
INSERT INTO public.part_tags_tag VALUES (319, 42);
INSERT INTO public.part_tags_tag VALUES (319, 19);
INSERT INTO public.part_tags_tag VALUES (320, 42);
INSERT INTO public.part_tags_tag VALUES (320, 27);
INSERT INTO public.part_tags_tag VALUES (321, 42);
INSERT INTO public.part_tags_tag VALUES (321, 26);
INSERT INTO public.part_tags_tag VALUES (321, 48);
INSERT INTO public.part_tags_tag VALUES (321, 27);
INSERT INTO public.part_tags_tag VALUES (321, 38);
INSERT INTO public.part_tags_tag VALUES (322, 42);
INSERT INTO public.part_tags_tag VALUES (322, 27);
INSERT INTO public.part_tags_tag VALUES (323, 42);
INSERT INTO public.part_tags_tag VALUES (323, 27);
INSERT INTO public.part_tags_tag VALUES (324, 42);
INSERT INTO public.part_tags_tag VALUES (324, 53);
INSERT INTO public.part_tags_tag VALUES (324, 27);
INSERT INTO public.part_tags_tag VALUES (325, 42);
INSERT INTO public.part_tags_tag VALUES (325, 23);
INSERT INTO public.part_tags_tag VALUES (326, 42);
INSERT INTO public.part_tags_tag VALUES (326, 23);
INSERT INTO public.part_tags_tag VALUES (327, 42);
INSERT INTO public.part_tags_tag VALUES (327, 23);
INSERT INTO public.part_tags_tag VALUES (327, 54);
INSERT INTO public.part_tags_tag VALUES (328, 42);
INSERT INTO public.part_tags_tag VALUES (328, 23);
INSERT INTO public.part_tags_tag VALUES (329, 42);
INSERT INTO public.part_tags_tag VALUES (329, 23);
INSERT INTO public.part_tags_tag VALUES (330, 42);
INSERT INTO public.part_tags_tag VALUES (330, 44);
INSERT INTO public.part_tags_tag VALUES (330, 23);
INSERT INTO public.part_tags_tag VALUES (331, 42);
INSERT INTO public.part_tags_tag VALUES (331, 23);
INSERT INTO public.part_tags_tag VALUES (331, 48);
INSERT INTO public.part_tags_tag VALUES (332, 42);
INSERT INTO public.part_tags_tag VALUES (332, 23);
INSERT INTO public.part_tags_tag VALUES (333, 42);
INSERT INTO public.part_tags_tag VALUES (333, 23);
INSERT INTO public.part_tags_tag VALUES (334, 42);
INSERT INTO public.part_tags_tag VALUES (334, 55);
INSERT INTO public.part_tags_tag VALUES (335, 42);
INSERT INTO public.part_tags_tag VALUES (335, 47);
INSERT INTO public.part_tags_tag VALUES (335, 38);
INSERT INTO public.part_tags_tag VALUES (335, 55);
INSERT INTO public.part_tags_tag VALUES (336, 42);
INSERT INTO public.part_tags_tag VALUES (336, 55);
INSERT INTO public.part_tags_tag VALUES (337, 42);
INSERT INTO public.part_tags_tag VALUES (337, 55);
INSERT INTO public.part_tags_tag VALUES (338, 42);
INSERT INTO public.part_tags_tag VALUES (338, 54);
INSERT INTO public.part_tags_tag VALUES (338, 13);
INSERT INTO public.part_tags_tag VALUES (339, 42);
INSERT INTO public.part_tags_tag VALUES (339, 54);
INSERT INTO public.part_tags_tag VALUES (339, 48);
INSERT INTO public.part_tags_tag VALUES (339, 32);
INSERT INTO public.part_tags_tag VALUES (340, 42);
INSERT INTO public.part_tags_tag VALUES (340, 35);
INSERT INTO public.part_tags_tag VALUES (341, 42);
INSERT INTO public.part_tags_tag VALUES (341, 35);
INSERT INTO public.part_tags_tag VALUES (342, 42);
INSERT INTO public.part_tags_tag VALUES (342, 35);
INSERT INTO public.part_tags_tag VALUES (343, 42);
INSERT INTO public.part_tags_tag VALUES (343, 35);
INSERT INTO public.part_tags_tag VALUES (343, 47);
INSERT INTO public.part_tags_tag VALUES (344, 42);
INSERT INTO public.part_tags_tag VALUES (344, 35);
INSERT INTO public.part_tags_tag VALUES (345, 42);
INSERT INTO public.part_tags_tag VALUES (345, 35);
INSERT INTO public.part_tags_tag VALUES (345, 38);
INSERT INTO public.part_tags_tag VALUES (346, 42);
INSERT INTO public.part_tags_tag VALUES (346, 48);
INSERT INTO public.part_tags_tag VALUES (346, 38);
INSERT INTO public.part_tags_tag VALUES (347, 42);
INSERT INTO public.part_tags_tag VALUES (347, 32);
INSERT INTO public.part_tags_tag VALUES (347, 38);
INSERT INTO public.part_tags_tag VALUES (348, 42);
INSERT INTO public.part_tags_tag VALUES (348, 38);
INSERT INTO public.part_tags_tag VALUES (349, 42);
INSERT INTO public.part_tags_tag VALUES (349, 38);
INSERT INTO public.part_tags_tag VALUES (350, 42);
INSERT INTO public.part_tags_tag VALUES (350, 38);
INSERT INTO public.part_tags_tag VALUES (351, 42);
INSERT INTO public.part_tags_tag VALUES (351, 38);
INSERT INTO public.part_tags_tag VALUES (352, 42);
INSERT INTO public.part_tags_tag VALUES (352, 38);
INSERT INTO public.part_tags_tag VALUES (353, 42);
INSERT INTO public.part_tags_tag VALUES (353, 38);
INSERT INTO public.part_tags_tag VALUES (354, 42);
INSERT INTO public.part_tags_tag VALUES (354, 38);
INSERT INTO public.part_tags_tag VALUES (355, 42);
INSERT INTO public.part_tags_tag VALUES (355, 38);
INSERT INTO public.part_tags_tag VALUES (356, 42);
INSERT INTO public.part_tags_tag VALUES (356, 38);
INSERT INTO public.part_tags_tag VALUES (357, 42);
INSERT INTO public.part_tags_tag VALUES (357, 40);
INSERT INTO public.part_tags_tag VALUES (358, 42);
INSERT INTO public.part_tags_tag VALUES (358, 40);
INSERT INTO public.part_tags_tag VALUES (359, 42);
INSERT INTO public.part_tags_tag VALUES (359, 40);
INSERT INTO public.part_tags_tag VALUES (360, 42);
INSERT INTO public.part_tags_tag VALUES (360, 40);
INSERT INTO public.part_tags_tag VALUES (361, 42);
INSERT INTO public.part_tags_tag VALUES (361, 40);
INSERT INTO public.part_tags_tag VALUES (362, 42);
INSERT INTO public.part_tags_tag VALUES (362, 56);
INSERT INTO public.part_tags_tag VALUES (363, 42);
INSERT INTO public.part_tags_tag VALUES (363, 56);
INSERT INTO public.part_tags_tag VALUES (364, 42);
INSERT INTO public.part_tags_tag VALUES (364, 32);
INSERT INTO public.part_tags_tag VALUES (364, 53);
INSERT INTO public.part_tags_tag VALUES (365, 42);
INSERT INTO public.part_tags_tag VALUES (365, 53);
INSERT INTO public.part_tags_tag VALUES (366, 42);
INSERT INTO public.part_tags_tag VALUES (366, 53);
INSERT INTO public.part_tags_tag VALUES (367, 42);
INSERT INTO public.part_tags_tag VALUES (367, 48);
INSERT INTO public.part_tags_tag VALUES (367, 32);
INSERT INTO public.part_tags_tag VALUES (368, 42);
INSERT INTO public.part_tags_tag VALUES (368, 32);
INSERT INTO public.part_tags_tag VALUES (368, 13);
INSERT INTO public.part_tags_tag VALUES (369, 42);
INSERT INTO public.part_tags_tag VALUES (369, 32);
INSERT INTO public.part_tags_tag VALUES (370, 42);
INSERT INTO public.part_tags_tag VALUES (370, 32);
INSERT INTO public.part_tags_tag VALUES (370, 25);
INSERT INTO public.part_tags_tag VALUES (370, 26);
INSERT INTO public.part_tags_tag VALUES (371, 42);
INSERT INTO public.part_tags_tag VALUES (371, 32);
INSERT INTO public.part_tags_tag VALUES (372, 42);
INSERT INTO public.part_tags_tag VALUES (372, 44);
INSERT INTO public.part_tags_tag VALUES (373, 42);
INSERT INTO public.part_tags_tag VALUES (373, 44);
INSERT INTO public.part_tags_tag VALUES (373, 48);
INSERT INTO public.part_tags_tag VALUES (374, 42);
INSERT INTO public.part_tags_tag VALUES (374, 44);
INSERT INTO public.part_tags_tag VALUES (375, 42);
INSERT INTO public.part_tags_tag VALUES (375, 44);
INSERT INTO public.part_tags_tag VALUES (376, 42);
INSERT INTO public.part_tags_tag VALUES (376, 44);
INSERT INTO public.part_tags_tag VALUES (377, 42);
INSERT INTO public.part_tags_tag VALUES (377, 44);
INSERT INTO public.part_tags_tag VALUES (377, 47);
INSERT INTO public.part_tags_tag VALUES (378, 42);
INSERT INTO public.part_tags_tag VALUES (378, 44);
INSERT INTO public.part_tags_tag VALUES (378, 38);
INSERT INTO public.part_tags_tag VALUES (379, 57);
INSERT INTO public.part_tags_tag VALUES (379, 58);
INSERT INTO public.part_tags_tag VALUES (379, 47);
INSERT INTO public.part_tags_tag VALUES (380, 57);
INSERT INTO public.part_tags_tag VALUES (380, 58);
INSERT INTO public.part_tags_tag VALUES (380, 52);
INSERT INTO public.part_tags_tag VALUES (381, 57);
INSERT INTO public.part_tags_tag VALUES (381, 47);
INSERT INTO public.part_tags_tag VALUES (382, 57);
INSERT INTO public.part_tags_tag VALUES (382, 47);
INSERT INTO public.part_tags_tag VALUES (383, 57);
INSERT INTO public.part_tags_tag VALUES (383, 47);
INSERT INTO public.part_tags_tag VALUES (384, 57);
INSERT INTO public.part_tags_tag VALUES (384, 47);
INSERT INTO public.part_tags_tag VALUES (385, 57);
INSERT INTO public.part_tags_tag VALUES (385, 47);
INSERT INTO public.part_tags_tag VALUES (386, 57);
INSERT INTO public.part_tags_tag VALUES (386, 47);
INSERT INTO public.part_tags_tag VALUES (386, 38);
INSERT INTO public.part_tags_tag VALUES (387, 57);
INSERT INTO public.part_tags_tag VALUES (387, 47);
INSERT INTO public.part_tags_tag VALUES (388, 57);
INSERT INTO public.part_tags_tag VALUES (388, 47);
INSERT INTO public.part_tags_tag VALUES (388, 51);
INSERT INTO public.part_tags_tag VALUES (389, 57);
INSERT INTO public.part_tags_tag VALUES (389, 47);
INSERT INTO public.part_tags_tag VALUES (389, 25);
INSERT INTO public.part_tags_tag VALUES (390, 57);
INSERT INTO public.part_tags_tag VALUES (390, 47);
INSERT INTO public.part_tags_tag VALUES (390, 25);
INSERT INTO public.part_tags_tag VALUES (391, 57);
INSERT INTO public.part_tags_tag VALUES (391, 47);
INSERT INTO public.part_tags_tag VALUES (392, 57);
INSERT INTO public.part_tags_tag VALUES (392, 47);
INSERT INTO public.part_tags_tag VALUES (393, 57);
INSERT INTO public.part_tags_tag VALUES (393, 47);
INSERT INTO public.part_tags_tag VALUES (394, 57);
INSERT INTO public.part_tags_tag VALUES (394, 47);
INSERT INTO public.part_tags_tag VALUES (395, 57);
INSERT INTO public.part_tags_tag VALUES (395, 47);
INSERT INTO public.part_tags_tag VALUES (395, 51);
INSERT INTO public.part_tags_tag VALUES (395, 25);
INSERT INTO public.part_tags_tag VALUES (396, 57);
INSERT INTO public.part_tags_tag VALUES (396, 47);
INSERT INTO public.part_tags_tag VALUES (397, 57);
INSERT INTO public.part_tags_tag VALUES (397, 52);
INSERT INTO public.part_tags_tag VALUES (397, 47);
INSERT INTO public.part_tags_tag VALUES (398, 57);
INSERT INTO public.part_tags_tag VALUES (398, 47);
INSERT INTO public.part_tags_tag VALUES (399, 57);
INSERT INTO public.part_tags_tag VALUES (399, 47);
INSERT INTO public.part_tags_tag VALUES (399, 38);
INSERT INTO public.part_tags_tag VALUES (400, 57);
INSERT INTO public.part_tags_tag VALUES (400, 47);
INSERT INTO public.part_tags_tag VALUES (401, 57);
INSERT INTO public.part_tags_tag VALUES (401, 47);
INSERT INTO public.part_tags_tag VALUES (402, 57);
INSERT INTO public.part_tags_tag VALUES (402, 47);
INSERT INTO public.part_tags_tag VALUES (403, 57);
INSERT INTO public.part_tags_tag VALUES (403, 51);
INSERT INTO public.part_tags_tag VALUES (404, 57);
INSERT INTO public.part_tags_tag VALUES (404, 47);
INSERT INTO public.part_tags_tag VALUES (405, 57);
INSERT INTO public.part_tags_tag VALUES (405, 51);
INSERT INTO public.part_tags_tag VALUES (406, 57);
INSERT INTO public.part_tags_tag VALUES (406, 51);
INSERT INTO public.part_tags_tag VALUES (406, 59);
INSERT INTO public.part_tags_tag VALUES (407, 57);
INSERT INTO public.part_tags_tag VALUES (407, 51);
INSERT INTO public.part_tags_tag VALUES (408, 57);
INSERT INTO public.part_tags_tag VALUES (408, 59);
INSERT INTO public.part_tags_tag VALUES (408, 51);
INSERT INTO public.part_tags_tag VALUES (409, 57);
INSERT INTO public.part_tags_tag VALUES (409, 51);
INSERT INTO public.part_tags_tag VALUES (410, 57);
INSERT INTO public.part_tags_tag VALUES (410, 51);
INSERT INTO public.part_tags_tag VALUES (411, 57);
INSERT INTO public.part_tags_tag VALUES (411, 48);
INSERT INTO public.part_tags_tag VALUES (411, 51);
INSERT INTO public.part_tags_tag VALUES (412, 57);
INSERT INTO public.part_tags_tag VALUES (412, 25);
INSERT INTO public.part_tags_tag VALUES (413, 57);
INSERT INTO public.part_tags_tag VALUES (413, 25);
INSERT INTO public.part_tags_tag VALUES (414, 57);
INSERT INTO public.part_tags_tag VALUES (414, 25);
INSERT INTO public.part_tags_tag VALUES (414, 26);
INSERT INTO public.part_tags_tag VALUES (415, 57);
INSERT INTO public.part_tags_tag VALUES (415, 26);
INSERT INTO public.part_tags_tag VALUES (416, 57);
INSERT INTO public.part_tags_tag VALUES (416, 26);
INSERT INTO public.part_tags_tag VALUES (417, 57);
INSERT INTO public.part_tags_tag VALUES (417, 48);
INSERT INTO public.part_tags_tag VALUES (418, 57);
INSERT INTO public.part_tags_tag VALUES (418, 48);
INSERT INTO public.part_tags_tag VALUES (419, 57);
INSERT INTO public.part_tags_tag VALUES (419, 48);
INSERT INTO public.part_tags_tag VALUES (420, 57);
INSERT INTO public.part_tags_tag VALUES (420, 48);
INSERT INTO public.part_tags_tag VALUES (421, 57);
INSERT INTO public.part_tags_tag VALUES (421, 48);
INSERT INTO public.part_tags_tag VALUES (422, 57);
INSERT INTO public.part_tags_tag VALUES (422, 48);
INSERT INTO public.part_tags_tag VALUES (423, 57);
INSERT INTO public.part_tags_tag VALUES (423, 48);
INSERT INTO public.part_tags_tag VALUES (424, 57);
INSERT INTO public.part_tags_tag VALUES (424, 48);
INSERT INTO public.part_tags_tag VALUES (425, 57);
INSERT INTO public.part_tags_tag VALUES (425, 48);
INSERT INTO public.part_tags_tag VALUES (426, 57);
INSERT INTO public.part_tags_tag VALUES (426, 48);
INSERT INTO public.part_tags_tag VALUES (427, 57);
INSERT INTO public.part_tags_tag VALUES (427, 48);
INSERT INTO public.part_tags_tag VALUES (428, 57);
INSERT INTO public.part_tags_tag VALUES (428, 48);
INSERT INTO public.part_tags_tag VALUES (429, 57);
INSERT INTO public.part_tags_tag VALUES (429, 48);
INSERT INTO public.part_tags_tag VALUES (430, 57);
INSERT INTO public.part_tags_tag VALUES (430, 48);
INSERT INTO public.part_tags_tag VALUES (431, 57);
INSERT INTO public.part_tags_tag VALUES (431, 48);
INSERT INTO public.part_tags_tag VALUES (432, 57);
INSERT INTO public.part_tags_tag VALUES (432, 48);
INSERT INTO public.part_tags_tag VALUES (433, 57);
INSERT INTO public.part_tags_tag VALUES (433, 48);
INSERT INTO public.part_tags_tag VALUES (434, 57);
INSERT INTO public.part_tags_tag VALUES (434, 48);
INSERT INTO public.part_tags_tag VALUES (435, 57);
INSERT INTO public.part_tags_tag VALUES (435, 38);
INSERT INTO public.part_tags_tag VALUES (436, 57);
INSERT INTO public.part_tags_tag VALUES (436, 38);
INSERT INTO public.part_tags_tag VALUES (437, 57);
INSERT INTO public.part_tags_tag VALUES (437, 38);
INSERT INTO public.part_tags_tag VALUES (438, 57);
INSERT INTO public.part_tags_tag VALUES (438, 38);
INSERT INTO public.part_tags_tag VALUES (439, 57);
INSERT INTO public.part_tags_tag VALUES (439, 38);


--
-- TOC entry 2925 (class 0 OID 16412)
-- Dependencies: 201
-- Data for Name: tag; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.tag VALUES (2, 1, '2020-12-02 22:03:37.425238', '2020-12-02 22:03:37.425238', 'Buchstabenspiele');
INSERT INTO public.tag VALUES (1, 1, '2020-12-02 22:03:37.424067', '2020-12-02 22:03:37.424067', 'Spiel');
INSERT INTO public.tag VALUES (3, 1, '2020-12-02 22:03:38.201612', '2020-12-02 22:03:38.201612', 'Charakter/Figur');
INSERT INTO public.tag VALUES (4, 1, '2020-12-02 22:03:38.37222', '2020-12-02 22:03:38.37222', 'Kettenspiele');
INSERT INTO public.tag VALUES (5, 1, '2020-12-02 22:03:38.634592', '2020-12-02 22:03:38.634592', 'Zuschauer auf der Bühne');
INSERT INTO public.tag VALUES (6, 1, '2020-12-02 22:03:38.776148', '2020-12-02 22:03:38.776148', 'Dialogformen');
INSERT INTO public.tag VALUES (7, 1, '2020-12-02 22:03:40.483293', '2020-12-02 22:03:40.483293', 'Sonstige');
INSERT INTO public.tag VALUES (8, 1, '2020-12-02 22:03:40.797174', '2020-12-02 22:03:40.797174', 'Gefühlsspiele');
INSERT INTO public.tag VALUES (9, 1, '2020-12-02 22:03:40.798155', '2020-12-02 22:03:40.798155', 'Replays');
INSERT INTO public.tag VALUES (10, 1, '2020-12-02 22:03:40.927134', '2020-12-02 22:03:40.927134', 'Switches');
INSERT INTO public.tag VALUES (11, 1, '2020-12-02 22:03:41.743309', '2020-12-02 22:03:41.743309', 'Reden');
INSERT INTO public.tag VALUES (12, 1, '2020-12-02 22:03:42.307126', '2020-12-02 22:03:42.307126', 'Musikspiele');
INSERT INTO public.tag VALUES (13, 1, '2020-12-02 22:03:42.451409', '2020-12-02 22:03:42.451409', 'Übungen zu Aktion und Reaktion');
INSERT INTO public.tag VALUES (14, 1, '2020-12-02 22:03:42.830259', '2020-12-02 22:03:42.830259', 'Slapstick');
INSERT INTO public.tag VALUES (15, 1, '2020-12-02 22:03:43.21141', '2020-12-02 22:03:43.21141', 'Angebot/Annahme');
INSERT INTO public.tag VALUES (16, 1, '2020-12-02 22:03:43.82443', '2020-12-02 22:03:43.82443', 'Spiele mit Gegenständen');
INSERT INTO public.tag VALUES (17, 1, '2020-12-02 22:03:44.940071', '2020-12-02 22:03:44.940071', 'Körperkontakt und Berührung');
INSERT INTO public.tag VALUES (18, 1, '2020-12-02 22:03:45.508153', '2020-12-02 22:03:45.508153', 'Schwarz auf Weiß');
INSERT INTO public.tag VALUES (19, 1, '2020-12-02 22:03:45.944822', '2020-12-02 22:03:45.944822', 'Musik und Gesang');
INSERT INTO public.tag VALUES (20, 1, '2020-12-02 22:03:47.541624', '2020-12-02 22:03:47.541624', 'Regiespiele');
INSERT INTO public.tag VALUES (21, 1, '2020-12-02 22:03:49.188315', '2020-12-02 22:03:49.188315', 'Ratespiele');
INSERT INTO public.tag VALUES (22, 1, '2020-12-02 22:03:50.497588', '2020-12-02 22:03:50.497588', 'Synchro');
INSERT INTO public.tag VALUES (23, 1, '2020-12-02 22:03:50.63063', '2020-12-02 22:03:50.63063', 'Pantomime Übungen');
INSERT INTO public.tag VALUES (24, 1, '2020-12-02 22:03:50.796102', '2020-12-02 22:03:50.796102', 'Basisinformationen');
INSERT INTO public.tag VALUES (25, 1, '2020-12-02 22:03:51.475421', '2020-12-02 22:03:51.475421', 'Konzentration');
INSERT INTO public.tag VALUES (26, 1, '2020-12-02 22:03:51.491381', '2020-12-02 22:03:51.491381', 'Paarbildung');
INSERT INTO public.tag VALUES (27, 1, '2020-12-02 22:03:51.489897', '2020-12-02 22:03:51.489897', 'Paare');
INSERT INTO public.tag VALUES (28, 1, '2020-12-02 22:03:51.495161', '2020-12-02 22:03:51.495161', 'Gruppen');
INSERT INTO public.tag VALUES (29, 1, '2020-12-02 22:03:51.500926', '2020-12-02 22:03:51.500926', 'Gruppe');
INSERT INTO public.tag VALUES (30, 1, '2020-12-02 22:03:51.503198', '2020-12-02 22:03:51.503198', 'Multitasking');
INSERT INTO public.tag VALUES (31, 1, '2020-12-02 22:03:51.501587', '2020-12-02 22:03:51.501587', 'Erzählen');
INSERT INTO public.tag VALUES (32, 1, '2020-12-02 22:03:51.510232', '2020-12-02 22:03:51.510232', 'Wahrnehmung');
INSERT INTO public.tag VALUES (33, 1, '2020-12-02 22:03:51.511688', '2020-12-02 22:03:51.511688', 'Zuhören');
INSERT INTO public.tag VALUES (34, 1, '2020-12-02 22:03:51.673517', '2020-12-02 22:03:51.673517', 'Impuls');
INSERT INTO public.tag VALUES (35, 1, '2020-12-02 22:03:51.674312', '2020-12-02 22:03:51.674312', 'Schnelligkeit');
INSERT INTO public.tag VALUES (36, 1, '2020-12-02 22:03:52.50392', '2020-12-02 22:03:52.50392', 'Assoziieren');
INSERT INTO public.tag VALUES (37, 1, '2020-12-02 22:03:53.801538', '2020-12-02 22:03:53.801538', 'Langformen');
INSERT INTO public.tag VALUES (38, 1, '2020-12-02 22:04:02.75429', '2020-12-02 22:04:02.75429', 'Sonstiges');
INSERT INTO public.tag VALUES (39, 1, '2020-12-02 22:04:04.758478', '2020-12-02 22:04:04.758478', 'Showformen');
INSERT INTO public.tag VALUES (40, 1, '2020-12-02 22:04:05.326375', '2020-12-02 22:04:05.326375', 'Status');
INSERT INTO public.tag VALUES (41, 1, '2020-12-02 22:04:08.090628', '2020-12-02 22:04:08.090628', 'Fokus');
INSERT INTO public.tag VALUES (42, 1, '2020-12-02 22:04:08.602195', '2020-12-02 22:04:08.602195', 'Übung');
INSERT INTO public.tag VALUES (43, 1, '2020-12-02 22:04:08.63286', '2020-12-02 22:04:08.63286', 'Akzeptieren');
INSERT INTO public.tag VALUES (44, 1, '2020-12-02 22:04:11.454158', '2020-12-02 22:04:11.454158', 'Übungen zu Gefühlen');
INSERT INTO public.tag VALUES (45, 1, '2020-12-02 22:04:13.324239', '2020-12-02 22:04:13.324239', 'Atmung');
INSERT INTO public.tag VALUES (46, 1, '2020-12-02 22:04:13.701699', '2020-12-02 22:04:13.701699', 'Ausdruck');
INSERT INTO public.tag VALUES (47, 1, '2020-12-02 22:04:14.650801', '2020-12-02 22:04:14.650801', 'Im Kreis');
INSERT INTO public.tag VALUES (48, 1, '2020-12-02 22:04:14.931038', '2020-12-02 22:04:14.931038', 'Raumlauf');
INSERT INTO public.tag VALUES (49, 1, '2020-12-02 22:04:16.378721', '2020-12-02 22:04:16.378721', 'Genreliste');
INSERT INTO public.tag VALUES (50, 1, '2020-12-02 22:04:19.947804', '2020-12-02 22:04:19.947804', 'Gedächtnis');
INSERT INTO public.tag VALUES (51, 1, '2020-12-02 22:04:19.957284', '2020-12-02 22:04:19.957284', 'Kennenlernen');
INSERT INTO public.tag VALUES (52, 1, '2020-12-02 22:04:26.595825', '2020-12-02 22:04:26.595825', 'Stimme');
INSERT INTO public.tag VALUES (53, 1, '2020-12-02 22:04:27.389262', '2020-12-02 22:04:27.389262', 'Vertrauensübungen');
INSERT INTO public.tag VALUES (54, 1, '2020-12-02 22:04:27.930249', '2020-12-02 22:04:27.930249', 'Räume');
INSERT INTO public.tag VALUES (55, 1, '2020-12-02 22:04:28.975151', '2020-12-02 22:04:28.975151', 'Reimen');
INSERT INTO public.tag VALUES (56, 1, '2020-12-02 22:04:33.337143', '2020-12-02 22:04:33.337143', 'Tanz/Choreographie');
INSERT INTO public.tag VALUES (57, 1, '2020-12-02 22:04:35.951176', '2020-12-02 22:04:35.951176', 'Aufwärmspiel');
INSERT INTO public.tag VALUES (58, 1, '2020-12-02 22:04:35.961375', '2020-12-02 22:04:35.961375', 'Aufwärmspiele');
INSERT INTO public.tag VALUES (59, 1, '2020-12-02 22:04:40.79452', '2020-12-02 22:04:40.79452', 'Kennenlernspiele');


--
-- TOC entry 2939 (class 0 OID 0)
-- Dependencies: 198
-- Name: license_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.license_id_seq', 439, true);


--
-- TOC entry 2940 (class 0 OID 0)
-- Dependencies: 196
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.migrations_id_seq', 1, true);


--
-- TOC entry 2941 (class 0 OID 0)
-- Dependencies: 202
-- Name: part_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.part_id_seq', 439, true);


--
-- TOC entry 2942 (class 0 OID 0)
-- Dependencies: 200
-- Name: tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.tag_id_seq', 59, true);


--
-- TOC entry 2787 (class 2606 OID 16438)
-- Name: part PK_58888debdf048d2dfe459aa59da; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.part
    ADD CONSTRAINT "PK_58888debdf048d2dfe459aa59da" PRIMARY KEY (id);


--
-- TOC entry 2778 (class 2606 OID 16395)
-- Name: migrations PK_8c82d7f526340ab734260ea46be; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT "PK_8c82d7f526340ab734260ea46be" PRIMARY KEY (id);


--
-- TOC entry 2783 (class 2606 OID 16422)
-- Name: tag PK_8e4052373c579afc1471f526760; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tag
    ADD CONSTRAINT "PK_8e4052373c579afc1471f526760" PRIMARY KEY (id);


--
-- TOC entry 2795 (class 2606 OID 16447)
-- Name: part_tags_tag PK_ba7f134b4943ea5e267b2c7ab2c; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.part_tags_tag
    ADD CONSTRAINT "PK_ba7f134b4943ea5e267b2c7ab2c" PRIMARY KEY ("partId", "tagId");


--
-- TOC entry 2780 (class 2606 OID 16409)
-- Name: license PK_f168ac1ca5ba87286d03b2ef905; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.license
    ADD CONSTRAINT "PK_f168ac1ca5ba87286d03b2ef905" PRIMARY KEY (id);


--
-- TOC entry 2789 (class 2606 OID 16442)
-- Name: part REL_7d44714455838955f803a308c7; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.part
    ADD CONSTRAINT "REL_7d44714455838955f803a308c7" UNIQUE ("licenseId");


--
-- TOC entry 2791 (class 2606 OID 16440)
-- Name: part UQ_0ef67ab1d777a1d1547d4c72902; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.part
    ADD CONSTRAINT "UQ_0ef67ab1d777a1d1547d4c72902" UNIQUE ("sourceUrl");


--
-- TOC entry 2785 (class 2606 OID 16424)
-- Name: tag UQ_ea660f2baf9c3f3141d7c2ef531; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tag
    ADD CONSTRAINT "UQ_ea660f2baf9c3f3141d7c2ef531" UNIQUE (title);


--
-- TOC entry 2781 (class 1259 OID 16425)
-- Name: IDX_ea660f2baf9c3f3141d7c2ef53; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_ea660f2baf9c3f3141d7c2ef53" ON public.tag USING btree (title);


--
-- TOC entry 2792 (class 1259 OID 16449)
-- Name: IDX_ed8cae0b371517895a2e8fb94b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_ed8cae0b371517895a2e8fb94b" ON public.part_tags_tag USING btree ("tagId");


--
-- TOC entry 2793 (class 1259 OID 16448)
-- Name: IDX_f5ac87a54aa3763922ad07ffa6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_f5ac87a54aa3763922ad07ffa6" ON public.part_tags_tag USING btree ("partId");


--
-- TOC entry 2796 (class 2606 OID 16450)
-- Name: part FK_7d44714455838955f803a308c77; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.part
    ADD CONSTRAINT "FK_7d44714455838955f803a308c77" FOREIGN KEY ("licenseId") REFERENCES public.license(id);


--
-- TOC entry 2798 (class 2606 OID 16460)
-- Name: part_tags_tag FK_ed8cae0b371517895a2e8fb94b7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.part_tags_tag
    ADD CONSTRAINT "FK_ed8cae0b371517895a2e8fb94b7" FOREIGN KEY ("tagId") REFERENCES public.tag(id) ON DELETE CASCADE;


--
-- TOC entry 2797 (class 2606 OID 16455)
-- Name: part_tags_tag FK_f5ac87a54aa3763922ad07ffa6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.part_tags_tag
    ADD CONSTRAINT "FK_f5ac87a54aa3763922ad07ffa6f" FOREIGN KEY ("partId") REFERENCES public.part(id) ON DELETE CASCADE;


-- Completed on 2021-01-05 19:00:00

--
-- PostgreSQL database dump complete
--

