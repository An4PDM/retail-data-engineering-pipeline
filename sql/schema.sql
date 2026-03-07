CREATE SCHEMA IF NOT EXISTS staging;
CREATE SCHEMA IF NOT EXISTS core;


CREATE TABLE core.cliente (
	id_cliente INT PRIMARY KEY,
	email VARCHAR(255),
	username VARCHAR(50),
	primeiro_nome VARCHAR(50),
	ultimo_nome VARCHAR(50),
	telefone VARCHAR(20),
	cidade VARCHAR(50)
);

CREATE TABLE core.produto (
	id_produto INT PRIMARY KEY,
	nome VARCHAR(80),
	descricao TEXT,
	categoria VARCHAR(50),
	preco NUMERIC(10,2)
);

CREATE TABLE core.pedido (
	id_pedido INT PRIMARY KEY,
	id_cliente INT NOT NULL,
	data_pedido TIMESTAMP,
	valor_total_pedido NUMERIC(10,2),
	FOREIGN KEY (id_cliente) REFERENCES core.cliente(id_cliente)
);


CREATE TABLE core.item_pedido (
	id_item_pedido INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	id_pedido INT NOT NULL,
	id_produto INT NOT NULL,
	quantidade INT,
	preco_unitario NUMERIC(10,2),
	valor_total_item NUMERIC(10,2),
	FOREIGN KEY (id_pedido) REFERENCES core.pedido(id_pedido),
	FOREIGN KEY (id_produto) REFERENCES core.produto(id_produto)
);



