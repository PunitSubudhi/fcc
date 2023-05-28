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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' 
LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    user_id integer,
    no_guesses integer,
    game_id integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: 
freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; 
Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    user_name character varying(22)
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: 
freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; 
Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT 
nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT 
nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: 
freecodecamp
--

INSERT INTO public.games VALUES (15, 20, 4);
INSERT INTO public.games VALUES (15, 9, 5);
INSERT INTO public.games VALUES (16, 142, 6);
INSERT INTO public.games VALUES (17, 793, 7);
INSERT INTO public.games VALUES (16, 124, 8);
INSERT INTO public.games VALUES (16, 143, 9);
INSERT INTO public.games VALUES (16, 525, 10);
INSERT INTO public.games VALUES (19, 266, 11);
INSERT INTO public.games VALUES (19, 38, 12);
INSERT INTO public.games VALUES (20, 646, 13);
INSERT INTO public.games VALUES (20, 866, 14);
INSERT INTO public.games VALUES (19, 370, 15);
INSERT INTO public.games VALUES (19, 196, 16);
INSERT INTO public.games VALUES (19, 70, 17);
INSERT INTO public.games VALUES (21, 462, 18);
INSERT INTO public.games VALUES (21, 374, 19);
INSERT INTO public.games VALUES (22, 816, 20);
INSERT INTO public.games VALUES (22, 48, 21);
INSERT INTO public.games VALUES (21, 151, 22);
INSERT INTO public.games VALUES (21, 164, 23);
INSERT INTO public.games VALUES (21, 107, 24);
INSERT INTO public.games VALUES (23, 385, 25);
INSERT INTO public.games VALUES (23, 163, 26);
INSERT INTO public.games VALUES (24, 62, 27);
INSERT INTO public.games VALUES (24, 863, 28);
INSERT INTO public.games VALUES (23, 396, 29);
INSERT INTO public.games VALUES (23, 275, 30);
INSERT INTO public.games VALUES (23, 330, 31);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: 
freecodecamp
--

INSERT INTO public.users VALUES (15, 'Punit Subudhi');
INSERT INTO public.users VALUES (16, 'user_1685267041800');
INSERT INTO public.users VALUES (17, 'user_1685267041799');
INSERT INTO public.users VALUES (18, 'ps');
INSERT INTO public.users VALUES (19, 'user_1685267128155');
INSERT INTO public.users VALUES (20, 'user_1685267128154');
INSERT INTO public.users VALUES (21, 'user_1685267146419');
INSERT INTO public.users VALUES (22, 'user_1685267146418');
INSERT INTO public.users VALUES (23, 'user_1685267282272');
INSERT INTO public.users VALUES (24, 'user_1685267282271');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: 
freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 31, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: 
freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 24, true);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: 
freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; 
Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES 
public.users(user_id);


--
-- PostgreSQL database dump complete
--


