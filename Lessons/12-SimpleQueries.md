# 1. Comandos Básicos


## Introducción

Este taller está diseñado para que los estudiantes desarrollen sus habilidades en la realización de consultas SQL sobre la base de datos "world database", un conjunto de datos realista y ampliamente utilizado para aprender sobre bases de datos relacionales. En este taller, el estudiante aprenderá a realizar consultas básicas y de nivel medio empleando operadores SQL y notación de álgebra relacional para construir y entender mejor las consultas, fortaleciendo el conocimiento de comandos como `HAVING`, `GROUP BY`, `AVERAGE`, `COUNT`, `ORDER BY`, `LIKE`, `DISTINCT`, `BETWEEN`, `MAX`, `MIN`, y `AS`, entre otros.

Las consultas se dividen en dos niveles de dificultad: **básico**, que introduce a los conceptos fundamentales de las consultas SQL, y **medio**, que desafía a los estudiantes a utilizar operadores de agrupamiento, proyecciones, y condiciones más complejas para extraer y manipular datos. El objetivo es que el estudiante aprenda a traducir problemas de consulta de álgebra relacional a SQL de manera fluida y comprenda cómo aplicar los operadores más importantes de SQL para la manipulación y el análisis de datos en bases de datos relacionales.

>[!NOTE]
>Para este taller utilizaremos la base de datos World que ya tienen desde la instalación o pueden descargar desde [Other MySQL Documentation](https://dev.mysql.com/doc/index-other.html).

## Consultas Básicas

**1. Selección de países en el continente 'Asia'**

**Álgebra relacional**:

$$
\sigma_{\text{Continent} = 'Asia'}(\text{Country})
$$

**SQL equivalente**:

```sql
SELECT Name FROM country
WHERE Continent="Asia";
```

**2. Contar el número total de ciudades**

**Álgebra relacional**:  

$$
\text{COUNT}(\text{City})
$$

**SQL equivalente**:  
```sql
SELECT DISTINCT COUNT(Name) AS Total_Cities FROM city;
```

**3. Listar todos los idiomas únicos en la tabla CountryLanguage**

**Álgebra relacional**:  

$$
\pi_{\text{Language}}(\text{CountryLanguage})
$$

**SQL equivalente**:  
```sql
SELECT DISTINCT Language FROM countrylanguage
ORDER BY Language ASC;
```

**4. Selección de países con población mayor a 100 millones**

**Álgebra relacional**:  

$$
\sigma_{\text{Population} >  100000000 }(\text{Country})
$$

**SQL equivalente**:  
```sql
SELECT Name,Population  FROM country 
WHERE Population>100e6
ORDER BY Population DESC;
```

**5. Listar nombres de países y continentes ordenados alfabéticamente por nombre de país**

**Álgebra relacional**:  

$$
\pi_{\text{Name}, \text{Continent}}(\text{Country}) \text{ ORDER BY Name}
$$

**SQL equivalente**:  
```sql
SELECT Name, Continent FROM country 
ORDER BY Name ASC;
```

**6. Obtener la ciudad con mayor población**

**Álgebra relacional**:  

$$
\text{MAX}(\pi_{\text{Population}}(\text{City}))
$$

**SQL equivalente**:  
```sql
SELECT Name, Population FROM city 
ORDER BY Population DESC LIMIT 1;
-- otra opción usando MAX()
SELECT Name, Population FROM city
WHERE Population=(SELECT MAX(Population) FROM city);
```

**7. Selección de países que tienen 'Republic' en su nombre**

**Álgebra relacional**:  

$$
\sigma_{\text{Name LIKE '\%Republic\%'}}(\text{Country})
$$

**SQL equivalente**:  
```sql
SELECT Name FROM country 
WHERE Name LIKE "%Republic%";
```

**8. Listar los 5 países más poblados**

**Álgebra relacional**:  

$$
\pi_{\text{Name, Population}}(\text{Country}) \text{ ORDER BY Population DESC LIMIT 5}
$$

**SQL equivalente**:  
```sql
SELECT Name,Population FROM country
ORDER BY Population DESC LIMIT 5;
```

**9. Calcular la población promedio de los países en el continente 'Europe'**

**Álgebra relacional**:  

$$
\text{AVG}(\pi_{\text{Population}}(\sigma_{\text{Continent} = 'Europe'}(\text{Country})))
$$

**SQL equivalente**:  
```sql
SELECT AVG(Population) AS AVG_Poblacion_Europa
FROM country WHERE Continent="Europe";
```

**10. Selección de idiomas con más del 10% de la población mundial que los habla**

**Álgebra relacional**:  

$$
\sigma_{\text{Percentage} > 10}(\text{CountryLanguage})
$$

**SQL equivalente**:  
```sql
SELECT Language, SUM(Population * (Percentage / 100)) AS TotalSpeakers
FROM country
JOIN countrylanguage ON country.Code = countrylanguage.CountryCode
GROUP BY Language
HAVING TotalSpeakers > (SELECT SUM(Population) FROM country) * 0.1
ORDER BY TotalSpeakers DESC;
```

## Consultas de Nivel Medio

**1. Encontrar los 5 países más poblados por continente**

**Álgebra relacional**:  

$$
\pi_{\text{Name, Population}}(\text{Country}) \text{ GROUP BY Continent ORDER BY Population DESC LIMIT 5}
$$

**SQL equivalente**:  
```sql
SELECT Continent, Name  AS Country, Population
FROM country c1
WHERE (
    SELECT COUNT(*)
    FROM country c2
    WHERE c2.Continent = c1.Continent
      AND c2.Population > c1.Population
) < 5
ORDER BY Continent, Population DESC;
-- otra forma usando ROW_NUMBER
SELECT Continent, Name AS Country, Population
FROM (
    SELECT Continent, Name, Population,
           ROW_NUMBER() OVER (PARTITION BY Continent ORDER BY Population DESC) AS rn
    FROM country
) AS ranked
WHERE rn <= 5
ORDER BY Continent, Population DESC;
```

**2. Listar países que usan más de un idioma**

**Álgebra relacional**:  

$$
\sigma_{\text{count(Language)} > 1}(\text{CountryLanguage GROUP BY CountryCode})
$$

**SQL equivalente**:  
```sql
SELECT Name, CountryCode, COUNT(Language) AS NoLanguages FROM countrylanguage 
LEFT JOIN country on countrylanguage.CountryCode = country.Code
GROUP BY CountryCode HAVING COUNT(Language)>1;
```

**3. Calcular el total de población de cada continente**

**Álgebra relacional**:  

$$
\pi_{\text{Continent}, \text{SUM(Population)}}(\text{Country}) \text{ GROUP BY Continent}
$$

**SQL equivalente**:  
```sql
SELECT Continent, SUM(Population) AS TotalPoblacion
FROM country 
GROUP BY Continent ORDER BY Continent ASC;
```

**4. Contar el número de ciudades en cada país**

**Álgebra relacional**:  

$$
\pi_{\text{CountryCode}, \text{COUNT(*)}}(\text{City}) \text{ GROUP BY CountryCode}
$$

**SQL equivalente**:  
```sql
SELECT country.Name, CountryCode, COUNT(*) AS NoCities 
FROM city 
LEFT JOIN country ON city.CountryCode = country.Code 
GROUP BY CountryCode ORDER BY NoCities ASC;
```

**5. Listar los países y su promedio de vida ordenados por el promedio de vida en orden descendente**

**Álgebra relacional**:  

$$
\pi_{\text{Name}, \text{LifeExpectancy}}(\text{Country}) \text{ ORDER BY LifeExpectancy DESC}
$$

**SQL equivalente**:  
```sql
SELECT Name, LifeExpectancy FROM country
ORDER BY LifeExpectancy DESC;
```

**6. Selección de ciudades cuya población está entre 500,000 y 1,000,000**

**Álgebra relacional**:  

$$
\sigma_{500000 \leq \text{Population} \leq 1000000}(\text{City})
$$

**SQL equivalente**:  
```sql
SELECT Name, Population FROM city
WHERE Population BETWEEN 500000 AND 1000000
ORDER BY Name;
```

**7. Listar los idiomas hablados en países donde la población es mayor a 50 millones**

**Álgebra relacional**:  

$$
\pi_{\text{Language}}(\sigma_{\text{Population} > 50000000}(\text{Country}) \bowtie \text{CountryLanguage})
$$

**SQL equivalente**:  
```sql
SELECT DISTINCT Language, Name FROM countrylanguage 
JOIN country ON countrylanguage.CountryCode=country.Code
WHERE Population>5e6;
```

**8. Calcular el promedio de población por ciudad en cada país**

**Álgebra relacional**:  

$$
\pi_{\text{CountryCode}, \text{AVG(Population)}}(\text{City}) \text{ GROUP BY CountryCode}
$$

**SQL equivalente**:  
```sql
SELECT country.Name, AVG(city.Population)
FROM city 
JOIN country ON city.CountryCode=country.Code
GROUP BY country.Name;
```

**9. Seleccionar los países cuya calificación de vida está por encima del promedio mundial**

**Álgebra relacional**:  

$$
\sigma_{\text{LifeExpectancy} > \text{AVG(LifeExpectancy)}}(\text{Country})
$$

**SQL equivalente**:  
```sql
SELECT Name, LifeExpectancy FROM country 
WHERE LifeExpectancy>(SELECT AVG(LifeExpectancy) AS WorldAVGLE FROM country)
ORDER BY LifeExpectancy ASC;
```

**10. Encontrar los continentes con una calificación de vida superior al promedio de su continente**

**Álgebra relacional**:  

$$
\pi_{\text{Continent, AVG(LifeExpectancy)}}(\text{Country}) \text{ GROUP BY Continent}
$$

**SQL equivalente**:  
```sql
-- Muestra el promedio de la expectativa de vida por continente
SELECT Continent, AVG(LifeExpectancy) FROM country
GROUP BY Continent;

-- Responde la pregunta
SELECT Continent, Name, LifeExpectancy
FROM country
WHERE LifeExpectancy > (
    SELECT AVG(LifeExpectancy)
    FROM country AS sub_country
    WHERE sub_country.Continent = country.Continent
)
ORDER BY Continent, LifeExpectancy ASC;
```

## Más Consultas

Propongan 10 preguntas, con su respectiva representación en el álgebra relacional, que puedan ser resueltas con consultas a la base de datos **World**. Deben proponer la pregunta y responderla utilizando comandos de MySQL.

**Plantilla:** Utilicen la siguiente plantilla para la creación de las preguntas:

**#. Enunciado Pregunta**

**Álgebra relacional**:  

$$
Álgebra Relacional
$$

**SQL equivalente**:  
```sql
-- Consulta en comandos de MySQL
```

## Ejercicio

::::{admonition} Taller 

Realizar todo el taller. Debe presentarse como un archivo de markdown que utilice los bloques de código y de matemáticas. 

**Entregables:**

Deben entregar un archivo tipo markdown con las respuestas de las preguntas escritas en MySQL, puede llamarse `consultas.md`. En este también deben colocar los pantallazos de los resultados, para ello en la misma carpeta donde esta el archivo creen una carpeta de `imagenes` y guardan alli todos los pantallazos. Para llamarlas dentro del archivo markdown usen el comando:

```html
<div align="center">
  <img src="./images/nombre_imagen" width=90%>
</div>
```

:::{tip}
:class: dropdown
Utilicen este archivo como plantilla para la solución.
:::
:::: 

## Conclusiones

1. **Comprensión de Operadores y Sintaxis SQL**: Al finalizar el taller, los estudiantes habrán desarrollado una comprensión sólida de los operadores básicos y de nivel medio en SQL y podrán utilizar comandos como `GROUP BY`, `HAVING`, `LIKE`, `DISTINCT`, y operadores de agregación (`MAX`, `MIN`, `AVG`, `COUNT`) en diversas situaciones.

2. **Uso de Álgebra Relacional como Fundamento Teórico**: La introducción de la notación de álgebra relacional proporciona a los estudiantes una base teórica fundamental, permitiéndoles visualizar mejor las operaciones y comprender la traducción de conceptos abstractos a sintaxis SQL práctica.

3. **Capacidad para Resolver Consultas Complejas**: Gracias a las consultas de nivel medio, los estudiantes adquieren habilidades para resolver problemas más complejos en SQL, como agrupamiento y filtrado de datos en base a condiciones específicas. Esta habilidad es esencial para el análisis y manejo de grandes volúmenes de datos en aplicaciones del mundo real.

4. **Preparación para Escenarios Reales**: El uso de una base de datos con información global permite a los estudiantes visualizar cómo los datos interrelacionados pueden ser consultados y organizados, lo cual es útil en aplicaciones como reportes, visualización de datos, y en el contexto de decisiones empresariales.

## Referencias

### Libros 
- Elmasri, R., & Navathe, S. B. (2015). *Fundamentals of Database Systems* (7th ed.). Pearson.
- Murach, J. (2017). *Murach's MySQL*. Mike Murach & Associates, Inc.
- Ramakrishnan, R., & Gehrke, J. (2003). *Database Management Systems* (3rd ed.). McGraw-Hill.

### Bases de Datos
- [world.db](https://github.com/openmundi/world.db)
- [world.db ](https://openmundi.github.io/)

### Documentación

- [Chapter 7 Examples of Common Queries](https://dev.mysql.com/doc/mysql-tutorial-excerpt/5.7/en/examples.html)
- [MySQL GROUP BY Statement ](https://www.w3schools.com/mysql/mysql_groupby.asp)
- [MySQL SQL](https://www.w3schools.com/mysql/mysql_sql.asp)
- W3Schools. (n.d.). *SQL Tutorial*. Retrieved from [W3Schools SQL Tutorial](https://www.w3schools.com/sql/)

