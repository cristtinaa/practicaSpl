/* *****************************************************
  INSTITUT TIC de Barcelona
    CFGS: DAW 1A
    Mòdul: 0484 Bases de dades. 
    AUTORS: Cristina i Estefy
    DATA: 19/11/24
****************************************************** */

drop table if exists companyia;
drop table if exists personal;
drop table if exists hostessa;
drop table if exists pilot;
drop table if exists avio;
drop table if exists passatger;
drop table if exists aeropot;
drop table if exists mostrador;
drop table if exists vol;
drop table if exists volar;

create table companyia(
    nom varchar(40) not null,
    IATA varchar(6) not null,
    CODE3 varchar(6),
    ICAO varchar(6),
    pais varchar(40) not null,
    filial_de varchar(40) 

);

create table personal(
    num_empleat mediumint, 
    nom varchar (25) not null,
    cognom varchar (35) not null,
    passaport varchar(20) not null,
    sou float not null
);

create table hostessa(  
     num_empleat mediumint
);     

    
create table pilot(  
     num_empleat mediumint,
     hores_vol tinyint 
);      

create table avio(
    num_serie varchar (30) not null,
    tipus varchar (10) not null,
    fabricant varchar (20) not null,
    any_fabricacio smallint not null,
    companyia varchar(40) not null
);

create table passatger(  
     passaport varchar(20) not null,
     nom varchar(30) not null,
     cognom varchar(50),
     adreça varchar(70),
     telefon varchar(9),
     email varchar(40),
     data_naix tinyint,
     genere char(1)
);  

create table aeroport(
    codi varchar (4) not null,
    pais varchar (40) not null,
    ciutat varchar (40) not null,
    IATA varchar (4),
    nom varchar (55) not null,
    any_construccio mediumint
);

create table mostrador(
    numero smallint, 
    codi_aeroport varchar (4)
);

create table vol(
    codi varchar(9) not null,
    aeroport_desti varchar(4),
    data smallint not null,
    durada smallint not null,
    aeroport_origen varchar (4),
    avio varchar (30) not null,
    hostessa mediumint,
    pilot mediumint,
    descripcio varchar(50)
);

create table volar(
    passatger varchar(20) not null,
    vol varchar(9) not null,
    seient tinyint
);