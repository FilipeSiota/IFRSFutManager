-- CRIAÇÃO DAS TABELAS (DDL) --

CREATE TABLE Usuario
(
    id      NUMBER PK_Usuario PRIMARY KEY,
    nome    VARCHAR2(100)   NOT NULL,
    email   VARCHAR2(100),
    usuario VARCHAR2(50)    NOT NULL,
    senha   VARCHAR2(50)    NOT NULL
);

CREATE TABLE Livro
(
    id              NUMBER PK_Livro PRIMARY KEY,
    nome            VARCHAR2(100)   NOT NULL,
    edicao          VARCHAR2(50)    NOT NULL,
    ano             NUMBER          NOT NULL,
    idioma          VARCHAR2(50)    NOT NULL,
    sinopse         VARCHAR2(500),
    quant_paginas   NUMBER          NOT NULL,
    editora_id      NUMBER,
    colecao_id      NUMBER
);

