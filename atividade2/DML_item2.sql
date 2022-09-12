# DML Item 2

INSERT INTO 
	tb_alunos (MAT, nome, endereco, cidade) 
VALUES 
	(2015010101, 'JOSE DE ALENCAR', 'RUA DAS ALMAS', 'NATAL'),
	(2015010102, 'JOÃO JOSÉ', 'AVENIDA RUY CARNEIRO', 'JOÃO PESSOA'),
	(2015010103, 'MARIA JOAQUINA', 'RUA CARROSSEL', 'RECIFE'),
	(2015010104, 'MARIA DAS DORES', 'RUA DAS LADEIRAS', 'FORTALEZA'),
	(2015010105, 'JOSUÉ CLAUDINO DOS SANTOS', 'CENTRO', 'NATAL'),
	(2015010106, 'JOSUÉLISSON CLAUDINO DOS SANTOS', 'CENTRO', 'NATAL');


INSERT INTO 
	tb_disciplinas (COD_DISC, descricao, carga_horaria) 
VALUES
	('BD', 'BANCO DE DADOS', 100),
	('POO', 'PROGRAMAÇÃO ORIENTADA A OBJETOS', 100),
	('WEB', 'DESENVOLVIMENTO WEB', 50),
	('ENG', 'ENGENHARIA DE SOFTWARE', 80);


INSERT INTO
	tb_professores (COD_PROF, nome, endereco, cidade)
VALUES
	(212131, 'NICKERSON FERREIRA', 'RUA MANAÍRA', 'JOÃO PESSOA'),
	(122135, 'ADORILSON BEZERRA', 'AVENIDA SALGADO FILHO', 'NATAL'),
	(192011, 'DIEGO OLIVEIRA', 'AVENIDA ROBERTO FREIRE', 'NATAL');
    

INSERT INTO
	tb_turmas (COD_TURMA, ano, horario, COD_DISC, COD_PROF)
VALUES
	(1, 2015, '11H-12H', 'BD', '212131'),
	(2, 2015, '13H-14H', 'BD', '212131'),
	(1, 2015, '08H-09H', 'POO', '192011'),
	(1, 2015, '07H-08H', 'WEB', '192011'),
	(1, 2015, '10H-11H', 'ENG', '122135');


INSERT INTO 
	tb_historico (frequencia, nota, MAT_ALUNO, ID_TURMA)
VALUES
	(100.0, 7.5, 2015010101, 1),
    (100.0, 8.0, 2015010101, 3),
    (100.0, 9.0, 2015010101, 4),
    (100.0, 7.0, 2015010101, 5),
    (75.0, 6.5, 2015010102, 1),
    (100.0, 7.0, 2015010102, 3),
    (90.0, 8.0, 2015010102, 4),
    (100.0, 4.0, 2015010102, 5),
    (100.0, 6.0, 2015010103, 1),
    (100.0, 5.5, 2015010103, 3),
    (100.0, 3.0, 2015010103, 4),
    (100.0, 4.7, 2015010103, 5),
    (100.0, 4.0, 2015010104, 1),
    (100.0, 8.5, 2015010104, 3),
    (100.0, 7.5, 2015010104, 4),
    (100.0, 4.0, 2015010104, 5),
    (100.0, 4.9, 2015010105, 1),
    (100.0, 7.0, 2015010105, 3),
    (100.0, 9.0, 2015010105, 4),
    (100.0, 7.0, 2015010105, 5),
    (100.0, 4.4, 2015010106, 1),
    (100.0, 7.0, 2015010106, 3),
    (100.0, 7.0, 2015010106, 4),
    (100.0, 6.0, 2015010106, 5);
    

# Item A ------------------------------------------------------------------------------------
SELECT 
	tb_historico.MAT_ALUNO as Matrícula
#    tb_historico.nota as Nota,
#    tb_turmas.COD_DISC as Disciplina
	FROM tb_historico
INNER JOIN tb_turmas 
	ON tb_historico.ID_TURMA = tb_turmas.ID
WHERE 
	tb_turmas.ano = 2015 AND tb_historico.nota < 5 AND tb_turmas.COD_DISC = 'BD';


# Item B ------------------------------------------------------------------------------------
SELECT
	tb_historico.MAT_ALUNO as `Matrícula`,
    tb_historico.nota as `Nota`,
    tb_turmas.COD_DISC as `Disciplina`
	FROM tb_historico
LEFT JOIN tb_turmas 
	ON tb_historico.ID_TURMA = tb_turmas.ID
WHERE 
	tb_turmas.ano = 2015 AND tb_turmas.COD_DISC = 'POO';

SELECT
    AVG(tb_historico.nota) as `Média da Nota`,
    tb_turmas.COD_DISC as `Disciplina`
	FROM tb_historico
LEFT JOIN tb_turmas 
	ON tb_historico.ID_TURMA = tb_turmas.ID
WHERE 
	tb_turmas.ano = 2015 AND tb_turmas.COD_DISC = 'POO'
GROUP BY tb_turmas.ID;


# Item C ------------------------------------------------------------------------------------
SELECT
	tb_historico.MAT_ALUNO as `Matrícula`,
    tb_historico.nota as `Nota`,
    tb_turmas.COD_DISC as `Disciplina`
	FROM tb_historico
LEFT JOIN tb_turmas 
	ON tb_historico.ID_TURMA = tb_turmas.ID
WHERE 
	tb_turmas.COD_DISC = 'POO';

SELECT
    AVG(tb_historico.nota) as `Média da Nota`,
    tb_turmas.COD_DISC as `Disciplina`
	FROM tb_historico
INNER JOIN tb_turmas 
	ON tb_historico.ID_TURMA = tb_turmas.ID
WHERE 
	tb_turmas.COD_DISC = 'POO' AND tb_turmas.ano = 2015 
GROUP BY 
	tb_turmas.ID
HAVING 
	AVG(tb_historico.nota) > 6;


# Item D ------------------------------------------------------------------------------------
SELECT
	COUNT(*) as `Qdte de alunos que não moram na cidade de Natal` 
FROM tb_alunos
WHERE 
	NOT cidade = 'NATAL';



    
