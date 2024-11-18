# Historia de Usuarios

## Introducción a las Historias de Usuario

Las historias de usuario son una herramienta fundamental en el desarrollo de software y el diseño de bases de datos, ya que permiten capturar los requisitos de un sistema de forma simple, clara y centrada en el usuario final. Estas historias se utilizan para comprender cómo interactuarán los usuarios con el sistema, definir funcionalidades clave y priorizar el desarrollo basado en las necesidades reales.

Son descripciones breves y específicas que capturan los requisitos del sistema desde la perspectiva del usuario final. Estas historias permiten entender mejor cómo se utilizará la base de datos y sirven como base para su diseño y desarrollo.

<div align="center">
<iframe width="80%" height="420px" src="https://www.youtube.com/embed/apOvF9NVguA?si=5vG9ODMPPJoMxdjb" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
</div>

### ¿Por qué son importantes?

1. **Enfoque en el usuario final**: Las historias de usuario aseguran que el diseño del sistema se oriente hacia las necesidades reales de quienes lo utilizarán, priorizando la experiencia del usuario.
2. **Facilitan la colaboración**: Sirven como un puente entre los stakeholders y los equipos técnicos, permitiendo una comunicación efectiva al usar un lenguaje accesible para ambas partes.
3. **Definen el alcance del proyecto**: Ayudan a identificar las funcionalidades esenciales, estableciendo los límites del sistema y priorizando las tareas más importantes.
4. **Fomentan la iteración y mejora**: Al desglosar los requisitos en historias pequeñas y manejables, se facilita un desarrollo ágil, iterativo y adaptable a cambios.

### Aplicaciones

1. **Diseño de bases de datos**: Las historias de usuario ayudan a identificar las entidades, relaciones y flujos de datos necesarios para el diseño de una base de datos eficiente y funcional.
2. **Desarrollo de software**: Son esenciales para definir las funcionalidades del sistema, desde interfaces de usuario hasta lógica de negocio y procesos backend.
3. **Pruebas y validación**: Actúan como base para crear casos de prueba, asegurando que las funcionalidades cumplen con las expectativas del usuario.
4. **Planificación de proyectos**: Permiten priorizar tareas y dividir el trabajo en módulos manejables para el equipo de desarrollo.

### Ventajas

1. **Simplicidad**: Su formato breve y estructurado facilita la comprensión y comunicación entre diferentes equipos.  
2. **Flexibilidad**: Pueden adaptarse fácilmente a los cambios en los requisitos del usuario o del proyecto.  
3. **Priorización**: Ayudan a identificar qué tareas deben abordarse primero según su impacto en el usuario final.  
4. **Mejor calidad del producto**: Al centrarse en las necesidades del usuario, se garantiza que el sistema sea más intuitivo, funcional y útil.  
5. **Reducción de ambigüedades**: Aseguran que todos los involucrados tengan una visión clara y alineada sobre lo que se espera del sistema.


## Estructura de una Historia de Usuario

Una historia de usuario típica sigue el formato:

- **Quién**: Define el rol del usuario.
- **Qué**: Describe lo que el usuario necesita lograr.
- **Por qué**: Explica el objetivo o el beneficio esperado.

**Formato**:  
*Como [rol del usuario], quiero [acción o funcionalidad] para [beneficio u objetivo]*.

### Tabla

| **Título:** |
|---|
| **Historia de Usuario:** <br><br>  Como un [descripción del usuario] <br> Quiero [funcionalidad] <br> Tal que[beneficio] <br> |
| **Criterios de Aceptación:** <br><br>  Dado [cómo las cosas comienzan] <br> Cuando [acción tomada] <br> Entonces [resultado de la acción tomada] <br> |
| **Prioridad:** |

### Imagen

<figure>
  <img src="https://www.productplan.com/uploads/2019/01/user-story-1024x536.png" alt="" style="width:100%">
  <figcaption>Plantilla de tarjeta con historia de usuario. Tomado de <a href="https://www.productplan.com/glossary/user-story/">User Story</a>
</figcaption>
</figure> 


## Ejemplos Detallados de Historias de Usuario

### Ejemplo 1: Gestión de Ventas
**Historia**:  
*Como gerente de ventas, quiero registrar cada transacción de ventas con información del producto, cantidad, cliente y fecha, para poder generar reportes detallados de ingresos mensuales.*  

**Requisitos Identificados**:
- Crear tablas: `Ventas`, `Productos`, `Clientes`.
- Relacionar estas tablas para permitir consultas cruzadas.
- Generar reportes de ingresos filtrados por períodos de tiempo.

### Ejemplo 2: Gestión de Inventarios
**Historia**:  
*Como encargado de inventario, quiero registrar la cantidad de productos disponibles y sus movimientos de entrada y salida, para garantizar que no haya rupturas de stock.*  

**Requisitos Identificados**:
- Crear tablas: `Productos`, `MovimientosInventario`.
- Almacenar tipos de movimientos: entrada, salida, y ajuste.
- Consultar productos con niveles críticos de inventario.

### Ejemplo 3: Seguimiento de Recursos Humanos
**Historia**:  
*Como gerente de recursos humanos, quiero almacenar la información de los empleados, incluyendo su historial de salarios, ascensos y evaluaciones de desempeño, para facilitar la gestión y planificación del talento.*  

**Requisitos Identificados**:
- Crear tablas: `Empleados`, `HistorialSalarios`, `Evaluaciones`.
- Relacionar empleados con sus historiales y evaluaciones.
- Consultar información específica por empleado o por rango de fechas.

## Ejemplo Práctico Sencillo

Utilizando el código de [ejemplo](ejemplocreacion), diseñar una historia de usuario.

### Historia de Usuario

*Como gerente, quiero un sistema para gestionar empleados y departamentos, y generar reportes de salarios.*

#### Pasos:

1. **Crear la base de datos y tablas**.
2. **Insertar datos**:

```sql
INSERT INTO Empleados (Nombre, Puesto, Salario, FechaIngreso)
VALUES ('Juan Pérez', 'Ingeniero', 3000.00, '2022-01-15'),
       ('Ana Gómez', 'Analista', 2500.00, '2023-05-10');

INSERT INTO Departamentos (Nombre, Ubicacion)
VALUES ('Recursos Humanos', 'Edificio A'),
       ('Tecnología', 'Edificio B');
```

3. **Generar consultas**:

```sql
-- Consultar empleados con salario mayor a $2500
SELECT * FROM Empleados WHERE Salario > 2500;

-- Generar reporte de empleados por departamento
SELECT Empleados.Nombre, Departamentos.Nombre AS Departamento
FROM Empleados
INNER JOIN Departamentos ON Empleados.ID = Departamentos.ID;
```

## Ejemplo Práctico Completo

**Historia de Usuario**:  
*Como administrador de sistemas, quiero gestionar las credenciales de los usuarios del sistema, permitiendo asignar roles y permisos de acceso para garantizar la seguridad y el cumplimiento de las políticas corporativas.*  

**Requisitos Identificados**:
1. Crear tablas:  
   - `Usuarios`: Almacena nombres, correos electrónicos y contraseñas.  
   - `Roles`: Define roles disponibles, como administrador, analista, y editor.  
   - `Permisos`: Lista de acciones permitidas por cada rol.  
   - `UsuariosRoles`: Relaciona usuarios con roles.

2. Implementar relaciones entre tablas:  
   - Un usuario puede tener múltiples roles (relación muchos a muchos).  
   - Un rol puede tener múltiples permisos (relación muchos a muchos).

3. Consultas requeridas:  
   - Listar usuarios y sus roles asignados.  
   - Verificar permisos de un usuario para una acción específica.

## Conclusión

Las historias de usuario son una herramienta esencial en cualquier proyecto que involucre el diseño de sistemas o bases de datos. Su capacidad para alinear las necesidades del usuario con los objetivos del equipo de desarrollo las convierte en una metodología indispensable para garantizar el éxito del proyecto. Incorporarlas desde las primeras etapas del diseño asegura una base sólida que soporta tanto la planificación como la ejecución del sistema.

## Recursos Adicionales

- [Writing User Stories for Back-end Systems ](https://www.mountaingoatsoftware.com/blog/writing-user-stories-for-back-end-systems)
- [Creating Good User Stories](https://archive.blogs.harvard.edu/markshead/good-user-stories/)
- [User Story - ProductPlan](https://www.productplan.com/glossary/user-story/)