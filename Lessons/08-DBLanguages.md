# Lenguaje de Base de Datos

## Introducción

En el mundo de las bases de datos, existen lenguajes específicos diseñados para interactuar con los sistemas de gestión de bases de datos (SGBD). Estos lenguajes permiten realizar diferentes tipos de operaciones sobre las bases de datos, desde la creación de estructuras hasta la manipulación y control de los datos. En esta clase, exploraremos los tres principales tipos de lenguajes de bases de datos: DDL, DML y DCL. Además, se incluirán ejemplos prácticos utilizando **MySQL**.

## Tipo de lenguajes de BD

Los lenguajes de bases de datos se dividen en diferentes categorías según su propósito dentro del sistema de gestión de bases de datos. Los más importantes son:

- **Lenguaje de definición de datos (DDL)**: Define y modifica la estructura de la base de datos.
- **Lenguaje de manipulación de datos (DML)**: Permite realizar consultas y modificaciones de los datos.
- **Lenguaje de control de datos (DCL)**: Gestiona los permisos y el acceso a la base de datos.

:::{figure} https://scaler.com/topics/images/Types-of-Database-Languages.webp
---
widht: 90%
name: databaselanguages
---
Tipos de lenguajes de bases de datos.
:::


## Lenguaje de Definición de Datos (DDL)


El lenguaje de definición de datos (DDL, por sus siglas en inglés) se utiliza para definir, modificar y eliminar las estructuras de las bases de datos, como las tablas, índices y restricciones. Las operaciones más comunes de DDL son: `CREATE`, `ALTER`, y `DROP`.

### Sintaxis y Ejemplos

#### Crear una tabla

```sql
CREATE TABLE empleados (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    puesto VARCHAR(50),
    salario DECIMAL(10, 2),
    fecha_contratacion DATE
);
```

#### Modificar una tabla existente

```sql
ALTER TABLE empleados 
ADD COLUMN direccion VARCHAR(100);
```

#### Eliminar una tabla

```sql
DROP TABLE empleados;
```

## Lenguajes de Manipulación de Datos (DML)

El lenguaje de manipulación de datos (DML) permite realizar operaciones sobre los datos almacenados en las bases de datos. Estas operaciones incluyen la inserción, actualización, eliminación y consulta de datos. Las operaciones principales de DML son: `INSERT`, `UPDATE`, `DELETE`, y `SELECT`.

### Sintaxis y Ejemplos

#### Insertar datos en una tabla

```sql
INSERT INTO empleados (nombre, puesto, salario, fecha_contratacion) 
VALUES ('Juan Perez', 'Ingeniero de Software', 4500.50, '2023-01-15');
```

#### Consultar datos de la tabla

```sql
SELECT * FROM empleados WHERE salario > 4000;
```

#### Actualizar datos en una tabla

```sql
UPDATE empleados 
SET salario = 5000 
WHERE nombre = 'Juan Perez';
```

#### Eliminar datos de una tabla

```sql
DELETE FROM empleados WHERE id = 2;
```

## Lenguaje de Control de Datos (DCL)

El lenguaje de control de datos (DCL) se utiliza para controlar el acceso a la base de datos, gestionando los permisos y privilegios de los usuarios. Las operaciones principales de DCL son: `GRANT` y `REVOKE`.

### Sintaxis y Ejemplos

#### Otorgar permisos a un usuario

```sql
GRANT SELECT, INSERT ON empleados TO 'usuario1'@'localhost';
```

#### Revocar permisos a un usuario

```sql
REVOKE INSERT ON empleados FROM 'usuario1'@'localhost';
```


## Taller: Manejo de Lenguajes de BD en Sakila

En este taller, se explorarán los conceptos de los **lenguajes de base de datos (DDL, DML, DCL)** aplicando operaciones sobre la base de datos **Sakila**. La base de datos Sakila es una base de datos ejemplo proporcionada por MySQL que contiene datos de una tienda de alquiler de películas. Los ejercicios prácticos te ayudarán a consolidar los conocimientos teóricos adquiridos sobre los lenguajes de base de datos.

Con el fin de facilitar el entendimiento de la base de datos Sakila, aca esta el diagrama asociado a esta clase:

:::{figure} https://codingnomads.com/images/eb5db0af-3ac3-429f-4812-523542edf800/public
---
widht: 100%
name: sakilaEER
---
Diagrama EER de la base de datos Sakila.
:::

Imagen tomada de [Importing the Sakila Database](https://codingnomads.com/how-to-use-the-sakila-database-in-mysql).

### Objetivos

1. Aplicar sentencias **DDL** para crear, modificar y eliminar estructuras de la base de datos.
2. Realizar operaciones **DML** para insertar, consultar, actualizar y eliminar datos de la base de datos.
3. Utilizar **DCL** para gestionar los permisos de los usuarios en la base de datos.
4. Familiarizarse con la estructura y datos de la base de datos **Sakila**.

### Instrucciones

A lo largo de este taller, utilizarás la base de datos **Sakila**. Si no tienes la base de datos instalada, puedes descargarla desde [MySQL Sakila Sample Database](https://dev.mysql.com/doc/sakila/en/). Una vez que la tengas instalada y cargada, sigue los ejercicios propuestos.

#### Parte 1: Lenguaje de Definición de Datos (DDL)

##### Ejercicio 1: Crear una nueva tabla en la base de datos Sakila

Imagina que la tienda Sakila está empezando a gestionar ventas de **productos físicos** (souvenirs, películas en formato físico, etc.). Debes crear una tabla llamada `product` para almacenar la información sobre estos productos.

1. Crea la tabla `product` con los siguientes campos:
    - `product_id` (INT, autoincremental, clave primaria)
    - `name` (VARCHAR(100), no nulo)
    - `description` (TEXT)
    - `price` (DECIMAL(10,2))
    - `category` (VARCHAR(50))
    - `created_date` (DATE)

```sql
CREATE TABLE product (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2),
    category VARCHAR(50),
    created_date DATE
);
```

##### Ejercicio 2: Modificar la estructura de la tabla

La tienda decide agregar una columna para gestionar el inventario. Añade una columna llamada `stock` (INT) a la tabla `product` para almacenar la cantidad disponible de cada producto.

```sql
ALTER TABLE product ADD COLUMN stock INT;
```

##### Ejercicio 3: Eliminar una tabla

Por cuestiones de cambios en la política de la tienda, se decide eliminar la tabla `product`. Realiza la operación para eliminarla de la base de datos.

```sql
DROP TABLE product;
```

#### Parte 2: Lenguaje de Manipulación de Datos (DML)

##### Ejercicio 4: Insertar datos en la tabla `actor`

Inserta un nuevo actor en la tabla `actor` con los siguientes datos:
- `first_name`: "Leonardo"
- `last_name`: "DiCaprio"

```sql
INSERT INTO actor (first_name, last_name)
VALUES ('Leonardo', 'DiCaprio');
```

##### Ejercicio 5: Consultar datos en la tabla `film`

Consulta todas las películas que tienen una duración mayor a 120 minutos y cuyo alquiler cuesta más de $2.50.

```sql
SELECT title, length, rental_rate 
FROM film 
WHERE length > 120 AND rental_rate > 2.50;
```

##### Ejercicio 6: Actualizar datos en la tabla `inventory`

La tienda Sakila ha recibido una actualización de inventario. Actualiza el campo `last_update` en la tabla `inventory` para el inventario con `inventory_id = 10` con la fecha actual.

```sql
UPDATE inventory 
SET last_update = CURDATE() 
WHERE inventory_id = 10;
```

##### Ejercicio 7: Eliminar datos en la tabla `payment`

Elimina todos los pagos que hayan sido realizados antes del año 2005.

```sql
DELETE FROM payment 
WHERE payment_date < '2005-01-01';
```

#### Parte 3: Lenguaje de Control de Datos (DCL)

##### Ejercicio 8: Otorgar permisos

Otorga permisos de **selección** y **inserción** sobre la tabla `actor` al usuario `'usuario_sakila'` en `localhost`.

```sql
GRANT SELECT, INSERT ON sakila.actor TO 'usuario_sakila'@'localhost';
```

##### Ejercicio 9: Revocar permisos

Revoca los permisos de **inserción** otorgados previamente al usuario `'usuario_sakila'` en `localhost` para la tabla `actor`.

```sql
REVOKE INSERT ON sakila.actor FROM 'usuario_sakila'@'localhost';
```

#### Parte 4: Ejercicio Final Integrado

##### Ejercicio 10: Consulta Compleja

Crea una consulta que muestre el nombre de todos los actores y las películas en las que han participado. Incluye el título de la película, el año de lanzamiento y el alquiler por día. Filtra solo aquellas películas que cuesten más de $3.00 por día.

```sql
SELECT actor.first_name, actor.last_name, film.title, film.release_year, film.rental_rate
FROM actor
JOIN film_actor ON actor.actor_id = film_actor.actor_id
JOIN film ON film_actor.film_id = film.film_id
WHERE film.rental_rate > 3.00;
```

#### Parte 5: Criterios de Evaluación

1. Correctitud en la creación, modificación y eliminación de tablas.
2. Precisión en las consultas realizadas con DML.
3. Gestión correcta de permisos utilizando DCL.
4. Optimización de las consultas SQL realizadas en cada ejercicio.
5. Documentación clara y organizada de las respuestas.

## Ejercicio

:::{admonition} Taller 
Realizar todas las consultas en el taller.


**Entregables:**

Deben entregar un archivo tipo markdown con las respuestas de las preguntas escritas en MySQL, puede llamarse `consultas.md`. En este también deben colocar los pantallazos de los resultados, para ello en la misma carpeta donde esta el archivo creen una carpeta de `imagenes` y guardan alli todos los pantallazos. Para llamarlas dentro del archivo markdown usen el comando:

```html
<div align="center">
  <img src="./imagenes/nombre_imagen.png" width=90%>
</div>
```

:::{tip}
:class: dropdown
Utilicen este archivo como plantilla para la solución.
:::
:::

## Conclusiones

Los lenguajes de bases de datos son fundamentales para el manejo de los datos en los SGBD. DDL nos permite definir y modificar las estructuras de la base de datos, DML nos brinda la capacidad de interactuar con los datos almacenados, y DCL gestiona los accesos y permisos de los usuarios. Un dominio adecuado de estos lenguajes es crucial para cualquier profesional que trabaje con bases de datos. Los ejemplos proporcionados en MySQL ilustran cómo podemos aplicar estos lenguajes en la práctica.

## Recursos Adicionales

- [Database Languages and Software](https://www.youtube.com/watch?v=IPvY9Gp83WM)
- [Database Languages in DBMS](https://www.scaler.com/topics/database-languages-in-dbms/)
- [Database Languages and Their Types in DBMS](https://www.includehelp.com/dbms/database-languages-in-dbms.aspx)
- Documentation MySQL: [https://dev.mysql.com/doc/](https://dev.mysql.com/doc/)
- Sakila Sample Database: [https://dev.mysql.com/doc/sakila/en/](https://dev.mysql.com/doc/sakila/en/)
- [What's the difference between identifying and non-identifying relationships?](https://stackoverflow.com/questions/762937/whats-the-difference-between-identifying-and-non-identifying-relationships)
- [Re: Please explain identifying/non-identifying relationships](https://forums.mysql.com/read.php?125,590251,594011)
- [Which is the child table in a Identifying or Non-Identifying Relationship?](https://stackoverflow.com/questions/11108846/which-is-the-child-table-in-a-identifying-or-non-identifying-relationship/11110385#11110385)