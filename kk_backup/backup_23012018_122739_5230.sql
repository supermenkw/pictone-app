-- MySQL dump 10.16  Distrib 10.1.28-MariaDB, for Win32 (AMD64)
--
-- Host: localhost    Database: db_pictone
-- ------------------------------------------------------
-- Server version	10.1.28-MariaDB

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
-- Table structure for table `detail_tags`
--

DROP TABLE IF EXISTS `detail_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detail_tags` (
  `id_galeri` int(11) unsigned DEFAULT NULL,
  `id_tags` int(4) unsigned DEFAULT NULL,
  KEY `id_galeri` (`id_galeri`),
  KEY `id_tags` (`id_tags`),
  CONSTRAINT `detail_tags_ibfk_1` FOREIGN KEY (`id_galeri`) REFERENCES `galeri` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `detail_tags_ibfk_2` FOREIGN KEY (`id_tags`) REFERENCES `tags` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detail_tags`
--

LOCK TABLES `detail_tags` WRITE;
/*!40000 ALTER TABLE `detail_tags` DISABLE KEYS */;
INSERT INTO `detail_tags` VALUES (31,7),(31,8),(31,9),(31,10),(32,7),(32,10),(32,11),(32,12),(32,13),(33,14),(33,15),(33,16),(33,17);
/*!40000 ALTER TABLE `detail_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filter`
--

DROP TABLE IF EXISTS `filter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `filter` (
  `id_user` int(11) unsigned DEFAULT NULL,
  `id_kategori` int(11) unsigned DEFAULT NULL,
  KEY `id_user` (`id_user`),
  KEY `id_kategori` (`id_kategori`),
  CONSTRAINT `filter_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `filter_ibfk_2` FOREIGN KEY (`id_kategori`) REFERENCES `kategori` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filter`
--

LOCK TABLES `filter` WRITE;
/*!40000 ALTER TABLE `filter` DISABLE KEYS */;
INSERT INTO `filter` VALUES (9,10);
/*!40000 ALTER TABLE `filter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `galeri`
--

DROP TABLE IF EXISTS `galeri`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `galeri` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `id_user` int(4) unsigned NOT NULL,
  `id_kategori` int(4) unsigned NOT NULL,
  `nama` varchar(100) NOT NULL,
  `deskripsi` text,
  `thumbnail` varchar(100) NOT NULL,
  `file_img` varchar(100) NOT NULL,
  `url_slug` varchar(255) NOT NULL,
  `dibuat` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` enum('publish','unpublish') DEFAULT 'publish',
  `viewer` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `id_user` (`id_user`),
  KEY `id_kategori` (`id_kategori`),
  CONSTRAINT `galeri_ibfk_2` FOREIGN KEY (`id_kategori`) REFERENCES `kategori` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `galeri_ibfk_3` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `galeri`
--

LOCK TABLES `galeri` WRITE;
/*!40000 ALTER TABLE `galeri` DISABLE KEYS */;
INSERT INTO `galeri` VALUES (31,1,8,'IDE Android Studio','Android Studio adalah sebuah IDE untuk pengembangan aplikasi di platform Android.   Sama seperti kombinasi antara Eclipse dan Android Developer Tools (ADT), Android Studio juga dapat di-download di situs resmi Android: http://developer.android.com/sdk/installing/studio.html.   Saat ini usia Android Studio masih tergolong muda, baru versi 0.2.3 (masih early access preview).\r\n\r\nKenapa harus ada sebuah IDE baru?   SDK sebelumnya di-bundle bersama dengan Eclipse, sementara Android Studio menggunakan IntelliJ IDEA Community Edition.   Kedua IDE tersebut sama-sama memiliki penggemar ‘fanatik‘-nya masing-masing.   Beberapa pendukung IntelliJ IDEA sering mengatakan bahwa Eclipse terlalu rumit bagi pemula.   Perbedaan lainnya?   Android Studio menggunakan Gradle untuk manajemen proyeknya.   Bagi yang belum pernah mendengar, Gradle adalah build automation tool yang dapat dikonfigurasi melalui DSL berbasis Groovy.   Ini yang membedakan Gradle dari Ant atau Maven yang memakai XML.   Penggunaan DSL berbasis Groovy menyebabkan Gradle lebih fleksibel dan dapat diprogram dengan mudah.\r\n\r\nSeperti apa rasanya memakai Android Studio? Pada kesempatan kali ini, saya akan mencoba memakainya di Windows 7 64-bit.  Pada sebuah sistem operasi Windows yang masih bersih, saya perlu men-download dan men-install  Java SDK dan Microsoft Visual C++ 2010 Redistributable Package terlebih dahulu. ','21034f521ba7c51f00ae76aa51a80ce7_17122017_thumb.jpg','21034f521ba7c51f00ae76aa51a80ce7_17122017.jpg','77413220_ide-android-studio','2018-01-21 15:15:48','publish',3),(32,1,8,'Indonesia Android Kejar','Indonesia Android Kejar adalah program yang diinisiasi oleh Google Developers untuk mengasah kemampuan developer Indonesia dalam mengembangkan aplikasi mobile. Program berbasis komunitas ini menggunakan materi online dari Udacity yang dipadukan dengan kelompok belajar secara offline (study group)\r\n\r\nJangan lewatkan kesempatan untuk mewujudkan potensi developer kamu disini, karena selain ilmu kamu juga akan mendapatkan network komunitas developer yang luas yang ada di 10 Kota (Jakarta, Bandung, Yogyakarta, Semarang, Surabaya, Malang, Denpasar, Makassar, Pontianak, dan Medan)\r\n\r\nDi Indonesia Android Kejar semua materi course bisa kamu akses langsung di Udacity, berikut link course setiap level yang digunakan di study group Indonesia Android Kejar yang bisa kamu akses:\r\n\r\nBeginner Level: https://www.udacity.com/courses/ud834 & https://www.udacity.com/courses/ud836\r\nIntermediate Level: https://www.udacity.com/courses/ud851\r\nAdvanced Level: https://www.udacity.com/courses/ud855\r\nUntuk informasi lengkap dan Pendaftaran silahkan kunjungi websitenya disini: http://g.co/dev/androidkejar\r\n\r\nKhusus Wilayah Bandung, IDCloudHost merupakan salah satu partner Google Indonesia dalam pelaksanaan kegiatan Indonesia Android Kejar yang dilaksanakan di kantor idcloudhost bandung. Tentunya harapan kami, dapat terus berkontribusi membantu banyak programmer di seluruh Indonesia melalui program-program seperti Indonesia Android Kejar.','733c80e89d48d9b21dd7ae82c5170f85_17122017_thumb.jpg','733c80e89d48d9b21dd7ae82c5170f85_17122017.jpg','1233705908_indonesia-android-kejar','2018-01-21 15:31:57','publish',2),(33,1,4,'Penanaman 1000 Pohon','Saat ini bumi sedang mengalami masalah yang sangat berbahaya bagi kehidupan manusia di bumi ini. Saat ini lapisan ozon (O3) yang terdapat di atmosfer sebagai pelindungi bumi dari sinar ultra violet yang dipancarkan oleh sinar matahari mulai menipis.\r\n \r\nAtau peristiwa ini bisa juga disebut sebagai “Global Warming”. Global Warming itu sendiri diakibatkan oleh ulah manusia itu sendiri. Mereka menggunakan bahan-bahan yang mengandung gas-gas beracun misalnya seperti parfum, asap rokok, asap kendaraan bermotor, dll. yang dapat mengurangi jumlah gas-gas yang berguna bagi manusia pada lapisan ozon itu sendiri.\r\n \r\nSelain itu, saat ini dibumi tumbuhan hijau yang dijadikan sebagai tempat untuk fotosintesis demi mengurangi unsure gas yang berbahaya bagi manusia sudah mulai berkurang. Karena banyak sekali para manusia yang tidak memiliki rasa kepedulian terhadap lingkungan sekitar karena uang.\r\n \r\nMereka itu dengan sengaja merusak hutan-hutan yang sangat berguna bagi bumi kita demi kepentingan pribadinya. Pada saat ini, manusia telah banyak yang sadar akan guna hutan. Akhirnya pemerintah mulai menggalangkan program penanaman 1000 pohon setiap tahunnya. Karena dengan penanaman pohon tiap tahunnya akan mengurangi Global Warming itu sendiri. Dan mengurangi rumah-rumah kaca yang dibangun.','b3aa82aededb286d79e35c680317677c_17122017_thumb.jpg','b3aa82aededb286d79e35c680317677c_17122017.jpg','978239434_penanaman-1000-pohon','2018-01-21 15:15:59','publish',4),(35,6,4,'Gunung Agung','Gunung Agung di Bali saat ini berada pada status IV Awas, yaitu berada pada tingkat yang paling tinggi , akibatnya warga di radius sampai 10 kilometer dievakuasi dari zona bahaya.\r\n\r\nJika erupsi terjadi, salah satu dari kami (Dian) akan segera berangkat ke Bali untuk mengumpulkan abu dan tanah yang terdampak.\r\n\r\nLetusan ini dikhawatirkan dapat menjadi bencana yang besar akibat lava, abu dan awan panas yang bersuhu tinggi dapat mencapai 1.250 ?.\r\n\r\n\r\nLava akan mengalir menyusuri lereng gunung, sedangkan abu terlempar ke atmosfer bahkan stratosfir.\r\n\r\nAwan panas dan abu vulkanis membawa risiko yang serius terhadap manusia dan penghidupannya.\r\n\r\nSemburan abu saat erupsi gunung api tak hanya memengaruhi penerbangan dan pariwisata, tapi juga berdampak pada kehidupan dan aktivitas pertanian bagi para petani.\r\n\r\nAwan panas menghanguskan tanaman, abu vulkanis menimbuni lahan pertanian dan merusak tanaman.\r\n\r\nTetapi dalam jangka panjang, abu akan menciptakan tanah yang paling subur di dunia.\r\n\r\nMeskipun luas tanah vulkanis hanya sekitar 1% saja dari luas daratan bumi, ternyata tanah vulkanis dapat menghidupi 10% dari populasi dunia.','36ac8a9efd95821a7cf96e23ffd611d3_17122017_thumb.jpg','36ac8a9efd95821a7cf96e23ffd611d3_17122017.jpg','941836464_gunung-agung','2018-01-21 14:43:03','publish',1),(36,6,8,'Let\'s Encrypt','Let\'s Encrypt adalah sebuah otoritas penyedia sertifikat totomasi dan terbuka yang menggunakan protokol ACME (Automatic Certificate Management Environment ) untuk memberikan layanan free TLS/SSL certificates kepada klien yang sesuai. Sertifikat-sertifikat ini dapat dipakai untuk meng-encrypt komunikasi antara server web dengan pengguna. Ada banyak jenis klien yang tersedia yang ditulis dalam berbagai bahasa pemrograman dan integrasi dengan berbagai tool, service, dan server.\r\n\r\nKlien ACME paling populer adalah, Certbot yang kini dikembangkan oleh the Electronic Frontier Foundation. Untuk melakukan verifikasi kepemilikan domain dan membaca sertifikat, Certbot dalam secara otomatis mengatur TLS/SSL di server web baik itu Apache maupun Nginx.','ac43a592c259d65866791faf6af1a077_17122017_thumb.jpg','ac43a592c259d65866791faf6af1a077_17122017.jpg','333888164_lets-encrypt','2018-01-21 13:45:22','publish',0),(37,1,4,'Logo Perwosi','ini contoh logo porwosi','5ba42e383153f917e0375c3752ed72a6_08012018_thumb.jpg','5ba42e383153f917e0375c3752ed72a6_08012018.jpg','632631815_logo-perwosi','2018-01-21 13:49:08','publish',1);
/*!40000 ALTER TABLE `galeri` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groups` (
  `id` mediumint(8) unsigned NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups`
--

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
INSERT INTO `groups` VALUES (1,'admin','Administrator'),(2,'members','General User');
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kategori`
--

DROP TABLE IF EXISTS `kategori`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kategori` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) NOT NULL,
  `deskripsi` tinytext,
  `dibuat` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kategori`
--

LOCK TABLES `kategori` WRITE;
/*!40000 ALTER TABLE `kategori` DISABLE KEYS */;
INSERT INTO `kategori` VALUES (4,'Natural Art','Bagikan gambar Natural yang terbaik ke semua orang','2017-10-27 02:54:48'),(5,'Funny Art','Bagikan gambar lucu mu yang terbaik ke semua orang','2017-10-22 07:52:59'),(8,'Digital Art','Share digital art','2017-10-22 07:52:36'),(9,'Vector Art','Share vector image','2017-10-27 02:58:01'),(10,'Comic Art','Comic Art Kategori','2017-10-25 12:39:51');
/*!40000 ALTER TABLE `kategori` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `komentar`
--

DROP TABLE IF EXISTS `komentar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `komentar` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_galeri` int(11) unsigned NOT NULL,
  `teks_komentar` text NOT NULL,
  `id_user` int(11) unsigned NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `tanggal` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `id_galeri` (`id_galeri`),
  KEY `id_user` (`id_user`),
  CONSTRAINT `komentar_ibfk_1` FOREIGN KEY (`id_galeri`) REFERENCES `galeri` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `komentar_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `komentar`
--

LOCK TABLES `komentar` WRITE;
/*!40000 ALTER TABLE `komentar` DISABLE KEYS */;
INSERT INTO `komentar` VALUES (1,31,'Ini contoh komentar dulu',1,0,'2017-12-17 10:43:17'),(2,31,'Ini contoh kedua',1,0,'2017-12-17 10:44:41'),(3,31,'hello good image',5,0,'2017-12-17 10:56:22'),(4,31,'nais dude',6,0,'2017-12-17 10:57:29'),(5,33,'Jadi yang pertama memberikan komentar apresiasi :)',6,0,'2017-12-17 11:00:33'),(6,33,'pertamax gan',6,0,'2017-12-17 11:00:43'),(11,31,'Bagus juga yah',5,0,'2018-01-06 06:38:48');
/*!40000 ALTER TABLE `komentar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_attempts`
--

DROP TABLE IF EXISTS `login_attempts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login_attempts` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(45) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_attempts`
--

LOCK TABLES `login_attempts` WRITE;
/*!40000 ALTER TABLE `login_attempts` DISABLE KEYS */;
/*!40000 ALTER TABLE `login_attempts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `picked`
--

DROP TABLE IF EXISTS `picked`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `picked` (
  `id_user` int(4) unsigned NOT NULL,
  `id_galeri` int(4) unsigned NOT NULL,
  KEY `id_user` (`id_user`),
  KEY `id_galeri` (`id_galeri`),
  CONSTRAINT `picked_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `picked_ibfk_2` FOREIGN KEY (`id_galeri`) REFERENCES `galeri` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `picked`
--

LOCK TABLES `picked` WRITE;
/*!40000 ALTER TABLE `picked` DISABLE KEYS */;
INSERT INTO `picked` VALUES (6,33),(1,33),(6,32),(5,33);
/*!40000 ALTER TABLE `picked` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `nm_tags` varchar(30) NOT NULL,
  `slug_tags` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (1,'#Tags','tags'),(2,'#OldSchool','oldschool'),(3,'#NaturalImage','naturalimage'),(4,'#StoryAtLife','storyatlife'),(5,'#goodman','goodman'),(6,'#OldStyle','oldstyle'),(7,'#AndroidStudio','androidstudio'),(8,'#Perogramming','perogramming'),(9,'#mobile','mobile'),(10,'#JavaProgramming','javaprogramming'),(11,'#programming','programming'),(12,'#IndonesiaAndroidKejar','indonesiaandroidkejar'),(13,'#IAK2017','iak2017'),(14,'#Gerakan 1000 Pohon','gerakan-1000-pohon'),(15,'#LestarikanBumiKita','lestarikanbumikita'),(16,'#MenujuGreenWorld','menujugreenworld'),(17,'#SelamatkanBumi','selamatkanbumi'),(18,'#Games','games'),(19,'#Vector','vector'),(20,'#GunungAgung','gunungagung'),(21,'#Bali','bali'),(22,'#Meletus','meletus'),(23,'#LetsEncrypt','letsencrypt'),(24,'#Tutorial','tutorial'),(25,'#Logo','logo');
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(45) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `email` varchar(254) NOT NULL,
  `activation_code` varchar(40) DEFAULT NULL,
  `forgotten_password_code` varchar(40) DEFAULT NULL,
  `forgotten_password_time` int(11) unsigned DEFAULT NULL,
  `remember_code` varchar(40) DEFAULT NULL,
  `created_on` int(11) unsigned NOT NULL,
  `last_login` int(11) unsigned DEFAULT NULL,
  `active` tinyint(1) unsigned DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'127.0.0.1','administrator','$2a$07$SeBknntpZror9uyftVopmu61qg0ms8Qv1yV6FG.kQOSM.9QhmTo36','','admin@admin.com','',NULL,NULL,'eEdPipOUswWz7fXxI5g8xO',1268889823,1516702250,1,'Rangga','Djatikusuma Lukman','ADMIN','089913134104'),(5,'::1','angga@pictone.dev','$2a$07$SeBknntpZror9uyftVopmu61qg0ms8Qv1yV6FG.kQOSM.9QhmTo36',NULL,'angga@pictone.dev',NULL,NULL,NULL,NULL,1508490282,1515378430,1,'Angga','Muh. Ginanjar','maasfa','8966525332'),(6,'::1','nurroby@pictone.dev','$2a$07$SeBknntpZror9uyftVopmu61qg0ms8Qv1yV6FG.kQOSM.9QhmTo36',NULL,'nurroby@pictone.dev',NULL,NULL,NULL,NULL,1508562677,1513508239,1,'Nurroby','Abyanul Haq','PICTONE','0892151251'),(9,'::1','test@pictone.dev','$2y$08$IHr9TBxuZmge3YBTITLxuOl1hmXXzY5pWV7UMY1rdfX8gMphZDz.q',NULL,'test@pictone.dev',NULL,NULL,NULL,NULL,1511740910,1512100181,1,'Testing','User','PICTONE','0899234142');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_groups`
--

DROP TABLE IF EXISTS `users_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_groups` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `group_id` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uc_users_groups` (`user_id`,`group_id`),
  KEY `fk_users_groups_users1_idx` (`user_id`),
  KEY `fk_users_groups_groups1_idx` (`group_id`),
  CONSTRAINT `users_groups_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `users_groups_ibfk_2` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_groups`
--

LOCK TABLES `users_groups` WRITE;
/*!40000 ALTER TABLE `users_groups` DISABLE KEYS */;
INSERT INTO `users_groups` VALUES (1,1,1),(2,1,2),(5,5,2),(6,6,2),(9,9,2);
/*!40000 ALTER TABLE `users_groups` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-01-23 18:27:40
