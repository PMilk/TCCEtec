CREATE DATABASE  IF NOT EXISTS `db_pgra` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `db_pgra`;
-- MySQL dump 10.13  Distrib 8.0.13, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: db_pgra
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.36-MariaDB

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
  `cd_item_pedido` int(11) NOT NULL AUTO_INCREMENT,
  `cd_pedido` int(11) NOT NULL,
  `cd_produto` int(11) NOT NULL,
  `qt_produto` int(11) NOT NULL,
  PRIMARY KEY (`cd_item_pedido`),
  KEY `fk_item_pedido` (`cd_pedido`),
  KEY `fk_item_produto` (`cd_produto`),
  CONSTRAINT `fk_item_pedido` FOREIGN KEY (`cd_pedido`) REFERENCES `tb_pedido` (`cd_pedido`),
  CONSTRAINT `fk_item_produto` FOREIGN KEY (`cd_produto`) REFERENCES `tb_produto` (`cd_produto`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_pedido`
--

LOCK TABLES `item_pedido` WRITE;
/*!40000 ALTER TABLE `item_pedido` DISABLE KEYS */;
INSERT INTO `item_pedido` VALUES (6,0,1,1),(7,0,3,2),(8,0,7,2),(9,1,1,1),(10,1,3,3),(11,1,7,1),(12,2,1,1),(13,2,3,3),(14,2,7,1),(15,3,1,1),(16,4,3,1),(17,5,1,1),(18,6,1,3),(19,7,1,1),(20,8,1,1),(21,9,1,1),(22,10,1,1),(23,11,1,2),(24,12,1,1),(25,13,1,1),(26,14,1,1),(27,15,1,1),(28,16,1,1),(29,17,1,1),(30,18,1,1),(31,19,1,1),(32,20,1,10),(33,21,1,1),(34,22,1,1),(35,23,1,1),(36,24,1,1),(37,25,1,2),(38,25,7,1),(39,26,3,1);
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
INSERT INTO `status_entrega` VALUES (1,'ENTREGUE'),(2,'NÃO ENTREGUE');
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
INSERT INTO `status_pedido` VALUES (1,'PAGO'),(2,'PENDENTE'),(3,'NÃO PAGO');
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
INSERT INTO `tb_bairro` VALUES (1,'Xixová',1),(2,'Tude Bastos',1),(3,'Glória',1),(4,'Jardim Guaramar',1),(5,'Vila Sônia',1),(6,'Maxland',1),(7,'São Jorge',1),(8,'Caieiras',1),(9,'Tupiry',1),(10,'Anhanguera',1),(11,'Jardim Quietude',1),(12,'Parque Perticaratti',1),(13,'Santa Marina',1),(14,'Canto do Forte',1),(15,'Boqueirão',1),(16,'Guilhermina',1),(17,'Aviação',1),(18,'Tupi',1),(19,'Ocian',1),(20,'Mirim',1),(21,'Andaraguá',1),(22,'Nova Mirim',1),(23,'Ribeirópolis',1),(24,'Parque das Américas',1),(25,'Jardim Alice',1),(26,'Jardim Esmeralda',1),(27,'Jardim Samambaia',1),(28,'Sanharol',1),(29,'Melvi',1),(30,'Jardim Princesa',1),(31,'Cidade da Criança',1),(32,'Maracanã',1),(33,'Aloha',1),(34,'Caiçara',1),(35,'Imperador',1),(36,'Real',1),(37,'Flórida',1),(38,'Solemar',1);
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
  `dt_cadastro` datetime DEFAULT NULL,
  PRIMARY KEY (`cd_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_cliente`
--

LOCK TABLES `tb_cliente` WRITE;
/*!40000 ALTER TABLE `tb_cliente` DISABLE KEYS */;
INSERT INTO `tb_cliente` VALUES (0,'PAULO LEITE COSTA','2018-12-20 04:53:13'),(1,'VINICIUS MORAES FILHO','2018-12-20 05:01:18'),(2,'VITOR PEREIRA DA SILVA','2018-12-20 05:07:32'),(3,'LETICIA SANTANA','2018-12-20 05:10:52'),(4,'DASDSADSA','2018-12-20 05:11:15'),(5,'ERMESOM MATHEUS DINIZ','2018-12-20 05:12:00'),(6,'PGTEL','2018-12-20 05:14:02'),(7,'SPEEDY GRáFICA','2018-12-20 05:17:05'),(8,'HABITAR IMóVEIS','2018-12-20 05:22:13'),(9,'LUIS FERNANDO LEITE','2018-12-30 22:36:33'),(10,'HABITAR IMOVEIS','2018-12-30 22:38:33'),(11,'FREDERICO JONSON','2018-12-30 22:40:41'),(12,'ANA PAULA LEITE COSTA','2018-12-30 22:46:04'),(13,'BRUNO LEITE COSTA','2018-12-30 22:47:14'),(14,'AMANNDA DA SILVA BRITO COSTA','2018-12-31 08:05:39'),(15,'ARIANE ALVES LEITE','2019-01-01 23:58:43'),(16,'FELIPE DOS SANTOS','2019-01-02 23:53:42'),(17,'CARMEM DE SOUZA LIMA','2019-01-03 16:58:25'),(18,'JUçARA CONCEIçãO CANFILD LEITE','2019-01-04 16:30:16'),(19,'JUçARA CONCEIçãO CANFILD LEITE','2019-01-04 16:31:20'),(20,'LUCAS LIMA','2019-01-04 16:35:04'),(21,'JUZICLEUDA DA SILVA','2019-01-08 01:20:44'),(22,'TESTE','2019-01-08 16:04:10'),(23,'TESTE 2','2019-01-08 16:05:07'),(24,'ASDASD','2019-01-08 16:05:30');
/*!40000 ALTER TABLE `tb_cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_contato`
--

DROP TABLE IF EXISTS `tb_contato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tb_contato` (
  `cd_contato` int(11) NOT NULL AUTO_INCREMENT,
  `cd_telefone` char(11) NOT NULL,
  `cd_tipo` int(11) NOT NULL,
  `cd_cliente` int(11) NOT NULL,
  PRIMARY KEY (`cd_contato`),
  KEY `fk_contato_tipo` (`cd_tipo`),
  KEY `fk_contato_cliente` (`cd_cliente`),
  CONSTRAINT `fk_contato_cliente` FOREIGN KEY (`cd_cliente`) REFERENCES `tb_cliente` (`cd_cliente`),
  CONSTRAINT `fk_contato_tipo` FOREIGN KEY (`cd_tipo`) REFERENCES `tipo_contato` (`cd_tipo`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_contato`
--

LOCK TABLES `tb_contato` WRITE;
/*!40000 ALTER TABLE `tb_contato` DISABLE KEYS */;
INSERT INTO `tb_contato` VALUES (2,'13996205206',1,0),(3,'13996205206',1,0),(4,'1334729191',2,1),(5,'13988846884',1,1),(6,'1334728124',2,2),(7,'1330162502',3,6),(8,'1330259666',3,7),(9,'1334944023',3,8),(10,'1334944023',3,10),(11,'13996200909',1,0),(12,'1330909090',2,17),(13,'13999999999',1,21),(14,'13999999999',1,24);
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
INSERT INTO `tb_fornecedor` VALUES (1,'DISTRIBUIDORA ÁGUA DE MINAS',NULL,NULL,NULL),(2,'DISTRIBUIDORA FERREIRA',NULL,NULL,NULL);
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
INSERT INTO `tb_funcao` VALUES (1,'VENDEDOR');
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
INSERT INTO `tb_login` VALUES (1,'admin','91f5167c34c400758115c2a6826ec2e3','2',1);
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
INSERT INTO `tb_logradouro` VALUES (0,'11703770',18,'Rua Apinajés','casa',54,0),(1,'11702210',16,'Avenida Guadalajara','etec',941,1),(2,'11704730',20,'Rua Vinte e Seis de Janeiro','casa',489,2),(3,'11700320',14,'Rua Afonso Pena','apt 26',35,3),(4,'11704100',19,'Avenida Presidente Kennedy','lado par, loja de celulares',7175,6),(5,'11704160',19,'Rua Guimarães Rosa','gráfica, loja',849,7),(6,'11704100',19,'Avenida Presidente Kennedy','lado par, loja de imoveis',7174,8),(7,'11704760',20,'Rua Aldo Coli','casa',123,9),(8,'11704100',19,'Avenida Presidente Kennedy','lado par',7175,10),(9,'',15,'Rua das Pitangas','casa',56,0),(10,'11703680',18,'Rua Jarus','casa',75,17),(11,'11704160',19,'Rua Guimarães Rosa','casa/sobrado',831,18),(12,'11704160',19,'Rua Guimarães Rosa','casa/sobrado',831,19),(13,'11702100',16,'Rua México','sobrado',123,21),(14,'11703770',18,'Rua Apinajés','casa',54,23),(15,'11703770',18,'Rua Apinajés','casa',34,24);
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
INSERT INTO `tb_marca` VALUES (1,'Bonafonte'),(2,'Leve');
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
  `dt_pagamento` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
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
  `vl_subtotal` decimal(9,2) DEFAULT NULL,
  `vl_desconto` decimal(9,2) DEFAULT NULL,
  `ds_obs` varchar(255) DEFAULT NULL,
  `cd_entrega` int(11) NOT NULL DEFAULT '2',
  `cd_status` int(11) NOT NULL DEFAULT '3',
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
INSERT INTO `tb_pedido` VALUES (0,'2019-01-02','17:31:45',62.40,NULL,NULL,2,3,4,1,NULL,6),(1,'2019-01-02','18:50:55',100.40,NULL,NULL,2,3,0,1,NULL,0),(2,'2019-01-02','18:55:21',100.40,NULL,NULL,2,3,-10,1,NULL,0),(3,'2019-01-02','19:21:37',20.00,NULL,NULL,2,3,-10,1,NULL,0),(4,'2019-01-02','19:23:41',25.00,NULL,NULL,2,3,-10,1,NULL,0),(5,'2019-01-02','21:00:05',18.00,NULL,NULL,2,3,6,1,NULL,8),(6,'2019-01-03','01:27:25',60.00,NULL,NULL,2,3,-10,1,NULL,0),(7,'2019-01-03','02:52:30',20.00,NULL,NULL,2,3,0,1,NULL,0),(8,'2019-01-03','02:54:13',20.00,NULL,NULL,2,3,-10,1,NULL,16),(9,'2019-01-03','02:56:41',20.00,NULL,NULL,2,3,-10,1,NULL,16),(10,'2019-01-03','08:24:10',20.00,NULL,NULL,2,3,9,1,NULL,0),(11,'2019-01-03','19:59:21',40.00,NULL,NULL,2,3,10,1,NULL,17),(12,'2019-01-04','18:15:42',20.00,NULL,NULL,2,3,9,1,NULL,0),(13,'2019-01-04','18:23:05',20.00,NULL,NULL,2,3,1,1,NULL,1),(14,'2019-01-04','18:31:06',18.00,NULL,NULL,2,3,4,1,NULL,6),(15,'2019-01-04','18:32:57',20.00,NULL,NULL,2,3,-10,1,NULL,0),(16,'2019-01-04','15:40:37',20.00,NULL,NULL,2,3,-10,1,NULL,0),(17,'2019-01-04','15:40:45',20.00,NULL,NULL,2,3,-10,1,NULL,0),(18,'2019-01-04','16:00:13',20.00,NULL,NULL,2,3,2,1,NULL,2),(19,'2019-01-04','16:35:34',20.00,NULL,NULL,2,3,11,1,NULL,18),(20,'2019-01-04','16:36:14',200.00,NULL,NULL,2,3,11,1,NULL,18),(21,'2019-01-04','16:55:38',20.00,NULL,NULL,2,3,0,1,NULL,0),(22,'2019-01-04','16:58:30',20.00,NULL,NULL,2,3,9,1,NULL,0),(23,'2019-01-04','16:59:11',20.00,NULL,NULL,2,3,11,1,NULL,18),(24,'2019-01-04','17:01:29',20.00,NULL,NULL,2,3,11,1,NULL,18),(25,'2019-01-08','01:22:13',45.40,NULL,NULL,2,3,13,1,NULL,21),(26,'2019-01-08','16:10:20',25.00,NULL,NULL,2,3,-10,1,NULL,22);
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
INSERT INTO `tb_produto` VALUES (1,'Galão de Água',20.00,10.00,18.00,20.00,'2021-02-01',1,2),(3,'Galão de Água',20.00,15.00,20.00,25.00,'2023-02-01',2,1),(7,'Garrafinha de Água',0.50,1.70,2.20,5.40,'2021-02-01',1,2);
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
  `sg_uf` char(2) NOT NULL,
  PRIMARY KEY (`cd_uf`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_uf`
--

LOCK TABLES `tb_uf` WRITE;
/*!40000 ALTER TABLE `tb_uf` DISABLE KEYS */;
INSERT INTO `tb_uf` VALUES (1,'SP');
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
INSERT INTO `tb_usuario` VALUES (1,'RICARDO CAMPOS',NULL,1);
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
INSERT INTO `tipo_cliente_pf` VALUES (0,'50408464879',''),(1,'','56713266x'),(2,'',''),(3,'',''),(4,'','56713233x'),(5,'',''),(9,'',''),(11,'',''),(12,'',''),(13,'',''),(14,'',''),(16,'',''),(17,'',''),(18,'',''),(19,'',''),(20,'',''),(21,'',''),(22,'',''),(23,'',''),(24,'','');
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
INSERT INTO `tipo_cliente_pj` VALUES (6,'',''),(7,'12345678912345',''),(8,'','945472237199'),(10,'','');
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
INSERT INTO `tipo_contato` VALUES (1,'CELULAR'),(2,'RESIDENCIAL'),(3,'COMERCIAL');
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
/*!40000 ALTER TABLE `tipo_pagamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'db_pgra'
--

--
-- Dumping routines for database 'db_pgra'
--
/*!50003 DROP PROCEDURE IF EXISTS `cadastrarCliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `cadastrarCliente`(IN `nome` VARCHAR(100))
BEGIN
	INSERT INTO TB_CLIENTE(cd_cliente,nm_cliente,dt_cadastro) select max(cd_cliente)+1 as id_cliente,nome,current_timestamp() from tb_cliente;
	SELECT max(cd_cliente) as cd_cliente from tb_cliente;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `cadastrarClientePf` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `cadastrarClientePf`(IN `id_cliente` INT, IN `cpf` CHAR(11), IN `rg` CHAR(11))
BEGIN
INSERT INTO tipo_cliente_pf(cd_cliente,cd_cpf,cd_rg) VALUE(id_cliente,cpf,rg);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `cadastrarClientePj` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `cadastrarClientePj`(IN id_cliente int, in cnpj char(14),in insc_estadual char(16))
BEGIN
INSERT INTO tipo_cliente_pj(cd_cliente,cd_cnpj,cd_insc_estadual) VALUE(id_cliente,cnpj,insc_estadual);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `cadastrarContato` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `cadastrarContato`(IN id_cliente int, in telefone char(11),in tipo int)
BEGIN
INSERT INTO TB_CONTATO(cd_telefone,cd_tipo,cd_cliente) VALUE(telefone,tipo,id_cliente);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `cadastrarLogradouro` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `cadastrarLogradouro`(IN cep char(8), in id_bairro int,in logradouro varchar(100),in complemento varchar(255),in numero int, in id_cliente int)
BEGIN
INSERT INTO tb_logradouro (SELECT MAX(cd_logradouro)+1,cep,id_bairro,logradouro,complemento,numero,id_cliente from tb_logradouro);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-01-09  3:20:27
