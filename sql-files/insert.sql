-- Warehouses
INSERT INTO warehouse VALUES ('Toronto Warehouse Station', 150, 150, 30);
INSERT INTO warehouse VALUES ('Markham Warehouse Station', 300, 300, 30);
INSERT INTO warehouse VALUES ('Missisauga Warehouse Station', 350, 350, 30);

-- Employees 
INSERT INTO employee VALUES ('550e8400-e29b-41d4-a716-446655440000', 0, 'joe bill', '2014-09-22', '123 Main Street, Toronto, ON', 'Operations', 'Senior Manager', NULL, 'Toronto Warehouse Station', 120000);
INSERT INTO employee VALUES ('5bc8d585-4061-4b21-9faf-84bc6b5abb04', 1, 'gabriel berkley', '2016-09-22', '124 Main Street, Toronto, ON', 'Operations', 'Warehouse Worker', '550e8400-e29b-41d4-a716-446655440000', 'Markham Warehouse Station', 60000);
INSERT INTO employee VALUES ('ca65d9b0-31a5-4831-90d6-73bbf9085ed6', 2, 'sally dal', '2018-09-22', '125 Main Street, Toronto, ON', 'Operations', 'Warehouse Worker', '550e8400-e29b-41d4-a716-446655440000', 'Missisauga Warehouse Station', 60000);
INSERT INTO employee VALUES ('d0b3d8f5-6e8c-4f4a-9e10-7a3cfa29f4a2', 3, 'michael chan', '2019-05-10','126 Main Street, Toronto, ON','Logistics', 'Logistics Coordinator','550e8400-e29b-41d4-a716-446655440000', 'Toronto Warehouse Station', 85000);
INSERT INTO employee VALUES ('f1c2a7b8-91d3-4d64-8a1c-6d2b9c7e1a55', 4, 'rachel wong', '2020-03-15', '127 Main Street, Toronto, ON', 'Logistics', 'Inventory Specialist', '550e8400-e29b-41d4-a716-446655440000', 'Toronto Warehouse Station', 75000);
INSERT INTO employee VALUES ('a9e7c4d2-7f25-4b39-bfae-2cde8c9451b3', 5, 'daniel smith', '2021-11-01', '128 Main Street, Toronto, ON', 'Operations', 'Forklift Operator','550e8400-e29b-41d4-a716-446655440000', 'Toronto Warehouse Station', 55000);
INSERT INTO employee VALUES ('a201f437-2b53-4c6b-b1c5-f27a85093a1f', 6, 'james wong', '2010-03-15', '127 Main Street, Toronto, ON', 'Sales', 'VP of Sales', NULL, 'Toronto Warehouse Station', 125000);
INSERT INTO employee VALUES ('ecbfd4e8-fe20-4577-89d9-50baf59cbd1c', 7, 'betty smiths', '2016-11-01', '128 Main Street, Toronto, ON', 'Sales', 'Sales Associate','a201f437-2b53-4c6b-b1c5-f27a85093a1f', 'Toronto Warehouse Station', 80000);

-- Company vans 
INSERT INTO companyVan VALUES ('KZNF 921', '2020-09-22', 'van', 1000);
INSERT INTO companyVan VALUES ('ADJY 121', '2014-09-22', 'van', 10000);
INSERT INTO companyVan VALUES ('BBBB 111', '2018-09-22', 'van', 3000);
INSERT INTO companyVan VALUES ('CERY 649', '2024-09-22', 'van', 100);

-- Drives 
INSERT INTO drives VALUES('5bc8d585-4061-4b21-9faf-84bc6b5abb04', 'KZNF 921', '2020-09-22');
INSERT INTO drives VALUES('ca65d9b0-31a5-4831-90d6-73bbf9085ed6', 'ADJY 121', '2021-09-22');
INSERT INTO drives VALUES('5bc8d585-4061-4b21-9faf-84bc6b5abb04', 'BBBB 111', '2023-04-01');
INSERT INTO drives VALUES('ca65d9b0-31a5-4831-90d6-73bbf9085ed6', 'CERY 649', '2025-07-22');
INSERT INTO drives VALUES('5bc8d585-4061-4b21-9faf-84bc6b5abb04', 'KZNF 921', '2021-01-02');
INSERT INTO drives VALUES('ca65d9b0-31a5-4831-90d6-73bbf9085ed6', 'ADJY 121', '2015-06-13');

-- Floor numbers
INSERT INTO floorNumber VALUES ('Toronto Warehouse Station', 1);
INSERT INTO floorNumber VALUES ('Markham Warehouse Station', 1);
INSERT INTO floorNumber VALUES ('Markham Warehouse Station', 2);
INSERT INTO floorNumber VALUES ('Markham Warehouse Station', 3);
INSERT INTO floorNumber VALUES ('Missisauga Warehouse Station', 1);
INSERT INTO floorNumber VALUES ('Missisauga Warehouse Station', 2);

-- Warehouse schedule 
INSERT INTO warehouseSchedule VALUES ('Toronto Warehouse Station', 0, 0, 0, '2020-09-22 14:30', '2020-09-22 18:30');
INSERT INTO warehouseSchedule VALUES ('Toronto Warehouse Station', 1, 1, 0, '2020-09-22 14:30', '2020-09-22 18:30');
INSERT INTO warehouseSchedule VALUES ('Toronto Warehouse Station', 4, 5, 0, '2020-09-22 14:30', '2020-09-22 18:30');
INSERT INTO warehouseSchedule VALUES ('Toronto Warehouse Station', 3, 2, 0, '2020-09-22 14:30', '2020-09-22 18:30');
INSERT INTO warehouseSchedule VALUES ('Markham Warehouse Station', 4, 5, 0, '2017-09-22 14:30', '2020-09-22 18:30');
INSERT INTO warehouseSchedule VALUES ('Missisauga Warehouse Station', 3, 2, 0, '2020-09-22 10:30', '2020-09-22 18:30');

-- Customers
INSERT INTO CUSTOMER
VALUES ('rogan@gmail.com', 'Rogan', 'Duenas', '131 Phantom Avenue', 'thief123', '1');
INSERT INTO CUSTOMER
VALUES ('kevin@gmail.com', 'Kevin', 'Munich', '1101 Yonge Street', 'imamunch15', '2');
INSERT INTO CUSTOMER
VALUES ('joker@gmail.com', 'Joe', 'Kerr', '16 Shibuya Road', 't4ke0v3r', '3');

-- Sellers
INSERT INTO SELLER
VALUES('paymepls@yahoo.ca', 'BeggingCo', '911 Jays Boulevard', 'PLEASEPLEASEPLEASE', '1');
INSERT INTO SELLER
VALUES('Joejoeson@hotmail.com', 'JoesAndStuff', '10 Joseph Street', 'MYNAMEISNOTJOE', '2');
INSERT INTO SELLER
VALUES('bryce@papen.com', 'RiceBowels', '113 Brooke Road', 'IMINEVERYTHING', '3');

-- Products
INSERT INTO PRODUCT
VALUES('1', 'Calc', '15.99', 'Slang, short for calculator.', '50', '2', 'Joejoeson@hotmail.com');
INSERT INTO PRODUCT
VALUES('2', 'Purse', '25.00', 'Please own one of our purses!', '5', '3', 'bryce@papen.com');
INSERT INTO PRODUCT
VALUES('3', 'Cards', '8.99', 'These cards are overpriced.', '100', '1', 'paymepls@yahoo.ca');

-- Info for different orders
INSERT INTO ORDERINF
VALUES('1', '2', '1', '3', 'gift_card','2025-01-01');
INSERT INTO ORDERINF
VALUES('2', '3', '1', '1', 'debit','2025-02-08');
INSERT INTO ORDERINF
VALUES('3', '1', '1', '1', 'credit','2025-03-05');
INSERT INTO ORDERINF
VALUES('4', '2', '1', '1', 'gift_card', '2025-10-06');
