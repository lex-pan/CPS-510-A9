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