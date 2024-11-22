## Funciones

### Definición

Una **función** en MySQL es un bloque de código almacenado en el servidor que realiza una tarea específica y devuelve un valor. Las funciones son útiles para encapsular lógica que puede ser reutilizada en consultas SQL, mejorando la modularidad y eficiencia del código.

### Sintaxis

La sintaxis básica para definir una función es:

```sql
DELIMITER //
  CREATE FUNCTION nombre_funcion(parametro1 tipo, parametro2 tipo, ...)
    RETURNS tipo_de_dato
    DETERMINISTIC
    BEGIN
        DECLARACIONES;
        RETURN valor;
    END
// DELIMITER;
```

:::{note}
**Notas clave:**
1. **`RETURNS tipo_de_dato`:** Especifica el tipo de dato que devuelve la función (por ejemplo, `INT`, `VARCHAR`, etc.).
2. **`DETERMINISTIC` o `NOT DETERMINISTIC`:** Indica si la función siempre devuelve el mismo resultado para los mismos parámetros.
3. El cuerpo de la función se define entre `BEGIN` y `END`.
:::

### Manipulación

#### Creación

Supongamos que necesitamos una función que calcule el área de un círculo dado su radio:

```sql
DELIMITER //
  CREATE FUNCTION CalcularAreaCirculo(radio FLOAT)
    RETURNS FLOAT
    DETERMINISTIC
    BEGIN
        RETURN PI() * POW(radio, 2);
    END 
// DELIMITER ;
```

**Notas:**
- `PI()` es una función incorporada en MySQL que devuelve el valor de π.
- `POW(radio, 2)` eleva el radio al cuadrado.

##### Reglas 

1. El usuario debe tener privilegios adecuados (`CREATE ROUTINE`).
2. Las funciones no pueden realizar operaciones que modifiquen la base de datos, como `INSERT`, `UPDATE`, o `DELETE`.
3. Siempre usa `DETERMINISTIC` si la función garantiza el mismo resultado para los mismos parámetros.


#### Ejecución

Para usar una función en MySQL, simplemente se llama desde una consulta `SELECT`:

```sql
SELECT CalcularAreaCirculo(5) AS Area;
```

**Resultado esperado:**
| Area   |
|--------|
| 78.5398|


#### Modificación

MySQL no permite modificar funciones directamente. Para cambiar una función existente, primero debes eliminarla y luego volver a crearla:

```sql
DROP FUNCTION IF EXISTS CalcularAreaCirculo;

DELIMITER //
  CREATE FUNCTION CalcularAreaCirculo(radio FLOAT)
    RETURNS FLOAT
    DETERMINISTIC
    BEGIN
        RETURN PI() * POW(radio, 2);
    END
// DELIMITER ;
```

#### Eliminación

Para eliminar una función:

```sql
DROP FUNCTION IF EXISTS ContarPaisesPorContinente;
```


### Ventajas

1. **Reutilización:** Puedes encapsular lógica común en una función y reutilizarla en varias consultas.
2. **Modularidad:** Facilita la organización del código SQL.
3. **Legibilidad:** Las consultas complejas pueden ser más fáciles de entender al usar funciones.

### Ejemplo


#### Países por Continente

Supongamos que queremos una función que devuelva el número de países en un continente específico:

```sql
DELIMITER //
  CREATE FUNCTION ContarPaisesPorContinente(continente VARCHAR(50))
    RETURNS INT
    DETERMINISTIC
    BEGIN
        DECLARE total INT;
        SELECT COUNT(*) INTO total
        FROM world.country
        WHERE Continent = continente;
        RETURN total;
    END
// DELIMITER ;
```

Para ejecutar la función:

```sql
SELECT ContarPaisesPorContinente('Asia') AS TotalPaises;
```

**Resultado esperado:**
| TotalPaises |
|-------------|
| 51          |

#### Obtener Capital

1. Crea una función llamada `ObtenerCapital` que reciba como parámetro el nombre de un país y devuelva el nombre de su capital.** Usa las tablas `Country` y `City` de la base de datos `World`.
2. Ejecuta la función para encontrar la capital de 'Colombia'.

**Solución:**

Paso 1: Crear la función.

```sql
DELIMITER //
  CREATE FUNCTION ObtenerCapital(pais VARCHAR(50))
    RETURNS VARCHAR(50)
    DETERMINISTIC
    BEGIN
        DECLARE capital VARCHAR(50);
        SELECT ci.Name INTO capital
        FROM world.country co
        JOIN world.city ci ON co.Capital = ci.ID
        WHERE co.Name = pais;
        RETURN capital;
    END
// DELIMITER ;
```

Paso 2: Ejecutar la función.

```sql
SELECT ObtenerCapital('Colombia') AS Capital;
```

**Resultado esperado:**
| Capital  |
|----------|
|'Santafé de Bogotá   |


### Conclusión

Las funciones en MySQL son herramientas esenciales para encapsular y reutilizar lógica de negocio dentro de la base de datos. Estas son particularmente útiles para simplificar consultas complejas, mejorar la modularidad y garantizar consistencia en los cálculos.


### Recursos Adicionales

- [MySQL | Creating stored function](https://www.geeksforgeeks.org/mysql-creating-stored-function/)
- [Chapter 14 Functions and Operators - MySQL Documentation](https://dev.mysql.com/doc/refman/8.4/en/functions.html)
- [MySQL Functions - JavatPoint](https://www.javatpoint.com/mysql-functions)