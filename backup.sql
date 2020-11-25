--
-- PostgreSQL database dump
--

-- Dumped from database version 10.14 (Ubuntu 10.14-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.14 (Ubuntu 10.14-0ubuntu0.18.04.1)

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
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: app_account_profile; Type: TABLE; Schema: public; Owner: cgcdbuser
--

CREATE TABLE public.app_account_profile (
    id integer NOT NULL,
    image character varying(100),
    bio text,
    github character varying(750),
    trello character varying(750),
    instagram character varying(750),
    email character varying(750),
    linkedin character varying(750),
    twitter character varying(750),
    user_id integer NOT NULL,
    is_admin boolean,
    is_author boolean
);


ALTER TABLE public.app_account_profile OWNER TO cgcdbuser;

--
-- Name: app_account_profile_id_seq; Type: SEQUENCE; Schema: public; Owner: cgcdbuser
--

CREATE SEQUENCE public.app_account_profile_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_account_profile_id_seq OWNER TO cgcdbuser;

--
-- Name: app_account_profile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cgcdbuser
--

ALTER SEQUENCE public.app_account_profile_id_seq OWNED BY public.app_account_profile.id;


--
-- Name: app_admin_calender; Type: TABLE; Schema: public; Owner: cgcdbuser
--

CREATE TABLE public.app_admin_calender (
    id integer NOT NULL,
    image character varying(100)
);


ALTER TABLE public.app_admin_calender OWNER TO cgcdbuser;

--
-- Name: app_admin_calender_id_seq; Type: SEQUENCE; Schema: public; Owner: cgcdbuser
--

CREATE SEQUENCE public.app_admin_calender_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_admin_calender_id_seq OWNER TO cgcdbuser;

--
-- Name: app_admin_calender_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cgcdbuser
--

ALTER SEQUENCE public.app_admin_calender_id_seq OWNED BY public.app_admin_calender.id;


--
-- Name: app_admin_callout; Type: TABLE; Schema: public; Owner: cgcdbuser
--

CREATE TABLE public.app_admin_callout (
    id integer NOT NULL,
    title character varying(250),
    message text,
    date timestamp with time zone
);


ALTER TABLE public.app_admin_callout OWNER TO cgcdbuser;

--
-- Name: app_admin_callout_id_seq; Type: SEQUENCE; Schema: public; Owner: cgcdbuser
--

CREATE SEQUENCE public.app_admin_callout_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_admin_callout_id_seq OWNER TO cgcdbuser;

--
-- Name: app_admin_callout_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cgcdbuser
--

ALTER SEQUENCE public.app_admin_callout_id_seq OWNED BY public.app_admin_callout.id;


--
-- Name: app_admin_files; Type: TABLE; Schema: public; Owner: cgcdbuser
--

CREATE TABLE public.app_admin_files (
    id integer NOT NULL,
    admin_file character varying(100),
    title character varying(120)
);


ALTER TABLE public.app_admin_files OWNER TO cgcdbuser;

--
-- Name: app_admin_files_id_seq; Type: SEQUENCE; Schema: public; Owner: cgcdbuser
--

CREATE SEQUENCE public.app_admin_files_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_admin_files_id_seq OWNER TO cgcdbuser;

--
-- Name: app_admin_files_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cgcdbuser
--

ALTER SEQUENCE public.app_admin_files_id_seq OWNED BY public.app_admin_files.id;


--
-- Name: app_blog_category; Type: TABLE; Schema: public; Owner: cgcdbuser
--

CREATE TABLE public.app_blog_category (
    id integer NOT NULL,
    description text,
    slug character varying(200),
    title character varying(150),
    mother_id integer
);


ALTER TABLE public.app_blog_category OWNER TO cgcdbuser;

--
-- Name: app_blog_category_id_seq; Type: SEQUENCE; Schema: public; Owner: cgcdbuser
--

CREATE SEQUENCE public.app_blog_category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_blog_category_id_seq OWNER TO cgcdbuser;

--
-- Name: app_blog_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cgcdbuser
--

ALTER SEQUENCE public.app_blog_category_id_seq OWNED BY public.app_blog_category.id;


--
-- Name: app_blog_comment; Type: TABLE; Schema: public; Owner: cgcdbuser
--

CREATE TABLE public.app_blog_comment (
    id integer NOT NULL,
    content text,
    date date,
    mother_id integer,
    post_id integer,
    user_id integer,
    status character varying(1) NOT NULL
);


ALTER TABLE public.app_blog_comment OWNER TO cgcdbuser;

--
-- Name: app_blog_comment_id_seq; Type: SEQUENCE; Schema: public; Owner: cgcdbuser
--

CREATE SEQUENCE public.app_blog_comment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_blog_comment_id_seq OWNER TO cgcdbuser;

--
-- Name: app_blog_comment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cgcdbuser
--

ALTER SEQUENCE public.app_blog_comment_id_seq OWNED BY public.app_blog_comment.id;


--
-- Name: app_blog_contact; Type: TABLE; Schema: public; Owner: cgcdbuser
--

CREATE TABLE public.app_blog_contact (
    id integer NOT NULL,
    title character varying(250),
    name character varying(100),
    subject character varying(1),
    message text,
    mail character varying(200),
    phone character varying(12),
    status character varying(1)
);


ALTER TABLE public.app_blog_contact OWNER TO cgcdbuser;

--
-- Name: app_blog_contact_id_seq; Type: SEQUENCE; Schema: public; Owner: cgcdbuser
--

CREATE SEQUENCE public.app_blog_contact_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_blog_contact_id_seq OWNER TO cgcdbuser;

--
-- Name: app_blog_contact_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cgcdbuser
--

ALTER SEQUENCE public.app_blog_contact_id_seq OWNED BY public.app_blog_contact.id;


--
-- Name: app_blog_post; Type: TABLE; Schema: public; Owner: cgcdbuser
--

CREATE TABLE public.app_blog_post (
    id integer NOT NULL,
    title character varying(250),
    content text,
    publish_date date NOT NULL,
    image character varying(100),
    slug character varying(200),
    status character varying(9),
    user_id integer,
    file_url character varying(750),
    refrence text,
    youtube_url character varying(750),
    category_id integer,
    summary text,
    github_url character varying(750),
    publish_time timestamp with time zone,
    image_alt character varying(250)
);


ALTER TABLE public.app_blog_post OWNER TO cgcdbuser;

--
-- Name: app_blog_post_id_seq; Type: SEQUENCE; Schema: public; Owner: cgcdbuser
--

CREATE SEQUENCE public.app_blog_post_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_blog_post_id_seq OWNER TO cgcdbuser;

--
-- Name: app_blog_post_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cgcdbuser
--

ALTER SEQUENCE public.app_blog_post_id_seq OWNED BY public.app_blog_post.id;


--
-- Name: app_blog_slider; Type: TABLE; Schema: public; Owner: cgcdbuser
--

CREATE TABLE public.app_blog_slider (
    id integer NOT NULL,
    image character varying(100),
    link character varying(1200),
    title character varying(250)
);


ALTER TABLE public.app_blog_slider OWNER TO cgcdbuser;

--
-- Name: app_blog_slider_id_seq; Type: SEQUENCE; Schema: public; Owner: cgcdbuser
--

CREATE SEQUENCE public.app_blog_slider_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_blog_slider_id_seq OWNER TO cgcdbuser;

--
-- Name: app_blog_slider_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cgcdbuser
--

ALTER SEQUENCE public.app_blog_slider_id_seq OWNED BY public.app_blog_slider.id;


--
-- Name: app_event_event; Type: TABLE; Schema: public; Owner: cgcdbuser
--

CREATE TABLE public.app_event_event (
    id integer NOT NULL,
    title character varying(250),
    slug character varying(200),
    description text,
    summary text,
    image character varying(100),
    date date,
    file_url character varying(100),
    youtube_url character varying(500),
    status character varying(1),
    person_id integer,
    event_type character varying(1),
    addres text
);


ALTER TABLE public.app_event_event OWNER TO cgcdbuser;

--
-- Name: app_event_event_id_seq; Type: SEQUENCE; Schema: public; Owner: cgcdbuser
--

CREATE SEQUENCE public.app_event_event_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_event_event_id_seq OWNER TO cgcdbuser;

--
-- Name: app_event_event_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cgcdbuser
--

ALTER SEQUENCE public.app_event_event_id_seq OWNED BY public.app_event_event.id;


--
-- Name: app_project_pcategory; Type: TABLE; Schema: public; Owner: cgcdbuser
--

CREATE TABLE public.app_project_pcategory (
    id integer NOT NULL,
    title character varying(120),
    slug character varying(175)
);


ALTER TABLE public.app_project_pcategory OWNER TO cgcdbuser;

--
-- Name: app_project_category_id_seq; Type: SEQUENCE; Schema: public; Owner: cgcdbuser
--

CREATE SEQUENCE public.app_project_category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_project_category_id_seq OWNER TO cgcdbuser;

--
-- Name: app_project_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cgcdbuser
--

ALTER SEQUENCE public.app_project_category_id_seq OWNED BY public.app_project_pcategory.id;


--
-- Name: app_project_project; Type: TABLE; Schema: public; Owner: cgcdbuser
--

CREATE TABLE public.app_project_project (
    id integer NOT NULL,
    title character varying(50),
    image character varying(100),
    slug character varying(250),
    description text,
    file_url character varying(2250),
    youtube_url character varying(2250),
    github_url character varying(2250),
    head_id integer,
    category_id integer,
    summary text
);


ALTER TABLE public.app_project_project OWNER TO cgcdbuser;

--
-- Name: app_project_project_id_seq; Type: SEQUENCE; Schema: public; Owner: cgcdbuser
--

CREATE SEQUENCE public.app_project_project_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_project_project_id_seq OWNER TO cgcdbuser;

--
-- Name: app_project_project_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cgcdbuser
--

ALTER SEQUENCE public.app_project_project_id_seq OWNED BY public.app_project_project.id;


--
-- Name: app_project_project_members; Type: TABLE; Schema: public; Owner: cgcdbuser
--

CREATE TABLE public.app_project_project_members (
    id integer NOT NULL,
    project_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.app_project_project_members OWNER TO cgcdbuser;

--
-- Name: app_project_project_members_id_seq; Type: SEQUENCE; Schema: public; Owner: cgcdbuser
--

CREATE SEQUENCE public.app_project_project_members_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_project_project_members_id_seq OWNER TO cgcdbuser;

--
-- Name: app_project_project_members_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cgcdbuser
--

ALTER SEQUENCE public.app_project_project_members_id_seq OWNED BY public.app_project_project_members.id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: cgcdbuser
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO cgcdbuser;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: cgcdbuser
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO cgcdbuser;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cgcdbuser
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: cgcdbuser
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO cgcdbuser;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: cgcdbuser
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO cgcdbuser;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cgcdbuser
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: cgcdbuser
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO cgcdbuser;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: cgcdbuser
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO cgcdbuser;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cgcdbuser
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: cgcdbuser
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO cgcdbuser;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: cgcdbuser
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO cgcdbuser;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: cgcdbuser
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO cgcdbuser;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cgcdbuser
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: cgcdbuser
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO cgcdbuser;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cgcdbuser
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: cgcdbuser
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO cgcdbuser;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: cgcdbuser
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO cgcdbuser;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cgcdbuser
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: cgcdbuser
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO cgcdbuser;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: cgcdbuser
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO cgcdbuser;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cgcdbuser
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: cgcdbuser
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO cgcdbuser;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: cgcdbuser
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO cgcdbuser;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cgcdbuser
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: cgcdbuser
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO cgcdbuser;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: cgcdbuser
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO cgcdbuser;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cgcdbuser
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: cgcdbuser
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO cgcdbuser;

--
-- Name: django_site; Type: TABLE; Schema: public; Owner: cgcdbuser
--

CREATE TABLE public.django_site (
    id integer NOT NULL,
    domain character varying(100) NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.django_site OWNER TO cgcdbuser;

--
-- Name: django_site_id_seq; Type: SEQUENCE; Schema: public; Owner: cgcdbuser
--

CREATE SEQUENCE public.django_site_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_site_id_seq OWNER TO cgcdbuser;

--
-- Name: django_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cgcdbuser
--

ALTER SEQUENCE public.django_site_id_seq OWNED BY public.django_site.id;


--
-- Name: thumbnail_kvstore; Type: TABLE; Schema: public; Owner: cgcdbuser
--

CREATE TABLE public.thumbnail_kvstore (
    key character varying(200) NOT NULL,
    value text NOT NULL
);


ALTER TABLE public.thumbnail_kvstore OWNER TO cgcdbuser;

--
-- Name: app_account_profile id; Type: DEFAULT; Schema: public; Owner: cgcdbuser
--

ALTER TABLE ONLY public.app_account_profile ALTER COLUMN id SET DEFAULT nextval('public.app_account_profile_id_seq'::regclass);


--
-- Name: app_admin_calender id; Type: DEFAULT; Schema: public; Owner: cgcdbuser
--

ALTER TABLE ONLY public.app_admin_calender ALTER COLUMN id SET DEFAULT nextval('public.app_admin_calender_id_seq'::regclass);


--
-- Name: app_admin_callout id; Type: DEFAULT; Schema: public; Owner: cgcdbuser
--

ALTER TABLE ONLY public.app_admin_callout ALTER COLUMN id SET DEFAULT nextval('public.app_admin_callout_id_seq'::regclass);


--
-- Name: app_admin_files id; Type: DEFAULT; Schema: public; Owner: cgcdbuser
--

ALTER TABLE ONLY public.app_admin_files ALTER COLUMN id SET DEFAULT nextval('public.app_admin_files_id_seq'::regclass);


--
-- Name: app_blog_category id; Type: DEFAULT; Schema: public; Owner: cgcdbuser
--

ALTER TABLE ONLY public.app_blog_category ALTER COLUMN id SET DEFAULT nextval('public.app_blog_category_id_seq'::regclass);


--
-- Name: app_blog_comment id; Type: DEFAULT; Schema: public; Owner: cgcdbuser
--

ALTER TABLE ONLY public.app_blog_comment ALTER COLUMN id SET DEFAULT nextval('public.app_blog_comment_id_seq'::regclass);


--
-- Name: app_blog_contact id; Type: DEFAULT; Schema: public; Owner: cgcdbuser
--

ALTER TABLE ONLY public.app_blog_contact ALTER COLUMN id SET DEFAULT nextval('public.app_blog_contact_id_seq'::regclass);


--
-- Name: app_blog_post id; Type: DEFAULT; Schema: public; Owner: cgcdbuser
--

ALTER TABLE ONLY public.app_blog_post ALTER COLUMN id SET DEFAULT nextval('public.app_blog_post_id_seq'::regclass);


--
-- Name: app_blog_slider id; Type: DEFAULT; Schema: public; Owner: cgcdbuser
--

ALTER TABLE ONLY public.app_blog_slider ALTER COLUMN id SET DEFAULT nextval('public.app_blog_slider_id_seq'::regclass);


--
-- Name: app_event_event id; Type: DEFAULT; Schema: public; Owner: cgcdbuser
--

ALTER TABLE ONLY public.app_event_event ALTER COLUMN id SET DEFAULT nextval('public.app_event_event_id_seq'::regclass);


--
-- Name: app_project_pcategory id; Type: DEFAULT; Schema: public; Owner: cgcdbuser
--

ALTER TABLE ONLY public.app_project_pcategory ALTER COLUMN id SET DEFAULT nextval('public.app_project_category_id_seq'::regclass);


--
-- Name: app_project_project id; Type: DEFAULT; Schema: public; Owner: cgcdbuser
--

ALTER TABLE ONLY public.app_project_project ALTER COLUMN id SET DEFAULT nextval('public.app_project_project_id_seq'::regclass);


--
-- Name: app_project_project_members id; Type: DEFAULT; Schema: public; Owner: cgcdbuser
--

ALTER TABLE ONLY public.app_project_project_members ALTER COLUMN id SET DEFAULT nextval('public.app_project_project_members_id_seq'::regclass);


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: cgcdbuser
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: cgcdbuser
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: cgcdbuser
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: cgcdbuser
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: cgcdbuser
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: cgcdbuser
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: cgcdbuser
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: cgcdbuser
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: cgcdbuser
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: django_site id; Type: DEFAULT; Schema: public; Owner: cgcdbuser
--

ALTER TABLE ONLY public.django_site ALTER COLUMN id SET DEFAULT nextval('public.django_site_id_seq'::regclass);


--
-- Data for Name: app_account_profile; Type: TABLE DATA; Schema: public; Owner: cgcdbuser
--

COPY public.app_account_profile (id, image, bio, github, trello, instagram, email, linkedin, twitter, user_id, is_admin, is_author) FROM stdin;
2	images/profiles/CC_20200813_145126.png	<p>هم-بنیان‌گذار و عضو ارشد CGC</p><p>Python Programmer</p><p>Working on ML</p>	\N	\N	\N	mzdicgc@gmail.com	\N	\N	3	t	f
1	images/profiles/circle-me-org_yNV4Qcj.png	<p>هم-بنیان گذار و مدیر فنی CGC</p><p>Full Stack Developer / دانشجوی مهندسی نرم افزار / علاقه‌مند به بازی‌سازی / دوست دار دنیای آزاد</p><p>برنامه نویس Python و تازه وارد در JavaScript<br></p>	\N	\N	\N	\N	\N	\N	2	t	f
4	images/profiles/photo_2020-09-23_14-14-24.jpg		https://github.com/MohammadHKhanipour	\N	\N	MohammadHassanCGC@gmail.com	\N	\N	5	f	t
6		\N	\N	\N	\N	\N	\N	\N	7	f	f
8		\N	\N	\N	\N	\N	\N	\N	9	f	f
3	images/profiles/WhatsApp_Image_2020-10-03_at_14.31.50.png		\N	\N	\N	\N	\N	\N	4	t	f
9		\N	\N	\N	\N	\N	\N	\N	10	f	f
10		\N	\N	\N	\N	\N	\N	\N	11	f	f
11		\N	\N	\N	\N	\N	\N	\N	12	f	f
7	images/profiles/IMG_8522_KrW5hHG.JPG	<p>دانشجوی مهندسی نرم افزار - علاقمند به شبکه و امنیت!<br></p>	\N	\N	\N	reyhan_ghfn@yahoo.com	\N	\N	8	f	t
12			\N	\N	\N	\N	\N	\N	13	f	t
\.


--
-- Data for Name: app_admin_calender; Type: TABLE DATA; Schema: public; Owner: cgcdbuser
--

COPY public.app_admin_calender (id, image) FROM stdin;
2	uploads/admin/Screenshot_2020-10-10_17-48-35.png
\.


--
-- Data for Name: app_admin_callout; Type: TABLE DATA; Schema: public; Owner: cgcdbuser
--

COPY public.app_admin_callout (id, title, message, date) FROM stdin;
2	تقویم جدید	دوستان تقویم جدید آماده شده و به زودی توی سایت قرارش میدم. این تقویم فعلا مورد استفاده قرار میگیره اما احتمال تغییرش با اضافه شدن نویسنده‌های جدید هست.	2020-09-07 15:37:54.984183+00
3	*نکته بسیار مهم*	بچه‌ها توجه کنید که تولید محتوای صرف نتیجه‌ای نخواهد داشت. شما باید تمام تلاشتون رو برای دیده شدن مطلبتون انجام بدید و پست مربوط به مطلب/ویدیو تون رو توی گروه‌های تلگرامی بفرستید و حتی برای تبلیغ بیشتر توی گروه‌های بیشتری عضو شید.	2020-09-07 15:39:27.337492+00
1	بارگذاری مجدد مطالب	دوستان لطفا هرچه سریع‌تر مطالبی و جلساتی که داشتید رو توی سایت بذارید و پروفایل خودتون رو هم کامل کنید. خواهشا سریع‌تر انجام بدید..	2020-09-07 15:40:15.501585+00
4	گزارش فعالیت یک ماهه CGC منتشر شد.	با سلام. دوستان گزارش فعالیت یک ماهه که در اون آمار دقیقی از فعالیت‌های CGC ارائه شده و مورد بررسی قرار گرفته منتشر شد. شما میتونید از قسمت فایل‌ها و یا کانال تیم تولید محتوای CGC این گزارش رو دریافت کنید. همچنین در پایان این گزارش اهدافی برای سه ماه آینده CGC در نظر گرفته شده که لازمه تمام اعضا برای تحقق این اهداف تلاش خودشون رو بکنن. دم همگی گرم :))	2020-09-10 15:42:14.68416+00
5	سایت به روزرسانی شد.(1.1.5)	نسخه جدید سایت دیپلوی شد. علاوه بر حل مشکلات، در این نسخه قابلیت alt یا متن جایگزین هم به تصاویر اصلی پست‌ها اضافه شدن. همچنین قابلیت Ping google به صورت خودکار توسط سایت فعال شد.	2020-09-11 11:22:51.903345+00
6	تاریخ رویداد جدید مشخص شد	سلام دوستان؛ رویداد جدید (ساخت موس با آردوینو) دوشنبه چهاردهم مهر ماه برگزار میشه. حتما اگر تونستید در جلسه شرکت داشته باشید. همچنین بعد از جلسه احتمالا صحبت کوتاهی با اعضا خواهیم داشت.	2020-10-03 18:51:23.857936+00
7	تقویم تولید محتوای ماه سوم	تقویم تولید محتوای ماه جدید در گروه تلگرام قرار گرفت و به محض به پایان رسیدن تقویم قبلی در داشبورد هم قرار خواهد گرفت. لطفا تقویم رو چک کنید و حتما در تاریخی که برای شما تعیین شده محتوای خواسته شده رو ارائه بدید.	2020-10-03 18:52:43.889548+00
\.


--
-- Data for Name: app_admin_files; Type: TABLE DATA; Schema: public; Owner: cgcdbuser
--

COPY public.app_admin_files (id, admin_file, title) FROM stdin;
1	uploads/admin/برنامه_تولید_محتوای_ماه_دوم.pdf	تقویم تولید محتوای ماه دوم
2	uploads/admin/گزارش_یک_ماهه_اول_CGC.pdf	گزارش یک ماهه فعالیت CGC
\.


--
-- Data for Name: app_blog_category; Type: TABLE DATA; Schema: public; Owner: cgcdbuser
--

COPY public.app_blog_category (id, description, slug, title, mother_id) FROM stdin;
1	<p>تمامی مقالات منتشر شده توسط جامعه گیک&zwnj;های کامپیوتر در این دسته بندی جای می&zwnj;گیرند.</p>	Articles	مقالات	\N
4	در این دسته‌بندی مقالات مربوط به سخت‌افزار قرار داده می‌شوند.	hardware-articles	سخت افزار	1
3	در این دسته‌بندی مقالات مربوط به اینترنت اشیا قرار داده می‌شوند.	iot-articles	اینترنت اشیا	1
5	در این دسته بندی مطالبی در مورد وب، نرم افزار و تولید انواع وب‌ اپلیکیشن و نرم افزار‌ها قرار می‌گیرند.	wab-and-app	وب و نرم افزار	1
6	مقالاتی در باب توسعه نرم افزار در این دسته بندی قرار می‌گیرند. اگر علاقه مند به توسعه نرم افزار هستید مطالب این دسته بندی را دنبال کنید.	app-development	توسعه نرم افزار	5
7	مقالات مرتبط به صنعت بزرگ بازی‌سازی و آموزش‌هایی در این رابطه در این دسته بندی قرار می‌گیرند.	making-game	بازی سازی	5
8	مطالب و نکاتی که برای تبدیل شدن به یک توسعه دهنده Frontend مورد نیاز شماست در این دسته بندی قرار دارند.	Frontend	Frontend	5
9	مطالب و مقالات مرتبط با Backend و سمت سرور از جمله معرفی فریمورک‌های Backend و آموزش‌ها در این دسته بندی قرار دارند.	Backend	Backend	5
10	تمامی مطالب مرتبط با سیستم عامل‌های مبتنی بر گنو/لینوکس و نرم افزارهای آزاد در این دسته بندی قرار می‌گیرند.	linux	لینوکس و دنیای آزاد	1
11	در این دسته‌بندی مقالات مربوط به هوش مصنوعی قرار داده می‌شوند.	AI-articles	هوش مصنوعی	1
12	دنیای آزاد پر است از نرم افزارهای جذاب و کاربردی. در این دسته بندی می‌توانید معرفی و دسته بندی نرم افزارهای آزاد را ببینید و دنیای نرم افزار آزاد بیشتر آشنا شوید.	application-Introduce	معرفی نرم افزار	10
13	گنو/لینوکس سیستم عاملی است قدرتمند و محبوب که هزاران توزیع مختلف تا به امروز بر مبنای این سبستم عامل منتشر شده‌اند. اگر علاقه‌مند به دنیای لینوکس هستید و دوست دارید با توزیع‌های مختلف اینوکس آشنا شوید مطالب این دسته بندی را دنبال کنید.	distributions	معرفی و بررسی توزیع‌ها	10
14	شبکه یکی از فیلدهای جذاب و مهم در حوزه کامپیوتر است و یکی از اصلی‌ترین حوزه‌ها به شمار می‌آید. مقالات، ویدیوها و تمامی مطالب مرتبط با این شبکه را می‌توانید در این دسته بندی ببینید.	network	شبکه	1
16	مطالب و مقالات مرتبط با تکنولوژی‌های مبتنی بر هوش مصنوعی در این دسته بندی قرار دارند.	ai-techs	تکنولوژی‌‌های مربوطه	11
17	مطالب و مقالات مرتبط با Machine Learning در این دسته‌ بندی قرار دارند.	machine-learning	ماشین لرنینگ	11
\.


--
-- Data for Name: app_blog_comment; Type: TABLE DATA; Schema: public; Owner: cgcdbuser
--

COPY public.app_blog_comment (id, content, date, mother_id, post_id, user_id, status) FROM stdin;
\.


--
-- Data for Name: app_blog_contact; Type: TABLE DATA; Schema: public; Owner: cgcdbuser
--

COPY public.app_blog_contact (id, title, name, subject, message, mail, phone, status) FROM stdin;
1	Do you want cheap and innovative advertising for little money?	WilliamLix	b	Good day!  cgeeksc.ir \r\n \r\nDid you know that it is possible to send proposal absolutely legally? \r\nWe tender a new unique way of sending letter through contact forms. Such forms are located on many sites. \r\nWhen such business proposals are sent, no personal data is used, and messages are sent to forms specifically designed to receive messages and appeals. \r\nalso, messages sent through communication Forms do not get into spam because such messages are considered important. \r\nWe offer you to test our service for free. We will send up to 50,000 messages for you. \r\nThe cost of sending one million messages is 49 USD. \r\n \r\nThis message is created automatically. Please use the contact details below to contact us. \r\n \r\nContact us. \r\nTelegram - @FeedbackMessages \r\nSkype  live:contactform_18 \r\nWhatsApp - +375259112693	no-replySeratype@gmail.com	87328825241	s
\.


--
-- Data for Name: app_blog_post; Type: TABLE DATA; Schema: public; Owner: cgcdbuser
--

COPY public.app_blog_post (id, title, content, publish_date, image, slug, status, user_id, file_url, refrence, youtube_url, category_id, summary, github_url, publish_time, image_alt) FROM stdin;
2	ساخت بی‌نهایت object با position رندم در انجین گودوت (Godot)	<p>انجین گودوت (Godot) یک انجین آزاد و رایگان و گزینه&zwnj;ای مناسب برای ساخت بازی به خصوص برای تیم&zwnj;های مستقل و کوچک است. گودوت (Godot) از زبان Gdscript بهره می&zwnj;گیرد، زبانی که شباهت زیادی به زبان محبوب و پرکاربرد Python دارد. ساده بودن برنامه نویسی و سرعت گودوت (Godot) بازی&zwnj;سازی را برای شما تبدیل به کاری لذت بخش خواهد کرد.</p>\r\n\r\n<p>پیش از این در جامعه گیک&zwnj;های کامپیوتر ویدیویی آموزشی در رابطه با این انجین منتشر کردیم و در یک ویدیوی یک ساعته <a href="http://cgeeksc.ir/post/headfootball-godot">ساخت پروژه Head Football در انجین Godot</a> را آموزش دادیم.</p>\r\n\r\n<p>خوشبختانه کاربران استقبال خوبی از این ویدیو داشتند و سوالاتی را در رابطه با این انجین مطرح کردند. به همین علت ما تصمیم گرفتیم آموزش&zwnj;های گودوت (Godot) را ادامه داده و ویدیوهای بیشتری برای علاقه&zwnj;مندان به بازی&zwnj;سازی&nbsp; و انجین گودوت (Godot) منتشر کنیم.</p>\r\n\r\n<p style="text-align:center"><img alt="آموزش گودوت (Godot)" src="/media/uploads/2020/09/06/screenshot_2020-08-17_15-06-49.png" style="height:434px; width:867px" /></p>\r\n\r\n<p>یکی از الگوریتم&zwnj;های پرکاربرد در بازی&zwnj;های ویدیویی که سال&zwnj;هاست در بین بازی&zwnj;های مختلف رواج دارد <strong>ساخته شدن بی&zwnj;نهایت object با position اتفاقی و random </strong>است. این الگوریتم در بسیاری از بازی&zwnj;ها استفاده شده و همچنان مورد استفاده قرار می&zwnj;گیرد. بازی&zwnj;های زیادی از جمله بازی&zwnj;هایی مثل Subway و اکثر بازی&zwnj;های بی&zwnj;نهایت از همین الگوریتم برای ساخت موانع و سکه ها و.. استفاده می&zwnj;کنند.</p>\r\n\r\n<p>همین الگوریتم و پرسش کاربران جامعه گیک&zwnj;های کامپیوتر موجب شد تا ویدیویی منتشر کنیم و به زبانی ساده و در زمانی کوتاه چگونگی پیاده سازی و عملکرد این الگوریتم را در انجین گودوت (Godot) و با زبان Gdscript توضیح و آموزش دهیم.</p>\r\n\r\n<p>در این ویدیو که تنها حدود 10 دقیقه زمان دارد مواردی مثل ساخت object، مقدار دهی متغیرها به صورت اتفاقی و رندم و مواردی اینچنینی را یاد خواهید گرفت. یادگیری این مباحث می&zwnj;تواند در ساخت بسیاری از بازی&zwnj;ها برای شما کاربردی باشد و مورد استفاده قرار گیرد.</p>\r\n\r\n<p>اگر از طرفداران انجین آزاد و قدرتمند گودوت (Godot) هستید این ویدیو را از دست ندهید. شما می&zwnj;توانید با کلیک بر روی دکمه زیر ویدیوی آموزشی ساخته شدن بی&zwnj;نهایت object با position اتفاقی و random را در انجین گودوت (Godot) به صورت رایگان در کانال یوتوب CGC تماشا کنید.</p>	2020-07-24	images/posts/post-site-godot-new.png	randomposition-object-godot	published	2	\N		https://youtu.be/wWy-6U0q2yQ	7	در این ویدیو یاد می‌گیریم چطور می‌توان از یک object خاص تعداد زیادی با position شانسی و اتفاقی ساخت.	\N	\N	\N
4	مقایسه ی آرچ و دبیان	<p>در دنیای سیستم عاملها همیشه نزاع بر سر این بوده است که کدام سیستم عامل بهتر است؟ کدام پایداری بیشتری دارد و کدام کارایی بیشتر؟ (لازم به ذکر این نکته است که این سوالات کمی اشتباه هستند).<br />\r\nماجرا زمانی جالبتر می&zwnj;شود که بر سر توزیع&zwnj;های مختلف لینوکسی نیز مشاجره هایی بین طرفداران هرکدام به چشم می&zwnj;خورد. برای آشنایی جداگانه با هرکدام مطالب بسیاری موجود می&zwnj;باشد، اما در این مطلب قصد داریم نگاهی به دو توزیع مشهور بیاندازیم. پس با ما همراه باشید.</p>\r\n\r\n<p style="text-align:center"><img alt="arch-vs-debian" src="/media/uploads/2020/09/06/vs1_RqFtuyI.jpg" style="height:290px; width:612px" /></p>\r\n\r\n<p><br />\r\nآرچ و دبیان!<br />\r\nدبیان (Debian) کار خود را سالها پیش آغاز کرد و یکی از قدیمی&zwnj;ترین سیستم عامل&zwnj;های مبتنی بر کرنل لینوکس می&zwnj;باشد. این پروژه توسط تیمی از داوطلبان با هدایت آقای ایان مرداک (Ian Murdock) و در سال 1993 ایجاد شد.<br />\r\nآرچ (Arch) در سال 2002 و توسط آقای جاد وینت (Judd Vinet) توسعه داده شد.توزیع آرچ از ۴ توزیع دیگر لینوکس که تا آن زمان منتشر شده بودند الهام گرفته بود.<br />\r\nتوزیع آرچ همچون توزیع&zwnj;هایی که از آن الهام گرفته شده بود برنامه&zwnj;ای برای مدیریت بسته&zwnj;هایش (Package Manager) نداشت و در نهایت آقای جاد وینت تصمیم گرفت برنامه&zwnj;ای را نیز برای مدیریت بسته&zwnj;ها بنویسد، و این گونه شد که &zwnj;Pacman خلق شد!<br />\r\nحواستان باشد که این پکمن را با بازی معروف و قدیمی ژاپنی پکمن که در سال 1980 ساخته شد اشتباه نگیرید، در آرچ نام مدیر بسته&zwnj;ها پکمن است، فقط همین!</p>\r\n\r\n<p style="text-align:center"><img alt="pacman" src="/media/uploads/2020/09/06/pacarchsite.jpg" style="height:430px; width:730px" /></p>\r\n\r\n<p><br />\r\nپکمن می&zwnj;تواند نصب، حذف و بروزرسانی پکیج&zwnj;ها را کنترل کند.<br />\r\nدر مقابل، در توزیع دبیان کار مدیریت بسته&zwnj;ها به عهده ی &zwnj;DPKG می&zwnj;باشد. البته علاوه بر این، شما می&zwnj;توانید از &zwnj;APT نیز استفاده کنید و ساده&zwnj;تر با پکیج&zwnj;ها کار کنید و از مخازن (Repository) آنلاین پکیج&zwnj;های مختلف را نصب و راه&zwnj;اندازی کنید.</p>\r\n\r\n<blockquote>\r\n<p><a href="http://cgeeksc.ir/event/002">جلسه دوم: لینوکس با تمرکز بر توزیع اوبونتو</a></p>\r\n</blockquote>\r\n\r\n<p>آرچ با هدف سبک و ساده بودن ساخته شده است، رویکردی که تیم طراح آن داشته، حول محور سادگی و ظرافت بوده است. از این&nbsp;رو، شما زمانی که آرچ را نصب می&zwnj;کنید خبری از محیط گرافیکی و گل و بلبل نخواهد بود، و چیزی که با آن مواجه خواهید شد چیزی نیست به جز یک Command Prompt یا خط فرمان!<br />\r\nاما جای نگرانی نیست، شما از همینجا نیز تمام کارهای خود را می&zwnj;توانید انجام دهید و هر برنامه را بخواهید می&zwnj;توانید به کمک pacstrap نصب کنید، حتی یک رابط کاربری گرافیکی.<br />\r\nبدین ترتیب آرچ به توزیعی برای کاربران متوسط و حرفه&zwnj;ای که از کار با خط فرمان نمی&zwnj;ترسند معروف شد.<br />\r\nو اما در مورد دبیان! پس از نصب این توزیع با محیط گرافیکی XFCE روبرو خواهید شد و از همان ابتدا نیازی نیست نگران کار با آن باشید چون رابط کاربری گرافیکی سرراستی دارد.<br />\r\nدبیان معمولا هر دوسال یکبار نسخه ای از خودش را به بازار عرضه می&zwnj;کند که هرکدام به مدت 3 سال از پشتیبانی رسمی بهره&zwnj;مند می&zwnj;باشند.<br />\r\nاما درباره&zwnj;ی نوع انتشار آرچ باید بگوییم که مانند دبیان نمی&zwnj;باشد و انتشار غلتان (Rolling Release) را پیشه&zwnj;ی خود کرده و به این معناست که&nbsp;آرچ لینوکس برای تاریخ انتشارش زمان&zwnj;بندی خاصی را مشخص نمی&zwnj;کند و همراه با بسته&zwnj;های جدیدی که بطور روزانه فراهم می&zwnj;شوند، سیستم مدیریت بسته&zwnj;بندی&zwnj;اش به کاربران اجازه می&zwnj;دهد تا به راحتی سیستمشان را به&zwnj;&zwnj;روز نگه دارند.<br />\r\nبنابراین تفاوتی ندارد که از کدام نسخه ی &nbsp;آرچ استفاده می&zwnj;کنید، به شرط آنکه بروزرسانی&zwnj;&zwnj;های بعد از آن، نصب شوند. در نتیجه آرچ هرگز نیازی به نصب مجدد برای به روزرسانی&zwnj;ها یا داشتن ویژگی&zwnj;های جدید، ندارد.</p>\r\n\r\n<p style="text-align:center"><img alt="penlinux" src="/media/uploads/2020/09/06/penglinux.jpg" style="height:324px; width:620px" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<blockquote>\r\n<p><a href="http://cgeeksc.ir/post/gaming-on-linux">بازی روی لینوکس؛ نکاتی برای لینوکس گیمرها</a></p>\r\n</blockquote>\r\n\r\n<p>توزیع آرچ در سال 2017 پشتیبانی خود را از سیستم های 32 بیتی متوقف کرد، این بدان معنا نیست که شما نمی&zwnj;توانید آرچ را روی سیستم 32 بیتی نصب کنید، بلکه به این معناست که دیگر هیچ آپدیتی شامل حال سیستم عاملتان نخواهد شد.<br />\r\nدر مقابل اما، برای توزیع دبیان چنین مشکلی نخواهید داشت.<br />\r\nگفتنی است که هر دو توزیع مبنای توزیع&zwnj;های معروف و پرطرفداری نیز هستند، برای مثال توزیع مشهور <a href="http://cgeeksc.ir/event/ubuntu-20-04">UBUNTU</a> و <a href="http://cgeeksc.ir/post/look-at-linux-mint">MINT</a>، برپایه&zwnj;ی دبیان می&zwnj;باشند&nbsp;و توزیع مشهور <a href="http://cgeeksc.ir/post/look-at-Manjaro">Manjaro</a> بر پایه&zwnj;ی آرچ.</p>\r\n\r\n<p>یکی از چیزهای جالبی که جا دارد در این مطلب بگویم، این است که خالق لینوکس یعنی آقای لینوس تروالدز (Linus Torvalds) میانه&zwnj;ی خوبی با توزیع دبیان ندارد و به عقیده اش دبیان لقمه را زیادی پیچانده و اساس لینوکس که سادگی می&zwnj;باشد را زیر سوال برده است! و نظرش درباره ی اوبونتو این است که می&zwnj;گوید:</p>\r\n\r\n<blockquote>\r\n<p>&quot;خدا اوبونتو را خیر دهد، حداقل کاری که توانسته بکند این است که دبیان را قابل هضم&zwnj;تر کرده است، اما به شخصه همچنان ترجیح می&zwnj;دهم از فدورا (Fedora) استفاده کنم.&quot;</p>\r\n</blockquote>	2020-09-02	images/posts/post-site.png	arch-vs-debian	published	3	\N		\N	10	در این مطلب با بررسی اجمالی دو توزیع معروف لینوکس یعنی آرچ و دبیان به مقایسه‌‌ی آنها می‌پردازیم.	\N	\N	\N
3	دینو؛ دایناسور دوست داشتنی از جنس جاوا اسکریپت	<p>Node.js (نود.جی&zwnj;اس) را می&zwnj;توان یکی از محبوب&zwnj;ترین ابزارهای سمت سرور دانست که سالیان سال است مورد استفاده توسعه دهندگان زیادی قرار گفته است. استفاده از زبان محبوب جاوا اسکریپت (JavaScript) که تا آن زمان بیشتر برای طراحی صفحات HTML پویا استفاده می&zwnj;شد سبب شد تا بسیاری از توسعه&zwnj;دهندگان به سمت این ابزار قدرتمند بروند تا تنها با جاوا اسکریپت (JavaScript) بتوانند هم در Frontend و هم در Backend فعالیت کنند.</p>\r\n\r\n<p>Node.js جریان جدیدی را آغاز کرد و انقلابی در دنیای وب به راه انداخت. Node.js از سال 2009 تا امروز دائما پیشرفت کرده و توانسته افراد بیشتری را به خود جذب کند.</p>\r\n\r\n<p>اما حالا با روی کار آمدن ابزاری جدید <strong>Deno (دینو)</strong> عرصه برای Node.js کمی تنگ&zwnj;تر شده و بسیاری بر گمانند که دوره شکوه و درخشش Node.js رو به افول است و Deno جایگزین Node.js خواهد بود.</p>\r\n\r\n<p>در ادمه با معرفی و نگاهی دقیق&zwnj;تر به Deno همراه ما باشید.</p>\r\n\r\n<p style="text-align:center"><img alt="Deno (دینو)" src="/media/uploads/2020/09/06/220px-denosvg.png" style="height:220px; width:220px" /></p>\r\n\r\n<h2>Deno (دینو) چیست؟</h2>\r\n\r\n<p>Deno (دینو) برای اولین بار در سال 2018 توسط <strong>Ryan Dahl</strong> که همان خالق Node.js است معرفی شد.</p>\r\n\r\n<blockquote>\r\n<p>Ryan Dahl این ابزار جدید را در سخنرانی &quot;ده چیزی که درباره Node.js پشیمانم&quot; معرفی کرد.</p>\r\n</blockquote>\r\n\r\n<p>همین نکته که ختاق Node.js ابزاری جدید - آن هم دقیقا در همان حوزه - را رونمایی می&zwnj;کند جرقه این فکر که این برادر کوچکتر تازه متولد شده، یعنی Deno (دینو) می&zwnj;تواند قدرتمندتر عمل کند و جایگزینی برای Node باشد را در افکار عمومی ایجاد کرد.</p>\r\n\r\n<p>Deno (دینو) که انتظار می رود با توجه به تجربه سازنده خود (Ryan Dahl) بسیار قدرتمندتر از ابزار قدیمی&zwnj;تر ظاهر شود بر روی کاغذ توانسته نظر بسیاری را به خود جلب کند. Deno مانند Node ابزاری سمت سرور بر پایه جاوا اسکریپت (JavaScript) است اما با این تفاوت که در کنار آن از تایپ اسکریپت (TypeScript) که بسیار ساده&zwnj;تر و روان&zwnj;تر است هم پشتیبانی می&zwnj;کند. همچنین ویژگی&zwnj;های مثبت دیگری علاوه بر Node در این Runtime گنجانده شده است. در واقع Deno آمده تا ایراداتی که در Node وجود داشت را حذف و تبدیل به ابزاری بهبود یافته و قدرتمندتر شود.</p>\r\n\r\n<p>یکی از ایرادات عمده در Node مسئله امنیت بود و حالا زمانی که به وبسایت رسمی Deno مراجعه کی&zwnj;کنید اولین کلمه&zwnj;ای که نگاه شما را به خود جلب می&zwnj;کند کلمه&nbsp;&nbsp; <strong>Secure </strong>است که اشاره به امنیت بالای Deno و بهتر شدن نسبت به Node.js در این زمینه دارد.</p>\r\n\r\n<p style="text-align:center"><img alt="معرفی دینو (Deno)" src="/media/uploads/2020/09/06/deno-site.png" style="height:322px; width:1111px" /></p>\r\n\r\n<h3>آیا Node.js به پایان راه خود رسیده؟</h3>\r\n\r\n<p>به وجود آمدن ابزارهای جدید هموراه گامی رو به جلو و نوید دهنده آینده&zwnj;ای بهتر و راحت&zwnj;تر برای توسعه دهندگان و کاربران است. اما این به معنای به آخر خط رسیدن و پایان راه ابزارهای قدیمی نیست. Node.js هنوز کاربران و طرفداران زیادی دارد و جدای از آن محصولات زیادی از طریق Node.js توسعه داده شده و پا به بازار گذاشته&zwnj;اند. همین مهاجرت تولیداتی که با Node انجام شده بودند به ابزاری کاملا جدید در بسیاری از موارد هرگر اتفاق نخواهد افتاد و در بسیاری دیگر سال&zwnj;ها زمان خواهد برد.</p>\r\n\r\n<p>جدای از آن Deno ابزاری جدید است که راهی طولانی برای تبدیل شدن به یکی از قطب&zwnj;های مورد علاقه و پر استفاده توسعه دهندگان دارد و شاید تا مدت&zwnj;ها زیر سایه هم خویش خود بماند.</p>\r\n\r\n<p>علاوه بر این&zwnj;ها توسعه و بازبینی و دیباگ و حل مشکلات موجود در هر محصولی دشواری&zwnj;های خاص خود را دارد و زمان زیادی خواهد برد. به خصوص که Deno مقیاس بزرگی دارد و شاید تا مدت&zwnj;ها شاهد مشکلاتی در این ابزار جدید باشیم. به تمام موارد بالا عدم وجود بسیاری از پکیج&zwnj;ها برای Deno در حال حاضر را هم اضافه کنید.</p>\r\n\r\n<p>با توجه به نکات گفته شده Node.js تا سال&zwnj;ها به حیات خود ادامه خواهد داد و نیازی نیست برای مهاجرت عجله کنید. هنوز هم در اکثر فرصت&zwnj;های شغلی ما نام Node را می&zwnj;بینیم و خبری از Deno نیست. اما اگر تازه قصد ورود به دنیای ابزارهای سمت سرور جاوا اسکریپتی را دارید بهترین گزینه برای شما Deno خواهد بوپ.</p>\r\n\r\n<p>تغییر نگاه شرکت&zwnj;ها و کمپانی&zwnj;های بزرگ زمان بر خواهد بود اما مطمئن باشید Deno آینده درخشانی خواهد داشت و در آینده نام این Runtime تازه متولد شده را بیشتر خواهید شنید.</p>	2020-08-15	images/posts/post-site-deno.png	Deno-Introduce	published	2	\N		\N	9	در این مطلب از جامعه گیک‌های کامپیوتر Runtime جدید و قدرتمند Deno (دینو) را به طور خلاصه معرفی و بررسی خواهیم کرد.	\N	\N	\N
5	آموزش پیاده سازی سیستم shooting با تاخیر زمانی در انجین گودوت (Godot)	<p>در ادامه سری ویدیوهای آموزش گودوت (Godot) ویدیویی جدید توسط جامعه گیک&zwnj;های کامپیوتر منتشر شده که در آن به نحوه <strong>پیاده سازی سیستم shooting با تاخیر زمانی در انجین گودوت (Godot)</strong> می&zwnj;پردازیم.</p>\r\n\r\n<p>ویدیوی قبلی ما با عنوان <a href="http://cgeeksc.ir/post/randomposition-object-godot">ساخت بی&zwnj;نهایت object با position رندم در انجین گودوت (Godot)</a> باعث به وجود آمدن سوالاتی در ذهن کاربران مثل چگونگی حرکت این Objectها به صورت افقی و مسائلی این چنینی شد و موجب شد تا ویدیویی جدید که در آن به تعدادی از سوالات کاربران پاسخ داده شده ضبط و منتشر گردد.</p>\r\n\r\n<blockquote>\r\n<h1><a href="http://cgeeksc.ir/post/headfootball-godot">ساخت پروژه Head Football در انجین Godot</a></h1>\r\n</blockquote>\r\n\r\n<p>این ویدیو شامل مباحث کاربردی&zwnj;ای مثل آشنایی با حرکت در فضای دو بعدی، کار با تایمر و دستور yield می&zwnj;شود که مباحثی پایه&zwnj;ای و کاربردی برای علاقه مندان به انجین بازی&zwnj;سازی گودوت (Godot) هستند می&zwnj;شود.</p>\r\n\r\n<p style="text-align:center"><img alt="آموزش گودوت" src="/media/uploads/2020/09/06/screenshot_2020-08-17_15-06-49_uvpuaPN.png" style="height:434px; width:867px" /></p>\r\n\r\n<p>در پایان این ویدیو شما به خوبی یاد خواهید گرفت که چطور می&zwnj;توان حرکت افقی Objectها و سیستمی شبیه به تیراندازی (Shooting) را به سادگی پیاده کنید و در بازی&zwnj;های خود استفاده کنید. این سیستم سیستمی کاربردی برای بازی&zwnj;هاست و می&zwnj;توانید در ساخت بازی&zwnj;های خود از مباحث داخل این ویدیو بهره بگیرید.</p>\r\n\r\n<p>اگر علاقه مند به بازی&zwnj;سازی و انجین گودوت (Godot) هستید پیشنهاد این می&zwnj;کنم این ویدیوی آموزشی را از دست ندهید و همین حالا این ویدیو را به صورت رایگان در کانال یوتوب CGC تماشا کنید.</p>\r\n\r\n<p>همچنین شما می&zwnj;توانید درخواست آموزش یا سوالات خود در رابطه با این ویدیو و یا دیگر مباحث در انجین گودوت (Godot) را از قسمت دیدگاه&zwnj;ها با ما در میان بگذارید.</p>	2020-08-17	images/posts/post-site-shooting-godot.png	shooting-with-deley-system-godot	published	2	\N		https://youtu.be/oS_TdYISfxs	7	در این ویدیو از سری ویدیوهای آموزش گودوت یاد خواهیم گرفت که چطور یک سیستم shooting اتوماتیک را پیاده سازی کنیم و علاوه برآن مباحثی مثل ایجاد تاخیر در اجرای فرمان‌ها را یاد خواهیم گرفت.	\N	\N	\N
6	وب اسکرپینگ (Web Scraping) برای همه	<p style="text-align:right">این روزها با توجه به گسترده شدن دنیای هوش مصنوعی و اهمیت استفاده از علم داده در کسب و کارهای بزرگ بیش از پیش در مورد <strong>وب اسکرپینگ (Web Scraping) </strong>می&zwnj;شنویم. با اینکه شاید خودمان متوجه این مطلب نباشیم اما روزانه بارها و بارها با Web Scraping برخورد داریم و به صورت مستقیم یا غیر مستقیم از سیستم&zwnj;هایی که دارای Web Scraping هستند استفاده می&zwnj;کنیم.</p>\r\n\r\n<p style="text-align:right">مهم نیست برنامه نویس باشید یا سر و کارتان با کارهای کامپیوتری باشد یا خیر؛ ورود و فعالیت شما در دنیای وب با پدیده Web Scraping گره خورده و نمی&zwnj;توان این دو را از هم جدا دانست.</p>\r\n\r\n<p style="text-align:right">در ادامه با معرفی و توضیحاتی در مورد Web Scraping با ما همراه باشید.</p>\r\n\r\n<p style="text-align:center"><img alt="وب اسکرپینگ (Web Scraping)" src="/media/uploads/2020/09/06/fundamentals-of-python-web-scraping-featured-image.jpg" style="height:450px; width:700px" /></p>\r\n\r\n<h2>Web Scraping؛ یک نام ترسناک</h2>\r\n\r\n<p style="text-align:right">Web Scraping در&zwnj;واقع عمل چندان پیچیده&zwnj;ای نیست اما در عمل کمک بزرگی به محققان و توسعه دهندگان و کسب و کارها می&zwnj;کند و باعث افزایش سرعت چند برابری کارهای ما می شود.</p>\r\n\r\n<p style="text-align:right">بیایید چیستی و ماهیت اصلی Web Scraping را با یک مثال ساده در زندگی واقعی خود بررسی کنیم. احتمالاً تا به حال حداقل یک بار برای درسی در دبیرستان مجبور شده&zwnj;اید که برای ارائه تحقیق یا پروژ&zwnj;ه&zwnj;ای در اینترنت جستجو کنید. برای این&zwnj;کار صفحه&zwnj;ای از وب را باز می&zwnj;کنید و همه یا بخشی از آن را برای تحقیق خود استفاده می&zwnj;کنید.</p>\r\n\r\n<p style="text-align:right">Web Scraping آمده تا همه این مراحل را کوتاه&zwnj;تر و سریعتر برایمان انجام دهد. در&zwnj;واقع می&zwnj;توان Web Scraping را تا حدودی همان کپی پیست از صفحه ویکی پدیای فارسی دانست. البته که این سطحی&zwnj;ترین نگاهی است که می&zwnj;توان به Web Scraping داشت.</p>\r\n\r\n<p style="text-align:right">احتمالاً حالا چیزهایی در مورد Web Scraping فهمیده&zwnj;اید. حال کمی از این نگاه ساده خارج شویم و به زبانی تخصصی تر Web Scraping را توضیح دهیم.</p>\r\n\r\n<p dir="rtl" style="text-align:right">اگر بخواهیم چیستی Web Scraping را کمی حرفه&zwnj;ای&zwnj;تر بیان کنیم می&zwnj;توان گفت Web Scraping ا<strong>بزاری است برای استخراج اطلاعات از دنیای وب و تحویل این اطلاعات برای انواع استفاده به هسته اصلی نرم افزار</strong>. این استفاده می&zwnj;تواند شامل پردازش اطلاعات یا صرفاً نمایش آن&zwnj;ها به صورت یکپارچه و کاربردی&zwnj;تر باشد.</p>\r\n\r\n<blockquote>\r\n<p style="text-align:right">Web Scraping آمده تا استخراج اطلاعات را در سریعترین زمان؛ کمترین هزینه و کمترین خطا برای ما انجام دهد.</p>\r\n</blockquote>\r\n\r\n<p style="text-align:right">از جمله پرکاربردترین استفاده&zwnj;های Web Scraping در دنیای واقعی را می&zwnj;توان موتورهای جستجو دانست که با خزش در دنیای وب اطلاعات مورد نظر و همخوان با جستجوی کاربر را به او نمایش می&zwnj;دهند.</p>\r\n\r\n<blockquote>\r\n<h1><a href="http://cgeeksc.ir/post/Crawler-Introduction">آشنایی با کراولرها و موتورهای جستجو</a></h1>\r\n</blockquote>\r\n\r\n<p style="text-align:right">به عنوان مثال یک نرم&zwnj;افزار را در نظر بگیرید که قیمت&zwnj;های فروشگاه&zwnj;های مختلف را مقایسه کرده و بهترین آن&zwnj;ها را به ما پیشنهاد می&zwnj;دهد. این نرم&zwnj;افزار دقیقاً کار استخراج اطلاعات را انجام می&zwnj;دهد و با جستجو در هدف&zwnj;هایی مشخص اطلاعاتی مشخص را برای ما جمع آوری کرده تا بتوانیم به شکلی کاربردی&zwnj;تر آن را در اختیار کاربر نهایی قرار دهیم.</p>\r\n\r\n<p style="text-align:right">استفاده&zwnj;های Web Scraping بسیار زیاد و همچنین کاربردی هستند. هر نرم&zwnj;افزاری که با اطلاعاتی خاص سر و کار داشته باشد و هر دانشمند داده&zwnj;ای باید از Web Scraping بهره بگیرد.</p>\r\n\r\n<p style="text-align:right">Web Scraping در&zwnj; واقع در خط مقدم علم داده قرار دارد و کار مهم جمع آوری اطلاعات را انجام می&zwnj;دهد.</p>\r\n\r\n<p style="text-align:center"><img alt="وب اسکرپینگ (Web Scraping) چیست" src="/media/uploads/2020/09/06/web-scraping-2.png" style="height:504px; width:750px" /></p>\r\n\r\n<h3>چرا Web Scraping؟</h3>\r\n\r\n<p style="text-align:right">این سؤال که چرا باید از Web Scraping استفاده کنیم جوابی بسیار ساده دارد. در&zwnj;واقع می&zwnj;توان جواب این سؤال را با جواب سؤال چرا باید از کامپیوتر استفاده کنیم یکی دانست.</p>\r\n\r\n<p style="text-align:right">همانطور که ما برای انجام سریع&zwnj;تر، کم هزینه&zwnj;تر و با دقتی بیشتر از انسان بسیاری از کارها از کامپیوتر استفاده می&zwnj;کنیم برای جمع آوری داده هم از Web Scraping استفاده می کنیم.</p>\r\n\r\n<p style="text-align:right">در&zwnj;واقع بسیاری از کارها بدون Web Scraping حتی قابل انجام هم نیستند. مثال&zwnj;هایی که در این محتوا آورده شد همه در لحظه و از بین کوهی از اطلاعات داده&zwnj;های مورد نیاز ما را استخراج کرده و نمایش می&zwnj;دهند در صورتی که اساساً بدون Web Scraping قابل انجام نیستند.</p>\r\n\r\n<p style="text-align:right">البته Web Scraping جدا از استفاده اصلی خود که در علم داده و استخراج اطلاعات است می&zwnj;تواند شامل عملیات&zwnj;های دیگری مانند ثبت اطلاعات هم می&zwnj;شوند.</p>\r\n\r\n<p style="text-align:right">جمع&zwnj;بندی اینکه رکن اصلی و اساس و بطن Web Scraping داده و اطلاعات است. حال چه برای جمع آوری و چه برای ثبت و پخش. هر نرم افزاری که سر و کاری با اطلاعات یا علم داده باشد به صورت هم پا و همگام باید از Web Scraping کمک بگیرد.</p>	2020-08-22	images/posts/post-site-web-scraping.png	Web-Scraping-Introduce	published	2	\N		\N	5	در این مطلب به صورت خلاصه و با زبانی ساده یکی از موضوعات داغ این روزها یعنی وب اسکرپینگ (Web Scraping) را همراه با چند مثال توضیح خواهیم داد.	\N	\N	\N
8	نگاهی به توزیع لینوکس منت (Linux Mint)	<p>سیستم عامل&zwnj;های بر پایه گنو/لینوکس را می توان گامی رو به جلو در علوم کامپیوتر و دنیای نرم افزار آزاد دانست. این سیستم عامل قدرتمند در طول سال&zwnj;ها پیشرفت&zwnj;های زیادی داشته و محبوبین فراوانی در بین کاربران پیدا کرده است. توزیع&zwnj;های مختلفی از این سیستم عامل منتشر شده&zwnj;اند که دو شاخه اصلی آن&zwnj;ها را می&zwnj;توان دو توزیع قدرتمند <a href="http://cgeeksc.ir/post/arch-vs-debian">آرچ (Arch) و دبیان (Debian)</a> دانست.</p>\r\n\r\n<p>از بین این دو توزیع، توزیع دبیان (Debian) عمومیت بیشتری در بین کاربران پیدا کرده و به واسطه توزیع&zwnj;هایی مانند اوبونتو (Ubuntu) حضور پر رنگی در بین کاربران و علاقه&zwnj;مندان به گنو/لینوکس دارد. پیش از این در رویداد انتشار اوبونتو 20.04 (Ubuntu 20.04) این توزیع محبوب را به طور کامل مورد بررسی قرار دادیم و با آن آشنا شدیم.</p>\r\n\r\n<p>قدرت و کاربردی بودن توزیع اوبونتو (Ubuntu) که به عنوان یکی از محبوب&zwnj;ترین و پر استفاده&zwnj;ترین توزیع&zwnj;ها، چه برای کامپیوترهای خانگی و چه در سرورها، شناخته شده است و موجب شده بسیاری از کاربران شیفته این توزیع شوند و بسیاری از توسعه دهندگان و شرکت&zwnj;های فعال در دنیای نرم افزار آزاد، به فکر ساخت توزیع&zwnj;هایی بر پایه اوبونتو (Ubuntu) بیفتند تا علاوه بر داشتن امکانات این توزیع خوش نام، ویژگی&zwnj;های جدید و مد نظر خود را به آن اضافه کنند و توزیعی جذاب&zwnj;تر و بهبود یافته بر پایه اوبونتو (Ubuntu) عرضه کنند.</p>\r\n\r\n<p style="text-align:center"><img alt="لینوکس منت (Linux Mint)" src="/media/uploads/2020/09/06/linux-mint-header.jpg" style="height:432px; width:913px" /></p>\r\n\r\n<p>یکی از بزرگترین توزیع&zwnj;های بر پایه اوبونتو (Ubuntu) که توانسته کاربران زیادی را مجذوب خود کند توزیع <strong>لینوکس منت (Linux Mint)</strong> است.</p>\r\n\r\n<p>لینوکس منت (Linux Mint)<strong> </strong>که در صدر محبوب&zwnj;ترین توزیع&zwnj;ها قرار دارد و بر پایه اوبونتو (Ubuntu) توسعه داده شده است اخیرا نسخه جدید خود یعنی <strong>Linux Mint 20 </strong>را با افزودن ویژگی&zwnj;های جدید و بر پایه آخرین نسخه از اوبونتو یعنی Ubuntu 20.04 عرضه کرده است.</p>\r\n\r\n<blockquote>\r\n<p><a href="http://cgeeksc.ir/event/002">جلسه دوم: لینوکس با تمرکز بر توزیع اوبونتو</a></p>\r\n</blockquote>\r\n\r\n<p>در این ویدیو از رسانه جامعه گیک&zwnj;های کامپیوتر به صورت اجمالی و خلاصه به بررسی این توزیع محبوب یعنی لینوکس منت (Linux Mint)<strong> </strong>خواهیم پرداخت. اگر شما هم علاقه مند به سیستم عامل گنو/لینوکس هستید و دوست دارید با توزیع&zwnj;های مختلف این سیستم عامل آشنا شوید پیشنهاد می&zwnj;کنم این ویدیو که در آن یکی از پر طرفدارترین&zwnj;های خانواده گنو/لینوکس را مورد بررسی قرار می&zwnj;دهیم از دست ندهید.<strong> </strong></p>	2020-08-31	images/posts/post-site-linux-mint.jpg	look-at-linux-mint	published	2	\N		https://youtu.be/dm6X9Z8uFlk	1	در این ویدیو به بررسی توزیع محبوب و پر طرفدار لینوکس منت (Linux Mint) خواهیم پرداخت و نگاهی اجمالی به این توزیع خواهیم انداخت.	\N	\N	\N
9	نگاهی به سیستم‌های Embedded	<h2 dir="RTL" style="text-align:right"><span dir="LTR">Embedded</span> سیستم چیست؟</h2>\r\n\r\n<p dir="RTL" style="text-align:right">اگر بخواهیم یک تعریف کلی از <span dir="LTR">Embedded</span> سیستم&zwnj;ها که به آنها <strong>سیستم&zwnj;های بلادرنگ</strong> نیز می&zwnj;گویند را ارائه نماییم می&zwnj;توانیم آنها را سیستم&zwnj;هایی توصیف کنیم که به طور خاص و برای انجام یک عمل خاص طراحی می&zwnj;شوند و نقطه مقابل سیستم&zwnj;های چندمنظوره میباشند. به عنوان مثال لپ تاپ یک سیستم چند منظوره میباشد که به وسیله آن می&zwnj;توانیم اعمال بسیار متفاوتی همچون کد نویسی، ادیت ویدیو، ضبط صوت و تصویر، پخش ویدیو و موزیک و... را به انجام برسانیم.</p>\r\n\r\n<p dir="RTL" style="text-align:right">اما یک دستگاه ضبط صدا که منحصرا برای این عمل طراحی شده است یک سیستم <span dir="LTR">Embedded</span> است و عمل ضبط صوت را بسیار حرفه&zwnj;ای&zwnj;تر و با کیفیت بالاتری به انجام می&zwnj;رساند.</p>\r\n\r\n<blockquote>\r\n<p dir="RTL" style="text-align:right">در واقع <span dir="LTR">Embedded</span> سیستم&zwnj;ها یک کامپیوتر تلقی نمی&zwnj;شوند، چرا که تنها ماشین&zwnj;ها یا وسایلی هستند که به وسیله&zwnj;ی یک پروسسور یا یک قطعه با قابلیت&zwnj;های کامپیوتری می&zwnj;توانند بهره&zwnj;وری بسیار بلایی داشته باشند.</p>\r\n</blockquote>\r\n\r\n<p dir="RTL" style="text-align:right">&nbsp;</p>\r\n\r\n<p dir="RTL" style="text-align:center"><img alt="d\\embedded system" src="/media/uploads/2020/09/06/image.png" style="height:279px; width:497px" /></p>\r\n\r\n<p dir="RTL" style="text-align:center">&nbsp;</p>\r\n\r\n<h3 dir="RTL" style="text-align:right">اجزای <span dir="LTR">embedded</span> سیستم&zwnj;ها</h3>\r\n\r\n<p dir="RTL" style="text-align:right">همانند هر سیستم دیگری، سیستم&zwnj;های بلادرنگ از بخش&zwnj;های متفاوتی چون <strong>نرم افزار</strong> و <strong>سخت افزار</strong> تشکیل می&zwnj;شوند.</p>\r\n\r\n<p dir="RTL" style="text-align:right">نکته&zwnj;ای که درباره&zwnj;ی طراحی سخت افزار و نرم&zwnj;افزار مربوط به این سیستم&zwnj;ها وجود دارند آن است که باید هر دو به صورت همزمان طراحی شوند چرا که فردی که وظیفه طراحی نرم&zwnj;افزار سیستم را دارد میبایست از نقشه سخت&zwnj;افزاری و معماری آن اطلاع داشته باشد و همچنین طراح سخت&zwnj;افزار باید از نحوه کار نرم افزار مطلع باشد.</p>\r\n\r\n<h3 dir="RTL" style="text-align:right">نرم افزار <span dir="LTR">Embedded</span> سیستم&zwnj;ها</h3>\r\n\r\n<p dir="RTL" style="text-align:right">همانطور که گفته شد سیستم&zwnj;های بلادرنگ برای انجام تخصصی یک عملیات خاص طراحی می&zwnj;گردند در نتیجه نرم افزارهای تعبیه شده در آن&zwnj;ها نیز به همین صورت و برای انجام عملیات خاص بر روی داده&zwnj;های ورودی خاص هستند. این نرم&zwnj;افزارها برای کنترل دستگاه&zwnj;ها و ماشین&zwnj;هایی طراحی می&zwnj;شوند که کامپیوتر تلقی نمی&zwnj;شوند و شخصی که نرم افزارهای بلادرنگ(<span dir="LTR">Embedded software</span>) را طراحی میکند باید توانایی فهمیدن طرح شماتیک مدار و دیتا شیت&zwnj;های مربوط به سخت افزارهای سیستم را داشته باشد.</p>\r\n\r\n<p dir="RTL" style="text-align:right">نرم افزارهای ذکر شده می&zwnj;توانند به صورت <span dir="LTR">open source</span> و یا <span dir="LTR">closed source</span> (با توجه به زبان برنامه نویسی آنها و سیستم عاملی که بر روی آن پیاده سازی می&zwnj;شوند) طراحی شوند. برخلاف کامپیوترهای عادی که برای اجرای برنامه&zwnj;ها به یک سیستم عامل مانند <span dir="LTR">Windows</span>، <span dir="LTR">Mac-OS</span> یا <a href="http://cgeeksc.ir/event/002">لینوکس</a> احتیاج دارند <span dir="LTR">Embedded</span> سیستم&zwnj;ها می&zwnj;توانند بدون نیاز به هیچ سیستم عاملی کار کنند و اگر در برخی موارد از سیستم عامل استفاده کنند قادر به کار بر روی هر سیستم عاملی میباشند.</p>\r\n\r\n<p dir="RTL" style="text-align:right">نکته مهم در رابطه با طراحی نرم افزارهای بلادرنگ آن است که حافظه و <span dir="LTR">Ram</span> تعبیه شده در سیستم در کارکرد نرم افزار تاثیر گذار است چرا که برنامه نویسی بردها با برخی از زبان&zwnj;های برنامه نویسی همچون <span dir="LTR">C</span> و <span dir="LTR">Embedded C++</span> به فضای حافظه کمتری نسبت به زبان <span dir="LTR">Basic</span> احتیاج دارد.</p>\r\n\r\n<p dir="RTL" style="text-align:right">&nbsp;</p>\r\n\r\n<p dir="RTL" style="text-align:center"><img alt="embeddedsoftware" src="/media/uploads/2020/09/06/image_EARx1sO.png" style="height:360px; width:543px" /></p>\r\n\r\n<p dir="RTL" style="text-align:center">&nbsp;</p>\r\n\r\n<p dir="RTL" style="text-align:right">&nbsp;</p>\r\n\r\n<h4 dir="RTL" style="text-align:right"><span dir="LTR">Embedded</span> سیستم&zwnj;ها در اینترنت اشیا</h4>\r\n\r\n<p dir="RTL" style="text-align:right">تقریبا می&zwnj;توان گفت که اکثر دستگاه&zwnj;های که اینترنت اشیا در آن&zwnj;ها مورد استفاده قرار می&zwnj;گیرند یک <span dir="LTR">Embedded</span> سیستم هستند. دستگاه&zwnj;هایی که ارتقاع داده می&zwnj;شوند تا در سیستم اینترنت اشیا مورد استفاده قرار گیرند از یک دستگاه معمولی با یک هدف خاص(مانند یخچال که مشخصا برای سرد نگه داشتن مواد غذایی طراحی شده است)، یک تراشه کامپیوتری سخت افزاری که عمل محاسبات کامپیوتری را انجام دهد و نرم افزار مربوط به نحوه کار یخچال بر روی آن نصب گردد و گاها تعدادی سنسور و عملگر تشکیل شده&zwnj;اند که در نتیجه طبق گفته&zwnj;های بالا همگی باید به صورت <span dir="LTR">Embedded</span> طراحی شوند تا هماهنگی لازم در سیستم را ایجاد نمایند.</p>\r\n\r\n<p dir="RTL" style="text-align:right">در واقع این دستگاه&zwnj;ها از نظر تکنیکی کامپیوتر محسوب نمی&zwnj;شوند و تنها دستگاهی هستند که یک تراشه با قابلیت انجام محاسبات و عملیات کامپیوتری در آنها تعبیه شده است.</p>\r\n\r\n<p dir="RTL" style="text-align:right">&nbsp;</p>\r\n\r\n<p dir="RTL" style="text-align:center"><img alt="internet of things" src="/media/uploads/2020/09/06/image_neJMN1Q.png" style="height:351px; width:500px" /></p>	2020-09-05	images/posts/post-site-embedded.jpg	Embeddedsystemsintroduction	published	4	\N		\N	1	با پیشرفت تکنولوژی و ترکیب سخت افزار با نرم‌افزارها و تکنولوژی الکترونیک علم جدیدی به نام embedded systems  بسیار مورد استقبال قرار گرفته است که در تمامی دستگاه‌های اینترنت اشیا مورد استفاده قرار می‌گیرد. در این مقاله به تشریح کوتاهی از سیستم‌های embedded خواهیم پرداخت.	\N	\N	\N
10	نگاهی به توزیع مانجارو (Manjaro)	<p>شاید شما هم از علاقه مندان به دنیای گنو/لینوکس باشید اما ممکن است شما هم مثل بسیاری از کاربران که قصد ورود به <a href="http://cgeeksc.ir/event/002">دنیای لینوکس</a> را دارند دچار مشکلات شده و شک&zwnj;هایی داشته و بین صدها توزیع و نام و عنوان مختلف گیج شده باشید.</p>\r\n\r\n<p>معمولا کاربران تازه وارد به خوبی با توزیع&zwnj;های مختلف آشنا نیستند و انتخاب یک توزیع مناسب که هم قدرتمند باشد و هم ساده و به دور از پیچیدگی، با وجود صدها توزیع مختلف کار را برایشان کمی سخت می&zwnj;کند. این که باید از توزیع&zwnj;های بر پایه دبیان استفاده کنند یا بهتر است به سمت خانواده آرچ بروند؟&zwnj; کدام محیط کار مناسب&zwnj;تر است و.. سوالاتی هستند که همیشه ذهن هر تازه واردی را به خود مشغول می&zwnj;کند و یافتن یک جواب مناسب در بین جنگ کاربران توزیع&zwnj;های مختلف خود، یک صبر فولادین می&zwnj;خواهد.</p>\r\n\r\n<blockquote>\r\n<p><a href="http://cgeeksc.ir/post/arch-vs-debian">مقایسه&zwnj;ی آرچ و دبیان</a></p>\r\n</blockquote>\r\n\r\n<p>به همین خاطر و برای آشنایی بیشتر کاربران، به خصوص کاربرانی که تازه به سمت خانواده گنو/لینوکس آمده&zwnj;اند ما در جامعه گیک&zwnj;های کامپیوتر توزیع&zwnj;های مختلف را مورد بررسی قرار می&zwnj;دهیم و نگاهی به آن&zwnj;ها می&zwnj;اندازیم تا بتوانیم به کاربران در انتخاب یک توزیع مناسب و کارآمد کمک کرده باشیم.</p>\r\n\r\n<p style="text-align:center"><img alt="مانجارو (Manjaro)" src="/media/uploads/2020/09/07/manjaro-logo.png" style="height:450px; width:800px" /></p>\r\n\r\n<h2>مانجاروی دوست داشتنی</h2>\r\n\r\n<p>امروز نوبت به توزیع محبوب مانجارو (Manjaro) رسیده است. مانجارو (Manjaro) یک توزیع بر پایه آرچ است و با شعار سادگی پا به میدان گذاشته و الحق هم که در ادا کردن شعار خود به خوبی عمل کرده و موفق بوده است.</p>\r\n\r\n<blockquote>\r\n<p><a href="http://cgeeksc.ir/post/look-at-linux-mint">نگاهی به توزیع لینوکس منت (Linux Mint)</a></p>\r\n</blockquote>\r\n\r\n<p>مانجارو (Manjaro) از آن دست توزیع&zwnj;هایی است که می&zwnj;تواند یکی از گزینه&zwnj;های بسیار خوب برای کاربران تازه وارد باشد. در عین حال مانجارو (Manjaro) به کمک کاربرانی آمده که عاشق آرچ و ویژگی&zwnj;هایش هستند اما حوصله و وقت نصب و تنظیمات آرچ را ندارند. شما با نصب مانجارو (Manjaro) می&zwnj;توانید در سریع&zwnj;ترین زمان پا به دنیای آرچ بگذارید و همه چیز را به ساده&zwnj;ترین شکل ممکن در اختیار داشته باشید.</p>\r\n\r\n<p>اگر دنبال یک توزیع ساده و کارآمد هستید یا قصد آشنایی با توزیع&zwnj;های لینوکسی را دارید پیشنهاد می&zwnj;کنم این ویدیو که در آن نگاهی به توزیع مانجارو (Manjaro) خواهیم داشت را از دست ندهید و با بررسی این توزیع با من همراه باشید.</p>	2020-09-07	images/posts/post-site-manjaro.png	look-at-Manjaro	published	2	\N		https://youtu.be/oY_dUFUZN5Y	1	در این ویدیو نگاهی به توزیع محبوب مانجارو (Manjaro) خواهیم انداخت. مانجارو (Manjaro) یک توزیع بر پایه آرچ است که سادگی را به کاربران هدیه می‌دهد. با بررسی این توزیع همراه ما باشید.	\N	2020-09-07 14:30:00+00	\N
12	تفاوت SSD و HDD	<p dir="rtl" style="text-align:right"><span style="color:#000000">همگی ما در دنیای امروز با انبوهی از اطلاعات محاصره شده&zwnj;ایم؛&nbsp;اطلاعاتی که روز به روز به حجمشان اضافه می&zwnj;شود و ما نیز ناگزیر به ذخیره&zwnj;ی بخشی از آنها در سیستم&zwnj;های شخصی&zwnj;مان هستیم.</span></p>\r\n\r\n<p dir="rtl" style="text-align:right"><span style="color:#000000">بدون شک برای ذخیره&zwnj;سازی این اطلاعات نیاز به فضایی داریم که آنها را در خودش نگهداری کند و این وظیفه&zwnj;ای است که تنها از عهده&zwnj;ی حافظه برمی&zwnj;آید!</span></p>\r\n\r\n<p dir="rtl" style="text-align:right"><span style="color:#000000">حافظه؛ همانطور که گفتیم و از اسمش هم بر می&zwnj;آيد چیزی را در خودش حفظ می&zwnj;کند و انواع و اقسام مختلفی دارد.</span></p>\r\n\r\n<p dir="rtl" style="text-align:right"><span style="color:#000000">کامپیوتر نیز انواع مختلفی از آن را دارا می&zwnj;باشد. از <strong>Register</strong> و <strong>Cache</strong> گرفته تا&nbsp; <strong>Ram</strong> و <strong>Rom</strong>&nbsp;و <strong>SSD</strong> و <strong>HDD</strong>.</span></p>\r\n\r\n<p dir="rtl" style="text-align:right"><span style="color:#000000">اما آیا تکنولوژيشان یکسان است؟ آیا سرعتهای یکسانی دارند؟ اگر چنین نیست&zwnj;&zwnj;؛&nbsp;پس چه چیزهایی باعث تمایز میان آنها شده&zwnj; است؟</span></p>\r\n\r\n<p dir="rtl" style="text-align:right"><span style="color:#000000">در این مطلب از جامعه&zwnj;ی گیک&zwnj;های کامپیوتر قصد داریم نگاهی بیندازیم به دو حافظه&zwnj;ی جانبی! یعنی&nbsp; SSD و HDD. همراه&nbsp;ما باشید.</span></p>\r\n\r\n<p dir="rtl" style="text-align:center"><span style="color:#000000"><img alt="ssd-vs-hdd" src="/media/uploads/2020/09/09/ssdvshdd-01.jpg" style="height:480px; width:640px" /></span></p>\r\n\r\n<p dir="rtl" style="text-align:right"><span style="color:#000000">همه&zwnj;ی ما در سیستم هایمان اطلاعات زیادی را نگهداری میکنیم، اطلاعاتی از قبیل عکس، فیلم، آهنگ، فایل&zwnj;های مختلف و&hellip; که همگی در حافظه&zwnj;ی&nbsp;کامپیوترمان ذخیره سازی شده&zwnj;اند.</span></p>\r\n\r\n<p dir="rtl" style="text-align:right"><span style="color:#000000">در حال حاضر برای ذخیره سازی اطلاعات در کامپیوترها از دو سخت&zwnj; افزار استفاده می&zwnj;شود. <strong>SSD</strong> و <strong>HDD</strong>. گاهی اوقات در کنار هم استفاده می&zwnj;شوند و گاهی اوقات هم تنها و بطور جداگانه. این موضوع کاملا به شرکت سازنده مربوط است و شرکت سازنده تعیین می&zwnj;کند که در محصولش از کدام استفاده کند.(دراین مطلب منظور از کامپیوترها بیشتر&nbsp;لپ&zwnj;تاپ ها می&zwnj;باشند.)</span></p>\r\n\r\n<p dir="rtl" style="text-align:right"><span style="color:#000000">سوال اصلی این است که اصلا <strong>SSD</strong> و &zwnj;&zwnj;<strong>HDD</strong> چه هستند و تفاوتشان چیست؟</span></p>\r\n\r\n<h2 dir="rtl" style="text-align:right"><span style="color:#000000">HDD</span></h2>\r\n\r\n<p dir="rtl" style="text-align:right"><span style="color:#000000">احتمالا این نوع از حافظه&zwnj;ها&nbsp;معرف حضورتان هستند. <strong>Hard Disk Drive</strong> یا به اختصار <strong>HDD</strong> به نوعی در دنیای حافظه&zwnj;های ذخیره&zwnj;سازی کهن کسوت محسوب می&zwnj;شود و علاوه بر این از مهمترین اختراعات بشر می&zwnj;باشد.</span></p>\r\n\r\n<p dir="rtl" style="text-align:right"><span style="color:#000000">این هاردها متشکل از قطعاتی مکانیکی می&zwnj;باشند. در هارد درایوها اطلاعات روی دیسک&zwnj;های گردان (Platter) ذخیره می&zwnj;شوند و نحوه کار آنها اینگونه است که دیسک گردان با سرعت بالایی (5400 یا 7200 دور در دقیقه) می&zwnj;چرخد و یک بازوی مکانیکی که در سر آن دو قطعه به نام head وجود دارد می&zwnj;تواند بدون تماس فیزیکی با دیسک فلزی اطلاعات را به صورت مغناطیسی بنویسد و یا بخواند.</span></p>\r\n\r\n<p dir="rtl" style="text-align:right"><span style="color:#000000">احتمالا الان متوجه مشکل هارد درایو شده&zwnj;اید. این هارد&zwnj;ها برای اینکه بتوانند کار خود را انجام دهند باید انرژی الکتریکی را به انرژی مکانیکی تبدیل کنند که این کار باعث هدررفت توان و تولید گرما می&zwnj;شود.</span></p>\r\n\r\n<p dir="rtl" style="text-align:right"><span style="color:#000000">همچنین چرخش و حرکتی که در هارد درایو وجود دارد نیز باعث گرم شدن آن می&zwnj;شود.</span></p>\r\n\r\n<p dir="rtl" style="text-align:right"><span style="color:#000000">حال وقت آن است که برویم سراغ رقیب HDD&zwnj;ها یعنی SSD!</span></p>\r\n\r\n<h3 dir="rtl" style="text-align:right"><span style="color:#000000">SSD</span></h3>\r\n\r\n<p dir="rtl" style="text-align:right"><span style="color:#000000"><strong>Solid State Disk</strong> یا به اختصار <strong>SSD</strong> و به فارسی درایو حالت جامد که حدود 35 سال از رقیبش جوان&zwnj;تر است برای اولین بار در سال 1991 و با حجم 20 مگابایت عرضه شد.</span></p>\r\n\r\n<p dir="rtl" style="text-align:right"><span style="color:#000000">حال که صحبت از اعداد و ارقام شد جا دارد بگویم HDD متولد&nbsp;سال 1956 می&zwnj;باشد که&nbsp;تنها با 5 مگابایت حافظه جهت ذخیره&zwnj;سازی اطلاعات قدم در دنیای سخت&zwnj;افزار و تکنولوژی گذاشت&nbsp;و برخلاف مقدار حافظه&zwnj;اش هیبتی به اندازه&zwnj;ی دو یخچال و قیمتی نجومی و باورنکردنی یعنی 10000 دلار به ازای هر مگابایت حافظه&zwnj;اش داشت. شرکت سازنده&zwnj;اش هم IBM بزرگ بود.</span></p>\r\n\r\n<p dir="rtl" style="text-align:center"><span style="color:#000000"><img alt="IbmLogo" src="/media/uploads/2020/09/09/ibm.jpg" /></span></p>\r\n\r\n<p dir="rtl" style="text-align:right"><span style="color:#000000">در SSDها اما دیگر خبری از قطعات مکانیکی و بازو و دیسک گردان نیست. این نوع از حافظه&zwnj;ها برای ذخیره سازی اطلاعات از تکنولوژی <strong>NAND Flash</strong> استفاده می&zwnj;کنند.</span></p>\r\n\r\n<p dir="rtl" style="text-align:right"><span style="color:#000000">همین عدم وجود قطعات مکانیکی و بهره&zwnj;گیری از &zwnj;NAND Flash باعث می&zwnj;شود &zwnj;SSDها در مقایسه با&nbsp; HDDها بسیار <strong>سریع&zwnj;تر</strong> باشند.</span></p>\r\n\r\n<p dir="rtl" style="text-align:right"><span style="color:#000000">بیایید گریزی به تعریف حافظه&zwnj;ی <strong>Flash</strong> داشته باشیم، فلش یکی از انواع حافظه&zwnj;ها می&zwnj;باشد که خواندن و نوشتن روی آن بصورت الکتریکی انجام می&zwnj;گیرد.</span></p>\r\n\r\n<p dir="rtl" style="text-align:right"><span style="color:#000000">خود فلش نیز دو نوع دارد که براساس منطق های دو گیت <strong>NAND</strong> و &zwnj;<strong>NOR</strong> نامگذاری شده&zwnj;&zwnj;اند.</span></p>\r\n\r\n<p dir="rtl" style="text-align:right"><span style="color:#000000">حال بیایید به تعریف <strong>NAND</strong> نیز نگاهی بیندازیم. بطور کلی NAND یک &quot;<strong>Universal Logic Gate</strong>&quot; و یا گیت منطقی جهانی (گرچه برگردان آن به فارسی چندان خوب بنظر نمی&zwnj;رسد اما دیگر کاری است که شده) می&zwnj;باشد. با گیت&zwnj;های Universal می&zwnj;توان هر نوع تابع بولی را بدون یاری دیگر گیت&zwnj;ها پیاده&zwnj;سازی کرد که همین قابلیت قدرت زیادی به گیت NAND بخشیده است.</span></p>\r\n\r\n<p dir="rtl" style="text-align:right"><span style="color:#000000">&nbsp;NAND Flashها تکنولوژی های متفاوتی دارند که هم در عمر SSDها تاثیر دارند و هم در قیمت آن&zwnj;ها.</span></p>\r\n\r\n<p dir="rtl" style="text-align:center"><span style="color:#000000"><img alt="NanoFlash" src="/media/uploads/2020/09/09/nand.jpg" style="height:378px; width:595px" /></span></p>\r\n\r\n<p dir="rtl" style="text-align:right"><span style="color:#000000">برویم سراغ بحث اصلی&zwnj;مان؛&nbsp;گرچه سرعت بالا برای هرکسی خوشایند است اما باید این نکته را بگویم که قیمت SSD نسبت به رقیبش واقعا بالا می&zwnj;باشد. همچنین در صورت نوشتن مقادیر زیادی از اطلاعات در SSDها، به مرور دچار کندی می&zwnj;شوند.(مقادیر خیلی خیلی زیاد، یعنی نباید دلهره وجودتان را فرابگیرد که SSD پس مدتی استفاده از کار می&zwnj;افتد.)</span></p>\r\n\r\n<p dir="rtl" style="text-align:right"><span style="color:#000000">در پرانتز این نکته را بگویم که هدف این مطلب ذکر کلیات می&zwnj;باشد و نه جزییات.</span></p>\r\n\r\n<p dir="rtl" style="text-align:right"><span style="color:#000000">در مقابل SSDها،&nbsp;وجود قطعات مکانیکی و چرخش دیسکی که HDD در درون خودش دارد؛&nbsp;باعث شده که این نوع از حافظه ها تحریک پذیر باشند و ضربه&zwnj;ی شدید و گرما و سرمای بیش از حد معمولا آنها را دچار مشکل می&zwnj;کنند که حتی ممکن است بسیار حاد باشند.</span></p>\r\n\r\n<blockquote>\r\n<p dir="rtl" style="text-align:right"><span style="color:#000000">یکی از دلایلی که افراد SSD خریداری می&zwnj;کنند این است که بواسطه ی سرعت بالایی که دارد سرعت BOOT سیستم&zwnj;عاملشان را به طرزی باورنکردنی افزایش می&zwnj;دهد و سیستم را از باتلاق کندی به بیرون می&zwnj;کشد و نجات می&zwnj;دهد.</span></p>\r\n</blockquote>\r\n\r\n<p dir="rtl" style="text-align:right"><span style="color:#000000">به عنوان نکاتی که احتمالا به کارتان می&zwnj;آیند باید بگویم:</span></p>\r\n\r\n<ul>\r\n\t<li dir="rtl" style="list-style-type:disc"><span style="color:#000000">تابحال هنگام گشت و گذار میان لپ&zwnj;تاپ&zwnj;ها و رصد کردن مشخصاتشان به &quot;<strong>حافظه هایبریدی</strong>&quot; برخورد کرده&zwnj;اید؟ منظور از حافظه&zwnj;ی هایبریدی (Hybrid) این است که آن لپتاپ از <strong>ترکیب SSD و HDD</strong> بهره می&zwnj;برد که بالطبع لپ&zwnj;تاپ&zwnj; را لحاظ قیمتی از لپ&zwnj;تاپ&zwnj;های دارای SSD خالص بصرفه&zwnj;تر&nbsp; و از لحاظ سرعتی از لپتاپهای دارای HDD خالص بهتر می&zwnj;کند.</span></li>\r\n\t<li dir="rtl" style="list-style-type:disc"><span style="color:#000000">چیزی با عنوان &quot;هارد SSD&quot; وجود ندارد و ترکیبی است از بیخ و بن غلط که کمی در ایران جا افتاده و به اشتباه به &quot;حافظه&zwnj;های SSD&quot; اطلاق می&zwnj;شود.</span></li>\r\n</ul>\r\n\r\n<p dir="rtl" style="text-align:right"><span style="color:#000000">و اما برای خرید SSD نیز جا دارد نکته&zwnj;ای دیگر را متذکر شوم، قبل از خرید حتما مطالبی را در مورد انواع مختلف SSD و تفاوتهایشان با یکدیگر مطالعه کنید و با ذهنی بازتر دست به خرید بزنید. همچنین با شرکت گارانتی کننده&zwnj;ی لپتاپتان تماس بگیرید و لیست SSDهایی که لپ&zwnj;تاپتان و شرکت سازنده&zwnj;اش پشتیبانی می&zwnj;کند را بخواهید تا هنگام خرید دچار اشتباه نشوید و خرید خوبی داشته باشید.</span></p>\r\n\r\n<p dir="rtl" style="text-align:right"><span style="color:#000000">برای اضافه کردن SSD به لپ&zwnj;تاپتان نیز اگر تجربه&zwnj;ي باز کردن لپتاپ را ندارید بهتر است کار را به شرکت گارانتی کننده&zwnj;ی لپ&zwnj;تاپتان بسپارید و خودتان انجام ندهید؛ چون باز کردن لپ&zwnj;تاپ&zwnj;ها معمولا لم خاصی دارد و احتمال اینکه به بدنه&zwnj;ی لپ&zwnj;تاپ آسیب بزنید و یا آخر کار <strong>پیچ</strong>&nbsp;اضافه یا کم بیاورید زیاد می&zwnj;باشد.</span></p>	2020-09-09	images/posts/ssd1.png	ssd-vs-hdd	published	3	\N		\N	4	در این مطلب ضمن معرفی دو حافظه‌ی ذخیره سازی در کامپیوترها به مقایسه‌ی کوتاه SSD و HDD می‌پردازیم.	\N	2020-09-09 14:30:00+00	\N
11	مدولاسیون OFDM روشی برای تخمین کانال اینترنت اشیا	<p dir="RTL" style="text-align:right"><span style="font-family:Vazir"><span style="font-size:11pt"><span style="font-size:12.0pt">همانطور که از نامش پیداست <strong><span style="color:#000000">اینترنت اشیا </span></strong>ترکیب شده است از تکنولوژی سخت افزار، شبکه اینترنت و نرم افزارها. درباره اینکه هر یک از این بخش&zwnj;ها به چه صورتی در زمینه اینترنت اشیا مورد استفاده قرار می&zwnj;گیرند می&zwnj;توانید به ویدیو <a href="http://cgeeksc.ir/event/004">اینترنت اشیا </a>مراجعه نمایید. </span><span style="font-size:12.0pt"> حال در این مبحث قصد داریم به تشریح <strong>بخش شبکه&zwnj;های اینترنتی</strong> در اینترنت اشیا بپردازیم. در حال حاضر یکی از بهترین راه های مورد استفاده برای طراحی یک زیرساخت اینرنتی از طریق اینترنت، <strong>شبکه&zwnj;های </strong></span><strong><span dir="LTR" style="font-size:12.0pt">OFDM(Orthogonal Frequency Division Multiplexing)</span></strong><span style="font-size:12.0pt"> یا چند برابر سازی تقسیم فرکانس متعامد است.</span></span></span></p>\r\n\r\n<h1 dir="RTL" style="text-align:right"><span style="font-family:Vazir"><span style="font-size:11pt"><span style="font-size:12.0pt">توسعه </span><span dir="LTR" style="font-size:12.0pt">OFDM</span></span></span></h1>\r\n\r\n<p dir="RTL" style="text-align:right"><span style="font-family:Vazir"><span style="font-size:11pt"><span style="font-size:12.0pt">به طور کلی استفاده از </span><span dir="LTR" style="font-size:12.0pt">OFDM</span><span style="font-size:12.0pt"> و مدولاسیون چند حامل(multi carrier) به دلیل پیشرفت روز افزون اطلاعات و بالا رفتن حجم داده&zwnj;های انتقالی در چند دهه&zwnj;ی اخیر بسیار مورد توجه قرار گرفته است. به طور کلی مفهوم فناوری </span><span dir="LTR" style="font-size:12.0pt">OFDM</span><span style="font-size:12.0pt">&nbsp; در دهه 1960 تا 1970 در راستای تحقیق در مورد روش&zwnj;های کاهش تداخل بین کانال&zwnj;های </span><span dir="LTR" style="font-size:12.0pt">closely spaced</span><span style="font-size:12.0pt"> مورد بررسی قرار گرفت.</span></span></span></p>\r\n\r\n<p dir="RTL" style="text-align:right"><span style="font-family:Vazir"><span style="font-size:11pt"><span style="font-size:12.0pt">برخی از اولین سیستم</span><span dir="LTR" style="font-size:12.0pt">&zwnj;</span><span style="font-size:12.0pt">هایی که در ابتدای کار </span><span dir="LTR" style="font-size:12.0pt">OFDM</span><span style="font-size:12.0pt"> مورد استفاده قرار داده و صلاحیت آن را به تصویب رساندند پخش دیجیتالی بود که در طی آن </span><span dir="LTR" style="font-size:12.0pt">OFDM</span><span style="font-size:12.0pt"> توانست یک شکل بسیار مطمئن از انتقال داده را در انواع شرایط مسیر سیگنال فراهم کند؛ لذا همین امر منجر به استفاده از فناوری </span><span dir="LTR" style="font-size:12.0pt">OFDM</span><span style="font-size:12.0pt"> در تلویزیون&zwnj;های دیجیتالی گردید.</span></span></span></p>\r\n\r\n<blockquote>\r\n<p dir="RTL" style="text-align:right"><span style="font-family:Vazir"><span style="font-size:11pt"><span style="font-size:12.0pt">پس از آن با افزایش قدرت پردازش </span><span dir="LTR" style="font-size:12.0pt">OFDM</span><span style="font-size:12.0pt"> از آن در سیستم&zwnj;های ارتباطی موبایل </span><span dir="LTR" style="font-size:12.0pt">4G</span><span style="font-size:12.0pt"> و همچنین </span><span dir="LTR" style="font-size:12.0pt">Wi-Fi</span><span style="font-size:12.0pt"> مورد اتفاده قرار میگیرد. </span></span></span></p>\r\n</blockquote>\r\n\r\n<h1 dir="RTL" style="text-align:right"><span style="font-family:Vazir"><span style="font-size:11pt"><span dir="LTR" style="font-size:12.0pt">OFDM</span><span style="font-size:12.0pt"> چیست؟</span></span></span></h1>\r\n\r\n<p dir="RTL" style="text-align:right"><span style="font-family:Vazir"><span style="font-size:11pt">&nbsp;<span dir="LTR" style="font-size:12.0pt">OFDM</span><span style="font-size:12.0pt"> طرح مدلسازی محبوب است که به طور گسترده&zwnj;ای در سیستم&zwnj;های پهن باند بی&zwnj;سیم و مدولاسیون&zwnj;های چند حامل برای مقابله با محو شدن انتخاب فرکانس در کانال&zwnj;های بی&zwnj;سیم اتخاذ شده است. سیگنال </span><span dir="LTR" style="font-size:12.0pt">OFDM</span><span style="font-size:12.0pt"> از تعدادی حامل مدوله شده </span><span dir="LTR" style="font-size:12.0pt">closely spaced</span><span style="font-size:12.0pt"> تشکیل شده است. هنگامی که مدولاسیون به هر شکلی (</span><span dir="LTR" style="font-size:12.0pt">data, voice</span><span style="font-size:12.0pt">) بر روی حامل اعمال می&zwnj;شود، آنگاه باندهای جانبی به طرفین پخش می&zwnj;شوند. لازم است یک گیرنده بتواند کل سیگنال را دریافت کند تا بتواند با موفقیت داده&zwnj;ها را مدوله کند. در نتیجه هنگامی که سیگنال&zwnj;ها به یکدیگر نزدیک می&zwnj;شوند، باید با فاصله قرار گیرند تا گیرنده بتواند آنها را با استفاده از فیلتر جدا کند و باید بین آنها یک باند محافظ وجود داشته باشد. در مورد </span><span dir="LTR" style="font-size:12.0pt">OFDM</span><span style="font-size:12.0pt"> اینگونه نیست. اگرچه باندهای جانبی از هر حامل با هم همپوشانی دارند، باز هم می&zwnj;توان آنها را بدون هیچ گونه دخالت و انتظاری دریافت کرد. دانش </span><span dir="LTR" style="font-size:12.0pt">OFDM</span><span style="font-size:12.0pt"> قابلیت ترکین با علوم دیگر از جمله برنامه نویسی، هوش مصنوعی، علم داده و یادگیری عمیق میباشد که این عمل منجر به دقیق&zwnj;تر و سریع&zwnj;تر شدن نتایج حاصل از تخمین کانال می&zwnj;گردد. </span></span></span></p>\r\n\r\n<p dir="RTL" style="text-align:right">&nbsp;</p>\r\n\r\n<p dir="RTL" style="text-align:center"><span style="font-family:Vazir"><img alt="ofdm modulation" src="/media/uploads/2020/09/09/image.png" style="height:389px; width:517px" /></span></p>\r\n\r\n<p dir="RTL">&nbsp;</p>\r\n\r\n<h2 dir="RTL" style="text-align:right"><span style="font-family:Vazir"><span style="font-size:11pt"><span style="font-size:12.0pt">تخمین کانال در </span><span dir="LTR" style="font-size:12.0pt">OFDM</span></span></span></h2>\r\n\r\n<p dir="RTL" style="text-align:right"><span style="font-family:Vazir"><span style="font-size:11pt"><span style="font-size:12.0pt">با توجه به اینکه از فناوری </span><span dir="LTR" style="font-size:12.0pt">OFDM</span><span style="font-size:12.0pt"> در سیستم&zwnj;هایی با داده&zwnj;های بزرگ برای انتقال استفاده می&zwnj;گردد تخمین کانال مورد نیاز برای انتقال این داده&zwnj;ها امری حیاتی در سیستم قلمداد می&zwnj;شود. تخمین کانال و مدلسازی در شبکه&zwnj;های </span><span dir="LTR" style="font-size:12.0pt">OFDM</span><span style="font-size:12.0pt"> با استفاده از برنامه نویسی </span><span dir="LTR" style="font-size:12.0pt">MATLAB</span><span style="font-size:12.0pt"> و همچنین هوش مصنوعی، شبکه عصبی و یادگیری عمیق انجام پذیر می&zwnj;باشد. &nbsp;</span></span></span></p>\r\n\r\n<p dir="RTL" style="text-align:right">&nbsp;</p>\r\n\r\n<p dir="RTL" style="text-align:center"><span style="font-family:Vazir"><img alt="multiple signals" src="/media/uploads/2020/09/09/image_bWWKfzX.png" style="height:195px; width:454px" /></span></p>\r\n\r\n<p dir="RTL" style="text-align:center">&nbsp;</p>\r\n\r\n<h2 dir="RTL" style="text-align:right"><span style="font-family:Vazir"><span style="font-size:11pt"><span style="font-size:12.0pt">شبیه سازی</span><span dir="LTR" lang="FA" style="font-size:12.0pt">&lrm;</span><span style="font-size:12.0pt">&zwnj; </span><span dir="LTR" style="font-size:12.0pt">OFDM</span><span style="font-size:12.0pt"> در نرم افزار </span><span dir="LTR" style="font-size:12.0pt">MATLAB</span></span></span></h2>\r\n\r\n<p dir="RTL" style="text-align:right"><span style="font-family:Vazir"><span style="font-size:11pt"><span style="font-size:12.0pt">به طور کلی نرم افزار </span><span dir="LTR" style="font-size:12.0pt">MATLAB</span><span style="font-size:12.0pt"> با زبانی بسیار ساده و ابزارهای متعدد نرم افزاری مناسب برای انجام اعمال محاسباتی و شبیه سازی مبیاشد که در بررسی و تحلیل سیستم&zwnj;ها از هر نوعی(سخت افزاری و نرم افزاری) مورد استفاده قرار می&zwnj;گیرند. برای شبیه سازی هر سیستمی به <strong>الگوریتم&zwnj;ها </strong>و <strong>مولفه&zwnj;های </strong>خاصی نیاز داریم که در اینجا تعدادی از مولفه&zwnj;های مربوط به شبیه سازی یک سیستم </span><span dir="LTR" style="font-size:12.0pt">OFDM</span><span style="font-size:12.0pt"> اشاره مینماییم.</span></span></span></p>\r\n\r\n<ul>\r\n\t<li style="text-align:right"><span style="font-family:Vazir"><span style="font-size:11pt"><span style="font-size:12.0pt"><strong>فرستنده:</strong> هر </span><span dir="LTR" style="font-size:12.0pt">OFDM Transmiter</span><span style="font-size:12.0pt"> به صورت یک سیگنال </span><span dir="LTR" style="font-size:12.0pt">OFDM</span><span style="font-size:12.0pt"> استاندارد با بار </span><span dir="LTR" style="font-size:12.0pt">ASCII</span><span style="font-size:12.0pt"> تولید می&zwnj;کند. و شاتمل فریم&zwnj;ها و نمادهای داده&zwnj;ای </span><span dir="LTR" style="font-size:12.0pt">OFDM</span><span style="font-size:12.0pt"> میباشد.</span></span></span></li>\r\n\t<li style="text-align:right"><span style="font-family:Vazir"><span style="font-size:11pt"><span style="font-size:12.0pt"><strong>کانال:</strong> این مولفه تاثیرات انتقال داده بر روی میحط انتقال هوا را مود بررسی قرار می&zwnj;دهد؛ و همچنین تاخیر سیگنال ارسال شده با احتساب&nbsp; مقدار فاز و دامنهسیگنال و نویز موجود در محیط را شامل می&zwnj;گردد.</span></span></span></li>\r\n\t<li style="text-align:right"><span style="font-family:Vazir"><span style="font-size:11pt"><span style="font-size:12.0pt"><strong>گیرنده:</strong> این مولفه پیام ارسال شده را طی چند مرحله عملیات بازیابی می&zwnj;کند:</span></span></span></li>\r\n</ul>\r\n\r\n<p dir="RTL" style="margin-right:24px; text-align:right"><span style="font-family:Vazir"><span style="font-size:11pt"><span dir="LTR" style="font-size:12.0pt">Timing Recovery</span></span></span></p>\r\n\r\n<p dir="RTL" style="margin-right:24px; text-align:right"><span style="font-family:Vazir"><span style="font-size:11pt"><span dir="LTR" style="font-size:12.0pt">Carrier Frequency Recovery</span></span></span></p>\r\n\r\n<p dir="RTL" style="margin-right:24px; text-align:right"><span style="font-family:Vazir"><span style="font-size:11pt"><span dir="LTR" style="font-size:12.0pt">Frequency Domain Equalization</span></span></span></p>\r\n\r\n<p dir="RTL" style="margin-right:24px; text-align:right"><span style="font-family:Vazir"><span style="font-size:11pt"><span dir="LTR" style="font-size:12.0pt">Data Decoder</span></span></span></p>\r\n\r\n<p dir="RTL" style="margin-right:24px; text-align:center"><span style="font-family:Vazir"><img src="/media/uploads/2020/09/09/image_NUyga3n.png" style="height:325px; width:541px" /></span></p>\r\n\r\n<p dir="RTL" style="margin-right:24px; text-align:center">&nbsp;</p>\r\n\r\n<ul dir="rtl">\r\n\t<li style="text-align:right"><strong><span style="font-family:Vazir"><span style="font-size:11pt"><span style="font-size:12.0pt">نمایشگر پیام بازیابی شده:</span></span></span></strong><span style="font-family:Vazir"><span style="font-size:11pt"><span style="font-size:12.0pt"> پیام بازیابی شده در گیرنده برای هر فریم شناسایی شده نمایش داده می&zwnj;شود. از آنجا که طول پیام اصلی به گیرنده ارسال نمی&zwnj;شود، بیت&zwnj;های خالی شده در هر فریم نیز به کاراکترها بازیابی می&zwnj;شوند و نمایش داده می&zwnj;شوند. بنابراین ممکن است در انتهای هر پیام بازیابی، حداکثر 7 کاراکتر بی معنی را ببینید.</span></span></span></li>\r\n\t<li style="text-align:right"><strong><span style="font-family:Vazir"><span style="font-size:11pt"><span style="font-size:12.0pt">دامنه&zwnj;ها</span></span></span></strong></li>\r\n</ul>\r\n\r\n<h2 dir="RTL" style="text-align:right"><span style="font-family:Vazir"><span style="font-size:11pt"><span style="font-size:12.0pt">داده در </span><span dir="LTR" style="font-size:12.0pt">OFDM</span></span></span></h2>\r\n\r\n<p dir="RTL" style="text-align:right"><span style="font-family:Vazir"><span style="font-size:11pt"><span style="font-size:12.0pt">قالب سنتی ارسال داده از طریق کانال رادیویی و به صورت سری یعنی یک بیت پس از دیگری است. پروسه انتقال به یک کانال واحد متکی است و هرگونه دخالت در &nbsp;فرکانس تنها می&zwnj;تواند کل انتقال را مختل کند. </span><span dir="LTR" style="font-size:12.0pt">OFDM</span><span style="font-size:12.0pt"> رویکرد متفاوتی را اتخاذ می&zwnj;کند. داده&zwnj;ها به موازات حامل&zwnj;های مختلف در سیگنال </span><span dir="LTR" style="font-size:12.0pt">OFDM</span><span style="font-size:12.0pt"> کلی منتقل می&zwnj;شوند. تقسیم شدن به تعدادی از <strong>&quot;</strong></span><strong><span dir="LTR" style="font-size:12.0pt">substream</span></strong><span style="font-size:12.0pt"><strong>&quot;</strong> های موازی، میزان کلی داده&zwnj;ها از جریان اصلی است، اما میزان هرکدام از زیر پست&zwnj;ها بسیار پایین&zwnj;تر است، و نمادها با گذشت زمان از هم جدا می&zwnj;شوند. </span></span></span></p>\r\n\r\n<p dir="RTL" style="text-align:right"><span style="font-family:Vazir"><span style="font-size:11pt"><span style="font-size:12.0pt">این تداخل در نمادها را کاهش می&zwnj;دهد و در عین حفظ توان یکسانی، دریافت دقیق هر نماد را آسان&zwnj;تر می&zwnj;کند. این کار تضمین می&zwnj;کند که داده&zwnj;ها فقط هنگامی ثابت می&zwnj;شوند که سیگنال پایدار باشد و هیچ سیگنال تاخیری جدید وارد نشود که باعث تغییر زمان و مرحله سیگنال می&zwnj;شود. این امر می&zwnj;تواند به مراتب مؤثرتر در یک جریان فرعی سرعت داده کم انجام شود.</span></span></span></p>\r\n\r\n<h2 dir="RTL" style="text-align:right"><span style="font-family:Vazir"><span style="font-size:11pt"><span style="font-size:12.0pt">مزایای&nbsp; </span><span dir="LTR" style="font-size:12.0pt">OFDM</span></span></span></h2>\r\n\r\n<p dir="RTL" style="text-align:right"><span style="font-family:Vazir"><span style="font-size:11pt"><span style="font-size:12.0pt">مصونیت از محو شدن انتخابی: به این معنی که در برابر محو شدن انتخابی فرکانس نسبت به سیستمهای حامل منفرد مقاوم&zwnj;تر است زیرا کانال کلی را به چندین سیگنال باریک تقسیم می&zwnj;کند که به صورت جداگانه تحت کانال&zwnj;های فرعی قرار می&zwnj;گیرند.</span></span></span></p>\r\n\r\n<p dir="RTL" style="text-align:right"><span style="font-family:Vazir"><span style="font-size:11pt"><span style="font-size:12.0pt"><strong>یکسان سازی کانال ساده&zwnj;تر:</strong> تفاوت </span><span dir="LTR" style="font-size:12.0pt">OFDM</span><span style="font-size:12.0pt"> نسبت به سیستم&zwnj;های قدیمی این است که با استفاده از چند کانال فرعی، تسویه کانال بسیار ساده&zwnj;تر می&zwnj;شود.</span></span></span></p>\r\n\r\n<p dir="RTL" style="text-align:right"><span style="font-family:Vazir"><span style="font-size:11pt"><span style="font-size:12.0pt"><strong>مقاومت در برابر دخالت:</strong> زیرا تداخل ظاهر شده در کانال ممکن است محدود به پهنای باند باشد و از این طریق بر تمام کانال&zwnj;های فرعی تأثیر نگذارد. این بدان معنی است که تمام داده</span><span dir="LTR" lang="FA" style="font-size:12.0pt">&lrm;</span><span style="font-size:12.0pt">&zwnj;ها از بین نمی&zwnj;روند.</span></span></span></p>\r\n\r\n<p dir="RTL" style="text-align:right">&nbsp;</p>\r\n\r\n<p dir="RTL" style="text-align:center"><span style="font-family:Vazir"><img src="/media/uploads/2020/09/09/image_tdJkpZJ.png" style="height:278px; width:519px" /></span></p>\r\n\r\n<p dir="RTL" style="text-align:center">&nbsp;</p>	2020-08-19	images/posts/post-siteOFDM1.jpg	OFDM-Introduction	published	4	\N		\N	3	برای تخمین کانال و بررسی کانال مورد نیاز برای طراحی یک سیستم مانند تخمین کانال شبکه‌های تعبیه شده در اینترنت اشیا از روشی به اسم مدولاسیون OFDM استفاده میکنیم.\r\nدر این مقاله به شرحی درباره مدولاسیون OFDM خواهیم پرداخت.	\N	\N	\N
13	بازی روی لینوکس؛ نکاتی برای لینوکس گیمرها	<p dir="rtl">این روزها بازی&zwnj;های ویدیویی یکی از سرگرمی&zwnj;های رایج به حساب می&zwnj;آیند و کاربران زیادی هستند که از کامپیوترهای شخصی خود برای بازی کردن استفاده می&zwnj;کنند. یکی از مشکلات و سوالات پر تکرار کاربران تازه وارد و یا کاربرانی که قصد مهاجرت به دنیای <a href="http://cgeeksc.ir/event/002">گنو/لینوکس</a> را دارند همین است. <strong>آیا می&zwnj;توان روی لینوکس بازی کرد؟</strong></p>\r\n\r\n<p dir="rtl">در این مطلب از وبسایت جامعه گیک&zwnj;های کامیپوتر قصد پاسخ به سوالاتی از همین قبیل را داریم و ابزارهایی که به شما کمک می&zwnj;کنند تا بتوانید در سیستم عامل گنو/لینوکسی خود بازی کنید را معرفی خواهیم کرد.</p>\r\n\r\n<p dir="rtl">اگر اهل بازی کردن و در عین حال از علاقه مندان به لینوکس هستید این مطلب مخصوص شماست. پس در ادامه با ما همراه باشید.</p>\r\n\r\n<p dir="rtl" style="text-align:center"><img alt="بازی کردن در لینوکس" src="/media/uploads/2020/09/12/best-linux-distros-for-gaming.jpg" style="height:506px; width:900px" /></p>\r\n\r\n<p dir="rtl">ابتدا بگذارید این مقاله را به دو بخش تقسیم کنیم:&zwnj;</p>\r\n\r\n<ol dir="rtl">\r\n\t<li>بازی&zwnj;هایی که به صورت رسمی نسخه&zwnj;ای برای لینوکس دارند.</li>\r\n\t<li>بازی&zwnj;هایی که نسخه&zwnj;ای برای لینوکس ندارند اما از طریق ابزارهایی می&zwnj;توان آن&zwnj;ها را اجرا کرد.</li>\r\n</ol>\r\n\r\n<h2 dir="rtl">بازی&zwnj;های لینوکسی</h2>\r\n\r\n<p dir="rtl">توزیع&zwnj;هایی که از گنو/لینوکس به عنوان هسته اصلی خود استفاده می&zwnj;کنند کم نیستند. تعداد کاربران سیستم عامل&zwnj;های گنو/لینوکسی هم کم نیست و هر روز افراد بیشتری به سمت این سیستم عامل&zwnj;ها می&zwnj;آیند. اما اگر واقع بین باشیم درصد بسیار پایینی از کاربران گنو/لینوکس به طور جدی اهل بازی کردن یا به اصطلاح گیمر هستند. همین مسئله باعث شده بازار بازی&zwnj;های ویدیویی روی لینوکس چندان داغ و سودآور نباشد و به خاطر مسائلی از این قبیل و به صرفه نبودن، بسیاری از شرکت&zwnj;های بزرگ از ورود به این بازار خودداری کنند.</p>\r\n\r\n<blockquote>\r\n<p dir="rtl"><a href="http://cgeeksc.ir/post/arch-vs-debian">مقایسه&zwnj;ی آرچ و دبیان</a></p>\r\n</blockquote>\r\n\r\n<p dir="rtl">اما در عین حال بسیاری از شرکت&zwnj;ها و بازی&zwnj;سازان مستقل، بازی&zwnj;های خود را برای لینوکس هم منتشر کردند که در صدر آن&zwnj;ها می&zwnj;توان به شرکت <strong>Valve</strong> که بازی&zwnj;هایی نظر <strong>CS:GO</strong> را روانه بازار کرده اشاره کرد. اما این بازی&zwnj;ها در کجا در دسترس هستند؟</p>\r\n\r\n<p dir="rtl" style="text-align:center"><img alt="بازی روی لینوکس" src="/media/uploads/2020/09/12/tux-gaming-linux.jpg" style="height:449px; width:800px" /></p>\r\n\r\n<h3 dir="rtl">استیم: دهکده بازی&zwnj;های کامپیوتری</h3>\r\n\r\n<p dir="rtl"><a href="https://store.steampowered.com/"><strong>استیم (Steam)</strong></a> را می&zwnj;توان بزرگترین مرجع بازی&zwnj;های کامپیوتری دانست. این پلتفرم که توسط شرکت Valve توسعه داده شده چند سالی است به صورت جدی به دنبال فتح بازار بازی&zwnj;های سیستم عامل&zwnj;های لینوکسی است و می&zwnj;توان گفت موفق بوده.</p>\r\n\r\n<p dir="rtl">شما به سادگی می&zwnj;توانید در این فروشگاه به بخش مربوط به سیستم عامل لینوکس مراجعه کنید و بازی&zwnj;هایی که نسخه لینوکس دارند پیدا کنید و به سادگی یک کلیک آن&zwnj;ها را دانلود و روی سیستم خود اجرا کنید.</p>\r\n\r\n<blockquote>\r\n<p dir="rtl"><a href="http://cgeeksc.ir/post/look-at-Manjaro">نگاهی به توزیع مانجارو (Manjaro)</a></p>\r\n</blockquote>\r\n\r\n<p dir="rtl">علاوه بر استیم سایت&zwnj;ها و پلتفرم&zwnj;های دیگری هم هستند که می توانید از آن&zwnj;ها برای یافتن بازی&zwnj;های مورد علاقه خود استفاده کنید. از جمله این پلتفرم&zwnj;ها می&zwnj;توان به <a href="http://itch.io/">itch.io</a> و <a href="https://www.gog.com/">GOG</a> اشاره کرد. اما پیشنهاد من برای پیدا کردن بازی برای لینوکس استفاده از فروشگاه استیم است.</p>\r\n\r\n<p dir="rtl">علاوه بر پلتفرم&zwnj;های مخصوص بازی، مخازن توزیع&zwnj;های لینوکس هم حاوی بازی&zwnj;هایی هستند. گرچه بازی&zwnj;های موجود در مخازن چندان مطرح و با کیفیت نیستند اما بد نیست به آن&zwnj;ها هم سری بزنید.</p>\r\n\r\n<p dir="rtl" style="text-align:center"><img alt="بازی برای لینوکس" src="/media/uploads/2020/09/12/13572-cover-image-steam-croses-245-million-users.jpg" style="height:630px; width:1200px" /></p>\r\n\r\n<h2 dir="rtl">اجرای بازی&zwnj;های ویندوز روی لینوکس</h2>\r\n\r\n<p dir="rtl">با اینکه بازی&zwnj;های با کیفیت و محبوبی مثل <strong>Tomb Raider</strong> را می&zwnj;توان روی استیم پیدا کرد اما بسیاری از بازی&zwnj;های بزرگ و محبوب و جدید که شاید کاربران شیفته آن&zwnj;ها باشند نسخه&zwnj;ای برای لینوکس ندارند.</p>\r\n\r\n<p dir="rtl">اینجاست که پای ابزارهایی به میان می&zwnj;آید که امکان اجرای بازی&zwnj;های ویندوز را برای شما فراهم می&zwnj;کنند. در ادامه برخی از این ابزارها را معرفی خواهیم کرد.</p>\r\n\r\n<h3 dir="rtl">با Wine فایل&zwnj;های exe رو قورت بده</h3>\r\n\r\n<p dir="rtl"><strong>Wine</strong> یکی از مطرح&zwnj;ترین و قدرتمندترین ابزارهای لینوکسی است که به شما امکان اجرای انواع فایل&zwnj;های exe را می&zwnj;دهد و شما با استفاده از Wine می&zwnj;توانید نرم افزارها و بازی&zwnj;های ویندوزی را به سادگی روی سیستم خود نصب و اجرا کنید.</p>\r\n\r\n<p dir="rtl">البته بعضی نرم افزارها و بازی&zwnj;ها را نمی&zwnj;توان با Wine اجرا کرد و یا به بهترین شکل اجرا نمی&zwnj;شوند. دیتابیس بزرگ Wine به شما کمک می&zwnj;کند که بدانید نرم افزار یا بازی مورد نظر شما به خوبی با Wine سازگار هست و اجرا می&zwnj;شود یا نه. از <a href="https://www.winehq.org/">اینجا</a> می&zwnj;توانید به این دیتابیس دسترسی داشته باشید و نرم افزار یا بازی مورد نظر خود را جستجو کنید.</p>\r\n\r\n<p dir="rtl" style="text-align:center"><img alt="نصب Wine روی لینوکس" src="/media/uploads/2020/09/12/features_600_224_winehq.jpg" style="height:224px; width:600px" /></p>\r\n\r\n<p dir="rtl"><span style="font-family:&quot;Liberation Serif&quot;,serif"><strong>Lutris Gaming</strong> <span style="font-family:Droid Sans Devanagari">یکی دیگر از ابزارهای لینوکسی است که به شما امکان اجرای بازی&zwnj;های ویندوزی را می&zwnj;دهد</span>. <span style="font-family:Droid Sans Devanagari">در </span>Lutris Gaming <span style="font-family:Droid Sans Devanagari">شما می&zwnj;توانید به بازی&zwnj;های زیادی از منابع مختلفی مثل فروشگاه&zwnj;های </span>Epic Games<span style="font-family:Droid Sans Devanagari">، </span>Uplay <span style="font-family:Droid Sans Devanagari">و</span>.. <span style="font-family:Droid Sans Devanagari">دسترسی داشته باشید و با بازی&zwnj;های این فروشگاه&zwnj;ها سرگرم شوید</span>. Lutris Gaming <span style="font-family:Droid Sans Devanagari">انتخاب بسیاری از کاربران است و بد نیست که سری به بازی&zwnj;های جذاب این ابزار لینوکسی بزنید</span>.</span></p>\r\n\r\n<p dir="rtl"><span style="font-family:Droid Sans Devanagari">دیگر ابزار مطرح که به شما امکان اجرای بازی&zwnj;های ویندوز روی لینوکس را می&zwnj;دهد </span><strong>Phoenicis PlayOnLinux</strong> <span style="font-family:Droid Sans Devanagari">است</span>. Phoenicis PlayOnLinux <span style="font-family:Droid Sans Devanagari">بر پایه </span>Wine <span style="font-family:Droid Sans Devanagari">است اما ظاهر و رابط کاربری ساده&zwnj;تر و زیباتری داشته و کار کردن با </span>Wine <span style="font-family:Droid Sans Devanagari">را برایتان بسیار ساده&zwnj;تر می&zwnj;کند</span>.</p>\r\n\r\n<p dir="rtl" style="text-align:center"><img alt="لینوکس گیمر" src="/media/uploads/2020/09/12/playonlinuxlogo.png" style="height:155px; width:480px" /></p>\r\n\r\n<h4 dir="rtl">در انتظار انقلاب بزرگ</h4>\r\n\r\n<p dir="rtl"><span style="font-family:Droid Sans Devanagari">همان طور که پیش از این&nbsp;گفته شد شرکت </span>Valve <span style="font-family:Droid Sans Devanagari">سرمایه گذاری&zwnj;های بسیاری برای در دست گرفتن بازار بازی&zwnj;های ویدیویی در سیستم عامل لینوکس کرده است</span>. <span style="font-family:Droid Sans Devanagari">این شرکت بازی&zwnj;های ساخته خود که عموما عنوان&zwnj;های بزرگ و موفقی هستند را همراه با نسخه لینوکسی به بازار عرضه کرده و جدای از آن در سال&zwnj;های اخیر دست به توسعه سیستم عاملی با نام </span><strong>SteamOS</strong> <span style="font-family:Droid Sans Devanagari">که یک سیستم عامل گنو</span>/<span style="font-family:Droid Sans Devanagari">لینوکسی است زده است که مژده ورود بیشتر بازی&zwnj;ها به دنیای لینوکس را به کاربران می&zwnj;دهد</span>.</p>\r\n\r\n<p dir="rtl"><span style="font-family:Droid Sans Devanagari">علاوه بر آن ابزاری قدرتمند و کارآمد به نام </span><strong>Proton</strong> <span style="font-family:Droid Sans Devanagari">را به فروشگاه استیم اضافه کرده است</span>. Proton <span style="font-family:Droid Sans Devanagari">هم مانند </span>PlayOnLinux <span style="font-family:Droid Sans Devanagari">بر پایه </span>Wine <span style="font-family:Droid Sans Devanagari">توسعه داده شده و شما با استفاده از این ابزار می&zwnj;توانید بازی&zwnj;های ویندوزی موجود در استیم را به سادگی یک کلیک دانلود و روی سیستم خود نصب کنید</span>.</p>\r\n\r\n<p dir="rtl"><span style="font-family:Droid Sans Devanagari">برای استفاده از </span>Proton <span style="font-family:Droid Sans Devanagari">شما نیاز به نصب و هیچ عمل پیچیده&zwnj;ای ندارید و با نصب استیم روی سیستم خود می&zwnj;توانید از </span>Proton <span style="font-family:Droid Sans Devanagari">استفاده کنید و تنها کاری که لازم است انجام دهید فعال کردن این ابزار در استیم است</span>. Proton یکی از بهترین گزینه&zwnj;ها برای افرادی است که قصد بازی کردن در لینوکس را دارند.</p>\r\n\r\n<p dir="rtl">Proton هم مانند Wine دیتابیس مخصوص به خود را دارد که می&zwnj;توانید از <a href="https://www.protondb.com/">اینجا</a> به آن دسترسی داشته باشید.</p>\r\n\r\n<p dir="rtl" style="text-align:center"><img alt="گیمر لینوکس" src="/media/uploads/2020/09/12/steammm.png" style="height:528px; width:1476px" /></p>\r\n\r\n<p dir="rtl">این مقاله تمام آن چیزی است که برای تبدیل شدن به یک گیمر لینوکسی لازم است بدانید. شاید حتی با استفاده از ابزارهای معرفی شده نتوانید بسیاری از بازی&zwnj;های بزرگ و AAA را روی لینوکس به خوبی تجربه کنید اما با متولد شدن این ابزارها و تلاش&zwnj;هایی که انجام شده دست شما برای بازی کردن در لینوکس چندان هم بسته نیست و قطعا رفته رفته بازی کردن در لینوکس آسان&zwnj;تر و بهتر خواهد شد.</p>\r\n\r\n<p dir="rtl"><span style="font-family:Droid Sans Devanagari">در پایان انتخاب با شماست و اگر دیوانه وار عاشق بازی کردن هستید و اولویت برایتان بازی کردن است شاید بهتر باشد از ویندوز استفاده کنید</span>. <span style="font-family:Droid Sans Devanagari">اما اگر کمی توقع خودتان را پایین بیاورید <a href="http://cgeeksc.ir/event/001">دنیای آزاد</a> و گنو</span>/<span style="font-family:Droid Sans Devanagari">لینوکس دوست داشتنی و قدرتمند با آغوش باز از شما استقبال خواهند کرد</span>.</p>	2020-09-12	images/posts/post-site-gamingpnlinux.png	gaming-on-linux	published	2	\N		\N	10	بازی کردن یکی از تفریح‌های جذاب این روزهاست و بسیاری از کاربران به دنبال راهی برای بازی کردن در لینوکس میگردند. در این مطلب از جامعه گیک‌های کامپیوتر راه‌هایی برای بازی کردن در لینوکس را معرفی خواهیم کرد.	\N	2020-09-12 14:30:00+00	بازی لینوکس
17	سئو (SEO) چیست و چرا به آن نیاز داریم	<p>اگر علاقه مند به دنیای وب و به تازگی شروع به طراحی سایت کرده باشید یا قصد دارید کسب و کار اینترنتی و سایت خودتان را راه بیندازید حتما بارها و بارها در مورد سئو (SEO) شنیده&zwnj;اید. مهم نیست سایت شما محتوا محور باشد و یا فروشگاه اینترنتی راه انداخته باشید؛ در هر صورت شما نیاز به سئو (SEO) خواهید داشت.</p>\r\n\r\n<p>اما این سئو چیست و چرا تا این حد روی آن تاکید وجود دارد و اصلا چه کاربردی برای ما و فعالیتمان خواهد داشت؟ این&zwnj;ها سوالاتی هستند که برای همه افرادی که تازه قصد شروع دارند وجود دارند و من در این ویدیو به آن&zwnj;ها پاسخ خواهم داد.</p>\r\n\r\n<p style="text-align:center"><img alt="سئو" src="/media/uploads/2020/09/21/seo-youtube.png" style="height:625px; width:1241px" /></p>\r\n\r\n<p>در این ویدیو سعی شده به زبانی ساده و روان و همراه با مثال&zwnj;هایی ساده و کاربردی مفهوم سئو مطرح شود. علاوه بر سئو (SEO)، در این ویدیو به نکات دیگری هم خواهم پرداخت و از اهمیت تولید محتوای ارزشمند خواهم گفت.</p>\r\n\r\n<p>اگر صاحب کسب و کار اینترنتی&zwnj;ای هستید و یا قصد دارید وارد دنیای وب شوید و اطلاعات بیشتری در این حوزه داشته باشید پیشنهاد می&zwnj;کنم این ویدیو را از دست ندهید.</p>	2020-09-21	images/posts/post-site-seo.png	what-is-seo	published	2	\N		https://youtu.be/TMOQXdAOfgU	5	در این ویدیو به بیان مفهوم سئو (SEO) خواهیم پرداخت و با مثال‌هایی ساده چیستی سئو (SEO) را بررسی خواهیم کرد. همچنین نکات مفیدی برای تولید محتوای موثر در این ویدیو ذکر شده‌اند.	\N	2020-09-21 15:30:00+00	سئو چیست
23	Virtualenv یا محیط‌های ایزوله و کاربردهای آن در پایتون	<p>پایتون یکی از کاربردی&zwnj;ترین و محبوب&zwnj;ترین زبان&zwnj;های برنامه نویسی است. یکی از ابزارهای حیاتی در برنامه نویسی پایتون که هر برنامه نویس پایتونی باید از آن استفاده کند و استفاده&zwnj;های زیادی در توسعه پروژه&zwnj;های پایتونی دارد <strong>Virtualenv</strong> یا <strong>محیط&zwnj;های ایزوله و مجازی</strong> است.</p>\r\n\r\n<p>این ابزار به شما کمک می&zwnj;کند محیطی جدا و تفکیک شده از پایتون اصلی نصب شده روی سیستم عامل داشته باشید و بتوانید برای هر پروژه خود از نسخه&zwnj;های دلخواه پایتون، فریمورک&zwnj;ها و پکیج&zwnj;ها استفاده کنید. این محیط&zwnj;ها در واقع یک محیط پایتونی مستقل خواهند بود.</p>\r\n\r\n<blockquote>\r\n<p><a href="http://cgeeksc.ir/post/bubble-sort-in-python">الگوریتم Bubble Sort با پایتون</a></p>\r\n</blockquote>\r\n\r\n<p>در این ویدیو نحوه نصب و چگونگی کار Virtualenv یا محیط&zwnj;های ایزوله و مجازی در پایتون را یاد خواهیم گرفت و بیشتر با این ابزار کاربردی آشنا خواهیم شد. اگر علاقه مند به برنامه نویسی پایتون هستید این ویدیو را از دست ندهید.</p>	2020-10-05	images/posts/post-site-virtualenv.png	virtualenv-python	published	2	\N		https://youtu.be/5D2Vxdm1VcY	1	در این ویدیو با نصب و چگونگی کار Virtualenv یا محیط‌های ایزوله و مجازی در پایتون آشنا خواهیم شد. این ابزار در پایتون ابزاری کاربردی و بسیار مهم است.	\N	2020-10-05 15:30:00+00	Virtualenv یا محیط‌های ایزوله و مجازی در پایتون
30	الگوریتم Selection Sort با پایتون	<p>قبول دارید که نظم و ترتیب به انجام کارها سرعت می&zwnj;بخشد؟</p>\r\n\r\n<p>برای مثال اگر بخواهید دنبال چیزی بگردید، بدون شک&nbsp;پیدا کردن آن در یک فضای مرتب شده بسیار راحت&zwnj;تر از فضایی شلوغ است، چرا که الگوریتمی که برای پیدا کردنش در یک فضای شلوغ باید بکار بگیرید پیچیده&zwnj;تر از الگوریتمی است که در یک &quot;فضای مرتب شده&quot; بکار خواهید&nbsp;گرفت.</p>\r\n\r\n<p>الگوریتم&zwnj;های بسیاری برای مرتب&zwnj;سازی کردن وجود دارند مثل <strong>Bubble sort</strong>، <strong>Selection sort</strong>، <strong>Quick sort</strong> و...</p>\r\n\r\n<blockquote>\r\n<p><a href="http://cgeeksc.ir/post/bubble-sort-in-python">الگوریتم Bubble Sort با پایتون</a></p>\r\n</blockquote>\r\n\r\n<p>این بار، در این ویدیو&nbsp;به&zwnj;سراغ&nbsp;الگوریتم&nbsp;<strong>Selection&nbsp;Sort</strong>&nbsp;یا همان مرتب&zwnj;سازی انتخابی رفته&zwnj;ایم و پس از بررسی آن، به پیاده&zwnj;سازی آن&nbsp;به زبان پایتون پرداخته&zwnj;ایم.</p>\r\n\r\n<p style="text-align:center"><img alt="گیف مرتب‌سازی انتخابی" src="/media/uploads/2020/10/29/selection-sort-gif.gif" style="height:285px; width:399px" /></p>\r\n\r\n<p>&nbsp;</p>	2020-10-29	images/posts/selectionSite.png	selection-sort-in-python	published	3	\N		https://www.youtube.com/watch?v=rx6U47aDY8I	1	در این ویدیو به بررسی یکی از الگوریتم‌های مرتب‌سازی معروف به نام Selection Sort می‌پردازیم و آن را به زبان برنامه‌نویسی پایتون پیاده‌سازی می‌کنیم.	\N	2020-10-29 15:31:00+00	مرتب‌سازی انتخابی
15	یادگیری تقویتی چیست؟	<p dir="rtl" style="text-align:right"><span style="font-family:Arial"><span style="color:#000000">احتمال خیلی زیاد Machine Learning و یا &quot;یادگیری ماشین&quot; به گوشتان خورده است، اما آیا می&zwnj;دانید چیست و چند دسته دارد؟</span></span></p>\r\n\r\n<p dir="rtl" style="text-align:right"><span style="font-family:Arial"><span style="color:#000000">یادگیری ماشین همانطور که از نامش هم برمی&zwnj;آید درصدد این است که کاری کند که بدون نیاز به برنامه&zwnj;نویسی صریح، توانایی یادگیری را به سیستم ببخشید.</span></span></p>\r\n\r\n<p dir="rtl" style="text-align:right"><span style="font-family:Arial"><span style="color:#000000">یادگیری ماشین ۳ دسته&zwnj;ی اصلی دارد:</span></span></p>\r\n\r\n<ol dir="rtl">\r\n\t<li style="text-align:right"><span style="font-family:Arial"><span style="color:#000000">یادگیری با ناظر (Supervised Learning)&nbsp;</span></span></li>\r\n\t<li style="text-align:right"><span style="font-family:Arial"><span style="color:#000000">یادگیری بدون ناظر (Unsupervised Learning)</span></span></li>\r\n\t<li style="text-align:right"><span style="font-family:Arial"><span style="color:#000000">یادگیری تقویتی (Reinforcement Learning)</span></span></li>\r\n</ol>\r\n\r\n<p dir="rtl" style="text-align:right"><span style="font-family:Arial"><span style="color:#000000">در این مطلب از جامعه&zwnj;ی گیک&zwnj;های کامپیوتر قرار است به سومین دسته از این شاخه&zwnj;ی جذاب کامپیوتر بپردازیم. با ما همراه باشید.</span></span></p>\r\n\r\n<p dir="rtl" style="text-align:center"><span style="font-family:Arial"><span style="color:#000000"><img alt="ماشین لرنینگ" src="/media/uploads/2020/09/16/ml.jpg" style="height:350px; width:700px" /></span></span></p>\r\n\r\n<p dir="rtl" style="text-align:right"><span style="font-family:Arial"><span style="color:#000000">امروزه یادگیری تقویتی یکی از داغ&zwnj;ترین عناوین تحقیقاتی می&zwnj;باشد و محبوبیت آن روز به&zwnj; روز رو به افزایش است.در این مقاله قرار است به یک&zwnj;سری سوال در مورد یادگیری تقویتی&nbsp;پاسخ دهیم.</span></span></p>\r\n\r\n<h2 dir="rtl" style="text-align:right"><span style="font-size:22px"><strong><span style="font-family:Arial"><span style="color:#000000">1. یادگیری تقویتی چیست؟</span></span></strong></span></h2>\r\n\r\n<p dir="rtl" style="text-align:right"><span style="font-family:Arial"><span style="color:#000000"><strong>&nbsp;یادگیری تقویتی</strong> و یا <strong>Reinforcement Learning</strong> و به اختصار <strong>RL</strong> یکی از انواع تکنیک&zwnj;های ماشین لرنینگ می&zwnj;باشد که یک <strong>عامل</strong> (<strong>Agent</strong>) توانایی این را دارد که در یک محیط تعاملی&nbsp;به کمک بازخوردی که از رفتارهایش دریافت می&zwnj;کند و همچنین تجاربی که کسب می&zwnj;کند یاد بگیرد و دانش خود را بهبود ببخشد.</span></span></p>\r\n\r\n<p dir="rtl" style="text-align:right"><span style="font-family:Arial"><span style="color:#000000">بیایید برای ملموس&zwnj;تر شدن داستان برایتان مثالی بزنم.</span></span></p>\r\n\r\n<p dir="rtl" style="text-align:right"><span style="font-family:Arial"><span style="color:#000000">کودکی&nbsp;را در نظر بگیرید. تصور کنید در اتاقی نشسته است و چیزهایی را در اطراف خود می&zwnj;بیند که&nbsp;درکی از آنها ندارد. این کودک چطور بعد از مدتی می&zwnj;تواند بقدری هوشمند عمل کند که برای مثال از وسایل تیز و برنده موجود در اتاق دوری کند و متوجه این مسئله بشود که این اجسام می&zwnj;توانند برایش خطرآفرین باشند؟</span></span></p>\r\n\r\n<p dir="rtl" style="text-align:right"><span style="font-family:Arial"><span style="color:#000000">پاسخ کاملا مشخص است! تجربه!</span></span></p>\r\n\r\n<p dir="rtl" style="text-align:right"><span style="font-family:Arial"><span style="color:#000000">کودکان همگی کنجکاو هستند و همین حس کنجکاوی پلی می&zwnj;شود بسوی جایی که مقصدش کشف و تجربه&zwnj;ی چیزهای مختلف است.</span></span></p>\r\n\r\n<p dir="rtl" style="text-align:center"><img alt="یادگیری تقویتی و انسان" src="/media/uploads/2020/09/16/baby_flKOl81.jpg" style="height:467px; width:700px" /></p>\r\n\r\n<p dir="rtl" style="text-align:right"><span style="font-family:Arial"><span style="color:#000000">اما این تجارب عموما دو دسته هستند:</span></span></p>\r\n\r\n<ol dir="rtl">\r\n\t<li style="text-align:right"><span style="font-family:Arial"><span style="color:#000000">تجارب خوب و بدون خطر</span></span></li>\r\n\t<li style="text-align:right"><span style="font-family:Arial"><span style="color:#000000">&nbsp;تجارب بد و خطرآفرین</span></span></li>\r\n</ol>\r\n\r\n<p dir="rtl" style="text-align:right"><span style="font-family:Arial"><span style="color:#000000">فرض کنید کودک به سمت چاقویی می&zwnj;رود و آن را در دست می&zwnj;گیرد و بدون هیچ آگاهی قبلی دست خود را می&zwnj;برد. درد و سوزش ناشی از بریدگی چاقو برای کودک تجربه ای بد می&zwnj;شود و به رفتار کودک هنگام دیدن چاقوهایی (یا وسایلی مانند آن) که در آینده می&zwnj;بیند جهت می&zwnj;دهد و او را آگاه می&zwnj;کند که <strong>&quot;نباید به این جسم برنده&zwnj;ی بدریخت دست بزنم. &quot;</strong></span></span></p>\r\n\r\n<p dir="rtl" style="text-align:right"><span style="font-family:Arial"><span style="color:#000000">حال تصور کنید کودک توپی را می&zwnj;بیند. احتمال زیاد به سمت آن روانه می&zwnj;شود و شروع می&zwnj;کند با آن بازی کردن. بعد از مدتی که مکانیزم رفتاری توپ را مشاهده می&zwnj;کند و آن را قل می&zwnj;دهد و متوجه می&zwnj;شود&nbsp;که توپ جسمی است جالب که از قضا باعث شادی روح هم می&zwnj;شود و گویا&nbsp;برایش خطرآفرین نیست، ذهنش بازی با توپ را به عنوان تجربه&zwnj;ای <strong>خوب</strong> در نظر می&zwnj;گیرد.</span></span></p>\r\n\r\n<p dir="rtl" style="text-align:right"><span style="font-family:Arial"><span style="color:#000000">پس تا اینجا توپ برای کودک <strong>خوب</strong> بوده است و چاقو <strong>بد</strong>!</span></span></p>\r\n\r\n<p dir="rtl" style="text-align:right"><span style="font-family:Arial"><span style="color:#000000">حال اگر ناخواسته توپ به سمت یک چیز شکننده قل بخورد و آن را بشکند، آیا باعث <strong>تغییر وضعیت</strong> توپ در ذهن کودک می&zwnj;شود؟ آيا بعد از آن توپ هم به زمره&zwnj;ی <strong>&quot;تجارب بد&quot;</strong> می&zwnj;پیوندد؟</span></span></p>\r\n\r\n<p dir="rtl" style="text-align:right"><span style="font-family:Arial"><span style="color:#000000">یا اگر چاقویی را در دست مادرش ببیند که برایش میوه&zwnj;ای پوست می&zwnj;کند، آيا از آن به بعد <strong>مغزش</strong> از چاقو به عنوان وسیله&zwnj;ای <strong>خوب</strong> یاد می&zwnj;کند؟</span></span></p>\r\n\r\n<p dir="rtl" style="text-align:right"><span style="font-family:Arial"><span style="color:#000000">با توجه به دو سوال آخر متوجه می&zwnj;شویم که <strong>&quot;تجارب&zwnj;&quot;</strong> اغلب <strong>صفر و یکی</strong> نیستند و دارای یک <strong>طیف</strong> هستند. (از منطق بولی تبعیت نمی&zwnj;کنند و به&zwnj;جای آن منطقشان فازی است.)</span></span></p>\r\n\r\n<p dir="rtl" style="text-align:right"><span style="font-family:Arial"><span style="color:#000000">پس کودک نیز در میابد که یک&zwnj;سری چیزها نه صرفا خوب هستند و نه صرفا بد، بلکه به نحوه&zwnj;ی &quot;رفتار&quot; ما بستگی دارند.</span></span></p>\r\n\r\n<p dir="rtl" style="text-align:right"><span style="font-family:Arial"><span style="color:#000000">ربات هم همینطور است. رفتار ربات با یادگیری عمیق&nbsp;مانند رفتار کودک است.</span></span></p>\r\n\r\n<p dir="rtl" style="text-align:right"><span style="font-family:Arial"><span style="color:#000000">رباتی که در اتاقی است و از چیزی درکی ندارد می&zwnj;رود بدنبال کسب تجربه. آنقدر می&zwnj;رود تا به یک دیوار بخورد&nbsp;و ناگهان&nbsp;می&zwnj;افتد. از آن به بعد متوجه می&zwnj;شود نباید تا جایی پیش برود که به دیواری اصابت کند و درواقع اصابتش با دیوار یک <strong>&quot;جریمه یا جزا&quot;</strong> محسوب می&zwnj;شود.</span></span></p>\r\n\r\n<p dir="rtl" style="text-align:right"><span style="font-family:Arial"><span style="color:#000000">دو گلدان روی میز است، یکی از آنها را هل می&zwnj;دهد تا از روی میز بیفتد&nbsp;و باز هم جریمه می&zwnj;شود.</span></span></p>\r\n\r\n<p dir="rtl" style="text-align:right"><span style="font-family:Arial"><span style="color:#000000">پس ربات باید چه کند؟ پاسخ این است: ربات باید بر <strong>رفتارهایی</strong> تمرکز داشته باشد که <strong>پاداش</strong> بگیرد و این پاداش را <strong>بیشینه</strong> کند.</span></span></p>\r\n\r\n<p style="text-align:center"><img alt="ربات و رباتیک" src="/media/uploads/2020/09/16/unnamed.jpg" style="height:480px; width:320px" /></p>\r\n\r\n<p dir="rtl" style="text-align:right"><span style="font-family:Arial"><span style="color:#000000">حال بیایید مقایسه&zwnj;ای بین یادگیری تقویتی و دو تکنیک دیگر یادگیری ماشین داشته باشیم:</span></span></p>\r\n\r\n<p dir="rtl" style="text-align:right"><span style="font-family:Arial"><span style="color:#000000">در یادگیری با ناظر داده&zwnj;های مجموعه&zwnj;ی آموزشی (Training Set) جواب درست را نیز با خود دارند و مدل براساس جواب&zwnj;های صحیح آموزش می&zwnj;بیند اما برخلاف یادگیری با&nbsp;ناظر ، در یادگیری تقویتی خبری از جواب درست نمی&zwnj;باشد و عامل <strong>تصمیم</strong> می&zwnj;گیرد چه رفتاری برای انجام یک وظیفه از خودش نشان دهد. که با توجه به فقدان داده&zwnj;های مجموعه آموزشی در این تکنیک، عامل محدود است به یادگیری از تجارب خودش. و عامل برای کسب این تجارب از <strong>پاداش</strong> و <strong>جزا</strong> برای رفتارهای درست و غلط استفاده می&zwnj;کند.</span></span></p>\r\n\r\n<p dir="rtl" style="text-align:right"><span style="font-family:Arial"><span style="color:#000000">به عنوان مقایسه&zwnj;ای بین یادگیری بدون ناظر و تقویتی، باید گفت که اهداف یادگیری تقویتی متفاوت است.</span></span></p>\r\n\r\n<p dir="rtl" style="text-align:right"><span style="font-family:Arial"><span style="color:#000000">در یادگیری بدون ناظر هدف پیدا کردن شباهت&zwnj;ها و تفاوت&zwnj;های داده&zwnj;ها می&zwnj;باشد، درحالیکه همانطور که گفتیم هدف یادگیری تقویتی پیدا کردن رفتارهای&nbsp;مناسبی است که پاداش حاصل از آنها را بیشینه کند.</span></span></p>\r\n\r\n<p dir="rtl" style="text-align:center"><span style="font-family:Arial"><span style="color:#000000"><img alt="یادگیری تقویتی چیست؟" src="/media/uploads/2020/09/16/1781890_1573621074_rainforcement_banner_tittle_bXGT5tZ.jpg" style="height:360px; width:750px" /></span></span></p>\r\n\r\n<h3 dir="rtl" style="text-align:right">&nbsp;</h3>\r\n\r\n<h3 dir="rtl" style="text-align:right"><span style="font-size:22px"><strong><span style="font-family:Arial"><span style="color:#000000">2. اگر برایتان سوال است که چطور می&zwnj;توان یک مسئله&zwnj;ی ساده یادگیری تقویتی را فرمول&zwnj;بندی کرد، بخش پایینی همراه با یک مثال به دردتان می&zwnj;خورد:</span></span></strong></span></h3>\r\n\r\n<p dir="rtl" style="text-align:right"><span style="font-family:Arial"><span style="color:#000000">بعضی از شرایط کلیدی که می&zwnj;توانند عناصر یک مسئله ی یادگیری تقویتی را توصیف کنند عبارتند از:</span></span></p>\r\n\r\n<p dir="rtl" style="text-align:right"><span style="font-family:Arial"><span style="color:#000000"><strong>Environment (محیط)</strong>: دنیایی که در آن عامل فعالیت می&zwnj;کند.</span></span></p>\r\n\r\n<p dir="rtl" style="text-align:right"><span style="font-family:Arial"><span style="color:#000000"><strong>State (حالت):</strong> وضعیت فعلی عامل.</span></span></p>\r\n\r\n<p dir="rtl" style="text-align:right"><span style="font-family:Arial"><span style="color:#000000"><strong>Policy (خط مشی):</strong> روشی که باعث رفتار عامل با توجه به حالتی (state) که دارد، می&zwnj;شود.</span></span></p>\r\n\r\n<p dir="rtl" style="text-align:right"><span style="font-family:Arial"><span style="color:#000000"><strong>Value (ارزش):</strong> پاداشی که عامل در آینده با توجه به رفتاری که در یک حالت (state) مشخص انجام می&zwnj;دهد، می&zwnj;گیرد.</span></span></p>\r\n\r\n<p dir="rtl" style="text-align:right"><span style="font-family:Arial"><span style="color:#000000">موافقید سری بزنیم به بازی معروف <strong>PacMan</strong>؟</span></span></p>\r\n\r\n<p dir="rtl" style="text-align:right"><span style="font-family:Arial"><span style="color:#000000">در این بازی، هدف عامل (که همان PacMan می&zwnj;باشد) این است که هر غذایی که در محیط (Environment) بازی سر راهش است را بخورد. پکمن با خوردن غذاها به پاداش دست پیدا می&zwnj;کند و زمانی مجازات می&zwnj;شود که توسط&nbsp;<strong>Ghost</strong>های درون بازی کشته شود (در اینصورت بازی را می&zwnj;بازد). در این مسئله، state، مکان پکمن در محیط بازی می&zwnj;باشد و بیشینه&zwnj;ی پاداش پکمن زمانی اتفاق می&zwnj;افتد که بازی را ببرد.</span></span></p>\r\n\r\n<p dir="rtl" style="text-align:right"><span style="font-family:Arial"><span style="color:#000000">به منظور ایجاد policy (خط مشی) مطلوب برای این مسئله، عامل بازی در محیط بازی بر سر دوراهی&zwnj;هایی قرار می&zwnj;گیرد که ناشی از کشف state&zwnj;های جدید هنگام بیشینه سازی پاداشش است.</span></span></p>\r\n\r\n<p dir="rtl" style="text-align:right"><span style="font-family:Arial"><span style="color:#000000">که این کار موجب می&zwnj;شود عامل بین اکتشاف و بهره&zwnj;برداری گیر کند. (</span><span style="color:#111111"><span style="background-color:#ffffff"><strong>Exploration vs Exploitation trade-off</strong></span></span><span style="color:#000000">)</span></span></p>\r\n\r\n<p dir="rtl" style="text-align:center"><span style="font-family:Arial"><span style="color:#000000"><img alt="یادگیری تقویتی در بازی" src="/media/uploads/2020/09/16/pleasantpastelicelandicsheepdog-small.gif" style="height:280px; width:500px" /></span></span></p>\r\n\r\n<h3 dir="rtl" style="text-align:right"><span style="font-size:22px"><strong><span style="font-family:Arial"><span style="color:#000000">3.&nbsp;کابردهای عملی یادگیری تقویتی چه هستند؟</span></span></strong></span></h3>\r\n\r\n<ul dir="rtl">\r\n\t<li style="text-align:right"><span style="font-family:Arial"><span style="color:#000000">به لطف جناب <strong>ایلان ماسک</strong> و شرکت قدرتمندش یعنی <strong>تسلا</strong>، همگی کم و بیش با <a href="http://cgeeksc.ir/post/self-driving-cars">ماشین&zwnj;های خودران (Self-driving Cars)</a> آشنا هستیم. در این ماشین&zwnj;ها یکی از تکنیک&zwnj;هایی که مورد استفاده قرار می&zwnj;گیرد همین یادگیری تقویتی است.</span></span></li>\r\n\t<li style="text-align:right"><span style="font-family:Arial"><span style="color:#000000"><strong>دستیارهای صوتی</strong> را می&zwnj;شناسید؟</span></span></li>\r\n</ul>\r\n\r\n<p><span style="font-size:16px"><span style="font-family:Arial"><span style="color:#000000">Alexa شرکت آمازون، Siri شرکت اپل، Google Assistant شرکت گوگل و دستیار قدرتمند Iron Man که جارویس (Jarvis) نام داشت همگی براساس تکنیک یادگیری تقویتی&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; هستند و از واکنش&zwnj;های کاربر&nbsp;می&zwnj;آموزند&nbsp;و اطلاعات خود را بیشتر می&zwnj;کنند در نتیجه&zwnj;ی این کار عملکرد&nbsp;خود را بهبود می&zwnj;بخشند.</span></span></span></p>\r\n\r\n<ul dir="rtl">\r\n\t<li style="text-align:right"><span style="font-family:Arial"><span style="color:#000000">یادگیری تقویتی بطور گسترده در بازی&zwnj;های کامپیوتری استفاده می&zwnj;شود. مثلا</span><span style="color:#111111"><span style="background-color:#ffffff">&nbsp;</span></span><strong><span style="background-color:#ffffff">AlphaGo Zero</span></strong><span style="color:#000000"> اولین برنامه&zwnj;ای است که قهرمان جهان را در بازی باستانی چینی GO شکست داد.</span></span></li>\r\n</ul>\r\n\r\n<p dir="rtl" style="text-align:right"><span style="font-family:Arial"><span style="color:#000000">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; امروزه نیز در اغلب بازی&zwnj;های کامپیوتری شاهد یادگیری تقویتی هستیم که قدرت&zwnj;نمایی می&zwnj;کند و حریف بسیار قدری محسوب می&zwnj;شود.</span></span></p>\r\n\r\n<ul dir="rtl">\r\n\t<li style="text-align:right"><span style="font-family:Arial"><span style="color:#000000">یادگیری تقویتی در حوزه&zwnj;ی رباتیک و اتوماسیون صنعتی نیز کاربردهای بسیاری دارد.</span></span></li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h3 dir="rtl" style="text-align:right"><span style="font-size:22px"><strong><span style="font-family:Arial"><span style="color:#000000">4. چطور یادگیری عمیق را شروع کنم؟</span></span></strong></span></h3>\r\n\r\n<p><span style="font-family:Arial"><span style="color:#000000">معرفی منبع از عهده&zwnj;ی بنده خارج است اما برای درک مفاهیم پایه&zwnj;ای یادگیری عمیق می&zwnj;توانید از کتاب&nbsp;</span><span style="color:#111111"><span style="background-color:#ffffff"><strong>Reinforcement Learning-An Introduction</strong></span></span><span style="color:#000000"> به قلم </span><span style="color:#111111"><span style="background-color:#ffffff">پدر یادگیری عمیق یعنی آقای ریچارد ساتن (Richard Sutton) بهره بگیرید.</span></span></span></p>	2020-09-16	images/posts/RlSite.png	introduction-to-reinforcement-learning	published	3	\N	<p><a href="https://www.kdnuggets.com/2018/03/5-things-reinforcement-learning.html" target="_blank">https://www.kdnuggets.com/2018/03/5-things-reinforcement-learning.html</a></p>	\N	17	در این مطلب از جامعه‌ی گیک‌های کامپیوتر به یکی از روش های یادگیری ماشین (Machine Learning) به‌نام یادگیری تقویتی (Reinforcement Learning) نگاهی می‌اندازیم.	\N	2020-09-16 14:30:00+00	یادگیری تقویتی
14	بررسی اجزای برد آردوینو promicro	<p dir="RTL" style="text-align:right"><span style="font-family:Vazir"><span style="font-size:11pt">از زمان روی کار آمدن پروژه شهرها و ماشین&zwnj;های هوشمند علاقه به یادگیری&nbsp;<a href="http://cgeeksc.ir/event/004" style="color:blue; text-decoration:underline">اینترنت اشیا</a> و توجه به آن در صنعت به عنوان و یک شاخه بسیار بزرگ تکنولوژی افزایش پیدا کرد.</span></span></p>\r\n\r\n<p dir="RTL" style="text-align:right"><span style="font-family:Vazir"><span style="font-size:11pt">لذا در حال حاضر یادگیری درباره سخت افزار و نرم افزار مربوط به IoT طرفداران زیادی پیدا کرده. به عنوان فردی که یادگیری و فعالیت در این زمینه را به تازگی شروع کرده باشد کار بر روی پروژه&zwnj;های کوچک بسیار جذاب و آموزنده خواهد بود.از این رو در این ویدیو ما به معرفی و بررسی یکی از قطعات ابتدایی اما پرکاربرد در ساخت پروژه&zwnj;های اینترنت اشیا (برد آردوینو promicro) پرداخته&zwnj;ایم.</span></span></p>	2020-09-14	images/posts/post-sitepromicro.jpg	promicro_Introduction	published	4	\N		https://youtu.be/Mkc9MiKNO_4	1	در این ویدیو به بررسی اجزای تشکیل دهنده یک برد آردوینو مدل promicro می‌پردازیم.	\N	\N	\N
1	ساخت پروژه Head Football در انجین Godot	<p>اگر اهل بازی&zwnj;های موبایلی باشید حتما نام بازی معروف و مطرح Head Football را شنیده&zwnj;اید. در واقع Head Football تبدیل به سبکی از بازی شده و عناوین مختلف و متفاوتی را می&zwnj;توان در بازار بازی&zwnj;های موبایلی پیدا کرد. این شکل از بازی&zwnj;ها سال&zwnj;هاست در حال تولید هستند و شرکت&zwnj;های زیادی دست به ساخت بازی با گیم پلی مشابه زده&zwnj;اند.</p>\r\n\r\n<p>محبوبیت این سبک بازی و همچنین عدم وجود پیچیدگی و فیزیک ساده به کار رفته در این بازی باعث شده بسیاری از تازه واردان به حوزه بازی&zwnj;سازی قصد ساخت چنین بازی&zwnj;ای را داشته باشند. جدای از گیم پلی سرگرم کننده و لذت بخش و جذاب این بازی، ساخت و طراحی این بازی می&zwnj;تواند تمرینی مناسب برای علاقه&zwnj;مندان به بازی&zwnj;سازی باشد.</p>\r\n\r\n<p style="text-align:center"><img alt="آموزش گودوت" src="/media/uploads/2020/09/06/screenshot_2020-08-30_19-58-03.png" style="height:520px; width:848px" /></p>\r\n\r\n<p>به همین دلیل و به مناسبت برگزاری مسابقه بازی&zwnj;سازی جامعه کاربران گودوت (Godot) ایران تصمیم به ساخت این پروژه و ضبط مراحل ساخت و انتشار آن در قالب یک ویدیوی آموزشی برای علاقه&zwnj;مندان به بازی&zwnj;سازی گرفتم. در این ویدیو که حدود یک ساعت زمان دارد یک پروژه را از صفر آغاز کرده و بازی ساده&zwnj;ای با گیم پلی مشابه بازی Head Football خواهیم ساخت.</p>\r\n\r\n<p>گرچه این ویدیو مناسب افرادی که هیچ پیش زمینه&zwnj;ای از بازی&zwnj;سازی و انجین گودوت (Godot) ندارند نیست اما می&zwnj;تواند دید خوبی به کاربران تازه کار گودوت (Godot) بدهد و تمرین مناسبی برای شما باشد.</p>\r\n\r\n<p>در این ویدیو مباحث جالب و کلیدی&zwnj;ای مانند انواع فیزیک، گرفتن کلیدهای کیبرد به عنوان ورودی از کاربر و مباحث پایه&zwnj;ای و کاربردی ای مورد بحث قرار می&zwnj;گیرند. پیشنهاد می&zwnj;کنم اگر علاقه&zwnj;مند به بازی&zwnj;سازی و یادگیری انجین گودوت (Godot) هستید این ویدیو را از دست ندهید و&nbsp; در ساخت این پروژه با من همراه باشید.</p>	2020-06-11	images/posts/post-site-head-football.png	headfootball-godot	published	2	\N		https://youtu.be/3XI8VKd0TYw	7	در این ویدیو که حدود یک ساعت زمان دارد یک پروژه را در انجین گودوت (Godot) از صفر آغاز کرده و بازی ساده‌ای با گیم پلی مشابه بازی Head Football خواهیم ساخت.	https://github.com/Rghaf/head-football	\N	\N
7	آشنایی با کراولرها و موتورهای جستجو	<p>از زمانیکه عبارتی را در موتورهای جستجو وارد می&zwnj;کنیم تا زمانیکه سایت های مختلفی که در آنها محتوای مرتبط با عبارت مورد جستجو برایمان نمایش داده می&zwnj;شوند اتفاقات زیادی می&zwnj;افتد.<br />\r\nاما سوال اصلی اینجاست : آیا دقیقا همان زمان که عبارت مورد نظرمان را وارد می&zwnj;کنیم سایتهای مختلف گشته می&zwnj;شوند و نتایج را برایمان نمایش می&zwnj;دهند؟<br />\r\nاگر اینچنین است، چطور امکان دارد که انبوهی از نتایج تنها در کسری از ثانیه برایمان نمایش داده می&zwnj;شوند؟<br />\r\nو اگر اینچنین نیست، پس چه اتفاقاتی در پس پرده&zwnj;ی موتورهای جستجو در حال رخ دادن است؟<br />\r\nدر وهله&zwnj;ی اول در این ویدیو سعی بر آن بوده به سوال بالا با زبانی ساده پاسخ داده شود و علاوه بر این به مفاهیم دیگری نیز می&zwnj;پردازیم و با طرز کار کراولر بیشتر آشنا می&zwnj;شویم.<br />\r\nپیشنهاد می&zwnj;شود علاوه بر این ویدیو به مقاله&zwnj;ی <a href="http://cgeeksc.ir/post/Web-Scraping-Introduce">وب اسکریپینگ</a> هم سر بزنید و دایره ی اطلاعات خود را گسترده تر کنید.</p>	2020-08-24	images/posts/sitesPostCrawler.png	Crawler-Introduction	published	3	\N		https://youtu.be/BCmppFrg4y0	5	در این ویدیو با سازوکار موتورهای جستجو و همچنین کراولرها آشنا خواهیم شد.	\N	\N	\N
20	الگوریتم Bubble Sort با پایتون	<p>نظم و ترتیب یکی از چیزهایی است که رعایت آن همیشه باعث سهولت کارها می&zwnj;شود.</p>\r\n\r\n<p>اگر بخواهید دنبال چیزی بگردید، بدون شک&nbsp;پیدا کردن آن در یک فضای مرتب شده بسیار راحت&zwnj;تر از فضایی شلوغ است، چرا که الگوریتمی که برای پیدا کردنش در یک فضای شلوغ باید بکار بگیرید پیچیده&zwnj;تر از الگوریتمی است که در یک فضای مرتب شده بکار خواهید&nbsp;گرفت.</p>\r\n\r\n<p>سخن از &quot;الگوریتم&quot;&nbsp;و &quot;مرتب&zwnj;سازی&quot; به میان آمد، جا دارد بگویم&nbsp;یکی از الگوریتم&zwnj;هایی که برای مرتب سازی آرایه&zwnj;ها بکار می&zwnj;رود، الگوریتم Bubble Sort یا مرتب&zwnj;سازی حبابی می&zwnj;باشد.</p>\r\n\r\n<p style="text-align:center"><img alt="مرتب سازی حبابی" src="/media/uploads/2020/09/28/bubble-sort.gif" style="height:300px; width:500px" /></p>\r\n\r\n<p>در این ویدیو از ویدیوهای جامعه&zwnj;ی گیک&zwnj;های کامپیوتر به بررسی این الگوریتم می&zwnj;پردازیم و در نهایت آن را به زبان&nbsp;پایتون پیاده&zwnj;سازی می&zwnj;کنیم.</p>	2020-09-28	images/posts/BubbleSortSite.png	bubble-sort-in-python	published	3	\N		https://youtu.be/EOmBUEU6ZCk	1	در این ویدیو به بررسی یکی از الگوریتم‌های مرتب سازی معروف به نام Bubble Sort می‌پردازیم و آن را به زبان برنامه‌نویسی پایتون پیاده‌سازی می‌کنیم.	\N	\N	الگوریتم bubble sort
19	مقایسه جنگو و فلسک؛ تقابل فریمورک‌های وب پایتون	<p dir="rtl">پایتون یکی از محبوب&zwnj;ترین زبان&zwnj;های برنامه نویسی است که در سال&zwnj;های اخیر توانسته تعداد زیادی از برنامه نویسان و فعالین حوزه کامپیوتر را به خود جذب کند. پایتون یکی از سطح بالاترین زبان&zwnj;ها به شمار می&zwnj;رود و در عین سادگی قدرتمند است و در حوزه&zwnj;های بسیاری کاربرد دارد.</p>\r\n\r\n<p dir="rtl">با پایتون می&zwnj;توانید در علم داده فعالیت کنید، به <a href="http://cgeeksc.ir/category/AI-articles">هوش مصنوعی</a> ورود کنید و یا در <a href="http://cgeeksc.ir/category/wab-and-app">وب</a> فعالیت کنید. این زبان قدرتمند و پرطرفدار را می&zwnj;توان زبان برنامه نویسی&zwnj;ای همه کاره دانست که با آن می&zwnj;توانید در اکثر حوزه&zwnj;ها فعالیت خود را شروع کنید.</p>\r\n\r\n<p dir="rtl">اگر علاقه مند به دنیای وب و طراحی وب اپلیکیشن&zwnj;ها باشید، دنیای پایتون دو گزینه کاربردی پیش روی شما قرار می&zwnj;دهد: <strong>جنگو (django)</strong> و <strong>فلسک (Flask)</strong></p>\r\n\r\n<p dir="rtl"><strong>جنگو و فلسک</strong> دو فریمورک وب هستند و این امکان را برای شما فراهم می&zwnj;کنند که بتوانید با پایتون سایت&zwnj;ها و وب اپلیکیشن&zwnj;های قدرتمندی بنویسید.</p>\r\n\r\n<p dir="rtl">اما تفاوت&zwnj; جنگو و فلسک در چیست و کدام یک گزینه بهتری هستند؟ در ادامه به این سوال پاسخ خواهیم داد و تفاوت&zwnj;های دو فریمورک محبوب پایتونی یعنی جنگو و فلسک را بررسی خواهیم کرد.</p>\r\n\r\n<p dir="rtl" style="text-align:center"><img alt="مقایسه جنگو و فلسک" src="/media/uploads/2020/09/26/django-vs-flask.jpg" style="height:692px; width:1242px" /></p>\r\n\r\n<h2 dir="rtl">جنگو و فلسک چی هستند؟</h2>\r\n\r\n<p dir="rtl">ابتدا برای اینکه بتوانیم بهتر جنگو و فلسک را مورد بررسی قرار دهیم بهتر است ببینیم این دو فریمورک چه ویژگی&zwnj;هایی دارند و چه فلسفه&zwnj;ای در طراحی آن&zwnj;ها وجود داشته است. پس بیایید نگاهی به ماهیت این دو فریمورک پایتونی بیندازیم.</p>\r\n\r\n<h3 dir="rtl">جنگو</h3>\r\n\r\n<p dir="rtl">جنگو (django) یک فریمورک آزاد و متن باز پایتونی برای توسعه وب است. جنگو از الگو یا ساختار <strong>Model-View-Template (MVT)</strong> برای توسعه استفاده می&zwnj;کند. جنگو در سال 2003 توسط <strong>Adrian Holovaty</strong> و <strong>Simon Willison</strong> ساخته شد. جنگو ساخته شد تا ابزاری ساده برای توسعه وب باشد و تمرکز اصلی این ابزار بر روی سرعت، قابل استفاده مجدد بودن بخش&zwnj;های مختلف و کدهای کمتر است.</p>\r\n\r\n<p dir="rtl">طراحی جنگو تحت تاثیر برخی فریمورک&zwnj;ها که پیش از این ساخته شده&zwnj; بودند مثل <strong>Zope</strong> و <strong>Plone</strong> بوده و خود جنگو هم توانسته الهام بخش بسیاری از فریمورک&zwnj;ها که پس از متولد شدن جنگو ساخته شدند مثل <strong>Pyramid</strong> و <strong>Web2py</strong> باشد.</p>\r\n\r\n<p dir="rtl" style="text-align:center"><img alt="جنگو" src="/media/uploads/2020/09/26/django-darkwidth-808.png" style="height:367px; width:808px" /></p>\r\n\r\n<h3 dir="rtl">فلسک</h3>\r\n\r\n<p dir="rtl">فلسک (Flask) یک فریمورک کوچک یا microframework است که شروع قدرتمند و شگفت آوری داشت و در واقع به عنوان دروغ اول آپریل (همان دروغ سیزده ما ایرانی&zwnj;&zwnj;ها!) شروع به کار کرد. قبل از اینکه فلسک ساخته شود، خالق فلسک یعنی <strong>Armin Ronacher</strong> دو ابزار دیگر با نام&zwnj;های <strong>Werkzeug</strong> و <strong>Jinja2</strong> را ساخته بود. پس از ساخت این دو ابزار آرمین به این فکر افتاد که شاید بهتر باشد این دو ابزار در کنار هم قرار بگیرند و فریمورکی نوشت که در واقع فایلی زیپ از همین دو ابزار بود و زمانی که اجرایش می&zwnj;کردید این دو فایل را Unzip و هر دو را همزمان اجرا می&zwnj;کرد. این فریمورک که همان فلسک است در ابتدا بازخورد بسیاری خوبی داشت.</p>\r\n\r\n<p dir="rtl" style="text-align:center"><img alt="فلسک" src="/media/uploads/2020/09/26/flask_logosvg.png" style="height:457px; width:1169px" /></p>\r\n\r\n<h3 dir="rtl">تفاوت&zwnj;های اصلی میان جنگو و فلسک</h3>\r\n\r\n<p dir="rtl">حالا که متوجه شدیم جنگو و فلسک چگونه متولد شدن و فلسفه آن&zwnj;ها چیست بهتر است مقایسه&zwnj;ای دقیق&zwnj;تر از امکانات این دو فریمورک داشته باشیم.</p>\r\n\r\n<p dir="rtl">جنگو <strong>ORM</strong> مخصوص خودش را دارد که بسیار قدرتمند است و از <strong>data models</strong> استفاده می&zwnj;کند. data models به توسعه دهندگان اجازه می&zwnj;دهد بین tabelهای database و کلاس&zwnj;های برنامه نویسی ارتباط برقرار کنند و با modelها مانند database رفتار کنند.</p>\r\n\r\n<p dir="rtl">در سمت مقابل، در فلسک خبری از data model نیست. اما چرا فلسک هیچ data modelی ندارد؟ این مسئله به تفاوت فلسفه جنگو و فلسک بر می&zwnj;گردد. جنگو به صورت یک باندل عمل می&zwnj;کند و سعی دارد همه چیز را تحت کنترل داشته باشد در حالی که فلسک بیشتر مناسب مقیاس&zwnj;های کوچک و modular است.</p>\r\n\r\n<blockquote>\r\n<p><a href="http://cgeeksc.ir/event/005">جلسه پنجم: آشنایی با فریمورک جنگو (django)</a></p>\r\n</blockquote>\r\n\r\n<p dir="rtl">تفاوت اصلی بین جنگو و فلسک این است که جنگو یک فریمورک با ویژگی&zwnj;های کامل <strong>Model&ndash;View&ndash;Controller</strong> است و می&zwnj;تواند کارهای زیادی را انجام دهد و همانطور که گفته شد گزینه مناسبی برای توسعه سریع وب با کدهای کمتر است. در حالی که فلسک بیشتر برای این ساخته شده تا بتواند فقط یک کار را به شکل عالی انجام دهد. فلسک هیچ ORMی ندارد و فقط ابزارهایی ساده و پایه&zwnj;ای برای توسعه وب را داراست.</p>\r\n\r\n<p dir="rtl">وب اپ&zwnj;هایی که با فلسک توسعه داده می&zwnj;شوند بیشتر <strong>single-page applications (SPA)</strong> هستند. فلسک گزینه بسیار مناسبی برای پروژه&zwnj;های کوچک مثل یک وبلاگ ساده است در حالی که جنگو برای مقیاس&zwnj;های بزرگ ساخته شده و گزینه بسیار مناسبی برای طراحی فروشگاه&zwnj;های اینترنتی بزرگ و طراحی CMS است.</p>\r\n\r\n<p dir="rtl" style="text-align:center"><img alt="جنگو و فلسک" src="/media/uploads/2020/09/26/flask-vs-django.jpg" style="height:379px; width:1024px" /></p>\r\n\r\n<p dir="rtl">حال بهتر است جنگو و فلسک را در زمینه&zwnj;های دیگر مثل سرعت، عملکرد و جامعه کاربران مقایسه کنیم تا بتوانیم انتخاب بهتری داشته باشیم.</p>\r\n\r\n<h4 dir="rtl">عملکرد</h4>\r\n\r\n<p dir="rtl">تفاوت&zwnj; جنگو و فلسک در عملکرد، بیشتر به نوع سیستم وابسته است. اما در مجموع عملکرد خوب یک سیستم را می&zwnj;توان با فاکتورهایی مانند سرعت، مقیاس پذیری و امنیت ارزیابی کرد.</p>\r\n\r\n<p dir="rtl">اگر جنگو و فلسک را از این نظر مقایسه کنیم هر دو به نتایج خوبی دست پیدا خواهند کرد و وبسایت&zwnj;های بزرگی با تعداد بازدیدکننده بالا با استفاده از این دو فریمورک طراحی شدند که نشان&zwnj;دهنده عملکرد عالی آن&zwnj;هاست.</p>\r\n\r\n<h4 dir="rtl">پکیج&zwnj;ها</h4>\r\n\r\n<p dir="rtl">فلسک <strong>minimalistic</strong> است و محدودیتی ندارد. این به آن معناست که توسعه دهندگان می&zwnj;توانند دقیقا آن چه که می&zwnj;خواهند را طراحی کنند و با استفاده از کتابخانه&zwnj;های خارج از فلسک اپلیکیشن خود را توسعه دهند. این امکان از فلسک یک فریمورک انعطاف پذیر و قدرتمند ساخته است.</p>\r\n\r\n<blockquote>\r\n<p><a href="http://cgeeksc.ir/post/Web-Scraping-Introduce">وب اسکرپینگ (Web Scraping) برای همه</a></p>\r\n</blockquote>\r\n\r\n<p dir="rtl">در سمت مقابل جنگو تعداد بسیار بالایی پکیج&zwnj;های built-in دارد. تا سپتامبر 2019 تعداد پکیج&zwnj;های جنگو بیش از <strong>4000</strong> بود که این تعداد تا امروز قطعا بیشتر شده؛ و این یعنی شما به سادگی می&zwnj;توانید پکیجی برای ساخت و طراحی برنامه خود پیدا کنید و تقریبا هرچیزی که بخواهید در دسترس است.</p>\r\n\r\n<h4 dir="rtl">جامعه کاربران</h4>\r\n\r\n<p dir="rtl">در این مورد و در مقایسه جنگو و فلسک، جنگو دست بالاتر را دارد. جامعه کاربران جنگو بسیار وسیع و بزرگ است و تقریبا هر سوالی داشته باشید می&zwnj;توانید جواب آن را در وب پیدا کنید و یا حداقل کسانی هستند که بتوانید از آن&zwnj;ها سوال کنید. همچنین پیدا کردن شغل به عنوان توسعه دهنده جنگو خیلی سخت نیست.</p>\r\n\r\n<p dir="rtl" style="text-align:center"><img alt="مقایسه django و flask" src="/media/uploads/2020/09/26/python-django-web-development.jpg" style="height:455px; width:1000px" /></p>\r\n\r\n<p dir="rtl">در مقابل فلسک جامعه بزرگی ندارد و شاید اگر سوال یا مشکل بزرگی داشته باشید مدتی طول بکشد تا بتوانید جواب آن را پیدا کنید.</p>\r\n\r\n<h4 dir="rtl">امنیت</h4>\r\n\r\n<p dir="rtl">جنگو امکانی برای محافظت از برنامه شما در مقابل مشکلات زیر را داراست:</p>\r\n\r\n<ul dir="rtl">\r\n\t<li><strong>Cross-site scripting (XSS):</strong><strong> </strong>حملات XSS به مهاجم این امکان را می&zwnj;دهد تا بتواند کدهایی را در سمت Client وارد کند. اما الگوهای موجود در جنگو از پروژه شما در مقابل این حملات محافظت خواهند کرد.</li>\r\n\t<li><strong>Cross-site request forgery (CSRF):</strong><strong> </strong>این نوع حملات به مهاجم این امکان را می&zwnj;دهند که از مشخصات و اعتبار کاربر دیگری استفاده کند؛ اما جنگو در مقابل اکثر حملات CSRF امنیت کافی را دارد.</li>\r\n\t<li><strong>SQL injection:</strong><strong> </strong>حمله SQL injection این امکان را به کاربر مهاجم می&zwnj;دهد که کدهایی مخرب و خودسرانه را بر روی Database اجرا کند. اما querysetهای جنگو تا حد قابل قبولی در مقابل این حملات امن هستند.</li>\r\n</ul>\r\n\r\n<p style="text-align:center"><img alt="جنگو در مقابل فلسک" src="/media/uploads/2020/09/26/cover-redesign-websecurityvulnerabilities-luke_newsletter-04d5cdafdaf363f0bc6aa723a391c343.png" style="height:725px; width:1387px" /></p>\r\n\r\n<p dir="rtl">کتابخانه <strong>Flask-Security</strong> تقریبا مشابه جنگو عمل می&zwnj;کند و مانند جنگو، فلسک را از نشت اطلاعات و اکثر حملات وب محافظت می&zwnj;کند.</p>\r\n\r\n<h5 dir="rtl">سایت&zwnj;های مطرحی که از جنگو و فلسک استفاده کردند</h5>\r\n\r\n<p dir="rtl">جنگو برای طراحی سریع وب اپ&zwnj;های پیچیده ساخته شده است. جنگو این امکان را برای توسعه دهندگان فراهم می&zwnj;کند تا ابزارهای لازم برای توسعه یک برنامه مقیاس پذیر را داشته باشند. در سمت دیگر سادگی فلسک این اجازه را به توسعه دهندگان می&zwnj;دهد تا برنامه&zwnj;های کوچک&zwnj;تر را سریع توسعه دهند.</p>\r\n\r\n<p dir="rtl">بیایید چند مثال از برترین اپ&zwnj;های ساخته شده با جنگو و فلسک را ببینیم.</p>\r\n\r\n<h6 dir="rtl">کدام پروژه&zwnj;ها با جنگو ساخته شدند؟</h6>\r\n\r\n<p dir="rtl">بسیاری از سایت&zwnj;های مطرح از جنگو استفاده می&zwnj;کنند. از آنجایی که این فریمورک در مقیاس پذیری ساده عمل می&zwnj;کند و امکان پردازش مقدار زیادی از اطلاعات را به صورت همزمان فراهم می&zwnj;کند، تعداد زیادی از سایت&zwnj;هایی که ترافیک بالایی دارند از جنگو استفاده می&zwnj;کنند.</p>\r\n\r\n<p dir="rtl">در زیر شما می&zwnj;توانید معروف&zwnj;ترین پروژه&zwnj;های جنگویی را ببینید:</p>\r\n\r\n<p style="text-align:center"><img alt="معروف ترین پروژه های جنگو" src="/media/uploads/2020/09/26/django-projects.png" style="height:650px; width:1350px" /></p>\r\n\r\n<p dir="rtl">همچنین ما در جامعه گیک&zwnj;های کامپیوتر یک CMS اختصاصی را با جنگو پیاده کردیم و وبسایتی که در آن حضور دارید با جنگو توسعه داده شده است. اطلاعات مربوط به این پروژه را می&zwnj;توانید در <a href="http://cgeeksc.ir/projects/cgeeksc-website">اینجا</a> ببینید.</p>\r\n\r\n<h6 dir="rtl">چه نوع پروژه&zwnj;هایی با استفاده از فلسک ساخته شدند؟</h6>\r\n\r\n<p dir="rtl">فلسک یکی از برجسته&zwnj;ترین فریمورک&zwnj;های توسعه وب پایتونی است. طبق اطلاعات اعلام شده JetBrains در مورد توسعه دهندگان پایتون، فلسک در سال 2017 توسط 41٪ از توسعه دهندگان استفاده می&zwnj;شد و این در سال 2018 به 47٪ افزایش پیدا کرده است.</p>\r\n\r\n<p dir="rtl">دلیلش این است که برخی از شرکت&zwnj;های مشهور جهانی مثل Reddit از فلسک استفاده می&zwnj;کنند. فلسک به شما کنترل بیشتری روی پروژه&zwnj;تان می&zwnj;دهد، همچنین می&zwnj;توانید چیزهایی که نیاز دارید را به پروژه خود به عنوان یک افزونه اضافه کنید.</p>\r\n\r\n<p dir="rtl">معروف&zwnj;ترین سایت&zwnj;هایی که از فلسک استفاده می&zwnj;کنند را می&zwnj;توانید در زیر ببینید:</p>\r\n\r\n<p style="text-align:center"><img alt="معروف ترین پروژه های فلسک" src="/media/uploads/2020/09/26/flask-projects.png" style="height:650px; width:1350px" /></p>\r\n\r\n<p dir="rtl">بیایید به طور خلاصه تفاوت&zwnj;های جنگو و فلسک را در یک جدول ببینیم:</p>\r\n\r\n<table align="center" border="1" cellpadding="1" cellspacing="1" style="height:557px; width:610px" summary="فرق‌های جنگو و فلسک به طور خلاصه">\r\n\t<caption><strong>فرق جنگو و فلسک</strong></caption>\r\n\t<tbody>\r\n\t\t<tr>\r\n\t\t\t<td style="text-align:center">\r\n\t\t\t<h6>جنگو</h6>\r\n\t\t\t</td>\r\n\t\t\t<td style="text-align:center">\r\n\t\t\t<h6>فلسک</h6>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\t\t\t<td style="text-align:center">ویژگی&zwnj;های کامل مثل پنل ادمین</td>\r\n\t\t\t<td style="text-align:center">ساده، سبک و انعطاف پذیر</td>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\t\t\t<td style="text-align:center">سیستم ORM</td>\r\n\t\t\t<td style="text-align:center">فضا برای توسعه چیزهای جدید</td>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\t\t\t<td style="text-align:center">جا افتاده</td>\r\n\t\t\t<td style="text-align:center">قابل انعطاف با ساختار شخصی سازی شده</td>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\t\t\t<td style="text-align:center">کمک به ذخیره سازی زمان</td>\r\n\t\t\t<td style="text-align:center">مناسب پروژه&zwnj;های کوچک</td>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\t\t\t<td style="text-align:center">کاملا امن</td>\r\n\t\t\t<td style="text-align:center">مناسب برای افراد تازه کار</td>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\t\t\t<td style="text-align:center">مناسب برای پروژه&zwnj;های متوسط و بزرگ</td>\r\n\t\t\t<td>&nbsp;</td>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\t\t\t<td style="text-align:center">داکیومنت کامل و مناسب</td>\r\n\t\t\t<td>&nbsp;</td>\r\n\t\t</tr>\r\n\t</tbody>\r\n</table>\r\n\r\n<p dir="rtl">در پایان توجه کنید که برتری جنگو و فلسک بر یکدیگر قطعی نیست و بیشتر به خواسته شما و پروژه&zwnj;ای که دارید برمی&zwnj;گردد. جنگو را در پروژه&zwnj;های انتخاب کنید که قصد توسعه سایت&zwnj;های نسبتا بزرگی مثل یک پلتفرم فروشگاهی یا سایت دولتی را دارید. فلسک را زمانی انتخاب کنید که یک پروژه کوچک یا متوسط با نیاز به ساخت اجزای خاص و شخصی دارید.</p>\r\n\r\n<blockquote>\r\n<p dir="rtl"><strong>جنگو یک جعبه ابزار است و فلسک یک چکش!</strong></p>\r\n</blockquote>\r\n\r\n<p dir="rtl">امیدواریم که این راهنما و مقایسه به شما در انتخاب بین جنگو و فلسک کمک کند و به خوبی توانسته باشید تفاوت&zwnj;های این دو فریمورک را متوجه شده باشید. اگر پروژه&zwnj;ای جنگویی دارید ما در جامعه گیک&zwnj;های کامپیوتر آماده انجام پروژه&zwnj;های شما هستیم و می&zwnj;توانید از طریق فرم <a href="http://cgeeksc.ir/contact-us">ارتباط با ما</a>، با ما در تماس باشید.</p>	2020-09-26	images/posts/post-site-django-vs-flask.jpg	django-vs-flask	published	2	\N	<p><b><a href="https://medium.com/@SteelKiwiDev/flask-vs-django-how-to-understand-whether-you-need-a-hammer-or-a-toolbox-39b8b3a2e4a5" target="_blank">Flask vs Django: How to Understand Whether You Need a Hammer or a Tollbox</a></b><br></p>	\N	9	جنگو (django) و فلسک (Flask) دو فریمورک محبوب و قدرتمند  پایتونی هستند. در این مطلب از وبسایت جامعه گیک‌های کامپیوتر به مقایسه جنگو و فلسک میپردازیم و تفاوت‌های این دو فریمورک پایتون را بررسی می‌کنیم.	\N	2020-09-26 15:30:00+00	مقایسه جنگو (django) و فلسک (Flask)
16	امنیت در اینترنت اشیا	<p dir="RTL" style="text-align:right"><span style="font-family:Vazir">با توجه به کاربری اینترنت اشیا این تکنولوژی بسیار بیشتر از دیگر تکنولوژی&zwnj;های کامپیوتری با اینترنت سر و کار دارد. اکثر مواقع اینترنت با چالش&zwnj;ها و مشکلات امنیتی همراه می&zwnj;باشد در نتیجه یکی از مهمترین و چالش برانگیزترین موضوعات در <a href="http://cgeeksc.ir/event/004">اینترنت اشیا</a>، امنیت و حفظ حریم خصوصی کاربران به دلیل تهدیدهای متعدد، حملات سایبری ، خطرات و آسیب پذیری&zwnj;هاست که به طور ذاتی در اینترنت وجود دارند. در این مقاله به بررسی این چالش&zwnj;ها و تعدادی از راه حل&zwnj;های آن&zwnj;ها خواهیم پرداخت.</span></p>\r\n\r\n<p dir="RTL" style="text-align:right"><span style="font-family:Vazir">عموما مواردی که منجر به حفظ حریم خصوصی دستگاه می&zwnj;شوند شامل مواردی همچون ناکافی بودن مجوز و تأیید اعتبارها، نرم افزارهای نا امن، سیستم عامل، رابط وب و رمزگذاری ضعیف لایه حمل و نقل هستند. مسائل مربوط به امنیت و حریم خصوصی از پارامترهای بسیار مهم برای ایجاد اطمینان در سیستم&zwnj;های اینترنت اشیا با توجه به جنبه های مختلف هستند.</span></p>\r\n\r\n<blockquote>\r\n<p><a href="http://cgeeksc.ir/post/OFDM-Introduction">مدولاسیون OFDM روشی برای تخمین کانال اینترنت اشیا</a></p>\r\n</blockquote>\r\n\r\n<p dir="RTL" style="text-align:right"><span style="font-family:Vazir">در واقع مکانیزم&zwnj;های امنیتی باید در هر لایه از معماری اینترنت اشیا تعبیه شوند تا از تهدیدات و حملات امنیتی جلوگیری شود. چندین پروتکل برای اطمینان از امنیت و حریم خصوصی در سیستم های مبتنی بر اینترنت اشیا ساخته شده و به طور کارآمد در هر لایه کانال ارتباطی مستقر می&zwnj;شوند. </span></p>\r\n\r\n<h2 dir="RTL" style="text-align:right"><span style="font-family:Vazir">پروتکل&zwnj;های رمزنگاری</span></h2>\r\n\r\n<p style="text-align:right"><span style="font-family:Vazir"><strong>Secure Socket Layer (SSL)</strong> و <strong>Datagram Transport Layer Security (DTLS)</strong> از پروتکل&zwnj;های رمزنگاری هستند که بین لایه حمل و نقل و کاربرد برای ارائه راه حل&zwnj;های امنیتی در سیستم های مختلف اینترنت اشیا اجرا می شوند.</span></p>\r\n\r\n<p style="text-align:center"><img alt="iot security " src="/media/uploads/2020/09/19/image_gSubigm.png" style="height:343px; width:519px" /></p>\r\n\r\n<p dir="RTL" style="text-align:right"><span style="font-family:Vazir">با این حال، برخی از برنامه&zwnj;های اینترنت اشیا برای اطمینان از امنیت در برقراری ارتباط بین دستگاه&zwnj;های یک سیستم از اینترنت اشیا، به روش های مختلفی نیاز دارند. علاوه بر این، اگر ارتباطات با استفاده از فناوری های بی سیم در سیستم اینترنت اشیا انجام شود، در معرض خطرات امنیتی قرار می گیرد. در نتیجه روش&zwnj;های خاصی باید برای شناسایی اقدامات سو و برای بهبود سیستم استفاده شود.</span></p>\r\n\r\n<p dir="RTL" style="text-align:right"><span style="font-family:Vazir">از طرف دیگر حفظ حریم خصوصی، یکی دیگر از نگرانی&zwnj;های مهم است که به کاربران اجازه می دهد هنگام استفاده از راه حل&zwnj;های اینترنت اشیا احساس امنیت و راحتی کنند. به همین خاطر لازم است مجوز و احراز هویت از طریق یک شبکه امن برای برقراری ارتباط بین طرف&zwnj;های مورد اعتماد حفظ شود. مسئله دیگر سیاست&zwnj;های مختلف حفظ حریم خصوصی برای اشیا مختلفی است که در سیستم اینترنت اشیا با یکدیگر ارتباط برقرار می کنند.</span></p>\r\n\r\n<blockquote>\r\n<p><a href="http://cgeeksc.ir/post/Embeddedsystemsintroduction">نگاهی به سیستم&zwnj;های Embedded</a></p>\r\n</blockquote>\r\n\r\n<p dir="RTL" style="text-align:right"><span style="font-family:Vazir">بنا بر این هر شی باید قبل از انتقال داده&zwnj;ها، بتواند سیاست&zwnj;های حفظ حریم خصوصی سایر اشیا را در سیستم اینترنت اشیا تأیید کند.</span></p>\r\n\r\n<p dir="RTL" style="text-align:center"><img alt="iot security instrocture" src="/media/uploads/2020/09/19/image_nBl3ewq.png" style="height:387px; width:602px" /></p>\r\n\r\n<p dir="RTL" style="text-align:center">&nbsp;</p>	2020-09-19	images/posts/post-site_security.jpg	IotSecurity	published	4	\N		\N	3	یکی از چالش‌های اصلی هر تکنولوژی که با پلتفرم اینترنت سر و کار دارد، امنیت در اینترنت میباشد. در این مقاله بررسی ابتدایی چالش امنیتی و حفظ حریم خصوصی در اینترنت اشیا می‌پردازیم.	\N	\N	\N
18	سیستم عامل چیست؟	<p><span style="font-family:Vazir">در دنیای امروز ما همواره با سیستم عامل&zwnj;ها در ارتباط هستیم، چه وقتی که گوشی تلفن همراه خود را برمی&zwnj;داریم تا ببینیم چه کسانی پست جدیدمان را لایک کرده&zwnj;اند یا وقتی پشت کامپیوترمان می&zwnj;نشینیم تا پاسخ سوال خود را جست و جو کنیم. روز به روز شاهد گسترده&zwnj;تر شدن سیستم عامل&zwnj;ها هستیم، مثل ورود آن&zwnj;ها به عرصه ساعت&zwnj;ها و تلویزیون&zwnj;ها، چه بسا در آینده&zwnj;های نه چندان دور شاهد این باشیم که دستگاه چای&zwnj;ساز از به جوش آوردن آب امتناع کند چرا که سیستم عامل&zwnj;اش را به&zwnj;روز&zwnj;رسانی نکرده&zwnj;ایم!</span></p>\r\n\r\n<p><span style="font-family:Vazir">اما این سیستم عامل چیست و دقیقا چه کاری انجام می&zwnj;دهد؟ با این مطلب از جامعه گیک&zwnj;های کامپیوتر همراه باشید تا کمی بیشتر با سیستم عامل آشنا شویم.</span></p>\r\n\r\n<p style="text-align:center"><span style="font-family:Vazir"><img alt="چهار سیستم عامل مشهور" src="/media/uploads/2020/09/23/img_5b68e80f77e33.png" style="height:369px; width:800px" /></span></p>\r\n\r\n<p><br />\r\n<span style="font-family:Vazir">سیستم عامل بستری را فراهم می&zwnj;سازد که در آن برنامه&zwnj;ها نصب می&zwnj;شوند و از امکاناتی که سیستم عامل به آن&zwnj;ها اختصاص می&zwnj;دهد بهره می&zwnj;برند.<br />\r\nبه زبان ساده سیستم عامل&zwnj;ها <strong>رابطی بین کاربر و سخت&zwnj;افزار</strong> هستند، آن&zwnj;ها دستور را از کاربر دریافت کرده و <a href="http://cgeeksc.ir/category/hardware-articles">سخت&zwnj;افزار</a> را برای به انجام رساندن آن دستور مدیریت می&zwnj;کنند. در واقع با وجود سیستم عامل، کاربر برای استفاده از کامپیوتر نیازی به دانستن زبان کامپیوتر ندارد.</span></p>\r\n\r\n<h2><span style="font-family:Vazir"><strong>تاریخچه</strong></span></h2>\r\n\r\n<p><span style="font-family:Vazir">کامپیوترهای اولیه صرفا برای انجام یک کار مشخص طراحی و ساخته می&zwnj;شدند، مثلا برای اینکه به عنوان ماشین حساب استفاده شوند. در اوایل دهه 50 میلادی هر کامپیوتر می&zwnj;توانست در آن واحد فقط یک برنامه را اجرا کند. هر کاربر با کاغذهای سوراخ دار برنامه بر سر کامپیوتر حاضر می&zwnj;شد، کاغذ را درون کامپیوتر می&zwnj;گذاشت و کامپیوتر هم آن برنامه را تا زمانی که برنامه کامل شود و یا با مشکلی مواجه شود اجرا می&zwnj;کرد.</span></p>\r\n\r\n<p><span style="font-family:Vazir">اولین سیستم عامل&zwnj;ها در دهه 50 توسعه یافتند برای اینکه بتوانند وظایف متنوعی را به صورت متوالی انجام دهند و به این طریق روند انجام کار را سرعت ببخشند، اما سیستم عامل&zwnj;های بسیار ساده&zwnj;ای بودند که وظیفه&zwnj;ی از پیش مشخص شد&zwnj;ه&zwnj;ای را انجام می&zwnj;دادند، گروه تحقیقاتی شرکت <strong>جنرال موتورز</strong> اولین سیستم عامل را برای <strong>IBM 701</strong> پیاده&zwnj;سازی کرد. سیستم عامل&zwnj;های مدرن در اوایل دهه 60 توسعه پیدا کردند و ویژگی&zwnj;های سخت&zwnj;افزاری، امکان استفاده از کتابخانه&zwnj;ها و وقفه&zwnj;ها نیز به آن&zwnj;ها اضافه شد. سیستم عامل&zwnj;ها به شکل امروزی برای بار نخست در سال 1985 با ترکیب یک رابط کاربری گرافیکی و MS-DOS به وجود آمدند.</span></p>\r\n\r\n<p style="text-align:center"><span style="font-family:Vazir"><img alt="کامپیوترهای اولیه" src="/media/uploads/2020/09/23/edsac_19.jpg" style="height:450px; width:640px" /></span></p>\r\n\r\n<h2><span style="font-family:Vazir"><strong>فرمور (Firmware) چیست؟</strong></span></h2>\r\n\r\n<p><span style="font-family:Vazir"><strong>فرمورها</strong> گونه&zwnj;ای از برنامه&zwnj;ها هستند که کنترلی ابتدایی و اولیه را بر روی سخت&zwnj;افزاری مشخص فراهم می&zwnj;کنند. فرمورها همچنین می&zwnj;توانند برای سیستم&zwnj;های بسیار ساده به عنوان سیستم عامل مورد استفاده قرار بگیرند، برای مثال ریموت کنترل خودرو از یک فرمور بهره می&zwnj;برد که فشرده شدن دکمه&zwnj;ها را پردازش می&zwnj;کند و پیام مناسبی را به گیرنده خودرو مخابره می&zwnj;کند. اما تفاوت میان فرمور و سیستم عامل در چیست؟<br />\r\nسیستم عامل برنامه&zwnj;ای است که به عنوان یک لایه روی سخت&zwnj;افزار قرار می&zwnj;گیرد و مدیریت اولیه سیستم را فراهم می&zwnj;کند، همینطور محیطی را که برنامه&zwnj;ها در آن اجرا می&zwnj;شوند مدیریت می&zwnj;کند. برای مثال سیستم عامل این وظیفه را بر عهده دارد که در هنگام بوت شدن، کامپیوتر را تنظیم کند، سخت&zwnj;افزار را مدیریت کند و دسترسی&zwnj;های لازم به سخت&zwnj;افزار و دیگر منابع سیستم را فراهم کند. سیستم عامل&zwnj;ها عموما مانند دیگر برنامه&zwnj;ها با یک زبان برنامه نویسی سطح بالا مانند ++C&nbsp;نوشته می&zwnj;شوند و به یک کد باینری قابل اجرا کامپایل می&zwnj;شوند.</span></p>\r\n\r\n<blockquote>\r\n<p><a href="http://cgeeksc.ir/post/arch-vs-debian">مقایسه ی آرچ و دبیان</a></p>\r\n</blockquote>\r\n\r\n<p><span style="font-family:Vazir">از طرف دیگر فرمور کدی کوچک و اغلب غیرقابل تغییر است که سخت&zwnj;افزار را کنترل می&zwnj;کند. فرمورها به تولید کنندگان این امکان را می&zwnj;دهند که از چیپ&zwnj;های چند منظوره و قابل برنامه&zwnj;ریزی به جای سخت&zwnj;افزارهایی با کاربرد مشخص، استفاده کنند که در کاهش هزینه&zwnj;ها کمک بسیاری خواهد کرد. فرمور به طور سنتی مستقیما در چیپ اسمبلی قابل برنامه&zwnj;ریزی، نوشته می&zwnj;شود ولی اغلب به زبان C نوشته شده و به زبان مناسب چیپ کامپایل می&zwnj;شود. فرمور معمولا در <strong>ROM</strong> جای دارد در حالی که سیستم عامل در <a href="http://cgeeksc.ir/post/ssd-vs-hdd">حافظه دیسک سیستم (Hard Drive / SSD)</a> قرار می&zwnj;گیرد.<br />\r\nفرمورها روز به روز پیشرفته&zwnj;تر شده و قابلیت&zwnj;های بیشتری از سیستم عامل را در بر می&zwnj;گیرند، برای مثال یک دوربین SLR امروزی را در نظر بگیرید. این دوربین&zwnj;ها از فرمور استفاده می&zwnj;کنند ولی وجود امکاناتی مثل رابط کاربری و حتی برنامه&zwnj;ریزی اولیه برای امکانات اضافی، فرمورها را به قلمرو سیستم عاملها نزدیک&zwnj;تر می&zwnj;کند.</span></p>\r\n\r\n<p style="text-align:center"><span style="font-family:Vazir"><img alt="آپدیت فرمور یک دوربین" src="/media/uploads/2020/09/23/conf_ver02.jpg" style="height:333px; width:500px" /></span></p>\r\n\r\n<h3><span style="font-family:Vazir"><strong>کرنل</strong></span></h3>\r\n\r\n<p><span style="font-family:Vazir"><strong>کرنل</strong> برنامه&zwnj;ای است که بخش اصلی هر سیستم عامل را تشکیل می&zwnj;دهد و ابتدایی&zwnj;ترین سطح کنترل روی تمامی اجزا سخت&zwnj;افزاری سیستم را با کمک فرمور و درایورهای دستگاه فراهم می&zwnj;کند. در اکثر سیستم&zwnj;ها کرنل جزو اولین برنامه&zwnj;هایی است که در هنگام روشن شدن سیستم بارگذاری می&zwnj;شود (بعد از بودت&zwnj;لودر)&nbsp;و ادامه روند شروع به کار، کامپیوتر را مدیریت می&zwnj;کند. به علاوه دریافت درخواست&zwnj;های ورودی و خروجی از برنامه&zwnj;ها و ترجمه کردن آن&zwnj;ها به دستورات پردازشی برای CPU هم از وظایف کرنل است.</span></p>\r\n\r\n<p><span style="font-family:Vazir">همچنین کرنل حافظه و دستگاه&zwnj;های جانبی مثل موس، کیبورد، مانیتور، پرینتر و اسپیکرها را نیز مدیریت می&zwnj;کند. کد کرنل معمولا در فضایی جداگانه و محافظت شده در حافظه قرار می&zwnj;گیرد. کرنل وظایف خود&nbsp;مانند اجرا کردن پردازش&zwnj;ها، مدیریت دستگاه&zwnj;های سخت&zwnj;افزاری مانند هارد دیسک و مدیریت وقفه&zwnj;ها را در همین فضای محافظت شده که به آن <strong>&quot;فضای کرنل&quot;</strong> می&zwnj;گویند انجام می&zwnj;دهد. متقابلا برنامه&zwnj;های کاربردی نظیر ویرایشگرهای متن، مرورگرها یا پخش کننده&zwnj;های صوتی و تصویری از قسمت جداگانه&zwnj;ای از حافظه استفاده می&zwnj;کنند که به آن <strong>&quot;فضای کاربر&quot;</strong> می&zwnj;گویند.</span></p>\r\n\r\n<blockquote>\r\n<p><span style="font-family:Vazir">این جداسازی از دو اتفاق جلوگیری می&zwnj;کند، یکی تداخل داده&zwnj;های کاربر و داده&zwnj;های کرنل با یکدیگر و ایجاد بی&zwnj;ثباتی&nbsp;و دیگری از کار افتادن سیستم عامل در اثر خرابی برنامه&zwnj;ها.</span></p>\r\n</blockquote>\r\n\r\n<p style="text-align:center"><span style="font-family:Vazir"><img alt="کرنل" src="/media/uploads/2020/09/23/1200px-kernel_layoutsvg.png" style="height:513px; width:650px" /></span></p>\r\n\r\n<h3><span style="font-family:Vazir"><strong>اجرای برنامه</strong></span></h3>\r\n\r\n<p><span style="font-family:Vazir">سیستم عامل یک راه ارتباطی بین برنامه و سخت&zwnj;افزار فراهم می&zwnj;کند تا برنامه بتواند تنها با رعایت قوانین و روش&zwnj;هایی که برای سیستم عامل برنامه&zwnj;ریزی شده است با سخت&zwnj;افزار در ارتباط باشد. همچنین سیستم عامل مجموعه&zwnj;ای از سرویس&zwnj;ها است که توسعه و اجرای برنامه&zwnj;ها را ساده&zwnj;تر می&zwnj;کند. اجرا کردن یک برنامه شامل این مراحل است:</span></p>\r\n\r\n<ul>\r\n\t<li><span style="font-family:Vazir">ایجاد کردن یک پردازش جدید توسط کرنل که حافظه و دیگر منابع مورد نیاز را به برنامه اختصاص می&zwnj;دهد</span></li>\r\n\t<li><span style="font-family:Vazir">نسبت دادن یک اولویت در سیستمهای چند وظیفه&zwnj;ای (multi-tasking)</span></li>\r\n\t<li><span style="font-family:Vazir">بارگذاری کردن کد دودویی برنامه در حافظه</span></li>\r\n</ul>\r\n\r\n<p><span style="font-family:Vazir">و سپس آغاز اجرای برنامه که بعد از آن برنامه با کاربر و منابع سخت&zwnj;افزاری تعامل می&zwnj;کند.</span></p>\r\n\r\n<h3><span style="font-family:Vazir"><strong>مدیریت حافظه</strong></span></h3>\r\n\r\n<p><span style="font-family:Vazir">کرنل یک سیستم عامل، باید مسئولیت مدیریت کل حافظه&zwnj;ی سیستم که در اختیار برنامه&zwnj;ها است را بر عهده داشته باشد. چرا که به این شکل تضمین می&zwnj;شود که یک برنامه با حافظه&zwnj;ای که توسط برنامه دیگری در حال استفاده است تداخل ایجاد نخواهد کرد، هر برنامه باید دسترسی مستقلی به حافظه داشته باشد.<br />\r\nولی چرا باید اینطور باشد؟ در سیستم عامل&zwnj;های اولیه مدیریت حافظه به شکل امروزی نبود و حافظه به صورت شراکتی در نظر گرفته می&zwnj;شد. به این معنی که اینطور در نظر گرفته می&zwnj;شد که همه برنامه&zwnj;ها می&zwnj;توانند به صورت داوطلبانه از مدیریت کننده حافظه کرنل استفاده کنند و از حافظه مورد نیاز خود فراتر نروند. این سیستم امروزه دیگر دیده نمی&zwnj;شود، چرا که برنامه&zwnj;ها غالبا باگ&zwnj;هایی دارند که باعث می&zwnj;شود از حافظه اختصاص داده شده به آن&zwnj;ها فراتر بروند.</span></p>\r\n\r\n<p><span style="font-family:Vazir">وقتی که یک برنامه با این مدل باگ برخورد می&zwnj;کند، این موضوع باعث می&zwnj;شود که حافظه مورد استفاده یک یا چند برنامه دیگر تحت تاثیر قرار بگیرد یا به طور کل بازنویسی شود. بدافزارها یا ویروس&zwnj;ها شاید عمدا به حافظه مورد استفاده دیگر برنامه&zwnj;ها دسترسی بگیرند و کار آنها را مختل کنند و یا شاید در عملکرد سیستم عامل تاثیر منفی بگذارند. در این صورت عملکرد نادرست یک برنامه باعث بهم ریختگی کل سیستم می&zwnj;شود.</span></p>\r\n\r\n<p style="text-align:center"><span style="font-family:Vazir"><img alt="حافظه" src="/media/uploads/2020/09/23/os_memory.png" style="height:262px; width:350px" /></span></p>\r\n\r\n<p><span style="font-family:Vazir">حفاظت از حافظه به کرنل این قابلیت را می&zwnj;دهد که دسترسی به حافظه سیستم را محدود کند. روش&zwnj;های متفاوتی برای حفاظت از حافظه وجود دارند مانند <strong>تقسیم بندی حافظه (Memory Segmentation)</strong> و یا <strong>صفحه بندی (Paging)</strong> .<br />\r\nدر هر دو این روش&zwnj;ها برای CPU مشخص می&zwnj;کنند که به چه برنامه در حال اجرایی باید اجازه&zwnj;ی استفاده از چه فضایی از حافظه داده شود.<br />\r\nهرگونه تلاش برای دستیابی به دیگر آدرس&zwnj;های حافظه باعث می&zwnj;شود که CPU سریعا کرنل را در راس امر کنترل حافظه قرار دهد. به این اتفاق <strong>نقض تقسیم&zwnj;بندی می&zwnj;گویند (Seg-V)</strong> و به دلیل اینکه این اتفاق غالبا نشان از این است که برنامه&zwnj;ای به درستی رفتار نمی&zwnj;کند، کرنل معمولا برنامه را خاتمه داده و مشکل را گزارش می&zwnj;کند.</span></p>\r\n\r\n<h4><span style="font-family:Vazir"><strong>حافظه مجازی</strong></span></h4>\r\n\r\n<p><span style="font-family:Vazir">آدرس&zwnj;دهی مجازی در حافظه به این معنی است که کرنل می&zwnj;تواند انتخاب کند که در هر زمان هر برنامه از چه قسمتی از حافظه می&zwnj;تواند استفاده کند، این ویژگی به سیستم عامل این امکان را می&zwnj;دهد که از یک منطقه در حافظه برای انجام چند کار استفاده کند. اگر برنامه&zwnj;ای بخواهد از حافظه&zwnj;ای استفاده کند که در حال حاضر به آن دسترسی ندارد ولی قبلا دسترسی داشته همان اتفاقی می&zwnj;افتد که در بخش قبل شاهد آن بودیم، کرنل برنامه را خاتمه داده و مشکل را گزارش می&zwnj;دهد.</span><span style="font-family:Vazir"> تحت UNIX از این مدل وقفه&zwnj;ها به عنوان خطای صفحه (Page Fault) یاد می&zwnj;شود.</span></p>\r\n\r\n<blockquote>\r\n<p><a href="http://cgeeksc.ir/post/look-at-Manjaro">نگاهی به توزیع مانجارو (Manjaro)</a></p>\r\n</blockquote>\r\n\r\n<p><span style="font-family:Vazir">وقتی کرنل یک خطای صفحه را شناسایی کند عموما حافظه مجازی برنامه&zwnj;ای که باعث این خطا شده را تنظیم کرده و حافظه مورد نیاز برنامه را تامین می&zwnj;کند. این امر به کرنل قدرت را می&zwnj;دهد که مطلع شود حافظه یک برنامه مشخص کجا ذخیره می&zwnj;شود یا حتی اینکه آیا حافظه&zwnj;ای به برنامه اختصاص داده شده یا نه.<br />\r\nبرای اینکه یک پروسس بتواند اجرا شود باید در حافظه <strong>RAM</strong> قرار داشته باشد. حال اگر برنامه&zwnj;ای آماده اجرا شدن بود ولی فضای کافی در حافظه RAM وجود نداشت چه؟</span></p>\r\n\r\n<p><span style="font-family:Vazir">در این صورت پروسسی که در روند اجرا شدن با مشکل مواجه شده و در حال حاضر در حال اجرا شدن نیست به صورت موقتی توسط کرنل از حافظه RAM به حافظه دیسک سیستم (Hard Drive / SSD) منتقل می&zwnj;شود و از این طریق حافظه مورد نیاز برای پروسس آماده اجرا فراهم می&zwnj;شود. به این عملیات <strong>&quot;مبادله (Swapping)&quot;</strong> گفته می&zwnj;شود.</span></p>\r\n\r\n<blockquote>\r\n<p><span style="font-family:Vazir">حافظه مجازی برای برنامه&zwnj;نویس یا کاربر، حافظه&zwnj;ی RAM بسیار بیشتری نسبت به حافظه واقعی فراهم می&zwnj;کند.</span></p>\r\n</blockquote>\r\n\r\n<p style="text-align:center"><span style="font-family:Vazir"><img alt="Swapping" src="/media/uploads/2020/09/23/8_05_processswapping.jpg" style="height:425px; width:562px" /></span></p>\r\n\r\n<h4><span style="font-family:Vazir"><strong>وقفه&zwnj;ها</strong></span></h4>\r\n\r\n<p><span style="font-family:Vazir">وقفه&zwnj;ها یک بخش اساسی از سیستم عامل هستند چراکه راهی موثر برای سیستم عامل فراهم می&zwnj;کنند تا با محیط در ارتباط باشد. وقفه&zwnj;ها می&zwnj;توانند در مواجهه با رویدادهای خاص کد مشخصی را اجرا کنند و از این راه بار پردازشی را کاهش دهند. برنامه&zwnj;نویسی بر پایه وقفه&zwnj;ها توسط اکثر CPUهای مدرن پشتیبانی می&zwnj;شود.<br />\r\nوقتی که وقفه&zwnj;ای دریافت می&zwnj;شود سخت&zwnj;افزار سیستم به طور خودکار هر برنامه&zwnj;ای که در حال اجرا است را با حفظ حالت برنامه به حالت تعلیق در می&zwnj;آورد، و کد مربوط به وقفه را اجرا می&zwnj;کند، مانند وقتی که شما فیلم را متوقف می&zwnj;کنید تا تلفن را پاسخ دهید. در سیستم عامل&zwnj;های مدرن وقفه&zwnj;ها توسط کرنل سیستم عامل کنترل می&zwnj;شوند و می&zwnj;توانند از سمت سخت&zwnj;افزار یا برنامه&zwnj;ی در حال اجرا باشند.</span></p>\r\n\r\n<blockquote>\r\n<p><a href="http://cgeeksc.ir/post/Embeddedsystemsintroduction">نگاهی به سیستم&zwnj;های بلادرنگ</a></p>\r\n</blockquote>\r\n\r\n<p><span style="font-family:Vazir">وقتی که یک دستگاه سخت&zwnj;افزاری باعث به وجود آمدن وقفه&zwnj;ای شود، کرنل سیستم عامل تصمیم می&zwnj;گیرد که چگونه با آن برخورد کند و عموما کد مربوط به وقفه را اجرا می&zwnj;کند. پردازش وقفه&zwnj;های سخت&zwnj;افزار وظیفه&zwnj;ای است که معمولا به درایورهای دستگاه محول می&zwnj;شود. درایور دستگاه می&zwnj;تواند بخشی از کرنل، بخشی از برنامه&zwnj;های&nbsp;دیگر و یا هر دو باشد. درایورهای دستگاه می&zwnj;توانند با روش&zwnj;های مختلف اطلاعات را به برنامه در حال اجرا انتقال دهند.<br />\r\nهمچنین ممکن است یک برنامه وقفه&zwnj;ای ایجاد کند؛&nbsp;برای مثال اگر برنامه&zwnj;ای بخواهد به سخت&zwnj;افزاری خاص دسترسی داشته باشد یک وقفه برای کرنل به وجود می&zwnj;آورد که باعث می&zwnj;شود کنترل به کرنل بازگردد و کرنل وظیفه پردازش درخواست را به عهده داشته باشد. یا مثلا اگر برنامه&zwnj;ای به حافظه بیشتر نیاز داشته باشد با ایجاد کردن یک وقفه کرنل را از خواسته خود مطلع می&zwnj;سازد.</span></p>\r\n\r\n<p style="text-align:center"><span style="font-family:Vazir"><img alt="" src="/media/uploads/2020/09/23/exception-and-interrupt-handling-v1.png" style="height:426px; width:500px" /></span></p>\r\n\r\n<p><br />\r\n<span style="font-family:Vazir">دنیای سیستم عامل دنیایی وسیع و بسیار جالب است، در این نوشته سعی شد که دید مناسبی برای کسانی که می&zwnj;خواهند بدانند سیستم عامل چگونه کار می&zwnj;کند فراهم شود، ولی این نوشته تنها یک خلاصه از طرز کار سیستم عامل است. اگر به این زمینه علاقه دارید به شما پیشنهاد می&zwnj;کنیم که حتما درباره این موضوع تحقیقاتی انجام دهید چراکه به نتایج بسیار جالبی دست پیدا خواهید کرد.</span></p>	2020-09-23	images/posts/OS-Thumbnail.png	Operating-System	published	5	\N		\N	1	در این نوشته کمی با سیستم عامل و وظایف آن آشنا خواهیم شد و وظایف و بخش‌های مختلف سیستم عامل‌ها را بررسی خواهیم کرد.	\N	2020-09-23 15:30:00+00	سیستم عامل
21	چالش‌های امنیتی اینترنت اشیا	<p dir="RTL" style="text-align:right"><span style="font-family:Vazir">در مقاله <a href="http://cgeeksc.ir/post/IotSecurity">امنیت در اینترنت اشیا</a> به بررسی برخی <strong>چالش&zwnj;های امنیت</strong>ی در اینترنت اشیا پرداختیم و یک شمای کلی از مراحل ابتدایی <strong>حفظ امنیت</strong> و<strong> حریم خصوصی </strong>در اینترنت اشیا طرح کردیم. اما از آنجایی که حفظ امنیت در تکنولوژی&zwnj;هایی که در بستر امنیت فعالیت می&zwnj;کنند مبحثی بسیار گسترده است و نمیتوان تمام اصول و مبانی آن را در یک مقاله کوتاه پوشش داد.</span></p>\r\n\r\n<blockquote>\r\n<p dir="RTL" style="text-align:right"><span style="font-family:Vazir"><strong>در این مقاله جوانبی از ایرادات امنیتی که در یک سیستم امکان رخ دادنشان بیشتر است و امتین سیستم را مختل خواهد کرد را بررسی مینماییم.</strong></span></p>\r\n</blockquote>\r\n\r\n<h1 dir="RTL" style="text-align:right"><span style="font-family:Vazir">مسائل امنیتی و حریم خصوصی</span></h1>\r\n\r\n<p dir="RTL" style="text-align:right"><span style="font-family:Vazir">یکی از مهمترین و چالش برانگیزترین موضوعات اینترنت اشیا، امنیت و حفظ حریم خصوصی به دلیل تهدیدهای متعدد، حملات سایبری، خطرات و آسیب پذیری&zwnj;ها است. مواردی که منجر به حفظ حریم خصوصی دستگاه می&zwnj;شود، تنها مجوز و تأیید اعتبار کافی نیست، بلکه موارد دیگری مثل نرم&zwnj;افزار نا امن، سیستم عامل، رابط وب و رمزگذاری ضعیف لایه حمل و نقل و... را شامل می&zwnj;شوند.</span></p>\r\n\r\n<p dir="RTL" style="text-align:right"><span style="font-family:Vazir">مکانیسم&zwnj;های امنیتی باید در هر لایه از معماری اینترنت اشیا تعبیه شوند تا از تهدیدات و حملات امنیتی جلوگیری شود. چندین پروتکل برای اطمینان از امنیت و حریم خصوصی در سیستم&zwnj;های مبتنی بر اینترنت اشیا ساخته شده و به طور کارآمد در هر لایه از کانال&zwnj;های ارتباطی مستقر شده&zwnj;اند. <strong>(DTLS)</strong> یکی از پروتکل&zwnj;های رمزنگاری است که بین لایه حمل و نقل و برنامه برای پیاده سازی راه حل&zwnj;های امنیتی در سیستم&zwnj;های مختلف اینترنت اشیا اجرا می&zwnj;شود. با این حال، برخی از برنامه&zwnj;های اینترنت اشیا به روش&zwnj;های مختلفی برای اطمینان از امنیت در برقراری ارتباط بین دستگاه&zwnj;های اینترنت اشیا نیاز دارند.</span></p>\r\n\r\n<p dir="RTL" style="text-align:center"><span style="font-family:Vazir"><img alt="تهدیدات امنیتی در اینترنت اشیا" src="/media/uploads/2020/09/30/image_6ZtqNyx.png" style="height:391px; width:602px" /></span></p>\r\n\r\n<h1 dir="RTL" style="text-align:right"><span style="font-family:Vazir">قابلیت همکاری و مشکلات استانداردها</span></h1>\r\n\r\n<p dir="RTL" style="text-align:right"><span style="font-family:Vazir">قابلیت همکاری امکان تبادل اطلاعات در بین دستگاه&zwnj;ها و سیستم&zwnj;های مختلف اینترنت اشیا است. این تبادل اطلاعات به نرم افزار و سخت افزار مستقر متکی نیست. مسئله قابلیت همکاری به دلیل ناهمگن بودن فناوری و راه&zwnj; حل&zwnj;های مختلفی که برای توسعه اینترنت اشیا استفاده می&zwnj;شود، بوجود می&zwnj;آید. چهار سطح قابلیت همکاری فنی، معنایی، نحوی و سازمانی است. قابلیت&zwnj;های مختلفی توسط سیستم&zwnj;های اینترنت اشیا برای بهبود قابلیت همکاری فراهم می&zwnj;شود که ارتباط بین اشیا مختلف را در یک محیط ناهمگن تضمین می&zwnj;کند. علاوه بر این، امکان ادغام سیستم عامل&zwnj;های مختلف اینترنت اشیا بر اساس ویژگی&zwnj;های آنها برای ارائه راه حل&zwnj;های مختلف برای کاربران اینترنت اشیا وجود دارد.</span></p>\r\n\r\n<h1 dir="RTL" style="text-align:right"><span style="font-family:Vazir">اخلاق، قانون و حقوق نظارتی</span></h1>\r\n\r\n<p dir="RTL" style="text-align:right"><span style="font-family:Vazir">مسئله دیگر توسعه دهندگان اینترنت اشیا اخلاق، قانون و حقوق نظارتی است. قوانین و مقررات خاصی برای حفظ ارزش&zwnj;های استاندارد و اخلاقی و جلوگیری از نقض مردم توسط آنها وجود دارد. اخلاق و قانون اصطلاحات بسیار مشابهی دارند و تنها تفاوت آنها در این است که اخلاق معیارهایی است که مردم معتقدند و قوانین محدودیت&zwnj;های خاصی است که دولت تصمیم می&zwnj;گیرد. با این حال، هر دو اخلاق و قوانین برای حفظ استاندارد، کیفیت و جلوگیری از استفاده غیرقانونی از مردم طراحی شده&zwnj;اند. با توسعه اینترنت اشیا، چندین مشکل زندگی واقعی برطرف می شود اما چالش&zwnj;های مهم اخلاقی و قانونی را نیز بوجود آورده است. امنیت داده&zwnj;ها، محافظت از حریم خصوصی، اعتماد و ایمنی، قابلیت استفاده از داده&zwnj;ها برخی از این چالش&zwnj;ها هستند. همچنین مشاهده شده است که اکثر کاربران اینترنت اشیا به دلیل عدم اعتماد به دستگاه&zwnj;های اینترنت اشیا، از مقررات و مقررات دولتی در رابطه با حفاظت از داده&zwnj;ها، حریم خصوصی و ایمنی پشتیبانی می&zwnj;کنند. بنابراین، برای حفظ و ارتقا اعتماد مردم در استفاده از دستگاه&zwnj;ها و سیستمهای اینترنت اشیا، باید این موضوع مورد توجه قرار گیرد.</span></p>\r\n\r\n<p dir="RTL" style="text-align:center"><span style="font-family:Vazir"><img alt="اجزای امنیتی ایمنرنت اشیا" src="/media/uploads/2020/09/30/image_n3gkIzU.png" style="height:345px; width:602px" /></span></p>\r\n\r\n<h1 dir="RTL" style="text-align:right"><span style="font-family:Vazir">مقیاس پذیری، در دسترس بودن و قابلیت اطمینان</span></h1>\r\n\r\n<p dir="RTL" style="text-align:right"><span style="font-family:Vazir">اگر امکان افزودن خدمات، تجهیزات و دستگاه&zwnj;های جدید وجود داشته باشد بدون افت عملکرد، سیستم مقیاس پذیر است. مسئله مهم دیگری که باید مورد توجه قرار گیرد، در دسترس بودن آن است. مقیاس پذیری و در دسترس بودن هر دو باید با هم در چارچوب لایه&zwnj;ای اینترنت اشیا استفاده شوند. چالش اساسی دیگر در دسترس بودن منابع برای اشیا معتبر بدون در نظر گرفتن مکان و زمان نیاز آنها است. به دلیل استفاده از کانالهای مختلف انتقال داده یعنی ارتباطات ماهواره&zwnj;ای، ممکن است برخی از خدمات و در دسترس بودن منابع دچار وقفه شود. بنابراین، یک کانال انتقال داده مستقل و قابل اعتماد برای دسترسی بی وقفه به منابع و خدمات مورد نیاز است. بنابراین، در دسترس بودن یک نگرانی مهم است.</span></p>\r\n\r\n<h1 dir="RTL" style="text-align:right"><span style="font-family:Vazir">کیفیت خدمات(QoS)</span></h1>\r\n\r\n<p dir="RTL" style="text-align:right"><span style="font-family:Vazir">کیفیت خدمات یکی دیگر از فاکتورهای مهم اینترنت اشیا است. QoS را می&zwnj;توان معیاری برای ارزیابی کیفیت، کارایی و عملکرد دستگاه&zwnj;ها، سیستم&zwnj;ها و معماری اینترنت اشیا تعریف کرد. معیارهای مهم و مورد نیاز QoS برای کاربردهای اینترنت اشیا قابلیت اطمینان، هزینه، مصرف انرژی، امنیت، در دسترس بودن و زمان سرویس هستند. یک اکوسیستم اینترنت اشیا هوشمند باید الزامات استانداردهای QoS را برآورده کند. همچنین، برای اطمینان از قابلیت اطمینان هر سرویس و دستگاه اینترنت اشیا، ابتدا باید معیارهای QoS آن تعریف شود. بعلاوه، کاربران همچنین می&zwnj;توانند نیازها و نیازهای خود را بر این اساس مشخص کنند.</span></p>\r\n\r\n<p dir="RTL" style="text-align:center"><span style="font-family:Vazir"><img alt="لایه های معماری اینترنت اشیا" src="/media/uploads/2020/09/30/image_Hfs3zkA.png" style="height:516px; width:602px" /></span></p>	2020-09-30	images/posts/post-site.jpg	Security_issues	published	4	\N		\N	3	علاوه بر مزایایی که استفاده از از بستر اینترنت بر تکنولوژی‌های مختلف دارد مشکلات و چالش‌های مختلفی همچون چالش برقراری امنیت را نیز دارا میباشد.لذا برای طراحی سیستم‌هایی امن تر باید با این چالش‌ها آشنا باشیم.ما در این مقاله به بررسی این چالش‌ها در امنیت اینترنت اشیا پرداخته‌ایم.	\N	\N	امنیت در اینترنت اشیا
22	ماشین‌های خودران	<p dir="rtl" style="text-align:right"><strong><span style="font-family:Vazir"><span style="color:#000000">ماشین&zwnj;های خودران!</span></span></strong></p>\r\n\r\n<p dir="rtl" style="text-align:right"><span style="font-family:Vazir"><span style="color:#000000">&quot;در سال 2020 شما راننده&zwnj;ای خواهید بود که </span>دائما<span style="color:#000000">&nbsp;در صندلی عقب می&zwnj;&zwnj;نشیند!&quot;&nbsp;</span></span></p>\r\n\r\n<p dir="rtl" style="text-align:right"><span style="font-family:Vazir"><span style="color:#000000">این جمله&zwnj;ای بود که در سال 2015 روزنامه&zwnj;ی <strong>گاردین</strong> آن را چاپ کرد.</span></span></p>\r\n\r\n<p dir="rtl" style="text-align:right"><span style="font-family:Vazir"><span style="color:#000000">&quot;10&nbsp;میلیون ماشین خودران در سال 2020 در حال تردد خواهند بود.&quot;</span></span></p>\r\n\r\n<p dir="rtl" style="text-align:right"><span style="font-family:Vazir"><span style="color:#000000">&nbsp;این هم تیتر اول&nbsp;<strong>Business Insider</strong>&nbsp;بود که کلی خبرساز شد.</span></span></p>\r\n\r\n<p dir="rtl" style="text-align:right"><span style="font-family:Vazir"><span style="color:#000000">اما این خبرها از کجا می&zwnj;آمدند؟ </span></span></p>\r\n\r\n<p dir="rtl" style="text-align:right"><span style="font-family:Vazir"><span style="color:#000000">پاسخ&nbsp;این است:&nbsp; از کمپانی&zwnj;های سازنده&zwnj;ی ماشین&zwnj;های خودران مثل </span>&nbsp;General Motors ،Google&rsquo;s Waymo ،Toyota&nbsp;و&nbsp;Honda<span style="color:#000000">&nbsp;که تصور می&zwnj;کردند&nbsp;تا سال 2020 به این هدف دست پیدا خواهند کرد.جالب اینجاست که&nbsp;آقای ایلان ماسک&nbsp;پیش&zwnj;بینی کرده بود تسلا تا سال 2018 ماشین خودران بسیار دقیقی خواهد ساخت.</span></span></p>\r\n\r\n<p dir="rtl" style="text-align:right"><span style="font-family:Vazir"><span style="color:#000000">اما زهی خیال باطل! الان در اواخر سال 2020 هستیم و خبری از ماشین&zwnj;های تمام اتوماتیک در سطح شهرها نیست!</span></span></p>\r\n\r\n<p dir="rtl" style="text-align:right"><span style="font-family:Vazir"><span style="color:#000000">اگر می&zwnj;خواهید با ماشین های خودران آشنا شوید و سر از کارشان در بیاورید&nbsp;با این مطلب از جامعه&zwnj;ی گیک&zwnj;های کامپیوتر همراه باشید.</span></span></p>\r\n\r\n<p dir="rtl" style="text-align:center"><span style="font-family:Vazir"><span style="color:#000000"><img alt="ماشین تمام اتوماتیک" src="/media/uploads/2020/10/03/yokdzm.jpg" style="height:494px; width:800px" /></span></span></p>\r\n\r\n<h2 dir="rtl" style="text-align:right">&nbsp;</h2>\r\n\r\n<h2 dir="rtl" style="text-align:right"><span style="font-family:Vazir"><strong><span style="color:#000000">ماشین&zwnj;های خودران چه هستند؟</span></strong></span></h2>\r\n\r\n<p dir="rtl" style="text-align:right"><span style="font-family:Vazir"><span style="color:#000000">ماشین خودران وسیله&zwnj;&zwnj;ی نقلیه&zwnj;ای است که به راننده&zwnj;&zwnj;ی انسان برای هدایت ماشین و کار با پدال ها نیازی ندارد. این تکنولوژی هم&zwnj;اکنون موجود است اما در حال حاضر&nbsp;ماشین خودران تمام اتوماتیک در سطح شهرها و جاده&zwnj;ها وجود ندارد. کمپانی تسلا در بعضی از شرایط محیطی خاص به این هدف بسیار نزدیک شده است اما همچنان به راننده&zwnj;ای احتیاج دارد که حواسش به عملکرد ماشین باشد.</span></span></p>\r\n\r\n<p dir="rtl" style="text-align:right"><span style="font-family:Vazir"><span style="color:#000000">جامعه&zwnj;ی مهندسان خودکارسازی یا </span><span style="color:#34393f"><span style="background-color:#ffffff"><strong>The Society of Automotive Engineers</strong> و یا به اختصار <strong>SAE</strong></span></span><span style="color:#000000">&nbsp;پنج سطح برای دسته بندی وسایل نقلیه ی خودکار&nbsp; تعریف کرده اند.</span></span></p>\r\n\r\n<p dir="rtl" style="text-align:right"><span style="font-family:Vazir"><span style="color:#000000">گفتنی است بسیاری از خودروهای موجود در سطح شهرها متعلق به سطح دوم هستند (البته نه در ایران)، اما نمونه&zwnj;های خودروهای سطح پنجم در حال آزمایش می&zwnj;باشند و پیش&zwnj;بینی متخصصان صنعت این است که خودروهای سطح چهارم از دهه&zwnj;ی جاری می&zwnj;توانند به دنیا و سطح شهرها قدم بگذارند.</span></span></p>\r\n\r\n<blockquote>\r\n<p><a href="http://cgeeksc.ir/post/introduction-to-reinforcement-learning">یادگیری تقویتی چیست؟</a></p>\r\n</blockquote>\r\n\r\n<h2 dir="rtl" style="text-align:right"><span style="font-family:Vazir"><strong><span style="color:#000000">سطوح وسایل نقلیه ی خودکار (طبق تعریف SAE ):</span></strong></span></h2>\r\n\r\n<p dir="rtl">&nbsp;</p>\r\n\r\n<h4 dir="rtl" style="text-align:right"><span style="font-family:Vazir"><strong><span style="color:#000000">سطح اول: دستیار راننده</span></strong></span></h4>\r\n\r\n<p dir="rtl" style="text-align:right">تکنولوژی موجود در این وسیله نقلیه طوری است که می&zwnj;تواند در کارهای ساده&zwnj;ای مانند شتاب و ترمز به راننده کمک کند. امروزه بیشتر وسایل نقلیه موجود در جاده ها در این گروه قرار می&zwnj;گیرند.</p>\r\n\r\n<h4 dir="rtl" style="text-align:right"><strong>سطح دوم: جزئی خودکار</strong></h4>\r\n\r\n<p dir="rtl" style="text-align:right">به این معناست که ماشین می&zwnj;تواند دو کار یا بیشتر را بطور خودکار انجام دهد. مانند سیستم cruise control و ترمز اتوماتیک که می&zwnj;توانند بطور همزمان کار کنند. اتومبیل های سطح دوم بطور کامل به دخالت و توجه یک راننده احتیاج دارند.</p>\r\n\r\n<h4 dir="rtl" style="text-align:right"><strong>سطح سوم: خودکار شرطی</strong></h4>\r\n\r\n<p dir="rtl" style="text-align:right"><span style="font-family:Vazir"><span style="color:#000000">این نوع وسایل نقلیه می&zwnj;توانند در یک&zwnj;سری از شرایط محیطی معین بصورت خودکار عملیات&zwnj;های مختلف رانندگی را انجام دهند ولی همچنان به یک راننده احتیاج دارند که حواسش به اوضاع باشد و در صورت لزوم واکنش صحیحی از خود نشان دهد.</span></span></p>\r\n\r\n<h4 dir="rtl" style="text-align:right"><span style="font-family:Vazir"><strong><span style="color:#000000">سطح چهارم: خودکار سطح بالا</span></strong></span></h4>\r\n\r\n<p dir="rtl" style="text-align:right"><span style="font-family:Vazir"><span style="color:#000000">این وسیله&zwnj;ی نقلیه می&zwnj;تواند خود را براند ولی در یک&zwnj;سری سناریوی معین به یک عامل انسان احتیاج دارد.</span></span></p>\r\n\r\n<h4 dir="rtl" style="text-align:right"><span style="font-family:Vazir"><strong><span style="color:#000000">سطح پنجم: تماما خودکار</span></strong></span></h4>\r\n\r\n<p dir="rtl" style="text-align:right"><span style="font-family:Vazir"><span style="color:#000000">این نوع وسیله&zwnj;ی نقلیه در تمام شرایط و در تمام سناریوها میتواند بصورت کاملا خودکار خودش را براند.</span></span></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p dir="rtl" style="text-align:right"><span style="font-family:Vazir"><span style="color:#000000">یکی از سوال&zwnj;های اصلی که ممکن است برایتان پیش بیاید این است که: </span></span></p>\r\n\r\n<h2 dir="rtl" style="text-align:right"><span style="font-family:Vazir"><strong><span style="color:#000000">ماشین&zwnj;های خودکار چگونه می&zwnj;بینند؟</span></strong></span></h2>\r\n\r\n<p dir="rtl" style="text-align:right"><span style="font-family:Vazir"><span style="color:#000000">برای یک رانندگی ایمن، ماشین&zwnj;های خودکار باید توانایی درک اشیای دور و اطراف خود را داشته باشند، مثل سایر وسایل نقلیه، عابران پیاده، خطوط خیابان&zwnj;ها و جاده&zwnj;ها و هر چیز دیگری را که رانندگان انسان در هنگام شتاب&zwnj;گیری، ترمزگیری و هدایت ماشین در نظر می&zwnj;گیرند.</span></span></p>\r\n\r\n<p dir="rtl" style="text-align:right"><span style="font-family:Vazir"><span style="color:#000000">ماشین های خودران عمدتا از ترکیبی از ۳ تکنولوژی حسگر و تصویر استفاده می&zwnj;کنند: <strong>رادار</strong>، <strong>لیدار</strong> و <strong>دوربین</strong>.</span></span></p>\r\n\r\n<p dir="rtl" style="text-align:right">&nbsp;</p>\r\n\r\n<p dir="rtl" style="text-align:center"><span style="font-family:Vazir"><img alt="تشخیص اشیا" src="/media/uploads/2020/10/03/i1.png" style="height:1115px; width:800px" /></span></p>\r\n\r\n<p dir="rtl" style="text-align:right">&nbsp;</p>\r\n\r\n<p dir="rtl" style="text-align:right"><span style="font-size:22px"><strong><span style="font-family:Vazir"><span style="color:#000000">رادار:</span></span></strong></span></p>\r\n\r\n<p dir="rtl" style="text-align:right"><span style="font-family:Vazir"><strong>Radio Detection and Ranging</strong>&nbsp;یا به اختصار&nbsp; <strong>RADAR</strong><span style="color:#000000">&nbsp;مدت مدیدی است که در خودروها مورد استفاده قرار می&zwnj;گیرد و تکنولوژی&zwnj;ای است که بطور معمول در سیستم&zwnj;های criuse control و ترمز اتوماتیک ضروری به کار می&zwnj;رود. رادار با ارسال امواج رادیویی کار می&zwnj;کند.</span></span></p>\r\n\r\n<p dir="rtl" style="text-align:right"><strong><span style="font-family:Vazir"><span style="color:#000000">نقاط قوت رادار:</span></span></strong></p>\r\n\r\n<p dir="rtl" style="text-align:right"><span style="font-family:Vazir"><span style="color:#000000">رادار میتواند اشیا را از صدها متر&nbsp; آنطرف&zwnj;تر ببیند و سرعت و اندازه ی آنها را تشخیص دهد.</span></span></p>\r\n\r\n<p dir="rtl" style="text-align:right"><strong><span style="font-family:Vazir"><span style="color:#000000">محدودیت رادارها:</span></span></strong></p>\r\n\r\n<p dir="rtl" style="text-align:right"><span style="font-family:Vazir"><span style="color:#000000">رادار نمی&zwnj;تواند جزئیات را ببیند و تصاویر را با وضوح&nbsp;بسیار کمی&nbsp;تفسیر می&zwnj;کند. به این معنا که رادار نمی&zwnj;تواند <strong>هویت</strong> یک شی را تشخیص دهد.</span></span></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p dir="rtl" style="text-align:right"><span style="font-size:22px"><strong><span style="font-family:Vazir"><span style="color:#000000">لیدار:</span></span></strong></span></p>\r\n\r\n<p dir="rtl" style="text-align:right"><span style="font-family:Vazir"><span style="color:#34393f"><span style="background-color:#ffffff"><strong>Light Imaging Detection and Ranging</strong> یا <strong>LIDAR</strong></span></span><span style="color:#000000"> از پالس های لیزر برای اسکن کردن محیط استفاده می&zwnj;کند.</span></span></p>\r\n\r\n<p dir="rtl" style="text-align:right"><span style="font-family:Vazir"><span style="color:#000000">لیدار با شلیک میلیون&zwnj;ها سیگنال لیزری در ثانیه کار می&zwnj;کند و سیگنال&zwnj;ها با برخورد به سطح اشیا به گیرنده&zwnj;ای که لیدار دارد بازمی&zwnj;گردند و به این ترتیب&nbsp;یک مدل سه بعدی از محیط اطراف ماشین می&zwnj;سازد.</span></span></p>\r\n\r\n<p dir="rtl" style="text-align:right">&nbsp;</p>\r\n\r\n<p dir="rtl" style="text-align:center"><span style="font-family:Vazir"><span style="color:#000000"><img alt="لیدار" src="/media/uploads/2020/10/03/i2.png" style="height:737px; width:800px" /></span></span></p>\r\n\r\n<p dir="rtl" style="text-align:center">&nbsp;</p>\r\n\r\n<p dir="rtl" style="text-align:right"><strong><span style="font-family:Vazir"><span style="color:#000000">نقاط قوت لیدارها:</span></span></strong></p>\r\n\r\n<p dir="rtl" style="text-align:right"><span style="font-family:Vazir"><span style="color:#000000">لیدار توانایی دیدن اشیا را با وضوح بالاتر نسبت به رادارها دارد. که به کمک&nbsp;این قابلیت می&zwnj;تواند درک کند که یک عابر دارد می&zwnj;رود یا دارد برمی&zwnj;گردد و یا یک وسیله&zwnj;ی نقلیه&zwnj;ای که دو چرخ دارد یک دوچرخه است و یا یک موتورسیکلت. که به ماشین این اجازه را می&zwnj;دهد تا رفتار هریک از اشیا خاص را بهتر پیش&zwnj;بینی کند.</span></span></p>\r\n\r\n<p dir="rtl" style="text-align:right"><strong><span style="font-family:Vazir"><span style="color:#000000">محدودیت&zwnj;های لیدار:</span></span></strong></p>\r\n\r\n<p dir="rtl" style="text-align:right"><span style="font-family:Vazir"><span style="color:#000000">در حال حاضر، لیدارها یکی از گرانترین سنسورها برای سازندگان ماشین&zwnj;ها هستند.</span></span></p>\r\n\r\n<p dir="rtl" style="text-align:right"><span style="font-family:Vazir"><span style="color:#000000">لیدارها در بعضی شرایط آب و هوایی نیز محدودیت&zwnj;هایی دارند. مثلا در مه و گرد و غبار کار نمی&zwnj;کنند و این باعث می&zwnj;شود وسایل نقلیه&zwnj;ای که از این تکنولوژی استفاده می&zwnj;کنند از یک سنسور ثانویه نیز بهره ببرند.</span></span></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p dir="rtl" style="text-align:right"><span style="font-size:22px"><strong><span style="font-family:Vazir"><span style="color:#000000">دوربین&zwnj;:</span></span></strong></span></p>\r\n\r\n<p dir="rtl" style="text-align:right"><span style="font-family:Vazir"><span style="color:#000000">ماشین&zwnj;های خودران از دوربین&zwnj;ها برای دیدن با وضوح بالاتر استفاده می&zwnj;کنند.</span></span></p>\r\n\r\n<p dir="rtl" style="text-align:right"><span style="font-family:Vazir"><span style="color:#000000">از دوربین&zwnj;ها برای خواندن علایم و نشانه&zwnj;های جاده&zwnj;ها و خیابان&zwnj;ها&nbsp;استفاده&nbsp;می&zwnj;شود. لنزهای گوناگونی دور تا دور ماشین تعبیه شده&zwnj;اند که زاویه&zwnj;ی دید گسترده&zwnj;ای از محیط نزدیک اطراف ماشین مهیا&nbsp;می&zwnj;کند.</span></span></p>\r\n\r\n<p dir="rtl" style="text-align:right"><strong><span style="font-family:Vazir"><span style="color:#000000">نقاط قوت دوربین&zwnj;ها:</span></span></strong></p>\r\n\r\n<p dir="rtl" style="text-align:right"><span style="font-family:Vazir"><span style="color:#000000">دوربین&zwnj;ها بهترین راه برای گرفتن یک دید دقیق از محیط اطراف ماشین هستند و تصاویری با بالاترین وضوح ارائه می&zwnj;دهند.</span></span></p>\r\n\r\n<p dir="rtl" style="text-align:right"><strong><span style="font-family:Vazir"><span style="color:#000000">محدودیت&zwnj;های دوربین&zwnj;ها:</span></span></strong></p>\r\n\r\n<p dir="rtl" style="text-align:right"><span style="font-family:Vazir"><span style="color:#000000">دوربین&zwnj;ها نیز در بعضی از شرایط آب و هوایی نمی&zwnj;توانند به درستی کار کنند و برخلاف رادارها و لیدارها که داده&zwnj;های عددی ارائه می&zwnj;کنند،&nbsp;دوربین برای تشخیص فاصله یک شی نیازمند این است که&nbsp; یک&zwnj;سری پردازش روی&nbsp;تصویر&nbsp;توسط کامپیوتر خودرو انجام شود.</span></span></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2 dir="rtl" style="text-align:right"><span style="font-family:Vazir"><strong><span style="color:#000000">ماشین&zwnj;های خودران چگونه کار می&zwnj;کنند؟</span></strong></span></h2>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h3 dir="rtl" style="text-align:right"><span style="font-family:Vazir"><strong><span style="color:#000000">ساخت نقشه:</span></strong></span></h3>\r\n\r\n<p dir="rtl" style="text-align:right"><span style="font-family:Vazir"><span style="color:#000000">یک وسیله&zwnj;ی نقلیه&zwnj;ی بدون راننده باید یک نقشه از اطراف خود بسازد و مشخص کند در کجای این نقشه قرار دارد تا محیط و وضعیت خودش را درک کند. معمولا لیدارها و دوربین&zwnj;ها برای اسکن کردن محیط اطراف بکار می&zwnj;روند و بعد از آن کامپیوتر خودرو ورودی&zwnj;های سنسورهای GPS و IMU را برای ساختن نقشه جمع می&zwnj;کند.</span></span></p>\r\n\r\n<h3 dir="rtl" style="text-align:right"><span style="font-family:Vazir"><strong><span style="color:#000000">نقشه ی مسیر:</span></strong></span></h3>\r\n\r\n<p dir="rtl" style="text-align:right"><span style="font-family:Vazir"><span style="color:#000000">نقشه&zwnj;ی مسیر برای پیدا کردن امن&zwnj;ترین و سریع&zwnj;ترین راه برای رسیدن به مقصد می&zwnj;باشد. یک ماشین&nbsp;بدون راننده باید موانع ثابت و متحرک و مانورهایی مانند تغییر مسیر و عبور سایر وسایل نقلیه را در نظر بگیرد. برنامه&zwnj;ریزی مسیر با یک برنامه دوربرد آغاز می&zwnj;شود ، چیزی شبیه به جهاتی که در حال حاضر هنگام وارد کردن آدرس به برنامه نقشه دریافت می&zwnj;کنیم. سپس ، برنامه&zwnj;هایی با برد کوتاه تولید شده و به طور مداوم و در هنگام حرکت ماشین، به&zwnj;روز می&zwnj;شوند.</span></span></p>\r\n\r\n<h3 dir="rtl" style="text-align:right"><strong><span style="font-family:Vazir">جلوگیری از برخورد با موانع:</span></strong></h3>\r\n\r\n<p dir="rtl" style="text-align:right"><span style="font-family:Vazir">بخشی از نقشه&zwnj;برداری و برنامه&zwnj;ریزی مسیر شامل پرهیز از موانع ثابت و متحرک، مانند عابران پیاده است. از آنجا که اتومبیل&zwnj;های بدون راننده به طور مداوم نقشه&zwnj;های اطراف خود را ترسیم می&zwnj;کنند، همه موانع قابل مشاهده و پیش&zwnj;بینی شده را شامل می شوند و برای تعیین هویت اشیا از یادگیری ماشین استفاده می&zwnj;کنند. و کامپیوتر می&zwnj;تواند رفتار آن&zwnj;ها را پیش&zwnj;بینی کند. به عنوان مثال، کامپیوتر اتومبیل خودران می&zwnj;تواند یک موتور&zwnj;سیکلت را از دوچرخه متمایز کرده و بر این اساس تصمیم بگیرد که چه رفتاری انجام دهد.</span></p>\r\n\r\n<p><span style="font-family:Vazir">از آنجا که بعضی از موانع از دید سنسورها پنهان هستند و بنابراین توسط آن حسگرها قابل بررسی نیستند، اتومبیل های خودران در حالت ایده&zwnj;آل از طریق اتصال بی سیم با یکدیگر بطور مداوم در ارتباط خواهند بود. هنگامی که یک اتومبیل با مانعی روبرو می&zwnj;شود ، می&zwnj;تواند بلافاصله به اتومبیل&zwnj;های دیگر هشدار دهد ، و آنها می&zwnj;توانند مسیر خود را تنظیم کنند.</span></p>\r\n\r\n<p dir="rtl" style="text-align:right">&nbsp;</p>\r\n\r\n<p style="text-align:center"><span style="font-family:Vazir"><img alt="نقشه‌ی ماشین خودران" src="/media/uploads/2020/10/03/i3.png" style="height:447px; width:800px" /></span></p>\r\n\r\n<h3 dir="rtl" style="text-align:right">&nbsp;</h3>\r\n\r\n<h2 dir="rtl" style="text-align:right"><strong>مزایایی که احتمال می&zwnj;رود ماشین&zwnj;های خودران داشته باشند:</strong></h2>\r\n\r\n<p dir="rtl">&nbsp;</p>\r\n\r\n<p><strong>بهبود ایمنی:</strong> بیشتر تصادفات اتومبیل ناشی از خطاهای انسانی است. اگر ماشین&zwnj;های خودران به خوبی ساخته شوند و با دقت بسیار بالا ساخته شوند ، می توان از حوادث به شدت کاسته و جان افراد را نجات داد.</p>\r\n\r\n<p>(سال 2018، اولین باری بود که یک ماشین خودران با یک عابر برخورد کرد و متاسفانه باعث مرگ وی شد.)</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>کاهش انتشار کربن:</strong> احتمالاً بسیاری از اتومبیل های خودران با انرژی الکتریکی کار می&zwnj;کنند. تا زمانی که باتری ها با انرژی پاک شارژ می&zwnj;شوند ، انتشار کربن به شدت کاهش می&zwnj;یابد. همانطور که گفتیم ماشین&zwnj;های خودران قادر به برقراری ارتباط با یکدیگر خواهند بود، در نتیجه می&zwnj;توانند عملکرد خود را در حرکتشان بهبود ببخشند و درک بهتری از آنچه خواهند دید داشته باشند و همین باعث می&zwnj;شود ترمزگیری و شتاب&zwnj;گیری مکرر که باعث صرف انرژی زیاد می شوند ، از بین ببرند.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p dir="rtl" style="text-align:right"><strong>استقلال:</strong> بیشتر برای افراد معلول و سالمندان: ماشین&zwnj;های خودران به افرادی که توانایی رانندگی ندارند توانایی سفر مستقل را می&zwnj;بخشند.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>افزایش بهره&zwnj;وری:</strong> افراد با رفت و آمد طولانی مدت مجبور نیستند ساعت&zwnj;ها از روزهای خود را صرف رانندگی در جاده&zwnj;ها کنند. اتومبیل های خودران به همه مسافران اجازه می&zwnj;دهد تا از زمان رفت و آمد خود برای کار یا تفریح&nbsp;استفاده کنند.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p dir="rtl" style="text-align:right"><strong>پارکینگ خودکار:</strong> ماشین&zwnj;های خودران می&zwnj;توانند دردسرهای پارک کردن را از بین ببرند و مسافران را جایی که میخواهند پیاده کنند و خودشان به دنبال جای پارک بروند.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>کاهش تعداد جریمه های سرعت زیاد:</strong> ماشین&zwnj;های خودران را می&zwnj;توان طوری برنامه&zwnj;ریزی کرد که با سرعتی دقیق و مجاز حرکت کنند و تعداد جریمه&zwnj;های دریافتی ناشی از سرعت غیرمجاز را به حداقل رسانند.</p>\r\n\r\n<p dir="rtl">&nbsp;</p>\r\n\r\n<p dir="rtl">و در آخر پیشنهاد می&zwnj;شود گیف پایین را حتما مشاهده کنید.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p style="text-align:center"><img alt="سنسورهای ماشین خودران" src="https://doubxab0r1mke.cloudfront.net/media/zfront/production/original_images/_how-driverless-cars-work.GIF.1a-min.gif" style="height:2700px; width:528px" /></p>	2020-10-03	images/posts/SDc.png	self-driving-cars	published	3	\N	<p><span style="font-size: 1rem;"><a href="https://www.thezebra.com/stories/how-do-self-driving-cars-work" target="_blank">How do self-driving cars work</a></span><br></p>	\N	16	در این مطلب از جامعه‌ی گیک‌های کامپیوتر به ماشین‌های خودران می‌پردازیم و نحوه‌ی عملکرد آن‌ها را بررسی می‌کنیم.	\N	\N	ماشین خودران
29	نگاهی به Agile و Waterfall	<p dir="rtl" style="text-align:right"><span style="font-size:18px"><span style="font-family:Arial"><span style="font-family:IRANSansWeb Light">موفقیت یک پروژه توسعه نرم &zwnj;افزار تا حد زیادی وابسته به روش توسعه&zwnj;ای است که برای آن&nbsp;انتخاب می&zwnj;شود</span></span><span style="font-family:IRANSansWeb Light,serif">. دو متدولوژی&nbsp;Agile </span><span style="font-family:Arial"><span style="font-family:IRANSansWeb Light">و </span></span><span style="font-family:IRANSansWeb Light,serif">Waterfall در حال حاضر از محبوب&zwnj;&zwnj;ترین</span><span style="font-family:Arial"><span style="font-family:IRANSansWeb Light">&nbsp;روش&zwnj;های </span></span><span style="font-family:IRANSansWeb Light,serif">SDLC هستند،</span><span style="font-family:IRANSansWeb Light,serif">&nbsp;</span><span style="font-family:Arial"><span style="font-family:IRANSansWeb Light">از همین&zwnj;رو تیم توسعه&zwnj;دهنده همواره با این سؤال مواجه هستند</span></span><span style="font-family:IRANSansWeb Light,serif">: </span><span style="font-family:Arial"><span style="font-family:IRANSansWeb Light">کدام&zwnj;یک را باید انتخاب کرد؟</span></span></span></p>\r\n\r\n<p dir="rtl" style="text-align:right"><span style="font-size:18px"><span style="font-family:&quot;IRANSansWeb Light&quot;">اگر علاقه دارید در مورد این دو متدولوژی توسعه&zwnj;ی نرم&zwnj;افزار بیشتر بدانید، با ما همراه باشید.</span></span></p>\r\n\r\n<p dir="rtl" style="text-align:right"><span style="font-size:18px"><span style="font-family:&quot;IRANSansWeb Light&quot;">مناسب می&zwnj;دانم در ابتدای امر توضیح مختصری درباره&zwnj;ی SDLC بدهم:</span></span></p>\r\n\r\n<p dir="rtl" style="text-align:right"><span style="font-size:18px"><span style="font-family:&quot;IRANSansWeb Light&quot;"><strong>SDLC</strong> که اختصاریافته&zwnj;ی <strong>Software Development Life Cycle</strong> و به فارسی&nbsp;چرخه&zwnj;ی زندگی توسعه&zwnj;ی نرم&zwnj; افزار است همانطور که از نامش پیداست دنباله&zwnj;ای از کارهایی است که برای تولید یک نرم&zwnj; افزار انجام می&zwnj;شوند.</span></span></p>\r\n\r\n<p dir="rtl" style="text-align:center"><span style="font-size:18px"><img alt="مراحل توسعه‌ی نرم افزار" src="/media/uploads/2020/10/21/1.jpg" style="height:401px; width:800px" /></span></p>\r\n\r\n<p dir="rtl" style="text-align:right"><span style="font-size:18px"><span style="font-family:Arial"><span style="font-family:IRANSansWeb Light">هر دو متد&nbsp;</span></span><span style="font-family:IRANSansWeb Light,serif">Agile </span><span style="font-family:Arial"><span style="font-family:IRANSansWeb Light">و </span></span><span style="font-family:IRANSansWeb Light,serif">Waterfall </span><span style="font-family:Arial"><span style="font-family:IRANSansWeb Light">روش&zwnj;های کاملی برای توسعه نرم &zwnj;افزار هستند</span></span><span style="font-family:IRANSansWeb Light,serif">. اما با وجود شباهت&zwnj;هایی که دارند، تفاوت&zwnj;هایی نیز دارند</span><span style="font-family:Arial"><span style="font-family:IRANSansWeb Light">&nbsp;که باید هنگام انتخاب هرکدام به آن&zwnj;ها توجه کرد.</span></span></span></p>\r\n\r\n<p dir="rtl" style="text-align:right"><span style="font-size:18px"><span style="font-family:&quot;IRANSansWeb Light&quot;">خب، بیایید با یک&zwnj;سری توضیح درباره&zwnj;ی هرکدام کار را شروع کنیم.</span></span></p>\r\n\r\n<h2 dir="rtl" style="text-align:right"><span style="font-size:20px"><span style="font-family:IRANSansWeb Medium,serif"><strong>Agile</strong></span></span></h2>\r\n\r\n<p dir="rtl" style="text-align:right"><span style="font-size:18px"><span style="font-family:Arial"><span style="font-family:IRANSansWeb Light">روش </span></span><span style="font-family:IRANSansWeb Light,serif"><strong>Agile</strong> یا <strong>چابک</strong>&nbsp;</span><span style="font-family:Arial"><span style="font-family:IRANSansWeb Light">برای توسعه نرم&zwnj;افزار روی <strong>تکرارهای پیوسته</strong>&nbsp;و <strong>تست کردن</strong> طی فرایند کلی توسعه نرم&zwnj;افزار تمرکز دارد</span></span><span style="font-family:IRANSansWeb Light,serif">.</span><span style="font-family:Arial"><span style="font-family:IRANSansWeb Light">&nbsp;این مدل </span></span><span style="font-family:IRANSansWeb Light,serif">SDLC </span><span style="font-family:Arial"><span style="font-family:IRANSansWeb Light">تعامل میان&nbsp;مشتریان(کارفرمایان)، توسعه&zwnj;دهندگان&nbsp;و آزمایش&zwnj;کنندگان&nbsp;را افزایش داده&nbsp;است</span></span><span style="font-family:IRANSansWeb Light,serif">.</span></span></p>\r\n\r\n<p dir="rtl" style="text-align:right"><span style="font-size:18px"><span style="font-family:Arial"><span style="font-family:IRANSansWeb Light">پاییز سال </span></span><span style="font-family:IRANSansWeb Light,serif">2000 بود که</span><span style="font-family:Arial"><span style="font-family:IRANSansWeb Light">&nbsp;جناب آقای&nbsp;</span></span><span style="font-family:IRANSansWeb Light,serif">Scott Ambler </span><span style="font-family:Arial"><span style="font-family:IRANSansWeb Light">شروع به توسعه روش </span></span><span style="font-family:IRANSansWeb Light,serif">Agile </span><span style="font-family:Arial"><span style="font-family:IRANSansWeb Light">کرد</span></span><span style="font-family:IRANSansWeb Light,serif">. البته آن اوایل نامش Agile نبود و با نام&nbsp;</span><span style="font-family:Arial"><span style="font-family:IRANSansWeb Light">&nbsp;</span></span><span style="font-family:IRANSansWeb Light,serif">Extreme Modelling و به اختصار XM&nbsp;</span><span style="font-family:Arial"><span style="font-family:IRANSansWeb Light">معرفی&nbsp;شد اما بعدها به پیشنهاد آقای&nbsp;</span></span><span style="font-family:IRANSansWeb Light,serif">Robert Cecil Martin </span><span style="font-family:Arial"><span style="font-family:IRANSansWeb Light">نام آن به </span></span><span style="font-family:IRANSansWeb Light,serif">Agile Modelling </span><span style="font-family:Arial"><span style="font-family:IRANSansWeb Light">تغییر یافت</span></span><span style="font-family:IRANSansWeb Light,serif">.</span></span></p>\r\n\r\n<p dir="rtl" style="text-align:right">&nbsp;</p>\r\n\r\n<p dir="rtl" style="text-align:center"><span style="font-size:18px"><img alt="روش Agile یا چابک" src="/media/uploads/2020/10/21/2_nYZAUFk.jpg" style="height:419px; width:650px" /></span></p>\r\n\r\n<p dir="rtl" style="text-align:right">&nbsp;</p>\r\n\r\n<p dir="rtl" style="text-align:right"><span style="font-size:18px"><span style="font-family:Arial"><span style="font-family:IRANSansWeb Light">روش </span></span><span style="font-family:IRANSansWeb Light,serif">Agile</span><span style="font-family:Arial"><span style="font-family:IRANSansWeb Light">&nbsp;متدی است که به&nbsp;برای توسعه نرم&zwnj;افزار به یک تیم احتیاج دارد</span></span><span style="font-family:IRANSansWeb Light,serif">. </span><span style="font-family:Arial"><span style="font-family:IRANSansWeb Light">این روش؛ یکی از انواع&nbsp;<u>مدل توسعه سریع برنامه کاربردی </u></span></span><span style="font-family:IRANSansWeb Light,serif"><u>(RAD)</u> </span><span style="font-family:Arial"><span style="font-family:IRANSansWeb Light">است</span></span><span style="font-family:IRANSansWeb Light,serif">. </span><span style="font-family:Arial"><span style="font-family:IRANSansWeb Light">اگرچه روش جدیدی نیست، اما در مقایسه با مدل قدیمی </span></span><span style="font-family:IRANSansWeb Light,serif">Waterfall </span><span style="font-family:Arial"><span style="font-family:IRANSansWeb Light">نسبتاً جدیدتر است</span></span><span style="font-family:IRANSansWeb Light,serif">.</span></span></p>\r\n\r\n<p dir="rtl" style="text-align:right"><span style="font-size:18px"><span style="font-family:Arial"><span style="font-family:IRANSansWeb Light">در این روش، به&zwnj;جای ایجاد برنامه&zwnj;ی زمانی&nbsp;و وظایفی که باید انجام شوند،&nbsp;کل زمان موجود برای یک پروژه</span></span><span style="font-family:IRANSansWeb Light,serif">&nbsp;</span><span style="font-family:Arial"><span style="font-family:IRANSansWeb Light">به فازهایی به نام </span></span><span style="font-family:IRANSansWeb Light,serif"><strong>sprint</strong>&nbsp;</span><span style="font-family:Arial"><span style="font-family:IRANSansWeb Light">تقسیم می&zwnj;شود</span></span><span style="font-family:IRANSansWeb Light,serif">.</span></span></p>\r\n\r\n<p dir="rtl" style="text-align:right"><span style="font-size:18px"><span style="font-family:Arial"><span style="font-family:IRANSansWeb Light">هر </span></span><span style="font-family:IRANSansWeb Light,serif">sprint دو چیز را&nbsp;</span><span style="font-family:Arial"><span style="font-family:IRANSansWeb Light">تعریف می&zwnj;کند:</span></span></span></p>\r\n\r\n<ol dir="rtl">\r\n\t<li style="text-align:right"><span style="font-size:18px"><span style="font-family:Arial"><span style="font-family:IRANSansWeb Light">مدت&zwnj;زمانی را که&nbsp;معمولاً به&zwnj;صورت هفتگی است.</span></span></span></li>\r\n\t<li style="text-align:right"><span style="font-size:18px"><span style="font-family:Arial"><span style="font-family:IRANSansWeb Light">لیستی از خروجی&zwnj;ها را که از زمان شروع </span></span><span style="font-family:IRANSansWeb Light,serif">sprint</span><span style="font-family:Arial"><span style="font-family:IRANSansWeb Light">، برنامه&zwnj;ریزی&zwnj;شده است.</span></span></span></li>\r\n</ol>\r\n\r\n<p dir="rtl" style="text-align:right"><span style="font-size:18px"><span style="font-family:Arial"><span style="font-family:IRANSansWeb Light">هرکدام از خروجی&zwnj;ها برحسب ارزش تجاری که توسط مشتریان تعیین می&zwnj;شود، اولویت&zwnj;بندی می&zwnj;شوند</span></span><span style="font-family:IRANSansWeb Light,serif">. این روش&nbsp;تا حد زیادی به میزان بالای مشارکت مشتری در کل روند توسعه نرم افزار بستگی دارد.</span></span></p>\r\n\r\n<p dir="rtl" style="text-align:right"><span style="font-size:18px"><span style="font-family:Arial"><span style="font-family:IRANSansWeb Light">در برخی موارد&nbsp;که بنا به&nbsp;دلایلی کار برنامه&zwnj;ریزی&zwnj;شده برای یک </span></span><span style="font-family:IRANSansWeb Light,serif">sprint </span><span style="font-family:Arial"><span style="font-family:IRANSansWeb Light">خاص تکمیل نمی&zwnj;شود، کل کار مجدداً اولویت&zwnj;بندی شده و از اطلاعات به&zwnj;دست&zwnj;آمده برای برنامه&zwnj;ریزی&nbsp;&nbsp;</span></span><span style="font-family:IRANSansWeb Light,serif">sprint بعدی&nbsp;</span><span style="font-family:Arial"><span style="font-family:IRANSansWeb Light">استفاده می&zwnj;شود</span></span><span style="font-family:IRANSansWeb Light,serif">.</span></span></p>\r\n\r\n<p dir="rtl" style="text-align:right"><span style="font-size:18px"><span style="font-family:Arial"><span style="font-family:IRANSansWeb Light">در نهایت کار تکمیل&zwnj;شده، توسط اعضای تیم&nbsp;توسعه&zwnj;دهنده پروژه و مشتری بررسی می&zwnj;شود</span></span><span style="font-family:IRANSansWeb Light,serif">. </span><span style="font-family:Arial"><span style="font-family:IRANSansWeb Light">این کار به&zwnj;صورت روزانه و در پایان دموی هر&nbsp;</span></span><span style="font-family:IRANSansWeb Light,serif">sprint </span><span style="font-family:Arial"><span style="font-family:IRANSansWeb Light">انجام می&zwnj;شود</span></span><span style="font-family:IRANSansWeb Light,serif">.</span></span></p>\r\n\r\n<blockquote>\r\n<p dir="rtl" style="text-align:right"><span style="font-size:18px"><a href="http://cgeeksc.ir/post/Operating-System">سیستم&zwnj; عامل چیست؟</a></span></p>\r\n</blockquote>\r\n\r\n<p dir="rtl" style="text-align:right">&nbsp;</p>\r\n\r\n<h3 dir="rtl" style="text-align:right"><span style="font-size:18px"><span style="font-family:Arial"><span style="font-family:IRANSansWeb Medium"><strong>مزایا</strong></span></span></span></h3>\r\n\r\n<ul>\r\n\t<li>\r\n\t<p dir="rtl" style="text-align:right"><span style="font-size:18px"><span style="font-family:Arial"><span style="font-family:IRANSansWeb Light">به عنوان یک فرایند مشتری مدار ، این اطمینان را می دهد که مشتری در کل مراحل و در هر مرحله بطور مداوم در جریان پروژه است.</span></span></span></p>\r\n\t</li>\r\n\t<li>\r\n\t<p dir="rtl" style="text-align:right"><span style="font-size:18px"><span style="font-family:Arial"><span style="font-family:IRANSansWeb Light">اطمینان می دهد که کیفیت توسعه نرم افزار تا حد مطلوبی(یا حتی بهتر) حفظ می شود.</span></span></span></p>\r\n\t</li>\r\n\t<li>\r\n\t<p dir="rtl" style="text-align:right"><span style="font-size:18px"><span style="font-family:Arial"><span style="font-family:IRANSansWeb Light">احساس مالکیت را به کارفرمایان القا می&zwnj;کند چون آن&zwnj;ها مستقیماً و بطور&nbsp;گسترده با &nbsp;تیم توسعه&zwnj;دهنده&zwnj;ی پروژه در ارتباط هستند</span></span><span style="font-family:IRANSansWeb Light,serif">.</span></span></p>\r\n\t</li>\r\n\t<li>\r\n\t<p dir="rtl" style="text-align:right"><span style="font-size:18px"><span style="font-family:IRANSansWeb Light,serif">Agile </span><span style="font-family:Arial"><span style="font-family:IRANSansWeb Light">می&zwnj;تواند یک نسخه پایه&zwnj;ای&zwnj;&nbsp;از نرم&zwnj;افزار تحت توسعه تولید کند</span></span><span style="font-family:IRANSansWeb Light,serif">. که این برای بازاریابی</span><span style="font-family:Arial"><span style="font-family:IRANSansWeb Light">&nbsp;نکته&zwnj;ی مثبت و مفیدی می&zwnj;باشد</span></span><span style="font-family:IRANSansWeb Light,serif">.</span></span></p>\r\n\t</li>\r\n\t<li>\r\n\t<p dir="rtl" style="text-align:right"><span style="font-size:18px"><span style="font-family:Arial"><span style="font-family:IRANSansWeb Light">ازآنجایی&zwnj;که فرایندها کاملاً بر اساس پیشرفت افزایشی هستند، خطر شکست را کاهش می&zwnj;دهد</span></span><span style="font-family:IRANSansWeb Light,serif">. </span><span style="font-family:Arial"><span style="font-family:IRANSansWeb Light">ازهمین&zwnj;رو هم کارفرما و هم تیم توسعه&zwnj;دهنده می&zwnj;دانند که چه چیزی تکمیل&zwnj;شده و دقیقاً چه چیزی انجام نمی&zwnj;شود</span></span><span style="font-family:IRANSansWeb Light,serif">.</span></span></p>\r\n\t</li>\r\n</ul>\r\n\r\n<h3 dir="rtl" style="text-align:right"><span style="font-size:18px"><span style="font-family:Arial"><span style="font-family:IRANSansWeb Medium"><strong>معایب</strong></span></span></span></h3>\r\n\r\n<ul>\r\n\t<li>\r\n\t<p dir="rtl" style="text-align:right"><span style="font-size:18px"><span style="font-family:Arial"><span style="font-family:IRANSansWeb Light">درمواردی که ناظر پروژه نسبت به خروجی&zwnj;ها اطمینان ندارد، خطر قابل&zwnj;توجهی&nbsp;پروژه را تهدید خواهد کرد.</span></span></span></p>\r\n\t</li>\r\n\t<li>\r\n\t<p dir="rtl" style="text-align:right"><span style="font-size:18px"><span style="font-family:Arial"><span style="font-family:IRANSansWeb Light">مشارکت و حضور یک متخصص برای یک&zwnj;سری تصمیم&zwnj;گیری&zwnj;ها را&nbsp;ضروری می&zwnj;کند.</span></span></span></p>\r\n\t</li>\r\n\t<li>\r\n\t<p dir="rtl" style="text-align:right"><span style="font-size:18px"><span style="font-family:Arial"><span style="font-family:IRANSansWeb Light">برای پروژه&zwnj;های با مقیاس کوچک مناسب نیست</span></span><span style="font-family:IRANSansWeb Light,serif">.</span></span></p>\r\n\t</li>\r\n\t<li>\r\n\t<p dir="rtl" style="text-align:right"><span style="font-size:18px"><span style="font-family:Arial"><span style="font-family:IRANSansWeb Light">هزینه کلی اجرای متد&nbsp;</span></span><span style="font-family:IRANSansWeb Light,serif">Agile </span><span style="font-family:Arial"><span style="font-family:IRANSansWeb Light">نسبت به سایر روش&zwnj;های توسعه نرم&zwnj;افزار کمی گران&zwnj;تر است</span></span><span style="font-family:IRANSansWeb Light,serif">.</span>&nbsp;<span style="font-family:IRANSansWeb Light,serif">همچنین، ممکن است با پیشرفت نرم افزار ، کل زمان پیش&zwnj;بینی شده برای توسعه&zwnj;&nbsp;افزایش یابد.</span></span></p>\r\n\t</li>\r\n</ul>\r\n\r\n<h2 dir="rtl" style="text-align:right">&nbsp;</h2>\r\n\r\n<h2 dir="rtl" style="text-align:right"><span style="font-size:20px"><span style="font-family:IRANSansWeb Medium,serif"><strong>Waterfall</strong></span></span></h2>\r\n\r\n<p dir="rtl" style="text-align:right"><span style="font-size:18px"><span style="font-family:Arial"><span style="font-family:IRANSansWeb Light">این مدل به&zwnj;عنوان رویکرد سنتی توسعه نرم&zwnj;افزار شناخته می&zwnj;شود.&nbsp;مدل </span></span><span style="font-family:IRANSansWeb Light,serif">Waterfall </span><span style="font-family:Arial"><span style="font-family:IRANSansWeb Light">رویکردی <strong>خطی</strong> برای توسعه نرم&zwnj;افزار دارد</span></span><span style="font-family:IRANSansWeb Light,serif">. </span><span style="font-family:Arial"><span style="font-family:IRANSansWeb Light">به&zwnj;همین دلیل با عنوان مدل چرخه زندگی&nbsp;خطی </span><span style="font-family:Times New Roman">&ndash;</span><span style="font-family:IRANSansWeb Light"> ترتیبی هم شناخته می&zwnj;شود</span></span><span style="font-family:IRANSansWeb Light,serif">.</span></span></p>\r\n\r\n<p dir="rtl" style="text-align:right"><span style="font-size:18px"><span style="font-family:Arial"><span style="font-family:IRANSansWeb Light">اولین معرفی رسمی </span></span><span style="font-family:IRANSansWeb Light,serif">Waterfal</span><span style="font-family:Arial"><span style="font-family:IRANSansWeb Light">،&nbsp;</span></span><span style="font-family:Arial"><span style="font-family:IRANSansWeb Light">در مقاله&zwnj;ای در سال </span></span><span style="font-family:IRANSansWeb Light,serif">1970 </span><span style="font-family:Arial"><span style="font-family:IRANSansWeb Light">توسط </span></span><span style="font-family:IRANSansWeb Light,serif">Winston W.Royce </span><span style="font-family:Arial"><span style="font-family:IRANSansWeb Light">انجام گرفته است</span></span><span style="font-family:IRANSansWeb Light,serif">. </span><span style="font-family:Arial"><span style="font-family:IRANSansWeb Light">اما مقاله متعلق به </span></span><span style="font-family:IRANSansWeb Light,serif">Bell </span><span style="font-family:Arial"><span style="font-family:IRANSansWeb Light">و </span></span><span style="font-family:IRANSansWeb Light,serif">Thayer که&nbsp;</span><span style="font-family:Arial"><span style="font-family:IRANSansWeb Light">در سال </span></span><span style="font-family:IRANSansWeb Light,serif">1976 منتشر شد،&nbsp;</span><span style="font-family:Arial"><span style="font-family:IRANSansWeb Light">برای اولین بار مشخصات و ویژگی&zwnj;های </span></span><span style="font-family:IRANSansWeb Light,serif">Waterfall </span><span style="font-family:Arial"><span style="font-family:IRANSansWeb Light">را بیان کرده است</span></span><span style="font-family:IRANSansWeb Light,serif">.</span></span></p>\r\n\r\n<p dir="rtl" style="text-align:right">&nbsp;</p>\r\n\r\n<p dir="rtl" style="text-align:center"><span style="font-size:18px"><img alt="روش waterfall یا آبشاری" src="/media/uploads/2020/10/21/3-1_5XyaO5X.png" style="height:470px; width:450px" /></span></p>\r\n\r\n<p dir="rtl" style="text-align:right">&nbsp;</p>\r\n\r\n<p dir="rtl" style="text-align:right"><span style="font-size:18px"><span style="font-family:Arial"><span style="font-family:IRANSansWeb Light">ازآنجایی&zwnj;که مدل </span></span><span style="font-family:IRANSansWeb Light,serif">Waterfall از&nbsp;</span><span style="font-family:Arial"><span style="font-family:IRANSansWeb Light">نظمی ترتیبی&nbsp;پیروی&nbsp;می&zwnj;کند، اعضای تیم توسعه پروژه تنها زمانی می&zwnj;توانند به مراحل بعدی بروند که مراحل قبلی با موفقیت تکمیل&zwnj;شده باشد</span></span><span style="font-family:IRANSansWeb Light,serif">. </span><span style="font-family:Arial"><span style="font-family:IRANSansWeb Light">معمولاً بین هر مرحله از رویکرد </span></span><span style="font-family:IRANSansWeb Light,serif">Waterfall</span><span style="font-family:Arial"><span style="font-family:IRANSansWeb Light">، یک <strong>دروازه</strong> وجود دارد</span></span><span style="font-family:IRANSansWeb Light,serif">.</span></span></p>\r\n\r\n<blockquote>\r\n<p dir="rtl" style="text-align:right"><span style="font-size:18px"><a href="http://cgeeksc.ir/post/recommender-systems">سیستم&zwnj;های توصیه&zwnj;گر</a></span></p>\r\n</blockquote>\r\n\r\n<p dir="rtl" style="text-align:right">&nbsp;</p>\r\n\r\n<h3 dir="rtl" style="text-align:right"><span style="font-size:18px"><span style="font-family:Arial"><span style="font-family:IRANSansWeb Medium"><strong>مزایا</strong></span></span></span></h3>\r\n\r\n<ul>\r\n\t<li>\r\n\t<p dir="rtl" style="text-align:right"><span style="font-size:18px"><span style="font-family:Arial"><span style="font-family:IRANSansWeb Light">مناسب برای مدیریت وابستگی&zwnj;ها.</span></span></span></p>\r\n\t</li>\r\n\t<li>\r\n\t<p dir="rtl" style="text-align:right"><span style="font-size:18px"><span style="font-family:Arial"><span style="font-family:IRANSansWeb Light">درگیری مشتری در مراحل توسعه نرم&zwnj;افزار، اجباری نیست</span></span><span style="font-family:IRANSansWeb Light,serif">.</span></span></p>\r\n\t</li>\r\n\t<li>\r\n\t<p dir="rtl" style="text-align:right"><span style="font-size:18px"><span style="font-family:Arial"><span style="font-family:IRANSansWeb Light">بسته به اینکه پروژه در کدام مرحله باشد، اعضای تیم می&zwnj;توانند روی وظایف مختلف تمرکز کنند</span></span><span style="font-family:IRANSansWeb Light,serif">.</span></span></p>\r\n\t</li>\r\n\t<li>\r\n\t<p dir="rtl" style="text-align:right"><span style="font-size:18px"><span style="font-family:Arial"><span style="font-family:IRANSansWeb Light">هر مرحله خروجی&zwnj;ها و روند بررسی مجزایی دارد</span></span><span style="font-family:IRANSansWeb Light,serif">.</span></span></p>\r\n\t</li>\r\n\t<li>\r\n\t<p dir="rtl" style="text-align:right"><span style="font-size:18px"><span style="font-family:Arial"><span style="font-family:IRANSansWeb Light">رویکرد کاملاً سازگاری برای تغییر تیم&zwnj;ها دارد</span></span><span style="font-family:IRANSansWeb Light,serif">.</span></span></p>\r\n\t</li>\r\n\t<li>\r\n\t<p dir="rtl" style="text-align:right"><span style="font-size:18px"><span style="font-family:Arial"><span style="font-family:IRANSansWeb Light">خروجی&zwnj; سریع&zwnj;تری از محصول ارائه می&zwnj;دهد</span></span><span style="font-family:IRANSansWeb Light,serif">.</span></span></p>\r\n\t</li>\r\n\t<li>\r\n\t<p dir="rtl" style="text-align:right"><span style="font-size:18px"><span style="font-family:Arial"><span style="font-family:IRANSansWeb Light">برنامه&zwnj;ریزی و طراحی کاملاً شفاف است چون تیم توسعه&zwnj;دهنده و مشتری در ابتدا درمورد چیستی و چگونگی محصول نرم&zwnj;افزاری تحت توسعه توافق می&zwnj;کنند.</span></span></span></p>\r\n\t</li>\r\n\t<li>\r\n\t<p dir="rtl" style="text-align:right"><span style="font-size:18px"><span style="font-family:Arial"><span style="font-family:IRANSansWeb Light">پیشرفت&zwnj;ها به&zwnj;راحتی قابل &zwnj;سنجش و ارزیابی هستند چون طرح نهایی از قبل کاملاً مشخص&zwnj;شده است</span></span><span style="font-family:IRANSansWeb Light,serif">.</span></span></p>\r\n\t</li>\r\n\t<li>\r\n\t<p dir="rtl" style="text-align:right"><span style="font-size:18px"><span style="font-family:Arial"><span style="font-family:IRANSansWeb Light">فرایندها و نتایج به&zwnj;خوبی مستند می&zwnj;شوند</span></span><span style="font-family:IRANSansWeb Light,serif">.</span></span></p>\r\n\t</li>\r\n\t<li>\r\n\t<p dir="rtl" style="text-align:right"><span style="font-size:18px"><span style="font-family:Arial"><span style="font-family:IRANSansWeb Light">برای پروژه&zwnj;هایی که مقیاس کوچکی دارند، بسیار خوب کار می&zwnj;کند به&zwnj;ویژه پروژه&zwnj;هایی که ملزومات قابل&zwnj;درکی دارند</span></span><span style="font-family:IRANSansWeb Light,serif">.</span></span></p>\r\n\t</li>\r\n</ul>\r\n\r\n<h3 dir="rtl" style="text-align:right"><span style="font-size:18px"><span style="font-family:Arial"><span style="font-family:IRANSansWeb Medium"><strong>معایب</strong></span></span></span></h3>\r\n\r\n<ul>\r\n\t<li>\r\n\t<p dir="rtl" style="text-align:right"><span style="font-size:18px"><span style="font-family:Arial"><span style="font-family:IRANSansWeb Light">احتمال بروز اشکالات&nbsp;و&nbsp;آسیب&zwnj;پذیری&zwnj;ها&nbsp;به&zwnj; دلیل اینکه&nbsp;تست محصول تنها با پایان یافتن توسعه&zwnj;ی آن انجام میابد، بالا می&zwnj;باشد.</span></span></span></p>\r\n\t</li>\r\n\t<li>\r\n\t<p dir="rtl" style="text-align:right"><span style="font-size:18px"><span style="font-family:Arial"><span style="font-family:IRANSansWeb Light">برای پروژه&zwnj;هایی با&nbsp;مقیاس بزرگ عملی نیست</span></span><span style="font-family:IRANSansWeb Light,serif">.</span></span></p>\r\n\t</li>\r\n\t<li>\r\n\t<p dir="rtl" style="text-align:right"><span style="font-size:18px"><span style="font-family:IRANSansWeb Light">برای اعمال تغییراتی که ممکن است در طی انجام فرایند&zwnj;ها ایجاد شود، ناتوان می&zwnj;باشد.</span></span></p>\r\n\t</li>\r\n\t<li>\r\n\t<p dir="rtl" style="text-align:right"><span style="font-size:18px"><span style="font-family:Arial"><span style="font-family:IRANSansWeb Light">وقتی&zwnj;که ملزومات در ابتدای پروژه واضح نباشند، روش مناسبی نیست</span></span><span style="font-family:IRANSansWeb Light,serif">.</span></span></p>\r\n\t</li>\r\n\t<li>\r\n\t<p dir="rtl" style="text-align:right"><span style="font-size:18px"><span style="font-family:Arial"><span style="font-family:IRANSansWeb Light">تصویر مبهمی ازآنچه مشتری&nbsp;در انتهای پروژه انتظار دارد، ارائه می&zwnj;دهد</span></span><span style="font-family:IRANSansWeb Light,serif">.</span></span></p>\r\n\t</li>\r\n</ul>\r\n\r\n<p dir="rtl" style="text-align:right"><br />\r\n<span style="font-size:18px">امیدوارم تا اینجا با این دو متد توسعه&zwnj;ی نرم افزار آشنایی خوبی پیدا کرده باشید. در آینده به این موضوع بیشتر&nbsp;خواهیم پرداخت.</span></p>\r\n\r\n<p dir="rtl" style="text-align:right"><br />\r\n&nbsp;</p>\r\n\r\n<p dir="rtl" style="text-align:right"><br />\r\n&nbsp;</p>	2020-10-20	images/posts/پست_سایت.png	Agile-and-Waterfall	published	3	\N	<p><a href="https://hackr.io/blog/agile-vs-waterfall" target="_blank">https://hackr.io/blog/agile-vs-waterfall</a><br></p>	\N	6	در این مطلب از جامعه‌ی گیک‌های کامپیوتر نگاهی می‌اندازیم به دو روش توسعه‌ی نرم‌ افزار به نام‌های ‌Agile و Waterfall.	\N	\N	agile و waterfall
24	هوش مصنوعی در اینترنت اشیا(AIoT)	<p dir="RTL" style="text-align:right">امروزه <a href="http://cgeeksc.ir/category/AI-articles">هوش مصنوعی</a> تاثیر چشم گیری بر روی صنعت و تکنولوژی داشته و در پیشرفت و بهبود آنها نقش بزرگی را ایفا می&zwnj;نماید. با پیشرفت سریع هوش مصنوعی و حرکت تمامی فناوری&zwnj;ها به سوی هوشمند سازی، اینترنت اشیا(<span dir="LTR">IoT</span>) نیز از تاثیر این فناوری بی&zwnj;بهره نخواهد ماند. پس از بررسی کلی <a href="http://cgeeksc.ir/event/004">اینترنت اشیا</a> و معرفی <a href="http://cgeeksc.ir/post/Security_issues">چالش&zwnj;های امنیتی</a> پیش روی آن و همچنین بررسی نکات امنیتی در اینترنت اشیا در این مقاله می&zwnj;خواهیم به بررسی تاثیر هوش مصنوعی در اینترنت اشیا بپردازیم.</p>\r\n\r\n<p dir="RTL" style="text-align:right">به طور کلی می&zwnj;توان هوش مصنوعی را از ملزومات و تکمیل کنندگان فناوری اینترنت اشیا دانست، چرا که ماهیت اصلی اینترنت اشیا <strong>هوشمندسازی </strong>دستگاه&zwnj;ها و تکنولوژی&zwnj;های از قبل ساخته است؛ مانند <strong>شهر هوشمند</strong>، <strong>خانه هوشمند</strong>،<strong> اشیا هوشمند</strong> و.. ولی بدیهی است که در صورت تلفیق اینترنت اشیا و هوش مصنوعی نتیجه&zwnj;ای بسیار مطلوب&zwnj;تر حاصل خواهد شد.</p>\r\n\r\n<p dir="RTL" style="text-align:center"><img alt="هوش مصنوعی در اینترنت اشیا" src="/media/uploads/2020/10/07/image-20201007164931-1.png" style="height:610px; width:1000px" /></p>\r\n\r\n<h2 dir="RTL" style="text-align:right"><span dir="LTR">AIOT</span> چیست؟</h2>\r\n\r\n<p dir="RTL" style="text-align:right">برای درک کامل <span dir="LTR">AIoT</span>، باید با اینترنت اشیا شروع کنیم. وقتی &quot;اشیایی&quot; مانند دستگاه&zwnj;های پوشیدنی، یخچال، دستیار دیجیتال، حسگرها و سایر تجهیزات به اینترنت متصل باشند، توسط دستگاه&zwnj;های دیگر قابل شناسایی و جمع آوری و پردازش داده&zwnj;ها باشند، تعریف اینترنت اشیا را شامل خواهند شد. هوش مصنوعی تکنولوژی&zwnj;ای است که یک سیستم می&zwnj;تواند مجموعه&zwnj;ای از کارها را به اتمام برساند یا از داده&zwnj;ها به روشی هوشمندانه به نظر برسد.</p>\r\n\r\n<p dir="RTL" style="text-align:right">بنابراین، وقتی هوش مصنوعی به اینترنت اشیا اضافه می&zwnj;شود، به این معنی است که این دستگاه&zwnj;ها می&zwnj;توانند داده&zwnj;ها را تجزیه و تحلیل کرده و تصمیم بگیرند و بدون دخالت انسان بر روی آن داده&zwnj;ها عمل کنند.</p>\r\n\r\n<p dir="RTL" style="text-align:right">این&zwnj;ها دستگاه&zwnj;های &quot;هوشمند&quot; هستند و به کارایی و اثربخشی کمک می&zwnj;کنند. <strong><span dir="LTR">AIoT</span> تجزیه و تحلیل داده&zwnj;ها را فراهم می&zwnj;کند</strong> که سپس برای بهینه سازی سیستم و ایجاد عملکرد بالاتر و بینش تجاری و ایجاد داده&zwnj;هایی که به تصمیم گیری بهتر کمک می&zwnj;کند و سیستم می&zwnj;تواند از آنها یاد بگیرد، استفاده می&zwnj;شود.</p>\r\n\r\n<p dir="RTL" style="text-align:center"><img alt="AIOT چیست" src="/media/uploads/2020/10/07/image-20201007165150-2.png" style="height:469px; width:523px" /></p>\r\n\r\n<p dir="RTL" style="text-align:center">&nbsp;</p>\r\n\r\n<h3 dir="RTL" style="text-align:right">هوش مصنوعی اینترنت اشیا را فعال می کند</h3>\r\n\r\n<p dir="RTL" style="text-align:right">اینترنت اشیا یک مفهوم گسترده است که شامل <strong>سنسورها</strong>، <strong>محرک&zwnj;ها</strong>، <strong>ذخیره سازی داده&zwnj;ها</strong> و <strong>پردازش داده&zwnj;ها</strong> است که به اینترنت متصل می&zwnj;شوند. بنابراین هر دستگاه دارای اینترنت اشیا می&zwnj;تواند محیط اطراف خود را حس کند، داده&zwnj;های جمع آوری شده را انتقال، ذخیره و پردازش کند و مطابق آن عمل کند. آخرین مرحله عملکرد مطابق با آن کاملاً به مرحله پردازش بستگی دارد. هوشمندی واقعی یک سرویس اینترنت اشیا با توجه به سطح پردازش یا عملکردی که می&zwnj;تواند انجام دهد تعیین می&zwnj;شود.</p>\r\n\r\n<p dir="RTL" style="text-align:right">یک سیستم اینترنت اشیا غیر هوشمند قابلیت محدودی دارد و قادر به تکامل با داده&zwnj;ها نخواهد بود. با این حال، یک سیستم اینترنت اشیا هوشمند از هوش مصنوعی برخوردار است و ممکن است در خدمت هدف واقعی اتوماسیون و سازگاری باشد.</p>\r\n\r\n<p dir="RTL" style="text-align:right">در این زمینه، چند نمونه از خدمات اینترنت اشیا موجود با عملکرد هوش مصنوعی را مورد بررسی قرار خواهیم داد.</p>\r\n\r\n<blockquote>\r\n<p><a href="http://cgeeksc.ir/post/OFDM-Introduction">مدولاسیون OFDM روشی برای تخمین کانال اینترنت اشیا</a></p>\r\n</blockquote>\r\n\r\n<p dir="RTL" style="text-align:right"><span style="color:#000000"><strong>دستیارهای صوتی:</strong></span> خدمات صوتی مبتنی بر ابر هستند که به عنوان دستیارهای شخصی جدول برای کاربران عمل می&zwnj;کنند. آنها کارهای مختلفی را از طریق برنامه&zwnj;های شخص ثالث و سایر دستگاه&zwnj;های هوشمند در مجاورت خود انجام می&zwnj;دهند. دستیارهای صوتی قادر به پاسخگویی به سوالات، تماس با کابین، رزرو در رستوران، پخش موسیقی، روشن / خاموش شدن چراغ&zwnj;های هوشمند و بسیاری از کارهای دیگر بر اساس دستورات صوتی کاربر هستند. تعداد کمی از دستیارهای صوتی شناخته شده عبارتند از:</p>\r\n\r\n<ul dir="rtl">\r\n\t<li style="text-align:right"><u><strong>الکسا:</strong></u> الکسا دستیار صوتی آمازون است که در محصولاتی مانند <span dir="LTR">Amazon Echo </span>، <span dir="LTR">Amazon Tap</span> و.. استفاده می&zwnj;شود. مجموعه خاصی از مهارت&zwnj;ها وجود دارد که به عنوان <span dir="LTR">Alexa Skills Kit (ASK)</span> شناخته می&zwnj;شود و می&zwnj;تواند برای شخصی سازی یا بهبود مهارت&zwnj;های خاص اصلاح و به روز شود.</li>\r\n\t<li style="text-align:right"><u><strong>دستیار صوتی گوگل:</strong></u> <span dir="LTR">Google Assistant</span> مورد استفاده در <span dir="LTR">Google Home</span> دارای ویژگی&zwnj;های دیگری است که می&zwnj;تواند حداکثر شش کاربر مختلف را شناسایی کرده و جزئیات مربوطه را برای مکالمه با آنها بکشد.</li>\r\n</ul>\r\n\r\n<p dir="RTL" style="text-align:right">این دستیارهای صوتی بیشتر به دلیل استفاده از زیرمجموعه&zwnj;های مختلف هوش مصنوعی قادر به انجام چندین کار هستند. تشخیص خودکار صدا از دور، تبدیل گفتار به متن، پردازش و درک زبان طبیعی، استدلال متنی، مدیریت گفتگو، پاسخ به سوال، هوش مصنوعی مکالمه و.. به طور مداوم انجام می&zwnj;شود تا دستیارهای صوتی عملکردها را در زمان واقعی(<span dir="LTR">Real Time</span>) انجام دهند.</p>\r\n\r\n<p dir="RTL" style="text-align:center"><img alt="دستیار صوتی" src="/media/uploads/2020/10/07/image-20201007165653-3.jpeg" style="height:913px; width:1000px" /></p>\r\n\r\n<p dir="RTL" style="text-align:right"><strong>ربات ها: </strong>پیشرفت&zwnj;های اخیر در زمینه رباتیک منجر به خلق ربات&zwnj;هایی شده است که شباهت به انسان را افزایش داده و قادر به تعامل با انسان هستند مثل درک، پاسخ متقابل و بیان برخی احساسات انسانی. ربات&zwnj;ها به خودی خود اینترنت اشیا هستند زیرا دارای چندین حسگر و محرک به همراه هوش مصنوعی هستند که به آنها کمک می&zwnj;کند تا به طور مداوم خود را یاد بگیرند و خود را با گذشت زمان سازگار کنند.</p>\r\n\r\n<blockquote>\r\n<p><a href="http://cgeeksc.ir/post/introduction-to-reinforcement-learning">یادگیری تقویتی چیست؟</a></p>\r\n</blockquote>\r\n\r\n<ul dir="rtl">\r\n\t<li style="text-align:right"><strong><u>سوفیا</u>: </strong>از &nbsp;<span dir="LTR">Hanson Roborics</span> یک ربات انسان نما اجتماعی است که کاملاً شبیه انسان است و می&zwnj;تواند احساسات را از طریق بیش از 50 حالت چهره بیان کند. در حین مکالمه، قادر به برقراری ارتباط چشمی با انسان هنگام مکالمه است. سوفیا اولین ربات جهان است که تابعیت کامل یک کشور را دریافت می&zwnj;کند. او حتی چندین مصاحبه کرده و در یک کنسرت آواز خوانده است.</li>\r\n</ul>\r\n\r\n<p dir="RTL" style="text-align:right"><strong>دستگاه&zwnj;های هوشمند:</strong> در اینترنت اشیا جدا از دستیارهای صوتی و ربات&zwnj;ها، اشیا/دستگاه&zwnj;های هوشمندی وجود دارند که کار را برای انسان&zwnj;ها ساده&zwnj;تر می&zwnj;کنند. اشیا هوشمندی که دارای هوش مصنوعی هستند از برنامه های شناسایی شی&zwnj;، تشخیص چهره&zwnj;، تشخیص صدا&zwnj;، گفتار و ویژگی&zwnj;های بیان استفاده می&zwnj;کنند.</p>\r\n\r\n<ul dir="rtl">\r\n\t<li style="text-align:right"><strong><u>چراغ&zwnj;های هوشمند</u> </strong>توسط <span dir="LTR">Deako</span> از راه دور از طریق تلفن&zwnj;های هوشمند و دستیار الکسا یا گوگل قابل کنترل هستند. آنها از طریق اینترنت متصل می&zwnj;شوند و می&zwnj;توانند هر از چند گاهی به روزرسانی&zwnj;های نرم افزاری را دریافت کنند.</li>\r\n</ul>\r\n\r\n<blockquote>\r\n<p><a href="http://cgeeksc.ir/post/self-driving-cars">ماشین&zwnj;های خودران</a></p>\r\n</blockquote>\r\n\r\n<p dir="RTL" style="text-align:right"><strong>اینترنت اشیا صنعتی:</strong> اینترنت اشیا علاوه بر اینکه در خانه&zwnj;های هوشمند مورد استفاده قرار می&zwnj;گیرد، در بخشهای مختلف صنعتی کاربرد گسترده&zwnj;ای دارد. این راه حل&zwnj;ها تجزیه و تحلیل آماری و مالی یک شرکت را به طور کلی انجام می&zwnj;دهند و در نهایت با استفاده از برخی الگوریتم&zwnj;های هوش مصنوعی و یادگیری ماشین پیش بینی می&zwnj;کنند.</p>\r\n\r\n<p dir="RTL" style="text-align:center"><img alt="ربات " src="/media/uploads/2020/10/07/image-20201007170038-5.jpeg" style="height:281px; width:450px" /></p>\r\n\r\n<p dir="RTL">در نتیجه اگر به اینترنت اشیا علاقه&zwnj;ند هستید و قصد فعالیت در این زمینه را دارید پس از مطالعه مقاله توصیه میکنم به یادگیری هوش مصنوعی هم بپردازید.</p>	2020-10-07	images/posts/post-siteAIoT.jpg	AIoT_introduction	published	4	\N		\N	3	در این مقالع به بررسی تاثیر هوش مصنوعی در راستای بهبود اینترنت اشیا پرداختیم و برخی از تکنولوژی‎‌هایی که از تلفیق این دو تکنولوژی بزرگ ساخته شده‌اند را مورد بررسی قرار داده‌ایم. اگر از علاقه‌مندان به اینرنت اشیا و هوش مصنوعی هستید این مقاله می‌تواند برایتان جالب باشد.	\N	2020-10-07 15:30:00+00	\N
27	تفاوت‌های Backend و Frontend	<p>Backend و Frontend دو بخش متفاوت در طراحی سایت هستند که هر کدام وظایفی خاص را بر عهخده دارند. در این ویدیو تفاوت&zwnj;ها و وظایف Backend و Frontend را بررسی خواهیم کرد و به سوالاتی از قبیل چه فریمورک مناسب کدام بخش است؟ برای تبدیل شدن به توسعه دهنده Backend و Frontend به چه زبان&zwnj;هایی نیاز داریم پاسخ خواهیم داد.</p>\r\n\r\n<p>اگر علاقه مند به طراحی سایت و Backend و Frontend هستید این ویدیو را از دست ندهید.</p>	2020-10-17	images/posts/post-site-frontbackend.png	frontend-and-backend	published	2	\N		https://www.youtube.com/watch?v=_6QR2RtWN9M	5	در این ویدیو تفاوت‌ها و وظایف دو بخش اصلی در طراحی سایت یعنی Backend و Frontend را بررسی خواهیم کرد.	\N	\N	Backend و Frontend
25	گودوت 4؛ انقلابی در بازی‌سازی آزاد	<p dir="rtl"><span style="font-family:Vazir">گودوت (Godot) </span><span style="font-family:Vazir">یک موتور بازی&zwnj;سازی آزاد و رایگان است که به خاطر سادگی و در عین حال قدرتمند بودن توانسته نظر کاربران زیادی را به خود جلب کند و تحسین بسیاری از علاقه مندان به بازی&zwnj;سازی را برانگیزد</span><span style="font-family:Vazir">.</span></p>\r\n\r\n<p dir="rtl"><span style="font-family:Vazir">حال و پس از گذشت حدود سیزده سال از تولد گودوت (Godot) </span><span style="font-family:Vazir">نسخه&zwnj;ای جدید در راه است که قرار است در آن ویژگی&zwnj;های جدید و منحصر به فردی به گودوت </span><span style="font-family:Vazir">(Godot) </span><span style="font-family:Vazir">اضافه شوند و گام&zwnj;های رو به جلوی بزرگی برداشته شوند.</span></p>\r\n\r\n<p dir="rtl"><span style="font-family:Droid Sans Devanagari"><span style="font-family:Vazir">در این مطلب از وبسایت جامعه گیک&zwnj;های کامپیوتر به بررسی برخی از ویژگی&zwnj;های جدید این موتور بازی&zwnj;سازی آزاد خواهیم پرداخت و آچه که باید از </span></span><span style="font-family:Vazir"><strong>Godot 4</strong> </span><span style="font-family:Droid Sans Devanagari"><span style="font-family:Vazir">انتظار داشت را بیان می&zwnj;کنیم</span></span><span style="font-family:Vazir">. </span><span style="font-family:Droid Sans Devanagari"><span style="font-family:Vazir">اگر از طرفداران بازی&zwnj;سازی و کاربران گودوت </span></span><span style="font-family:Vazir">(Godot) </span><span style="font-family:Droid Sans Devanagari"><span style="font-family:Vazir">هستید این مطلب را از دست ندهید</span></span><span style="font-family:Vazir">.</span></p>\r\n\r\n<p dir="rtl" style="text-align:center"><img alt="اموزش گودوت" src="/media/uploads/2020/10/10/5e0b8b0c04557983735004.png" style="height:256px; width:256px" /></p>\r\n\r\n<p dir="rtl"><span style="font-family:Vazir">در Godot 4 </span><span style="font-family:Vazir">یکی از مباحثی که شاهد پیشرفت&zwnj;های زیادی در آن هستیم مبحث نور پردازی و گرافیک است</span><span style="font-family:Vazir">. </span><span style="font-family:Vazir">گودوت که پیش از این هم در این زمینه&zwnj;ها حرف&zwnj;هایی برای گفتن داشت در نسخه جدید خود می&zwnj;تواند به سادگی بسیاری از موتورهای بازی&zwnj;سازی دیگر را پشت سر بگذارد</span><span style="font-family:Vazir">. </span><span style="font-family:Vazir">در ادامه به برخی از این ویژگی&zwnj;های جدید اشاره خواهیم کرد</span><span style="font-family:Vazir">.</span></p>\r\n\r\n<h2 dir="rtl"><span style="font-family:Vazir">نور پردازی RealTime </span><span style="font-family:Vazir">از طریق </span><span style="font-family:Vazir">SDF</span></h2>\r\n\r\n<p dir="rtl"><span style="font-family:Droid Sans Devanagari"><span style="font-family:Vazir">نورپردازی در بازی&zwnj;ها، به خصوص فضاهای سه بعدی از اهمیت بالایی برخودار ا</span><span style="font-family:Vazir">ست</span><span style="font-family:Vazir"> و می&zwnj;تواند جذابیت خاصی به بازی اضافه کند و صحنه&zwnj;های زیبایی را رقم بزند</span></span><span style="font-family:Vazir">.</span></p>\r\n\r\n<p dir="rtl"><span style="font-family:Droid Sans Devanagari"><span style="font-family:Vazir">در نسخه جدید </span><span style="font-family:Vazir">گودوت </span></span><span style="font-family:Vazir">(Godot) </span><span style="font-family:Droid Sans Devanagari"><span style="font-family:Vazir">قابلیت </span></span><span style="font-family:Vazir">SDF </span><span style="font-family:Droid Sans Devanagari"><span style="font-family:Vazir">اضافه خواهد شد که با استفاده از آن می&zwnj;توانید نور پردازی دقیقی از طریق محاسبه فاصله منبع نور تا جسم داشته باشید</span><span style="font-family:Vazir">،</span><span style="font-family:Vazir"> که</span> <span style="font-family:Vazir">نور&zwnj;ها و سایه&zwnj;ها را در بازی واقعی</span><span style="font-family:Vazir">&zwnj;</span><span style="font-family:Vazir">تر </span><span style="font-family:Vazir">و با کیف</span><span style="font-family:Vazir">ی</span><span style="font-family:Vazir">ت&zwnj;تر</span><span style="font-family:Vazir"> می&zwnj;کند و گزینه بسیار مناسبی برای پیاده سازی شب و روز </span><span style="font-family:Vazir">و تغییرات زمانی </span><span style="font-family:Vazir">در بازی&zwnj;ها</span><span style="font-family:Vazir">،</span><span style="font-family:Vazir"> به خصوص بازی&zwnj;های جهان باز است</span></span><span style="font-family:Vazir">.</span></p>\r\n\r\n<p dir="rtl" style="text-align:center"><span style="font-family:Vazir"><img alt="گودوت" src="/media/uploads/2020/10/10/5ef89788d937a898536731.jpeg" style="height:797px; width:1242px" /></span></p>\r\n\r\n<h2 dir="rtl"><span style="font-family:Vazir">Lightmapper </span><span style="font-family:Droid Sans Devanagari"><span style="font-family:Vazir">جدید و مدرن</span></span></h2>\r\n\r\n<p dir="rtl"><span style="font-family:Droid Sans Devanagari"><span style="font-family:Vazir">گرچه در نسخه&zwnj;های پیشین </span><span style="font-family:Vazir">گودوت </span></span><span style="font-family:Vazir">(Godot) </span><span style="font-family:Droid Sans Devanagari"><span style="font-family:Vazir">ابزارهایی برای نور پردازی وجود داشت اما این ابزار جدید به توسعه دهندگان کمک می&zwnj;کند تا بتوانند با کیفیت بهتری این کار را انجام دهند</span></span><span style="font-family:Vazir">. </span><span style="font-family:Droid Sans Devanagari"><span style="font-family:Vazir">این ابزار علاوه بر کیفیت بهتر عملکرد بهتری هم خواهد داشت که می تواند به بهینه&zwnj;تر شدن بازی&zwnj;ها به خصوص برای گوشی&zwnj;های هوشمند کمک کند و با این نور سنج جدید سایه&zwnj;های واقع گرایانه تری را خواهیم دید</span></span><span style="font-family:Vazir">.</span></p>\r\n\r\n<p dir="rtl"><span style="font-family:Droid Sans Devanagari"><span style="font-family:Vazir">این نور سنج بر پایه پردازشگر گرافیکی </span></span><span style="font-family:Vazir">(GPU) </span><span style="font-family:Droid Sans Devanagari"><span style="font-family:Vazir">کار خواهد </span><span style="font-family:Vazir">کرد </span><span style="font-family:Vazir">و پردازش&zwnj;ها توسط </span></span><span style="font-family:Vazir"><strong>Vulkan</strong> </span><span style="font-family:Droid Sans Devanagari"><span style="font-family:Vazir">انجام می&zwnj;شوند</span></span><span style="font-family:Vazir">. </span><span style="font-family:Droid Sans Devanagari"><span style="font-family:Vazir">در ادامه در مورد </span></span><span style="font-family:Vazir">Vulkan</span><span style="font-family:Droid Sans Devanagari"><span style="font-family:Vazir">، </span><span style="font-family:Vazir">که خود به تنهایی گامی بزرگ و رو به جلو به حساب می&zwnj;آید</span><span style="font-family:Vazir"> توضیحاتی خواهم داد</span></span><span style="font-family:Vazir">.</span></p>\r\n\r\n<p dir="rtl"><span style="font-family:Vazir">با این ابزار جدید زمان آماده شدن و اجرای صحنه&zwnj;ها کاهش خواهد یافت و شاهد سرعت و عملکرد هرچه بیشتر خواهیم بود.</span></p>\r\n\r\n<p dir="rtl" style="text-align:center"><span style="font-family:Vazir"><img alt="انجین گودوت" src="/media/uploads/2020/10/10/5eb70ad311dd4899233045.png" style="height:577px; width:792px" /></span></p>\r\n\r\n<h2 dir="rtl"><span style="font-family:Droid Sans Devanagari"><span style="font-family:Vazir">سایه&zwnj;های عمومی و نمونه&zwnj;ای </span></span><span style="font-family:Vazir">(</span><span style="font-family:Vazir">shader uniforms</span><span style="font-family:Vazir">)</span></h2>\r\n\r\n<p dir="rtl"><span style="font-family:Droid Sans Devanagari"><span style="font-family:Vazir">با اضافه شدن این ابزار کنترل سایه&zwnj;ها در </span><span style="font-family:Vazir">گودوت </span></span><span style="font-family:Vazir">(Godot) </span><span style="font-family:Droid Sans Devanagari"><span style="font-family:Vazir">چند برابر بهتر خواهد شد</span></span><span style="font-family:Vazir">. </span><span style="font-family:Droid Sans Devanagari"><span style="font-family:Vazir">سایه کاراکتر بازی و دیگر اجزا</span><span style="font-family:Vazir">یی </span><span style="font-family:Vazir">که قابلیت حرکت دارند به خوبی و به شکلی واقعی از طریق </span></span><span style="font-family:Vazir">shader uniforms </span><span style="font-family:Droid Sans Devanagari"><span style="font-family:Vazir">قابل کنترل خواهند بود</span></span><span style="font-family:Vazir">.</span></p>\r\n\r\n<p dir="rtl"><span style="font-family:Droid Sans Devanagari"><span style="font-family:Vazir">همچنین </span></span><span style="font-family:Vazir">shader uniforms</span><span style="font-family:Vazir"> </span><span style="font-family:Droid Sans Devanagari"><span style="font-family:Vazir">به شما کمک می&zwnj;کند بتوانید به شکلی طبیعی&zwnj;تر شرایط آب و هوایی مختلف را در بازی خود پیاده سازی کنید</span></span><span style="font-family:Vazir">. </span><span style="font-family:Droid Sans Devanagari"><span style="font-family:Vazir">حال می&zwnj;توانید به سادگی سایه شاخ و برگ&zwnj;های درختی که در اثر باد تکان می&zwnj;خورند را به خوبی پیاده کنید و فضایی واقعی برای کاربران بسازید</span></span><span style="font-family:Vazir">.</span></p>\r\n\r\n<h2 dir="rtl"><span style="font-family:&quot;Liberation Serif&quot;,serif"><span style="font-family:Vazir">sky shaders های شخصی</span></span></h2>\r\n\r\n<p dir="rtl"><span style="font-family:Vazir">در Godot 4 </span><span style="font-family:Vazir">این مشکل کاربران که نمی&zwnj;توانستند به خوبی آسمانی واقعی و پویا در بازی پیاده کنند حل شده است</span><span style="font-family:Vazir">. </span><span style="font-family:Vazir">حالا می&zwnj;توانید به خوبی آسمان&zwnj;هایی پویا و قابل تغییر با توجه به زمان و آب و هوا در بازی خود پیاده سازی کنید.</span></p>\r\n\r\n<p dir="rtl"><span style="font-family:Vazir">تمامی این ویژگی&zwnj;ها در کنار هم باعث به وجود آمدن محیط&zwnj;هایی زنده و واقعی&zwnj;تر می&zwnj;شوند و در گودوت 4 </span><span style="font-family:Vazir">می&zwnj;توانید جهان رویاییتان را پیاده سازی کنید</span><span style="font-family:Vazir">.</span></p>\r\n\r\n<p dir="rtl" style="text-align:center"><span style="font-family:Vazir"><img alt="آموزش گودوت" src="/media/uploads/2020/10/10/godot4-sky-shaders-clouds.png" style="height:781px; width:1149px" /></span></p>\r\n\r\n<p dir="rtl"><span style="font-family:Droid Sans Devanagari"><span style="font-family:Vazir">از بحث گرافیکی و قابلیت&zwnj;هایی که برای ساخت و طراحی دنیا و فضایی بهتر </span><span style="font-family:Vazir">که</span><span style="font-family:Vazir"> در </span></span><span style="font-family:Vazir">Godot 4 </span><span style="font-family:Droid Sans Devanagari"><span style="font-family:Vazir">اضافه می&zwnj;شوند بگذریم، نسخه جدید </span><span style="font-family:Vazir">گودوت </span></span><span style="font-family:Vazir">(Godot) </span><span style="font-family:Droid Sans Devanagari"><span style="font-family:Vazir">د</span><span style="font-family:Vazir">ر سایر بخش&zwnj;ها هم</span><span style="font-family:Vazir"> حرف&zwnj;هایی برای گفتن دارد</span></span><span style="font-family:Vazir">.</span></p>\r\n\r\n<p dir="rtl"><span style="font-family:Droid Sans Devanagari"><span style="font-family:Vazir">از جمله دیگر امکانات اضافه شده در </span></span><span style="font-family:Vazir">Godot 4 </span><span style="font-family:Droid Sans Devanagari"><span style="font-family:Vazir">می&zwnj;توان به رمزنگاری </span></span><span style="font-family:Vazir">DTLS</span><span style="font-family:Vazir"> </span><span style="font-family:Droid Sans Devanagari"><span style="font-family:Vazir">اشاره کرد</span></span><span style="font-family:Vazir">. </span><span style="font-family:Droid Sans Devanagari"><span style="font-family:Vazir">با این رمزنگاری جدید شما می&zwnj;توانید </span></span><span style="font-family:Vazir">API</span><span style="font-family:Droid Sans Devanagari"><span style="font-family:Vazir">های ایمن تری در </span><span style="font-family:Vazir">گودوت </span></span><span style="font-family:Vazir">(Godot) </span><span style="font-family:Droid Sans Devanagari"><span style="font-family:Vazir">داشته باشید و اتصالات شما به سرور امن تر از قبل باشد</span></span><span style="font-family:Vazir">. </span><span style="font-family:Droid Sans Devanagari"><span style="font-family:Vazir">در ادامه ب</span><span style="font-family:Vazir">رخی امکانات دیگر که در گودوت </span></span><span style="font-family:Vazir">4 </span><span style="font-family:Droid Sans Devanagari"><span style="font-family:Vazir">وجود خواهند داشت</span><span style="font-family:Vazir"> را ذکر می&zwnj;کنیم</span></span><span style="font-family:Vazir">.</span></p>\r\n\r\n<h3 dir="rtl"><span style="font-family:Vazir">سرور ناوبری جدید</span></h3>\r\n\r\n<p dir="rtl"><span style="font-family:Droid Sans Devanagari"><span style="font-family:Vazir">پیش از این در </span><span style="font-family:Vazir">گودوت </span></span><span style="font-family:Vazir">(Godot) </span><span style="font-family:Droid Sans Devanagari"><span style="font-family:Vazir">شما برای ناوربری تنها می توانستید از </span></span><code>Navigation</code><span style="font-family:Vazir"> node</span><span style="font-family:Vazir"> </span><span style="font-family:Droid Sans Devanagari"><span style="font-family:Vazir">استفاده کنید که محدودیت&zwnj;هایی به همراه داشت</span></span><span style="font-family:Vazir">. </span><span style="font-family:Droid Sans Devanagari"><span style="font-family:Vazir">با اضافه شدن </span></span><span style="font-family:Vazir">Navigation Server </span><span style="font-family:Droid Sans Devanagari"><span style="font-family:Vazir">شما می&zwnj;توانید کارهای بیشتر و منطقی&zwnj;تری انجام دهید و ناوربری پیشرفته&zwnj;تری در بازی بسازید</span></span><span style="font-family:Vazir">.</span></p>\r\n\r\n<blockquote>\r\n<p><a href="http://cgeeksc.ir/post/headfootball-godot">ساخت پروژه Head Football در انجین Godot</a></p>\r\n</blockquote>\r\n\r\n<h3 dir="rtl"><span style="font-family:Droid Sans Devanagari"><span style="font-family:Vazir">خ</span><span style="font-family:Vazir">روجی </span></span><span style="font-family:Vazir">HTML5 </span><span style="font-family:Droid Sans Devanagari"><span style="font-family:Vazir">جدید</span></span></h3>\r\n\r\n<p dir="rtl"><span style="font-family:Droid Sans Devanagari"><span style="font-family:Vazir">گرچه خروجی </span></span><span style="font-family:Vazir">HTML5 </span><span style="font-family:Droid Sans Devanagari"><span style="font-family:Vazir">پیش از این هم در </span><span style="font-family:Vazir">گودوت </span></span><span style="font-family:Vazir">(Godot) </span><span style="font-family:Droid Sans Devanagari"><span style="font-family:Vazir">وجود داشت اما در نسخه جدید تغییراتی در این شیوه به وجود خواهند آمد که اتصالات و نحوه کار این خروجی را بهبود می&zwnj;دهند ک</span><span style="font-family:Vazir">ه باعث می&zwnj;شوند</span><span style="font-family:Vazir"> اجرا و عملکرد بهتری از بازی&zwnj;ها را در خروجی </span></span><span style="font-family:Vazir">HTML5 </span><span style="font-family:Droid Sans Devanagari"><span style="font-family:Vazir">شاهد ب</span><span style="font-family:Vazir">اشیم</span></span><span style="font-family:Vazir">.</span></p>\r\n\r\n<p dir="rtl"><span style="font-family:Droid Sans Devanagari"><span style="font-family:Vazir">د</span><span style="font-family:Vazir">ر کنار این&zwnj;ها رابط کاربری گودوت هم بهبود خواهد یافت و در کنار آن شاهد قوی&zwnj;تر شدن و روان&zwnj;تر اجرا شدن </span></span><span style="font-family:Vazir">Gdscript </span><span style="font-family:Droid Sans Devanagari"><span style="font-family:Vazir">هم خواهیم بود</span></span><span style="font-family:Vazir">.</span></p>\r\n\r\n<h4 dir="rtl"><span style="font-family:Vazir">Vulkan؛ همان چیزی که انتظارش را می&zwnj;کشیدید</span></h4>\r\n\r\n<p dir="rtl"><span style="font-family:Vazir">از مدت&zwnj;ها قبل اطلاعیه&zwnj;ها و اخباری در سایت رسمی گودوت در رابطه با Vulkan </span><span style="font-family:Vazir">منتشر شد و تیم توسعه دهنده گودوت خبر از اضافه شدن </span><span style="font-family:Vazir">Vulkan </span><span style="font-family:Vazir">به این موتور بازی&zwnj;سازی را دادند</span><span style="font-family:Vazir">.</span></p>\r\n\r\n<p dir="rtl"><span style="font-family:Vazir">اما این Vulkan </span><span style="font-family:Vazir">که تا این حد مورد ستایش قرار میگیرد چیست و چه چیزی به بازی&zwnj;های ما اضافه خواهد کرد؟</span></p>\r\n\r\n<p dir="rtl" style="text-align:center"><span style="font-family:Vazir"><img alt="یادگیری گودوت" src="/media/uploads/2020/10/10/5a96813c154bd636778829.svg" style="height:447px; width:1164px" /></span></p>\r\n\r\n<p dir="rtl"><span style="font-family:Vazir">Vulkan در واقع که رابط برنامه نویسی گرافیکی یا به زبان ساده&zwnj;تر یک </span><span style="font-family:Vazir">API </span><span style="font-family:Vazir">برای طراحی گرافیک بازی&zwnj;هاست</span><span style="font-family:Vazir">. </span><span style="font-family:Vazir">کار </span><span style="font-family:Vazir">Vulkan </span><span style="font-family:Vazir">این است که کارهای طراحی افکت&zwnj;ها، طراحی سایه&zwnj;ها و نور پردازی را ساده&zwnj;تر و در عین حال قوی&zwnj;تر و با کیفیت&zwnj;تر خواهد کرد.</span></p>\r\n\r\n<p dir="rtl"><span style="font-family:Vazir">در واقع با حضور Vulkan </span><span style="font-family:Vazir">علاوه بر اینکه کیفیت بیشتری در بازی های ساخته شده با گودوت را شاهد خواهیم بود، عملکرد بهتری را هم خواهیم دید</span><span style="font-family:Vazir">. </span><span style="font-family:Vazir">پیش از این کار </span><span style="font-family:Vazir">Vulkan </span><span style="font-family:Vazir">را </span><span style="font-family:Vazir">OpenGL2 </span><span style="font-family:Vazir">و </span><span style="font-family:Vazir">3 </span><span style="font-family:Vazir">در گودوت انجام می&zwnj;دادند و حضور </span><span style="font-family:Vazir">Vulkan </span><span style="font-family:Vazir">در گودوت را می&zwnj;توان یک جهش نسل دانست</span><span style="font-family:Vazir">.</span></p>\r\n\r\n<p dir="rtl"><span style="font-family:Vazir">این&zwnj;ها تنها بخشی از ویژگی&zwnj;ها و امکاناتی بودند که در گودوت (Godot) 4 </span><span style="font-family:Vazir">شاهد خواهیم بود</span><span style="font-family:Vazir">. </span><span style="font-family:Vazir">نسخه جدید موتور بازی&zwnj;سازی گودوت پیشرفت&zwnj;هایی را همراه با خود به دنیای بازی&zwnj;سازی خواهد آورد و شاید پس از این بیشتر شاهد استفاده شرکت&zwnj;های بزرگ از گودوت </span><span style="font-family:Vazir">(Godot) </span><span style="font-family:Vazir">باشیم.</span></p>\r\n\r\n<p dir="rtl"><span style="font-family:Vazir">با این نسخه جدید حالا گودوت (Godot) </span><span style="font-family:Vazir">نه تنها برای آثار دو بعدی بلکه برای عناوین سه بعدی هم می&zwnj;تواند بسیار خوب و بهتر از گذشته و در حد یا حتی بهتر از بسیاری از موتورهای بازی&zwnj;سازی تجاری و مطرح عمل کند</span><span style="font-family:Vazir">. </span><span style="font-family:Vazir">باید دید گودوت </span><span style="font-family:Vazir">4 در عمل چگونه خواهد بود و آیا روزی می&zwnj;تواند جای یونیتی یا سایر موتورهای بازی&zwnj;سازی بزرگ را بگیرد یا خیر؟ </span></p>\r\n\r\n<p dir="rtl">&nbsp;</p>\r\n\r\n<p dir="rtl">&nbsp;</p>	2020-10-10	images/posts/post-site-godot4.png	godot-4	published	2	\N	<p>https://godotengine.org/news/<br></p>	\N	7	گودوت یک انجین بازی سازی آزاد و قدرتمند است که امکان ساخت انواع بازی‌های دو بعدی و سه بعدی را برای کاربران فراهم می‌کند. نسخه جدید این انجین یعنی Godot 4 به زودی منتشر خواهد شد و تغییرات زیادی را در آن شاهد هستیم که گودوت را قوی تر از قبل می‌کنند.	\N	2020-10-10 15:30:00+00	گودوت
28	Vue چیست؛ معرفی فریمورک محبوب Vue (ویو)	<p dir="rtl">&nbsp;<span style="font-family:Vazir">سال&zwnj;ها پیش توسعه Front-End </span><span style="font-family:Vazir">چندان پیچیده نبود و وب در صفحاتی نه چندان زیبا و ایستا خلاصه می&zwnj;شد</span><span style="font-family:Vazir">. </span><span style="font-family:Vazir">اما به مرور زمان تحولاتی ایجاد شد و با رشد روز افزون جاوا اسکریپت و فریمورک&zwnj;های </span><span style="font-family:Vazir"><a href="http://cgeeksc.ir/category/Frontend">Front-End</a> </span><span style="font-family:Vazir">امروز صفحات وب دیگر آن صفحات خشک سابق نیستند و دچار تحولات زیادی شدند</span><span style="font-family:Vazir">.</span></p>\r\n\r\n<p dir="rtl"><span style="font-family:Vazir">حالا تصور توسعه یک وبسایت بدون استفاده از جاوا اسکریپت و فریمورک&zwnj;های قدرتمندش چندان کار ساده&zwnj;ای نیست و مطمئنا بدون جاوا اسکریپت سایت ما در نگاه مخاطبان چندان زیبا نخواهد بود. </span><span style="font-family:Vazir">اهمیت </span><span style="font-family:Vazir">Front-End </span><span style="font-family:Vazir">و داشتن یک ظاهر خوب برای وبسایت&zwnj;ها باعث شده در این سال&zwnj;ها شرکت&zwnj;های بزرگی دست به توسعه فریمورک قدرتمندی بزنند تا بتوانند راحتی، کیفیت و سرعت را همزمان داشته باشند و یک قدم بیشتر از اسکریپت&zwnj;های ساده بردارند</span><span style="font-family:Vazir">.</span></p>\r\n\r\n<p dir="rtl"><span style="font-family:Vazir">تا مدت&zwnj;ها پیش دو شرکت بزرگ دنیای تکنولوژی یعنی فیسبوک و گوگل که همیشه رقابت خاصی با یکدیگر داشتند در دنیای Front-End </span><span style="font-family:Vazir">نیز با هم سرشاخ بودند و فیسبوک با </span><span style="font-family:Vazir">React </span><span style="font-family:Vazir">پا به این میدان گذاشته بود و گوگل هم با </span><span style="font-family:Vazir">Angular </span><span style="font-family:Vazir">برای فیسبوک کری می&zwnj;خواند</span><span style="font-family:Vazir">.</span></p>\r\n\r\n<blockquote>\r\n<p><a href="http://cgeeksc.ir/post/frontend-and-backend">تفاوت&zwnj;های Backend و Frontend</a></p>\r\n</blockquote>\r\n\r\n<p dir="rtl"><span style="font-family:Vazir">این رقابت در بین این دو فریمورک Front-End </span><span style="font-family:Vazir">هنوز هم در جریان است اما گویا قرار است این رقابت برای این دو فریمورک با ورود فریمورکی جدید به نام </span><span style="font-family:Vazir">Vue </span><span style="font-family:Vazir">به دنیای فرانت</span><span style="font-family:Vazir">-</span><span style="font-family:Vazir">اند سخت&zwnj;تر شود.</span></p>\r\n\r\n<p dir="rtl"><span style="font-family:Vazir">در این مطلب قصد بررسی و معرفی فریمورک محبوب و قدرتمند این روزهای دنیای Front-End </span><span style="font-family:Vazir">یعنی </span><span style="font-family:Vazir"><strong>Vue.js</strong> </span><span style="font-family:Vazir">را داریم</span><span style="font-family:Vazir">. </span><span style="font-family:Vazir">فریمورکی که با ورودش لرزه به تن </span><span style="font-family:Vazir">React </span><span style="font-family:Vazir">و </span><span style="font-family:Vazir">Angular </span><span style="font-family:Vazir">انداخت و در مدتی کوتاه توانست جای خود را میان کاربران و توسعه&zwnj;دهندگان باز کند</span><span style="font-family:Vazir">. </span><span style="font-family:Vazir">اگر به توسعه </span><span style="font-family:Vazir">Front-End </span><span style="font-family:Vazir">علاقه مندید این مطلب از رسانه جامعه گیک&zwnj;های کامپیوتر را از دست ندهید</span><span style="font-family:Vazir">.</span></p>\r\n\r\n<p dir="rtl" style="text-align:center"><img alt="فریمورک Vue" src="/media/uploads/2020/10/17/17ocwu-twqvlupmszdzwkw.png" style="height:453px; width:758px" /></p>\r\n\r\n<h2>کمی در مورد Vue.js</h2>\r\n\r\n<p dir="rtl"><span style="font-family:Vazir"><strong>Vue.js</strong><span style="font-family:Vazir"> </span>یک فریمورک متن باز است که برای اولین بار در فوریه </span><span style="font-family:Vazir">2014 </span><span style="font-family:Vazir">منتشر شد</span><span style="font-family:Vazir">. </span><span style="font-family:Vazir">این فریمورک توسط </span><strong><span style="font-family:Vazir">Evan You (</span><span style="font-family:Vazir">ایوان یو</span></strong><span style="font-family:Vazir"><strong>)</strong> </span><span style="font-family:Vazir">که سال&zwnj;ها خود در گوگل به عنوان توسعه دهنده کار می&zwnj;کرد و پروژه&zwnj;های زیادی با </span><span style="font-family:Vazir">Angular </span><span style="font-family:Vazir">توسعه داده بود نوشته شد</span><span style="font-family:Vazir">. Evan You (</span><span style="font-family:Vazir">ایوان یو</span><span style="font-family:Vazir">) </span><span style="font-family:Vazir">که به طور کامل به چم و خم </span><span style="font-family:Vazir">Angular </span><span style="font-family:Vazir">آشنا بود با این فکر که</span><span style="font-family:Vazir">:</span></p>\r\n\r\n<blockquote>\r\n<p dir="rtl"><span style="font-family:Vazir">اگر می&zwnj;توانستم بخشی را که واقعاً در مورد انگولار دوست داشتم استخراج و چیز خیلی سبک&zwnj;وزنی بسازم.</span></p>\r\n</blockquote>\r\n\r\n<p dir="rtl"><span style="font-family:Vazir">پس از ترک گوگل دست به توسعه فریموریک Vue.js </span><span style="font-family:Vazir">زد.</span></p>\r\n\r\n<p dir="rtl"><span style="font-family:Vazir">فریمورک Vue.js </span><span style="font-family:Vazir">به سرعت رشد کرد و توانست با دریافت بیش از </span><span style="font-family:Vazir">170k </span><span style="font-family:Vazir">ستاره در گیت&zwnj;هاب حتی از </span><span style="font-family:Vazir">React </span><span style="font-family:Vazir">و </span><span style="font-family:Vazir">Angular </span><span style="font-family:Vazir">پیشی بگیرد</span><span style="font-family:Vazir">. </span><span style="font-family:Vazir">ولی چرا </span><span style="font-family:Vazir">Vue.js </span><span style="font-family:Vazir">تا این حد مورد توجه قرار گرفته است؟</span></p>\r\n\r\n<p dir="rtl" style="text-align:center"><span style="font-family:Vazir"><img alt="Vue در گیت هاب" src="/media/uploads/2020/10/17/1yfxdcgexoejof7noatlthw.png" style="height:440px; width:615px" /></span></p>\r\n\r\n<p dir="rtl"><span style="font-family:Vazir">فریمورک Vue.js </span><span style="font-family:Vazir">به سادگی و بدون چالش قابل استفاده در پروژه&zwnj;های بزرگ است و بسیار سازگار است</span><span style="font-family:Vazir">. </span><span style="font-family:Vazir">همچنین </span><span style="font-family:Vazir">Vue.js </span><span style="font-family:Vazir">بدون نیاز به هیچ پلاگین و یا کتابخانه خاصی قابل استفاده و بسیار ساده و قابل اعتماد است</span><span style="font-family:Vazir">. </span><span style="font-family:Vazir">امروز فریمورک </span><span style="font-family:Vazir">Vue.js </span><span style="font-family:Vazir">توانسته تعداد قابل توجهی اسپانسر و حمایت کننده جذب کند و افراد زیادی در توسعه آن همکاری می&zwnj;کنند.</span></p>\r\n\r\n<p dir="rtl"><span style="font-family:Vazir">با این حال React </span><span style="font-family:Vazir">در رقابت فریمورک&zwnj;های فرانت</span><span style="font-family:Vazir">-</span><span style="font-family:Vazir">اند از نظر شهرت و استفاده&zwnj;های تجاری بر </span><span style="font-family:Vazir">Vue.js </span><span style="font-family:Vazir">برتری دارد اما فریمورک </span><span style="font-family:Vazir">Vue.js </span><span style="font-family:Vazir">به آرامی رشد می&zwnj;کند و وارد دنیای توسعه دهندگان می&zwnj;شود.</span></p>\r\n\r\n<blockquote>\r\n<p dir="rtl"><span style="font-family:Vazir">من فکر می کنم Vue </span><span style="font-family:Vazir">امسال بالاترین میزان رضایت در بین فریمورک&zwnj;های بر پایه </span><span style="font-family:Vazir">JS </span><span style="font-family:Vazir">کسب کرده </span><span style="font-family:Vazir">(91.2</span><span style="font-family:Vazir">٪</span><span style="font-family:Vazir">) - </span><span style="font-family:Vazir">با تشکر از کاربران، ما قصد داریم حتی بهتر از این عمل کنیم</span><span style="font-family:Vazir">! </span><span style="font-family:Vazir">امیدواریم بتوانیم نظر </span><span style="font-family:Vazir">568 </span><span style="font-family:Vazir">نفری را که نمی خواهند دوباره از آن استفاده کنند تغییر دهیم</span><span style="font-family:Vazir">.</span></p>\r\n\r\n<p dir="rtl">ایوان یو - سازنده Vue</p>\r\n</blockquote>\r\n\r\n<p dir="rtl"><span style="font-family:Droid Sans Devanagari"><span style="font-family:Vazir">در حقیقت میزان توسعه دهندگانی که از </span><span style="font-family:Vazir">فریمورک </span></span><span style="font-family:Vazir">Vue.js </span><span style="font-family:Droid Sans Devanagari"><span style="font-family:Vazir">استفاده کردند و قصد دارند باز هم از آن استفاده کنند به نسبت از </span></span><span style="font-family:Vazir">19.6</span><span style="font-family:Droid Sans Devanagari"><span style="font-family:Vazir">٪ در سال </span></span><span style="font-family:Vazir">2017 </span><span style="font-family:Droid Sans Devanagari"><span style="font-family:Vazir">رشد قابل توجهی داشته است</span></span><span style="font-family:Vazir">. </span><span style="font-family:Droid Sans Devanagari"><span style="font-family:Vazir">در واقع </span><span style="font-family:Vazir">فریمورک </span></span><span style="font-family:Vazir">Vue.js </span><span style="font-family:Droid Sans Devanagari"><span style="font-family:Vazir">توانسته بالاترین میزان رضایت بین فریمورک&zwnj;های دیگر را در نظرسنجی </span></span><a href="https://2018.stateofjs.com/front-end-frameworks/overview/" style="color:#000080; text-decoration:underline"><span style="font-family:Vazir">the State of JavaScript survey</span></a><span style="font-family:Vazir"> </span><span style="font-family:Droid Sans Devanagari"><span style="font-family:Vazir">به دست بیاورد</span></span><span style="font-family:Vazir">.</span></p>\r\n\r\n<p dir="rtl"><span style="font-family:Vazir">بیایید نگاهی به آمار چندسال اخیر بیندازیم:</span></p>\r\n\r\n<p dir="rtl" style="text-align:center"><img alt="مقایسه Vue و React" src="/media/uploads/2020/10/17/1qmi2t35-b-ap1ok2wrobda.png" style="height:120px; width:601px" /></p>\r\n\r\n<h2 dir="rtl"><span style="font-family:Vazir">چرا فریمورک Vue.js </span><span style="font-family:Vazir">همچنان پیشرفت می&zwnj;کند؟</span></h2>\r\n\r\n<p dir="rtl"><span style="font-family:Vazir">فرمیورک Vue.js </span><span style="font-family:Vazir">با استفاده از ترکیب </span><span style="font-family:Vazir">Angular </span><span style="font-family:Vazir">و </span><span style="font-family:Vazir">React </span><span style="font-family:Vazir">و اضافه کردن چاشنی خود به این ترکیب به اندازه کافی به مزاج توسعه دهندگان </span><span style="font-family:Vazir">JS </span><span style="font-family:Vazir">خوش آمد.</span></p>\r\n\r\n<p dir="rtl"><span style="font-family:Vazir">در زیر دلایلی که Vue.js </span><span style="font-family:Vazir">توانسته توجه بیشتری را به خود جلب کند می&zwnj;بینیم:</span></p>\r\n\r\n<h3 dir="rtl"><span style="font-family:Vazir">منحنی یادگیری آرام</span></h3>\r\n\r\n<p dir="rtl"><span style="font-family:Vazir">منحنی یادگیری آرام فرمیورک Vue.js </span><span style="font-family:Vazir">قلب توسعه دهندگان مبتدی و حرفه&zwnj;ای را مال خود کرده</span><span style="font-family:Vazir">. </span><span style="font-family:Vazir">شما پس از مراجعه به راهنمای رسمی فرمیورک </span><span style="font-family:Vazir">Vue.js </span><span style="font-family:Vazir">می&zwnj;توانید ساخت اولین برنامه خود را شروع کنید و نقطه قوت فرمیورک </span><span style="font-family:Vazir">Vue.js </span><span style="font-family:Vazir">این است که نیاز نیست پیش از آن </span><span style="font-family:Vazir">ES</span><span style="font-family:Vazir">، </span><span style="font-family:Vazir">TypeScript</span><span style="font-family:Vazir">، </span><span style="font-family:Vazir">JSX </span><span style="font-family:Vazir">و یا سیستم&zwnj;های دیگر را بلد باشید.</span></p>\r\n\r\n<p dir="rtl"><span style="font-family:Vazir">تنها چیزهایی که نیاز دارید فهم پایه&zwnj;ای از جاوا اسکریپت، HTML </span><span style="font-family:Vazir">و </span><span style="font-family:Vazir">CSS </span><span style="font-family:Vazir">است</span><span style="font-family:Vazir">. </span><span style="font-family:Vazir">البته اگر تجربه&zwnj;ای در کار با فریمورک&zwnj;های وب داشته باشید بسیار مفید است</span><span style="font-family:Vazir">.</span></p>\r\n\r\n<blockquote>\r\n<p><a href="http://cgeeksc.ir/post/Deno-Introduce">دینو؛ دایناسور دوست داشتنی از جنس جاوا اسکریپت</a></p>\r\n</blockquote>\r\n\r\n<p dir="rtl"><span style="font-family:Vazir">دسترس پذیری بالای فرمیورک Vue.js </span><span style="font-family:Vazir">به تیم&zwnj;هایی که می خواهند سریع توسعه بدهند کمک می&zwnj;کند تا تمام خلاقیت خود را بدون اینکه زمان زیادی را از دست دهد پیاده کند</span><span style="font-family:Vazir">. </span><span style="font-family:Vazir">جمع آوری یک تیم از توسعه دهندگان فرمیورک </span><span style="font-family:Vazir">Vue.js </span><span style="font-family:Vazir">راحت و سریع است و توسعه دهندگان </span><span style="font-family:Vazir">React </span><span style="font-family:Vazir">می&zwnj;توانند به سادگی به </span><span style="font-family:Vazir">Vue.js </span><span style="font-family:Vazir">مهاجرت کنند.</span></p>\r\n\r\n<p dir="rtl"><span style="font-family:Vazir">Vue.js همچنین می&zwnj;تواند زمان لازم برای درک پیچیدگی&zwnj;ها را کاهش دهد و به خصوص برای برنامه&zwnj;های ساده بسیار مناسب است.</span></p>\r\n\r\n<h3 dir="rtl">&nbsp;<span style="font-family:Vazir">فضای توسعه انعظاف پذیر و ماژولار</span></h3>\r\n\r\n<p dir="rtl"><span style="font-family:Vazir">برنامه&zwnj;های وب ساخته شده با Vue.js </span><span style="font-family:Vazir">با استفاده از </span><span style="font-family:Vazir">Vue components </span><span style="font-family:Vazir">ساخته شده&zwnj;اند</span><span style="font-family:Vazir">. </span><span style="font-family:Vazir">و این انعطاف پذیری بالایی برای توسعه دهندگان فراهم می&zwnj;کند</span><span style="font-family:Vazir">. Vue component&zwnj;</span><span style="font-family:Vazir">ها به راحتی جفت می&zwnj;شوند و سرعت توسعه را افزایش می&zwnj;دهند.</span></p>\r\n\r\n<p dir="rtl"><span style="font-family:Vazir">ساختار component-based </span><span style="font-family:Vazir">برای وب اپ&zwnj;هایی که در آینده مقیاس بزرگتری خواهند داشت یک انتخاب ایده آل است</span><span style="font-family:Vazir">. </span><span style="font-family:Vazir">در فرمیورک </span><span style="font-family:Vazir">Vue.js </span><span style="font-family:Vazir">ساخت برنامه&zwnj;هایی در مقیاس بزرگ نیازمند سیستم ماژولار از ابتدای توسعه است</span><span style="font-family:Vazir">. </span><span style="font-family:Vazir">اما </span><span style="font-family:Vazir">Vue.js </span><span style="font-family:Vazir">برای این موارد انعطاف پذیری&zwnj;ای به توسعه دهنگان ارائه می&zwnj;دهد که بعدا بتوانید کد منبع را با نیازهای پردازشی شما تغییر دهید.</span></p>\r\n\r\n<p dir="rtl" style="text-align:center"><span style="font-family:Vazir"><img alt="ابزارهای فرمیورک Vue" src="/media/uploads/2020/10/17/1d9xqghadkr-9-20rerfsaq.png" style="height:263px; width:595px" /></span></p>\r\n\r\n<h3 dir="rtl"><span style="font-family:Vazir">لذت بردن از توسعه</span></h3>\r\n\r\n<p dir="rtl"><span style="font-family:Vazir">توسعه دهندگان معمولا راحتی ساخت برنامه&zwnj;ها با Vue.js </span><span style="font-family:Vazir">را برجسته می&zwnj;کنند</span><span style="font-family:Vazir">. </span><span style="font-family:Vazir">آزادی در انتخاب ساختار کدها و کدگذاری بدون نسخه دلایل اصلی وجود این همه عشق و توجه به فرمیورک </span><span style="font-family:Vazir">Vue.js </span><span style="font-family:Vazir">است.</span></p>\r\n\r\n<p dir="rtl"><span style="font-family:Vazir">مرتب سازی از طریق Codebase </span><span style="font-family:Vazir">بدون دردسر است و تقریبا تمام چیزی که نیاز دارید داخل فایل </span><span style="font-family:Vazir">.vue </span><span style="font-family:Vazir">وجود دارد</span><span style="font-family:Vazir">. </span><span style="font-family:Vazir">از مدل داده و الگو تا </span><span style="font-family:Vazir">CSS </span><span style="font-family:Vazir">و ویژگی&zwnj;ها</span><span style="font-family:Vazir">. </span><span style="font-family:Vazir">فهمیدن کار یک کامپوننت در فرمیورک </span><span style="font-family:Vazir">Vue.js </span><span style="font-family:Vazir">باعث سردرد نیست و به راحتی انجام می&zwnj;شود.</span></p>\r\n\r\n<h3 dir="rtl"><span style="font-family:Vazir">اکوسیستم غنی و تطبیق پذیر بودن</span></h3>\r\n\r\n<p dir="rtl"><span style="font-family:Droid Sans Devanagari"><span style="font-family:Vazir">با داشتن مجموعه&zwnj;ای غنی از کتابخانه&zwnj;ها و ابزارها، دنیای </span></span><span style="font-family:Vazir">Vue.js </span><span style="font-family:Droid Sans Devanagari"><span style="font-family:Vazir">هر آنچه که یک توسعه دهنده نیاز دارد را داراست</span></span><span style="font-family:Vazir">. </span><span style="font-family:Droid Sans Devanagari"><span style="font-family:Vazir">از جمله ابزارهایی که تجربه کدزنی را تقویت می&zwnj;کنند می&zwnj;توان به </span></span><span style="font-family:Vazir">Vuex </span><span style="font-family:Droid Sans Devanagari"><span style="font-family:Vazir">برای مدیریت اجزا، </span></span>Vue-routing<span style="font-family:Vazir"> </span><span style="font-family:Droid Sans Devanagari"><span style="font-family:Vazir">برای مسیریابی و نقشه گذاری صفحه با توجه به </span></span><span style="font-family:Vazir">URL</span><span style="font-family:Droid Sans Devanagari"><span style="font-family:Vazir">های پروژه اشاره کرد</span></span><span style="font-family:Vazir">. Vue.js </span><span style="font-family:Droid Sans Devanagari"><span style="font-family:Vazir">همچنین ابزارهای توسعه خودش را هم دارد که به عنوان یک اکستنشن برای مرورگر است</span></span><span style="font-family:Vazir">. </span><span style="font-family:Droid Sans Devanagari"><span style="font-family:Vazir">این ویژگی دیباگ و چک کردن برنامه را آسان می&zwnj;کند</span></span><span style="font-family:Vazir">. </span><span style="font-family:Droid Sans Devanagari"><span style="font-family:Vazir">این ابزار امکان ویرایش برنامه به صورت زنده و دیباگ برنامه و دیدن پیش نمایش و تغییرات ایجاد شده را به شما می&zwnj;دهد</span></span><span style="font-family:Vazir">.</span></p>\r\n\r\n<p dir="rtl" style="text-align:center"><img alt="معرفی فریمورک Vue" src="/media/uploads/2020/10/17/vue.jpg" style="height:437px; width:700px" /></p>\r\n\r\n<h3 dir="rtl"><span style="font-family:Vazir">توسعه برای موبایل</span></h3>\r\n\r\n<p dir="rtl"><span style="font-family:Droid Sans Devanagari"><span style="font-family:Vazir">فرمیورک </span></span><span style="font-family:Vazir">Vue.js </span><span style="font-family:Droid Sans Devanagari"><span style="font-family:Vazir">به توسعه دهندگان اجازه می&zwnj;دهد روش&zwnj;هایی برای توسعه رابط کاربری </span></span><span style="font-family:Vazir">cross-platform </span><span style="font-family:Droid Sans Devanagari"><span style="font-family:Vazir">داشته باشند</span></span><span style="font-family:Vazir">. Weex </span><span style="font-family:Droid Sans Devanagari"><span style="font-family:Vazir">که توسط پلتفرم فروش آنلاین </span></span><span style="font-family:Vazir">alibaba </span><span style="font-family:Droid Sans Devanagari"><span style="font-family:Vazir">ساخته شده و </span></span>NativeScript<span style="font-family:Vazir"> </span><span style="font-family:Droid Sans Devanagari"><span style="font-family:Vazir">اجازه توسعه برنامه برای موبایل را می&zwnj;دهند</span></span><span style="font-family:Vazir">.</span></p>\r\n\r\n<p dir="rtl"><span style="font-family:Droid Sans Devanagari"><span style="font-family:Vazir">بر خلاف </span></span><span style="font-family:Vazir">React Native </span><span style="font-family:Droid Sans Devanagari"><span style="font-family:Vazir">که می&zwnj;گوید </span></span><span style="font-family:Vazir">&quot;</span><strong><span style="font-family:Droid Sans Devanagari"><span style="font-family:Vazir">یک بار یادبگیر، هرچیزی بنویس</span></span></strong><span style="font-family:Vazir">&quot;</span><span style="font-family:Droid Sans Devanagari"><span style="font-family:Vazir">، </span></span><span style="font-family:Vazir">Vue </span><span style="font-family:Droid Sans Devanagari"><span style="font-family:Vazir">می&zwnj;گوید</span></span><span style="font-family:Vazir">: &quot;</span><strong><span style="font-family:Droid Sans Devanagari"><span style="font-family:Vazir">یک بار بنویس، همه جا اجرا کن</span></span></strong><span style="font-family:Vazir">&quot;. </span><span style="font-family:Droid Sans Devanagari"><span style="font-family:Vazir">این قابلیت این امکان را در اختیار شما قرار می&zwnj;دهد که </span></span><span style="font-family:Vazir">UI </span><span style="font-family:Droid Sans Devanagari"><span style="font-family:Vazir">را شفاف و قابل تکرار بین پلتفرم&zwnj;های مختلف مدیریت کنید که قابلیتی فوق العاده است</span></span><span style="font-family:Vazir">.</span></p>\r\n\r\n<h3 dir="rtl"><span style="font-family:Vazir">واکنش پذیری</span></h3>\r\n\r\n<p dir="rtl"><span style="font-family:Vazir">داده&zwnj;ها در عناصر مختلف HTML </span><span style="font-family:Vazir">در برنامه&zwnj;های مدرن به صورت پویا رندر می&zwnj;شوند</span><span style="font-family:Vazir">. Vue.js </span><span style="font-family:Vazir">با قابلیت انحصاری خود رابط کاربری را به صورت خودکار تغییر می&zwnj;دهد</span><span style="font-family:Vazir">. </span><span style="font-family:Vazir">این ویژگی زمان زیادی را ذخیره می&zwnj;کند و خط&zwnj;های کد اضافه را حذف می&zwnj;کند و در نتیجه توسعه دهنده می&zwnj;تواند تمرکز بیشتری برای توسعه برنامه داشته باشد.</span></p>\r\n\r\n<h3 dir="rtl"><span style="font-family:Vazir">عملکرد عالی در ساخت برنامه</span></h3>\r\n\r\n<p dir="rtl"><span style="font-family:Droid Sans Devanagari"><span style="font-family:Vazir">فرمیورک </span></span><span style="font-family:Vazir">Vue.js </span><span style="font-family:Droid Sans Devanagari"><span style="font-family:Vazir">سریع است</span></span><span style="font-family:Vazir">. Vue </span><span style="font-family:Droid Sans Devanagari"><span style="font-family:Vazir">سریع&zwnj;ترین فریمورک نیست ولی چیزی که در حال حاضر با </span></span><span style="font-family:Vazir">Vue.js </span><span style="font-family:Droid Sans Devanagari"><span style="font-family:Vazir">امکان پذیر است ارائه </span></span><span style="font-family:Vazir">UX </span><span style="font-family:Droid Sans Devanagari"><span style="font-family:Vazir">و </span></span><span style="font-family:Vazir">UI </span><span style="font-family:Droid Sans Devanagari"><span style="font-family:Vazir">بی و عیب و نقص در </span></span><span style="font-family:Vazir">SPA </span><span style="font-family:Droid Sans Devanagari"><span style="font-family:Vazir">است</span></span><span style="font-family:Vazir">. </span></p>\r\n\r\n<p dir="rtl"><span style="font-family:Vazir">در بازار برنامه&zwnj;های موبایلی برنامه&zwnj;های Vue </span><span style="font-family:Vazir">سریع&zwnj;تر از </span><span style="font-family:Vazir">Angular </span><span style="font-family:Vazir">و </span><span style="font-family:Vazir">React </span><span style="font-family:Vazir">هستند</span><span style="font-family:Vazir">. </span><span style="font-family:Vazir">از آنجایی که بیشتر کاربران بیشتر از </span><span style="font-family:Vazir">3 </span><span style="font-family:Vazir">ثانیه برای لود شدن صفحه منتظر نمی&zwnj;مانند و دنیای وب در حال کوچ به موبایل است سرعت </span><span style="font-family:Vazir">Vue </span><span style="font-family:Vazir">بسیار مهم است.</span></p>\r\n\r\n<p dir="rtl" style="text-align:center"><span style="font-family:Vazir"><img alt="اپ موبایل با Vue" src="/media/uploads/2020/10/17/best-vuejs-mobile-frameworks-can-we-build-native-apps-with-vue_-1024x686.png" style="height:575px; width:859px" /></span></p>\r\n\r\n<h3 dir="rtl"><span style="font-family:Vazir">HTML Templates</span></h3>\r\n\r\n<p dir="rtl"><span style="font-family:Droid Sans Devanagari"><span style="font-family:Vazir">این کمی سوال برانگیز است ولی </span></span>HTML-based templates<span style="font-family:Vazir"> </span><span style="font-family:Droid Sans Devanagari"><span style="font-family:Vazir">در </span></span><span style="font-family:Vazir">Vue </span><span style="font-family:Droid Sans Devanagari"><span style="font-family:Vazir">باعث افزایش بهره وری به خوصوص برای آن عده&zwnj;ای که پشت صحنه </span></span><span style="font-family:Vazir">HTML </span><span style="font-family:Droid Sans Devanagari"><span style="font-family:Vazir">دارند</span></span><span style="font-family:Vazir">. </span><span style="font-family:Droid Sans Devanagari"><span style="font-family:Vazir">تمپلیت&zwnj;های </span></span><span style="font-family:Vazir">Vue </span><span style="font-family:Droid Sans Devanagari"><span style="font-family:Vazir">همچنین کمک می کنند که اپ&zwnj;ها به صورت زنده واکنش پذیر باشند</span></span><span style="font-family:Vazir">. </span><span style="font-family:Droid Sans Devanagari"><span style="font-family:Vazir">تمپلیت&zwnj;هایی که با </span></span><span style="font-family:Vazir">Vue </span><span style="font-family:Droid Sans Devanagari"><span style="font-family:Vazir">کامپایل می&zwnj;شوند باید رندر </span></span><span style="font-family:Vazir">DOM </span><span style="font-family:Droid Sans Devanagari"><span style="font-family:Vazir">را ارائه دهند</span></span><span style="font-family:Vazir">. </span><span style="font-family:Droid Sans Devanagari"><span style="font-family:Vazir">در نتیجه وقتی بخشی از برنامه تغییر می&zwnj;کند فرمیورک </span></span><span style="font-family:Vazir">Vue.js </span><span style="font-family:Droid Sans Devanagari"><span style="font-family:Vazir">کوچکترین دستکاری&zwnj;ها را به </span></span><span style="font-family:Vazir">DOM </span><span style="font-family:Droid Sans Devanagari"><span style="font-family:Vazir">ارائه می&zwnj;دهد</span></span><span style="font-family:Vazir">.</span></p>\r\n\r\n<h3 dir="rtl"><span style="font-family:Vazir">جامعه کاربری پر جنب و جوش</span></h3>\r\n\r\n<p dir="rtl"><span style="font-family:Droid Sans Devanagari"><span style="font-family:Vazir">جامعه کاربری فرمیورک </span></span><span style="font-family:Vazir">Vue.js </span><span style="font-family:Droid Sans Devanagari"><span style="font-family:Vazir">مشارکت فعالی در توسعه فریمورک دارند</span></span><span style="font-family:Vazir">. </span><span style="font-family:Droid Sans Devanagari"><span style="font-family:Vazir">سالانه همایش&zwnj;های بزرگی در سراسر جهان برگزار می&zwnj;شوند که به طور کامل به </span></span><span style="font-family:Vazir">Vue </span><span style="font-family:Droid Sans Devanagari"><span style="font-family:Vazir">اختصاص دارند</span></span><span style="font-family:Vazir">.</span></p>\r\n\r\n<h3 dir="rtl"><span style="font-family:Vazir">تسلط ساده بر Vue</span></h3>\r\n\r\n<p dir="rtl"><span style="font-family:Vazir">فرمیورک Vue.js </span><span style="font-family:Vazir">داکیومنت رسمی فوق العاده&zwnj;ای دارد که به توسعه دهندگان اجازه می&zwnj;دهد تمام نقاط اکوسیستم </span><span style="font-family:Vazir">Vue </span><span style="font-family:Vazir">را به خوبی حس کنند</span><span style="font-family:Vazir">. </span><span style="font-family:Vazir">راهنمای رسمی الگوها و اطلاعات به خصوصی دارد</span><span style="font-family:Vazir">. </span><span style="font-family:Vazir">داکیومنت </span><span style="font-family:Vazir">API </span><span style="font-family:Vazir">بیشتر اهدافی که توسعه دهنده ممکن است به آن برخورد کند را نشان می&zwnj;دهد.</span></p>\r\n\r\n<blockquote>\r\n<p dir="rtl"><a href="http://cgeeksc.ir/post/what-is-seo">سئو (SEO) چیست و چرا به آن نیاز داریم</a></p>\r\n</blockquote>\r\n\r\n<h3 dir="rtl"><span style="font-family:Vazir">آموزش&zwnj;ها</span></h3>\r\n\r\n<p dir="rtl"><span style="font-family:Vazir">علاوه بر مطالعه داکویمنت رسمی Vue</span><span style="font-family:Vazir">، می&zwnj;توانید با دیدن ویدیوها و مثال&zwnj;های آموزش&zwnj;های در دسترس در کدزنی </span><span style="font-family:Vazir">Vue </span><span style="font-family:Vazir">حرفه&zwnj;ای شوید.</span></p>\r\n\r\n<h4 dir="rtl"><span style="font-family:&quot;Liberation Serif&quot;,serif"><span style="font-family:Vazir">StackOverflow and Official Chat</span></span></h4>\r\n\r\n<p dir="rtl"><span style="font-family:Vazir">برای مشکلاتی که در دوره&zwnj;ها و آموزش&zwnj;ها وجود ندارند شما می&zwnj;توان روی استک سوال بپرسید. </span><span style="font-family:Vazir">حالا سوالت سریع پاسخ داده می&zwnj;شوند و شما می&zwnj;توانید به راحتی پاسخ سوال خود را پیدا کنید.</span></p>\r\n\r\n<p dir="rtl"><span style="font-family:Vazir">شما در فشار مشکل در کدزنی تنها نمی&zwnj;مانید و می&zwnj;توانید از برنامه نویس&zwnj;ها در </span><span style="font-family:&quot;Liberation Serif&quot;,serif"><span style="font-family:Vazir">StackOverflow</span></span><span style="font-family:Vazir"> کمک بگیرید.</span></p>\r\n\r\n<p dir="rtl" style="text-align:center"><span style="font-family:Vazir"><img alt="آموزش Vue" src="/media/uploads/2020/10/17/snx600-pad600x600f8f8f8u2.jpg" style="height:600px; width:600px" /></span></p>\r\n\r\n<h4 dir="rtl"><span style="font-family:Vazir">Vue در حال انقلاب است</span></h4>\r\n\r\n<p dir="rtl"><span style="font-family:Vazir">از زمانی که Vue </span><span style="font-family:Vazir">در سال </span><span style="font-family:Vazir">2014 launch </span><span style="font-family:Vazir">شد بسیاری از توسعه دهنگان به سمت استفاده از فرمیورک </span><span style="font-family:Vazir">Vue.js </span><span style="font-family:Vazir">سوق پیدا کردند و نسخه&zwnj;های زیادی با تغییراتی خوب و مفید منتشر شدند.</span></p>\r\n\r\n<p dir="rtl"><span style="font-family:Vazir">چیزی که در مورد به روزرسانی مهم است این است که بر اساس مشارکت کاربران و بازخورد عمومی است. </span><span style="font-family:Vazir">فرمیورک </span><span style="font-family:Vazir">Vue.js </span><span style="font-family:Vazir">با پشتیبانی شرکت&zwnj;هایی با برندهای بزرگ و شناخته شده سرعت پیشرفت بسیار بالایی دارد و یک اتفاق خارق العاده است.</span></p>\r\n\r\n<p dir="rtl"><span style="font-family:Vazir">اکوسیستم Vue </span><span style="font-family:Vazir">در حال بزرگ&zwnj;تر و بهتر شدن است و دائما توجه بیشتری از توسعه دهندگان و کسب و کارها می&zwnj;گیرد.</span></p>\r\n\r\n<blockquote>\r\n<p dir="rtl"><a href="http://cgeeksc.ir/post/django-vs-flask">مقایسه جنگو و فلسک؛ تقابل فریمورک&zwnj;های وب پایتون</a></p>\r\n</blockquote>\r\n\r\n<h4 dir="rtl">&nbsp;<span style="font-family:Vazir">چه کسانی از Vue استفاده می&zwnj;کند؟</span></h4>\r\n\r\n<p dir="rtl"><span style="font-family:Vazir">Vue.js </span><span style="font-family:Droid Sans Devanagari"><span style="font-family:Vazir">شاید محبوب&zwnj;ترین فریمورک </span></span>front-end<span style="font-family:Vazir"> </span><span style="font-family:Droid Sans Devanagari"><span style="font-family:Vazir">جاوا اسکریپت نباشد اما توسط نام&zwnj;های بزرگی مثل </span></span><span style="font-family:Vazir">Alibaba, Grammarly, Xiaomi, Laracasts و Reuters </span><span style="font-family:Droid Sans Devanagari"><span style="font-family:Vazir">تحت تاثیر قرار گرفته است</span></span><span style="font-family:Vazir">. </span><span style="font-family:Droid Sans Devanagari"><span style="font-family:Vazir">شما می&zwnj;توانید </span><span style="font-family:Vazir">کامپوننت&zwnj;ها، وبسایت&zwnj;ها، قالب&zwnj;ها و برنامه&zwnj;های زیادی را پیدا کنید که با </span></span><span style="font-family:Vazir">Vue </span><span style="font-family:Droid Sans Devanagari"><span style="font-family:Vazir">ساخته شده&zwnj;اند تا عالی بودن </span></span><span style="font-family:Vazir">Vue </span><span style="font-family:Droid Sans Devanagari"><span style="font-family:Vazir">را بیشتر درک کنید</span></span><span style="font-family:Vazir">.</span></p>\r\n\r\n<h4 dir="rtl"><span style="font-family:Vazir">آیا باید Vue را به تکنولوژی&zwnj;های Stack خودم اضافه کنم؟</span></h4>\r\n\r\n<p dir="rtl"><span style="font-family:Vazir">در جواب کوتاه بله، ولی Vue تنها فریمورک </span><span style="font-family:Vazir">front-end </span><span style="font-family:Vazir">نیست که وجود دارد</span><span style="font-family:Vazir">. بهتر است شما تعدادی از فریمورک&zwnj;ها را تست کرده و با آن&zwnj;ها کار کنید تا ببینید کدام یک برای پروژه&zwnj;های شما کار می کنند و به کار کردن با آن علاقه دارید. </span></p>\r\n\r\n<p dir="rtl"><span style="font-family:Droid Sans Devanagari"><span style="font-family:Vazir">در پایان، با اینکه مردم عاشق </span></span><span style="font-family:Vazir">Vue </span><span style="font-family:Droid Sans Devanagari"><span style="font-family:Vazir">هستند اما یک فریمورک کامل نیست</span></span><span style="font-family:Vazir">. </span><span style="font-family:Droid Sans Devanagari"><span style="font-family:Vazir">ولی بگذارید رو راست باشیم</span></span><span style="font-family:Vazir">: </span><span style="font-family:Droid Sans Devanagari"><span style="font-family:Vazir">فرمیورک </span></span><span style="font-family:Vazir">Vue </span><span style="font-family:Droid Sans Devanagari"><span style="font-family:Vazir">بسیار نزدیک به عالی بودن است و می&zwnj;تواند باشد</span></span><span style="font-family:Vazir">. </span><span style="font-family:Droid Sans Devanagari"><span style="font-family:Vazir">و اگر شما در حال تست فریمورک&zwnj;ها با منحنی یادگیری، تداوم نگهداری و توانایی تسریع در توسعه هستید هیچ چیزی مانند </span></span><span style="font-family:Vazir">Vue.js </span><span style="font-family:Droid Sans Devanagari"><span style="font-family:Vazir">نیست</span></span><span style="font-family:Vazir">.</span>&nbsp;&nbsp;&nbsp;</p>	2020-10-17	images/posts/post-site-vue.png	Vue-introduce	published	2	\N	<a href="http://why Vue.js is awesomehttps://medium.com/jrc-tech-drive/why-vuejs-is-so-awesome-926e6afed41" target="_blank">why Vue.js is awesome</a><br>	\N	8	Vue (ویو) یکی از فریمورک‌های محبوب و پیشرو دنیای فرانت-اند است. در این مطلب از جامعه گیک‌های کامپیوتر به معرفی و بیان خصوصیات فریمورک Vue خواهیم پرداخت.	\N	\N	معرفی فریمورک Vue
26	سیستم‌های توصیه‌گر	<p dir="rtl" style="text-align:right"><span style="font-size:18px">احتمالا همگی شما تابحال&nbsp;از دیجیکالا استفاده کرده&zwnj;اید، اگر دقت کرده باشید متوجه این مسئله شده&zwnj;اید که&nbsp;دیجیکالا محصولات مشابه محصولاتی که شما از آن&zwnj;ها دیدن کرده&zwnj;اید و یا جستجو کرده&zwnj;اید به شما پیشنهاد می&zwnj;دهد.</span></p>\r\n\r\n<p dir="rtl" style="text-align:right"><span style="font-size:18px">جالب بنظر می&zwnj;آید، نه؟ آیا می&zwnj;دانید این کار چطور امکان&zwnj;پذیر است&nbsp;و وبسایت&zwnj;ها و اپلیکیشن&zwnj;ها و سرویس&zwnj;های مختلف&nbsp;چطور&nbsp;چنین کاری انجام می&zwnj;دهند؟ مثلا&nbsp;<span style="color:#000000">یوتیوب چطور می&zwnj;داند شما چه ویدیوهایی تماشا می&zwnj;کنید یا گوگل چطور می&zwnj;داند شما چه اخباری دنبال می&zwnj;کنید؟</span></span></p>\r\n\r\n<p dir="rtl" style="text-align:right"><span style="font-size:18px">برای آشنایی با این سیستم&zwnj;ها با این&nbsp;مطلب از جامعه&zwnj;ی گیک&zwnj;های کامپیوتر همراه ما باشید.</span></p>\r\n\r\n<h2 dir="rtl" style="text-align:right"><strong><span style="font-size:18px">سیستم&zwnj;های توصیه&zwnj;گر (Recommender Systems):</span></strong></h2>\r\n\r\n<p dir="rtl" style="text-align:right"><span style="font-size:18px"><span style="color:#000000">سیستم&zwnj;های توصیه&zwnj;گر&nbsp;یکی از مهم&zwnj;ترین دسته&zwnj;های&nbsp;الگوریتم&zwnj;های ماشین لرنینگ می&zwnj;باشند که &quot;پیشنهادهای مرتبط&quot; به کاربر می&zwnj;دهد. به این معنا که از برداشتی که از رفتار شما دارند تلاش می&zwnj;کنند&nbsp;آیتم&zwnj;هایی (محصولات، ویدیوها، اخبار و...) را به شما معرفی کنند که بیشتر به آیتم&zwnj;های موردنظر شما نزدیک هستند.</span></span></p>\r\n\r\n<p dir="rtl" style="text-align:right"><span style="font-size:18px"><span style="color:#000000">در واقع سیستم&zwnj;های توصیه&zwnj;گر شامل یک&zwnj;سری تکنیک&zwnj;ها و الگوریتم&zwnj;هایی می&zwnj;شوند که قادر هستند آیتم&zwnj;های مشابه را به کاربران پیشنهاد بدهند.</span></span></p>\r\n\r\n<p dir="rtl" style="text-align:right"><span style="font-size:18px"><span style="color:#000000">در حالت ایده&zwnj;آل، پیشنهادها تا حد ممکن باید مشابه و مرتبط با آیتم&zwnj;هایی باشد که کاربر می&zwnj;بیند، در اینصورت کاربر با آن آیتم ارتباط برقرار می&zwnj;کند و مشغول آن می&zwnj;شود و بیشتر مواقع کارش نیز راحت&zwnj;تر می&zwnj;شود.&nbsp;</span></span></p>\r\n\r\n<blockquote>\r\n<p dir="rtl" style="text-align:right"><span style="font-size:18px"><a href="http://cgeeksc.ir/post/introduction-to-reinforcement-learning">یادگیری تقویتی چیست؟</a></span></p>\r\n</blockquote>\r\n\r\n<p dir="rtl" style="text-align:right"><span style="font-size:18px"><span style="color:#000000">شاید برایتان سوال باشد که این آیتم&zwnj;ها چگونه انتخاب می&zwnj;شوند؟ پاسخ این است که آیتم&zwnj;ها براساس <strong>ربطشان</strong> به یکدیگر رتبه&zwnj;بندی می&zwnj;شوند و مرتبط&zwnj;ترین آیتم&zwnj;&zwnj;ها&nbsp;به کاربر نشان داده می&zwnj;شوند.</span></span></p>\r\n\r\n<p dir="rtl" style="text-align:right"><span style="font-size:18px"><span style="color:#000000"><strong>شباهت</strong> یا <strong>ارتباط</strong> مقوله&zwnj;ای است که یک سیستم توصیه&zwnj;گر باید متوجه آن بشود که این ارتباط و شباهت براساس&nbsp;<strong>داده&zwnj;های گذشته</strong> می&zwnj;باشند. برای مثال اگر<strong> </strong></span>اخیراً<span style="color:#000000"> ویدیوهایی راجع به فیل&zwnj;ها در یوتیوب دیده باشید، یوتیوب شروع می&zwnj;کند ویدیوهای دیگری که راجع به فیل&zwnj;ها هستند را به شما پیشنهاد می&zwnj;دهد.</span></span></p>\r\n\r\n<p dir="rtl" style="text-align:right"><span style="font-size:18px"><span style="color:#000000">این سیستم&zwnj;ها به دو دسته&zwnj;&zwnj;ی زیر تقسیم می&zwnj;شوند:</span></span></p>\r\n\r\n<ol dir="rtl">\r\n\t<li style="text-align:right"><span style="font-size:18px"><span style="color:#000000">سیستم فیلتر مشترک (Colaborative filtering system)</span></span></li>\r\n\t<li style="text-align:right"><span style="font-size:18px"><span style="color:#000000">سیستم محتوا محور (Content-based system)</span></span></li>\r\n</ol>\r\n\r\n<p dir="rtl" style="text-align:center">&nbsp;</p>\r\n\r\n<p dir="rtl" style="text-align:center"><span style="font-size:18px"><img alt="انواع سیستم توصیه‌گر" src="/media/uploads/2020/10/14/1_g4h4fox6bcjhdmbsxdl0pa.png" style="height:382px; width:552px" /></span></p>\r\n\r\n<p dir="rtl" style="text-align:center"><span style="font-size:14px">شکل 1:انواع مختلف سیستم&zwnj;های توصیه&zwnj;گر</span></p>\r\n\r\n<p dir="rtl" style="text-align:right">&nbsp;</p>\r\n\r\n<h2 dir="rtl" style="text-align:right"><span style="font-size:18px"><strong><span style="color:#000000">سیستم&zwnj;های فیلتر مشترک (Colaborative filtering system):</span></strong></span></h2>\r\n\r\n<p dir="rtl" style="text-align:right"><span style="font-size:18px"><span style="color:#000000">فیلتر مشترک برای سیستم&zwnj;های توصیه&zwnj;&zwnj;گر به روش&zwnj;هایی اطلاق می&zwnj;شود&nbsp;که صرفاً براساس تعاملات گذشته بین کاربران و آیتم&zwnj;های موردنظر می&zwnj;باشند&nbsp;(به این معنا که ما به چیزی به غیر از اطلاعات گذشته&zwnj;ی کاربران احتیاجی نداریم). بنابراین ورودی سیستم تمام داده&zwnj;های گذشته از تعاملات کاربر و آیتم هدف خواهد بود. این داده&zwnj;ها معمولا در یک <strong>ماتریس</strong> ذخیره می&zwnj;شوند که ردیف&zwnj;های آن را <strong>کاربران</strong> تشکیل می&zwnj;دهند و ستون&zwnj;های آن را <strong>آیتم&zwnj;ها</strong>.</span></span></p>\r\n\r\n<p dir="rtl" style="text-align:right"><span style="font-size:18px"><span style="color:#000000">ایده&zwnj;ی اصلی&zwnj;&zwnj;ای که پشت چنین سیستم&zwnj;هایی نهفته است این است که داده&zwnj;های گذشته کاربران باید بقدر&nbsp;کافی موجود باشد که سیستم بتواند پیش&zwnj;بینی خوبی انجام دهد. </span></span></p>\r\n\r\n<p dir="rtl" style="text-align:right">&nbsp;</p>\r\n\r\n<p dir="rtl" style="text-align:center"><span style="font-size:18px"><img alt="عملکرد سیستم‌ توصیه‌گر" src="/media/uploads/2020/10/14/2.gif" style="height:480px; width:498px" /></span></p>\r\n\r\n<p dir="rtl" style="text-align:center"><span style="font-size:14px">شکل 2: تصویری از نحوه فیلتر کردن مشارکتی برای پیش بینی رتبه&zwnj;بندی&nbsp;4 آیتم برای کاربر: یک تصویر ، یک کتاب ، یک ویدیو و یک بازی ویدیویی. براساس داده&zwnj;های گذشته&zwnj;ی&nbsp;کاربران ، یعنی موردعلاقه بودن یا نبودن&nbsp;هر آیتم، سیستم سعی می کند پیش بینی کند که کاربر چگونه مورد جدیدی را ارزیابی می کند که تابحال آن را رتبه&zwnj;بندی نکرده است. خود پیش&zwnj;بینی&zwnj;ها بر&zwnj;اساس رتبه&zwnj;بندی گذشته دیگر کاربرانی است که رفتار آن&zwnj;ها تقریبا مشابه کاربر فعال است. در این حالت، سیستم پیش بینی / توصیه کرده است که کاربر فعال ویدیو را دوست ندارد.</span></p>\r\n\r\n<p dir="rtl" style="text-align:right">&nbsp;</p>\r\n\r\n<p dir="rtl" style="text-align:right"><span style="font-size:18px"><span style="color:#000000">گفتنی است که خود روش&zwnj;های فیلتر مشترک نیز به دو زیرگروه تقسیم می&zwnj;شوند:</span></span></p>\r\n\r\n<ol dir="rtl">\r\n\t<li style="text-align:right"><span style="font-size:18px"><span style="color:#000000">روش&zwnj;های مبتنی بر حافظه</span></span></li>\r\n\t<li style="text-align:right"><span style="font-size:18px"><span style="color:#000000">روش&zwnj;های مبتنی بر مدل</span></span></li>\r\n</ol>\r\n\r\n<p dir="rtl" style="text-align:right"><span style="font-size:18px"><span style="color:#000000">رویکردهای مبتنی بر حافظه ساده&zwnj;ترین روش&zwnj;&nbsp;هستند زیرا از هیچ مدلی&nbsp;استفاده نمی&zwnj;کنند . آنها فرض می&zwnj;کنند که می&zwnj;توان برروی حافظه خالص داده&zwnj;های گذشته پیش&zwnj;بینی کرد و معمولا فقط از یک روش ساده اندازه&zwnj;گیری فاصله مانند نزدیک&zwnj;ترین همسایه (Nearest Neighbour) استفاده می&zwnj;کنند.</span></span></p>\r\n\r\n<p dir="rtl" style="text-align:right"><span style="font-size:18px"><span style="color:#000000">در مقابل، رویکردهای&nbsp;مبتنی بر مدل همیشه یک مدل زیربنایی را فرض می&zwnj;کنند و اساساً&nbsp;سعی می&zwnj;کنند مطمئن شوند چه پیش&zwnj;بینی&zwnj;هایی منجر به ساخت بهترین مدل می&zwnj;شوند.</span></span></p>\r\n\r\n<p dir="rtl" style="text-align:right"><span style="font-size:18px"><span style="color:#000000">به عنوان مثال بیایید فرض کنیم ماتریسی داریم از غذای موردعلاقه&zwnj;ی کاربران ایرانی که به قرمه&zwnj;سبزی علاقه دارند. یک روش مبتنی بر حافظه تنها به آنچه که کاربر در ماه گذشته خورده است توجه می&zwnj;کند و اهمیتی نمی&zwnj;دهد که&zwnj; آيا در کل، این کاربر قرمه&zwnj;سبزی دوست دارد یا خیر؟ از طرفی دیگر روش مبتنی بر مدل به این دلیل که فرض اصلی مسئله این است که کاربران موردنظر قرمه&zwnj;سبزی دوست دارند اطمینان حاصل می&zwnj;کند که پیش&zwnj;بینی&zwnj;هایی که می&zwnj;کند به سمت قرمه&zwnj;سبزی بودن متمایل باشند.</span></span></p>\r\n\r\n<blockquote>\r\n<p><span style="font-size:18px"><a href="http://cgeeksc.ir/post/self-driving-cars">ماشین&zwnj;های خودران</a></span></p>\r\n</blockquote>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2 dir="rtl" style="text-align:right"><span style="font-size:18px"><strong><span style="color:#000000">سیستم&zwnj;های مبتنی بر محتوا:</span></strong></span></h2>\r\n\r\n<p dir="rtl" style="text-align:right"><span style="font-size:18px"><span style="color:#000000">در نقطه&zwnj;ی مقابل فیلتر مشترک، رویکردهای مبتنی بر محتوا از اطلاعات اضافی در مورد کاربر و/یا آیتم&zwnj;ها برای پیش&zwnj;بینی استفاده می&zwnj;کنند.</span></span></p>\r\n\r\n<p dir="rtl" style="text-align:right"><span style="font-size:18px"><span style="color:#000000">به عنوان مثال، در گیفی که در بالا مشاهده کردیم، یک سیستم مبتنی بر محتوا ممکن است شامل سن، جنسیت، شغل و دیگر فاکتورهای شخصی کاربر شود تا پیش&zwnj;بینی انجام گیرد. مثلا اگر بدانیم ویدیو درباره&zwnj;ی اسکیت&zwnj;بورد بازی کردن است ولی&nbsp;کاربر 87 سال سن دارد پیش&zwnj;بینی اینکه کاربر ویدیو را دوست ندارد&nbsp;بسیار آسان&zwnj;تر می&zwnj;شود.</span></span></p>\r\n\r\n<p dir="rtl" style="text-align:right">&nbsp;</p>\r\n\r\n<p style="text-align:center"><span style="font-size:18px"><img alt="پیشبینی سیستم توصیه‌گر" src="/media/uploads/2020/10/14/3.png" style="height:297px; width:672px" /></span><br />\r\n&nbsp;</p>\r\n\r\n<p dir="rtl" style="text-align:right"><span style="font-size:18px"><span style="color:#000000">به همین دلیل است که هنگام ثبت&zwnj;نام در بسیاری از وب سایت&zwnj;ها و سرویس&zwnj;های آنلاین، از شما می&zwnj;خواهند اطلاعاتی از قبیل تاریخ تولد، جنسیت و قومیت خود را ذکر کنید(معمولا به صورت اختیاری)!&nbsp;این اطلاعات برای این است که داده&zwnj;های بیشتری برای سیستم&zwnj;شان مهیا شود که بتواند بهتر پیش&zwnj;بینی کند.</span></span></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p dir="rtl" style="text-align:right"><span style="font-size:18px"><span style="color:#000000">بنابراین، روش&zwnj;های مبتنی بر محتوا شباهت بیشتری به&nbsp;ماشین لرنینگ کلاسیک دارند. به این معنا که ما ویژگی&zwnj;هایی را براساس داده&zwnj;&zwnj;های کاربر و آیتم&zwnj;ها ایجاد می&zwnj;کنیم و از آن&zwnj;ها برای پیش&zwnj;بینی استفاده می&zwnj;کنیم. ورودی سیستم ما ویژگی&zwnj;های کاربران و ویژگی&zwnj;های آیتم&zwnj;ها است و خروجی سیستم، پیش&zwnj;بینی این است که کاربر آیتم را دوست دارد یا خیر.</span></span></p>\r\n\r\n<p>&nbsp;</p>	2020-10-13	images/posts/RecommenderSystems.png	recommender-systems	published	3	\N	<p><a href="https://www.kdnuggets.com/2019/09/machine-learning-recommender-systems.html" target="_blank">https://www.kdnuggets.com/2019/09/machine-learning-recommender-systems.html</a><br></p>	\N	16	در این مطلب از جامعه‌ی گیک‌های کامپیوتر به معرفی یکی از دسته‌های مهم الگوریتمهای ماشین‌ لرنینگ به‌نام سیستم‌های توصیه‌گر می‌پردازیم.	\N	\N	سیستمهای پیشنهاد دهنده
31	آشنایی با مدل OSI و لایه های آن	<p dir="rtl">مدل <strong>OSI</strong> یا <strong>Open System Interconnection</strong> یک استاندارد ISO برای شبکه&zwnj;های ارتباطی در جهان است. این مدل چهارچوب شبکه سازی را برای اجرای <strong><em>پروتکل<sup>&zwnj;</sup>ها</em></strong> در <a href="http://cgeeksc.ir/category/network">شبکه</a> تعریف می کند. هرچند امروزه تغییراتی در آن به وجود آمده اما هنوز هم کاربرد فراوانی در معماری شبکه&zwnj;های کامپیوتری دارد.</p>\r\n\r\n<p dir="rtl">دلیل نام گذاری این مدل، <strong>ارتباط بدون محدودیت</strong> و <strong>آسان</strong> آن می باشد زیرا این مدل به سیستم&zwnj;ها اجازه می&zwnj;دهد بدون در نظر گرفتن پایه و اساس معماری خود، به راحتی با یکدیگر ارتباط برقرار کنند.</p>\r\n\r\n<p dir="rtl">در نهایت این مدل موفق شد تا ارتباطات شبکه&zwnj;ها را در دسته بندی های منطقی قرار دهد و قوانینی را برای ایجاد و برقراری ارتباط بین دو یا چند سیستم وضع کند. مدل OSI شامل هفت لایه است که به آن ها Layer یا لایه گفته می شود.</p>\r\n\r\n<blockquote>\r\n<p dir="rtl"><strong>*پروتکل ها با توجه به تعریفی که در کتاب پروفسور تنن باوم به نام شبکه های کامپیوتری آمده است به قوانینی گفته می شود که برای برقراری ارتباطات مورد استفاده قرار می گیرند. اما در زبان عامیانه پروتکل یک زبان مشترک بین سیستم های کامپیوتری است که آنها را قادر می سازد تا با یکدیگر تبادل اطلاعات داشته باشند*</strong></p>\r\n</blockquote>\r\n\r\n<p dir="rtl">نکته قابل توجه در لایه های OSI این است که این لایه ها از <strong>پایین به بالا</strong> شماره گذاری می شوند. زیرا عمل رفع اشکال شبکه یا Troubleshooting از پایین آغاز می شود.</p>\r\n\r\n<p dir="rtl" style="text-align:center"><img alt="مدل OSI چیست" src="/media/uploads/2020/10/30/whatsapp-image-2020-10-30-at-42005-pm.jpeg" style="height:548px; width:994px" /></p>\r\n\r\n<h2 dir="rtl"><strong>آشنایی با لایه&zwnj;های OSI</strong></h2>\r\n\r\n<p dir="rtl" style="text-align:center"><img alt="لایه‌های OSI" src="/media/uploads/2020/10/30/whatsapp-image-2020-10-30-at-42005-pm1.jpeg" style="height:634px; width:623px" /></p>\r\n\r\n<h3 dir="rtl"><strong>7-لایه کاربرد یا Application</strong></h3>\r\n\r\n<p dir="rtl">لایه کاربرد بالاترین لایه در مدل OSI و یک واسطه میان کاربر و برنامه در حال اجرا با بستر شبکه که همان لایه های پایین تر است، برای برقراری ارتباط بین مبدا، مقصد و انتقال داده ها می باشد، است. این لایه دارای پروتکل های متفاوتی است و همچنین مواردی مثل: هماهنگ سازی، فرمت بندی، مسائل امنیتی و.. در این لایه انجام می شود. برای مثال زمانی که یک صفحه وب در مرورگر را باز می کنیم، پروتکل HTTP که مربوط به لایه کاربرد است درخواست ما را فرمت بندی کرده و به سرور ارسال می کند. دریافت پاسح از سرور نیز به عهده همین پروتکل است.</p>\r\n\r\n<p dir="rtl" style="text-align:center"><img alt="لایه Application در مدل OSI" src="/media/uploads/2020/10/30/whatsapp-image-2020-10-30-at-51337-pm.jpeg" style="height:352px; width:1080px" /></p>\r\n\r\n<h3 dir="rtl"><strong>6-لایه ارائه یا Presentation</strong></h3>\r\n\r\n<p dir="rtl">این لایه به صورت یک مترجم عمل می کند. یعنی داده ها را از لایه کاربرد گرفته و به طوری فرمت بندی می کند که توسط کامپیوتر مقصد قابل تشخیص باشد.</p>\r\n\r\n<p dir="rtl">دو عمل Encryption و Decryption در این لایه تعریف شده است که در مطالب بعدی به توضیح آن&zwnj;ها خواهیم پرداخت.</p>\r\n\r\n<p dir="rtl" style="text-align:center"><img alt="لایه Presentation در مدل OSI" src="/media/uploads/2020/10/30/whatsapp-image-2020-10-30-at-51351-pm.jpeg" style="height:353px; width:1080px" /></p>\r\n\r\n<h3 dir="rtl"><strong>5-لایه جلسه (نشست) یا Session</strong></h3>\r\n\r\n<p dir="rtl">وظیفه این لایه کارهایی از قبیل برقراری ارتباط، تداوم و یا قطع ارتباط بین مبدا و مقصد است و همچنین یکی از لایه های مهم در برقراری امنیت ارتباطات است.</p>\r\n\r\n<p dir="rtl" style="text-align:center"><img alt="لایه Session در مدل OSI" src="/media/uploads/2020/10/30/whatsapp-image-2020-10-30-at-51403-pm.jpeg" style="height:537px; width:1031px" /></p>\r\n\r\n<h3 dir="rtl"><strong>4-لایه انتقال یا Transport</strong></h3>\r\n\r\n<p dir="rtl">وظیفه این لایه انتقال بسته ها به مقصد می باشد که نحوه انتقال و دریافت بسته در مقصد به عهده <strong>Transmission Control Protocol</strong> یا به اختصار TCP می باشد که مهم ترین پروتکل در این لایه است.</p>\r\n\r\n<p dir="rtl">همچنین یکی دیگر از وظایف مهم این لایه تقسیم کردن داده های دریافتی بزرگ از سمت لایه نشست به بسته های کوچک تر است که به آن ها <strong>Segment</strong> و به عملیات تقسیم بندی <strong>Segmentation</strong> گفته می شود.</p>\r\n\r\n<p dir="rtl" style="text-align:center"><img alt="لایه Transport در مدل OSI" src="/media/uploads/2020/10/30/whatsapp-image-2020-10-30-at-51416-pm.jpeg" style="height:385px; width:1080px" /></p>\r\n\r\n<h3 dir="rtl"><strong>3-لایه شبکه یا Network </strong></h3>\r\n\r\n<p dir="rtl">پروتکل IP و روتینگ(Routing) یا همان مسیریابی که مهمترین وظیفه است در این لایه انجام می شود. در این لایه Segment های دریافتی از لایه انتقال به بسته تبدیل می شود که آدرس مبدا و مقصد به هر بسته پیوست می شود.</p>\r\n\r\n<p dir="rtl" style="text-align:center"><img alt="لایه Network در مدل OSI" src="/media/uploads/2020/10/30/whatsapp-image-2020-10-30-at-51422-pm.jpeg" style="height:405px; width:1080px" /></p>\r\n\r\n<h4 dir="rtl"><strong>2-لایه پیوند داده یا Data Link</strong></h4>\r\n\r\n<p dir="rtl">در این بخش اطلاعات و داده های دریافت شده از لایه شبکه بررسی می شوند، خطاها شناسایی شده، اصلاح می شوند و پس از اطمینان از صحت و درسی اطلاعات، آن ها را به سوی مقصد ارسال می کند.</p>\r\n\r\n<p dir="rtl" style="text-align:center"><img alt="لایه Data Link در مدل OSI" src="/media/uploads/2020/10/30/whatsapp-image-2020-10-30-at-51434-pm.jpeg" style="height:370px; width:1080px" /></p>\r\n\r\n<h4 dir="rtl"><strong>1-لایه فیزیکی یا Physical </strong></h4>\r\n\r\n<p dir="rtl">این بخش وظیفه انتقال نهایی اطلاعات را بر عهده دارد. بنابراین اطلاعات یا همان داده های دریافتی از لایه پیوند داده را به صفر و یک تبدیل می کند، سپس انتقال داده ها را به صورت سیگنال و صفر و یک انجام می دهد.</p>\r\n\r\n<p dir="rtl" style="text-align:center"><img alt="لایه Physical در مدل OSI" src="/media/uploads/2020/10/30/whatsapp-image-2020-10-30-at-51442-pm.jpeg" style="height:423px; width:1080px" /></p>\r\n\r\n<p dir="rtl">در این مطلب به طور خلاصه با مدل OSI و لایه&zwnj;های آن آشنا شدیم. در مطالب بعدی با سایر مباحث پایه شبکه آشنا خواهیم شد. اگر به شبکه و مباحث مربوط به آن علاقه مندید پیشنهاد می&zwnj;کنیم این سری مطالب از جامعه گیک&zwnj;های کامپیوتر را دنبال کنید.</p>	2020-10-30	images/posts/post-site-osi.png	OSI-introduce	published	8	\N		\N	14	در این مطلب با مدل‌ OSI و لایه‌های آن آشنا خواهیم شد. مدل OSI یک استاندارد جهانی برای شبکه‌های ارتباطی است. اگر به شبکه علاقه مندید پیشنهاد می‌کنیم این مطلب را از دست ندهید.	\N	2020-10-30 15:30:00+00	مدل OSI
\.


--
-- Data for Name: app_blog_slider; Type: TABLE DATA; Schema: public; Owner: cgcdbuser
--

COPY public.app_blog_slider (id, image, link, title) FROM stdin;
1	images/slider/cgc-head.png	\N	بنر جامعه گیک‌های کامپیوتر
2	images/slider/banner-ssd_9ltyNYh.png	http://cgeeksc.ir/post/ssd-vs-hdd	بنر تفاوت‌های SDD و HDD
3	images/slider/banner-ofdm.png.png	http://cgeeksc.ir/post/OFDM-Introduction	بنر مدولاسیون OFDM
4	images/slider/banner-crawler-banner.png	http://cgeeksc.ir/post/Crawler-Introduction	بنر آشنایی با کراولرها
5	images/slider/banner-manjaro-banner.png	http://cgeeksc.ir/post/look-at-Manjaro	بنر نگاهی به توزیع مانجارو
6	images/slider/banner-2.png	http://cgeeksc.ir/post/gaming-on-linux	بنر بازی روی لینوکس
7	images/slider/banner-1.png	http://cgeeksc.ir/post/introduction-to-reinforcement-learning	بنر یادگیری تقویتی
8	images/slider/banner-4.png	http://cgeeksc.ir/post/Operating-System	بنر سیستم عامل چیست
9	images/slider/banner-5.png	http://cgeeksc.ir/post/bubble-sort-in-python	الگوریتم بابل سورت
10	images/slider/banner-3.png	http://cgeeksc.ir/post/Security_issues	بنر چالش های امنیتی اینترنت اشیا
\.


--
-- Data for Name: app_event_event; Type: TABLE DATA; Schema: public; Owner: cgcdbuser
--

COPY public.app_event_event (id, title, slug, description, summary, image, date, file_url, youtube_url, status, person_id, event_type, addres) FROM stdin;
2	جلسه اول: دنیای نرم افزار آزاد	001	<p>نرم افزارهای آزاد تاثیرات به سزایی در پیشرفت علم و تکنولوژی داشته&zwnj;اند و همیشه نقش مهمی را ایفا کرده&zwnj;اند. این نرم افزارها جدای از کاربردهایی که برای شرکت&zwnj;های بزرگ و محققان دارند در بین کاربران معمولی هم طرفداران زیادی دارند.</p>\r\n\r\n<p>اما ماهیت یک نرم افزار آزاد چیست و نرم افزارهای آزاد دارای چه ویژگی&zwnj;هایی هستند؟ روش&zwnj;های درآمدی این نرم افزارها چه هستند و شرکت&zwnj;های فعال در تولید نرم افزارهای آزاد چگونه کسب درآمد می&zwnj;کنند؟</p>\r\n\r\n<p>جلسه اول جامعه گیک&zwnj;های کامپیوتر محلی است فرصتی است برای پاسخ به همین پرسش&zwnj;ها. ما در این جلسه به تمامی سوالات این چنینی پاسخ خواهیم داد و به طور کامل مفهوم نرم افزار آزاد را بررسی خواهیم کرد.</p>\r\n\r\n<p>جدای از این در این جلسه گفتگویی در رابطه با چرایی شکل گیری و اهداف جامعه گیک&zwnj;های کامپیوتر خواهیم داشت. اگر علاقه&zwnj;مند به نرم افزار آزاد هستید یا دوست دارید بیشتر در مورد جامعه گیک&zwnj;های کامپیوتر بدانید پیشنهاد می&zwnj;کنیم حتما در جلسه اول CGC شرکت کنید.</p>	در جلسه اول جامعه گیک‌های کامپیوتر به نرم افزارهای آزاد خواهیم پرداخت و علاوه بر آن در مورد دلایل شکل گیری و برخی اهداف جامعه گیک‌های کامپیوتر خواهیم پرداخت.	images/events/site-event-001.png	2020-03-12		https://youtu.be/da1E4s_eDdQ	a	2	a	
1	جلسه دوم:‌ لینوکس با تمرکز بر توزیع اوبونتو	002	<p>لینوکس، گنو/لینوکس،&nbsp;کرنل، توزیع&zwnj;های مختلف لینوکسی، ترمینال، آقای لینوس تروالدز!<br />\r\nاحتمالا بارها این اتفاق افتاده است که واژه&zwnj;های مذکور را شنیده اید اما بطور دقیق ندانید که هرکدام چه هستند و حتی شاید در برخورد اول هرکدام از آنها سبب سردرگمی و گیج شدنتان شده باشند!&nbsp;<br />\r\nدر دومین رویداد جامعه گیک&zwnj;های کامپیوتر اولین هدف بر آن بود که تفاوت واژه های بالا برای همگان مشخص شود.<br />\r\nدر این رویداد کارمان را &nbsp;با تعریف یکسری قصه جالب و کمتر شنیده شده در مورد لینوکس و خالق آن یعنی آقای لینوس تروالدز آغاز کردیم و چگونگی پیوستن لینوکس به دنیای نرم&zwnj;افزار آزاد را از زبان مهران زیدی شنیدیم.<br />\r\nکار با معرفی یکسری توضیحات درباره&zwnj;ی توزیع&zwnj;های مختلف لینوکسی ادامه پیدا کرد و در نتیجه ی این مقدمه چینی ها به مباحث اصلی جلسه رسیدیم! یعنی سیستم عامل اوبونتو!<img alt="LinuxPeng" src="/media/uploads/2020/09/06/linuxpeng.jpg" style="height:628px; width:1200px" /><br />\r\nقرار بر این بود در این جلسه بطور خاص به سیستم عامل اوبونتو بپردازیم، از این رو ورژن های مختلف اوبونتو را مورد بررسی قرار دادیم و مراحل نصب آن را بصورت گام به گام روی ماشین مجازی پیش بردیم.<br />\r\nبرای نصب اوبونتو چالش هایی که احتمال دادیم هر فردی را حین نصب درگیر خواهند کرد و همچنین سوالاتی که درباره&zwnj;ی یکسری مفاهیم ممکن بود در ذهن هر کسی شکل بگیرد را بررسی کردیم تا نصب این سیستم عامل راحت&zwnj;تر و تقریبا حرفه ای تر انجام شود.<br />\r\nکار را در محیط ترمینال ادامه دادیم و با دستوراتی آشنا شدیم و مفاهیمی را بررسی کردیم که دانستن آنها می&zwnj;تواند نقطه ی آغازی باشد برای ادامه کار با سیستم عاملهای مبتنی بر لینوکس.<br />\r\nاگر شما هم علاقه دارید اطلاعات خود را در مورد موارد مذکور بالا ببرید و کمی بیشتر با دنیای لینوکس آشنا شوید این رویداد را از دست ندهید.<br />\r\nویدیوی این رویداد به 3 پارت مجزا بخش بندی شده است که از طریق لینک زیر می&zwnj;توانید به آنها دسترسی داشته باشید.</p>	در جلسه‌ی دوم از سری جلسات جامعه گیک‌های کامپیوتر به لینوکس و مباحث مربوطه خواهیم پرداخت.\r\nهمچنین با اوبونتو بیشتر آشنا خواهیم شد.	images/events/site-event-002.png	2020-03-25		https://youtu.be/FQGHZp1dKEM	a	3	a	
3	رویداد انتشار اوبونتو 20.04	ubuntu-20-04	<p>گنو/لینوکس را می&zwnj;توان یکی از بزرگترین و تاثیرگذارترین سیستم عامل&zwnj;ها دانست و قطعا یکی از اصلی ترین هسته&zwnj;های <a href="http://cgeeksc.ir/event/001">دنیای نرم افزارهای آزاد</a> گنو/لینوکس است. این سیستم عامل دوست داشتنی در طی سال&zwnj;ها پیشرفت&zwnj;های چشم گیری داشته و حالا به لطف توزیع&zwnj;هایی مثل اوبونتو (Ubuntu) بیشتر در میان عموم مردم مورد استفاده قرار می&zwnj;گیرد.</p>\r\n\r\n<p>اوبونتو (Ubuntu) یکی از محبوب&zwnj;ترین توزیع&zwnj;های لینوکسی حال حاضر است و آثار غیر قابل انکارش را می&zwnj;توان در هر گوشه دید و پیدا کرد. جدای از کاربران زیادی که در سطح دنیا از این توزیع پر طرفدار استفاده می&zwnj;کنند، اوبونتو (Ubuntu) یکی از بهترین گزینه&zwnj;ها برای سرورها و میزبانی سایت&zwnj;ها و نرم افزارها هم هست. بخش وسیعی از سرور&zwnj;ها و میزبان&zwnj;ها از اوبونتو (Ubuntu) به عنوان سیستم عامل اصلی خود استفاده می&zwnj;کنند.</p>\r\n\r\n<blockquote>\r\n<p><a href="http://cgeeksc.ir/event/002">جلسه دوم:&zwnj; لینوکس با تمرکز بر توزیع اوبونتو</a></p>\r\n</blockquote>\r\n\r\n<p>اوبونتو (Ubuntu) هر دو سال یکبار نسخه LTS با پشتیبانی پنج ساله خود را عرضه می&zwnj;کند و بسیاری از عاشقان دنیای لینوکس در انتظار انتشار نسخه&zwnj;های جدید اوبونتو (Ubuntu) هستند تا ببینند گام بعدی و ویژگی&zwnj;های جذاب و جدیدی که به اوبونتو (Ubuntu) اضافه می&zwnj;شود چیست.</p>\r\n\r\n<p>حال پس از گذشت دو سال از انتشار Ubuntu 18.04 نوبت به نسخه جدید اوبونتو (Ubuntu) رسیده و کاربران این توزیع چشم انتظار نسخه 20.04 اوبونتو (Ubuntu) هستند.</p>\r\n\r\n<p style="text-align:center"><img alt="اوبونتو 20.04" src="/media/uploads/2020/09/06/ubuntu-2004-focal-fossa.jpg" style="height:400px; width:850px" /></p>\r\n\r\n<p>ما نیز در جامعه گیک&zwnj;های کامپیوتر به عنوان بخش کوچکی از طرفداران و علاقه&zwnj;مندان به کامپیوتر و دنیای نرم افزار آزاد به مناسبت انتشار نسخه جدید&nbsp;اوبونتو (Ubuntu) یعنی Ubuntu 20.04 رویدادی را ترتیب دیدیم تا در اولین فرصت و تنها یک روز پس از انتشار رسمی Ubuntu 20.04 این توزیع را بررسی کنیم و برخی از ویژگی&zwnj;های جدید را همراه هم تجربه کنیم.</p>\r\n\r\n<p>علاوه بر معرفی و بررسی Ubuntu 20.04 در این رویداد به معرفی برخی از ابزارهای کاربردی لینوکس مثل Wine خواهیم پرداخت و چگونگی نصب و استفاده از آن&zwnj;ها را تجربه خواهیم کرد.</p>\r\n\r\n<p>اگر شما هم از علاقه&zwnj;مندان به دنیای لینوکس و یک گیک کامپیوتر هستید این جلسه را از دست ندهید.</p>	در این رویداد به مناسبت انتشار نسخه جدید اوبونتو (Ubuntu) یعنی Ubuntu 20.04 به بررسی این توزیع خواهیم پرداخت و در کنار آن، برخی از ابزارهای کاربردی لینوکس را معرفی می‌کنیم.	images/events/site-event.png	2020-04-24		https://youtu.be/xOxyJBc6RRA	a	2	a	
4	جلسه پنجم: آشنایی با فریمورک جنگو (django)	005	<p>بی شک پایتون (Python) یکی از محبوب&zwnj;ترین و کاربردی&zwnj;ترین زبان&zwnj;های برنامه نویسی است. این زبان قدرتمند به خوبی بین برنامه نویسان جا افتاده و افراد زیادی در حوزه&zwnj;های مختلف از پایتون (Python) استفاده می&zwnj;کنند.</p>\r\n\r\n<p>از پایتون (Python) می&zwnj;توانید در هرجایی استفاده کنید. از هوش مصنوعی و علم داده تا بازی&zwnj;سازی و طراحی سایت قطعا ابزاری قدرتمند برای کار با&nbsp;پایتون (Python) پیدا خواهید کرد.</p>\r\n\r\n<p>یکی از محبوب&zwnj;ترین فریورک&zwnj;ها که از زبان پایتون (Python) استفاده می&zwnj;کند فریمورک جنگو (Django) نام دارد. جنگو (Django) امکان طراحی انواع سات، وب اپلیکیشن و CMSها را می&zwnj;دهد و می&zwnj;توانید سایت&zwnj;های بسیار قدرتمندی را با استفاده از جنگو (Django) پیاده سازی کنید.</p>\r\n\r\n<p>جنگو (Django) در کنار قدرت بسیار بالایی که دارد ساده و سریع است و می&zwnj;توانید با سرعت پروژه خود را جلو ببرید. در زمینه امنیت هم جنگو (Django) حرف&zwnj;هایی برای گفتن دارد.</p>\r\n\r\n<p style="text-align:center"><img alt="جنگو (Django)" src="/media/uploads/2020/09/06/python-django-logo.jpg" style="height:720px; width:1280px" /></p>\r\n\r\n<p>تمام این&zwnj;ها جنگو (Django) را تبدیل به یک فریمورک دوست داشتنی و یکی از گزینه&zwnj;های خوب و مناسب برای طراحی سایت و وب اپلیکیشن&zwnj; می&zwnj;کند. در کنار این&zwnj;ها با استفاده از جنگو (Django) می&zwnj;توانید به خوبی API نویسی کنید.</p>\r\n\r\n<p>ما در جلسه پنجم جامعه گیک&zwnj;های کامپیوتر به این فریمورک قدرتمند خواهیم پرداخت و با جنگو (Django) آشنا می&zwnj;شویم. در این جلسه توضیحاتی در مورد جنگو (Django)، انواع نسخه&zwnj;ها و مدل&zwnj;ها و ویو ها و چگونگی کارکرد جنگو (Django) خواهیم داد و به طور کامل با این فریمورک آشنا می&zwnj;شویم. در پایان پروژه&zwnj;ای را آغار می&zwnj;کنیم تا به صورت عملی جنگو (Django) را تجربه کنیم.</p>\r\n\r\n<p><strong>این جلسه به خاطر حجم بالای مطالب در دو قسمت جداگانه و برگزار و ضبط شده که هر دو قسمت از طریق یوتوب در دسترس هستند.</strong></p>	در جلسه پنجم CGC به معرفی فریمورک محبوب و قدرتمند جنگو (Django) خواهیم پرداخت و در پایان پروژه‌ای را آغار می‌کنیم تا به صورت عملی جنگو (Django) را تجربه کنیم.	images/events/site-event-005.png	2020-05-15		https://youtu.be/6StowtoGNqI	a	2	a	
5	جلسه چهارم: اینترنت اشیا(IOT)	004	<p dir="RTL" style="text-align:right"><span style="font-size:16px"><span style="font-family:Vazir">با پیشرفت سریع&nbsp; تکنولوژی و روی کار آمدن پرورژه&zwnj;های بزرگی مثل شهر هوشمند، ماشین&zwnj;های برقی و هوشمند و تمامی تکنولوژی&zwnj;هایی از این قبیل که همگی از فناوری جدید <span style="color:#2980b9">اینترنت اشیا یا IOT </span>استفاده می&zwnj;کنند نیاز به یادگیری این فناوری بزرگ در علاقه&zwnj;مندان به آن بیشتر احساس می&zwnj;شود. IOT از سه بخش&zwnj; کلی <strong>شبکه</strong>، <strong>سخت افزار</strong> و <strong>نرم افزار</strong> تشکیل شده است که هر بخش به صورت جداگانه یک شاخه&zwnj;ی فناوری را تشکیل می&zwnj;دهند. </span></span></p>\r\n\r\n<p dir="RTL" style="text-align:right"><span style="font-size:16px"><span style="font-family:Vazir">لذا به علت تنوع و گستردگی مطالب شناختن شاخه&zwnj;های مختلف این فناوری و یافتن نقطه&zwnj;ی شروعی برای آموختن این علم ممکن است اندکی دشوار و زمانبر باشد.در این رویداد سعی شده است نقش هر یک از شاخه&zwnj;های ذکر شده در اینترنت اشیا و بخش&zwnj;های مورد نیاز هر فرد برای شروع معرفی و مورد بررسی قرار گیرد. اگر علاقه مند هستید که یادگیری اینترنت اشیا را شروع نمایید ما در این مطلب به شما کمک خواهیم کرد تا شاخه مورد علاقه خود را پیدا کنید.</span></span></p>\r\n\r\n<p dir="RTL" style="text-align:right">&nbsp;</p>\r\n\r\n<p dir="RTL" style="text-align:center"><img alt="internet of things" src="/media/uploads/2020/09/09/image-20200909131429-2.jpeg" style="height:634px; width:959px" /></p>	با توجه به کاربر روز افزون اینترنت اشیا در تکنولوژی‌های گوناگون نیاز به یادگیری این علم هر روز بیشتر احساس می‌شود، در این رویداد سعی شده است به مسائل پایه‌ای اینترنت اشیا اشاره شود تا روند یادگیری برای مخاطبین آسان‌تر شود.	images/events/site-event1.png	2020-05-07		https://www.youtube.com/watch?v=1dxFs6rNFEs&t=197s	a	4	a	
6	ساخت موس با آردوینو	Mouse-with-arduino	<p><span style="font-family:Vazir">فناوری اینترنت اشیا یک فناوری بسیار گسترده است و یادگیری آن نیازمند زمان و تلاش زیادی است. ما در تلاش هستیم تا این مسیر را برای شما هموارتر نماییم. اگر پس از تماشای ویدیو <a href="http://cgeeksc.ir/event/004">اینترنت اشیا</a> که در آن به معرفی اینترنت اشیا پرداختیم و همچنین با دیدن ویدیو <a href="http://cgeeksc.ir/post/promicro_Introduction">بررسی اجزای برد آردوینو promicro</a> به یادگیری در این زمینه علاقه&zwnj;مند شدید و به دنبال ساخت پروژه&zwnj;ای کوچک با این قطعه و شروع فعالیات خود در زمینه اینترنت اشیا دارید در این رویداردشرکت کنید. </span></p>\r\n\r\n<p><span style="font-family:Vazir">در این رویداد با استفاده از <strong>برد آردوینو promicro</strong> و <strong>ماژول جوی استیک</strong> مراحل ساخت یک موس و همچنین نحوه کد نویسی برد آردوینو را مورد بررسی قرار خواهیم داد.</span></p>\r\n\r\n<blockquote>\r\n<p><span style="font-family:Vazir">قطعات مورد نیاز برای ساخت این برد:</span></p>\r\n\r\n<p><span style="font-family:Vazir">برد آردوینو promicro</span></p>\r\n\r\n<p><span style="font-family:Vazir">ماژول جوی استیک</span></p>\r\n\r\n<p><span style="font-family:Vazir">یک عدد کلید یا میکروسوئیچ</span></p>\r\n\r\n<p><span style="font-family:Vazir">لامپ LED پنج الی سه میلی&zwnj;متر</span></p>\r\n\r\n<p><span style="font-family:Vazir">مقاومت با مقدار 330اهم</span></p>\r\n\r\n<p><span style="font-family:Vazir">کلید کشویی دو حالته</span></p>\r\n\r\n<p><span style="font-family:Vazir">برد بورد</span></p>\r\n\r\n<p><span style="font-family:Vazir">سیم جامپر دو حالته یا&nbsp; سیم مسی باریک</span></p>\r\n\r\n<p>&nbsp;</p>\r\n</blockquote>	در این رویداد به ساخت یک موس با ماژول جوی استیک و برد آردوینو promicro  و بررسی کد آن خواهیم پرداخت.\r\nاگر از علاقه مندان به اینترنت اشیا هستیداین رویداد را از دست ندهید.	images/events/site-eventmouse.jpg	2020-10-05	uploads/admin/site-eventmouse.jpg	\N	a	4	a	<p>http://tv.live21.ir/b/meh-ypw-6tz<br></p>
\.


--
-- Data for Name: app_project_pcategory; Type: TABLE DATA; Schema: public; Owner: cgcdbuser
--

COPY public.app_project_pcategory (id, title, slug) FROM stdin;
1	وب	web
\.


--
-- Data for Name: app_project_project; Type: TABLE DATA; Schema: public; Owner: cgcdbuser
--

COPY public.app_project_project (id, title, image, slug, description, file_url, youtube_url, github_url, head_id, category_id, summary) FROM stdin;
1	طراحی وبسایت جامعه گیک‌های کامپیوتر	project-site-cgc.png	cgeeksc-website	<p>سیستم&zwnj;های مدیریت و توسعه وبسایت زیادی وجود دارند. از وردپرس و جوملا تا فریمورک&zwnj;هایی بر پایه جاوا اسکریپ مثل <a href="http://cgeeksc.ir/post/Deno-Introduce">دینو</a> و دیگر زبان&zwnj;های محبوب برنامه&zwnj;نویسی؛ اما معمولا سیستم&zwnj;هایی انتخاب می&zwnj;شوند که در عین سادگی و راحتی بتوانند جوابگوی تمام نیازهای کاربران باشند.</p>\r\n\r\n<p>یکی از این فریمورک&zwnj;های محبوب و قدرتمند که هم سادگی و سرعت توسعه و هم انعطاف پذیر بودن و مقیاس پذیری را در کنار هم فراهم می&zwnj;کند <a href="http://cgeeksc.ir/event/005">فریمورک جنگو</a> است.</p>\r\n\r\n<p>همین ویژگی&zwnj;های بسیار خوب و قدرتمند بودن جنگو باعث شد تا ما در جامعه گیک&zwnj;های کامیپوتر برای طراحی سایت CGC از این فریمورک استفاده کنیم. و آنچه از استفاده از این فریمورک پایتونی قدرتمند حاصل شد همین سایتی است که مشاهده می&zwnj;کنید.</p>\r\n\r\n<p style="text-align:center"><img alt="طراحی سایت با جنگو" src="/media/uploads/2020/09/26/screenshot_2020-08-14_17-17-40_L8LBQA1.png" style="height:904px; width:1910px" /></p>\r\n\r\n<p>در توسعه سایت <a href="http://cgeeksc.ir/">cgeeksc.ir</a> از <strong>جنگو ورژن 3</strong> استفاده شده است. همچنین برای طراحی ظاهر و بخش Frontend از <strong>Bootstrap 4</strong> که محبوب&zwnj;ترین فریمورک سمت فرانت است استفاده شده؛ این پروژه جدای از امکاناتی که برای کاربران فراهم می&zwnj;کند و طراحی کاملا رسپانسیو خود از دو سطح کاربری ویژه هم بهره می&zwnj;برد که این امکان را برای مدیران سایت فراهم می&zwnj;کند تا با دستی باز تر به تولید محتوا و فعالیت بپردازند. در واقع ما در این پروژه یک سیستم اختصاصی مدیریت محتوا برای جامعه گیک&zwnj;های کامپیوتر طراحی کرده&zwnj;ایم.</p>\r\n\r\n<p>این پروژه پنل مدیریتی قدرتمندی را برای مدیران سایت در دسترس قرار داده که کار را برای آن&zwnj;ها ساده؛ راحت و به دور از هرگونه پیچیدگی کرده و با داشتن این پنل زیبا و کارآمد که در طراحی آن از <strong>AdminLTE</strong> استفاده شده کار کردن را برای مدیران و نویسندگان جذاب می&zwnj;کند و باعث دیرتر خسته شدن عوامل سایت؛ که اصلی ترین بخش کار هستند می&zwnj;شود.</p>\r\n\r\n<p><img alt="سایت جنگو" src="/media/uploads/2020/09/26/screenshot_2020-08-14_17-17-25.png" style="height:908px; width:1913px" /><br />\r\nاز دیگر امکانات این پروژه می&zwnj;توان به پروفایل شخصی و کارآمد برای هر کاربر؛ سیستم ارسال پیغام در صفحه ارتباط با ما و ثبت نام و اطلاع رسانی از طریق ایمیل اشاره کرد.<br />\r\nاین پروژه جنگویی که حاصل هزاران خط کدنویسی و ساعت&zwnj;ها کار است یک پروژه آزاد و متن باز است و از طریق گیت&zwnj;هاب در دسترس است.</p>\r\n\r\n<p>اگر شما هم به پروژه&zwnj;های جنگویی مشابه و یا پیشرفته تر نیاز دارید و علاقه مند به داشتن سایتی شکیل؛ کارآمد و کاملا شخصی سازی شده و قدرتمند هستید ما در CGC آماده انجام پروژه&zwnj;های شما هستیم. شما برای ثبت پروژه می&zwnj;توانید از طریق صفحه <a href="http://cgeeksc.ir/contact-us">ارتباط با ما</a> اقدام کنید و با تیم توسعه وب و نرم افزار CGC در ارتباط باشید.</p>	\N	\N	https://github.com/Rghaf/cgeeksc.ir	2	1	در این پروژه یک سیستم مدیریت محتوای کاملا اختصاصی برای استفاده جامعه گیک‌های کامپیوتر با فریمورک پایتونی جنگو نوشته شده و سایتی که می‌بینید ما حصل این پروژه است.
2	طراحی وبسایت سرویس ورزشی آنلاین هیروفیت	project-site-herofit.png	herofit	<p>داشتن یک وبسایت مناسب برای هر کسب و کاری اهمیت به سزایی دارد. به خصوص با پیشرفت بیشتر تکنولوژی و همه گیر شدن گوشی&zwnj;های هوشمند و استفاده روز افزون مردم از اینترنت داشتن بستری آنلاین برای هر کسب و کاری بیشتر از قبل احساس می&zwnj;شود.</p>\r\n\r\n<p>جامعه گیک&zwnj;های کامپیوتر در همین راستا با تیم&zwnj;های استارتاپی و جوان همکاری&zwnj;های داشته که یکی از موفق ترین کسب و کارهایی که تا امروز با CGC همکاری کرده <strong>سرویس اینترنتی هیروفیت</strong> است.</p>\r\n\r\n<p><a href="http://herofit.ir/">هیروفیت</a> به عنوان یک سرویس آنلاین ورزشی در زمینه تولید و انتشار محتوای ورزشی، ارائه خدمات مشاوره و مربی گری به کاربران فعالیت می&zwnj;کند و جزو آن دسته از استارتاپ&zwnj;های نوپاست که با ارائه خدماتی سنتی به شکلی نوین و پیشرفته فعالیت خود را آغاز کرده است.</p>\r\n\r\n<p>وبسایت این سرویس ورزشی آنلاین به طور کامل توسط جامعه گیک&zwnj;های کامپیوتر طراحی شده است. در ادامه جزئیاتی از این پروژه موفق که بیش از سی هزار بازدید کننده داشته را ذکر خواهیم کرد.</p>\r\n\r\n<p><img alt="طراحی سایت با وردپرس" src="/media/uploads/2020/09/26/screenshot_2020-08-14_17-07-26.png" style="height:888px; width:1907px" /></p>\r\n\r\n<p>این پروژه با سیستم مدیریت پر طرفدار و قدرتمند <strong>WordPress</strong> طراحی و توسعه داده شده است. در این پروژه علاوه بر امکانات یک مجله ورزشی برخی از امکانات مورد نیاز یک فروشگاه هم پیاده سازی شدند و در دسترس هستند.</p>\r\n\r\n<p>از جمله امکانات پروژه هیروفیت می&zwnj;توان به امکاناتی نظیر سیستم فروش(ووکامرس)؛ سیستم اطلاع رسانی و پیامک به مشتریان؛ طراحی کاملا رسپانسیو و انتشار خودکار مطالب در کانال تلگرام، ثبت نام کاربران با شماره موبایل، سیستم تیکت حرفه&zwnj;ای و پنل کاربری کارآمد برای کاربران اشاره کرد. علاوه بر نکات بالا جامعه گیک&zwnj;های کامیپوتر در بهینه سازی و سئوی وبسایت هیروفیت هم فعالیت&zwnj;هایی داشته و با مشاوره&zwnj;های دائمی سعی در همراه بودن با هیروفیت در همه حوزه&zwnj;ها داشته است.</p>\r\n\r\n<blockquote>\r\n<p>از کار کردن باهاتون راضی هستم. همه اون چیزایی که مد نظر خودم بود انجام شده؛ تازه یه سری چیزایی رو که من نمیدونستم هم به کار اضافه کردید که خوب بود. اینکه طرح و هدف دارید برای طراحی و سوال ارزشمند میپرسید که هدف خود شخصی که میخواد کار رو راه بندازه بهتر مشخص میشه. پیشنهاداتتون خوبه. در کل راضی ام تا الان؛ از سئو و سرعت سایت و مسائل فنی خوب بوده و از طرف پشتیبانی و مسائل فنی مشکلی ندیدم و اگر باشه سعی میکنم سریعا باهاتون مشورت کنم و درمیون بذارم تا درستش کنیم.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>محمدامین خسروی - موسس هیروفیت</strong></p>\r\n</blockquote>\r\n\r\n<p>اگر شما هم پروژه&zwnj;ای مشابه برای راه اندازی و یا گسترش کسب و کار خود دارید می&zwnj;توانید با اطمینان کامل و با بهترین کیفیت و پشتیبانی کار خود را به CGC بسپارید. برای سفارش پروژه مشابه از صفحه <a href="http://cgeeksc.ir/contact-us">ارتباط با ما</a> اقدام کنید.</p>	\N	\N	\N	2	1	در این پروژه وبسایتی کارآمد را در سریع‌ترین زمان و حداقل هزینه ممکن برای استارتاپی ورزشی طراحی کردیم. علاوه بر طراحی سایت؛ CGC همواره با مشاوره و دادن ایده‌هایی جدید سعی در بهبود فعالیت این استارتاپ جوان و آینده دار داشته است.
\.


--
-- Data for Name: app_project_project_members; Type: TABLE DATA; Schema: public; Owner: cgcdbuser
--

COPY public.app_project_project_members (id, project_id, user_id) FROM stdin;
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: cgcdbuser
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: cgcdbuser
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: cgcdbuser
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add post	7	add_post
26	Can change post	7	change_post
27	Can delete post	7	delete_post
28	Can view post	7	view_post
29	Can add category	8	add_category
30	Can change category	8	change_category
31	Can delete category	8	delete_category
32	Can view category	8	view_category
33	Can add slider	9	add_slider
34	Can change slider	9	change_slider
35	Can delete slider	9	delete_slider
36	Can view slider	9	view_slider
37	Can add comment	10	add_comment
38	Can change comment	10	change_comment
39	Can delete comment	10	delete_comment
40	Can view comment	10	view_comment
41	Can add contact	11	add_contact
42	Can change contact	11	change_contact
43	Can delete contact	11	delete_contact
44	Can view contact	11	view_contact
45	Can add رویداد	12	add_event
46	Can change رویداد	12	change_event
47	Can delete رویداد	12	delete_event
48	Can view رویداد	12	view_event
49	Can add profile	13	add_profile
50	Can change profile	13	change_profile
51	Can delete profile	13	delete_profile
52	Can view profile	13	view_profile
53	Can add project	14	add_project
54	Can change project	14	change_project
55	Can delete project	14	delete_project
56	Can view project	14	view_project
57	Can add p category	15	add_pcategory
58	Can change p category	15	change_pcategory
59	Can delete p category	15	delete_pcategory
60	Can view p category	15	view_pcategory
61	Can add calender	16	add_calender
62	Can change calender	16	change_calender
63	Can delete calender	16	delete_calender
64	Can view calender	16	view_calender
65	Can add callout	17	add_callout
66	Can change callout	17	change_callout
67	Can delete callout	17	delete_callout
68	Can view callout	17	view_callout
69	Can add files	18	add_files
70	Can change files	18	change_files
71	Can delete files	18	delete_files
72	Can view files	18	view_files
73	Can add kv store	19	add_kvstore
74	Can change kv store	19	change_kvstore
75	Can delete kv store	19	delete_kvstore
76	Can view kv store	19	view_kvstore
77	Can add site	20	add_site
78	Can change site	20	change_site
79	Can delete site	20	delete_site
80	Can view site	20	view_site
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: cgcdbuser
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
3	pbkdf2_sha256$180000$5nFwxQNbvNYa$QhMUbtBHA6KLKVSN1buSg02Km/JWogI30ZWO4tnOXXY=	2020-10-29 07:47:12.146738+00	f	mehranzdi	مهران	زیدی	zeidimehran@gmail.com	f	t	2020-09-06 08:16:30+00
7	pbkdf2_sha256$180000$L36tCwPsy4pj$PLznMNcJfLTDo97oxfgOiLJn1JDZv41iWI1FEIMWOrc=	2020-09-30 14:39:22.231581+00	f	mitsuha	مهدی	رمضانی	mitsuha.miamizu4444@gmail.com	f	t	2020-09-30 14:36:16.087749+00
1	pbkdf2_sha256$180000$AAo9Tw7XFjL3$ZNnxkwcU+O68LdjnMxksUZ4bGNF6hl4WFUtugC42kfQ=	2020-09-06 07:23:12.058803+00	t	superadmin			reza77.rg@gmail.com	t	t	2020-09-05 20:42:28.63251+00
9	pbkdf2_sha256$180000$9fuTFNLmHSBZ$WWbh11/7fG2MIkPnRRuHiSeLNZnZovygLzYF6lASfL8=	2020-10-03 10:22:45.273222+00	f	Abbas_farahani	عباس	زنگارکی فراهانی	boserfarahani@gmail.com	f	t	2020-10-03 10:20:43.213493+00
4	pbkdf2_sha256$180000$H6zsBbQeNySI$wz1680tqpWI3K63budAHCyqBm3bqt6iOpth98BTLZMk=	2020-10-07 16:01:14.326839+00	f	sh_khoshnavapour	شقایق	خوشنواپور	sh_khoshnavapour@yahoo.com	f	t	2020-09-06 16:46:57+00
13	pbkdf2_sha256$180000$FES1EFN9GGyx$NWo6JgOL/9OGesqbUDA9zOjGtJwvfjQLk9MOq0HEohw=	2020-10-31 13:42:35.783005+00	f	Sepehr	سپهر	بیات نژاد	sepehrbayat966@gmail.com	f	t	2020-10-31 13:10:12+00
10	pbkdf2_sha256$180000$JaMMJdbso9Zb$I27xlXAT1Y3vi76EaBazYcBF9w8B2H3x/HoEUClUHhg=	2020-10-10 02:43:13.08268+00	f	Ali	Ali	Mollanoori	mohammad3shw@gmail.com	f	t	2020-10-10 02:41:22.287851+00
5	pbkdf2_sha256$180000$PU0VQVYSPIUT$HOVR/D1GwHrgRy1c6W8k7Yh7+GposODHzaN1ulhCapc=	2020-10-14 16:14:25.360807+00	f	MohammadHassan	محمدحسن	خانی‌پور	mhkhk@outlook.com	f	t	2020-09-09 02:51:11+00
11	pbkdf2_sha256$180000$KFt8kmfiCQYm$AJxyfZkf0Hnx/4eGlTn0bXBG5mYKULNg291P+2qiD/Q=	2020-10-16 12:49:56.900345+00	f	Faral	Amin	ghaemi	faral.ghaemi@gmail.com	f	t	2020-10-16 12:49:27.976185+00
12	pbkdf2_sha256$180000$yWBIKrbwE6MF$feeLvCQV+D3ecfEoCUV+vbCvxrgTiwmSFmERSvspGDk=	2020-10-19 14:49:54.586264+00	f	Alirezav	Alireza	V	ali.r81v@gmail.com	f	t	2020-10-19 14:48:15.638683+00
2	pbkdf2_sha256$180000$c9gecJS2HOxo$faVX0MN0JmlGG7CgdsTWLWjFPW7/KLT4OZGy/ELcT6o=	2020-10-26 16:49:42.339305+00	t	Rghaf	رضا	قدیری	reza77.rg@gmail.com	t	t	2020-09-06 07:18:05+00
8	pbkdf2_sha256$180000$0szAsQTbxWPr$HwscQEJ24u9TwlMPy+lMYVC9N/Pvu5eO8CIY+Fge9h8=	2020-10-28 17:13:24.000448+00	f	Reyhaneh.Ghfn	ریحانه	غفوریان	reyhaneh.ghafourian@gmail.com	f	t	2020-10-02 20:31:55+00
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: cgcdbuser
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: cgcdbuser
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: cgcdbuser
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2020-09-06 07:19:47.854482+00	2	Rghaf	2	[{"changed": {"fields": ["Superuser status"]}}]	4	1
2	2020-09-06 07:23:25.22281+00	2	Rghaf	2	[{"changed": {"fields": ["Staff status"]}}]	4	1
3	2020-09-06 07:38:12.934112+00	1	مقالات	1	[{"added": {}}]	8	2
4	2020-09-06 08:05:48.085765+00	1	ساخت پروژه Head Football در انجین Godot - published	1	[{"added": {}}]	7	2
5	2020-09-06 08:08:50.246165+00	1	ساخت پروژه Head Football در انجین Godot - published	2	[{"changed": {"fields": ["\\u0644\\u06cc\\u0646\\u06a9 \\u0648\\u06cc\\u062f\\u06cc\\u0648 \\u06cc\\u0648\\u062a\\u0648\\u0628"]}}]	7	2
6	2020-09-06 08:29:19.26619+00	2	ساخت بی‌نهایت object با position رندم در انجین گودوت (Godot) - published	1	[{"added": {}}]	7	2
7	2020-09-06 08:29:53.193303+00	1	ساخت پروژه Head Football در انجین Godot - published	2	[{"changed": {"fields": ["\\u0644\\u06cc\\u0646\\u06a9 \\u06af\\u06cc\\u062a\\u200c\\u0647\\u0627\\u0628"]}}]	7	2
8	2020-09-06 09:02:34.501267+00	3	دینو؛ دایناسور دوست داشتنی از جنس جاوا اسکریپت - published	1	[{"added": {}}]	7	2
9	2020-09-06 09:07:11.805944+00	3	mehranzdi	2	[{"changed": {"name": "profile", "object": "Profile object (2)", "fields": ["\\u0648\\u0636\\u0639\\u06cc\\u062a \\u0627\\u062f\\u0645\\u06cc\\u0646\\u06cc"]}}]	4	2
10	2020-09-06 10:02:38.774212+00	2	Rghaf	2	[{"changed": {"name": "profile", "object": "Profile object (1)", "fields": ["\\u0648\\u0636\\u0639\\u06cc\\u062a \\u0627\\u062f\\u0645\\u06cc\\u0646\\u06cc"]}}]	4	2
11	2020-09-06 16:51:24.401264+00	4	sh_khoshnavapour	2	[{"changed": {"name": "profile", "object": "Profile object (3)", "fields": ["\\u0648\\u0636\\u0639\\u06cc\\u062a \\u0627\\u062f\\u0645\\u06cc\\u0646\\u06cc"]}}]	4	2
12	2020-09-07 15:36:48.984763+00	1	callout object (1)	1	[{"added": {}}]	17	2
13	2020-09-07 15:37:54.992375+00	2	callout object (2)	1	[{"added": {}}]	17	2
14	2020-09-07 15:39:27.341751+00	3	callout object (3)	1	[{"added": {}}]	17	2
15	2020-09-07 15:40:15.503959+00	1	callout object (1)	2	[{"changed": {"fields": ["Title"]}}]	17	2
16	2020-09-07 15:43:45.031384+00	1	calender object (1)	1	[{"added": {}}]	16	2
17	2020-09-07 15:44:39.806341+00	1	files object (1)	1	[{"added": {}}]	18	2
18	2020-09-09 07:18:40.020534+00	5	MohammadHassan	2	[{"changed": {"name": "profile", "object": "Profile object (4)", "fields": ["\\u0648\\u0636\\u0639\\u06cc\\u062a \\u0646\\u0648\\u06cc\\u0633\\u0646\\u062f\\u06af\\u06cc"]}}]	4	2
19	2020-09-10 15:42:14.687885+00	4	callout object (4)	1	[{"added": {}}]	17	2
20	2020-09-10 15:42:50.125146+00	2	files object (2)	1	[{"added": {}}]	18	2
21	2020-09-11 11:22:51.91266+00	5	callout object (5)	1	[{"added": {}}]	17	2
22	2020-09-11 11:53:11.328673+00	5	MohammadHassan	2	[]	4	2
23	2020-09-12 19:01:16.799309+00	3	mehranzdi	2	[{"changed": {"fields": ["First name", "Last name"]}}]	4	2
24	2020-09-12 19:01:28.911546+00	6	EmailTest	3		4	2
25	2020-09-14 11:14:32.517641+00	4	مقایسه ی آرچ و دبیان - published	2	[{"changed": {"fields": ["Publish date"]}}]	7	2
26	2020-09-14 11:15:05.62855+00	5	آموزش پیاده سازی سیستم shooting با تاخیر زمانی در انجین گودوت (Godot) - published	2	[{"changed": {"fields": ["Publish date"]}}]	7	2
27	2020-09-14 11:15:28.331286+00	6	وب اسکرپینگ (Web Scraping) برای همه - published	2	[{"changed": {"fields": ["Publish date"]}}]	7	2
28	2020-09-14 11:15:48.663115+00	7	آشنایی با کراولرها و موتورهای جستجو - published	2	[{"changed": {"fields": ["Publish date"]}}]	7	2
29	2020-09-14 11:16:10.337442+00	8	نگاهی به توزیع لینوکس منت (Linux Mint) - published	2	[{"changed": {"fields": ["Publish date"]}}]	7	2
30	2020-09-14 11:16:26.368478+00	9	نگاهی به سیستم‌های Embedded - published	2	[{"changed": {"fields": ["Publish date"]}}]	7	2
31	2020-09-14 11:17:25.898968+00	11	مدولاسیون OFDM روشی برای تخمین کانال اینترنت اشیا - published	2	[{"changed": {"fields": ["Publish date"]}}]	7	2
32	2020-09-14 17:09:58.520147+00	1	cgeeksc.ir	2	[{"changed": {"fields": ["Domain name", "Display name"]}}]	20	2
33	2020-09-23 11:57:15.604991+00	5	MohammadHassan	2	[{"changed": {"fields": ["First name", "Last name"]}}]	4	2
34	2020-10-03 18:51:23.862986+00	6	callout object (6)	1	[{"added": {}}]	17	2
35	2020-10-03 18:52:43.891951+00	7	callout object (7)	1	[{"added": {}}]	17	2
36	2020-10-10 14:20:04.882362+00	1	calender object (1)	3		16	2
37	2020-10-10 14:20:21.888923+00	2	calender object (2)	1	[{"added": {}}]	16	2
38	2020-10-28 17:06:40.108217+00	8	Reyhaneh.Ghfn	2	[{"changed": {"name": "profile", "object": "Profile object (7)", "fields": ["\\u0648\\u0636\\u0639\\u06cc\\u062a \\u0646\\u0648\\u06cc\\u0633\\u0646\\u062f\\u06af\\u06cc"]}}]	4	2
39	2020-10-28 17:10:28.449166+00	8	Reyhaneh.Ghfn	2	[]	4	2
40	2020-10-31 13:12:26.76705+00	13	Sepehr	2	[{"changed": {"name": "profile", "object": "Profile object (12)", "fields": ["\\u0648\\u0636\\u0639\\u06cc\\u062a \\u0646\\u0648\\u06cc\\u0633\\u0646\\u062f\\u06af\\u06cc"]}}]	4	2
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: cgcdbuser
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	app_blog	post
8	app_blog	category
9	app_blog	slider
10	app_blog	comment
11	app_blog	contact
12	app_event	event
13	app_account	profile
14	app_project	project
15	app_project	pcategory
16	app_admin	calender
17	app_admin	callout
18	app_admin	files
19	thumbnail	kvstore
20	sites	site
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: cgcdbuser
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2020-09-05 20:40:21.759165+00
2	auth	0001_initial	2020-09-05 20:40:21.951156+00
3	admin	0001_initial	2020-09-05 20:40:22.295489+00
4	admin	0002_logentry_remove_auto_add	2020-09-05 20:40:22.350112+00
5	admin	0003_logentry_add_action_flag_choices	2020-09-05 20:40:22.421193+00
6	app_account	0001_initial	2020-09-05 20:40:22.503447+00
7	app_account	0002_auto_20200524_1400	2020-09-05 20:40:22.524832+00
8	app_account	0003_auto_20200524_2016	2020-09-05 20:40:22.65584+00
9	app_account	0004_auto_20200530_2102	2020-09-05 20:40:22.691537+00
10	app_account	0005_auto_20200715_2315	2020-09-05 20:40:22.710255+00
11	app_account	0006_auto_20200801_1758	2020-09-05 20:40:22.840479+00
12	app_admin	0001_initial	2020-09-05 20:40:22.938725+00
13	app_admin	0002_auto_20200820_1341	2020-09-05 20:40:22.95843+00
14	app_admin	0003_auto_20200830_2214	2020-09-05 20:40:22.979778+00
15	app_blog	0001_initial	2020-09-05 20:40:23.025243+00
16	app_blog	0002_post_image	2020-09-05 20:40:23.036695+00
17	app_blog	0003_auto_20200515_1219	2020-09-05 20:40:23.068533+00
18	app_blog	0004_auto_20200515_1222	2020-09-05 20:40:23.210056+00
19	app_blog	0005_auto_20200515_1232	2020-09-05 20:40:23.256202+00
20	app_blog	0006_post_category	2020-09-05 20:40:23.312738+00
21	app_blog	0007_post_user	2020-09-05 20:40:23.385863+00
22	app_blog	0008_auto_20200524_1749	2020-09-05 20:40:23.45765+00
23	app_blog	0009_auto_20200524_1749	2020-09-05 20:40:23.565765+00
24	app_blog	0010_auto_20200524_1800	2020-09-05 20:40:23.609298+00
25	app_blog	0011_category_mother	2020-09-05 20:40:23.657733+00
26	app_blog	0012_auto_20200615_1914	2020-09-05 20:40:23.7423+00
27	app_blog	0013_auto_20200616_2326	2020-09-05 20:40:23.80941+00
28	app_blog	0014_auto_20200616_2330	2020-09-05 20:40:23.922891+00
29	app_blog	0015_auto_20200616_2331	2020-09-05 20:40:24.010803+00
30	app_blog	0016_auto_20200616_2332	2020-09-05 20:40:24.11349+00
31	app_blog	0017_auto_20200624_0026	2020-09-05 20:40:24.181206+00
32	app_blog	0018_auto_20200624_0106	2020-09-05 20:40:24.212285+00
33	app_blog	0019_auto_20200625_0022	2020-09-05 20:40:24.247247+00
34	app_blog	0020_auto_20200625_0022	2020-09-05 20:40:24.277424+00
35	app_blog	0021_auto_20200625_1156	2020-09-05 20:40:24.309587+00
36	app_blog	0022_post_summary	2020-09-05 20:40:24.332077+00
37	app_blog	0023_auto_20200629_2018	2020-09-05 20:40:24.355626+00
38	app_blog	0024_auto_20200630_2359	2020-09-05 20:40:24.383844+00
39	app_blog	0025_auto_20200701_2018	2020-09-05 20:40:24.429956+00
40	app_blog	0026_auto_20200715_2315	2020-09-05 20:40:24.491984+00
41	app_blog	0027_comment	2020-09-05 20:40:24.551342+00
42	app_blog	0028_auto_20200717_2127	2020-09-05 20:40:24.777422+00
43	app_blog	0029_auto_20200719_1508	2020-09-05 20:40:24.9243+00
44	app_blog	0030_auto_20200720_1815	2020-09-05 20:40:24.988085+00
45	app_blog	0031_auto_20200720_1836	2020-09-05 20:40:25.004299+00
46	app_blog	0032_auto_20200731_1240	2020-09-05 20:40:25.02157+00
47	app_blog	0033_auto_20200731_1249	2020-09-05 20:40:25.034707+00
48	app_blog	0034_remove_slider_title	2020-09-05 20:40:25.044905+00
49	app_blog	0035_auto_20200801_1758	2020-09-05 20:40:25.517276+00
50	app_blog	0036_auto_20200801_1759	2020-09-05 20:40:25.563902+00
51	app_blog	0037_auto_20200801_1800	2020-09-05 20:40:25.62697+00
52	app_blog	0038_contact_status	2020-09-05 20:40:25.673032+00
53	app_blog	0039_auto_20200806_2328	2020-09-05 20:40:25.690168+00
54	app_blog	0040_post_github_url	2020-09-05 20:40:25.713346+00
55	app_blog	0041_post_publish_time	2020-09-05 20:40:25.737332+00
56	app_blog	0042_auto_20200820_1540	2020-09-05 20:40:25.774946+00
57	app_blog	0043_auto_20200820_1722	2020-09-05 20:40:25.815198+00
58	app_blog	0044_auto_20200820_1726	2020-09-05 20:40:25.83933+00
59	app_blog	0045_auto_20200830_2125	2020-09-05 20:40:25.861276+00
60	app_event	0001_initial	2020-09-05 20:40:25.932607+00
61	app_event	0002_event_person	2020-09-05 20:40:25.97702+00
62	app_event	0003_event_event_type	2020-09-05 20:40:26.022229+00
63	app_event	0004_auto_20200830_2149	2020-09-05 20:40:26.061681+00
64	app_event	0005_auto_20200830_2154	2020-09-05 20:40:26.190735+00
65	app_project	0001_initial	2020-09-05 20:40:26.288144+00
66	app_project	0002_auto_20200723_2348	2020-09-05 20:40:26.52615+00
67	app_project	0003_auto_20200723_2353	2020-09-05 20:40:26.662663+00
68	app_project	0004_project_category	2020-09-05 20:40:26.694064+00
69	app_project	0005_auto_20200801_1758	2020-09-05 20:40:27.018626+00
70	app_project	0006_project_summary	2020-09-05 20:40:27.050105+00
71	contenttypes	0002_remove_content_type_name	2020-09-05 20:40:27.107493+00
72	auth	0002_alter_permission_name_max_length	2020-09-05 20:40:27.12357+00
73	auth	0003_alter_user_email_max_length	2020-09-05 20:40:27.219877+00
74	auth	0004_alter_user_username_opts	2020-09-05 20:40:27.249+00
75	auth	0005_alter_user_last_login_null	2020-09-05 20:40:27.276801+00
76	auth	0006_require_contenttypes_0002	2020-09-05 20:40:27.284542+00
77	auth	0007_alter_validators_add_error_messages	2020-09-05 20:40:27.319495+00
78	auth	0008_alter_user_username_max_length	2020-09-05 20:40:27.375204+00
79	auth	0009_alter_user_last_name_max_length	2020-09-05 20:40:27.403156+00
80	auth	0010_alter_group_name_max_length	2020-09-05 20:40:27.423027+00
81	auth	0011_update_proxy_permissions	2020-09-05 20:40:27.455478+00
82	sessions	0001_initial	2020-09-05 20:40:27.512675+00
83	thumbnail	0001_initial	2020-09-05 20:40:27.583415+00
84	app_blog	0046_auto_20200906_1151	2020-09-06 07:21:43.935942+00
85	app_blog	0047_auto_20200906_1336	2020-09-06 09:06:17.001667+00
86	app_blog	0046_post_image_alt	2020-09-11 11:19:41.11812+00
87	sites	0001_initial	2020-09-11 11:19:41.247309+00
88	sites	0002_alter_domain_unique	2020-09-11 11:19:41.315037+00
89	app_blog	0047_auto_20200914_1541	2020-09-14 11:12:09.881388+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: cgcdbuser
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
nao0gdzn1wyx5p4shtbzdc3vw1u4n6az	OWEyMjRiYWQ3ZGI3NDAwNjFkNDgzMmFhODVhMzI0Y2ZjYzQ2Mzk1Mjp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlZDI5NzdjOTcyNDY2MzllMGJlMzNjNjQ0OWVkYWFmNWZlNzI4ZjkwIn0=	2020-09-20 07:18:22.715638+00
3p6o31un7y1kaaa5h3z6ln9zjzdmohbg	MGViNDEzYjAyYTVkMzUwOGRlNjkwODA5MTVhM2YxOWIxMzMyYjcyZjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIxYWE5OTQ5MzQxM2Q2MzI3ZWRlZjVlN2ViYmU5NmVhOWE2NGRhZGQyIn0=	2020-09-20 07:19:22.289214+00
wui63y1bpmvpdpmb7zcmr9p0qcqvgceu	MGViNDEzYjAyYTVkMzUwOGRlNjkwODA5MTVhM2YxOWIxMzMyYjcyZjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIxYWE5OTQ5MzQxM2Q2MzI3ZWRlZjVlN2ViYmU5NmVhOWE2NGRhZGQyIn0=	2020-09-20 07:23:12.067893+00
hso7r80wva37bay2k6i0xcmas7uo2s4n	NTA2ZGEzMWU4YzIyMzNmMTg5NTdjZjdmODFiZTU4OTEzMzNjMTExOTp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlOTkyMWRiNmIzNGVmYjgxODdiMWMwZTFhNTQzNGRhMGNhNWNiNTJkIn0=	2020-09-20 08:17:08.895899+00
de8tf7ha069gd84mqi6gdur75pj1lfsl	NmEwZmJkN2NlMGU5M2JkMDBhYTlmMjFkMzQzNDIzZDIxM2NiYTgxZDp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2OTg1YWMwY2U1OTZjY2I4NmM5M2I5ZDVkZGFjODFjNzkxYzYyMjEzIn0=	2020-09-20 16:47:57.82937+00
uooyfh1u9n91p3vkurn5n7spx84w45r5	OWEyMjRiYWQ3ZGI3NDAwNjFkNDgzMmFhODVhMzI0Y2ZjYzQ2Mzk1Mjp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlZDI5NzdjOTcyNDY2MzllMGJlMzNjNjQ0OWVkYWFmNWZlNzI4ZjkwIn0=	2020-09-26 09:34:22.423717+00
lhgqsnvlslcb24lobyucs3ihhgu6dkcf	NmEwZmJkN2NlMGU5M2JkMDBhYTlmMjFkMzQzNDIzZDIxM2NiYTgxZDp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2OTg1YWMwY2U1OTZjY2I4NmM5M2I5ZDVkZGFjODFjNzkxYzYyMjEzIn0=	2020-09-30 11:37:23.928037+00
3x9nei29ztgmybwdrp8tv4p2z99qlosk	ZTBmNWI5N2RiNzNkM2FjOGIwYzYwMzBhMTBiM2I2NTY3OWJmNDFkZTp7Il9hdXRoX3VzZXJfaWQiOiI1IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2MDI3OGI5MTYxY2M1MmE0NjNkMDdhYjRmMTU5MWMyNWFmMzU0ZmVmIn0=	2020-10-01 14:07:35.890378+00
ssji79w8i0uq5kojnc96bbdd5447dtn6	OWEyMjRiYWQ3ZGI3NDAwNjFkNDgzMmFhODVhMzI0Y2ZjYzQ2Mzk1Mjp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlZDI5NzdjOTcyNDY2MzllMGJlMzNjNjQ0OWVkYWFmNWZlNzI4ZjkwIn0=	2020-10-04 10:47:28.648959+00
0e3mhk4demlsll1s6g3htvqanfx8yiak	NTA2ZGEzMWU4YzIyMzNmMTg5NTdjZjdmODFiZTU4OTEzMzNjMTExOTp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlOTkyMWRiNmIzNGVmYjgxODdiMWMwZTFhNTQzNGRhMGNhNWNiNTJkIn0=	2020-10-07 09:41:43.107371+00
j5tw66i38b6jy4sryocyvj42dq3a8e13	OWEyMjRiYWQ3ZGI3NDAwNjFkNDgzMmFhODVhMzI0Y2ZjYzQ2Mzk1Mjp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlZDI5NzdjOTcyNDY2MzllMGJlMzNjNjQ0OWVkYWFmNWZlNzI4ZjkwIn0=	2020-10-11 06:22:45.436608+00
s02d1u20ilws819e0hr5euusr5jkn4js	NmEwZmJkN2NlMGU5M2JkMDBhYTlmMjFkMzQzNDIzZDIxM2NiYTgxZDp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2OTg1YWMwY2U1OTZjY2I4NmM5M2I5ZDVkZGFjODFjNzkxYzYyMjEzIn0=	2020-10-14 12:38:09.704927+00
bsdc45onu9kf5mfr9a4lvq0435aekw3w	OTMxMWIzMDQwMzgxODJhMDg0YjBkMjcwNzI0MWU5NDE1YjliNWUyYjp7Il9hdXRoX3VzZXJfaWQiOiI3IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhZWMwOTBjMzVkMzE5MzY5MThhNmM2ODUzOWY2ODZhMmExMjhiN2QwIn0=	2020-10-14 14:39:22.240258+00
9qpe2jw494a5tyudpxerljufab1kkasg	NmEwZmJkN2NlMGU5M2JkMDBhYTlmMjFkMzQzNDIzZDIxM2NiYTgxZDp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2OTg1YWMwY2U1OTZjY2I4NmM5M2I5ZDVkZGFjODFjNzkxYzYyMjEzIn0=	2020-10-14 16:03:47.48401+00
iwac8u2x9br2t4ltezmc96439z3vx8fa	ZWE1NzAxNjdiMDJkOWI1YjlmYzk2ZWU3ZDliOThjMmM1NTJkMThkODp7Il9hdXRoX3VzZXJfaWQiOiI4IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwZjAxY2NlNDA1MWMwMTJhZDU5YzRmZGUwNTAwMzRkMmExNDlmYzJlIn0=	2020-10-16 20:32:52.437822+00
lhgbgcunhwqbimbgv0kxtzepxjzkw3bt	ZWE1NzAxNjdiMDJkOWI1YjlmYzk2ZWU3ZDliOThjMmM1NTJkMThkODp7Il9hdXRoX3VzZXJfaWQiOiI4IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwZjAxY2NlNDA1MWMwMTJhZDU5YzRmZGUwNTAwMzRkMmExNDlmYzJlIn0=	2020-10-16 20:36:11.782787+00
mrf6wmox5z2v15lj71vf1gmh4cmt6pic	YzE4Nzc5NjZkNTY4NDMwM2ZhYmY3YWRlZWUzNDllZjJjMzc1NmU0ZTp7Il9hdXRoX3VzZXJfaWQiOiI5IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjNWFjYTBmNTEwOGMwNjgzMWM0Y2QyYzVkZmQwZGExN2RiZTc1OTcyIn0=	2020-10-17 10:22:45.285534+00
otctiktrubs3qt73qa4yf4lnt1zqkb5b	OWEyMjRiYWQ3ZGI3NDAwNjFkNDgzMmFhODVhMzI0Y2ZjYzQ2Mzk1Mjp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlZDI5NzdjOTcyNDY2MzllMGJlMzNjNjQ0OWVkYWFmNWZlNzI4ZjkwIn0=	2020-10-18 11:26:36.678575+00
rp28r2srrsvlnnl24ljgbwn19jgmjybl	NmEwZmJkN2NlMGU5M2JkMDBhYTlmMjFkMzQzNDIzZDIxM2NiYTgxZDp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2OTg1YWMwY2U1OTZjY2I4NmM5M2I5ZDVkZGFjODFjNzkxYzYyMjEzIn0=	2020-10-21 16:01:14.338014+00
na7dgx5gbboy0pksfay25jpzmj1euesf	MTFhZWQzYWQxMDYzZmJhOTllZGViMjg2NjgyZTVlZjBlZDgxNWE5Mzp7Il9hdXRoX3VzZXJfaWQiOiIxMCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZjkzYjRmZTg2YjQyZmE5MGMwOWQ3OWY5NjBlNDc3YmYzZDkxNWMwNiJ9	2020-10-24 02:43:13.092161+00
ui3tg5es8w7hthm2dibncfxf8gx9iqd0	OWEyMjRiYWQ3ZGI3NDAwNjFkNDgzMmFhODVhMzI0Y2ZjYzQ2Mzk1Mjp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlZDI5NzdjOTcyNDY2MzllMGJlMzNjNjQ0OWVkYWFmNWZlNzI4ZjkwIn0=	2020-10-25 17:27:53.145164+00
ucs3ho0q0sfxays1cmxbar0ovsltzy3x	NTA2ZGEzMWU4YzIyMzNmMTg5NTdjZjdmODFiZTU4OTEzMzNjMTExOTp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlOTkyMWRiNmIzNGVmYjgxODdiMWMwZTFhNTQzNGRhMGNhNWNiNTJkIn0=	2020-10-27 14:51:32.739307+00
q60r2q9uqijgu8np7jgwh82vsyxdb6uq	ZTBmNWI5N2RiNzNkM2FjOGIwYzYwMzBhMTBiM2I2NTY3OWJmNDFkZTp7Il9hdXRoX3VzZXJfaWQiOiI1IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2MDI3OGI5MTYxY2M1MmE0NjNkMDdhYjRmMTU5MWMyNWFmMzU0ZmVmIn0=	2020-10-28 16:14:25.382485+00
abiyp900mqjsw96n0k5uzocdmt6h6x4y	ZTFiODkwMjIwNmVkZmE4YjgxZmM5YTRhNmRlNDYwMzkzY2QyOWRjYzp7Il9hdXRoX3VzZXJfaWQiOiIxMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMzQxYjk5MTA3ZTE3ZTAzYmFkY2Q2ZWUwN2Y0NGIxOTk5OTc2ZGNhZSJ9	2020-10-30 12:49:56.907552+00
iby2sguum8zd2nscps2dykyoodep0axe	OWEyMjRiYWQ3ZGI3NDAwNjFkNDgzMmFhODVhMzI0Y2ZjYzQ2Mzk1Mjp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlZDI5NzdjOTcyNDY2MzllMGJlMzNjNjQ0OWVkYWFmNWZlNzI4ZjkwIn0=	2020-11-02 06:04:31.092454+00
qi71mg1xj2ajsd14z8bzfog5ezm9ghvd	NTZmOTg1MjRkZWFiMzUzZDhhZWM5NDMwZWNjOTQ3YjQ0OTFjN2Q4NTp7Il9hdXRoX3VzZXJfaWQiOiIxMiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYTI0NjE1YjdiNDhlODJiYzBmZGFmNWQ0ZDEwNzBjMDk1NWU1ZmFlMCJ9	2020-11-02 14:49:54.598999+00
um46bndi15pat8pd3mkkak9357em75uv	OWEyMjRiYWQ3ZGI3NDAwNjFkNDgzMmFhODVhMzI0Y2ZjYzQ2Mzk1Mjp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlZDI5NzdjOTcyNDY2MzllMGJlMzNjNjQ0OWVkYWFmNWZlNzI4ZjkwIn0=	2020-11-09 16:49:42.353425+00
2u037cyxgtv4xt2zh1d7ja2og90wfxz0	NTA2ZGEzMWU4YzIyMzNmMTg5NTdjZjdmODFiZTU4OTEzMzNjMTExOTp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlOTkyMWRiNmIzNGVmYjgxODdiMWMwZTFhNTQzNGRhMGNhNWNiNTJkIn0=	2020-11-12 07:47:12.157404+00
tpyb6n8gqpoununj66swcjrrwa8bj3qu	NDBlZGM0MDIxNjQ2NWNiZDliOGJiODdkMjk4YmJhOTEzYTViNjI3MDp7Il9hdXRoX3VzZXJfaWQiOiIxMyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYzcwYTg4NDBmNzEwYmFkY2I4ZGY1NTM2MTdmN2I1Mjg5ZWYyZjBlZSJ9	2020-11-14 13:11:27.810999+00
92jn6uxxdi8yj37aigzdgkvbbdpjceod	NDBlZGM0MDIxNjQ2NWNiZDliOGJiODdkMjk4YmJhOTEzYTViNjI3MDp7Il9hdXRoX3VzZXJfaWQiOiIxMyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYzcwYTg4NDBmNzEwYmFkY2I4ZGY1NTM2MTdmN2I1Mjg5ZWYyZjBlZSJ9	2020-11-14 13:42:35.794048+00
\.


--
-- Data for Name: django_site; Type: TABLE DATA; Schema: public; Owner: cgcdbuser
--

COPY public.django_site (id, domain, name) FROM stdin;
1	cgeeksc.ir	cgeeksc.ir
\.


--
-- Data for Name: thumbnail_kvstore; Type: TABLE DATA; Schema: public; Owner: cgcdbuser
--

COPY public.thumbnail_kvstore (key, value) FROM stdin;
\.


--
-- Name: app_account_profile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cgcdbuser
--

SELECT pg_catalog.setval('public.app_account_profile_id_seq', 12, true);


--
-- Name: app_admin_calender_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cgcdbuser
--

SELECT pg_catalog.setval('public.app_admin_calender_id_seq', 2, true);


--
-- Name: app_admin_callout_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cgcdbuser
--

SELECT pg_catalog.setval('public.app_admin_callout_id_seq', 7, true);


--
-- Name: app_admin_files_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cgcdbuser
--

SELECT pg_catalog.setval('public.app_admin_files_id_seq', 2, true);


--
-- Name: app_blog_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cgcdbuser
--

SELECT pg_catalog.setval('public.app_blog_category_id_seq', 17, true);


--
-- Name: app_blog_comment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cgcdbuser
--

SELECT pg_catalog.setval('public.app_blog_comment_id_seq', 1, false);


--
-- Name: app_blog_contact_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cgcdbuser
--

SELECT pg_catalog.setval('public.app_blog_contact_id_seq', 1, true);


--
-- Name: app_blog_post_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cgcdbuser
--

SELECT pg_catalog.setval('public.app_blog_post_id_seq', 31, true);


--
-- Name: app_blog_slider_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cgcdbuser
--

SELECT pg_catalog.setval('public.app_blog_slider_id_seq', 10, true);


--
-- Name: app_event_event_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cgcdbuser
--

SELECT pg_catalog.setval('public.app_event_event_id_seq', 6, true);


--
-- Name: app_project_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cgcdbuser
--

SELECT pg_catalog.setval('public.app_project_category_id_seq', 1, true);


--
-- Name: app_project_project_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cgcdbuser
--

SELECT pg_catalog.setval('public.app_project_project_id_seq', 2, true);


--
-- Name: app_project_project_members_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cgcdbuser
--

SELECT pg_catalog.setval('public.app_project_project_members_id_seq', 1, false);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cgcdbuser
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cgcdbuser
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cgcdbuser
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 80, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cgcdbuser
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cgcdbuser
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 14, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cgcdbuser
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cgcdbuser
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 40, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cgcdbuser
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 20, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cgcdbuser
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 89, true);


--
-- Name: django_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cgcdbuser
--

SELECT pg_catalog.setval('public.django_site_id_seq', 1, true);


--
-- Name: app_account_profile app_account_profile_pkey; Type: CONSTRAINT; Schema: public; Owner: cgcdbuser
--

ALTER TABLE ONLY public.app_account_profile
    ADD CONSTRAINT app_account_profile_pkey PRIMARY KEY (id);


--
-- Name: app_account_profile app_account_profile_user_id_key; Type: CONSTRAINT; Schema: public; Owner: cgcdbuser
--

ALTER TABLE ONLY public.app_account_profile
    ADD CONSTRAINT app_account_profile_user_id_key UNIQUE (user_id);


--
-- Name: app_admin_calender app_admin_calender_pkey; Type: CONSTRAINT; Schema: public; Owner: cgcdbuser
--

ALTER TABLE ONLY public.app_admin_calender
    ADD CONSTRAINT app_admin_calender_pkey PRIMARY KEY (id);


--
-- Name: app_admin_callout app_admin_callout_pkey; Type: CONSTRAINT; Schema: public; Owner: cgcdbuser
--

ALTER TABLE ONLY public.app_admin_callout
    ADD CONSTRAINT app_admin_callout_pkey PRIMARY KEY (id);


--
-- Name: app_admin_files app_admin_files_pkey; Type: CONSTRAINT; Schema: public; Owner: cgcdbuser
--

ALTER TABLE ONLY public.app_admin_files
    ADD CONSTRAINT app_admin_files_pkey PRIMARY KEY (id);


--
-- Name: app_blog_category app_blog_category_pkey; Type: CONSTRAINT; Schema: public; Owner: cgcdbuser
--

ALTER TABLE ONLY public.app_blog_category
    ADD CONSTRAINT app_blog_category_pkey PRIMARY KEY (id);


--
-- Name: app_blog_category app_blog_category_slug_7f70163c_uniq; Type: CONSTRAINT; Schema: public; Owner: cgcdbuser
--

ALTER TABLE ONLY public.app_blog_category
    ADD CONSTRAINT app_blog_category_slug_7f70163c_uniq UNIQUE (slug);


--
-- Name: app_blog_category app_blog_category_title_8c51afba_uniq; Type: CONSTRAINT; Schema: public; Owner: cgcdbuser
--

ALTER TABLE ONLY public.app_blog_category
    ADD CONSTRAINT app_blog_category_title_8c51afba_uniq UNIQUE (title);


--
-- Name: app_blog_comment app_blog_comment_pkey; Type: CONSTRAINT; Schema: public; Owner: cgcdbuser
--

ALTER TABLE ONLY public.app_blog_comment
    ADD CONSTRAINT app_blog_comment_pkey PRIMARY KEY (id);


--
-- Name: app_blog_contact app_blog_contact_pkey; Type: CONSTRAINT; Schema: public; Owner: cgcdbuser
--

ALTER TABLE ONLY public.app_blog_contact
    ADD CONSTRAINT app_blog_contact_pkey PRIMARY KEY (id);


--
-- Name: app_blog_post app_blog_post_pkey; Type: CONSTRAINT; Schema: public; Owner: cgcdbuser
--

ALTER TABLE ONLY public.app_blog_post
    ADD CONSTRAINT app_blog_post_pkey PRIMARY KEY (id);


--
-- Name: app_blog_post app_blog_post_slug_03d870c1_uniq; Type: CONSTRAINT; Schema: public; Owner: cgcdbuser
--

ALTER TABLE ONLY public.app_blog_post
    ADD CONSTRAINT app_blog_post_slug_03d870c1_uniq UNIQUE (slug);


--
-- Name: app_blog_slider app_blog_slider_pkey; Type: CONSTRAINT; Schema: public; Owner: cgcdbuser
--

ALTER TABLE ONLY public.app_blog_slider
    ADD CONSTRAINT app_blog_slider_pkey PRIMARY KEY (id);


--
-- Name: app_event_event app_event_event_pkey; Type: CONSTRAINT; Schema: public; Owner: cgcdbuser
--

ALTER TABLE ONLY public.app_event_event
    ADD CONSTRAINT app_event_event_pkey PRIMARY KEY (id);


--
-- Name: app_event_event app_event_event_slug_key; Type: CONSTRAINT; Schema: public; Owner: cgcdbuser
--

ALTER TABLE ONLY public.app_event_event
    ADD CONSTRAINT app_event_event_slug_key UNIQUE (slug);


--
-- Name: app_project_pcategory app_project_category_pkey; Type: CONSTRAINT; Schema: public; Owner: cgcdbuser
--

ALTER TABLE ONLY public.app_project_pcategory
    ADD CONSTRAINT app_project_category_pkey PRIMARY KEY (id);


--
-- Name: app_project_pcategory app_project_pcategory_slug_5c10add3_uniq; Type: CONSTRAINT; Schema: public; Owner: cgcdbuser
--

ALTER TABLE ONLY public.app_project_pcategory
    ADD CONSTRAINT app_project_pcategory_slug_5c10add3_uniq UNIQUE (slug);


--
-- Name: app_project_project_members app_project_project_members_pkey; Type: CONSTRAINT; Schema: public; Owner: cgcdbuser
--

ALTER TABLE ONLY public.app_project_project_members
    ADD CONSTRAINT app_project_project_members_pkey PRIMARY KEY (id);


--
-- Name: app_project_project_members app_project_project_members_project_id_user_id_e4f67329_uniq; Type: CONSTRAINT; Schema: public; Owner: cgcdbuser
--

ALTER TABLE ONLY public.app_project_project_members
    ADD CONSTRAINT app_project_project_members_project_id_user_id_e4f67329_uniq UNIQUE (project_id, user_id);


--
-- Name: app_project_project app_project_project_pkey; Type: CONSTRAINT; Schema: public; Owner: cgcdbuser
--

ALTER TABLE ONLY public.app_project_project
    ADD CONSTRAINT app_project_project_pkey PRIMARY KEY (id);


--
-- Name: app_project_project app_project_project_slug_8740834c_uniq; Type: CONSTRAINT; Schema: public; Owner: cgcdbuser
--

ALTER TABLE ONLY public.app_project_project
    ADD CONSTRAINT app_project_project_slug_8740834c_uniq UNIQUE (slug);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: cgcdbuser
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: cgcdbuser
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: cgcdbuser
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: cgcdbuser
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: cgcdbuser
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: cgcdbuser
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: cgcdbuser
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: cgcdbuser
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: cgcdbuser
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: cgcdbuser
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: cgcdbuser
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: cgcdbuser
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: cgcdbuser
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: cgcdbuser
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: cgcdbuser
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: cgcdbuser
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: cgcdbuser
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: django_site django_site_domain_a2e37b91_uniq; Type: CONSTRAINT; Schema: public; Owner: cgcdbuser
--

ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_domain_a2e37b91_uniq UNIQUE (domain);


--
-- Name: django_site django_site_pkey; Type: CONSTRAINT; Schema: public; Owner: cgcdbuser
--

ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_pkey PRIMARY KEY (id);


--
-- Name: thumbnail_kvstore thumbnail_kvstore_pkey; Type: CONSTRAINT; Schema: public; Owner: cgcdbuser
--

ALTER TABLE ONLY public.thumbnail_kvstore
    ADD CONSTRAINT thumbnail_kvstore_pkey PRIMARY KEY (key);


--
-- Name: app_blog_category_mother_id_6f876256; Type: INDEX; Schema: public; Owner: cgcdbuser
--

CREATE INDEX app_blog_category_mother_id_6f876256 ON public.app_blog_category USING btree (mother_id);


--
-- Name: app_blog_category_slug_7f70163c_like; Type: INDEX; Schema: public; Owner: cgcdbuser
--

CREATE INDEX app_blog_category_slug_7f70163c_like ON public.app_blog_category USING btree (slug varchar_pattern_ops);


--
-- Name: app_blog_category_title_8c51afba_like; Type: INDEX; Schema: public; Owner: cgcdbuser
--

CREATE INDEX app_blog_category_title_8c51afba_like ON public.app_blog_category USING btree (title varchar_pattern_ops);


--
-- Name: app_blog_comment_mother_id_8b7869f5; Type: INDEX; Schema: public; Owner: cgcdbuser
--

CREATE INDEX app_blog_comment_mother_id_8b7869f5 ON public.app_blog_comment USING btree (mother_id);


--
-- Name: app_blog_comment_post_id_e5a61a34; Type: INDEX; Schema: public; Owner: cgcdbuser
--

CREATE INDEX app_blog_comment_post_id_e5a61a34 ON public.app_blog_comment USING btree (post_id);


--
-- Name: app_blog_comment_user_id_4e2d00e2; Type: INDEX; Schema: public; Owner: cgcdbuser
--

CREATE INDEX app_blog_comment_user_id_4e2d00e2 ON public.app_blog_comment USING btree (user_id);


--
-- Name: app_blog_post_category_id_26068871; Type: INDEX; Schema: public; Owner: cgcdbuser
--

CREATE INDEX app_blog_post_category_id_26068871 ON public.app_blog_post USING btree (category_id);


--
-- Name: app_blog_post_slug_03d870c1_like; Type: INDEX; Schema: public; Owner: cgcdbuser
--

CREATE INDEX app_blog_post_slug_03d870c1_like ON public.app_blog_post USING btree (slug varchar_pattern_ops);


--
-- Name: app_blog_post_user_id_98b17f29; Type: INDEX; Schema: public; Owner: cgcdbuser
--

CREATE INDEX app_blog_post_user_id_98b17f29 ON public.app_blog_post USING btree (user_id);


--
-- Name: app_event_event_person_id_45345e2a; Type: INDEX; Schema: public; Owner: cgcdbuser
--

CREATE INDEX app_event_event_person_id_45345e2a ON public.app_event_event USING btree (person_id);


--
-- Name: app_event_event_slug_398a9501_like; Type: INDEX; Schema: public; Owner: cgcdbuser
--

CREATE INDEX app_event_event_slug_398a9501_like ON public.app_event_event USING btree (slug varchar_pattern_ops);


--
-- Name: app_project_pcategory_slug_5c10add3_like; Type: INDEX; Schema: public; Owner: cgcdbuser
--

CREATE INDEX app_project_pcategory_slug_5c10add3_like ON public.app_project_pcategory USING btree (slug varchar_pattern_ops);


--
-- Name: app_project_project_category_id_2d564387; Type: INDEX; Schema: public; Owner: cgcdbuser
--

CREATE INDEX app_project_project_category_id_2d564387 ON public.app_project_project USING btree (category_id);


--
-- Name: app_project_project_head_id_81970b28; Type: INDEX; Schema: public; Owner: cgcdbuser
--

CREATE INDEX app_project_project_head_id_81970b28 ON public.app_project_project USING btree (head_id);


--
-- Name: app_project_project_members_project_id_8dd8943a; Type: INDEX; Schema: public; Owner: cgcdbuser
--

CREATE INDEX app_project_project_members_project_id_8dd8943a ON public.app_project_project_members USING btree (project_id);


--
-- Name: app_project_project_members_user_id_099b65bc; Type: INDEX; Schema: public; Owner: cgcdbuser
--

CREATE INDEX app_project_project_members_user_id_099b65bc ON public.app_project_project_members USING btree (user_id);


--
-- Name: app_project_project_slug_8740834c_like; Type: INDEX; Schema: public; Owner: cgcdbuser
--

CREATE INDEX app_project_project_slug_8740834c_like ON public.app_project_project USING btree (slug varchar_pattern_ops);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: cgcdbuser
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: cgcdbuser
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: cgcdbuser
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: cgcdbuser
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: cgcdbuser
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: cgcdbuser
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: cgcdbuser
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: cgcdbuser
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: cgcdbuser
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: cgcdbuser
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: cgcdbuser
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: cgcdbuser
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: cgcdbuser
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: django_site_domain_a2e37b91_like; Type: INDEX; Schema: public; Owner: cgcdbuser
--

CREATE INDEX django_site_domain_a2e37b91_like ON public.django_site USING btree (domain varchar_pattern_ops);


--
-- Name: thumbnail_kvstore_key_3f850178_like; Type: INDEX; Schema: public; Owner: cgcdbuser
--

CREATE INDEX thumbnail_kvstore_key_3f850178_like ON public.thumbnail_kvstore USING btree (key varchar_pattern_ops);


--
-- Name: app_account_profile app_account_profile_user_id_02e7783f_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: cgcdbuser
--

ALTER TABLE ONLY public.app_account_profile
    ADD CONSTRAINT app_account_profile_user_id_02e7783f_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app_blog_category app_blog_category_mother_id_6f876256_fk_app_blog_category_id; Type: FK CONSTRAINT; Schema: public; Owner: cgcdbuser
--

ALTER TABLE ONLY public.app_blog_category
    ADD CONSTRAINT app_blog_category_mother_id_6f876256_fk_app_blog_category_id FOREIGN KEY (mother_id) REFERENCES public.app_blog_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app_blog_comment app_blog_comment_mother_id_8b7869f5_fk_app_blog_comment_id; Type: FK CONSTRAINT; Schema: public; Owner: cgcdbuser
--

ALTER TABLE ONLY public.app_blog_comment
    ADD CONSTRAINT app_blog_comment_mother_id_8b7869f5_fk_app_blog_comment_id FOREIGN KEY (mother_id) REFERENCES public.app_blog_comment(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app_blog_comment app_blog_comment_post_id_e5a61a34_fk_app_blog_post_id; Type: FK CONSTRAINT; Schema: public; Owner: cgcdbuser
--

ALTER TABLE ONLY public.app_blog_comment
    ADD CONSTRAINT app_blog_comment_post_id_e5a61a34_fk_app_blog_post_id FOREIGN KEY (post_id) REFERENCES public.app_blog_post(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app_blog_comment app_blog_comment_user_id_4e2d00e2_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: cgcdbuser
--

ALTER TABLE ONLY public.app_blog_comment
    ADD CONSTRAINT app_blog_comment_user_id_4e2d00e2_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app_blog_post app_blog_post_category_id_26068871_fk_app_blog_category_id; Type: FK CONSTRAINT; Schema: public; Owner: cgcdbuser
--

ALTER TABLE ONLY public.app_blog_post
    ADD CONSTRAINT app_blog_post_category_id_26068871_fk_app_blog_category_id FOREIGN KEY (category_id) REFERENCES public.app_blog_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app_blog_post app_blog_post_user_id_98b17f29_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: cgcdbuser
--

ALTER TABLE ONLY public.app_blog_post
    ADD CONSTRAINT app_blog_post_user_id_98b17f29_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app_event_event app_event_event_person_id_45345e2a_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: cgcdbuser
--

ALTER TABLE ONLY public.app_event_event
    ADD CONSTRAINT app_event_event_person_id_45345e2a_fk_auth_user_id FOREIGN KEY (person_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app_project_project_members app_project_project__project_id_8dd8943a_fk_app_proje; Type: FK CONSTRAINT; Schema: public; Owner: cgcdbuser
--

ALTER TABLE ONLY public.app_project_project_members
    ADD CONSTRAINT app_project_project__project_id_8dd8943a_fk_app_proje FOREIGN KEY (project_id) REFERENCES public.app_project_project(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app_project_project app_project_project_category_id_2d564387_fk_app_proje; Type: FK CONSTRAINT; Schema: public; Owner: cgcdbuser
--

ALTER TABLE ONLY public.app_project_project
    ADD CONSTRAINT app_project_project_category_id_2d564387_fk_app_proje FOREIGN KEY (category_id) REFERENCES public.app_project_pcategory(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app_project_project app_project_project_head_id_81970b28_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: cgcdbuser
--

ALTER TABLE ONLY public.app_project_project
    ADD CONSTRAINT app_project_project_head_id_81970b28_fk_auth_user_id FOREIGN KEY (head_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app_project_project_members app_project_project_members_user_id_099b65bc_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: cgcdbuser
--

ALTER TABLE ONLY public.app_project_project_members
    ADD CONSTRAINT app_project_project_members_user_id_099b65bc_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: cgcdbuser
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: cgcdbuser
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: cgcdbuser
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: cgcdbuser
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: cgcdbuser
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: cgcdbuser
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: cgcdbuser
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: cgcdbuser
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: cgcdbuser
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

