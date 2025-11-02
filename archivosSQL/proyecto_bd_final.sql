CREATE DATABASE IF NOT EXISTS Esquema_Proyecto;
USE Esquema_Proyecto;

CREATE TABLE usuario (
  id_usuario       INT auto_increment      NOT NULL,
  telefono        VARCHAR(20)         NOT NULL,
  direccion      VARCHAR(50)          NOT NULL,
  CONSTRAINT pk_usuario   PRIMARY KEY (id_usuario)
);

CREATE TABLE empresa (
 id_usuario       INT        NOT NULL,
 cuit 			  BIGINT 		 NOT NULL,
 kw   			  INT        NOT NULL,
 CONSTRAINT pk_usuario_empresa   PRIMARY KEY (id_usuario), 
 CONSTRAINT id_usuario foreign key (id_usuario) REFERENCES usuario(id_usuario)on delete cascade,
 CONSTRAINT chequeo_kw 		   CHECK	(kw >=0 and kw <=50000)
);

CREATE TABLE persona (
  id_usuario  INT		NOT NULL,
  dni         INT		NOT NULL,
  CONSTRAINT pk_usuario_persona PRIMARY KEY (id_usuario),
  CONSTRAINT fk_persona_usuario FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)on delete cascade,
  constraint chequeo_dni check (dni >0 and dni <1000000000)
);


CREATE TABLE empleado (
  id_usuario     INT       NOT NULL,
  nombre     varchar(45)   NOT NULL,
  apellido   varchar(45)   NOT NULL,
  sueldo		INT		   NOT NULL, 		
  CONSTRAINT pk_usuario_empleado PRIMARY KEY (id_usuario),
  constraint fk_empleado_usuario foreign key (id_usuario) references persona (id_usuario)on delete cascade,
  constraint chequeo_sueldo check	(sueldo > 0)
);

CREATE TABLE motivo (
cod_motivo		INT 	auto_increment	NOT NULL,
descripcion		varchar(1500) 		NOT NULL,
constraint pk_motivo primary key (cod_motivo)
);

CREATE TABLE reclamo (
nro_reclamo 	INT auto_increment		NOT NULL,
fecha_hora		datetime		NOT NULL,	
id_usuario 		INT 		NOT NULL,
cod_motivo 		INT 		NOT NULL,
fecha_solucion	datetime,
constraint pk_reclamo primary key (nro_reclamo),
constraint fk_reclamo_usuario foreign key (id_usuario) references usuario (id_usuario) on delete cascade,
constraint fk_reclamo_motivo foreign key (cod_motivo) references motivo (cod_motivo)on delete cascade,
constraint fecha_solucion check (fecha_solucion > fecha_hora)
      
);


CREATE TABLE mantenimiento(
  nro_reclamo	 INT	  NOT NULL,
  id_usuario     INT      NOT NULL,
  constraint pk_mantenimiento_nro_reclamo primary key (nro_reclamo), 
  constraint fk_mantenimiento_reclamo  foreign key (nro_reclamo) references reclamo (nro_reclamo) on delete cascade,
  constraint fk_mantenimiento_empleado foreign key (id_usuario) references empleado (id_usuario) on delete cascade
  );
  
  CREATE TABLE material(
cod_material		INT auto_increment		NOT NULL,
descripcion 		varchar(1500)		NOT NULL,
constraint	pk_material primary key (cod_material)
);


CREATE TABLE reclamos_baja(
id_baja     	  INT 	auto_increment,
nro_reclamo 	  INT NOT NULL,
fecha_eliminacion datetime,
usuario  		  varchar(100) NOT NULL,
constraint pk_id_baja primary key (id_baja)

);

CREATE TABLE llamado (
nro_reclamo 	INT 	NOT NULL,
nro_llamado 	INT 	NOT NULL,
fecha_hora		datetime 		NOT NULL,
constraint 	pk_llamado primary key (nro_reclamo, nro_llamado),
constraint fk_llamado_reclamo foreign key (nro_reclamo) references reclamo (nro_reclamo) on delete cascade
);


CREATE TABLE utiliza(
nro_reclamo		INT 		NOT NULL,
cod_material	INT			NOT NULL,
cantidad		INT 		NOT NULL,
constraint pk_utiliza primary key (nro_reclamo, cod_material),
constraint fk_utiliza_reclamo foreign key (nro_reclamo) references reclamo (nro_reclamo)on delete cascade,
constraint fk_utiliza_material foreign key (cod_material) references material (cod_material)on delete cascade,
constraint chequeo_cantidad check (cantidad >= 0)
);
   
delimiter $$
CREATE TRIGGER trigger_reclamos_baja
AFTER DELETE ON reclamo
FOR EACH ROW
BEGIN 
INSERT INTO reclamos_baja (nro_reclamo, fecha_eliminacion, usuario)
VALUES (old.nro_reclamo, NOW(), CURRENT_USER());
END$$

delimiter ;

