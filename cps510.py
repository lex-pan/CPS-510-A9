import sqlite3
from flask import Flask, render_template, request

app = Flask(__name__)

def get_db():
    conn = sqlite3.connect("fastgoods.db")
    conn.row_factory = sqlite3.Row
    return conn

# The menu page, goes to menu.html
@app.get("/")
def menu():
    action = request.args.get("action")
    fileName = None

    if action == "Create Tables":
        fileName = "schema"
    elif action == "Populate Tables":
        fileName = "insert"
    elif action == "Drop Tables":
        fileName = "drop_tables"

    if fileName != None:
        conn = sqlite3.connect("fastgoods.db")

        with open(f"sql-files/{fileName}.sql", "r") as f:
            sql_script = f.read()

        conn.executescript(sql_script)
        conn.commit()
        conn.close()

    return render_template("menu.html")

# Lists queries available for a user, if a query is selected, directs user to query result page 
# can go back to menu page 
@app.get("/queries")
def queries():
    available_queries = [
        {"description": "Select all employees that report to joe bill.", "query": "SELECT name FROM employee WHERE employee.manager_id = '550e8400-e29b-41d4-a716-446655440000';"},
        {"description": "Select number of company vans the company owns", "query": "SELECT COUNT(plate) FROM companyVan;"},
        {"description": "Get the mileage of the car gabriel berkeley drove on 2020-09-22", "query": "SELECT c.plate, c.mileage FROM companyVan c, employee e, drives d WHERE e.name = 'gabriel berkley'  AND e.id = d.employee_id AND d.drive_date = '2020-09-22' AND d.plate = c.plate; " },
        {"description": "All users.", "query": "SELECT email, customerID FROM customer;" },
        {"description": "All sellers with products that have 10+ items in stock", "query": "SELECT p.productID, p.quantity, s.name, s.email FROM product p, seller s WHERE p.quantity >= '10' AND p.sellerID = s.sellerID;"},
        {"description": "Orders made after 2025-03-01.", "query": "SELECT o.orderID, o.dateBought, o.userAttached, c.firstN FROM orderInf o, customer c WHERE o.dateBought >= '2025-03-05' AND o.userAttached = c.customerID;"},
        {"description": "Shows all reviews with a rating higher than 3", "query": "SELECT * FROM review WHERE rating >= '3'"}
    ]

    return render_template("queries.html", available_queries=available_queries)

# lists the result of a query, can go back to menu or available queries 
@app.route("/query-result", methods=["POST"])
def query_result():
    query_to_run = request.form.get("query")
    print(query_to_run)
    results = None
    column_names = []

    if query_to_run != None:
        conn = get_db()
        cur = conn.cursor()
        cur.execute(query_to_run)
        results = cur.fetchall()
        conn.close()
        if results != None:
            column_names = results[0].keys()

    print([dict(r) for r in results])

    return render_template("query_result.html", results=results, column_names=column_names)

if __name__ == "__main__":
    app.run(debug=True)


'''

-- select employees who drove cars on 2023-04-01
SELECT name 
FROM employee e, drives d 
WHERE d.drive_date = '2023-04-01' AND d.employee_id = e.id; 

-- Sort warehouses by size 
SELECT address, (x * y * z) AS VOLUME 
FROM warehouse 
ORDER BY (x * y * z) DESC; 

-- select distinct grid coordinates occupied at Toronto Warehouse Station on 2020-09-22
SELECT DISTINCT x, y, z 
FROM warehouseschedule w 
WHERE TRUNC(w.arrival_date) = DATE '2020-09-22'; 

-- select number of floors belonging to markham warehouse station ascending
SELECT floor_number 
FROM floorNumber f 
WHERE f.office_address = 'Markham Warehouse Station' 
ORDER BY floor_number ASC;

--Get the floors and dimensions of the building that sally dal works at
SELECT f.floor_number, w.x, w.y, w.z 
FROM floorNumber f, employee e, warehouse w 
WHERE e.name = 'sally dal' AND e.office_address = w.address AND w.address = f.office_address;
'''
