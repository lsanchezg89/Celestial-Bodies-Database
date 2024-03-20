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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(40) NOT NULL,
    galaxy_id integer,
    year_of_discovery integer,
    composition text,
    has_water boolean,
    orbital_period_years double precision
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(40) NOT NULL,
    size_in_kpc numeric,
    mass_in_m numeric,
    morphology text
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
    planet_id integer,
    is_unique boolean,
    gravity_in_mss numeric,
    distance_from_planet numeric,
    radius_in_km numeric
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
    number_of_moons integer,
    radius_in_km numeric,
    star_id integer,
    has_moons boolean,
    gravity_in_mss numeric
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
    galaxy_id integer,
    mass_in_m numeric,
    gravity_in_cgs_log numeric,
    radius_in_r numeric
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
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


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
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'Ceres', 1, 1801, 'C-Type', true, 4.6);
INSERT INTO public.asteroid VALUES (2, 'Eros', 1, 1898, 'S-Type', false, 1.76);
INSERT INTO public.asteroid VALUES (3, 'Pallas', 1, 1802, 'C-Type', true, 4.62);
INSERT INTO public.asteroid VALUES (4, 'Vesta', 1, 1807, 'V-Type', true, 3.63);
INSERT INTO public.asteroid VALUES (5, 'Hygiea', 1, 1849, 'C-Type', true, 5.56);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 26.8, 1150000000000, 'Spiral');
INSERT INTO public.galaxy VALUES (2, 'Andromeda Galaxy', 46.56, 1500000000000, 'Spiral');
INSERT INTO public.galaxy VALUES (3, 'Abel 1413', 245.71, 600000000000000, 'Elliptical');
INSERT INTO public.galaxy VALUES (4, 'NGC 3923', 47.5, 530000000, 'Elliptical');
INSERT INTO public.galaxy VALUES (5, 'Pinwheel Galaxy', 51.91, 1000000000000, 'Spiral');
INSERT INTO public.galaxy VALUES (6, 'Hoags Object', 39.9, 700000000000, 'Ring');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (3, 'Phobos', 4, false, 0.0057, 9377, 11.267);
INSERT INTO public.moon VALUES (5, 'Europa', 5, false, 1.315, 671000, 1560.8);
INSERT INTO public.moon VALUES (6, 'Io', 5, false, 1.796, 422000, 1821.6);
INSERT INTO public.moon VALUES (7, 'Ganymede', 5, false, 1.428, 1070000, 2634.1);
INSERT INTO public.moon VALUES (8, 'Callisto', 5, false, 1.236, 1883000, 2410.3);
INSERT INTO public.moon VALUES (9, 'Amalthea', 5, false, 0.02, 181400, 83.5);
INSERT INTO public.moon VALUES (10, 'Kallichore', 5, false, 0.001, 23300000, 1);
INSERT INTO public.moon VALUES (1, 'Luna', 1, true, 1.62, 384400, 1737.4);
INSERT INTO public.moon VALUES (2, 'Deimos', 4, false, 0.003, 23460, 6.2);
INSERT INTO public.moon VALUES (4, 'Elara', 5, false, 0.031, 11700000, 43);
INSERT INTO public.moon VALUES (11, 'Himalia', 5, false, 0.062, 11500000, 85);
INSERT INTO public.moon VALUES (12, 'Titan', 6, false, 1.352, 1200000, 2574.7);
INSERT INTO public.moon VALUES (13, 'Enceladus', 6, false, 0.113, 238000, 252.1);
INSERT INTO public.moon VALUES (14, 'Mimas', 6, false, 0.064, 186000, 198.2);
INSERT INTO public.moon VALUES (15, 'Dione', 6, false, 0.232, 377400, 561.4);
INSERT INTO public.moon VALUES (16, 'Iapetus', 6, false, 0.223, 3561000, 734.5);
INSERT INTO public.moon VALUES (17, 'Tethys', 6, false, 0.145, 295000, 531);
INSERT INTO public.moon VALUES (18, 'Hyperion', 6, false, 0.02, 1500000, 135);
INSERT INTO public.moon VALUES (19, 'Titania', 7, false, 0.367, 435840, 788.4);
INSERT INTO public.moon VALUES (20, 'Miranda', 7, false, 0.079, 129800, 235.8);
INSERT INTO public.moon VALUES (21, 'Umbriel', 7, false, 0.2, 266000, 584.7);
INSERT INTO public.moon VALUES (22, 'Oberon', 7, false, 0.358, 582600, 761.4);
INSERT INTO public.moon VALUES (23, 'Puck', 7, false, 0.019, 86010, 81);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 6378.137, 1, true, 9.8);
INSERT INTO public.planet VALUES (2, 'Mercury', 0, 2439.7, 1, false, 3.7);
INSERT INTO public.planet VALUES (3, 'Venus', 0, 6051.8, 1, false, 8.87);
INSERT INTO public.planet VALUES (5, 'Jupiter', 95, 69911, 1, true, 24.79);
INSERT INTO public.planet VALUES (4, 'Mars', 2, 3389.5, 1, true, 3.71);
INSERT INTO public.planet VALUES (6, 'Saturn', 146, 58232, 1, true, 10.44);
INSERT INTO public.planet VALUES (7, 'Uranus', 28, 25362, 1, true, 8.87);
INSERT INTO public.planet VALUES (8, 'Neptune', 16, 24622, 1, true, 11.15);
INSERT INTO public.planet VALUES (9, 'Pluto', 5, 1188.3, 1, true, 0.62);
INSERT INTO public.planet VALUES (10, 'Haumea', 2, 816, 1, true, 0.401);
INSERT INTO public.planet VALUES (11, 'Makemake', 1, 715, 1, true, 0.5);
INSERT INTO public.planet VALUES (12, 'Eris', 1, 1163, 1, true, 0.82);
INSERT INTO public.planet VALUES (13, 'Ceres', 0, 473, 1, false, 0.28);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (2, 'Adhil', 2, 2.5, 2.8, 10);
INSERT INTO public.star VALUES (1, 'Sun', 1, 1, 4.44, 1);
INSERT INTO public.star VALUES (3, 'Almach', 2, 23.7, 2, 80);
INSERT INTO public.star VALUES (4, 'Mizar', 5, 2.22, 4.4, 2.4);
INSERT INTO public.star VALUES (5, 'Alkaid', 5, 6.1, 3.78, 3.4);
INSERT INTO public.star VALUES (6, 'Unukalhai', 6, 1.66, 2.4, 13.48);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 5, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 23, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: asteroid asteroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_key UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


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
-- Name: asteroid asteroid_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


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

