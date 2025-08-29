# Change this to your target database.
# SQLite (default):
DB_URL = "sqlite:///./dataspark.db"


# Examples:
# MySQL: DB_URL = "mysql+pymysql://user:password@localhost:3306/dataspark"
# PostgreSQL: DB_URL = "postgresql+psycopg2://user:password@localhost:5432/dataspark"


# File paths
DATA_DIR = "./data"
CUSTOMERS_CSV = f"{DATA_DIR}/customers.csv"
PRODUCTS_CSV = f"{DATA_DIR}/products.csv"
SALES_CSV = f"{DATA_DIR}/sales.csv"
STORES_CSV = f"{DATA_DIR}/stores.csv"
EXRATES_CSV = f"{DATA_DIR}/exchange_rates.csv"
