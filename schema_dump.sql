--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2
-- Dumped by pg_dump version 16.2

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
-- Name: daily_recommended_values; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.daily_recommended_values (
    nutrient_id integer NOT NULL,
    nutrient_name character varying(255),
    recommended_amount integer
);


ALTER TABLE public.daily_recommended_values OWNER TO postgres;

--
-- Name: daily_recommended_values_nutrient_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.daily_recommended_values_nutrient_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.daily_recommended_values_nutrient_id_seq OWNER TO postgres;

--
-- Name: daily_recommended_values_nutrient_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.daily_recommended_values_nutrient_id_seq OWNED BY public.daily_recommended_values.nutrient_id;


--
-- Name: food_logs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.food_logs (
    log_id integer NOT NULL,
    user_id integer,
    food_id integer,
    date_consumed date,
    servings integer
);


ALTER TABLE public.food_logs OWNER TO postgres;

--
-- Name: food_logs_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.food_logs_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.food_logs_log_id_seq OWNER TO postgres;

--
-- Name: food_logs_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.food_logs_log_id_seq OWNED BY public.food_logs.log_id;


--
-- Name: foods; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.foods (
    food_id integer NOT NULL,
    fdc_id integer NOT NULL,
    description character varying(255) NOT NULL
);


ALTER TABLE public.foods OWNER TO postgres;

--
-- Name: foods_food_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.foods_food_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.foods_food_id_seq OWNER TO postgres;

--
-- Name: foods_food_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.foods_food_id_seq OWNED BY public.foods.food_id;


--
-- Name: nutritional_details; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.nutritional_details (
    detail_id integer NOT NULL,
    food_id integer,
    nutrient_id integer,
    amount numeric
);


ALTER TABLE public.nutritional_details OWNER TO postgres;

--
-- Name: nutritional_details_detail_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.nutritional_details_detail_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.nutritional_details_detail_id_seq OWNER TO postgres;

--
-- Name: nutritional_details_detail_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.nutritional_details_detail_id_seq OWNED BY public.nutritional_details.detail_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(255) NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_user_id_seq OWNER TO postgres;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: daily_recommended_values nutrient_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.daily_recommended_values ALTER COLUMN nutrient_id SET DEFAULT nextval('public.daily_recommended_values_nutrient_id_seq'::regclass);


--
-- Name: food_logs log_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.food_logs ALTER COLUMN log_id SET DEFAULT nextval('public.food_logs_log_id_seq'::regclass);


--
-- Name: foods food_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.foods ALTER COLUMN food_id SET DEFAULT nextval('public.foods_food_id_seq'::regclass);


--
-- Name: nutritional_details detail_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nutritional_details ALTER COLUMN detail_id SET DEFAULT nextval('public.nutritional_details_detail_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Name: daily_recommended_values daily_recommended_values_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.daily_recommended_values
    ADD CONSTRAINT daily_recommended_values_pkey PRIMARY KEY (nutrient_id);


--
-- Name: food_logs food_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.food_logs
    ADD CONSTRAINT food_logs_pkey PRIMARY KEY (log_id);


--
-- Name: foods foods_fdc_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.foods
    ADD CONSTRAINT foods_fdc_id_key UNIQUE (fdc_id);


--
-- Name: foods foods_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.foods
    ADD CONSTRAINT foods_pkey PRIMARY KEY (food_id);


--
-- Name: nutritional_details nutritional_details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nutritional_details
    ADD CONSTRAINT nutritional_details_pkey PRIMARY KEY (detail_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: food_logs food_logs_food_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.food_logs
    ADD CONSTRAINT food_logs_food_id_fkey FOREIGN KEY (food_id) REFERENCES public.foods(food_id);


--
-- Name: food_logs food_logs_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.food_logs
    ADD CONSTRAINT food_logs_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- Name: nutritional_details nutritional_details_food_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nutritional_details
    ADD CONSTRAINT nutritional_details_food_id_fkey FOREIGN KEY (food_id) REFERENCES public.foods(food_id);


--
-- PostgreSQL database dump complete
--

