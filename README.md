# MySQL-Subquery-and-View

**Subquery**

     A subquery in SQL is a query nested within another SQL query, commonly embedded in the WHERE clause.
   
**Types of Subqueries:**

    1.Scalar subquery(Single-Row Subquery)-Returns only one row of data.Typically used with comparison operators like =, <, >, etc.
                                      
    eg:SELECT name, salary FROM employees WHERE salary > (SELECT AVG(salary) FROM employees);
    Here, the subquery calculates the average salary, and the outer query selects employees with a salary above the average.

    2.Multiple Row Subquery(Multi-row subquery)-Returns multiple rows of data.Used with operators like IN, ANY, ALL, etc.

    eg:SELECT name FROM employees WHERE department_id IN (SELECT department_id FROM departments WHERE location = 'New York');
    The subquery gets all department_ids in New York, and the outer query retrieves employees working in those departments.

    3.Correlated Subquery-Subquery where the inner query depends on the outer query for its values.For correlated subqueries, 
    the inner query is executed once for each row processed by the outer query.

    eg:SELECT name FROM employees e1 WHERE salary > (SELECT MAX(salary)FROM employees e2 WHERE e2.department_id = e1.department_id);
    Here, the subquery calculates the maximum salary within the department of each employee and the outer query display the name of 
    employees whose salary greater than the result of the subquery.

    4.Nested subquery- Asubquery within another subquery.It involves multiple levels of queries where one subquery's result is used 
    as input for another subquery or the outermost query.

    eg:SELECT name FROM employees WHERE employee_id= (SELECT employee_id FROM departments WHERE department_id = (SELECT department_id 
    FROM locations WHERE location ='NewYork'));
    Here, the innermost subquery gets department_id with location New York,the middle query gets the employee id with the department id 
    received from innermost subquery and,the outer query display the name of such employee.

**Applications of Subquery:**

    1.Filter and manipulate data based on the result of another query.
   
    2.Simplify complex operations by breaking them into smaller, more manageable queries.
   
    3.Replace joins in some cases when a query involves calculations or aggregation.
   
    4.Improve data security by limiting access to sensitive data via views or specific conditions

**Views**

    A view is a virtual table in SQL that is based on the result of a SELECT query. It can simplify complex queries, provide data 
    security by restricting access to certain columns or rows.
   
    Syntax for creating view    :CREATE VIEW view_name AS SELECT column1, column2, ...FROM table_name;
    
    Syntax for inserting values :INSERT INTO view_name (column1, column2, ...) VALUES (value1, value2, ...);
    
    Syntax for updating values  :UPDATE view_name SET column1 = value1, column2 = value2, ...WHERE condition;
    
    Syntax for deleting values  :DELETE FROM view_name WHERE condition;
    
    Syntax for altering view    :ALTER VIEW view_name AS SELECT column1, column2, ...FROM table_name WHERE condition;
    
    Syntax for dropping view    :DROP VIEW view_name;
    
    Syntax for displaying view  :SELECT * FROM view_name;
   
**Types of Views:**

    1.Simple Views:A simple view is based on a single table or a single SELECT query.It can contain only one SELECT statement 
                   and cannot have complex features like joins, subqueries, or aggregations.Simple views, are updatable,which
                   means we can perform INSERT, UPDATE, or DELETE operations on the view, and those changes 
                   will affect the underlying tables.

     eg:CREATE VIEW simple_view AS SELECT name, salary FROM employees;


    2.Complex Views:A complex view is created from multiple tables using joins, subqueries, and aggregations.Complex views may 
                    involve multiple SELECT statements and can be based on more sophisticated queries.Complex views are often 
                    read-only, but they can sometimes be updated if the view is not too complex (e.g., it does not involve grouping
                    or aggregation).
                   
     eg:CREATE VIEW complex_view AS SELECT e.name, e.salary, d.department_name FROM employees e JOIN departments d ON 
        e.department_id = d.department_id;

**Applications of Views:**

     1.Simplifying Complex Queries: Encapsulate complex SQL queries to be reused.
     2.Data Abstraction: Present a simplified version of complex data structures.
     3.Reusability: Reuse complex logic without writing it repeatedly.
     4.Data Security: Restrict access to sensitive data by exposing only necessary columns/rows.
     5.Consistency: Ensure uniform logic for all users and applications.
