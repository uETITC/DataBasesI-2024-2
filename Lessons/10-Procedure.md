## Rutinas

### Introducción

En MySQL, una **rutina** es un conjunto de instrucciones almacenadas en el servidor que pueden ejecutarse como una unidad. Las rutinas se dividen en dos categorías principales: **procedimientos almacenados** (*stored procedures*) y **funciones almacenadas** (*stored functions*). Su uso permite encapsular la lógica de negocio, mejorar la modularidad del código y reducir el tráfico entre aplicaciones y el servidor de base de datos.

En esta clase, exploraremos los conceptos básicos de las rutinas, cómo crearlas y administrarlas, y ejemplos prácticos que las demuestran en acción.

### Objetivos

- Comprender qué son las rutinas en MySQL y sus ventajas.
- Aprender a crear y ejecutar procedimientos almacenados y funciones.
- Conocer las diferencias entre procedimientos y funciones.
- Practicar con ejemplos aplicados a bases de datos reales.

### Conceptos Básicos

#### ¿Qué son las rutinas?

- Una **rutina** es un programa almacenado en la base de datos que se puede ejecutar en el servidor MySQL.
- **Procedimiento almacenado**:
  - Realiza una operación específica.
  - Puede devolver múltiples resultados o valores de salida.
- **Función almacenada**:
  - Devuelve un único valor.
  - Diseñada principalmente para cálculos y transformaciones.

#### Ventajas

1. **Modularidad**: Divide el código en partes reutilizables.
2. **Eficiencia**: Reduce la carga de la red al ejecutar lógica compleja directamente en el servidor.
3. **Seguridad**: Controla el acceso a datos sensibles mediante procedimientos.
4. **Mantenibilidad**: Centraliza las operaciones de negocio en la base de datos.

### Creación de Rutinas

#### Sintaxis General

##### Procedimientos Almacenados

```sql
DELIMITER //
  CREATE PROCEDURE nombre_procedimiento([parámetros])
    BEGIN
        -- Cuerpo del procedimiento
    END;
// DELIMITER
```

##### Funciones Almacenadas

```sql
DELIMITER //
  CREATE FUNCTION nombre_función([parámetros])
    RETURNS tipo_de_dato
    DETERMINISTIC
      BEGIN
          -- Cuerpo de la función
          RETURN valor;
      END;
// DELIMITER
```

##### Eliminación

```sql
DROP PROCEDURE IF EXISTS NombreProcedimiento;
```

## Ejemplo 1: Procedimiento Almacenado

#### Objetivo

Crear un procedimiento que devuelva los países por continente usando la base de datos `world`.

#### Código

##### Crear el Procedimiento

```sql
DELIMITER //
  CREATE PROCEDURE ObtenerPaisesPorContinente(IN continent VARCHAR(50))
    BEGIN
        SELECT Name as Pais, Region, Population
        FROM world.country
        WHERE country.Continent = continent;
    END;
// DELIMITER ;
```

##### Ejecutar el Procedimiento

```sql
CALL ObtenerPaisesPorContinente('South America');
```

#### Explicación

- **Parámetro de entrada (`IN`)**: El procedimiento recibe el nombre del continente.
- **Consulta interna**: Devuelve los países filtrados por el continente especificado.

### Ejemplo 2: Función Almacenada

#### Objetivo

Crear una función que calcule el salario anual de un empleado dado su salario mensual.

#### Código

##### Crear la Función

```sql
DELIMITER //
  CREATE FUNCTION DiezPorciento(population INT)
    RETURNS DECIMAL(10,1)
    DETERMINISTIC
    BEGIN
        RETURN population * 10/100;
    END;
// DELIMITER ;
```

##### Usar la Función

```sql
SELECT DiezPorciento(7000000) as DiezPorcientoPoblacion;
```

#### Explicación

- La función recibe el salario mensual como parámetro.
- Devuelve el salario anual multiplicando por 12.

### Ejemplo 3: Procedimiento con Parámetros de Salida

#### Objetivo

Crear un procedimiento que calcule el promedio de salarios de un departamento y lo devuelva como parámetro de salida.

#### Código

##### Crear el Procedimiento

```sql
DELIMITER //
  CREATE PROCEDURE CalcularPromedioPoblacion(
      IN continent VARCHAR(50),
      OUT promedio DECIMAL(10,2)
  )
  BEGIN
      SELECT AVG(Population) INTO promedio
      FROM world.country
      WHERE Continent = continent;
  END;
// DELIMITER;
```

##### Ejecutar el Procedimiento

```sql
CALL CalcularPromedioPoblacion('South America', @promedio);
SELECT @promedio AS Promedio_Salarios;
```

#### Explicación

- **Parámetro de salida (`OUT`)**: Devuelve el resultado a una variable externa.
- **Consulta interna**: Calcula el promedio de la población para el continente indicado.

### Tipos de Rutinas

#### Procedimientos

1. **Sin parámetros**:
   - Realizan operaciones generales, como eliminar datos duplicados.
2. **Con parámetros de entrada (`IN`)**:
   - Usados para filtros dinámicos.
3. **Con parámetros de salida (`OUT`)**:
   - Devuelven resultados calculados.
4. **Con parámetros de entrada y salida (`INOUT`)**:
   - Modifican valores de entrada y los devuelven.

#### Funciones

1. **Transformaciones de datos**:
   - Por ejemplo, convertir texto en mayúsculas.
2. **Cálculos matemáticos**:
   - Por ejemplo, calcular impuestos o descuentos.
3. **Agregaciones personalizadas**:
   - Por ejemplo, obtener la media ponderada de datos.

### Conclusión

Las rutinas en MySQL son herramientas poderosas para encapsular y reutilizar lógica de negocio directamente en la base de datos. Los procedimientos almacenados permiten realizar operaciones complejas, mientras que las funciones son ideales para cálculos específicos. Dominar estas técnicas mejora el rendimiento, la modularidad y la mantenibilidad de los sistemas que dependen de bases de datos.

### Referencias

- [Documentación oficial de MySQL sobre rutinas](https://dev.mysql.com/doc/refman/8.0/en/stored-programs-views.html)
- [Tutorial de rutinas en MySQL por W3Schools](https://www.w3schools.com/sql/sql_stored_procedures.asp)
- [Different types of Procedures in MySQL](https://www.geeksforgeeks.org/different-types-of-procedures-in-mysql/)