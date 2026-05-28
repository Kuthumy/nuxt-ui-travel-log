ALTER TABLE `location_log` RENAME COLUMN `latitude` TO `lat`;--> statement-breakpoint
ALTER TABLE `location_log` RENAME COLUMN `longitude` TO `long`;--> statement-breakpoint
ALTER TABLE `location` RENAME COLUMN `latitude` TO `lat`;--> statement-breakpoint
ALTER TABLE `location` RENAME COLUMN `longitude` TO `long`;--> statement-breakpoint
PRAGMA foreign_keys=OFF;--> statement-breakpoint
CREATE TABLE `__new_location_log_image` (
	`id` integer PRIMARY KEY AUTOINCREMENT,
	`key` text NOT NULL,
	`location_log_id` integer,
	`created_at` integer NOT NULL,
	`updated_at` integer NOT NULL,
	CONSTRAINT `fk_location_log_image_location_log_id_location_log_id_fk` FOREIGN KEY (`location_log_id`) REFERENCES `location_log`(`id`)
);
--> statement-breakpoint
INSERT INTO `__new_location_log_image`(`id`, `key`, `location_log_id`, `created_at`, `updated_at`) SELECT `id`, `key`, `location_log_id`, `created_at`, `updated_at` FROM `location_log_image`;--> statement-breakpoint
DROP TABLE `location_log_image`;--> statement-breakpoint
ALTER TABLE `__new_location_log_image` RENAME TO `location_log_image`;--> statement-breakpoint
PRAGMA foreign_keys=ON;--> statement-breakpoint
PRAGMA foreign_keys=OFF;--> statement-breakpoint
CREATE TABLE `__new_location_log` (
	`id` integer PRIMARY KEY AUTOINCREMENT,
	`name` text NOT NULL,
	`description` text,
	`started_at` integer NOT NULL,
	`ended_at` integer NOT NULL,
	`lat` real,
	`long` real,
	`location_id` integer NOT NULL,
	`created_at` integer NOT NULL,
	`updated_at` integer NOT NULL,
	CONSTRAINT `fk_location_log_location_id_location_id_fk` FOREIGN KEY (`location_id`) REFERENCES `location`(`id`)
);
--> statement-breakpoint
INSERT INTO `__new_location_log`(`id`, `name`, `description`, `started_at`, `ended_at`, `lat`, `long`, `location_id`, `created_at`, `updated_at`) SELECT `id`, `name`, `description`, `started_at`, `ended_at`, `lat`, `long`, `location_id`, `created_at`, `updated_at` FROM `location_log`;--> statement-breakpoint
DROP TABLE `location_log`;--> statement-breakpoint
ALTER TABLE `__new_location_log` RENAME TO `location_log`;--> statement-breakpoint
PRAGMA foreign_keys=ON;--> statement-breakpoint
PRAGMA foreign_keys=OFF;--> statement-breakpoint
CREATE TABLE `__new_location` (
	`id` integer PRIMARY KEY AUTOINCREMENT,
	`name` text NOT NULL,
	`slug` text NOT NULL UNIQUE,
	`description` text,
	`lat` real NOT NULL,
	`long` real NOT NULL,
	`created_at` integer NOT NULL,
	`updated_at` integer NOT NULL
);
--> statement-breakpoint
INSERT INTO `__new_location`(`id`, `name`, `slug`, `description`, `lat`, `long`, `created_at`, `updated_at`) SELECT `id`, `name`, `slug`, `description`, `lat`, `long`, `created_at`, `updated_at` FROM `location`;--> statement-breakpoint
DROP TABLE `location`;--> statement-breakpoint
ALTER TABLE `__new_location` RENAME TO `location`;--> statement-breakpoint
PRAGMA foreign_keys=ON;