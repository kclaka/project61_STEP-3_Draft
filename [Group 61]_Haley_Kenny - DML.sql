-- This file contains Database Manipulation queries for the Well Life Project. 
-- Query to add a new character functionality with colon : character being used to 
-- denote the variables that will have data from the backend programming language


---------------------------------------------------------------------
 --   All of the update, list, and delete queries for the Customers table
---------------------------------------------------------------------

-- Customers Entity
-- Query to list customer and customer information
select fname, lname, pronouns, age, customerAddress, email, membershipType 
from customers;

-- Query to insert into new customer into the database
insert into customers (fname, lname, pronouns, age, customerAddress, email, membershipType,
                       hasActiveMembership)
values (:first_name_from_input, last_name_from_input, :pronouns_from_input, :age_from_input,  
        :customerAddress_from_input, email_from_input, :membershipType_from_input,
                       hasActiveMembership);

-- Query to update customer information
UPDATE customers
SET :membershipType = :memebershipType_from_input, fname  = :first_name_from_input
where customerID = :customerID_from_input


-- Query to delete customer
DELETE from Customers
where :Customers.customerID = :customerID_from_input

-- Query for Check a customer customer membership type
select membershipType from customers
where fname = :first_name_from_input;


---------------------------------------------------------------------
 -- All of the update, list, and delete queries for the -- Transactions table
---------------------------------------------------------------------

-- Transactions Entity

-- Query to list all transactions
select amount, transactionDate form transactions


-- Query for transaction by a particular customer
select * from transactions
JOIN Customers C on Transactions.CustomerID = C.customerID
WHERE c.fname = :customerName;

-- Query to add a new Transaction
insert into transactions (CustomerID, amount, transactionDate)
values (:customerID_from_input, :amount_from_input, :transactionDate_from_input);

-- Query to update customer information
UPDATE transactions
SET amount = :amount_from_input, transactionDate  = :transactionDate_from_input)
where transactionID = :transactionID_from_input

-- Query to delete transaction
DELETE from transactions
where transactions.transactionID = :transactionID_from_input


---------------------------------------------------------------------
 -- All of the update, list, and delete queries for the -- Schedules table
---------------------------------------------------------------------

-- Schedules Entity

-- Query to list all schedules
select activity, activityDays, startTime, duration
from schedules

-- Query to a new schedule
insert into schedules (trainerID, activity, activityDays, startTime, duration, locationID)
values (:trainerID_from_input, :activity_from_input, :startTime_from_input, :duration_from_input
        :locationID_from_input);

update schedules
set startTime = :startTime_from_input
where scheduleID = :scheduleID_from_input

delete
from schedules
where scheduleID = :scheduleID_from_input;

---------------------------------------------------------------------
 -- All of the update, list, and delete queries for the -- Trainer table
---------------------------------------------------------------------

-- Trainer Entity



-- Query for inventory available in a current location
SELECT * from inventory
join Equipment E on Inventory.equipmentID = E.equipmentID
join Locations L on Inventory.locationID = L.locationID
where L.locationID = 4;

-- Query for getting particular trainer schedule
Select activity, activityDays, duration from Schedules
join Trainers T on Schedules.trainerID = T.trainerID
where trainerName = 'Rosamond Croshaw';



-- Query to get a location where they have more than 5 Dumbells
select locationAddress from inventory
join Equipment E on Inventory.equipmentID = E.equipmentID
join Locations L on Inventory.locationID = L.locationID
where equipmentType = 'Barbells' and equipmentQuantity > 5;



-- Query to Delete a customer
DELETE from customers
where customerID = 19;

-- Update the number of equipments in a particular location
update inventory
join Equipment E on Inventory.equipmentID = E.equipmentID
join Locations L on Inventory.locationID = L.locationID
set equipmentQuantity = 10
where locationAddress = :location_from_input and equipmentName = :equipmentName_from_inout

-- Query to UPDATE the schedule of a location
Delete from inventory
