CREATE OR REPLACE EXTERNAL TABLE `terraform-de-411309.ny_taxi_dataset.greentaxi_2022`
OPTIONS (
  format = 'PARQUET',
  uris = ['gs://terraform-de-411309-terra-bucket/green_tripdata_2022-*.parquet']
);

CREATE OR REPLACE TABLE `terraform-de-411309.ny_taxi_dataset.greentaxi_2022_nonpartitioned`
AS SELECT * FROM `terraform-de-411309.ny_taxi_dataset.greentaxi_2022`;

SELECT COUNT(DISTINCT(PULocationID)) FROM `terraform-de-411309.ny_taxi_dataset.greentaxi_2022`;
SELECT COUNT(1) FROM `terraform-de-411309.ny_taxi_dataset.greentaxi_2022`;

SELECT COUNT(DISTINCT(PULocationID)) FROM `terraform-de-411309.ny_taxi_dataset.greentaxi_2022_nonpartitioned`;
SELECT COUNT(1) FROM `terraform-de-411309.ny_taxi_dataset.greentaxi_2022_nonpartitioned`;

SELECT COUNT(fare_amount) FROM `terraform-de-411309.ny_taxi_dataset.greentaxi_2022`
WHERE fare_amount = 0;

CREATE OR REPLACE TABLE `terraform-de-411309.ny_taxi_dataset.greentaxi_2022_partitioned`
PARTITION BY DATE(lpep_pickup_datetime)
CLUSTER BY PUlocationID AS (
  SELECT * FROM `terraform-de-411309.ny_taxi_dataset.greentaxi_2022`
);

SELECT DISTINCT(PULocationID) FROM  `terraform-de-411309.ny_taxi_dataset.greentaxi_2022_nonpartitioned`
WHERE DATE(lpep_pickup_datetime) BETWEEN '2022-06-01' AND '2022-06-30';

SELECT DISTINCT(PULocationID) FROM  `terraform-de-411309.ny_taxi_dataset.greentaxi_2022_partitioned`
WHERE DATE(lpep_pickup_datetime) BETWEEN '2022-06-01' AND '2022-06-30';

