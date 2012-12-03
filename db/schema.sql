--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: character; Type: TABLE; Schema: public; Owner: seinfeld; Tablespace: 
--

CREATE TABLE "character" (
    character_id integer NOT NULL,
    name text,
    alternate_id integer
);


ALTER TABLE public."character" OWNER TO seinfeld;

--
-- Name: character_character_id_seq; Type: SEQUENCE; Schema: public; Owner: seinfeld
--

CREATE SEQUENCE character_character_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.character_character_id_seq OWNER TO seinfeld;

--
-- Name: character_character_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: seinfeld
--

ALTER SEQUENCE character_character_id_seq OWNED BY "character".character_id;


--
-- Name: episode; Type: TABLE; Schema: public; Owner: seinfeld; Tablespace: 
--

CREATE TABLE episode (
    episode_id integer NOT NULL,
    title text NOT NULL,
    airdate date NOT NULL,
    season integer NOT NULL,
    seasonnumber integer NOT NULL,
    imdbrating real,
    synopsis text,
    production_code integer,
    episode_number integer,
    generated_synopsis text
);


ALTER TABLE public.episode OWNER TO seinfeld;

--
-- Name: episode_episode_id_seq; Type: SEQUENCE; Schema: public; Owner: seinfeld
--

CREATE SEQUENCE episode_episode_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.episode_episode_id_seq OWNER TO seinfeld;

--
-- Name: episode_episode_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: seinfeld
--

ALTER SEQUENCE episode_episode_id_seq OWNED BY episode.episode_id;


--
-- Name: episode_has_person_in_role; Type: TABLE; Schema: public; Owner: seinfeld; Tablespace: 
--

CREATE TABLE episode_has_person_in_role (
    episode_id integer,
    person_id integer,
    role_id integer,
    character_id integer
);


ALTER TABLE public.episode_has_person_in_role OWNER TO seinfeld;

--
-- Name: person; Type: TABLE; Schema: public; Owner: seinfeld; Tablespace: 
--

CREATE TABLE person (
    person_id integer NOT NULL,
    name text NOT NULL,
    noteable boolean
);


ALTER TABLE public.person OWNER TO seinfeld;

--
-- Name: person_person_id_seq; Type: SEQUENCE; Schema: public; Owner: seinfeld
--

CREATE SEQUENCE person_person_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.person_person_id_seq OWNER TO seinfeld;

--
-- Name: person_person_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: seinfeld
--

ALTER SEQUENCE person_person_id_seq OWNED BY person.person_id;


--
-- Name: role; Type: TABLE; Schema: public; Owner: seinfeld; Tablespace: 
--

CREATE TABLE role (
    role_id integer NOT NULL,
    name text
);


ALTER TABLE public.role OWNER TO seinfeld;

--
-- Name: role_role_id_seq; Type: SEQUENCE; Schema: public; Owner: seinfeld
--

CREATE SEQUENCE role_role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.role_role_id_seq OWNER TO seinfeld;

--
-- Name: role_role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: seinfeld
--

ALTER SEQUENCE role_role_id_seq OWNED BY role.role_id;


--
-- Name: character_id; Type: DEFAULT; Schema: public; Owner: seinfeld
--

ALTER TABLE ONLY "character" ALTER COLUMN character_id SET DEFAULT nextval('character_character_id_seq'::regclass);


--
-- Name: episode_id; Type: DEFAULT; Schema: public; Owner: seinfeld
--

ALTER TABLE ONLY episode ALTER COLUMN episode_id SET DEFAULT nextval('episode_episode_id_seq'::regclass);


--
-- Name: person_id; Type: DEFAULT; Schema: public; Owner: seinfeld
--

ALTER TABLE ONLY person ALTER COLUMN person_id SET DEFAULT nextval('person_person_id_seq'::regclass);


--
-- Name: role_id; Type: DEFAULT; Schema: public; Owner: seinfeld
--

ALTER TABLE ONLY role ALTER COLUMN role_id SET DEFAULT nextval('role_role_id_seq'::regclass);


--
-- Name: key; Type: CONSTRAINT; Schema: public; Owner: seinfeld; Tablespace: 
--

ALTER TABLE ONLY episode
    ADD CONSTRAINT key PRIMARY KEY (episode_id);


--
-- Name: person_id_key; Type: CONSTRAINT; Schema: public; Owner: seinfeld; Tablespace: 
--

ALTER TABLE ONLY person
    ADD CONSTRAINT person_id_key PRIMARY KEY (person_id);


--
-- Name: role_id_key; Type: CONSTRAINT; Schema: public; Owner: seinfeld; Tablespace: 
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_id_key PRIMARY KEY (role_id);


--
-- PostgreSQL database dump complete
--

