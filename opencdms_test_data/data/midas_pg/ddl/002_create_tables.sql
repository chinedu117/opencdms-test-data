-- public.equipment definition

-- Drop table

-- DROP TABLE public.equipment;

CREATE TABLE public.equipment (
	equipment_id numeric(6) NOT NULL,
	equipment_type_id numeric(6) NOT NULL,
	manufacturer_name varchar(28) NOT NULL,
	manufacturer_sn_txt varchar(24) NOT NULL,
	met_ref_txt varchar(24) NULL,
	eqpt_prct_date timestamp NULL,
	equipment_cost numeric(6, 2) NULL,
	eqpt_dspl_date timestamp NULL,
	eqpt_dspl_rmrk varchar(200) NULL,
	eqpt_last_updated_date timestamp NULL,
	CONSTRAINT equipment_pkey PRIMARY KEY (equipment_id)
);


-- public.reporting_schedule definition

-- Drop table

-- DROP TABLE public.reporting_schedule;

CREATE TABLE public.reporting_schedule (
	report_schedule_id numeric(6) NOT NULL,
	id varchar(8) NULL,
	id_type varchar(4) NOT NULL,
	met_domain_name varchar(8) NOT NULL,
	src_cap_bgn_date timestamp NOT NULL,
	rpt_schd_bgn_date timestamp NOT NULL,
	rpt_schd_end_date timestamp NOT NULL,
	year_date_bgn bpchar(5) NOT NULL,
	year_date_end bpchar(5) NOT NULL,
	week_day_bgn numeric(1) NOT NULL,
	week_day_end numeric(1) NOT NULL,
	time_of_day_bgn numeric(4) NOT NULL,
	time_of_day_end numeric(4) NOT NULL,
	reporting_interval numeric(4) NOT NULL,
	reporting_method varchar(9) NOT NULL,
	public_holiday_flag bpchar(1) NOT NULL,
	rpt_schd_rmrk varchar(200) NULL,
	CONSTRAINT reporting_schedule_pkey PRIMARY KEY (report_schedule_id)
);
CREATE UNIQUE INDEX c_rps_unq ON public.reporting_schedule USING btree (id, id_type, met_domain_name, src_cap_bgn_date, rpt_schd_bgn_date, rpt_schd_end_date, year_date_bgn, year_date_end, week_day_bgn, week_day_end, time_of_day_bgn, time_of_day_end, reporting_interval, reporting_method, public_holiday_flag);


-- public."source" definition

-- Drop table

-- DROP TABLE public."source";

CREATE TABLE public."source" (
	src_id numeric(6) NOT NULL,
	src_name varchar(40) NOT NULL,
	high_prcn_lat numeric(7, 5) NOT NULL,
	high_prcn_lon numeric(8, 5) NOT NULL,
	loc_geog_area_id varchar(4) NOT NULL,
	rec_st_ind numeric(4) NOT NULL,
	src_bgn_date timestamp NULL,
	src_type varchar(15) NULL,
	grid_ref_type grid_ref_type_enum NOT NULL DEFAULT 'XX'::grid_ref_type_enum,
	east_grid_ref numeric(6) NULL,
	north_grid_ref numeric(7) NULL,
	hydr_area_id numeric(4) NULL,
	post_code varchar(9) NULL,
	src_end_date timestamp NULL,
	elevation numeric(6, 2) NULL,
	wmo_region_code bpchar(1) NULL,
	parent_src_id numeric(6) NULL,
	zone_time numeric(2) NULL,
	drainage_stream_id varchar(4) NULL,
	src_upd_date timestamp NULL,
	mtce_ctre_code varchar(4) NULL,
	place_id numeric(6) NULL DEFAULT NULL::numeric,
	lat_wgs84 numeric(7, 5) NULL,
	lon_wgs84 numeric(8, 5) NULL,
	src_guid uuid NULL DEFAULT gen_random_uuid(),
	src_geom json NULL,
	src_location_type varchar(50) NULL,
	CONSTRAINT source_check CHECK ((src_end_date >= src_bgn_date)),
	CONSTRAINT source_check1 CHECK ((src_end_date >= src_bgn_date)),
	CONSTRAINT source_check2 CHECK ((src_id <> parent_src_id)),
	CONSTRAINT source_check3 CHECK ((src_id <> parent_src_id)),
	CONSTRAINT source_east_grid_ref_check CHECK ((east_grid_ref >= (0)::numeric)),
	CONSTRAINT source_high_prcn_lat_check CHECK (((high_prcn_lat >= '-90.000'::numeric) AND (high_prcn_lat <= 90.000))),
	CONSTRAINT source_high_prcn_lon_check CHECK (((high_prcn_lon >= '-179.999'::numeric) AND (high_prcn_lon <= 180.000))),
	CONSTRAINT source_north_grid_ref_check CHECK ((north_grid_ref >= (0)::numeric)),
	CONSTRAINT source_parent_src_id_check CHECK ((parent_src_id >= (0)::numeric)),
	CONSTRAINT source_pkey PRIMARY KEY (src_id),
	CONSTRAINT source_rec_st_ind_check CHECK ((rec_st_ind >= (1001)::numeric)),
	CONSTRAINT source_src_bgn_date_check CHECK (((src_bgn_date >= to_date('01011677'::text, 'DDMMYYYY'::text)) AND (src_bgn_date <= to_date('31123999'::text, 'DDMMYYYY'::text)))),
	CONSTRAINT source_src_end_date_check CHECK (((src_end_date >= to_date('01011677'::text, 'DDMMYYYY'::text)) AND (src_end_date <= to_date('31123999'::text, 'DDMMYYYY'::text)))),
	CONSTRAINT source_src_guid_key UNIQUE (src_guid),
	CONSTRAINT source_src_id_check CHECK ((src_id >= (0)::numeric)),
	CONSTRAINT source_src_type_check CHECK (((src_type)::text = ANY ((ARRAY['SFC'::character varying, 'SFC UA'::character varying, 'SFC ANEMO'::character varying, 'SFC AWS'::character varying, 'SFC BUOY'::character varying, 'SFC LV'::character varying, 'SFC OCEAN'::character varying, 'SFC OWS'::character varying, 'SFC PLAT'::character varying, 'SFC RIG'::character varying, 'SFC SAMOS'::character varying, 'SFC SIESAWS'::character varying, 'BOGUS1'::character varying, 'BOGUS2'::character varying, 'UA'::character varying])::text[]))),
	CONSTRAINT source_src_upd_date_check CHECK (((src_upd_date >= to_date('01011677'::text, 'DDMMYYYY'::text)) AND (src_upd_date <= to_date('31123999'::text, 'DDMMYYYY'::text)))),
	CONSTRAINT source_wmo_region_code_check CHECK (((wmo_region_code >= '1'::bpchar) AND (wmo_region_code <= '7'::bpchar))),
	CONSTRAINT source_zone_time_check CHECK (((zone_time >= ('-12'::integer)::numeric) AND (zone_time <= (12)::numeric)))
);


-- public.station_report_element definition

-- Drop table

-- DROP TABLE public.station_report_element;

CREATE TABLE public.station_report_element (
	stn_rpt_elem_id numeric(6) NOT NULL,
	id varchar(8) NULL,
	id_type varchar(4) NOT NULL,
	src_cap_bgn_date timestamp NOT NULL,
	met_domain_name varchar(8) NOT NULL,
	met_element_id numeric(5) NOT NULL,
	rpt_elem_bgn_date timestamp NOT NULL,
	rpt_elem_end_date timestamp NOT NULL,
	CONSTRAINT station_report_element_pkey PRIMARY KEY (stn_rpt_elem_id)
);


-- public.deployment definition

-- Drop table

-- DROP TABLE public.deployment;

CREATE TABLE public.deployment (
	deployment_id numeric(6) NOT NULL,
	src_id numeric(6) NOT NULL,
	id varchar(8) NULL,
	id_type varchar(4) NOT NULL,
	equipment_id numeric(6) NULL,
	equipment_type_id numeric(6) NOT NULL,
	met_office_eqpt_flag bpchar(1) NOT NULL,
	ob_sys_name varchar(12) NULL,
	met_role_id numeric(3) NULL,
	depl_bgn_date timestamp NOT NULL,
	depl_end_date timestamp NOT NULL,
	grid_ref_type varchar(4) NULL,
	east_grid_ref numeric(6) NULL,
	north_grid_ref numeric(7) NULL,
	high_prcn_lat numeric(7, 5) NULL,
	high_prcn_lon numeric(8, 5) NULL,
	elevation numeric(6, 2) NULL,
	deployment_remark varchar(250) NULL,
	lat_wgs84 numeric(7, 5) NULL,
	lon_wgs84 numeric(8, 5) NULL,
	ipr_owner varchar(12) NULL,
	egm96_elevation numeric(6, 2) NULL,
	CONSTRAINT deployment_high_prcn_lat_check CHECK (((high_prcn_lat >= '-90.000'::numeric) AND (high_prcn_lat <= 90.000))),
	CONSTRAINT deployment_high_prcn_lon_check CHECK (((high_prcn_lon >= '-179.999'::numeric) AND (high_prcn_lon <= 180.000))),
	CONSTRAINT deployment_pkey PRIMARY KEY (deployment_id),
	CONSTRAINT deployment_src_id_check CHECK ((src_id >= (0)::numeric)),
	CONSTRAINT deployment_equipment_id_fkey FOREIGN KEY (equipment_id) REFERENCES public.equipment(equipment_id),
	CONSTRAINT deployment_src_id_fkey FOREIGN KEY (src_id) REFERENCES public."source"(src_id)
);
CREATE INDEX ix_deployment_equipment_id ON public.deployment USING btree (equipment_id);
CREATE INDEX ix_deployment_equipment_type_id ON public.deployment USING btree (equipment_type_id);
CREATE INDEX ix_deployment_met_role_id ON public.deployment USING btree (met_role_id);
CREATE INDEX ix_deployment_ob_sys_name ON public.deployment USING btree (ob_sys_name);
CREATE INDEX ix_deployment_src_id ON public.deployment USING btree (src_id);
CREATE INDEX pkd_id ON public.deployment USING btree (id, id_type);


-- public.deployment_detail definition

-- Drop table

-- DROP TABLE public.deployment_detail;

CREATE TABLE public.deployment_detail (
	depl_attr_id numeric(6) NOT NULL,
	deployment_id numeric(6) NOT NULL,
	depl_attr_bgn_date timestamp NOT NULL,
	depl_dtl_val numeric(4) NOT NULL,
	depl_attr_end_date timestamp NOT NULL,
	CONSTRAINT deployment_detail_pkey PRIMARY KEY (depl_attr_id, deployment_id, depl_attr_bgn_date),
	CONSTRAINT deployment_detail_deployment_id_fkey FOREIGN KEY (deployment_id) REFERENCES public.deployment(deployment_id)
);
CREATE INDEX ix_deployment_detail_depl_attr_id ON public.deployment_detail USING btree (depl_attr_id);
CREATE INDEX ix_deployment_detail_deployment_id ON public.deployment_detail USING btree (deployment_id);


-- public.equipment_calibration definition

-- Drop table

-- DROP TABLE public.equipment_calibration;

CREATE TABLE public.equipment_calibration (
	eqpt_calib_id numeric(6) NOT NULL,
	equipment_id numeric(6) NOT NULL,
	eqpt_calib_date timestamp NOT NULL,
	calib_mthd_code varchar(4) NOT NULL,
	eqpt_calib_next_due_date timestamp NULL,
	eqpt_calib_name varchar(28) NULL,
	check_equipment_id numeric(6) NULL,
	eqpt_calib_rmrk varchar(200) NULL,
	CONSTRAINT equipment_calibration_pkey PRIMARY KEY (eqpt_calib_id),
	CONSTRAINT equipment_calibration_check_equipment_id_fkey FOREIGN KEY (check_equipment_id) REFERENCES public.equipment(equipment_id),
	CONSTRAINT equipment_calibration_equipment_id_fkey FOREIGN KEY (equipment_id) REFERENCES public.equipment(equipment_id)
);
CREATE INDEX ix_equipment_calibration_check_equipment_id ON public.equipment_calibration USING btree (check_equipment_id);
CREATE INDEX ix_equipment_calibration_equipment_id ON public.equipment_calibration USING btree (equipment_id);


-- public.inspection definition

-- Drop table

-- DROP TABLE public.inspection;

CREATE TABLE public.inspection (
	inspection_id numeric(6) NOT NULL,
	src_id numeric(6) NOT NULL,
	inspection_date timestamp NOT NULL,
	inspectors_name varchar(70) NOT NULL,
	review_date timestamp NULL,
	inspection_remark varchar(700) NULL,
	CONSTRAINT inspection_pkey PRIMARY KEY (inspection_id),
	CONSTRAINT inspection_src_id_check CHECK ((src_id >= (0)::numeric)),
	CONSTRAINT inspection_src_id_fkey FOREIGN KEY (src_id) REFERENCES public."source"(src_id)
);
CREATE INDEX ix_inspection_src_id ON public.inspection USING btree (src_id);


-- public.inspection_detail definition

-- Drop table

-- DROP TABLE public.inspection_detail;

CREATE TABLE public.inspection_detail (
	insp_detl_id numeric(8) NOT NULL,
	inspection_item_id numeric(5) NOT NULL,
	insp_detl_rslt_txt varchar(1000) NOT NULL,
	deployment_id numeric(6) NULL,
	inspection_id numeric(6) NOT NULL,
	CONSTRAINT inspection_detail_pkey PRIMARY KEY (insp_detl_id),
	CONSTRAINT inspection_detail_deployment_id_fkey FOREIGN KEY (deployment_id) REFERENCES public.deployment(deployment_id),
	CONSTRAINT inspection_detail_inspection_id_fkey FOREIGN KEY (inspection_id) REFERENCES public.inspection(inspection_id)
);


-- public.observing_schedule definition

-- Drop table

-- DROP TABLE public.observing_schedule;

CREATE TABLE public.observing_schedule (
	ob_schd_id numeric(6) NOT NULL,
	stn_rpt_elem_id numeric(6) NOT NULL,
	ob_schd_bgn_date timestamp NOT NULL,
	ob_schd_end_date timestamp NOT NULL,
	year_date_bgn bpchar(5) NOT NULL,
	year_date_end bpchar(5) NOT NULL,
	week_day_bgn numeric(1) NOT NULL,
	week_day_end numeric(1) NOT NULL,
	time_of_day_bgn numeric(4) NOT NULL,
	time_of_day_end numeric(4) NOT NULL,
	observing_interval numeric(4) NOT NULL,
	public_holiday_flag bpchar(1) NOT NULL,
	ob_schd_rmrk varchar(200) NULL,
	CONSTRAINT observing_schedule_pkey PRIMARY KEY (ob_schd_id),
	CONSTRAINT observing_schedule_stn_rpt_elem_id_fkey FOREIGN KEY (stn_rpt_elem_id) REFERENCES public.station_report_element(stn_rpt_elem_id) ON DELETE CASCADE
);
CREATE UNIQUE INDEX c_obs_unq ON public.observing_schedule USING btree (stn_rpt_elem_id, ob_schd_bgn_date, ob_schd_end_date, year_date_bgn, year_date_end, week_day_bgn, week_day_end, time_of_day_bgn, time_of_day_end, observing_interval, public_holiday_flag);


-- public.observing_system_installation definition

-- Drop table

-- DROP TABLE public.observing_system_installation;

CREATE TABLE public.observing_system_installation (
	ob_sys_intl_id numeric(6) NOT NULL,
	ob_sys_vrsn_id numeric(6) NOT NULL,
	src_id numeric(6) NOT NULL,
	ob_sys_intl_bgn_date timestamp NOT NULL,
	ob_sys_intl_end_date timestamp NOT NULL,
	CONSTRAINT observing_system_installation_pkey PRIMARY KEY (ob_sys_intl_id),
	CONSTRAINT observing_system_installation_src_id_check CHECK ((src_id >= (0)::numeric)),
	CONSTRAINT observing_system_installation_src_id_fkey FOREIGN KEY (src_id) REFERENCES public."source"(src_id)
);
CREATE INDEX ix_observing_system_installation_ob_sys_vrsn_id ON public.observing_system_installation USING btree (ob_sys_vrsn_id);
CREATE INDEX ix_observing_system_installation_src_id ON public.observing_system_installation USING btree (src_id);


-- public.src_capability definition

-- Drop table

-- DROP TABLE public.src_capability;

CREATE TABLE public.src_capability (
	id varchar(8) NOT NULL,
	id_type varchar(4) NOT NULL,
	met_domain_name varchar(8) NOT NULL,
	src_cap_bgn_date timestamp NOT NULL,
	src_id numeric(6) NOT NULL,
	rec_st_ind numeric(4) NOT NULL,
	"prime_capability_flag" prime_capability_flag_enum NOT NULL DEFAULT 'F'::prime_capability_flag_enum,
	src_cap_end_date timestamp NULL,
	first_online_ob_yr numeric(4) NULL,
	db_segment_name varchar(12) NULL,
	rcpt_method_name varchar(20) NULL,
	data_retention_period numeric(3) NULL,
	comm_mthd_id numeric(6) NULL,
	CONSTRAINT src_capability_check CHECK ((src_cap_end_date >= src_cap_bgn_date)),
	CONSTRAINT src_capability_check1 CHECK ((src_cap_end_date >= src_cap_bgn_date)),
	CONSTRAINT src_capability_data_retention_period_check CHECK ((data_retention_period >= (0)::numeric)),
	CONSTRAINT src_capability_first_online_ob_yr_check CHECK (((first_online_ob_yr >= (1738)::numeric) AND (first_online_ob_yr <= (3999)::numeric))),
	CONSTRAINT src_capability_pkey PRIMARY KEY (id, id_type, met_domain_name, src_cap_bgn_date),
	CONSTRAINT src_capability_rcpt_method_name_check CHECK ((substr((rcpt_method_name)::text, 1, 8) = 'ID XREF '::text)),
	CONSTRAINT src_capability_rec_st_ind_check CHECK ((rec_st_ind >= (1)::numeric)),
	CONSTRAINT src_capability_src_cap_bgn_date_check CHECK (((src_cap_bgn_date >= to_date('16770101'::text, 'YYYYMMDD'::text)) AND (src_cap_bgn_date <= to_date('39991231'::text, 'YYYYMMDD'::text)))),
	CONSTRAINT src_capability_src_cap_end_date_check CHECK (((src_cap_end_date >= to_date('01011677'::text, 'DDMMYYYY'::text)) AND (src_cap_end_date <= to_date('31123999'::text, 'DDMMYYYY'::text)))),
	CONSTRAINT src_capability_src_id_check CHECK ((src_id >= (0)::numeric)),
	CONSTRAINT src_capability_src_id_fkey FOREIGN KEY (src_id) REFERENCES public."source"(src_id)
);
CREATE UNIQUE INDEX c_srccap_end_date ON public.src_capability USING btree (id, id_type, met_domain_name, src_cap_end_date);


-- public.src_capability_nodata definition

-- Drop table

-- DROP TABLE public.src_capability_nodata;

CREATE TABLE public.src_capability_nodata (
	id varchar(8) NOT NULL,
	id_type varchar(4) NOT NULL,
	met_domain_name varchar(8) NOT NULL,
	src_cap_bgn_date timestamp NOT NULL,
	src_id numeric(6) NOT NULL,
	rec_st_ind numeric(4) NOT NULL,
	"prime_capability_flag" prime_capability_flag NOT NULL,
	src_cap_end_date timestamp NULL,
	first_online_ob_yr numeric(4) NULL,
	db_segment_name varchar(12) NULL,
	rcpt_method_name varchar(20) NULL,
	data_retention_period numeric(3) NULL,
	comm_mthd_id numeric(6) NULL,
	CONSTRAINT src_capability_nodata_check CHECK ((src_cap_end_date >= src_cap_bgn_date)),
	CONSTRAINT src_capability_nodata_check1 CHECK ((src_cap_end_date >= src_cap_bgn_date)),
	CONSTRAINT src_capability_nodata_data_retention_period_check CHECK ((data_retention_period >= (0)::numeric)),
	CONSTRAINT src_capability_nodata_first_online_ob_yr_check CHECK (((first_online_ob_yr >= (1738)::numeric) AND (first_online_ob_yr <= (3999)::numeric))),
	CONSTRAINT src_capability_nodata_pkey PRIMARY KEY (id, id_type, met_domain_name, src_cap_bgn_date),
	CONSTRAINT src_capability_nodata_rcpt_method_name_check CHECK ((substr((rcpt_method_name)::text, 1, 8) = 'ID XREF '::text)),
	CONSTRAINT src_capability_nodata_rec_st_ind_check CHECK ((rec_st_ind >= (1)::numeric)),
	CONSTRAINT src_capability_nodata_src_cap_bgn_date_check CHECK (((src_cap_bgn_date >= to_date('16770101'::text, 'YYYYMMDD'::text)) AND (src_cap_bgn_date <= to_date('39991231'::text, 'YYYYMMDD'::text)))),
	CONSTRAINT src_capability_nodata_src_cap_end_date_check CHECK (((src_cap_end_date >= to_date('01011677'::text, 'DDMMYYYY'::text)) AND (src_cap_end_date <= to_date('31123999'::text, 'DDMMYYYY'::text)))),
	CONSTRAINT src_capability_nodata_src_id_fkey FOREIGN KEY (src_id) REFERENCES public."source"(src_id)
);
CREATE UNIQUE INDEX c_scnd_unq ON public.src_capability_nodata USING btree (id, id_type, met_domain_name, src_cap_end_date);


-- public.station_authority_history definition

-- Drop table

-- DROP TABLE public.station_authority_history;

CREATE TABLE public.station_authority_history (
	authority_id numeric(6) NOT NULL,
	src_id numeric(6) NOT NULL,
	stn_auth_bgn_date timestamp NOT NULL,
	stn_auth_end_date timestamp NOT NULL,
	auth_hist_rmrk varchar(200) NULL,
	CONSTRAINT station_authority_history_pkey PRIMARY KEY (authority_id, src_id, stn_auth_bgn_date),
	CONSTRAINT station_authority_history_src_id_check CHECK ((src_id >= (0)::numeric)),
	CONSTRAINT station_authority_history_src_id_fkey FOREIGN KEY (src_id) REFERENCES public."source"(src_id)
);


-- public.station_geography definition

-- Drop table

-- DROP TABLE public.station_geography;

CREATE TABLE public.station_geography (
	src_id numeric(6) NOT NULL,
	geog_upd_date timestamp NOT NULL,
	pr_geog_type_code varchar(8) NOT NULL,
	scdy_geog_type_code varchar(8) NULL,
	site_type_code varchar(20) NOT NULL,
	land_use_type_id numeric(2) NOT NULL,
	grnd_slpe_dsc varchar(20) NULL,
	grnd_slpe_up_dir numeric(3) NULL,
	gradient numeric(3) NULL,
	prc_man_wthn_10m numeric(3) NULL,
	prc_veg_wthn_10m numeric(3) NULL,
	prc_man_wthn_50m numeric(3) NULL,
	prc_veg_wthn_50m numeric(3) NULL,
	soil_type_id numeric(3) NULL,
	prc_heat_src_wthn_30m numeric(3) NULL,
	prc_veg_wthn_30m numeric(3) NULL,
	prc_heat_src_wthn_100m numeric(3) NULL,
	prc_veg_wthn_100m numeric(3) NULL,
	sfc_cover_class_scheme varchar(20) NULL,
	sfc_cover_less_than_100m varchar(20) NULL,
	sfc_cover_100m_3km varchar(20) NULL,
	sfc_cover_3km_100km varchar(20) NULL,
	CONSTRAINT station_geography_pkey PRIMARY KEY (src_id, geog_upd_date),
	CONSTRAINT station_geography_prc_heat_src_wthn_100m_check CHECK (((prc_heat_src_wthn_100m >= (0)::numeric) AND (prc_heat_src_wthn_100m <= (100)::numeric))),
	CONSTRAINT station_geography_prc_heat_src_wthn_30m_check CHECK (((prc_heat_src_wthn_30m >= (0)::numeric) AND (prc_heat_src_wthn_30m <= (100)::numeric))),
	CONSTRAINT station_geography_prc_man_wthn_10m_check CHECK (((prc_man_wthn_10m >= (0)::numeric) AND (prc_man_wthn_10m <= (100)::numeric))),
	CONSTRAINT station_geography_prc_man_wthn_50m_check CHECK (((prc_man_wthn_50m >= (0)::numeric) AND (prc_man_wthn_50m <= (100)::numeric))),
	CONSTRAINT station_geography_prc_veg_wthn_100m_check CHECK (((prc_veg_wthn_100m >= (0)::numeric) AND (prc_veg_wthn_100m <= (100)::numeric))),
	CONSTRAINT station_geography_prc_veg_wthn_10m_check CHECK (((prc_veg_wthn_10m >= (0)::numeric) AND (prc_veg_wthn_10m <= (100)::numeric))),
	CONSTRAINT station_geography_prc_veg_wthn_30m_check CHECK (((prc_veg_wthn_30m >= (0)::numeric) AND (prc_veg_wthn_30m <= (100)::numeric))),
	CONSTRAINT station_geography_prc_veg_wthn_50m_check CHECK (((prc_veg_wthn_50m >= (0)::numeric) AND (prc_veg_wthn_50m <= (100)::numeric))),
	CONSTRAINT station_geography_src_id_check CHECK ((src_id >= (0)::numeric)),
	CONSTRAINT station_geography_src_id_fkey FOREIGN KEY (src_id) REFERENCES public."source"(src_id)
);


-- public.station_history definition

-- Drop table

-- DROP TABLE public.station_history;

CREATE TABLE public.station_history (
	src_id numeric(6) NOT NULL,
	event_date timestamp NOT NULL,
	event_text varchar(150) NOT NULL,
	event_result_text varchar(150) NOT NULL,
	CONSTRAINT station_history_pkey PRIMARY KEY (src_id, event_date),
	CONSTRAINT station_history_src_id_check CHECK ((src_id >= (0)::numeric)),
	CONSTRAINT station_history_src_id_fkey FOREIGN KEY (src_id) REFERENCES public."source"(src_id)
);


-- public.station_inventory_status definition

-- Drop table

-- DROP TABLE public.station_inventory_status;

CREATE TABLE public.station_inventory_status (
	src_id numeric(6) NOT NULL,
	inventory_code bpchar(1) NOT NULL,
	invt_sts_bgn_date timestamp NOT NULL,
	invt_sts_end_date timestamp NOT NULL,
	invt_sts_rmrk varchar(200) NULL,
	CONSTRAINT station_inventory_status_pkey PRIMARY KEY (src_id, inventory_code, invt_sts_bgn_date),
	CONSTRAINT station_inventory_status_src_id_check CHECK ((src_id >= (0)::numeric)),
	CONSTRAINT station_inventory_status_src_id_fkey FOREIGN KEY (src_id) REFERENCES public."source"(src_id)
);
CREATE INDEX ix_station_inventory_status_inventory_code ON public.station_inventory_status USING btree (inventory_code);
CREATE INDEX ix_station_inventory_status_src_id ON public.station_inventory_status USING btree (src_id);


-- public.station_observer definition

-- Drop table

-- DROP TABLE public.station_observer;

CREATE TABLE public.station_observer (
	observer_id numeric(6) NOT NULL,
	src_id numeric(6) NOT NULL,
	stn_obsr_bgn_date timestamp NOT NULL,
	stn_obsr_end_date timestamp NOT NULL,
	observer_role_code bpchar(4) NOT NULL,
	CONSTRAINT station_observer_pkey PRIMARY KEY (observer_id, src_id, stn_obsr_bgn_date),
	CONSTRAINT station_observer_src_id_check CHECK ((src_id >= (0)::numeric)),
	CONSTRAINT station_observer_src_id_fkey FOREIGN KEY (src_id) REFERENCES public."source"(src_id)
);
CREATE INDEX ix_station_observer_observer_id ON public.station_observer USING btree (observer_id);
CREATE INDEX ix_station_observer_observer_role_code ON public.station_observer USING btree (observer_role_code);
CREATE INDEX ix_station_observer_src_id ON public.station_observer USING btree (src_id);


-- public.station_role definition

-- Drop table

-- DROP TABLE public.station_role;

CREATE TABLE public.station_role (
	src_id numeric(6) NOT NULL,
	role_name_code varchar(11) NOT NULL,
	role_bgn_date timestamp NOT NULL,
	role_end_date timestamp NOT NULL,
	CONSTRAINT station_role_pkey PRIMARY KEY (src_id, role_name_code, role_bgn_date),
	CONSTRAINT station_role_src_id_check CHECK ((src_id >= (0)::numeric)),
	CONSTRAINT station_role_src_id_fkey FOREIGN KEY (src_id) REFERENCES public."source"(src_id)
);


-- public.station_status definition

-- Drop table

-- DROP TABLE public.station_status;

CREATE TABLE public.station_status (
	status_code bpchar(4) NOT NULL,
	src_id numeric(6) NOT NULL,
	status_bgn_date timestamp NOT NULL,
	status_end_date timestamp NOT NULL,
	role_name_code varchar(8) NULL,
	CONSTRAINT station_status_pkey PRIMARY KEY (status_code, src_id, status_bgn_date),
	CONSTRAINT station_status_src_id_check CHECK ((src_id >= (0)::numeric)),
	CONSTRAINT station_status_src_id_fkey FOREIGN KEY (src_id) REFERENCES public."source"(src_id)
);
CREATE INDEX ix_station_status_role_name_code ON public.station_status USING btree (role_name_code);
CREATE INDEX ix_station_status_src_id ON public.station_status USING btree (src_id);
CREATE INDEX ix_station_status_status_code ON public.station_status USING btree (status_code);


-- public.eqpt_calib_coeff definition

-- Drop table

-- DROP TABLE public.eqpt_calib_coeff;

CREATE TABLE public.eqpt_calib_coeff (
	calib_coeff_msrt_id numeric(6) NOT NULL,
	eqpt_type_calib_coeff_id numeric(6) NOT NULL,
	eqpt_calib_id numeric(6) NOT NULL,
	calib_coeff_val numeric(10, 2) NULL,
	CONSTRAINT eqpt_calib_coeff_pkey PRIMARY KEY (calib_coeff_msrt_id),
	CONSTRAINT eqpt_calib_coeff_eqpt_calib_id_fkey FOREIGN KEY (eqpt_calib_id) REFERENCES public.equipment_calibration(eqpt_calib_id)
);