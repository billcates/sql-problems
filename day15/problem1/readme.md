#sql-problems
##day15

A hard problem in data lemur

https://datalemur.com/questions/updated-status

Write a query to update the Facebook advertiser's status using the daily_pay table. Advertiser is a two-column table containing the user id and their payment status based on the last payment and daily_pay table has current information about their payment. Only advertisers who paid will show up in this table.

Output the user id and current payment status sorted by the user id.

advertiser Table:

Column Name	Type
user_id	string
status	string

advertiser 

Example Input:

user_id	status
bing	NEW
yahoo	NEW
alibaba	EXISTING

daily_pay Table:

Column Name	Type
user_id	string
paid	decimal

daily_pay 
Example Input:

user_id	paid
yahoo	45.00
alibaba	100.00
target	13.00

Definition of advertiser status:

New: newly registered users who made their first payment.
Existing: users who paid previously and recently made a current payment.
Churn: users who paid previously, but have yet to make any recent payment.
Resurrect: users who did not pay recently but may have made a previous payment and have made payment again recently.
Example Output:
user_id	new_status
bing	CHURN
yahoo	EXISTING
alibaba	EXISTING
Bing's updated status is CHURN because no payment was made in the daily_pay table whereas Yahoo which made a payment is updated as EXISTING.