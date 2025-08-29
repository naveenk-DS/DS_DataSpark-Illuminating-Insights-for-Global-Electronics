PRAGMA foreign_keys = ON; -- for SQLite
gender TEXT CHECK (gender IN ('Male','Female','Other') OR gender IS NULL),
birthday DATE,
email TEXT,
phone TEXT,
city TEXT,
state TEXT,
country TEXT
);


-- Products
CREATE TABLE products (
product_id INTEGER PRIMARY KEY,
product_name TEXT NOT NULL,
category TEXT,
subcategory TEXT,
unit_cost REAL NOT NULL,
unit_price REAL NOT NULL
);


-- Stores
CREATE TABLE stores (
store_id INTEGER PRIMARY KEY,
store_name TEXT NOT NULL,
city TEXT,
state TEXT,
country TEXT,
continent TEXT,
open_date DATE,
size_sqm REAL
);


-- Daily exchange rates to USD
CREATE TABLE exchange_rates (
date DATE NOT NULL,
currency_code TEXT NOT NULL,
rate_to_usd REAL NOT NULL CHECK (rate_to_usd > 0),
PRIMARY KEY (date, currency_code),
FOREIGN KEY (currency_code) REFERENCES currencies(currency_code)
);


-- Sales fact table
CREATE TABLE sales (
sale_id INTEGER PRIMARY KEY,
sale_date DATE NOT NULL,
customer_id INTEGER,
product_id INTEGER NOT NULL,
store_id INTEGER,
quantity INTEGER NOT NULL CHECK (quantity > 0),
currency_code TEXT NOT NULL,
unit_price_applied REAL NOT NULL, -- final price used for the sale (after overrides/discounts)
revenue_local REAL NOT NULL, -- quantity * unit_price_applied in local currency
revenue_usd REAL NOT NULL, -- revenue converted using exchange rate
cost_usd REAL NOT NULL, -- quantity * unit_cost converted to USD
profit_usd REAL NOT NULL, -- revenue_usd - cost_usd
FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
FOREIGN KEY (product_id) REFERENCES products(product_id),
FOREIGN KEY (store_id) REFERENCES stores(store_id),
FOREIGN KEY (currency_code) REFERENCES currencies(currency_code)
);


-- Helpful indexes
CREATE INDEX IF NOT EXISTS idx_sales_date ON sales(sale_date);
CREATE INDEX IF NOT EXISTS idx_sales_store ON sales(store_id);
CREATE INDEX IF NOT EXISTS idx_sales_customer ON sales(customer_id);
CREATE INDEX IF NOT EXISTS idx_sales_product ON sales(product_id);
CREATE INDEX IF NOT EXISTS idx_products_cat ON products(category, subcategory);
CREATE INDEX IF NOT EXISTS idx_stores_geo ON stores(country, state, city);
