select nombre from producto;
select nombre,precio from producto;
select * from producto;
select nombre, concat(precio,"€") from producto;
select nombre, concat(precio*1.04,"$") as preu$, concat(precio,"€") as preu€ from producto;
select upper(nombre),precio from producto;
select lcase(nombre),precio from producto;
select nombre, left(upper(nombre),2)  from fabricante;
select nombre, round(precio) from producto;
"select nombre, precio decimal(11,0) from producto;" "select nombre,precio cast(precio as int,5) from producto;"
select codigo_fabricante  from producto; select codigo_fabricante  from producto  where codigo in(select codigo  from fabricante); 
select codigo  from fabricante f where codigo in(select codigo_fabricante  from producto p where f.codigo = p.codigo_fabricante);select codigo  from fabricante  where codigo in(select codigo_fabricante  from producto); 
select nombre from fabricante order by nombre ASC;
select nombre from fabricante  order by nombre DESC;
select nombre, precio from producto order by nombre ASC, precio DESC;
select nombre from fabricante  order by nombre ASC limit 5;
select nombre from fabricante  order by nombre ASC limit 3,2;
select nombre,precio from producto order by precio ASC limit 1;
select nombre,precio from producto order by precio DESC limit 1;
select nombre from producto where codigo_fabricante=2;
xselect nombre p,precio p, nombre f from producto p,fabricante f;
xselect nombre p,precio p, nombre f from producto p,fabricante f order by precio DESC;
select nombre,codigo from producto UNION  select nombre, codigo from fabricante;


select codigo from fabricante INNER JOIN producto on producto.codigo_fabricante=fabricante.codigo;
















---------------------------------UNIVERSIDAD-------------------------------------------------------------;

select apellido1, apellido2, nombre  from persona where (tipo = "alumno") order by apellido1, apellido2, nombre DESC;
select  apellido1, apellido2, nombre  from persona where (tipo = "alumno" and telefono = null);
select * from persona where fecha_nacimiento like "1999%";
select  apellido1, apellido2, nombre  from persona where (tipo = "profesor" and telefono = null and nif like "%K");
select nombre from asignatura where (id_grado = 7 and curso = 3 and cuatrimestre = 1);
select p.apellido1, p.apellido2, p.nombre, d.nombre from persona p, departamento d where p.id in(select id from departamento where id in (select id_departamento from profesor))order by apellido1, apellido2, p.nombre DESC;
select a.nombre, c.anyo_inicio, c.anyo_fin from asignatura a, curso_escolar c where a.id in(select id from curso_escolar where id in(select id from persona where nif="26902806M" )); 
select nombre from departamento where id in(select id_departamento from profesor where id_profesor in( select id_profesor from asignatura where id_grado in( select id from grado where nombre ='Grado en Ingeniería Informática (Plan 2015)')));
select id_alumno from alumno_se_matricula_asignatura; 
--------------------------JOINS-----------------------------------------------------------------;
select p.nombre, apellido1, apellido2, d.nombre from departamento d left join  persona p on d.id=p.id_departamento;
select p.nombre, apellido1, apellido2, d.nombre from departamento d, profesor p2, persona p where tipo="profesor" left join departamento d on d.id=p2.id_departamento ;

select p.nombre, p2.id_profesor from persona p right join profesor p2 on p.id=p2.id_profesor where p.id in( select id_profesor from profesor where id_departamento="null");  
select p.nombre from persona p where tipo="profesor" UNION select id_departamento from profesor left join departamento on id=id_departamento;
select p.nombre, p2.id_departamento from persona p right join profesor p2 on p.id=p2.id_profesor UNION select p.nombre, p2.id_departamento from persona p RIGHT join profesor p2 on p.id=p2.id_profesor; 

and p2.id_departamento=NULL;



------------------------------------RESUM---------------------------------------------------------------;
select count(id) from persona where tipo = "alumno";
select count(id) from persona where tipo = "alumno" and fecha_nacimiento like "1999%";
select d.nombre, count(id_profesor) from profesor p, departamento d where p.id_profesor in(select id_profesor from profesor where id=id_departamento) group by nombre order by count(id_profesor) desc;
select d.nombre, count(p.id_profesor) from  departamento d left join profesor p on p.id_departamento=d.id group by d.nombre;
select g.nombre, count(a.id_grado) from  grado g left join asignatura a on g.id=a.id_grado group by g.nombre;
select g.nombre, count(a.id_grado) from  grado g inner join asignatura a on g.id=a.id_grado group by g.nombre HAVING count(a.id_grado)>40;
select g.nombre, count(a.creditos) from grado g inner join asignatura a  on g.id=a.id_grado group by tipo;
select c.anyo_inicio, count(a.id_alumno) from curso_escolar c inner join alumno_se_matricula_asignatura a  on c.id=a.id_curso_escolar group by id_curso_escolar;
select p.id_profesor, count(a.id) from profesor p left join asignatura a  on p.id_profesor=a.id_profesor group by id_profesor;
select * from persona where fecha_nacimiento > ALL(select fecha_nacimiento from persona where tipo="alumno");
select p.id_profesor from profesor p inner join asignatura a on p.id_profesor=a.id_profesor group by id_profesor;
---------------------------------------------------------------------------------------------------------------;




select id_profesor from profesor where id_profesor not in(select id_profesor from asignatura);


select d.nombre, count(d.id) from profesor p, departamento d where p.id_departamento in(select id_departamento from profesor where d.id=id_departamento) or d.id not in(select id_departamento from profesor where id=id_departamento) group by d.id;


select g.nombre, count(g.id) from grado g, asignatura a where a.id_grado in(select id_grado from asignatura  where g.id=id_grado) group by nombre order by count(g.id);
select g.nombre, count(g.id) from grado g, asignatura a where a.id_grado in(select id_grado from asignatura  where g.id=id_grado) or g.id not in(select id_grado from asignatura where g.id=id_grado) group by nombre order by count(g.id);


select d.nombre, count(p.id_profesor) from profesor p, departamento d where p.id_departamento in(select id_departamento from profesor where id=id_departamento) or id not in(select id_departamento from profesor where d.id=id_departamento ) group by nombre ;

select d.nombre, count(p.id_departamento) from  departamento d, profesor p where id in(select id_departamento from profesor where d.id=id_departamento) and id not in(select id_departamento from profesor where d.id=id_departamento ) group by nombre;


select d.nombre from departamento d where id in (select id_departamento from profesor group by id_departamento);
select d.nombre, count(id_profesor) from departamento d, profesor p where id in (select id_departamento from profesor group by id_departamento);
select d.nombre, count(p.id_profesor) from profesor p, departamento d group by id_departamento;
 select * from persona;
 
 