/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 100422
 Source Host           : localhost:3306
 Source Schema         : nftzai-production

 Target Server Type    : MySQL
 Target Server Version : 100422
 File Encoding         : 65001

 Date: 18/03/2022 11:02:58
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for activity_logs
-- ----------------------------
DROP TABLE IF EXISTS `activity_logs`;
CREATE TABLE `activity_logs`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `action` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `source` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip_address` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `location` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `activity_logs_user_id_foreign`(`user_id`) USING BTREE,
  CONSTRAINT `activity_logs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of activity_logs
-- ----------------------------
INSERT INTO `activity_logs` VALUES (1, 2, '1', 'Web', '127.0.0.1', '', '2022-03-16 11:23:59', '2022-03-16 11:23:59');
INSERT INTO `activity_logs` VALUES (2, 2, '1', 'Web', '127.0.0.1', '', '2022-03-16 11:58:38', '2022-03-16 11:58:38');
INSERT INTO `activity_logs` VALUES (3, 2, '1', 'Web', '127.0.0.1', '', '2022-03-16 11:59:13', '2022-03-16 11:59:13');
INSERT INTO `activity_logs` VALUES (4, 2, '1', 'Web', '127.0.0.1', '', '2022-03-16 12:24:21', '2022-03-16 12:24:21');

-- ----------------------------
-- Table structure for bid_histories
-- ----------------------------
DROP TABLE IF EXISTS `bid_histories`;
CREATE TABLE `bid_histories`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `transaction_id` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `bid_amount` decimal(19, 8) NOT NULL,
  `coin_amount` decimal(19, 8) NOT NULL,
  `service_charge` decimal(19, 8) NOT NULL,
  `service_charge_coin` decimal(19, 8) NOT NULL,
  `conversion_rate` decimal(19, 8) NOT NULL,
  `service_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `coin_type` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `coin_id` bigint(20) UNSIGNED NOT NULL,
  `status` tinyint(4) NOT NULL,
  `refund_amount` decimal(19, 8) NOT NULL DEFAULT 0,
  `wallet_id` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `bid_histories_service_id_index`(`service_id`) USING BTREE,
  INDEX `bid_histories_user_id_index`(`user_id`) USING BTREE,
  INDEX `bid_histories_coin_id_index`(`coin_id`) USING BTREE,
  INDEX `bid_histories_wallet_id_index`(`wallet_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for bids
-- ----------------------------
DROP TABLE IF EXISTS `bids`;
CREATE TABLE `bids`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `transaction_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `bid_amount` decimal(19, 8) NOT NULL,
  `service_charge` decimal(19, 8) NOT NULL,
  `service_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `is_sale_bid` tinyint(1) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `bids_service_id_index`(`service_id`) USING BTREE,
  INDEX `bids_user_id_index`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for categories
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `priority` int(11) NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 1,
  `comment` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of categories
-- ----------------------------
INSERT INTO `categories` VALUES (1, 'Game', 'Game Category', 1, 1, NULL, '2022-03-16 09:15:28', '2022-03-16 09:15:28', NULL);
INSERT INTO `categories` VALUES (2, 'Photography', 'Photography Category', 2, 1, NULL, '2022-03-16 09:15:28', '2022-03-16 09:15:28', NULL);
INSERT INTO `categories` VALUES (3, 'Music', 'Music Category', 3, 1, NULL, '2022-03-16 09:15:28', '2022-03-16 09:15:28', NULL);

-- ----------------------------
-- Table structure for coin_payment_api_logs
-- ----------------------------
DROP TABLE IF EXISTS `coin_payment_api_logs`;
CREATE TABLE `coin_payment_api_logs`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `request_body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `curl_object` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `response` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for coin_settings
-- ----------------------------
DROP TABLE IF EXISTS `coin_settings`;
CREATE TABLE `coin_settings`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `coin_id` bigint(20) UNSIGNED NOT NULL,
  `api_service` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `host` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `port` int(11) NULL DEFAULT NULL,
  `withdrawal_fee_percent` decimal(19, 8) NOT NULL DEFAULT 0,
  `withdrawal_fee_fixed` decimal(19, 8) NOT NULL DEFAULT 0,
  `withdrawal_fee_method` tinyint(4) NOT NULL DEFAULT 1 COMMENT 'method: percent = 1, fixed = 2, both = 3',
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `coin_settings_coin_id_foreign`(`coin_id`) USING BTREE,
  CONSTRAINT `coin_settings_coin_id_foreign` FOREIGN KEY (`coin_id`) REFERENCES `coins` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for coins
-- ----------------------------
DROP TABLE IF EXISTS `coins`;
CREATE TABLE `coins`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `coin_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `full_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `coin_icon` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `is_currency` tinyint(1) NOT NULL DEFAULT 0,
  `deposit_status` tinyint(4) NOT NULL DEFAULT 0,
  `withdrawal_status` tinyint(4) NOT NULL DEFAULT 0,
  `active_status` tinyint(4) NOT NULL DEFAULT 0,
  `minimum_buy_amount` decimal(19, 8) NOT NULL DEFAULT 0,
  `minimum_sell_amount` decimal(19, 8) NOT NULL DEFAULT 0,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `coins_coin_type_unique`(`coin_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for comments
-- ----------------------------
DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `service_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for contact_us
-- ----------------------------
DROP TABLE IF EXISTS `contact_us`;
CREATE TABLE `contact_us`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `file` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for deposits
-- ----------------------------
DROP TABLE IF EXISTS `deposits`;
CREATE TABLE `deposits`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `receiver_wallet_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `amount` decimal(19, 8) NOT NULL,
  `address` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `fees` decimal(19, 8) NOT NULL DEFAULT 0,
  `sender_wallet_id` bigint(20) NULL DEFAULT NULL,
  `address_type` tinyint(4) NOT NULL DEFAULT 1,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `doller` decimal(19, 8) NOT NULL DEFAULT 0,
  `transaction_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `confirmations` int(11) NOT NULL DEFAULT 0,
  `transaction_hash` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT 'status: waiting = 0, processed = 1, pending = 2, cancelled = 3',
  `deposit_by` bigint(20) UNSIGNED NOT NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `deposits_receiver_wallet_id_transaction_hash_unique`(`receiver_wallet_id`, `transaction_hash`) USING BTREE,
  CONSTRAINT `deposits_receiver_wallet_id_foreign` FOREIGN KEY (`receiver_wallet_id`) REFERENCES `wallets` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for earnings
-- ----------------------------
DROP TABLE IF EXISTS `earnings`;
CREATE TABLE `earnings`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `sell_id` bigint(20) NULL DEFAULT NULL,
  `bid_id` bigint(20) NULL DEFAULT NULL,
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT 'Who debited or credited amount',
  `coin_id` bigint(20) NULL DEFAULT NULL,
  `user_to_platform` tinyint(4) NULL DEFAULT NULL,
  `platform_to_user` tinyint(4) NULL DEFAULT NULL,
  `trans_amount` decimal(19, 8) NOT NULL,
  `amount` decimal(19, 8) NOT NULL,
  `coin_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `comments` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for failed_jobs
-- ----------------------------
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp(0) NOT NULL DEFAULT current_timestamp(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for faq_heads
-- ----------------------------
DROP TABLE IF EXISTS `faq_heads`;
CREATE TABLE `faq_heads`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of faq_heads
-- ----------------------------
INSERT INTO `faq_heads` VALUES (1, 'General', 'fas fa-home', '2022-03-16 09:15:28', '2022-03-16 09:15:28');
INSERT INTO `faq_heads` VALUES (2, 'Support', 'fas fa-life-ring', '2022-03-16 09:15:28', '2022-03-16 09:15:28');
INSERT INTO `faq_heads` VALUES (3, 'Hosting', 'fas fa-bolt', '2022-03-16 09:15:28', '2022-03-16 09:15:28');
INSERT INTO `faq_heads` VALUES (4, 'Products', 'fas fa-pen-nib', '2022-03-16 09:15:28', '2022-03-16 09:15:28');

-- ----------------------------
-- Table structure for faqs
-- ----------------------------
DROP TABLE IF EXISTS `faqs`;
CREATE TABLE `faqs`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `question` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `author` bigint(20) NULL DEFAULT NULL,
  `fh_id` bigint(20) NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of faqs
-- ----------------------------
INSERT INTO `faqs` VALUES (1, 'How does it work', 'Existence in this spot, which was created for the bliss of souls like mine. I am so happy, my dear friend, so absorbed in the exquisite sense of mere tranquil existence, that I neglect my talents. I should be incapable of drawing a single stroke at the present moment; and yet I feel that I never was a greater artist than now. When, while the lovely valley teems', 1, NULL, 1, '2022-03-16 09:15:28', '2022-03-16 09:15:28');
INSERT INTO `faqs` VALUES (2, 'How does it work2', 'Existence in this spot, which was created for the bliss of souls like mine. I am so happy, my dear friend, so absorbed in the exquisite sense of mere tranquil existence, that I neglect my talents. I should be incapable of drawing a single stroke at the present moment; and yet I feel that I never was a greater artist than now. When, while the lovely valley teems', 1, NULL, 2, '2022-03-16 09:15:29', '2022-03-16 09:15:29');
INSERT INTO `faqs` VALUES (3, 'How does it work3', 'Existence in this spot, which was created for the bliss of souls like mine. I am so happy, my dear friend, so absorbed in the exquisite sense of mere tranquil existence, that I neglect my talents. I should be incapable of drawing a single stroke at the present moment; and yet I feel that I never was a greater artist than now. When, while the lovely valley teems', 1, NULL, 3, '2022-03-16 09:15:29', '2022-03-16 09:15:29');
INSERT INTO `faqs` VALUES (4, 'How does it work4', 'Existence in this spot, which was created for the bliss of souls like mine. I am so happy, my dear friend, so absorbed in the exquisite sense of mere tranquil existence, that I neglect my talents. I should be incapable of drawing a single stroke at the present moment; and yet I feel that I never was a greater artist than now. When, while the lovely valley teems', 1, NULL, 4, '2022-03-16 09:15:29', '2022-03-16 09:15:29');

-- ----------------------------
-- Table structure for follows
-- ----------------------------
DROP TABLE IF EXISTS `follows`;
CREATE TABLE `follows`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `follower_id` bigint(20) UNSIGNED NOT NULL,
  `following_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for jobs
-- ----------------------------
DROP TABLE IF EXISTS `jobs`;
CREATE TABLE `jobs`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `queue` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED NULL DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `jobs_queue_index`(`queue`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for like_views
-- ----------------------------
DROP TABLE IF EXISTS `like_views`;
CREATE TABLE `like_views`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `service_id` bigint(20) UNSIGNED NOT NULL,
  `isLike` tinyint(4) NOT NULL DEFAULT 0,
  `isView` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 44 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (1, '2021_01_29_987898_create_users_table', 1);
INSERT INTO `migrations` VALUES (2, '2021_02_06_053527_create_coins_table', 1);
INSERT INTO `migrations` VALUES (3, '2021_02_26_064136_create_coin_payment_api_logs_table', 1);
INSERT INTO `migrations` VALUES (4, '2021_06_17_123519_create_faqs_table', 1);
INSERT INTO `migrations` VALUES (5, '2021_06_19_095619_create_send_mail_records_table', 1);
INSERT INTO `migrations` VALUES (6, '2021_06_19_183647_create_notifications_table', 1);
INSERT INTO `migrations` VALUES (7, '2021_06_24_092552_create_wallets_table', 1);
INSERT INTO `migrations` VALUES (8, '2021_07_24_092303_create_user_settings_table', 1);
INSERT INTO `migrations` VALUES (9, '2021_07_24_092409_create_activity_logs_table', 1);
INSERT INTO `migrations` VALUES (10, '2021_07_24_103207_create_user_verification_codes_table', 1);
INSERT INTO `migrations` VALUES (11, '2021_07_29_165701_create_withdrawal2fas_table', 1);
INSERT INTO `migrations` VALUES (12, '2021_10_12_100000_create_password_resets_table', 1);
INSERT INTO `migrations` VALUES (13, '2021_10_29_092331_create_settings_table', 1);
INSERT INTO `migrations` VALUES (14, '2021_11_05_114624_create_categories_table', 1);
INSERT INTO `migrations` VALUES (15, '2021_11_05_120709_create_services_table', 1);
INSERT INTO `migrations` VALUES (16, '2021_11_05_123947_create_comments_table', 1);
INSERT INTO `migrations` VALUES (17, '2021_11_05_124348_create_bids_table', 1);
INSERT INTO `migrations` VALUES (18, '2021_11_05_125637_create_transactions_table', 1);
INSERT INTO `migrations` VALUES (19, '2021_11_08_130533_create_user_social_media_table', 1);
INSERT INTO `migrations` VALUES (20, '2021_11_11_091920_create_news_table', 1);
INSERT INTO `migrations` VALUES (21, '2021_11_12_112426_create_jobs_table', 1);
INSERT INTO `migrations` VALUES (22, '2021_11_12_112758_create_failed_jobs_table', 1);
INSERT INTO `migrations` VALUES (23, '2021_11_16_092217_create_like_views_table', 1);
INSERT INTO `migrations` VALUES (24, '2021_11_17_064400_create_top_sellers_table', 1);
INSERT INTO `migrations` VALUES (25, '2021_11_19_075746_create_user_wallet_records_table', 1);
INSERT INTO `migrations` VALUES (26, '2021_11_19_124028_create_deposits_table', 1);
INSERT INTO `migrations` VALUES (27, '2021_11_20_052714_create_withdrawal_coin_limit_settings_table', 1);
INSERT INTO `migrations` VALUES (28, '2021_11_20_055540_create_withdrawals_table', 1);
INSERT INTO `migrations` VALUES (29, '2021_11_20_055732_create_withdrawal_cancel_reasons_table', 1);
INSERT INTO `migrations` VALUES (30, '2021_11_20_101944_create_coin_settings_table', 1);
INSERT INTO `migrations` VALUES (31, '2021_11_22_064057_create_subscribers_table', 1);
INSERT INTO `migrations` VALUES (32, '2021_11_25_053808_create_sell_services_table', 1);
INSERT INTO `migrations` VALUES (33, '2021_11_26_062638_create_sliders_table', 1);
INSERT INTO `migrations` VALUES (34, '2021_11_26_103159_create_faq_heads_table', 1);
INSERT INTO `migrations` VALUES (35, '2021_11_26_131629_create_contact_us_table', 1);
INSERT INTO `migrations` VALUES (36, '2021_12_02_060431_create_follows_table', 1);
INSERT INTO `migrations` VALUES (37, '2021_12_07_061136_create_bid_histories_table', 1);
INSERT INTO `migrations` VALUES (38, '2021_12_13_090643_create_service_charges_table', 1);
INSERT INTO `migrations` VALUES (39, '2021_12_13_115111_create_earnings_table', 1);
INSERT INTO `migrations` VALUES (40, '2021_12_24_025946_create_user_wallet_update_trigger', 1);
INSERT INTO `migrations` VALUES (41, '2021_12_24_055710_create_resell_services_table', 1);
INSERT INTO `migrations` VALUES (42, '2021_12_24_061755_create_user_wallet_insert_trigger', 1);
INSERT INTO `migrations` VALUES (43, '2021_12_24_063944_create_transfer_tokens_table', 1);

-- ----------------------------
-- Table structure for news
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `thumbnail` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `views` int(11) NOT NULL DEFAULT 0,
  `likes` int(11) NOT NULL DEFAULT 0,
  `isHotNews` tinyint(4) NOT NULL DEFAULT 1,
  `IsTrending` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO `news` VALUES (1, 'Record price drop of Bitcoin is about 5.6%', 'record-price-drop-of-bitcoin-is-about-56', '<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem  ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit,  sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?</p>', '1.jpg', 0, 0, 1, 1, '2022-03-16 09:15:29', '2022-03-16 09:15:29', NULL);
INSERT INTO `news` VALUES (2, 'New Coin in the market!', 'new-coin-in-the-market', '<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem  ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit,  sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?</p>', '2.jpg', 0, 0, 1, 1, '2022-03-16 09:15:29', '2022-03-16 09:15:29', NULL);
INSERT INTO `news` VALUES (3, 'What’s happening in the crypto world?', 'whats-happening-in-the-crypto-world', '<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem  ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit,  sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?</p>', '3.jpg', 0, 0, 1, 1, '2022-03-16 09:15:29', '2022-03-16 09:15:29', NULL);

-- ----------------------------
-- Table structure for notifications
-- ----------------------------
DROP TABLE IF EXISTS `notifications`;
CREATE TABLE `notifications`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NULL DEFAULT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `notification_body` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `type` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'Type: Any = 0, transaction = 1, registration = 2',
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets`  (
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  INDEX `password_resets_email_index`(`email`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for resell_services
-- ----------------------------
DROP TABLE IF EXISTS `resell_services`;
CREATE TABLE `resell_services`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `new_service_id` bigint(20) UNSIGNED NOT NULL,
  `past_service_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `resell_services_new_service_id_index`(`new_service_id`) USING BTREE,
  INDEX `resell_services_past_service_id_index`(`past_service_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sell_services
-- ----------------------------
DROP TABLE IF EXISTS `sell_services`;
CREATE TABLE `sell_services`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `price_amount` decimal(19, 8) NOT NULL,
  `coin_amount` decimal(19, 8) NOT NULL,
  `service_charge` decimal(19, 8) NOT NULL,
  `service_charge_coin` decimal(19, 8) NOT NULL,
  `conversion_rate` decimal(19, 8) NOT NULL,
  `service_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `is_sale_bid` tinyint(1) NOT NULL,
  `coin_type` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `coin_id` bigint(20) UNSIGNED NOT NULL,
  `status` tinyint(4) NOT NULL,
  `refund_amount` decimal(19, 8) NOT NULL DEFAULT 0,
  `wallet_id` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sell_services_service_id_index`(`service_id`) USING BTREE,
  INDEX `sell_services_user_id_index`(`user_id`) USING BTREE,
  INDEX `sell_services_coin_id_index`(`coin_id`) USING BTREE,
  INDEX `sell_services_wallet_id_index`(`wallet_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for send_mail_records
-- ----------------------------
DROP TABLE IF EXISTS `send_mail_records`;
CREATE TABLE `send_mail_records`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `email_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for service_charges
-- ----------------------------
DROP TABLE IF EXISTS `service_charges`;
CREATE TABLE `service_charges`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `service_holder` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` tinyint(4) NOT NULL COMMENT '1 = Fixed, 2 = Percentage',
  `amount` decimal(19, 8) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of service_charges
-- ----------------------------
INSERT INTO `service_charges` VALUES (1, 'buyer', 1, 1.00000000, 0, '2022-03-16 09:15:29', '2022-03-16 09:15:29');
INSERT INTO `service_charges` VALUES (2, 'buyer', 2, 2.00000000, 1, '2022-03-16 09:15:29', '2022-03-16 09:15:29');
INSERT INTO `service_charges` VALUES (3, 'seller', 1, 2.00000000, 0, '2022-03-16 09:15:29', '2022-03-16 09:15:29');
INSERT INTO `service_charges` VALUES (4, 'seller', 2, 5.00000000, 1, '2022-03-16 09:15:29', '2022-03-16 09:15:29');

-- ----------------------------
-- Table structure for services
-- ----------------------------
DROP TABLE IF EXISTS `services`;
CREATE TABLE `services`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` tinyint(4) NOT NULL,
  `expired_at` timestamp(0) NOT NULL DEFAULT current_timestamp(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `price_dollar` decimal(19, 8) NOT NULL,
  `fees_percentage` decimal(19, 8) NOT NULL,
  `fees_fixed` decimal(19, 8) NOT NULL,
  `fees_type` tinyint(4) NOT NULL,
  `like` int(11) NOT NULL DEFAULT 0,
  `dislike` int(11) NOT NULL DEFAULT 0,
  `available_item` decimal(19, 8) NOT NULL,
  `views` int(11) NOT NULL DEFAULT 0,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `status` tinyint(4) NOT NULL,
  `isSlider` tinyint(4) NOT NULL DEFAULT 0,
  `comment` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `buyer_id` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `is_resellable` tinyint(4) NOT NULL DEFAULT 0,
  `resell_service_id` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `thumbnail` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `video_link` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `color` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `origin` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `mint_address` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `max_bid_amount` decimal(8, 2) NOT NULL DEFAULT 999999,
  `min_bid_amount` decimal(8, 2) NOT NULL DEFAULT 0,
  `is_unlockable` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for settings
-- ----------------------------
DROP TABLE IF EXISTS `settings`;
CREATE TABLE `settings`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 67 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of settings
-- ----------------------------
INSERT INTO `settings` VALUES (1, 'app_title', 'Nft', NULL, '2022-03-16 16:37:00');
INSERT INTO `settings` VALUES (2, 'maximum_withdrawal_daily', '3', NULL, NULL);
INSERT INTO `settings` VALUES (3, 'mail_from', 'noreply@ntfzi.com', NULL, NULL);
INSERT INTO `settings` VALUES (4, 'maintenance_mode', 'no', '2022-03-16 09:15:26', '2022-03-16 09:15:26');
INSERT INTO `settings` VALUES (5, 'logo', '', '2022-03-16 09:15:26', '2022-03-16 09:15:26');
INSERT INTO `settings` VALUES (6, 'login_logo', '', '2022-03-16 09:15:26', '2022-03-16 09:15:26');
INSERT INTO `settings` VALUES (7, 'landing_logo', '', '2022-03-16 09:15:26', '2022-03-16 09:15:26');
INSERT INTO `settings` VALUES (8, 'favicon', '', '2022-03-16 09:15:26', '2022-03-16 09:15:26');
INSERT INTO `settings` VALUES (9, 'dashboard_image', '6232122c6fb751647448620.png', '2022-03-16 09:15:26', '2022-03-16 16:37:00');
INSERT INTO `settings` VALUES (10, 'copyright_text', 'Copyright@2022', '2022-03-16 09:15:26', '2022-03-16 16:37:00');
INSERT INTO `settings` VALUES (11, 'pagination_count', '10', '2022-03-16 09:15:26', '2022-03-16 09:15:26');
INSERT INTO `settings` VALUES (12, 'point_rate', '1', '2022-03-16 09:15:26', '2022-03-16 09:15:26');
INSERT INTO `settings` VALUES (13, 'lang', 'en', '2022-03-16 09:15:26', '2022-03-16 16:37:00');
INSERT INTO `settings` VALUES (14, 'company_name', 'Nft', '2022-03-16 09:15:26', '2022-03-16 16:37:00');
INSERT INTO `settings` VALUES (15, 'primary_email', 'test@email.com', '2022-03-16 09:15:26', '2022-03-16 09:15:26');
INSERT INTO `settings` VALUES (16, 'sms_getway_name', 'twillo', '2022-03-16 09:15:26', '2022-03-16 09:15:26');
INSERT INTO `settings` VALUES (17, 'twillo_secret_key', 'test', '2022-03-16 09:15:27', '2022-03-16 09:15:27');
INSERT INTO `settings` VALUES (18, 'twillo_auth_token', 'test', '2022-03-16 09:15:27', '2022-03-16 09:15:27');
INSERT INTO `settings` VALUES (19, 'twillo_number', 'test', '2022-03-16 09:15:27', '2022-03-16 09:15:27');
INSERT INTO `settings` VALUES (20, 'ssl_verify', '', '2022-03-16 09:15:27', '2022-03-16 09:15:27');
INSERT INTO `settings` VALUES (21, 'mail_driver', 'SMTP', '2022-03-16 09:15:27', '2022-03-16 09:15:27');
INSERT INTO `settings` VALUES (22, 'mail_host', 'smtp.mailtrap.io', '2022-03-16 09:15:27', '2022-03-16 09:15:27');
INSERT INTO `settings` VALUES (23, 'mail_port', '2525', '2022-03-16 09:15:27', '2022-03-16 09:15:27');
INSERT INTO `settings` VALUES (24, 'mail_username', '04bc2d327c43e7', '2022-03-16 09:15:27', '2022-03-16 09:15:27');
INSERT INTO `settings` VALUES (25, 'mail_password', 'de96fea5d103ca', '2022-03-16 09:15:27', '2022-03-16 09:15:27');
INSERT INTO `settings` VALUES (26, 'mail_encryption', 'tls', '2022-03-16 09:15:27', '2022-03-16 09:15:27');
INSERT INTO `settings` VALUES (27, 'mail_from_address', 'demo@demo.com', '2022-03-16 09:15:27', '2022-03-16 09:15:27');
INSERT INTO `settings` VALUES (28, 'braintree_client_token', 'test', '2022-03-16 09:15:27', '2022-03-16 09:15:27');
INSERT INTO `settings` VALUES (29, 'braintree_environment', 'sandbox', '2022-03-16 09:15:27', '2022-03-16 09:15:27');
INSERT INTO `settings` VALUES (30, 'braintree_merchant_id', 'test', '2022-03-16 09:15:27', '2022-03-16 09:15:27');
INSERT INTO `settings` VALUES (31, 'braintree_public_key', 'test', '2022-03-16 09:15:27', '2022-03-16 09:15:27');
INSERT INTO `settings` VALUES (32, 'braintree_private_key', 'test', '2022-03-16 09:15:27', '2022-03-16 09:15:27');
INSERT INTO `settings` VALUES (33, 'sms_getway_name', 'twillo', '2022-03-16 09:15:27', '2022-03-16 09:15:27');
INSERT INTO `settings` VALUES (34, 'clickatell_api_key', 'test', '2022-03-16 09:15:27', '2022-03-16 09:15:27');
INSERT INTO `settings` VALUES (35, 'number_of_confirmation', '6', '2022-03-16 09:15:27', '2022-03-16 09:15:27');
INSERT INTO `settings` VALUES (36, 'coin_api_user', 'test', '2022-03-16 09:15:27', '2022-03-16 09:15:27');
INSERT INTO `settings` VALUES (37, 'coin_api_pass', 'test', '2022-03-16 09:15:27', '2022-03-16 09:15:27');
INSERT INTO `settings` VALUES (38, 'coin_api_host', 'test5', '2022-03-16 09:15:27', '2022-03-16 09:15:27');
INSERT INTO `settings` VALUES (39, 'coin_api_port', 'test', '2022-03-16 09:15:27', '2022-03-16 09:15:27');
INSERT INTO `settings` VALUES (40, 'send_fees_type', '1', '2022-03-16 09:15:27', '2022-03-16 09:15:27');
INSERT INTO `settings` VALUES (41, 'send_fees_fixed', '0', '2022-03-16 09:15:27', '2022-03-16 09:15:27');
INSERT INTO `settings` VALUES (42, 'send_fees_percentage', '0', '2022-03-16 09:15:27', '2022-03-16 09:15:27');
INSERT INTO `settings` VALUES (43, 'max_send_limit', '0', '2022-03-16 09:15:27', '2022-03-16 09:15:27');
INSERT INTO `settings` VALUES (44, 'deposit_time', '1', '2022-03-16 09:15:27', '2022-03-16 09:15:27');
INSERT INTO `settings` VALUES (45, 'COIN_PAYMENT_PUBLIC_KEY', 'test', '2022-03-16 09:15:27', '2022-03-16 09:15:27');
INSERT INTO `settings` VALUES (46, 'COIN_PAYMENT_PRIVATE_KEY', 'test', '2022-03-16 09:15:27', '2022-03-16 09:15:27');
INSERT INTO `settings` VALUES (47, 'COIN_PAYMENT_CURRENCY', 'BTC', '2022-03-16 09:15:27', '2022-03-16 09:15:27');
INSERT INTO `settings` VALUES (48, 'payment_method_coin_payment', '1', '2022-03-16 09:15:27', '2022-03-16 09:15:27');
INSERT INTO `settings` VALUES (49, 'home_famous_title', 'Top famous NFTs and authors all in one place', '2022-03-16 09:15:27', '2022-03-16 09:15:27');
INSERT INTO `settings` VALUES (50, 'home_famous_content', 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. ', '2022-03-16 09:15:27', '2022-03-16 09:15:27');
INSERT INTO `settings` VALUES (51, 'home_latest_title', 'Latest Collection', '2022-03-16 09:15:27', '2022-03-16 09:15:27');
INSERT INTO `settings` VALUES (52, 'home_latest_content', 'Meridian sun strikes the upper surface of the impenetrable foliage of my trees, and but a few stray gleams steal into the inner', '2022-03-16 09:15:27', '2022-03-16 09:15:27');
INSERT INTO `settings` VALUES (53, 'home_explorer_title', 'Explore More', '2022-03-16 09:15:27', '2022-03-16 09:15:27');
INSERT INTO `settings` VALUES (54, 'home_explorer_content', 'Meridian sun strikes the upper surface of the impenetrable foliatrees and but a few stray gleams steal into the inner', '2022-03-16 09:15:27', '2022-03-16 09:15:27');
INSERT INTO `settings` VALUES (55, 'home_footer_title', 'Get started with us today', '2022-03-16 09:15:28', '2022-03-16 09:15:28');
INSERT INTO `settings` VALUES (56, 'home_footer_content', 'Earn exciting points and free crypto by submitting your work.', '2022-03-16 09:15:28', '2022-03-16 09:15:28');
INSERT INTO `settings` VALUES (57, 'counters_title', 'Amazing traditional Artworks, which is trending now', '2022-03-16 09:15:28', '2022-03-16 09:15:28');
INSERT INTO `settings` VALUES (58, 'counters_img_one', '', '2022-03-16 09:15:28', '2022-03-16 09:15:28');
INSERT INTO `settings` VALUES (59, 'counters_img_two', '', '2022-03-16 09:15:28', '2022-03-16 09:15:28');
INSERT INTO `settings` VALUES (60, 'counters_content_one', 'Artwork', '2022-03-16 09:15:28', '2022-03-16 09:15:28');
INSERT INTO `settings` VALUES (61, 'counters_count_one', '20', '2022-03-16 09:15:28', '2022-03-16 09:15:28');
INSERT INTO `settings` VALUES (62, 'counters_content_two', 'Auction', '2022-03-16 09:15:28', '2022-03-16 09:15:28');
INSERT INTO `settings` VALUES (63, 'counters_count_two', '130', '2022-03-16 09:15:28', '2022-03-16 09:15:28');
INSERT INTO `settings` VALUES (64, 'counters_content_three', 'Artist', '2022-03-16 09:15:28', '2022-03-16 09:15:28');
INSERT INTO `settings` VALUES (65, 'counters_count_three', '14', '2022-03-16 09:15:28', '2022-03-16 09:15:28');
INSERT INTO `settings` VALUES (66, 'service_charge', '5', '2022-03-16 09:15:28', '2022-03-16 09:15:28');

-- ----------------------------
-- Table structure for sliders
-- ----------------------------
DROP TABLE IF EXISTS `sliders`;
CREATE TABLE `sliders`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `short_description` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `long_desc_header` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `long_desc_middle` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `long_desc_footer` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sliders
-- ----------------------------
INSERT INTO `sliders` VALUES (1, 'Buy and sell NFTs from the world’s top artists', 'The', 'New World', 'of Digital Collectibles', '2022-03-16 09:15:28', '2022-03-16 09:15:28');

-- ----------------------------
-- Table structure for subscribers
-- ----------------------------
DROP TABLE IF EXISTS `subscribers`;
CREATE TABLE `subscribers`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `email_address` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for top_sellers
-- ----------------------------
DROP TABLE IF EXISTS `top_sellers`;
CREATE TABLE `top_sellers`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `amount` double(19, 8) NOT NULL DEFAULT 0,
  `activate_date` date NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for transactions
-- ----------------------------
DROP TABLE IF EXISTS `transactions`;
CREATE TABLE `transactions`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `amount` decimal(19, 8) NOT NULL,
  `buyer_id` bigint(20) UNSIGNED NOT NULL,
  `seller_id` bigint(20) UNSIGNED NOT NULL,
  `transaction_hash` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `bid_id` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `fees` decimal(19, 8) NOT NULL,
  `transaction_time` timestamp(0) NOT NULL DEFAULT current_timestamp(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `status` tinyint(4) NOT NULL,
  `coin_type` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `coin_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `transactions_buyer_id_index`(`buyer_id`) USING BTREE,
  INDEX `transactions_seller_id_index`(`seller_id`) USING BTREE,
  INDEX `transactions_bid_id_index`(`bid_id`) USING BTREE,
  INDEX `transactions_coin_id_index`(`coin_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for transfer_tokens
-- ----------------------------
DROP TABLE IF EXISTS `transfer_tokens`;
CREATE TABLE `transfer_tokens`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `service_id` bigint(20) UNSIGNED NOT NULL,
  `resell_service_id` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `prev_mint_address` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `new_mint_address` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `transfer_tokens_service_id_index`(`service_id`) USING BTREE,
  INDEX `transfer_tokens_resell_service_id_index`(`resell_service_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user_settings
-- ----------------------------
DROP TABLE IF EXISTS `user_settings`;
CREATE TABLE `user_settings`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_settings_user_id_foreign`(`user_id`) USING BTREE,
  CONSTRAINT `user_settings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user_social_media
-- ----------------------------
DROP TABLE IF EXISTS `user_social_media`;
CREATE TABLE `user_social_media`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `facebook` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `twitter` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `instagram` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_social_media_user_id_index`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user_verification_codes
-- ----------------------------
DROP TABLE IF EXISTS `user_verification_codes`;
CREATE TABLE `user_verification_codes`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `expired_at` datetime(0) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `first_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `bio` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `email` varchar(180) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `reset_code` varchar(180) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `role` int(11) NOT NULL DEFAULT 2,
  `status` int(11) NOT NULL DEFAULT 1,
  `country_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `phone` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `phone_verified` tinyint(4) NOT NULL DEFAULT 0,
  `country` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `gender` tinyint(4) NOT NULL DEFAULT 1,
  `birth_date` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `photo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `cover_photo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `website` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `g2f_enabled` enum('0','1') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `google2fa_secret` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `is_verified` tinyint(4) NOT NULL DEFAULT 0,
  `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `language` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'en',
  `device_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `device_type` tinyint(4) NOT NULL DEFAULT 1,
  `push_notification_status` tinyint(4) NOT NULL DEFAULT 1,
  `email_notification_status` tinyint(4) NOT NULL DEFAULT 1,
  `new_bid_notification` tinyint(4) NOT NULL DEFAULT 1,
  `item_purchased_notification` tinyint(4) NOT NULL DEFAULT 1,
  `people_follow_notification` tinyint(4) NOT NULL DEFAULT 1,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_email_unique`(`email`) USING BTREE,
  UNIQUE INDEX `users_reset_code_unique`(`reset_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'Mr.', 'Admin', NULL, 'admin@email.com', NULL, 1, 1, NULL, NULL, 0, NULL, 1, NULL, NULL, NULL, NULL, '0', NULL, 1, '$2y$10$HlvFyu/Yt9K.F6LmIqOmYeVjlDUNbAWmapAPsiEvY7prd1cFfKipe', 'en', NULL, 1, 1, 1, 1, 1, 1, NULL, NULL, NULL);
INSERT INTO `users` VALUES (2, 'John', 'Doe', 'Wonderful serenity has taken possession of my entire soul, these mornings', 'user1@email.com', NULL, 2, 1, NULL, NULL, 0, 'Australia', 1, NULL, '1.jpg', NULL, NULL, '0', NULL, 1, '$2y$10$auYRmfXgR/7OV0SbmaTDIONIBZNiGLtu0znvTKvmagWEBPMFdkUVO', 'en', NULL, 1, 1, 1, 1, 1, 1, NULL, NULL, NULL);
INSERT INTO `users` VALUES (3, 'Hnik', 'Zairiya', 'Wonderful serenity has taken possession of my entire soul, these mornings', 'user2@email.com', NULL, 2, 1, NULL, NULL, 0, 'Australia', 1, NULL, '2.jpg', NULL, 'https://example.com', '0', NULL, 1, '$2y$10$0BKWuZG2MNFd6OWlCVsuu.v6.Fb5FD8wWrqb15GxpCoNrgRqE7kxa', 'en', NULL, 1, 1, 1, 1, 1, 1, NULL, NULL, NULL);
INSERT INTO `users` VALUES (4, 'Robert', 'Gomez', 'Wonderful serenity has taken possession of my entire soul, these mornings', 'user3@email.com', NULL, 2, 1, NULL, NULL, 0, 'Australia', 1, NULL, '3.jpg', NULL, 'https://example.com', '0', NULL, 1, '$2y$10$vRjxEl.pxxbzNY0OIJCoz.kBsqN1UBpa8NaVs0NuHuyHfbtKB0eZ.', 'en', NULL, 1, 1, 1, 1, 1, 1, NULL, NULL, NULL);
INSERT INTO `users` VALUES (5, 'MacKensie', 'Duke', 'Wonderful serenity has taken possession of my entire soul, these mornings', 'user4@email.com', NULL, 2, 1, NULL, NULL, 0, 'Australia', 1, NULL, '4.jpg', NULL, 'https://example.com', '0', NULL, 1, '$2y$10$W6cvArOowKIq.ZizSxm3zuRoDWz4/F8wHKabQwlU.cqnnKqXb/tkS', 'en', NULL, 1, 1, 1, 1, 1, 1, NULL, NULL, NULL);
INSERT INTO `users` VALUES (6, 'Petra', 'Garza', 'Wonderful serenity has taken possession of my entire soul, these mornings', 'user5@email.com', NULL, 2, 1, NULL, NULL, 0, 'Australia', 1, NULL, '5.jpg', NULL, 'https://example.com', '0', NULL, 1, '$2y$10$I2RbPDWakroaakkj0sL4xeRVaa32aYVadP8mA9V.lZDiIMJXrHCO2', 'en', NULL, 1, 1, 1, 1, 1, 1, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for wallet_records
-- ----------------------------
DROP TABLE IF EXISTS `wallet_records`;
CREATE TABLE `wallet_records`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `wallet_id` bigint(20) UNSIGNED NOT NULL,
  `previous_balance` decimal(19, 8) NOT NULL DEFAULT 0,
  `current_balance` decimal(19, 8) NOT NULL DEFAULT 0,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `wallet_records_wallet_id_foreign`(`wallet_id`) USING BTREE,
  CONSTRAINT `wallet_records_wallet_id_foreign` FOREIGN KEY (`wallet_id`) REFERENCES `wallets` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for wallets
-- ----------------------------
DROP TABLE IF EXISTS `wallets`;
CREATE TABLE `wallets`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `coin_id` bigint(20) UNSIGNED NOT NULL,
  `address` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `is_primary` tinyint(4) NOT NULL DEFAULT 0,
  `balance` decimal(19, 8) NOT NULL DEFAULT 0,
  `on_hold` decimal(19, 8) NOT NULL DEFAULT 0,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `wallets_user_id_foreign`(`user_id`) USING BTREE,
  INDEX `wallets_coin_id_foreign`(`coin_id`) USING BTREE,
  CONSTRAINT `wallets_coin_id_foreign` FOREIGN KEY (`coin_id`) REFERENCES `coins` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `wallets_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for withdrawal2fas
-- ----------------------------
DROP TABLE IF EXISTS `withdrawal2fas`;
CREATE TABLE `withdrawal2fas`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `wallet_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `coin_id` bigint(20) UNSIGNED NOT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(19, 8) NOT NULL,
  `fees` decimal(19, 8) NOT NULL DEFAULT 0,
  `transaction_hash` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT 'status: waiting = 0, processed = 1, pending = 2, cancelled = 3',
  `in_queue` tinyint(1) NOT NULL DEFAULT 0,
  `ip` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0.0.0.0',
  `withdrawal_coin_limit_setting_id` bigint(20) NOT NULL,
  `url_validation_code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `url_validation_url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `verification_code` int(11) NULL DEFAULT NULL,
  `expire_at` timestamp(0) NULL DEFAULT NULL,
  `failed_count` smallint(6) NOT NULL DEFAULT 0,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `withdrawal2fas_user_id_foreign`(`user_id`) USING BTREE,
  INDEX `withdrawal2fas_wallet_id_foreign`(`wallet_id`) USING BTREE,
  CONSTRAINT `withdrawal2fas_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `withdrawal2fas_wallet_id_foreign` FOREIGN KEY (`wallet_id`) REFERENCES `wallets` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for withdrawal_cancel_reasons
-- ----------------------------
DROP TABLE IF EXISTS `withdrawal_cancel_reasons`;
CREATE TABLE `withdrawal_cancel_reasons`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `withdrawal_id` bigint(20) UNSIGNED NOT NULL,
  `reason` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `withdrawal_cancel_reasons_withdrawal_id_foreign`(`withdrawal_id`) USING BTREE,
  CONSTRAINT `withdrawal_cancel_reasons_withdrawal_id_foreign` FOREIGN KEY (`withdrawal_id`) REFERENCES `withdrawals` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for withdrawal_coin_limit_settings
-- ----------------------------
DROP TABLE IF EXISTS `withdrawal_coin_limit_settings`;
CREATE TABLE `withdrawal_coin_limit_settings`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `from` decimal(19, 8) NOT NULL,
  `to` decimal(19, 8) NOT NULL,
  `id_verify_status` tinyint(4) NOT NULL DEFAULT 0,
  `phone_verify_status` tinyint(1) NOT NULL DEFAULT 1,
  `admin_approval` tinyint(1) NOT NULL DEFAULT 0,
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `google2fa` tinyint(1) NOT NULL DEFAULT 0,
  `email2fa` tinyint(1) NOT NULL DEFAULT 0,
  `coin_id` bigint(20) NOT NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `withdrawal_coin_limit_settings_created_by_foreign`(`created_by`) USING BTREE,
  CONSTRAINT `withdrawal_coin_limit_settings_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for withdrawals
-- ----------------------------
DROP TABLE IF EXISTS `withdrawals`;
CREATE TABLE `withdrawals`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `wallet_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(19, 8) NOT NULL,
  `address_type` tinyint(4) NOT NULL,
  `receiver_wallet_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `fees` decimal(19, 8) NOT NULL DEFAULT 0,
  `transaction_hash` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `confirmations` tinyint(4) NOT NULL DEFAULT 0,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT 'status: waiting = 0, processed = 1, pending = 2, cancelled = 3',
  `in_queue` tinyint(1) NOT NULL DEFAULT 0,
  `doller` decimal(19, 8) NOT NULL DEFAULT 0,
  `withdraw_by` bigint(20) UNSIGNED NOT NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `withdrawals_wallet_id_foreign`(`wallet_id`) USING BTREE,
  CONSTRAINT `withdrawals_wallet_id_foreign` FOREIGN KEY (`wallet_id`) REFERENCES `wallets` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Triggers structure for table wallets
-- ----------------------------
DROP TRIGGER IF EXISTS `WALLET_CREATE`;
delimiter ;;
CREATE TRIGGER `WALLET_CREATE` AFTER INSERT ON `wallets` FOR EACH ROW BEGIN
            INSERT INTO wallet_records  (wallet_id, previous_balance, current_balance, created_at, updated_at) VALUES (NEW.id, NEW.balance, NEW.balance, NOW(), NOW());
        END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table wallets
-- ----------------------------
DROP TRIGGER IF EXISTS `BALANCE_UPDATE`;
delimiter ;;
CREATE TRIGGER `BALANCE_UPDATE` AFTER UPDATE ON `wallets` FOR EACH ROW BEGIN
        IF (OLD.balance != NEW.balance) THEN
            INSERT INTO wallet_records  (wallet_id, previous_balance, current_balance, created_at, updated_at) VALUES (OLD.id, OLD.balance, NEW.balance, NOW(), NOW());
        END IF;
       END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
