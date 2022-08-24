CREATE TABLE setor(codigo_setor SERIAL PRIMARY KEY, nome varchar(20) NOT NULL UNIQUE);

CREATE TABLE empregado(matricula INT PRIMARY KEY, 
	     nome VARCHAR(40) NOT NULL, 
	     email VARCHAR(30) UNIQUE, 
	     codigo_setor INT,
	     FOREIGN KEY (codigo_setor) REFERENCES setor(codigo_setor) ON UPDATE CASCADE ON DELETE NO ACTION);
		 
		 
INSERT INTO setor (nome) VALUES ('RH');
INSERT INTO setor (nome) VALUES ('CPD');
INSERT INTO setor (nome) VALUES ('COMPRAS');

INSERT INTO empregado (matricula, nome, email, codigo_setor) VALUES (123, 'JOÃO DA SILVA', 'joao@gmail.com',1);
INSERT INTO empregado (matricula, nome, email, codigo_setor) VALUES (124, 'ANA DA SILVA', 'ana@gmail.com',2);


UPDATE setor SET codigo_setor = 100 WHERE codigo_setor = 1;


SELECT * FROM setor;
SELECT * FROM empregado;



CREATE TABLE agencia (numero_banco INT PRIMARY KEY, numero_agencia INT NOT NULL, nome_banco VARCHAR(20) NOT NULL);

CREATE TABLE conta (numero_conta INT PRIMARY KEY,
			saldo NUMERIC, 
			titular VARCHAR(30) NOT NULL,
			numero_banco INT,
			FOREIGN KEY (numero_banco) REFERENCES agencia(numero_banco) ON UPDATE CASCADE ON DELETE CASCADE);

INSERT INTO agencia (numero_banco, numero_agencia, nome_banco) VALUES (4556,123,'ITAU');
INSERT INTO agencia (numero_banco, numero_agencia, nome_banco) VALUES (6978,456,'BRADESCO');
INSERT INTO agencia (numero_banco, numero_agencia, nome_banco) VALUES (4896,789,'NUBANK');
INSERT INTO agencia (numero_banco, numero_agencia, nome_banco) VALUES (4699,789,'BANCO DO BRASIL');
INSERT INTO agencia (numero_banco, numero_agencia, nome_banco) VALUES (5556,888,'INTER');
INSERT INTO agencia (numero_banco, numero_agencia, nome_banco) VALUES (5996,998,'SANTANDER');
INSERT INTO agencia (numero_banco, numero_agencia, nome_banco) VALUES (9999,555,'CAIXA');


INSERT INTO conta(numero_conta, saldo, titular, numero_banco) VALUES (321, 12500.50, 'JOÃO DA SILVA', 4556);
INSERT INTO conta(numero_conta, saldo, titular, numero_banco) VALUES (352, 15500.50, 'CLARISSA VOGEL', 6978);
INSERT INTO conta(numero_conta, saldo, titular, numero_banco) VALUES (366, 1200.50, 'ANA SOUZA', 6978);

DELETE FROM agencia WHERE numero_banco=4556

SELECT * FROM agencia ORDER BY numero_banco DESC LIMIT 3;

SELECT * FROM agencia WHERE nome_banco LIKE 'B%';

SELECT * FROM conta WHERE saldo > 5000;

SELECT * FROM conta WHERE NOT saldo > 5000;

SELECT * FROM conta WHERE saldo BETWEEN  5000 AND 13000;

SELECT * FROM conta WHERE saldo in (320, 321);

SELECT * FROM agencia WHERE nome_banco='ITAU';

SELECT c.titular,c.saldo,c.numero_conta, a.nome_banco FROM conta AS c, agencia AS a
WHERE c.numero_banco = a.numero_banco ORDER BY a.nome_banco DESC;

SELECT * FROM agencia;
SELECT * FROM conta;