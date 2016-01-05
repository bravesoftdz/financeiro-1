--FIN_CONTAS-----------------------------------------------------------------------------------------------
CREATE TABLE FIN_CONTAS (ID INTEGER NOT NULL,
                         ID_TIPO_CONTAS INTEGER NOT NULL,
                         DESCRICAO VARCHAR (255) NOT NULL,
                         STATUS INTEGER NOT NULL);
ALTER TABLE FIN_CONTAS ADD PRIMARY KEY (ID);
ALTER TABLE FIN_CONTAS ADD ID_UNIDADE INTEGER NOT NULL;
ALTER TABLE FIN_CONTAS ADD FOREIGN KEY (ID_UNIDADE) REFERENCES SYS_UNIDADE (ID);

--FIN_TIPO_CONTAS-----------------------------------------------------------------------------------------------
CREATE TABLE FIN_TIPO_CONTAS (ID INTEGER NOT NULL,
                              DESCRICAO VARCHAR (255) NOT NULL);
ALTER TABLE FIN_TIPO_CONTAS ADD PRIMARY KEY (ID);
ALTER TABLE FIN_CONTAS ADD FOREIGN KEY (ID_TIPO_CONTAS) REFERENCES FIN_TIPO_CONTAS (ID);

--FIN_CATEGORIA-----------------------------------------------------------------------------------------------
CREATE TABLE FIN_CATEGORIA (ID INTEGER NOT NULL,
                            DESCRICAO VARCHAR (255) NOT NULL);
ALTER TABLE FIN_CATEGORIA ADD PRIMARY KEY (ID);

--SYS_USUARIO-----------------------------------------------------------------------------------------------
CREATE TABLE SYS_USUARIO (ID INTEGER NOT NULL,
                          LOGIN VARCHAR (20) NOT NULL,
                          SENHA VARCHAR (255) NOT NULL);
ALTER TABLE SYS_USUARIO ADD PRIMARY KEY (ID);
ALTER TABLE SYS_USUARIO ADD UNIQUE (LOGIN);
ALTER TABLE SYS_USUARIO ADD STATUS INTEGER NOT NULL;

--SYS_EMPRESA-----------------------------------------------------------------------------------------------
CREATE TABLE SYS_EMPRESA (ID INTEGER NOT NULL, NOME VARCHAR (255) NOT NULL);
ALTER TABLE SYS_EMPRESA ADD PRIMARY KEY (ID);

--SYS_UNIDADE-----------------------------------------------------------------------------------------------
CREATE TABLE SYS_UNIDADE (ID INTEGER NOT NULL,
                          ID_EMPRESA INTEGER NOT NULL,
                          NOME VARCHAR (255));
ALTER TABLE SYS_UNIDADE ADD PRIMARY KEY (ID);
ALTER TABLE SYS_UNIDADE ADD FOREIGN KEY (ID_EMPRESA) REFERENCES SYS_EMPRESA (ID);

--SYS_USUARIO_UNIDADE-----------------------------------------------------------------------------------------------
CREATE TABLE SYS_USUARIO_UNIDADE (ID_USUARIO INTEGER NOT NULL,
                                  ID_UNIDADE INTEGER NOT NULL);
ALTER TABLE SYS_USUARIO_UNIDADE ADD FOREIGN KEY (ID_USUARIO) REFERENCES SYS_USUARIO (ID);
ALTER TABLE SYS_USUARIO_UNIDADE ADD FOREIGN KEY (ID_UNIDADE) REFERENCES SYS_UNIDADE (ID);
ALTER TABLE SYS_USUARIO_UNIDADE ADD UNIQUE (ID_USUARIO, ID_UNIDADE);
ALTER TABLE SYS_USUARIO_UNIDADE ADD STATUS INTEGER NOT NULL;

--PES_PESSOAS-----------------------------------------------------------------------------------------------
CREATE TABLE PES_PESSOAS (ID INTEGER NOT NULL,
                          NOME VARCHAR (255) NOT NULL,
                          TIPO CHAR (1) NOT NULL,
                          DATA_CADASTRO TIMESTAMP NOT NULL);
ALTER TABLE PES_PESSOAS ADD PRIMARY KEY (ID);

--PES_DADOS_FISICO-----------------------------------------------------------------------------------------------

--PES_DADOS_JURIDICO-----------------------------------------------------------------------------------------------

--FIN_CONTAS_RECEBER-----------------------------------------------------------------------------------------------
CREATE TABLE FIN_CONTAS_RECEBER (ID INTEGER NOT NULL PRIMARY KEY,
                                 ID_CREDOR INTEGER,
                                 ID_UNIDADE INTEGER NOT NULL,
                                 ID_USUARIO INTEGER NOT NULL,
                                 DESCRICAO VARCHAR (255) NOT NULL,
                                 VALOR NUMERIC (18, 2) NOT NULL,
                                 DATA_LANCAMENTO TIMESTAMP NOT NULL,
                                 DATA_VENCIMENTO TIMESTAMP,
                                 STATUS INTEGER NOT NULL,
                                 OBSERVACAO BLOB);

ALTER TABLE fin_contas_receber ADD FOREIGN KEY (ID_UNIDADE) REFERENCES SYS_UNIDADE (ID);
ALTER TABLE FIN_CONTAS_RECEBER ADD FOREIGN KEY (ID_USUARIO) REFERENCES SYS_USUARIO (ID);
ALTER TABLE FIN_CONTAS_RECEBER ADD FOREIGN KEY (ID_CREDOR) REFERENCES pes_pessoas (ID);
--FIN_CONTAS_PAGAR-----------------------------------------------------------------------------------------------
CREATE TABLE FIN_CONTAS_PAGAR (ID INTEGER NOT NULL PRIMARY KEY,
                                 ID_DEVEDOR INTEGER,
                                 ID_UNIDADE INTEGER NOT NULL,
                                 ID_USUARIO INTEGER NOT NULL,
                                 DESCRICAO VARCHAR (255) NOT NULL,
                                 VALOR NUMERIC (18, 2) NOT NULL,
                                 DATA_LANCAMENTO TIMESTAMP NOT NULL,
                                 DATA_VENCIMENTO TIMESTAMP,
                                 STATUS INTEGER NOT NULL,
                                 OBSERVACAO BLOB);

ALTER TABLE fin_contas_PAGAR ADD FOREIGN KEY (ID_UNIDADE) REFERENCES SYS_UNIDADE (ID);
ALTER TABLE FIN_CONTAS_PAGAR ADD FOREIGN KEY (ID_USUARIO) REFERENCES SYS_USUARIO (ID);
ALTER TABLE FIN_CONTAS_PAGAR ADD FOREIGN KEY (ID_DEVEDOR) REFERENCES pes_pessoas (ID);

--FIN_LANCAMENTOS-----------------------------------------------------------------------------------------------
CREATE TABLE FIN_LANCAMENTOS (ID INTEGER NOT NULL,
                              DESCRICAO VARCHAR (255) NOT NULL,
                              ID_CATEGORIA INTEGER NOT NULL,
                              ID_CONTAS INTEGER NOT NULL,
                              VALOR NUMERIC (18, 2) NOT NULL,
                              DATA TIMESTAMP, ID_USUARIO INTEGER NOT NULL,
                              TIPO CHAR (1) NOT NULL);
ALTER TABLE FIN_LANCAMENTOS ADD PRIMARY KEY (ID);
ALTER TABLE FIN_LANCAMENTOS ADD FOREIGN KEY (ID_CATEGORIA) REFERENCES FIN_CATEGORIA (ID);
ALTER TABLE FIN_LANCAMENTOS ADD FOREIGN KEY (ID_CONTAS) REFERENCES FIN_CONTAS (ID);
ALTER TABLE FIN_LANCAMENTOS ADD FOREIGN KEY (ID_USUARIO) REFERENCES SYS_USUARIO (ID);
ALTER TABLE FIN_LANCAMENTOS ADD ID_UNIDADE INTEGER NOT NULL;
ALTER TABLE FIN_LANCAMENTOS ADD FOREIGN KEY (ID_UNIDADE) REFERENCES SYS_UNIDADE (ID);
ALTER TABLE FIN_LANCAMENTOS ADD ID_CONTAS_RECEBER INTEGER;
ALTER TABLE FIN_LANCAMENTOS ADD ID_CONTAS_PAGAR INTEGER;
ALTER TABLE FIN_LANCAMENTOS ADD FOREIGN KEY (ID_CONTAS_RECEBER) REFERENCES FIN_CONTAS_RECEBER (ID);
ALTER TABLE FIN_LANCAMENTOS ADD FOREIGN KEY (ID_CONTAS_PAGAR) REFERENCES FIN_CONTAS_PAGAR (ID);
