
INSERT INTO eco_client (customer_name) 
VALUES ('Supermercados Éxito');


INSERT INTO eco_orders (eco_order_id, id_client, id_city, id_product, id_center, eco_order_date, eco_quantity) 
VALUES (
    'O1025', 
    (SELECT id_customer FROM eco_client WHERE customer_name = 'Supermercados Éxito'), 
    1, 
    1, 
    1, 
    '2026-05-20', 
    50
);




UPDATE eco_distribution_centers 
SET center_name = 'Centro de Distribución Logística Norte' 
WHERE center_name = 'North Center';



DELETE FROM eco_products 
WHERE id_product = 1;

INSERT INTO eco_products (product_name, id_category, unit_price, stock) 
VALUES ('Producto de Prueba Temporal', 1, 1.50, 10);

DELETE FROM eco_products 
WHERE product_name = 'Producto de Prueba Temporal';
