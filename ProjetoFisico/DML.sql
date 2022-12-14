-- INSERÇÃO DE DADOS NAS TABELAS (DML) --
-------------------------------
-- # USUARIOS
-------------------------------

INSERT INTO Usuario VALUES (1, 'Filipe', 'filipe@gmail.com', 'filipe01', '12345');
INSERT INTO Usuario VALUES (2, 'José', 'jose@gmail.com', 'jose24', '23212');
INSERT INTO Usuario VALUES (3, 'Aurora', 'aurora@gmail.com', 'aurora05', '45678');
INSERT INTO Usuario VALUES (4, 'Helena', 'helena@gmail.com', 'helena23', '78562');
INSERT INTO Usuario VALUES (5, 'Messi', 'messi@gmail.com', 'messi10', '20221');

-------------------------------
-- # AUTORES
-------------------------------

INSERT INTO Autor VALUES (1, 'Jane Austen', 'Inglaterra', 'Jane Austen (1775-1817) foi uma escritora inglesa, considerada uma das maiores romancistas da literatura inglesas do século XIX.');
INSERT INTO Autor VALUES (2, 'Antoine de Saint-Exupéry', 'França', 'Antoine de Saint Exupéry (1900-1944) foi um escritor, ilustrador e piloto francês, é o autor de um clássico da literatura “O Pequeno Príncipe”, escrito em 1943.');
INSERT INTO Autor VALUES (3, 'Joaquim Maria Machado de Assis', 'Brasil', 'Machado de Assis (1839-1908) foi um escritor brasileiro, um dos nomes mais importantes da literatura brasileira do século XIX.');
INSERT INTO Autor VALUES (4, 'William Shakespeare', 'Inglaterra', 'William Shakespeare (1564-1616) foi um dramaturgo e poeta inglês. Autor de tragédias famosas como "Hamlet", "Otelo", "Macbeth" e "Romeu e Julieta", foi considerado uma das maiores figuras literárias da língua inglesa.');
INSERT INTO Autor VALUES (5, 'Colleen Hoover', 'Estados Unidos', 'Colleen Hoover é uma escritora norte-americana de livros de romance e ficção voltada para o público jovem adulto. Muitas de suas obras são baseadas em histórias reais que aconteceram com pessoas próximas e até mesmo com ela.');
INSERT INTO Autor VALUES (6, 'Arthur Ignatius Conan Doyle', 'Reino Unido', 'Arthur Conan Doyle (1859-1930) foi um escritor e médico britânico, autor das histórias do imortal detetive Sherlock Holmes que superou a fama de seu criador.');

-------------------------------
-- # GENEROS
-------------------------------

INSERT INTO Genero (id, nome) VALUES (1, 'Romance');
INSERT INTO Genero (id, nome) VALUES (2, 'Literatura Infantil');
INSERT INTO Genero (id, nome) VALUES (3, 'Ficção');
INSERT INTO Genero (id, nome) VALUES (4, 'Suspense');
INSERT INTO Genero (id, nome) VALUES (5, 'História de detetives');

-------------------------------
-- # COLECOES
-------------------------------

INSERT INTO Colecao VALUES (1, 'Sherlock Holmes');

-------------------------------
-- # EDITORAS
-------------------------------

INSERT INTO Editora (id, nome) VALUES (1, 'Principis');
INSERT INTO Editora (id, nome) VALUES (2, 'Companhia da Letras');

-------------------------------
-- # RELACIONANDO EDITORAS E SEUS TELEFONES
-------------------------------

INSERT INTO Editora_Telefone VALUES (1, 1, '(51) 9-0000-0000');
INSERT INTO Editora_Telefone VALUES (2, 1, '(54) 9-0000-0000');
INSERT INTO Editora_Telefone VALUES (3, 1, '(48) 9-0000-0000');

-------------------------------
-- # LIVROS
-------------------------------

INSERT INTO Livro (id, nome, edicao, ano, idioma, quant_paginas) VALUES (1, 'Orgulho e preconceito', '1ª edição', 2018, 'Português', 424);
INSERT INTO Livro (id, nome, edicao, ano, idioma, quant_paginas) VALUES (2, 'O pequeno príncipe', '1ª edição', 2018, 'Português', 96);
INSERT INTO Livro (id, nome, edicao, ano, idioma, quant_paginas) VALUES (3, 'Le Petit Prince', 'Edição em francês', 2012, 'Francês', 96);
INSERT INTO Livro (id, nome, edicao, ano, idioma, quant_paginas) VALUES (4, 'Romeo and Juliet', 'Reissue edição', 2011, 'Inglês', 320);
INSERT INTO Livro (id, nome, edicao, ano, idioma, quant_paginas) VALUES (5, 'Dom Casmurro', '1ª edição', 2022, 'Português', 464);

INSERT INTO Livro (id, nome, edicao, ano, idioma, quant_paginas, editora_id, colecao_id) VALUES (6, 'A volta de Sherlock Holmes', '1ª edição', 2021, 'Português', 352, 1, 1);
INSERT INTO Livro (id, nome, edicao, ano, idioma, quant_paginas, editora_id, colecao_id) VALUES (7, 'O último caso de Sherlock Holmes', '1ª edição', 2021, 'Português', 192, 1, 1);
INSERT INTO Livro (id, nome, edicao, ano, idioma, quant_paginas, editora_id, colecao_id) VALUES (8, 'Mais aventuras de Sherlock Holmes', '1ª edição', 2019, 'Português', 208, 1, 1);
INSERT INTO Livro (id, nome, edicao, ano, idioma, quant_paginas, editora_id, colecao_id) VALUES (9, 'Sherlock Holmes - O cão dos Baskerville', '1ª edição', 2019, 'Português', 224, 1, 1);

-------------------------------
-- # RELACIONANDO LIVROS E SEUS AUTORES
-------------------------------

INSERT INTO Livro_Autor VALUES (1, 1);
INSERT INTO Livro_Autor VALUES (2, 2);
INSERT INTO Livro_Autor VALUES (3, 2);
INSERT INTO Livro_Autor VALUES (4, 4);
INSERT INTO Livro_Autor VALUES (5, 3);
INSERT INTO Livro_Autor VALUES (6, 6);
INSERT INTO Livro_Autor VALUES (7, 6);
INSERT INTO Livro_Autor VALUES (8, 6);
INSERT INTO Livro_Autor VALUES (9, 6);

-------------------------------
-- # RELACIONANDO LIVROS E SEUS GENEROS
-------------------------------

INSERT INTO Livro_Genero VALUES (1, 1);
INSERT INTO Livro_Genero VALUES (2, 2);
INSERT INTO Livro_Genero VALUES (3, 2);
INSERT INTO Livro_Genero VALUES (4, 1);
INSERT INTO Livro_Genero VALUES (5, 1);
INSERT INTO Livro_Genero VALUES (5, 3);
INSERT INTO Livro_Genero VALUES (6, 4);
INSERT INTO Livro_Genero VALUES (6, 5);
INSERT INTO Livro_Genero VALUES (7, 1);
INSERT INTO Livro_Genero VALUES (7, 5);
INSERT INTO Livro_Genero VALUES (8, 4);
INSERT INTO Livro_Genero VALUES (8, 5);
INSERT INTO Livro_Genero VALUES (9, 1);
INSERT INTO Livro_Genero VALUES (9, 5);

-------------------------------
-- # PROGRESSOS DE LEITURA DOS USUARIOS
-------------------------------

INSERT INTO Progresso_Leitura VALUES (1, 9, 104, 'Em andamento');
INSERT INTO Progresso_Leitura VALUES (1, 4, 300, 'Em andamento');
INSERT INTO Progresso_Leitura VALUES (2, 1, 424, 'Finalizada');
INSERT INTO Progresso_Leitura VALUES (3, 3, 40, 'Em andamento');
INSERT INTO Progresso_Leitura VALUES (4, 5, 464, 'Finalizada');
INSERT INTO Progresso_Leitura VALUES (5, 9, 224, 'Finalizada');