# Guía para la Realización del Proyecto

---

- [Guía para la Realización del Proyecto](#guía-para-la-realización-del-proyecto)
  - [1. Objetivo del Proyecto](#1-objetivo-del-proyecto)
  - [2. Descripción del Proyecto](#2-descripción-del-proyecto)
  - [3. Requisitos Funcionales](#3-requisitos-funcionales)
  - [4. Fases del Proyecto](#4-fases-del-proyecto)
  - [5. Criterios de Evaluación](#5-criterios-de-evaluación)
  - [6. Recursos](#6-recursos)
  - [7. Entregables](#7-entregables)
  - [8. Fechas Importantes](#8-fechas-importantes)
  - [9. Consideraciones Finales](#9-consideraciones-finales)
  - [10. Recomendaciones](#10-recomendaciones)

---

## 1. Objetivo del Proyecto
   Desarrollar una base de datos relacional completa que gestione la información de un sistema del mundo real, aplicando los conceptos fundamentales de diseño de bases de datos, normalización, consultas SQL y administración. El proyecto debe ser realizado en equipos de máximo 4 personas.

## 2. Descripción del Proyecto
   Cada equipo deberá diseñar e implementar una base de datos que cumpla con los siguientes requisitos:
   - Diseño conceptual, lógico y físico de la base de datos.
   - Implementación en un Sistema de Gestión de Bases de Datos (SGBD) como MySQL, PostgreSQL, etc.
   - Creación de tablas, relaciones y restricciones.
   - Normalización de las tablas hasta la 3FN (Tercera Forma Normal).
   - Creación de consultas SQL (SELECT, INSERT, UPDATE, DELETE).
   - Generación de reportes mediante consultas avanzadas.
   
## 3. Requisitos Funcionales
   La base de datos debe incluir las siguientes características:
   - **Entidades y Relaciones**: Mínimo de 5 entidades y sus relaciones bien definidas.
   - **Integridad Referencial**: Uso adecuado de claves primarias, claves foráneas y restricciones de integridad.
   - **Consultas SQL**: Creación de consultas básicas y avanzadas que respondan a necesidades específicas del sistema. Mínimo 15 consultas.
   - **Normalización**: La base de datos debe estar normalizada, al menos hasta la tercera forma normal (3FN).
   - **Optimización**: Uso de índices para optimizar consultas (opcional).
   - **Usuarios**: Mecanismos de seguridad y gestión de usuarios (opcional). Al menos 3 usuarios (dba, usuario, etc).

## 4. Fases del Proyecto
   - **Fase 1: Investigación y Análisis del Problema**  
     - **Objetivo**: Entender el problema a resolver. Cada equipo debe entregar un documento con el análisis del problema, los casos de uso, y los requerimientos funcionales y no funcionales. 
   
     Cada equipo debe entregar un primer reporte de proyecto que incluya:

     - Descripción del problema a resolver (planteamiento, justificación y requerimientos de la solución al problema). 
     - Objetivos principal y específicos del proyecto.
     - Posible división de tareas entre los miembros del equipo.
     - Algunas referencias de interés.
  
>[!NOTE]
>Hasta aquí va la primera entrega. Recuerden que el reporte debe estar en el repositorio del proyecto y TODOS deben participar activamente.

   - **Fase 2: Análisis del Sistema y Modelado Conceptual**
     - **Objetivo**: Analizar el problema propuesto, identificar las entidades, relaciones y atributos. Entregar un modelo Entidad-Relación (ER).
     - **Entregable**: Diagrama ER y descripción del problema.

   - **Fase 3: Diseño Lógico y Normalización**
     - **Objetivo**: Convertir el modelo conceptual en un modelo lógico (tablas, atributos, claves primarias y foráneas) y aplicar técnicas de normalización para garantizar la eficiencia.
     - **Entregable**: Modelo lógico y tablas normalizadas.

   - **Fase 4: Implementación Física en un SGBD**
     - **Objetivo**: Implementar el diseño lógico en un SGBD (por ejemplo, MySQL o PostgreSQL). Crear las tablas, relaciones y restricciones correspondientes.
     - **Entregable**: Script SQL para la creación de las tablas y las relaciones.
  
  >[!NOTE]
>Hasta aquí va la segunda entrega. Recuerden que el reporte debe estar en el repositorio del proyecto y TODOS deben participar activamente. Esta entrega consta de las tablas normalizadas y subidas a Workbrench, al igual que los diagramas ER y EER.

   - **Fase 5: Creación de Consultas SQL y Procedimientos Almacenados**
     - **Objetivo**: Desarrollar consultas SQL que cubran operaciones de creación, actualización, eliminación y recuperación de datos. Implementar al menos un procedimiento almacenado, función o trigger.
     - **Entregable**: Scripts de consultas SQL y procedimientos.

   - **Fase 6: Pruebas y Optimización**
     - **Objetivo**: Realizar pruebas de funcionalidad, verificar la integridad de los datos, y optimizar las consultas mediante el uso de índices u otras técnicas.
     - **Entregable**: Resultados de pruebas y mejoras en la base de datos.

   - **Fase 7: Presentación y Documentación**
     - **Objetivo**: Presentar el proyecto a la clase, explicando el diseño, decisiones técnicas y justificaciones. Entregar la documentación completa que incluya el diseño conceptual, lógico, y físico, así como los scripts SQL y resultados de las pruebas.

## 5. Criterios de Evaluación
   La calificación del proyecto se basará en los siguientes aspectos:
   - **Diseño Conceptual y Lógico**: Claridad y coherencia en el modelo ER y la normalización de las tablas.
   - **Implementación**: Correcta creación de las tablas, relaciones, restricciones y consultas SQL.
   - **Consultas SQL**: Complejidad y funcionalidad de las consultas y procedimientos almacenados.
   - **Optimización y Eficiencia**: Uso adecuado de índices o técnicas de optimización.
   - **Documentación**: Claridad en la explicación del modelo y las decisiones de diseño, así como en la documentación técnica y funcional.
   - **Presentación**: Habilidad del equipo para explicar el proyecto, demostrar el funcionamiento del sistema y justificar sus decisiones.

## 6. Recursos
   - [Enlaces a tutoriales de SQL, MySQL, o PostgreSQL].
   - [Documentación sobre normalización y diseño de bases de datos].
   - [Guías para optimización de consultas SQL].
   - [Instrucciones para el uso de herramientas de modelado como MySQL Workbench o dbdiagram.io].
   - Pueden encontrar enlaces de interés en https://github.com/uETITC.

## 7. Entregables
   - Diagrama ER y modelo lógico.
   - Scripts SQL para la creación de tablas, relaciones, y restricciones.
   - Scripts SQL de consultas, procedimientos almacenados y triggers.
   - Resultados de las pruebas de funcionalidad.
   - Documentación técnica (manual del usuario, manual técnico, y resultados de las pruebas).
   - Informe de evaluación del equipo (opcional).

## 8. Fechas Importantes
   - Inicio del proyecto: [Fecha]
   - Entrega final del proyecto: [Fecha]

## 9. Consideraciones Finales
   - Es obligatorio el uso de un SGBD como MySQL, PostgreSQL o SQL Server.
   - Los equipos deben gestionar el proyecto utilizando un repositorio de control de versiones (como GitHub).
   - El cumplimiento de los plazos intermedios será evaluado, por lo que se recomienda una planificación adecuada.

## 10. Recomendaciones

  - Organícense desde el inicio y asignen responsabilidades claras.
  - Realicen revisiones periódicas del código y usen herramientas de control de versiones para evitar conflictos.
  - Asegúrense de que todos los miembros del equipo comprendan el código y las decisiones tomadas.
  - Documenten el progreso y dificultades para la presentación final.