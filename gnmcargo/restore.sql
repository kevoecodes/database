--
-- NOTE:
--
-- File paths need to be edited. Search for $$PATH$$ and
-- replace it with the path to the directory containing
-- the extracted data files.
--
--
-- PostgreSQL database dump
--

-- Dumped from database version 12.16 (Ubuntu 12.16-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.16 (Ubuntu 12.16-0ubuntu0.20.04.1)

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

DROP DATABASE gnmcargo;
--
-- Name: gnmcargo; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE gnmcargo WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE gnmcargo OWNER TO postgres;

\connect gnmcargo

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
-- Name: api_announcement; Type: TABLE; Schema: public; Owner: gnmadmin
--

CREATE TABLE public.api_announcement (
    id integer NOT NULL,
    status integer NOT NULL,
    url character varying(300) NOT NULL,
    ios_url character varying(300) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    modified_at timestamp with time zone NOT NULL,
    created_by_id integer NOT NULL
);


ALTER TABLE public.api_announcement OWNER TO gnmadmin;

--
-- Name: api_announcement_id_seq; Type: SEQUENCE; Schema: public; Owner: gnmadmin
--

CREATE SEQUENCE public.api_announcement_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_announcement_id_seq OWNER TO gnmadmin;

--
-- Name: api_announcement_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gnmadmin
--

ALTER SEQUENCE public.api_announcement_id_seq OWNED BY public.api_announcement.id;


--
-- Name: api_bill; Type: TABLE; Schema: public; Owner: gnmadmin
--

CREATE TABLE public.api_bill (
    id integer NOT NULL,
    uid uuid NOT NULL,
    bill_no character varying(100) NOT NULL,
    shipping_line character varying(100) NOT NULL,
    status integer NOT NULL,
    created_date timestamp with time zone NOT NULL,
    modified_date timestamp with time zone NOT NULL,
    container_id integer,
    user_id integer NOT NULL
);


ALTER TABLE public.api_bill OWNER TO gnmadmin;

--
-- Name: api_bill_id_seq; Type: SEQUENCE; Schema: public; Owner: gnmadmin
--

CREATE SEQUENCE public.api_bill_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_bill_id_seq OWNER TO gnmadmin;

--
-- Name: api_bill_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gnmadmin
--

ALTER SEQUENCE public.api_bill_id_seq OWNED BY public.api_bill.id;


--
-- Name: api_category; Type: TABLE; Schema: public; Owner: gnmadmin
--

CREATE TABLE public.api_category (
    id integer NOT NULL,
    uid uuid NOT NULL,
    name character varying(100) NOT NULL,
    price numeric(10,2) NOT NULL,
    user_id integer NOT NULL,
    status integer NOT NULL
);


ALTER TABLE public.api_category OWNER TO gnmadmin;

--
-- Name: api_category_id_seq; Type: SEQUENCE; Schema: public; Owner: gnmadmin
--

CREATE SEQUENCE public.api_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_category_id_seq OWNER TO gnmadmin;

--
-- Name: api_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gnmadmin
--

ALTER SEQUENCE public.api_category_id_seq OWNED BY public.api_category.id;


--
-- Name: api_consignment; Type: TABLE; Schema: public; Owner: gnmadmin
--

CREATE TABLE public.api_consignment (
    id integer NOT NULL,
    uid uuid NOT NULL,
    name character varying(300) NOT NULL,
    tracking_number character varying(17) NOT NULL,
    shipping_charge numeric(10,2) NOT NULL,
    cbm character varying(10) NOT NULL,
    created_date timestamp with time zone NOT NULL,
    modified_date timestamp with time zone NOT NULL,
    delivery_status integer NOT NULL,
    customer_id integer NOT NULL,
    price_category_id integer NOT NULL,
    user_id integer NOT NULL,
    warehouse_id integer NOT NULL,
    good character varying(100) NOT NULL,
    pkgs character varying(100) NOT NULL,
    label character varying(100) NOT NULL
);


ALTER TABLE public.api_consignment OWNER TO gnmadmin;

--
-- Name: api_consignment_id_seq; Type: SEQUENCE; Schema: public; Owner: gnmadmin
--

CREATE SEQUENCE public.api_consignment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_consignment_id_seq OWNER TO gnmadmin;

--
-- Name: api_consignment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gnmadmin
--

ALTER SEQUENCE public.api_consignment_id_seq OWNED BY public.api_consignment.id;


--
-- Name: api_container; Type: TABLE; Schema: public; Owner: gnmadmin
--

CREATE TABLE public.api_container (
    id integer NOT NULL,
    uid uuid NOT NULL,
    shipping_status integer NOT NULL,
    container_no character varying(100) NOT NULL,
    shipping_line character varying(100) NOT NULL,
    destination character varying(100) NOT NULL,
    shipping_date date NOT NULL,
    arrival_date date NOT NULL,
    created_date timestamp with time zone NOT NULL,
    modified_date timestamp with time zone NOT NULL,
    user_id integer NOT NULL,
    origin character varying(100) NOT NULL,
    seal_no character varying(100) NOT NULL,
    volume character varying(100) NOT NULL
);


ALTER TABLE public.api_container OWNER TO gnmadmin;

--
-- Name: api_container_id_seq; Type: SEQUENCE; Schema: public; Owner: gnmadmin
--

CREATE SEQUENCE public.api_container_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_container_id_seq OWNER TO gnmadmin;

--
-- Name: api_container_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gnmadmin
--

ALTER SEQUENCE public.api_container_id_seq OWNED BY public.api_container.id;


--
-- Name: api_customer; Type: TABLE; Schema: public; Owner: gnmadmin
--

CREATE TABLE public.api_customer (
    id integer NOT NULL,
    uid uuid NOT NULL,
    firstname character varying(50) NOT NULL,
    lastname character varying(50) NOT NULL,
    cellphone character varying(20) NOT NULL,
    email character varying(100) NOT NULL,
    created_date timestamp with time zone NOT NULL,
    modified_date timestamp with time zone NOT NULL,
    user_id integer NOT NULL,
    address character varying(150) NOT NULL,
    company_name character varying(120) NOT NULL,
    id_number character varying(120) NOT NULL,
    id_type character varying(120) NOT NULL,
    status integer NOT NULL
);


ALTER TABLE public.api_customer OWNER TO gnmadmin;

--
-- Name: api_customer_id_seq; Type: SEQUENCE; Schema: public; Owner: gnmadmin
--

CREATE SEQUENCE public.api_customer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_customer_id_seq OWNER TO gnmadmin;

--
-- Name: api_customer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gnmadmin
--

ALTER SEQUENCE public.api_customer_id_seq OWNED BY public.api_customer.id;


--
-- Name: api_customerdevice; Type: TABLE; Schema: public; Owner: gnmadmin
--

CREATE TABLE public.api_customerdevice (
    id integer NOT NULL,
    device_token character varying(255) NOT NULL,
    device_type character varying(50) NOT NULL,
    device_name character varying(255) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    customer_id integer NOT NULL
);


ALTER TABLE public.api_customerdevice OWNER TO gnmadmin;

--
-- Name: api_customerdevice_id_seq; Type: SEQUENCE; Schema: public; Owner: gnmadmin
--

CREATE SEQUENCE public.api_customerdevice_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_customerdevice_id_seq OWNER TO gnmadmin;

--
-- Name: api_customerdevice_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gnmadmin
--

ALTER SEQUENCE public.api_customerdevice_id_seq OWNED BY public.api_customerdevice.id;


--
-- Name: api_good; Type: TABLE; Schema: public; Owner: gnmadmin
--

CREATE TABLE public.api_good (
    id integer NOT NULL,
    uid uuid NOT NULL,
    name character varying(100) NOT NULL,
    quantity integer NOT NULL,
    unit character varying(100) NOT NULL,
    supplier_receipt_no character varying(100) NOT NULL,
    created_date timestamp with time zone NOT NULL,
    modified_date timestamp with time zone NOT NULL,
    status integer NOT NULL,
    customer_id integer NOT NULL,
    supplier_id integer NOT NULL,
    user_id integer NOT NULL,
    warehouse_id integer NOT NULL,
    pckg character varying(100) NOT NULL,
    CONSTRAINT api_good_quantity_check CHECK ((quantity >= 0))
);


ALTER TABLE public.api_good OWNER TO gnmadmin;

--
-- Name: api_good_id_seq; Type: SEQUENCE; Schema: public; Owner: gnmadmin
--

CREATE SEQUENCE public.api_good_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_good_id_seq OWNER TO gnmadmin;

--
-- Name: api_good_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gnmadmin
--

ALTER SEQUENCE public.api_good_id_seq OWNED BY public.api_good.id;


--
-- Name: api_goodconsignment; Type: TABLE; Schema: public; Owner: gnmadmin
--

CREATE TABLE public.api_goodconsignment (
    id integer NOT NULL,
    uid uuid NOT NULL,
    created_date timestamp with time zone NOT NULL,
    modified_date timestamp with time zone NOT NULL,
    status integer NOT NULL,
    consignment_id integer NOT NULL,
    good_id integer NOT NULL,
    user_id integer NOT NULL,
    container_id integer,
    customer_id integer NOT NULL,
    quantity integer NOT NULL,
    unit character varying(100) NOT NULL,
    pkgs integer NOT NULL,
    CONSTRAINT api_goodconsignment_pkgs_check CHECK ((pkgs >= 0)),
    CONSTRAINT api_goodconsignment_quantity_check CHECK ((quantity >= 0))
);


ALTER TABLE public.api_goodconsignment OWNER TO gnmadmin;

--
-- Name: api_goodconsignment_id_seq; Type: SEQUENCE; Schema: public; Owner: gnmadmin
--

CREATE SEQUENCE public.api_goodconsignment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_goodconsignment_id_seq OWNER TO gnmadmin;

--
-- Name: api_goodconsignment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gnmadmin
--

ALTER SEQUENCE public.api_goodconsignment_id_seq OWNED BY public.api_goodconsignment.id;


--
-- Name: api_historicalwarehouse; Type: TABLE; Schema: public; Owner: gnmadmin
--

CREATE TABLE public.api_historicalwarehouse (
    id integer NOT NULL,
    uid uuid NOT NULL,
    name character varying(300) NOT NULL,
    location character varying(300) NOT NULL,
    address character varying(300) NOT NULL,
    created_date timestamp with time zone NOT NULL,
    modified_date timestamp with time zone NOT NULL,
    status integer NOT NULL,
    history_id integer NOT NULL,
    history_date timestamp with time zone NOT NULL,
    history_change_reason character varying(100),
    history_type character varying(1) NOT NULL,
    history_user_id integer,
    user_id integer
);


ALTER TABLE public.api_historicalwarehouse OWNER TO gnmadmin;

--
-- Name: api_historicalwarehouse_history_id_seq; Type: SEQUENCE; Schema: public; Owner: gnmadmin
--

CREATE SEQUENCE public.api_historicalwarehouse_history_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_historicalwarehouse_history_id_seq OWNER TO gnmadmin;

--
-- Name: api_historicalwarehouse_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gnmadmin
--

ALTER SEQUENCE public.api_historicalwarehouse_history_id_seq OWNED BY public.api_historicalwarehouse.history_id;


--
-- Name: api_job; Type: TABLE; Schema: public; Owner: gnmadmin
--

CREATE TABLE public.api_job (
    id integer NOT NULL,
    status integer NOT NULL,
    type integer NOT NULL,
    object_id character varying(10),
    extra text,
    message character varying(200),
    created_at timestamp with time zone NOT NULL,
    modified_at timestamp with time zone NOT NULL,
    created_by_id integer NOT NULL
);


ALTER TABLE public.api_job OWNER TO gnmadmin;

--
-- Name: api_job_id_seq; Type: SEQUENCE; Schema: public; Owner: gnmadmin
--

CREATE SEQUENCE public.api_job_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_job_id_seq OWNER TO gnmadmin;

--
-- Name: api_job_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gnmadmin
--

ALTER SEQUENCE public.api_job_id_seq OWNED BY public.api_job.id;


--
-- Name: api_jobfailurelog; Type: TABLE; Schema: public; Owner: gnmadmin
--

CREATE TABLE public.api_jobfailurelog (
    id integer NOT NULL,
    object_id character varying(10) NOT NULL,
    message character varying(1000) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    job_id integer NOT NULL
);


ALTER TABLE public.api_jobfailurelog OWNER TO gnmadmin;

--
-- Name: api_jobfailurelog_id_seq; Type: SEQUENCE; Schema: public; Owner: gnmadmin
--

CREATE SEQUENCE public.api_jobfailurelog_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_jobfailurelog_id_seq OWNER TO gnmadmin;

--
-- Name: api_jobfailurelog_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gnmadmin
--

ALTER SEQUENCE public.api_jobfailurelog_id_seq OWNED BY public.api_jobfailurelog.id;


--
-- Name: api_notification; Type: TABLE; Schema: public; Owner: gnmadmin
--

CREATE TABLE public.api_notification (
    id integer NOT NULL,
    title character varying(100) NOT NULL,
    body character varying(400) NOT NULL,
    status integer NOT NULL,
    scope integer NOT NULL,
    seen_status integer NOT NULL,
    delivered_to character varying(512)[] NOT NULL,
    seen_by character varying(512)[] NOT NULL,
    created_at timestamp with time zone NOT NULL,
    modified_at timestamp with time zone NOT NULL,
    created_by_id integer NOT NULL,
    customer_id integer,
    level integer NOT NULL
);


ALTER TABLE public.api_notification OWNER TO gnmadmin;

--
-- Name: api_notification_id_seq; Type: SEQUENCE; Schema: public; Owner: gnmadmin
--

CREATE SEQUENCE public.api_notification_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_notification_id_seq OWNER TO gnmadmin;

--
-- Name: api_notification_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gnmadmin
--

ALTER SEQUENCE public.api_notification_id_seq OWNED BY public.api_notification.id;


--
-- Name: api_otp; Type: TABLE; Schema: public; Owner: gnmadmin
--

CREATE TABLE public.api_otp (
    id integer NOT NULL,
    password character varying(4) NOT NULL,
    created_date timestamp with time zone NOT NULL,
    modified_date timestamp with time zone NOT NULL,
    customer_id integer NOT NULL
);


ALTER TABLE public.api_otp OWNER TO gnmadmin;

--
-- Name: api_otp_id_seq; Type: SEQUENCE; Schema: public; Owner: gnmadmin
--

CREATE SEQUENCE public.api_otp_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_otp_id_seq OWNER TO gnmadmin;

--
-- Name: api_otp_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gnmadmin
--

ALTER SEQUENCE public.api_otp_id_seq OWNED BY public.api_otp.id;


--
-- Name: api_shipment; Type: TABLE; Schema: public; Owner: gnmadmin
--

CREATE TABLE public.api_shipment (
    id integer NOT NULL,
    uid uuid NOT NULL,
    created_date timestamp with time zone NOT NULL,
    modified_date timestamp with time zone NOT NULL,
    consignment_id integer NOT NULL,
    container_id integer NOT NULL,
    user_id integer NOT NULL,
    status integer NOT NULL
);


ALTER TABLE public.api_shipment OWNER TO gnmadmin;

--
-- Name: api_shipment_id_seq; Type: SEQUENCE; Schema: public; Owner: gnmadmin
--

CREATE SEQUENCE public.api_shipment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_shipment_id_seq OWNER TO gnmadmin;

--
-- Name: api_shipment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gnmadmin
--

ALTER SEQUENCE public.api_shipment_id_seq OWNED BY public.api_shipment.id;


--
-- Name: api_sms; Type: TABLE; Schema: public; Owner: gnmadmin
--

CREATE TABLE public.api_sms (
    id integer NOT NULL,
    sender_id character varying(20) NOT NULL,
    response character varying(50000) NOT NULL,
    created_date timestamp with time zone NOT NULL,
    modified_date timestamp with time zone NOT NULL,
    status integer NOT NULL,
    type character varying(1000) NOT NULL,
    customer_id_id integer NOT NULL
);


ALTER TABLE public.api_sms OWNER TO gnmadmin;

--
-- Name: api_sms_id_seq; Type: SEQUENCE; Schema: public; Owner: gnmadmin
--

CREATE SEQUENCE public.api_sms_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_sms_id_seq OWNER TO gnmadmin;

--
-- Name: api_sms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gnmadmin
--

ALTER SEQUENCE public.api_sms_id_seq OWNED BY public.api_sms.id;


--
-- Name: api_supplier; Type: TABLE; Schema: public; Owner: gnmadmin
--

CREATE TABLE public.api_supplier (
    id integer NOT NULL,
    uid uuid NOT NULL,
    name character varying(300) NOT NULL,
    cellphone character varying(20) NOT NULL,
    address character varying(300) NOT NULL,
    created_date timestamp with time zone NOT NULL,
    modified_date timestamp with time zone NOT NULL,
    status integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.api_supplier OWNER TO gnmadmin;

--
-- Name: api_supplier_id_seq; Type: SEQUENCE; Schema: public; Owner: gnmadmin
--

CREATE SEQUENCE public.api_supplier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_supplier_id_seq OWNER TO gnmadmin;

--
-- Name: api_supplier_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gnmadmin
--

ALTER SEQUENCE public.api_supplier_id_seq OWNED BY public.api_supplier.id;


--
-- Name: api_textsms; Type: TABLE; Schema: public; Owner: gnmadmin
--

CREATE TABLE public.api_textsms (
    id integer NOT NULL,
    cellphone character varying(20) NOT NULL,
    message text NOT NULL,
    status integer NOT NULL,
    type character varying(20),
    response character varying(1000),
    counts integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    modified_at timestamp with time zone NOT NULL,
    created_by_id integer NOT NULL
);


ALTER TABLE public.api_textsms OWNER TO gnmadmin;

--
-- Name: api_textsms_id_seq; Type: SEQUENCE; Schema: public; Owner: gnmadmin
--

CREATE SEQUENCE public.api_textsms_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_textsms_id_seq OWNER TO gnmadmin;

--
-- Name: api_textsms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gnmadmin
--

ALTER SEQUENCE public.api_textsms_id_seq OWNED BY public.api_textsms.id;


--
-- Name: api_warehouse; Type: TABLE; Schema: public; Owner: gnmadmin
--

CREATE TABLE public.api_warehouse (
    id integer NOT NULL,
    uid uuid NOT NULL,
    name character varying(300) NOT NULL,
    location character varying(300) NOT NULL,
    created_date timestamp with time zone NOT NULL,
    modified_date timestamp with time zone NOT NULL,
    user_id integer NOT NULL,
    address character varying(300) NOT NULL,
    status integer NOT NULL
);


ALTER TABLE public.api_warehouse OWNER TO gnmadmin;

--
-- Name: api_warehouse_id_seq; Type: SEQUENCE; Schema: public; Owner: gnmadmin
--

CREATE SEQUENCE public.api_warehouse_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_warehouse_id_seq OWNER TO gnmadmin;

--
-- Name: api_warehouse_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gnmadmin
--

ALTER SEQUENCE public.api_warehouse_id_seq OWNED BY public.api_warehouse.id;


--
-- Name: api_whatsapp; Type: TABLE; Schema: public; Owner: gnmadmin
--

CREATE TABLE public.api_whatsapp (
    id integer NOT NULL,
    customer_name character varying(100) NOT NULL,
    sender_id character varying(20) NOT NULL,
    request character varying(50000) NOT NULL,
    response character varying(50000) NOT NULL,
    created_date timestamp with time zone NOT NULL,
    modified_date timestamp with time zone NOT NULL,
    status integer NOT NULL,
    type character varying(2) NOT NULL,
    customer_id_id integer NOT NULL
);


ALTER TABLE public.api_whatsapp OWNER TO gnmadmin;

--
-- Name: api_whatsapp_id_seq; Type: SEQUENCE; Schema: public; Owner: gnmadmin
--

CREATE SEQUENCE public.api_whatsapp_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_whatsapp_id_seq OWNER TO gnmadmin;

--
-- Name: api_whatsapp_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gnmadmin
--

ALTER SEQUENCE public.api_whatsapp_id_seq OWNED BY public.api_whatsapp.id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: gnmadmin
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO gnmadmin;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: gnmadmin
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO gnmadmin;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gnmadmin
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: gnmadmin
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO gnmadmin;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: gnmadmin
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO gnmadmin;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gnmadmin
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: gnmadmin
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO gnmadmin;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: gnmadmin
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO gnmadmin;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gnmadmin
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: authtoken_token; Type: TABLE; Schema: public; Owner: gnmadmin
--

CREATE TABLE public.authtoken_token (
    key character varying(40) NOT NULL,
    created timestamp with time zone NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.authtoken_token OWNER TO gnmadmin;

--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: gnmadmin
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


ALTER TABLE public.django_admin_log OWNER TO gnmadmin;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: gnmadmin
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO gnmadmin;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gnmadmin
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: gnmadmin
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO gnmadmin;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: gnmadmin
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO gnmadmin;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gnmadmin
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: gnmadmin
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO gnmadmin;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: gnmadmin
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO gnmadmin;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gnmadmin
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: gnmadmin
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO gnmadmin;

--
-- Name: users_user; Type: TABLE; Schema: public; Owner: gnmadmin
--

CREATE TABLE public.users_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    uid uuid NOT NULL,
    email character varying(254) NOT NULL,
    first_name character varying(1000) NOT NULL,
    last_name character varying(1000) NOT NULL,
    cellphone character varying(20) NOT NULL,
    role smallint,
    date_joined timestamp with time zone NOT NULL,
    is_active boolean NOT NULL,
    is_staff boolean NOT NULL,
    is_admin boolean NOT NULL,
    is_deleted boolean NOT NULL,
    created_date timestamp with time zone NOT NULL,
    modified_date timestamp with time zone NOT NULL,
    created_by character varying(254) NOT NULL,
    modified_by character varying(254) NOT NULL,
    CONSTRAINT users_user_role_check CHECK ((role >= 0))
);


ALTER TABLE public.users_user OWNER TO gnmadmin;

--
-- Name: users_user_groups; Type: TABLE; Schema: public; Owner: gnmadmin
--

CREATE TABLE public.users_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.users_user_groups OWNER TO gnmadmin;

--
-- Name: users_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: gnmadmin
--

CREATE SEQUENCE public.users_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_groups_id_seq OWNER TO gnmadmin;

--
-- Name: users_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gnmadmin
--

ALTER SEQUENCE public.users_user_groups_id_seq OWNED BY public.users_user_groups.id;


--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: gnmadmin
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO gnmadmin;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gnmadmin
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users_user.id;


--
-- Name: users_user_user_permissions; Type: TABLE; Schema: public; Owner: gnmadmin
--

CREATE TABLE public.users_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.users_user_user_permissions OWNER TO gnmadmin;

--
-- Name: users_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: gnmadmin
--

CREATE SEQUENCE public.users_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_user_permissions_id_seq OWNER TO gnmadmin;

--
-- Name: users_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gnmadmin
--

ALTER SEQUENCE public.users_user_user_permissions_id_seq OWNED BY public.users_user_user_permissions.id;


--
-- Name: api_announcement id; Type: DEFAULT; Schema: public; Owner: gnmadmin
--

ALTER TABLE ONLY public.api_announcement ALTER COLUMN id SET DEFAULT nextval('public.api_announcement_id_seq'::regclass);


--
-- Name: api_bill id; Type: DEFAULT; Schema: public; Owner: gnmadmin
--

ALTER TABLE ONLY public.api_bill ALTER COLUMN id SET DEFAULT nextval('public.api_bill_id_seq'::regclass);


--
-- Name: api_category id; Type: DEFAULT; Schema: public; Owner: gnmadmin
--

ALTER TABLE ONLY public.api_category ALTER COLUMN id SET DEFAULT nextval('public.api_category_id_seq'::regclass);


--
-- Name: api_consignment id; Type: DEFAULT; Schema: public; Owner: gnmadmin
--

ALTER TABLE ONLY public.api_consignment ALTER COLUMN id SET DEFAULT nextval('public.api_consignment_id_seq'::regclass);


--
-- Name: api_container id; Type: DEFAULT; Schema: public; Owner: gnmadmin
--

ALTER TABLE ONLY public.api_container ALTER COLUMN id SET DEFAULT nextval('public.api_container_id_seq'::regclass);


--
-- Name: api_customer id; Type: DEFAULT; Schema: public; Owner: gnmadmin
--

ALTER TABLE ONLY public.api_customer ALTER COLUMN id SET DEFAULT nextval('public.api_customer_id_seq'::regclass);


--
-- Name: api_customerdevice id; Type: DEFAULT; Schema: public; Owner: gnmadmin
--

ALTER TABLE ONLY public.api_customerdevice ALTER COLUMN id SET DEFAULT nextval('public.api_customerdevice_id_seq'::regclass);


--
-- Name: api_good id; Type: DEFAULT; Schema: public; Owner: gnmadmin
--

ALTER TABLE ONLY public.api_good ALTER COLUMN id SET DEFAULT nextval('public.api_good_id_seq'::regclass);


--
-- Name: api_goodconsignment id; Type: DEFAULT; Schema: public; Owner: gnmadmin
--

ALTER TABLE ONLY public.api_goodconsignment ALTER COLUMN id SET DEFAULT nextval('public.api_goodconsignment_id_seq'::regclass);


--
-- Name: api_historicalwarehouse history_id; Type: DEFAULT; Schema: public; Owner: gnmadmin
--

ALTER TABLE ONLY public.api_historicalwarehouse ALTER COLUMN history_id SET DEFAULT nextval('public.api_historicalwarehouse_history_id_seq'::regclass);


--
-- Name: api_job id; Type: DEFAULT; Schema: public; Owner: gnmadmin
--

ALTER TABLE ONLY public.api_job ALTER COLUMN id SET DEFAULT nextval('public.api_job_id_seq'::regclass);


--
-- Name: api_jobfailurelog id; Type: DEFAULT; Schema: public; Owner: gnmadmin
--

ALTER TABLE ONLY public.api_jobfailurelog ALTER COLUMN id SET DEFAULT nextval('public.api_jobfailurelog_id_seq'::regclass);


--
-- Name: api_notification id; Type: DEFAULT; Schema: public; Owner: gnmadmin
--

ALTER TABLE ONLY public.api_notification ALTER COLUMN id SET DEFAULT nextval('public.api_notification_id_seq'::regclass);


--
-- Name: api_otp id; Type: DEFAULT; Schema: public; Owner: gnmadmin
--

ALTER TABLE ONLY public.api_otp ALTER COLUMN id SET DEFAULT nextval('public.api_otp_id_seq'::regclass);


--
-- Name: api_shipment id; Type: DEFAULT; Schema: public; Owner: gnmadmin
--

ALTER TABLE ONLY public.api_shipment ALTER COLUMN id SET DEFAULT nextval('public.api_shipment_id_seq'::regclass);


--
-- Name: api_sms id; Type: DEFAULT; Schema: public; Owner: gnmadmin
--

ALTER TABLE ONLY public.api_sms ALTER COLUMN id SET DEFAULT nextval('public.api_sms_id_seq'::regclass);


--
-- Name: api_supplier id; Type: DEFAULT; Schema: public; Owner: gnmadmin
--

ALTER TABLE ONLY public.api_supplier ALTER COLUMN id SET DEFAULT nextval('public.api_supplier_id_seq'::regclass);


--
-- Name: api_textsms id; Type: DEFAULT; Schema: public; Owner: gnmadmin
--

ALTER TABLE ONLY public.api_textsms ALTER COLUMN id SET DEFAULT nextval('public.api_textsms_id_seq'::regclass);


--
-- Name: api_warehouse id; Type: DEFAULT; Schema: public; Owner: gnmadmin
--

ALTER TABLE ONLY public.api_warehouse ALTER COLUMN id SET DEFAULT nextval('public.api_warehouse_id_seq'::regclass);


--
-- Name: api_whatsapp id; Type: DEFAULT; Schema: public; Owner: gnmadmin
--

ALTER TABLE ONLY public.api_whatsapp ALTER COLUMN id SET DEFAULT nextval('public.api_whatsapp_id_seq'::regclass);


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: gnmadmin
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: gnmadmin
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: gnmadmin
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: gnmadmin
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: gnmadmin
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: gnmadmin
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: users_user id; Type: DEFAULT; Schema: public; Owner: gnmadmin
--

ALTER TABLE ONLY public.users_user ALTER COLUMN id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Name: users_user_groups id; Type: DEFAULT; Schema: public; Owner: gnmadmin
--

ALTER TABLE ONLY public.users_user_groups ALTER COLUMN id SET DEFAULT nextval('public.users_user_groups_id_seq'::regclass);


--
-- Name: users_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: gnmadmin
--

ALTER TABLE ONLY public.users_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.users_user_user_permissions_id_seq'::regclass);


--
-- Data for Name: api_announcement; Type: TABLE DATA; Schema: public; Owner: gnmadmin
--

COPY public.api_announcement (id, status, url, ios_url, created_at, modified_at, created_by_id) FROM stdin;
\.
COPY public.api_announcement (id, status, url, ios_url, created_at, modified_at, created_by_id) FROM '$$PATH$$/3388.dat';

--
-- Data for Name: api_bill; Type: TABLE DATA; Schema: public; Owner: gnmadmin
--

COPY public.api_bill (id, uid, bill_no, shipping_line, status, created_date, modified_date, container_id, user_id) FROM stdin;
\.
COPY public.api_bill (id, uid, bill_no, shipping_line, status, created_date, modified_date, container_id, user_id) FROM '$$PATH$$/3379.dat';

--
-- Data for Name: api_category; Type: TABLE DATA; Schema: public; Owner: gnmadmin
--

COPY public.api_category (id, uid, name, price, user_id, status) FROM stdin;
\.
COPY public.api_category (id, uid, name, price, user_id, status) FROM '$$PATH$$/3355.dat';

--
-- Data for Name: api_consignment; Type: TABLE DATA; Schema: public; Owner: gnmadmin
--

COPY public.api_consignment (id, uid, name, tracking_number, shipping_charge, cbm, created_date, modified_date, delivery_status, customer_id, price_category_id, user_id, warehouse_id, good, pkgs, label) FROM stdin;
\.
COPY public.api_consignment (id, uid, name, tracking_number, shipping_charge, cbm, created_date, modified_date, delivery_status, customer_id, price_category_id, user_id, warehouse_id, good, pkgs, label) FROM '$$PATH$$/3356.dat';

--
-- Data for Name: api_container; Type: TABLE DATA; Schema: public; Owner: gnmadmin
--

COPY public.api_container (id, uid, shipping_status, container_no, shipping_line, destination, shipping_date, arrival_date, created_date, modified_date, user_id, origin, seal_no, volume) FROM stdin;
\.
COPY public.api_container (id, uid, shipping_status, container_no, shipping_line, destination, shipping_date, arrival_date, created_date, modified_date, user_id, origin, seal_no, volume) FROM '$$PATH$$/3357.dat';

--
-- Data for Name: api_customer; Type: TABLE DATA; Schema: public; Owner: gnmadmin
--

COPY public.api_customer (id, uid, firstname, lastname, cellphone, email, created_date, modified_date, user_id, address, company_name, id_number, id_type, status) FROM stdin;
\.
COPY public.api_customer (id, uid, firstname, lastname, cellphone, email, created_date, modified_date, user_id, address, company_name, id_number, id_type, status) FROM '$$PATH$$/3358.dat';

--
-- Data for Name: api_customerdevice; Type: TABLE DATA; Schema: public; Owner: gnmadmin
--

COPY public.api_customerdevice (id, device_token, device_type, device_name, created_at, customer_id) FROM stdin;
\.
COPY public.api_customerdevice (id, device_token, device_type, device_name, created_at, customer_id) FROM '$$PATH$$/3396.dat';

--
-- Data for Name: api_good; Type: TABLE DATA; Schema: public; Owner: gnmadmin
--

COPY public.api_good (id, uid, name, quantity, unit, supplier_receipt_no, created_date, modified_date, status, customer_id, supplier_id, user_id, warehouse_id, pckg) FROM stdin;
\.
COPY public.api_good (id, uid, name, quantity, unit, supplier_receipt_no, created_date, modified_date, status, customer_id, supplier_id, user_id, warehouse_id, pckg) FROM '$$PATH$$/3371.dat';

--
-- Data for Name: api_goodconsignment; Type: TABLE DATA; Schema: public; Owner: gnmadmin
--

COPY public.api_goodconsignment (id, uid, created_date, modified_date, status, consignment_id, good_id, user_id, container_id, customer_id, quantity, unit, pkgs) FROM stdin;
\.
COPY public.api_goodconsignment (id, uid, created_date, modified_date, status, consignment_id, good_id, user_id, container_id, customer_id, quantity, unit, pkgs) FROM '$$PATH$$/3375.dat';

--
-- Data for Name: api_historicalwarehouse; Type: TABLE DATA; Schema: public; Owner: gnmadmin
--

COPY public.api_historicalwarehouse (id, uid, name, location, address, created_date, modified_date, status, history_id, history_date, history_change_reason, history_type, history_user_id, user_id) FROM stdin;
\.
COPY public.api_historicalwarehouse (id, uid, name, location, address, created_date, modified_date, status, history_id, history_date, history_change_reason, history_type, history_user_id, user_id) FROM '$$PATH$$/3383.dat';

--
-- Data for Name: api_job; Type: TABLE DATA; Schema: public; Owner: gnmadmin
--

COPY public.api_job (id, status, type, object_id, extra, message, created_at, modified_at, created_by_id) FROM stdin;
\.
COPY public.api_job (id, status, type, object_id, extra, message, created_at, modified_at, created_by_id) FROM '$$PATH$$/3390.dat';

--
-- Data for Name: api_jobfailurelog; Type: TABLE DATA; Schema: public; Owner: gnmadmin
--

COPY public.api_jobfailurelog (id, object_id, message, created_at, job_id) FROM stdin;
\.
COPY public.api_jobfailurelog (id, object_id, message, created_at, job_id) FROM '$$PATH$$/3394.dat';

--
-- Data for Name: api_notification; Type: TABLE DATA; Schema: public; Owner: gnmadmin
--

COPY public.api_notification (id, title, body, status, scope, seen_status, delivered_to, seen_by, created_at, modified_at, created_by_id, customer_id, level) FROM stdin;
\.
COPY public.api_notification (id, title, body, status, scope, seen_status, delivered_to, seen_by, created_at, modified_at, created_by_id, customer_id, level) FROM '$$PATH$$/3386.dat';

--
-- Data for Name: api_otp; Type: TABLE DATA; Schema: public; Owner: gnmadmin
--

COPY public.api_otp (id, password, created_date, modified_date, customer_id) FROM stdin;
\.
COPY public.api_otp (id, password, created_date, modified_date, customer_id) FROM '$$PATH$$/3381.dat';

--
-- Data for Name: api_shipment; Type: TABLE DATA; Schema: public; Owner: gnmadmin
--

COPY public.api_shipment (id, uid, created_date, modified_date, consignment_id, container_id, user_id, status) FROM stdin;
\.
COPY public.api_shipment (id, uid, created_date, modified_date, consignment_id, container_id, user_id, status) FROM '$$PATH$$/3359.dat';

--
-- Data for Name: api_sms; Type: TABLE DATA; Schema: public; Owner: gnmadmin
--

COPY public.api_sms (id, sender_id, response, created_date, modified_date, status, type, customer_id_id) FROM stdin;
\.
COPY public.api_sms (id, sender_id, response, created_date, modified_date, status, type, customer_id_id) FROM '$$PATH$$/3377.dat';

--
-- Data for Name: api_supplier; Type: TABLE DATA; Schema: public; Owner: gnmadmin
--

COPY public.api_supplier (id, uid, name, cellphone, address, created_date, modified_date, status, user_id) FROM stdin;
\.
COPY public.api_supplier (id, uid, name, cellphone, address, created_date, modified_date, status, user_id) FROM '$$PATH$$/3373.dat';

--
-- Data for Name: api_textsms; Type: TABLE DATA; Schema: public; Owner: gnmadmin
--

COPY public.api_textsms (id, cellphone, message, status, type, response, counts, created_at, modified_at, created_by_id) FROM stdin;
\.
COPY public.api_textsms (id, cellphone, message, status, type, response, counts, created_at, modified_at, created_by_id) FROM '$$PATH$$/3392.dat';

--
-- Data for Name: api_warehouse; Type: TABLE DATA; Schema: public; Owner: gnmadmin
--

COPY public.api_warehouse (id, uid, name, location, created_date, modified_date, user_id, address, status) FROM stdin;
\.
COPY public.api_warehouse (id, uid, name, location, created_date, modified_date, user_id, address, status) FROM '$$PATH$$/3360.dat';

--
-- Data for Name: api_whatsapp; Type: TABLE DATA; Schema: public; Owner: gnmadmin
--

COPY public.api_whatsapp (id, customer_name, sender_id, request, response, created_date, modified_date, status, type, customer_id_id) FROM stdin;
\.
COPY public.api_whatsapp (id, customer_name, sender_id, request, response, created_date, modified_date, status, type, customer_id_id) FROM '$$PATH$$/3369.dat';

--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: gnmadmin
--

COPY public.auth_group (id, name) FROM stdin;
\.
COPY public.auth_group (id, name) FROM '$$PATH$$/3344.dat';

--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: gnmadmin
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.
COPY public.auth_group_permissions (id, group_id, permission_id) FROM '$$PATH$$/3346.dat';

--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: gnmadmin
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
\.
COPY public.auth_permission (id, name, content_type_id, codename) FROM '$$PATH$$/3342.dat';

--
-- Data for Name: authtoken_token; Type: TABLE DATA; Schema: public; Owner: gnmadmin
--

COPY public.authtoken_token (key, created, user_id) FROM stdin;
\.
COPY public.authtoken_token (key, created, user_id) FROM '$$PATH$$/3384.dat';

--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: gnmadmin
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.
COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM '$$PATH$$/3354.dat';

--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: gnmadmin
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
\.
COPY public.django_content_type (id, app_label, model) FROM '$$PATH$$/3340.dat';

--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: gnmadmin
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
\.
COPY public.django_migrations (id, app, name, applied) FROM '$$PATH$$/3338.dat';

--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: gnmadmin
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
\.
COPY public.django_session (session_key, session_data, expire_date) FROM '$$PATH$$/3361.dat';

--
-- Data for Name: users_user; Type: TABLE DATA; Schema: public; Owner: gnmadmin
--

COPY public.users_user (id, password, last_login, is_superuser, uid, email, first_name, last_name, cellphone, role, date_joined, is_active, is_staff, is_admin, is_deleted, created_date, modified_date, created_by, modified_by) FROM stdin;
\.
COPY public.users_user (id, password, last_login, is_superuser, uid, email, first_name, last_name, cellphone, role, date_joined, is_active, is_staff, is_admin, is_deleted, created_date, modified_date, created_by, modified_by) FROM '$$PATH$$/3348.dat';

--
-- Data for Name: users_user_groups; Type: TABLE DATA; Schema: public; Owner: gnmadmin
--

COPY public.users_user_groups (id, user_id, group_id) FROM stdin;
\.
COPY public.users_user_groups (id, user_id, group_id) FROM '$$PATH$$/3350.dat';

--
-- Data for Name: users_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: gnmadmin
--

COPY public.users_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.
COPY public.users_user_user_permissions (id, user_id, permission_id) FROM '$$PATH$$/3352.dat';

--
-- Name: api_announcement_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gnmadmin
--

SELECT pg_catalog.setval('public.api_announcement_id_seq', 8, true);


--
-- Name: api_bill_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gnmadmin
--

SELECT pg_catalog.setval('public.api_bill_id_seq', 1, false);


--
-- Name: api_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gnmadmin
--

SELECT pg_catalog.setval('public.api_category_id_seq', 44, true);


--
-- Name: api_consignment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gnmadmin
--

SELECT pg_catalog.setval('public.api_consignment_id_seq', 52643, true);


--
-- Name: api_container_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gnmadmin
--

SELECT pg_catalog.setval('public.api_container_id_seq', 1210, true);


--
-- Name: api_customer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gnmadmin
--

SELECT pg_catalog.setval('public.api_customer_id_seq', 3858, true);


--
-- Name: api_customerdevice_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gnmadmin
--

SELECT pg_catalog.setval('public.api_customerdevice_id_seq', 495, true);


--
-- Name: api_good_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gnmadmin
--

SELECT pg_catalog.setval('public.api_good_id_seq', 44253, true);


--
-- Name: api_goodconsignment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gnmadmin
--

SELECT pg_catalog.setval('public.api_goodconsignment_id_seq', 56347, true);


--
-- Name: api_historicalwarehouse_history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gnmadmin
--

SELECT pg_catalog.setval('public.api_historicalwarehouse_history_id_seq', 2, true);


--
-- Name: api_job_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gnmadmin
--

SELECT pg_catalog.setval('public.api_job_id_seq', 320, true);


--
-- Name: api_jobfailurelog_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gnmadmin
--

SELECT pg_catalog.setval('public.api_jobfailurelog_id_seq', 893, true);


--
-- Name: api_notification_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gnmadmin
--

SELECT pg_catalog.setval('public.api_notification_id_seq', 16964, true);


--
-- Name: api_otp_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gnmadmin
--

SELECT pg_catalog.setval('public.api_otp_id_seq', 2663, true);


--
-- Name: api_shipment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gnmadmin
--

SELECT pg_catalog.setval('public.api_shipment_id_seq', 49745, true);


--
-- Name: api_sms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gnmadmin
--

SELECT pg_catalog.setval('public.api_sms_id_seq', 10, true);


--
-- Name: api_supplier_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gnmadmin
--

SELECT pg_catalog.setval('public.api_supplier_id_seq', 6261, true);


--
-- Name: api_textsms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gnmadmin
--

SELECT pg_catalog.setval('public.api_textsms_id_seq', 20338, true);


--
-- Name: api_warehouse_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gnmadmin
--

SELECT pg_catalog.setval('public.api_warehouse_id_seq', 28, true);


--
-- Name: api_whatsapp_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gnmadmin
--

SELECT pg_catalog.setval('public.api_whatsapp_id_seq', 62015, true);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gnmadmin
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gnmadmin
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gnmadmin
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 112, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gnmadmin
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gnmadmin
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 28, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gnmadmin
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 102, true);


--
-- Name: users_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gnmadmin
--

SELECT pg_catalog.setval('public.users_user_groups_id_seq', 1, false);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gnmadmin
--

SELECT pg_catalog.setval('public.users_user_id_seq', 866, true);


--
-- Name: users_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gnmadmin
--

SELECT pg_catalog.setval('public.users_user_user_permissions_id_seq', 1, false);


--
-- Name: api_announcement api_announcement_pkey; Type: CONSTRAINT; Schema: public; Owner: gnmadmin
--

ALTER TABLE ONLY public.api_announcement
    ADD CONSTRAINT api_announcement_pkey PRIMARY KEY (id);


--
-- Name: api_bill api_bill_pkey; Type: CONSTRAINT; Schema: public; Owner: gnmadmin
--

ALTER TABLE ONLY public.api_bill
    ADD CONSTRAINT api_bill_pkey PRIMARY KEY (id);


--
-- Name: api_category api_category_pkey; Type: CONSTRAINT; Schema: public; Owner: gnmadmin
--

ALTER TABLE ONLY public.api_category
    ADD CONSTRAINT api_category_pkey PRIMARY KEY (id);


--
-- Name: api_consignment api_consignment_pkey; Type: CONSTRAINT; Schema: public; Owner: gnmadmin
--

ALTER TABLE ONLY public.api_consignment
    ADD CONSTRAINT api_consignment_pkey PRIMARY KEY (id);


--
-- Name: api_consignment api_consignment_tracking_number_key; Type: CONSTRAINT; Schema: public; Owner: gnmadmin
--

ALTER TABLE ONLY public.api_consignment
    ADD CONSTRAINT api_consignment_tracking_number_key UNIQUE (tracking_number);


--
-- Name: api_container api_container_container_no_69d61dcb_uniq; Type: CONSTRAINT; Schema: public; Owner: gnmadmin
--

ALTER TABLE ONLY public.api_container
    ADD CONSTRAINT api_container_container_no_69d61dcb_uniq UNIQUE (container_no);


--
-- Name: api_container api_container_pkey; Type: CONSTRAINT; Schema: public; Owner: gnmadmin
--

ALTER TABLE ONLY public.api_container
    ADD CONSTRAINT api_container_pkey PRIMARY KEY (id);


--
-- Name: api_customer api_customer_cellphone_7bc95972_uniq; Type: CONSTRAINT; Schema: public; Owner: gnmadmin
--

ALTER TABLE ONLY public.api_customer
    ADD CONSTRAINT api_customer_cellphone_7bc95972_uniq UNIQUE (cellphone);


--
-- Name: api_customer api_customer_pkey; Type: CONSTRAINT; Schema: public; Owner: gnmadmin
--

ALTER TABLE ONLY public.api_customer
    ADD CONSTRAINT api_customer_pkey PRIMARY KEY (id);


--
-- Name: api_customerdevice api_customerdevice_pkey; Type: CONSTRAINT; Schema: public; Owner: gnmadmin
--

ALTER TABLE ONLY public.api_customerdevice
    ADD CONSTRAINT api_customerdevice_pkey PRIMARY KEY (id);


--
-- Name: api_good api_good_pkey; Type: CONSTRAINT; Schema: public; Owner: gnmadmin
--

ALTER TABLE ONLY public.api_good
    ADD CONSTRAINT api_good_pkey PRIMARY KEY (id);


--
-- Name: api_goodconsignment api_goodconsignment_pkey; Type: CONSTRAINT; Schema: public; Owner: gnmadmin
--

ALTER TABLE ONLY public.api_goodconsignment
    ADD CONSTRAINT api_goodconsignment_pkey PRIMARY KEY (id);


--
-- Name: api_historicalwarehouse api_historicalwarehouse_pkey; Type: CONSTRAINT; Schema: public; Owner: gnmadmin
--

ALTER TABLE ONLY public.api_historicalwarehouse
    ADD CONSTRAINT api_historicalwarehouse_pkey PRIMARY KEY (history_id);


--
-- Name: api_job api_job_pkey; Type: CONSTRAINT; Schema: public; Owner: gnmadmin
--

ALTER TABLE ONLY public.api_job
    ADD CONSTRAINT api_job_pkey PRIMARY KEY (id);


--
-- Name: api_jobfailurelog api_jobfailurelog_pkey; Type: CONSTRAINT; Schema: public; Owner: gnmadmin
--

ALTER TABLE ONLY public.api_jobfailurelog
    ADD CONSTRAINT api_jobfailurelog_pkey PRIMARY KEY (id);


--
-- Name: api_notification api_notification_pkey; Type: CONSTRAINT; Schema: public; Owner: gnmadmin
--

ALTER TABLE ONLY public.api_notification
    ADD CONSTRAINT api_notification_pkey PRIMARY KEY (id);


--
-- Name: api_otp api_otp_pkey; Type: CONSTRAINT; Schema: public; Owner: gnmadmin
--

ALTER TABLE ONLY public.api_otp
    ADD CONSTRAINT api_otp_pkey PRIMARY KEY (id);


--
-- Name: api_shipment api_shipment_pkey; Type: CONSTRAINT; Schema: public; Owner: gnmadmin
--

ALTER TABLE ONLY public.api_shipment
    ADD CONSTRAINT api_shipment_pkey PRIMARY KEY (id);


--
-- Name: api_sms api_sms_pkey; Type: CONSTRAINT; Schema: public; Owner: gnmadmin
--

ALTER TABLE ONLY public.api_sms
    ADD CONSTRAINT api_sms_pkey PRIMARY KEY (id);


--
-- Name: api_supplier api_supplier_cellphone_key; Type: CONSTRAINT; Schema: public; Owner: gnmadmin
--

ALTER TABLE ONLY public.api_supplier
    ADD CONSTRAINT api_supplier_cellphone_key UNIQUE (cellphone);


--
-- Name: api_supplier api_supplier_pkey; Type: CONSTRAINT; Schema: public; Owner: gnmadmin
--

ALTER TABLE ONLY public.api_supplier
    ADD CONSTRAINT api_supplier_pkey PRIMARY KEY (id);


--
-- Name: api_textsms api_textsms_pkey; Type: CONSTRAINT; Schema: public; Owner: gnmadmin
--

ALTER TABLE ONLY public.api_textsms
    ADD CONSTRAINT api_textsms_pkey PRIMARY KEY (id);


--
-- Name: api_warehouse api_warehouse_pkey; Type: CONSTRAINT; Schema: public; Owner: gnmadmin
--

ALTER TABLE ONLY public.api_warehouse
    ADD CONSTRAINT api_warehouse_pkey PRIMARY KEY (id);


--
-- Name: api_whatsapp api_whatsapp_pkey; Type: CONSTRAINT; Schema: public; Owner: gnmadmin
--

ALTER TABLE ONLY public.api_whatsapp
    ADD CONSTRAINT api_whatsapp_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: gnmadmin
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: gnmadmin
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: gnmadmin
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: gnmadmin
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: gnmadmin
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: gnmadmin
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: authtoken_token authtoken_token_pkey; Type: CONSTRAINT; Schema: public; Owner: gnmadmin
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_pkey PRIMARY KEY (key);


--
-- Name: authtoken_token authtoken_token_user_id_key; Type: CONSTRAINT; Schema: public; Owner: gnmadmin
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_key UNIQUE (user_id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: gnmadmin
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: gnmadmin
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: gnmadmin
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: gnmadmin
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: gnmadmin
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: users_user users_user_email_key; Type: CONSTRAINT; Schema: public; Owner: gnmadmin
--

ALTER TABLE ONLY public.users_user
    ADD CONSTRAINT users_user_email_key UNIQUE (email);


--
-- Name: users_user_groups users_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: gnmadmin
--

ALTER TABLE ONLY public.users_user_groups
    ADD CONSTRAINT users_user_groups_pkey PRIMARY KEY (id);


--
-- Name: users_user_groups users_user_groups_user_id_group_id_b88eab82_uniq; Type: CONSTRAINT; Schema: public; Owner: gnmadmin
--

ALTER TABLE ONLY public.users_user_groups
    ADD CONSTRAINT users_user_groups_user_id_group_id_b88eab82_uniq UNIQUE (user_id, group_id);


--
-- Name: users_user users_user_pkey; Type: CONSTRAINT; Schema: public; Owner: gnmadmin
--

ALTER TABLE ONLY public.users_user
    ADD CONSTRAINT users_user_pkey PRIMARY KEY (id);


--
-- Name: users_user users_user_uid_key; Type: CONSTRAINT; Schema: public; Owner: gnmadmin
--

ALTER TABLE ONLY public.users_user
    ADD CONSTRAINT users_user_uid_key UNIQUE (uid);


--
-- Name: users_user_user_permissions users_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: gnmadmin
--

ALTER TABLE ONLY public.users_user_user_permissions
    ADD CONSTRAINT users_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: users_user_user_permissions users_user_user_permissions_user_id_permission_id_43338c45_uniq; Type: CONSTRAINT; Schema: public; Owner: gnmadmin
--

ALTER TABLE ONLY public.users_user_user_permissions
    ADD CONSTRAINT users_user_user_permissions_user_id_permission_id_43338c45_uniq UNIQUE (user_id, permission_id);


--
-- Name: api_announcement_created_by_id_7292a9c3; Type: INDEX; Schema: public; Owner: gnmadmin
--

CREATE INDEX api_announcement_created_by_id_7292a9c3 ON public.api_announcement USING btree (created_by_id);


--
-- Name: api_bill_container_id_024ef82d; Type: INDEX; Schema: public; Owner: gnmadmin
--

CREATE INDEX api_bill_container_id_024ef82d ON public.api_bill USING btree (container_id);


--
-- Name: api_bill_user_id_178b3a10; Type: INDEX; Schema: public; Owner: gnmadmin
--

CREATE INDEX api_bill_user_id_178b3a10 ON public.api_bill USING btree (user_id);


--
-- Name: api_category_user_id_4a62861e; Type: INDEX; Schema: public; Owner: gnmadmin
--

CREATE INDEX api_category_user_id_4a62861e ON public.api_category USING btree (user_id);


--
-- Name: api_consignment_customer_id_0a420343; Type: INDEX; Schema: public; Owner: gnmadmin
--

CREATE INDEX api_consignment_customer_id_0a420343 ON public.api_consignment USING btree (customer_id);


--
-- Name: api_consignment_price_category_id_8043d09d; Type: INDEX; Schema: public; Owner: gnmadmin
--

CREATE INDEX api_consignment_price_category_id_8043d09d ON public.api_consignment USING btree (price_category_id);


--
-- Name: api_consignment_tracking_number_b63872f6_like; Type: INDEX; Schema: public; Owner: gnmadmin
--

CREATE INDEX api_consignment_tracking_number_b63872f6_like ON public.api_consignment USING btree (tracking_number varchar_pattern_ops);


--
-- Name: api_consignment_user_id_930771b6; Type: INDEX; Schema: public; Owner: gnmadmin
--

CREATE INDEX api_consignment_user_id_930771b6 ON public.api_consignment USING btree (user_id);


--
-- Name: api_consignment_warehouse_id_19a5e795; Type: INDEX; Schema: public; Owner: gnmadmin
--

CREATE INDEX api_consignment_warehouse_id_19a5e795 ON public.api_consignment USING btree (warehouse_id);


--
-- Name: api_container_container_no_69d61dcb_like; Type: INDEX; Schema: public; Owner: gnmadmin
--

CREATE INDEX api_container_container_no_69d61dcb_like ON public.api_container USING btree (container_no varchar_pattern_ops);


--
-- Name: api_container_user_id_9932961d; Type: INDEX; Schema: public; Owner: gnmadmin
--

CREATE INDEX api_container_user_id_9932961d ON public.api_container USING btree (user_id);


--
-- Name: api_customer_cellphone_7bc95972_like; Type: INDEX; Schema: public; Owner: gnmadmin
--

CREATE INDEX api_customer_cellphone_7bc95972_like ON public.api_customer USING btree (cellphone varchar_pattern_ops);


--
-- Name: api_customer_user_id_905bea02; Type: INDEX; Schema: public; Owner: gnmadmin
--

CREATE INDEX api_customer_user_id_905bea02 ON public.api_customer USING btree (user_id);


--
-- Name: api_customerdevice_customer_id_507f7360; Type: INDEX; Schema: public; Owner: gnmadmin
--

CREATE INDEX api_customerdevice_customer_id_507f7360 ON public.api_customerdevice USING btree (customer_id);


--
-- Name: api_good_customer_id_24e81413; Type: INDEX; Schema: public; Owner: gnmadmin
--

CREATE INDEX api_good_customer_id_24e81413 ON public.api_good USING btree (customer_id);


--
-- Name: api_good_supplier_id_c4280766; Type: INDEX; Schema: public; Owner: gnmadmin
--

CREATE INDEX api_good_supplier_id_c4280766 ON public.api_good USING btree (supplier_id);


--
-- Name: api_good_user_id_72f1ad44; Type: INDEX; Schema: public; Owner: gnmadmin
--

CREATE INDEX api_good_user_id_72f1ad44 ON public.api_good USING btree (user_id);


--
-- Name: api_good_warehouse_id_dda418d9; Type: INDEX; Schema: public; Owner: gnmadmin
--

CREATE INDEX api_good_warehouse_id_dda418d9 ON public.api_good USING btree (warehouse_id);


--
-- Name: api_goodconsignment_consignment_id_4bf00bc2; Type: INDEX; Schema: public; Owner: gnmadmin
--

CREATE INDEX api_goodconsignment_consignment_id_4bf00bc2 ON public.api_goodconsignment USING btree (consignment_id);


--
-- Name: api_goodconsignment_container_id_ed4df66b; Type: INDEX; Schema: public; Owner: gnmadmin
--

CREATE INDEX api_goodconsignment_container_id_ed4df66b ON public.api_goodconsignment USING btree (container_id);


--
-- Name: api_goodconsignment_customer_id_bfac9f32; Type: INDEX; Schema: public; Owner: gnmadmin
--

CREATE INDEX api_goodconsignment_customer_id_bfac9f32 ON public.api_goodconsignment USING btree (customer_id);


--
-- Name: api_goodconsignment_good_id_b2a2557a; Type: INDEX; Schema: public; Owner: gnmadmin
--

CREATE INDEX api_goodconsignment_good_id_b2a2557a ON public.api_goodconsignment USING btree (good_id);


--
-- Name: api_goodconsignment_user_id_7febe62e; Type: INDEX; Schema: public; Owner: gnmadmin
--

CREATE INDEX api_goodconsignment_user_id_7febe62e ON public.api_goodconsignment USING btree (user_id);


--
-- Name: api_historicalwarehouse_history_date_d06e660b; Type: INDEX; Schema: public; Owner: gnmadmin
--

CREATE INDEX api_historicalwarehouse_history_date_d06e660b ON public.api_historicalwarehouse USING btree (history_date);


--
-- Name: api_historicalwarehouse_history_user_id_e145eb03; Type: INDEX; Schema: public; Owner: gnmadmin
--

CREATE INDEX api_historicalwarehouse_history_user_id_e145eb03 ON public.api_historicalwarehouse USING btree (history_user_id);


--
-- Name: api_historicalwarehouse_id_0f56ed78; Type: INDEX; Schema: public; Owner: gnmadmin
--

CREATE INDEX api_historicalwarehouse_id_0f56ed78 ON public.api_historicalwarehouse USING btree (id);


--
-- Name: api_historicalwarehouse_user_id_6c1f947a; Type: INDEX; Schema: public; Owner: gnmadmin
--

CREATE INDEX api_historicalwarehouse_user_id_6c1f947a ON public.api_historicalwarehouse USING btree (user_id);


--
-- Name: api_job_created_by_id_5b367c19; Type: INDEX; Schema: public; Owner: gnmadmin
--

CREATE INDEX api_job_created_by_id_5b367c19 ON public.api_job USING btree (created_by_id);


--
-- Name: api_jobfailurelog_job_id_9ae3aec8; Type: INDEX; Schema: public; Owner: gnmadmin
--

CREATE INDEX api_jobfailurelog_job_id_9ae3aec8 ON public.api_jobfailurelog USING btree (job_id);


--
-- Name: api_notification_created_by_id_d53d897b; Type: INDEX; Schema: public; Owner: gnmadmin
--

CREATE INDEX api_notification_created_by_id_d53d897b ON public.api_notification USING btree (created_by_id);


--
-- Name: api_notification_customer_id_7b6d1883; Type: INDEX; Schema: public; Owner: gnmadmin
--

CREATE INDEX api_notification_customer_id_7b6d1883 ON public.api_notification USING btree (customer_id);


--
-- Name: api_otp_customer_id_5cc30799; Type: INDEX; Schema: public; Owner: gnmadmin
--

CREATE INDEX api_otp_customer_id_5cc30799 ON public.api_otp USING btree (customer_id);


--
-- Name: api_shipment_consignment_id_4d5dc857; Type: INDEX; Schema: public; Owner: gnmadmin
--

CREATE INDEX api_shipment_consignment_id_4d5dc857 ON public.api_shipment USING btree (consignment_id);


--
-- Name: api_shipment_container_id_74cac54e; Type: INDEX; Schema: public; Owner: gnmadmin
--

CREATE INDEX api_shipment_container_id_74cac54e ON public.api_shipment USING btree (container_id);


--
-- Name: api_shipment_user_id_75f60247; Type: INDEX; Schema: public; Owner: gnmadmin
--

CREATE INDEX api_shipment_user_id_75f60247 ON public.api_shipment USING btree (user_id);


--
-- Name: api_sms_customer_id_id_6f9a8f0c; Type: INDEX; Schema: public; Owner: gnmadmin
--

CREATE INDEX api_sms_customer_id_id_6f9a8f0c ON public.api_sms USING btree (customer_id_id);


--
-- Name: api_supplier_cellphone_b055439c_like; Type: INDEX; Schema: public; Owner: gnmadmin
--

CREATE INDEX api_supplier_cellphone_b055439c_like ON public.api_supplier USING btree (cellphone varchar_pattern_ops);


--
-- Name: api_supplier_user_id_d696b80f; Type: INDEX; Schema: public; Owner: gnmadmin
--

CREATE INDEX api_supplier_user_id_d696b80f ON public.api_supplier USING btree (user_id);


--
-- Name: api_textsms_created_by_id_041617fd; Type: INDEX; Schema: public; Owner: gnmadmin
--

CREATE INDEX api_textsms_created_by_id_041617fd ON public.api_textsms USING btree (created_by_id);


--
-- Name: api_warehouse_user_id_dcdeceac; Type: INDEX; Schema: public; Owner: gnmadmin
--

CREATE INDEX api_warehouse_user_id_dcdeceac ON public.api_warehouse USING btree (user_id);


--
-- Name: api_whatsapp_customer_id_id_13206a82; Type: INDEX; Schema: public; Owner: gnmadmin
--

CREATE INDEX api_whatsapp_customer_id_id_13206a82 ON public.api_whatsapp USING btree (customer_id_id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: gnmadmin
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: gnmadmin
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: gnmadmin
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: gnmadmin
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: authtoken_token_key_10f0b77e_like; Type: INDEX; Schema: public; Owner: gnmadmin
--

CREATE INDEX authtoken_token_key_10f0b77e_like ON public.authtoken_token USING btree (key varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: gnmadmin
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: gnmadmin
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: gnmadmin
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: gnmadmin
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: users_user_email_243f6e77_like; Type: INDEX; Schema: public; Owner: gnmadmin
--

CREATE INDEX users_user_email_243f6e77_like ON public.users_user USING btree (email varchar_pattern_ops);


--
-- Name: users_user_groups_group_id_9afc8d0e; Type: INDEX; Schema: public; Owner: gnmadmin
--

CREATE INDEX users_user_groups_group_id_9afc8d0e ON public.users_user_groups USING btree (group_id);


--
-- Name: users_user_groups_user_id_5f6f5a90; Type: INDEX; Schema: public; Owner: gnmadmin
--

CREATE INDEX users_user_groups_user_id_5f6f5a90 ON public.users_user_groups USING btree (user_id);


--
-- Name: users_user_user_permissions_permission_id_0b93982e; Type: INDEX; Schema: public; Owner: gnmadmin
--

CREATE INDEX users_user_user_permissions_permission_id_0b93982e ON public.users_user_user_permissions USING btree (permission_id);


--
-- Name: users_user_user_permissions_user_id_20aca447; Type: INDEX; Schema: public; Owner: gnmadmin
--

CREATE INDEX users_user_user_permissions_user_id_20aca447 ON public.users_user_user_permissions USING btree (user_id);


--
-- Name: api_announcement api_announcement_created_by_id_7292a9c3_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: gnmadmin
--

ALTER TABLE ONLY public.api_announcement
    ADD CONSTRAINT api_announcement_created_by_id_7292a9c3_fk_users_user_id FOREIGN KEY (created_by_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_bill api_bill_container_id_024ef82d_fk_api_container_id; Type: FK CONSTRAINT; Schema: public; Owner: gnmadmin
--

ALTER TABLE ONLY public.api_bill
    ADD CONSTRAINT api_bill_container_id_024ef82d_fk_api_container_id FOREIGN KEY (container_id) REFERENCES public.api_container(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_bill api_bill_user_id_178b3a10_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: gnmadmin
--

ALTER TABLE ONLY public.api_bill
    ADD CONSTRAINT api_bill_user_id_178b3a10_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_category api_category_user_id_4a62861e_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: gnmadmin
--

ALTER TABLE ONLY public.api_category
    ADD CONSTRAINT api_category_user_id_4a62861e_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_consignment api_consignment_customer_id_0a420343_fk; Type: FK CONSTRAINT; Schema: public; Owner: gnmadmin
--

ALTER TABLE ONLY public.api_consignment
    ADD CONSTRAINT api_consignment_customer_id_0a420343_fk FOREIGN KEY (customer_id) REFERENCES public.api_customer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_consignment api_consignment_price_category_id_8043d09d_fk; Type: FK CONSTRAINT; Schema: public; Owner: gnmadmin
--

ALTER TABLE ONLY public.api_consignment
    ADD CONSTRAINT api_consignment_price_category_id_8043d09d_fk FOREIGN KEY (price_category_id) REFERENCES public.api_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_consignment api_consignment_user_id_930771b6_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: gnmadmin
--

ALTER TABLE ONLY public.api_consignment
    ADD CONSTRAINT api_consignment_user_id_930771b6_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_consignment api_consignment_warehouse_id_19a5e795_fk; Type: FK CONSTRAINT; Schema: public; Owner: gnmadmin
--

ALTER TABLE ONLY public.api_consignment
    ADD CONSTRAINT api_consignment_warehouse_id_19a5e795_fk FOREIGN KEY (warehouse_id) REFERENCES public.api_warehouse(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_container api_container_user_id_9932961d_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: gnmadmin
--

ALTER TABLE ONLY public.api_container
    ADD CONSTRAINT api_container_user_id_9932961d_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_customer api_customer_user_id_905bea02_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: gnmadmin
--

ALTER TABLE ONLY public.api_customer
    ADD CONSTRAINT api_customer_user_id_905bea02_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_customerdevice api_customerdevice_customer_id_507f7360_fk_api_customer_id; Type: FK CONSTRAINT; Schema: public; Owner: gnmadmin
--

ALTER TABLE ONLY public.api_customerdevice
    ADD CONSTRAINT api_customerdevice_customer_id_507f7360_fk_api_customer_id FOREIGN KEY (customer_id) REFERENCES public.api_customer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_good api_good_customer_id_24e81413_fk_api_customer_id; Type: FK CONSTRAINT; Schema: public; Owner: gnmadmin
--

ALTER TABLE ONLY public.api_good
    ADD CONSTRAINT api_good_customer_id_24e81413_fk_api_customer_id FOREIGN KEY (customer_id) REFERENCES public.api_customer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_good api_good_supplier_id_c4280766_fk_api_supplier_id; Type: FK CONSTRAINT; Schema: public; Owner: gnmadmin
--

ALTER TABLE ONLY public.api_good
    ADD CONSTRAINT api_good_supplier_id_c4280766_fk_api_supplier_id FOREIGN KEY (supplier_id) REFERENCES public.api_supplier(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_good api_good_user_id_72f1ad44_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: gnmadmin
--

ALTER TABLE ONLY public.api_good
    ADD CONSTRAINT api_good_user_id_72f1ad44_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_good api_good_warehouse_id_dda418d9_fk_api_warehouse_id; Type: FK CONSTRAINT; Schema: public; Owner: gnmadmin
--

ALTER TABLE ONLY public.api_good
    ADD CONSTRAINT api_good_warehouse_id_dda418d9_fk_api_warehouse_id FOREIGN KEY (warehouse_id) REFERENCES public.api_warehouse(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_goodconsignment api_goodconsignment_consignment_id_4bf00bc2_fk_api_consi; Type: FK CONSTRAINT; Schema: public; Owner: gnmadmin
--

ALTER TABLE ONLY public.api_goodconsignment
    ADD CONSTRAINT api_goodconsignment_consignment_id_4bf00bc2_fk_api_consi FOREIGN KEY (consignment_id) REFERENCES public.api_consignment(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_goodconsignment api_goodconsignment_container_id_ed4df66b_fk_api_container_id; Type: FK CONSTRAINT; Schema: public; Owner: gnmadmin
--

ALTER TABLE ONLY public.api_goodconsignment
    ADD CONSTRAINT api_goodconsignment_container_id_ed4df66b_fk_api_container_id FOREIGN KEY (container_id) REFERENCES public.api_container(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_goodconsignment api_goodconsignment_customer_id_bfac9f32_fk_api_customer_id; Type: FK CONSTRAINT; Schema: public; Owner: gnmadmin
--

ALTER TABLE ONLY public.api_goodconsignment
    ADD CONSTRAINT api_goodconsignment_customer_id_bfac9f32_fk_api_customer_id FOREIGN KEY (customer_id) REFERENCES public.api_customer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_goodconsignment api_goodconsignment_good_id_b2a2557a_fk_api_good_id; Type: FK CONSTRAINT; Schema: public; Owner: gnmadmin
--

ALTER TABLE ONLY public.api_goodconsignment
    ADD CONSTRAINT api_goodconsignment_good_id_b2a2557a_fk_api_good_id FOREIGN KEY (good_id) REFERENCES public.api_good(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_goodconsignment api_goodconsignment_user_id_7febe62e_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: gnmadmin
--

ALTER TABLE ONLY public.api_goodconsignment
    ADD CONSTRAINT api_goodconsignment_user_id_7febe62e_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_historicalwarehouse api_historicalwareho_history_user_id_e145eb03_fk_users_use; Type: FK CONSTRAINT; Schema: public; Owner: gnmadmin
--

ALTER TABLE ONLY public.api_historicalwarehouse
    ADD CONSTRAINT api_historicalwareho_history_user_id_e145eb03_fk_users_use FOREIGN KEY (history_user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_job api_job_created_by_id_5b367c19_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: gnmadmin
--

ALTER TABLE ONLY public.api_job
    ADD CONSTRAINT api_job_created_by_id_5b367c19_fk_users_user_id FOREIGN KEY (created_by_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_jobfailurelog api_jobfailurelog_job_id_9ae3aec8_fk_api_job_id; Type: FK CONSTRAINT; Schema: public; Owner: gnmadmin
--

ALTER TABLE ONLY public.api_jobfailurelog
    ADD CONSTRAINT api_jobfailurelog_job_id_9ae3aec8_fk_api_job_id FOREIGN KEY (job_id) REFERENCES public.api_job(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_notification api_notification_created_by_id_d53d897b_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: gnmadmin
--

ALTER TABLE ONLY public.api_notification
    ADD CONSTRAINT api_notification_created_by_id_d53d897b_fk_users_user_id FOREIGN KEY (created_by_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_notification api_notification_customer_id_7b6d1883_fk_api_customer_id; Type: FK CONSTRAINT; Schema: public; Owner: gnmadmin
--

ALTER TABLE ONLY public.api_notification
    ADD CONSTRAINT api_notification_customer_id_7b6d1883_fk_api_customer_id FOREIGN KEY (customer_id) REFERENCES public.api_customer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_otp api_otp_customer_id_5cc30799_fk_api_customer_id; Type: FK CONSTRAINT; Schema: public; Owner: gnmadmin
--

ALTER TABLE ONLY public.api_otp
    ADD CONSTRAINT api_otp_customer_id_5cc30799_fk_api_customer_id FOREIGN KEY (customer_id) REFERENCES public.api_customer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_shipment api_shipment_consignment_id_4d5dc857_fk; Type: FK CONSTRAINT; Schema: public; Owner: gnmadmin
--

ALTER TABLE ONLY public.api_shipment
    ADD CONSTRAINT api_shipment_consignment_id_4d5dc857_fk FOREIGN KEY (consignment_id) REFERENCES public.api_consignment(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_shipment api_shipment_container_id_74cac54e_fk; Type: FK CONSTRAINT; Schema: public; Owner: gnmadmin
--

ALTER TABLE ONLY public.api_shipment
    ADD CONSTRAINT api_shipment_container_id_74cac54e_fk FOREIGN KEY (container_id) REFERENCES public.api_container(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_shipment api_shipment_user_id_75f60247_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: gnmadmin
--

ALTER TABLE ONLY public.api_shipment
    ADD CONSTRAINT api_shipment_user_id_75f60247_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_sms api_sms_customer_id_id_6f9a8f0c_fk_api_customer_id; Type: FK CONSTRAINT; Schema: public; Owner: gnmadmin
--

ALTER TABLE ONLY public.api_sms
    ADD CONSTRAINT api_sms_customer_id_id_6f9a8f0c_fk_api_customer_id FOREIGN KEY (customer_id_id) REFERENCES public.api_customer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_supplier api_supplier_user_id_d696b80f_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: gnmadmin
--

ALTER TABLE ONLY public.api_supplier
    ADD CONSTRAINT api_supplier_user_id_d696b80f_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_textsms api_textsms_created_by_id_041617fd_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: gnmadmin
--

ALTER TABLE ONLY public.api_textsms
    ADD CONSTRAINT api_textsms_created_by_id_041617fd_fk_users_user_id FOREIGN KEY (created_by_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_warehouse api_warehouse_user_id_dcdeceac_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: gnmadmin
--

ALTER TABLE ONLY public.api_warehouse
    ADD CONSTRAINT api_warehouse_user_id_dcdeceac_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_whatsapp api_whatsapp_customer_id_id_13206a82_fk_api_customer_id; Type: FK CONSTRAINT; Schema: public; Owner: gnmadmin
--

ALTER TABLE ONLY public.api_whatsapp
    ADD CONSTRAINT api_whatsapp_customer_id_id_13206a82_fk_api_customer_id FOREIGN KEY (customer_id_id) REFERENCES public.api_customer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: gnmadmin
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: gnmadmin
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: gnmadmin
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: authtoken_token authtoken_token_user_id_35299eff_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: gnmadmin
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_35299eff_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: gnmadmin
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: gnmadmin
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_user_groups users_user_groups_group_id_9afc8d0e_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: gnmadmin
--

ALTER TABLE ONLY public.users_user_groups
    ADD CONSTRAINT users_user_groups_group_id_9afc8d0e_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_user_groups users_user_groups_user_id_5f6f5a90_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: gnmadmin
--

ALTER TABLE ONLY public.users_user_groups
    ADD CONSTRAINT users_user_groups_user_id_5f6f5a90_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_user_user_permissions users_user_user_perm_permission_id_0b93982e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: gnmadmin
--

ALTER TABLE ONLY public.users_user_user_permissions
    ADD CONSTRAINT users_user_user_perm_permission_id_0b93982e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_user_user_permissions users_user_user_permissions_user_id_20aca447_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: gnmadmin
--

ALTER TABLE ONLY public.users_user_user_permissions
    ADD CONSTRAINT users_user_user_permissions_user_id_20aca447_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: DATABASE gnmcargo; Type: ACL; Schema: -; Owner: postgres
--

GRANT ALL ON DATABASE gnmcargo TO gnmadmin;


--
-- PostgreSQL database dump complete
--

