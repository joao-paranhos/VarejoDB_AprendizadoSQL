# Banco de Dados de Loja de Varejo - Documentação

Este projeto consiste em um banco de dados para uma loja de varejo, com o objetivo de armazenar informações sobre produtos, clientes, pedidos, funcionários e fornecedores. A estrutura do banco de dados é composta por várias tabelas, cada uma representando um aspecto específico da operação da loja.

## Tabelas

### Produtos
- `produto_id` (Chave Primária)
- `nome`
- `descricao`
- `preco`
- `estoque_quantidade`
- `categoria_id` (Chave Estrangeira para a tabela de Categorias)

### Categorias
- `categoria_id` (Chave Primária)
- `nome`

### Clientes
- `cliente_id` (Chave Primária)
- `nome`
- `endereco`
- `telefone`
- `email`

### Pedidos
- `pedido_id` (Chave Primária)
- `cliente_id` (Chave Estrangeira para a tabela de Clientes)
- `data_pedido`
- `status` (Pendente, Em Andamento, Concluído)

### Itens de Pedido
- `item_id` (Chave Primária)
- `pedido_id` (Chave Estrangeira para a tabela de Pedidos)
- `produto_id` (Chave Estrangeira para a tabela de Produtos)
- `quantidade`
- `preco_unitario`

### Funcionários
- `funcionario_id` (Chave Primária)
- `nome`
- `cargo`
- `data_contratacao`
- `salario`

### Fornecedores
- `fornecedor_id` (Chave Primária)
- `nome`
- `endereco`
- `telefone`
- `email`

### Compras
- `compra_id` (Chave Primária)
- `fornecedor_id` (Chave Estrangeira para a tabela de Fornecedores)
- `data_compra`
- `valor_total`

### Relacionamentos
- A tabela de Itens de Pedido se relaciona com as tabelas de Pedidos e Produtos para registrar os produtos incluídos em cada pedido.
- A tabela de Produtos se relaciona com a tabela de Categorias para categorizar os produtos.
- A tabela de Pedidos se relaciona com a tabela de Clientes para identificar o cliente que fez o pedido.
- A tabela de Compras se relaciona com a tabela de Fornecedores para registrar de quem os produtos foram comprados.

## Exemplos de Consultas

### Consulta de Produtos em Estoque
```sql
SELECT nome, estoque_quantidade
FROM Produtos
WHERE estoque_quantidade > 0; 


