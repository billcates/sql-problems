# sql-problems
## day1

Given the users table containing all the details about the user whether he is client or driver and whether the user is banned or not

and the trips table contains the data
trip id - id of the trip
client_id -foreign key for the users table
driver_id -foreign key for the users table
status -whether the trip has been cancelled or it is cancelled by the client or driver
request_at -date of the trip

Write a sql query to find the cancellation rate of requests with unbanned users each day and round the cancellation rate to two decimal places.

Cancellation rate is computed by dividing the number of cancelled (either by client or driver) requests with unbanned users by the total number of requests with unbanned users on that day.