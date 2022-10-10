-- Comments for DEPLOYMENT

COMMENT ON TABLE deployment IS 'An instance of a piece of equipment being deployed for a purpose. Provision is made for the situation where only the type of equipment is known, by carrying Instrument Type ID as a foreign key, and making the relationship with the Equipment entity optional. Need to ensure that, if a specific piece of equipment is recorded (via Equipment ID), the attribute Equipment Type ID is automatically set to the value of the corresponding attribute in Equipment.'
/
COMMENT ON COLUMN deployment.depl_bgn_date IS ' Begin date of deployment'
/
COMMENT ON COLUMN deployment.depl_end_date IS ' End date of deployment'
/
COMMENT ON COLUMN deployment.deployment_id IS ' Unique identifier of each deployment record'
/
COMMENT ON COLUMN deployment.deployment_remark IS ' Remark about deployment'
/
COMMENT ON COLUMN deployment.east_grid_ref IS ' East grid reference of deployment'
/
COMMENT ON COLUMN deployment.elevation IS ' Elevation of deployment'
/
COMMENT ON COLUMN deployment.equipment_id IS ' Unique identifier of piece of equipment'
/
COMMENT ON COLUMN deployment.equipment_type_id IS ' Unique identifier for equipment type'
/
COMMENT ON COLUMN deployment.grid_ref_type IS ' Grid reference type (OS, IRL or CI)'
/
COMMENT ON COLUMN deployment.high_prcn_lat IS 'Latitude of deployment in degrees to 5 decimal places'
/
COMMENT ON COLUMN deployment.high_prcn_lon IS 'Longitude of deployment in degrees to 5 decimal places'
/
COMMENT ON COLUMN deployment.id IS ' Identifier associated with station'
/
COMMENT ON COLUMN deployment.id_type IS ' Identifier type describing identifier above'
/
COMMENT ON COLUMN deployment.ipr_owner IS 'Code identifying who owns the intellectual property rights of the deployed equipment.'
/
COMMENT ON COLUMN deployment.lat_wgs84 IS 'WGS84 Latitude of deployment in degrees to 5 decimal places'
/
COMMENT ON COLUMN deployment.lon_wgs84 IS 'WGS84 Longitude of deployment in degrees to 5 decimal places'
/
COMMENT ON COLUMN deployment.met_office_eqpt_flag IS ' Flag describing whether Met Office owns equipment or not (T or F)'
/
COMMENT ON COLUMN deployment.met_role_id IS ' Identifier describing the purpose of the equipment'
/
COMMENT ON COLUMN deployment.north_grid_ref IS ' North grid reference of deployment'
/
COMMENT ON COLUMN deployment.ob_sys_name IS ' Name of observing system if present'
/
COMMENT ON COLUMN deployment.src_id IS ' Unique identifier for station in MIDAS & Metadata '
/


-- Comments for DEPLOYMENT_DETAIL

COMMENT ON TABLE deployment_detail IS 'The details of attributes associated with deployments of equipment. related to the deplyment and the deployment attribute tables.'
/
COMMENT ON COLUMN deployment_detail.depl_attr_bgn_date IS ' Begin date for which attribute value is valid'
/
COMMENT ON COLUMN deployment_detail.depl_attr_end_date IS ' End date for which attribute value is valid'
/
COMMENT ON COLUMN deployment_detail.depl_attr_id IS ' Deployment attribute unique identifier'
/
COMMENT ON COLUMN deployment_detail.depl_dtl_val IS ' Value associated with attribute'
/
COMMENT ON COLUMN deployment_detail.deployment_id IS ' Deployment record unique identifier'
/

-- Comments for EQPT_CALIB_COEFF

COMMENT ON TABLE eqpt_calib_coeff IS 'This table holds calibration coefficient measurements associated with the EQUIPMENT_CALIBRATION table records and the type of equipment by association with the EQPT_TYPE_CALIB_COEFF table.'
/
COMMENT ON COLUMN eqpt_calib_coeff.calib_coeff_msrt_id IS ' Unique identifier of equipment calibration coefficient'
/
COMMENT ON COLUMN eqpt_calib_coeff.calib_coeff_val IS ' Value of calibration coefficient'
/
COMMENT ON COLUMN eqpt_calib_coeff.eqpt_calib_id IS ' Foreign key to equipment_calibration'
/
COMMENT ON COLUMN eqpt_calib_coeff.eqpt_type_calib_coeff_id IS ' Part of foreign key to eqpt_type_calib_coeff'
/

-- Comments for EQUIPMENT

COMMENT ON TABLE equipment IS 'The details of the items of equipment deployed at a station. Related by the equipment ID to the deployment table. The EQPT_PRCT_DATE and EQPT_DSPL_DATE are for equipment procurement and equipment disposal dates respectively.
However, they are more often used to record calibration validity start and end dates respectively.'
/
COMMENT ON COLUMN equipment.eqpt_dspl_date IS 'Equipment disposal date, or date calibration expires.'
/
COMMENT ON COLUMN equipment.eqpt_dspl_rmrk IS ' Equipment disposal remark'
/
COMMENT ON COLUMN equipment.eqpt_last_updated_date IS 'Date at which this equipment was inserted or last updated'
/
COMMENT ON COLUMN equipment.eqpt_prct_date IS 'Equipment procurement date, or date of calibration'
/
COMMENT ON COLUMN equipment.equipment_cost IS ' Cost of equipment'
/
COMMENT ON COLUMN equipment.equipment_id IS ' Unique identifier for piece of equipment in Metadata'
/
COMMENT ON COLUMN equipment.equipment_type_id IS ' Unique identifier for equipment type'
/
COMMENT ON COLUMN equipment.manufacturer_name IS ' Name of equipment manufacturer'
/
COMMENT ON COLUMN equipment.manufacturer_sn_txt IS ' Manufacturer serial number or SI database Sensor_serial_no '
/
COMMENT ON COLUMN equipment.met_ref_txt IS ' Met Office reference number or SI database Asset_id'
/

-- Comments for EQUIPMENT_CALIBRATION

COMMENT ON COLUMN equipment_calibration.calib_mthd_code IS ' Code for method of calibration'
/
COMMENT ON COLUMN equipment_calibration.check_equipment_id IS ' Unique identifier for check equipment used'
/
COMMENT ON COLUMN equipment_calibration.eqpt_calib_date IS ' Date on which calibration was carried out'
/
COMMENT ON COLUMN equipment_calibration.eqpt_calib_id IS ' Unique identifier for calibration of this equipment'
/
COMMENT ON COLUMN equipment_calibration.eqpt_calib_name IS ' Name of person carrying out calibration'
/
COMMENT ON COLUMN equipment_calibration.eqpt_calib_next_due_date IS 'Date on which next calibration is due'
/
COMMENT ON COLUMN equipment_calibration.eqpt_calib_rmrk IS ' Remark on the calibration'
/
COMMENT ON COLUMN equipment_calibration.equipment_id IS ' Unique identifier of equipment'
/

-- Comments for INSPECTION

COMMENT ON TABLE inspection IS 'Provides a record of inspections carried out at stations and related to the midas.source table'
/
COMMENT ON COLUMN inspection.inspection_date IS ' Date of inspection'
/
COMMENT ON COLUMN inspection.inspection_id IS ' Unique identifier for the inspection'
/
COMMENT ON COLUMN inspection.inspection_remark IS ' Remark on inspection'
/
COMMENT ON COLUMN inspection.inspectors_name IS ' Name of inspector'
/
COMMENT ON COLUMN inspection.review_date IS ' Date on which inspection should be reviewed'
/
COMMENT ON COLUMN inspection.src_id IS ' Unique identifier for the station'
/

-- Comments for INSPECTION_DETAIL

COMMENT ON TABLE inspection_detail IS 'Related to the inspection table and provides the inspection details (the results) of the inspections carried out.'
/
COMMENT ON COLUMN inspection_detail.deployment_id IS ' Deployment which this item refers to'
/
COMMENT ON COLUMN inspection_detail.insp_detl_id IS ' Unique identifier of record'
/
COMMENT ON COLUMN inspection_detail.insp_detl_rslt_txt IS ' Result of the inspection item for this inspection'
/
COMMENT ON COLUMN inspection_detail.inspection_id IS ' Equipment which this item refers to'
/
COMMENT ON COLUMN inspection_detail.inspection_item_id IS ' Unique identifier of inspection item'
/


-- Comments for OBSERVING_SCHEDULE

COMMENT ON COLUMN observing_schedule.ob_schd_bgn_date IS ' Start date of record'
/
COMMENT ON COLUMN observing_schedule.ob_schd_end_date IS ' End date of record'
/
COMMENT ON COLUMN observing_schedule.ob_schd_id IS ' Unique number of the record'
/
COMMENT ON COLUMN observing_schedule.ob_schd_rmrk IS ' Remark for the record'
/
COMMENT ON COLUMN observing_schedule.observing_interval IS ' Number of minutes between each report'
/
COMMENT ON COLUMN observing_schedule.public_holiday_flag IS ' T or F. Shows whether the report comes in on a bank holiday'
/
COMMENT ON COLUMN observing_schedule.stn_rpt_elem_id IS ' Unique identifier of the element for the station'
/
COMMENT ON COLUMN observing_schedule.time_of_day_bgn IS ' First time of day of report'
/
COMMENT ON COLUMN observing_schedule.time_of_day_end IS ' Last time of day of report'
/
COMMENT ON COLUMN observing_schedule.week_day_bgn IS ' First day of week of report'
/
COMMENT ON COLUMN observing_schedule.week_day_end IS ' Last day of week of report'
/
COMMENT ON COLUMN observing_schedule.year_date_bgn IS ' First month/year of report (format mm/yy)'
/
COMMENT ON COLUMN observing_schedule.year_date_end IS ' Last month/year of report (format mm/yy)'
/

-- Comments for OBSERVING_SYSTEM_INSTALLATION

COMMENT ON COLUMN observing_system_installation.ob_sys_intl_bgn_date IS ' Start date of installation of observing sys at station'
/
COMMENT ON COLUMN observing_system_installation.ob_sys_intl_end_date IS ' End date of installation of observing sys at station'
/
COMMENT ON COLUMN observing_system_installation.ob_sys_intl_id IS ' Unique number for each record'
/
COMMENT ON COLUMN observing_system_installation.ob_sys_vrsn_id IS ' Unique number for observing system version'
/
COMMENT ON COLUMN observing_system_installation.src_id IS ' Unique number for station'
/


-- Comments for REPORTING_SCHEDULE

COMMENT ON COLUMN reporting_schedule.id IS ' Non unique identifier for station'
/
COMMENT ON COLUMN reporting_schedule.id_type IS ' Type of identifier above'
/
COMMENT ON COLUMN reporting_schedule.met_domain_name IS ' Describes the route from which the data came'
/
COMMENT ON COLUMN reporting_schedule.public_holiday_flag IS ' T or F. Shows whether the report comes in on a bank holiday'
/
COMMENT ON COLUMN reporting_schedule.report_schedule_id IS ' Unique identifier for each record'
/
COMMENT ON COLUMN reporting_schedule.reporting_interval IS ' Number of minutes between each report'
/
COMMENT ON COLUMN reporting_schedule.reporting_method IS ' Either Manual or Automatic'
/
COMMENT ON COLUMN reporting_schedule.rpt_schd_bgn_date IS ' Start date of record'
/
COMMENT ON COLUMN reporting_schedule.rpt_schd_end_date IS ' End date of record'
/
COMMENT ON COLUMN reporting_schedule.rpt_schd_rmrk IS ' Remark for the record'
/
COMMENT ON COLUMN reporting_schedule.src_cap_bgn_date IS ' Start date of the SRC_CAPABILITY record'
/
COMMENT ON COLUMN reporting_schedule.time_of_day_bgn IS ' First time of day of report'
/
COMMENT ON COLUMN reporting_schedule.time_of_day_end IS ' Last time of day of report'
/
COMMENT ON COLUMN reporting_schedule.week_day_bgn IS ' First day of week of report'
/
COMMENT ON COLUMN reporting_schedule.week_day_end IS ' Last day of week of report'
/
COMMENT ON COLUMN reporting_schedule.year_date_bgn IS ' First month/year of report (format mm/yy)'
/
COMMENT ON COLUMN reporting_schedule.year_date_end IS ' Last month/year of report (format mm/yy)'
/

-- Comments for SOURCE

COMMENT ON TABLE source IS 'Midas.Source table contains details of the location where observations are made, i.e. a Source is a station where meteorological readings are made.  The location of a source is defined as the location of the barometer or the rain gauge, or other principal instrument.  
A source changes its identity (i.e. it becomes a new source) when the location of the principal instrument changes by more than a specified amount, e.g. by 400 metres or more for a rainfall station.  A source may change its identity under other circumstances, e.g. a change of exposure or if it closes and re-opens.  A source must have at least one capability, and that must use an identifier of a specified id-type. 
Begin and end dates refer to the opening and closing of the source.  A source may be re-opened, and re-use a src_id, provided the details defined in this entity are the same.  Sources will not exist if they have no observations, but they may be created in advance, where it is known that a station is due to open.
Sources are in a fixed position.  Met (OPR) cannot supply or maintain source information for ships.  On-station Ocean Weather Ships are treated as fixed sources; they have a notional latitude and longitude.  They have a source record, with a Src_Name of OWS ALPHA, OWS BRAVO, etc., and appropriate call-sign identifiers.  Latitude and longitude at time of report are attributes of the report.   
This entity does not describe the reporting practice of individual elements or report types.
NB: The entity has a self-referencing relationship, using parent_src_id, as required by the Metadata project.  It also supports cross-referencing to other sources for a specified purpose, using relationships with the cross_reference entity.  This duplication will be resolved at the next opportunity.  

MidasUpd.Source is an updateable view, with one-for-one projection from the base table.  
MidasVu.Source is a read-only view, with one-for-one projection from the base table.
Carlos.Source is a read-only view, for a sub-set of the columns.'
/
COMMENT ON COLUMN source.drainage_stream_id IS ' 
Drainage streams or coastal name identification number to link area to source information. New item but drainage stream information from ML.HYDROSET
'
/
COMMENT ON COLUMN source.east_grid_ref IS ' 
As a compound with North Grid reference can indicate a location to within a 100 metre square.
'
/
COMMENT ON COLUMN source.elevation IS ' 
Height of ground surface above mean sea level.  See also height.
'
/
COMMENT ON COLUMN source.grid_ref_type IS ' 
This attribute describes the type of grid reference.  
Value List:
CI = Channel Islands grid
IRL = Irish grid
OS = Ordnance Survey British National grid reference
Unspecified, usually over-seas.
'
/
COMMENT ON COLUMN source.high_prcn_lat IS ' 
When source is an on-station OWS, latitude is notional. 

Latitude expressed in thousandths of a degree.  South if negative
'
/
COMMENT ON COLUMN source.high_prcn_lon IS ' 
When source is an on-station OWS, longitude is notional. 

Longitude express in thousandths of a degree.  West if negative
'
/
COMMENT ON COLUMN source.hydr_area_id IS ' 
Hydrometric area identification number.  Rainfall stations are located in a hydrometric area assigned clockwise round the country starting in North Scotland.  
Hydrometric area numbers are in the HHHh format, where HHH is the original number allocated in the 1930s, and h is the sub-division resulting from water authority re-organizations.  Thus, when h=0 the boundary remains that defined n the 1930s.
In MIDAS, it links an area to sources.
'
/
COMMENT ON COLUMN source.loc_geog_area_id IS ' 
Geographic area where the source is located, connected at the lowest level by using the geographic area id of the location.
'
/
COMMENT ON COLUMN source.mtce_ctre_code IS ' 
Abbreviated form of the maintenance centre name.
'
/
COMMENT ON COLUMN source.north_grid_ref IS ' 
As a compound with east grid reference can give a location of a site to a 100 m square.
'
/
COMMENT ON COLUMN source.parent_src_id IS ' 
'
/
COMMENT ON COLUMN source.place_id IS ' 
Attribute Description -  
'
/
COMMENT ON COLUMN source.post_code IS ' 
Allows searches on post code, without access to full postal address. 

There is a requirement to retrieve data by post code.  Post area, district and sector are stored, i.e. RG12 2, but not post walk, i.e. not RG12 2SZ.  
'
/
COMMENT ON COLUMN source.rec_st_ind IS ' 
An indicator of the present state of the database row. It can be set by data evaluators to indicate that the record can be deleted by a sweep process.

The known uses of Rec_St_Ind are: 
 10 Unset
 20 Record values have been adjusted
 30 Record has been moved forward one hour
 40 Observation marked for deletion, i.e. logically deleted
 50 Observation unmarked for deletion i.e. restored from logical deletion. 
 60 Observation level (e.g. a point in an upper air ascent) marked for deletion
 70 Observation level unmarked for deletion
 80 Source marked for deletion
 90 Source unmarked for deletion i.e. restored from logical deletion.
 100 Identifier change
 110 Delete observation level

Rec_St_Ind for observations is composed of two values, i.e. aabb
1001 Normal ingestion of observation at creation
1002 Normal ingestion of a multi-level observation such as upper air at creation
1003 Addition of observation level
1004 Receive a COR before normal observation received
1005 Receive a COR before normal multi level observation received
1006 Receive a COR to observation level
1007 Addition of a missing value
1008 Receive a COR after the observation received but before QC started.
1009 Receive a COR to an observation level after normal receipt but before QC started
1010 Start of QC, ob has been extracted for QC checks
1011 The QC run has updated the QC level on Version_Num = 1
1012 With Version_Num = 0 indicates that there should be a version 1 which can be anything between 1022 and 1026 depending on whether it has more than 1 amend to it.
1013 Version_Num = 1 has been killed, Version_Num = 0 exists. 
1014 Version_Num = 1 has apportioned/corrected data. Corresponding Version_Num = 0 does not exist. 
1022 Version_Num = 1. A corresponding Version_Num = 0 has been created because of first change to the observation (Version_Num = 0 has Rec_St_Ind = 1012). 
1023 Version_Num = 1 of multi level ob
1024 QC amend to Version_Num = 1 observation multi level
1025 Change to QC level in Version_Num = 1
1026 Receive subsequent QC amendments 
1027 Decision to Archive 
1028 Archive observation
1029 COR of Key item- pre QC - mark for deletion
'
/
COMMENT ON COLUMN source.src_bgn_date IS ' 
source.src_bgn_date is the date when the station opened.
'
/
COMMENT ON COLUMN source.src_end_date IS ' 
source.src_end_date is the date when the station closed
'
/
COMMENT ON COLUMN source.src_geom IS 'SRID 8307 geometry (WGS84 lat/lon)'
/
COMMENT ON COLUMN source.src_guid IS 'Global Unique ID - RAW32 - default sys_guid()'
/
COMMENT ON COLUMN source.src_id IS ' 
This is an identifier for each source of meteorological data within the system. It acts as a unique identifier when a source may be of various types.  It consists of a 6 digit integer, assigned from a high-number record, and has no external significance. 
'
/
COMMENT ON COLUMN source.src_location_type IS 'Categorisation of location e.g. UKMO_SURFACE_LAND'
/
COMMENT ON COLUMN source.src_name IS ' 
Name of source
'
/
COMMENT ON COLUMN source.src_type IS ' 
e.g. land station, ship, coastal station. 

Types of location for a source, e.g. land, marine, coastal.  A marine station may be a ship or buoy or rig or platform.  NB: This data item describes the type of source location, not the type of report.
'
/
COMMENT ON COLUMN source.src_upd_date IS ' 
source_updated_date
'
/
COMMENT ON COLUMN source.wmo_region_code IS ' 
WMO Code A1 Code table 0161. WMO Regional Association area in which buoy, drilling rig or oil- or gas-production platform has been deployed.  
Values: 1 = Africa, 2 = Asia, 3 = South America, 4 = North America, 5 = Australasia, 6 = Europe, 7 = Antactica.
'
/
COMMENT ON COLUMN source.zone_time IS ' 
Difference from UTC (hours) for overseas stations.
'
/

-- Comments for SRC_CAPABILITY

COMMENT ON TABLE src_capability IS 'Midas.Src_Capability table defines which types of observation  (met domain) a source is capable of producing (and MIDAS will store), e.g. London/Gatwick is capable of producing synops and NCMs, while Southend is only capable of producing metars. 
Some stations, e.g. Beaufort Park, use more than one identifier of the same type, e.g. WMO number 03693 for manned observations and 03694 for SAMOS, therefore there will be two capabilities for this source.
Changes over time are recorded using dates.  A source capability is closed when attribute Src_Cap_End_Date is set to a date that is before the current date.  If the capability is subsequently required again by the source, then the record may either be re-opened, by resetting the Src_Cap_End_Date or by creating a new record.      
A capability is not automatically created upon receipt of a new source or new meteorological domain.  A source capability can be deleted when it is open.
Rcpt_method_name is currently used to store ID cross-references, while communication_method_code is required by the MetaData project.  
MidasUpd.Src_Capability is the corresponding updatable view, with one-for-one projection of the columns.  To prevent accidental deletion of CLIMAT rows, delete privilege is not available for this view.  
MidasUpd.Delete_Src_Capability allows delete privilege on rows other than CLIMAT ones.  
MidasUpd.Clm_Src_Capability is an updatable view, restricted to CLIMAT rows.   
MidasVu.Src_Capability is a non-updatable view, with one-for-one projection of the columns. 
When the Src_Capability is valid, but MIDAS has no data, Rec_St_Ind = 2000.  These rows are excluded from the MidasVu views.'
/
COMMENT ON COLUMN src_capability.comm_mthd_id IS ' 
Abbreviated code to identify the various communication methods on which data can be sent back to the Office.
'
/
COMMENT ON COLUMN src_capability.data_retention_period IS ' 
Character string indicating the period for which data are retained in MIDAS.
'
/
COMMENT ON COLUMN src_capability.db_segment_name IS ' 
The name of a database segment, e.g. source, raindrnl, etc. 
'
/
COMMENT ON COLUMN src_capability.first_online_ob_yr IS ' 
Year of first online observation.  This attribute indicates when the data are online or offline thus:
0000 implies all data are offline, because we will not store capabilities for which we do not have data;
nnnn, i.e. any valid year, implies all data from that year onwards are online, and previous years are offline;
nnnn where nnnn = "capability effective from year" implies all data are online.
'
/
COMMENT ON COLUMN src_capability.id IS ' 
The value of an identifier for the source.  Eight left-justified identifier characters, eg 03772, EGGW , etc.  This ID has no meaning unless interpreted with the associated identifier type.  
Identifier has a length of eight characters to allow for ship call-signs and to achieve alignment.  The WMO definition of symbolic letter D....D is Ships call sign consisting of three or more alphanumeric characters.  B Fullagar (OPR3) confirms that the maximum length of a WMO call-sign is seven characters.  The GreenPeace ship uses an eight character call-sign, but OPR truncate this to seven characters. 
Some identifiers have been re-used, e.g. when a WMO station number is re-allocated at a later date for a site that is deemed suitable for synoptic purposes.  Where this has happened already the oldest use will have the character Z appended to the identifier, the next oldest Y, etc, with the over-riding proviso that the newest version will NOT have an appendage.
'
/
COMMENT ON COLUMN src_capability.id_type IS ' 
The name of the type of identifier used to identify a source,  e.g. WMO, SHIP, OWS, RAIN, DCNN etc.  See BUFR table B, class 02, 002001.
'
/
COMMENT ON COLUMN src_capability.met_domain_name IS ' 
A met domain is uniquely identified by its name.  
The names of input domains correspond to existing code forms, but are structured to facilitate sorting, e.g. SYNOP FM12, SHIP FM13, DRIFTER FM18-IX, CLIMAT UA FM75-VI, etc.  
NB: Synop is not a unique name for an input met domain; the domain name must include a FM session number or date.    Synop pre 1982 is not a unique name, the name may have changed on several previous occasions.  
OP3 marine QC have specifically asked for a met domain of Ship synop - GTS, or similar, so that they can distinguish GTS ships from VOF ones.  The names of storage domains will correspond to MIDAS table names.
'
/
COMMENT ON COLUMN src_capability.prime_capability_flag IS 'Single character to indicate if the capability is the prime one of its type for the specified station, i.e. the prime daily rainfall capability for the station.  Valid values are T and F.  For each met_domain, one and only one capability can be set to prime at one time.  When SAMOS or similar equipment is trialed at a site, the site may continue to report using its current ID and prime_capability_flag = T while the SAMOS uses a new src_capability and ID with prime_capability_flag = F.  When the trial concludes and the SAMOS becomes operational, the old capability is changed to prime_capability_flag = F (and is usually closed), while the new src_capability (and ID) is updated to prime_capability_flag = T.'
/
COMMENT ON COLUMN src_capability.rcpt_method_name IS ' 
Formerly the method of receiving these reports from this source, e.g. GTS, metform, postcard, etc.  This attribute is now used to cross-reference between IDs in use at a SOURCE.  It will be renamed to ID_CROSS_REF at the next convenient opportunity.   
 '
/
COMMENT ON COLUMN src_capability.rec_st_ind IS ' 
rec_st_ind = 2000 indicates that Midas has no obs for this src_capability. 

An indicator of the present state of the database row. It can be set by data evaluators to indicate that the record can be deleted by a sweep process.

The known uses of Rec_St_Ind are: 
 10 Unset
 20 Record values have been adjusted
 30 Record has been moved forward one hour
 40 Observation marked for deletion, i.e. logically deleted
 50 Observation unmarked for deletion i.e. restored from logical deletion. 
 60 Observation level (e.g. a point in an upper air ascent) marked for deletion
 70 Observation level unmarked for deletion
 80 Source marked for deletion
 90 Source unmarked for deletion i.e. restored from logical deletion.
 100 Identifier change
 110 Delete observation level

Rec_St_Ind for observations is composed of two values, i.e. aabb
1001 Normal ingestion of observation at creation
1002 Normal ingestion of a multi-level observation such as upper air at creation
1003 Addition of observation level
1004 Receive a COR before normal observation received
1005 Receive a COR before normal multi level observation received
1006 Receive a COR to observation level
1007 Addition of a missing value
1008 Receive a COR after the observation received but before QC started.
1009 Receive a COR to an observation level after normal receipt but before QC started
1010 Start of QC, ob has been extracted for QC checks
1011 The QC run has updated the QC level on Version_Num = 1
1012 With Version_Num = 0 indicates that there should be a version 1 which can be anything between 1022 and 1026 depending on whether it has more than 1 amend to it.
1013 Version_Num = 1 has been killed, Version_Num = 0 exists. 
1014 Version_Num = 1 has apportioned/corrected data. Corresponding Version_Num = 0 does not exist. 
1022 Version_Num = 1. A corresponding Version_Num = 0 has been created because of first change to the observation (Version_Num = 0 has Rec_St_Ind = 1012). 
1023 Version_Num = 1 of multi level ob
1024 QC amend to Version_Num = 1 observation multi level
1025 Change to QC level in Version_Num = 1
1026 Receive subsequent QC amendments 
1027 Decision to Archive 
1028 Archive observation
1029 COR of Key item- pre QC - mark for deletion
'
/
COMMENT ON COLUMN src_capability.src_cap_bgn_date IS ' 
src_capability.src_bgn_date is the first date for which we have observations of the id_ type / met_domain_name combination.
'
/
COMMENT ON COLUMN src_capability.src_cap_end_date IS ' 
src_capability.src_end_date is the last date for which we have observations of the id_ type / met_domain_name combination.
'
/
COMMENT ON COLUMN src_capability.src_id IS ' 
This is an identifier for each source of meterological data within the system. It acts as a unique identifier when a source may be of various types.  It consists of a 6 digit integer, assigned from a high-number record, and has no external significance. 
'
/

-- Comments for SRC_CAPABILITY_NODATA

COMMENT ON TABLE src_capability_nodata IS 'midas.src_capability_nodata contains those
src_capability records with rec_st_ind = 2000. These records have no associated data recorded
in MIDAS.  They were separated from src_capability for performance reasons and to prevent 
cross-product results.'
/
COMMENT ON COLUMN src_capability_nodata.prime_capability_flag IS 'Single character to indicate if the capability is the prime one of its type for the specified station, i.e. the prime daily rainfall capability for the station.  Valid values are T and F.  For each met_domain, one and only one capability can be set to prime at one time.  When SAMOS or similar equipment is trialed at a site, the site may continue to report using its current ID and prime_capability_flag = T while the SAMOS uses a new src_capability and ID with prime_capability_flag = F.  When the trial concludes and the SAMOS becomes operational, the old capability is changed to prime_capability_flag = F (and is usually closed), while the new src_capability (and ID) is updated to prime_capability_flag = T.'
/
COMMENT ON COLUMN src_capability_nodata.src_cap_bgn_date IS 'src_cap_bgn_date is the first 
date for which observations of the id / id_ type / met_domain_name combination are made and stored 
in MIDAS.'
/
COMMENT ON COLUMN src_capability_nodata.src_cap_end_date IS 'src_cap_end_date is the last 
date for which observations of the id / id_ type / met_domain_name combination are made and stored 
in MIDAS. When set to 31-DEC-3999 it indicates those combinations still currently reporting.'
/

-- Comments for STATION_AUTHORITY_HISTORY

COMMENT ON COLUMN station_authority_history.auth_hist_rmrk IS ' Remark on relationship'
/
COMMENT ON COLUMN station_authority_history.authority_id IS ' Foreign key to attribute in the AUTHORITY table'
/
COMMENT ON COLUMN station_authority_history.src_id IS ' Foreign key to attribute in the SOURCE table'
/
COMMENT ON COLUMN station_authority_history.stn_auth_bgn_date IS ' Start date of relationship between station and authority'
/
COMMENT ON COLUMN station_authority_history.stn_auth_end_date IS ' End date of relationship between station and authority'
/



-- Comments for STATION_GEOGRAPHY

COMMENT ON TABLE station_geography IS 'Table providing details of the geography associated with a station.'
/
COMMENT ON COLUMN station_geography.geog_upd_date IS 'Date on which record was updated'
/
COMMENT ON COLUMN station_geography.gradient IS 'Gradient of ground slope (0-90)'
/
COMMENT ON COLUMN station_geography.grnd_slpe_dsc IS 'Description of ground slope (Level, Simple Complex)'
/
COMMENT ON COLUMN station_geography.grnd_slpe_up_dir IS 'Upward direction of ground slope (0-360)'
/
COMMENT ON COLUMN station_geography.land_use_type_id IS 'Unique identifier of land use'
/
COMMENT ON COLUMN station_geography.pr_geog_type_code IS 'Primary geography type at station'
/
COMMENT ON COLUMN station_geography.prc_heat_src_wthn_100m IS 'Percentage of area occupied by sources of heat within 100m radius'
/
COMMENT ON COLUMN station_geography.prc_heat_src_wthn_30m IS 'Percentage of area occupied by sources of heat within 30m radius'
/
COMMENT ON COLUMN station_geography.prc_man_wthn_10m IS 'Percentage manmade ground cover within 10m radius'
/
COMMENT ON COLUMN station_geography.prc_man_wthn_50m IS 'Percentage manmade ground cover within 50m radius'
/
COMMENT ON COLUMN station_geography.prc_veg_wthn_100m IS 'Percentage vegetation ground cover greater than 0.3m height within 100m radius'
/
COMMENT ON COLUMN station_geography.prc_veg_wthn_10m IS 'Percentage vegetation ground cover greater than 0.3m height within 10m radius'
/
COMMENT ON COLUMN station_geography.prc_veg_wthn_30m IS 'Percentage vegetation ground cover greater than 0.3m height within 30m radius'
/
COMMENT ON COLUMN station_geography.prc_veg_wthn_50m IS 'Percentage vegetation ground cover greater than 0.3m height within 50m radius'
/
COMMENT ON COLUMN station_geography.scdy_geog_type_code IS 'Secondary geography type at station'
/
COMMENT ON COLUMN station_geography.sfc_cover_100m_3km IS 'The type of surface over a radius of the station between 100m and 3km'
/
COMMENT ON COLUMN station_geography.sfc_cover_3km_100km IS 'The type of surface over a radius of the station between 100m and 3km'
/
COMMENT ON COLUMN station_geography.sfc_cover_class_scheme IS 'The surface cover classification scheme used to define the surface cover'
/
COMMENT ON COLUMN station_geography.sfc_cover_less_than_100m IS 'The type of surface over a radius of the station of less then 100m'
/
COMMENT ON COLUMN station_geography.site_type_code IS 'Unique code of site type'
/
COMMENT ON COLUMN station_geography.soil_type_id IS 'Unique identifier of soil type at station'
/
COMMENT ON COLUMN station_geography.src_id IS 'Unique identifier of station'
/

-- Comments for STATION_HISTORY

COMMENT ON COLUMN station_history.event_date IS ' Date of event'
/
COMMENT ON COLUMN station_history.event_result_text IS ' Any result of the event'
/
COMMENT ON COLUMN station_history.event_text IS ' Textual description of event'
/
COMMENT ON COLUMN station_history.src_id IS ' Unique identifier of station'
/

-- Comments for STATION_INVENTORY_STATUS

COMMENT ON COLUMN station_inventory_status.inventory_code IS ' Unique code for inventory status'
/
COMMENT ON COLUMN station_inventory_status.invt_sts_bgn_date IS ' Date at which this status starts for this station'
/
COMMENT ON COLUMN station_inventory_status.invt_sts_end_date IS ' Date at which this status ends for this station'
/
COMMENT ON COLUMN station_inventory_status.invt_sts_rmrk IS ' Any remarks applicable to this record'
/
COMMENT ON COLUMN station_inventory_status.src_id IS ' Unique identifier of station'
/



-- Comments for STATION_OBSERVER

COMMENT ON COLUMN station_observer.observer_id IS ' Unique identifier of observer'
/
COMMENT ON COLUMN station_observer.observer_role_code IS ' Code describing the role of the observer at the station'
/
COMMENT ON COLUMN station_observer.src_id IS ' Unique identifier of station'
/
COMMENT ON COLUMN station_observer.stn_obsr_bgn_date IS ' Date at which observer started at station'
/
COMMENT ON COLUMN station_observer.stn_obsr_end_date IS ' Date at which observer ended at station'
/


-- Comments for STATION_REPORT_ELEMENT

COMMENT ON COLUMN station_report_element.id IS ' Identifier of capability record'
/
COMMENT ON COLUMN station_report_element.id_type IS ' Identifier type of capability record'
/
COMMENT ON COLUMN station_report_element.met_domain_name IS ' Met domain of capability record'
/
COMMENT ON COLUMN station_report_element.met_element_id IS ' Identifier of met element'
/
COMMENT ON COLUMN station_report_element.rpt_elem_bgn_date IS ' Begin date of element associated with capability'
/
COMMENT ON COLUMN station_report_element.rpt_elem_end_date IS ' End date of element associated with capability'
/
COMMENT ON COLUMN station_report_element.src_cap_bgn_date IS ' Begin date of capability record'
/
COMMENT ON COLUMN station_report_element.stn_rpt_elem_id IS ' Unique identifier for each record'
/



-- Comments for STATION_ROLE

COMMENT ON COLUMN station_role.role_bgn_date IS ' Date on which station is first associated with role'
/
COMMENT ON COLUMN station_role.role_end_date IS ' Date on which station is last associated with role'
/
COMMENT ON COLUMN station_role.role_name_code IS ' Unique code for the particular role '
/
COMMENT ON COLUMN station_role.src_id IS ' Unique identifier of the station'
/


-- Comments for STATION_STATUS

COMMENT ON COLUMN station_status.role_name_code IS ' Role name associated with status record'
/
COMMENT ON COLUMN station_status.src_id IS ' Unique identifier for station'
/
COMMENT ON COLUMN station_status.status_bgn_date IS ' Begin date for status record'
/
COMMENT ON COLUMN station_status.status_code IS ' Unique code for status'
/
COMMENT ON COLUMN station_status.status_end_date IS ' End date for status record'
/
