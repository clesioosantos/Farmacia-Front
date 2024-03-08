CREATE DATABASE  IF NOT EXISTS `rh` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `rh`;
-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: rh
-- ------------------------------------------------------
-- Server version	8.0.26

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cargos`
--

DROP TABLE IF EXISTS `cargos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cargos` (
  `cargo_id` varchar(10) NOT NULL,
  `cargo_desc` varchar(35) DEFAULT NULL,
  `min_salario` float DEFAULT NULL,
  `max_salario` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cargos`
--

LOCK TABLES `cargos` WRITE;
/*!40000 ALTER TABLE `cargos` DISABLE KEYS */;
INSERT INTO `cargos` VALUES ('PRES','Presidente',20000,40000),('VP_AD','Vice Presidente administrativo',15000,30000),('ASS_AD','Assistente Administrativo',3000,6000),('GER_FIN','Gerente Financeiro',8200,16000),('CONTAD','Contador',4200,9000),('GER_CTB','Gerente Contabil',8200,16000),('GER_VDS','Gerente Vendas',10000,20000),('vendas','Vendedor',6000,12000),('GER_COM','Gerente Compras',8000,15000),('Compras','Comprador',2500,5500),('Estoque','Estoquista',2000,5000),('EXP','Expedidor',2500,5500),('TI_PROG','Programador',4000,10000),('GER_MK','Gerente Marketing',9000,15000),('MK_REP','Marketing',4000,9000),('RH_REP','Recursos Humanos',4000,9000),('RP_REP','Representante Relacoes Publicas',4500,10500);
/*!40000 ALTER TABLE `cargos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departamentos`
--

DROP TABLE IF EXISTS `departamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departamentos` (
  `departamento_id` int NOT NULL,
  `departamento_nome` varchar(30) DEFAULT NULL,
  `gerente_id` int DEFAULT NULL,
  `local_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamentos`
--

LOCK TABLES `departamentos` WRITE;
/*!40000 ALTER TABLE `departamentos` DISABLE KEYS */;
INSERT INTO `departamentos` VALUES (10,'Administrativo',200,1700),(20,'Marketing',201,1800),(30,'Compras',114,1700),(40,'Recursos Humanos',203,2400),(50,'Expedicao',121,1500),(60,'TI',103,1400),(70,'Relacoes Publicas',204,2700),(80,'Vendas',145,2500),(90,'Executivo',100,1700),(100,'Financeiro',108,1700),(110,'Contabilidade',205,1700),(120,'Tesouraria',NULL,1700),(140,'Credito',NULL,1700),(160,'Beneficios',NULL,1700),(170,'Manufatura',NULL,1700),(180,'Construcao',NULL,1700),(190,'Contratacao',NULL,1700),(200,'Operacoes',NULL,1700),(210,'Suporte TI',NULL,1700),(230,'Helpdesk',NULL,1700),(240,'Vendas Governo',NULL,1700),(260,'Recrutamento',NULL,1700),(270,'Folha de Pagamento',NULL,1700);
/*!40000 ALTER TABLE `departamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funcionarios`
--

DROP TABLE IF EXISTS `funcionarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `funcionarios` (
  `funcionario_id` int NOT NULL,
  `pre_nome` varchar(20) DEFAULT NULL,
  `sobre_nome` varchar(25) DEFAULT NULL,
  `email` varchar(25) DEFAULT NULL,
  `fone` varchar(20) DEFAULT NULL,
  `dt_admiss` date DEFAULT NULL,
  `cargo` varchar(10) DEFAULT NULL,
  `salario` float DEFAULT NULL,
  `pc_comiss` float DEFAULT NULL,
  `gerente_id` int DEFAULT NULL,
  `departamento_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcionarios`
--

LOCK TABLES `funcionarios` WRITE;
/*!40000 ALTER TABLE `funcionarios` DISABLE KEYS */;
INSERT INTO `funcionarios` VALUES (100,'Steven','King','SKING','515.123.4567','1987-06-17','PRES',24000,NULL,NULL,90),(101,'Neena','Kochhar','NKOCHHAR','515.123.4568','1989-09-21','VP_AD',17000,NULL,100,90),(102,'Lex','De Haan','LDEHAAN','515.123.4569','1993-01-13','VP_AD',17000,NULL,100,90),(103,'Alexander','Hunold','AHUNOLD','590.423.4567','1990-01-03','TI_PROG',9000,NULL,102,60),(104,'Bruce','Ernst','BERNST','590.423.4568','1991-05-21','TI_PROG',6000,NULL,103,60),(105,'David','Austin','DAUSTIN','590.423.4569','1997-06-25','TI_PROG',4800,NULL,103,60),(106,'Valli','Pataballa','VPATABAL','590.423.4560','1998-02-05','TI_PROG',4800,NULL,103,60),(107,'Diana','Lorentz','DLORENTZ','590.423.5567','1999-02-07','TI_PROG',4200,NULL,103,60),(108,'Nancy','Greenberg','NGREENBE','515.124.4569','1994-08-17','GER_FIN',12000,NULL,101,100),(109,'Daniel','Faviet','DFAVIET','515.124.4169','1994-08-16','CONTAD',9000,NULL,108,100),(110,'John','Chen','JCHEN','515.124.4269','1997-09-28','CONTAD',8200,NULL,108,100),(111,'Ismael','Sciarra','ISCIARRA','515.124.4369','1997-09-30','CONTAD',7700,NULL,108,100),(112,'Jose Manuel','Urman','JMURMAN','515.124.4469','1998-03-07','CONTAD',7800,NULL,108,100),(113,'Luis','Popp','LPOPP','515.124.4567','1999-12-07','CONTAD',6900,NULL,108,100),(114,'Den','Raphaely','DRAPHEAL','515.127.4561','1994-12-07','GER_COM',11000,NULL,100,30),(115,'Alexander','Khoo','AKHOO','515.127.4562','1995-05-18','GER_FIN',3100,NULL,114,30),(116,'Shelli','Baida','SBAIDA','515.127.4563','1997-12-24','VENDAS',2900,NULL,114,30),(117,'Sigal','Tobias','STOBIAS','515.127.4564','1997-07-24','VENDAS',2800,NULL,114,30),(118,'Guy','Himuro','GHIMURO','515.127.4565','1998-11-15','VENDAS',2600,NULL,114,30),(119,'Karen','Colmenares','KCOLMENA','515.127.4566','1999-08-10','VENDAS',2500,NULL,114,30),(120,'Matthew','Weiss','MWEISS','650.123.1234','1996-07-18','ESTOQUE',8000,NULL,100,50),(121,'Adam','Fripp','AFRIPP','650.123.2234','1997-04-10','ESTOQUE',8200,NULL,100,50),(122,'Payam','Kaufling','PKAUFLIN','650.123.3234','1995-05-01','ESTOQUE',7900,NULL,100,50),(123,'Shanta','Vollman','SVOLLMAN','650.123.4234','1997-10-10','ESTOQUE',6500,NULL,100,50),(124,'Kevin','Mourgos','KMOURGOS','650.123.5234','1999-11-16','ESTOQUE',5800,NULL,100,50),(125,'Julia','Nayer','JNAYER','650.124.1214','1997-07-16','ESTOQUE',3200,NULL,120,50),(126,'Irene','Mikkilineni','IMIKKILI','650.124.1224','1998-09-28','ESTOQUE',2700,NULL,120,50),(127,'James','Landry','JLANDRY','650.124.1334','1999-01-14','ESTOQUE',2400,NULL,120,50),(128,'Steven','Markle','SMARKLE','650.124.1434','2000-03-08','ESTOQUE',2200,NULL,120,50),(129,'Laura','Bissot','LBISSOT','650.124.5234','1997-08-20','ESTOQUE',3300,NULL,121,50),(130,'Mozhe','Atkinson','MATKINSO','650.124.6234','1997-10-30','ESTOQUE',2800,NULL,121,50),(131,'James','Marlow','JAMRLOW','650.124.7234','1997-02-16','ESTOQUE',2500,NULL,121,50),(132,'TJ','Olson','TJOLSON','650.124.8234','1999-04-10','ESTOQUE',2100,NULL,121,50),(133,'Jason','Mallin','JMALLIN','650.127.1934','1996-06-14','ESTOQUE',3300,NULL,122,50),(134,'Michael','Rogers','MROGERS','650.127.1834','1998-08-26','ESTOQUE',2900,NULL,122,50),(135,'Ki','Gee','KGEE','650.127.1734','1999-12-12','ESTOQUE',2400,NULL,122,50),(136,'Hazel','Philtanker','HPHILTAN','650.127.1634','2000-02-06','ESTOQUE',2200,NULL,122,50),(137,'Renske','Ladwig','RLADWIG','650.121.1234','1995-07-14','ESTOQUE',3600,NULL,123,50),(138,'Stephen','Stiles','SSTILES','650.121.2034','1997-10-26','ESTOQUE',3200,NULL,123,50),(139,'John','Seo','JSEO','650.121.2019','1998-02-12','ESTOQUE',2700,NULL,123,50),(140,'Joshua','Patel','JPATEL','650.121.1834','1998-04-06','ESTOQUE',2500,NULL,123,50),(141,'Trenna','Rajs','TRAJS','650.121.8009','1995-10-17','ESTOQUE',3500,NULL,124,50),(142,'Curtis','Davies','CDAVIES','650.121.2994','1997-01-29','ESTOQUE',3100,NULL,124,50),(143,'Randall','Matos','RMATOS','650.121.2874','1998-03-15','ESTOQUE',2600,NULL,124,50),(144,'Peter','Vargas','PVARGAS','650.121.2004','1998-07-09','ESTOQUE',2500,NULL,124,50),(145,'John','Russell','JRUSSEL','011.44.1344.429268','1996-10-01','GER_VDS',14000,0.4,100,80),(146,'Karen','Partners','KPARTNER','011.44.1344.467268','1997-01-05','GER_VDS',13500,0.3,100,80),(147,'Alberto','Errazuriz','AERRAZUR','011.44.1344.429278','1997-03-10','GER_VDS',12000,0.3,100,80),(148,'Gerald','Cambrault','GCAMBRAU','011.44.1344.619268','1999-10-15','GER_VDS',11000,0.3,100,80),(149,'Eleni','Zlotkey','EZLOTKEY','011.44.1344.429018','2000-01-29','GER_VDS',10500,0.2,100,80),(150,'Peter','Tucker','PTUCKER','011.44.1344.129268','1997-01-30','VENDAS',10000,0.3,145,80),(151,'David','Bernstein','DBERNSTE','011.44.1344.345268','1997-03-24','VENDAS',9500,0.25,145,80),(152,'Peter','Hall','PHALL','011.44.1344.478968','1997-08-20','VENDAS',9000,0.25,145,80),(153,'Christopher','Olsen','COLSEN','011.44.1344.498718','1998-03-30','VENDAS',8000,0.2,145,80),(154,'Nanette','Cambrault','NCAMBRAU','011.44.1344.987668','1998-12-09','VENDAS',7500,0.2,145,80),(155,'Oliver','Tuvault','OTUVAULT','011.44.1344.486508','1999-11-23','VENDAS',7000,0.15,145,80),(156,'Janette','King','JKING','011.44.1345.429268','1996-01-30','VENDAS',10000,0.35,146,80),(157,'Patrick','Sully','PSULLY','011.44.1345.929268','1996-03-04','VENDAS',9500,0.35,146,80),(158,'Allan','McEwen','AMCEWEN','011.44.1345.829268','1996-08-01','VENDAS',9000,0.35,146,80),(159,'Lindsey','Smith','LSMITH','011.44.1345.729268','1997-03-10','VENDAS',8000,0.3,146,80),(160,'Louise','Doran','LDORAN','011.44.1345.629268','1997-12-15','VENDAS',7500,0.3,146,80),(161,'Sarath','Sewall','SSEWALL','011.44.1345.529268','1998-11-03','VENDAS',7000,0.25,146,80),(162,'Clara','Vishney','CVISHNEY','011.44.1346.129268','1997-11-11','VENDAS',10500,0.25,147,80),(163,'Danielle','Greene','DGREENE','011.44.1346.229268','1999-03-19','VENDAS',9500,0.15,147,80),(164,'MatteW','Marvins','MMARVINS','011.44.1346.329268','2000-01-24','VENDAS',7200,0.1,147,80),(165,'David','Lee','DLEE','011.44.1346.529268','2000-02-23','VENDAS',6800,0.1,147,80),(166,'Sundar','Ande','SANDE','011.44.1346.629268','2000-03-24','VENDAS',6400,0.1,147,80),(167,'Amit','Banda','ABANDA','011.44.1346.729268','2000-04-21','VENDAS',6200,0.1,147,80),(168,'Lisa','Ozer','LOZER','011.44.1343.929268','1997-03-11','VENDAS',11500,0.25,148,80),(169,'Harrison','Bloom','HBLOOM','011.44.1343.829268','1998-03-23','VENDAS',10000,0.2,148,80),(170,'Tayler','Fox','TFOX','011.44.1343.729268','1998-01-24','VENDAS',9600,0.2,148,80),(171,'William','Smith','WSMITH','011.44.1343.629268','1999-02-23','VENDAS',7400,0.15,148,80),(172,'Elizabeth','Bates','EBATES','011.44.1343.529268','1999-03-24','VENDAS',7300,0.15,148,80),(173,'Sundita','Kumar','SKUMAR','011.44.1343.329268','2000-04-21','VENDAS',6100,0.1,148,80),(174,'Ellen','Abel','EABEL','011.44.1644.429267','1996-05-11','VENDAS',11000,0.3,149,80),(175,'Alyssa','Hutton','AHUTTON','011.44.1644.429266','1997-03-19','VENDAS',8800,0.25,149,80),(176,'Jonathon','Taylor','JTAYLOR','011.44.1644.429265','1998-03-24','VENDAS',8600,0.2,149,80),(177,'Jack','Livingston','JLIVINGS','011.44.1644.429264','1998-04-23','VENDAS',8400,0.2,149,80),(178,'Kimberly','Grant','KGRANT','011.44.1644.429263','1999-05-24','VENDAS',7000,0.15,149,NULL),(179,'Charles','Johnson','CJOHNSON','011.44.1644.429262','2000-01-04','VENDAS',6200,0.1,149,80),(180,'Winston','Taylor','WTAYLOR','650.507.9876','1998-01-24','EXP',3200,NULL,120,50),(181,'Jean','Fleaur','JFLEAUR','650.507.9877','1998-02-23','EXP',3100,NULL,120,50),(182,'Martha','Sullivan','MSULLIVA','650.507.9878','1999-06-21','EXP',2500,NULL,120,50),(183,'Girard','Geoni','GGEONI','650.507.9879','2000-02-03','EXP',2800,NULL,120,50),(184,'Nandita','Sarchand','NSARCHAN','650.509.1876','1996-01-27','EXP',4200,NULL,121,50),(185,'Alexis','Bull','ABULL','650.509.2876','1997-02-20','EXP',4100,NULL,121,50),(186,'Julia','Dellinger','JDELLING','650.509.3876','1998-06-24','EXP',3400,NULL,121,50),(187,'Anthony','Cabrio','ACABRIO','650.509.4876','1999-02-07','EXP',3000,NULL,121,50),(188,'Kelly','Chung','KCHUNG','650.505.1876','1997-06-14','EXP',3800,NULL,122,50),(189,'Jennifer','Dilly','JDILLY','650.505.2876','1997-08-13','EXP',3600,NULL,122,50),(190,'Timothy','Gates','TGATES','650.505.3876','1998-07-11','EXP',2900,NULL,122,50),(191,'Randall','Perkins','RPERKINS','650.505.4876','1999-12-19','EXP',2500,NULL,122,50),(192,'Sarah','Bell','SBELL','650.501.1876','1996-02-04','EXP',4000,NULL,123,50),(193,'Britney','Everett','BEVERETT','650.501.2876','1997-03-03','EXP',3900,NULL,123,50),(194,'Samuel','McCain','SMCCAIN','650.501.3876','1998-07-01','EXP',3200,NULL,123,50),(195,'Vance','Jones','VJONES','650.501.4876','1999-03-17','EXP',2800,NULL,123,50),(196,'Alana','Walsh','AWALSH','650.507.9811','1998-04-24','EXP',3100,NULL,124,50),(197,'Kevin','Feeney','KFEENEY','650.507.9822','1998-05-23','EXP',3000,NULL,124,50),(198,'Donald','OConnell','DOCONNEL','650.507.9833','1999-06-21','EXP',2600,NULL,124,50),(199,'Douglas','Grant','DGRANT','650.507.9844','2000-01-13','EXP',2600,NULL,124,50),(200,'Jennifer','Whalen','JWHALEN','515.123.4444','1987-09-17','ASS_AD',4400,NULL,101,10),(201,'Michael','Hartstein','MHARTSTE','515.123.5555','1996-02-17','GER_MK',13000,NULL,100,20),(202,'Pat','Fay','PFAY','603.123.6666','1997-08-17','MK_REP',6000,NULL,201,20),(203,'Susan','Mavris','SMAVRIS','515.123.7777','1994-06-07','RH_REP',6500,NULL,101,40),(204,'Hermann','Baer','HBAER','515.123.8888','1994-06-07','RP_REP',10000,NULL,101,70),(205,'Shelley','Higgins','SHIGGINS','515.123.8080','1994-06-07','GER_CTB',12000,NULL,101,110),(206,'William','Gietz','WGIETZ','515.123.8181','1994-06-07','CONTADOR',8300,NULL,205,110);
/*!40000 ALTER TABLE `funcionarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locais`
--

DROP TABLE IF EXISTS `locais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `locais` (
  `local_id` int NOT NULL,
  `endereco` varchar(40) DEFAULT NULL,
  `cep` varchar(12) DEFAULT NULL,
  `cidade` varchar(30) DEFAULT NULL,
  `estado` varchar(25) DEFAULT NULL,
  `pais_id` char(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locais`
--

LOCK TABLES `locais` WRITE;
/*!40000 ALTER TABLE `locais` DISABLE KEYS */;
INSERT INTO `locais` VALUES (1000,'1297 Via Cola di Rie','00989','Roma',NULL,'IT'),(1100,'93091 Calle della Testa','10934','Venice',NULL,'IT'),(1200,'2017 Shinjuku-ku','1689','Tokyo','Tokyo Prefecture','JP'),(1300,'9450 Kamiya-cho','6823','Hiroshima',NULL,'JP'),(1400,'2014 Jabberwocky Rd','26192','Southlake','Texas','US'),(1500,'2011 Interiors Blvd','99236','South San Francisco','California','US'),(1600,'2007 Zagora St','50090','South Brunswick','New Jersey','US'),(1700,'2004 Charade Rd','98199','Seattle','Washington','US'),(1800,'147 Spadina Ave','M5V 2L7','Toronto','Ontario','CA'),(1900,'6092 Boxwood St','YSW 9T2','Whitehorse','Yukon','CA'),(2000,'40-5-12 Laogianggen','190518','Beijing',NULL,'CN'),(2100,'1298 Vileparle (E)','490231','Bombay','Maharashtra','IN'),(2200,'12-98 Victoria Street','2901','Sydney','New South Wales','AU'),(2300,'198 Clementi North','540198','Singapore',NULL,'SG'),(2400,'8204 Arthur St',NULL,'London',NULL,'UK'),(2500,'Magdalen Centre, The Oxford Science Park','OX9 9ZB','Oxford','Oxford','UK'),(2600,'9702 Chester Road','09629850293','Stretford','Manchester','UK'),(2700,'Schwanthalerstr. 7031','80925','Munich','Bavaria','DE'),(2800,'Rua Frei Caneca 1360 ','01307-002','Sao Paulo','Sao Paulo','BR'),(2900,'20 Rue des Corps-Saints','1730','Geneva','Geneve','CH'),(3000,'Murtenstrasse 921','3095','Bern','BE','CH'),(3100,'Pieter Breughelstraat 837','3029SK','Utrecht','Utrecht','NL'),(3200,'Mariano Escobedo 9991','11932','Mexico City','Distrito Federal,','MX');
/*!40000 ALTER TABLE `locais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paises`
--

DROP TABLE IF EXISTS `paises`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paises` (
  `pais_id` char(2) NOT NULL,
  `pais_nome` varchar(40) DEFAULT NULL,
  `regiao_id` int DEFAULT NULL,
  PRIMARY KEY (`pais_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paises`
--

LOCK TABLES `paises` WRITE;
/*!40000 ALTER TABLE `paises` DISABLE KEYS */;
INSERT INTO `paises` VALUES ('AR','Argentina',2),('AU','Australia',3),('BE','Belgica',1),('BR','Brasil',2),('CA','Canada',2),('CH','Suica',1),('CN','China',3),('DE','Alemanha',1),('DK','Dinamarca',1),('EG','Egito',4),('FR','Franca',1),('HK','HongKong',3),('IL','Israel',4),('IN','India',3),('IT','Italia',1),('JP','Japao',3),('KW','Kuwait',4),('MX','Mexico',2),('NG','Nigeria',4),('NL','holanda',1),('SG','Singapura',3),('UK','Reino Unido',1),('US','Estados Unidos',2),('ZM','Zambia',4),('ZW','Zimbabwe',4);
/*!40000 ALTER TABLE `paises` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `regioes`
--

DROP TABLE IF EXISTS `regioes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `regioes` (
  `regiao_id` int NOT NULL,
  `regiao_nome` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `regioes`
--

LOCK TABLES `regioes` WRITE;
/*!40000 ALTER TABLE `regioes` DISABLE KEYS */;
INSERT INTO `regioes` VALUES (1,'Europa'),(2,'Americas'),(3,'Asia'),(4,'Africa');
/*!40000 ALTER TABLE `regioes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'rh'
--

--
-- Dumping routines for database 'rh'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-07 12:34:41
