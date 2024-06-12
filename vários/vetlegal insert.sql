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

select * from sistema.medico

--renomear nome do campo/coluna
alter table sistema.medico rename column observação to observacao

