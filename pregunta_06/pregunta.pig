/*
Pregunta
===========================================================================

Para el archivo `data.tsv` Calcule la cantidad de registros por clave de la 
columna 3. En otras palabras, cuántos registros hay que tengan la clave 
`aaa`?

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
datos = LOAD 'data.tsv' AS 
        ( letra:charArray,
          tupla:bag{},
          lista:map[]);

datos = FOREACH datos GENERATE FLATTEN(lista) as listasep;

datos = FOREACH (GROUP datos BY listasep) GENERATE group,COUNT(datos.listasep);
STORE datos INTO 'output' USING PigStorage(',');