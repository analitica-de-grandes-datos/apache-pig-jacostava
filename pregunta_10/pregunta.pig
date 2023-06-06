/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Genere una relación con el apellido y su longitud. Ordene por longitud y 
por apellido. Obtenga la siguiente salida.

  Hamilton,8
  Garrett,7
  Holcomb,7
  Coffey,6
  Conway,6

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
data = LOAD 'data.csv' USING PigStorage(',')
        AS(col1:INT,
           col2:charArray,
           col3:charArray,
           col4:charArray,
           col5:charArray,
           col6:INT);

data = FOREACH data GENERATE col3, SIZE(col3) AS largo;
data = ORDER data BY largo DESC, col3 ASC;
resp = LIMIT data 5;
STORE resp INTO 'output' USING PigStorage(',');
