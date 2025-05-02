-- Insertar datos en tenants
INSERT INTO tenants (nombre)
VALUES
  ('Tenant 1'),
  ('Tenant 2');

-- Insertar datos en roles
INSERT INTO roles (nombre)
VALUES
  ('Admin'),
  ('User'),
  ('Manager'),
  ('Guest');

-- Insertar datos en users
INSERT INTO users (tenant_id, correo_electronico, contrasena, role_id)
VALUES
  (1, 'user1@tenant1.com', 'password1', (SELECT id FROM roles WHERE nombre = 'Admin')),
  (2, 'user2@tenant2.com', 'password2', (SELECT id FROM roles WHERE nombre = 'User'));


INSERT INTO categories (tenant_id, nombre)
VALUES
  (1, 'Electronics'),
  (2, 'Clothing');

INSERT INTO products (tenant_id, category_id, nombre, descripcion, precio, stock)
VALUES
  (1, 1, 'Smartphone', 'Latest model with high performance', 699.99, 50),
  (2, 2, 'T-Shirt', 'Cotton T-Shirt with logo', 19.99, 100);

INSERT INTO products (tenant_id, category_id, nombre, descripcion, precio, stock)
VALUES
  (1, 1, 'Smartphone', 'Latest model with high performance', 699.99, 50),
  (2, 2, 'T-Shirt', 'Cotton T-Shirt with logo', 19.99, 100);

INSERT INTO orders (tenant_id, user_id, estado)
VALUES
  (1, 1, 'Pending'),
  (2, 2, 'Shipped');

INSERT INTO order_items (order_id, product_id, cantidad, precio)
VALUES
  (1, 1, 2, 699.99),  -- Orden 1, Producto 1
  (2, 2, 3, 19.99);   -- Orden 2, Producto 2

-- Verificar tenants
SELECT * FROM tenants;

-- Verificar roles
SELECT * FROM roles;

-- Verificar usuarios
SELECT * FROM users;

-- Verificar categorías
SELECT * FROM categories;

-- Verificar productos
SELECT * FROM products;

-- Verificar órdenes
SELECT * FROM orders;

-- Verificar items de órdenes
SELECT * FROM order_items;

