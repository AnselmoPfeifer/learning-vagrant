-- MySQL dump 10.13  Distrib 5.6.27, for osx10.8 (x86_64)
--
-- Host: localhost    Database: financeiro
-- ------------------------------------------------------
-- Server version	5.6.27

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Categoria`
--

DROP TABLE IF EXISTS `Categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Categoria` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(255) DEFAULT NULL,
  `fator` int(11) NOT NULL,
  `categoria_pai` int(11) DEFAULT NULL,
  `usuario` int(11) DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  KEY `fk_categoria_categoria` (`categoria_pai`),
  KEY `fk_categoria_usuario` (`usuario`),
  CONSTRAINT `fk_categoria_categoria` FOREIGN KEY (`categoria_pai`) REFERENCES `Categoria` (`codigo`),
  CONSTRAINT `fk_categoria_usuario` FOREIGN KEY (`usuario`) REFERENCES `Usuario` (`codigo`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Categoria`
--

LOCK TABLES `Categoria` WRITE;
/*!40000 ALTER TABLE `Categoria` DISABLE KEYS */;
INSERT INTO `Categoria` VALUES (1,'DESPESAS',-1,NULL,2),(2,'Moradia',-1,1,2),(3,'Alimentação',-1,1,2),(4,'Vestuário',-1,1,2),(5,'Deslocamento',-1,1,2),(6,'Cuidados Pessoais',-1,1,2),(7,'Educação',-1,1,2),(8,'Saúde',-1,1,2),(9,'Lazer',-1,1,2),(10,'Despesas Financeiras',-1,1,2),(11,'RECEITAS',1,NULL,2),(12,'Salário',1,11,2),(13,'Restituições',1,11,2),(14,'Rendimento',1,11,2);
/*!40000 ALTER TABLE `Categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Conta`
--

DROP TABLE IF EXISTS `Conta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Conta` (
  `conta` int(11) NOT NULL AUTO_INCREMENT,
  `dataCadastro` datetime NOT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `favorita` bit(1) NOT NULL,
  `saldoInicial` float NOT NULL,
  `usuario_codigo` int(11) NOT NULL,
  PRIMARY KEY (`conta`),
  KEY `FK_b0vqbmuwlxgrx3y022unu4lg8` (`usuario_codigo`),
  CONSTRAINT `FK_b0vqbmuwlxgrx3y022unu4lg8` FOREIGN KEY (`usuario_codigo`) REFERENCES `Usuario` (`codigo`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Conta`
--

LOCK TABLES `Conta` WRITE;
/*!40000 ALTER TABLE `Conta` DISABLE KEYS */;
INSERT INTO `Conta` VALUES (2,'2016-06-26 17:42:33','teste','\0',111,2),(3,'2016-06-26 22:41:28','teste','\0',11,2);
/*!40000 ALTER TABLE `Conta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Usuario`
--

DROP TABLE IF EXISTS `Usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Usuario` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `ativo` bit(1) NOT NULL,
  `celular` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `idioma` varchar(255) DEFAULT NULL,
  `login` varchar(255) DEFAULT NULL,
  `nascimento` datetime DEFAULT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `senha` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  UNIQUE KEY `UK_fl3uvb053wjkjly059t4j7xjp` (`login`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Usuario`
--

LOCK TABLES `Usuario` WRITE;
/*!40000 ALTER TABLE `Usuario` DISABLE KEYS */;
INSERT INTO `Usuario` VALUES (2,'','67 92752583','anspfeifer@gmail.com','pt_BR','admin','1979-09-22 00:00:00','Anselmo Pfeifer','admin');
/*!40000 ALTER TABLE `Usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acao`
--

DROP TABLE IF EXISTS `acao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acao` (
  `cod_acao` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(30) DEFAULT NULL,
  `origem` char(1) NOT NULL,
  `quantidade` int(11) NOT NULL,
  `sigla` varchar(10) NOT NULL,
  `cod_usuario` int(11) NOT NULL,
  PRIMARY KEY (`cod_acao`),
  KEY `FK_isrisj2kgiwwn50par3rem4o2` (`cod_usuario`),
  CONSTRAINT `FK_isrisj2kgiwwn50par3rem4o2` FOREIGN KEY (`cod_usuario`) REFERENCES `Usuario` (`codigo`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acao`
--

LOCK TABLES `acao` WRITE;
/*!40000 ALTER TABLE `acao` DISABLE KEYS */;
/*!40000 ALTER TABLE `acao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cheque`
--

DROP TABLE IF EXISTS `cheque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cheque` (
  `cheque` int(11) NOT NULL,
  `conta` int(11) NOT NULL,
  `data_cadastro` datetime NOT NULL,
  `situacao` char(1) NOT NULL,
  `lancamento` int(11) DEFAULT NULL,
  PRIMARY KEY (`cheque`,`conta`),
  KEY `fk_cheque_conta` (`conta`),
  KEY `fk_cheque_lancamento` (`lancamento`),
  CONSTRAINT `fk_cheque_conta` FOREIGN KEY (`conta`) REFERENCES `Conta` (`conta`) ON DELETE CASCADE,
  CONSTRAINT `fk_cheque_lancamento` FOREIGN KEY (`lancamento`) REFERENCES `lancamento` (`codigo`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cheque`
--

LOCK TABLES `cheque` WRITE;
/*!40000 ALTER TABLE `cheque` DISABLE KEYS */;
/*!40000 ALTER TABLE `cheque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lancamento`
--

DROP TABLE IF EXISTS `lancamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lancamento` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `data` date DEFAULT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `valor` decimal(10,2) DEFAULT NULL,
  `categoria` int(11) NOT NULL,
  `conta` int(11) NOT NULL,
  `usuario` int(11) NOT NULL,
  PRIMARY KEY (`codigo`),
  KEY `fk_lancamento_categoria` (`categoria`),
  KEY `fk_lancamento_conta` (`conta`),
  KEY `fk_lancamento_usuario` (`usuario`),
  CONSTRAINT `fk_lancamento_categoria` FOREIGN KEY (`categoria`) REFERENCES `Categoria` (`codigo`) ON DELETE CASCADE,
  CONSTRAINT `fk_lancamento_conta` FOREIGN KEY (`conta`) REFERENCES `Conta` (`conta`) ON DELETE CASCADE,
  CONSTRAINT `fk_lancamento_usuario` FOREIGN KEY (`usuario`) REFERENCES `Usuario` (`codigo`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lancamento`
--

LOCK TABLES `lancamento` WRITE;
/*!40000 ALTER TABLE `lancamento` DISABLE KEYS */;
/*!40000 ALTER TABLE `lancamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_permissao`
--

DROP TABLE IF EXISTS `usuario_permissao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario_permissao` (
  `usuario` int(11) NOT NULL,
  `permissao` varchar(50) DEFAULT NULL,
  UNIQUE KEY `UK_sent4jkw3tncsd39oduptyq3j` (`usuario`,`permissao`),
  CONSTRAINT `FK_7r68xb5pbmiv8t38y92ak3dx2` FOREIGN KEY (`usuario`) REFERENCES `Usuario` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_permissao`
--

LOCK TABLES `usuario_permissao` WRITE;
/*!40000 ALTER TABLE `usuario_permissao` DISABLE KEYS */;
INSERT INTO `usuario_permissao` VALUES (2,'ROLE_USUARIO');
/*!40000 ALTER TABLE `usuario_permissao` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-06-27 23:42:41
