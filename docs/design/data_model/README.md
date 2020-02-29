# Data model

We are building a mobile e-commerce management system for SMEs. We offer
an Open Source platform that increases the customers instantly, with
website and mobile apps included.

The initial version is built on top of Elixir/Phoenix for the backend
and next.js for the frontend.

Functionality

- Listed in [use_cases](use_cases.md)

## System

Table | Description
-- | --
[Countries]() | List of countries

## Company

Bside runs as a multi-tenant application in which each customer have
their own database. It supports plugins and themes so that the
customization and extension of the platform is also possible.

### Authentication

Table | Description
--- | ---
[Companies]() | Contains the definition of the companies
[Store]() | Store that belongs to the same company
[Users]() | Users that manage the companies
[Roles]() | Roles of the users
[Permissions]() | Permissions for the roles

### Common

Table | Description
--- | ---
[Addresses]() | Address definitions
[Currencies]() | The supported currencies
[Payment methods]() | Paypal, Stripe, credit card, etc
[Shipping rates]() | The shipping price rates

### Catalog

Table | Description
--- | ---
[Products]() | The products that the company sells
[Related upsell]() | Products for up saling
[Related crossell]() | Products for cross saling
[Variants]() | The variants of the products (S, M, XL)
[Product categories]() | Group of products
[Coupons]() | Contains the rules of the coupons
[Prices]() | The price of the products
[Reviews]() | Reviews for a product

### Store

Table | Description
--- | ---
[Customers]() | Customers of the company
[Cart lines]() | Products added to the cart
[Orders]() | Information of the purchase
[Shipments]() | Shipment information of the purchase
[Order items]() | The products in the purchase operation
[Payments]() | The payments made by the customer
[Whishlist]() | The products that the user wish to buy someday
[Adjustments]() | Contains the adjustments of the purchase
[Refunds]() | The orders that have been refunded

### Accounting

Table | Description
--- | ---
[Tax rates]() | Tax rates that apply to the customers
[Tax rate locations]() | Stores location for calculating taxes

### Inventory

Table | Description
--- | ---
[Warehouse]() | Place where the products are stored
[Locations]() | Locations inside the warehouse
[Movement]() | Movement of products between locations

## CMS

Table | Description
--- | ---
[Page]() | Single page
[Contact]() | Contact messages
[Newsletter subscriptor]() | Subscription to the newsletter