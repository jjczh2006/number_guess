--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


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
-- Name: guess; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.guess (
    user_name character varying(40) NOT NULL,
    num_games integer,
    best_games integer
);


ALTER TABLE public.guess OWNER TO freecodecamp;

--
-- Data for Name: guess; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.guess VALUES ('user_1727596776808', 2, 113);
INSERT INTO public.guess VALUES ('user_1727596776809', 5, 209);
INSERT INTO public.guess VALUES ('user_1727596799535', 2, 34);
INSERT INTO public.guess VALUES ('user_1727596799536', 5, 105);
INSERT INTO public.guess VALUES ('chaz', 2, 8);
INSERT INTO public.guess VALUES ('user_1727596942268', 2, 474);
INSERT INTO public.guess VALUES ('user_1727596942269', 5, 399);
INSERT INTO public.guess VALUES ('user_1727597021097', 2, 197);
INSERT INTO public.guess VALUES ('user_1727597021098', 5, 374);


--
-- Name: guess guess_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.guess
    ADD CONSTRAINT guess_pkey PRIMARY KEY (user_name);


--
-- PostgreSQL database dump complete
--

