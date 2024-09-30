-- CreateTable
CREATE TABLE `message` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `sender_id` INTEGER NULL,
    `receiver_id` INTEGER NULL,
    `message` TEXT NULL,
    `sent` TIMESTAMP(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
    `receive` TIMESTAMP(0) NULL,
    `seen` TIMESTAMP(0) NULL,
    `status` VARCHAR(50) NULL,
    `is_deleted` BOOLEAN NULL,
    `deleted_at` TIMESTAMP(0) NULL,
    `created_at` TIMESTAMP(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
    `updated_at` TIMESTAMP(0) NULL DEFAULT CURRENT_TIMESTAMP(0),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `pbz_users` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NULL,
    `user_name` VARCHAR(255) NOT NULL,
    `user_email` VARCHAR(255) NOT NULL,
    `profile_img` VARCHAR(255) NULL,
    `password` TEXT NOT NULL,
    `type` TEXT NULL,
    `role_id` INTEGER NULL,
    `area_of_trades` VARCHAR(255) NULL,
    `time_zone` TEXT NULL,
    `country` VARCHAR(255) NULL,
    `country_id` INTEGER NULL,
    `state` VARCHAR(255) NULL,
    `state_id` INTEGER NULL,
    `street_address` TEXT NULL,
    `apt_suite` TEXT NULL,
    `city` VARCHAR(255) NULL,
    `phone` VARCHAR(255) NULL,
    `zip_code` TEXT NULL,
    `is_verified` INTEGER NULL,
    `is_locked` INTEGER NULL,
    `is_active` INTEGER NULL,
    `user_otp` BIGINT NULL,
    `secret_key` TEXT NOT NULL,
    `is_trial` INTEGER NOT NULL,
    `is_team_member` INTEGER NULL,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
