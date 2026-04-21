--create database info_his_educacion_superior

use info_his_educacion_superior

create table prom_int_region(
id_region int primary key,
anno int not null,
region varchar(50) not null,
prom_acceso_internet decimal(5,2)not null
);

create table prom_sal_carrera(
id_carrera varchar(50) primary key,
categoria varchar(50) not null,
anno int not null,
carrera varchar(100) not null,
prom_salario decimal(12,2) not null
)
drop table prom_sal_carrera

--2019
insert into prom_int_region (id_region,anno,region,prom_acceso_internet) values
(1,2019,'Pacífico Central',19.90),
(2,2019, 'Central',18.75),
(3,2019,'Chorotega',15.07),
(4,2019,'Brunca',12.07),
(5,2019,'Huetar Caribe',10.50),
(6,2019,'Huetar Norte',6.43);


select* from prom_int_region
--2020
insert into prom_int_region (id_region,anno,region,prom_acceso_internet) values
(7,2020,'Central',  21.04),
(8, 2020,'Pacífico Central', 17.23),
(9, 2020,'Chorotega', 12.78),
(10,2020, 'Huetar Caribe',12.43),
(11, 2020,'Brunca', 11.25),
(12,2020, 'Huetar Norte', 10.44);

--2021
insert into prom_int_region (id_region,anno,region,prom_acceso_internet) values
(13, 2021, 'Pacífico Central', 21.84),
(14, 2021, 'Central', 21.54),
(15, 2021, 'Chorotega', 18.00),
(16, 2021, 'Brunca', 15.18),
(17, 2021, 'Huetar Caribe', 13.00),
(18, 2021, 'Huetar Norte', 9.32);

--2022
insert into prom_int_region (id_region,anno,region,prom_acceso_internet) values
(19, 2022, 'Pacífico Central', 23.31),
(20, 2022, 'Central', 22.01),
(21, 2022, 'Chorotega', 18.54),
(22, 2022, 'Brunca', 16.87),
(23, 2022, 'Huetar Caribe', 13.20),
(24, 2022, 'Huetar Norte', 9.72);



--///////////////////////////////////////////////////////////////////////////////////

--****************************************************
--2019
-- Arte y Letras
insert into prom_sal_carrera (id_carrera, anno, categoria, carrera, prom_salario) values
('art1_2019', 2019, 'Arte y Letras', 'Artes Dramáticas', 598768.00),
('art2_2019', 2019, 'Arte y Letras', 'Artes Plásticas', 588778.00),
('art3_2019', 2019, 'Arte y Letras', 'Diseño Gráfico', 616922.00),
('art4_2019', 2019, 'Arte y Letras', 'Fotografía', 466667.00),
('art5_2019', 2019, 'Arte y Letras', 'Arte Publicitario', 785528.00),
('art6_2019', 2019, 'Arte y Letras', 'Artes Musicales', 613861.00),
('art7_2019', 2019, 'Arte y Letras', 'Danza', 466667.00),
('art8_2019', 2019, 'Arte y Letras', 'Diseño de Interiores', 749043.00),
('art9_2019', 2019, 'Arte y Letras', 'Literatura y Lingüística (Español)', 619465.00),
('art10_2019', 2019, 'Arte y Letras', 'Inglés', 841630.00),
('art11_2019', 2019, 'Arte y Letras', 'Francés', 697787.00),
('art12_2019', 2019, 'Arte y Letras', 'Filosofía', 638885.00),
('art13_2019', 2019, 'Arte y Letras', 'Teología', 483914.00),
('art14_2019', 2019, 'Arte y Letras', 'Producción de Cine y Televisión', 727500.00),
('art15_2019', 2019, 'Arte y Letras', 'Artes Culinarias', 1010417.00);

-- Ciencias Básicas
insert into prom_sal_carrera (id_carrera, anno, categoria, carrera, prom_salario) values
('cien1_2019', 2019, 'Ciencias Básicas', 'Biología', 800937.00),
('cien2_2019', 2019, 'Ciencias Básicas', 'Física', 1000000.00),
('cien3_2019', 2019, 'Ciencias Básicas', 'Geología', 968848.00),
('cien4_2019', 2019, 'Ciencias Básicas', 'Estadística', 1150000.00),
('cien5_2019', 2019, 'Ciencias Básicas', 'Química', 975426.00),
('cien6_2019', 2019, 'Ciencias Básicas', 'Laboratorista Químico', 694737.00),
('cien7_2019', 2019, 'Ciencias Básicas', 'Ciencias Actuariales', 1662500.00);

-- Computación
insert into prom_sal_carrera (id_carrera, anno, categoria, carrera, prom_salario) values
('comp1_2019', 2019, 'Computación', 'Ingeniería en Computadores', 1546670.00),
('comp2_2019', 2019, 'Computación', 'Ingeniería del Software', 1293358.00),
('comp3_2019', 2019, 'Computación', 'Sistemas de Información', 1155315.00),
('comp4_2019', 2019, 'Computación', 'Tecnologías de Información', 1156091.00),
('comp5_2019', 2019, 'Computación', 'Ciencias de la Computación', 1450278.00);

-- Ciencias Económicas
insert into prom_sal_carrera (id_carrera, anno, categoria, carrera, prom_salario) values
('econom1_2019', 2019, 'Ciencias Económicas', 'Administración de Seguros', 1625000.00),
('econom2_2019', 2019, 'Ciencias Económicas', 'Economía', 1198246.00),
('econom3_2019', 2019, 'Ciencias Económicas', 'Comercio Internacional', 1010303.00),
('econom4_2019', 2019, 'Ciencias Económicas', 'Contaduría', 986239.00),
('econom5_2019', 2019, 'Ciencias Económicas', 'Mercadeo', 984050.00),
('econom6_2019', 2019, 'Ciencias Económicas', 'Finanzas', 929354.00),
('econom7_2019', 2019, 'Ciencias Económicas', 'Administración de Recursos Humanos', 885054.00),
('econom8_2019', 2019, 'Ciencias Económicas', 'Administración del Transporte', 882105.00),
('econom9_2019', 2019, 'Ciencias Económicas', 'Administración', 859756.00),
('econom10_2019', 2019, 'Ciencias Económicas', 'Planificación', 794843.00),
('econom11_2019', 2019, 'Ciencias Económicas', 'Administración Pública', 786022.00),
('econom12_2019', 2019, 'Ciencias Económicas', 'Administración de la Producción', 816919.00),
('econom13_2019', 2019, 'Ciencias Económicas', 'Proveeduría', 835294.00),
('econom14_2019', 2019, 'Ciencias Económicas', 'Administración de Servicios de Salud', 638462.00);

-- Ciencias Sociales
insert into prom_sal_carrera (id_carrera, anno, categoria, carrera, prom_salario) values
('soci1_2019', 2019, 'Ciencias Sociales', 'Archivística', 719318.00),
('soci2_2019', 2019, 'Ciencias Sociales', 'Secretariado Profesional', 640278.00),
('soci3_2019', 2019, 'Ciencias Sociales', 'Antropología', 754389.00),
('soci4_2019', 2019, 'Ciencias Sociales', 'Comunicación', 1070588.00),
('soci5_2019', 2019, 'Ciencias Sociales', 'Periodismo', 975696.00),
('soci6_2019', 2019, 'Ciencias Sociales', 'Publicidad', 899293.00),
('soci7_2019', 2019, 'Ciencias Sociales', 'Relaciones Públicas', 770668.00),
('soci8_2019', 2019, 'Ciencias Sociales', 'Producción Audiovisual', 895113.00),
('soci9_2019', 2019, 'Ciencias Sociales', 'Bibliotecología', 857558.00),
('soci10_2019', 2019, 'Ciencias Sociales', 'Ciencias Políticas', 898840.00),
('soci11_2019', 2019, 'Ciencias Sociales', 'Relaciones Internacionales', 884513.00),
('soci12_2019', 2019, 'Ciencias Sociales', 'Historia', 517771.00),
('soci13_2019', 2019, 'Ciencias Sociales', 'Psicología', 777720.00),
('soci14_2019', 2019, 'Ciencias Sociales', 'Sociología', 727088.00),
('soci15_2019', 2019, 'Ciencias Sociales', 'Criminología', 819767.00),
('soci16_2019', 2019, 'Ciencias Sociales', 'Trabajo Social', 811786.00),
('soci17_2019', 2019, 'Ciencias Sociales', 'Turismo', 551430.00);

-- Derecho
insert into prom_sal_carrera (id_carrera, anno, categoria, carrera, prom_salario) values
('dere1_2019', 2019, 'Derecho', 'Derecho', 1328521.00),
('dere2_2019', 2019, 'Derecho', 'Derechos Humanos', 1203125.00),
('dere3_2019', 2019, 'Derecho', 'Derecho Empresarial', 1328521.00),
('dere4_2019', 2019, 'Derecho', 'Derecho Judicial', 1465278.00),
('dere5_2019', 2019, 'Derecho', 'Derecho Penal', 1618056.00),
('dere6_2019', 2019, 'Derecho', 'Derecho Ambiental', 1259091.00);

-- Educación
insert into prom_sal_carrera (id_carrera, anno, categoria, carrera, prom_salario) values
('edu1_2019', 2019, 'Educación', 'Educación Generalista', 904167.00),
('edu2_2019', 2019, 'Educación', 'Docencia', 1122647.00),
('edu3_2019', 2019, 'Educación', 'Currículo', 1650000.00),
('edu4_2019', 2019, 'Educación', 'Evaluación Educativa', 1232143.00),
('edu5_2019', 2019, 'Educación', 'Educación Preescolar', 629945.00),
('edu6_2019', 2019, 'Educación', 'Educación Preescolar Inglés', 609170.00),
('edu7_2019', 2019, 'Educación', 'Educación Primaria', 868228.00),
('edu8_2019', 2019, 'Educación', 'Educación Primaria Inglés', 856891.00),
('edu9_2019', 2019, 'Educación', 'Enseñanza del Castellano', 969071.00),
('edu10_2019', 2019, 'Educación', 'Enseñanza del Inglés', 838812.00),
('edu11_2019', 2019, 'Educación', 'Enseñanza del Francés', 762295.00),
('edu12_2019', 2019, 'Educación', 'Enseñanza de las Ciencias', 1069425.00),
('edu13_2019', 2019, 'Educación', 'Enseñanza de la Matemática', 1076256.00),
('edu14_2019', 2019, 'Educación', 'Enseñanza de los Estudios Sociales', 1023026.00),
('edu15_2019', 2019, 'Educación', 'Enseñanza de la Computación', 936443.00),
('edu16_2019', 2019, 'Educación', 'Orientación', 832825.00),
('edu17_2019', 2019, 'Educación', 'Educación Física', 800656.00),
('edu18_2019', 2019, 'Educación', 'Enseñanza de las Artes Plásticas', 928571.00),
('edu19_2019', 2019, 'Educación', 'Enseñanza de la Música', 835410.00),
('edu20_2019', 2019, 'Educación', 'Educación para el Hogar', 1021277.00),
('edu21_2019', 2019, 'Educación', 'Educación Religiosa', 1037736.00),
('edu22_2019', 2019, 'Educación', 'Educación Especial', 1153805.00),
('edu23_2019', 2019, 'Educación', 'Artes Industriales', 1120690.00),
('edu24_2019', 2019, 'Educación', 'Educación Técnica Agropecuaria y de Rec. Nat.', 933333.00),
('edu25_2019', 2019, 'Educación', 'Educación Técnica', 833838.00),
('edu26_2019', 2019, 'Educación', 'Enseñanza de la Psicología', 855556.00),
('edu27_2019', 2019, 'Educación', 'Enseñanza del Secretariado', 1013019.00),
('edu28_2019', 2019, 'Educación', 'Educación Rural', 717374.00),
('edu29_2019', 2019, 'Educación', 'Educación de Adultos', 1019231.00),
('edu30_2019', 2019, 'Educación', 'Administración Educativa', 1123819.00),
('edu31_2019', 2019, 'Educación', 'Enseñanza de la Contabilidad', 1038547.00);

-- Recursos Naturales
insert into prom_sal_carrera (id_carrera, anno, categoria, carrera, prom_salario) values
('natu1_2019', 2019, 'Recursos Naturales', 'Biotecnología', 922129.00),
('natu2_2019', 2019, 'Recursos Naturales', 'Fitotecnia', 901786.00),
('natu3_2019', 2019, 'Recursos Naturales', 'Agronomía General', 852279.00),
('natu4_2019', 2019, 'Recursos Naturales', 'Economía Agrícola', 714286.00),
('natu5_2019', 2019, 'Recursos Naturales', 'Zootecnia', 786020.00),
('natu6_2019', 2019, 'Recursos Naturales', 'Forestales', 846154.00),
('natu7_2019', 2019, 'Recursos Naturales', 'Ecología', 835294.00),
('natu8_2019', 2019, 'Recursos Naturales', 'Geografía', 727868.00),
('natu9_2019', 2019, 'Recursos Naturales', 'Producción Animal', 1337500.00);

-- Ingeniería
insert into prom_sal_carrera (id_carrera, anno, categoria, carrera, prom_salario) values
('ingen1_2019', 2019, 'Ingeniería', 'Arquitectura', 741234.00),
('ingen2_2019', 2019, 'Ingeniería', 'Ingeniería Civil', 1155957.00),
('ingen3_2019', 2019, 'Ingeniería', 'Ingeniería Topográfica', 963083.00),
('ingen4_2019', 2019, 'Ingeniería', 'Ingeniería Industrial', 1126367.00),
('ingen5_2019', 2019, 'Ingeniería', 'Ingeniería Mecánica', 1146079.00),
('ingen6_2019', 2019, 'Ingeniería', 'Ingeniería Eléctrica', 1192178.00),
('ingen7_2019', 2019, 'Ingeniería', 'Ingeniería Electrónica', 1162721.00),
('ingen8_2019', 2019, 'Ingeniería', 'Ingeniería Química', 1033696.00),
('ingen9_2019', 2019, 'Ingeniería', 'Diseño Industrial', 941128.00),
('ingen10_2019', 2019, 'Ingeniería', 'Seguridad Laboral', 925101.00),
('ingen11_2019', 2019, 'Ingeniería', 'Ingeniería de Materiales', 1096488.00),
('ingen12_2019', 2019, 'Ingeniería', 'Ingeniería Agrícola', 903044.00),
('ingen13_2019', 2019, 'Ingeniería', 'Electromedicina', 809211.00),
('ingen14_2019', 2019, 'Ingeniería', 'Ingeniería de Alimentos', 871919.00),
('ingen15_2019', 2019, 'Ingeniería', 'Ingeniería Ambiental', 835417.00),
('ingen16_2019', 2019, 'Ingeniería', 'Ingeniería Agroindustrial', 757500.00),
('ingen17_2019', 2019, 'Ingeniería', 'Mecatrónica', 1221739.00),
('ingen18_2019', 2019, 'Ingeniería', 'Ingeniería Mantenimiento Industrial', 1018750.00);

-- Salud
insert into prom_sal_carrera (id_carrera, anno, categoria, carrera, prom_salario) values
('salud1_2019', 2019, 'Salud', 'Medicina', 1397218.00),
('salud2_2019', 2019, 'Salud', 'Nutrición', 616482.00),
('salud3_2019', 2019, 'Salud', 'Optometría', 1145361.00),
('salud4_2019', 2019, 'Salud', 'Terapia Física', 478036.00),
('salud5_2019', 2019, 'Salud', 'Imagenología', 898560.00),
('salud6_2019', 2019, 'Salud', 'Terapia Ocupacional', 739834.00),
('salud7_2019', 2019, 'Salud', 'Terapia Respiratoria', 693004.00),
('salud8_2019', 2019, 'Salud', 'Registros en Salud', 644856.00),
('salud9_2019', 2019, 'Salud', 'Audiología', 665000.00),
('salud10_2019', 2019, 'Salud', 'Odontología', 958579.00),
('salud11_2019', 2019, 'Salud', 'Farmacia', 1229729.00),
('salud12_2019', 2019, 'Salud', 'Microbiología', 1377586.00),
('salud13_2019', 2019, 'Salud', 'Enfermería', 693887.00),
('salud14_2019', 2019, 'Salud', 'Veterinaria', 873344.00),
('salud15_2019', 2019, 'Salud', 'Psicología', 806861.00),
('salud16_2019', 2019, 'Salud', 'Promoción de la Salud', 878796.00);


--****************************************************
--2020
-- Arte y Letras
insert into prom_sal_carrera (id_carrera, anno, categoria, carrera, prom_salario) values
('art1_2020', 2020, 'Arte y Letras', 'Artes Dramáticas', 598768.00),
('art2_2020', 2020, 'Arte y Letras', 'Artes Plásticas', 588778.00),
('art3_2020', 2020, 'Arte y Letras', 'Diseño Gráfico', 616922.00),
('art4_2020', 2020, 'Arte y Letras', 'Fotografía', 466667.00),
('art5_2020', 2020, 'Arte y Letras', 'Arte Publicitario', 785528.00),
('art6_2020', 2020, 'Arte y Letras', 'Artes Musicales', 613861.00),
('art7_2020', 2020, 'Arte y Letras', 'Danza', 466667.00),
('art8_2020', 2020, 'Arte y Letras', 'Diseño de Interiores', 749043.00),
('art9_2020', 2020, 'Arte y Letras', 'Literatura y Lingüística (Español)', 619465.00),
('art10_2020', 2020, 'Arte y Letras', 'Inglés', 841630.00),
('art11_2020', 2020, 'Arte y Letras', 'Francés', 697787.00),
('art12_2020', 2020, 'Arte y Letras', 'Filosofía', 638885.00),
('art13_2020', 2020, 'Arte y Letras', 'Teología', 483914.00),
('art14_2020', 2020, 'Arte y Letras', 'Producción de Cine y Televisión', 727500.00),
('art15_2020', 2020, 'Arte y Letras', 'Artes Culinarias', 1010417.00);

-- Ciencias Básicas
insert into prom_sal_carrera (id_carrera, anno, categoria, carrera, prom_salario) values
('cien1_2020', 2020, 'Ciencias Básicas', 'Biología', 800937.00),
('cien2_2020', 2020, 'Ciencias Básicas', 'Física', 1000000.00),
('cien3_2020', 2020, 'Ciencias Básicas', 'Geología', 968848.00),
('cien4_2020', 2020, 'Ciencias Básicas', 'Estadística', 1150000.00),
('cien5_2020', 2020, 'Ciencias Básicas', 'Química', 975426.00),
('cien6_2020', 2020, 'Ciencias Básicas', 'Laboratorista Químico', 694737.00),
('cien7_2020', 2020, 'Ciencias Básicas', 'Ciencias Actuariales', 1662500.00);

-- Computación
insert into prom_sal_carrera (id_carrera, anno, categoria, carrera, prom_salario) values
('comp1_2020', 2020, 'Computación', 'Ingeniería en Computadores', 1546670.00),
('comp2_2020', 2020, 'Computación', 'Ingeniería del Software', 1293358.00),
('comp3_2020', 2020, 'Computación', 'Sistemas de Información', 1155315.00),
('comp4_2020', 2020, 'Computación', 'Tecnologías de Información', 1156091.00),
('comp5_2020', 2020, 'Computación', 'Ciencias de la Computación', 1450278.00);

-- Ciencias Económicas
insert into prom_sal_carrera (id_carrera, anno, categoria, carrera, prom_salario) values
('econom1_2020', 2020, 'Ciencias Económicas', 'Administración de Seguros', 1625000.00),
('econom2_2020', 2020, 'Ciencias Económicas', 'Economía', 1198246.00),
('econom3_2020', 2020, 'Ciencias Económicas', 'Comercio Internacional', 1010303.00),
('econom4_2020', 2020, 'Ciencias Económicas', 'Contaduría', 986239.00),
('econom5_2020', 2020, 'Ciencias Económicas', 'Mercadeo', 984050.00),
('econom6_2020', 2020, 'Ciencias Económicas', 'Finanzas', 929354.00),
('econom7_2020', 2020, 'Ciencias Económicas', 'Administración de Recursos Humanos', 885054.00),
('econom8_2020', 2020, 'Ciencias Económicas', 'Administración del Transporte', 882105.00),
('econom9_2020', 2020, 'Ciencias Económicas', 'Administración', 859756.00),
('econom10_2020', 2020, 'Ciencias Económicas', 'Planificación', 794843.00),
('econom11_2020', 2020, 'Ciencias Económicas', 'Administración Pública', 786022.00),
('econom12_2020', 2020, 'Ciencias Económicas', 'Administración de la Producción', 816919.00),
('econom13_2020', 2020, 'Ciencias Económicas', 'Proveeduría', 835294.00),
('econom14_2020', 2020, 'Ciencias Económicas', 'Administración de Servicios de Salud', 638462.00);

-- Ciencias Sociales
insert into prom_sal_carrera (id_carrera, anno, categoria, carrera, prom_salario) values
('soci1_2020', 2020, 'Ciencias Sociales', 'Archivística', 719318.00),
('soci2_2020', 2020, 'Ciencias Sociales', 'Secretariado Profesional', 640278.00),
('soci3_2020', 2020, 'Ciencias Sociales', 'Antropología', 754389.00),
('soci4_2020', 2020, 'Ciencias Sociales', 'Comunicación', 1070588.00),
('soci5_2020', 2020, 'Ciencias Sociales', 'Periodismo', 975696.00),
('soci6_2020', 2020, 'Ciencias Sociales', 'Publicidad', 899293.00),
('soci7_2020', 2020, 'Ciencias Sociales', 'Relaciones Públicas', 770668.00),
('soci8_2020', 2020, 'Ciencias Sociales', 'Producción Audiovisual', 895113.00),
('soci9_2020', 2020, 'Ciencias Sociales', 'Bibliotecología', 857558.00),
('soci10_2020', 2020, 'Ciencias Sociales', 'Ciencias Políticas', 898840.00),
('soci11_2020', 2020, 'Ciencias Sociales', 'Relaciones Internacionales', 884513.00),
('soci12_2020', 2020, 'Ciencias Sociales', 'Historia', 517771.00),
('soci13_2020', 2020, 'Ciencias Sociales', 'Psicología', 777720.00),
('soci14_2020', 2020, 'Ciencias Sociales', 'Sociología', 727088.00),
('soci15_2020', 2020, 'Ciencias Sociales', 'Criminología', 819767.00),
('soci16_2020', 2020, 'Ciencias Sociales', 'Trabajo Social', 811786.00),
('soci17_2020', 2020, 'Ciencias Sociales', 'Turismo', 551430.00);

-- Derecho
insert into prom_sal_carrera (id_carrera, anno, categoria, carrera, prom_salario) values
('dere1_2020', 2020, 'Derecho', 'Derecho', 1328521.00),
('dere2_2020', 2020, 'Derecho', 'Derechos Humanos', 1203125.00),
('dere3_2020', 2020, 'Derecho', 'Derecho Empresarial', 1328521.00),
('dere4_2020', 2020, 'Derecho', 'Derecho Judicial', 1465278.00),
('dere5_2020', 2020, 'Derecho', 'Derecho Penal', 1618056.00),
('dere6_2020', 2020, 'Derecho', 'Derecho Ambiental', 1259091.00);

-- Educación
insert into prom_sal_carrera (id_carrera, anno, categoria, carrera, prom_salario) values
('edu1_2020', 2020, 'Educación', 'Educación Generalista', 904167.00),
('edu2_2020', 2020, 'Educación', 'Docencia', 1122647.00),
('edu3_2020', 2020, 'Educación', 'Currículo', 1650000.00),
('edu4_2020', 2020, 'Educación', 'Evaluación Educativa', 1232143.00),
('edu5_2020', 2020, 'Educación', 'Educación Preescolar', 629945.00),
('edu6_2020', 2020, 'Educación', 'Educación Preescolar Inglés', 609170.00),
('edu7_2020', 2020, 'Educación', 'Educación Primaria', 868228.00),
('edu8_2020', 2020, 'Educación', 'Educación Primaria Inglés', 856891.00),
('edu9_2020', 2020, 'Educación', 'Enseñanza del Castellano', 969071.00),
('edu10_2020', 2020, 'Educación', 'Enseñanza del Inglés', 838812.00),
('edu11_2020', 2020, 'Educación', 'Enseñanza del Francés', 762295.00),
('edu12_2020', 2020, 'Educación', 'Enseñanza de las Ciencias', 1069425.00),
('edu13_2020', 2020, 'Educación', 'Enseñanza de la Matemática', 1076256.00),
('edu14_2020', 2020, 'Educación', 'Enseñanza de los Estudios Sociales', 1023026.00),
('edu15_2020', 2020, 'Educación', 'Enseñanza de la Computación', 936443.00),
('edu16_2020', 2020, 'Educación', 'Orientación', 832825.00),
('edu17_2020', 2020, 'Educación', 'Educación Física', 800656.00),
('edu18_2020', 2020, 'Educación', 'Enseñanza de las Artes Plásticas', 928571.00),
('edu19_2020', 2020, 'Educación', 'Enseñanza de la Música', 835410.00),
('edu20_2020', 2020, 'Educación', 'Educación para el Hogar', 1021277.00),
('edu21_2020', 2020, 'Educación', 'Educación Religiosa', 1037736.00),
('edu22_2020', 2020, 'Educación', 'Educación Especial', 1153805.00),
('edu23_2020', 2020, 'Educación', 'Artes Industriales', 1120690.00),
('edu24_2020', 2020, 'Educación', 'Educación Técnica Agropecuaria y de Rec. Nat.', 933333.00),
('edu25_2020', 2020, 'Educación', 'Educación Técnica', 833838.00),
('edu26_2020', 2020, 'Educación', 'Enseñanza de la Psicología', 855556.00),
('edu27_2020', 2020, 'Educación', 'Enseñanza del Secretariado', 1013019.00),
('edu28_2020', 2020, 'Educación', 'Educación Rural', 717374.00),
('edu29_2020', 2020, 'Educación', 'Educación de Adultos', 1019231.00),
('edu30_2020', 2020, 'Educación', 'Administración Educativa', 1123819.00),
('edu31_2020', 2020, 'Educación', 'Enseñanza de la Contabilidad', 1038547.00);

-- Recursos Naturales
insert into prom_sal_carrera (id_carrera, anno, categoria, carrera, prom_salario) values
('natu1_2020', 2020, 'Recursos Naturales', 'Biotecnología', 922129.00),
('natu2_2020', 2020, 'Recursos Naturales', 'Fitotecnia', 901786.00),
('natu3_2020', 2020, 'Recursos Naturales', 'Agronomía General', 852279.00),
('natu4_2020', 2020, 'Recursos Naturales', 'Economía Agrícola', 714286.00),
('natu5_2020', 2020, 'Recursos Naturales', 'Zootecnia', 786020.00),
('natu6_2020', 2020, 'Recursos Naturales', 'Forestales', 846154.00),
('natu7_2020', 2020, 'Recursos Naturales', 'Ecología', 835294.00),
('natu8_2020', 2020, 'Recursos Naturales', 'Geografía', 727868.00),
('natu9_2020', 2020, 'Recursos Naturales', 'Producción Animal', 1337500.00);

-- Ingeniería
insert into prom_sal_carrera (id_carrera, anno, categoria, carrera, prom_salario) values
('ingen1_2020', 2020, 'Ingeniería', 'Arquitectura', 741234.00),
('ingen2_2020', 2020, 'Ingeniería', 'Ingeniería Civil', 1155957.00),
('ingen3_2020', 2020, 'Ingeniería', 'Ingeniería Topográfica', 963083.00),
('ingen4_2020', 2020, 'Ingeniería', 'Ingeniería Industrial', 1126367.00),
('ingen5_2020', 2020, 'Ingeniería', 'Ingeniería Mecánica', 1146079.00),
('ingen6_2020', 2020, 'Ingeniería', 'Ingeniería Eléctrica', 1192178.00),
('ingen7_2020', 2020, 'Ingeniería', 'Ingeniería Electrónica', 1162721.00),
('ingen8_2020', 2020, 'Ingeniería', 'Ingeniería Química', 1033696.00),
('ingen9_2020', 2020, 'Ingeniería', 'Diseño Industrial', 941128.00),
('ingen10_2020', 2020, 'Ingeniería', 'Seguridad Laboral', 925101.00),
('ingen11_2020', 2020, 'Ingeniería', 'Ingeniería de Materiales', 1096488.00),
('ingen12_2020', 2020, 'Ingeniería', 'Ingeniería Agrícola', 903044.00),
('ingen13_2020', 2020, 'Ingeniería', 'Electromedicina', 809211.00),
('ingen14_2020', 2020, 'Ingeniería', 'Ingeniería de Alimentos', 871919.00),
('ingen15_2020', 2020, 'Ingeniería', 'Ingeniería Ambiental', 835417.00),
('ingen16_2020', 2020, 'Ingeniería', 'Ingeniería Agroindustrial', 757500.00),
('ingen17_2020', 2020, 'Ingeniería', 'Mecatrónica', 1221739.00),
('ingen18_2020', 2020, 'Ingeniería', 'Ingeniería Mantenimiento Industrial', 1018750.00);

-- Computación
insert into prom_sal_carrera (id_carrera, anno, categoria, carrera, prom_salario) values
('comp4_2020', 2020, 'Computación', 'Tecnologías de Información', 1039642.20),
('comp5_2020', 2020, 'Computación', 'Ciencias de la Computación', 1207238.86),
('comp1_2020', 2020, 'Computación', 'Ingeniería en Computadores', 1314707.68),
('comp2_2020', 2020, 'Computación', 'Ingeniería del Software', 987524.03),
('comp3_2020', 2020, 'Computación', 'Sistemas de Información', 944912.87);

-- Salud
insert into prom_sal_carrera (id_carrera, anno, categoria, carrera, prom_salario) values
('salud1_2020', 2020, 'Salud', 'Medicina', 1397218.00),
('salud2_2020', 2020, 'Salud', 'Nutrición', 616482.00),
('salud3_2020', 2020, 'Salud', 'Optometría', 1145361.00),
('salud4_2020', 2020, 'Salud', 'Terapia Física', 478036.00),
('salud5_2020', 2020, 'Salud', 'Imagenología', 898560.00),
('salud6_2020', 2020, 'Salud', 'Terapia Ocupacional', 739834.00),
('salud7_2020', 2020, 'Salud', 'Terapia Respiratoria', 693004.00),
('salud8_2020', 2020, 'Salud', 'Registros en Salud', 644856.00),
('salud9_2020', 2020, 'Salud', 'Audiología', 665000.00),
('salud10_2020', 2020, 'Salud', 'Odontología', 958579.00),
('salud11_2020', 2020, 'Salud', 'Farmacia', 1229729.00),
('salud12_2020', 2020, 'Salud', 'Microbiología', 1377586.00),
('salud13_2020', 2020, 'Salud', 'Enfermería', 693887.00),
('salud14_2020', 2020, 'Salud', 'Veterinaria', 873344.00),
('salud15_2020', 2020, 'Salud', 'Psicología', 806861.00),
('salud16_2020', 2020, 'Salud', 'Promoción de la Salud', 878796.00);


--***************************************************************
-- 2021

-- Arte y Letras
insert into prom_sal_carrera (id_carrera, anno, categoria, carrera, prom_salario) values
('art1_2021', 2021, 'Arte y Letras', 'Artes Dramáticas', 598768.00),
('art2_2021', 2021, 'Arte y Letras', 'Artes Plásticas', 588778.00),
('art3_2021', 2021, 'Arte y Letras', 'Diseño Gráfico', 616922.00),
('art4_2021', 2021, 'Arte y Letras', 'Fotografía', 466667.00),
('art5_2021', 2021, 'Arte y Letras', 'Arte Publicitario', 785528.00),
('art6_2021', 2021, 'Arte y Letras', 'Artes Musicales', 613861.00),
('art7_2021', 2021, 'Arte y Letras', 'Danza', 466667.00),
('art8_2021', 2021, 'Arte y Letras', 'Diseño de Interiores', 749043.00),
('art9_2021', 2021, 'Arte y Letras', 'Literatura y Lingüística (Español)', 619465.00),
('art10_2021', 2021, 'Arte y Letras', 'Inglés', 841630.00),
('art11_2021', 2021, 'Arte y Letras', 'Francés', 697787.00),
('art12_2021', 2021, 'Arte y Letras', 'Filosofía', 638885.00),
('art13_2021', 2021, 'Arte y Letras', 'Teología', 483914.00),
('art14_2021', 2021, 'Arte y Letras', 'Producción de Cine y Televisión', 727500.00),
('art15_2021', 2021, 'Arte y Letras', 'Artes Culinarias', 1010417.00);

-- Ciencias Básicas
insert into prom_sal_carrera (id_carrera, anno, categoria, carrera, prom_salario) values
('cien1_2021', 2021, 'Ciencias Básicas', 'Biología', 800937.00),
('cien2_2021', 2021, 'Ciencias Básicas', 'Física', 1000000.00),
('cien3_2021', 2021, 'Ciencias Básicas', 'Geología', 968848.00),
('cien4_2021', 2021, 'Ciencias Básicas', 'Estadística', 1150000.00),
('cien5_2021', 2021, 'Ciencias Básicas', 'Química', 975426.00),
('cien6_2021', 2021, 'Ciencias Básicas', 'Laboratorista Químico', 694737.00),
('cien7_2021', 2021, 'Ciencias Básicas', 'Ciencias Actuariales', 1662500.00);

-- Computación
insert into prom_sal_carrera (id_carrera, anno, categoria, carrera, prom_salario) values
('comp1_2021', 2021, 'Computación', 'Ingeniería en Computadores', 1546670.00),
('comp2_2021', 2021, 'Computación', 'Ingeniería del Software', 1293358.00),
('comp3_2021', 2021, 'Computación', 'Sistemas de Información', 1155315.00),
('comp4_2021', 2021, 'Computación', 'Tecnologías de Información', 1156091.00),
('comp5_2021', 2021, 'Computación', 'Ciencias de la Computación', 1450278.00);

-- Ciencias Económicas
insert into prom_sal_carrera (id_carrera, anno, categoria, carrera, prom_salario) values
('econom1_2021', 2021, 'Ciencias Económicas', 'Administración de Seguros', 1625000.00),
('econom2_2021', 2021, 'Ciencias Económicas', 'Economía', 1198246.00),
('econom3_2021', 2021, 'Ciencias Económicas', 'Comercio Internacional', 1010303.00),
('econom4_2021', 2021, 'Ciencias Económicas', 'Contaduría', 986239.00),
('econom5_2021', 2021, 'Ciencias Económicas', 'Mercadeo', 984050.00),
('econom6_2021', 2021, 'Ciencias Económicas', 'Finanzas', 929354.00),
('econom7_2021', 2021, 'Ciencias Económicas', 'Administración de Recursos Humanos', 885054.00),
('econom8_2021', 2021, 'Ciencias Económicas', 'Administración del Transporte', 882105.00),
('econom9_2021', 2021, 'Ciencias Económicas', 'Administración', 859756.00),
('econom10_2021', 2021, 'Ciencias Económicas', 'Planificación', 794843.00),
('econom11_2021', 2021, 'Ciencias Económicas', 'Administración Pública', 786022.00),
('econom12_2021', 2021, 'Ciencias Económicas', 'Administración de la Producción', 816919.00),
('econom13_2021', 2021, 'Ciencias Económicas', 'Proveeduría', 835294.00),
('econom14_2021', 2021, 'Ciencias Económicas', 'Administración de Servicios de Salud', 638462.00);

-- Ciencias Sociales
insert into prom_sal_carrera (id_carrera, anno, categoria, carrera, prom_salario) values
('soci1_2021', 2021, 'Ciencias Sociales', 'Archivística', 719318.00),
('soci2_2021', 2021, 'Ciencias Sociales', 'Secretariado Profesional', 640278.00),
('soci3_2021', 2021, 'Ciencias Sociales', 'Antropología', 754389.00),
('soci4_2021', 2021, 'Ciencias Sociales', 'Comunicación', 1070588.00),
('soci5_2021', 2021, 'Ciencias Sociales', 'Periodismo', 975696.00),
('soci6_2021', 2021, 'Ciencias Sociales', 'Publicidad', 899293.00),
('soci7_2021', 2021, 'Ciencias Sociales', 'Relaciones Públicas', 770668.00),
('soci8_2021', 2021, 'Ciencias Sociales', 'Producción Audiovisual', 895113.00),
('soci9_2021', 2021, 'Ciencias Sociales', 'Bibliotecología', 857558.00),
('soci10_2021', 2021, 'Ciencias Sociales', 'Ciencias Políticas', 898840.00),
('soci11_2021', 2021, 'Ciencias Sociales', 'Relaciones Internacionales', 884513.00),
('soci12_2021', 2021, 'Ciencias Sociales', 'Historia', 517771.00),
('soci13_2021', 2021, 'Ciencias Sociales', 'Psicología', 777720.00),
('soci14_2021', 2021, 'Ciencias Sociales', 'Sociología', 727088.00),
('soci15_2021', 2021, 'Ciencias Sociales', 'Criminología', 819767.00),
('soci16_2021', 2021, 'Ciencias Sociales', 'Trabajo Social', 811786.00),
('soci17_2021', 2021, 'Ciencias Sociales', 'Turismo', 551430.00);

-- Derecho
insert into prom_sal_carrera (id_carrera, anno, categoria, carrera, prom_salario) values
('dere1_2021', 2021, 'Derecho', 'Derecho', 1328521.00),
('dere2_2021', 2021, 'Derecho', 'Derechos Humanos', 1203125.00),
('dere3_2021', 2021, 'Derecho', 'Derecho Empresarial', 1328521.00),
('dere4_2021', 2021, 'Derecho', 'Derecho Judicial', 1465278.00),
('dere5_2021', 2021, 'Derecho', 'Derecho Penal', 1618056.00),
('dere6_2021', 2021, 'Derecho', 'Derecho Ambiental', 1259091.00);

-- Educación
insert into prom_sal_carrera (id_carrera, anno, categoria, carrera, prom_salario) values
('edu1_2021', 2021, 'Educación', 'Educación Generalista', 904167.00),
('edu2_2021', 2021, 'Educación', 'Docencia', 1122647.00),
('edu3_2021', 2021, 'Educación', 'Currículo', 1650000.00),
('edu4_2021', 2021, 'Educación', 'Evaluación Educativa', 1232143.00),
('edu5_2021', 2021, 'Educación', 'Educación Preescolar', 629945.00),
('edu6_2021', 2021, 'Educación', 'Educación Preescolar Inglés', 609170.00),
('edu7_2021', 2021, 'Educación', 'Educación Primaria', 868228.00),
('edu8_2021', 2021, 'Educación', 'Educación Primaria Inglés', 856891.00),
('edu9_2021', 2021, 'Educación', 'Enseñanza del Castellano', 969071.00),
('edu10_2021', 2021, 'Educación', 'Enseñanza del Inglés', 838812.00),
('edu11_2021', 2021, 'Educación', 'Enseñanza del Francés', 762295.00),
('edu12_2021', 2021, 'Educación', 'Enseñanza de las Ciencias', 1069425.00),
('edu13_2021', 2021, 'Educación', 'Enseñanza de la Matemática', 1076256.00),
('edu14_2021', 2021, 'Educación', 'Enseñanza de los Estudios Sociales', 1023026.00),
('edu15_2021', 2021, 'Educación', 'Enseñanza de la Computación', 936443.00),
('edu16_2021', 2021, 'Educación', 'Orientación', 832825.00),
('edu17_2021', 2021, 'Educación', 'Educación Física', 800656.00),
('edu18_2021', 2021, 'Educación', 'Enseñanza de las Artes Plásticas', 928571.00),
('edu19_2021', 2021, 'Educación', 'Enseñanza de la Música', 835410.00),
('edu20_2021', 2021, 'Educación', 'Educación para el Hogar', 1021277.00),
('edu21_2021', 2021, 'Educación', 'Educación Religiosa', 1037736.00),
('edu22_2021', 2021, 'Educación', 'Educación Especial', 1153805.00),
('edu23_2021', 2021, 'Educación', 'Artes Industriales', 1120690.00),
('edu24_2021', 2021, 'Educación', 'Educación Técnica Agropecuaria y de Rec. Nat.', 933333.00),
('edu25_2021', 2021, 'Educación', 'Educación Técnica', 833838.00),
('edu26_2021', 2021, 'Educación', 'Enseñanza de la Psicología', 855556.00),
('edu27_2021', 2021, 'Educación', 'Enseñanza del Secretariado', 1013019.00),
('edu28_2021', 2021, 'Educación', 'Educación Rural', 717374.00),
('edu29_2021', 2021, 'Educación', 'Educación de Adultos', 1019231.00),
('edu30_2021', 2021, 'Educación', 'Administración Educativa', 1123819.00),
('edu31_2021', 2021, 'Educación', 'Enseñanza de la Contabilidad', 1038547.00);

-- Recursos Naturales
insert into prom_sal_carrera (id_carrera, anno, categoria, carrera, prom_salario) values
('natu1_2021', 2021, 'Recursos Naturales', 'Biotecnología', 922129.00),
('natu2_2021', 2021, 'Recursos Naturales', 'Fitotecnia', 901786.00),
('natu3_2021', 2021, 'Recursos Naturales', 'Agronomía General', 852279.00),
('natu4_2021', 2021, 'Recursos Naturales', 'Economía Agrícola', 714286.00),
('natu5_2021', 2021, 'Recursos Naturales', 'Zootecnia', 786020.00),
('natu6_2021', 2021, 'Recursos Naturales', 'Forestales', 846154.00),
('natu7_2021', 2021, 'Recursos Naturales', 'Ecología', 835294.00),
('natu8_2021', 2021, 'Recursos Naturales', 'Geografía', 727868.00),
('natu9_2021', 2021, 'Recursos Naturales', 'Producción Animal', 1337500.00);

-- Ingeniería
insert into prom_sal_carrera (id_carrera, anno, categoria, carrera, prom_salario) values
('ingen1_2021', 2021, 'Ingeniería', 'Arquitectura', 741234.00),
('ingen2_2021', 2021, 'Ingeniería', 'Ingeniería Civil', 1155957.00),
('ingen3_2021', 2021, 'Ingeniería', 'Ingeniería Topográfica', 963083.00),
('ingen4_2021', 2021, 'Ingeniería', 'Ingeniería Industrial', 1126367.00),
('ingen5_2021', 2021, 'Ingeniería', 'Ingeniería Mecánica', 1146079.00),
('ingen6_2021', 2021, 'Ingeniería', 'Ingeniería Eléctrica', 1192178.00),
('ingen7_2021', 2021, 'Ingeniería', 'Ingeniería Electrónica', 1162721.00),
('ingen8_2021', 2021, 'Ingeniería', 'Ingeniería Química', 1033696.00),
('ingen9_2021', 2021, 'Ingeniería', 'Diseño Industrial', 941128.00),
('ingen10_2021', 2021, 'Ingeniería', 'Seguridad Laboral', 925101.00),
('ingen11_2021', 2021, 'Ingeniería', 'Ingeniería de Materiales', 1096488.00),
('ingen12_2021', 2021, 'Ingeniería', 'Ingeniería Agrícola', 903044.00),
('ingen13_2021', 2021, 'Ingeniería', 'Electromedicina', 809211.00),
('ingen14_2021', 2021, 'Ingeniería', 'Ingeniería de Alimentos', 871919.00),
('ingen15_2021', 2021, 'Ingeniería', 'Ingeniería Ambiental', 835417.00),
('ingen16_2021', 2021, 'Ingeniería', 'Ingeniería Agroindustrial', 757500.00),
('ingen17_2021', 2021, 'Ingeniería', 'Mecatrónica', 1221739.00),
('ingen18_2021', 2021, 'Ingeniería', 'Ingeniería Mantenimiento Industrial', 1018750.00);

-- Computación
insert into prom_sal_carrera (id_carrera, anno, categoria, carrera, prom_salario) values
('comp4_2021', 2021, 'Computación', 'Tecnologías de Información', 1039642.20),
('comp5_2021', 2021, 'Computación', 'Ciencias de la Computación', 1207238.86),
('comp1_2021', 2021, 'Computación', 'Ingeniería en Computadores', 1314707.68),
('comp2_2021', 2021, 'Computación', 'Ingeniería del Software', 987524.03),
('comp3_2021', 2021, 'Computación', 'Sistemas de Información', 944912.87);

-- Salud
insert into prom_sal_carrera (id_carrera, anno, categoria, carrera, prom_salario) values
('salud1_2021', 2021, 'Salud', 'Medicina', 1397218.00),
('salud2_2021', 2021, 'Salud', 'Nutrición', 616482.00),
('salud3_2021', 2021, 'Salud', 'Optometría', 1145361.00),
('salud4_2021', 2021, 'Salud', 'Terapia Física', 478036.00),
('salud5_2021', 2021, 'Salud', 'Imagenología', 898560.00),
('salud6_2021', 2021, 'Salud', 'Terapia Ocupacional', 739834.00),
('salud7_2021', 2021, 'Salud', 'Terapia Respiratoria', 693004.00),
('salud8_2021', 2021, 'Salud', 'Registros en Salud', 644856.00),
('salud9_2021', 2021, 'Salud', 'Audiología', 665000.00),
('salud10_2021', 2021, 'Salud', 'Odontología', 958579.00),
('salud11_2021', 2021, 'Salud', 'Farmacia', 1229729.00),
('salud12_2021', 2021, 'Salud', 'Microbiología', 1377586.00),
('salud13_2021', 2021, 'Salud', 'Enfermería', 693887.00),
('salud14_2021', 2021, 'Salud', 'Veterinaria', 873344.00),
('salud15_2021', 2021, 'Salud', 'Psicología', 806861.00),
('salud16_2021', 2021, 'Salud', 'Promoción de la Salud', 878796.00);


--***************************************************************
--2022

-- Arte y Letras
insert into prom_sal_carrera (id_carrera, anno, categoria, carrera, prom_salario) values
('art1_2022', 2022, 'Arte y Letras', 'Artes Dramáticas', 579022.83),
('art2_2022', 2022, 'Arte y Letras', 'Artes Plásticas', 586210.55),
('art3_2022', 2022, 'Arte y Letras', 'Diseño Gráfico', 690098.83),
('art6_2022', 2022, 'Arte y Letras', 'Artes Musicales', 618289.06),
('art9_2022', 2022, 'Arte y Letras', 'Literatura y Lingüística (Español)', 675599.62),
('art10_2022', 2022, 'Arte y Letras', 'Inglés', 750036.95),
('art11_2022', 2022, 'Arte y Letras', 'Francés', 773437.94),
('art12_2022', 2022, 'Arte y Letras', 'Filosofía', 663116.60),
('art7_2022', 2022, 'Arte y Letras', 'Danza', 584257.87),
('art4_2022', 2022, 'Arte y Letras', 'Fotografía', 727257.60);

-- Ciencias Básicas
insert into prom_sal_carrera (id_carrera, anno, categoria, carrera, prom_salario) values
('cien1_2022', 2022, 'Ciencias Básicas', 'Biología', 706263.58),
('cien2_2022', 2022, 'Ciencias Básicas', 'Física', 829003.85),
('cien3_2022', 2022, 'Ciencias Básicas', 'Geología', 751401.19),
('cien4_2022', 2022, 'Ciencias Básicas', 'Estadística', 1101979.69),
('cien8_2022', 2022, 'Ciencias Básicas', 'Meteorología', 681761.00),
('cien5_2022', 2022, 'Ciencias Básicas', 'Química', 876544.76),
('cien6_2022', 2022, 'Ciencias Básicas', 'Laboratorista Químico', 855132.60),
('cien7_2022', 2022, 'Ciencias Básicas', 'Ciencias Actuariales', 1314707.68);

-- Ciencias Economicas
insert into prom_sal_carrera (id_carrera, anno, categoria, carrera, prom_salario) values
('econom9_2022', 2022, 'Ciencias Económicas', 'Administración', 723869.87),
('econom11_2022', 2022, 'Ciencias Económicas', 'Administración Pública', 731661.86),
('econom4_2022', 2022, 'Ciencias Económicas', 'Contaduría', 819992.69),
('econom2_2022', 2022, 'Ciencias Económicas', 'Economía', 921197.61),
('econom7_2022', 2022, 'Ciencias Económicas', 'Recursos Humanos', 720933.70),
('econom6_2022', 2022, 'Ciencias Económicas', 'Finanzas', 781349.93),
('econom5_2022', 2022, 'Ciencias Económicas', 'Mercadeo', 873771.11),
('econom3_2022', 2022, 'Ciencias Económicas', 'Comercio Internacional', 685861.15),
('econom12_2022', 2022, 'Ciencias Económicas', 'Administración de la Producción', 921356.07),
('econom14_2022', 2022, 'Ciencias Económicas', 'Administración de Servicios de Salud', 693832.44),
('econom13_2022', 2022, 'Ciencias Económicas', 'Proveeduría', 776956.46),
('econom10_2022', 2022, 'Ciencias Económicas', 'Planificación', 656984.08);


-- Ciencias Sociales
insert into prom_sal_carrera (id_carrera, anno, categoria, carrera, prom_salario) values
('soci1_2022', 2022, 'Ciencias Sociales', 'Archivística', 647578.75),
('soci3_2022', 2022, 'Ciencias Sociales', 'Antropología', 633478.07),
('soci5_2022', 2022, 'Ciencias Sociales', 'Periodismo', 599513.69),
('soci6_2022', 2022, 'Ciencias Sociales', 'Publicidad', 1003520.12),
('soci7_2022', 2022, 'Ciencias Sociales', 'Relaciones Públicas', 810555.82),
('soci8_2022', 2022, 'Ciencias Sociales', 'Producción Audiovisual', 627107.64),
('soci9_2022', 2022, 'Ciencias Sociales', 'Bibliotecología', 734440.26),
('soci10_2022', 2022, 'Ciencias Sociales', 'Ciencias Políticas', 792974.25),
('soci12_2022', 2022, 'Ciencias Sociales', 'Historia', 559414.35),
('soci13_2022', 2022, 'Ciencias Sociales', 'Psicología', 700670.57),
('soci14_2022', 2022, 'Ciencias Sociales', 'Sociología', 658149.05),
('soci16_2022', 2022, 'Ciencias Sociales', 'Trabajo Social', 747294.30),
('soci17_2022', 2022, 'Ciencias Sociales', 'Turismo', 527401.15),
('soci2_2022', 2022, 'Ciencias Sociales', 'Secretariado Profesional', 608377.65),
('soci15_2022', 2022, 'Ciencias Sociales', 'Criminología', 926010.89),
('soci18_2022', 2022, 'Ciencias Sociales', 'Estudios de Género', 500105.28),
('soci11_2022', 2022, 'Ciencias Sociales', 'Relaciones Internacionales', 798744.91);

-- Derecho
insert into prom_sal_carrera (id_carrera, anno, categoria, carrera, prom_salario) values
('dere1_2022', 2022, 'Derecho', 'Derecho', 755713.87),
('dere2_2022', 2022, 'Derecho', 'Derechos Humanos', 799097.57),
('dere3_2022', 2022, 'Derecho', 'Derecho Empresarial', 993899.14),
('dere4_2022', 2022, 'Derecho', 'Derecho Judicial', 731014.73),
('dere5_2022', 2022, 'Derecho', 'Derecho Penal', 906030.76),
('dere6_2022', 2022, 'Derecho', 'Derecho Ambiental', 1046886.75);

-- Educación
insert into prom_sal_carrera (id_carrera, anno, categoria, carrera, prom_salario) values
('edu1_2022', 2022, 'Educación', 'Educación Generalista', 850472.87),
('edu5_2022', 2022, 'Educación', 'Educación Preescolar', 581191.25),
('edu6_2022', 2022, 'Educación', 'Educación Preescolar Inglés', 636816.35),
('edu7_2022', 2022, 'Educación', 'Educación Primaria', 821498.93),
('edu8_2022', 2022, 'Educación', 'Educación Primaria Inglés', 771966.39),
('edu9_2022', 2022, 'Educación', 'Enseñanza del Castellano', 607809.25),
('edu10_2022', 2022, 'Educación', 'Enseñanza del Inglés', 657293.60),
('edu11_2022', 2022, 'Educación', 'Enseñanza del Francés', 788464.24),
('edu12_2022', 2022, 'Educación', 'Enseñanza de las Ciencias', 747666.23),
('edu13_2022', 2022, 'Educación', 'Enseñanza de la Matemática', 755818.60),
('edu14_2022', 2022, 'Educación', 'Enseñanza de los Estudios Sociales', 701310.93),
('edu16_2022', 2022, 'Educación', 'Orientación', 733057.57),
('edu17_2022', 2022, 'Educación', 'Educación Física', 666487.17),
('edu19_2022', 2022, 'Educación', 'Enseñanza de la Música', 658579.29),
('edu22_2022', 2022, 'Educación', 'Educación Especial', 771858.77),
('edu30_2022', 2022, 'Educación', 'Administración Educativa', 1016540.70),
('edu18_2022', 2022, 'Educación', 'Enseñanza de las Artes Plásticas', 637284.28),
('edu27_2022', 2022, 'Educación', 'Enseñanza del Secretariado', 801544.05),
('edu28_2022', 2022, 'Educación', 'Educación Rural', 968195.81),
('edu2_2022', 2022, 'Educación', 'Docencia', 845069.88),
('edu15_2022', 2022, 'Educación', 'Enseñanza de la Computación', 833140.39),
('edu24_2022', 2022, 'Educación', 'Educación Técnica Agropecuaria y de Rec. Nat.', 737763.88),
('edu25_2022', 2022, 'Educación', 'Educación Técnica', 782061.63),
('edu23_2022', 2022, 'Educación', 'Educación Técnica Industrial y de Diseño', 905379.66),
('edu31_2022', 2022, 'Educación', 'Enseñanza de la Contabilidad', 970189.35);

-- Recursos Naturales
insert into prom_sal_carrera (id_carrera, anno, categoria, carrera, prom_salario) values
('natu3_2022', 2022, 'Recursos Naturales', 'Agronomía General', 797125.08),
('natu4_2022', 2022, 'Recursos Naturales', 'Economía Agrícola', 715084.52),
('natu5_2022', 2022, 'Recursos Naturales', 'Zootecnia', 783658.74),
('natu7_2022', 2022, 'Recursos Naturales', 'Ecología', 711555.63),
('natu8_2022', 2022, 'Recursos Naturales', 'Geografía', 611099.59),
('natu1_2022', 2022, 'Recursos Naturales', 'Biotecnología', 881362.40),
('natu6_2022', 2022, 'Recursos Naturales', 'Forestales', 624710.00),
('natu9_2022', 2022, 'Recursos Naturales', 'Producción Animal', 718132.53),
('natu10_2022', 2022, 'Recursos Naturales', 'Manejo de Recursos Hídricos', 530469.31);

-- Ingeniería
insert into prom_sal_carrera (id_carrera, anno, categoria, carrera, prom_salario) values
('ing1_2022', 2022, 'Ingeniería', 'Arquitectura', 787219.63),
('ing2_2022', 2022, 'Ingeniería', 'Ingeniería Civil', 784060.89),
('ing3_2022', 2022, 'Ingeniería', 'Ingeniería Topográfica', 709684.17),
('ing4_2022', 2022, 'Ingeniería', 'Ingeniería Industrial', 962289.12),
('ing5_2022', 2022, 'Ingeniería', 'Ingeniería Mecánica', 975134.02),
('ing6_2022', 2022, 'Ingeniería', 'Ingeniería Eléctrica', 966829.09),
('ing7_2022', 2022, 'Ingeniería', 'Ingeniería Química', 946711.15),
('ing8_2022', 2022, 'Ingeniería', 'Ingeniería Agrícola', 683835.03),
('ing9_2022', 2022, 'Ingeniería', 'Ingeniería de Alimentos', 782629.74),
('ing10_2022', 2022, 'Ingeniería', 'Ingeniería Electrónica', 1031286.37),
('ing11_2022', 2022, 'Ingeniería', 'Diseño Industrial', 1017405.09),
('ing12_2022', 2022, 'Ingeniería', 'Seguridad Laboral', 814589.59),
('ing13_2022', 2022, 'Ingeniería', 'Ingeniería de Materiales', 1042184.49),
('ing14_2022', 2022, 'Ingeniería', 'Ingeniería Ambiental', 703071.96),
('ing15_2022', 2022, 'Ingeniería', 'Ingeniería Agroindustrial', 761523.05);

--Computación
INSERT INTO prom_sal_carrera (id_carrera, anno, categoria, carrera, prom_salario) VALUES
('comp2_2022', 2022, 'Computación', 'Tecnologías de Información', 1039642.20),
('comp3_2022', 2022, 'Computación', 'Ciencias de la Computación', 1207238.86),
('comp4_2022', 2022, 'Computación', 'Ingeniería en Computadores', 1314707.68),
('comp5_2022', 2022, 'Computación', 'Ingeniería del Software', 987524.03),
('comp6_2022', 2022, 'Computación', 'Sistemas de Información', 944912.87);

-- Salud
insert into prom_sal_carrera (id_carrera, anno, categoria, carrera, prom_salario) values
('sal1_2022', 2022, 'Salud', 'Medicina', 1024949.76),
('sal2_2022', 2022, 'Salud', 'Nutrición', 696719.07),
('sal3_2022', 2022, 'Salud', 'Salud Ambiental', 700723.71),
('sal4_2022', 2022, 'Salud', 'Promoción de la Salud', 700723.71),
('sal5_2022', 2022, 'Salud', 'Terapia Física', 576669.38),
('sal6_2022', 2022, 'Salud', 'Imagenología', 815957.14),
('sal7_2022', 2022, 'Salud', 'Odontología', 1030737.12),
('sal8_2022', 2022, 'Salud', 'Farmacia', 1176309.32),
('sal9_2022', 2022, 'Salud', 'Microbiología', 1193814.15),
('sal10_2022', 2022, 'Salud', 'Enfermería', 880460.76),
('sal11_2022', 2022, 'Salud', 'Veterinaria', 818946.52),
('sal12_2022', 2022, 'Salud', 'Registros en Salud', 604845.32),
('sal13_2022', 2022, 'Salud', 'Biomédica', 931440.66);

select* from prom_sal_carrera
