# bedu

Sesion 1

#### CHALLANGE ####

use tienda;

show tables;

describe articulo;

#tipo descripcion

#id_articulo int
#nombre double
#precio double
#iva double
#cantidad int

describe puesto;

#tipo descripcion
#id_puesto int
#nombre varchar(45)
#salario double

describe venta;

#tipo descripcion
#id_venta int
#id_articulo int
#id_empleado int
#clave varchar(45)
#fecha timestamp

# Usando la tabla empleados, escribe consultas que permitan responder las siguientes preguntas.

SELECT 
	* 
FROM 
	empleado;

#¿Cuál es el nombre de los empleados con el puesto 4?

SELECT 
	* 
FROM 
	empleado 
WHERE 
	id_puesto=4;

#¿Qué puestos tienen un salario mayor a $10,000?

SELECT 
	e.nombre, e.apellido_paterno, e.apellido_materno 
FROM 
	empleado e, puesto s
WHERE
	e.id_puesto = s.id_puesto and s.salario > 10000;

#¿Qué articulos tienen un precio mayor a $1,000 y un iva mayor a 100?

SELECT 
	* 
FROM 
	articulo 
WHERE 
	precio > 1000 and iva > 100;

#¿Qué ventas incluyen los artículos 135 o 963 y fueron hechas por los empleados 835 o 369?

SELECT
	*
FROM 
	venta v
WHERE
	v.id_articulo IN( 135, 963) and v.id_empleado in( 835, 369 );

#Usando la base de datos tienda, escribe una consulta que permita obtener el top 5 de puestos por salarios.

SELECT
	* 
FROM 
	puesto
ORDER BY salario DESC
LIMIT 5;

################################################################################################################

# Dentro del mismo servidor de bases de datos, conéctate al esquema classicmodels.

use classicmodels;

# Dentro de la tabla employees, obtén el apellido de todos los empleados.

SELECT 
	lastname 
FROM 
	employees;

# Dentro de la tabla employees, obtén el apellido, nombre y puesto de todos los empleados.

SELECT 
	e.firstName, e.lastName, e.jobTitle 
FROM 
	employees e;

# Dentro de la tabla employees, obtén todos los datos de cada empleado.

SELECT 
	* 
FROM
	employees;
    
# Dentro de la tabla employees, obtén el apellido, nombre y puesto de todos los empleados que tengan el puesto Sales Rep.

	SELECT 
		e.firstName, e.lastName, e.jobTitle
	FROM 
		employees e 
	WHERE
		e.jobTitle = 'Sales Rep';

# Dentro de la tabla employees, obtén el apellido, nombre, puesto y código de oficina de todos los empleados que tengan el puesto Sales Rep y código de oficina 1.

	SELECT 
		e.firstName, e.lastName, e.jobTitle, e.officeCode
	FROM 
		employees e 
	WHERE
			e.jobTitle = 'Sales Rep'
        AND 
			e.officeCode=1;

# Dentro de la tabla employees, obtén el apellido, nombre, puesto y código de oficina de todos los empleados que tengan el puesto Sales Rep o código de oficina 1.

	SELECT 
		e.firstName, e.lastName, e.jobTitle, e.officeCode
	FROM 
		employees e 
	WHERE
			e.jobTitle = 'Sales Rep'
        AND 
			e.officeCode=1;


# Dentro de la tabla employees, obtén el apellido, nombre y código de oficina de todos los empleados que tenga código de oficina 1, 2 o 3.

	SELECT 
		e.firstName, e.lastName, e.jobTitle, e.officeCode
	FROM 
		employees e 
	WHERE
			e.jobTitle = 'Sales Rep'
        AND 
			e.officeCode IN( 1,2,3 );

# Dentro de la tabla employees, obten el apellido, nombre y puesto de todos los empleados que tengan un puesto distinto a Sales Rep.

	SELECT 
		e.nombre, e.apellido_paterno, e.apellido_materno, p.nombre 
	FROM 
		bedu.empleado e INNER JOIN bedu.puesto p ON e.id_puesto = p.id_puesto 
		AND
		p.nombre not like 'Sales Representative';

	SELECT 
		e.firstName, e.lastName, e.jobTitle, e.officeCode
	FROM 
		employees e 
	WHERE
		e.jobTitle NOT LIKE 'Sales Rep';
        
# Dentro de la tabla employees, obtén el apellido, nombre y código de oficina de todos los empleados cuyo código de oficina sea mayor a 5.

	SELECT 
		e.firstName, e.lastName, e.jobTitle, e.officeCode
	FROM 
		employees e 
	WHERE
		e.officeCode > 5;
    
            
# Dentro de la tabla employees, obtén el apellido, nombre y código de oficina de todos los empleados cuyo cdigo de oficina sea menor o igual 4.

	SELECT 
		e.firstName, e.lastName, e.jobTitle, e.officeCode
	FROM 
		employees e 
	WHERE
		e.officeCode <= 4;
    

# Dentro de la tabla customers, obtén el nombre, país y estado de todos los clientes cuyo país sea USA y cuyo estado sea CA.

	SELECT 
		c.customerName, c.country, c.state
	FROM 
		customers c 
	WHERE
		c.country='USA' and c.state='CA';

# Dentro de la tabla customers, obtén el nombre, país, estado y límite de crédito de todos los clientes cuyo país sea, USA, cuyo estado sea CA y cuyo límite de crédito sea mayor a 100000.

	SELECT 
		c.customerName, c.country, c.state, c.creditLimit
	FROM 
		customers c 
	WHERE
		c.country='USA' AND c.state='CA' AND creditLimit > 100000;

# Dentro de la tabla customers, obtén el nombre y país de todos los clientes cuyo país sea USA o France.

	SELECT 
		c.customerName, c.country, c.state, c.creditLimit
	FROM 
		customers c 
	WHERE
		c.country IN ('USA','FRANCE') 
	ORDER BY 
		c.country ASC;
        
# Dentro de la tabla customers, obtén el nombre, pas y límite de crédito de todos los clientes cuyo país sea USA o France y cuyo límite de crédito sea mayor a 100000. Para este ejercicio ten cuidado con los paréntesis.

	SELECT 
		c.customerName, c.country, c.state, c.creditLimit
	FROM 
		customers c 
	WHERE
		c.country IN ('USA','FRANCE') AND c.creditLimit > 100000
	ORDER BY 
		c.country ASC;
        
# Dentro de la tabla offices, obtén el código de la oficina, ciudad, teléfono y país de aquellas oficinas que se encuentren en USA o France.

SELECT 
	officeCode, city, phone, country
FROM
	offices
WHERE
	country IN( 'USA', 'FRANCE' );

# Dentro de la tabla offices, obtén el código de la oficina, ciudad, teléfono y país de aquellas oficinas que no se encuentren en USA o France.

SELECT 
	officeCode, city, phone, country
FROM
	offices
WHERE
	country NOT IN( 'USA', 'FRANCE' );

# Dentro de la tabla orders, obtén el número de orden, número de cliente, estado y fecha de envío de todas las órdenes con el número 10165, 10287 o 10310.

SELECT 
	orderNumber, customerNumber, status, shippedDate
FROM 
	orders
WHERE 
	orderNumber IN (10165, 10287, 10310);


# Dentro de la tabla customers, obtén el apellido y nombre de cada cliente y ordena los resultados por apellido de forma ascendente.

SELECT 
	contactFirstName, contactLastName
FROM
	customers
ORDER BY 
	contactLastName ASC;

# Dentro de la tabla customers, obtén el apellido y nombre de cada cliente y ordena los resultados por apellido de forma descendente.

SELECT 
	contactFirstName, contactLastName
FROM
	customers
ORDER BY 
	contactLastName DESC;
    
# Dentro de la tabla customers, obtén el apellido y nombre de cada cliente y ordena los resultados por apellido de forma descendente y luego por nombre de forma ascendente.

SELECT 
	contactFirstName, contactLastName
FROM
	customers
ORDER BY 
	contactLastName DESC, 
    contactFirstName ASC;
    
# Dentro de la tabla customers, obtén el número de cliente, nombre de cliente y el límite de crédito de los cinco clientes con el límite de crédito más alto (top 5).

SELECT 
	c.customerNumber, c.customerName, c.creditLimit
FROM
	customers c
ORDER BY
	creditLimit DESC
LIMIT 5;

# Dentro de la tabla customers, obtén el número de cliente, nombre de cliente y el límite de crédito de los cinco clientes con el límite de crédito más bajo.

SELECT 
	c.customerNumber, c.customerName, c.creditLimit
FROM
	customers c
ORDER BY
	creditLimit ASC
LIMIT 5;
