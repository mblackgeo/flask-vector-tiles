# Flask Vector Tiles
A simple [Flask](https://flask.palletsprojects.com/en/2.0.x/) and [LeafletJS](https://leafletjs.com/) based webapp for rendering vector tiles from PostGIS using [pg_tileserv](https://github.com/CrunchyData/pg_tileserv).

![Example](/example.gif)

This project was made thanks to the excellent [Docker](https://github.com/CrunchyData/pg_tileserv/tree/master/examples/docker) and [Leaflet](https://github.com/CrunchyData/pg_tileserv/tree/master/examples/leaflet) examples provided in the pg_tileserv documentation.

## Prerequisites

* Install [Docker](https://docs.docker.com/engine/install/) and [docker-compose](https://docs.docker.com/compose/install/)
* Have `make` and `wget` installed

## Usage

The [`Makefile`](Makefile) includes helpful commands for running the backend and frontend services using docker compose.
To get started simply run the following commands:

```shell
make build  # builds the docker images
make ingest  # download and ingest the Natural Earth country boundaries into PostGIS
make run  # run the full stack (PostGIS + pg_tileserv and Flask)
```
To view the map after running `make run` (or `make run-detached`), open [http://localhost:8000](http://localhost:8000) in your browser.
Additional commands can also be viewed by running `make help`. Once finished, to clean up run:

```shell
make clean  # optionally, when finished delete the containers and volumes
```


## Development

For local development, pre-commit should be installed and the application can be installed as editable along with the dev requirements:

```shell
pre-commit install
pip install -e .
pip install -r requirements-dev.txt
```

* [Pytest](https://docs.pytest.org/en/6.2.x/) is used for the functional tests of the application (see `/tests`).
* Code is linted using [flake8](https://flake8.pycqa.org/en/latest/) with `--max-line-length=120`
* Code formatting is validated using [Black](https://github.com/psf/black)
* [pre-commit](https://pre-commit.com/) is used to run these checks locally before files are pushed to git
* The [Github Actions pipeline](.github/workflows/pipeline.yml) also runs these checks and tests