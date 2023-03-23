/*Queries a ser ejecutados en mysql para poder crear:
a) dos tablas
b) poblar las 2 tablas creadas

por: Stevenson W. Saint-Felix
Fecha: 23-Mar-2023
*/

/*Usar el schema mysql*/
use mysql;


/* Crear tabla divisas */
CREATE TABLE `divisas` (
   `idDivisa` char(3) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
   `nombreDivisa` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
   `paisDivisa` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
   PRIMARY KEY (`idDivisa`),
   UNIQUE KEY `iddivisas_UNIQUE` (`idDivisa`),
   UNIQUE KEY `nombreDivisa_UNIQUE` (`nombreDivisa`),
   UNIQUE KEY `paisDivisa_UNIQUE` (`paisDivisa`)
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Tabla de divisas';

 
/* Poblar la tabla divisas */
insert into divisas values ("DOP", "Dominican Peso", "Dominican Republic");
insert into divisas values ("HTG", "Haitian Gourde", "Haiti");
insert into divisas values ("USD", "US Dollar", "United States of America");
insert into divisas values ("EUR", "EURO", "European Union");
insert into divisas values ("ARS", "Argentina Peso", "Argentina");
insert into divisas values ("BRL", "Brazilian real", "Brazil");
insert into divisas values ("CLP", "Chilean peso", "Chili");
insert into divisas values ("COP", "Colombian peso", "Colombia");
insert into divisas values ("MXN", "Mexican peso", "Mexico");


/* Crear la tabla tasadecambio */
CREATE TABLE `tasasdecambio` (
   `idDivisa1` char(3) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'La divisa origen',
   `idDivisa2` char(3) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'La divisa destino',
   `tasasDeCambio` double NOT NULL COMMENT 'La tasa de cambio a multiplicar por la divisa1 (origen) para poder obtener la divisa2 (destino). tasaDeCambio * divisa1 = divisa2'
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Las tasas de cambio de las divisas';

/* Poblar la tabla tasadecambio */
insert into tasasdecambio values ("EUR", "HTG", 164.07);
insert into tasasdecambio values ("USD", "HTG", 153.88);
insert into tasasdecambio values ("USD", "DOP", 54);
insert into tasasdecambio values ("ARS", "ARS", 1);
insert into tasasdecambio values ("BRL", "BRL", 1);
insert into tasasdecambio values ("CLP", "CLP", 1);
insert into tasasdecambio values ("COP", "COP", 1);
insert into tasasdecambio values ("DOP", "DOP", 1);
insert into tasasdecambio values ("EUR", "EUR", 1);
insert into tasasdecambio values ("HTG", "HTG", 1);
insert into tasasdecambio values ("MXN", "MXN", 1);
insert into tasasdecambio values ("USD", "USD", 1);
insert into tasasdecambio values ("DOP", "USD", 0.0179);
insert into tasasdecambio values ("HTG", "USD", 0.006279);
insert into tasasdecambio values ("HTG", "EUR", 0.005889);
insert into tasasdecambio values ("ARS", "BRL", 32.206119);
insert into tasasdecambio values ("ARS", "CLP", 0.238564);
insert into tasasdecambio values ("ARS", "COP", 0.042321);
insert into tasasdecambio values ("ARS", "DOP", 3.578458);
insert into tasasdecambio values ("ARS", "EUR", 214);
insert into tasasdecambio values ("ARS", "HTG", 1.463915);
insert into tasasdecambio values ("ARS", "MXN", 9.661836);
insert into tasasdecambio values ("ARS", "USD", 181.75);
insert into tasasdecambio values ("BRL", "ARS", 0.03);
insert into tasasdecambio values ("BRL", "CLP", 0.006242);
insert into tasasdecambio values ("BRL", "COP", 0.001109);
insert into tasasdecambio values ("BRL", "DOP", 0.092369);
insert into tasasdecambio values ("BRL", "EUR", 5.61);
insert into tasasdecambio values ("BRL", "HTG", 0.03857);
insert into tasasdecambio values ("BRL", "MXN", 0.263985);
insert into tasasdecambio values ("BRL", "USD", 4.76);
insert into tasasdecambio values ("CLP", "ARS", 4.05);
insert into tasasdecambio values ("CLP", "BRL", 154.78);
insert into tasasdecambio values ("CLP", "COP", 0.172225);
insert into tasasdecambio values ("CLP", "DOP", 13.802622);
insert into tasasdecambio values ("CLP", "EUR", 867.04);
insert into tasasdecambio values ("CLP", "HTG", 6.038647);
insert into tasasdecambio values ("CLP", "MXN", 48.309179);
insert into tasasdecambio values ("CLP", "USD", 736.92);
insert into tasasdecambio values ("COP", "ARS", 22.83);
insert into tasasdecambio values ("COP", "BRL", 871.5);
insert into tasasdecambio values ("COP", "CLP", 5.61);
insert into tasasdecambio values ("COP", "DOP", 96.618357);
insert into tasasdecambio values ("COP", "EUR", 4882.07);
insert into tasasdecambio values ("COP", "HTG", 32.206119);
insert into tasasdecambio values ("COP", "MXN", 1);
insert into tasasdecambio values ("COP", "USD", 4132.23);
insert into tasasdecambio values ("DOP", "ARS", 0.27);
insert into tasasdecambio values ("DOP", "BRL", 10.46);
insert into tasasdecambio values ("DOP", "CLP", 0.07);
insert into tasasdecambio values ("DOP", "COP", 0.01);
insert into tasasdecambio values ("DOP", "EUR", 58.58);
insert into tasasdecambio values ("DOP", "HTG", 0.402576);
insert into tasasdecambio values ("DOP", "MXN", 2.760524);
insert into tasasdecambio values ("EUR", "ARS", 0.004515);
insert into tasasdecambio values ("EUR", "BRL", 0.172225);
insert into tasasdecambio values ("EUR", "CLP", 0.001114);
insert into tasasdecambio values ("EUR", "COP", 0.000198);
insert into tasasdecambio values ("EUR", "DOP", 0.016493);
insert into tasasdecambio values ("EUR", "MXN", 0.047131);
insert into tasasdecambio values ("EUR", "USD", 0.85);
insert into tasasdecambio values ("HTG", "ARS", 0.66);
insert into tasasdecambio values ("HTG", "BRL", 25.05);
insert into tasasdecambio values ("HTG", "CLP", 0.16);
insert into tasasdecambio values ("HTG", "COP", 0.03);
insert into tasasdecambio values ("HTG", "DOP", 2.4);
insert into tasasdecambio values ("HTG", "MXN", 6.441224);
insert into tasasdecambio values ("MXN", "ARS", 0.1);
insert into tasasdecambio values ("MXN", "BRL", 3.66);
insert into tasasdecambio values ("MXN", "CLP", 0.02);
insert into tasasdecambio values ("MXN", "COP", 1);
insert into tasasdecambio values ("MXN", "DOP", 0.35);
insert into tasasdecambio values ("MXN", "EUR", 20.5);
insert into tasasdecambio values ("MXN", "HTG", 0.15);
insert into tasasdecambio values ("MXN", "USD", 17.43);
insert into tasasdecambio values ("USD", "ARS", 0.005316);
insert into tasasdecambio values ("USD", "BRL", 0.20298);
insert into tasasdecambio values ("USD", "CLP", 0.001311);
insert into tasasdecambio values ("USD", "COP", 0.000234);
insert into tasasdecambio values ("USD", "EUR", 1.136687);
insert into tasasdecambio values ("USD", "MXN", 0.055432);

/*SELECT * FROM divisas;
SELECT * FROM tasasdecambio;

SELECT * FROM mysql.tasasdecambio WHERE idDivisa1 = "Argentina Peso" AND idDivisa2 = "Argentina Peso" limit 1;
SELECT * FROM mysql.tasasdecambio WHERE idDivisa1 = 'RS' AND idDivisa2 = 'RS' limit 1;

SHOW CREATE TABLE tasasdecambio;
*/

