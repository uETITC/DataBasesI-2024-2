# Transact-SQL

## Objetivos

- Comprender el lenguaje Transact-SQL en su aplicación práctica a **MySQL**.
- Explorar las herramientas disponibles para la programación transaccional en **MySQL**.
- Utilizar elementos de T-SQL adaptados a MySQL, como variables, procedimientos almacenados y transacciones.
- Realizar aplicaciones prácticas de Transact-SQL en MySQL.

## Introducción

El lenguaje **Transact-SQL** (T-SQL) es una extensión de SQL que se utiliza principalmente en motores de bases de datos como **Microsoft SQL Server** y **Sybase ASE**. Si bien su uso está ligado a estos sistemas, muchas de las funcionalidades y conceptos de T-SQL pueden aplicarse en **MySQL**, con algunas diferencias sintácticas y de implementación. En esta clase nos enfocaremos en cómo programar SQL transaccional en **MySQL**, abordando elementos fundamentales de la programación SQL, y profundizando en las diferencias y similitudes con T-SQL.

## ¿Qué es T-SQL?
    
T-SQL es una extensión del lenguaje SQL utilizado para interactuar con bases de datos relacionales, como MySQL. Proporciona funcionalidades adicionales, como procedimientos almacenados, funciones y manejo de errores.

Una transacción es una unidad de ejecución de un programa que accede a varios elementos de datos y posiblemente los actualiza. Normalmente, una transacción la inicia un programa de usuario escrito en un lenguaje de manipulación de datos de alto nivel (normalmente SQL), o en un lenguaje de programación (por ejemplo, C++, Java, o Python), con accesos a bases de datos integrados en Java Database Connectivity (JDBC) u Open Database Connectivity (ODBC). Una transacción está delimitada por sentencias (o llamadas a funciones) de la forma iniciar transacción y finalizar transacción. La transacción consiste en todas las operaciones ejecutadas entre el inicio y el fin de la transacción.

## ¿Cuál es la diferencia entre T-SQL y MySQL?

T-SQL (Transact-SQL) y MySQL son sistemas de gestión de bases de datos relacionales, pero tienen algunas diferencias clave:

- **Proveedor**: T-SQL está asociado a Microsoft SQL Server, mientras que MySQL es un sistema de bases de datos de código abierto propiedad de Oracle Corporation.
- **Sintaxis**: T-SQL y MySQL utilizan una sintaxis diferente para determinadas operaciones, como la creación y gestión de bases de datos, tablas y procedimientos almacenados.
- **Lenguaje procedimental**: T-SQL soporta programación procedimental a través de características como procedimientos almacenados, funciones y triggers, mientras que MySQL utiliza un lenguaje procedimental llamado PL/SQL.
- **Control de transacciones**: T-SQL y MySQL ofrecen diferentes mecanismos de control de transacciones, con T-SQL utilizando características como BEGIN TRANSACTION, COMMIT, y ROLLBACK, mientras que MySQL utiliza START TRANSACTION, COMMIT, y ROLLBACK.
- **Características**: T-SQL y MySQL tienen diferentes conjuntos de características y funciones, y cada uno puede tener capacidades únicas que no se encuentran en el otro.

En general, aunque tanto T-SQL como MySQL se utilizan para gestionar bases de datos relacionales, tienen características distintas debido a sus diferentes orígenes y vías de desarrollo.

## Herramientas de Programación en MySQL

En el motor de MySQL se pueden utilizar diferentes herramientas para escribir y ejecutar consultas SQL. Entre las más destacadas se encuentran:

- **MySQL Workbench**: Herramienta gráfica que permite la creación de consultas, scripts y la administración de bases de datos.
- **CLI (Command Line Interface)**: Una interfaz en línea de comandos que permite interactuar directamente con la base de datos, ideal para operaciones rápidas y manipulación avanzada.
- **MySQL Connector**: Se utiliza en combinación con lenguajes de programación como **Java** y **Python** para ejecutar sentencias SQL desde aplicaciones externas.

### Formas de ejecutar Transact-SQL

En MySQL, las sentencias SQL pueden ejecutarse de diversas maneras:

1. **Mediante la interfaz gráfica**: Herramientas como MySQL Workbench permiten la creación y ejecución de sentencias SQL en un entorno amigable.
2. **Línea de comandos**: La CLI de MySQL es ideal para administrar la base de datos, ejecutar scripts, y manejar grandes volúmenes de datos.
3. **Lenguajes de programación**: Podemos integrar sentencias SQL dentro de aplicaciones usando Java, Python, PHP, etc., mediante bibliotecas de conectividad como JDBC (Java Database Connectivity) o MySQL Connector.


## Lenguaje de Programación Transact-SQL en MySQL

Aunque MySQL no utiliza el estándar exacto de T-SQL de Microsoft SQL Server, ofrece un potente conjunto de funcionalidades que permiten implementar **transacciones**, **procedimientos almacenados**, **funciones definidas por el usuario** y **control de errores**, conceptos clave de T-SQL.

### Transacciones en MySQL

Las **transacciones** permiten agrupar un conjunto de sentencias SQL y asegurarse de que todas ellas se ejecuten correctamente, o bien, en caso de error, que se reviertan (rollback) para mantener la integridad de la base de datos.

- **BEGIN**: Inicia una transacción.
- **COMMIT**: Confirma una transacción.
- **ROLLBACK**: Cancela una transacción si ocurre un error.

Ejemplo de transacción en MySQL:

```sql
-- Iniciar una transacción
START TRANSACTION;

-- Intentar insertar un estudiante en la tabla Estudiante
INSERT INTO Estudiante (nombre, edad, fechaNacimiento)
VALUES ('María González', 23, '2000-04-15');

-- Intentar insertar un curso
INSERT INTO Curso (nombreCurso)
VALUES ('Matemáticas Avanzadas');

-- Confirmar la transacción
COMMIT;
```

Si ocurre un error durante la inserción, podemos ejecutar un **ROLLBACK** para deshacer todas las operaciones de la transacción.

```sql
ROLLBACK;
```

### Procedimientos Almacenados en MySQL

Los **procedimientos almacenados** permiten almacenar sentencias SQL complejas y reutilizarlas cuando sea necesario. En MySQL, la sintaxis es muy similar a la de T-SQL.

Ejemplo de un procedimiento almacenado en MySQL:

```sql
DELIMITER //
CREATE PROCEDURE agregarEstudiante(IN nombreEstudiante VARCHAR(50), IN edadEstudiante INT, IN fechaNacimiento DATE)
BEGIN
    INSERT INTO Estudiante (nombre, edad, fechaNacimiento)
    VALUES (nombreEstudiante, edadEstudiante, fechaNacimiento);
END //
DELIMITER ;
```

Este procedimiento almacena la lógica para insertar estudiantes en la base de datos. Podemos llamarlo de la siguiente manera:

```sql
CALL agregarEstudiante('Carlos Ruiz', 24, '1999-10-12');
```

### Control de Errores

Aunque MySQL no cuenta con un mecanismo nativo de manejo de errores como **TRY...CATCH** de T-SQL, podemos manejar errores con la sentencia **DECLARE EXIT HANDLER**. Esto permite realizar acciones específicas cuando se detectan ciertos tipos de errores.

```sql
DELIMITER //
CREATE PROCEDURE agregarEstudiante(IN nombreEstudiante VARCHAR(50), IN edadEstudiante INT, IN fechaNacimiento DATE)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        -- Si ocurre un error, deshacer transacción
        ROLLBACK;
    END;

    -- Iniciar transacción
    START TRANSACTION;

    -- Insertar estudiante
    INSERT INTO Estudiante (nombre, edad, fechaNacimiento)
    VALUES (nombreEstudiante, edadEstudiante, fechaNacimiento);

    -- Confirmar transacción
    COMMIT;
END //
DELIMITER ;
```

En este ejemplo, si ocurre un error durante la ejecución del procedimiento, se ejecutará un **ROLLBACK** para deshacer cualquier cambio.


### Elementos de T-SQL Adaptados en MySQL

Algunos elementos fundamentales de T-SQL son compatibles o tienen equivalentes en MySQL. A continuación, describimos los más comunes:

1. **Variables**: En T-SQL, se pueden definir variables locales usando `DECLARE`. En MySQL, también se pueden declarar variables dentro de un procedimiento almacenado.
   
   ```sql
   DECLARE @nombre VARCHAR(50);
   SET @nombre = 'Juan Pérez';
   ```

2. **Condiciones**: Podemos usar sentencias **IF...THEN** para realizar operaciones condicionales dentro de un procedimiento almacenado.

   ```sql
   IF edadEstudiante > 20 THEN
       UPDATE Estudiante SET categoria = 'Adulto' WHERE nombre = nombreEstudiante;
   END IF;
   ```

### Aplicaciones de Transact-SQL en MySQL

Las aplicaciones de **Transact-SQL** adaptadas a **MySQL** son múltiples y permiten desarrollar funciones complejas y personalizadas que pueden mejorar la eficiencia de las bases de datos y automatizar procesos dentro de una organización.

Algunas aplicaciones prácticas incluyen:

- **Automatización de inserciones**: Crear procedimientos almacenados que manejen la inserción de grandes volúmenes de datos de manera segura y eficiente, asegurando transacciones coherentes.
  
- **Actualización en bloque**: Realizar actualizaciones masivas en múltiples tablas mediante transacciones para asegurar que los cambios se realicen correctamente.

- **Generación de reportes**: Crear funciones y procedimientos almacenados que generen reportes automatizados basados en consultas SQL complejas.

### Ejemplos de Aplicaciones Prácticas en MySQL

1. **Automatización de inserción de estudiantes**:
   
   ```sql
   DELIMITER //
   CREATE PROCEDURE insertarVariosEstudiantes()
   BEGIN
       DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
       BEGIN
           -- En caso de error, se realiza rollback
           ROLLBACK;
       END;
       
       START TRANSACTION;

       -- Inserciones
       INSERT INTO Estudiante (nombre, edad, fechaNacimiento) VALUES ('Luis Gómez', 20, '2003-01-15');
       INSERT INTO Estudiante (nombre, edad, fechaNacimiento) VALUES ('Ana López', 22, '2001-03-11');

       COMMIT;
   END //
   DELIMITER ;
   -- Llamar al procedimiento
   CALL insertarVariosEstudiantes();
   ```
2. **Función de agregar estudiantes**

    ```sql
    -- Crear una base de datos
    CREATE DATABASE Universidad;
    USE Universidad;

    -- Crear la tabla Estudiante
    CREATE TABLE Estudiante (
        id INT AUTO_INCREMENT PRIMARY KEY,
        nombre VARCHAR(50),
        edad INT,
        fechaNacimiento DATE
    );

    -- Insertar registros
    INSERT INTO Estudiante (nombre, edad, fechaNacimiento)
    VALUES ('Juan Pérez', 21, '2002-05-10'),
        ('Ana Gómez', 22, '2001-03-15'),
        ('Luis Torres', 19, '2004-08-21');

    -- Consultar estudiantes mayores de 20 años
    SELECT nombre, edad, fechaNacimiento
    FROM Estudiante
    WHERE edad > 20;

    -- Procedimiento almacenado para agregar estudiantes
    DELIMITER //
    CREATE PROCEDURE agregarEstudiante(IN nombreEstudiante VARCHAR(50), IN edadEstudiante INT, IN fechaNacimiento DATE)
    BEGIN
        INSERT INTO Estudiante (nombre, edad, fechaNacimiento)
        VALUES (nombreEstudiante, edadEstudiante, fechaNacimiento);
    END //
    DELIMITER ;

    -- Llamar al procedimiento
    CALL agregarEstudiante('Carlos Ruiz', 23, '2000-09-25');
    ```

3. **Generación de Reportes**:
   
   ```sql
   DELIMITER //
   CREATE PROCEDURE reporteEstudiantes()
   BEGIN
       SELECT nombre, edad, fechaNacimiento
       FROM Estudiante
       WHERE edad > 21;
   END //
   DELIMITER ;
   -- Llamar al procedimiento
   CALL reporteEstudiantes();
   ```

## Conclusiones

El lenguaje **Transact-SQL**, aunque esté diseñado para sistemas como **SQL Server**, tiene muchas similitudes con las funcionalidades avanzadas que ofrece **MySQL**. El uso de transacciones, procedimientos almacenados y control de errores permite crear aplicaciones robustas y seguras. En la práctica, este tipo de programación en MySQL es clave para la automatización de procesos, manejo eficiente de grandes volúmenes de datos y el aseguramiento de la consistencia en la base de datos.

## Recursos Adicionales

### Docuemntación

- MySQL Documentation: https://dev.mysql.com/doc/
- Microsoft SQL Server Transact-SQL Overview: https://docs.microsoft.com/en-us/sql/
- Rob, P., & Coronel, C. (2014). *Database Systems: Design, Implementation, and Management*. Cengage Learning.
- [15.3.1 START TRANSACTION, COMMIT, and ROLLBACK Statements](https://dev.mysql.com/doc/refman/8.4/en/commit.html#:~:text=START%20TRANSACTION%20or%20BEGIN%20start%20a%20new)
    x
### Guías y Tutoriales

- [Guía paso a paso: Cómo usar START TRANSACTION en MySQL - Ejemplo](https://mysqlya.com.ar/tutoriales/start-transaction-mysql-ejemplo/#:~:text=En%20esta%20gu%C3%ADa%20paso%20a%20paso,%20vamos%20a%20ver)
- [MySQL Transactions](https://www.mysqltutorial.org/mysql-stored-procedure/mysql-transactions/#:~:text=MySQL%20supports%20transactions%20via%20the)
- [MySQL Transacción](https://learntutorials.net/es/mysql/topic/5771/transaccion#:~:text=Las%20transacciones%20comienzan%20con%20la)
- [MySQL - START TRANSACTION Statement](https://www.tutorialspoint.com/mysql/mysql_start_transaction.htm#:~:text=The%20START%20TRANSACTION%20statement%20of%20MySQL)
