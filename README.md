# Banco de Dados de Loja de Varejo

Este projeto consiste em um banco de dados para uma loja de varejo, com o objetivo de armazenar informações sobre produtos, clientes, pedidos, funcionários e fornecedores. A estrutura do banco de dados é composta por várias tabelas, cada uma representando um aspecto específico da operação da loja.

## Tabelas:

### Produtos:
### Produtos
- `produto_id` (Chave Primária, INT)
- `nome` (Varchar(255))
- `descricao` (Varchar (250))
- `preco` (Float)
- `estoque_quantidade` (INT)
- `categoria_id` (Chave Estrangeira para a tabela de Categorias, INT)

### Categorias:
- `categoria_id` (Chave Primária, INT)
- `nome` (Varchar (250))

### Clientes:
- `cliente_id` (Chave Primária INT)
- `nome` (Varchar (150))
- `endereco` (Varchar (200))
- `telefone` (Varchar (8))
- `celular` (varchar (9))
- `email` (Varchar (200))

### Pedidos:
- `pedido_id` (Chave Primária INT)
- `cliente_id` (Chave Estrangeira para a tabela de Clientes INT) 
- `data_pedido` (DATE)
- `status` (Pendente, Em Andamento, Concluído varchar(12))
- `Preco` (Float)

### Itens de Pedido:
- `numero_item` 
- `pedido_id` (Chave Estrangeira para a tabela de Pedidos INT)
- `produto_id` (Chave Estrangeira para a tabela de Produtos INT)
- `quantidade` (INT)
- `preco_unitario` (Float)

### Funcionários:
- `funcionario_id` (Chave Primária INT)
- `nome` (Varchar (150)) 
- `cargo` (Varchar (100))
- `data_contratacao` (Date)
- `salario` (Float)

### Fornecedores:
- `fornecedor_id` (Chave Primária INT)
- `nome` (Varchar (150)
- `endereco` (Varchar (200))
- `telefone` (Varchar (8))
- `celular` (Varchar (9))
- `email` (Varchar (200))

### Compras:
- `compra_id` (Chave Primária INT)
- `fornecedor_id` (Chave Estrangeira para a tabela de Fornecedores INT)
- `data_compra` (Date)
- `valor_total` (Float)

### Relacionamentos:
- A tabela de Itens de Pedido se relaciona com as tabelas de Pedidos e Produtos para registrar os produtos incluídos em cada pedido.
- A tabela de Produtos se relaciona com a tabela de Categorias para categorizar os produtos.
- A tabela de Pedidos se relaciona com a tabela de Clientes para identificar o cliente que fez o pedido.
- A tabela de Compras se relaciona com a tabela de Fornecedores para registrar de quem os produtos foram comprados.

## Exemplos de Consultas:

### Consulta de Produtos em Estoque
```sql
SELECT nome, estoque_quantidade
FROM Produtos
WHERE estoque_quantidade > 0;
```
### Consulta de pedido por cliente
```sql
SELECT c.nome AS cliente, p.data_pedido, p.status
FROM Pedidos p
JOIN Clientes c ON p.cliente_id = c.cliente_id; 
```
### Consulta de valor total de compras por fornecedor 
```sql
SELECT f.nome AS fornecedor, SUM(valor_total) AS total_compras
FROM Compras c
JOIN Fornecedores f ON c.fornecedor_id = f.fornecedor_id
GROUP BY f.nome;




