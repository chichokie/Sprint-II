delete from clientes;
truncate table gafas;
truncate table marca;
truncate table proveedor;
select * from clientes;
select * from marca;

INSERT INTO proveedor  VALUES ('12345678B','Raiban street,1','Juan', 654321078);
INSERT INTO marca  VALUES ('Raiban', '12345678B');
INSERT INTO clientes  VALUES ('a@gmail.com', 'a', 'C/a,piso3,Barcelona', '2022-12-12','');
INSERT INTO gafas  VALUES (default,'Raiban', 'a@gmail.com', 1, 2, 100,'pasta','negro','negro','3');
INSERT INTO clientes  VALUES ('b@gmail.com', 'b', 'C/a,piso3,Barcelona', '2022-12-12', 'a');

select count(cod_com) from comanda_detalle;
INSERT INTO tienda  VALUES (123456,'Raiban street,1','Juan', 654321078);
INSERT INTO empleado  VALUES ('Raiban', 123456);
INSERT INTO cliente  VALUES ('a@gmail.com', 'a', 'C/a,piso3,Barcelona', '2022-12-12','');
INSERT INTO producto  VALUES (default,'Raiban', 'a@gmail.com', 1, 2, 100,'pasta','negro','negro','3');
INSERT INTO comanda  VALUES ('b@gmail.com', 'b', 'C/a,piso3,Barcelona', '2022-12-12', 'a');
INSERT INTO comanda_detalle  VALUES ('b@gmail.com', 'b', 'C/a,piso3,Barcelona', '2022-12-12', 'a');
INSERT INTO comanda_detalle  VALUES ('b@gmail.com', 'b', 'C/a,piso3,Barcelona', '2022-12-12', 'a');

INSERT INTO comanda () SELECT codigo FROM comanda_detalle WHERE mas='N';

DELIMITER //
DROP TRIGGER IF EXISTS codigo;
CREATE TRIGGER codigo AFTER UPDATE ON comanda
FOR EACH ROW
BEGIN
EXECUTE detalle(codigo= select TOP 1 codigo from comanda)
END
//

DELIMiTER $$
create procedure detalle( IN codigo int) 
begin
SET cat_p=(
   select count(cod_com) 
   from comanda_detalle cd
   where cd.cod_com=codigo
   group by cod_com);
end;
$$


DELIMITER $$
create procedure cant_prod( IN codigo int, OUT cantidad_p int) 
begin
SET cat_p=(
   select count(cod_com) 
   from comanda_detalle cd
   where cd.cod_com=codigo
   group by cod_com);
end;
SELECT codigo  FROM comanda

IF mas = "N" THEN EXECUTE cant_prod(codigo= select codigo from comanda, cantidad_p)
END IF

DELIMITER $$
DROP PROCEDURE IF EXISTS listar_productos$$
CREATE PROCEDURE cat_prod(IN gama VARCHAR(50))
BEGIN
  SELECT *
  FROM producto
  WHERE producto.gama = gama;
END;
$$

DELIMITER $$
DROP PROCEDURE IF EXISTS contar_productos$$
CREATE PROCEDURE contar_productos(IN gama VARCHAR(50), OUT total INT UNSIGNED)
BEGIN
  SELECT COUNT(*) 
  INTO total
  FROM producto 
  WHERE producto.gama = gama;
END;
$$
DELIMITER //
DROP TRIGGER IF EXISTS actu_moroso;
CREATE TRIGGER actu_moroso AFTER UPDATE ON soci
FOR EACH ROW
BEGIN
IF EXISTS (SELECT codi FROM morosos WHERE codi = OLD.codi) THEN

    IF OLD.codi != NEW.codi THEN
        UPDATE morosos SET codi = NEW.codi WHERE nom = OLD.nom;
    END IF;
    IF OLD.adreça != NEW.adreça THEN
        UPDATE morosos SET adreça = NEW.adreça WHERE nom = OLD.nom;
    END IF;
    IF OLD.telefon != NEW.telefon THEN
        UPDATE morosos SET telefon = NEW.telefon WHERE nom = OLD.nom;
    END IF;

END IF;
END
//
"INSERT INTO comanda select count(cod_com) from comanda_detalle;"