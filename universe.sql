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
-- Name: add_info; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.add_info (
    add_info_id integer NOT NULL,
    planet_id integer NOT NULL,
    gas_solid character varying(20),
    habitable boolean,
    gravity numeric,
    name character varying(30),
    extra text
);


ALTER TABLE public.add_info OWNER TO freecodecamp;

--
-- Name: add_info_add_info_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.add_info_add_info_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.add_info_add_info_id_seq OWNER TO freecodecamp;

--
-- Name: add_info_add_info_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.add_info_add_info_id_seq OWNED BY public.add_info.add_info_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(40) NOT NULL,
    distance_to_earth_in_kpc integer,
    size_in_kpc integer,
    is_spiral boolean,
    can_see_naked_eye boolean
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
    name character varying(40) NOT NULL,
    planet_id integer NOT NULL,
    surface_area numeric,
    bigger_than_moon boolean
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
    name character varying(40) NOT NULL,
    star_id integer NOT NULL,
    mean_radius integer,
    mean_t_in_c integer,
    bigger_than_earth boolean,
    further_than_earth_from_sun boolean
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
    name character varying(40) NOT NULL,
    distance_to_earth_in_pc integer,
    temperature integer,
    double_star boolean,
    variable_star boolean,
    galaxy_id integer NOT NULL
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
-- Name: add_info add_info_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.add_info ALTER COLUMN add_info_id SET DEFAULT nextval('public.add_info_add_info_id_seq'::regclass);


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
-- Data for Name: add_info; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.add_info VALUES (1, 1, 'solid', true, 9.8, NULL, NULL);
INSERT INTO public.add_info VALUES (2, 2, 'solid', false, 3.72, NULL, NULL);
INSERT INTO public.add_info VALUES (3, 3, 'solid', false, 8.87, NULL, NULL);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 0, 27, true, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 765, 47, true, true);
INSERT INTO public.galaxy VALUES (3, 'Large Magellanic Cloud', 50, 10, false, true);
INSERT INTO public.galaxy VALUES (4, 'Small Magellanic Cloud', 63, 6, false, true);
INSERT INTO public.galaxy VALUES (5, 'Pinwheel Galaxy', 6404, 52, true, false);
INSERT INTO public.galaxy VALUES (6, 'Hoags Object', 187756, 40, false, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (4, 'Ganymede', 5, 87, true);
INSERT INTO public.moon VALUES (3, 'Europa', 5, 30.9, true);
INSERT INTO public.moon VALUES (2, 'Io', 5, 41.9, true);
INSERT INTO public.moon VALUES (5, 'Callisto', 5, 73, true);
INSERT INTO public.moon VALUES (6, 'Mimas', 6, 0.5, false);
INSERT INTO public.moon VALUES (7, 'Enceladus', 6, 0.8, false);
INSERT INTO public.moon VALUES (8, 'Tethys', 6, 3.57, false);
INSERT INTO public.moon VALUES (9, 'Dione', 6, 3.96, false);
INSERT INTO public.moon VALUES (10, 'Rhea', 6, 7.34, false);
INSERT INTO public.moon VALUES (11, 'Titan', 6, 7.83, true);
INSERT INTO public.moon VALUES (12, 'Iapetus', 6, 6.7, false);
INSERT INTO public.moon VALUES (14, 'Miranda', 7, 0.7, false);
INSERT INTO public.moon VALUES (15, 'Ariel', 7, 4.2, false);
INSERT INTO public.moon VALUES (16, 'Titania', 7, 7.82, false);
INSERT INTO public.moon VALUES (17, 'Oberon', 7, 7.28, false);
INSERT INTO public.moon VALUES (18, 'Triton', 7, 23.02, false);
INSERT INTO public.moon VALUES (19, 'Charon', 7, 4.58, false);
INSERT INTO public.moon VALUES (20, 'Phoebe', 6, 0.14, false);
INSERT INTO public.moon VALUES (1, 'Moon', 1, 37.93, false);
INSERT INTO public.moon VALUES (21, 'Hyperion', 6, 0.2, false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 6371, 14, NULL, NULL);
INSERT INTO public.planet VALUES (2, 'Mars', 1, 3390, -60, false, true);
INSERT INTO public.planet VALUES (3, 'Venus', 1, 6052, 464, false, false);
INSERT INTO public.planet VALUES (4, 'Mercury', 1, 4880, 67, false, false);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 69911, -108, true, true);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 58232, -139, true, true);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 23362, -197, true, true);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 24622, -201, true, true);
INSERT INTO public.planet VALUES (9, 'Ceres', 1, 939, -101, false, true);
INSERT INTO public.planet VALUES (10, 'Pluto', 1, 188, -101, false, true);
INSERT INTO public.planet VALUES (12, 'Makemake', 1, 715, -237, false, true);
INSERT INTO public.planet VALUES (11, 'Haumea', 1, 780, 241, false, true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 0, 5772, false, false, 1);
INSERT INTO public.star VALUES (3, 'Antares', 170, 3660, false, false, 1);
INSERT INTO public.star VALUES (6, 'VV Cephei', 1500, 3396, false, false, 1);
INSERT INTO public.star VALUES (2, 'HD 222399', 93, 5921, true, false, 2);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 168, 3600, false, true, 1);
INSERT INTO public.star VALUES (5, 'UY Scuti', 2900, 3365, false, true, 1);


--
-- Name: add_info_add_info_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.add_info_add_info_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


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
-- Name: add_info add_info_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.add_info
    ADD CONSTRAINT add_info_name_key UNIQUE (name);


--
-- Name: add_info add_info_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.add_info
    ADD CONSTRAINT add_info_pkey PRIMARY KEY (add_info_id);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


--
-- Name: add_info add_info_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.add_info
    ADD CONSTRAINT add_info_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


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

