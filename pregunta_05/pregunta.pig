/*
Pregunta
===========================================================================

Para el archivo `data.tsv` compute Calcule la cantidad de registros en que 
aparece cada letra minúscula en la columna 2.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
datos = LOAD 'data.tsv' AS 
        ( letra:charArray,
          tupla:bag{},
          lista:map[]);

datos = FOREACH datos GENERATE FLATTEN(tupla) as flatten_letra;

datos = FOREACH (GROUP datos BY flatten_letra) GENERATE group,COUNT(datos.flatten_letra);
STORE datos INTO 'output' USING PigStorage(',');