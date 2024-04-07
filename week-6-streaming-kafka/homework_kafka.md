Question 1: Redpanda version

v22.3.5 (rev 28b2443)


Question 2. Creating a topic
What's the output of the command for creating a topic?

TOPIC       STATUS
test-topic  OK

Question 3. Connecting to the Kafka server

True

Question 4. Sending data to the stream
How much time did it take? Where did it spend most of the time?

took 0.94 seconds

Sending the messages


Question 5: Sending the Trip Data
Create a topic green-trips and send the data there.
How much time in seconds did it take? (You can round it to a whole number)

Script execution completed in 66.40 seconds.

Question 6. Parsing the data
How does the record look after parsing? Copy the output

DataFrame[lpep_pickup_datetime: string, lpep_dropoff_datetime: string, PULocationID: int, DOLocationID: int, passenger_count: double, trip_distance: double, tip_amount: double]

Question 7: Most popular destination