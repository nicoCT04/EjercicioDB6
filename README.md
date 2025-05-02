# Multi-Tenant Database for E-Commerce

This project implements a **multi-tenant database** for an **e-commerce** system, where multiple companies (tenants) can use the same database, but their data remains isolated. **Row-Level Security (RLS)** is used to ensure that each tenant's data is kept private and only accessible by authorized users.

## Main Tables in the Database
- **tenants**: Stores the information of the tenants (companies).
- **roles**: Defines the roles for users.
- **users**: Stores user information, linking them to a `tenant_id` and a `role_id`.
- **categories**: Contains product categories, associated with a `tenant_id`.
- **products**: Stores product information, associated with a `tenant_id` and `category_id`.
- **orders**: Stores the orders made by users, linked to a `tenant_id` and `user_id`.
- **order_items**: Details the products in each order, linked to an `order_id` and `product_id`.

## Entity-Relationship Diagram (ER)

![Entity-Relationship Diagram](./diagramaER.pdf)

### Description of the Diagram
- **Tenants**: Identifies each company (tenant) in the system.
- **Roles**: Defines access permissions for users, such as Admin, User, etc.
- **Users**: Users are associated with a `tenant_id` and `role_id`.
- **Categories**: Product categories are associated with a `tenant_id`.
- **Products**: Products are related to a category and a `tenant_id`.
- **Orders**: Orders are linked to a user and a `tenant_id`.
- **Order Items**: Items within each order are related to products and the order.

## SQL Files and Execution Order

### SQL Files Description
1. **`setup.sql`**: Prepares the database environment by creating the database and enabling necessary extensions.
2. **`ddl.sql`**: Defines the schema, including tables, relationships, and constraints.
3. **`grant_roles.sql`**: Creates roles and assigns permissions to them.
4. **`data.sql`**: Populates the database with initial data for testing purposes.
5. **`querys.sql`**: Contains example queries to interact with the database.

### Execution Order
To set up the database correctly, execute the SQL files in the following order:
1. `setup.sql`
2. `ddl.sql`
3. `grant_roles.sql`
4. `data.sql`
5. `querys.sql` (optional, for testing and interaction)

## Row-Level Security (RLS)

To ensure data isolation between tenants, **Row-Level Security (RLS)** is enabled and policies are defined for each table that includes a `tenant_id`. This ensures that users can only access data associated with their own tenant.

## Testing

The database has been tested to ensure that:
- Users can only access data belonging to their tenant.
- Roles and permissions are enforced correctly.
- Queries return expected results based on the RLS policies.
