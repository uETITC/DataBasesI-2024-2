# Vistas

## Definición

Una **vista (view)** en MySQL es una tabla virtual basada en el resultado de una consulta SQL. Las vistas no almacenan datos físicamente, sino que presentan los datos de una o más tablas de manera dinámica. Esto permite simplificar consultas complejas, mejorar la seguridad al restringir el acceso a ciertas columnas o filas, y facilitar la presentación de datos.

## Propiedades

1. **Tabla virtual:** Las vistas no almacenan datos, sino que derivan su contenido en tiempo real desde las tablas subyacentes.
2. **Actualización limitada:** Algunas vistas pueden ser actualizadas si cumplen ciertos criterios (como no utilizar funciones agregadas o unir múltiples tablas).
3. **Seguridad:** Las vistas permiten exponer únicamente datos relevantes al usuario.
4. **Simplificación:** Facilitan la reutilización de consultas SQL complejas.

## Manipulación

### Creación

La sintaxis básica para crear una vista es:

```sql
CREATE VIEW nombre_vista AS
   SELECT columnas
   FROM tabla
   WHERE condición;
```

**Ejemplo usando la base de datos `World`:**  
Supongamos que queremos una vista que muestre información básica de países con poblaciones mayores a 50 millones.

```sql
CREATE VIEW PaisesPoblados AS
   SELECT Name AS Pais, Continent, Population
   FROM world.country
   WHERE Population > 50000000;
```

### Consulta

Una vista se utiliza igual que una tabla normal. Por ejemplo, para consultar la vista `PaisesPoblados` creada anteriormente:

```sql
SELECT * FROM PaisesPoblados;
```

**Resultado esperado:**
| Pais            | Continente       | Poblacion  |
|------------------|------------------|------------|
| China           | Asia             | 1277558000 |
| India           | Asia             | 1013662000 |
| United States   | North America    | 278357000  |

### Modificación

Si necesitas actualizar la definición de una vista, puedes utilizar el comando `CREATE OR REPLACE VIEW`:

```sql
CREATE OR REPLACE VIEW PaisesPoblados AS
   SELECT Name AS Pais, Continent, Population, IndepYear
   FROM world.country
   WHERE Population > 100000000;
```

Esto actualizará la vista para incluir solo países con más de 100 millones de habitantes.

### Eliminación

Para eliminar una vista de la base de datos, utiliza el comando `DROP VIEW`:

```sql
DROP VIEW PaisesPoblados;
```

## Vistas con Uniones

Las vistas también pueden combinar datos de varias tablas. Por ejemplo, supongamos que queremos crear una vista que muestre las ciudades principales de cada país, uniendo las tablas `Country` y `City`:

```sql
CREATE VIEW CiudadesPrincipales AS
   SELECT co.Name AS Pais, ci.Name AS Ciudad, ci.Population AS PoblacionCiudad
   FROM world.country co
   JOIN city ci ON co.Code = ci.CountryCode
   WHERE ci.Population > 5000000;
```

Para consultar esta vista:

```sql
SELECT * FROM CiudadesPrincipales;
```

## Ventajas

1. **Seguridad:** Ocultan detalles complejos y sensibles de las tablas subyacentes.
2. **Reutilización:** Permiten la reutilización de consultas SQL.
3. **Eficiencia:** Reducen la necesidad de reescribir consultas complejas.
4. **Flexibilidad:** Facilitan el cambio de estructuras sin afectar directamente a las aplicaciones.

## Limitaciones

1. Algunas vistas no son actualizables si:
   - Involucran funciones agregadas (SUM, AVG, etc.).
   - Contienen combinaciones de varias tablas con JOIN.
2. La sobrecarga en tiempo real puede ser mayor que el acceso directo a tablas.

## Ejemplo 

1. **Crea una vista que muestre los países de América del Sur con su capital y población.**
   Usa las tablas `Country` y `City` de la base de datos `World`.
2. **Consulta la vista para obtener los datos.**
3. **Modifica la vista para que incluya solo países con una población superior a 20 millones.**

**Solución:**

Paso 1: Crear la vista.
```sql
CREATE VIEW PaisesSudamerica AS
   SELECT co.Name AS Pais, ci.Name AS Capital, co.Population AS Poblacion
   FROM world.country co
   JOIN world.city ci ON co.Capital = ci.ID
   WHERE co.Continent = 'South America';
```

Paso 2: Consultar la vista.
```sql
SELECT * FROM PaisesSudamerica;
```

Paso 3: Modificar la vista.
```sql
CREATE OR REPLACE VIEW PaisesSudamerica AS
   SELECT co.Name AS Pais, ci.Name AS Capital, co.Population AS Poblacion
   FROM world.country co
   JOIN world.city ci ON co.Capital = ci.ID
   WHERE co.Continent = 'South America' AND co.Population > 20000000;
```

## Conclusión

Las vistas son herramientas poderosas en MySQL que facilitan el acceso a datos de manera estructurada, segura y eficiente. Son ideales para optimizar consultas, encapsular lógica compleja y mejorar la interacción con los datos en sistemas grandes como el de la base de datos `World`.

## Recursos Adicionales

- [MySQL Views - W3Schools](https://www.w3schools.com/mysql/mysql_view.asp)
- [MySQL Functions](https://www.w3schools.com/mysql/mysql_ref_functions.asp)