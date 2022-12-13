-- CRIAÇÃO DAS TABELAS (DDL) --
-------------------------------
-- # TABELAS PRINCIPAIS
-------------------------------

CREATE TABLE Usuario
(
    id          NUMBER          CONSTRAINT PK_Usuario PRIMARY KEY,
    nome        VARCHAR2(100)   NOT NULL,
    email       VARCHAR2(100),
    usuario     VARCHAR2(50)    NOT NULL,
    senha       VARCHAR2(50)    NOT NULL
);

CREATE TABLE Autor
(
    id              NUMBER          CONSTRAINT PK_Autor PRIMARY KEY,
    nome            VARCHAR2(100)   NOT NULL,
    naturalidade    VARCHAR2(50),
    biografia       VARCHAR2(500)
);

CREATE TABLE Genero
(
    id          NUMBER          CONSTRAINT PK_Genero PRIMARY KEY,
    nome        VARCHAR2(100)   NOT NULL,
    descricao   VARCHAR2(200)
);

CREATE TABLE Colecao
(
    id          NUMBER          CONSTRAINT PK_Colecao PRIMARY KEY,
    nome        VARCHAR2(100)   NOT NULL
);

CREATE TABLE Editora
(
    id              NUMBER          CONSTRAINT PK_Editora PRIMARY KEY,
    nome            VARCHAR2(100)   NOT NULL,
    site            VARCHAR2(100),
    email           VARCHAR2(100),
    naturalidade    VARCHAR2(50)
);

CREATE TABLE Livro
(
    id              NUMBER          CONSTRAINT PK_Livro PRIMARY KEY,
    nome            VARCHAR2(100)   NOT NULL,
    edicao          VARCHAR2(50)    NOT NULL,
    ano             NUMBER          NOT NULL,
    idioma          VARCHAR2(50)    NOT NULL,
    sinopse         VARCHAR2(500),
    quant_paginas   NUMBER          NOT NULL,
    editora_id      NUMBER,
    colecao_id      NUMBER,

    CONSTRAINT FK_Editora_TO_Livro
        FOREIGN KEY (editora_id)
        REFERENCES Editora (id),
    CONSTRAINT FK_Colecao_TO_Livro
        FOREIGN KEY (colecao_id)
        REFERENCES Colecao (id)
);

-------------------------------
-- # TABELAS 1:N
-------------------------------

CREATE TABLE Editora_Telefone
(
    id          NUMBER          CONSTRAINT PK_Editora_Telefone PRIMARY KEY,
    editora_id  NUMBER          NOT NULL,
    numero      VARCHAR2(50)    NOT NULL,
    
    CONSTRAINT FK_Editora_TO_Telefone
        FOREIGN KEY (editora_id)
        REFERENCES Editora (id)
);

CREATE TABLE Livro_Arquivo
(
    id          NUMBER      CONSTRAINT PK_Livro_Arquivo PRIMARY KEY,
    livro_id    NUMBER      NOT NULL,
    arquivo     BLOB        NOT NULL,
    
    CONSTRAINT FK_Livro_TO_Arquivo
        FOREIGN KEY (livro_id)
        REFERENCES Livro (id)
);

-------------------------------
-- # TABELAS N:N
-------------------------------

CREATE TABLE Progresso_Leitura
(
    usuario_id      NUMBER          NOT NULL,
    livro_id        NUMBER          NOT NULL,
    pagina_atual    NUMBER          NOT NULL,
    status          VARCHAR2(50)    NOT NULL,
    
    CONSTRAINT PK_Progresso_Leitura
        PRIMARY KEY (usuario_id, livro_id),
    CONSTRAINT FK_Usuario_TO_Progresso
        FOREIGN KEY (usuario_id)
        REFERENCES Usuario (id),
    CONSTRAINT FK_Livro_TO_Progresso
        FOREIGN KEY (livro_id)
        REFERENCES Livro (id)
);

CREATE TABLE Livro_Autor
(
    livro_id    NUMBER      NOT NULL,
    autor_id    NUMBER      NOT NULL,
    
    CONSTRAINT PK_Livro_Autor
        PRIMARY KEY (livro_id, autor_id),
    CONSTRAINT FK_Livro_TO_Livro_Autor
        FOREIGN KEY (livro_id)
        REFERENCES Livro (id),
    CONSTRAINT FK_Autor_TO_Livro_Autor
        FOREIGN KEY (autor_id)
        REFERENCES Autor (id)
);

CREATE TABLE Livro_Genero
(
    livro_id    NUMBER      NOT NULL,
    genero_id   NUMBER      NOT NULL,
    
    CONSTRAINT PK_Livro_Genero
        PRIMARY KEY (livro_id, genero_id),
    CONSTRAINT FK_Livro_TO_Livro_Genero
        FOREIGN KEY (livro_id)
        REFERENCES Livro (id),
    CONSTRAINT FK_Genero_TO_Livro_Genero
        FOREIGN KEY (genero_id)
        REFERENCES Genero (id)
);

-------------------------------
-- # SEQUÊNCIAS (Auto numeração)
-------------------------------

CREATE SEQUENCE SEQ_Usuario
START WITH 1
INCREMENT BY 1;

CREATE SEQUENCE SEQ_Autor
START WITH 1
INCREMENT BY 1;

CREATE SEQUENCE SEQ_Genero
START WITH 1
INCREMENT BY 1;

CREATE SEQUENCE SEQ_Colecao
START WITH 1
INCREMENT BY 1;

CREATE SEQUENCE SEQ_Editora
START WITH 1
INCREMENT BY 1;

CREATE SEQUENCE SEQ_Livro
START WITH 1
INCREMENT BY 1;

CREATE SEQUENCE SEQ_Editora_Telefone
START WITH 1
INCREMENT BY 1;

CREATE SEQUENCE SEQ_Livro_Arquivo
START WITH 1
INCREMENT BY 1;