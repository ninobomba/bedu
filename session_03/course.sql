-- ¿Cuál es el nombre de los empleados que realizaron cada venta?

SELECT
	empleado.nombre, empleado.apellido_paterno, empleado.apellido_materno
FROM
	empleado JOIN venta ON empleado.id_empleado = venta.id_empleado;

-- ¿Cuál es el nombre de los artículos que se han vendido?

SELECT
	articulo.id_articulo, articulo.nombre
FROM
	articulo JOIN venta ON articulo.id_articulo = venta.id_articulo;

-- ¿Cuál es el total de cada venta?

SELECT
	venta.id_venta,  SUM( articulo.cantidad ) TOTAL
FROM venta JOIN articulo
	ON venta.id_articulo = articulo.id_articulo
GROUP BY 1;



show keys from venta;

SELECT *
FROM empleado AS e
JOIN puesto AS p
  ON e.id_puesto = p.id_puesto;

  SELECT *
  FROM puesto AS p
  LEFT JOIN empleado e
  ON p.id_puesto = e.id_puesto;

  SELECT *
  FROM empleado AS e
  RIGHT JOIN puesto AS p
  ON e.id_puesto = p.id_puesto;


  SELECT v.clave, v.fecha, a.nombre producto, a.precio, concat(e.nombre, ' ', e.apellido_paterno) empleado
  FROM venta v
  JOIN empleado e
    ON v.id_empleado = e.id_empleado
  JOIN articulo a
    ON v.id_articulo = a.id_articulo;

CREATE VIEW tickets_678 AS
(SELECT v.clave, v.fecha, a.nombre producto, a.precio, concat(e.nombre, ' ', e.apellido_paterno) empleado
FROM venta v
JOIN empleado e
  ON v.id_empleado = e.id_empleado
JOIN articulo a
  ON v.id_articulo = a.id_articulo);

  SELECT *
  FROM tickets_678;

  SELECT clave, round(sum(precio),2) total
  FROM tickets_678
  GROUP BY clave;
-- ¿Cuál es el nombre de los empleados cuyo sueldo es mayor a $100,000?

SELECT
    nombre, apellido_paterno
FROM
    empleado
WHERE
    id_puesto IN
 (SELECT id_puesto
      FROM puesto
      WHERE salario > 100000);

-- ¿Cuál es la cantidad mínima y máxima de ventas de cada empleado?

    SELECT id_empleado, min(total_ventas), max(total_ventas)
    FROM
     (SELECT
        clave, id_empleado, count(*) total_ventas
      FROM
        venta
      GROUP BY clave, id_empleado) AS sq
    GROUP BY id_empleado;

-- ¿Cuáles claves de venta incluyen artículos cuyos precios son mayores a $5,000?

    SELECT
        clave, id_articulo
    FROM
        venta
    WHERE id_articulo IN ( SELECT id_articulo FROM articulo WHERE precio > 5000 );

--  ¿Cuál es el nombre de los empleados que realizaron cada venta?

    SELECT clave, nombre, apellido_paterno
    FROM venta AS v
    JOIN empleado AS e
      ON v.id_empleado = e.id_empleado
    ORDER BY clave;

--  ¿Cuál es el nombre de los artículos que se han vendido?

    SELECT clave, nombre
    FROM venta AS v
    JOIN articulo AS a
      ON v.id_articulo = a.id_articulo
    ORDER BY clave;

--  ¿Cuál es el total de cada venta?

    SELECT clave, round(sum(precio),2) AS total
    FROM venta AS v
    JOIN articulo AS a
      ON v.id_articulo = a.id_articulo
    GROUP BY clave
    ORDER BY clave;

-- Obtener el puesto de un empleado.
    CREATE VIEW puestos AS
    SELECT concat(e.nombre, ' ', e.apellido_paterno), p.nombre
    FROM empleado e
    JOIN puesto p
      ON e.id_puesto = p.id_puesto;

-- Saber qué artículos ha vendido cada empleado.

    CREATE VIEW empleado_articulo AS
    SELECT v.clave, concat(e.nombre, ' ', e.apellido_paterno) nombre, a.nombre articulo
    FROM venta v
    JOIN empleado e
      ON v.id_empleado = e.id_empleado
    JOIN articulo a
      ON v.id_articulo = a.id_articulo
    ORDER BY v.clave;

-- Saber qué puesto ha tenido más ventas.

    CREATE VIEW puesto_ventas AS
    SELECT p.nombre, count(v.clave) total
    FROM venta v
    JOIN empleado e
      ON v.id_empleado = e.id_empleado
    JOIN puesto p
      ON e.id_puesto = p.id_puesto
    GROUP BY p.nombre;

    SELECT *
    FROM puesto_ventas
    ORDER BY total DESC
    LIMIT 1;
