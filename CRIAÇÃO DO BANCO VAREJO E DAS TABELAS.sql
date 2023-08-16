-- Criação do banco de dados "VAREJO"
CREATE DATABASE VAREJO;


USE VAREJO -- USAR O BANCO VAREJO PARA CRIAÇÃO DAS TABELAS

-- Criação da tabela "CATEGORIA"
CREATE TABLE CATEGORIA (
    CATEGORIA_ID INT,
    NOME VARCHAR (150) NOT NULL,
    PRIMARY KEY (CATEGORIA_ID)
);

-- Criação da tabela "FORNECEDORES"
CREATE TABLE FORNECEDORES (
    FORNECEDOR_ID INT,
    NOME VARCHAR (150) NOT NULL,
    ENDERECO VARCHAR (200),
    TELEFONE VARCHAR (8),
    CELULAR VARCHAR (9),
    EMAIL VARCHAR (200),
    PRIMARY KEY (FORNECEDOR_ID)
);

-- Criação da tabela "PRODUTOS"
CREATE TABLE PRODUTOS (
    PRODUTO_ID INT,
    NOME VARCHAR (255) NOT NULL,
    DESCRICAO VARCHAR (250),
    PRECO FLOAT NOT NULL,
    ESTOQUE_QTD INT,
    CATEGORIA_ID INT,
    FORNECEDOR_ID INT,
    PRIMARY KEY  (PRODUTO_ID),
    FOREIGN KEY (CATEGORIA_ID) REFERENCES CATEGORIA,
    FOREIGN KEY (FORNECEDOR_ID) REFERENCES FORNECEDORES
);

-- Criação da tabela "CLIENTES"
CREATE TABLE CLIENTES (
    CLIENTE_ID VARCHAR (14),
    NOME VARCHAR (150) NOT NULL,
    ENDERECO VARCHAR (200),
    UF VARCHAR (2),
    TELEFONE VARCHAR (10) NOT NULL,
    CELULAR VARCHAR (11) NOT NULL,
    EMAIL VARCHAR (200),
    PRIMARY KEY (CLIENTE_ID)
);

-- Criação da tabela "PEDIDOS"
CREATE TABLE PEDIDOS (
    PEDIDO_ID INT,
    CLIENTE_ID VARCHAR (14),
    DATA_PEDIDO DATE DEFAULT GETDATE () NOT NULL,
    STATUS VARCHAR(12) CHECK (STATUS IN ('Pendente', 'Em andamento', 'Concluído')),
    PRECO FLOAT NOT NULL,
    PRIMARY KEY (PEDIDO_ID),
    FOREIGN KEY (CLIENTE_ID) REFERENCES CLIENTES
);

-- Criação da tabela "ITENS_PEDIDO"
CREATE TABLE ITENS_PEDIDO (
    NUMERO_ITEM INT NOT NULL,
    PEDIDO_ID INT,
    PRODUTO_ID INT,
    QUANTIDADE INT NOT NULL,
    PRECO_UNIT  FLOAT NOT NULL,
    FOREIGN KEY (PEDIDO_ID) REFERENCES PEDIDOS,
    FOREIGN KEY (PRODUTO_ID) REFERENCES PRODUTOS
);

-- Criação da tabela "FUNCIONARIOS"
CREATE TABLE FUNCIONARIOS (
    FUNCIONARIO_ID INT,
    NOME VARCHAR (150) NOT NULL,
    CARGO VARCHAR (100) NOT NULL,
    DATA_CONTRATACAO DATE,
    SALARIO FLOAT NOT NULL,
    PRIMARY KEY (FUNCIONARIO_ID)
);

-- Criação da tabela "COMPRAS"
CREATE TABLE COMPRAS (
    COMPRA_ID INT,
    FORNECEDOR_ID INT,
    DATA_COMPRA DATE DEFAULT GETDATE () NOT NULL,
    VALOR_COMPRA FLOAT,
    PRIMARY KEY (COMPRA_ID),
    FOREIGN KEY (FORNECEDOR_ID) REFERENCES FORNECEDORES
);
