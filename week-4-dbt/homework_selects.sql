--SELECT COUNT(*) FROM `terraform-de-411309.dbt_nlukic.fact_fhv_trips`
--23014056

--SELECT COUNT(1) FROM `terraform-de-411309.taxi_rides_all.fhv_tripdata_2019`
--where pickup_datetime between '2019-07-01' and '2019-07-31' and drop_off_datetime between '2019-07-01' and '2019-07-31'
--1881490

--SELECT COUNT(service_type) FROM `terraform-de-411309.dbt_nlukic.fact_trips`
--where pickup_datetime between '2019-07-01' and '2019-07-31' and dropoff_datetime between '2019-07-01' and '2019-07-31' and service_type = 'Green'
--401824

--SELECT COUNT(service_type) FROM `terraform-de-411309.dbt_nlukic.fact_trips`
--where pickup_datetime between '2019-07-01' and '2019-07-31' and dropoff_datetime between '2019-07-01' and '2019-07-31' and service_type = 'Yellow'
--3128275

--SELECT COUNT(*) FROM `terraform-de-411309.taxi_rides_all.fhv_tripdata_2019`
--43261266