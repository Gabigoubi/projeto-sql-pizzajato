-- ******************************************************
-- 1. ESTRUTURA (DDL) - Criação das 4 Tabelas
-- ******************************************************

CREATE TABLE Cliente (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(15)
);

CREATE TABLE Pizza (
    id_pizza INT PRIMARY KEY AUTO_INCREMENT,
    sabor VARCHAR(100) NOT NULL,
    preco DECIMAL(10, 2)
);

CREATE TABLE Pedido (
    id_pedido INT PRIMARY KEY AUTO_INCREMENT,
    data_pedido DATE NOT NULL,
    status VARCHAR(50), 
    id_cliente INT,
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente)
);

CREATE TABLE Item_Pedido (
    id_pedido INT,
    id_pizza INT,
    quantidade INT NOT NULL,
    PRIMARY KEY (id_pedido, id_pizza),
    FOREIGN KEY (id_pedido) REFERENCES Pedido(id_pedido),
    FOREIGN KEY (id_pizza) REFERENCES Pizza(id_pizza)
);

-- ******************************************************
-- 2. INSERÇÃO DE DADOS (INSERT) 
-- ******************************************************

INSERT INTO Cliente (nome, telefone) VALUES 
('Gabriel Oliveira', '99123-4567'),
('Laura Santos', '99876-5432'),
('Marcos Rocha', '99333-5555');

INSERT INTO Pizza (sabor, preco) VALUES 
('Calabresa', 45.00),
('Quatro Queijos', 52.00),
('Frango com Catupiry', 55.00);

INSERT INTO Pedido (data_pedido, status, id_cliente) VALUES 
('2025-11-29', 'Entregue', 1), 
('2025-11-30', 'Em Produção', 2),
('2025-11-30', 'Pendente', 3); 

INSERT INTO Item_Pedido (id_pedido, id_pizza, quantidade) VALUES
(1, 1, 1), 
(2, 2, 1), 
(2, 3, 1),
(3, 1, 2);

-- ******************************************************
-- 3. CONSULTAS (SELECT) 
-- ******************************************************

-- Consulta 1: Listar pedidos feitos, mostrando o nome do cliente e o status (usando JOIN)
SELECT C.nome, P.data_pedido, P.status 
FROM Cliente C JOIN Pedido P ON C.id_cliente = P.id_cliente;

-- Consulta 2: Mostrar quais sabores e quantidades a Laura pediu (usando WHERE e 2 JOINS)
SELECT P.sabor, IP.quantidade
FROM Pizza P
JOIN Item_Pedido IP ON P.id_pizza = IP.id_pizza
JOIN Pedido Pd ON IP.id_pedido = Pd.id_pedido
WHERE Pd.id_cliente = 2; 

-- Consulta 3: Mostrar pizzas que custam mais de R$ 50,00
SELECT sabor, preco FROM Pizza WHERE preco > 50.00;

-- ******************************************************
-- 4. MANIPULAÇÃO (UPDATE e DELETE) 
-- ******************************************************

-- UPDATE 1: Atualizar o status do pedido de 'Em Produção' para 'Saiu para Entrega'
UPDATE Pedido SET status = 'Saiu para Entrega' WHERE id_pedido = 2;

-- UPDATE 2: Corrigir o preço da Pizza Calabresa
UPDATE Pizza SET preco = 48.00 WHERE sabor = 'Calabresa';

-- UPDATE 3: Mudar o status de pedidos 'Pendente' para 'Cancelado'
UPDATE Pedido SET status = 'Cancelado' WHERE status = 'Pendente';


-- DELETE 1: Remover o pedido mais antigo (id_pedido = 1) e seus itens (FOREIGN KEY exige esta ordem)
DELETE FROM Item_Pedido WHERE id_pedido = 1; 

-- DELETE 2: Agora pode remover o pedido 1
DELETE FROM Pedido WHERE id_pedido = 1;

-- DELETE 3: Remover o cliente Marcos Rocha (id_cliente = 3), já que o pedido dele foi cancelado e apagado
DELETE FROM Cliente WHERE id_cliente = 3;