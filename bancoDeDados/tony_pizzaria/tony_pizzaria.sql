drop database Babuino_pizzaria;

create database Babuino_pizzaria;

use Babuino_pizzaria;

create table BabuinoPizzaria(
	idPizzaria int primary key not null,
    nome varchar(100),
    cnpj numeric(14),
    email varchar(100),
    telefone numeric(14)    
);

create table usuarios(
	idUsuario int primary key not null auto_increment,
    idPizzaria int,
    nome varchar(200),
    telefone numeric(14),
    cpf numeric(11),
    senha varchar(100),
    email varchar(100),
    link_img_perfil varchar(1000),
    
    foreign key (idPizzaria) references BabuinoPizzaria(idPizzaria)
);

create table enderecos(
	idEndereco int primary key not null auto_increment,
    idUsuario int,
    cep numeric(9),
    cidade varchar(150),
    bairro varchar(150),
    rua varchar(150),
    complemento varchar(150),
    
    foreign key (idUsuario) references usuarios(IdUsuario)
);

create table categorias(
	idCategoria int primary key not null auto_increment,
    nome varchar(100),
    qntd_produtos int,
    subCategoria varchar(100)
);

create table produtos(
	idProduto int primary key not null auto_increment,
    idCategoria int,
    nome varchar(150),
    descricao varchar(200),
    preco double,
    link_img_produtos varchar(150),
    
    foreign key (idCategoria) references categorias(idCategoria)
);

create table pedidos(
	idPedido int primary key not null,
    idProduto int,
    idUsuario int,
    numero_pedido int,
    data_hora_pedido datetime,
    data_hora_entrega datetime,
    valorTotal double,
    
    foreign key (idProduto) references produtos(idProduto),
    foreign key (idUsuario) references usuarios(idUsuario) 
);

create table comentarios(
	idComentario int primary key not null auto_increment,
    idUsuario int,
    idProduto int,
    texto varchar(500),
    data_hora_publicacao datetime,
    avaliacao int,
    
    foreign key (idProduto) references produtos(idProduto),
    foreign key (idUsuario) references usuarios(idUsuario) 
);

create table pagamentos(
	idPagamento int primary key not null,
    idPedido int,
    forma_pagamento1 varchar(200),
    forma_pagamento2 varchar(200),
    forma_pagamento3 varchar(200),
    
	foreign key (idPedido) references pedidos(idPedido)
);

insert into BabuinoPizzaria (idPizzaria, nome, cnpj, email, telefone)values
(1,'Babuino Pizzaria - Novo Hamburgo', 46854138485546, 'Babuinopizzaria@gmail.com', 55011915348532);

insert into usuarios(idUsuario, idPizzaria, nome, telefone, cpf, senha, email, link_img_perfil)values
(0, 1, "Luiz Henrique Vidal Araujo", 5511961659165, 57681653133, "dez_13/12", "luizhva@gmail.com", ""),
(0, 1, "Nicolas Vasconcelos Petri", 5511965161647, 42682188952, "dez_03/12", "nvpetir@gmail.com", ""),
(0, 1, "Estela da Silva Menezes", 5511956168165, 65168165681, "out_09/10", "estrelinha@gmail.com", ""),
(0, 1, "Carolina Neponucena", 5511916541541, 41961651614, "nov_06/11", "carolcomcerteza@gmail.com", ""),
(0, 1, "Jessica Pereira dos Santos", 5511966116489, 55336952895, "mar_26/03", "annaeelza@gmail.com", "");

insert into enderecos(idEndereco, idUsuario, cep, cidade, bairro, rua, complemento)values
(0, 1, 06325000, "Carapicuíba", "Conjunto Habitacional Presidente Castelo Branco", "Avenida Brasil", "204B bloco B"),
(0, 2, 05325000, "São Paulo", "Parque Continental", "Rua Alfredo Pinheiro", ""),
(0, 3, 06325000, "Carapicuíba", "Conjunto Habitacional Presidente Castelo Branco", "Avenida Brasil", "204B bloco B"),
(0, 4, 04325000, "São Paulo", "Vila do Encontro", "Avenida Engenheiro Armando de Arruda Pereira", ""),
(0, 5, 03325000, "São Paulo", "Vila Santo Estevão", "Rua Aguapeí", "");

insert into categorias(idCategoria, nome, qntd_produtos, subCategoria)values
(0, "Pizzas", 25, "Salgadas"),
(0, "Pizzas", 15, "Doces"),
(0, "Pizzas Brotinho", 25, "Salgadas"),
(0, "Pizzas Brotinho", 15, "Doces"),
(0, "Sobremesas", 5, "Maiores"),
(0, "Sobremesas", 5, "Menores"),
(0, "Bebidas", 10, "3 Litros"),
(0, "Bebidas", 15, "2 Litros"),
(0, "Bebidas", 10, "1 Litro"),
(0, "Bebidas", 10, "600 Mililitros");

insert into produtos(idProduto, idCategoria, nome, descricao, preco, link_img_produtos)values
(0, 1, "Pizza de Calabreza com Queijo", "", 16.99, "https://raw.githubusercontent.com/LUIZHVA02/P-W-F-E/main/projetos-Front-End/aula-8-Tony-Pizzaria/img/webp/pizza-de-calabreza-com-queijo.webp"),
(0, 2, "Pizza de Chocolate com Morango","", 19.99, ""),
(0, 3, "Pizza Brotinho de Calabreza com Queijo", "", 14.99, "https://raw.githubusercontent.com/LUIZHVA02/P-W-F-E/main/projetos-Front-End/aula-8-Tony-Pizzaria/img/webp/pizza-brotinho-de-calabreza-com-queijo.webp"),
(0, 4, "Pizza Brotinho de Prestígio", "", 15.99, ""),
(0, 5, "Balde de Sorvete", "Balde de 3 Litros de Sorvete do sabor de sua escolha", 27.90, ""),
(0, 6, "Milkshake", "Milkshake de 500 gramas com o sabor de sua escolha", 13.80, ""),
(0, 7, "Refrigerante Coca Cola","", 10.99, ""),
(0, 8, "Refrigerante Dolly Guaraná", "", 10.99, ""),
(0, 9, "Refrigerante Pepsi Cola", "", 8.99, ""),
(0, 10, "Cerveja Heineken", "", 18.99, "");

insert into pedidos(idPedido, idProduto, idUsuario, numero_pedido, data_hora_pedido, data_hora_entrega, valorTotal)values
(1, 1, 1, 1,"2023-12-14 18:37:56", "2023-12-14 19:17:00", 16.99),
(2, 4, 1, 1,"2023-12-14 18:37:56", "2023-12-14 19:17:00", 15.99),
(3, 8, 1, 1,"2023-12-14 18:37:56", "2023-12-14 19:17:00", 10.99),
(4, 2, 2, 2,"2023-12-14 18:57:44", "2023-12-14 19:37:00", 19.99),
(5, 6, 2, 2,"2023-12-14 18:57:44", "2023-12-14 19:37:00", 13.80),
(6, 9, 2, 2,"2023-12-14 18:57:44", "2023-12-14 19:37:00",  8.99),
(7, 1, 3, 3,"2023-12-14 18:04:56", "2023-12-14 18:44:00", 16.99),
(8, 4, 3, 3,"2023-12-14 18:04:56", "2023-12-14 18:44:00", 15.99),
(9, 9, 3, 3,"2023-12-14 18:04:56", "2023-12-14 18:44:00",  8.99),
(10, 2, 4, 4,"2023-12-14 18:46:44", "2023-12-14 19:26:00", 19.99),
(11, 5, 4, 4,"2023-12-14 18:46:44", "2023-12-14 19:26:00", 13.80),
(12, 9, 4, 4,"2023-12-14 18:46:44", "2023-12-14 19:26:00",  8.99),
(13, 3, 5, 5,"2023-12-14 18:28:33", "2023-12-14 19:08:00", 14.99),
(14, 1, 5, 5,"2023-12-14 18:28:33", "2023-12-14 19:08:00", 16.99),
(15, 10, 5, 5,"2023-12-14 16:28:33", "2023-12-14 19:08:00", 18.99);


insert into comentarios(idComentario, idUsuario, idProduto, texto, data_hora_publicacao, avaliacao)values
(0, 1, 1, "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.", "2023-12-14 19:57:52", 4),
(0, 2, 6, "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.", "2023-12-14 20:02:14", 5),
(0, 3, 4, "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.", "2023-12-14 19:15:47", 4),
(0, 4, 4, "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.", "2023-12-14 19:56:29", 5),
(0, 5, 10, "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.", "2023-12-14 19:38:15", 3);

insert into pagamentos(idPagamento, idPedido, forma_pagamento1, forma_pagamento2, forma_pagamento3)values
(1, 10, "Cartão de Crédito: MasterCard Black", "Chave Pix: Aleatória", "Valé Refeição: Alelo"),
(2, 13, "Cartão de Crédito: Visa Gold", "Chave Pix: Telefone", "Valé Refeição: Sodexo"),
(3, 4, "Cartão de Crédito: Nubank Mastercard", "Chave Pix: CPF", "Valé Refeição: Sodexo"),
(4, 7, "Cartão de Crédito: Visa OuroCard", "Chave Pix: Aleatória", "Valé Refeição: Sodexo"),
(5, 11, "Cartão de Crédito: MasterCard Platinum", "Chave Pix: email", "Valé Refeição: Alelo");