#CREATE DATABASE Marketplace;
/*
NOMES:									RA:
Gabriel Schrader Vilas Boas				150981
Ramon da Silva Passos					148011
João Pedro Assumpção Evaristo			147887
*/

CREATE TABLE Marca(
	IdMarca integer,
    Nome varchar(20),
    Logo varchar(50),
    PRIMARY KEY(IdMarca)
);

CREATE TABLE Produto(
	IdProd integer,
    Nome varchar(80),
    Preco float,
    QuantiaEstoque integer,
    IdMarca integer,
    PRIMARY KEY(IdProd),
    FOREIGN KEY(IdMarca) REFERENCES Marca(IdMarca)
);

CREATE TABLE Categoria(
	IdCateg integer,
    NomeCateg varchar(20),
    `Desc` varchar(150),
    PRIMARY KEY(IdCateg)
);

CREATE TABLE Pertence(
	IdProd integer,
    IdCateg integer,
    PRIMARY KEY(IdProd, IdCateg),
    FOREIGN KEY(IdProd) REFERENCES Produto(IdProd),
    FOREIGN KEY(IdCateg) REFERENCES Categoria(IdCateg)
);

CREATE TABLE Fornecedor(
	IdFornec integer,
    Nome varchar(40),
    CNPJ varchar(20),
    Cidade varchar(30),
    Telefone varchar(20),
    PRIMARY KEY(IdFornec)
);

CREATE TABLE Fornece(
	IdProd integer,
    IdFornec integer,
    PrecoFornec float,
    Quantidade integer,
    PRIMARY KEY(IdProd, IdFornec),
    FOREIGN KEY(IdProd) REFERENCES Produto(IdProd),
    FOREIGN KEY(IdFornec) REFERENCES Fornecedor(IdFornec)
);

CREATE TABLE Usuario(
	IdUsuario integer,
    Nome varchar(50),
    CPF varchar(15),
    Telefone varchar(20),
    Email varchar(40),
    PRIMARY KEY(IdUsuario)
);

CREATE TABLE ModoPagamento(
	IdPgmto integer,
    PRIMARY KEY(IdPgmto)
);

CREATE TABLE Credito(
	IdPgmto integer,
    ValorParcela float,
    QuantParcela integer,
    TaxaJuros float,
    PRIMARY KEY(IdPgmto),
    FOREIGN KEY(IdPgmto) REFERENCES ModoPagamento(IdPgmto)
);

CREATE TABLE Debito(
	IdPgmto integer,
	DescontoDebito float,
	PRIMARY KEY(IdPgmto),
    FOREIGN KEY(IdPgmto) REFERENCES ModoPagamento(IdPgmto)
);

CREATE TABLE Boleto(
	IdPgmto integer,
    NumBoleto varchar(50),
    DataVenc date,
    Emissora varchar(20),
    DescontoBoleto float,
	PRIMARY KEY(IdPgmto),
    FOREIGN KEY(IdPgmto) REFERENCES ModoPagamento(IdPgmto)
);

CREATE TABLE Transportadora(
	IdTransp integer,
    CNPJ varchar(20),
    Nome varchar(40),
    Cidade varchar(30),
    PRIMARY KEY(IdTransp)
);

CREATE TABLE Pedido(
	NumPedido integer,
    `Status` varchar(30),
    PrecoTotal float,
    IdPgmto integer,
    IdTransp integer,
    IdUsuario integer,
    PRIMARY KEY(NumPedido),
    FOREIGN KEY(IdPgmto) REFERENCES ModoPagamento(IdPgmto),
    FOREIGN KEY(IdTransp) REFERENCES Transportadora(IdTransp),
    FOREIGN KEY(IdUsuario) REFERENCES Usuario(IdUsuario)
);

CREATE TABLE PedidoProduto(
	IdProd integer,
    NumPedido integer,
    PRIMARY KEY(IdProd, NumPedido),
    FOREIGN KEY(IdProd) REFERENCES Produto(IdProd),
    FOREIGN KEY(NumPedido) REFERENCES Pedido(NumPedido)
);

CREATE TABLE Envio(
	IdUsuario integer,
    IdTransp integer,
    CodigoRast varchar(20),
    PRIMARY KEY(IdUsuario, IdTransp),
    FOREIGN KEY(IdUsuario) REFERENCES Usuario(IdUsuario),
    FOREIGN KEY(IdTransp) REFERENCES Transportadora(IdTransp)
);

CREATE TABLE Cartao(
	NumCartao varchar(20),
    NomeTit varchar(30),
    NomeCartao varchar(20),
    Bandeira varchar(15),
    IdUsuario integer,
    PRIMARY KEY(NumCartao),
    FOREIGN KEY(IdUsuario) REFERENCES Usuario(IdUsuario)
);

CREATE TABLE Endereco(
	IdEnd integer,
    Rua varchar(25),
    NumEnd varchar(30),
    CEP varchar(10),
    Complemento varchar(50),
    IdUsuario integer,
    PRIMARY KEY(IdEnd),
    FOREIGN KEY(IdUsuario) REFERENCES Usuario(IdUsuario)
);

INSERT INTO Marca VALUES 	
(1, 'Adidas', 'adidaslogo.png'), 
(2, 'Nike', 'nikelogo.png'), 
(3, 'Razer', 'razerlogo.png'), 
(4, 'Sony', 'sonylogo.png'), 
(5, 'LG', 'lglogo.png'), 
(6, 'HyperX', 'hyperxlogo.png'), 
(7, 'Samsung', 'samsunglogo.png'), 
(8, 'Corsair', 'corsairlogo.png'), 
(9, 'Logitech', 'logitechlogo.png'), 
(10, 'DXRacer', 'dxracerlogo.png'),
(11, 'NVIDIA', 'nvdialogo.png');

INSERT INTO Produto VALUES 	
(1, 'Moletom Preto Básico', 80.00, 44, 2),
(2, 'PlayStation 5', 4000.00, 6, 4),
(3, 'Mouse Gamer RGB Logitech', 150.50, 20, 9),
(4, 'Smartphone Samsung Galaxy A10s Azul', 1699.99, 13, 7),
(5, 'Cadeira Gamer Pro King', 2000.00, 3, 10),
(6, 'Headset Gamer Corsair Virtuoso Rgb Wireless Branco 7.1', 899.90, 10, 8),
(7, 'Monitor LG 29" led, Full HD, HDMI, IPS, Vesa, FreeSync - 29WL500-B', 1799.00, 9, 5),
(8, 'Headset Gamer Razer Kraken X Lite', 249.90, 17, 3),
(9, 'Tênis Adidas NMD R1 Masculino', 449.90, 33, 1),
(10, 'Mouse Gamer HyperX Pulsefire Haste Rgb', 274.59, 40, 6),
(11, 'Placa de Vídeo VGA Asus NVIDIA GeForce GTX 1050Ti', 1600.00, 8, 11);
        
INSERT INTO Categoria VALUES	
(1, 'Eletronicos', 'Eletronicos Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua'),
(2, 'Celulares', 'Celulares Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua'),
(3, 'Vestuário', 'Vestuário Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua'),
(4, 'Sapatos', 'Sapatos Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua'),
(5, 'Consoles', 'Consoles Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua'),
(6, 'Periféricos', 'Periféricos Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua'),
(7, 'Placa de Vídeo', 'Placa de Vídeo Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua'),
(8, 'Cadeiras', 'Cadeiras Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua'),
(9, 'Fones de Ouvido', 'Fones de Ouvido Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua'),
(10, 'Monitores', 'Monitores Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua');

INSERT INTO Pertence VALUES 
(1, 3), (2, 5), (2, 1), (3, 1), (3, 6), (4, 1), (4, 2), (5, 8), (6, 1), (6, 6), (6, 9), (7, 1), (7, 10), (8, 1), (8, 6), (8, 10), (9, 4), (10, 1), (10, 6), (11, 1), (11, 7);

INSERT INTO Transportadora VALUES	
(1, '72.601.279/0001-70', 'Transportadora ABC', 'Jacareí'),
(2, '49.477.273/0001-10', 'Transportadora dos Campos', 'São José dos Campos'),
(3, '42.273.705/0001-22', 'Transportadora Paulista', 'São Paulo'),
(4, '98.209.209/0001-64', 'Transportadora Carioca', 'Rio de Janeiro'),
(5, '51.741.333/0001-02', 'Transportadora Fortal', 'Fortaleza'),
(6, '39.112.953/0001-87', 'Mogi Transporte', 'Mogi das Cruzes'),
(7, '95.200.903/0001-22', 'Transportadora João', 'Joinville'),
(8, '33.485.615/0001-04', 'Transportadora Beaga', 'Belo Horizonte'),
(9, '51.131.755/0001-66', 'Transportadora São Bernardo', 'São Bernardo'),
(10, '68.914.063/0001-97', 'Aruja Transporta', 'Arujá');

INSERT INTO Usuario VALUES 
(1, 'Joao Nalzuy', '453.464.290-34', '(83) 3165-6528', 'kraig6797@uorak.com'),
(2, 'Fyeos Daixa', '081.212.060-49', '(95) 2407-6594', 'corin525@uorak.com'),
(3, 'Paygoi Cinuol', '582.398.560-63', '(62) 3151-4903', 'diyana4067@uorak.com'),
(4, 'Koyna Koiti', '604.096.880-02', '(18) 2790-5615', 'lokman8992@uorak.com'),
(5, 'Buyla Gealu', '214.324.890-38', '(61) 2976-4556', 'zhiming2531@uorak.com'),
(6, 'Oszul Luoru', '743.530.540-58', '(62) 2232-6112', 'bismarck3534@uorak.com'),
(7, 'Coas Tecearl', '274.480.690-04', '(37) 3212-8047', 'marite5693@uorak.com'),
(8, 'Luxu Velaca', '788.481.880-95', '(85) 2555-3931', 'badreddin4891@uorak.com'),
(9, 'Toymu Kiolayn', '124.752.220-26', '(95) 3633-8865', 'hristina6626@uorak.com'),
(10, 'Razai Guycu', '261.438.050-40', '(34) 2623-9825', 'sherita1176@uorak.com');

INSERT INTO Fornecedor VALUES
(1, 'JacFornecedora', '34.542.014/0001-59', 'Jacareí', '(27) 3821-1814'),
(2, 'SJCFornecedora', '13.003.867/0001-42', 'São José dos Campus', '(95) 2816-4604'),
(3, 'TteFornecedora', '71.415.624/0001-18', 'Taubaté', '(75) 2137-3769'),
(4, 'CCPFornecedora', '17.385.480/0001-59', 'Caçapava', '(77) 3195-3182'),
(5, 'RJFornecedora', '20.070.060/0001-98', 'Rio de Janeiro', '(65) 3637-0281'),
(6, 'CRBFornecedora', '51.317.785/0001-61', 'Curitiba', '(32) 3411-4416'),
(7, 'SPFornecedora', '66.675.382/0001-61', 'São Paulo', '(61) 3828-8339'),
(8, 'RCFornecedora', '46.370.074/0001-10', 'Recife', '(63) 3152-8424'),
(9, 'FTZFornecedora', '87.424.866/0001-08', 'Forteleza', '(65) 2546-3848'),
(10, 'VTRFornecedora', '06.535.814/0001-07', 'Vitória', '(42) 3451-4861'),
(11, 'BHFornecedora', '05.187.735/0001-90', 'Belo Horizonte', '(95) 2051-1255'),
(12, 'CBFornecedora', '55.184.124/0001-66', 'Cuiabá', '(61) 3458-1648');

INSERT INTO Endereco VALUES 
(1, 'Rua almir', '50', '12345-000', 'Casa', 1),
(2, 'Rua joao', '80', '12345-001', 'Bloco A ap 105', 2),
(3, 'Rua barao', '060', '12345-002', 'Loja 3', 3),
(4, 'Rua XV de Novembro', '70', '12345-003', 'Casa', 4),
(5, 'Avenida são paulo', '30', '12345-004', 'Bloco B ap 105', 5),
(6, 'Rua Maria', '54', '12345-005', 'Casa', 6),
(7, 'Avenida Palestra Itália', '71', '12345-006', 'Bloco C ap 105', 7),
(8, 'Avenida São João', '12', '12345-007', 'Loja 5', 8),
(9, 'Rua São Pedro', '7', '12345-008', 'Bloco D ap 105', 9),
(10, 'Rua Fátima', '60', '12345-009', 'Bloco E ap 105', 10);

INSERT INTO Cartao VALUES 
('5417 4659 9865 7085', 'JOAO NALZUY', 'Nubank', 'Mastercard', 1),
('5399 6368 4447 6621', 'FYEOS DAIXA', 'Inter', 'Mastercard', 2),
('3764 119649 21550', 'FYEOS DAIXA', 'Santander', 'Elo', 2),
('4485 7348 7159 7894', 'PAYGOI CINUOL', 'Samsung', 'Visa', 3),
('5060 3704 9190 9324', 'KOYNA KOITI', 'PicPay', 'JBC', 4),
('4532 8335 8115 2397', 'BUYLA GEALU', 'Nubank', 'Mastercard', 5),
('2014 0033915 4154', 'OSZUL LUORU', 'Bradesco', 'Elo', 6),
('3536 2839 2123 3580', 'COAS TECEARL', 'Banco do Brasil', 'Visa', 7),
('6062 8268 8911 4104', 'LUXU VELACA', 'Crefisa', 'Mastercard', 8),
('5123 4048 0642 7170', 'LUXU VELACA', 'Pagbank', 'Mastercard', 8),
('3733 642040 16678', 'TOYMU KIOLAYN', 'Itau', 'Mastercard', 9),
('4532 8108 4639 7314', 'RAZAI GUYCU', 'Caixa', 'Mastercard', 10);

INSERT INTO Fornece VALUES
(1, 10, 60.00, 2),
(2, 12, 3500.00, 3),
(3, 1, 125.00, 4),
(4, 4, 1200.00, 2),
(5, 2, 1349.99, 1),
(6, 3, 599.90, 8),
(7, 4, 1400.00, 2),
(8, 7, 200.00, 3),
(9, 9, 350.00, 33),
(10, 5, 220.00, 20);

INSERT INTO ModoPagamento VALUES
(1), (2), (3), (4), (5), (6), (7), (8), (9), (10),
(11), (12), (13), (14), (15), (16), (17), (18), (19), (20),
(21), (22), (23), (24), (25), (26), (27), (28), (29), (30);

INSERT INTO Envio VALUES
(1, 3, 'SL111111111BR'),
(2, 5, 'OP222222222BT'),
(4, 1, 'AS333333333TT'),
(6, 1, 'BB444444444TB'),
(7, 9, 'ML555555555SS'),
(5, 10, 'AR666666666TE'),
(3, 3, 'CR777777777AT'),
(10, 8, 'GH888888888TB'),
(9, 6, 'KK99999999LU'),
(8, 7, 'PO101010101QR');

INSERT INTO Credito VALUES
(1, 100.00, 5, 4.00),
(3, 153.00, 3, 3.00),
(4, 2000, 2, 0.00),
(5, 153.00, 3, 3.00),
(7, 1030.00, 2, 5.00),
(8, 135.00, 2, 3.00),
(11, 135.00, 2, 2.00),
(12, 135.00, 2, 3.00),
(23, 404.80, 4, 3.00),
(29, 575.00, 3, 2.50);

INSERT INTO Debito VALUES
(2, 12.50),
(6, 8.00),
(9, 7.00),
(10, 10.00),
(13, 10.00),
(17, 5.00),
(18, 7.50),
(19, 15.00),
(20, 10.00),
(21, 15.00);

INSERT INTO Boleto VALUES
(14, '00000.00000 00000.000000 00000.000000 0 0000000000', '2022-02-11', 'Bradesco', 10.00),
(15, '11111.11111 11111.111111 11111.111111 1 1111111111', '2022-05-15', 'Itaú', 15.00),
(16, '22222.22222 22222.222222 22222.222222 2 2222222222', '2022-05-28', 'Banco do Brasil', 7.50),
(22, '33333.33333 33333.333333 33333.333333 3 3333333333', '2022-03-01', 'Santander', 8.00),
(24, '44444.44444 44444.444444 44444.444444 4 4444444444', '2022-02-16', 'Caixa Econômica', 15.00),
(25, '55555.55555 55555.555555 55555.555555 5 5555555555', '2022-11-30', 'Sicredi', 5.00),
(26, '66666.66666 66666.666666 66666.666666 6 6666666666', '2022-06-29', 'Caixa Econômica', 15.00),
(27, '77777.77777 77777.777777 77777.777777 7 7777777777', '2022-06-22', 'Itaú', 15.00),
(28, '88888.88888 88888.888888 88888.888888 8 8888888888', '2022-08-13', 'Santander', 8.00),
(30, '99999.99999 99999.999999 99999.999999 9 9999999999', '2022-12-17', 'Banco do Brasil', 7.50);

INSERT INTO Pedido VALUES
(1, 'Realizado.', 4000.00, 4, 6, 1),
(2, 'Aguardando pagamento.', 529.90, 10, 2, 2),
(3, 'Pago.', 2000.00, 21, 10, 3),
(4, 'Cancelado.', 270.00, 8, 8, 4),
(5, 'Realizado', 234.59, 27, 5, 5),
(6, 'Realizado', 1472.00, 6, 6, 6),
(7, 'Enviado.', 1530.00, 14, 7, 7),
(8, 'Enviado.', 832.50, 18, 8, 2),
(9, 'Realizado', 1710.00, 25, 9, 9),
(10, 'Aguardando pagamento.', 380.40, 20, 10, 10);

INSERT INTO PedidoProduto VALUES
(2, 1), (1, 2), (9, 2), (5, 3), (8, 4), (10, 5), (11, 6), (4, 7), (6, 8), (7, 9), (8, 10), (3, 10);

/*5 consultas com os operadores básicos de SQL, as quais devem conter junção com, no mínimo, duas tabelas.*/

/*Liste o nome dos usuarios e a rua do endereço cadastrado*/
SELECT u.nome, e.rua FROM usuario u, endereco e WHERE u.idusuario = e.idusuario;

/*
# nome, rua
'Joao Nalzuy', 'Rua almir'
'Fyeos Daixa', 'Rua joao'
'Paygoi Cinuol', 'Rua barao'
'Koyna Koiti', 'Rua XV de Novembro'
'Buyla Gealu', 'Avenida são paulo'
'Oszul Luoru', 'Rua Maria'
'Coas Tecearl', 'Avenida Palestra Itália'
'Luxu Velaca', 'Avenida São João'
'Toymu Kiolayn', 'Rua São Pedro'
'Razai Guycu', 'Rua Fátima'
*/

/*Liste o preço total dos pedidos para aqueles em que o método de pagamento for débito*/
SELECT p.precototal FROM pedido p, debito d WHERE p.idpgmto = d.idpgmto;

/*
# precototal
'529.9'
'2000'
'1472'
'832.5'
'380.4'
*/

/*Liste o nome e cpf dos usuarios que possuem cartão cadastrado no site*/
SELECT u.nome, u.cpf FROM usuario u JOIN cartao c ON u.idusuario = c.idusuario GROUP BY u.nome;

/*
# nome, cpf
'Joao Nalzuy', '453.464.290-34'
'Fyeos Daixa', '081.212.060-49'
'Paygoi Cinuol', '582.398.560-63'
'Koyna Koiti', '604.096.880-02'
'Buyla Gealu', '214.324.890-38'
'Oszul Luoru', '743.530.540-58'
'Coas Tecearl', '274.480.690-04'
'Luxu Velaca', '788.481.880-95'
'Toymu Kiolayn', '124.752.220-26'
'Razai Guycu', '261.438.050-40'
*/

/*Liste o status dos pedidos e o nome da transportadora responsável pelo envio do pedido*/
SELECT p.status, t.nome FROM pedido p JOIN transportadora t ON p.idtransp = t.idtransp;

/*
# status, nome
'Realizado.', 'Mogi Transporte'
'Aguardando pagamento.', 'Transportadora dos Campos'
'Pago.', 'Aruja Transporta'
'Cancelado.', 'Transportadora Beaga'
'Realizado', 'Transportadora Fortal'
'Realizado', 'Mogi Transporte'
'Enviado.', 'Transportadora João'
'Enviado.', 'Transportadora Beaga'
'Realizado', 'Transportadora São Bernardo'
'Aguardando pagamento.', 'Aruja Transporta'

*/

/*Liste o nome e a quantia dos produtos da categoria Placa de Vídeo*/
SELECT p.nome, p.quantiaestoque FROM produto p WHERE p.idprod IN (SELECT p.idprod FROM pertence p WHERE p.idcateg IN(SELECT c.idcateg FROM categoria c WHERE c.NomeCateg = "Placa de Vídeo"));

/*
# nome, quantiaestoque
'Placa de Vídeo VGA Asus NVIDIA GeForce GTX 1050Ti', '8'
*/

/*2 consultas com LEFT JOIN*/

/*Liste o nome de todas transportadora e para aquelas que possuem envios, listar o codigo de rastreio*/
SELECT t.Nome, e.codigorast FROM transportadora t LEFT JOIN envio e ON t.idtransp = e.idtransp;

/*
# Nome, codigorast
'Transportadora ABC', 'AS333333333TT'
'Transportadora ABC', 'BB444444444TB'
'Transportadora dos Campos', NULL
'Transportadora Paulista', 'SL111111111BR'
'Transportadora Paulista', 'CR777777777AT'
'Transportadora Carioca', NULL
'Transportadora Fortal', 'OP222222222BT'
'Mogi Transporte', 'KK99999999LU'
'Transportadora João', 'PO101010101QR'
'Transportadora Beaga', 'GH888888888TB'
'Transportadora São Bernardo', 'ML555555555SS'
'Aruja Transporta', 'AR666666666TE'

*/

/*Liste o nome de todos os usuarios e para aqueles que possuem pedidos, listar o número do pedido*/
SELECT u.nome, p.numpedido FROM usuario u LEFT JOIN pedido p ON u.idusuario = p.idusuario;

/*
# nome, numpedido
'Joao Nalzuy', '1'
'Fyeos Daixa', '2'
'Fyeos Daixa', '8'
'Paygoi Cinuol', '3'
'Koyna Koiti', '4'
'Buyla Gealu', '5'
'Oszul Luoru', '6'
'Coas Tecearl', '7'
'Luxu Velaca', NULL
'Toymu Kiolayn', '9'
'Razai Guycu', '10'
*/

/*5 consultas com os operadores (avg, sum, etc.) usando group by, having e order by*/

/*Liste o nome da categoria e o total do valor da soma de seus produtos. Ordene os resultados por ordem alfabética.*/
SELECT c.NomeCateg, SUM(p.preco) FROM categoria c, produto p, pertence per WHERE c.idcateg = per.idcateg AND per.idprod = p.idprod GROUP BY c.NomeCateg ORDER BY c.NomeCateg;

/*
# NomeCateg, SUM(p.preco)
'Cadeiras', '2000'
'Celulares', '1699.989990234375'
'Consoles', '4000'
'Eletronicos', '10673.880004882812'
'Fones de Ouvido', '899.9000244140625'
'Monitores', '2048.8999938964844'
'Periféricos', '1574.8900146484375'
'Placa de Vídeo', '1600'
'Sapatos', '449.8999938964844'
'Vestuário', '80'
*/

/*Para os usuários que possuem cartão, liste o nome e a quantidade de cartões que possuem. Ordene decrescentemente os resultados pela quantidade de cartões dos usuários, isto é, os usuários que possuem mais cartões devem aparecer no topo.*/
SELECT u.nome, COUNT(c.numcartao) AS totalcartao FROM usuario u, cartao c WHERE u.idusuario = c.idusuario GROUP BY u.nome ORDER BY totalcartao DESC;

/*
# nome, totalcartao
'Fyeos Daixa', '2'
'Luxu Velaca', '2'
'Joao Nalzuy', '1'
'Paygoi Cinuol', '1'
'Koyna Koiti', '1'
'Buyla Gealu', '1'
'Oszul Luoru', '1'
'Coas Tecearl', '1'
'Toymu Kiolayn', '1'
'Razai Guycu', '1'
*/

/*Para transportadoras que possuem envio, listar o nome e a quantidade total de envios. Ordene pela quantidade de envio ascendente, isso é, transportadoras com menor número de envios devem aparecer no topo.*/
SELECT t.nome, COUNT(e.codigorast) AS quantidadeenvio FROM transportadora t, envio e WHERE t.idtransp = e.idtransp GROUP BY t.nome ORDER BY quantidadeenvio ASC;

/*
# nome, quantidadeenvio
'Transportadora Fortal', '1'
'Mogi Transporte', '1'
'Transportadora João', '1'
'Transportadora Beaga', '1'
'Transportadora São Bernardo', '1'
'Aruja Transporta', '1'
'Transportadora ABC', '2'
'Transportadora Paulista', '2'
*/

/*Liste o ID dos pagamentos feitos no debito e o seu desconto naqueles em que o desconto foi maior que a média.*/
SELECT d.idpgmto, d.descontodebito FROM debito d GROUP BY d.idpgmto HAVING d.descontodebito > (SELECT AVG(d.descontodebito) FROM debito d) ;

/*
# idpgmto, descontodebito
'2', '12.5'
'19', '15'
'21', '15'
*/

/*Liste o número do pedido e o total de produtos de cada pedido. Ordene de forma que os pedidos com mais itens apareçam no topo*/
SELECT p.numpedido, COUNT(pedprod.idprod) AS totalitens FROM pedido p, pedidoproduto pedprod WHERE p.NumPedido = pedprod.NumPedido GROUP BY p.NumPedido ORDER BY totalitens DESC;

/* numpedido, totalitens
'2', '2'
'10', '2'
'1', '1'
'3', '1'
'4', '1'
'5', '1'
'6', '1'
'7', '1'
'8', '1'
'9', '1'
*/