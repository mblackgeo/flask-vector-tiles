help:
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

build:  ## Build the Docker images for PostgreSQL with PostGIS and pg_tileserv
	docker-compose build

ingest:  ## Ingest the Natural Earth Admin 0 1:50m Country boundaries
	docker-compose up -d && docker-compose exec pg_tileserv_db sh -c "shp2pgsql -D -s 4326 /work/ne_50m_admin_0_countries.shp | psql -U tileserv -d tileserv"

run:  ## Run the full application
	docker-compose up