select * from articulo;

-- ¿Qué artículos incluyen la palabra Pasta en su nombre?

SELECT
	*
FROM
	articulo
WHERE
	upper( nombre ) LIKE '%PASTA%';

-- ¿Qué artículos incluyen la palabra Cannelloni en su nombre?

SELECT
	*
FROM
	articulo
WHERE
	lower( nombre ) LIKE '%cannelloni%';

-- ¿Qué nombres están separados por un guión (-) por ejemplo Puree - Kiwi?

SELECT
	*
FROM
	articulo
WHERE
	lower( nombre ) LIKE '%-%';

-- ¿Qué puestos incluyen la palabra Designer?

SELECT
	*
FROM
	puesto
WHERE
	upper(nombre) like '%DESIGNER%';

-- ¿Qué puestos incluyen la palabra Developer?

SELECT
	*
FROM
	puesto
WHERE
	upper(nombre) like '%DEVELOPER%';

-- ------------------------------------------------

-- ¿Qué artículos incluyen la palabra Pasta en su nombre?

    SELECT
        *
    FROM
        articulo
    WHERE
        upper( nombre ) LIKE '%PASTA%';

-- ¿Qué artículos incluyen la palabra Cannelloni en su nombre?

    SELECT
        *
    FROM
        articulo
    WHERE
        lower( nombre ) LIKE '%cannelloni%';

-- ¿Qué nombres están separados por un guión (-) por ejemplo Puree - Kiwi?

    SELECT
        *
    FROM
        articulo
    WHERE
        lower( nombre ) LIKE '%-%';

-- ¿Qué puestos incluyen la palabra Designer?

    SELECT
        *
    FROM
        puesto
    WHERE
        upper(nombre) like '%DESIGNER%';

-- ¿Qué puestos incluyen la palabra Developer?

    SELECT
        *
    FROM
        puesto
    WHERE
        upper(nombre) like '%DEVELOPER%';

-- -------------------------------------------------------

-- ¿Cuál es el promedio de salario de los puestos?

    SELECT
        AVG(salario)
    FROM
        puesto;

-- ¿Cuántos artículos incluyen la palabra Pasta en su nombre?

    SELECT
        COUNT(nombre)
    FROM
        articulo
    WHERE
        UPPER(nombre) like '%PASTA%';

-- ¿Cuál es el salario mínimo y máximo?

    SELECT
        MIN(salario), MAx( salario )
    FROM
        puesto;

-- ¿Cuál es la suma del salario de los últimos cinco puestos agregados?

    SELECT
         SUM( salario )
    FROM
        puesto
    ORDER BY id_puesto DESC
    LIMIT 5;

    SELECT
        max(id_puesto) - 5
    FROM
        puesto;

    SELECT
        sum(salario)
    FROM
        puesto
    WHERE
        id_puesto > 995;

--  -----------------------------


-- ¿Cuántos registros hay por cada uno de los puestos?

    SELECT
		nombre, count(*)
	FROM
    puesto
	GROUP BY nombre;

-- ¿Cuánto dinero se paga en total por puesto?

	SELECT nombre, sum(salario)
	FROM puesto
	GROUP BY nombre;

-- ¿Cuál es el número total de ventas por vendedor?

	SELECT id_empleado, count(clave) AS ventas
	FROM venta
	GROUP BY id_empleado;

-- ¿Cuál es el número total de ventas por artículo?

	SELECT id_articulo, count(*)
	FROM venta
	GROUP BY id_articulo;

