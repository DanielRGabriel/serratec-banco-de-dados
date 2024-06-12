create schema exercicio



-- criação da tabela professor
create table exercicio.professor (
    prof_numero int primary key,
    prof_nome varchar(100),
    prof_rua varchar(100),
    prof_cidade varchar(100)
);



-- criação da tabela aluno
create table exercicio.aluno (
    aluno_numero int primary key,
    aluno_nome varchar(100),
    aluno_rua varchar(100),
    aluno_cidade varchar(100)
);

-- criação da tabela disciplina
create table exercicio.disciplina (
    disc_codigo int primary key,
    disc_nome varchar(100),
    curso_nome varchar(100),
    qtd_aulas int
);

-- criação da tabela matricula
create table exercicio.matricula (
    aluno_numero int,
    disc_codigo int,
    ano int,
    primary key (aluno_numero, disc_codigo, ano),
    foreign key (aluno_numero) references exercicio.aluno(aluno_numero),
    foreign key (disc_codigo) references exercicio.disciplina(disc_codigo)
);


-- criação da tabela professor_disciplina
create table exercicio.professor_disciplina (
    disc_codigo int,
    prof_numero int,
    ano int,
    primary key (disc_codigo, prof_numero,ano),
    foreign key (disc_codigo) references exercicio.disciplina(disc_codigo),
    foreign key (prof_numero) references exercicio.professor(prof_numero)
);

select * from exercicio.professor
select * from exercicio.aluno
select * from exercicio.disciplina
select * from exercicio.matricula
select * from exercicio.professor_disciplina 


