--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(60) NOT NULL,
    age_in_mil_yrs numeric(4,1) NOT NULL,
    description text NOT NULL,
    albedo integer,
    is_spehrical boolean,
    has_life boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: god; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.god (
    god_id integer NOT NULL,
    name character varying(40) NOT NULL,
    randcol integer
);


ALTER TABLE public.god OWNER TO freecodecamp;

--
-- Name: god_god_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.god_god_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.god_god_id_seq OWNER TO freecodecamp;

--
-- Name: god_god_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.god_god_id_seq OWNED BY public.god.god_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(60) NOT NULL,
    age_in_mil_yrs numeric(4,1),
    description text,
    albedo integer,
    is_spehrical boolean,
    has_life boolean,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(60) NOT NULL,
    age_in_mil_yrs numeric(4,1) NOT NULL,
    description text NOT NULL,
    albedo integer,
    is_spehrical boolean,
    has_life boolean,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(60) NOT NULL,
    age_in_mil_yrs numeric(4,1) NOT NULL,
    description text NOT NULL,
    albedo integer,
    is_spehrical boolean,
    has_life boolean,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_id_seq OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


--
-- Name: god god_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.god ALTER COLUMN god_id SET DEFAULT nextval('public.god_god_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 13.6, 'The one we are in', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (2, 'NGC 3246', 345.0, 'very bright and pecilur', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (3, 'Andromeda Galaxy', 10.1, 'closest to all', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (4, 'Cygnus A Galaxy', 13.1, 'weird random discription to all', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (5, 'Virgo A Galaxy', 134.4, 'weird random discriptio', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (6, 'Mangellanic Clouds', 134.4, 'cloudy cloudy all the time', NULL, NULL, NULL);


--
-- Data for Name: god; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.god VALUES (1, 'punit', NULL);
INSERT INTO public.god VALUES (2, 'moheet', NULL);
INSERT INTO public.god VALUES (3, 'sumit', NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon 1', NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO public.moon VALUES (2, 'Moon2', NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO public.moon VALUES (3, 'Moon3', NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO public.moon VALUES (4, 'Moon4', NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO public.moon VALUES (5, 'Moon5', NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO public.moon VALUES (6, 'Moon6', NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO public.moon VALUES (7, 'Moon7', NULL, NULL, NULL, NULL, NULL, 3);
INSERT INTO public.moon VALUES (8, 'Moon8', NULL, NULL, NULL, NULL, NULL, 3);
INSERT INTO public.moon VALUES (9, 'Moon9', NULL, NULL, NULL, NULL, NULL, 3);
INSERT INTO public.moon VALUES (10, 'Moon10', NULL, NULL, NULL, NULL, NULL, 4);
INSERT INTO public.moon VALUES (11, 'Moon11', NULL, NULL, NULL, NULL, NULL, 4);
INSERT INTO public.moon VALUES (12, 'Moon12', NULL, NULL, NULL, NULL, NULL, 4);
INSERT INTO public.moon VALUES (13, 'Moon13', NULL, NULL, NULL, NULL, NULL, 5);
INSERT INTO public.moon VALUES (14, 'Moon14', NULL, NULL, NULL, NULL, NULL, 5);
INSERT INTO public.moon VALUES (15, 'Moon15', NULL, NULL, NULL, NULL, NULL, 5);
INSERT INTO public.moon VALUES (16, 'Moon16', NULL, NULL, NULL, NULL, NULL, 6);
INSERT INTO public.moon VALUES (17, 'Moon17', NULL, NULL, NULL, NULL, NULL, 6);
INSERT INTO public.moon VALUES (18, 'Moon18', NULL, NULL, NULL, NULL, NULL, 6);
INSERT INTO public.moon VALUES (19, 'Moon19', NULL, NULL, NULL, NULL, NULL, 3);
INSERT INTO public.moon VALUES (20, 'Moon20', NULL, NULL, NULL, NULL, NULL, 4);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Sirus planet 1', 230.0, 'First planet of Sirus star', NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES (2, 'Sirus planet 2', 230.0, 'Second planet of Sirus star', NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES (3, 'Canopus planet 1', 25.5, 'FIrst planet of Canopus star', NULL, NULL, NULL, 2);
INSERT INTO public.planet VALUES (4, 'Canopus planet 2', 25.5, 'Second plane to fCanopus star', NULL, NULL, NULL, 2);
INSERT INTO public.planet VALUES (5, 'Gamma Planet 1', 17.0, 'First planet of Gamma Star', NULL, NULL, NULL, 3);
INSERT INTO public.planet VALUES (6, 'Gamma Planet 2', 17.0, 'Second plannt of Gamma Star', NULL, NULL, NULL, 3);
INSERT INTO public.planet VALUES (7, 'Lambda planet 1', 32.0, 'First planet of Lambda Star', NULL, NULL, NULL, 6);
INSERT INTO public.planet VALUES (8, 'Lambda planet 2', 32.0, 'Second planet of Lambda Star', NULL, NULL, NULL, 6);
INSERT INTO public.planet VALUES (9, 'Archernar planet 1', 37.3, 'First planet of Archernar star', NULL, NULL, NULL, 5);
INSERT INTO public.planet VALUES (10, 'Archernar planet 2', 37.3, 'Second planet of Archernar star', NULL, NULL, NULL, 5);
INSERT INTO public.planet VALUES (11, 'Saiph planet 1', 11.1, 'First pleanet of sapith', NULL, NULL, NULL, 4);
INSERT INTO public.planet VALUES (12, 'Saiph planet 2', 11.1, 'Second planet of Sapih', NULL, NULL, NULL, 4);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sirius', 230.0, 'Brightest', NULL, NULL, NULL, 1);
INSERT INTO public.star VALUES (2, 'Canopus', 25.5, 'Second Brightest', NULL, NULL, NULL, 1);
INSERT INTO public.star VALUES (3, 'Gamma Velorum', 17.0, 'quadruple star system', NULL, NULL, NULL, 1);
INSERT INTO public.star VALUES (6, 'Lambda Velorum', 32.0, 'Suhail', NULL, NULL, NULL, 2);
INSERT INTO public.star VALUES (5, 'Achernar', 37.3, 'Eridanus', NULL, NULL, NULL, 1);
INSERT INTO public.star VALUES (4, 'Saiph', 11.1, 'Sixth Brightest Star', NULL, NULL, NULL, 1);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 6, true);


--
-- Name: god_god_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.god_god_id_seq', 3, true);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 20, true);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 12, true);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: god god_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.god
    ADD CONSTRAINT god_pkey PRIMARY KEY (god_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: god name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.god
    ADD CONSTRAINT name_unique UNIQUE (name);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

