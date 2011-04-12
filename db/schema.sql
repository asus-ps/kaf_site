delimiter $$

CREATE DATABASE `kafedra` /*!40100 DEFAULT CHARACTER SET utf8 */$$


CREATE TABLE `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text_comm` text NOT NULL,
  `name_author` varchar(50) DEFAULT NULL,
  `email_author` varchar(50) DEFAULT NULL,
  `id_theme` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8$$

CREATE TABLE `contacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adres` varchar(255) NOT NULL,
  `phones` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `site` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8$$

CREATE TABLE `dipl_themes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_stud` int(11) NOT NULL,
  `name_dipl` varchar(255) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8$$

CREATE TABLE `disciplines` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name_disc` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8$$


CREATE TABLE `histories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hist_text` text NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8$$


CREATE TABLE `kafnews` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title_new` varchar(255) NOT NULL,
  `text_new` text NOT NULL,
  `date_pub` datetime NOT NULL,
  `prioritet` int(11) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8$$



CREATE TABLE `persons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `l_name` varchar(45) DEFAULT NULL,
  `f_name` varchar(45) DEFAULT NULL,
  `p_name` varchar(45) DEFAULT NULL,
  `birth` date DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `email` varchar(60) DEFAULT NULL,
  `nature` char(1) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8$$


CREATE TABLE `specials` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cod` varchar(20) DEFAULT NULL,
  `name_spec` varchar(100) DEFAULT NULL,
  `sokr_spec` varchar(20) DEFAULT NULL,
  `name_dipl` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8$$


CREATE TABLE `students` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_pers` int(11) DEFAULT NULL,
  `id_spec` int(11) DEFAULT NULL,
  `course` int(11) DEFAULT NULL,
  `info` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8$$


CREATE TABLE `teachers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_pers` varchar(45) DEFAULT NULL,
  `info` text,
  `uch_step` varchar(100) DEFAULT NULL,
  `position` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8$$

CREATE TABLE `kaflinks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sitelink` varchar(255) DEFAULT NULL,
  `opisanie` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8$$
