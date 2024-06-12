insert into sistema.cargo
(descricao,salario,carga_horaria)
values
	('Médico veterinário',2800,5),
	('Auxiliar de médico',1400,8),
	('Auxiliar de serviços',1400,8),
	('Recepcionista',1400,8)



insert into sistema.medico
	(nome,cpf,crmv,data_cadastro,data_nascimento,observacao,idcargo)
values
	('Dr. José Fino','12345678911','122545-5', now() ,'15-06-1970','Mestrado e doutorado',1),
	('Dr. Cicolo','52369875412','965526-14',now(),'29-07-1984','',1)

select * from sistema.raca

--renomear nome do campo/coluna
alter table sistema.medico rename column observação to observacao

insert into sistema.tutor
	(nome,cpf,data_cadastro,data_nascimento,observacao)
values
	('Ricardo Oliveira','10977743454', now(),'23-01-1976','Cliente pede desconto'),
	('José da Silva','10977743457', now(),'23-01-1989','Cliente pede desconto'),
	('João Martins','10977743455', now(),'23-01-1978','Cliente pede desconto'),
	('Daniel Ribeiro','10977743452', now(),'23-01-1972','Cliente pede desconto'),
	('Luiza Godinho','10977743451', now(),'23-01-1999','Cliente pede desconto')
	

insert into sistema.especie
(nome)
values
('cachorro'),('gato'),('ave'),('cavalo'),('vaca'),('tartaruga')

insert into sistema.raca
(nome)
values
('Pastor Alemão'),('Dog alemão'),('Pincher'),('Persa'),('Persa'),('Sphynx'),('Chiaua'),
('Manga Larga'),('SRD'),('Caramelo')

insert into sistema.procedimento
	(descricao,observacao,valor)
values
	('Vacinacao',null,50.00),
	('Vermifugação',null,30.00),
	('Vasectomia',null,150.00),
	('Cirurgia de rins',null,750.00),
	('Castração',null,750.00),
	('Tosa',null,50.00),
	('Banho',null,20.00),
	('Cortar unhas',null,20.00),
	('Rotina',null,100.00);
	
insert into sistema.tipos_medicamento
	(descricao)
values
	('vacina'),('vermífugo'),('antibiótico'),('anestesia'),('anti-inflamatório'),('anti-fungo');

INSERT INTO sistema.medicamento 
(nome, validade, laboratorio, fornecedor, categoria, valor, posologia, idtipomed) 
VALUES 
('anti-rábica', '25-03-2025', 'lab x', 'Fornecedor', 'injetável', 35.00, '1 dose a cada 30 dias 3x -1 ampola via-cutânea', 1);

	