CREATE DATABASE posts;

-- Crear tabla post, con los atributos id, nombre de usuario, fecha de creación, contenido,
-- descripción

CREATE TABLE post(
    id SERIAL,
    nombre_usuario VARCHAR(20),
    fecha_creacion DATE  DEFAULT CURRENT_DATE,
    contenido VARCHAR(100),
    descripcion VARCHAR(100)
);


-- Insertar 3 post, 2 para el usuario "Pamela" y uno para "Carlos"


INSERT INTO post(nombre_usuario, contenido, descripcion) VALUES ('Pamela', 'este es el primer post de Pamela', 'post 1 de paloma');
INSERT INTO post(nombre_usuario, contenido, descripcion) VALUES ('Pamela', 'este es el segundo post de Pamela', 'post 2 de paloma');

INSERT INTO post(nombre_usuario, contenido, descripcion) VALUES ('Carlos', 'este es el primer post de Carlos', 'post 1 de carlos');


-- Modificar la tabla post, agregando la columna título

ALTER TABLE post ADD COLUMN titulo VARCHAR(15);



-- Agregar título a las publicaciones ya ingresadas

UPDATE post SET titulo = 'Pamela post 1' WHERE id = 1;
UPDATE post SET titulo = 'Pamela post 2' WHERE id = 2;
UPDATE post SET titulo = 'Carlos post 1' WHERE id = 3;



-- Insertar 2 post para el usuario "Pedro"
INSERT INTO post(nombre_usuario, contenido, descripcion, titulo) VALUES ('Pedro', 'este es el primer post de Pedro', 'post 1 de Pedro', 'Pedro post 1');
INSERT INTO post(nombre_usuario, contenido, descripcion, titulo) VALUES ('Pedro', 'este es el segundo post de Pedro', 'post 2 de Pedro', 'Pedro post 2');



-- Eliminar el post de Carlos

DELETE FROM post WHERE nombre_usuario = 'Carlos';


-- Ingresar un nuevo post para el usuario "Carlos"
INSERT INTO post(nombre_usuario, contenido, descripcion, titulo) VALUES ('Carlos', 'este es el nuevo post de Carlos', 'post nuevo de Carlos', 'e vuelto!');



-- Crear una nueva tabla, llamada comentarios, con los atributos id, fecha y hora de creación,
-- contenido, que se relacione con la tabla posts

CREATE TABLE comentarios(
    id SERIAL,
    fecha_hora_creacion TIMESTAMP,
    contenido VARCHAR(100),
    post_id INT
    );

ALTER TABLE post ADD PRIMARY KEY(id);
ALTER TABLE comentarios ADD FOREIGN KEY(post_id) REFERENCES post(id);




-- Crear 2 comentarios para el post de "Pamela" y 4 para "Carlos"
INSERT INTO comentarios(fecha_hora_creacion, contenido, post_id) VALUES ('2021-01-20 19:10:25-07', 'este es el primer comentario del post de Pamela', 1);
INSERT INTO comentarios(fecha_hora_creacion, contenido, post_id) VALUES ('2021-01-20 19:11:00-07', 'este es el segundo comentario del post de Pamela', 1);

INSERT INTO comentarios(fecha_hora_creacion, contenido, post_id) VALUES ('2021-01-20 19:15:05-07', 'este es el primer comentario del post de Carlos', 7);
INSERT INTO comentarios(fecha_hora_creacion, contenido, post_id) VALUES ('2021-01-20 19:20:05-07', 'este es el segundo comentario del post de Carlos', 7);
INSERT INTO comentarios(fecha_hora_creacion, contenido, post_id) VALUES ('2021-01-21 19:25:05-07', 'este es el tercer comentario del post de Carlos', 7);
INSERT INTO comentarios(fecha_hora_creacion, contenido, post_id) VALUES ('2021-01-22 19:26:05-07', 'este es el cuarto comentario del post de Carlos', 7);


-- Crear un nuevo post para "Margarita"

INSERT INTO post(nombre_usuario, contenido, descripcion, titulo) VALUES ('Margarita', 'este es el primer post de Margarita', 'post nuevo de Margarita', 'post1Margarita!');


--  Ingresar 5 comentarios para el post de Margarita

INSERT INTO comentarios(fecha_hora_creacion, contenido, post_id) VALUES ('2021-01-25 19:25:05-07', 'este es el primer comentario del post de Margarita', 8);
INSERT INTO comentarios(fecha_hora_creacion, contenido, post_id) VALUES ('2021-01-28 19:23:05-07', 'este es el segundo comentario del post de Margarita', 8);
INSERT INTO comentarios(fecha_hora_creacion, contenido, post_id) VALUES ('2021-01-28 19:23:05-07', 'este es el tercer comentario del post de Margarita', 8);
INSERT INTO comentarios(fecha_hora_creacion, contenido, post_id) VALUES ('2021-01-28 19:29:06-07', 'este es el cuarto comentario del post de Margarita', 8);
INSERT INTO comentarios(fecha_hora_creacion, contenido, post_id) VALUES ('2021-01-28 19:21:11-07', 'este es el quinto comentario del post de Margarita', 8);

