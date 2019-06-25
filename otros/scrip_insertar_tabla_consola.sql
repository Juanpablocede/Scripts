psql -U postgres -d db_proforca_2012
COPY saf_activo FROM '/home/jcedeno/Escritorio/prueba.csv' WITH DELIMITER ',';


psql -U postgres -d nombre_bd
COPY nombretabla FROM '/un/directorio/archivo.csv' WITH DELIMITER ',';
