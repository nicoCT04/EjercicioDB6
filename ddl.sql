-- Crear tabla de tenants
CREATE TABLE tenants (
  id SERIAL PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  creado_en TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Crear tabla de roles
CREATE TABLE roles (
  id SERIAL PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL UNIQUE
);

-- Crear tabla de users
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  tenant_id INTEGER NOT NULL REFERENCES tenants(id) ON DELETE CASCADE,
  correo_electronico VARCHAR(100) NOT NULL UNIQUE,
  contrasena VARCHAR(100) NOT NULL,
  role_id INTEGER NOT NULL REFERENCES roles(id),
  creado_en TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Crear tabla de categories
CREATE TABLE categories (
  id SERIAL PRIMARY KEY,
  tenant_id INTEGER NOT NULL REFERENCES tenants(id) ON DELETE CASCADE,
  nombre VARCHAR(100) NOT NULL,
  creado_en TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT tenant_category UNIQUE (tenant_id, nombre)
);

-- Crear tabla de products
CREATE TABLE products (
  id SERIAL PRIMARY KEY,
  tenant_id INTEGER NOT NULL REFERENCES tenants(id) ON DELETE CASCADE,
  category_id INTEGER NOT NULL REFERENCES categories(id) ON DELETE CASCADE,
  nombre VARCHAR(100) NOT NULL,
  descripcion TEXT,
  precio DECIMAL(10, 2) NOT NULL,
  stock INTEGER NOT NULL,
  creado_en TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Crear tabla de orders
CREATE TABLE orders (
  id SERIAL PRIMARY KEY,
  tenant_id INTEGER NOT NULL REFERENCES tenants(id) ON DELETE CASCADE,
  user_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  estado VARCHAR(50) NOT NULL,
  monto_total DECIMAL(10, 2) DEFAULT 0.00
);

-- Crear tabla de order_items
CREATE TABLE order_items (
  id SERIAL PRIMARY KEY,
  order_id INTEGER NOT NULL REFERENCES orders(id) ON DELETE CASCADE,
  product_id INTEGER NOT NULL REFERENCES products(id) ON DELETE CASCADE,
  cantidad INTEGER NOT NULL,
  precio DECIMAL(10, 2) NOT NULL
);
