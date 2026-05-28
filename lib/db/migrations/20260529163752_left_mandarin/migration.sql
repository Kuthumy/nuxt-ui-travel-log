CREATE TABLE `location_log_image` (
	`id` integer PRIMARY KEY AUTOINCREMENT,
	`key` text,
	`location_log_id` integer,
	`created_at` integer NOT NULL,
	`updated_at` integer NOT NULL,
	CONSTRAINT `fk_location_log_image_location_log_id_location_log_id_fk` FOREIGN KEY (`location_log_id`) REFERENCES `location_log`(`id`)
);
--> statement-breakpoint
CREATE TABLE `location_log` (
	`id` integer PRIMARY KEY AUTOINCREMENT,
	`name` text NOT NULL,
	`description` text,
	`started_at` integer,
	`ended_at` integer,
	`latitude` real,
	`longitude` real,
	`location_id` integer,
	`created_at` integer NOT NULL,
	`updated_at` integer NOT NULL,
	CONSTRAINT `fk_location_log_location_id_location_id_fk` FOREIGN KEY (`location_id`) REFERENCES `location`(`id`)
);
--> statement-breakpoint
CREATE TABLE `location` (
	`id` integer PRIMARY KEY AUTOINCREMENT,
	`name` text NOT NULL,
	`slug` text NOT NULL UNIQUE,
	`description` text,
	`latitude` real,
	`longitude` real,
	`created_at` integer NOT NULL,
	`updated_at` integer NOT NULL
);
