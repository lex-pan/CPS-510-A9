CREATE TABLE warehouse (
    address    TEXT PRIMARY KEY,
    x          INTEGER,
    y          INTEGER,
    z          INTEGER
);

CREATE TABLE employee (
    id             TEXT PRIMARY KEY,
    sin            INTEGER UNIQUE,
    name           TEXT, 
    start_date     TEXT,
    home_address   TEXT,
    department     TEXT,
    title          TEXT,
    manager_id     TEXT,
    office_address TEXT,              
    salary         REAL, 
    FOREIGN KEY (office_address) REFERENCES warehouse(address),
    FOREIGN KEY (manager_id) REFERENCES employee(id)
);

CREATE TABLE companyVan (
    plate            TEXT PRIMARY KEY,
    date_of_purchase TEXT,
    model            TEXT,
    mileage          INTEGER
);

CREATE TABLE drives (
    employee_id TEXT,
    plate       TEXT,
    drive_date  TEXT,
    PRIMARY KEY (employee_id, plate, drive_date),
    FOREIGN KEY(employee_id) REFERENCES employee(id),
    FOREIGN KEY (plate) REFERENCES companyVan(plate)
);

CREATE TABLE floorNumber (
    office_address TEXT,
    floor_number   INTEGER,
    PRIMARY KEY (office_address, floor_number),
    FOREIGN KEY (office_address) REFERENCES warehouse(address)
);

CREATE TABLE warehouseSchedule (
    address        TEXT,
    x              INTEGER,
    y              INTEGER,
    z              INTEGER,
    arrival_date   TEXT,
    departure_date TEXT,
    PRIMARY KEY (address, x, y, z, arrival_date),
    FOREIGN KEY (address) REFERENCES warehouse(address)
);

CREATE TABLE customer (
	email	     VARCHAR2(100) NOT NULL UNIQUE,
	firstN	     VARCHAR2(50) NOT NULL,
	lastN	     VARCHAR2(50) NOT NULL,
	homeAdd	     VARCHAR2(300) NOT NULL,
	password     VARCHAR2(30) NOT NULL,
	customerID   char(20) NOT NULL PRIMARY KEY
);

CREATE TABLE seller (
	email	     VARCHAR2(100) NOT NULL,
	name	     VARCHAR2(50) NOT NULL,
	address	     VARCHAR2(300) NOT NULL,
	password     VARCHAR2(30) NOT NULL,
	sellerID     char(20) NOT NULL,
	PRIMARY KEY(email, sellerID)
);

CREATE TABLE product (
	productID CHAR(20) PRIMARY KEY NOT NULL,
	productName VARCHAR2(50) NOT NULL,
	price NUMBER(10, 2) NOT NULL,
	productdesc VARCHAR2(500),
	quantity NUMBER(5) NOT NULL CHECK (quantity >= 0),
	sellerID CHAR(20) NOT NULL,
    sellerEmail  VARCHAR2(100) NOT NULL,
    CONSTRAINT fk_product_seller
        FOREIGN KEY (sellerEmail, sellerID) REFERENCES seller(email, sellerID)
);

CREATE TABLE orderInf (
	orderID      VARCHAR2(36) PRIMARY KEY,
	productID    CHAR(20) NOT NULL,
	numItem	     NUMBER NOT NULL,
	userAttached CHAR(20) NOT NULL,
	payMethod    VARCHAR2(50) NOT NULL,
	dateBought   DATE NOT NULL,
	CONSTRAINT fk_order_product
		FOREIGN KEY (productID) REFERENCES product(productID),
	CONSTRAINT fk_order_customer
		FOREIGN KEY (userAttached) REFERENCES customer(customerID),
	CONSTRAINT fk_order_payment
		FOREIGN KEY (payMethod) REFERENCES paymentInfo(payType)
);

CREATE TABLE review (
    rating NUMBER(1, 0) CHECK (rating BETWEEN 1 AND 5),
    productID CHAR(20) NOT NULL REFERENCES product(productID),
    revContent VARCHAR2(400),
    customerID CHAR(20) NOT NULL REFERENCES customer(customerID)
);

-- Views
CREATE VIEW carsForRetirement AS
SELECT * 
FROM companyVan
WHERE mileage >= 10000 OR CAST(strftime('%Y', date_of_purchase) AS INTEGER) < 2020;

CREATE VIEW employeesByDepartment AS
SELECT department, COUNT(*) AS employee_count 
FROM employee 
GROUP BY department;

CREATE VIEW freedUpCoordinates AS
SELECT x, y, z 
FROM warehouseSchedule
WHERE address = 'Toronto Warehouse Station' AND date(departure_date) = '2020-09-22';
