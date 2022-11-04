DROP TABLE IF EXISTS items;
DROP TABLE IF EXISTS items_types;
DROP TABLE IF EXISTS armours_types;
DROP TABLE IF EXISTS weapons_types;
DROP TABLE IF EXISTS weapons;
DROP TABLE IF EXISTS armour;
DROP TABLE IF EXISTS character_weapons;
DROP TABLE IF EXISTS weapons_materials;
DROP TABLE IF EXISTS armours_materials;
 CREATE TABLE items_types
(
id_items_type INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
type VARCHAR (24),
description TEXT,
    icon VARCHAR (16)
);
INSERT INTO items_types (type, description, icon)VALUES("Explosive","ace kambom","a.png");

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
    id_items_type INT UNSIGNED,
    FOREIGN KEY (id_items_type) REFERENCES items_types (id_items_type)
);
INSERT INTO items (items, consumible, cost, `key`,
                   rarity, weight, `usage`, fusionable,
                   width, height, durability, description,
                   disassemble, id_items_type)
VALUES ("Granada", true, 300, false,
        500, 100, 2000, false,
        10, 10, 100, "Kabom",
        false,"1");
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
INSERT INTO armours_types (type,description,icon)VALUES("Peto","descripcion","a.png"), ("traje","descripcion","a.png" ), ("casco","descripcion","a.png");

CREATE TABLE weapons
(
    id_weapon INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    weapons CHAR(24),
    grip INT,
    durability INT,
    `range` FLOAT,
    critical_rate FLOAT,
    recoil FLOAT,
    damage INT,
    `level` INT,
    cost INT,
    description TEXT,
    id_weapon_type INT UNSIGNED,
    FOREIGN KEY (id_weapon_type) REFERENCES weapons_types (id_weapon_type)
);
INSERT INTO weapons (weapons, grip, durability, `range`, critical_rate, recoil, damage, `level`,cost, description,id_weapon_type) VALUES ("espada",2,100,3.0,10.0,0.0,30,10,100,"espada",1);
 
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
INSERT INTO armour (armour,physical_defense,magical_defense, weight, durability,`level`, cost, description, id_armour_type) VALUES ("gorra", 10, 5, 100, 100, 5, 30, "gorra", 3);

CREATE TABLE characte_weapons
(
    id_character_weapon INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    id_character INT UNSIGNED,
    FOREIGN KEY (id_character) REFERENCES characters (id_character),
    id_weapon INT UNSIGNED,
    FOREIGN KEY (id_weapon) REFERENCES weapons (id_weapon)
);
INSERT INTO character_weapon (id_character,id_weapon) VALUES (1,1),(4,3),(4,1);

CREATE TABLE weapons_materials 
(
	id_weapon_material INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	id_weapon INT UNSIGNED,

        FOREIGN KEY (id_weapon) REFERENCES weapons (id_weapon),
	id_material INT UNSIGNED,

        FOREIGN KEY (id_material) REFERENCES materials (id_material)

);

CREATE TABLE armours_materials 
(
	id_armour_material INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	id_armour INT UNSIGNED,

        FOREIGN KEY (id_armour) REFERENCES armour (id_armour),

	id_material INT UNSIGNED, 

        FOREIGN KEY (id_material) REFERENCES materials (id_material)

);