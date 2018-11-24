create database db_pgra;
	use db_pgra;
 
 ----------------------- AREA DE PRODUTOS ----------------------------
	create table tb_marca(
		cd_marca int not null,
		nm_marca varchar(45),
		constraint pk_marca
			primary key(cd_marca));

	create table tb_fornecedor(
		cd_fornecedor int not null,
		nm_fornecedor varchar(100) not null,
		cd_telefone char(11),
		cd_cnpj char(14),
		cd_insc_estadual char(16),
		constraint pk_fornecedor
			primary key(cd_fornecedor));

	create table tb_produto(
		cd_produto int not null,
		ds_produto varchar(45) not null,
		qt_litros decimal(9,2),
		vl_custo decimal(9,2) not null,
		vl_pj decimal(9,2),
		vl_pf decimal(9,2) not null,
		dt_validade date not null,
		cd_marca int not null,
		cd_fornecedor int not null,
		constraint pk_produto
			primary key(cd_produto),
		constraint fk_produto_marca
			foreign key(cd_marca)
				references tb_marca(cd_marca),
		constraint fk_produto_fornecedor
			foreign key(cd_fornecedor)
				references tb_fornecedor(cd_fornecedor));
---------------- FIM AREA PRODUTOS ---------------------------

---------------- AREA USUARIO --------------------------------
	create table tb_funcao(
		cd_funcao int not null,
		nm_funcao varchar(45) not null,
		constraint pk_funcao
			primary key(cd_funcao));

	create table tb_usuario(
		cd_usuario int not null,
		nm_usuario int not null,
		log_acesso datetime,
		cd_funcao int not null,
		constraint pk_usuario
			primary key(cd_usuario),
		constraint fk_usuario_funcao
			foreign key(cd_funcao)
				references tb_funcao(cd_funcao));

	create table tb_login(
		cd_login int not null,
		ds_acesso varchar(255),
		ds_senha varchar(255),
		ic_nivel char(1),
		cd_usuario int not null,
		constraint pk_login
			primary key(cd_login),
		constraint fk_login_usuario
			foreign key(cd_usuario)
				references tb_usuario(cd_usuario));
--------------- FIM AREA USUARIO ----------------------------

--------------- AREA CLIENTE --------------------------------

	create table tb_cliente(
		cd_cliente int not null,
		nm_cliente varchar(100),
		nm_razao_social varchar(100),
		dt_cadastro date not null,
		constraint pk_cliente
			primary key(cd_cliente));

	create table tipo_cliente_pf(
		cd_cliente int not null,
		cd_cpf char(11),
		cd_rg char(11),
		constraint fk_tipo_pf_cliente
			foreign key(cd_cliente)
				references tb_cliente(cd_cliente));

	create table tipo_cliente_pj(
		cd_cliente int not null,
		cd_cnpj char(14),
		cd_insc_estadual char(16),
		constraint fk_tipo_pj_cliente
			foreign key(cd_cliente)
				references tb_cliente(cd_cliente));

	create table tipo_contato(
		cd_tipo int not null,
		nm_tipo varchar(45) not null,
		constraint pk_tipo_contato
			primary key(cd_tipo));


	create table tb_contato(
		cd_contato int not null,
		cd_telefone char(11) not null,
		cd_tipo int not null,
		cd_cliente int not null,
		constraint pk_contato
			primary key(cd_contato),
		constraint fk_contato_tipo
			foreign key(cd_tipo)
				references tipo_contato(cd_tipo),
		constraint fk_contato_cliente
			foreign key(cd_cliente)
				references tb_cliente(cd_cliente));


	create table tb_uf(
		cd_uf int not null,
		nm_uf varchar(45) not null,
		constraint pk_uf
			primary key(cd_uf));

	create table tb_cidade(
		cd_cidade int not null, 
		nm_cidade varchar(45) not null,
		cd_uf int not null,
		constraint pk_cidade
			primary key(cd_cidade),
		constraint fk_cidade_uf
			foreign key(cd_uf)
				references tb_uf(cd_uf));

	create table tb_bairro(
		cd_bairro int not null,
		nm_bairro varchar(45) not null,
		cd_cidade int not null,
		constraint pk_bairro
			primary key(cd_bairro),
		constraint fk_bairro_cidade
			foreign key(cd_cidade)
				references tb_cidade(cd_cidade));

	create table tb_logradouro(
		cd_logradouro int not null,
		cd_cep char(8),
		cd_bairro int not null,
		ds_logradouro varchar(100) not null,
		ds_complemento varchar(255),
		cd_numero int not null,
		cd_cliente int not null,
		constraint pk_logradouro
			primary key(cd_logradouro),
		constraint fk_logradouro_cliente
			foreign key(cd_cliente)
				references tb_cliente(cd_cliente),
		constraint fk_logradouro_bairro
			foreign key(cd_bairro)
				references tb_bairro(cd_bairro));

--------------- FIM AREA CLIENTE ----------------------------

--------------- AREA PEDIDO --------------------------------
	
		create table tb_status(
			cd_status int not null,
			nm_status varchar(45),
			constraint pk_status
				primary key(cd_status));

		create table tb_pedido(
			cd_pedido int not null,
			dt_pedido date not null,
			hr_pedido time not null,
			vl_subtotal decimal(9,2) not null,
			vl_desconto decimal(9,2) not null,
			ds_obs varchar(255),
			ic_entregue char(1) not null,
			cd_status int not null,
			cd_funcionario int not null,
			cd_entregador int,
			cd_cliente int not null,
			constraint pk_pedido
				primary key(cd_pedido),
			constraint fk_pedido_funcionario
				foreign key(cd_funcionario)
					references tb_usuario(cd_usuario),
			constraint fk_pedido_entregador
				foreign key(cd_entregador)
					references tb_usuario(cd_usuario),
			constraint fk_pedido_cliente
				foreign key(cd_cliente)
					references tb_cliente(cd_cliente),
			constraint fk_pedido_status
				foreign key(cd_status)
					references tb_status(cd_status));

		create table tipo_pagamento(
			cd_tipo int not null,
			nm_tipo varchar(45) not null,
			constraint pk_tipo_pagamento
				primary key(cd_tipo));

		create table tb_pagamento(
			cd_pagamento int not null,
			vl_entrada int,
			dt_pagamento datetime not null,
			cd_tipo_pagamento int not null,
			cd_pedido int not null,
			constraint pk_pagamento
				primary key(cd_pagamento),
			constraint fk_pagamento_tipo
				foreign key(cd_tipo_pagamento)
					references tipo_pagamento(cd_tipo),
			constraint fk_pagamento_pedido
				foreign key(cd_pedido)
					references tb_pedido(cd_pedido));

		create table tb_parcela(
			cd_parcela int not null,
			dt_vencimento date not null,
			dt_pagamento datetime,
			vl_parcela decimal(9,2) not null,
			ic_status char(1) not null,
			cd_pagamento int not null,
			constraint pk_parcela
				primary key(cd_parcela),
			constraint fk_parcela_pagamento
				foreign key(cd_pagamento)
					references tb_pagamento(cd_pagamento));

		create table item_pedido(
			cd_item_pedido int not null,
			cd_pedido int not null,
			cd_produto int not null,
			qt_produto int not null,
			constraint pk_item_pedido
				primary key(cd_item_pedido),
			constraint fk_item_pedido
				foreign key(cd_pedido)
					references tb_pedido(cd_pedido),
			constraint fk_item_produto
				foreign key(cd_produto)
					references tb_produto(cd_produto));