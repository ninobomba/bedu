use tienda;

show tables;

    describe articulo;

    describe puesto;

    describe venta;

--  Usando la tabla empleados, escribe consultas que permitan responder las siguientes preguntas.

    SELECT
        *
    FROM
        empleado;

-- ¿Cuál es el nombre de los empleados con el puesto 4?

    SELECT
        *
    FROM
        empleado
    WHERE
        id_puesto=4;

-- ¿Qué puestos tienen un salario mayor a $10,000?

    SELECT
        e.nombre, e.apellido_paterno, e.apellido_materno
    FROM
        empleado e, puesto s
    WHERE
        e.id_puesto = s.id_puesto and s.salario > 10000;

-- ¿Qué articulos tienen un precio mayor a $1,000 y un iva mayor a 100?

    SELECT
        *
    FROM
        articulo
    WHERE
        precio > 1000 and iva > 100;

-- ¿Qué ventas incluyen los artículos 135 o 963 y fueron hechas por los empleados 835 o 369?

    SELECT
        *
    FROM
        venta v
    WHERE
        v.id_articulo IN( 135, 963) and v.id_empleado in( 835, 369 );

-- Usando la base de datos tienda, escribe una consulta que permita obtener el top 5 de puestos por salarios.

    SELECT
        *
    FROM
        puesto
    ORDER BY salario DESC
    LIMIT 5;