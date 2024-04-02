/* EJECUTAR EN SYSTEM */
alter session set "_ORACLE_SCRIPT"=true;
create user OfficeMarket identified by OfficeMarket;
default tablespace users quota unlimited on users;
grant connect, resource to OfficeMarket;


create table usuarios(
    id int not null,
    email VARCHAR2(200),
    password VARCHAR2(200),
    ultima_conexion TIMESTAMP(6),
    constraint pk_usuario
        primary key (id)
);

commit;

create table categorias(
    id int not null,
    nombre VARCHAR2(50),
    constraint pk_categoria
        primary key (id)
);

commit;

create table productos(
    id int not null,
    nombre VARCHAR2(100),
    precio DECIMAL,
    stock int,
    imagen VARCHAR2(200),
    categoria_id int,
    constraint pk_producto
        primary key (id)
);

commit;

alter table productos
add constraint fk_productos_categoria
    foreign key (categoria_id)
    references categorias(id);
    
commit;

create sequence usuarios_seq start with 1 increment by 1 nocache nocycle;

create or replace trigger al_insertar_usuario before insert on usuarios for each row
begin
    select usuarios_seq.nextval into :new.id from dual;
end; 


create sequence categorias_seq start with 1 increment by 1 nocache nocycle;

drop trigger al_insertar_catgoria;

create or replace trigger al_insertar_catgoria before insert on categorias for each row
begin
    select categorias_seq.nextval into :new.id from dual;
end; 


create sequence productos_seq start with 1 increment by 1 nocache nocycle;

create or replace trigger al_insertar_producto before insert on productos for each row
begin
    select productos_seq.nextval into :new.id from dual;
end; 


create or replace procedure SP_CREATE_PRODUCTO(v_nombre VARCHAR2, v_precio varchar2, v_stock number, v_imagen varchar2, v_categoria_id number) as
begin
    insert into productos (nombre, precio, stock, imagen, categoria_id) values (v_nombre, v_precio, v_stock, v_imagen, v_categoria_id);
    commit;
end;

create or replace procedure SP_UPDATE_PRODUCTO(v_id number, v_nombre VARCHAR2, v_precio varchar2, v_stock number, v_imagen varchar2, v_categoria_id number) as
begin
    update productos
    set nombre = v_nombre,
    precio = v_precio,
    stock = v_stock,
    imagen = v_imagen,
    categoria_id = v_categoria_id
    where id = v_id;
    commit;
end;

create or replace procedure SP_DELETE_PRODUCTO(v_id number) as
begin
    delete from productos where id = v_id;
    commit;
end;

create or replace procedure SP_CREATE_CATEGORIA(v_nombre VARCHAR2) as
begin
    insert into categorias (nombre) values (v_nombre);
    commit;
end;

create or replace procedure SP_UPDATE_CATEGORIA(v_id number, v_nombre VARCHAR2) as
begin
    update categorias
    set nombre = v_nombre
    where id = v_id;
    commit;
end;

create or replace procedure SP_DELETE_CATEGORIA(v_id number) as
begin
    delete from categorias where id = v_id;
    commit;
end;

/*
scaffold-dbcontext "User Id=OfficeMarket;Password=OfficeMarket;Data Source=localhost:1521/xe;" Oracle.EntityFrameworkCore -startupProject OfficeMarket.DataAccessLayer -outputDir Models
*/

grant unlimited tablespace to OfficeMarket;


insert into categorias(nombre) values ('Papelería');
insert into categorias(nombre) values ('Electrónica');

insert into productos(nombre, precio, stock, imagen, categoria_id) values ('Páginas de papel Oficio', 5.25, 200, '', 1);
insert into productos(nombre, precio, stock, imagen, categoria_id) values ('Laptop HP i3 8RAM', 750, 100, '', 2);

select * from categorias;
select * from productos;