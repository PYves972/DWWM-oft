-- -----------------------------------------------------
-- Schéma d'initialisation : Atelier de Couture
-- -----------------------------------------------------
CREATE DATABASE IF NOT EXISTS `couture_workshop_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `couture_workshop_db`;

-- -----------------------------------------------------
-- Table `users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `users` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `lastname` VARCHAR(50) NOT NULL,
  `firstname` VARCHAR(50) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `role` ENUM('admin', 'client') NOT NULL DEFAULT 'client',
  `created_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC)
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `categories` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  `slug` VARCHAR(100) NOT NULL,
  `created_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `slug_UNIQUE` (`slug` ASC)
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `ateliers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ateliers` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(255) NOT NULL,
  `slug` VARCHAR(100) NOT NULL,
  `description` TEXT NOT NULL,
  `date_atelier` DATE NOT NULL,
  `heure_atelier` TIME NOT NULL,
  `prix` DECIMAL(6,2) NOT NULL,
  `places_maximum` INT UNSIGNED NOT NULL,
  `id_category` INT UNSIGNED NOT NULL,
  `id_user` INT UNSIGNED NOT NULL, -- Administrateur créateur
  `created_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `slug_UNIQUE` (`slug` ASC),
  INDEX `fk_ateliers_categories_idx` (`id_category` ASC),
  INDEX `fk_ateliers_users_idx` (`id_user` ASC),
  CONSTRAINT `fk_ateliers_categories`
    FOREIGN KEY (`id_category`)
    REFERENCES `categories` (`id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_ateliers_users`
    FOREIGN KEY (`id_user`)
    REFERENCES `users` (`id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `reservations`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `reservations` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `numero_reservation` VARCHAR(50) NOT NULL,
  `status_paiement` ENUM('en_attente', 'paye', 'annule') NOT NULL DEFAULT 'en_attente',
  `id_user` INT UNSIGNED NOT NULL, -- Client qui réserve
  `id_article` INT UNSIGNED NOT NULL, -- Atelier réservé
  `created_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `numero_reservation_UNIQUE` (`numero_reservation` ASC),
  INDEX `fk_reservations_users_idx` (`id_user` ASC),
  INDEX `fk_reservations_ateliers_idx` (`id_article` ASC),
  CONSTRAINT `fk_reservations_users`
    FOREIGN KEY (`id_user`)
    REFERENCES `users` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_reservations_ateliers`
    FOREIGN KEY (`id_article`)
    REFERENCES `ateliers` (`id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE
) ENGINE = InnoDB;