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
-- Name: galaxies_stars; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxies_stars (
    galaxy_id integer,
    name character varying(30),
    description text,
    diameter numeric(100,0),
    important boolean,
    star_id integer NOT NULL,
    star_name character varying(30) NOT NULL,
    num_of_planets integer,
    star_galaxy_id integer,
    galaxies_stars_id integer NOT NULL
);


ALTER TABLE public.galaxies_stars OWNER TO freecodecamp;

--
-- Name: galaxies_stars_galaxies_stars_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxies_stars_galaxies_stars_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxies_stars_galaxies_stars_id_seq OWNER TO freecodecamp;

--
-- Name: galaxies_stars_galaxies_stars_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxies_stars_galaxies_stars_id_seq OWNED BY public.galaxies_stars.galaxies_stars_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text NOT NULL,
    diameter numeric(100,0),
    important boolean
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
    name character varying(30),
    planet_id integer NOT NULL,
    description text,
    important boolean
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
    num_of_moons integer,
    diameter numeric,
    star_id integer NOT NULL,
    has_moons boolean,
    has_rings boolean
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
    name character varying(30) NOT NULL,
    num_of_planets integer,
    galaxy_id integer NOT NULL,
    important boolean
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
-- Name: galaxies_stars galaxies_stars_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxies_stars ALTER COLUMN galaxies_stars_id SET DEFAULT nextval('public.galaxies_stars_galaxies_stars_id_seq'::regclass);


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
-- Data for Name: galaxies_stars; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxies_stars VALUES (1, 'Milky Way', 'The galaxy that contains our solar system', 27, NULL, 4, 'Alpha Canis Majoris', 0, 1, 1);
INSERT INTO public.galaxies_stars VALUES (1, 'Milky Way', 'The galaxy that contains our solar system', 27, NULL, 1, 'Sun', 8, 1, 2);
INSERT INTO public.galaxies_stars VALUES (1, 'Milky Way', 'The galaxy that contains our solar system', 27, NULL, 5, 'Luyten 726-8', 0, 1, 3);
INSERT INTO public.galaxies_stars VALUES (1, 'Milky Way', 'The galaxy that contains our solar system', 27, NULL, 6, 'Ross 154', 0, 1, 4);
INSERT INTO public.galaxies_stars VALUES (1, 'Milky Way', 'The galaxy that contains our solar system', 27, NULL, 2, 'Proxima Centauri', 3, 1, 5);
INSERT INTO public.galaxies_stars VALUES (1, 'Milky Way', 'The galaxy that contains our solar system', 27, NULL, 3, 'Wolf 359', 2, 1, 6);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'The galaxy that contains our solar system', 27, NULL);
INSERT INTO public.galaxy VALUES (2, 'Andromeda Galaxy', 'Next to us and yet so far', 47, NULL);
INSERT INTO public.galaxy VALUES (3, 'Triangulum Galaxy', 'Much smaller than our galaxy', 18, NULL);
INSERT INTO public.galaxy VALUES (4, 'Cygnus A', 'One of the strongest radio sources in the sky', 549, NULL);
INSERT INTO public.galaxy VALUES (5, 'Messier 87', 'A supergiant elliptical galaxy', 9, NULL);
INSERT INTO public.galaxy VALUES (6, 'Canis Major Overdensity', 'Disputed irregular dwarf galaxy', 12, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, NULL, NULL);
INSERT INTO public.moon VALUES (2, 'Hypothetical moon of Mercury', 2, NULL, NULL);
INSERT INTO public.moon VALUES (3, 'Phobos', 4, NULL, NULL);
INSERT INTO public.moon VALUES (4, 'Deimos', 4, NULL, NULL);
INSERT INTO public.moon VALUES (5, 'Io', 5, NULL, NULL);
INSERT INTO public.moon VALUES (6, 'Europa', 5, NULL, NULL);
INSERT INTO public.moon VALUES (7, 'Ganimede', 5, NULL, NULL);
INSERT INTO public.moon VALUES (8, 'Callisto', 5, NULL, NULL);
INSERT INTO public.moon VALUES (9, 'Metis', 5, NULL, NULL);
INSERT INTO public.moon VALUES (10, 'Adrastea', 5, NULL, NULL);
INSERT INTO public.moon VALUES (11, 'Amalthea', 5, NULL, NULL);
INSERT INTO public.moon VALUES (12, 'Thebe', 5, NULL, NULL);
INSERT INTO public.moon VALUES (13, 'Themisto', 5, NULL, NULL);
INSERT INTO public.moon VALUES (14, 'Himalia Group', 5, NULL, NULL);
INSERT INTO public.moon VALUES (15, 'Carpo', 5, NULL, NULL);
INSERT INTO public.moon VALUES (16, 'Valetudo', 5, NULL, NULL);
INSERT INTO public.moon VALUES (17, 'Carme group', 5, NULL, NULL);
INSERT INTO public.moon VALUES (18, 'Ananke group', 5, NULL, NULL);
INSERT INTO public.moon VALUES (19, 'Pasiphae group', 5, NULL, NULL);
INSERT INTO public.moon VALUES (20, 'Rhea', 6, NULL, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 12742, 1, true, false);
INSERT INTO public.planet VALUES (2, 'Mercury', 1, 4.5, 1, true, false);
INSERT INTO public.planet VALUES (3, 'Venus', 0, 5.6, 1, false, false);
INSERT INTO public.planet VALUES (4, 'Mars', 2, 6, 1, true, false);
INSERT INTO public.planet VALUES (5, 'Jupiter', 82, 1000, 1, true, true);
INSERT INTO public.planet VALUES (6, 'Saturn', 83, 2000, 1, true, true);
INSERT INTO public.planet VALUES (7, 'Uranus', 20, 234234, 1, true, false);
INSERT INTO public.planet VALUES (8, 'Neptune', 10, 923847, 1, true, false);
INSERT INTO public.planet VALUES (9, 'Pluto', 3, 244, 1, true, false);
INSERT INTO public.planet VALUES (10, 'Haumea', 2, 244, 1, true, false);
INSERT INTO public.planet VALUES (11, 'Makemake', 2, 244, 1, true, false);
INSERT INTO public.planet VALUES (12, 'Quaoar', 2, 244, 1, true, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (4, 'Alpha Canis Majoris', 0, 1, NULL);
INSERT INTO public.star VALUES (1, 'Sun', 8, 1, NULL);
INSERT INTO public.star VALUES (5, 'Luyten 726-8', 0, 1, NULL);
INSERT INTO public.star VALUES (6, 'Ross 154', 0, 1, NULL);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 3, 1, NULL);
INSERT INTO public.star VALUES (3, 'Wolf 359', 2, 1, NULL);


--
-- Name: galaxies_stars_galaxies_stars_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxies_stars_galaxies_stars_id_seq', 6, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxies_stars galaxies_stars_galaxies_stars_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxies_stars
    ADD CONSTRAINT galaxies_stars_galaxies_stars_id_key UNIQUE (galaxies_stars_id);


--
-- Name: galaxy galaxy_pk; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pk PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pk; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pk PRIMARY KEY (moon_id);


--
-- Name: moon moonname_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moonname_unique UNIQUE (name);


--
-- Name: galaxy name_notnull; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT name_notnull UNIQUE (name);


--
-- Name: star name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT name_unique UNIQUE (name);


--
-- Name: planet planet_pk; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pk PRIMARY KEY (planet_id);


--
-- Name: planet planetname_notnull; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planetname_notnull UNIQUE (name);


--
-- Name: galaxies_stars sg_pk; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxies_stars
    ADD CONSTRAINT sg_pk PRIMARY KEY (galaxies_stars_id);


--
-- Name: star star_pk; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pk PRIMARY KEY (star_id);


--
-- Name: star fk_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon fk_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

