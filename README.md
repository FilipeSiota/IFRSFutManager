# Trabalho de Banco de Dados

- [Trabalho de Banco de Dados](#trabalho-de-banco-de-dados)
  - [Definição de escopo](#definição-de-escopo)
  - [Potenciais usuários e suas necessidades](#potenciais-usuários-e-suas-necessidades)
  - [Pesquisa inicial de levantamento de informações](#pesquisa-inicial-de-levantamento-de-informações)
  - [Motivação pela escolha do escopo](#motivação-pela-escolha-do-escopo)
  - [Levantamento dos requisitos](#levantamento-dos-requisitos)

## Definição de escopo

Sistema de gerenciamento de jogos para campeonatos interclasse do IFRS Campus Canoas na modalidade de futsal.

## Potenciais usuários e suas necessidades

O público alvo do sistema são os membros docentes e discentes do IFRS Campus Canoas.
Os usuários poderão:

- Participar de um campeonato:
  - Visualizar tabela de classificação;
  - Visualizar os jogos e seus respectivos horários e placares.
- Criar um campeonato:
  - Adicionar equipes e jogadores;
  - Definir a organização do campeonato.

## Pesquisa inicial de levantamento de informações

Sistemas já existentes (disponíveis na PlayStore):

- Copa Fácil: Criador de Torneio;
- iFut;
- Winner - Gerenciar torneios.

## Motivação pela escolha do escopo

Tendo em vista o último interclasse, pensei em desenvolver esse sistema para ajudar na organização e gerenciamento dos jogos para os torneios futuros aqui do campus.

## Levantamento dos requisitos

- Integração com o Moodle do IFRS Campus Canoas:
  - Conseguir buscar os usuários docentes e discentes da instituição.
- Criar, editar e excluir campeonato:
  - Inserir nome;
  - Definir forma de disputa;
  - Criar equipe:
    - Nome;
    - Sigla.
  - Adicionar, editar e excluir equipe:
    - Adicionar e excluir jogadores da equipe.
  - Gerar partidas de acordo com a forma de disputa por sorteio:
    - Times;
    - Local (editável);
    - Horário (editável);
    - Placar (editável);
    - Gerar súmulas eletrônicas que vão sendo atualizadas durante o jogo.
  - Gerar tabela de classificação:
    - Número de jogos;
    - Número de vitórias;
    - Número de empates;
    - Número de derrotas;
    - Gols pró;
    - Gols contra;
    - Saldo de gols.
- Visualizar os campeonatos aos quais o usuário faz parte:
  - O usuário só pode entrar em um campeonato se for adicionado a uma equipe participante pelo organizador.
