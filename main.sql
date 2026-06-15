DROP DATABASE IF EXISTS empresa_db_tp2_infnet;

-- Criação da Base de Dados

CREATE DATABASE empresa_db_tp2_infnet;

USE empresa_db_tp2_infnet;

CREATE TABLE funcionarios (
    id_funcionario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cargo VARCHAR(50) NOT NULL,
    departamento VARCHAR(50) NOT NULL,
    salario DECIMAL(10,2) NOT NULL,
    data_contratacao DATE NOT NULL,
    cidade VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    status VARCHAR(20) NOT NULL
);

INSERT INTO funcionarios
(nome, cargo, departamento, salario, data_contratacao, cidade, email, status)
VALUES
('João Silva', 'Analista de Sistemas', 'TI', 6500.00, '2023-02-15', 'São Paulo', 'joao@empresa.com', 'Ativo'),
('Maria Souza', 'Assistente Administrativo', 'RH', 3500.00, '2024-01-10', 'Campinas', 'maria@empresa.com', 'Ativo'),
('Carlos Oliveira', 'Gerente de Projetos', 'TI', 9500.00, '2021-05-20', 'São Paulo', 'carlos@empresa.com', 'Ativo'),
('Ana Pereira', 'Analista Financeiro', 'Financeiro', 5200.00, '2022-07-18', 'Santos', 'ana@empresa.com', 'Ativo'),
('Pedro Santos', 'Desenvolvedor', 'TI', 5800.00, '2024-03-12', 'Campinas', 'pedro@empresa.com', 'Ativo'),
('Fernanda Lima', 'Coordenador RH', 'RH', 7200.00, '2020-11-05', 'São Paulo', 'fernanda@empresa.com', 'Ativo'),
('Ricardo Gomes', 'Auxiliar Administrativo', 'Administrativo', 2500.00, '2023-08-22', 'Sorocaba', 'ricardo@empresa.com', 'Ativo'),
('Juliana Costa', 'Contador', 'Financeiro', 6800.00, '2024-02-01', 'Campinas', 'juliana@empresa.com', 'Ativo'),
('Lucas Martins', 'Desenvolvedor', 'TI', 6100.00, '2022-04-14', 'São Paulo', 'lucas@empresa.com', 'Inativo'),
('Patricia Rocha', 'Analista de Marketing', 'Marketing', 4700.00, '2023-09-11', 'Santos', 'patricia@empresa.com', 'Ativo');

-- ============================================================================
-- Exercícios
-- 1) Listagem Completa
SELECT *
FROM funcionarios;
-- ============================================================================

-- 2) Seleção de Colunas Específicas
SELECT nome, cargo, salario
FROM funcionarios;
-- ============================================================================

-- 3) Funcionários do Departamento de TI
SELECT *
FROM funcionarios
WHERE departamento = 'TI';
-- ============================================================================

-- 4) Funcionários com Salário Superior a R$ 5.000,00
SELECT *
FROM funcionarios
WHERE salario > 5000;
-- ============================================================================

-- 5) Ordenação por Salário
SELECT nome, salario
FROM funcionarios
ORDER BY salario DESC;

-- ============================================================================

-- 6) Contratações Recentes
SELECT *
FROM funcionarios
WHERE data_contratacao > '2023-01-01';
-- ============================================================================

-- 7) Funcionários cujo nome começa com A
SELECT *
FROM funcionarios
WHERE nome LIKE 'A%';
-- ============================================================================

-- 8) Funcionários Ativos
SELECT *
FROM funcionarios
WHERE status = 'Ativo';
-- ============================================================================

-- 9) Média Salarial da Empresa
SELECT AVG(salario) AS media_salarial
FROM funcionarios;
-- ============================================================================

-- 10) Maior Salário
SELECT MAX(salario) AS maior_salario
FROM funcionarios;
-- ============================================================================

-- 11) Quantidade de Funcionários por Departamento
SELECT departamento,
       COUNT(*) AS quantidade_funcionarios
FROM funcionarios
GROUP BY departamento;
-- ============================================================================

-- 12) Média Salarial por Departamento
SELECT departamento,
       AVG(salario) AS media_salarial
FROM funcionarios
GROUP BY departamento;
-- ============================================================================

-- 13) Funcionários Contratados em 2024
SELECT nome,
       cargo,
       departamento,
       data_contratacao
FROM funcionarios
WHERE YEAR(data_contratacao) = 2024;
-- ============================================================================

-- 14) Funcionários entre Faixas Salariais

SELECT *
FROM funcionarios
WHERE salario BETWEEN 4000 AND 8000;
-- ============================================================================

-- 15) Funcionários de São Paulo ou Campinas
SELECT *
FROM funcionarios
WHERE cidade IN ('São Paulo', 'Campinas');
