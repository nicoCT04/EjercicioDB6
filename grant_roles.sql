-- Crear roles
CREATE ROLE admin_role;
CREATE ROLE user_role;
CREATE ROLE manager_role;
CREATE ROLE guest_role;

-- Asignar permisos a los roles
GRANT SELECT, INSERT, DELETE, UPDATE ON ALL TABLES IN SCHEMA public TO admin_role;
GRANT SELECT ON ALL TABLES IN SCHEMA public TO user_role;
GRANT SELECT, INSERT, DELETE, UPDATE ON ALL TABLES IN SCHEMA public TO manager_role;
GRANT SELECT ON categories, products TO guest_role;

-- Otorgar permisos a la secuencia products_id_seq para admin_role y manager_role
GRANT USAGE, SELECT ON SEQUENCE products_id_seq TO admin_role;
GRANT USAGE, SELECT ON SEQUENCE products_id_seq TO manager_role;


