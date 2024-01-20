import io
import pandas as pd
import requests
if 'data_loader' not in globals():
    from mage_ai.data_preparation.decorators import data_loader
if 'test' not in globals():
    from mage_ai.data_preparation.decorators import test


@data_loader
def load_data_from_api(*args, **kwargs):
    """
    Template for loading data from API
    """
    # List of URLs
    urls = ['https://d37ci6vzurychx.cloudfront.net/trip-data/green_tripdata_2020-10.parquet',
            'https://d37ci6vzurychx.cloudfront.net/trip-data/green_tripdata_2020-11.parquet',
            'https://d37ci6vzurychx.cloudfront.net/trip-data/green_tripdata_2020-12.parquet']

    # Initialize an empty list to store DataFrames
    dfs = []

    # Loop through each URL
    for url in urls:
        # Load data from the current URL into a DataFrame
        df = pd.read_parquet(url)  # Replace 'read_csv' with the appropriate function for your data format
    
        # Append the DataFrame to the list
        dfs.append(df)

    # Concatenate the list of DataFrames into a single DataFrame
    result_df = pd.concat(dfs, ignore_index=True)


    taxi_dtypes = {
                    "VendorID": int,
                    "store_and_fwd_flag": object,
                    "RatecodeID": int,
                    "PULocationID": int,
                    "DOLocationID": int,
                    "passenger_count": int,
                    "trip_distance": float,
                    "fare_amount": float,
                    "extra": float,
                    "mta_tax": float,
                    "tip_amount": float,
                    "tolls_amount": float,
                    "ehail_fee": float,
                    "improvement_surcharge": float,
                    "total_amount": float,
                    "payment_type": float,
                    "trip_type": float,
                    "congestion_surcharge": float
                }

    parse_dates = ["lpep_pickup_datetime" ,"lpep_dropoff_datetime"]
    
    # Display the result DataFrame
    return(result_df)
    
    #pd.read_parquet(url)#, dtype=taxi_dtypes, parse_dates=parse_dates)


@test
def test_output(output, *args) -> None:
    """
    Template code for testing the output of the block.
    """
    assert output is not None, 'The output is undefined'
