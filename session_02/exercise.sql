#Dentro de la tabla employees, obten el número de empleado, apellido y nombre de todos los empleados cuyo nombre empiece con a.

    SELECT
        e.employeeNumber, e.firstName, e.lastName
    FROM
        employees e
    WHERE
        UPPER(e.firstName) LIKE 'A%';

# Dentro de la tabla employees, obten el número de empleado, apellido y nombre de todos los empleados cuyo nombre termina con on.

    SELECT
        e.employeeNumber, e.firstName, e.lastName
    FROM
        employees e
    WHERE
        UPPER(e.firstName) LIKE '%ON';

#Dentro de la tabla employees, obten el número de empleado, apellido y nombre de todos los empleados cuyo nombre incluye la cadena on.

    SELECT
        e.employeeNumber, e.firstName, e.lastName
    FROM
        employees e
    WHERE
        UPPER(e.firstName) LIKE '%ON%';

#Dentro de la tabla employees, obten el número de empleado, apellido y nombre de todos los empleados cuyos nombres tienen tres letras e inician con T y finalizan con m.

    SELECT
        e.employeeNumber, e.firstName, e.lastName
    FROM
        employees e
    WHERE
            LENGTH(e.firstName) = 3
        AND
            UPPER(e.firstName) LIKE 'T%'
        AND
            UPPER(e.firstName) LIKE '%M';

#Dentro de la tabla employees, obten el número de empleado, apellido y nombre de todos los empleados cuyo nombre no inicia con B.

    SELECT
        e.employeeNumber, e.firstName, e.lastName
    FROM
        employees e
    WHERE
            UPPER(e.firstName) LIKE 'B%';


#Dentro de la tabla products, obten el código de producto y nombre de los productos cuyo código incluye la cadena _20.

    SELECT
        productCode, productName
    FROM
        products p
    WHERE
        productCode LIKE '%\_20%';

# Dentro de la tabla orderdetails, obten el total de cada orden.

    SELECT
        o.orderNumber, SUM(o.priceEach) AS TOTAL
    FROM
        orderdetails o
    GROUP BY
        o.orderNumber
    ORDER BY
        o.orderNumber ASC;

# Dentro de la tabla orders obten el número de órdenes por año.

    SELECT YEAR(orderDate) FROM orders;

    SELECT
        SUM(o.orderNumber) AS TOTAL, YEAR(o.orderDate)
    FROM
        orders o
    GROUP BY
        YEAR(o.orderDate);


# Obten el apellido y nombre de los empleados cuya oficina está ubicada en USA.

    SELECT
        e.firstName, e.lastName, o.country
    FROM
        employees e INNER JOIN offices o ON e.officeCode = o.officeCode
    AND
        o.country = 'USA';

# Obten el número de cliente, número de cheque y cantidad del cliente que ha realizado el pago más alto.

    SELECT
        c.customerNumber, p.checkNumber, r.amount
    FROM
        ( SELECT * FROM payments ORDER BY amount DESC LIMIT 1 )  r,
        customers c,
        payments p
    WHERE
        c.customerNumber = p.customerNumber
        AND
        r.customerNumber = p.customerNumber;

# Obten el número de cliente, número de cheque y cantidad de aquellos clientes cuyo pago es más alto que el promedio.

    SELECT
        c.customerNumber, p.checkNumber, r.amount
    FROM
        ( SELECT * FROM payments WHERE payments.amount > (  SELECT AVG( payments.amount ) FROM payments ) ) r,
        customers c,
        payments p
    WHERE
        c.customerNumber = p.customerNumber
        AND
        r.customerNumber = p.customerNumber;

# Obten el nombre de aquellos clientes que no han hecho ninguna orden.

    select c.customerNumber, c.contactFirstName, c.contactLastName
    from orders o, customers c
    where c.customerNumber not in( o.customerNumber );

# Obten el máximo, mínimo y promedio del número de productos en las órdenes de venta.

    SELECT
        MIN(orderNumber) AS minimo,
        MAX(orderNumber) AS maximo,
        AVG(orderNumber) as promedio
    FROM orders;


# Dentro de la tabla orders, obten el número de órdenes que hay por cada estado.

    SELECT status, COUNT( status ) total
    FROM orders
    GROUP BY status;

