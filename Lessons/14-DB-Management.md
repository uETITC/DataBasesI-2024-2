# Ciclo de Vida

## Introducción

Las bases de datos son el corazón de los sistemas modernos de almacenamiento y recuperación de información. Una base de datos bien diseñada no solo organiza los datos de forma eficiente, sino que también asegura su integridad y facilita el acceso a los usuarios adecuados.

En esta clase, aprenderás a crear y administrar bases de datos en MySQL, comenzando desde los conceptos básicos hasta tareas avanzadas de administración. Exploraremos la estructura de las bases de datos, el ciclo de vida de su desarrollo, y las herramientas para su mantenimiento.

## Objetivos

- Comprender la estructura y el ciclo de vida de las bases de datos.
- Diseñar bases de datos eficientes que cumplan con las necesidades de los usuarios.
- Crear y administrar bases de datos en MySQL utilizando comandos SQL.
- Configurar grupos de archivos y asignar permisos a usuarios.

## Introducción a la Estructura de Datos

Una base de datos es una colección organizada de datos que permite el acceso, la gestión y la actualización de manera eficiente. Su estructura incluye:

- **Tablas**: Almacenan datos en filas y columnas.
- **Índices**: Mejoran la velocidad de las consultas.
- **Vistas**: Proporcionan una forma de acceder a datos sin alterar las tablas originales.
- **Relaciones**: Vinculan datos entre tablas.

### Componentes clave:

- **Esquema**: La estructura lógica de la base de datos.
- **Datos**: La información almacenada.
- **Motor de almacenamiento**: La tecnología utilizada para gestionar datos (MyISAM, InnoDB, etc.).

## Ciclo de Vida

El ciclo de vida de una base de datos incluye las siguientes etapas:

1. **Definición de Requisitos**:
   - Identificar las necesidades de los usuarios y del sistema.
   - Definir las historias de usuarios.

2. **Diseño Conceptual**:
   - Crear modelos ER (Entidad-Relación) para representar las relaciones entre los datos.

3. **Diseño Lógico**:
   - Traducir el modelo ER en tablas, columnas y relaciones.

4. **Implementación**:
   - Crear la base de datos en un SGBD como MySQL.

5. **Mantenimiento**:
   - Actualizar la base de datos, realizar copias de seguridad y optimizar el rendimiento.

::::{grid}

:::{grid-item}
:margin: auto auto 0 0
:columns: 6
<figure>
  <img src="https://miro.medium.com/v2/resize:fit:720/format:webp/1*FexesWyItVXebqSSqpcWng.png" alt="" style="width:100%">
  <figcaption>Tomado de <a href="https://laura-malovich.medium.com/the-different-steps-in-database-development-life-cycle-aa79c92a0b8a"></a>The Different Steps in Database Development Life Cycle</figcaption>
</figure> 
:::

:::{grid-item}
:margin: auto auto 0 0
:columns: 6
<figure>
  <img src="https://www.talentelgia.com/blog/wp-content/uploads/2023/11/6-Stages-in-the-Database-Development-Lifecycle.webp" alt="" style="width:100%">
  <figcaption>Tomado de <a href="https://www.talentelgia.com/blog/database-development-lifecycle/"></a>Database Development Lifecycle</figcaption>
</figure> 
:::
::::

(ejemplocreacion)=
## Creación de una Base de Datos

Para crear una base de datos en MySQL:

```sql
-- Crear una base de datos llamada 'Empresa'
CREATE DATABASE Empresa;

-- Seleccionar la base de datos para usarla
USE Empresa;
```

### Crear Tablas

```sql
-- Crear una tabla para empleados
CREATE TABLE Empleados (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(50),
    Puesto VARCHAR(50),
    Salario DECIMAL(10, 2),
    FechaIngreso DATE
);

-- Crear una tabla para departamentos
CREATE TABLE Departamentos (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(50),
    Ubicacion VARCHAR(100)
);
```

## Creación de Grupos de Archivos

Aunque MySQL no soporta explícitamente "grupos de archivos" como SQL Server, se puede configurar el almacenamiento en diferentes particiones utilizando tablas particionadas o motores de almacenamiento. Ejemplo:

```sql
-- Crear una tabla con particionamiento por rango (requiere InnoDB)
CREATE TABLE Ventas (
    ID INT NOT NULL,
    Fecha DATE NOT NULL,
    Total DECIMAL(10, 2) NOT NULL
)
PARTITION BY RANGE (YEAR(Fecha)) (
    PARTITION p2022 VALUES LESS THAN (2023),
    PARTITION p2023 VALUES LESS THAN (2024)
);
```

## Administración

La administración de bases de datos (DBA) es un proceso esencial para garantizar el correcto funcionamiento, seguridad, rendimiento y disponibilidad de una base de datos. Este proceso implica una serie de tareas técnicas y de gestión que abarcan desde la configuración inicial hasta el mantenimiento continuo, monitoreo y respaldo de los datos.

### Tareas clave

1. **Gestión de usuarios y roles**:  
   Administrar los permisos y roles asegura que cada usuario tenga acceso únicamente a los datos y funcionalidades necesarias para su trabajo. Esto incluye la creación de usuarios, asignación de roles y definición de políticas de seguridad.

2. **Monitoreo y optimización del rendimiento**:  
   Supervisar el rendimiento de la base de datos es crucial para identificar cuellos de botella y optimizar consultas, índices y almacenamiento. El monitoreo incluye el uso de métricas como el tiempo de respuesta, utilización de recursos y transacciones por segundo.

3. **Respaldo y recuperación**:  
   Configurar respaldos regulares asegura la recuperación de datos en caso de fallas o pérdidas. Esto incluye realizar copias de seguridad completas, incrementales o diferenciales, y probar periódicamente los procedimientos de recuperación.

4. **Gestión del almacenamiento**:  
   Monitorizar el uso del espacio en disco y optimizar la asignación de almacenamiento garantiza que la base de datos tenga suficiente capacidad para crecer sin interrupciones.

5. **Auditoría y seguridad**:  
   Registrar actividades y accesos permite identificar intentos de acceso no autorizados y garantizar el cumplimiento normativo. La seguridad también incluye cifrado de datos y actualización de parches de software.

6. **Mantenimiento de esquemas**:  
   Modificar y mantener los esquemas de las tablas, vistas, procedimientos y otros objetos para adaptarse a los cambios en los requisitos del sistema.

7. **Automatización de tareas**:  
   Configurar scripts y herramientas para automatizar tareas repetitivas como respaldos, monitoreo y generación de informes.

### Comandos comunes

A continuación, se presentan comandos útiles para realizar tareas de administración en bases de datos MySQL:

#### Gestión de usuarios y permisos

- Crear un nuevo usuario:  
  ```sql
  CREATE USER 'usuario'@'localhost' IDENTIFIED BY 'contraseña';
  ```

- Asignar permisos a un usuario:  
  ```sql
  GRANT ALL PRIVILEGES ON nombre_base_datos.* TO 'usuario'@'localhost';
  ```

- Revocar permisos:  
  ```sql
  REVOKE INSERT, UPDATE ON nombre_base_datos.* FROM 'usuario'@'localhost';
  ```

- Mostrar usuarios:  
  ```sql
  SELECT User, Host FROM mysql.user;
  ```

#### Respaldo y recuperación

- Crear una copia de seguridad de una base de datos:  
  ```bash
  mysqldump -u usuario -p nombre_base_datos > respaldo.sql
  ```

- Restaurar una base de datos desde un respaldo:  
  ```bash
  mysql -u usuario -p nombre_base_datos < respaldo.sql
  ```

#### Monitoreo y optimización

- Consultar procesos en ejecución:  
  ```sql
  SHOW PROCESSLIST;
  ```

- Ver estadísticas de rendimiento:  
  ```sql
  SHOW STATUS;
  ```

- Analizar una tabla para identificar problemas:  
  ```sql
  ANALYZE TABLE nombre_tabla;
  ```

- Optimizar una tabla:  
  ```sql
  OPTIMIZE TABLE nombre_tabla;
  ```

#### Mantenimiento de esquemas

- Modificar una tabla para agregar una columna:  
  ```sql
  ALTER TABLE nombre_tabla ADD columna_nueva VARCHAR(255);
  ```

- Cambiar el tipo de dato de una columna:  
  ```sql
  ALTER TABLE nombre_tabla MODIFY columna_nueva INT;
  ```

- Eliminar una tabla:  
  ```sql
  DROP TABLE nombre_tabla;
  ```

#### Auditoría y seguridad

- Ver políticas de cifrado:  
  ```sql
  SHOW VARIABLES LIKE 'have_ssl';
  ```

- Configurar un log de auditoría:  
  Configuración en el archivo de opciones (`my.cnf`):  
  ```ini
  [mysqld]
  audit_log=ON
  audit_log_file=/var/log/mysql-audit.log
  ```

## Conclusión

La administración de bases de datos es un pilar fundamental para garantizar la funcionalidad y seguridad de los datos. El uso adecuado de comandos y herramientas de MySQL permite a los administradores realizar tareas críticas de forma eficiente, asegurando que la base de datos soporte las necesidades actuales y futuras del sistema. La automatización y el monitoreo continuo son esenciales para mantener altos niveles de disponibilidad y rendimiento.

## Recursos Adicionales

- [Chapter 9 Backup and Recovery- Documentación oficial de MySQL](https://dev.mysql.com/doc/)
- [Guía de comandos MySQL](https://www.mysqltutorial.org/)
- [Introducción a bases de datos](https://www.w3schools.com/sql/)
