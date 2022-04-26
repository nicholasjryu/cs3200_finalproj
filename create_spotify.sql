-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema spotify
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema spotify
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `spotify` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`podcasts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify`.`podcasts` (
  `podcast_id` INT NOT NULL,
  `title` VARCHAR(250) NOT NULL,
  `host` VARCHAR(45) NOT NULL,
  `duration (m)` INT NOT NULL,
  PRIMARY KEY (`podcast_id`),
  UNIQUE INDEX `podcast_id_UNIQUE` (`podcast_id` ASC) VISIBLE)
ENGINE = InnoDB;

USE `spotify` ;

-- -----------------------------------------------------
-- Table `spotify`.`genre`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify`.`genre` (
  `genre_id` INT NOT NULL,
  `genre` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`genre_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `spotify`.`performer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify`.`performer` (
  `performer_id` INT NOT NULL,
  `performer` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`performer_id`),
  UNIQUE INDEX `performer_UNIQUE` (`performer` ASC) VISIBLE,
  UNIQUE INDEX `performer_id_UNIQUE` (`performer_id` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `spotify`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify`.`user` (
  `user_id` INT NOT NULL,
  `user_name` VARCHAR(25) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE INDEX `user_name_UNIQUE` (`user_name` ASC) VISIBLE,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `spotify`.`playlist`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify`.`playlist` (
  `playlist_id` INT NOT NULL,
  `title` VARCHAR(155) NULL DEFAULT NULL,
  `user_user_id` INT NOT NULL,
  PRIMARY KEY (`playlist_id`, `user_user_id`),
  INDEX `playlist_user_id_fk1_idx` (`user_user_id` ASC) VISIBLE,
  CONSTRAINT `playlist_user_id_fk1`
    FOREIGN KEY (`user_user_id`)
    REFERENCES `spotify`.`user` (`user_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `spotify`.`playlist_review`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify`.`playlist_review` (
  `playlist_playlist_id` INT NOT NULL,
  `user_user_id` INT NOT NULL,
  `rating` INT NOT NULL,
  `description` VARCHAR(400) NULL DEFAULT NULL,
  PRIMARY KEY (`playlist_playlist_id`, `user_user_id`),
  INDEX `playlist_has_user_user_id_fk1_idx` (`user_user_id` ASC) VISIBLE,
  INDEX `playlist_has_user_playlist_id_fk_idx` (`playlist_playlist_id` ASC) VISIBLE,
  CONSTRAINT `playlist_has_user_playlist_id_fk`
    FOREIGN KEY (`playlist_playlist_id`)
    REFERENCES `spotify`.`playlist` (`playlist_id`),
  CONSTRAINT `playlist_has_user_user_id_fk1`
    FOREIGN KEY (`user_user_id`)
    REFERENCES `spotify`.`user` (`user_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `spotify`.`song`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify`.`song` (
  `song_id` INT NOT NULL,
  `title` VARCHAR(1000) NOT NULL,
  `performer_performer_id` INT NOT NULL,
  `genre_genre_id` INT NOT NULL,
  `streams` INT NOT NULL,
  `artist followers` INT NOT NULL,
  PRIMARY KEY (`song_id`),
  INDEX `fk_song_table21_idx` (`genre_genre_id` ASC) VISIBLE,
  INDEX `fk_song_performer1_idx` (`performer_performer_id` ASC) VISIBLE,
  CONSTRAINT `fk_song_performer1`
    FOREIGN KEY (`performer_performer_id`)
    REFERENCES `spotify`.`performer` (`performer_id`),
  CONSTRAINT `fk_song_table21`
    FOREIGN KEY (`genre_genre_id`)
    REFERENCES `spotify`.`genre` (`genre_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `spotify`.`playlist_song`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify`.`playlist_song` (
  `playlist_playlist_id` INT NOT NULL,
  `song_song_id` INT NOT NULL,
  PRIMARY KEY (`playlist_playlist_id`, `song_song_id`),
  INDEX `playlist_has_song_song_id_fk1_idx` (`song_song_id` ASC) VISIBLE,
  INDEX `playlist_has_song_playlist_id_fk1_idx` (`playlist_playlist_id` ASC) VISIBLE,
  CONSTRAINT `playlist_has_song_playlist_id_fk1`
    FOREIGN KEY (`playlist_playlist_id`)
    REFERENCES `spotify`.`playlist` (`playlist_id`),
  CONSTRAINT `playlist_has_song_song_id_fk1`
    FOREIGN KEY (`song_song_id`)
    REFERENCES `spotify`.`song` (`song_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `spotify`.`popularity`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify`.`popularity` (
  `popularity_rating` INT NOT NULL,
  `times_charted` INT NOT NULL,
  `song_song_id` INT NOT NULL,
  UNIQUE INDEX `song_song_id_UNIQUE` (`song_song_id` ASC) VISIBLE,
  INDEX `fk_table1_song1_idx` (`song_song_id` ASC) VISIBLE,
  CONSTRAINT `fk_table1_song1`
    FOREIGN KEY (`song_song_id`)
    REFERENCES `spotify`.`song` (`song_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `spotify`.`song_review`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify`.`song_review` (
  `song_song_id` INT NOT NULL,
  `user_user_id` INT NOT NULL,
  `rating` INT NOT NULL,
  `description` VARCHAR(400) NULL DEFAULT NULL,
  PRIMARY KEY (`song_song_id`, `user_user_id`),
  INDEX `song_has_user_user_id_fk1_idx` (`user_user_id` ASC) VISIBLE,
  INDEX `song_has_user_song_id_fk1_idx` (`song_song_id` ASC) VISIBLE,
  CONSTRAINT `song_has_user_song_id_fk1`
    FOREIGN KEY (`song_song_id`)
    REFERENCES `spotify`.`song` (`song_id`),
  CONSTRAINT `song_has_user_user_id_fk1`
    FOREIGN KEY (`user_user_id`)
    REFERENCES `spotify`.`user` (`user_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `spotify`.`technicals`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify`.`technicals` (
  `danceability` DECIMAL(10,0) NULL DEFAULT NULL,
  `energy` DECIMAL(10,0) NULL DEFAULT NULL,
  `liveness` DECIMAL(10,0) NULL DEFAULT NULL,
  `tempo` INT NULL DEFAULT NULL,
  `duration (m)` INT NULL DEFAULT NULL,
  `song_song_id` INT NOT NULL,
  INDEX `fk_technicals_song1_idx` (`song_song_id` ASC) VISIBLE,
  CONSTRAINT `fk_technicals_song1`
    FOREIGN KEY (`song_song_id`)
    REFERENCES `spotify`.`song` (`song_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `spotify`.`playlist_has_podcasts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify`.`playlist_has_podcasts` (
  `playlist_playlist_id` INT NOT NULL,
  `podcasts_podcast_id` INT NOT NULL,
  PRIMARY KEY (`playlist_playlist_id`, `podcasts_podcast_id`),
  INDEX `fk_playlist_has_podcasts_podcasts1_idx` (`podcasts_podcast_id` ASC) VISIBLE,
  INDEX `fk_playlist_has_podcasts_playlist1_idx` (`playlist_playlist_id` ASC) VISIBLE,
  CONSTRAINT `fk_playlist_has_podcasts_playlist1`
    FOREIGN KEY (`playlist_playlist_id`)
    REFERENCES `spotify`.`playlist` (`playlist_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_playlist_has_podcasts_podcasts1`
    FOREIGN KEY (`podcasts_podcast_id`)
    REFERENCES `mydb`.`podcasts` (`podcast_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
