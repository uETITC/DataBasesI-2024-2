# Taller: Consultas Nivel Medio

El presente taller tiene como objetivo fortalecer el dominio de las operaciones relacionales en el lenguaje SQL aplicadas sobre la base de datos `world`, disponible en MySQL. Esta base de datos contiene información detallada de países, ciudades y lenguas en diversas tablas que permiten la manipulación y consulta de datos de forma significativa. En el contexto de bases de datos relacionales, las operaciones relacionales, como la unión, intersección, diferencia y reunión, son fundamentales para realizar consultas complejas que extraigan datos precisos de múltiples tablas y relaciones.

Mediante la resolución de consultas que abarcan desde la obtención de datos específicos hasta el filtrado y agrupamiento de información, los estudiantes podrán aplicar conceptos claves como `JOIN` en sus diferentes tipos (`INNER JOIN`, `LEFT JOIN`, `RIGHT JOIN`, `SELF JOIN`, y `CROSS JOIN`), así como otras técnicas avanzadas de SQL. Este taller busca guiar a los estudiantes en la creación de consultas SQL que permitan analizar la base de datos `world` en profundidad y ofrecer respuestas concretas a preguntas específicas. Además, se incluye una representación matemática en álgebra relacional para que los estudiantes comprendan cómo los comandos SQL se traducen en términos conceptuales.

Utilicen la siguiente imagen como guía para las consultas.

:::{figure} https://stevestedman.com/wp-content/uploads/MySqlJoinTypesThumbnail-774x1024.png
--- 
width: 70%
name: mysqljoin
---
Tipos de `join` en MySQL. Tomado de [MySQL JOIN Types Poster](https://stevestedman.com/2015/03/mysql-join-types-poster/).
:::


## Consultas

Aquí tienes un conjunto de preguntas de nivel medio que utilizan operaciones relacionales en MySQL aplicadas a la base de datos `world`. Cada una incluye una breve descripción del objetivo de la consulta y su formulación en álgebra relacional y en MySQL:



### 1. Encuentra los países que tienen un idioma oficial.
**Objetivo:** Identificar los países con al menos un idioma oficial registrado en la tabla `countrylanguage`.
- **Álgebra Relacional:** 
  $$\pi_{\text{CountryCode}}(\sigma_{\text{IsOfficial} = 'T'} (\text{CountryLanguage}))$$
- **Consulta en SQL:**
  ```sql
  
  ```

### 2. Lista los países que tienen más de un idioma oficial.
**Objetivo:** Identificar los países con varios idiomas oficiales.
- **Álgebra Relacional:**
  $$\pi_{\text{CountryCode}} (\sigma_{\text{IsOfficial} = 'T'} (\text{CountryLanguage}))\ \ \text{GROUP BY CountryCode HAVING COUNT(*) > 1}$$
- **Consulta en SQL:**
  ```sql
  
  ```

### 3. Encuentra los países que tienen el mismo continente que Japón.
**Objetivo:** Listar los países que comparten el mismo continente que Japón.
- **Álgebra Relacional:**
  $$\pi_{\text{Name}} (\text{Country} \bowtie_{\text{Continent} = 'Asia'} \text{Country})$$
- **Consulta en SQL:**
  ```sql
  
  ```

### 4. Encuentra las ciudades que tienen población mayor a 5 millones y están en América del Sur.
**Objetivo:** Filtrar ciudades por población y continente.
- **Álgebra Relacional:**
  $$\pi_{\text{City.Name}} (\sigma_{\text{City.Population} > 5000000 \land \text{Country.Continent} = 'South America'}(\text{City} \bowtie \text{Country}))$$
- **Consulta en SQL:**
  ```sql
  
  ```

### 5. Encuentra los países que no tienen ningún idioma oficial.
**Objetivo:** Listar los países sin idioma oficial.
- **Álgebra Relacional:**
  $$\pi_{\text{Country.Code}}(\text{Country}) - \pi_{\text{CountryCode}}(\sigma_{\text{IsOfficial} = 'T'}(\text{CountryLanguage}))$$
- **Consulta en SQL:**
  ```sql
  
  ```

### 6. Encuentra los idiomas que son oficiales en al menos dos países.
**Objetivo:** Identificar idiomas que sean oficiales en varios países.
- **Álgebra Relacional:**
  $$\pi_{\text{Language}} (\sigma_{\text{IsOfficial} = 'T'} (\text{CountryLanguage}) \ \text{GROUP BY Language HAVING COUNT(DISTINCT CountryCode) >= 2})$$
- **Consulta en SQL:**
  ```sql
  
  ```

### 7. Lista los países y su capital.
**Objetivo:** Obtener la relación entre los países y sus capitales.
- **Álgebra Relacional:**
  $$\pi_{\text{Country.Name}, \text{City.Name}} (\text{Country} \bowtie_{\text{Country.Capital} = \text{City.ID}} \text{City})$$
- **Consulta en SQL:**
  ```sql
  
  ```

### 8. Encuentra los países que tienen una población mayor que Alemania.
**Objetivo:** Comparar población con un país específico.
- **Álgebra Relacional:**
  $$\pi_{\text{Name}}(\sigma_{\text{Population} > ( \text{SELECT Population FROM Country WHERE Name = 'Germany'} ) }(\text{Country}))$$
- **Consulta en SQL:**
  ```sql
  
  ```

### 9. Encuentra los idiomas oficiales de Europa.
**Objetivo:** Listar los idiomas oficiales de países europeos.
- **Álgebra Relacional:**
  $$\pi_{\text{Language}} (\sigma_{\text{Country.Continent} = 'Europe'} (\text{Country} \bowtie \text{CountryLanguage}))$$
- **Consulta en SQL:**
  ```sql
  
  ```

### 10. Encuentra los países sin ciudades registradas en la tabla `City`.
**Objetivo:** Detectar países sin representación en la tabla de ciudades.
- **Álgebra Relacional:**
  $$\pi_{\text{Country.Code}}(\text{Country}) - \pi_{\text{CountryCode}}(\text{City})$$
- **Consulta en SQL:**
  ```sql
  
  ```

### 11. Muestra la población total de cada continente.
**Objetivo:** Calcular la población por continente.
- **Álgebra Relacional:**
  $$\pi_{\text{Continent}, \text{SUM(Population)}} (\text{Country} \ \text{GROUP BY Continent})$$
- **Consulta en SQL:**
  ```sql
  
  ```

### 12. Encuentra los países en los que la esperanza de vida es menor al promedio global.
**Objetivo:** Filtrar países con esperanza de vida baja en comparación con el promedio.
- **Álgebra Relacional:** $$\pi_{\text{Name}}(\sigma_{\text{LifeExpectancy} < \text{AVG(LifeExpectancy)}}(\text{Country}))$$
- **Consulta en SQL:**
  ```sql
  
  ```

### 13. Encuentra los países en Asia sin idioma oficial registrado.
**Objetivo:** Listar países asiáticos sin idiomas oficiales.
- **Álgebra Relacional:**
  $$\pi_{\text{Country.Code}}(\sigma_{\text{Continent} = 'Asia'} (\text{Country})) - \pi_{\text{CountryCode}}(\sigma_{\text{IsOfficial} = 'T'}(\text{CountryLanguage}))$$
- **Consulta en SQL:**
  ```sql
  
  ```

### 14. Lista los idiomas que son oficiales en países con esperanza de vida mayor a 80.
**Objetivo:** Identificar idiomas en países con alta esperanza de vida.
- **Álgebra Relacional:**
  $$\pi_{\text{Language}} (\sigma_{\text{Country.LifeExpectancy} > 80} (\text{Country} \bowtie \text{CountryLanguage}))$$
- **Consulta en SQL:**
  ```sql
  
  ```

### 15. Encuentra los países con más de 10 ciudades en la tabla `City`.
**Objetivo:** Identificar países con una gran cantidad de ciudades registradas.
- **Álgebra Relacional:**

$$ \pi_{\text{CountryCode}} (\text{City} \ \text{GROUP BY CountryCode HAVING COUNT(*) > 10}) $$

- **Consulta en SQL:**
  ```sql
  
  ```

## Ejercicio

Propongan 10 preguntas, con su respectiva representación en el álgebra relacional, que puedan ser resueltas con consultas a la base de datos **World**. Deben proponer la pregunta y responderla utilizando comandos de MySQL.

**Plantilla:** Utilicen la siguiente plantilla para la creación de las preguntas:

  **#. Enunciado Pregunta**

  **Álgebra relacional**:  

  $$   Álgebra Relacional   $$

  **SQL equivalente**:  
  ```sql
  -- Respuesta a la consulta usando comandos de MySQL
  ```

## Ejercicio

::::{admonition} Taller 

Realizar todo el taller. Debe presentarse como un archivo de markdown que utilice los bloques de código y de matemáticas. 

**Entregables:**

Deben entregar un archivo tipo markdown con las respuestas de las preguntas escritas en MySQL, puede llamarse `consultas.md`. En este también deben colocar los pantallazos de los resultados, para ello en la misma carpeta donde esta el archivo creen una carpeta de `imagenes` y guardan alli todos los pantallazos. Para llamarlas dentro del archivo markdown usen el comando:

```html
<div align="center">
  <img src="./imagenes/nombre_imagen.png" width=90%>
</div>
```

:::{tip}
:class: dropdown
Utilicen este archivo como plantilla para la solución.
:::
:::: 

## Conclusión

La realización de este taller permite a los estudiantes afianzar sus habilidades en SQL, enfocándose en operaciones relacionales fundamentales en el contexto de bases de datos. A través de las consultas realizadas, se logra una comprensión sólida sobre cómo se estructuran y ejecutan consultas complejas que implican múltiples tablas y condiciones. Este conocimiento es esencial en la gestión de datos en entornos reales, donde la habilidad de interpretar y manipular datos desde diferentes fuentes es crucial para el análisis y la toma de decisiones.

Al explorar distintas formas de unión y filtrado en consultas, los estudiantes desarrollan una visión completa sobre el potencial de SQL en el manejo de datos, preparándolos para enfrentar situaciones más avanzadas en el ámbito profesional. Finalmente, la combinación de SQL y álgebra relacional ofrece una perspectiva integral, permitiendo comprender tanto la implementación técnica como los principios teóricos subyacentes en cada consulta.

## References

### Documentación y BD

- [15.2.13.2 JOIN Clause - MySQL Documentation](https://dev.mysql.com/doc/refman/8.4/en/join.html)
- "world" Sample Database. (n.d.). *MySQL Sample Databases*. Retrieved from [https://dev.mysql.com/doc/index-other.html](https://dev.mysql.com/doc/index-other.html)


### Guías y Tutoriales

- [MySQL Joins - W3School](https://www.w3schools.com/mysql/mysql_join.asp)
- [SQL - HAVING vs. WHERE](https://stackoverflow.com/questions/9253244/sql-having-vs-where)
- [MySQL JOINS - JapaPoint](https://www.javatpoint.com/mysql-join)

### Videos
- [join in mysql - Youtube](https://www.youtube.com/results?search_query=join+in+mysql)
- [MySQL: JOINS are easy (INNER, LEFT, RIGHT) ](https://www.youtube.com/watch?v=G3lJAxg1cy8)



### Libros

- Codd, E. F. (1970). *A Relational Model of Data for Large Shared Data Banks*. Communications of the ACM, 13(6), 377-387.
- Date, C. J. (2003). *An Introduction to Database Systems* (8th ed.). Pearson Education.
- Elmasri, R., & Navathe, S. B. (2011). *Fundamentals of Database Systems* (6th ed.). Pearson Education.