# Trabalho de Banco de Dados

- [Trabalho de Banco de Dados](#trabalho-de-banco-de-dados)
  - [Definição de escopo](#definição-de-escopo)
  - [Potenciais usuários e suas necessidades](#potenciais-usuários-e-suas-necessidades)
  - [Pesquisa inicial de levantamento de informações](#pesquisa-inicial-de-levantamento-de-informações)
  - [Motivação pela escolha do escopo](#motivação-pela-escolha-do-escopo)
  - [Levantamento dos requisitos](#levantamento-dos-requisitos)
  - [Tabelas](#tabelas)

## Definição de escopo

Sistema de gerenciamento de leituras.

## Potenciais usuários e suas necessidades

O público alvo são leitores de literatura literária.

- Adicionar arquivos de livros;
- Visualizar leituras concluídas/em andamento/não iniciadas;
- Visualizar autores;
- Criar uma coleção de livros.
  
## Pesquisa inicial de levantamento de informações

Sistemas já existentes (disponíveis na PlayStore):

- ReadEra
- Skoob

## Motivação pela escolha do escopo

Visa organizar as leituras realizadas em Ebooks, pois facilita a portabilidade e manuseio ao longo da leitura. 

## Levantamento dos requisitos

- O usuário poderá editar, adicionar ou exluir arquivos de leitura;
- O usuário poderá criar coleções com os ebooks;
- O usuário pode adicionar a lista de leitura;
- O usuário poderá favoritar suas leituras;
- O usuário poderá visualizar as leituras concluídas/em andamento.

## Tabelas

- Usuário
  - id
  - nome
  - email
  - usuario
  - senha
- Livro
  - id
  - nome
  - autor
  - gênero
  - edição
  - editora
  - ano
  - sinopse
  - status
  - quantidade de páginas
- Autor
  - id
  - nome
  - naturalidade
  - biografia
- Coleção
  - id
  - nome
- Gênero
  - id
  - nome
  - descrição
- Editora
  - id
  - nome
  - site
  - email
  - telefone
  - nacionalidade
- Lista
  - id
- Favorito
- Desejo
