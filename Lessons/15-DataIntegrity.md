# Integridad de Datos

## Introducción

La **integridad de datos** es un principio fundamental en las bases de datos relacionales que garantiza la precisión, consistencia y validez de los datos almacenados. Implementar la integridad de datos correctamente ayuda a prevenir errores, minimizar inconsistencias y mantener la confianza en la información que se maneja. MySQL ofrece múltiples mecanismos para garantizar esta integridad, como restricciones y valores predeterminados.

En esta clase aprenderás los conceptos clave de la integridad de datos, los tipos de integridad, cómo aplicar restricciones y valores predeterminados, y cómo habilitar o deshabilitar restricciones según sea necesario.

## Objetivos

1. Comprender los **tipos de integridad de datos** y su importancia.
2. Aplicar restricciones para garantizar la integridad en bases de datos.
3. Configurar valores predeterminados y reglas para mantener la consistencia de los datos.
4. Manejar la habilitación y deshabilitación de restricciones.

## Tipos de Datos

::::{grid}

:::{grid-item}
:margin: auto auto 0 0
:columns: 6

```{figure} https://phoenixnap.com/kb/wp-content/uploads/2024/02/mysql-data-types-subtypes.png
---
name: clasificacion
width: 100%
---
Clasificación de los tipos de datos en MySQL. Tomado de [MySQL Data Types Explained](https://phoenixnap.com/kb/mysql-data-types).
```
:::

:::{grid-item}
:margin: auto auto 0 0
:columns: 6
```{figure} https://www.mysqltutorial.org/wp-content/uploads/2024/01/mysqldatatypes.jpg
---
name: dataspec
width: 100%
---
Especificaciones de los tipos de datos en MySQL. Tomado de [MySQL Data Types - MySQL Tutorial](https://www.mysqltutorial.org/mysql-basics/mysql-data-types/).
```
:::
::::

Para mayor información sobre los tipos de datos consultar cualquier de los siguientes recursos:

- [MySQL Data Types - W3Schools](https://www.w3schools.com/mysql/mysql_datatypes.asp)
- [MySQL - Data Types - TutorialsPoint](https://www.tutorialspoint.com/mysql/mysql-data-types.htm)
- [Chapter 13 Data Types - MySQL Documentation](https://dev.mysql.com/doc/refman/8.4/en/data-types.html)
- [13.1 Numeric Data Types - MySQL Documentation](https://dev.mysql.com/doc/refman/8.4/en/numeric-types.html)
- [MySQL Data Types - JavaTPoint](https://www.javatpoint.com/mysql-data-types)


## Tipos de Integridad de Datos

1. **Integridad de entidad**:  
   Garantiza que cada fila en una tabla sea única e identificable.  
   Ejemplo: El atributo `id` debe ser único y no nulo. Claves primarias (PRIMARY KEY).  

2. **Integridad referencial**:  
   Asegura que las relaciones entre tablas sean consistentes.  
   Ejemplo: Un `id_cliente` en una tabla de pedidos debe existir en la tabla de clientes. Claves foráneas (FOREIGN KEY).  

3. **Integridad de dominio**:  
   Restringe los valores que se pueden almacenar en una columna.  
   Ejemplo: Una columna de `edad` debe contener valores entre 0 y 120. Tipos de datos, CHECK, NOT NULL.  

4. **Integridad de definidas por el usuario**:  
   Se basa en reglas definidas por el usuario para cumplir requisitos específicos.  
   Ejemplo: El descuento máximo permitido para un producto no debe exceder el 50%. Restricciones personalizadas. Utilización de Triggers.

## Exigir Integridad de los Datos

En MySQL, la integridad de datos se asegura mediante la definición de restricciones en las tablas. Estas restricciones se configuran al crear o modificar una tabla. A continuación, se explican las herramientas principales:

- **PRIMARY KEY**: Garantiza la unicidad y no permite valores nulos.  
- **FOREIGN KEY**: Vincula una columna a la clave primaria de otra tabla.  
- **NOT NULL**: Evita valores nulos en una columna.  
- **UNIQUE**: Asegura que los valores de una columna sean únicos.  
- **CHECK**: Restringe los valores según una condición lógica.  
- **DEFAULT**: Proporciona un valor predeterminado cuando no se especifica uno.

**Ejemplo:**


```sql
CREATE TABLE Clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    correo VARCHAR(100) UNIQUE,
    telefono VARCHAR(15) CHECK (LENGTH(telefono) = 10)
);
```

## Definición de Restricciones

Las restricciones son reglas impuestas a las columnas de una tabla para asegurar la integridad de los datos. Estas se definen al momento de crear una tabla o mediante alteraciones posteriores.

**Ejemplo: Definición al crear una tabla**
```sql
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50),
    DepartmentID INT,
    Salary DECIMAL(10, 2) CHECK (Salary > 0),
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);
```

**Ejemplo: Agregar restricciones a una tabla existente**
```sql
ALTER TABLE Employees
ADD CONSTRAINT chk_salary CHECK (Salary > 0);
```

## Tipos de Restricciones

- **Restricciones a nivel de columna:** Se aplican directamente a una columna en su declaración.
- **Restricciones a nivel de tabla:** Se definen al final de la declaración de la tabla y pueden involucrar múltiples columnas.  

### Ejemplos

1. **NOT NULL**:  
   Garantiza que una columna no tenga valores nulos.  
   ```sql
   CREATE TABLE Products (
       ProductID INT NOT NULL
   );
   ```

2. **UNIQUE**:  
   Restringe a valores únicos dentro de una columna o conjunto de columnas.  
   ```sql
   CREATE TABLE Customers (
       Email VARCHAR(100) UNIQUE
   );
   ```

3. **PRIMARY KEY**:  
   Define una columna o conjunto de columnas como identificador único.  
   ```sql
   CREATE TABLE Orders (
       OrderID INT PRIMARY KEY
   );
   ```

4. **FOREIGN KEY**:  
   Enlaza dos tablas para asegurar la integridad referencial.  
   ```sql
   CREATE TABLE Sales (
       SaleID INT,
       ProductID INT,
       FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
   );
   ```

5. **CHECK**:  
   Restringe los valores basados en una condición lógica.  
   ```sql
   CREATE TABLE Accounts (
       Balance DECIMAL(10, 2),
       CHECK (Balance >= 0)
   );
   ```
   También funciona:
   ```sql
   CREATE TABLE Accounts (
       Balance DECIMAL(10, 2) CHECK (Balance >= 0)
   );
   ```

6. **DEFAULT**:  
   Asigna un valor predeterminado si no se especifica uno.  
   ```sql
   CREATE TABLE Users (
       Status VARCHAR(10) DEFAULT 'Active'
   );
   ```

## Deshabilitación de Restricciones

En ciertas situaciones, puede ser necesario deshabilitar restricciones, por ejemplo, al importar grandes volúmenes de datos. Esto se hace temporalmente para evitar errores por restricciones de integridad.

**Ejemplo: Deshabilitar y habilitar claves foráneas**
```sql
SET FOREIGN_KEY_CHECKS = 0; -- Deshabilitar restricciones de clave foránea

-- Operaciones de modificación masiva aquí

SET FOREIGN_KEY_CHECKS = 1; -- Habilitar restricciones de clave foránea
```

## Uso de Valores Predeterminados y Reglas

Los valores predeterminados y reglas ayudan a mantener la consistencia en los datos cuando no se proporciona un valor explícito.

**Ejemplo: Valores predeterminados**
```sql
CREATE TABLE Payments (
    PaymentID INT,
    Amount DECIMAL(10, 2),
    Status VARCHAR(20) DEFAULT 'Pending'
);
```

## Conclusiones

- La implementación de integridad de datos es fundamental para garantizar que los datos almacenados sean confiables y consistentes.  
- Las restricciones como `NOT NULL`, `UNIQUE`, `PRIMARY KEY`, y `FOREIGN KEY` proporcionan herramientas poderosas para mantener la calidad de los datos.  
- MySQL ofrece flexibilidad para deshabilitar temporalmente restricciones en operaciones específicas, pero es importante habilitarlas nuevamente para mantener la integridad.  
- El uso de valores predeterminados y disparadores facilita la automatización de reglas y la prevención de errores en las bases de datos.


## Recursos Adicionales

- MySQL Documentation: [Constraints](https://dev.mysql.com/doc/refman/8.0/en/constraints.html)  
- W3Schools: [SQL Constraints](https://www.w3schools.com/sql/sql_constraints.asp)  
- GeeksforGeeks: [Integrity Constraints in DBMS](https://www.geeksforgeeks.org/integrity-constraints-in-dbms/)