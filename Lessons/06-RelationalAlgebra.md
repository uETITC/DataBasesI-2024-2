# Álgebra Relacional

## 1. Definición de Álgebra Relacional

El **álgebra relacional** es un conjunto de operaciones formales que actúan sobre relaciones (tablas) en bases de datos. Las operaciones del álgebra relacional permiten manipular y consultar los datos en una base de datos, produciendo como resultado nuevas relaciones a partir de relaciones existentes.

El álgebra relacional es el fundamento teórico sobre el cual se basa el lenguaje SQL, ya que muchas de las consultas SQL pueden ser expresadas mediante las operaciones del álgebra relacional.

## 2. Operaciones de Conjuntos

Las operaciones de conjuntos son similares a las que se aplican en la teoría de conjuntos y operan sobre dos relaciones que tienen el mismo esquema (mismas columnas).

### a) Unión ( ∪ )
La **unión** combina todas las tuplas de dos relaciones. El resultado es una nueva relación que contiene todas las tuplas que están presentes en cualquiera de las dos relaciones.

**Ejemplo:**
Consideremos las siguientes relaciones:
- **Estudiantes_A**:  
  \[ (ID: 1, Nombre: "Ana") \]  
  \[ (ID: 2, Nombre: "Juan") \]
  
- **Estudiantes_B**:  
  \[ (ID: 2, Nombre: "Juan") \]  
  \[ (ID: 3, Nombre: "Pedro") \]

**Resultado de la unión (Estudiantes_A ∪ Estudiantes_B):**

| ID  | Nombre |
| --- | ------ |
| 1   | Ana    |
| 2   | Juan   |
| 3   | Pedro  |


### b) Diferencia ( − )
La **diferencia** devuelve las tuplas que están en la primera relación pero no en la segunda.

**Ejemplo:**

**Estudiantes_A − Estudiantes_B:**

| ID  | Nombre |
| --- | ------ |
| 1   | Ana    |


### c) Intersección ( ∩ )
La **intersección** devuelve las tuplas que están en ambas relaciones.

**Ejemplo:**

**Estudiantes_A ∩ Estudiantes_B:**

| ID  | Nombre |
| --- | ------ |
| 2   | Juan   |


## 3. Operaciones Relacionales

Estas operaciones actúan sobre una o más relaciones y son fundamentales para las consultas complejas.

### a) Selección (σ)
La **selección** es una operación que filtra tuplas en una relación de acuerdo con una condición dada. La notación es: σ<sub>condición</sub>(Relación).

**Ejemplo:**
Si tenemos la relación **Estudiantes**:

| ID  | Nombre | Edad |
| --- | ------ | ---- |
| 1   | Ana    | 22   |
| 2   | Juan   | 20   |
| 3   | Pedro  | 19   |

**Consulta: Estudiantes que tienen más de 20 años:**
σ<sub>Edad > 20</sub>(Estudiantes)

| ID  | Nombre | Edad |
| --- | ------ | ---- |
| 1   | Ana    | 22   |


### b) Proyección (π)
La **proyección** selecciona columnas específicas de una relación. La notación es: π<sub>columnas</sub>(Relación).

**Ejemplo:**
**Consulta: Solo los nombres de los estudiantes:**
π<sub>Nombre</sub>(Estudiantes)

| Nombre |
| ------ |
| Ana    |
| Juan   |
| Pedro  |


### c) Reunión (⨝)
La **reunión (join)** combina tuplas de dos relaciones en una sola relación, basada en una condición de coincidencia. La notación es: Relación_A ⨝<sub>condición</sub> Relación_B.

**Ejemplo:**
Consideremos dos relaciones:
- **Estudiantes**:  
  \[ (ID: 1, Nombre: "Ana", CursoID: 101) \]  
  \[ (ID: 2, Nombre: "Juan", CursoID: 102) \]

- **Cursos**:  
  \[ (CursoID: 101, NombreCurso: "Matemáticas") \]  
  \[ (CursoID: 103, NombreCurso: "Historia") \]

**Consulta: Reunir estudiantes con sus cursos correspondientes:**

**Resultado de la reunión (Estudiantes ⨝ Cursos):**

| ID  | Nombre | CursoID | NombreCurso   |
| --- | ------ | ------- | ------------- |
| 1   | Ana    | 101     | Matemáticas   |


### d) División ( ÷ )
La **división** es una operación compleja que toma dos relaciones: A ÷ B, y devuelve las tuplas de A que están relacionadas con todas las tuplas de B.

**Ejemplo:**
Supongamos que la relación **A** contiene información de estudiantes y cursos en los que están inscritos, y la relación **B** contiene los cursos obligatorios que todos los estudiantes deben haber cursado.

**Resultado**: La división devolverá los estudiantes que han cursado **todos** los cursos obligatorios.

## 4. Atributos Claves

### a) Clave Primaria
La **clave primaria** es un atributo o conjunto de atributos que identifican de manera única una tupla en una relación.

**Ejemplo:**
En una tabla de **Estudiantes**, el **ID** sería la clave primaria, ya que cada estudiante tiene un ID único.

### b) Clave Foránea
La **clave foránea** es un atributo en una relación que se refiere a la clave primaria de otra relación. Sirve para establecer relaciones entre tablas.

**Ejemplo:**
En la relación **Cursos**, el atributo **EstudianteID** puede ser una clave foránea que hace referencia a la clave primaria de la tabla **Estudiantes**.


## 5. Reglas de Integridad

Las **reglas de integridad** aseguran la consistencia de los datos en una base de datos. Hay dos reglas fundamentales:

- **Integridad de entidad**: Cada relación debe tener una clave primaria y el valor de esta clave primaria no puede ser nulo.
- **Integridad referencial**: Las claves foráneas deben coincidir con valores válidos de la clave primaria en la tabla referenciada, o ser nulas.


## 6. Diccionario de Datos

El **diccionario de datos** es un conjunto de metadatos que describe los objetos en la base de datos. Contiene información como nombres de tablas, columnas, tipos de datos, claves primarias, foráneas, restricciones, etc.

## Ejercicio

:::{admonition} Taller 
Realizar el taller sobre álgebra relacional, [11. RelationalDB_Workshop](relationa-workshop).
:::

## Conclusión

El álgebra relacional es una herramienta poderosa que permite manipular y consultar bases de datos de manera eficiente. Es la base teórica sobre la cual se construye SQL y proporciona un marco formal para entender cómo funcionan las consultas. Al dominar el álgebra relacional, los estudiantes adquieren una comprensión más profunda del funcionamiento interno de las bases de datos y las consultas.


## Recursos Adicionales

- [DBMS - Relational Algebra ](https://www.tutorialspoint.com/dbms/relational_algebra.htm)
- [Relational algebra](https://en.wikipedia.org/wiki/Relational_algebra)
- [Relational Algebra Introduction](https://cs186berkeley.net/notes/note6/)
- [CSC 443 – Data Base Management Systems](https://home.adelphi.edu/~siegfried/cs443/443l9.pdf)
- [Relational Algebra](https://www.javatpoint.com/dbms-relational-algebra)
- [Introduction of Relational Algebra in DBMS](https://www.geeksforgeeks.org/introduction-of-relational-algebra-in-dbms/)