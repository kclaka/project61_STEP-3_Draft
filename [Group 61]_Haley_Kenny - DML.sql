-- This file contains Database Manipulation queries for the Well Life Project. 
-- Query to add a new character functionality with colon : character being used to 
-- denote the variables that will have data from the backend programming language


---------------------------------------------------------------------
 --   All of the update, list, and delete queries for the Customers table
---------------------------------------------------------------------

-- Customers Entity
-- Query for  all customer and customer information
select fname, lname, pronouns, age, customerAddress, email, membershipType 
from customers;

-- Query to insert into new customer into the database
insert into customers (fname, lname, pronouns, age, customerAddress, email, membershipType,
                       hasActiveMembership)
values (:first_name_from_input, last_name_from_input, :pronouns_from_input, :age_from_input,  
        :customerAddress_from_input, email_from_input, :membershipType_from_input,
                       hasActiveMembership);




-- Transactions Entity
-- Query for transaction by a particular customer
select * from transactions
JOIN Customers C on Transactions.CustomerID = C.customerID
WHERE c.fname = :customerName;

-- Query for inventory available in a current location
SELECT * from inventory
join Equipment E on Inventory.equipmentID = E.equipmentID
join Locations L on Inventory.locationID = L.locationID
where L.locationID = 4;

-- Query for getting particular trainer schedule
Select activity, activityDays, duration from Schedules
join Trainers T on Schedules.trainerID = T.trainerID
where trainerName = 'Rosamond Croshaw';

-- Query for Check a customer customer membership type
select membershipType from customers
where fname = 'Pam';

-- Query to get a location where they have more than 5 Dumbells
select locationAddress from inventory
join Equipment E on Inventory.equipmentID = E.equipmentID
join Locations L on Inventory.locationID = L.locationID
where equipmentType = 'Barbells' and equipmentQuantity > 5;

-- Query for Update customer memebership
UPDATE customers
SET membershipType = 'Basic'
where fname = 'Pam' and lname = 'Pettengell';

-- Query to Delete a customer
DELETE from customers
where customerID = 19;

-- Update the number of equipments in a particular location
update inventory
join Equipment E on Inventory.equipmentID = E.equipmentID
join Locations L on Inventory.locationID = L.locationID
set equipmentQuantity = 10
where locationAddress = '14216 Monica Way' and equipmentName = 'Dumbbells'

-- Query to UPDATE the schedule of a location
Delete from inventory
