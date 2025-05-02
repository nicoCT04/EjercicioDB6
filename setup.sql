-- Habilitar Row Level Security (RLS)
ALTER TABLE tenants ENABLE ROW LEVEL SECURITY;
ALTER TABLE roles ENABLE ROW LEVEL SECURITY;
ALTER TABLE users ENABLE ROW LEVEL SECURITY;
ALTER TABLE categories ENABLE ROW LEVEL SECURITY;
ALTER TABLE products ENABLE ROW LEVEL SECURITY;
ALTER TABLE orders ENABLE ROW LEVEL SECURITY;
ALTER TABLE order_items ENABLE ROW LEVEL SECURITY;

-- Crear políticas de RLS

-- Política RLS para tenants
CREATE POLICY tenant_policy ON tenants
   USING (id = current_setting('myapp.current_tenant_id')::integer);

-- Política RLS para roles
CREATE POLICY role_policy ON roles
   USING (true);

-- Política RLS para users
CREATE POLICY user_policy ON users
   USING (tenant_id = current_setting('myapp.current_tenant_id')::integer);

-- Política RLS para categories
CREATE POLICY category_policy ON categories
   USING (tenant_id = current_setting('myapp.current_tenant_id')::integer);

-- Política RLS para products
CREATE POLICY product_policy ON products
   USING (tenant_id = current_setting('myapp.current_tenant_id')::integer);

-- Política RLS para orders
CREATE POLICY order_policy ON orders
   USING (tenant_id = current_setting('myapp.current_tenant_id')::integer);

-- Política RLS para order_items
CREATE POLICY order_item_policy ON order_items
   USING (EXISTS (
      SELECT 1
      FROM orders o
      WHERE o.id = order_items.order_id
      AND o.tenant_id = current_setting('myapp.current_tenant_id')::integer
   ));


