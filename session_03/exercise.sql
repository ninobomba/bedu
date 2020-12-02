-- Para estas consultas usa RIGHT JOIN
-- Obten el código de producto, nombre de producto y descripción de todos los productos.

    SELECT
        productCode, productName, productDescription
    FROM
        products;

-- Obten el número de orden, estado y costo total de cada orden.

    SELECT
        orders.orderNumber, orders.status, SUM( payments.amount ) AS TOTAL
    FROM
        orders
    RIGHT JOIN payments
        ON orders.customerNumber = payments.customerNumber
    GROUP BY
        orders.orderNumber, orders.status
    ORDER BY
        orders.orderNumber DESC;

-- Obten el número de orden, fecha de orden, línea de orden, nombre del producto, cantidad ordenada y precio de cada pieza que muestre los detalles de cada orden.

    SELECT
        orders.orderNumber, orders.requiredDate,
        products.productName,
        orderdetails.orderLineNumber, orderdetails.quantityOrdered, orderdetails.priceEach
    FROM orders
        RIGHT JOIN orderdetails
            ON orders.orderNumber = orderdetails.orderNumber
        RIGHT JOIN products
            ON products.productCode = orderdetails.productCode
    ORDER BY orders.orderNumber DESC;

-- Obtén el número de orden, nombre del producto, el precio sugerido de fábrica (msrp) y precio de cada pieza.

    SELECT
        orders.orderNumber,
        orderdetails.priceEach,
        products.productName, products.msrp
    FROM orders
        RIGHT JOIN orderdetails
            ON orders.orderNumber = orderdetails.orderNumber
        RIGHT JOIN products
            ON products.productCode = orderdetails.productCode;

-- Para estas consultas usa LEFT JOIN
-- Obtén el número de cliente, nombre de cliente, número de orden y estado de cada cliente.
--  ¿De qué nos sirve hacer LEFT JOIN en lugar de JOIN? La tabla de la izquierda tiene valores enontrados mientras con la derecha pueden ser nulls

    SELECT
        customers.customerNumber, customers.customerName,
        orders.customerNumber, orders.status
    FROM
        customers LEFT JOIN orders
            ON customers.customerNumber = orders.customerNumber;

-- Obtén los clientes que no tienen una orden asociada.

    SELECT
        customers.customerNumber, customers.customerName,
        orders.customerNumber, orders.status
    FROM
        customers LEFT JOIN orders
            ON customers.customerNumber = orders.customerNumber;


-- Obtén el apellido de empleado, nombre de empleado, nombre de cliente, número de cheque y total, es decir, los clientes asociados a cada empleado.
--  ¿Representan lo mismo ? cambia el contexto dado que la prioridad por encontrar valores en la tabla de la derecha toma prioridad sobre lo de la izquierda.
    SELECT
        employees.firstName, employees.lastname,
        customers.customerName,
        payments.checkNumber,
        SUM( amount) as TOTAL
    FROM
        customers
        LEFT JOIN employees
            ON customers.salesRepEmployeeNumber = employees.employeeNumber
        LEFT JOIN payments
            ON payments.customerNumber = customers.customerNumber
    GROUP BY 1, 2, 3, 4;

-- Para estas consultas usa RIGHT JOIN
-- Repite los ejercicios 5 a 7 usando RIGHT JOIN.
-- 5 Obtén el número de cliente, nombre de cliente, número de orden y estado de cada cliente.

    SELECT
        customers.customerNumber, customers.customerName,
        orders.customerNumber, orders.status
    FROM
        customers
        RIGHT JOIN orders
            ON customers.customerNumber = orders.customerNumber;

-- 6 Obtén los clientes que no tienen una orden asociada.

-- 7 Obtén el apellido de empleado, nombre de empleado, nombre de cliente, número de cheque y total, es decir, los clientes asociados a cada empleado.
    SELECT
        employees.firstName, employees.lastname,
        customers.customerName,
        payments.checkNumber,
        SUM( amount) as TOTAL
    FROM
        customers
        RIGHT JOIN employees
            ON customers.salesRepEmployeeNumber = employees.employeeNumber
        RIGHT JOIN payments
            ON payments.customerNumber = customers.customerNumber
    GROUP BY 1, 2, 3, 4;

-- Escoge 3 consultas de los ejercicios anteriores, crea una vista y escribe una consulta para cada una.

    CREATE VIEW V1 AS
    SELECT
        productCode, productName, productDescription
    FROM
        products;

    SELECT * FROM V1 LIMIT 10;

    CREATE VIEW V2 AS
    SELECT
        orders.orderNumber, orders.status, SUM( payments.amount ) AS TOTAL
    FROM orders RIGHT JOIN payments ON orders.customerNumber = payments.customerNumber
    GROUP BY
        orders.orderNumber, orders.status
    ORDER BY
        orders.orderNumber DESC;

    SELECT * FROM V2 LIMIT 10;

    CREATE VIEW V3 AS
    SELECT
        orders.orderNumber, orders.requiredDate,
        products.productName,
        orderdetails.orderLineNumber, orderdetails.quantityOrdered, orderdetails.priceEach
    FROM orders
        RIGHT JOIN orderdetails
            ON orders.orderNumber = orderdetails.orderNumber
        RIGHT JOIN products
            ON products.productCode = orderdetails.productCode
    ORDER BY orders.orderNumber DESC;

    SELECT * FROM V3 LIMIT 10;

