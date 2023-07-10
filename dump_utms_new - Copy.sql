--
-- PostgreSQL database dump
--

-- Dumped from database version 9.2.3
-- Dumped by pg_dump version 9.6.18

-- Started on 2023-07-07 02:11:37

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

SET default_with_oids = false;

--
-- TOC entry 181 (class 1259 OID 115822)
-- Name: tms_application; Type: TABLE; Schema: public; Owner: utms
--

CREATE TABLE public.tms_application (
    id uuid NOT NULL,
    version integer NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    update_ts timestamp without time zone,
    updated_by character varying(50),
    delete_ts timestamp without time zone,
    deleted_by character varying(50),
    package_name character varying(255) NOT NULL,
    name character varying(100) NOT NULL,
    description character varying(255),
    app_version character varying(50) NOT NULL,
    uninstallable boolean,
    company_name character varying(100) NOT NULL,
    checksum character varying(32) NOT NULL,
    unique_name character varying(50) NOT NULL,
    unique_icon_name character varying(50) NOT NULL,
    tenant_id character varying(50) NOT NULL,
    icon_url character varying(255) NOT NULL
);


ALTER TABLE public.tms_application OWNER TO utms;

--
-- TOC entry 173 (class 1259 OID 115693)
-- Name: tms_city; Type: TABLE; Schema: public; Owner: utms
--

CREATE TABLE public.tms_city (
    id uuid NOT NULL,
    version integer NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    update_ts timestamp without time zone,
    updated_by character varying(50),
    delete_ts timestamp without time zone,
    deleted_by character varying(50),
    states_id uuid NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.tms_city OWNER TO utms;

--
-- TOC entry 171 (class 1259 OID 115676)
-- Name: tms_country; Type: TABLE; Schema: public; Owner: utms
--

CREATE TABLE public.tms_country (
    id uuid NOT NULL,
    version integer NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    update_ts timestamp without time zone,
    updated_by character varying(50),
    delete_ts timestamp without time zone,
    deleted_by character varying(50),
    code character varying(2) NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.tms_country OWNER TO utms;

--
-- TOC entry 188 (class 1259 OID 115989)
-- Name: tms_delete_task; Type: TABLE; Schema: public; Owner: utms
--

CREATE TABLE public.tms_delete_task (
    id uuid NOT NULL,
    version integer NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    update_ts timestamp without time zone,
    updated_by character varying(50),
    delete_ts timestamp without time zone,
    deleted_by character varying(50),
    name character varying(50) NOT NULL,
    status integer NOT NULL,
    delete_time timestamp without time zone,
    old_status integer,
    tenant_id character varying(50) NOT NULL
);


ALTER TABLE public.tms_delete_task OWNER TO utms;

--
-- TOC entry 187 (class 1259 OID 115981)
-- Name: tms_delete_task_app; Type: TABLE; Schema: public; Owner: utms
--

CREATE TABLE public.tms_delete_task_app (
    id uuid NOT NULL,
    app_name character varying(255) NOT NULL,
    package_name character varying(255) NOT NULL,
    app_version character varying(50) NOT NULL,
    task_id uuid NOT NULL
);


ALTER TABLE public.tms_delete_task_app OWNER TO utms;

--
-- TOC entry 189 (class 1259 OID 115994)
-- Name: tms_delete_task_log; Type: TABLE; Schema: public; Owner: utms
--

CREATE TABLE public.tms_delete_task_log (
    id uuid NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    update_ts timestamp without time zone,
    updated_by character varying(50),
    version integer NOT NULL,
    task_id uuid NOT NULL,
    app_id uuid NOT NULL,
    terminal_id uuid NOT NULL,
    activity integer NOT NULL,
    last_broadcast_ts timestamp without time zone,
    old_activity integer,
    message character varying(255)
);


ALTER TABLE public.tms_delete_task_log OWNER TO utms;

--
-- TOC entry 190 (class 1259 OID 116002)
-- Name: tms_delete_task_terminal_group_link; Type: TABLE; Schema: public; Owner: utms
--

CREATE TABLE public.tms_delete_task_terminal_group_link (
    delete_task_id uuid NOT NULL,
    group_id uuid NOT NULL
);


ALTER TABLE public.tms_delete_task_terminal_group_link OWNER TO utms;

--
-- TOC entry 191 (class 1259 OID 116042)
-- Name: tms_delete_task_terminal_link; Type: TABLE; Schema: public; Owner: utms
--

CREATE TABLE public.tms_delete_task_terminal_link (
    terminal_id uuid NOT NULL,
    delete_task_id uuid NOT NULL
);


ALTER TABLE public.tms_delete_task_terminal_link OWNER TO utms;

--
-- TOC entry 176 (class 1259 OID 115740)
-- Name: tms_device_model; Type: TABLE; Schema: public; Owner: utms
--

CREATE TABLE public.tms_device_model (
    id uuid NOT NULL,
    version integer NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    update_ts timestamp without time zone,
    updated_by character varying(50),
    delete_ts timestamp without time zone,
    deleted_by character varying(50),
    model character varying(50) NOT NULL,
    model_information text,
    vendor_name character varying(100) NOT NULL,
    vendor_country character varying(50) NOT NULL
);


ALTER TABLE public.tms_device_model OWNER TO utms;

--
-- TOC entry 177 (class 1259 OID 115748)
-- Name: tms_device_profile; Type: TABLE; Schema: public; Owner: utms
--

CREATE TABLE public.tms_device_profile (
    id uuid NOT NULL,
    version integer NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    update_ts timestamp without time zone,
    updated_by character varying(50),
    delete_ts timestamp without time zone,
    deleted_by character varying(50),
    name character varying(50) NOT NULL,
    heartbeat_interval integer NOT NULL,
    diagnostic_interval integer NOT NULL,
    mask_home_button boolean NOT NULL,
    mask_status_bar boolean NOT NULL,
    schedule_reboot boolean NOT NULL,
    schedule_reboot_time time without time zone,
    is_default boolean,
    relocation_alert boolean,
    moving_threshold integer,
    admin_password character varying(8),
    front_app character varying(255),
    tenant_id character varying(50) NOT NULL
);


ALTER TABLE public.tms_device_profile OWNER TO utms;

--
-- TOC entry 193 (class 1259 OID 116063)
-- Name: tms_diagnostic_info; Type: TABLE; Schema: public; Owner: utms
--

CREATE TABLE public.tms_diagnostic_info (
    id uuid NOT NULL,
    sn character varying(30) NOT NULL,
    battery_temp double precision NOT NULL,
    battery_percentage integer NOT NULL,
    latitude double precision,
    longitude double precision,
    create_ts timestamp without time zone,
    created_by character varying(50),
    meid character varying(20),
    switching_times integer,
    swiping_card_times integer,
    dip_inserting_times integer,
    nfc_card_reading_times integer,
    front_camera_open_times integer,
    rear_camera_open_times integer,
    charge_times integer,
    version integer NOT NULL,
    total_memory bigint,
    available_memory bigint,
    total_flash_memory bigint,
    available_flash_memory bigint,
    total_mobile_data bigint,
    current_boot_time integer,
    total_boot_time integer,
    installed_apps_string text,
    total_length_printed double precision,
    cell_name character varying(50),
    cell_type character varying(10),
    cell_strength integer
);


ALTER TABLE public.tms_diagnostic_info OWNER TO utms;

--
-- TOC entry 174 (class 1259 OID 115704)
-- Name: tms_district; Type: TABLE; Schema: public; Owner: utms
--

CREATE TABLE public.tms_district (
    id uuid NOT NULL,
    version integer NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    update_ts timestamp without time zone,
    updated_by character varying(50),
    delete_ts timestamp without time zone,
    deleted_by character varying(50),
    city_id uuid NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.tms_district OWNER TO utms;

--
-- TOC entry 182 (class 1259 OID 115904)
-- Name: tms_download_task; Type: TABLE; Schema: public; Owner: utms
--

CREATE TABLE public.tms_download_task (
    id uuid NOT NULL,
    version integer NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    update_ts timestamp without time zone,
    updated_by character varying(50),
    delete_ts timestamp without time zone,
    deleted_by character varying(50),
    name character varying(50) NOT NULL,
    publish_time_type integer NOT NULL,
    publish_time timestamp without time zone,
    download_time_type integer NOT NULL,
    download_time timestamp without time zone,
    installation_time_type integer NOT NULL,
    installation_time timestamp without time zone,
    installation_notification integer NOT NULL,
    status integer NOT NULL,
    old_status integer,
    tenant_id character varying(50) NOT NULL,
    download_url character varying(255) NOT NULL
);


ALTER TABLE public.tms_download_task OWNER TO utms;

--
-- TOC entry 183 (class 1259 OID 115912)
-- Name: tms_download_task_application_link; Type: TABLE; Schema: public; Owner: utms
--

CREATE TABLE public.tms_download_task_application_link (
    download_task_id uuid NOT NULL,
    application_id uuid NOT NULL
);


ALTER TABLE public.tms_download_task_application_link OWNER TO utms;

--
-- TOC entry 184 (class 1259 OID 115917)
-- Name: tms_download_task_log; Type: TABLE; Schema: public; Owner: utms
--

CREATE TABLE public.tms_download_task_log (
    id uuid NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    update_ts timestamp without time zone,
    updated_by character varying(50),
    version integer NOT NULL,
    task_id uuid NOT NULL,
    application_id uuid NOT NULL,
    activity integer NOT NULL,
    terminal_id uuid NOT NULL,
    last_broadcast_ts timestamp without time zone,
    old_activity integer,
    message character varying(255)
);


ALTER TABLE public.tms_download_task_log OWNER TO utms;

--
-- TOC entry 185 (class 1259 OID 115925)
-- Name: tms_download_task_terminal_group_link; Type: TABLE; Schema: public; Owner: utms
--

CREATE TABLE public.tms_download_task_terminal_group_link (
    download_task_id uuid NOT NULL,
    group_id uuid NOT NULL
);


ALTER TABLE public.tms_download_task_terminal_group_link OWNER TO utms;

--
-- TOC entry 186 (class 1259 OID 115930)
-- Name: tms_download_task_terminal_link; Type: TABLE; Schema: public; Owner: utms
--

CREATE TABLE public.tms_download_task_terminal_link (
    terminal_id uuid NOT NULL,
    download_task_id uuid NOT NULL
);


ALTER TABLE public.tms_download_task_terminal_link OWNER TO utms;

--
-- TOC entry 192 (class 1259 OID 116057)
-- Name: tms_heart_beat; Type: TABLE; Schema: public; Owner: utms
--

CREATE TABLE public.tms_heart_beat (
    id uuid NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    sn character varying(30) NOT NULL,
    battery_temp double precision NOT NULL,
    battery_percentage integer NOT NULL,
    latitude double precision,
    longitude double precision,
    version integer NOT NULL,
    cell_name character varying(50),
    cell_type character varying(10),
    cell_strength integer
);


ALTER TABLE public.tms_heart_beat OWNER TO utms;

--
-- TOC entry 175 (class 1259 OID 115715)
-- Name: tms_merchant; Type: TABLE; Schema: public; Owner: utms
--

CREATE TABLE public.tms_merchant (
    id uuid NOT NULL,
    version integer NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    update_ts timestamp without time zone,
    updated_by character varying(50),
    delete_ts timestamp without time zone,
    deleted_by character varying(50),
    name character varying(100) NOT NULL,
    company_name character varying(100) NOT NULL,
    district_id uuid NOT NULL,
    address character varying(255) NOT NULL,
    zipcode character varying(5) NOT NULL,
    type_id uuid NOT NULL,
    tenant_id character varying(50) NOT NULL
);


ALTER TABLE public.tms_merchant OWNER TO utms;

--
-- TOC entry 170 (class 1259 OID 115668)
-- Name: tms_merchant_type; Type: TABLE; Schema: public; Owner: utms
--

CREATE TABLE public.tms_merchant_type (
    id uuid NOT NULL,
    version integer NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    update_ts timestamp without time zone,
    updated_by character varying(50),
    delete_ts timestamp without time zone,
    deleted_by character varying(50),
    name character varying(100) NOT NULL,
    description character varying(255)
);


ALTER TABLE public.tms_merchant_type OWNER TO utms;

--
-- TOC entry 172 (class 1259 OID 115682)
-- Name: tms_states; Type: TABLE; Schema: public; Owner: utms
--

CREATE TABLE public.tms_states (
    id uuid NOT NULL,
    version integer NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    update_ts timestamp without time zone,
    updated_by character varying(50),
    delete_ts timestamp without time zone,
    deleted_by character varying(50),
    country_id uuid NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.tms_states OWNER TO utms;

--
-- TOC entry 169 (class 1259 OID 115657)
-- Name: tms_tenant; Type: TABLE; Schema: public; Owner: utms
--

CREATE TABLE public.tms_tenant (
    id character varying(50) NOT NULL,
    version integer NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    update_ts timestamp without time zone,
    updated_by character varying(50),
    delete_ts timestamp without time zone,
    deleted_by character varying(50),
    name character varying(50) NOT NULL,
    super_tenant_id character varying(50),
    is_super boolean NOT NULL
);


ALTER TABLE public.tms_tenant OWNER TO utms;

--
-- TOC entry 178 (class 1259 OID 115761)
-- Name: tms_terminal; Type: TABLE; Schema: public; Owner: utms
--

CREATE TABLE public.tms_terminal (
    id uuid NOT NULL,
    version integer NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    update_ts timestamp without time zone,
    updated_by character varying(50),
    delete_ts timestamp without time zone,
    deleted_by character varying(50),
    imei character varying(25) NOT NULL,
    model_id uuid NOT NULL,
    merchant_id uuid NOT NULL,
    sn character varying(30) NOT NULL,
    profile_id uuid,
    tenant_id character varying(50) NOT NULL,
    is_locked integer,
    locked_reason character varying(255)
);


ALTER TABLE public.tms_terminal OWNER TO utms;

--
-- TOC entry 179 (class 1259 OID 115790)
-- Name: tms_terminal_group; Type: TABLE; Schema: public; Owner: utms
--

CREATE TABLE public.tms_terminal_group (
    id uuid NOT NULL,
    version integer NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    update_ts timestamp without time zone,
    updated_by character varying(50),
    delete_ts timestamp without time zone,
    deleted_by character varying(50),
    name character varying(100) NOT NULL,
    description character varying(255),
    tenant_id character varying(50) NOT NULL
);


ALTER TABLE public.tms_terminal_group OWNER TO utms;

--
-- TOC entry 180 (class 1259 OID 115804)
-- Name: tms_terminal_group_link; Type: TABLE; Schema: public; Owner: utms
--

CREATE TABLE public.tms_terminal_group_link (
    terminal_id uuid NOT NULL,
    terminal_group_id uuid NOT NULL
);


ALTER TABLE public.tms_terminal_group_link OWNER TO utms;

--
-- TOC entry 2135 (class 0 OID 115822)
-- Dependencies: 181
-- Data for Name: tms_application; Type: TABLE DATA; Schema: public; Owner: utms
--



--
-- TOC entry 2127 (class 0 OID 115693)
-- Dependencies: 173
-- Data for Name: tms_city; Type: TABLE DATA; Schema: public; Owner: utms
--



--
-- TOC entry 2125 (class 0 OID 115676)
-- Dependencies: 171
-- Data for Name: tms_country; Type: TABLE DATA; Schema: public; Owner: utms
--



--
-- TOC entry 2142 (class 0 OID 115989)
-- Dependencies: 188
-- Data for Name: tms_delete_task; Type: TABLE DATA; Schema: public; Owner: utms
--



--
-- TOC entry 2141 (class 0 OID 115981)
-- Dependencies: 187
-- Data for Name: tms_delete_task_app; Type: TABLE DATA; Schema: public; Owner: utms
--



--
-- TOC entry 2143 (class 0 OID 115994)
-- Dependencies: 189
-- Data for Name: tms_delete_task_log; Type: TABLE DATA; Schema: public; Owner: utms
--



--
-- TOC entry 2144 (class 0 OID 116002)
-- Dependencies: 190
-- Data for Name: tms_delete_task_terminal_group_link; Type: TABLE DATA; Schema: public; Owner: utms
--



--
-- TOC entry 2145 (class 0 OID 116042)
-- Dependencies: 191
-- Data for Name: tms_delete_task_terminal_link; Type: TABLE DATA; Schema: public; Owner: utms
--



--
-- TOC entry 2130 (class 0 OID 115740)
-- Dependencies: 176
-- Data for Name: tms_device_model; Type: TABLE DATA; Schema: public; Owner: utms
--



--
-- TOC entry 2131 (class 0 OID 115748)
-- Dependencies: 177
-- Data for Name: tms_device_profile; Type: TABLE DATA; Schema: public; Owner: utms
--



--
-- TOC entry 2147 (class 0 OID 116063)
-- Dependencies: 193
-- Data for Name: tms_diagnostic_info; Type: TABLE DATA; Schema: public; Owner: utms
--



--
-- TOC entry 2128 (class 0 OID 115704)
-- Dependencies: 174
-- Data for Name: tms_district; Type: TABLE DATA; Schema: public; Owner: utms
--



--
-- TOC entry 2136 (class 0 OID 115904)
-- Dependencies: 182
-- Data for Name: tms_download_task; Type: TABLE DATA; Schema: public; Owner: utms
--



--
-- TOC entry 2137 (class 0 OID 115912)
-- Dependencies: 183
-- Data for Name: tms_download_task_application_link; Type: TABLE DATA; Schema: public; Owner: utms
--



--
-- TOC entry 2138 (class 0 OID 115917)
-- Dependencies: 184
-- Data for Name: tms_download_task_log; Type: TABLE DATA; Schema: public; Owner: utms
--



--
-- TOC entry 2139 (class 0 OID 115925)
-- Dependencies: 185
-- Data for Name: tms_download_task_terminal_group_link; Type: TABLE DATA; Schema: public; Owner: utms
--



--
-- TOC entry 2140 (class 0 OID 115930)
-- Dependencies: 186
-- Data for Name: tms_download_task_terminal_link; Type: TABLE DATA; Schema: public; Owner: utms
--



--
-- TOC entry 2146 (class 0 OID 116057)
-- Dependencies: 192
-- Data for Name: tms_heart_beat; Type: TABLE DATA; Schema: public; Owner: utms
--



--
-- TOC entry 2129 (class 0 OID 115715)
-- Dependencies: 175
-- Data for Name: tms_merchant; Type: TABLE DATA; Schema: public; Owner: utms
--



--
-- TOC entry 2124 (class 0 OID 115668)
-- Dependencies: 170
-- Data for Name: tms_merchant_type; Type: TABLE DATA; Schema: public; Owner: utms
--



--
-- TOC entry 2126 (class 0 OID 115682)
-- Dependencies: 172
-- Data for Name: tms_states; Type: TABLE DATA; Schema: public; Owner: utms
--



--
-- TOC entry 2123 (class 0 OID 115657)
-- Dependencies: 169
-- Data for Name: tms_tenant; Type: TABLE DATA; Schema: public; Owner: utms
--

INSERT INTO public.tms_tenant VALUES ('tripmitra', 1, '2023-07-07 00:10:00', 'admin', NULL, NULL, NULL, NULL, 'Tripmitra', NULL, true);
INSERT INTO public.tms_tenant VALUES ('qualita', 1, '2023-07-07 00:10:00', 'admin', NULL, NULL, NULL, NULL, 'Qualita', 'tripmitra', false);


--
-- TOC entry 2132 (class 0 OID 115761)
-- Dependencies: 178
-- Data for Name: tms_terminal; Type: TABLE DATA; Schema: public; Owner: utms
--



--
-- TOC entry 2133 (class 0 OID 115790)
-- Dependencies: 179
-- Data for Name: tms_terminal_group; Type: TABLE DATA; Schema: public; Owner: utms
--



--
-- TOC entry 2134 (class 0 OID 115804)
-- Dependencies: 180
-- Data for Name: tms_terminal_group_link; Type: TABLE DATA; Schema: public; Owner: utms
--



--
-- TOC entry 1950 (class 2606 OID 115829)
-- Name: tms_application tms_application_pkey; Type: CONSTRAINT; Schema: public; Owner: utms
--

ALTER TABLE ONLY public.tms_application
    ADD CONSTRAINT tms_application_pkey PRIMARY KEY (id);


--
-- TOC entry 1926 (class 2606 OID 115697)
-- Name: tms_city tms_city_pkey; Type: CONSTRAINT; Schema: public; Owner: utms
--

ALTER TABLE ONLY public.tms_city
    ADD CONSTRAINT tms_city_pkey PRIMARY KEY (id);


--
-- TOC entry 1920 (class 2606 OID 115680)
-- Name: tms_country tms_country_pkey; Type: CONSTRAINT; Schema: public; Owner: utms
--

ALTER TABLE ONLY public.tms_country
    ADD CONSTRAINT tms_country_pkey PRIMARY KEY (id);


--
-- TOC entry 1965 (class 2606 OID 115988)
-- Name: tms_delete_task_app tms_delete_task_app_pkey; Type: CONSTRAINT; Schema: public; Owner: utms
--

ALTER TABLE ONLY public.tms_delete_task_app
    ADD CONSTRAINT tms_delete_task_app_pkey PRIMARY KEY (id);


--
-- TOC entry 1972 (class 2606 OID 115998)
-- Name: tms_delete_task_log tms_delete_task_log_pkey; Type: CONSTRAINT; Schema: public; Owner: utms
--

ALTER TABLE ONLY public.tms_delete_task_log
    ADD CONSTRAINT tms_delete_task_log_pkey PRIMARY KEY (id);


--
-- TOC entry 1967 (class 2606 OID 115993)
-- Name: tms_delete_task tms_delete_task_pkey; Type: CONSTRAINT; Schema: public; Owner: utms
--

ALTER TABLE ONLY public.tms_delete_task
    ADD CONSTRAINT tms_delete_task_pkey PRIMARY KEY (id);


--
-- TOC entry 1974 (class 2606 OID 116006)
-- Name: tms_delete_task_terminal_group_link tms_delete_task_terminal_group_link_pkey; Type: CONSTRAINT; Schema: public; Owner: utms
--

ALTER TABLE ONLY public.tms_delete_task_terminal_group_link
    ADD CONSTRAINT tms_delete_task_terminal_group_link_pkey PRIMARY KEY (delete_task_id, group_id);


--
-- TOC entry 1976 (class 2606 OID 116046)
-- Name: tms_delete_task_terminal_link tms_delete_task_terminal_link_pkey; Type: CONSTRAINT; Schema: public; Owner: utms
--

ALTER TABLE ONLY public.tms_delete_task_terminal_link
    ADD CONSTRAINT tms_delete_task_terminal_link_pkey PRIMARY KEY (terminal_id, delete_task_id);


--
-- TOC entry 1935 (class 2606 OID 115747)
-- Name: tms_device_model tms_device_model_pkey; Type: CONSTRAINT; Schema: public; Owner: utms
--

ALTER TABLE ONLY public.tms_device_model
    ADD CONSTRAINT tms_device_model_pkey PRIMARY KEY (id);


--
-- TOC entry 1937 (class 2606 OID 115755)
-- Name: tms_device_profile tms_device_profile_pkey; Type: CONSTRAINT; Schema: public; Owner: utms
--

ALTER TABLE ONLY public.tms_device_profile
    ADD CONSTRAINT tms_device_profile_pkey PRIMARY KEY (id);


--
-- TOC entry 1983 (class 2606 OID 116070)
-- Name: tms_diagnostic_info tms_diagnostic_info_pkey; Type: CONSTRAINT; Schema: public; Owner: utms
--

ALTER TABLE ONLY public.tms_diagnostic_info
    ADD CONSTRAINT tms_diagnostic_info_pkey PRIMARY KEY (id);


--
-- TOC entry 1929 (class 2606 OID 115708)
-- Name: tms_district tms_district_pkey; Type: CONSTRAINT; Schema: public; Owner: utms
--

ALTER TABLE ONLY public.tms_district
    ADD CONSTRAINT tms_district_pkey PRIMARY KEY (id);


--
-- TOC entry 1954 (class 2606 OID 115916)
-- Name: tms_download_task_application_link tms_download_task_application_link_pkey; Type: CONSTRAINT; Schema: public; Owner: utms
--

ALTER TABLE ONLY public.tms_download_task_application_link
    ADD CONSTRAINT tms_download_task_application_link_pkey PRIMARY KEY (download_task_id, application_id);


--
-- TOC entry 1959 (class 2606 OID 115921)
-- Name: tms_download_task_log tms_download_task_log_pkey; Type: CONSTRAINT; Schema: public; Owner: utms
--

ALTER TABLE ONLY public.tms_download_task_log
    ADD CONSTRAINT tms_download_task_log_pkey PRIMARY KEY (id);


--
-- TOC entry 1952 (class 2606 OID 115911)
-- Name: tms_download_task tms_download_task_pkey; Type: CONSTRAINT; Schema: public; Owner: utms
--

ALTER TABLE ONLY public.tms_download_task
    ADD CONSTRAINT tms_download_task_pkey PRIMARY KEY (id);


--
-- TOC entry 1961 (class 2606 OID 115929)
-- Name: tms_download_task_terminal_group_link tms_download_task_terminal_group_link_pkey; Type: CONSTRAINT; Schema: public; Owner: utms
--

ALTER TABLE ONLY public.tms_download_task_terminal_group_link
    ADD CONSTRAINT tms_download_task_terminal_group_link_pkey PRIMARY KEY (download_task_id, group_id);


--
-- TOC entry 1963 (class 2606 OID 115934)
-- Name: tms_download_task_terminal_link tms_download_task_terminal_link_pkey; Type: CONSTRAINT; Schema: public; Owner: utms
--

ALTER TABLE ONLY public.tms_download_task_terminal_link
    ADD CONSTRAINT tms_download_task_terminal_link_pkey PRIMARY KEY (terminal_id, download_task_id);


--
-- TOC entry 1979 (class 2606 OID 116061)
-- Name: tms_heart_beat tms_heart_beat_pkey; Type: CONSTRAINT; Schema: public; Owner: utms
--

ALTER TABLE ONLY public.tms_heart_beat
    ADD CONSTRAINT tms_heart_beat_pkey PRIMARY KEY (id);


--
-- TOC entry 1933 (class 2606 OID 115722)
-- Name: tms_merchant tms_merchant_pkey; Type: CONSTRAINT; Schema: public; Owner: utms
--

ALTER TABLE ONLY public.tms_merchant
    ADD CONSTRAINT tms_merchant_pkey PRIMARY KEY (id);


--
-- TOC entry 1917 (class 2606 OID 115675)
-- Name: tms_merchant_type tms_merchant_type_pkey; Type: CONSTRAINT; Schema: public; Owner: utms
--

ALTER TABLE ONLY public.tms_merchant_type
    ADD CONSTRAINT tms_merchant_type_pkey PRIMARY KEY (id);


--
-- TOC entry 1923 (class 2606 OID 115686)
-- Name: tms_states tms_states_pkey; Type: CONSTRAINT; Schema: public; Owner: utms
--

ALTER TABLE ONLY public.tms_states
    ADD CONSTRAINT tms_states_pkey PRIMARY KEY (id);


--
-- TOC entry 1915 (class 2606 OID 115661)
-- Name: tms_tenant tms_tenant_pkey; Type: CONSTRAINT; Schema: public; Owner: utms
--

ALTER TABLE ONLY public.tms_tenant
    ADD CONSTRAINT tms_tenant_pkey PRIMARY KEY (id);


--
-- TOC entry 1947 (class 2606 OID 115808)
-- Name: tms_terminal_group_link tms_terminal_group_link_pkey; Type: CONSTRAINT; Schema: public; Owner: utms
--

ALTER TABLE ONLY public.tms_terminal_group_link
    ADD CONSTRAINT tms_terminal_group_link_pkey PRIMARY KEY (terminal_id, terminal_group_id);


--
-- TOC entry 1945 (class 2606 OID 115797)
-- Name: tms_terminal_group tms_terminal_group_pkey; Type: CONSTRAINT; Schema: public; Owner: utms
--

ALTER TABLE ONLY public.tms_terminal_group
    ADD CONSTRAINT tms_terminal_group_pkey PRIMARY KEY (id);


--
-- TOC entry 1943 (class 2606 OID 115765)
-- Name: tms_terminal tms_terminal_pkey; Type: CONSTRAINT; Schema: public; Owner: utms
--

ALTER TABLE ONLY public.tms_terminal
    ADD CONSTRAINT tms_terminal_pkey PRIMARY KEY (id);


--
-- TOC entry 1948 (class 1259 OID 115830)
-- Name: idx_tms_application_unq; Type: INDEX; Schema: public; Owner: utms
--

CREATE UNIQUE INDEX idx_tms_application_unq ON public.tms_application USING btree (package_name, version) WHERE (delete_ts IS NULL);


--
-- TOC entry 1924 (class 1259 OID 115703)
-- Name: idx_tms_city_on_states; Type: INDEX; Schema: public; Owner: utms
--

CREATE INDEX idx_tms_city_on_states ON public.tms_city USING btree (states_id);


--
-- TOC entry 1918 (class 1259 OID 115681)
-- Name: idx_tms_country_uk_code; Type: INDEX; Schema: public; Owner: utms
--

CREATE UNIQUE INDEX idx_tms_country_uk_code ON public.tms_country USING btree (code) WHERE (delete_ts IS NULL);


--
-- TOC entry 1968 (class 1259 OID 115999)
-- Name: idx_tms_delete_task_log_on_app; Type: INDEX; Schema: public; Owner: utms
--

CREATE INDEX idx_tms_delete_task_log_on_app ON public.tms_delete_task_log USING btree (app_id);


--
-- TOC entry 1969 (class 1259 OID 116000)
-- Name: idx_tms_delete_task_log_on_task; Type: INDEX; Schema: public; Owner: utms
--

CREATE INDEX idx_tms_delete_task_log_on_task ON public.tms_delete_task_log USING btree (task_id);


--
-- TOC entry 1970 (class 1259 OID 116001)
-- Name: idx_tms_delete_task_log_on_terminal; Type: INDEX; Schema: public; Owner: utms
--

CREATE INDEX idx_tms_delete_task_log_on_terminal ON public.tms_delete_task_log USING btree (terminal_id);


--
-- TOC entry 1927 (class 1259 OID 115714)
-- Name: idx_tms_district_on_city; Type: INDEX; Schema: public; Owner: utms
--

CREATE INDEX idx_tms_district_on_city ON public.tms_district USING btree (city_id);


--
-- TOC entry 1955 (class 1259 OID 115922)
-- Name: idx_tms_download_task_log_on_application; Type: INDEX; Schema: public; Owner: utms
--

CREATE INDEX idx_tms_download_task_log_on_application ON public.tms_download_task_log USING btree (application_id);


--
-- TOC entry 1956 (class 1259 OID 115923)
-- Name: idx_tms_download_task_log_on_task; Type: INDEX; Schema: public; Owner: utms
--

CREATE INDEX idx_tms_download_task_log_on_task ON public.tms_download_task_log USING btree (task_id);


--
-- TOC entry 1957 (class 1259 OID 115924)
-- Name: idx_tms_download_task_log_on_terminal; Type: INDEX; Schema: public; Owner: utms
--

CREATE INDEX idx_tms_download_task_log_on_terminal ON public.tms_download_task_log USING btree (terminal_id);


--
-- TOC entry 1930 (class 1259 OID 115723)
-- Name: idx_tms_merchant_on_district; Type: INDEX; Schema: public; Owner: utms
--

CREATE INDEX idx_tms_merchant_on_district ON public.tms_merchant USING btree (district_id);


--
-- TOC entry 1931 (class 1259 OID 115724)
-- Name: idx_tms_merchant_on_type; Type: INDEX; Schema: public; Owner: utms
--

CREATE INDEX idx_tms_merchant_on_type ON public.tms_merchant USING btree (type_id);


--
-- TOC entry 1921 (class 1259 OID 115692)
-- Name: idx_tms_states_on_country; Type: INDEX; Schema: public; Owner: utms
--

CREATE INDEX idx_tms_states_on_country ON public.tms_states USING btree (country_id);


--
-- TOC entry 1938 (class 1259 OID 115766)
-- Name: idx_tms_terminal_on_merchant; Type: INDEX; Schema: public; Owner: utms
--

CREATE INDEX idx_tms_terminal_on_merchant ON public.tms_terminal USING btree (merchant_id);


--
-- TOC entry 1939 (class 1259 OID 115767)
-- Name: idx_tms_terminal_on_model; Type: INDEX; Schema: public; Owner: utms
--

CREATE INDEX idx_tms_terminal_on_model ON public.tms_terminal USING btree (model_id);


--
-- TOC entry 1940 (class 1259 OID 115768)
-- Name: idx_tms_terminal_on_profile; Type: INDEX; Schema: public; Owner: utms
--

CREATE INDEX idx_tms_terminal_on_profile ON public.tms_terminal USING btree (profile_id);


--
-- TOC entry 1941 (class 1259 OID 115769)
-- Name: idx_tms_terminal_uk_sn; Type: INDEX; Schema: public; Owner: utms
--

CREATE UNIQUE INDEX idx_tms_terminal_uk_sn ON public.tms_terminal USING btree (sn) WHERE (delete_ts IS NULL);


--
-- TOC entry 1981 (class 1259 OID 116073)
-- Name: tms_diagnostic_info_create_ts_idx; Type: INDEX; Schema: public; Owner: utms
--

CREATE INDEX tms_diagnostic_info_create_ts_idx ON public.tms_diagnostic_info USING btree (create_ts);


--
-- TOC entry 1984 (class 1259 OID 116072)
-- Name: tms_diagnostic_info_sn_idx; Type: INDEX; Schema: public; Owner: utms
--

CREATE INDEX tms_diagnostic_info_sn_idx ON public.tms_diagnostic_info USING btree (sn);


--
-- TOC entry 1977 (class 1259 OID 116062)
-- Name: tms_heart_beat_create_ts_idx; Type: INDEX; Schema: public; Owner: utms
--

CREATE INDEX tms_heart_beat_create_ts_idx ON public.tms_heart_beat USING btree (create_ts);


--
-- TOC entry 1980 (class 1259 OID 116071)
-- Name: tms_heart_beat_sn_idx; Type: INDEX; Schema: public; Owner: utms
--

CREATE INDEX tms_heart_beat_sn_idx ON public.tms_heart_beat USING btree (sn);


--
-- TOC entry 2013 (class 2606 OID 116022)
-- Name: tms_delete_task_terminal_group_link fk_deltastergro_on_delete_task; Type: FK CONSTRAINT; Schema: public; Owner: utms
--

ALTER TABLE ONLY public.tms_delete_task_terminal_group_link
    ADD CONSTRAINT fk_deltastergro_on_delete_task FOREIGN KEY (delete_task_id) REFERENCES public.tms_delete_task(id);


--
-- TOC entry 2014 (class 2606 OID 116027)
-- Name: tms_delete_task_terminal_group_link fk_deltastergro_on_terminal_group; Type: FK CONSTRAINT; Schema: public; Owner: utms
--

ALTER TABLE ONLY public.tms_delete_task_terminal_group_link
    ADD CONSTRAINT fk_deltastergro_on_terminal_group FOREIGN KEY (group_id) REFERENCES public.tms_terminal_group(id);


--
-- TOC entry 1999 (class 2606 OID 115935)
-- Name: tms_download_task_application_link fk_dowtasapp_on_application; Type: FK CONSTRAINT; Schema: public; Owner: utms
--

ALTER TABLE ONLY public.tms_download_task_application_link
    ADD CONSTRAINT fk_dowtasapp_on_application FOREIGN KEY (application_id) REFERENCES public.tms_application(id);


--
-- TOC entry 2000 (class 2606 OID 115940)
-- Name: tms_download_task_application_link fk_dowtasapp_on_download_task; Type: FK CONSTRAINT; Schema: public; Owner: utms
--

ALTER TABLE ONLY public.tms_download_task_application_link
    ADD CONSTRAINT fk_dowtasapp_on_download_task FOREIGN KEY (download_task_id) REFERENCES public.tms_download_task(id);


--
-- TOC entry 2015 (class 2606 OID 116047)
-- Name: tms_delete_task_terminal_link fk_dowtaster_on_delete_task; Type: FK CONSTRAINT; Schema: public; Owner: utms
--

ALTER TABLE ONLY public.tms_delete_task_terminal_link
    ADD CONSTRAINT fk_dowtaster_on_delete_task FOREIGN KEY (delete_task_id) REFERENCES public.tms_delete_task(id);


--
-- TOC entry 2006 (class 2606 OID 115970)
-- Name: tms_download_task_terminal_link fk_dowtaster_on_download_task; Type: FK CONSTRAINT; Schema: public; Owner: utms
--

ALTER TABLE ONLY public.tms_download_task_terminal_link
    ADD CONSTRAINT fk_dowtaster_on_download_task FOREIGN KEY (download_task_id) REFERENCES public.tms_download_task(id);


--
-- TOC entry 2007 (class 2606 OID 115975)
-- Name: tms_download_task_terminal_link fk_dowtaster_on_terminal; Type: FK CONSTRAINT; Schema: public; Owner: utms
--

ALTER TABLE ONLY public.tms_download_task_terminal_link
    ADD CONSTRAINT fk_dowtaster_on_terminal FOREIGN KEY (terminal_id) REFERENCES public.tms_terminal(id);


--
-- TOC entry 2016 (class 2606 OID 116052)
-- Name: tms_delete_task_terminal_link fk_dowtaster_on_terminal; Type: FK CONSTRAINT; Schema: public; Owner: utms
--

ALTER TABLE ONLY public.tms_delete_task_terminal_link
    ADD CONSTRAINT fk_dowtaster_on_terminal FOREIGN KEY (terminal_id) REFERENCES public.tms_terminal(id);


--
-- TOC entry 2004 (class 2606 OID 115960)
-- Name: tms_download_task_terminal_group_link fk_dowtastergro_on_download_task; Type: FK CONSTRAINT; Schema: public; Owner: utms
--

ALTER TABLE ONLY public.tms_download_task_terminal_group_link
    ADD CONSTRAINT fk_dowtastergro_on_download_task FOREIGN KEY (download_task_id) REFERENCES public.tms_download_task(id);


--
-- TOC entry 2005 (class 2606 OID 115965)
-- Name: tms_download_task_terminal_group_link fk_dowtastergro_on_terminal_group; Type: FK CONSTRAINT; Schema: public; Owner: utms
--

ALTER TABLE ONLY public.tms_download_task_terminal_group_link
    ADD CONSTRAINT fk_dowtastergro_on_terminal_group FOREIGN KEY (group_id) REFERENCES public.tms_terminal_group(id);


--
-- TOC entry 1997 (class 2606 OID 115809)
-- Name: tms_terminal_group_link fk_tergro_on_terminal; Type: FK CONSTRAINT; Schema: public; Owner: utms
--

ALTER TABLE ONLY public.tms_terminal_group_link
    ADD CONSTRAINT fk_tergro_on_terminal FOREIGN KEY (terminal_id) REFERENCES public.tms_terminal(id);


--
-- TOC entry 1998 (class 2606 OID 115814)
-- Name: tms_terminal_group_link fk_tergro_on_terminal_group; Type: FK CONSTRAINT; Schema: public; Owner: utms
--

ALTER TABLE ONLY public.tms_terminal_group_link
    ADD CONSTRAINT fk_tergro_on_terminal_group FOREIGN KEY (terminal_group_id) REFERENCES public.tms_terminal_group(id);


--
-- TOC entry 1987 (class 2606 OID 115698)
-- Name: tms_city fk_tms_city_on_states; Type: FK CONSTRAINT; Schema: public; Owner: utms
--

ALTER TABLE ONLY public.tms_city
    ADD CONSTRAINT fk_tms_city_on_states FOREIGN KEY (states_id) REFERENCES public.tms_states(id);


--
-- TOC entry 2009 (class 2606 OID 116007)
-- Name: tms_delete_task_log fk_tms_delete_task_log_on_app; Type: FK CONSTRAINT; Schema: public; Owner: utms
--

ALTER TABLE ONLY public.tms_delete_task_log
    ADD CONSTRAINT fk_tms_delete_task_log_on_app FOREIGN KEY (app_id) REFERENCES public.tms_delete_task_app(id) ON DELETE CASCADE;


--
-- TOC entry 2010 (class 2606 OID 116012)
-- Name: tms_delete_task_log fk_tms_delete_task_log_on_task; Type: FK CONSTRAINT; Schema: public; Owner: utms
--

ALTER TABLE ONLY public.tms_delete_task_log
    ADD CONSTRAINT fk_tms_delete_task_log_on_task FOREIGN KEY (task_id) REFERENCES public.tms_delete_task(id);


--
-- TOC entry 2011 (class 2606 OID 116017)
-- Name: tms_delete_task_log fk_tms_delete_task_log_on_terminal; Type: FK CONSTRAINT; Schema: public; Owner: utms
--

ALTER TABLE ONLY public.tms_delete_task_log
    ADD CONSTRAINT fk_tms_delete_task_log_on_terminal FOREIGN KEY (terminal_id) REFERENCES public.tms_terminal(id);


--
-- TOC entry 1988 (class 2606 OID 115709)
-- Name: tms_district fk_tms_district_on_city; Type: FK CONSTRAINT; Schema: public; Owner: utms
--

ALTER TABLE ONLY public.tms_district
    ADD CONSTRAINT fk_tms_district_on_city FOREIGN KEY (city_id) REFERENCES public.tms_city(id);


--
-- TOC entry 2001 (class 2606 OID 115945)
-- Name: tms_download_task_log fk_tms_download_task_log_on_application; Type: FK CONSTRAINT; Schema: public; Owner: utms
--

ALTER TABLE ONLY public.tms_download_task_log
    ADD CONSTRAINT fk_tms_download_task_log_on_application FOREIGN KEY (application_id) REFERENCES public.tms_application(id);


--
-- TOC entry 2002 (class 2606 OID 115950)
-- Name: tms_download_task_log fk_tms_download_task_log_on_task; Type: FK CONSTRAINT; Schema: public; Owner: utms
--

ALTER TABLE ONLY public.tms_download_task_log
    ADD CONSTRAINT fk_tms_download_task_log_on_task FOREIGN KEY (task_id) REFERENCES public.tms_download_task(id);


--
-- TOC entry 2003 (class 2606 OID 115955)
-- Name: tms_download_task_log fk_tms_download_task_log_on_terminal; Type: FK CONSTRAINT; Schema: public; Owner: utms
--

ALTER TABLE ONLY public.tms_download_task_log
    ADD CONSTRAINT fk_tms_download_task_log_on_terminal FOREIGN KEY (terminal_id) REFERENCES public.tms_terminal(id);


--
-- TOC entry 1989 (class 2606 OID 115725)
-- Name: tms_merchant fk_tms_merchant_on_district; Type: FK CONSTRAINT; Schema: public; Owner: utms
--

ALTER TABLE ONLY public.tms_merchant
    ADD CONSTRAINT fk_tms_merchant_on_district FOREIGN KEY (district_id) REFERENCES public.tms_district(id);


--
-- TOC entry 1990 (class 2606 OID 115730)
-- Name: tms_merchant fk_tms_merchant_on_type; Type: FK CONSTRAINT; Schema: public; Owner: utms
--

ALTER TABLE ONLY public.tms_merchant
    ADD CONSTRAINT fk_tms_merchant_on_type FOREIGN KEY (type_id) REFERENCES public.tms_merchant_type(id);


--
-- TOC entry 1986 (class 2606 OID 115687)
-- Name: tms_states fk_tms_states_on_country; Type: FK CONSTRAINT; Schema: public; Owner: utms
--

ALTER TABLE ONLY public.tms_states
    ADD CONSTRAINT fk_tms_states_on_country FOREIGN KEY (country_id) REFERENCES public.tms_country(id);


--
-- TOC entry 1993 (class 2606 OID 115770)
-- Name: tms_terminal fk_tms_terminal_on_merchant; Type: FK CONSTRAINT; Schema: public; Owner: utms
--

ALTER TABLE ONLY public.tms_terminal
    ADD CONSTRAINT fk_tms_terminal_on_merchant FOREIGN KEY (merchant_id) REFERENCES public.tms_merchant(id);


--
-- TOC entry 1994 (class 2606 OID 115775)
-- Name: tms_terminal fk_tms_terminal_on_model; Type: FK CONSTRAINT; Schema: public; Owner: utms
--

ALTER TABLE ONLY public.tms_terminal
    ADD CONSTRAINT fk_tms_terminal_on_model FOREIGN KEY (model_id) REFERENCES public.tms_device_model(id);


--
-- TOC entry 1995 (class 2606 OID 115780)
-- Name: tms_terminal fk_tms_terminal_on_profile; Type: FK CONSTRAINT; Schema: public; Owner: utms
--

ALTER TABLE ONLY public.tms_terminal
    ADD CONSTRAINT fk_tms_terminal_on_profile FOREIGN KEY (profile_id) REFERENCES public.tms_device_profile(id);


--
-- TOC entry 2008 (class 2606 OID 116032)
-- Name: tms_delete_task_app tms_delete_task_app_fk; Type: FK CONSTRAINT; Schema: public; Owner: utms
--

ALTER TABLE ONLY public.tms_delete_task_app
    ADD CONSTRAINT tms_delete_task_app_fk FOREIGN KEY (task_id) REFERENCES public.tms_delete_task(id);


--
-- TOC entry 2012 (class 2606 OID 116037)
-- Name: tms_delete_task_log tms_delete_task_log_fk; Type: FK CONSTRAINT; Schema: public; Owner: utms
--

ALTER TABLE ONLY public.tms_delete_task_log
    ADD CONSTRAINT tms_delete_task_log_fk FOREIGN KEY (app_id) REFERENCES public.tms_delete_task_app(id);


--
-- TOC entry 1992 (class 2606 OID 115799)
-- Name: tms_device_profile tms_device_profile_fk; Type: FK CONSTRAINT; Schema: public; Owner: utms
--

ALTER TABLE ONLY public.tms_device_profile
    ADD CONSTRAINT tms_device_profile_fk FOREIGN KEY (tenant_id) REFERENCES public.tms_tenant(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 1991 (class 2606 OID 115735)
-- Name: tms_merchant tms_merchant_fk; Type: FK CONSTRAINT; Schema: public; Owner: utms
--

ALTER TABLE ONLY public.tms_merchant
    ADD CONSTRAINT tms_merchant_fk FOREIGN KEY (tenant_id) REFERENCES public.tms_tenant(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 1985 (class 2606 OID 115663)
-- Name: tms_tenant tms_tenant_fk; Type: FK CONSTRAINT; Schema: public; Owner: utms
--

ALTER TABLE ONLY public.tms_tenant
    ADD CONSTRAINT tms_tenant_fk FOREIGN KEY (super_tenant_id) REFERENCES public.tms_tenant(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 1996 (class 2606 OID 115785)
-- Name: tms_terminal tms_terminal_fk; Type: FK CONSTRAINT; Schema: public; Owner: utms
--

ALTER TABLE ONLY public.tms_terminal
    ADD CONSTRAINT tms_terminal_fk FOREIGN KEY (tenant_id) REFERENCES public.tms_tenant(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2154 (class 0 OID 0)
-- Dependencies: 6
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- TOC entry 2155 (class 0 OID 0)
-- Dependencies: 181
-- Name: TABLE tms_application; Type: ACL; Schema: public; Owner: utms
--

REVOKE ALL ON TABLE public.tms_application FROM PUBLIC;
REVOKE ALL ON TABLE public.tms_application FROM utms;
GRANT ALL ON TABLE public.tms_application TO utms;


--
-- TOC entry 2156 (class 0 OID 0)
-- Dependencies: 173
-- Name: TABLE tms_city; Type: ACL; Schema: public; Owner: utms
--

REVOKE ALL ON TABLE public.tms_city FROM PUBLIC;
REVOKE ALL ON TABLE public.tms_city FROM utms;
GRANT ALL ON TABLE public.tms_city TO utms;


--
-- TOC entry 2157 (class 0 OID 0)
-- Dependencies: 171
-- Name: TABLE tms_country; Type: ACL; Schema: public; Owner: utms
--

REVOKE ALL ON TABLE public.tms_country FROM PUBLIC;
REVOKE ALL ON TABLE public.tms_country FROM utms;
GRANT ALL ON TABLE public.tms_country TO utms;


--
-- TOC entry 2158 (class 0 OID 0)
-- Dependencies: 188
-- Name: TABLE tms_delete_task; Type: ACL; Schema: public; Owner: utms
--

REVOKE ALL ON TABLE public.tms_delete_task FROM PUBLIC;
REVOKE ALL ON TABLE public.tms_delete_task FROM utms;
GRANT ALL ON TABLE public.tms_delete_task TO utms;


--
-- TOC entry 2159 (class 0 OID 0)
-- Dependencies: 187
-- Name: TABLE tms_delete_task_app; Type: ACL; Schema: public; Owner: utms
--

REVOKE ALL ON TABLE public.tms_delete_task_app FROM PUBLIC;
REVOKE ALL ON TABLE public.tms_delete_task_app FROM utms;
GRANT ALL ON TABLE public.tms_delete_task_app TO utms;


--
-- TOC entry 2160 (class 0 OID 0)
-- Dependencies: 189
-- Name: TABLE tms_delete_task_log; Type: ACL; Schema: public; Owner: utms
--

REVOKE ALL ON TABLE public.tms_delete_task_log FROM PUBLIC;
REVOKE ALL ON TABLE public.tms_delete_task_log FROM utms;
GRANT ALL ON TABLE public.tms_delete_task_log TO utms;


--
-- TOC entry 2161 (class 0 OID 0)
-- Dependencies: 190
-- Name: TABLE tms_delete_task_terminal_group_link; Type: ACL; Schema: public; Owner: utms
--

REVOKE ALL ON TABLE public.tms_delete_task_terminal_group_link FROM PUBLIC;
REVOKE ALL ON TABLE public.tms_delete_task_terminal_group_link FROM utms;
GRANT ALL ON TABLE public.tms_delete_task_terminal_group_link TO utms;


--
-- TOC entry 2162 (class 0 OID 0)
-- Dependencies: 191
-- Name: TABLE tms_delete_task_terminal_link; Type: ACL; Schema: public; Owner: utms
--

REVOKE ALL ON TABLE public.tms_delete_task_terminal_link FROM PUBLIC;
REVOKE ALL ON TABLE public.tms_delete_task_terminal_link FROM utms;
GRANT ALL ON TABLE public.tms_delete_task_terminal_link TO utms;


--
-- TOC entry 2163 (class 0 OID 0)
-- Dependencies: 176
-- Name: TABLE tms_device_model; Type: ACL; Schema: public; Owner: utms
--

REVOKE ALL ON TABLE public.tms_device_model FROM PUBLIC;
REVOKE ALL ON TABLE public.tms_device_model FROM utms;
GRANT ALL ON TABLE public.tms_device_model TO utms;


--
-- TOC entry 2164 (class 0 OID 0)
-- Dependencies: 177
-- Name: TABLE tms_device_profile; Type: ACL; Schema: public; Owner: utms
--

REVOKE ALL ON TABLE public.tms_device_profile FROM PUBLIC;
REVOKE ALL ON TABLE public.tms_device_profile FROM utms;
GRANT ALL ON TABLE public.tms_device_profile TO utms;


--
-- TOC entry 2165 (class 0 OID 0)
-- Dependencies: 193
-- Name: TABLE tms_diagnostic_info; Type: ACL; Schema: public; Owner: utms
--

REVOKE ALL ON TABLE public.tms_diagnostic_info FROM PUBLIC;
REVOKE ALL ON TABLE public.tms_diagnostic_info FROM utms;
GRANT ALL ON TABLE public.tms_diagnostic_info TO utms;


--
-- TOC entry 2166 (class 0 OID 0)
-- Dependencies: 174
-- Name: TABLE tms_district; Type: ACL; Schema: public; Owner: utms
--

REVOKE ALL ON TABLE public.tms_district FROM PUBLIC;
REVOKE ALL ON TABLE public.tms_district FROM utms;
GRANT ALL ON TABLE public.tms_district TO utms;


--
-- TOC entry 2167 (class 0 OID 0)
-- Dependencies: 182
-- Name: TABLE tms_download_task; Type: ACL; Schema: public; Owner: utms
--

REVOKE ALL ON TABLE public.tms_download_task FROM PUBLIC;
REVOKE ALL ON TABLE public.tms_download_task FROM utms;
GRANT ALL ON TABLE public.tms_download_task TO utms;


--
-- TOC entry 2168 (class 0 OID 0)
-- Dependencies: 183
-- Name: TABLE tms_download_task_application_link; Type: ACL; Schema: public; Owner: utms
--

REVOKE ALL ON TABLE public.tms_download_task_application_link FROM PUBLIC;
REVOKE ALL ON TABLE public.tms_download_task_application_link FROM utms;
GRANT ALL ON TABLE public.tms_download_task_application_link TO utms;


--
-- TOC entry 2169 (class 0 OID 0)
-- Dependencies: 184
-- Name: TABLE tms_download_task_log; Type: ACL; Schema: public; Owner: utms
--

REVOKE ALL ON TABLE public.tms_download_task_log FROM PUBLIC;
REVOKE ALL ON TABLE public.tms_download_task_log FROM utms;
GRANT ALL ON TABLE public.tms_download_task_log TO utms;


--
-- TOC entry 2170 (class 0 OID 0)
-- Dependencies: 185
-- Name: TABLE tms_download_task_terminal_group_link; Type: ACL; Schema: public; Owner: utms
--

REVOKE ALL ON TABLE public.tms_download_task_terminal_group_link FROM PUBLIC;
REVOKE ALL ON TABLE public.tms_download_task_terminal_group_link FROM utms;
GRANT ALL ON TABLE public.tms_download_task_terminal_group_link TO utms;


--
-- TOC entry 2171 (class 0 OID 0)
-- Dependencies: 186
-- Name: TABLE tms_download_task_terminal_link; Type: ACL; Schema: public; Owner: utms
--

REVOKE ALL ON TABLE public.tms_download_task_terminal_link FROM PUBLIC;
REVOKE ALL ON TABLE public.tms_download_task_terminal_link FROM utms;
GRANT ALL ON TABLE public.tms_download_task_terminal_link TO utms;


--
-- TOC entry 2172 (class 0 OID 0)
-- Dependencies: 192
-- Name: TABLE tms_heart_beat; Type: ACL; Schema: public; Owner: utms
--

REVOKE ALL ON TABLE public.tms_heart_beat FROM PUBLIC;
REVOKE ALL ON TABLE public.tms_heart_beat FROM utms;
GRANT ALL ON TABLE public.tms_heart_beat TO utms;


--
-- TOC entry 2173 (class 0 OID 0)
-- Dependencies: 175
-- Name: TABLE tms_merchant; Type: ACL; Schema: public; Owner: utms
--

REVOKE ALL ON TABLE public.tms_merchant FROM PUBLIC;
REVOKE ALL ON TABLE public.tms_merchant FROM utms;
GRANT ALL ON TABLE public.tms_merchant TO utms;


--
-- TOC entry 2174 (class 0 OID 0)
-- Dependencies: 170
-- Name: TABLE tms_merchant_type; Type: ACL; Schema: public; Owner: utms
--

REVOKE ALL ON TABLE public.tms_merchant_type FROM PUBLIC;
REVOKE ALL ON TABLE public.tms_merchant_type FROM utms;
GRANT ALL ON TABLE public.tms_merchant_type TO utms;


--
-- TOC entry 2175 (class 0 OID 0)
-- Dependencies: 172
-- Name: TABLE tms_states; Type: ACL; Schema: public; Owner: utms
--

REVOKE ALL ON TABLE public.tms_states FROM PUBLIC;
REVOKE ALL ON TABLE public.tms_states FROM utms;
GRANT ALL ON TABLE public.tms_states TO utms;


--
-- TOC entry 2176 (class 0 OID 0)
-- Dependencies: 169
-- Name: TABLE tms_tenant; Type: ACL; Schema: public; Owner: utms
--

REVOKE ALL ON TABLE public.tms_tenant FROM PUBLIC;
REVOKE ALL ON TABLE public.tms_tenant FROM utms;
GRANT ALL ON TABLE public.tms_tenant TO utms;


--
-- TOC entry 2177 (class 0 OID 0)
-- Dependencies: 178
-- Name: TABLE tms_terminal; Type: ACL; Schema: public; Owner: utms
--

REVOKE ALL ON TABLE public.tms_terminal FROM PUBLIC;
REVOKE ALL ON TABLE public.tms_terminal FROM utms;
GRANT ALL ON TABLE public.tms_terminal TO utms;


--
-- TOC entry 2178 (class 0 OID 0)
-- Dependencies: 179
-- Name: TABLE tms_terminal_group; Type: ACL; Schema: public; Owner: utms
--

REVOKE ALL ON TABLE public.tms_terminal_group FROM PUBLIC;
REVOKE ALL ON TABLE public.tms_terminal_group FROM utms;
GRANT ALL ON TABLE public.tms_terminal_group TO utms;


--
-- TOC entry 2179 (class 0 OID 0)
-- Dependencies: 180
-- Name: TABLE tms_terminal_group_link; Type: ACL; Schema: public; Owner: utms
--

REVOKE ALL ON TABLE public.tms_terminal_group_link FROM PUBLIC;
REVOKE ALL ON TABLE public.tms_terminal_group_link FROM utms;
GRANT ALL ON TABLE public.tms_terminal_group_link TO utms;


-- Completed on 2023-07-07 02:11:37

--
-- PostgreSQL database dump complete
--

