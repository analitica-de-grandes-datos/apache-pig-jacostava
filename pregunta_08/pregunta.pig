/*
Pregunta
===========================================================================

Para el archivo `data.tsv` compute la cantidad de registros por letra de la 
columna 2 y clave de al columna 3; esto es, por ejemplo, la cantidad de 
registros en tienen la letra `b` en la columna 2 y la clave `jjj` en la 
columna 3 es:

  ((b,jjj), 216)

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
datos = LOAD 'data.tsv' AS 
        ( letra:charArray,
          tupla:bag{},
          lista:map[]);

datos = FOREACH datos GENERATE FLATTEN(tupla) AS letra, FLATTEN(lista) AS lisletras;
grupo = GROUP datos by (letra,lisletras);
salida = FOREACH grupo GENERATE group, COUNT(datos);
STORE salida INTO 'output' USING PigStorage(',');
