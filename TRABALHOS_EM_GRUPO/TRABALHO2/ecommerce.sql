--CRIAÇÃO DAS TABELAS

CREATE TABLE categoria_produto(
    codigo_categoria serial PRIMARY KEY,
    nome_categoria varchar(30) NOT NULL UNIQUE,
    descricao_categoria TEXT
);

CREATE TABLE funcionario (
    codigo_funcionario serial PRIMARY KEY,
    cpf_funcionario char(11) NOT NULL UNIQUE,
    nome_funcionario varchar(30)
);

CREATE TABLE produto (
    codigo_produto serial PRIMARY KEY,
    nome_produto varchar(30) NOT NULL,
    descricao TEXT,
    quantidade_estoque smallint DEFAULT 0,
    data_fabricacao DATE NOT NULL,
    valor_unitario NUMERIC NOT NULL CHECK(valor_unitario > 0),
    codigo_categoria serial,
    FOREIGN KEY (codigo_categoria)
    REFERENCES categoria_produto (codigo_categoria)
    ON UPDATE CASCADE ON DELETE CASCADE,
    codigo_funcionario serial,
	FOREIGN KEY (codigo_funcionario)
	REFERENCES funcionario (codigo_funcionario)
    ON UPDATE CASCADE ON DELETE CASCADE	);

CREATE TABLE cliente (
    codigo_cliente serial PRIMARY KEY,
    nome_cliente varchar(30) NOT NULL,
    nome_usuario varchar(15) NOT NULL UNIQUE,
    email_cliente varchar(20) NOT NULL UNIQUE,
    cpf_cliente char(11) NOT NULL UNIQUE,
    data_nascimento_cliente DATE NOT NULL,
    pais varchar(20) NOT NULL,
    uf char(2) NOT NULL,
    cidade varchar(20) NOT NULL,
    bairro varchar(20) NOT NULL,
    rua varchar(20) NOT NULL,
    complemento varchar(20) NOT NULL
);


CREATE TABLE pedido (
    codigo_pedido serial PRIMARY KEY,
    data_pedido DATE NOT NULL,
    status varchar(10) NOT NULL,
    codigo_cliente serial,
	FOREIGN KEY (codigo_cliente)
    REFERENCES cliente (codigo_cliente)
    ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE itens_pedido (
    codigo_itens serial PRIMARY KEY,
	quantidade int,
    desconto NUMERIC ,
    codigo_pedido serial,
	FOREIGN KEY (codigo_pedido)
    REFERENCES pedido (codigo_pedido)
    ON UPDATE CASCADE ON DELETE CASCADE,
    codigo_produto serial,
	FOREIGN KEY (codigo_produto)
    REFERENCES produto (codigo_produto)
    ON UPDATE CASCADE ON DELETE CASCADE
);

--INSERÇÃO DOS DADOS

INSERT INTO categoria_produto (nome_categoria, descricao_categoria)
VALUES('Eletrodomésticos', 'Eletrodomésticos');

INSERT INTO categoria_produto (nome_categoria, descricao_categoria)
VALUES('Eletrônicos', 'Eletrônicos');

INSERT INTO categoria_produto (nome_categoria, descricao_categoria)
VALUES('Móveis', 'Móveis');

INSERT INTO categoria_produto (nome_categoria, descricao_categoria)
VALUES('Pet', 'Pet');

INSERT INTO categoria_produto (nome_categoria, descricao_categoria)
VALUES('Decoração', 'Decoração');



INSERT INTO funcionario (cpf_funcionario, nome_funcionario)
VALUES('11111111111', 'João');

INSERT INTO funcionario (cpf_funcionario, nome_funcionario)
VALUES('21111111111', 'Clarissa');

INSERT INTO funcionario (cpf_funcionario, nome_funcionario)
VALUES('31111111111', 'Gisele');

INSERT INTO funcionario (cpf_funcionario, nome_funcionario)
VALUES('41111111111', 'Paulo');

INSERT INTO funcionario (cpf_funcionario, nome_funcionario)
VALUES('51111111111', 'Lucas');

INSERT INTO funcionario (cpf_funcionario, nome_funcionario)
VALUES('61111111111', 'Pedro');


INSERT INTO produto (nome_produto, 
					 descricao, 
					 quantidade_estoque, 
					 data_fabricacao, 
					 valor_unitario, 
					 codigo_categoria, 
					 codigo_funcionario)

VALUES('Fogão', 
	   'Acende, serve para
	   cozinhar, a gás, 6 
	   bocas', 10, '20200513', 1500.0, 1, 1);
	   
	   
INSERT INTO produto (nome_produto, 
					 descricao, 
					 quantidade_estoque, 
					 data_fabricacao, 
					 valor_unitario, 
					 codigo_categoria, 
					 codigo_funcionario)

VALUES('Computador', 
	   'Dell intel core i7 - 16GB RAM - 2000 GB HDD', 5,
	   '20210430', 3500.0, 2, 2);


INSERT INTO produto (nome_produto, 
					 descricao, 
					 quantidade_estoque, 
					 data_fabricacao, 
					 valor_unitario, 
					 codigo_categoria, 
					 codigo_funcionario)

VALUES('Sofá', 
	   '2 lugares, estofado marrom', 9,
	   '20210806', 4000.0, 3, 3);


INSERT INTO produto (nome_produto, 
					 descricao, 
					 quantidade_estoque, 
					 data_fabricacao, 
					 valor_unitario, 
					 codigo_categoria, 
					 codigo_funcionario)

VALUES('Vasilha inox', 
	   'Vasilha para pet em inox', 25,
	   '20220309', 35.0, 4, 4);


INSERT INTO produto (nome_produto, 
					 descricao, 
					 quantidade_estoque, 
					 data_fabricacao, 
					 valor_unitario, 
					 codigo_categoria, 
					 codigo_funcionario)

VALUES('Quadro abstrato', 
	   'Quadro em conceito abstrato - medidas 20x60 cm', 34,
	   '20220615', 90.0, 5, 5);
	   
	   
INSERT INTO produto (nome_produto, 
					 descricao, 
					 quantidade_estoque, 
					 data_fabricacao, 
					 valor_unitario, 
					 codigo_categoria, 
					 codigo_funcionario)

VALUES('Almofada', 
	   'Almofada vermelha', 10,
	   '20220615', 60.0, 5, 5);


INSERT INTO cliente (nome_cliente, nome_usuario, email_cliente, cpf_cliente, data_nascimento_cliente, pais,
					 uf, cidade, bairro, rua, complemento)
					
VALUES ('Jorge','jorge_123','jorge@gmail.com','22222222222','19900530','Brasil','RJ',
	   'Petrópolis','Centro','Nelson Sá Earp','250 - apto. 402');
	   

INSERT INTO cliente (nome_cliente, nome_usuario, email_cliente, cpf_cliente, data_nascimento_cliente, pais,
					 uf, cidade, bairro, rua, complemento)
					
VALUES ('Ana Souza','ana_souza','anasouza@gmail.com','33333333333','20000622','Brasil','SP',
	   'São Paulo','Pinheiros','Pinho','550');
	   
	   
INSERT INTO cliente (nome_cliente, nome_usuario, email_cliente, cpf_cliente, data_nascimento_cliente, pais,
					 uf, cidade, bairro, rua, complemento)
					
VALUES ('Clara Silva','clarasilva','clarasilva@gmail.com','99999999999','19891213','Brasil','RJ',
	   'Rio de Janeiro','Barra da Tijuca','Camélia','699 - apto. 901');	  
	   
INSERT INTO cliente (nome_cliente, nome_usuario, email_cliente, cpf_cliente, data_nascimento_cliente, pais,
					 uf, cidade, bairro, rua, complemento)
					
VALUES ('Gabriela Matos','gabimatos','gabimatos@gmail.com','44444444444','19990815','Brasil','MG',
	   'Uberaba','Abadia','Campos Sales','350');	  
	   
INSERT INTO cliente (nome_cliente, nome_usuario, email_cliente, cpf_cliente, data_nascimento_cliente, pais,
					 uf, cidade, bairro, rua, complemento)
					
VALUES ('Cristiane de Souza','crisdesouza','souzacris@gmail.com','55555555555','19630422','Brasil','RJ',
	   'Cabo Frio','Passagem','Av. Hilton Massa','240');	

INSERT INTO pedido (data_pedido, status, codigo_cliente)
VALUES ('20220824','aberto','1');

INSERT INTO pedido (data_pedido, status, codigo_cliente)
VALUES ('20220622','finalizado','2');

INSERT INTO pedido (data_pedido, status, codigo_cliente)
VALUES ('20210115','finalizado','3');

INSERT INTO pedido (data_pedido, status, codigo_cliente)
VALUES ('20220822','finalizado','4');

INSERT INTO pedido (data_pedido, status, codigo_cliente)
VALUES ('20220720','finalizado','4');

INSERT INTO itens_pedido (codigo_pedido, codigo_produto, quantidade, desconto)
VALUES ('1','1',2,10);

INSERT INTO itens_pedido (codigo_pedido, codigo_produto, quantidade, desconto)
VALUES ('3','2',3,0);

INSERT INTO itens_pedido (codigo_pedido, codigo_produto, quantidade, desconto)
VALUES ('3','3',2,15);

INSERT INTO itens_pedido (codigo_pedido, codigo_produto, quantidade, desconto)
VALUES ('4','4',1,0);

INSERT INTO itens_pedido (codigo_pedido, codigo_produto, quantidade, desconto)
VALUES ('5','1',2,0);

-- MOSTRA TODAS AS TABELAS CRIADAS
SELECT * FROM cliente;
SELECT * FROM categoria_produto;
SELECT * FROM funcionario;
SELECT * FROM produto;
SELECT * FROM pedido;
SELECT * FROM itens_pedido;

--ATUALIZAÇÃO DE INFORMAÇÃO EM UMA TABELA
UPDATE cliente SET cpf_cliente='12345678910' WHERE codigo_cliente=1;

--EXCLUSÃO DE REGISTRO
DELETE FROM produto WHERE codigo_produto =2;

--STAND BY
SELECT * FROM pedido AS p, itens_pedido AS i, produto as prod
WHERE p.codigo_pedido = i.codigo_pedido;

--CONSULTAS

--JOIN NUMERO 1
--MOSTRA EM QUAL CATEGORIA CADA PRODUTO ESTÁ
SELECT p.nome_produto, c.nome_categoria FROM produto AS p, categoria_produto AS c
WHERE p.codigo_categoria = c.codigo_categoria;

--JOIN NUMERO 2
--MOSTRA QUAIS PRODUTOS CADA FUNCIONÁRIO CADASTROU
SELECT f.nome_funcionario,f.codigo_funcionario,p.nome_produto,p.codigo_produto FROM funcionario AS f 
LEFT JOIN produto AS p 
on f.codigo_funcionario = p.codigo_funcionario;

--CONSULTA USANDO COUNT E GROUP BY
--CHECAR QUANTOS PRODUTOS REGISTRADOS TEM EM CADA CATEGORIA
SELECT codigo_categoria, COUNT(quantidade_estoque)FROM produto 
GROUP BY codigo_categoria ORDER BY codigo_categoria;

--CONSULTA LIVRE

--MOSTRA OS CLIENTES E SEUS PEDIDOS QUE AINDA ESTÃO ABERTOS
SELECT c.nome_cliente, p.codigo_pedido, p.status FROM pedido AS p, cliente AS c
WHERE status = 'aberto' and p.codigo_cliente = c.codigo_cliente;


--NOTA FISCAL  
SELECT c.cpf_cliente, c.nome_cliente,  
p.data_pedido, p.codigo_pedido,
pr.nome_produto, pr.valor_unitario,
ip.quantidade, ip.desconto,
ROUND(((pr.valor_unitario*(1-(ip.desconto*0.01)) * ip.quantidade)),2) AS total
FROM cliente AS c, pedido AS p, produto AS pr, itens_pedido AS ip
WHERE c.codigo_cliente = p.codigo_cliente and c.codigo_cliente = 3 and 
ip.codigo_produto = pr.codigo_produto and ip.codigo_pedido = 3;	 
	 
