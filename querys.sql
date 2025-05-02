-- Verificar si RLS está habilitado en las tablas
SELECT relname, relrowsecurity
FROM pg_class
WHERE relrowsecurity = true;

-- Configurar el tenant_id para la sesión actual
SET myapp.current_tenant_id = '1';  

-- Establecer el rol para la sesión
SET ROLE admin_role;

-- Realizar un SELECT
SELECT * FROM products;

-- Establecer el rol para la sesión
SET ROLE user_role;

-- Realizar un SELECT (solo debería ver los datos del tenant asignado)
SELECT * FROM products;

-- Establecer el rol para la sesión
SET ROLE guest_role;

-- Realizar un SELECT (solo debería ver categorías y productos)
SELECT * FROM categories;
SELECT * FROM products;
select * from users;

-- Establecer el rol para la sesión
SET ROLE manager_role;

-- Realizar un SELECT
SELECT * FROM products;
SELECT * FROM categories;
SELECT * FROM products;
select * from users;

-- Conectar como admin_role
SET ROLE admin_role;

-- Intentar insertar un nuevo producto
INSERT INTO products (tenant_id, category_id, nombre, descripcion, precio, stock)
VALUES (1, 1, 'Ipad 2', 'From Apple', 49.99, 20);

-- Intentar actualizar el stock de un producto
UPDATE products
SET stock = 30
WHERE nombre = 'Ipad';

-- Intentar eliminar un producto
DELETE FROM products
WHERE nombre = 'Ipad';

-- Conectar como user_role
SET ROLE user_role;

-- Intentar insertar un nuevo producto
INSERT INTO products (tenant_id, category_id, nombre, descripcion, precio, stock)
VALUES (1, 1, 'Ipad', 'From Apple', 49.99, 20);

-- Intentar actualizar el stock de un producto
UPDATE products
SET stock = 30
WHERE nombre = 'Ipad';

-- Intentar eliminar un producto (esto debería fallar)
DELETE FROM products
WHERE nombre = 'Ipad';

-- Conectar como manager_role
SET ROLE manager_role;

-- Intentar insertar un nuevo producto 
INSERT INTO products (tenant_id, category_id, nombre, descripcion, precio, stock)
VALUES (1, 1, 'Ipad', 'From Apple', 49.99, 20);

-- Intentar actualizar el stock de un producto 
UPDATE products
SET stock = 30
WHERE nombre = 'Ipad';

-- Intentar eliminar un producto
DELETE FROM products
WHERE nombre = 'Ipad';

-- Conectar como guest_role
SET ROLE guest_role;

-- Intentar insertar un nuevo producto
INSERT INTO products (tenant_id, category_id, nombre, descripcion, precio, stock)
VALUES (1, 1, 'Ipad', 'From Apple', 49.99, 20);

-- Intentar actualizar el stock de un producto
UPDATE products
SET stock = 30
WHERE nombre = 'Ipad';

-- Intentar eliminar un producto 
DELETE FROM products
WHERE nombre = 'Ipad';
