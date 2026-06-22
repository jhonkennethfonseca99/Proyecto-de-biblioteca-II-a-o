CREATE DATABASE biblionet;
USE biblionet;
-- Tabla autor
CREATE TABLE autor(
id_autor int auto_increment primary key,
nombre varchar(100),
nacionalidad varchar(100)
 );
 
 -- Tabla bibliotecario
 -- perfiles
 alter table 
 bibliotecario
 rename to
 perfiles;
 CREATE TABLE Bibliotecario(
 id_bibliotecario int auto_increment primary key,
 nombre varchar(100),
 correo varchar(200),
 contraseña int,
 rol varchar(100) 
 );
 select * from perfiles;
 -- Taabla categoria
 CREATE TABLE Categoria(
 id_categoria int auto_increment primary key,
 nombre varchar(100),
 descripcion varchar(200));
 
 -- Tabla Editorial
 CREATE TABLE Editorial (
 id_editorial int auto_increment primary key,
 nombre varchar(100),
 pais varchar(50)); 
 
 -- Tabla Usuario
CREATE TABLE Usuario (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    telefono VARCHAR(20),
    tipo_usuario ENUM('estudiante', 'profesor', 'director') NOT NULL,
    seccion VARCHAR(50),
    año VARCHAR(20)
);
select e.nombre as Usuario,
       e.titulo as Libro;
-- Tabla Libro
 CREATE TABLE Libro(
 id_libro int auto_increment primary key,
 titulo varchar(100) not null,
 id_editorial int,
 id_categoria int,
 cantidad_total int not null,
 cantidad_disponible int not null,
 foreign key(id_editorial)references Editorial(id_editorial)
on delete set null
on update cascade,
foreign key(id_categoria)references Categoria(id_categoria)
on delete set null
on update cascade
);

-- Tabla autor_libro de muchos muchos
 CREATE TABLE Autor_Libro(
id_autor int,
id_libro int,
primary key(id_autor, id_libro),
foreign key(id_autor) references Autor (id_autor)
on delete cascade
on update cascade,
foreign key(id_libro) references Libro (id_libro)
on update cascade
on delete cascade
);

-- Tabla de prestamos
 CREATE TABLE Prestamo (
    id_prestamo INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT,
    id_bibliotecario INT,  --  QUIÉN HIZO EL PRÉSTAMO
    fecha_prestamo DATE NOT NULL,
    fecha_devolucion DATE NOT NULL,
    fecha_real_devolucion DATE,
    estado ENUM('activo', 'devuelto', 'retrasado') DEFAULT 'activo',
FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario)
on delete cascade
on update cascade,
FOREIGN KEY (id_bibliotecario) REFERENCES Bibliotecario(id_bibliotecario)
on delete cascade
on update cascade
);
-- Tabla detallesprestamos
  CREATE TABLE DetallePrestamo(
id_detalle INT AUTO_INCREMENT PRIMARY KEY,
id_prestamo INT,
id_libro INT,
cantidad INT,
FOREIGN KEY (id_prestamo) REFERENCES Prestamo(id_prestamo)
ON DELETE CASCADE,
FOREIGN KEY (id_libro) REFERENCES Libro(id_libro)
);
  
  -- Tabla Reporte
CREATE TABLE reporte(
id_reporte int auto_increment primary key,
fecha_inicio date,
fecha_fin date,
id_prestamo int,
 
 foreign key (id_prestamo) references Prestamo(id_prestamo)
 on delete set null
 on update cascade
); 
    -- Insertar datos en la tabla usuario
 INSERT INTO Usuario (nombre, telefono, tipo_usuario, seccion, año) VALUES
('Juan Perez', '88880001', 'estudiante', 'A', '1ro'),
('Maria Lopez', '88880002', 'estudiante', 'B', '2do'),
('Luis Martinez', '88880003', 'estudiante', 'A', '3ro'),
('Sofia Ramirez', '88880004', 'estudiante', 'C', '1ro'),
('Pedro Gomez', '88880005', 'profesor', NULL, NULL),
('Laura Diaz', '88880006', 'profesor', NULL, NULL),
('Miguel Castro', '88880007', 'director', NULL, NULL);

-- Insertar datos en la tabla autor
INSERT INTO autor (nombre,nacionalidad) values
('Ruben Dario', 'Nicaraguense'),
('Gabriel Garcia Marquez', 'Colombiano'),
('Miguel de Cervantes', 'Español'),
('Paulo Coelho', 'Brasileño'),
('Norlan Mina','urugui'),
('Marcos Guido','Panameño'),
('Lorena Ramirez','Nicaraguense'),
('Heidy Luna','Tica'),
('Lidia Diaz','Nicaraguense'),
('Jordy Mina','Tico');
delete from autor_libro;
delete from autor;
-- Modo seguro desactivado
SET SQL_SAFE_UPDATES = 0;
-- Elimonar duplicados de menor a mayor
DELETE a1
FROM autor a1
INNER JOIN autor a2
ON a1.nombre = a2.nombre
AND a1.nacionalidad = a2.nacionalidad
AND a1.id_autor > a2.id_autor;
-- Activar modo seguro
 set sql_SAFE_UPDATES=1;
 -- Insertar datos en la tabla bibliotecario
 INSERT INTO bibliotecario (nombre,correo, contraseña,rol)values
('Carlos Mendoza', 'carlos.mendoza@gmail.com', 1234, 'bibliotecario'),
('Ana López', 'ana.lopez@yahoo.com', 5678, 'profesor'),
('Luis Martínez', 'luis.martinez@hotmail.com', 4321, 'bibliotecario'),
('María Torres', 'maria.torres@gmail.com', 8765, 'profesor'),
('José Ramírez', 'jose.ramirez@gmail.com', 1111, 'bibliotecario'),
('Claudia Pérez', 'claudia.perez@yahoo.com', 2222, 'profesor'),
('Fernando Castillo', 'fernando.castillo@hotmail.com', 3333, 'bibliotecario'),
('Sofía Herrera', 'sofia.herrera@gmail.com', 4444, 'profesor'),
('Daniel Vargas', 'daniel.vargas@gmail.com', 5555, 'bibliotecario'),
('Lucía Gómez', 'lucia.gomez@yahoo.com', 6666, 'profesor'),
('Pedro Ruiz', 'pedro.ruiz@hotmail.com', 7777, 'bibliotecario'),
('Valeria Castro', 'valeria.castro@gmail.com', 8888, 'profesor');

INSERT INTO perfiles(apellido)values
('Mendoza'),
('Lopez'),
('Martinez'),
('Torrez'),
('Ramirez'),
('Perez'),
('Castillo'),
('herrera'),
('Vargas'),
('Gomez'),
('Ruiz'),
('Castro');
UPDATE perfiles  SET apellido = 'Mendoza' WHERE id_perfiles = 1;
UPDATE perfiles SET apellido = 'López' WHERE id_perfiles = 2;
UPDATE perfiles SET apellido = 'Martínez' WHERE id_perfiles = 3;
UPDATE perfiles SET apellido = 'Torres' WHERE id_perfiles = 4;
UPDATE perfiles a SET apellido = 'Ramírez' WHERE id_perfiles = 5;
UPDATE perfiles SET apellido = 'Pérez' WHERE id_perfiles = 6;
UPDATE perfiles SET apellido = 'Castillo' WHERE id_perfiles = 7;
UPDATE perfiles SET apellido = 'Herrera' WHERE id_perfiles = 8;
UPDATE perfiles SET apellido = 'Vargas' WHERE id_perfiles = 9;
UPDATE perfiles SET apellido = 'Gómez' WHERE id_perfiles = 10;
UPDATE perfiles  SET apellido = 'Ruiz' WHERE id_perfiles = 11;
UPDATE perfiles SET apellido = 'Castro' WHERE id_perfiles = 12;
select*from perfiles;
 -- Insercion de datos de la tabla editorial
 INSERT INTO editorial(nombre,pais)values
 ('Planeta', 'España'),
('Santillana', 'España'),
('Penguin Random House', 'Estados Unidos'),
('HarperCollins', 'Estados Unidos'),
('Oxford University Press', 'Reino Unido'),
('Cambridge University Press', 'Reino Unido'),
('McGraw-Hill', 'Estados Unidos'),
('Alfaguara', 'España'),
('Norma Editorial', 'Colombia'),
('Fondo de Cultura Económica', 'México'),
('Editorial Sudamericana', 'Argentina'),
('Grupo Anaya', 'España');
  
  -- Insercion de datos de la tabla descripcion
  
  INSERT INTO categoria (nombre,descripcion) values
  ('Romance Juvenil', 'Historias de amor dirigidas a adolescentes y jóvenes'),
('Drama', 'Relatos con conflictos emocionales profundos y situaciones intensas'),
('Ficción Contemporánea', 'Historias ambientadas en la época actual'),
('Juvenil', 'Libros enfocados en experiencias de adolescentes'),
('Amor Trágico', 'Relaciones amorosas con finales difíciles o dolorosos'),
('Realismo', 'Narrativas que reflejan situaciones de la vida real'),
('Crecimiento Personal', 'Historias sobre desarrollo emocional y aprendizaje de vida'),
('Relaciones Tóxicas', 'Relatos que exploran vínculos dañinos entre personajes'),
('Narrativa Moderna', 'Estilo actual con lenguaje cercano a los jóvenes'),
('Literatura Emocional', 'Libros que buscan generar impacto sentimental en el lector');
 
INSERT INTO libro (titulo, id_editorial, id_categoria, cantidad_total, cantidad_disponible) VALUES
('Boulevard', 1, 1, 10, 8),
('Antes de diciembre', 2, 1, 12, 10),
('A través de mi ventana', 3, 1, 8, 6),
('After', 3, 2, 15, 12),
('Bajo la misma estrella', 4, 5, 10, 7),
('Culpa mía', 2, 1, 9, 7),
('Todo, todo', 4, 3, 7, 5),
('El chico de las estrellas', 5, 7, 6, 4),
('Fuimos canciones', 1, 3, 8, 6),
('Sigue mi voz', 2, 1, 10, 9),
('Rompiendo el hielo', 3, 4, 7, 5),
('Latidos', 1, 6, 6, 4);

INSERT INTO Autor_Libro (id_autor,id_libro) VALUES
(1,1),
(2,2),
(3,3),
(4,4),
(5,5),
(6,6),
(7,7),
(8,8),
(9,9),
(10,10);
-- mostrar los datos de las tablas 
SELECT * FROM usuario;
SELECT * FROM libro;
select * from bibliotecario;

INSERT INTO Prestamo 
(id_usuario, id_bibliotecario, fecha_prestamo, fecha_devolucion, fecha_real_devolucion, estado)
VALUES
(2, 8, '2026-04-10', '2026-04-20', '2026-04-18', 'devuelto'),
(7, 6, '2026-04-15', '2026-04-25', '2026-04-28', 'retrasado'),
(3, 3, '2026-04-20', '2026-04-30', '2026-05-02', 'retrasado'),
(5, 4, '2026-04-25', '2026-05-05', '2026-05-04', 'devuelto'),
(1, 1, '2026-05-01', '2026-05-10', '2026-05-09', 'devuelto'),
(6, 5, '2026-05-01', '2026-05-11', NULL,         'activo'),
(2, 2, '2026-05-02', '2026-05-12', NULL,         'activo'),
(4, 1, '2026-05-03', '2026-05-13', NULL,         'activo'),
(1, 7, '2026-05-04', '2026-05-14', NULL,         'activo'),
(3, 9, '2026-05-05', '2026-05-15', NULL,         'activo');

alter table pretamos
rename id_bibliotecario ;



select * from detalleprestamo;
select *from prestamo;

INSERT INTO reporte (fecha_inicio, fecha_fin, id_prestamo) VALUES
('2026-04-10', '2026-04-18', 1),
('2026-04-15', '2026-04-28', 2),
('2026-04-20', '2026-05-02', 3),
('2026-04-25', '2026-05-04', 4),
('2026-05-01', '2026-05-09', 5),
('2026-05-01', '2026-05-11', 6),
('2026-05-02', '2026-05-12', 7),
('2026-05-03', '2026-05-13', 8),
('2026-05-04', '2026-05-14', 9),
('2026-05-05', '2026-05-15', 10);

UPDATE editorial set pais='Mexico' where id_editorial=1;
select*from editorial;
select * from autor;
select *from autoperfilesr_libro;
select * from bibliotecario;
select *from categoria;
select * from libro;
select *from prestamo;
select *from reporte;

select *from detalleprestamo;

alter table prestamo
rename column id_bibliotecario to id_perfiles;

select*from perfiles;

 

select *from prestamo;

alter table prestamo add id_libro int;
ALTER TABLE prestamo
MODIFY COLUMN id_libro INT
AFTER id_perfiles;

select L.id_libro,
	   L.titulo,
	from libro l
        sum(p.id_libro) as total_prestamos
        from prestamos
       
       SELECT 
    l.titulo AS libro,
    SUM(dp.cantidad) AS total_prestado
FROM detalleprestamo dp
INNER JOIN libro l ON dp.id_libro = l.id_libro
GROUP BY l.id_libro, l.titulo
ORDER BY total_prestado DESC
LIMIT 1;

select L.id_libro,
L.titulo,
a.nombre
from libro L
inner join autor_libro al
on L.id_libro =  al.id_libro
inner join autor a
on al.id_autor=a.id_autor;

