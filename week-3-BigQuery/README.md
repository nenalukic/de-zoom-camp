## This is week 3: Data Warehouse and BigQuery

We kicked off the week by understanding differences between OLAP vs OLTP and understanding the crucial role of data warehouses in modern analytics. The spotlight then shifted to BigQuery.

### What is BigQuery?
BigQuery is a cloud-based, serverless data warehouse by Google Cloud, designed for fast and cost-effective analysis of large datasets using SQL.

### Why is it Good?
- Performance: High-speed querying with parallelization and columnar storage.
- Cost-effective: Pay-as-you-go pricing, no need for dedicated infrastructure.
- Integration: Seamless integration with other Google Cloud services.
- Security: Robust security features, including encryption and access controls.

### Important Things to Know:
- Billing Model: Understand pricing for storage and queries.
- Data Formats: Support for various data formats impacts query performance.
- Partitioning and Clustering: Improve performance with table partitioning and clustering.
- Data Transfer: Efficiently load data using tools like bq or Dataflow.
- Access Control: Use IAM to manage access to BigQuery resources.

Storing our dataset in a Parquet format within a bucket, we witnessed firsthand the impact of choosing between external and standard tables.

We learned about partitoning and clustering.

Using **_partitioning_** in BigQuery offers several advantages, including improved query performance by allowing the system to skip unnecessary partitions when processing queries. It's particularly beneficial when dealing with large datasets as it helps narrow down the data that needs to be scanned for a given query, resulting in faster and more cost-effective queries.

Using **_clustering_** in combination with partitioning can provide further optimization for query performance, as both features work together to reduce the amount of data that needs to be scanned during query execution. It's important to choose clustering columns based on the query patterns and the nature of your data to achieve the best performance benefits.
