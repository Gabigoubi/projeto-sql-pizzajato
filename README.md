# 🍕 Projeto SQL: Sistema de Gestão de Pizzaria "PizzaJato"

## 🚀 Visão Geral do Projeto

Este repositório contém os scripts SQL (Linguagem de Consulta Estruturada) desenvolvidos para a **Experiência Prática IV** da disciplina de Modelagem de Banco de Dados.

O objetivo é implementar o Modelo Lógico de um sistema de pedidos de pizzaria, o **"PizzaJato"**, após a normalização (3FN).

---

## 📊 Estrutura e Modelagem

O projeto é baseado em um modelo lógico de **4 tabelas**, que resolve o relacionamento Múltiplo-Múltiplo (N:N) através da tabela de associação `Item_Pedido`.

* **Tabelas Principais:** `Cliente`, `Pizza`, `Pedido`.
* **Tabela de Ligação:** `Item_Pedido`.

### Arquivo Principal: `pizzajato_script.sql`

Este arquivo está dividido nas seguintes seções:

1.  **DDL (CREATE TABLE):** Criação das 4 tabelas com definição de Chaves Primárias (`PK`) e Estrangeiras (`FK`).
2.  **DML (INSERT):** Comandos para popular as tabelas com dados de exemplo (clientes, pizzas, pedidos).
3.  **Consultas (SELECT):** Demonstração do uso de `JOIN`, `WHERE` e filtros para extração de dados.
4.  **Manipulação (UPDATE/DELETE):** Teste de integridade de dados e alteração de informações.

---

## 🛠️ Instruções de Execução

1.  Clone ou baixe o conteúdo deste repositório.
2.  Carregue o arquivo `pizzajato_script.sql` em seu ambiente SQL (MySQL, PGAdmin, etc.).
3.  Execute o script na ordem em que os comandos estão dispostos.

---

Você pode criar esse arquivo diretamente no GitHub ou no VS Code. Ao fazer isso, sua entrega da Atividade 4 estará **completa** e com excelente apresentação.
