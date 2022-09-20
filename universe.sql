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
-- Name: distance_from_earth; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.distance_from_earth (
    distance_from_earth_id integer NOT NULL,
    name character varying(30) NOT NULL,
    distance_from_earth_in_light_years character varying(30) NOT NULL
);


ALTER TABLE public.distance_from_earth OWNER TO freecodecamp;

--
-- Name: distance_from_earth_distance_from_earth_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.distance_from_earth_distance_from_earth_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.distance_from_earth_distance_from_earth_id_seq OWNER TO freecodecamp;

--
-- Name: distance_from_earth_distance_from_earth_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.distance_from_earth_distance_from_earth_id_seq OWNED BY public.distance_from_earth.distance_from_earth_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_description text,
    number_of_stars_in_millions integer NOT NULL,
    distance_from_earth_id integer NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    planet_id integer NOT NULL,
    is_frozen boolean NOT NULL,
    is_inhabited boolean
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    star_id integer,
    has_atmosphere boolean NOT NULL,
    number_of_moons integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30),
    galaxy_id integer NOT NULL,
    diameter_in_km numeric(5,2) NOT NULL,
    age_in_millions_of_years numeric(8,0)
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: distance_from_earth distance_from_earth_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.distance_from_earth ALTER COLUMN distance_from_earth_id SET DEFAULT nextval('public.distance_from_earth_distance_from_earth_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: distance_from_earth; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.distance_from_earth VALUES (1, 'very close', 'up to 2 light years');
INSERT INTO public.distance_from_earth VALUES (2, 'close', 'up to 5 light years');
INSERT INTO public.distance_from_earth VALUES (3, 'medium', 'up to 10 light years');
INSERT INTO public.distance_from_earth VALUES (4, 'far', 'up to 100 light years');
INSERT INTO public.distance_from_earth VALUES (5, 'very far', 'more than 100 light years');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (2, 'Galaxy one', 'cool galaxy', 25, 1);
INSERT INTO public.galaxy VALUES (3, 'Galaxy two', 'super galaxy', 10, 3);
INSERT INTO public.galaxy VALUES (4, 'Galaxy three', 'nice galaxy', 36, 2);
INSERT INTO public.galaxy VALUES (5, 'Galaxy four', 'hot galaxy', 50, 4);
INSERT INTO public.galaxy VALUES (6, 'Galaxy five', 'pretty galaxy', 150, 4);
INSERT INTO public.galaxy VALUES (7, 'Galaxy six', 'red galaxy', 49, 5);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'MOON A', 3, true, false);
INSERT INTO public.moon VALUES (2, 'MOON B', 3, true, false);
INSERT INTO public.moon VALUES (3, 'MOON C', 3, true, false);
INSERT INTO public.moon VALUES (4, 'MOON D', 4, true, false);
INSERT INTO public.moon VALUES (5, 'MOON E', 6, true, false);
INSERT INTO public.moon VALUES (6, 'MOON F', 6, true, false);
INSERT INTO public.moon VALUES (7, 'MOON G', 6, true, false);
INSERT INTO public.moon VALUES (8, 'MOON H', 7, true, false);
INSERT INTO public.moon VALUES (9, 'MOON I', 8, true, false);
INSERT INTO public.moon VALUES (10, 'MOON J', 9, true, false);
INSERT INTO public.moon VALUES (11, 'MOON K', 9, false, false);
INSERT INTO public.moon VALUES (13, 'MOON L', 9, false, NULL);
INSERT INTO public.moon VALUES (14, 'MOON M', 9, false, NULL);
INSERT INTO public.moon VALUES (15, 'MOON N', 10, false, NULL);
INSERT INTO public.moon VALUES (16, 'MOON O', 11, false, NULL);
INSERT INTO public.moon VALUES (17, 'MOON P', 11, false, NULL);
INSERT INTO public.moon VALUES (18, 'MOON Q', 12, false, NULL);
INSERT INTO public.moon VALUES (19, 'MOON R', 12, false, NULL);
INSERT INTO public.moon VALUES (20, 'MOON S', 12, false, NULL);
INSERT INTO public.moon VALUES (21, 'MOON T', 12, false, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Planet A', 1, true, 0);
INSERT INTO public.planet VALUES (2, 'Planet B', 1, true, 0);
INSERT INTO public.planet VALUES (3, 'Planet C', 1, false, 3);
INSERT INTO public.planet VALUES (4, 'Planet D', 2, false, 1);
INSERT INTO public.planet VALUES (5, 'Planet E', 2, true, 0);
INSERT INTO public.planet VALUES (6, 'Planet F', 3, true, 3);
INSERT INTO public.planet VALUES (7, 'Planet G', 4, true, 1);
INSERT INTO public.planet VALUES (8, 'Planet H', 4, false, 1);
INSERT INTO public.planet VALUES (9, 'Planet I', 5, true, 4);
INSERT INTO public.planet VALUES (10, 'Planet J', 5, true, 1);
INSERT INTO public.planet VALUES (11, 'Planet K', 5, true, 2);
INSERT INTO public.planet VALUES (12, 'Planet L', 6, false, 4);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'WHITE STAR', 2, 15.25, 156);
INSERT INTO public.star VALUES (2, 'HUGE STAR', 3, 548.23, 5545);
INSERT INTO public.star VALUES (3, 'BIG STAR', 4, 65.30, 6546546);
INSERT INTO public.star VALUES (4, 'SMALL STAR', 5, 53.23, 6546);
INSERT INTO public.star VALUES (5, 'BRIGHT STAR', 6, 153.23, 6546);
INSERT INTO public.star VALUES (6, 'YELLOW STAR', 7, 53.56, 6546);


--
-- Name: distance_from_earth_distance_from_earth_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.distance_from_earth_distance_from_earth_id_seq', 5, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: distance_from_earth distance_from_earth_distance_from_earth_in_light_years_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.distance_from_earth
    ADD CONSTRAINT distance_from_earth_distance_from_earth_in_light_years_key UNIQUE (distance_from_earth_in_light_years);


--
-- Name: distance_from_earth distance_from_earth_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.distance_from_earth
    ADD CONSTRAINT distance_from_earth_name_key UNIQUE (name);


--
-- Name: distance_from_earth distance_from_earth_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.distance_from_earth
    ADD CONSTRAINT distance_from_earth_pkey PRIMARY KEY (distance_from_earth_id);


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
-- Name: galaxy galaxy_distance_from_earth_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_distance_from_earth_id_fkey FOREIGN KEY (distance_from_earth_id) REFERENCES public.distance_from_earth(distance_from_earth_id);


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

