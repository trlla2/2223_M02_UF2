DROP TABLE IF EXISTS pedidos_hamburguesas;
DROP TABLE IF EXISTS ingredientes_hamburguesas;
DROP TABLE IF EXISTS pedidos;
DROP TABLE IF EXISTS hamburgesas;
DROP TABLE IF EXISTS ingredientes;





CREATE TABLE pedidos (id_pedido INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
		      fecha TIME
);

INSERT INTO pedidos (fecha) values 
		 ('12:24:30'),
		 ('12:25:10'),
		 ('12:27:30');

CREATE TABLE ingredientes (id_ingrediente INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
			   name VARCHAR(24)
);

INSERT INTO ingredientes (name) VALUES
		 ("hamburguesaTernera"),
		 ("lechuga"),
		 ("queso"), 
		 ("bacon"),
		 ("salsa barbacoa"),
		 ("heura"),
		 ("pan");

CREATE TABLE hamburgesas (id_hamburgesa INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
			  name VARCHAR(24),
			  cost FLOAT,
			  vegana BOOLEAN
);

INSERT INTO hamburgesas ( name, cost, vegana) VALUES
		 ("vegana", 6.50, TRUE),
		 ("cheseBurguer", 5.50, FALSE),
		 ("simple", 4.00, FALSE),
		 ("completa", 9.00, FALSE); 

CREATE TABLE ingredientes_hamburguesas (id_ingrediente_hamburgesa INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT, 
                                        id_ingrediente INT UNSIGNED, 
                                        id_hamburguesa INT UNSIGNED, 
                                        FOREIGN KEY (id_ingrediente) REFERENCES ingredientes (id_ingrediente),
                                        FOREIGN KEY (id_hamburguesa) REFERENCES hamburgesas (id_hamburgesa)
);

INSERT INTO ingredientes_hamburguesas (id_ingrediente, id_hamburguesa) VALUES
		 (6, 1), (2, 1), (7, 1),
		 (1, 2), (3, 2), (7, 2),
		 (1, 3), (7, 3),
		 (1, 4), (2, 4), (3, 4), (4, 4), (5, 4), (7, 4);

CREATE TABLE pedidos_hamburguesas (id_pedido_hamburgesa INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT, 
                                        id_pedido INT UNSIGNED, 
                                        id_hamburguesa INT UNSIGNED, 
                                        FOREIGN KEY (id_pedido) REFERENCES pedidos (id_pedido),
                                        FOREIGN KEY (id_hamburguesa) REFERENCES hamburgesas (id_hamburgesa)
);
INSERT INTO pedidos_hamburguesas (id_pedido, id_hamburguesa) VALUES 
		 (1, 1), (1, 3), (1, 4),
		 (2, 2), (2, 3),
		 (3, 4), (3, 3); 