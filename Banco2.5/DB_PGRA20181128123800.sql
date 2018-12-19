CREATE DATABASE  IF NOT EXISTS `db_pgra` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `db_pgra`;
-- MySQL dump 10.13  Distrib 8.0.13, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: db_pgra
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.37-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `item_pedido`
--

DROP TABLE IF EXISTS `item_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `item_pedido` (
  `cd_item_pedido` int(11) NOT NULL,
  `cd_pedido` int(11) NOT NULL,
  `cd_produto` int(11) NOT NULL,
  `qt_produto` int(11) NOT NULL,
  PRIMARY KEY (`cd_item_pedido`),
  KEY `fk_item_pedido` (`cd_pedido`),
  KEY `fk_item_produto` (`cd_produto`),
  CONSTRAINT `fk_item_pedido` FOREIGN KEY (`cd_pedido`) REFERENCES `tb_pedido` (`cd_pedido`),
  CONSTRAINT `fk_item_produto` FOREIGN KEY (`cd_produto`) REFERENCES `tb_produto` (`cd_produto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_pedido`
--

LOCK TABLES `item_pedido` WRITE;
/*!40000 ALTER TABLE `item_pedido` DISABLE KEYS */;
INSERT INTO `item_pedido` VALUES (1,1,1,1),(2,2,2,2),(3,3,3,4),(4,4,4,2),(5,5,1,2);
/*!40000 ALTER TABLE `item_pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status_entrega`
--

DROP TABLE IF EXISTS `status_entrega`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `status_entrega` (
  `cd_tipo` int(11) NOT NULL,
  `nm_tipo` varchar(30) NOT NULL,
  PRIMARY KEY (`cd_tipo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status_entrega`
--

LOCK TABLES `status_entrega` WRITE;
/*!40000 ALTER TABLE `status_entrega` DISABLE KEYS */;
INSERT INTO `status_entrega` VALUES (1,'NÃO ENTREGUE'),(2,'ENTREGUE');
/*!40000 ALTER TABLE `status_entrega` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status_pedido`
--

DROP TABLE IF EXISTS `status_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `status_pedido` (
  `cd_status` int(11) NOT NULL,
  `nm_status` varchar(45) NOT NULL,
  PRIMARY KEY (`cd_status`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status_pedido`
--

LOCK TABLES `status_pedido` WRITE;
/*!40000 ALTER TABLE `status_pedido` DISABLE KEYS */;
INSERT INTO `status_pedido` VALUES (1,'NÃO PAGO'),(2,'PAGO'),(3,'PENDENTE'),(4,'ISENTO');
/*!40000 ALTER TABLE `status_pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_bairro`
--

DROP TABLE IF EXISTS `tb_bairro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tb_bairro` (
  `cd_bairro` int(11) NOT NULL,
  `nm_bairro` varchar(45) NOT NULL,
  `cd_cidade` int(11) NOT NULL,
  PRIMARY KEY (`cd_bairro`),
  KEY `fk_bairro_cidade` (`cd_cidade`),
  CONSTRAINT `fk_bairro_cidade` FOREIGN KEY (`cd_cidade`) REFERENCES `tb_cidade` (`cd_cidade`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_bairro`
--

LOCK TABLES `tb_bairro` WRITE;
/*!40000 ALTER TABLE `tb_bairro` DISABLE KEYS */;
INSERT INTO `tb_bairro` VALUES (1,'Vila Tupi',1),(2,'Cidade Ocian',1),(3,'Guilhermina',1),(4,'Aviação',1),(5,'Forte',1),(6,'Boqueirão',1),(7,'Vila Mirim',1);
/*!40000 ALTER TABLE `tb_bairro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_cidade`
--

DROP TABLE IF EXISTS `tb_cidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tb_cidade` (
  `cd_cidade` int(11) NOT NULL,
  `nm_cidade` varchar(45) NOT NULL,
  `cd_uf` int(11) NOT NULL,
  PRIMARY KEY (`cd_cidade`),
  KEY `fk_cidade_uf` (`cd_uf`),
  CONSTRAINT `fk_cidade_uf` FOREIGN KEY (`cd_uf`) REFERENCES `tb_uf` (`cd_uf`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_cidade`
--

LOCK TABLES `tb_cidade` WRITE;
/*!40000 ALTER TABLE `tb_cidade` DISABLE KEYS */;
INSERT INTO `tb_cidade` VALUES (1,'Praia Grande',1);
/*!40000 ALTER TABLE `tb_cidade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_cliente`
--

DROP TABLE IF EXISTS `tb_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tb_cliente` (
  `cd_cliente` int(11) NOT NULL,
  `nm_cliente` varchar(100) NOT NULL,
  `dt_cadastro` date NOT NULL,
  PRIMARY KEY (`cd_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_cliente`
--

LOCK TABLES `tb_cliente` WRITE;
/*!40000 ALTER TABLE `tb_cliente` DISABLE KEYS */;
INSERT INTO `tb_cliente` VALUES (1,'PAULO LEITE COSTA','2018-11-28'),(2,'ERMESOM MATHEUS DINIZ','2018-11-28'),(3,'VINICIUS DE MORAES FILHO','2018-11-28'),(4,'LETICIA FERREIRA SANTANA','2018-11-28'),(5,'VICTOR DOS SANTOS','2018-11-28'),(6,'HOSPITAL IRMA DULCE','2018-11-28'),(7,'CONSTRUMOURA','2018-11-28'),(8,'RENNER','2018-11-28'),(9,'AMERICANAS','2018-11-28'),(10,'PGTEL','2018-11-28');
/*!40000 ALTER TABLE `tb_cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_contato`
--

DROP TABLE IF EXISTS `tb_contato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tb_contato` (
  `cd_contato` int(11) NOT NULL,
  `cd_telefone` char(11) NOT NULL,
  `cd_tipo` int(11) NOT NULL,
  `cd_cliente` int(11) NOT NULL,
  PRIMARY KEY (`cd_contato`),
  KEY `fk_contato_tipo` (`cd_tipo`),
  KEY `fk_contato_cliente` (`cd_cliente`),
  CONSTRAINT `fk_contato_cliente` FOREIGN KEY (`cd_cliente`) REFERENCES `tb_cliente` (`cd_cliente`),
  CONSTRAINT `fk_contato_tipo` FOREIGN KEY (`cd_tipo`) REFERENCES `tipo_contato` (`cd_tipo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_contato`
--

LOCK TABLES `tb_contato` WRITE;
/*!40000 ALTER TABLE `tb_contato` DISABLE KEYS */;
INSERT INTO `tb_contato` VALUES (1,'13996205206',2,1),(2,'13996068390',2,2),(3,'1334729191',1,3),(4,'1334944023',1,4),(5,'13996200098',2,5),(6,'1330259666',3,6),(7,'1390909090',3,7),(8,'1320202020',3,8),(9,'1334966550',3,9),(10,'1330165402',3,10),(11,'1334729898',1,1),(12,'1330969620',1,2),(13,'13996877856',2,3),(14,'13988846884',2,4),(15,'1330167689',1,5);
/*!40000 ALTER TABLE `tb_contato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_fornecedor`
--

DROP TABLE IF EXISTS `tb_fornecedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tb_fornecedor` (
  `cd_fornecedor` int(11) NOT NULL,
  `nm_fornecedor` varchar(100) NOT NULL,
  `cd_telefone` char(11) DEFAULT NULL,
  `cd_cnpj` char(14) DEFAULT NULL,
  `cd_insc_estadual` char(16) DEFAULT NULL,
  PRIMARY KEY (`cd_fornecedor`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_fornecedor`
--

LOCK TABLES `tb_fornecedor` WRITE;
/*!40000 ALTER TABLE `tb_fornecedor` DISABLE KEYS */;
INSERT INTO `tb_fornecedor` VALUES (1,'Aguas da Prata','1330309090','12312345612313','9898909876567816'),(2,'Aguas Mineiras','1190908787',NULL,NULL);
/*!40000 ALTER TABLE `tb_fornecedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_funcao`
--

DROP TABLE IF EXISTS `tb_funcao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tb_funcao` (
  `cd_funcao` int(11) NOT NULL,
  `nm_funcao` varchar(45) NOT NULL,
  PRIMARY KEY (`cd_funcao`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_funcao`
--

LOCK TABLES `tb_funcao` WRITE;
/*!40000 ALTER TABLE `tb_funcao` DISABLE KEYS */;
INSERT INTO `tb_funcao` VALUES (1,'GESTOR'),(2,'ATENDENTE'),(3,'ENTREGADOR');
/*!40000 ALTER TABLE `tb_funcao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_login`
--

DROP TABLE IF EXISTS `tb_login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tb_login` (
  `cd_login` int(11) NOT NULL,
  `ds_acesso` varchar(255) NOT NULL,
  `ds_senha` varchar(255) NOT NULL,
  `ic_nivel` char(1) NOT NULL,
  `cd_usuario` int(11) NOT NULL,
  PRIMARY KEY (`cd_login`),
  KEY `fk_login_usuario` (`cd_usuario`),
  CONSTRAINT `fk_login_usuario` FOREIGN KEY (`cd_usuario`) REFERENCES `tb_usuario` (`cd_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_login`
--

LOCK TABLES `tb_login` WRITE;
/*!40000 ALTER TABLE `tb_login` DISABLE KEYS */;
INSERT INTO `tb_login` VALUES (1,'ricardo','123123','3',1),(2,'marcia','321321','2',2),(3,'jeferson','123123','1',3);
/*!40000 ALTER TABLE `tb_login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_logradouro`
--

DROP TABLE IF EXISTS `tb_logradouro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tb_logradouro` (
  `cd_logradouro` int(11) NOT NULL,
  `cd_cep` char(8) DEFAULT NULL,
  `cd_bairro` int(11) NOT NULL,
  `ds_logradouro` varchar(100) NOT NULL,
  `ds_complemento` varchar(255) DEFAULT NULL,
  `cd_numero` int(11) NOT NULL,
  `cd_cliente` int(11) NOT NULL,
  PRIMARY KEY (`cd_logradouro`),
  KEY `fk_logradouro_cliente` (`cd_cliente`),
  KEY `fk_logradouro_bairro` (`cd_bairro`),
  CONSTRAINT `fk_logradouro_bairro` FOREIGN KEY (`cd_bairro`) REFERENCES `tb_bairro` (`cd_bairro`),
  CONSTRAINT `fk_logradouro_cliente` FOREIGN KEY (`cd_cliente`) REFERENCES `tb_cliente` (`cd_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_logradouro`
--

LOCK TABLES `tb_logradouro` WRITE;
/*!40000 ALTER TABLE `tb_logradouro` DISABLE KEYS */;
INSERT INTO `tb_logradouro` VALUES (1,'11703770',1,'Rua Apinajés','casa',54,1),(2,'11704100',3,'Rua Colombia','casa',250,2),(3,'11703680',1,'Rua Jarus','casa',75,3),(4,'11704123',2,'Rua Guimarães Rosa','casa',818,4),(5,'11704100',2,'Av. Presidente Kennedy','apartamento',7175,5),(6,'11809990',4,'Rua dos Aviões','loja',7123,6),(7,'11123132',5,'Rua Hermes','loja',1234,7),(8,'11709773',6,'Rua jau','loja',7321,8),(9,'11704154',7,'Rua 26 de janeiro','loja',9821,9),(10,'11704100',2,'Av. Presidente Kennedy','loja de celulares',7175,10),(11,'11703100',1,'Rua Guimarães Rosa','casa',841,1);
/*!40000 ALTER TABLE `tb_logradouro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_marca`
--

DROP TABLE IF EXISTS `tb_marca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tb_marca` (
  `cd_marca` int(11) NOT NULL,
  `nm_marca` varchar(45) NOT NULL,
  PRIMARY KEY (`cd_marca`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_marca`
--

LOCK TABLES `tb_marca` WRITE;
/*!40000 ALTER TABLE `tb_marca` DISABLE KEYS */;
INSERT INTO `tb_marca` VALUES (1,'Bonafonte'),(2,'Agua Leve');
/*!40000 ALTER TABLE `tb_marca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_pagamento`
--

DROP TABLE IF EXISTS `tb_pagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tb_pagamento` (
  `cd_pagamento` int(11) NOT NULL,
  `vl_entrada` decimal(9,2) DEFAULT NULL,
  `dt_pagamento` datetime NOT NULL,
  `cd_tipo_pagamento` int(11) NOT NULL,
  `cd_pedido` int(11) NOT NULL,
  PRIMARY KEY (`cd_pagamento`),
  KEY `fk_pagamento_tipo` (`cd_tipo_pagamento`),
  KEY `fk_pagamento_pedido` (`cd_pedido`),
  CONSTRAINT `fk_pagamento_pedido` FOREIGN KEY (`cd_pedido`) REFERENCES `tb_pedido` (`cd_pedido`),
  CONSTRAINT `fk_pagamento_tipo` FOREIGN KEY (`cd_tipo_pagamento`) REFERENCES `tipo_pagamento` (`cd_tipo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_pagamento`
--

LOCK TABLES `tb_pagamento` WRITE;
/*!40000 ALTER TABLE `tb_pagamento` DISABLE KEYS */;
INSERT INTO `tb_pagamento` VALUES (1,20.00,'2018-11-28 12:32:09',1,1),(2,43.00,'2018-11-28 12:32:09',3,2),(3,72.00,'2018-11-28 12:32:09',2,3),(4,48.00,'2018-11-28 12:32:09',4,4);
/*!40000 ALTER TABLE `tb_pagamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_parcela`
--

DROP TABLE IF EXISTS `tb_parcela`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tb_parcela` (
  `cd_parcela` int(11) NOT NULL,
  `dt_vencimento` date NOT NULL,
  `dt_pagamento` datetime DEFAULT NULL,
  `vl_parcela` decimal(9,2) NOT NULL,
  `ic_status` char(1) NOT NULL,
  `cd_pagamento` int(11) NOT NULL,
  PRIMARY KEY (`cd_parcela`),
  KEY `fk_parcela_pagamento` (`cd_pagamento`),
  CONSTRAINT `fk_parcela_pagamento` FOREIGN KEY (`cd_pagamento`) REFERENCES `tb_pagamento` (`cd_pagamento`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_parcela`
--

LOCK TABLES `tb_parcela` WRITE;
/*!40000 ALTER TABLE `tb_parcela` DISABLE KEYS */;
INSERT INTO `tb_parcela` VALUES (1,'2018-12-25',NULL,24.00,'0',3),(2,'2019-01-25',NULL,24.00,'0',3),(3,'2019-02-25',NULL,24.00,'0',3);
/*!40000 ALTER TABLE `tb_parcela` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_pedido`
--

DROP TABLE IF EXISTS `tb_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tb_pedido` (
  `cd_pedido` int(11) NOT NULL,
  `dt_pedido` date NOT NULL,
  `hr_pedido` time NOT NULL,
  `vl_subtotal` decimal(9,2) NOT NULL,
  `vl_desconto` decimal(9,2) NOT NULL,
  `ds_obs` varchar(255) DEFAULT NULL,
  `cd_entrega` int(11) NOT NULL DEFAULT '1',
  `cd_status` int(11) NOT NULL DEFAULT '1',
  `cd_endereco` int(11) DEFAULT NULL,
  `cd_funcionario` int(11) NOT NULL,
  `cd_entregador` int(11) DEFAULT NULL,
  `cd_cliente` int(11) NOT NULL,
  PRIMARY KEY (`cd_pedido`),
  KEY `fk_pedido_funcionario` (`cd_funcionario`),
  KEY `fk_pedido_entregador` (`cd_entregador`),
  KEY `fk_pedido_cliente` (`cd_cliente`),
  KEY `fk_pedido_status` (`cd_status`),
  KEY `fk_pedido_status_entrega` (`cd_entrega`),
  CONSTRAINT `fk_pedido_cliente` FOREIGN KEY (`cd_cliente`) REFERENCES `tb_cliente` (`cd_cliente`),
  CONSTRAINT `fk_pedido_entregador` FOREIGN KEY (`cd_entregador`) REFERENCES `tb_usuario` (`cd_usuario`),
  CONSTRAINT `fk_pedido_funcionario` FOREIGN KEY (`cd_funcionario`) REFERENCES `tb_usuario` (`cd_usuario`),
  CONSTRAINT `fk_pedido_status` FOREIGN KEY (`cd_status`) REFERENCES `status_pedido` (`cd_status`),
  CONSTRAINT `fk_pedido_status_entrega` FOREIGN KEY (`cd_entrega`) REFERENCES `status_entrega` (`cd_tipo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_pedido`
--

LOCK TABLES `tb_pedido` WRITE;
/*!40000 ALTER TABLE `tb_pedido` DISABLE KEYS */;
INSERT INTO `tb_pedido` VALUES (1,'2018-11-28','12:32:09',20.00,0.00,NULL,2,2,1,2,3,1),(2,'2018-11-28','12:32:09',42.00,0.00,NULL,2,2,4,2,3,4),(3,'2018-11-28','12:32:09',72.00,0.00,NULL,2,2,7,2,3,7),(4,'2018-11-28','12:32:09',48.00,0.00,NULL,1,3,10,2,3,10),(5,'2018-11-28','12:32:09',40.00,0.00,NULL,1,1,1,2,3,1);
/*!40000 ALTER TABLE `tb_pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_produto`
--

DROP TABLE IF EXISTS `tb_produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tb_produto` (
  `cd_produto` int(11) NOT NULL,
  `ds_produto` varchar(45) NOT NULL,
  `qt_litros` decimal(9,2) DEFAULT NULL,
  `vl_custo` decimal(9,2) NOT NULL,
  `vl_pj` decimal(9,2) DEFAULT NULL,
  `vl_pf` decimal(9,2) NOT NULL,
  `dt_validade` date NOT NULL,
  `cd_marca` int(11) NOT NULL,
  `cd_fornecedor` int(11) NOT NULL,
  PRIMARY KEY (`cd_produto`),
  KEY `fk_produto_marca` (`cd_marca`),
  KEY `fk_produto_fornecedor` (`cd_fornecedor`),
  CONSTRAINT `fk_produto_fornecedor` FOREIGN KEY (`cd_fornecedor`) REFERENCES `tb_fornecedor` (`cd_fornecedor`),
  CONSTRAINT `fk_produto_marca` FOREIGN KEY (`cd_marca`) REFERENCES `tb_marca` (`cd_marca`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_produto`
--

LOCK TABLES `tb_produto` WRITE;
/*!40000 ALTER TABLE `tb_produto` DISABLE KEYS */;
INSERT INTO `tb_produto` VALUES (1,'GALÃO DE AGUA',20.00,12.00,18.00,20.00,'2019-12-01',1,1),(2,'GALÃO DE AGUA',20.00,13.00,19.00,21.00,'2018-12-01',2,2),(3,'GALÃO DE AGUA',10.00,12.00,18.00,20.00,'2025-12-01',1,2),(4,'GALÃO DE AGUA',25.00,15.00,24.00,27.00,'2020-12-01',2,1);
/*!40000 ALTER TABLE `tb_produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_uf`
--

DROP TABLE IF EXISTS `tb_uf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tb_uf` (
  `cd_uf` int(11) NOT NULL,
  `nm_uf` varchar(45) NOT NULL,
  PRIMARY KEY (`cd_uf`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_uf`
--

LOCK TABLES `tb_uf` WRITE;
/*!40000 ALTER TABLE `tb_uf` DISABLE KEYS */;
INSERT INTO `tb_uf` VALUES (1,'São Paulo');
/*!40000 ALTER TABLE `tb_uf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_usuario`
--

DROP TABLE IF EXISTS `tb_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tb_usuario` (
  `cd_usuario` int(11) NOT NULL,
  `nm_usuario` varchar(100) NOT NULL,
  `log_acesso` datetime DEFAULT NULL,
  `cd_funcao` int(11) NOT NULL,
  PRIMARY KEY (`cd_usuario`),
  KEY `fk_usuario_funcao` (`cd_funcao`),
  CONSTRAINT `fk_usuario_funcao` FOREIGN KEY (`cd_funcao`) REFERENCES `tb_funcao` (`cd_funcao`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_usuario`
--

LOCK TABLES `tb_usuario` WRITE;
/*!40000 ALTER TABLE `tb_usuario` DISABLE KEYS */;
INSERT INTO `tb_usuario` VALUES (1,'RICARDO CAMPOS',NULL,1),(2,'MARCIA LOPES',NULL,2),(3,'JEFERSON FERNANDES',NULL,3);
/*!40000 ALTER TABLE `tb_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_cliente_pf`
--

DROP TABLE IF EXISTS `tipo_cliente_pf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tipo_cliente_pf` (
  `cd_cliente` int(11) NOT NULL,
  `cd_cpf` char(11) DEFAULT NULL,
  `cd_rg` char(11) DEFAULT NULL,
  KEY `fk_tipo_pf_cliente` (`cd_cliente`),
  CONSTRAINT `fk_tipo_pf_cliente` FOREIGN KEY (`cd_cliente`) REFERENCES `tb_cliente` (`cd_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_cliente_pf`
--

LOCK TABLES `tipo_cliente_pf` WRITE;
/*!40000 ALTER TABLE `tipo_cliente_pf` DISABLE KEYS */;
INSERT INTO `tipo_cliente_pf` VALUES (1,'50408464879','56713233x'),(2,NULL,NULL),(3,NULL,NULL),(4,NULL,NULL),(5,NULL,NULL);
/*!40000 ALTER TABLE `tipo_cliente_pf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_cliente_pj`
--

DROP TABLE IF EXISTS `tipo_cliente_pj`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tipo_cliente_pj` (
  `cd_cliente` int(11) NOT NULL,
  `cd_cnpj` char(14) DEFAULT NULL,
  `cd_insc_estadual` char(16) DEFAULT NULL,
  KEY `fk_tipo_pj_cliente` (`cd_cliente`),
  CONSTRAINT `fk_tipo_pj_cliente` FOREIGN KEY (`cd_cliente`) REFERENCES `tb_cliente` (`cd_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_cliente_pj`
--

LOCK TABLES `tipo_cliente_pj` WRITE;
/*!40000 ALTER TABLE `tipo_cliente_pj` DISABLE KEYS */;
INSERT INTO `tipo_cliente_pj` VALUES (6,'49049448000199','123456789102'),(7,'49049412345699','123123123123'),(8,'','767676768767'),(9,'','213123123132'),(10,'','');
/*!40000 ALTER TABLE `tipo_cliente_pj` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_contato`
--

DROP TABLE IF EXISTS `tipo_contato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tipo_contato` (
  `cd_tipo` int(11) NOT NULL,
  `nm_tipo` varchar(45) NOT NULL,
  PRIMARY KEY (`cd_tipo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_contato`
--

LOCK TABLES `tipo_contato` WRITE;
/*!40000 ALTER TABLE `tipo_contato` DISABLE KEYS */;
INSERT INTO `tipo_contato` VALUES (1,'RESIDENCIAL'),(2,'CELULAR'),(3,'COMERCIAL');
/*!40000 ALTER TABLE `tipo_contato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_pagamento`
--

DROP TABLE IF EXISTS `tipo_pagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tipo_pagamento` (
  `cd_tipo` int(11) NOT NULL,
  `nm_tipo` varchar(45) NOT NULL,
  PRIMARY KEY (`cd_tipo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_pagamento`
--

LOCK TABLES `tipo_pagamento` WRITE;
/*!40000 ALTER TABLE `tipo_pagamento` DISABLE KEYS */;
INSERT INTO `tipo_pagamento` VALUES (1,'DINHEIRO'),(2,'CARTÃO DE CRÉDITO'),(3,'CARTÃO DE DÉBITO'),(4,'CARNÊ');
/*!40000 ALTER TABLE `tipo_pagamento` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-11-28 12:39:16
