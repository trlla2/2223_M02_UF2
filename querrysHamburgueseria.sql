
#Haz una query, con joins, que obtenga todas las hamburguesas con sus ingredientes:

SELECT hamburgesas.name AS nombre_hamburguesa, ingredientes.name AS nombre_ingrediente FROM hamburgesas
LEFT JOIN ingredientes_hamburguesas ON hamburgesas.id_hamburgesa = ingredientes_hamburguesas.id_hamburguesa
LEFT JOIN ingredientes ON ingredientes_hamburguesas.id_ingrediente = ingredientes.id_ingrediente;

#Haz una query que te permita obtener cuantos ingredientes tiene cada hamburguesa
SELECT hamburgesas.name, COUNT(*) FROM hamburgesas
JOIN ingredientes_hamburguesas ON hamburgesas.id_hamburgesa = ingredientes_hamburguesas.id_hamburguesa GROUP BY hamburgesas.name;

#Haz una función que pasándole el ID de un pedido nos retorne el precio total de las hamburguesas del mism
DELIMITER //
CREATE FUNCTION precioTotal(id_pedido INT UNSIGNED) RETURNS FLOAT
BEGIN
  DECLARE precio_total FLOAT DEFAULT 0;

  SELECT SUM(hamburgesas.cost) INTO precio_total FROM hamburgesas INNER JOIN pedidos_hamburguesas ON hamburgesas.id_hamburgesa = pedidos_hamburguesas.id_hamburguesa WHERE pedidos_hamburguesas.id_pedido = id_pedido;
 RETURN precio_total;
END //
DELIMITER ;

#Actualiza un ingrediente: escribe la petición para actualizar el nombre de un ingrediente.
UPDATE ingredientes
SET name = 'Lechuga2'
WHERE id_ingrediente = '2';

#Obtén la fecha de LA compra más reciente de una hamburguesa
SELECT id_pedido, MAX(fecha) FROM pedidos;

