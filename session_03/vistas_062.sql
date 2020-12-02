-- AÑADE A TODOS LOS NOMBRES DE TUS VISTAS EL SUFIJO _<tu identificador>. Por ejemplo mi_vista_hermosa_123.

-- Obtener el puesto de un empleado.

    CREATE VIEW v1_ffarfan_062 AS
	SELECT empleado.nombre, puesto.nombre AS puesto_nombre
    FROM empleado LEFT JOIN puesto ON empleado.id_puesto = puesto.id_puesto;

	SELECT * FROM v1_ffarfan_062;

-- Saber qué artículos ha vendido cada empleado.

    CREATE VIEW v2_062 AS
    SELECT
		articulo.nombre, empleado.nombre e_nombre
    FROM
		venta JOIN empleado ON empleado.id_empleado = venta.id_empleado
        JOIN articulo ON articulo.id_articulo = venta.id_articulo;

	SELECT * FROM v2_062;

    CREATE VIEW v21_ffarfan_062 AS
    SELECT v.clave, concat(e.nombre, ' ', e.apellido_paterno) nombre, a.nombre articulo
    FROM venta v
    JOIN empleado e
      ON v.id_empleado = e.id_empleado
    JOIN articulo a
      ON v.id_articulo = a.id_articulo
    ORDER BY v.clave;


-- Saber qué puesto ha tenido más ventas.

   CREATE VIEW v3_ffarfan_062 AS
    SELECT p.nombre, count(v.clave) total
    FROM venta v
    JOIN empleado e
      ON v.id_empleado = e.id_empleado
    JOIN puesto p
      ON e.id_puesto = p.id_puesto
    GROUP BY p.nombre;

    SELECT
        *
    FROM
        v3_ffarfan_062
    ORDER BY total DESC
    LIMIT 1;
