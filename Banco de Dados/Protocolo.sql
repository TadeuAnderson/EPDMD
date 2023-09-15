
--Criação das tabelas para a Atividade
CREATE TABLE Pasta_de_Documentos 
( 
 Numero_da_Pasta INT PRIMARY KEY,  
 Data_de_Criacao DATE NOT NULL,  
 Assunto_Principal VARCHAR(255) NOT NULL  
); 

CREATE TABLE Documento 
( 
 ID INT PRIMARY KEY,  
 Tipo_de_Documento VARCHAR(255) NOT NULL,  
 Data_de_Emissao DATE NOT NULL,  
 Data_de_Recebimento DATE NOT NULL,  
 Organizacao_Emissora VARCHAR(255) NOT NULL,  
 Destinatario VARCHAR(255) NOT NULL,  
 Responsavel_pela_Emissao VARCHAR(255) NOT NULL,  
 Assunto_Principal VARCHAR(255) NOT NULL,  
 Outros_Descritores VARCHAR(255) NOT NULL,
 Numero_da_Pasta INT NOT NULL, 
 idFicha_de_Circulacao INT NOT NULL  
); 

CREATE TABLE Ficha_de_Circulacao 
( 
 ID INT PRIMARY KEY,  
 Origem VARCHAR(255) NOT NULL,  
 Destino VARCHAR(255) NOT NULL,  
 Material_a_Circular VARCHAR(255) NOT NULL,  
 Motivo_da_Circulacao VARCHAR(255) NOT NULL,  
 Data DATE NOT NULL,  
 Numero_da_Pasta INT NOT NULL,  
 Assinaturas_Origem INT NOT NULL,  
 Assinaturas_Destino INT  
); 

CREATE TABLE Usuario 
( 
 ID INT PRIMARY KEY,  
 Nome VARCHAR(255) NOT NULL,  
 Endereco VARCHAR(255) NOT NULL,  
 Email VARCHAR(255) NOT NULL,  
 idSetor INT NOT NULL  
); 

CREATE TABLE Setor 
( 
 ID INT PRIMARY KEY,  
 Nome_do_Setor VARCHAR(255) NOT NULL,  
 Descricao_Setor VARCHAR(255) NOT NULL  
);


--Vinculação das tabelas com as chaves estrangeiras
ALTER TABLE Documento ADD FOREIGN KEY(idFicha_de_Circulacao) REFERENCES Ficha_de_Circulacao (ID)
ALTER TABLE Documento ADD FOREIGN KEY(Numero_da_Pasta) REFERENCES Pasta_de_Documentos (Numero_da_Pasta)
ALTER TABLE Ficha_de_Circulacao ADD FOREIGN KEY(Numero_da_Pasta) REFERENCES Pasta_de_Documentos (Numero_da_Pasta)
ALTER TABLE Ficha_de_Circulacao ADD FOREIGN KEY(Assinaturas_Origem) REFERENCES Usuario (ID)
ALTER TABLE Ficha_de_Circulacao ADD FOREIGN KEY(Assinaturas_Destino) REFERENCES Usuario (ID)
ALTER TABLE Usuario ADD FOREIGN KEY(idSetor) REFERENCES Setor (ID)



-- Inserir dados na tabela Setor
INSERT INTO Setor (ID, Nome_do_Setor, Descricao_Setor)
VALUES
    (1, 'Recursos Humanos', 'Setor de Recursos Humanos'),
    (2, 'Tecnologia da Informação', 'Setor de TI'),
    (3, 'Financeiro', 'Departamento Financeiro'),
    (4, 'Vendas', 'Equipe de Vendas'),
    (5, 'Produção', 'Setor de Produção'),
    (6, 'Logística', 'Logística e Transporte'),
    (7, 'Marketing', 'Departamento de Marketing'),
    (8, 'Jurídico', 'Departamento Jurídico');

-- Inserir dados na tabela Usuario
INSERT INTO Usuario (ID, Nome, Endereco, Email, idSetor)
VALUES
    (1, 'João Silva', 'Rua A, 123', 'joao@email.com', 1),
    (2, 'Maria Santos', 'Av. B, 456', 'maria@email.com', 2),
    (3, 'Carlos Souza', 'Rua C, 789', 'carlos@email.com', 3),
    (4, 'Ana Pereira', 'Av. D, 101', 'ana@email.com', 1),
    (5, 'Pedro Ferreira', 'Rua E, 202', 'pedro@email.com', 4),
    (6, 'Lucia Lima', 'Av. F, 303', 'lucia@email.com', 5),
    (7, 'Marcos Oliveira', 'Rua G, 404', 'marcos@email.com', 3),
    (8, 'Cristina Alves', 'Av. H, 505', 'cristina@email.com', 2);

-- Inserir dados na tabela Pasta_de_Documentos
INSERT INTO Pasta_de_Documentos (Numero_da_Pasta, Data_de_Criacao, Assunto_Principal)
VALUES
    (1, '2023-01-01', 'Documentos de RH'),
    (2, '2023-02-15', 'Documentos de Vendas'),
    (3, '2023-03-10', 'Documentos Financeiros'),
    (4, '2023-04-20', 'Documentos de TI'),
    (5, '2023-05-05', 'Documentos de Marketing'),
    (6, '2023-06-30', 'Documentos de Produção'),
    (7, '2023-07-22', 'Documentos Jurídicos'),
    (8, '2023-08-18', 'Documentos de Logística');

-- Inserir dados na tabela Ficha_de_Circulacao
INSERT INTO Ficha_de_Circulacao (ID, Origem, Destino, Material_a_Circular, Motivo_da_Circulacao, Data, Numero_da_Pasta, Assinaturas_Origem, Assinaturas_Destino)
VALUES
    (1, 'Setor A', 'Setor B', 'Relatório', 'Revisão', '2023-01-10', 1, 2, 3),
    (2, 'Setor B', 'Setor C', 'Contrato', 'Aprovação', '2023-02-20', 2, 3, 1),
    (3, 'Setor C', 'Setor D', 'Apresentação', 'Análise', '2023-03-15', 3, 1, 2),
    (4, 'Setor D', 'Setor A', 'Proposta', 'Revisão', '2023-04-25', 4, 2, 3),
    (5, 'Setor E', 'Setor F', 'Orçamento', 'Aprovação', '2023-05-15', 5, 3, 1),
    (6, 'Setor F', 'Setor G', 'Relatório', 'Análise', '2023-06-05', 6, 1, 2),
    (7, 'Setor G', 'Setor H', 'Contrato', 'Revisão', '2023-07-30', 7, 2, 3),
    (8, 'Setor H', 'Setor A', 'Apresentação', 'Aprovação', '2023-08-28', 8, 3, 1);

-- Inserir dados na tabela Documento
INSERT INTO Documento (ID, Tipo_de_Documento, Data_de_Emissao, Data_de_Recebimento, Organizacao_Emissora, Destinatario, Responsavel_pela_Emissao, Assunto_Principal, Outros_Descritores, Numero_da_Pasta, idFicha_de_Circulacao)
VALUES
    (1, 'Ofício', '2023-01-02', '2023-01-12', 'Empresa X', 'Setor A', 'João Silva', 'Ofício de RH', 'RH', 1, 1),
    (2, 'Contrato', '2023-02-16', '2023-02-25', 'Empresa Y', 'Setor B', 'Maria Santos', 'Contrato de Vendas', 'Vendas', 2, 2),
    (3, 'Nota Fiscal', '2023-03-11', '2023-03-20', 'Empresa Z', 'Setor C', 'Carlos Souza', 'Nota Fiscal', 'Financeiro', 3, 3),
    (4, 'Relatório', '2023-04-21', '2023-04-30', 'Empresa A', 'Setor D', 'Ana Pereira', 'Relatório de TI', 'TI', 4, 4),
    (5, 'Apresentação', '2023-05-06', '2023-05-16', 'Empresa B', 'Setor E', 'Pedro Ferreira', 'Apresentação de Marketing', 'Marketing', 5, 5),
    (6, 'Proposta', '2023-06-01', '2023-06-10', 'Empresa C', 'Setor F', 'Lucia Lima', 'Proposta de Produção', 'Produção', 6, 6),
    (7, 'Contrato', '2023-07-23', '2023-08-01', 'Empresa D', 'Setor G', 'Marcos Oliveira', 'Contrato Jurídico', 'Jurídico', 7, 7),
    (8, 'Ofício', '2023-08-19', '2023-08-29', 'Empresa E', 'Setor H', 'Cristina Alves', 'Ofício de Logística', 'Logística', 8, 8);

select * from documento
select * from Ficha_de_circulacao
select * from pasta_de_documentos
select * from setor
select * from usuario

--Consultas ao Banco
-- consulta para responder a 1ª pergunta do artigo.
--Que pasta trata de determinado assunto? no caso Documentos Financeiros

SELECT Numero_da_Pasta, Assunto_Principal
FROM Pasta_de_Documentos
WHERE Assunto_Principal = 'Documentos Financeiros';

-- consulta para responder a 2ª pergunta do artigo.
--juntando com a primeira questão e incrementando onde esta a pasta

SELECT pd.Numero_da_Pasta, pd.Assunto_Principal, fc.Origem
FROM Pasta_de_Documentos pd
INNER JOIN Ficha_de_Circulacao fc ON pd.Numero_da_Pasta = fc.Numero_da_Pasta
WHERE pd.Assunto_Principal = 'Documentos Financeiros';

-- consulta para responder a 3ª pergunta do artigo.
--A pergunta agora é a quanto tempo a pasta com assunto Documentos Financeiros está no Setor C
SELECT 
    pd.Numero_da_Pasta, 
    pd.Assunto_Principal, 
    fc.Origem AS Local_Especifico,
    CURRENT_DATE - MAX(fc.Data) AS Tempo_em_Dias
FROM Pasta_de_Documentos pd
INNER JOIN Ficha_de_Circulacao fc ON pd.Numero_da_Pasta = fc.Numero_da_Pasta
WHERE pd.Assunto_Principal = 'Documentos Financeiros' 
      AND fc.Origem = 'Setor C'
GROUP BY pd.Numero_da_Pasta, pd.Assunto_Principal, fc.Origem;

-- consulta para responder a 4ª pergunta.

SELECT u.Nome AS Nome_do_Usuario
FROM Usuario u
INNER JOIN Ficha_de_Circulacao fc ON u.ID = fc.Assinaturas_Origem
INNER JOIN Documento d ON fc.ID = d.idFicha_de_Circulacao
WHERE d.Tipo_de_Documento = 'Ofício'
      AND d.Organizacao_Emissora = 'Empresa X';
	  
-- consulta para responder a 5ª pergunta.

SELECT d.Tipo_de_Documento AS Nome_do_Documento, 
       d.Assunto_Principal AS Assunto_do_Documento,
       d.Data_de_Emissao AS Data_de_Emissao
FROM Documento d
INNER JOIN Usuario u ON d.Responsavel_pela_Emissao = u.Nome
WHERE u.Nome = 'Pedro Ferreira';

-- consulta para responder a 6ª pergunta.
--Quais são os documentos que cada um dos usuários assinou e para qual setor foi designado?

SELECT u.Nome AS Nome_do_Usuario, 
       d.Tipo_de_Documento AS Nome_do_Documento, 
       d.Assunto_Principal AS Assunto_do_Documento,
       d.Data_de_Emissao AS Data_de_Emissao,
       s.Nome_do_Setor AS Setor_Designado
FROM Documento d
INNER JOIN Usuario u ON d.Responsavel_pela_Emissao = u.Nome
INNER JOIN Setor s ON u.idSetor = s.ID;