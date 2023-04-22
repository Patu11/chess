--
-- PostgreSQL database dump
--

-- Dumped from database version 13.4
-- Dumped by pg_dump version 13.4

-- Started on 2022-01-24 16:14:34

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
-- TOC entry 3076 (class 1262 OID 16395)
-- Name: chess; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE chess WITH TEMPLATE = template0 ENCODING = 'UTF8';


ALTER DATABASE chess OWNER TO postgres;

\connect chess

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
-- TOC entry 203 (class 1259 OID 16570)
-- Name: comments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.comments (
    comment_id bigint NOT NULL,
    content character varying NOT NULL,
    created_at date NOT NULL,
    author_email character varying NOT NULL,
    profile_id bigint NOT NULL
);


ALTER TABLE public.comments OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 16626)
-- Name: friends; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.friends (
    friend_id bigint NOT NULL,
    user_first character varying NOT NULL,
    user_second character varying NOT NULL,
    status boolean NOT NULL,
    sender character varying
);


ALTER TABLE public.friends OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 16648)
-- Name: games; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.games (
    game_code character varying NOT NULL,
    started boolean NOT NULL,
    host character varying NOT NULL,
    player character varying,
    accepted boolean NOT NULL,
    state character varying NOT NULL,
    ended boolean NOT NULL,
    winner character varying,
    current_turn character varying,
    tournament_id bigint,
    round_id bigint
);


ALTER TABLE public.games OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 16578)
-- Name: profiles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.profiles (
    id integer NOT NULL,
    user_email character varying NOT NULL
);


ALTER TABLE public.profiles OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 16404)
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roles (
    id integer NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE public.roles OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 16707)
-- Name: rounds; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rounds (
    round_id bigint NOT NULL,
    round_number integer NOT NULL,
    tournament_id bigint
);


ALTER TABLE public.rounds OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 16668)
-- Name: tournaments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tournaments (
    tournament_id bigint NOT NULL,
    start_date date NOT NULL,
    end_date date NOT NULL,
    winner character varying,
    title character varying NOT NULL,
    max_players integer NOT NULL
);


ALTER TABLE public.tournaments OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 16396)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    email character varying NOT NULL,
    username character varying NOT NULL,
    password character varying NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 16412)
-- Name: users_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users_roles (
    user_id character varying NOT NULL,
    role_id integer NOT NULL
);


ALTER TABLE public.users_roles OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 16677)
-- Name: users_tournaments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users_tournaments (
    user_id character varying NOT NULL,
    tournament_id bigint NOT NULL
);


ALTER TABLE public.users_tournaments OWNER TO postgres;

--
-- TOC entry 3064 (class 0 OID 16570)
-- Dependencies: 203
-- Data for Name: comments; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.comments (comment_id, content, created_at, author_email, profile_id) VALUES (1, 'comment 1', '2021-12-03', 'user1@gmail.com', 11);
INSERT INTO public.comments (comment_id, content, created_at, author_email, profile_id) VALUES (2, 'comment 2', '2021-12-03', 'user1@gmail.com', 11);
INSERT INTO public.comments (comment_id, content, created_at, author_email, profile_id) VALUES (3, 'comment from admin', '2021-12-05', 'admin@gmail.com', 12);
INSERT INTO public.comments (comment_id, content, created_at, author_email, profile_id) VALUES (4, 'Comment from admin', '2021-12-13', 'admin@gmail.com', 13);
INSERT INTO public.comments (comment_id, content, created_at, author_email, profile_id) VALUES (5, 'comment 2', '2021-12-13', 'admin@gmail.com', 13);
INSERT INTO public.comments (comment_id, content, created_at, author_email, profile_id) VALUES (6, 'komentarz', '2021-12-13', 'admin@gmail.com', 13);
INSERT INTO public.comments (comment_id, content, created_at, author_email, profile_id) VALUES (8, 'second comment', '2021-12-19', 'admin@gmail.com', 15);
INSERT INTO public.comments (comment_id, content, created_at, author_email, profile_id) VALUES (7, 'first comment', '2021-12-18', 'admin@gmail.com', 15);


--
-- TOC entry 3066 (class 0 OID 16626)
-- Dependencies: 205
-- Data for Name: friends; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.friends (friend_id, user_first, user_second, status, sender) VALUES (2, 'admin@gmail.com', 'player@gmail.com', true, 'player');
INSERT INTO public.friends (friend_id, user_first, user_second, status, sender) VALUES (1, 'player@gmail.com', 'admin@gmail.com', true, 'player');
INSERT INTO public.friends (friend_id, user_first, user_second, status, sender) VALUES (4, 'user0@gmail.com', 'admin@gmail.com', true, 'admin');
INSERT INTO public.friends (friend_id, user_first, user_second, status, sender) VALUES (3, 'admin@gmail.com', 'user0@gmail.com', true, 'admin');
INSERT INTO public.friends (friend_id, user_first, user_second, status, sender) VALUES (6, 'user3@gmail.com', 'admin@gmail.com', true, 'admin');
INSERT INTO public.friends (friend_id, user_first, user_second, status, sender) VALUES (5, 'admin@gmail.com', 'user3@gmail.com', true, 'admin');
INSERT INTO public.friends (friend_id, user_first, user_second, status, sender) VALUES (7, 'user1@gmail.com', 'admin@gmail.com', false, 'user1');
INSERT INTO public.friends (friend_id, user_first, user_second, status, sender) VALUES (8, 'admin@gmail.com', 'user1@gmail.com', false, 'user1');


--
-- TOC entry 3067 (class 0 OID 16648)
-- Dependencies: 206
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.games (game_code, started, host, player, accepted, state, ended, winner, current_turn, tournament_id, round_id) VALUES ('a0Rnle', false, 'user0@gmail.com', 'user3@gmail.com', true, 'rp****PR:np****PN:bp****PB:qp****PQ:kp****PK:bp****PB:np****PN:rp****PR', true, 'user3', 'user0', 3, 7);
INSERT INTO public.games (game_code, started, host, player, accepted, state, ended, winner, current_turn, tournament_id, round_id) VALUES ('paBBB4', false, 'user3@gmail.com', 'user6@gmail.com', true, 'rp****PR:np****PN:bp****PB:qp****PQ:kp****PK:bp****PB:np****PN:rp****PR', true, 'user3', 'user3', 2, 6);
INSERT INTO public.games (game_code, started, host, player, accepted, state, ended, winner, current_turn, tournament_id, round_id) VALUES ('wFaU4C', false, 'user2@gmail.com', 'user4@gmail.com', true, 'rp****PR:np****PN:bp****PB:qp****PQ:kp****PK:bp****PB:np****PN:rp****PR', true, 'user4', 'user2', 3, 7);
INSERT INTO public.games (game_code, started, host, player, accepted, state, ended, winner, current_turn, tournament_id, round_id) VALUES ('bDbWnO', false, 'user2@gmail.com', 'user3@gmail.com', true, 'rp****PR:np****PN:bp****PB:qp****PQ:kp****PK:bp****PB:np****PN:rp****PR', true, 'user3', 'user2', 2, 4);
INSERT INTO public.games (game_code, started, host, player, accepted, state, ended, winner, current_turn, tournament_id, round_id) VALUES ('TrTrgm', false, 'user3@gmail.com', 'user4@gmail.com', false, 'rp****PR:np****PN:bp****PB:qp****PQ:kp****PK:bp****PB:np****PN:rp****PR', false, NULL, 'user3', 3, 8);
INSERT INTO public.games (game_code, started, host, player, accepted, state, ended, winner, current_turn, tournament_id, round_id) VALUES ('rX3hJD', false, 'user4@gmail.com', 'user1@gmail.com', true, 'rp****PR:np****PN:bp****PB:qp****PQ:kp****PK:bp****PB:np****PN:rp****PR', true, 'user1', 'user4', 2, 4);
INSERT INTO public.games (game_code, started, host, player, accepted, state, ended, winner, current_turn, tournament_id, round_id) VALUES ('Pnmi02', false, 'admin@gmail.com', 'user0@gmail.com', true, 'rp****PR:np****PN:bp****PB:qp****PQ:kp****PK:bp****PB:np****PN:rp****PR', true, 'user0', 'admin', NULL, NULL);
INSERT INTO public.games (game_code, started, host, player, accepted, state, ended, winner, current_turn, tournament_id, round_id) VALUES ('r3h7Ab', false, 'user7@gmail.com', 'user0@gmail.com', true, 'rp****PR:np****PN:bp****PB:qp****PQ:kp****PK:bp****PB:np****PN:rp****PR', true, 'user7', 'user7', 2, 4);
INSERT INTO public.games (game_code, started, host, player, accepted, state, ended, winner, current_turn, tournament_id, round_id) VALUES ('78wH6M', false, 'user1@gmail.com', 'user5@gmail.com', true, 'rp****PR:np****PN:bp****PB:qp****PQ:kp****PK:bp****PB:np****PN:rp****PR', true, 'user5', 'user1', 3, 7);
INSERT INTO public.games (game_code, started, host, player, accepted, state, ended, winner, current_turn, tournament_id, round_id) VALUES ('x0d4V5', false, 'user1@gmail.com', 'user2@gmail.com', false, 'rp****PR:np****PN:bp****PB:qp****PQ:kp****PK:bp****PB:np****PN:rp****PR', false, '', 'user1', 1, 1);
INSERT INTO public.games (game_code, started, host, player, accepted, state, ended, winner, current_turn, tournament_id, round_id) VALUES ('G022uO', false, 'user7@gmail.com', 'user6@gmail.com', false, 'rp****PR:np****PN:bp****PB:qp****PQ:kp****PK:bp****PB:np****PN:rp****PR', false, '', 'user7', 1, 1);
INSERT INTO public.games (game_code, started, host, player, accepted, state, ended, winner, current_turn, tournament_id, round_id) VALUES ('vIPs8b', false, 'user0@gmail.com', 'user4@gmail.com', false, 'rp****PR:np****PN:bp****PB:qp****PQ:kp****PK:bp****PB:np****PN:rp****PR', false, '', 'user0', 1, 1);
INSERT INTO public.games (game_code, started, host, player, accepted, state, ended, winner, current_turn, tournament_id, round_id) VALUES ('XorpTd', false, 'user5@gmail.com', 'user7@gmail.com', false, 'rp****PR:np****PN:bp****PB:qp****PQ:kp****PK:bp****PB:np****PN:rp****PR', false, NULL, 'user5', 3, 8);
INSERT INTO public.games (game_code, started, host, player, accepted, state, ended, winner, current_turn, tournament_id, round_id) VALUES ('TZTd56', false, 'user5@gmail.com', 'user6@gmail.com', true, 'rp****PR:np****PN:bp****PB:qp****PQ:kp****PK:bp****PB:np****PN:rp****PR', true, 'user6', 'user5', 2, 4);
INSERT INTO public.games (game_code, started, host, player, accepted, state, ended, winner, current_turn, tournament_id, round_id) VALUES ('G19AdK', false, 'user3@gmail.com', 'user5@gmail.com', true, 'rp****PR:np****PN:bp****PB:qp****PQ:kp****PK:bp****PB:np****PN:rp****PR', true, 'DRAW', 'user3', 1, 1);
INSERT INTO public.games (game_code, started, host, player, accepted, state, ended, winner, current_turn, tournament_id, round_id) VALUES ('RT1u9v', false, 'user5@gmail.com', 'user3@gmail.com', true, 'rp****PR:np****PN:bp****PB:qp****PQ:kp****PK:bp****PB:np****PN:rp****PR', true, 'DRAW', 'user5', 1, 1);
INSERT INTO public.games (game_code, started, host, player, accepted, state, ended, winner, current_turn, tournament_id, round_id) VALUES ('kjiS7m', false, 'user5@gmail.com', NULL, false, 'rp****PR:np****PN:bp****PB:qp****PQ:kp****PK:bp****PB:np****PN:rp****PR', false, NULL, 'user5', 1, 2);
INSERT INTO public.games (game_code, started, host, player, accepted, state, ended, winner, current_turn, tournament_id, round_id) VALUES ('bKzAuy', false, 'user3@gmail.com', 'user5@gmail.com', true, 'rp****PR:np****PN:bp****PB:qp****PQ:kp****PK:bp****PB:np****PN:rp****PR', true, 'user5', 'user3', 1, 1);
INSERT INTO public.games (game_code, started, host, player, accepted, state, ended, winner, current_turn, tournament_id, round_id) VALUES ('IzLCo0', false, 'user3@gmail.com', 'user1@gmail.com', true, 'rp****PR:np****PN:bp****PB:qp****PQ:kp****PK:bp****PB:np****PN:rp****PR', true, 'user3', 'user3', 2, 5);
INSERT INTO public.games (game_code, started, host, player, accepted, state, ended, winner, current_turn, tournament_id, round_id) VALUES ('DgpdMs', false, 'user7@gmail.com', 'user6@gmail.com', true, 'rp****PR:np****PN:bp****PB:qp****PQ:kp****PK:bp****PB:np****PN:rp****PR', true, 'user7', 'user7', 3, 7);
INSERT INTO public.games (game_code, started, host, player, accepted, state, ended, winner, current_turn, tournament_id, round_id) VALUES ('aL6PCq', false, 'user7@gmail.com', 'user6@gmail.com', true, 'rp****PR:np****PN:bp****PB:qp****PQ:kp****PK:bp****PB:np****PN:rp****PR', true, 'user6', 'user7', 2, 5);
INSERT INTO public.games (game_code, started, host, player, accepted, state, ended, winner, current_turn, tournament_id, round_id) VALUES ('wpTg1x', false, 'admin@gmail.com', 'user0@gmail.com', true, 'rp****PR:np****PN:bp****PB:qp****PQ:k*p***PK:bp****PB:np****PN:rp***P*R', false, NULL, 'admin', NULL, NULL);
INSERT INTO public.games (game_code, started, host, player, accepted, state, ended, winner, current_turn, tournament_id, round_id) VALUES ('mXxslK', false, 'user3@gmail.com', 'admin@gmail.com', false, 'rp****PR:np****PN:bp****PB:qp****PQ:kp****PK:bp****PB:np****PN:rp****PR', false, NULL, 'user3', NULL, NULL);


--
-- TOC entry 3065 (class 0 OID 16578)
-- Dependencies: 204
-- Data for Name: profiles; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.profiles (id, user_email) VALUES (11, 'admin@gmail.com');
INSERT INTO public.profiles (id, user_email) VALUES (12, 'user1@gmail.com');
INSERT INTO public.profiles (id, user_email) VALUES (13, 'player@gmail.com');
INSERT INTO public.profiles (id, user_email) VALUES (14, 'test@gmail.com');
INSERT INTO public.profiles (id, user_email) VALUES (15, 'user0@gmail.com');
INSERT INTO public.profiles (id, user_email) VALUES (16, 'user2@gmail.com');
INSERT INTO public.profiles (id, user_email) VALUES (17, 'user3@gmail.com');
INSERT INTO public.profiles (id, user_email) VALUES (18, 'user4@gmail.com');
INSERT INTO public.profiles (id, user_email) VALUES (19, 'user5@gmail.com');
INSERT INTO public.profiles (id, user_email) VALUES (20, 'user6@gmail.com');
INSERT INTO public.profiles (id, user_email) VALUES (21, 'user7@gmail.com');
INSERT INTO public.profiles (id, user_email) VALUES (22, 'testowy@testowy.com');


--
-- TOC entry 3062 (class 0 OID 16404)
-- Dependencies: 201
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.roles (id, name) VALUES (1, 'ADMIN');
INSERT INTO public.roles (id, name) VALUES (2, 'USER');


--
-- TOC entry 3070 (class 0 OID 16707)
-- Dependencies: 209
-- Data for Name: rounds; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.rounds (round_id, round_number, tournament_id) VALUES (1, 1, 1);
INSERT INTO public.rounds (round_id, round_number, tournament_id) VALUES (2, 2, 1);
INSERT INTO public.rounds (round_id, round_number, tournament_id) VALUES (3, 3, 1);
INSERT INTO public.rounds (round_id, round_number, tournament_id) VALUES (4, 1, 2);
INSERT INTO public.rounds (round_id, round_number, tournament_id) VALUES (5, 2, 2);
INSERT INTO public.rounds (round_id, round_number, tournament_id) VALUES (6, 3, 2);
INSERT INTO public.rounds (round_id, round_number, tournament_id) VALUES (7, 1, 3);
INSERT INTO public.rounds (round_id, round_number, tournament_id) VALUES (8, 2, 3);
INSERT INTO public.rounds (round_id, round_number, tournament_id) VALUES (9, 3, 3);


--
-- TOC entry 3068 (class 0 OID 16668)
-- Dependencies: 207
-- Data for Name: tournaments; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tournaments (tournament_id, start_date, end_date, winner, title, max_players) VALUES (1, '2021-12-19', '2021-12-20', NULL, 'Testowy', 8);
INSERT INTO public.tournaments (tournament_id, start_date, end_date, winner, title, max_players) VALUES (3, '2021-12-20', '2021-12-26', NULL, 'Testowy 3', 8);
INSERT INTO public.tournaments (tournament_id, start_date, end_date, winner, title, max_players) VALUES (2, '2021-12-20', '2021-12-30', 'user3', 'Testowy 2', 8);
INSERT INTO public.tournaments (tournament_id, start_date, end_date, winner, title, max_players) VALUES (4, '2022-01-17', '2022-01-24', NULL, 'Testowy 5', 8);


--
-- TOC entry 3061 (class 0 OID 16396)
-- Dependencies: 200
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.users (email, username, password) VALUES ('admin@gmail.com', 'admin', '$2a$10$E0VX47J2FAcbA9TjidIN3uuMsFfB8HjmWjKKA4Zdu8/AqNUqtdhqm');
INSERT INTO public.users (email, username, password) VALUES ('player@gmail.com', 'player', '$2a$10$5sin41iRMTcIiP.yvmB4sOWKixEADoc8YGs3FJSatP7tv9HWMkFBC');
INSERT INTO public.users (email, username, password) VALUES ('user1@gmail.com', 'user1', '$2a$10$90h2n6ZqGkscRk7WzwDAReko/VRYjY50QxiPfIqKR3HHs2xnboaq2');
INSERT INTO public.users (email, username, password) VALUES ('test@gmail.com', 'test', '$2a$10$aX3xNd4xq5vol54LQiHSEe/saJlRD8GgenHmdqpQSsSkxUwDVM6n6');
INSERT INTO public.users (email, username, password) VALUES ('user0@gmail.com', 'user0', '$2a$10$Ufdw65RVnVqmEZoYhF9gFODM/xwmlxYQ3GqGAs6YTcYzDafcR17fi');
INSERT INTO public.users (email, username, password) VALUES ('user2@gmail.com', 'user2', '$2a$10$ej7wa2ObnFKh0c3hhob/H.uCQCC2VvjzS5TYT9xhXytcwcM/wRgn2');
INSERT INTO public.users (email, username, password) VALUES ('user3@gmail.com', 'user3', '$2a$10$8PQGuCyAwtOhXjtYU8aYnOoJjEbM/9rFxydW7WIRT2wwFoSIQI8ZC');
INSERT INTO public.users (email, username, password) VALUES ('user4@gmail.com', 'user4', '$2a$10$WWmYkVeRcy2CKPH59DfPD.iquAcUgKOnyy8KbfdFdQiyNQQYIXVwG');
INSERT INTO public.users (email, username, password) VALUES ('user5@gmail.com', 'user5', '$2a$10$Di1m2jnrzabMJT2AqiCGk.Cbsiq1x8D.hKhfXWZ1xAEKikYWtr9Ui');
INSERT INTO public.users (email, username, password) VALUES ('user6@gmail.com', 'user6', '$2a$10$7i5eJOx4FpLjw3B6jNYVM.RAAZXS2nb2.qRxcsJ72cjMKYB4QkNKK');
INSERT INTO public.users (email, username, password) VALUES ('user7@gmail.com', 'user7', '$2a$10$6ak3E66FezuvFtD7guqlE.LL5M5/8LoiIKgfyfUtGAOl1.UzNJObu');
INSERT INTO public.users (email, username, password) VALUES ('testowy@testowy.com', 'testowy', '$2a$10$85DoptsdrjJfBaURi3uEZeV5fz17gwCa9Uo0QdUDOofkc0M82FBd2');


--
-- TOC entry 3063 (class 0 OID 16412)
-- Dependencies: 202
-- Data for Name: users_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.users_roles (user_id, role_id) VALUES ('admin@gmail.com', 1);
INSERT INTO public.users_roles (user_id, role_id) VALUES ('user1@gmail.com', 2);
INSERT INTO public.users_roles (user_id, role_id) VALUES ('player@gmail.com', 2);
INSERT INTO public.users_roles (user_id, role_id) VALUES ('test@gmail.com', 2);
INSERT INTO public.users_roles (user_id, role_id) VALUES ('user0@gmail.com', 2);
INSERT INTO public.users_roles (user_id, role_id) VALUES ('user2@gmail.com', 2);
INSERT INTO public.users_roles (user_id, role_id) VALUES ('user3@gmail.com', 2);
INSERT INTO public.users_roles (user_id, role_id) VALUES ('user4@gmail.com', 2);
INSERT INTO public.users_roles (user_id, role_id) VALUES ('user5@gmail.com', 2);
INSERT INTO public.users_roles (user_id, role_id) VALUES ('user6@gmail.com', 2);
INSERT INTO public.users_roles (user_id, role_id) VALUES ('user7@gmail.com', 2);
INSERT INTO public.users_roles (user_id, role_id) VALUES ('testowy@testowy.com', 2);


--
-- TOC entry 3069 (class 0 OID 16677)
-- Dependencies: 208
-- Data for Name: users_tournaments; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.users_tournaments (user_id, tournament_id) VALUES ('user0@gmail.com', 1);
INSERT INTO public.users_tournaments (user_id, tournament_id) VALUES ('user1@gmail.com', 1);
INSERT INTO public.users_tournaments (user_id, tournament_id) VALUES ('user2@gmail.com', 1);
INSERT INTO public.users_tournaments (user_id, tournament_id) VALUES ('user3@gmail.com', 1);
INSERT INTO public.users_tournaments (user_id, tournament_id) VALUES ('user4@gmail.com', 1);
INSERT INTO public.users_tournaments (user_id, tournament_id) VALUES ('user5@gmail.com', 1);
INSERT INTO public.users_tournaments (user_id, tournament_id) VALUES ('user6@gmail.com', 1);
INSERT INTO public.users_tournaments (user_id, tournament_id) VALUES ('user7@gmail.com', 1);
INSERT INTO public.users_tournaments (user_id, tournament_id) VALUES ('user0@gmail.com', 2);
INSERT INTO public.users_tournaments (user_id, tournament_id) VALUES ('user1@gmail.com', 2);
INSERT INTO public.users_tournaments (user_id, tournament_id) VALUES ('user2@gmail.com', 2);
INSERT INTO public.users_tournaments (user_id, tournament_id) VALUES ('user3@gmail.com', 2);
INSERT INTO public.users_tournaments (user_id, tournament_id) VALUES ('user4@gmail.com', 2);
INSERT INTO public.users_tournaments (user_id, tournament_id) VALUES ('user5@gmail.com', 2);
INSERT INTO public.users_tournaments (user_id, tournament_id) VALUES ('user6@gmail.com', 2);
INSERT INTO public.users_tournaments (user_id, tournament_id) VALUES ('user7@gmail.com', 2);
INSERT INTO public.users_tournaments (user_id, tournament_id) VALUES ('user0@gmail.com', 3);
INSERT INTO public.users_tournaments (user_id, tournament_id) VALUES ('user3@gmail.com', 3);
INSERT INTO public.users_tournaments (user_id, tournament_id) VALUES ('user4@gmail.com', 3);
INSERT INTO public.users_tournaments (user_id, tournament_id) VALUES ('user5@gmail.com', 3);
INSERT INTO public.users_tournaments (user_id, tournament_id) VALUES ('user7@gmail.com', 3);


--
-- TOC entry 2900 (class 2606 OID 16577)
-- Name: comments comments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (comment_id);


--
-- TOC entry 2907 (class 2606 OID 16646)
-- Name: friends friends_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.friends
    ADD CONSTRAINT friends_pk PRIMARY KEY (friend_id);


--
-- TOC entry 2910 (class 2606 OID 16656)
-- Name: games games_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pk PRIMARY KEY (game_code);


--
-- TOC entry 2902 (class 2606 OID 16587)
-- Name: profiles profile_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profiles
    ADD CONSTRAINT profile_pk PRIMARY KEY (id);


--
-- TOC entry 2896 (class 2606 OID 16411)
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- TOC entry 2917 (class 2606 OID 16711)
-- Name: rounds rounds_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rounds
    ADD CONSTRAINT rounds_pk PRIMARY KEY (round_id);


--
-- TOC entry 2912 (class 2606 OID 16675)
-- Name: tournaments tournaments_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tournaments
    ADD CONSTRAINT tournaments_pk PRIMARY KEY (tournament_id);


--
-- TOC entry 2894 (class 2606 OID 16403)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (email);


--
-- TOC entry 2898 (class 2606 OID 16429)
-- Name: users_roles users_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_roles
    ADD CONSTRAINT users_roles_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2915 (class 2606 OID 16696)
-- Name: users_tournaments users_tournaments_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_tournaments
    ADD CONSTRAINT users_tournaments_pk PRIMARY KEY (tournament_id, user_id);


--
-- TOC entry 2905 (class 1259 OID 16642)
-- Name: friends_friend_id_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX friends_friend_id_uindex ON public.friends USING btree (friend_id);


--
-- TOC entry 2908 (class 1259 OID 16654)
-- Name: games_game_code_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX games_game_code_uindex ON public.games USING btree (game_code);


--
-- TOC entry 2903 (class 1259 OID 16584)
-- Name: profile_profile_id_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX profile_profile_id_uindex ON public.profiles USING btree (id);


--
-- TOC entry 2904 (class 1259 OID 16585)
-- Name: profile_user_email_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX profile_user_email_uindex ON public.profiles USING btree (user_email);


--
-- TOC entry 2918 (class 1259 OID 16717)
-- Name: rounds_round_id_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX rounds_round_id_uindex ON public.rounds USING btree (round_id);


--
-- TOC entry 2913 (class 1259 OID 16676)
-- Name: tournaments_tournament_id_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX tournaments_tournament_id_uindex ON public.tournaments USING btree (tournament_id);


--
-- TOC entry 2922 (class 2606 OID 16632)
-- Name: friends friends_users_email_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.friends
    ADD CONSTRAINT friends_users_email_fk FOREIGN KEY (user_first) REFERENCES public.users(email);


--
-- TOC entry 2923 (class 2606 OID 16637)
-- Name: friends friends_users_email_fk_2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.friends
    ADD CONSTRAINT friends_users_email_fk_2 FOREIGN KEY (user_second) REFERENCES public.users(email);


--
-- TOC entry 2927 (class 2606 OID 16718)
-- Name: games games_rounds_round_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_rounds_round_id_fk FOREIGN KEY (round_id) REFERENCES public.rounds(round_id);


--
-- TOC entry 2926 (class 2606 OID 16702)
-- Name: games games_tournaments_tournament_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_tournaments_tournament_id_fk FOREIGN KEY (tournament_id) REFERENCES public.tournaments(tournament_id);


--
-- TOC entry 2924 (class 2606 OID 16658)
-- Name: games games_users_email_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_users_email_fk FOREIGN KEY (host) REFERENCES public.users(email);


--
-- TOC entry 2925 (class 2606 OID 16663)
-- Name: games games_users_email_fk_2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_users_email_fk_2 FOREIGN KEY (player) REFERENCES public.users(email);


--
-- TOC entry 2921 (class 2606 OID 16723)
-- Name: profiles profiles_users_email_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profiles
    ADD CONSTRAINT profiles_users_email_fk FOREIGN KEY (user_email) REFERENCES public.users(email);


--
-- TOC entry 2920 (class 2606 OID 16423)
-- Name: users_roles role_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_roles
    ADD CONSTRAINT role_id FOREIGN KEY (role_id) REFERENCES public.roles(id) NOT VALID;


--
-- TOC entry 2930 (class 2606 OID 16712)
-- Name: rounds rounds_tournaments_tournament_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rounds
    ADD CONSTRAINT rounds_tournaments_tournament_id_fk FOREIGN KEY (tournament_id) REFERENCES public.tournaments(tournament_id);


--
-- TOC entry 2919 (class 2606 OID 16418)
-- Name: users_roles user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_roles
    ADD CONSTRAINT user_id FOREIGN KEY (user_id) REFERENCES public.users(email);


--
-- TOC entry 2929 (class 2606 OID 16697)
-- Name: users_tournaments users_tournaments_tournaments_tournament_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_tournaments
    ADD CONSTRAINT users_tournaments_tournaments_tournament_id_fk FOREIGN KEY (tournament_id) REFERENCES public.tournaments(tournament_id);


--
-- TOC entry 2928 (class 2606 OID 16685)
-- Name: users_tournaments users_tournaments_users_email_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_tournaments
    ADD CONSTRAINT users_tournaments_users_email_fk FOREIGN KEY (user_id) REFERENCES public.users(email);


-- Completed on 2022-01-24 16:14:37

--
-- PostgreSQL database dump complete
--

