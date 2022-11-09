
DROP TABLE IF EXISTS weapons_materials;
DROP TABLE IF EXISTS armours_materials;

DROP TABLE IF EXISTS materials;

DROP TABLE IF EXISTS characters_weapons;
DROP TABLE IF EXISTS characters_items;
DROP TABLE IF EXISTS characters_armours;

DROP TABLE IF EXISTS armours;
DROP TABLE IF EXISTS items;
DROP TABLE IF EXISTS weapons;

DROP TABLE IF EXISTS items_types;
DROP TABLE IF EXISTS armours_types;
DROP TABLE IF EXISTS weapons_types;

DROP TABLE IF EXISTS stats;

DROP TABLE IF EXISTS characters;

CREATE TABLE characters
(
    id_character INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(32),
    age INT,
    race VARCHAR(16),
    gender CHAR(1),
    class VARCHAR(16),
    height FLOAT,
    weight FLOAT,
    country CHAR(3),
    description TEXT
); 
INSERT INTO characters (`name`, `age`, `race`, `gender`, `class`, `height`, `weight`, `country`, `description`)
    VALUES
( 'Payoh', 67, 'Cambiapieles', 'L', 'Dictador', 1.75, 80, 'RUM', 'Payoh es.... un cambiapieles muy raton.'),
( 'Yuca ', 27, 'Sirenido', 'F', 'Cryptolai', 1, 40, 'PUR', 'Yuca esta en la academia de mundocrypto junto a Mani Thawani para luchar contra Tamayo.'),
('Yulen', 104, 'No muerto', 'D', 'Minero', 0.8, 25, 'NDE', 'Yulen se fue para no volver, o eso cree la gente....'),
('Josema', 3000, 'Deidad', 'T', 'Procrastinador', 3.14, 0, 'PER', 'Josema, es tal su grandeza que decidio vivir en latam.');



CREATE TABLE stats 
(
    id_stats INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    agility INT,
    hp FLOAT,
    hp_max INT,
    xp FLOAT,
    xp_max INT,
    mp FLOAT,
    mp_max INT,
   	`level` INT,
    physic_attack FLOAT,
    magic_attack FLOAT,
    physisc_defense FLOAT,
    magic_defense FLOAT,
    stamina INT,
    mana INT,
    intel INT,
    stealth INT,
    luck INT,
    faith INT,
    velocity INT,
    dexterity INT,
    strength INT,
    charisma INT,
    vigor INT,
    tenacity INT,
    critical_rate INT,
    balance INT,
    id_character INT UNSIGNED,
    FOREIGN KEY(id_character)REFERENCES characters(id_character)
);
CREATE TABLE items_types
(
	id_item_type INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	type VARCHAR (24),
	description TEXT,
    icon VARCHAR (16)
);
INSERT INTO items_types (type, description, icon)VALUES("Explosive","ace kambom","a.png");

CREATE TABLE items(
    id_item INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    item VARCHAR(24),
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
    id_item_type INT UNSIGNED,
    FOREIGN KEY (id_item_type) REFERENCES items_types (id_item_type)
);
INSERT INTO items (item, consumible, cost, `key`,
                   rarity, weight, `usage`, fusionable,
                   width, height, durability, description,
                   disassemble, id_item_type)
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
 
 CREATE TABLE armours
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
INSERT INTO armours (armour,physical_defense,magical_defense, weight, durability,`level`, cost, description, id_armour_type) VALUES ("gorra", 10, 5, 100, 100, 5, 30, "gorra", 3);
CREATE TABLE characters_weapons
(
    id_character_weapon INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    id_character INT UNSIGNED,
    FOREIGN KEY (id_character) REFERENCES characters (id_character),
    id_weapon INT UNSIGNED,
    FOREIGN KEY (id_weapon) REFERENCES weapons (id_weapon)
);
INSERT INTO characters_weapons (id_character,id_weapon) VALUES (1,1),(4,1),(4,1);

CREATE TABLE characters_items
(
    id_characters_item INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    id_character INT UNSIGNED,
    id_item INT UNSIGNED,
    FOREIGN KEY (id_character)REFERENCES characters(id_character),
    FOREIGN KEY (id_item)REFERENCES items(id_item)
);

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

        FOREIGN KEY (id_weapon) REFERENCES weapons (id_weapon),
	id_material INT UNSIGNED,

        FOREIGN KEY (id_material) REFERENCES materials (id_material)

);

CREATE TABLE armours_materials 
(
	id_armour_material INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	id_armour INT UNSIGNED,

        FOREIGN KEY (id_armour) REFERENCES armours (id_armour),

	id_material INT UNSIGNED, 

        FOREIGN KEY (id_material) REFERENCES materials (id_material)

);

