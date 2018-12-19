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
INSERT INTO `tb_cliente` VALUES (0,'PAULO LEITE COSTA','2018-12-12 01:57:11'),(1,'PGTEL','2018-12-12 02:12:36'),(2,'','2018-12-12 02:14:29'),(3,'','2018-12-12 14:53:25'),(4,'DSAD','2018-12-12 15:22:36'),(5,'DSAD','2018-12-12 15:25:39'),(6,'ARIANE ALVES LEITE','2018-12-12 16:30:27'),(7,'BRUNO LEITE COSTA','2018-12-12 23:47:20'),(8,'TESTE','2018-12-12 23:59:21'),(9,'SPEEDY GRÁFICA','2018-12-13 00:08:28'),(10,'ROBERTO CARLOS','2018-12-17 01:52:15'),(11,'VINICIUS DE MORAES FILHO','2018-12-18 21:30:09'),(12,'BRUNO LEITE COSTA','2018-12-18 23:55:29'),(13,'ANA PAULA LEITE COSTA','2018-12-19 00:17:54'),(14,'ANA PAULA LEITE COSTA','2018-12-19 00:18:25'),(15,'ANA PAULA LEITE COSTA','2018-12-19 00:18:35'),(16,'ANA PAULA LEITE COSTA','2018-12-19 00:19:06'),(17,'ANA PAULA LEITE COSTA','2018-12-19 00:20:19'),(18,'FERNANDO DE SOUZA','2018-12-19 00:20:29'),(19,'FERNANDO DE SOUZA','2018-12-19 00:20:33'),(20,'FERNANDO DE SOUZA','2018-12-19 00:21:05'),(21,'FERNANDO DE SOUZA','2018-12-19 00:21:32'),(22,'SDADASDSA','2018-12-19 00:21:42'),(23,'SADASD','2018-12-19 00:24:27'),(24,'SADASD','2018-12-19 00:25:25'),(25,'DASDASDAS','2018-12-19 00:25:37'),(26,'DASDASDAS','2018-12-19 00:25:52'),(27,'DASDASDAS','2018-12-19 00:26:19'),(28,'DASDASDAS','2018-12-19 00:27:26'),(29,'PAULO LEITE COSTA','2018-12-19 00:51:23'),(30,'PAULO LEITE COSTA','2018-12-19 00:51:47'),(31,'PAULO LEITE COSTA','2018-12-19 00:52:07'),(32,'PAULO LEITE COSTA','2018-12-19 00:52:15'),(33,'PAULO LEITE COSTA','2018-12-19 00:53:22'),(34,'PAULO LEITE COSTA','2018-12-19 00:53:40'),(35,'PAULO LEITE COSTA','2018-12-19 00:54:00'),(36,'PAULO LEITE COSTA','2018-12-19 00:55:56'),(37,'PAULO LEITE COSTA','2018-12-19 00:57:28'),(38,'PAULO LEITE COSTA','2018-12-19 00:59:03'),(39,'PAULO LEITE COSTA','2018-12-19 01:03:00'),(40,'PAULO LEITE COSTA','2018-12-19 01:03:06'),(41,'PAULO LEITE COSTA','2018-12-19 01:04:19'),(42,'PAULO LEITE COSTA','2018-12-19 01:04:21');
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
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_contato`
--

LOCK TABLES `tb_contato` WRITE;
/*!40000 ALTER TABLE `tb_contato` DISABLE KEYS */;
INSERT INTO `tb_contato` VALUES (29,'13996205206',1,0),(31,'1330162502',3,1),(32,'13997173800',1,7),(33,'13996330215',1,10),(34,'1334729191',2,11),(35,'13996205206',1,11);
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
INSERT INTO `tb_login` VALUES (1,'paulo','paulo','2',1);
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
INSERT INTO `tb_logradouro` VALUES (0,'11703770',18,'Rua Apinajés','casa',54,0),(1,'11704100',19,'Avenida Presidente Kennedy','lado par, loja de celulares',7175,1),(2,'12700999',1,'','',0,2),(3,'',1,'','',0,3),(4,'',1,'','',0,5),(5,'',1,'','',0,0),(6,'11703680',18,'Rua Jarus','casa',75,6),(7,'11704160',19,'Rua Guimarães Rosa','sobrado',841,9),(8,'11703770',18,'Rua Apinajés','Casa',54,10),(9,'11704100',19,'Avenida Presidente Kennedy','lado par, casa',7175,11),(10,'11703770',18,'Rua Apinajés','',0,29),(11,'11703770',18,'Rua Apinajés','',0,30),(12,'11703770',18,'Rua Apinajés','',0,31),(13,'11703770',18,'Rua Apinajés','',0,32),(14,'11703770',18,'Rua Apinajés','',0,33),(15,'11703770',18,'Rua Apinajés','',0,34),(16,'11703770',18,'Rua Apinajés','',0,35),(17,'11703770',18,'Rua Apinajés','',0,36),(18,'11703770',18,'Rua Apinajés','',0,37),(19,'11703770',18,'Rua Apinajés','',0,38),(20,'11703770',18,'Rua Apinajés','',0,39),(21,'11703770',18,'Rua Apinajés','',0,40),(22,'11703770',18,'Rua Apinajés','',0,41),(23,'11703770',18,'Rua Apinajés','',0,42);
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
  `vl_subtotal` decimal(9,2) NOT NULL,
  `vl_desconto` decimal(9,2) NOT NULL,
  `ds_obs` varchar(255) DEFAULT NULL,
  `cd_entrega` int(11) NOT NULL,
  `cd_status` int(11) NOT NULL,
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
INSERT INTO `tb_usuario` VALUES (1,'PAULO LEITE COSTA',NULL,1);
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
INSERT INTO `tipo_cliente_pf` VALUES (0,'50408464879','56713233X'),(2,'',''),(3,'',''),(5,'',''),(6,'',''),(7,'',''),(8,'',''),(10,'666.616.777','59.532.528-'),(11,'',''),(12,'',''),(13,'266.661.222','12.312.737-'),(14,'266.661.222','12.312.737-'),(15,'266.661.222','12.312.737-'),(16,'266.661.222','12.312.737-'),(17,'266.661.222','12.312.737-'),(18,'266.661.222','12.312.737-'),(19,'266.661.222','12.312.737-'),(20,'266.661.222','12.312.737-'),(21,'266.661.222','12.312.737-'),(22,'111.111.111','11.111.111-'),(23,'',''),(24,'',''),(29,'',''),(30,'',''),(31,'',''),(32,'',''),(33,'',''),(34,'',''),(35,'',''),(36,'',''),(37,'',''),(38,'',''),(39,'',''),(40,'',''),(41,'',''),(42,'','');
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
INSERT INTO `tipo_cliente_pj` VALUES (1,'',''),(9,'',''),(25,'',''),(26,'',''),(27,'',''),(28,'','');
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
-- Dumping routines for database 'db_pgra'
--
/*!50003 DROP PROCEDURE IF EXISTS `cadastrarCliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `cadastrarCliente`( IN nome varchar(100))
BEGIN
	INSERT INTO TB_CLIENTE(cd_cliente,nm_cliente,dt_cadastro) select max(cd_cliente)+1 as id_cliente,nome,current_timestamp() from tb_cliente;
	SELECT MAX(cd_cliente) as cd_cliente from tb_cliente;
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
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `cadastrarClientePf`(IN id_cliente int, in cpf char(11),in rg char(11))
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

-- Dump completed on 2018-12-19  3:30:01
