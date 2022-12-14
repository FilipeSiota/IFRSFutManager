-------------------------------
-- # 1. BUSCA OS LIVROS DE UM AUTOR
-------------------------------

SELECT livro.nome as LIVRO, livro.idioma, livro.ano, autor.nome as AUTOR
FROM Livro
INNER JOIN Livro_Autor la ON la.livro_id = livro.id
INNER JOIN Autor ON autor.id = la.autor_id
WHERE autor.nome LIKE 'Antoine%'
ORDER BY livro.ano DESC;

-------------------------------
-- # 2. BUSCA OS LIVROS DE UM GÊNERO ESPECÍFICO
-------------------------------

SELECT livro.nome as LIVRO, livro.ano, gen.nome as GÊNERO
FROM Genero gen
INNER JOIN Livro_Genero lg ON lg.genero_id = gen.id
INNER JOIN Livro ON livro.id = lg.livro_id
WHERE gen.nome = 'História de detetives'
ORDER BY livro.ano ASC;

-------------------------------
-- # 3. BUSCA OS USUÁRIOS QUE JÁ TERMINARAM DE LER ALGUM LIVRO
-------------------------------

SELECT usuario.nome as USUÁRIO, livro.nome as LIVRO, pl.status as STATUS_LEITURA
FROM Usuario 
INNER JOIN Progresso_Leitura pl ON pl.usuario_id = usuario.id
INNER JOIN Livro ON livro.id = pl.livro_id
WHERE pl.status = 'Finalizada';

-------------------------------
-- # 4. BUSCA OS LIVROS MOSTRANDO O NOME DA EDITORA
-------------------------------

SELECT livro.nome, livro.edicao, editora.nome as EDITORA
FROM Livro
LEFT JOIN Editora ON editora.id = livro.editora_id;

-------------------------------
-- # 5. BUSCA OS ARQUIVOS EM PDF DOS LIVROS
-------------------------------

SELECT livro.nome as LIVRO, livro.idioma, autor.nome as AUTOR, larq.arquivo
FROM Livro
LEFT JOIN Livro_Autor laut ON laut.livro_id = livro.id
LEFT JOIN Autor ON autor.id = laut.autor_id
LEFT JOIN Livro_Arquivo larq ON larq.livro_id = livro.id;

-------------------------------
-- # 6. BUSCA OS LIVROS QUE NÃO SÃO EM PORTUGUÊS
-------------------------------

SELECT livro.nome as LIVRO, livro.idioma, editora.nome as EDITORA, autor.nome as AUTOR
FROM Livro
LEFT JOIN Editora ON editora.id = livro.editora_id
RIGHT JOIN Livro_Autor la ON la.livro_id = livro.id
LEFT JOIN Autor ON autor.id = la.autor_id
WHERE livro.idioma <> 'Português';

-------------------------------
-- # 7. BUSCA OS LIVROS MOSTRANDO SUA EDITORA E COLEÇÃO SE POSSUIR
-------------------------------

SELECT livro.nome as LIVRO, livro.edicao, livro.ano, livro.idioma, livro.sinopse, livro.quant_paginas as NÚMERO_PÁGINAS, editora.nome as EDITORA, colecao.nome as COLEÇÃO
FROM Livro
LEFT JOIN Editora ON editora.id = livro.editora_id
LEFT JOIN Colecao ON colecao.id = livro.colecao_id;

-------------------------------
-- # 8. BUSCA OS LIVROS DE UMA COLEÇÃO
-------------------------------

SELECT livro.nome as LIVRO, livro.edicao, livro.ano, livro.idioma, livro.sinopse, livro.quant_paginas as NÚMERO_PÁGINAS, colecao.nome as COLEÇÃO
FROM Livro
INNER JOIN Colecao ON colecao.id = livro.colecao_id
ORDER BY colecao.nome, livro.ano;

-------------------------------
-- # 9. MOSTRA QUANTAS PÁGINAS UMA COLEÇÃO DE LIVROS POSSUI
-------------------------------

SELECT colecao.nome as COLEÇÃO, SUM(livro.quant_paginas) as TOTAL_DE_PÁGINAS
FROM Colecao
INNER JOIN Livro ON livro.colecao_id = colecao.id
GROUP BY colecao.nome;

-------------------------------
-- # 10. MOSTRA QUANTAS PÁGINAS CADA USUÁRIO JÁ LEU
-------------------------------

SELECT usuario.nome as USUÁRIO, SUM(pl.pagina_atual) as PÁGINAS_LIDAS
FROM Usuario
INNER JOIN Progresso_Leitura pl ON pl.usuario_id = usuario.id
GROUP BY usuario.nome
ORDER BY SUM(pl.pagina_atual) DESC;

-------------------------------
-- # 11. MOSTRA OS GÊNEROS MAIS LIDOS (VIEW)
-------------------------------

CREATE VIEW Generos_Mais_Lidos_View as
SELECT genero.nome as GÊNERO, COUNT(pl.livro_id) as QUANTIDADE_LIVROS
FROM Genero
INNER JOIN Livro_Genero lg ON lg.genero_id = genero.id
INNER JOIN Livro ON livro.id = lg.livro_id
INNER JOIN Progresso_Leitura pl ON pl.livro_id = livro.id
GROUP BY genero.nome
ORDER BY COUNT(pl.livro_id) DESC;

-------------------------------
-- # 12. MOSTRA OS LIVROS MAIS LIDOS (VIEW)
-------------------------------

CREATE VIEW Livros_Mais_Lidos_View as
SELECT livro.nome as LIVRO, COUNT(pl.livro_id) as VEZES_LIDAS
FROM Livro
INNER JOIN Progresso_Leitura pl ON pl.livro_id = livro.id
GROUP BY livro.nome
ORDER BY COUNT(pl.livro_id) DESC;

-------------------------------
-- # 13. MOSTRA O NÚMERO DE LIVROS POR GÊNERO
-------------------------------

SELECT genero.nome as GÊNERO, COUNT(livro.id) as QUANTIDADE_LIVROS
FROM Genero
LEFT JOIN Livro_Genero lg ON lg.genero_id = genero.id
LEFT JOIN Livro ON livro.id = lg.livro_id
GROUP BY genero.nome
ORDER BY COUNT(livro.id) DESC;

-------------------------------
-- # 14. MOSTRA OS AUTORES MAIS LIDOS
-------------------------------

SELECT autor.nome as AUTOR, COUNT(pl.livro_id) as LIVROS_LIDOS
FROM Autor
INNER JOIN Livro_Autor la ON la.autor_id = autor.id
INNER JOIN Livro ON livro.id = la.livro_id
INNER JOIN Progresso_Leitura pl ON pl.livro_id = livro.id
GROUP BY autor.nome
ORDER BY COUNT(pl.livro_id) DESC;

-------------------------------
-- # 15. MOSTRA O PERCENTUAL DE LEITURA DE CADA USUARIO PARA CADA LIVRO QUE ELE LEU OU ESTÁ LENDO
-------------------------------

SELECT usuario.nome as USUARIO, livro.nome as LIVRO, pl.pagina_atual as LIDO, livro.quant_paginas as TOTAL, ROUND(pl.pagina_atual / livro.quant_paginas * 100, 2) as PERCENTUAL_DE_LEITURA
FROM Usuario
INNER JOIN Progresso_Leitura pl ON pl.usuario_id = usuario.id
INNER JOIN Livro ON livro.id = pl.livro_id;

-------------------------------
-- # 16. MOSTRA O NÚMERO DE LIVROS POR AUTOR
-------------------------------

SELECT autor.nome as AUTOR, COUNT(livro.id) as QUANTIDADE_LIVROS
FROM Autor
LEFT JOIN Livro_Autor la ON la.autor_id = autor.id
LEFT JOIN Livro ON livro.id = la.livro_id
GROUP BY autor.nome
ORDER BY COUNT(livro.id) DESC;

-------------------------------
-- # 17. MOSTRA O NÚMERO DE LIVROS POR IDIOMA
-------------------------------

SELECT livro.idioma as IDIOMA, COUNT(livro.id) as QUANTIDADE_LIVROS
FROM Livro
GROUP BY livro.idioma
ORDER BY COUNT(livro.id) DESC;

-------------------------------
-- # 18. MOSTRA O NÚMERO DE AUTORES POR PAÍS
-------------------------------

SELECT autor.naturalidade as PAÍS, ROUND(COUNT(autor.naturalidade) / (SELECT COUNT(autor.id) FROM Autor) * 100, 2) as PERCENTUAL_DE_AUTORES
FROM Autor
GROUP BY autor.naturalidade
ORDER BY COUNT(autor.naturalidade) DESC, autor.naturalidade ASC;

-------------------------------
-- # 19. MOSTRA OS NÚMEROS DE TELEFONE DAS EDITORAS
-------------------------------

SELECT editora.nome as EDITORA, et.numero as TELEFONE
FROM Editora
LEFT JOIN Editora_Telefone et ON et.editora_id = editora.id;

-------------------------------
-- # 20. MOSTRA O NÚMERO DE LIVROS POR COLEÇÃO
-------------------------------

SELECT colecao.nome as COLEÇÃO, COUNT(livro.colecao_id) as QUANTIDADE_LIVROS
FROM Colecao
LEFT JOIN Livro ON livro.colecao_id = colecao.id
GROUP BY colecao.nome
ORDER BY COUNT(livro.colecao_id) DESC, colecao.nome ASC;

-------------------------------
-- # 21. MOSTRA A QUANTIDADE DE ARQUIVOS PDF POR LIVRO
-------------------------------

SELECT livro.nome as LIVRO, COUNT(larq.id) as NÚMERO_DE_ARQUIVOS
FROM Livro
LEFT JOIN Livro_Arquivo larq ON larq.livro_id = livro.id
GROUP BY livro.nome;

-------------------------------
-- # 22. MOSTRA A QUANTIDADE DE LIVROS LIDOS (FINALIZADOS) POR USUÁRIO
-------------------------------

SELECT usuario.nome as USUÁRIO, COUNT(pl.usuario_id) as LIVROS_LIDOS
FROM Usuario
LEFT JOIN Progresso_Leitura pl ON pl.usuario_id = usuario.id
WHERE pl.status = 'Finalizada'
GROUP BY usuario.nome
ORDER BY usuario.nome ASC;