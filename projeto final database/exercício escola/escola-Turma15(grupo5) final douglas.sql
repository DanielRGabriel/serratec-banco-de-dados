--Feito por Allan Lima Angelo

/*1- Crie uma consulta com todas as disciplinas oferecidas no ano de 2018, 
constando os nomes das disciplinas, nomes e cidades dos professores 
responsáveis e nomes dos cursos das disciplinas.
*/

SELECT 
    d.disc_nome AS Nome_Disciplina,
    p.prof_nome AS Nome_Professor,
    p.prof_cidade AS Cidade_Professor,
    d.curso_nome AS Nome_Curso
FROM 
    turma15.disciplina d
JOIN 
    turma15.professor_disciplina pd ON d.disc_codigo = pd.disc_codigo
JOIN 
    turma15.professor p ON pd.prof_numero = p.prof_numero
WHERE 
    pd.ano = '2018';


/*
Feito por Daniel 
2- Crie uma consulta que mostre todos os nomes dos professores do curso de CST Sistemas para Internet,
no ano de 2018, e os nomes das disciplinas pelas quais são responsáveis.*/

SELECT 
   p.prof_nome AS Professor, 
   d.disc_nome AS Disciplina
FROM 
   turma15.professor p
INNER JOIN 
   turma15.professor_disciplina pd ON p.prof_numero = pd.prof_numero
INNER JOIN 
   turma15.disciplina d ON pd.disc_codigo = d.disc_codigo
WHERE
   pd.ano = '2018' AND d.curso_nome = 'CST Sistemas para Internet';

/*
Feito por Raphael Gomes 

3)Crie uma consulta com todos os nomes de alunos matriculados no ano de 2018, 
os nomes das disciplinas em que estão matriculados, a cidade onde moram e os nomes dos cursos das disciplinas.
*/

SELECT 
    a.aluno_nome AS Nome_Aluno,
    d.disc_nome AS Nome_Disciplina,
    a.aluno_cidade AS Cidade,
    d.curso_nome AS Nome_Curso
FROM 
    turma15.aluno a
JOIN 
    turma15.matricula m ON a.aluno_numero = m.aluno_numero
JOIN 
    turma15.disciplina d ON m.disc_codigo = d.disc_codigo
WHERE 
    m.ano = '2018'; 
    


/*
Feito por Marcelo

4)Crie uma consulta que mostre todos os alunos de Palmas que cursam alguma disciplina de Programação de Banco de dados no ano de 2018.
*/

/*
Feito por Douglas França

5)Crie uma consulta que mostre todos os professores que não moram em Palmas e que ministram alguma disciplina no curso de CST Sistemas para Internet.
*/
SELECT DISTINCT p.*
FROM 
	turma15.professor p
JOIN 
	turma15.professor_disciplina pd ON p.prof_numero = pd.prof_numero
JOIN 
	turma15.disciplina d ON pd.disc_codigo = d.disc_codigo
WHERE 
	p.prof_cidade <> 'Palmas'
AND d.curso_nome = 'CST Sistemas para Internet';

/*
Feito por Miguel

6)Crie uma consulta que mostre o nome dos professores o total de aulas que ministram por curso.
*/


/*
Feito por Douglas França

7)Crie uma consulta que mostre o nome do aluno, nome do curso, código e nome das disciplinas matriculadas de todos os alunos no ano de 2018.
*/
SELECT 
	a.aluno_nome, d.curso_nome, d.disc_codigo, d.disc_nome
FROM 
	turma15.aluno a
JOIN 
	turma15.matricula m ON a.aluno_numero = m.aluno_numero
JOIN 
	turma15.disciplina d ON m.disc_codigo = d.disc_codigo
WHERE m.ano = '2018';


