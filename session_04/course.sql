-- Definir los campos y tipos de datos para la tabla movies haciendo uso de los archivos movies.csv y README.

-- Crear la tabla movies (recuerda usar el mismo nombre del archivo sin la extensión para vincular nombres de tablas con archivos).

-- Definir los campos y tipos de datos para la tabla ratings haciendo uso de los archivos ratings.csv y README.

-- Crear la tabla ratings (recuerda usar el mismo nombre del archivo sin la extensión para vincular nombres de tablas con archivos)

CREATE TABLE IF NOT EXISTS users (
   id INT PRIMARY KEY,
   genero VARCHAR(1),
   edad INT,
   ocup INT,
   cp VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS movies (
   id INT PRIMARY KEY,
   title VARCHAR(120),
   genre VARCHAR(120)
);

CREATE TABLE IF NOT EXISTS ratings (
   user_id INT,
   movie_id int,
   rating int,
   etimestamp timestamp,
   FOREIGN KEY (user_id) REFERENCES users(id),
   FOREIGN KEY (movie_id) REFERENCES movies(id)
);
