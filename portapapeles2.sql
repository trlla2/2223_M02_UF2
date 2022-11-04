DROP TABLE IF EXISTS materials;
DROP TABLE IF EXISTS weapons_materials;
DROP TABLE IF EXISTS armours_materials;
DROP TABLE IF EXISTS items_types;
DROP TABLE IF EXISTS armours_types;
DROP TABLE IF EXISTS weapons_types;
DROP TABLE IF EXISTS items;

CREATE TABLE materials 
(
	id_material INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	material CHAR (16),
	color CHAR (6),
	cost FLOAT
);

INSERT INTO materials (material,color,cost) VALUES ("Obsidiana","000000",40);
INSERT INTO materials (material,color,cost) VALUES ("Carne","ffff00",10);
INSERT INTO materials (material,color,cost) VALUES ("Pana","ffdddd",50);
INSERT INTO materials (material,color,cost) VALUES ("Goma sagrada","ffffff",1000);
INSERT INTO materials (material,color,cost) VALUES ("Piedra","cccccc",1);
INSERT INTO materials (material,color,cost) VALUES ("Cuero","ddddaa",20);
INSERT INTO materials (material,color,cost) VALUES ("Bandera España","ESPAÑA",2030);
INSERT INTO materials (material,color,cost) VALUES ("Plumas de angel","ffffff",10000);
INSERT INTO materials (material,color,cost) VALUES ("Materia oscura","000000",40);
INSERT INTO materials (material,color,cost) VALUES ("Hueso","cccccc",10);

CREATE TABLE weapons_materials 
(
	id_weapon_material INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	id_weapon INT UNSIGNED,
	id_material INT UNSIGNED
);

CREATE TABLE armours_materials 
(
	id_armour_material INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	id_armour INT UNSIGNED,
	id_material INT UNSIGNED
);

CREATE TABLE weapons_types
(
	id_weapon_type INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	type VARCHAR (24),
	description TEXT,
    icon VARCHAR (16)
);

INSERT INTO weapons_types (type, description,icon) VALUES ("Melee", "Cuerpo a cuerpo", "melee.png");

CREATE TABLE armours_types
(
	id_armour_type INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	type VARCHAR (24),
	description TEXT,
    icon VARCHAR (16)
);

CREATE TABLE items_types
(
	id_items_type INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	type VARCHAR (24),
	description TEXT,
    icon VARCHAR (16)
);
INSERT INTO armours_types (type,description,icon)VALUES("Peto"), ("traje"), ("casco");
INSERT INTO items_types (type, description, icon)VALUES("Explosive","ace kambom"); 

CREATE TABLE items(
    id_items INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    items VARCHAR(24),
    consumible BOOLEAN,
    cost FLOAT,
    `key` BOOLEAN,
    rarity INT(11),
    weight FLOAT,
    `usage` INT(11),
    fusionable BOOLEAN,
    width FLOAT,
    height FLOAT,
    durability INT(11),
    description TEXT,
    disassemble BOOLEAN,
    id_items_type INT
);
INSERT INTO items (items, consumible, cost, `key`, 
                   rarity, weight, `usage`, fusionable,
                   width, height, durability, description,
                   disassemble, id_items_type)
VALUES ("Granada", true, 300, false,
        500, 100, 2000, false,
        10, 10, 100, "Kabom",
        false,"1");

