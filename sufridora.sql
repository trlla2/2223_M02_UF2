DROP TABLE IF EXISTS armours_materials;
DROP TABLE IF EXISTS materials;
DROP TABLE IF EXISTS armour;
DROP TABLE IF EXISTS armours_types;


CREATE TABLE armours_types
(
id_armour_type INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
type VARCHAR (24),
description TEXT,
    icon VARCHAR (16)
);
CREATE TABLE materials 
(
	id_material INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	material CHAR (16),
	color CHAR (6),
	cost FLOAT
);
 CREATE TABLE armour
 (
     id_armour INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
     armour CHAR(24),
     physical_defense FLOAT,
     magical_defense FLOAT,
     weight FLOAT,
     durability INT,
     `level`INT,
     cost INT,
     description TEXT,
     id_armour_type INT UNSIGNED,
     FOREIGN KEY (id_armour_type) REFERENCES armours_types (id_armour_type)
 );
CREATE TABLE armours_materials 
(
	id_armour_material INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	id_armour INT UNSIGNED,
    FOREIGN KEY (id_armour) REFERENCES armour (id_armour),
	id_material INT UNSIGNED, 
    FOREIGN KEY (id_material) REFERENCES materials (id_material)

);