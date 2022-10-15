## OpenCDMS test database

See [data/opencdms/](https://github.com/opencdms/opencdms-test-data/tree/main/data/opencdms) for the initial shared test database.

## OpenCDMS supported systems

This repository contains data and information for testing OpenCDMS and supported systems.

There are three ways to test OpenCDMS with a database:
1. Testing with original database technologies (complex)

   This involves installing a database system like MariaDB, MySQL, Oracle or PostgreSQL and installing the CDMSs original database schema (see SQL DDL files in the `schemas` directory). 

    To simplify this approach, we have created a `docker-compose.yml` file in the root of the project.
    This `docker-compose.yml` file includes a few different types of containers/services for different use cases.

   There are following services in the `docker-compose.yml` file:
   
   ---
   
   1. **opencdms-db:** This is an empty TimescaleDB/PostGIS instance for deploying schemas for multiple supported CDMSs. This is currently empty.

   ---

   3. **postgresql:** This is a PostgreSQL instance containing schemas for CDMSs that use PostgreSQL. Among the supported CDMSs, CliDE and WMDR use
   PostgreSQL. 
   3. **mysql:** This is a MySQL instance containing schemas for CDMSs that use MySQL. Among supported CDMSs, Climsoft and MCH use MySQL.
   4. **oracle:** This is an Oracle Express Edition instance containing schemas from CDMSs that use Oracle. Among supported CDMSs, Midas uses Oracle.
   
   ---
   
   5. **clide:** This is a PostgreSQL 13 instance containing the CliDE schema which is comparable to how CliDE is used in production.
   6. **climsoft-4.1.1:** This is a MariaDB 10.1 instance containing the Climsoft schema for version 4.1.1 which is comparable to how Climsoft is used in production.
   7. **mch-english:** This is a MySQL 5.1.17 instance containing the MCH (English) schema which is comparable to how MCH is used in production.
   8. **midas:** This is an Oracle Express Edition instance containing schemas from Midas which is comparable to how Midas is used in production.
   9. **wmdr:** This is a TimescaleDB/PostGIS instance containing WMDR schema which is comparable to how WMDR is used in production.

   ---

   ### Service Groups

   These services are divided into **3 groups** depending on how they are used:
   - **Group 1 - An OpenCDMS database** - `opencdms-db` is meant to be used for any CDMS that is supported by OpenCDMS. A public release of `pyopencdms` package should be able to handle any operation for any supported CDMS using this instance only.
   - **Group 2 - A Postgres/MySQL/Oracle-specific database** - `postgresql`, `mysql`, `oracle` should be used when you want to use the same database technology
   that is used by respective CDMS in production. We have created `Dockerfile`s for these services in `docker/groups` with instructions to create the same table structure for respective CDMSs as used in production.
   - **Group 3 - A CDMS-specific database** - `clide`, `climsoft-4.1.1`, `mch-english`, `midas`, `wmdr` are the dedicated instances for respective CDMS. If you want to instantiate a specific CDMS, you should use one of these services.
   
   ### Port Mapping
   
   Port numbers have a group number (see above) prepended to the default port number. This allows developers to quickly identify which group the database server belongs to and also avoids clashes with any existing database servers running on the default ports.
   
   | Service | Port |
   |---------|------|
   | opencdms-db | **1**5432 |
   | postgresql | **2**5432 |
   | mysql | **2**3306 |
   | oracle | **2**1521 |
   | clide | **3**5432 |
   | climsoft-4.1.1 |  **3**3308 |
   | mch-english |  **3**3306 |
   | midas | **3**1521 |
   | wmdr | **3**5433 |
   

2. Testing with a single database technology (standard)

    The `pyopencdms` library allows developers to initialise data models for any of the supported systems in any of the supported database systems (allowing developers to install and use a single database system). Using a different underlying database technology will most likely prevent you from using SQL to perform operations like restore commands, but otherwise interaction can be achieved through the `pyopencdms` Python API.

3. Testing with SQLite / SpatiaLite (easy)

    The final option does not require you to install any database system and instead uses the lightweight SQLite option. By default, when automated unit tests run a temporary in-memory SQLite database is used. Developers do not need to install any database software.


### Data sets

See individual directories with the `data` directory for data license information.
