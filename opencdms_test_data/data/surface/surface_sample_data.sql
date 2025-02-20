DROP SCHEMA IF EXISTS surface CASCADE;
CREATE SCHEMA IF NOT EXISTS surface;

CREATE TABLE IF NOT EXISTS surface.wx_variable
(
    id bigint NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    variable_type character varying(40),
    symbol character varying(8),
    name character varying(40),
    "precision" integer,
    scale integer,
    color character varying(18),
    range_min double precision,
    range_max double precision,
    default_representation character varying(60),
    code_table_id bigint,
    measurement_variable_id bigint,
    sampling_operation_id bigint,
    unit_id bigint,
    persistence double precision,
    persistence_hourly double precision,
    range_max_hourly double precision,
    range_min_hourly double precision,
    step double precision,
    step_hourly double precision,
    persistence_window integer,
    persistence_window_hourly integer,
    CONSTRAINT wx_variable_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS surface.wx_unit
(
    id bigint NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    symbol character varying(16),
    name character varying(256),
    CONSTRAINT wx_unit_pkey PRIMARY KEY (id),
    CONSTRAINT wx_unit_name_key UNIQUE (name),
    CONSTRAINT wx_unit_symbol_key UNIQUE (symbol)
);


CREATE TABLE IF NOT EXISTS surface.wx_station
(
    id bigint NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    name character varying(256),
    alias_name character varying(256),
    begin_date timestamp with time zone,
    end_date timestamp with time zone,
    longitude double precision NOT NULL,
    latitude double precision NOT NULL,
    elevation double precision,
    code character varying(64),
    wmo integer,
    wigos character varying(64),
    is_active boolean NOT NULL,
    is_automatic boolean NOT NULL,
    organization character varying(256),
    observer character varying(256),
    watershed character varying(256),
    z double precision,
    datum character varying(256),
    zone character varying(256),
    ground_water_province character varying(256),
    river_code integer,
    river_course character varying(64),
    catchment_area_station character varying(256),
    river_origin character varying(256),
    easting double precision,
    northing double precision,
    river_outlet character varying(256),
    river_length integer,
    local_land_use character varying(256),
    soil_type character varying(64),
    site_description character varying(256),
    land_surface_elevation double precision,
    screen_length double precision,
    top_casing_land_surface double precision,
    depth_midpoint double precision,
    screen_size double precision,
    casing_type character varying(256),
    casing_diameter double precision,
    existing_gauges character varying(256),
    flow_direction_at_station character varying(256),
    flow_direction_above_station character varying(256),
    flow_direction_below_station character varying(256),
    bank_full_stage character varying(256),
    bridge_level character varying(256),
    access_point character varying(256),
    temporary_benchmark character varying(256),
    mean_sea_level character varying(256),
    data_type character varying(256),
    frequency_observation character varying(256),
    historic_events character varying(256),
    other_information character varying(256),
    hydrology_station_type character varying(64),
    is_surface boolean NOT NULL,
    station_details character varying(256),
    remarks character varying(256),
    region character varying(256),
    utc_offset_minutes integer NOT NULL,
    alternative_names character varying(256),
    wmo_station_plataform character varying(256),
    operation_status boolean NOT NULL,
    communication_type_id bigint,
    data_source_id bigint,
    profile_id bigint,
    wmo_program_id bigint,
    wmo_region_id bigint,
    wmo_station_type_id bigint,
    relocation_date timestamp with time zone,
    network character varying(256),
    reference_station_id bigint,
    country_id bigint,
    CONSTRAINT wx_station_pkey PRIMARY KEY (id),
    CONSTRAINT wx_station_data_source_id_code_655b55f3_uniq UNIQUE (data_source_id, code)
);


CREATE TABLE IF NOT EXISTS surface.raw_data
(
    created_at timestamp with time zone NOT NULL DEFAULT now(),
    updated_at timestamp with time zone NOT NULL DEFAULT now(),
    datetime timestamp with time zone NOT NULL,
    measured double precision NOT NULL,
    consisted double precision,
    qc_range_description character varying(256),
    qc_step_description character varying(256),
    qc_persist_description character varying(256),
    manual_flag integer,
    qc_persist_quality_flag integer,
    qc_range_quality_flag integer,
    qc_step_quality_flag integer,
    quality_flag integer NOT NULL,
    station_id integer NOT NULL,
    variable_id integer NOT NULL,
    observation_flag_id integer,
    is_daily boolean NOT NULL DEFAULT false,
    remarks character varying(150),
    observer character varying(150),
    code character varying(60),
    ml_flag integer DEFAULT 1
);

\COPY surface.wx_station FROM './wx_station.csv' WITH CSV HEADER DELIMITER AS '|' NULL as 'NA';
\COPY surface.wx_unit FROM 'wx_unit.csv' WITH CSV HEADER DELIMITER AS '|' NULL as 'NA';
\COPY surface.wx_variable FROM 'wx_variable.csv' WITH CSV HEADER DELIMITER AS '|' NULL as 'NA';
\COPY surface.raw_data FROM 'raw_data.csv' WITH CSV HEADER DELIMITER AS '|' NULL as 'NA';
