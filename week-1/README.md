# Environment setup

## This setup is for MacOS users.

## For the course you'll need:

- Python 3 
- Google Cloud account (https://console.cloud.google.com/)
- SDK - Google Cloud CLI (https://cloud.google.com/sdk/docs/install-sdk)
- Docker with docker-compose (https://docs.docker.com/get-docker/)
- Terraform (https://www.terraform.io/downloads)
- CLI for Postgres (brew install pgcli)
- wget (brew install wget): WGET is a free tool to crawl websites and download files via the command line. More avout wget you van read here
  (https://www.jcchouinard.com/wget/)

In this week we worked on the integration of Docker and PostgreSQL in the context of building a data pipeline. The content is structured as follows:

1. **Introduction to Docker:**
   - Explanation of the need for Docker.
   - Creating a simple data pipeline within Docker.


docker run -it \

  -e POSTGRES_USER="root" \

  -e POSTGRES_PASSWORD="root" \

  -e POSTGRES_DB="ny_taxi" \

  -v "./ny-taxi-volume:/var/lib/postgresql/data" \

  -p 5432:5432 \

  postgres:13

  - Connect to it:


pgcli -h localhost -p 5432 -u root -d ny_taxi


- And check what’s there. For now it is going to be empty.


\dt

2. **Ingesting NY Taxi Data to Postgres:**
   - Running Postgres locally using Docker.
   - Utilizing pgcli for connecting to the database.
   - Exploration of the NY Taxi dataset.
   - Ingesting data into the Postgres database.

3. **Connecting pgAdmin and Postgres:**
   - Introduction to the pgAdmin tool.
   - Docker networks setup.
   - Steps for registering and creating a server in pgAdmin.

4. **Putting the Ingestion Script into Docker:**
   - Conversion of a Jupyter notebook to a Python script.
   - Parametrization of the script using argparse.
   - Dockerization of the ingestion script.

5. **Running Postgres and pgAdmin with Docker-Compose:**
   - Explanation of the need for Docker-compose.
   - Configuration of a Docker-compose YAML file.
   - Running multiple containers simultaneously using `docker-compose up`.

### All video how to do this you can find here: https://www.youtube.com/playlist?list=PL3MmuxUbc_hJed7dXYoJw8DoCuVHhGEQb

6. **Create GCP account:**
Create a Google Cloud account: https://console.cloud.google.com/

7. **Install Terraform and GCP CLI:**
Install Terraform: https://www.terraform.io/downloads

Install Google Cloud SDK: https://cloud.google.com/sdk/docs/install-sdk

8. **Deploy & delete GCP resources with Terraform:**
### Set up GCP credentials:

- Creating and managing service account keys

### Write Terraform configuration files:

- Create a main.tf and variables.tf files with your GCP resources.

- Initialize Terraform and apply changes:

terraform init

terraform apply

- Delete resources when done:

terraform destroy

### Remember to replace placeholders such as your_username, your_password, your_database, your_data.csv, your-gcp-project-id and adjust configurations according to your needs.

## Additional Resources:
Google Cloud Documentation

Docker Documentation

Pandas Documentation

Terraform Documentation