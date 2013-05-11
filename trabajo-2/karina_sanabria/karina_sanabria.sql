--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: karina_sanabria; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA karina_sanabria;


ALTER SCHEMA karina_sanabria OWNER TO postgres;

SET search_path = karina_sanabria, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: books; Type: TABLE; Schema: karina_sanabria; Owner: postgres; Tablespace: 
--

CREATE TABLE books (
    id integer NOT NULL,
    title character varying(160)
);


ALTER TABLE karina_sanabria.books OWNER TO postgres;

--
-- Name: books_id_seq; Type: SEQUENCE; Schema: karina_sanabria; Owner: postgres
--

CREATE SEQUENCE books_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE karina_sanabria.books_id_seq OWNER TO postgres;

--
-- Name: books_id_seq; Type: SEQUENCE OWNED BY; Schema: karina_sanabria; Owner: postgres
--

ALTER SEQUENCE books_id_seq OWNED BY books.id;


--
-- Name: loans; Type: TABLE; Schema: karina_sanabria; Owner: postgres; Tablespace: 
--

CREATE TABLE loans (
    id integer NOT NULL,
    member_id integer,
    book_id integer
);


ALTER TABLE karina_sanabria.loans OWNER TO postgres;

--
-- Name: loans_id_seq; Type: SEQUENCE; Schema: karina_sanabria; Owner: postgres
--

CREATE SEQUENCE loans_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE karina_sanabria.loans_id_seq OWNER TO postgres;

--
-- Name: loans_id_seq; Type: SEQUENCE OWNED BY; Schema: karina_sanabria; Owner: postgres
--

ALTER SEQUENCE loans_id_seq OWNED BY loans.id;


--
-- Name: members; Type: TABLE; Schema: karina_sanabria; Owner: postgres; Tablespace: 
--

CREATE TABLE members (
    id integer NOT NULL,
    name character varying(160)
);


ALTER TABLE karina_sanabria.members OWNER TO postgres;

--
-- Name: members_id_seq; Type: SEQUENCE; Schema: karina_sanabria; Owner: postgres
--

CREATE SEQUENCE members_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE karina_sanabria.members_id_seq OWNER TO postgres;

--
-- Name: members_id_seq; Type: SEQUENCE OWNED BY; Schema: karina_sanabria; Owner: postgres
--

ALTER SEQUENCE members_id_seq OWNED BY members.id;


--
-- Name: id; Type: DEFAULT; Schema: karina_sanabria; Owner: postgres
--

ALTER TABLE ONLY books ALTER COLUMN id SET DEFAULT nextval('books_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: karina_sanabria; Owner: postgres
--

ALTER TABLE ONLY loans ALTER COLUMN id SET DEFAULT nextval('loans_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: karina_sanabria; Owner: postgres
--

ALTER TABLE ONLY members ALTER COLUMN id SET DEFAULT nextval('members_id_seq'::regclass);


--
-- Name: books_pkey; Type: CONSTRAINT; Schema: karina_sanabria; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY books
    ADD CONSTRAINT books_pkey PRIMARY KEY (id);


--
-- Name: loans_pkey; Type: CONSTRAINT; Schema: karina_sanabria; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY loans
    ADD CONSTRAINT loans_pkey PRIMARY KEY (id);


--
-- Name: members_pkey; Type: CONSTRAINT; Schema: karina_sanabria; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY members
    ADD CONSTRAINT members_pkey PRIMARY KEY (id);


--
-- Name: loans_book_id_fkey; Type: FK CONSTRAINT; Schema: karina_sanabria; Owner: postgres
--

ALTER TABLE ONLY loans
    ADD CONSTRAINT loans_book_id_fkey FOREIGN KEY (book_id) REFERENCES books(id);


--
-- Name: loans_member_id_fkey; Type: FK CONSTRAINT; Schema: karina_sanabria; Owner: postgres
--

ALTER TABLE ONLY loans
    ADD CONSTRAINT loans_member_id_fkey FOREIGN KEY (member_id) REFERENCES members(id);


--
-- PostgreSQL database dump complete
--

