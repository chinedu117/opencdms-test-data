

PGPASSWORD=password psql -U postgres -c "\COPY raw_data FROM '/raw_data/station_id_14_108.csv' WITH (FORMAT CSV, DELIMITER ',', HEADER, null \"NULL\");"
