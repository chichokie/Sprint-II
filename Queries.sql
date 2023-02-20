select nombre from producto;
select nombre,precio from producto;
select * from producto;
select nombre, concat(precio,"€") from producto;
select nombre, concat(precio*1.04,"$") as preu$, concat(precio,"€") as preu€ from producto;
select upper(nombre),precio from producto;
select lcase(nombre),precio from producto;
select nombre, left(upper(nombre),2)  from fabricante;
select nombre, round(precio) from producto;
select nombre, TRUNCATE(precio,0) from producto;
select codigo_fabricante  from producto; select codigo_fabricante  from producto  where codigo in(select codigo  from fabricante); 
select codigo  from fabricante f where codigo in(select codigo_fabricante  from producto p where f.codigo = p.codigo_fabricante); select codigo  from fabricante  where codigo in(select codigo_fabricante  from producto); 
select nombre from fabricante order by nombre ASC;
select nombre from fabricante  order by nombre DESC;
select nombre, precio from producto order by nombre ASC, precio DESC;
select nombre from fabricante  order by nombre ASC limit 5;
select nombre from fabricante  order by nombre ASC limit 3,2;
select nombre,precio from producto order by precio ASC limit 1;
select nombre,precio from producto order by precio DESC limit 1;
select nombre from producto where codigo_fabricante=2;
select p.nombre,p.precio,f.nombre from producto p,fabricante f;
select p.nombre,p.precio,f.nombre from producto p,fabricante f order by precio DESC;
select p.nombre,p.codigo,f.nombre,f.codigo  from producto p,fabricante f;
select p.nombre,p.precio,f.nombre  from producto p,fabricante f where p.codigo_fabricante = f.codigo and precio = (select min(precio) from producto) ;
select p.nombre,p.precio,f.nombre  from producto p,fabricante f where p.codigo_fabricante = f.codigo and precio = (select max(precio) from producto) ;
select nombre from producto where codigo_fabricante=(select codigo from fabricante where nombre = "Lenovo");
select nombre from producto where precio > 200 and codigo_fabricante=(select codigo from fabricante where nombre = "Crucial");
select p.nombre from producto p, fabricante f  where (p.codigo_fabricante=f.codigo) and (f.nombre = "Asus" or f.nombre= "Seagate" or f.nombre="Hewlett-Packard")  ;
select nombre from producto where codigo_fabricante in(select codigo from fabricante where nombre = "Asus" or nombre= "Hewlett-Packard" or nombre=  "Seagate");
select nombre from producto where codigo_fabricante in(select codigo from fabricante where nombre LIKE "%e");
select nombre from producto where codigo_fabricante in(select codigo from fabricante where nombre LIKE "%w%");
select p.precio,p.nombre,f.nombre  from producto p,fabricante f where (p.codigo_fabricante = f.codigo and precio >= 180) order by p.precio desc, p.nombre asc;


select f.codigo, f.nombre from fabricante f,producto p where f.codigo not in(select codigo_fabricante from producto) group by f.nombre;
select f.codigo, f.nombre from fabricante f INNER JOIN producto p on p.codigo_fabricante!=f.codigo;


select * from  fabricante;
select * from  producto;






select * from producto where precio =(select MAX(precio) from producto where codigo_fabricante in(select codigo from fabricante where nombre="Lenovo"));

select * from producto  where codigo_fabricante =(select codigo from fabricante where nombre="lenovo");
select * from producto;



---------------------------------UNIVERSIDAD-------------------------------------------------------------;

select apellido1, apellido2, nombre  from persona where (tipo = "alumno") order by apellido1, apellido2, nombre;
select  apellido1, apellido2, nombre  from persona where (tipo = "alumno" and telefono is null);
select * from persona where fecha_nacimiento like "1999%";
select apellido1, apellido2, nombre  from persona where (tipo = "profesor" and telefono is null and nif like "%K");
select nombre from asignatura where (id_grado = 7 and curso = 3 and cuatrimestre = 1);
select p.apellido1, p.apellido2, p.nombre, d.nombre from persona p, departamento d where p.id in(select id_profesor from profesor where id_departamento=d.id) order by apellido1, apellido2, p.nombre DESC;
select a.nombre, c.anyo_inicio, c.anyo_fin from asignatura a, curso_escolar c where c.id in(select id_curso_escolar from alumno_se_matricula_asignatura) and a.id in(select id_asignatura from alumno_se_matricula_asignatura  where id_alumno =(select id from persona where nif="26902806M" )) group by a.nombre; 
select nombre from departamento where id in(select id_departamento from profesor where id_profesor in( select id_profesor from asignatura where id_grado in( select id from grado where nombre ='Grado en Ingeniería Informática (Plan 2015)')));
select nombre from persona where id in(select id_alumno from alumno_se_matricula_asignatura where id_curso_escolar in(select id from curso_escolar where anyo_inicio = 2018 and anyo_fin = 2019)); 
--------------------------JOINS-----------------------------------------------------------------;
select p.nombre, p.apellido1, p.apellido2, d.nombre from departamento d, persona p right join  profesor p2 on d.id = p2.id_departamento;
select p.nombre from  persona p inner join profesor p2 on p.id=p2.id_profesor and p2.id_departamento=NULL;
3
select d.nombre from departamento d left join profesor p on d.id=p.id_departamento where d.id not in( select id_departamento from profesor);  
select d.nombre from departamento d left join profesor p on d.id=p.id_departamento where p.id_profesor is null;  
-
select persona.nombre from persona left join profesor on persona.id = profesor.id_profesor where profesor.id_profesor not in(select id_profesor from asignatura);

xselect a.nombre from asignatura a  left join profesor p on p.id_profesor not in( select a.id_profesor from asignatura);
xselect p.nombre from persona p where tipo="profesor" UNION select id_departamento from profesor left join departamento on id=id_departamento;
xselect p.nombre, p2.id_departamento from persona p right join profesor p2 on p.id=p2.id_profesor UNION select p.nombre, p2.id_departamento from persona p RIGHT join profesor p2 on p.id=p2.id_profesor; 

and p2.id_departamento=NULL;
right join asignatura on asignatura.id_profesor is null;
where p2.id_profesor not in( select id_profesor from asignatura);

------------------------------------RESUM---------------------------------------------------------------;
select count(id) from persona where tipo = "alumno";
select count(id) from persona where tipo = "alumno" and fecha_nacimiento like "1999%";
select d.nombre, count(id_profesor) from profesor p, departamento d where p.id_profesor in(select id_profesor from profesor where id=id_departamento) group by nombre order by count(id_profesor) desc;
select d.nombre, count(p.id_profesor) from  departamento d left join profesor p on p.id_departamento=d.id group by d.nombre;
select g.nombre, count(a.id_grado) from  grado g left join asignatura a on g.id=a.id_grado group by g.nombre order by count(a.id_grado)desc;
select g.nombre, count(a.id_grado) from  grado g inner join asignatura a on g.id=a.id_grado group by g.nombre HAVING count(a.id_grado)>40;
select g.nombre, a.tipo, count(a.creditos) from grado g inner join asignatura a on g.id=a.id_grado group by a.tipo, g.nombre;
select c.anyo_inicio,count(distinct a.id_alumno) from curso_escolar c inner join alumno_se_matricula_asignatura a  on c.id=a.id_curso_escolar group by id_curso_escolar;
select p.id,p.nombre,p.apellido1,p.apellido2, count(a.id) from persona p, asignatura a  where p.id=a.id_profesor group by id_profesor order by count(a.id);
select * from persona where fecha_nacimiento =(select MAX(fecha_nacimiento) from persona where tipo="alumno");
select p.id_profesor from profesor p, asignatura a where (id_departamento IS NOT NULL AND p.id_profesor!=a.id_profesor) group by id_profesor;
11
select p.id_profesor from profesor p where (id_departamento IS NOT NULL AND p.id_profesor not in(select id_profesor from asignatura));
select p.id_profesor from profesor p where p.id_profesor in(select id_profesor from asignatura);pk?
id_departamento IS NOT NULL AND
---------------------------------------------------------------------------------------------------------------;
SELECT DISTINCT pe.nombre, pe.apellido1, pe.apellido2 FROM departamento dp left JOIN profesor pr ON dp.id = pr.id_departamento left JOIN asignatura asi ON pr.id_profesor = asi.id_profesor LEFT JOIN persona pe ON pr.id_profesor = pe.id WHERE (asi.nombre IS NULL AND id_departamento IS NOT NULL) ORDER BY pe.nombre;
SELECT asi.nombre, ce.anyo_inicio, ce.anyo_fin FROM persona pe INNER JOIN alumno_se_matricula_asignatura am ON am.id_alumno = pe.id INNER JOIN asignatura asi ON asi.id = am.id_asignatura INNER JOIN curso_escolar ce ON ce.id = am.id_curso_escolar WHERE pe.nif = '26902806M';
SELECT dp.nombre, pr.id_profesor FROM departamento dp LEFT JOIN profesor pr ON dp.id = pr.id_departamento WHERE pr.id_profesor IS NULL ORDER BY dp.nombre;
"select nombre, precio decimal(11,0) from producto;" "select nombre,precio cast(precio as int,5) from producto;";
select nombre, cast(precio as INT) from producto;
select nombre, precio decimal(11,0) from producto;
select id_profesor from profesor where id_profesor not in(select id_profesor from asignatura);
select * from persona;
select d.nombre, count(d.id) from profesor p, departamento d where p.id_departamento in(select id_departamento from profesor where d.id=id_departamento) or d.id not in(select id_departamento from profesor where id=id_departamento) group by d.id;


select g.nombre, count(g.id) from grado g, asignatura a where a.id_grado in(select id_grado from asignatura  where g.id=id_grado) group by nombre order by count(g.id);
select g.nombre, count(g.id) from grado g, asignatura a where a.id_grado in(select id_grado from asignatura  where g.id=id_grado) or g.id not in(select id_grado from asignatura where g.id=id_grado) group by nombre order by count(g.id);


select d.nombre, count(p.id_profesor) from profesor p, departamento d where p.id_departamento in(select id_departamento from profesor where id=id_departamento) or id not in(select id_departamento from profesor where d.id=id_departamento ) group by nombre ;

select d.nombre, count(p.id_departamento) from  departamento d, profesor p where id in(select id_departamento from profesor where d.id=id_departamento) and id not in(select id_departamento from profesor where d.id=id_departamento ) group by nombre;


select d.nombre from departamento d where id in (select id_departamento from profesor group by id_departamento);
select d.nombre, count(id_profesor) from departamento d, profesor p where id in (select id_departamento from profesor group by id_departamento);
select d.nombre, count(p.id_profesor) from profesor p, departamento d group by id_departamento;
 select * from persona;
 
 