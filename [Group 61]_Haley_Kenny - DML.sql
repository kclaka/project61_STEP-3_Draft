-- This file contains Database Manipulation queries for the Well Life Project. 
-- Query to add a new character functionality with colon : character being used to 
-- denote the variables that will have data from the backend programming language




-- Query for  all customer and customer information
select * from customers;

-- Query for transaction by a particular customer
select * from transactions
JOIN Customers C on Transactions.CustomerID = C.customerID
WHERE c.fname = 'TAMAR';

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
