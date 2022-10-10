This directory contains the initial shared test database for prototyping and testing with supported systems including Climsoft, MCH and CliDE. 

The dataset is currently based on a dataset with complete metadata provided by the Met Office and modified for use in the PostgreSQL/TimescaleDB database system. It is anticipated that further test datasets will be made available as part of the project's collaboration with the WMO Task Team on Climate Data Model (TT-CDM).

The dataset is initially being used with the OpenCDMS Python Data Management API ([pyopencdms](https://github.com/opencdms/pyopencdms)) and supported Web APIs ([opencdms-api](https://github.com/opencdms/opencdms-api)).

Table descriptions are below. See [2020-12-04_comments.sql](https://github.com/opencdms/opencdms-test-data/blob/main/opencdms_test_data/data/opencdms/2020-12-04_comments.sql) for both table and column comments. These were lost in the translation from Oracle EE -> Oracle XE -> Postgres

---

**TABLE COMMENTS**

**deployment**

> 'An instance of a piece of equipment being deployed for a purpose. Provision is made for the situation where only the type of equipment is known, by carrying Instrument Type ID as a foreign key, and making the relationship with the Equipment entity optional. Need to ensure that, if a specific piece of equipment is recorded (via Equipment ID), the attribute Equipment Type ID is automatically set to the value of the corresponding attribute in Equipment.'


**deployment_detail**

> 'The details of attributes associated with deployments of equipment. related to the deplyment and the deployment attribute tables.'


**eqpt_calib_coeff**

> 'This table holds calibration coefficient measurements associated with the EQUIPMENT_CALIBRATION table records and the type of equipment by association with the EQPT_TYPE_CALIB_COEFF table.'


**equipment**

> 'The details of the items of equipment deployed at a station. Related by the equipment ID to the deployment table. The EQPT_PRCT_DATE and EQPT_DSPL_DATE are for equipment procurement and equipment disposal dates respectively.
> However, they are more often used to record calibration validity start and end dates respectively.'


**inspection**

> 'Provides a record of inspections carried out at stations and related to the midas.source table'


**inspection_detail**

> 'Related to the inspection table and provides the inspection details (the results) of the inspections carried out.'


**source**

> 'Midas.Source table contains details of the location where observations are made, i.e. a Source is a station where meteorological readings are made.  The location of a source is defined as the location of the barometer or the rain gauge, or other principal instrument.  
> A source changes its identity (i.e. it becomes a new source) when the location of the principal instrument changes by more than a specified amount, e.g. by 400 metres or more for a rainfall station.  A source may change its identity under other circumstances, e.g. a change of exposure or if it closes and re-opens.  A source must have at least one capability, and that must use an identifier of a specified id-type.
> Begin and end dates refer to the opening and closing of the source.  A source may be re-opened, and re-use a src_id, provided the details defined in this entity are the same.  Sources will not exist if they have no observations, but they may be created in advance, where it is known that a station is due to open.
> Sources are in a fixed position.  Met (OPR) cannot supply or maintain source information for ships.  On-station Ocean Weather Ships are treated as fixed sources; they have a notional latitude and longitude.  They have a source record, with a Src_Name of OWS ALPHA, OWS BRAVO, etc., and appropriate call-sign identifiers.  Latitude and longitude at time of report are attributes of the report.  
> This entity does not describe the reporting practice of individual elements or report types.
> NB: The entity has a self-referencing relationship, using parent_src_id, as required by the Metadata project.  It also supports cross-referencing to other sources for a specified purpose, using relationships with the cross_reference entity.  This duplication will be resolved at the next opportunity.  
>
> MidasUpd.Source is an updateable view, with one-for-one projection from the base table.  
> MidasVu.Source is a read-only view, with one-for-one projection from the base table.
> Carlos.Source is a read-only view, for a sub-set of the columns.'


**src_capability**

> 'Midas.Src_Capability table defines which types of observation  (met domain) a source is capable of producing (and MIDAS will store), e.g. London/Gatwick is capable of producing synops and NCMs, while Southend is only capable of producing metars.
> Some stations, e.g. Beaufort Park, use more than one identifier of the same type, e.g. WMO number 03693 for manned observations and 03694 for SAMOS, therefore there will be two capabilities for this source.
> Changes over time are recorded using dates.  A source capability is closed when attribute Src_Cap_End_Date is set to a date that is before the current date.  If the capability is subsequently required again by the source, then the record may either be re-opened, by resetting the Src_Cap_End_Date or by creating a new record.      
> A capability is not automatically created upon receipt of a new source or new meteorological domain.  A source capability can be deleted when it is open.
> Rcpt_method_name is currently used to store ID cross-references, while communication_method_code is required by the MetaData project.  
> MidasUpd.Src_Capability is the corresponding updatable view, with one-for-one projection of the columns.  To prevent accidental deletion of CLIMAT rows, delete privilege is not available for this view.  
> MidasUpd.Delete_Src_Capability allows delete privilege on rows other than CLIMAT ones.  
> MidasUpd.Clm_Src_Capability is an updatable view, restricted to CLIMAT rows.  
> MidasVu.Src_Capability is a non-updatable view, with one-for-one projection of the columns.
> When the Src_Capability is valid, but MIDAS has no data, Rec_St_Ind = 2000.  These rows are excluded from the MidasVu views.'


**src_capability_nodata**

> 'midas.src_capability_nodata contains those
> src_capability records with rec_st_ind = 2000. These records have no associated data recorded
> in MIDAS.  They were separated from src_capability for performance reasons and to prevent
> cross-product results.'


**station_geography**

> 'Table providing details of the geography associated with a station.'
