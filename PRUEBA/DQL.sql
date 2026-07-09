CONSULTA  1
SELECT 
    product_name AS "Producto",
    stock AS "Inventario Disponible"
FROM eco_products
ORDER BY stock DESC;
CONSULTA 2
SELECT 
    c.city_name AS "Ciudad",
    COUNT(o.eco_order_id) AS "Total Pedidos",
    SUM(o.eco_quantity) AS "Total Unidades Solicitadas"
FROM eco_cities c
LEFT JOIN eco_orders o ON c.id_city = o.id_city
GROUP BY c.id_city, c.city_name
ORDER BY "Total Pedidos" DESC;

CONSULTA 3
SELECT 
    cat.category_name AS "Categoría",
    SUM(o.eco_quantity * p.unit_price) AS "Total Ventas ($)"
FROM eco_orders o
JOIN eco_products p ON o.id_product = p.id_product
JOIN eco_categories cat ON id_category = cat.id_category
GROUP BY cat.id_category, cat.category_name
ORDER BY "Total Ventas ($)" DESC;

CONSULTA 4
SELECT 
    product_name AS "Producto",
    stock AS "Inventario Crítico"
FROM eco_products
ORDER BY stock ASC
LIMIT 5;

CONSULTA 5
SELECT column_name 
FROM information_schema.columns 
WHERE table_name = 'eco_client';

CONSULTA 6
SELECT 
    dc.center_name AS "Centro de Distribución",
    SUM(p.stock * p.unit_price) AS "Valor Financiero del Inventario ($)"
FROM eco_orders o
JOIN eco_distribution_centers dc ON o.id_center = dc.id_center
JOIN eco_products p ON o.id_product = p.id_product
GROUP BY dc.id_center, dc.center_name
ORDER BY "Valor Financiero del Inventario ($)" DESC;

