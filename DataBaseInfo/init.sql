CREATE TABLE `site_user`(
    `id` BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    `email_address` VARCHAR(255) NOT NULL,
    `phone_number` INT NOT NULL,
    `password` VARCHAR(255) NOT NULL,
    `first_name` VARCHAR(255) NOT NULL,
    `last_name` VARCHAR(255) NOT NULL,
    `company_name` VARCHAR(255) NOT NULL
);
CREATE TABLE `product`(
    `id` BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    `description` TEXT NOT NULL,
    `additional_info` TEXT NOT NULL,
    `category_id` BIGINT NOT NULL,
    `tag_id` BIGINT NOT NULL,
    `image_set_id` BIGINT NOT NULL
);
CREATE TABLE `address`(
    `id` BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `country_id` BIGINT NOT NULL,
    `street_adress` VARCHAR(255) NOT NULL,
    `unit_number` INT NOT NULL,
    `city` VARCHAR(255) NOT NULL,
    `region` VARCHAR(255) NOT NULL,
    `postal_code` INT NOT NULL
);
CREATE TABLE `country`(
    `id` BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `country_name` VARCHAR(255) NOT NULL
);
CREATE TABLE `product_tag`(
    `id` BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL
);
CREATE TABLE `product_category`(
    `id` BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL
);
CREATE TABLE `review`(
    `id` BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `user_id` BIGINT NOT NULL,
    `product_item_id` BIGINT NOT NULL,
    `text` TEXT NOT NULL,
    `rating` INT NOT NULL,
    `created_at` TIMESTAMP NOT NULL
);
CREATE TABLE `product_item`(
    `id` BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `product_id` BIGINT NOT NULL,
    `SKU` VARCHAR(255) NOT NULL,
    `qty_in_stock` INT NOT NULL,
    `price` INT NOT NULL,
    `variation_id_1` BIGINT NOT NULL,
    `variation_id_2` BIGINT NOT NULL
);
CREATE TABLE `variation_option`(
    `id` BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `name` BIGINT NOT NULL,
    `value` BIGINT NOT NULL
);
CREATE TABLE `shopping_cart`(
    `id` BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `user_id` BIGINT NOT NULL
);
CREATE TABLE `shopping_cart_item`(
    `id` BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `cart_id` BIGINT NOT NULL,
    `product_item_id` BIGINT NOT NULL,
    `qty` INT NOT NULL
);
CREATE TABLE `shop_order`(
    `id` BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `user_id` BIGINT NOT NULL,
    `created_at` TIMESTAMP NOT NULL,
    `shipping_adress_id` BIGINT NOT NULL,
    `order_addition_info` TEXT NOT NULL,
    `order_status` VARCHAR(255) NOT NULL,
    `cart_id` BIGINT NOT NULL
);
CREATE TABLE `product_image_set`(
    `id` BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `image_main` VARCHAR(255) NOT NULL,
    `image_1` VARCHAR(255) NOT NULL,
    `image_2` VARCHAR(255) NOT NULL,
    `image_3` VARCHAR(255) NOT NULL,
    `image_4` VARCHAR(255) NOT NULL
);
CREATE TABLE `user_adress`(
    `id` BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `user_id` BIGINT NOT NULL,
    `adress_id` BIGINT NOT NULL,
    `is_default` TINYINT(1) NOT NULL
);
CREATE TABLE `product_configuration`(
    `id` BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `product_item_id` BIGINT NOT NULL,
    `varitaion_option_id` BIGINT NOT NULL
);
ALTER TABLE
    `review` ADD CONSTRAINT `review_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `site_user`(`id`);
ALTER TABLE
    `product_item` ADD CONSTRAINT `product_item_product_id_foreign` FOREIGN KEY(`product_id`) REFERENCES `product`(`id`);
ALTER TABLE
    `product` ADD CONSTRAINT `product_category_id_foreign` FOREIGN KEY(`category_id`) REFERENCES `product_category`(`id`);
ALTER TABLE
    `product` ADD CONSTRAINT `product_tag_id_foreign` FOREIGN KEY(`tag_id`) REFERENCES `product_tag`(`id`);
ALTER TABLE
    `address` ADD CONSTRAINT `address_country_id_foreign` FOREIGN KEY(`country_id`) REFERENCES `country`(`id`);
ALTER TABLE
    `review` ADD CONSTRAINT `review_product_item_id_foreign` FOREIGN KEY(`product_item_id`) REFERENCES `product_item`(`id`);
ALTER TABLE
    `product_configuration` ADD CONSTRAINT `product_configuration_varitaion_option_id_foreign` FOREIGN KEY(`varitaion_option_id`) REFERENCES `variation_option`(`id`);
ALTER TABLE
    `shopping_cart` ADD CONSTRAINT `shopping_cart_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `site_user`(`id`);
ALTER TABLE
    `shopping_cart_item` ADD CONSTRAINT `shopping_cart_item_cart_id_foreign` FOREIGN KEY(`cart_id`) REFERENCES `shopping_cart`(`id`);
ALTER TABLE
    `shopping_cart_item` ADD CONSTRAINT `shopping_cart_item_product_item_id_foreign` FOREIGN KEY(`product_item_id`) REFERENCES `product_item`(`id`);
ALTER TABLE
    `shop_order` ADD CONSTRAINT `shop_order_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `site_user`(`id`);
ALTER TABLE
    `shop_order` ADD CONSTRAINT `shop_order_shipping_adress_id_foreign` FOREIGN KEY(`shipping_adress_id`) REFERENCES `address`(`id`);
ALTER TABLE
    `shop_order` ADD CONSTRAINT `shop_order_cart_id_foreign` FOREIGN KEY(`cart_id`) REFERENCES `shopping_cart`(`id`);
ALTER TABLE
    `product` ADD CONSTRAINT `product_image_set_id_foreign` FOREIGN KEY(`image_set_id`) REFERENCES `product_image_set`(`id`);
ALTER TABLE
    `user_adress` ADD CONSTRAINT `user_adress_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `site_user`(`id`);
ALTER TABLE
    `user_adress` ADD CONSTRAINT `user_adress_adress_id_foreign` FOREIGN KEY(`adress_id`) REFERENCES `address`(`id`);
ALTER TABLE
    `product_configuration` ADD CONSTRAINT `product_configuration_product_item_id_foreign` FOREIGN KEY(`product_item_id`) REFERENCES `product_item`(`id`);