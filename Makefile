help:
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

build:  ## Build the Docker images for PostgreSQL with PostGIS and pg_tileserv
	docker-compose build && docker-compose up -d && sleep 3 && docker-compose down

ingest:  ## Download and ingest the Natural Earth Admin 0 1:50m Country boundaries
	wget -O data/boundaries.zip https://www.naturalearthdata.com/http//www.naturalearthdata.com/download/50m/cultural/ne_50m_admin_0_countries.zip
	unzip -o data/boundaries.zip -d data/
	docker-compose up -d
	docker-compose exec pg_tileserv_db sh -c "shp2pgsql -D -s 4326 /work/ne_50m_admin_0_countries.shp | psql -U tileserv -d tileserv"
	docker-compose stop

run:  ## Run the full application
	docker-compose up

run-detached:  ## Run the full application in detached mode
	docker-compose up -d

clean:  ## Stop running containers and delete volumes
	docker-compose stop && docker-compose down --volume