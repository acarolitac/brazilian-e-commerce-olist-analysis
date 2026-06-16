
-- Tabela: customers

CREATE TABLE customers (
    customer_id TEXT PRIMARY KEY,
    customer_unique_id TEXT,
    customer_zip_code_prefix INT,
    customer_city TEXT,
    customer_state VARCHAR(2)
);

-- Tabela: orders

CREATE TABLE orders (
	order_id TEXT PRIMARY KEY,
	customer_id TEXT,
	order_status TEXT,
   	order_purchase_timestamp TIMESTAMP,
    	order_approved_at TIMESTAMP,
    	order_delivered_carrier_date TIMESTAMP,
    	order_delivered_customer_date TIMESTAMP,
    	order_estimated_delivery_date TIMESTAMP,

	CONSTRAINT fk_orders_customer_id 
	FOREIGN KEY (customer_id) 
	REFERENCES customers(customer_id)
);

-- Tabela: products

CREATE TABLE products (
    product_id TEXT PRIMARY KEY,
    product_category_name TEXT,
    product_name_length INT,
    product_description_length INT,
    product_photos_qty INT,
    product_weight_g INT,
    product_length_cm INT,
    product_height_cm INT,
    product_width_cm INT
);

-- Tabela: sellers

CREATE TABLE sellers (
    seller_id TEXT PRIMARY KEY,
    seller_zip_code_prefix INT,
    seller_city TEXT,
    seller_state VARCHAR(2)
);

-- Tabela: order_items

CREATE TABLE order_items (
	order_id TEXT,
	order_item_id INT,
	product_id TEXT,
	seller_id TEXT,
	shipping_limit_date TIMESTAMP,
	price NUMERIC(10,2),
	freight_value NUMERIC(10,2),

	CONSTRAINT pk_order_items 
    PRIMARY KEY (order_id, order_item_id),
	
	CONSTRAINT fk_order_items_order_id
	FOREIGN KEY (order_id)
	REFERENCES orders(order_id),
	
	CONSTRAINT fk_order_items_product_id
	FOREIGN KEY (product_id)
	REFERENCES products(product_id),
	
	CONSTRAINT fk_order_items_seller_id
	FOREIGN KEY (seller_id)
	REFERENCES sellers(seller_id)
);

-- Tabela: order_payments

CREATE TABLE order_payments (
	order_id TEXT,
	payment_sequential INT,
	payment_type TEXT,
	payment_installments INT,
	payment_value NUMERIC(10,2),

	CONSTRAINT pk_order_payments
	PRIMARY KEY (order_id, payment_sequential),

	CONSTRAINT fk_order_payments_order_id
	FOREIGN KEY (order_id)
	REFERENCES orders(order_id)
);

-- Tabela: order_reviews

CREATE TABLE order_reviews (
	review_id TEXT,
	order_id TEXT,
	review_score INT,
	review_comment_title TEXT,
	review_comment_message TEXT,
	review_creation_date TIMESTAMP,
	review_answer_timestamp TIMESTAMP,

	CONSTRAINT fk_order_reviews_order_id
	FOREIGN KEY (order_id)
	REFERENCES orders(order_id)
);

-- Tabela: geolocation

CREATE TABLE geolocation (
	geolocation_zip_code_prefix INT,
	geolocation_lat NUMERIC(10,6),
	geolocation_lng NUMERIC(10,6),
	geolocation_city TEXT,
	geolocation_state VARCHAR(2)
);

-- Tabela: product_category_name_translation

CREATE TABLE product_category_name_translation (
    product_category_name TEXT,
    product_category_name_english TEXT
);