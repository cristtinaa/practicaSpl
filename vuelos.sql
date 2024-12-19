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



_________________________________________________________________________
COMPANYIA (nom, IATA, CODE3, ICAO, pais, filial_de) 
    on filial_de REFERENCIA COMPANYIA(nom)

create table companyia(
    nom varchar(40) not null,
    IATA varchar(6) not null,
    CODE3 varchar(6) not null,
    ICAO varchar(6) not null,
    pais varchar(40) not null,
    filial_de varchar(40) 

);
______________________________________________________________
PERSONAL (num_empleat, nom, cognom, passaport, sou)

create table personal(
    num_empleat mediumint, /*no posa que sigui obligatori pero yo si que cosidero que ho es*/
    nom varchar (25) not null,
    cognom varchar (35) not null,
    passaport varchar(20) not null,
    sou float not null /*el sou no pot ser negatiu i nim de 20.000$*/
);
_____________________________________________________________________
HOSTESSA (num_empleat)
    on num_empleat REFERENCIA PERSONAL(num_empleat)

create table hostessa(  
     num_empleat mediumint
);     
______________________________________________________________________
PILOT (num_empleat, hores_vol)
    on num_empleat REFERENCIA PERSONAL(num_empleat)
    
create table pilot(  
     num_empleat mediumint,
     hores_vol tinyint 
);      
______________________________________________________________________
AVIO (num_serie, tipus, fabricant, any_fabricacio, companyia)
    on companyia REFERENICA COMPANYIA(nom)
create table avio(
    num_serie varchar (30) not null,
    tipus varchar (10) not null,
    fabricant varchar (20) not null,
    any_fabricacio smallint not null
)
______________________________________________________________________
PASSATGER (passaport, nom, cognom, adreça(opcional alfanumeric max 70), telefon(opcional alfanumeric de max 9), email, data_naix, genere)

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
______________________________________________________________________
AEROPORT (codi, pais, ciutat, IATA, nom, any_construccio)
create table aeroport(
    codi varchar (4) not null,
    pais varchar (40) not null,
    ciutat varchar (40) not null
    IATA varchar (4),
    nom varchar (55) not null,
    any_construccio mediumint
);
______________________________________________________________________________________________-
MOSTRADOR (numero, codi_aeroport)
    on codi_aeroport REFERENCIA AEROPORT(codi)
create table mostrador(
    numero tinyint, /*preguntar como hacer que sea max positivo*/
    codi_aeroport varchar (4)
);

____________________________________________________________________________________
VOL (codi, aeroport_desti, data, durada, aeroport_origen, avio, hostessa, pilot,
descripcio)
    on aeroport_origen REFERENCIA AEROPORT(codi)
    on aeroport_desti REFERENCIA AEROPORT(codi)
    on avio REFERENCIA AVIO(num_serie)
    on hostessa REFERENCIA HOSTESSA(num_empleat)
    on pilot REFERENCIA PILOT(num_empleat) 

create table vol(
    codi varchar(9) not null,
    aeroport_desti varchar(4),
    data not null /*com fem la data???*/
    durada tinyint not null, /*durada en minutos crea dudas*/
    aeroport_origen varchar (4),
    avio varchar (30), /*not null??*/
    hostessa mediumint,
    pilot mediumint,
    descripcio varchar(50)
);

_____________________________________________________________________________________
VOLAR (passatger, vol, seient)
on passatger REFERENCIA PASSATGER(passaport)
on vol REFERENCIA VOL(codi)

create table volar(
    passatger varchar(20) not null,
    vol varchar(9) not null
    seient tinyint
)