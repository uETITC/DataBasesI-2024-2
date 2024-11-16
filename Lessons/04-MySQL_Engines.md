# Introducción

MySQL es un Sistema de Gestión de Bases de Datos (SGBD) de código abierto con millones de usuarios. 

## Parte 1: Introducción a MySQL CLI

### 1.1. ¿Qué es MySQL CLI?
La CLI (Command Line Interface) de MySQL es una herramienta poderosa para interactuar directamente con el servidor de bases de datos. Permite ejecutar comandos SQL, administrar bases de datos, y realizar operaciones de mantenimiento.

### 1.2. Usos Comunes del MySQL CLI:
- **Conexión al servidor MySQL:** `mysql -u [usuario] -p`
- **Creación de bases de datos:** `CREATE DATABASE nombre_base;`
- **Seleccionar una base de datos:** `USE nombre_base;`
- **Consulta de tablas:** `SHOW TABLES;`
- **Inserción de datos:** `INSERT INTO tabla (campo1, campo2) VALUES (valor1, valor2);`
- **Consulta de datos:** `SELECT * FROM tabla;`
- **Backup y restauración:** Uso de `mysqldump` para hacer copias de seguridad.

### 1.3. Qué hacer y qué no hacer en MySQL CLI:
- **Qué hacer:**
  - **Usar transacciones:** Asegúrate de utilizar transacciones para operaciones críticas: `START TRANSACTION; COMMIT;`.
  - **Comentar tu código:** Utiliza comentarios `--` o `#` para explicar comandos complejos.
  - **Realizar backups regulares:** Usa `mysqldump` antes de realizar cambios significativos.
  
- **Qué no hacer:**
  - **Ejecutar consultas destructivas sin un backup previo:** Evita `DROP` o `DELETE` sin un respaldo.
  - **Omitir la selección de base de datos:** Siempre usa `USE nombre_base;` antes de trabajar.



## Parte 2: Introducción a MySQL Workbench

### 2.1. ¿Qué es MySQL Workbench?
MySQL Workbench es una herramienta visual para la administración de bases de datos MySQL. Ofrece una interfaz gráfica para modelar, diseñar, y gestionar bases de datos.

### 2.2. Usos Comunes de MySQL Workbench:
- **Conexión a servidores MySQL:** Crear y administrar conexiones a servidores locales o remotos.
- **Diseño de bases de datos:** Creación visual de tablas, relaciones, y vistas.
- **Ejecutar consultas SQL:** Uso del editor SQL para ejecutar y probar comandos.
- **Modelado de datos:** Diseñar esquemas de bases de datos usando diagramas EER.
- **Administración de usuarios y permisos:** Crear y gestionar usuarios y sus permisos.

### 2.3. Qué hacer y qué no hacer en MySQL Workbench:
- **Qué hacer:**
  - **Aprovechar el modelado visual:** Usa los diagramas EER para planificar estructuras de base de datos.
  - **Guardar modelos y consultas:** Guarda tus diagramas y scripts SQL para referencia futura.
  - **Utilizar la función de exportación:** Usa las opciones de exportación para generar scripts SQL o crear backups.

- **Qué no hacer:**
  - **Ignorar los errores del servidor:** No ignores los mensajes de error o advertencias; revísalos y corrige los problemas.
  - **Depender solo de Workbench:** Aprende también a utilizar la CLI para operaciones críticas o en entornos sin GUI.


## Parte 3: Creación de Usuarios y Asignación de Roles en MySQL

### 3.1. Introducción a la Gestión de Usuarios en MySQL
La gestión de usuarios en MySQL es fundamental para controlar el acceso y la seguridad de la base de datos. MySQL permite crear usuarios con permisos específicos para realizar tareas determinadas, asegurando que solo las personas autorizadas puedan acceder o modificar los datos.

### 3.2. Comandos Básicos para la Creación de Usuarios y Roles

- **Crear un Usuario Nuevo:**
  ```sql
  CREATE USER 'nombre_usuario'@'localhost' IDENTIFIED BY 'contraseña';
  ```

- **Asignar Permisos a un Usuario:**
  ```sql
  GRANT ALL PRIVILEGES ON nombre_base.* TO 'nombre_usuario'@'localhost';
  ```
  - Este comando otorga todos los permisos sobre la base de datos especificada al usuario.

- **Revocar Permisos de un Usuario:**
  ```sql
  REVOKE ALL PRIVILEGES ON nombre_base.* FROM 'nombre_usuario'@'localhost';
  ```
  - Revoca todos los permisos previamente otorgados.

- **Asignar Permisos Específicos:**
  ```sql
  GRANT SELECT, INSERT ON nombre_base.* TO 'nombre_usuario'@'localhost';
  ```
  - Este comando otorga permisos específicos, como SELECT e INSERT, sobre la base de datos.

- **Visualizar Permisos de un Usuario:**
  ```sql
  SHOW GRANTS FOR 'nombre_usuario'@'localhost';
  ```

- **Eliminar un Usuario:**
  ```sql
  DROP USER 'nombre_usuario'@'localhost';
  ```

### 3.3. Creación de Roles y Asignación de Usuarios a Roles

- **Crear un Rol Nuevo:**
  ```sql
  CREATE ROLE 'nombre_rol';
  ```

- **Asignar Privilegios a un Rol:**
  ```sql
  GRANT SELECT, INSERT ON nombre_base.* TO 'nombre_rol';
  ```

- **Asignar un Rol a un Usuario:**
  ```sql
  GRANT 'nombre_rol' TO 'nombre_usuario'@'localhost';
  ```

- **Revocar un Rol de un Usuario:**
  ```sql
  REVOKE 'nombre_rol' FROM 'nombre_usuario'@'localhost';
  ```

### 3.4. Ejercicio Práctico de Gestión de Usuarios y Roles:

:::{admonition} Taller 

1. **Crear un Usuario:** Crea un usuario llamado `editor` con la contraseña `editor_pass`.
2. **Asignar Permisos:** Otorga permisos de `SELECT` y `INSERT` en la base de datos `world` al usuario `editor`.
3. **Crear un Rol:** Crea un rol llamado `librarian` con permisos de `UPDATE` y `DELETE`.
4. **Asignar el Rol:** Asigna el rol `librarian` al usuario `editor`.
5. **Verificar Permisos:** Usa `SHOW GRANTS` para verificar los permisos asignados al usuario `editor`.
6. **Revocar Permisos:** Revoca los permisos de `DELETE` del usuario `editor` usando el rol `librarian`.
:::

## Conclusión

Al concluir esta clase, los estudiantes comprenderán cómo usar eficazmente tanto la CLI como MySQL Workbench para administrar bases de datos. La CLI ofrece un control preciso en entornos de producción, mientras que MySQL Workbench facilita el diseño y la gestión visual de bases de datos.

Dominar ambas herramientas permite adaptarse a diversas situaciones, optimizando la eficiencia en la administración de datos. La práctica de buenas técnicas y la evitación de errores comunes preparan a los estudiantes para enfrentar desafíos reales, asegurando la integridad de sus proyectos.

## Referencias

Aquí tienes algunos enlaces útiles para aprender más sobre MySQL, tanto para la CLI como para MySQL Workbench:

### Documentación Oficial
1. **MySQL CLI:**
   - [MySQL 8.0 Reference Manual](https://dev.mysql.com/doc/refman/8.0/en/mysql.html): Documentación oficial sobre el uso de la línea de comandos MySQL.
   - [MySQL Command-Line Interface](https://dev.mysql.com/doc/refman/8.0/en/using-mysql.html): Guía para comenzar con MySQL CLI.

2. **MySQL Workbench:**
   - [MySQL Workbench Manual](https://dev.mysql.com/doc/workbench/en/): Documentación completa de MySQL Workbench.
   - [MySQL Workbench Tutorial](https://dev.mysql.com/doc/workbench/en/wb-getting-started-tutorial.html): Tutorial oficial para empezar a usar MySQL Workbench.

### Tutoriales y Guías Prácticas
1. **CLI:**
   - [DigitalOcean: MySQL Basics](https://www.digitalocean.com/community/tutorials/mysql-basic-queries-and-commands): Guía sobre consultas y comandos básicos en MySQL.
   - [GeeksforGeeks: MySQL Commands](https://www.geeksforgeeks.org/mysql-commands/): Lista de comandos básicos de MySQL.

2. **Workbench:**
   - [How to Use MySQL Workbench](https://www.hostinger.com/tutorials/how-to-use-mysql-workbench): Tutorial paso a paso sobre cómo usar MySQL Workbench.
   - [DataCamp: MySQL Workbench](https://www.datacamp.com/tutorial/mysql-workbench-tutorial): Guía completa sobre las funciones de MySQL Workbench.

### Recursos Adicionales
- **Stack Overflow**: [Preguntas sobre MySQL](https://stackoverflow.com/questions/tagged/mysql): Busca respuestas a preguntas específicas sobre MySQL.
- **YouTube**: [Curso de MySQL Workbench](https://www.youtube.com/watch?v=DCgRF4KOYKw): Video tutorial sobre el uso de MySQL Workbench.
- [Introduction To MySQL | MySQL Workbench Tutorial | MySQL Basics For Beginners | Simplilearn](https://www.youtube.com/watch?v=fUK94jOFwBc)

