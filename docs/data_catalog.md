# Data Dictionary for Gold Layer

## Overview

The Gold Layer is the business-level data representation structured to support analytical and reporting use cases. It consists of dimension and fact tables designed to provide key business metrics.

---

# gold.dim_customers

**Purpose:** Stores customer details enriched with demographic and geographic data.

### Schema

| Column Name | Data Type | Description |
|-------------|-----------|-------------|
| customer_key | INT | Surrogate key uniquely identifying each customer record in the dimension table. |
| customer_id | INT | Unique numerical identifier assigned to each customer. |
| customer_number | NVARCHAR(50) | Alphanumeric identifier representing the customer, used for tracking and referencing. |
| first_name | NVARCHAR(50) | Customer's first name. |
| last_name | NVARCHAR(50) | Customer's last name or family name. |
| country | NVARCHAR(50) | Country of residence of the customer. |
| marital_status | NVARCHAR(50) | Marital status of the customer. |
| gender | NVARCHAR(50) | Gender of the customer. |
| birthdate | DATE | Customer date of birth. |
| create_date | DATE | Date the customer record was created. |


---

# gold.dim_products

**Purpose:** Provides information about products and their attributes.

### Schema

| Column Name | Data Type | Description |
|-------------|-----------|-------------|
| product_key | INT | Surrogate key uniquely identifying each product record. |
| product_id | INT | Unique identifier assigned to the product. |
| product_number | NVARCHAR(50) | Product code used for inventory and categorization. |
| product_name | NVARCHAR(50) | Descriptive product name. |
| category_id | NVARCHAR(50) | Product category identifier. |
| category_name | NVARCHAR(50) | Product category name. |
| subcategory | NVARCHAR(50) | Product subcategory name. |
| maintenance | NVARCHAR(50) | Whether the product requires maintenance. |
| cost | INT | Product cost or base price. |
| product_line | NVARCHAR(50) | Product line or series. |
| start_date | DATE | Product availability start date. |

---

## gold.fact_sales

**Purpose:** Stores transactional sales data for analytical purposes.

### Schema

| Column Name | Data Type | Description |
|-------------|-----------|-------------|
| order_number | NVARCHAR(50) | Unique sales order identifier. |
| product_key | INT | Foreign key to product dimension. |
| customer_key | INT | Foreign key to customer dimension. |
| order_date | DATE | Order creation date. |
| ship_date | DATE | Order shipment date. |
| due_date | DATE | Payment due date. |
| sales_amount | INT | Total sales amount. |
| quantity | INT | Quantity sold. |
| price | INT | Product unit price. |


```

---

# Data Model Relationships

```text
gold.dim_customers
        │
        └── customer_key
                │
                ▼
        gold.fact_sales
                ▲
                │
        ┌── product_key
        │
gold.dim_products
```

### Foreign Keys

| Fact Table Column | References |
|-------------------|------------|
| customer_key | gold.dim_customers.customer_key |
| product_key | gold.dim_products.product_key |
