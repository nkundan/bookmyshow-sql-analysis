BookMyShow Booking & Revenue Analysis (MySQL)

SQL analysis of an event-ticketing platform's bookings to find where revenue comes from, which customers drive it, and where bookings are lost to cancellations.

Business Problem

An event-ticketing platform has bookings spread across events, venues, cities and customers, but no single view of what drives revenue and what leaks it. This project turns the raw booking data into insights on revenue, customer value and cancellations.

Dataset

Relational database of 6 tables, Dec 2023 - Nov 2025:

Table	Records
bookings	129,841 (118,926 booked, 10,915 cancelled)
customers	25,000
ratings	35,861
shows	3,210
events	57 (Movies, Events, Sports, Plays, Activities)
venues	54 across 10 cities
Tools & Skills

MySQL Workbench | Joins | Subqueries | Aggregations | Window functions (RANK, LAG, NTILE, ROW_NUMBER, running totals) | Database schema design (primary and foreign keys)

Key Findings
Revenue concentration: Events and Movies bring in about 65% of booked revenue. Delhi-NCR is the top city (about 19% of revenue) and Lucknow the lowest.
Customer value: The top 10% of customers generate about 33% of revenue, and non-members generate about 51%, so there is room to convert non-members into paid tiers.
Booking quality: 8.4% of bookings are cancelled overall. Bookings with an "Unknown" payment mode cancel at 10.0%, against about 8.3-8.5% for the other modes.

All revenue figures count only bookings with booking_status = 'Booked'.

What the Queries Cover (project.sql)
Filtering and sorting venues by city and capacity
Events and average base price per category
Revenue by category, city, venue and show (top 10 grossing shows)
Top 5 movies by tickets sold, with language and genre
Spend and customer count by membership tier
Venue ranking within each venue type (RANK)
Running total of daily revenue
Month-over-month revenue growth (LAG)
Most recent booking per customer (ROW_NUMBER)
Customer spend deciles (NTILE)
Cancellation rate by payment mode
How to Run
Run bookmyshow_schema.sql to create the database and tables.
Import the CSV files in this order: venues, events, customers, shows, bookings, ratings.
Run the queries in project.sql.
