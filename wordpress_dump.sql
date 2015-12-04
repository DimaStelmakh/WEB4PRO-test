-- Valentina Studio --
-- MySQL dump --
-- ---------------------------------------------------------


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
-- ---------------------------------------------------------


-- CREATE DATABASE "wordpress" -----------------------------
CREATE DATABASE IF NOT EXISTS `wordpress` CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `wordpress`;
-- ---------------------------------------------------------


-- CREATE TABLE "wp_commentmeta" ---------------------------
CREATE TABLE `wp_commentmeta` ( 
	`meta_id` BigInt( 20 ) UNSIGNED AUTO_INCREMENT NOT NULL,
	`comment_id` BigInt( 20 ) UNSIGNED NOT NULL DEFAULT '0',
	`meta_key` VarChar( 255 ) NULL,
	`meta_value` LongText NULL,
	PRIMARY KEY ( `meta_id` ) )
ENGINE = InnoDB
AUTO_INCREMENT = 1;
-- ---------------------------------------------------------


-- CREATE TABLE "wp_comments" ------------------------------
CREATE TABLE `wp_comments` ( 
	`comment_ID` BigInt( 20 ) UNSIGNED AUTO_INCREMENT NOT NULL,
	`comment_post_ID` BigInt( 20 ) UNSIGNED NOT NULL DEFAULT '0',
	`comment_author` TinyText NOT NULL,
	`comment_author_email` VarChar( 100 ) NOT NULL,
	`comment_author_url` VarChar( 200 ) NOT NULL,
	`comment_author_IP` VarChar( 100 ) NOT NULL,
	`comment_date` DateTime NOT NULL DEFAULT '0000-00-00 00:00:00',
	`comment_date_gmt` DateTime NOT NULL DEFAULT '0000-00-00 00:00:00',
	`comment_content` Text NOT NULL,
	`comment_karma` Int( 11 ) NOT NULL DEFAULT '0',
	`comment_approved` VarChar( 20 ) NOT NULL DEFAULT '1',
	`comment_agent` VarChar( 255 ) NOT NULL,
	`comment_type` VarChar( 20 ) NOT NULL,
	`comment_parent` BigInt( 20 ) UNSIGNED NOT NULL DEFAULT '0',
	`user_id` BigInt( 20 ) UNSIGNED NOT NULL DEFAULT '0',
	PRIMARY KEY ( `comment_ID` ) )
ENGINE = InnoDB
AUTO_INCREMENT = 2;
-- ---------------------------------------------------------


-- CREATE TABLE "wp_links" ---------------------------------
CREATE TABLE `wp_links` ( 
	`link_id` BigInt( 20 ) UNSIGNED AUTO_INCREMENT NOT NULL,
	`link_url` VarChar( 255 ) NOT NULL,
	`link_name` VarChar( 255 ) NOT NULL,
	`link_image` VarChar( 255 ) NOT NULL,
	`link_target` VarChar( 25 ) NOT NULL,
	`link_description` VarChar( 255 ) NOT NULL,
	`link_visible` VarChar( 20 ) NOT NULL DEFAULT 'Y',
	`link_owner` BigInt( 20 ) UNSIGNED NOT NULL DEFAULT '1',
	`link_rating` Int( 11 ) NOT NULL DEFAULT '0',
	`link_updated` DateTime NOT NULL DEFAULT '0000-00-00 00:00:00',
	`link_rel` VarChar( 255 ) NOT NULL,
	`link_notes` MediumText NOT NULL,
	`link_rss` VarChar( 255 ) NOT NULL,
	PRIMARY KEY ( `link_id` ) )
ENGINE = InnoDB
AUTO_INCREMENT = 1;
-- ---------------------------------------------------------


-- CREATE TABLE "wp_options" -------------------------------
CREATE TABLE `wp_options` ( 
	`option_id` BigInt( 20 ) UNSIGNED AUTO_INCREMENT NOT NULL,
	`option_name` VarChar( 64 ) NOT NULL,
	`option_value` LongText NOT NULL,
	`autoload` VarChar( 20 ) NOT NULL DEFAULT 'yes',
	PRIMARY KEY ( `option_id` ),
	CONSTRAINT `option_name` UNIQUE( `option_name` ) )
ENGINE = InnoDB
AUTO_INCREMENT = 357;
-- ---------------------------------------------------------


-- CREATE TABLE "wp_postmeta" ------------------------------
CREATE TABLE `wp_postmeta` ( 
	`meta_id` BigInt( 20 ) UNSIGNED AUTO_INCREMENT NOT NULL,
	`post_id` BigInt( 20 ) UNSIGNED NOT NULL DEFAULT '0',
	`meta_key` VarChar( 255 ) NULL,
	`meta_value` LongText NULL,
	PRIMARY KEY ( `meta_id` ) )
ENGINE = InnoDB
AUTO_INCREMENT = 54;
-- ---------------------------------------------------------


-- CREATE TABLE "wp_posts" ---------------------------------
CREATE TABLE `wp_posts` ( 
	`ID` BigInt( 20 ) UNSIGNED AUTO_INCREMENT NOT NULL,
	`post_author` BigInt( 20 ) UNSIGNED NOT NULL DEFAULT '0',
	`post_date` DateTime NOT NULL DEFAULT '0000-00-00 00:00:00',
	`post_date_gmt` DateTime NOT NULL DEFAULT '0000-00-00 00:00:00',
	`post_content` LongText NOT NULL,
	`post_title` Text NOT NULL,
	`post_excerpt` Text NOT NULL,
	`post_status` VarChar( 20 ) NOT NULL DEFAULT 'publish',
	`comment_status` VarChar( 20 ) NOT NULL DEFAULT 'open',
	`ping_status` VarChar( 20 ) NOT NULL DEFAULT 'open',
	`post_password` VarChar( 20 ) NOT NULL,
	`post_name` VarChar( 200 ) NOT NULL,
	`to_ping` Text NOT NULL,
	`pinged` Text NOT NULL,
	`post_modified` DateTime NOT NULL DEFAULT '0000-00-00 00:00:00',
	`post_modified_gmt` DateTime NOT NULL DEFAULT '0000-00-00 00:00:00',
	`post_content_filtered` LongText NOT NULL,
	`post_parent` BigInt( 20 ) UNSIGNED NOT NULL DEFAULT '0',
	`guid` VarChar( 255 ) NOT NULL,
	`menu_order` Int( 11 ) NOT NULL DEFAULT '0',
	`post_type` VarChar( 20 ) NOT NULL DEFAULT 'post',
	`post_mime_type` VarChar( 100 ) NOT NULL,
	`comment_count` BigInt( 20 ) NOT NULL DEFAULT '0',
	PRIMARY KEY ( `ID` ) )
ENGINE = InnoDB
AUTO_INCREMENT = 56;
-- ---------------------------------------------------------


-- CREATE TABLE "wp_term_relationships" --------------------
CREATE TABLE `wp_term_relationships` ( 
	`object_id` BigInt( 20 ) UNSIGNED NOT NULL UNIQUE DEFAULT '0',
	`term_taxonomy_id` BigInt( 20 ) UNSIGNED NOT NULL UNIQUE DEFAULT '0',
	`term_order` Int( 11 ) NOT NULL DEFAULT '0',
	PRIMARY KEY ( `object_id`, `term_taxonomy_id` ) )
ENGINE = InnoDB;
-- ---------------------------------------------------------


-- CREATE TABLE "wp_term_taxonomy" -------------------------
CREATE TABLE `wp_term_taxonomy` ( 
	`term_taxonomy_id` BigInt( 20 ) UNSIGNED AUTO_INCREMENT NOT NULL,
	`term_id` BigInt( 20 ) UNSIGNED NOT NULL UNIQUE DEFAULT '0',
	`taxonomy` VarChar( 32 ) NOT NULL UNIQUE,
	`description` LongText NOT NULL,
	`parent` BigInt( 20 ) UNSIGNED NOT NULL DEFAULT '0',
	`count` BigInt( 20 ) NOT NULL DEFAULT '0',
	PRIMARY KEY ( `term_taxonomy_id` ),
	CONSTRAINT `term_id_taxonomy` UNIQUE( `term_id`, `taxonomy` ) )
ENGINE = InnoDB
AUTO_INCREMENT = 8;
-- ---------------------------------------------------------


-- CREATE TABLE "wp_terms" ---------------------------------
CREATE TABLE `wp_terms` ( 
	`term_id` BigInt( 20 ) UNSIGNED AUTO_INCREMENT NOT NULL,
	`name` VarChar( 200 ) NOT NULL,
	`slug` VarChar( 200 ) NOT NULL,
	`term_group` BigInt( 10 ) NOT NULL DEFAULT '0',
	PRIMARY KEY ( `term_id` ) )
ENGINE = InnoDB
AUTO_INCREMENT = 8;
-- ---------------------------------------------------------


-- CREATE TABLE "wp_usermeta" ------------------------------
CREATE TABLE `wp_usermeta` ( 
	`umeta_id` BigInt( 20 ) UNSIGNED AUTO_INCREMENT NOT NULL,
	`user_id` BigInt( 20 ) UNSIGNED NOT NULL DEFAULT '0',
	`meta_key` VarChar( 255 ) NULL,
	`meta_value` LongText NULL,
	PRIMARY KEY ( `umeta_id` ) )
ENGINE = InnoDB
AUTO_INCREMENT = 22;
-- ---------------------------------------------------------


-- CREATE TABLE "wp_users" ---------------------------------
CREATE TABLE `wp_users` ( 
	`ID` BigInt( 20 ) UNSIGNED AUTO_INCREMENT NOT NULL,
	`user_login` VarChar( 60 ) NOT NULL,
	`user_pass` VarChar( 64 ) NOT NULL,
	`user_nicename` VarChar( 50 ) NOT NULL,
	`user_email` VarChar( 100 ) NOT NULL,
	`user_url` VarChar( 100 ) NOT NULL,
	`user_registered` DateTime NOT NULL DEFAULT '0000-00-00 00:00:00',
	`user_activation_key` VarChar( 60 ) NOT NULL,
	`user_status` Int( 11 ) NOT NULL DEFAULT '0',
	`display_name` VarChar( 250 ) NOT NULL,
	PRIMARY KEY ( `ID` ) )
ENGINE = InnoDB
AUTO_INCREMENT = 2;
-- ---------------------------------------------------------


-- Dump data of "wp_commentmeta" ---------------------------
-- ---------------------------------------------------------


-- Dump data of "wp_comments" ------------------------------
INSERT INTO `wp_comments`(`comment_ID`,`comment_post_ID`,`comment_author`,`comment_author_email`,`comment_author_url`,`comment_author_IP`,`comment_date`,`comment_date_gmt`,`comment_content`,`comment_karma`,`comment_approved`,`comment_agent`,`comment_type`,`comment_parent`,`user_id`) VALUES ( '1', '1', 'Mr WordPress', '', 'https://wordpress.org/', '', '2015-11-25 12:12:12', '2015-11-25 12:12:12', 'Hi, this is a comment.
To delete a comment, just log in and view the post&#039;s comments. There you will have the option to edit or delete them.', '0', '1', '', '', '0', '0' );
-- ---------------------------------------------------------


-- Dump data of "wp_links" ---------------------------------
-- ---------------------------------------------------------


-- Dump data of "wp_options" -------------------------------
INSERT INTO `wp_options`(`option_id`,`option_name`,`option_value`,`autoload`) VALUES ( '1', 'siteurl', 'http://wordpress.local', 'yes' );
INSERT INTO `wp_options`(`option_id`,`option_name`,`option_value`,`autoload`) VALUES ( '2', 'home', 'http://wordpress.local', 'yes' );
INSERT INTO `wp_options`(`option_id`,`option_name`,`option_value`,`autoload`) VALUES ( '3', 'blogname', '', 'yes' );
INSERT INTO `wp_options`(`option_id`,`option_name`,`option_value`,`autoload`) VALUES ( '4', 'blogdescription', 'Just another WordPress site', 'yes' );
INSERT INTO `wp_options`(`option_id`,`option_name`,`option_value`,`autoload`) VALUES ( '5', 'users_can_register', '0', 'yes' );
INSERT INTO `wp_options`(`option_id`,`option_name`,`option_value`,`autoload`) VALUES ( '6', 'admin_email', 'dmytriistelmakh@gmail.com', 'yes' );
INSERT INTO `wp_options`(`option_id`,`option_name`,`option_value`,`autoload`) VALUES ( '7', 'start_of_week', '1', 'yes' );
INSERT INTO `wp_options`(`option_id`,`option_name`,`option_value`,`autoload`) VALUES ( '8', 'use_balanceTags', '0', 'yes' );
INSERT INTO `wp_options`(`option_id`,`option_name`,`option_value`,`autoload`) VALUES ( '9', 'use_smilies', '1', 'yes' );
INSERT INTO `wp_options`(`option_id`,`option_name`,`option_value`,`autoload`) VALUES ( '10', 'require_name_email', '1', 'yes' );
INSERT INTO `wp_options`(`option_id`,`option_name`,`option_value`,`autoload`) VALUES ( '11', 'comments_notify', '1', 'yes' );
INSERT INTO `wp_options`(`option_id`,`option_name`,`option_value`,`autoload`) VALUES ( '12', 'posts_per_rss', '10', 'yes' );
INSERT INTO `wp_options`(`option_id`,`option_name`,`option_value`,`autoload`) VALUES ( '13', 'rss_use_excerpt', '0', 'yes' );
INSERT INTO `wp_options`(`option_id`,`option_name`,`option_value`,`autoload`) VALUES ( '14', 'mailserver_url', 'mail.example.com', 'yes' );
INSERT INTO `wp_options`(`option_id`,`option_name`,`option_value`,`autoload`) VALUES ( '15', 'mailserver_login', 'login@example.com', 'yes' );
INSERT INTO `wp_options`(`option_id`,`option_name`,`option_value`,`autoload`) VALUES ( '16', 'mailserver_pass', 'password', 'yes' );
INSERT INTO `wp_options`(`option_id`,`option_name`,`option_value`,`autoload`) VALUES ( '17', 'mailserver_port', '110', 'yes' );
INSERT INTO `wp_options`(`option_id`,`option_name`,`option_value`,`autoload`) VALUES ( '18', 'default_category', '1', 'yes' );
INSERT INTO `wp_options`(`option_id`,`option_name`,`option_value`,`autoload`) VALUES ( '19', 'default_comment_status', 'open', 'yes' );
INSERT INTO `wp_options`(`option_id`,`option_name`,`option_value`,`autoload`) VALUES ( '20', 'default_ping_status', 'open', 'yes' );
INSERT INTO `wp_options`(`option_id`,`option_name`,`option_value`,`autoload`) VALUES ( '21', 'default_pingback_flag', '0', 'yes' );
INSERT INTO `wp_options`(`option_id`,`option_name`,`option_value`,`autoload`) VALUES ( '22', 'posts_per_page', '10', 'yes' );
INSERT INTO `wp_options`(`option_id`,`option_name`,`option_value`,`autoload`) VALUES ( '23', 'date_format', 'F j, Y', 'yes' );
INSERT INTO `wp_options`(`option_id`,`option_name`,`option_value`,`autoload`) VALUES ( '24', 'time_format', 'g:i a', 'yes' );
INSERT INTO `wp_options`(`option_id`,`option_name`,`option_value`,`autoload`) VALUES ( '25', 'links_updated_date_format', 'F j, Y g:i a', 'yes' );
INSERT INTO `wp_options`(`option_id`,`option_name`,`option_value`,`autoload`) VALUES ( '26', 'comment_moderation', '0', 'yes' );
INSERT INTO `wp_options`(`option_id`,`option_name`,`option_value`,`autoload`) VALUES ( '27', 'moderation_notify', '1', 'yes' );
INSERT INTO `wp_options`(`option_id`,`option_name`,`option_value`,`autoload`) VALUES ( '28', 'permalink_structure', '/index.php/%year%/%monthnum%/%day%/%postname%/', 'yes' );
INSERT INTO `wp_options`(`option_id`,`option_name`,`option_value`,`autoload`) VALUES ( '29', 'gzipcompression', '0', 'yes' );
INSERT INTO `wp_options`(`option_id`,`option_name`,`option_value`,`autoload`) VALUES ( '30', 'hack_file', '0', 'yes' );
INSERT INTO `wp_options`(`option_id`,`option_name`,`option_value`,`autoload`) VALUES ( '31', 'blog_charset', 'UTF-8', 'yes' );
INSERT INTO `wp_options`(`option_id`,`option_name`,`option_value`,`autoload`) VALUES ( '32', 'moderation_keys', '', 'no' );
INSERT INTO `wp_options`(`option_id`,`option_name`,`option_value`,`autoload`) VALUES ( '33', 'active_plugins', 'a:1:{i:0;s:33:"my-news-plugin/my-news-plugin.php";}', 'yes' );
INSERT INTO `wp_options`(`option_id`,`option_name`,`option_value`,`autoload`) VALUES ( '34', 'category_base', '', 'yes' );
INSERT INTO `wp_options`(`option_id`,`option_name`,`option_value`,`autoload`) VALUES ( '35', 'ping_sites', 'http://rpc.pingomatic.com/', 'yes' );
INSERT INTO `wp_options`(`option_id`,`option_name`,`option_value`,`autoload`) VALUES ( '36', 'advanced_edit', '0', 'yes' );
INSERT INTO `wp_options`(`option_id`,`option_name`,`option_value`,`autoload`) VALUES ( '37', 'comment_max_links', '2', 'yes' );
INSERT INTO `wp_options`(`option_id`,`option_name`,`option_value`,`autoload`) VALUES ( '38', 'gmt_offset', '0', 'yes' );
INSERT INTO `wp_options`(`option_id`,`option_name`,`option_value`,`autoload`) VALUES ( '39', 'default_email_category', '1', 'yes' );
INSERT INTO `wp_options`(`option_id`,`option_name`,`option_value`,`autoload`) VALUES ( '40', 'recently_edited', 'a:2:{i:0;s:63:"/home/dima/www/wordpress/wp-content/plugins/akismet/akismet.php";i:1;s:0:"";}', 'no' );
INSERT INTO `wp_options`(`option_id`,`option_name`,`option_value`,`autoload`) VALUES ( '41', 'template', 'twentyfifteen', 'yes' );
INSERT INTO `wp_options`(`option_id`,`option_name`,`option_value`,`autoload`) VALUES ( '42', 'stylesheet', 'twentyfifteen', 'yes' );
INSERT INTO `wp_options`(`option_id`,`option_name`,`option_value`,`autoload`) VALUES ( '43', 'comment_whitelist', '1', 'yes' );
INSERT INTO `wp_options`(`option_id`,`option_name`,`option_value`,`autoload`) VALUES ( '44', 'blacklist_keys', '', 'no' );
INSERT INTO `wp_options`(`option_id`,`option_name`,`option_value`,`autoload`) VALUES ( '45', 'comment_registration', '0', 'yes' );
INSERT INTO `wp_options`(`option_id`,`option_name`,`option_value`,`autoload`) VALUES ( '46', 'html_type', 'text/html', 'yes' );
INSERT INTO `wp_options`(`option_id`,`option_name`,`option_value`,`autoload`) VALUES ( '47', 'use_trackback', '0', 'yes' );
INSERT INTO `wp_options`(`option_id`,`option_name`,`option_value`,`autoload`) VALUES ( '48', 'default_role', 'subscriber', 'yes' );
INSERT INTO `wp_options`(`option_id`,`option_name`,`option_value`,`autoload`) VALUES ( '49', 'db_version', '31535', 'yes' );
INSERT INTO `wp_options`(`option_id`,`option_name`,`option_value`,`autoload`) VALUES ( '50', 'uploads_use_yearmonth_folders', '1', 'yes' );
INSERT INTO `wp_options`(`option_id`,`option_name`,`option_value`,`autoload`) VALUES ( '51', 'upload_path', '', 'yes' );
INSERT INTO `wp_options`(`option_id`,`option_name`,`option_value`,`autoload`) VALUES ( '52', 'blog_public', '0', 'yes' );
INSERT INTO `wp_options`(`option_id`,`option_name`,`option_value`,`autoload`) VALUES ( '53', 'default_link_category', '2', 'yes' );
INSERT INTO `wp_options`(`option_id`,`option_name`,`option_value`,`autoload`) VALUES ( '54', 'show_on_front', 'posts', 'yes' );
INSERT INTO `wp_options`(`option_id`,`option_name`,`option_value`,`autoload`) VALUES ( '55', 'tag_base', '', 'yes' );
INSERT INTO `wp_options`(`option_id`,`option_name`,`option_value`,`autoload`) VALUES ( '56', 'show_avatars', '1', 'yes' );
INSERT INTO `wp_options`(`option_id`,`option_name`,`option_value`,`autoload`) VALUES ( '57', 'avatar_rating', 'G', 'yes' );
INSERT INTO `wp_options`(`option_id`,`option_name`,`option_value`,`autoload`) VALUES ( '58', 'upload_url_path', '', 'yes' );
INSERT INTO `wp_options`(`option_id`,`option_name`,`option_value`,`autoload`) VALUES ( '59', 'thumbnail_size_w', '150', 'yes' );
INSERT INTO `wp_options`(`option_id`,`option_name`,`option_value`,`autoload`) VALUES ( '60', 'thumbnail_size_h', '150', 'yes' );
INSERT INTO `wp_options`(`option_id`,`option_name`,`option_value`,`autoload`) VALUES ( '61', 'thumbnail_crop', '1', 'yes' );
INSERT INTO `wp_options`(`option_id`,`option_name`,`option_value`,`autoload`) VALUES ( '62', 'medium_size_w', '300', 'yes' );
INSERT INTO `wp_options`(`option_id`,`option_name`,`option_value`,`autoload`) VALUES ( '63', 'medium_size_h', '300', 'yes' );
INSERT INTO `wp_options`(`option_id`,`option_name`,`option_value`,`autoload`) VALUES ( '64', 'avatar_default', 'mystery', 'yes' );
INSERT INTO `wp_options`(`option_id`,`option_name`,`option_value`,`autoload`) VALUES ( '65', 'large_size_w', '1024', 'yes' );
INSERT INTO `wp_options`(`option_id`,`option_name`,`option_value`,`autoload`) VALUES ( '66', 'large_size_h', '1024', 'yes' );
INSERT INTO `wp_options`(`option_id`,`option_name`,`option_value`,`autoload`) VALUES ( '67', 'image_default_link_type', 'file', 'yes' );
INSERT INTO `wp_options`(`option_id`,`option_name`,`option_value`,`autoload`) VALUES ( '68', 'image_default_size', '', 'yes' );
INSERT INTO `wp_options`(`option_id`,`option_name`,`option_value`,`autoload`) VALUES ( '69', 'image_default_align', '', 'yes' );
INSERT INTO `wp_options`(`option_id`,`option_name`,`option_value`,`autoload`) VALUES ( '70', 'close_comments_for_old_posts', '0', 'yes' );
INSERT INTO `wp_options`(`option_id`,`option_name`,`option_value`,`autoload`) VALUES ( '71', 'close_comments_days_old', '14', 'yes' );
INSERT INTO `wp_options`(`option_id`,`option_name`,`option_value`,`autoload`) VALUES ( '72', 'thread_comments', '1', 'yes' );
INSERT INTO `wp_options`(`option_id`,`option_name`,`option_value`,`autoload`) VALUES ( '73', 'thread_comments_depth', '5', 'yes' );
INSERT INTO `wp_options`(`option_id`,`option_name`,`option_value`,`autoload`) VALUES ( '74', 'page_comments', '0', 'yes' );
INSERT INTO `wp_options`(`option_id`,`option_name`,`option_value`,`autoload`) VALUES ( '75', 'comments_per_page', '50', 'yes' );
INSERT INTO `wp_options`(`option_id`,`option_name`,`option_value`,`autoload`) VALUES ( '76', 'default_comments_page', 'newest', 'yes' );
INSERT INTO `wp_options`(`option_id`,`option_name`,`option_value`,`autoload`) VALUES ( '77', 'comment_order', 'asc', 'yes' );
INSERT INTO `wp_options`(`option_id`,`option_name`,`option_value`,`autoload`) VALUES ( '78', 'sticky_posts', 'a:0:{}', 'yes' );
INSERT INTO `wp_options`(`option_id`,`option_name`,`option_value`,`autoload`) VALUES ( '79', 'widget_categories', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes' );
INSERT INTO `wp_options`(`option_id`,`option_name`,`option_value`,`autoload`) VALUES ( '80', 'widget_text', 'a:0:{}', 'yes' );
INSERT INTO `wp_options`(`option_id`,`option_name`,`option_value`,`autoload`) VALUES ( '81', 'widget_rss', 'a:0:{}', 'yes' );
INSERT INTO `wp_options`(`option_id`,`option_name`,`option_value`,`autoload`) VALUES ( '82', 'uninstall_plugins', 'a:0:{}', 'no' );
INSERT INTO `wp_options`(`option_id`,`option_name`,`option_value`,`autoload`) VALUES ( '83', 'timezone_string', '', 'yes' );
INSERT INTO `wp_options`(`option_id`,`option_name`,`option_value`,`autoload`) VALUES ( '84', 'page_for_posts', '0', 'yes' );
INSERT INTO `wp_options`(`option_id`,`option_name`,`option_value`,`autoload`) VALUES ( '85', 'page_on_front', '0', 'yes' );
INSERT INTO `wp_options`(`option_id`,`option_name`,`option_value`,`autoload`) VALUES ( '86', 'default_post_format', '0', 'yes' );
INSERT INTO `wp_options`(`option_id`,`option_name`,`option_value`,`autoload`) VALUES ( '87', 'link_manager_enabled', '0', 'yes' );
INSERT INTO `wp_options`(`option_id`,`option_name`,`option_value`,`autoload`) VALUES ( '88', 'initial_db_version', '31535', 'yes' );
INSERT INTO `wp_options`(`option_id`,`option_name`,`option_value`,`autoload`) VALUES ( '89', 'wp_user_roles', 'a:5:{s:13:"administrator";a:2:{s:4:"name";s:13:"Administrator";s:12:"capabilities";a:62:{s:13:"switch_themes";b:1;s:11:"edit_themes";b:1;s:16:"activate_plugins";b:1;s:12:"edit_plugins";b:1;s:10:"edit_users";b:1;s:10:"edit_files";b:1;s:14:"manage_options";b:1;s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:6:"import";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:8:"level_10";b:1;s:7:"level_9";b:1;s:7:"level_8";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;s:12:"delete_users";b:1;s:12:"create_users";b:1;s:17:"unfiltered_upload";b:1;s:14:"edit_dashboard";b:1;s:14:"update_plugins";b:1;s:14:"delete_plugins";b:1;s:15:"install_plugins";b:1;s:13:"update_themes";b:1;s:14:"install_themes";b:1;s:11:"update_core";b:1;s:10:"list_users";b:1;s:12:"remove_users";b:1;s:9:"add_users";b:1;s:13:"promote_users";b:1;s:18:"edit_theme_options";b:1;s:13:"delete_themes";b:1;s:6:"export";b:1;}}s:6:"editor";a:2:{s:4:"name";s:6:"Editor";s:12:"capabilities";a:34:{s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;}}s:6:"author";a:2:{s:4:"name";s:6:"Author";s:12:"capabilities";a:10:{s:12:"upload_files";b:1;s:10:"edit_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:4:"read";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;s:22:"delete_published_posts";b:1;}}s:11:"contributor";a:2:{s:4:"name";s:11:"Contributor";s:12:"capabilities";a:5:{s:10:"edit_posts";b:1;s:4:"read";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;}}s:10:"subscriber";a:2:{s:4:"name";s:10:"Subscriber";s:12:"capabilities";a:2:{s:4:"read";b:1;s:7:"level_0";b:1;}}}', 'yes' );
INSERT INTO `wp_options`(`option_id`,`option_name`,`option_value`,`autoload`) VALUES ( '90', 'widget_search', 'a:2:{i:2;a:1:{s:5:"title";s:0:"";}s:12:"_multiwidget";i:1;}', 'yes' );
INSERT INTO `wp_options`(`option_id`,`option_name`,`option_value`,`autoload`) VALUES ( '91', 'widget_recent-posts', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes' );
INSERT INTO `wp_options`(`option_id`,`option_name`,`option_value`,`autoload`) VALUES ( '92', 'widget_recent-comments', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes' );
INSERT INTO `wp_options`(`option_id`,`option_name`,`option_value`,`autoload`) VALUES ( '93', 'widget_archives', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes' );
INSERT INTO `wp_options`(`option_id`,`option_name`,`option_value`,`autoload`) VALUES ( '94', 'widget_meta', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes' );
INSERT INTO `wp_options`(`option_id`,`option_name`,`option_value`,`autoload`) VALUES ( '95', 'sidebars_widgets', 'a:3:{s:19:"wp_inactive_widgets";a:0:{}s:9:"sidebar-1";a:2:{i:0;s:16:"my_news_plugin-2";i:1;s:8:"search-2";}s:13:"array_version";i:3;}', 'yes' );
INSERT INTO `wp_options`(`option_id`,`option_name`,`option_value`,`autoload`) VALUES ( '98', 'cron', 'a:5:{i:1449274334;a:3:{s:16:"wp_version_check";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}s:17:"wp_update_plugins";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}s:16:"wp_update_themes";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}}i:1449299820;a:1:{s:20:"wp_maybe_auto_update";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}}i:1449318552;a:1:{s:19:"wp_scheduled_delete";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1449331264;a:1:{s:30:"wp_scheduled_auto_draft_delete";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}s:7:"version";i:2;}', 'yes' );
INSERT INTO `wp_options`(`option_id`,`option_name`,`option_value`,`autoload`) VALUES ( '100', '_transient_random_seed', '1c0771bf7a92a3979319bb62292b9d53', 'yes' );
INSERT INTO `wp_options`(`option_id`,`option_name`,`option_value`,`autoload`) VALUES ( '101', 'nonce_key', 'Pw5Eyjt_<]}r_74{,a<@GEnvonvuskBv#Wgvb-xGp<?P^#9@d=+D&`m<xKZ4$i5?', 'yes' );
INSERT INTO `wp_options`(`option_id`,`option_name`,`option_value`,`autoload`) VALUES ( '102', 'nonce_salt', '/If@r_QkV9+ClOu._&=>d(o{L&}?r5?G[0MA5=!{J#Dlrly(55KivUNe<r&l)A!g', 'yes' );
INSERT INTO `wp_options`(`option_id`,`option_name`,`option_value`,`autoload`) VALUES ( '105', '_site_transient_update_core', 'O:8:"stdClass":4:{s:7:"updates";a:3:{i:0;O:8:"stdClass":10:{s:8:"response";s:7:"upgrade";s:8:"download";s:59:"https://downloads.wordpress.org/release/wordpress-4.3.1.zip";s:6:"locale";s:5:"en_US";s:8:"packages";O:8:"stdClass":5:{s:4:"full";s:59:"https://downloads.wordpress.org/release/wordpress-4.3.1.zip";s:10:"no_content";s:70:"https://downloads.wordpress.org/release/wordpress-4.3.1-no-content.zip";s:11:"new_bundled";s:71:"https://downloads.wordpress.org/release/wordpress-4.3.1-new-bundled.zip";s:7:"partial";b:0;s:8:"rollback";b:0;}s:7:"current";s:5:"4.3.1";s:7:"version";s:5:"4.3.1";s:11:"php_version";s:5:"5.2.4";s:13:"mysql_version";s:3:"5.0";s:11:"new_bundled";s:3:"4.1";s:15:"partial_version";s:0:"";}i:1;O:8:"stdClass":12:{s:8:"response";s:10:"autoupdate";s:8:"download";s:59:"https://downloads.wordpress.org/release/wordpress-4.3.1.zip";s:6:"locale";s:5:"en_US";s:8:"packages";O:8:"stdClass":5:{s:4:"full";s:59:"https://downloads.wordpress.org/release/wordpress-4.3.1.zip";s:10:"no_content";s:70:"https://downloads.wordpress.org/release/wordpress-4.3.1-no-content.zip";s:11:"new_bundled";s:71:"https://downloads.wordpress.org/release/wordpress-4.3.1-new-bundled.zip";s:7:"partial";b:0;s:8:"rollback";b:0;}s:7:"current";s:5:"4.3.1";s:7:"version";s:5:"4.3.1";s:11:"php_version";s:5:"5.2.4";s:13:"mysql_version";s:3:"5.0";s:11:"new_bundled";s:3:"4.1";s:15:"partial_version";s:0:"";s:13:"support_email";s:26:"updatehelp42@wordpress.org";s:9:"new_files";s:1:"1";}i:2;O:8:"stdClass":12:{s:8:"response";s:10:"autoupdate";s:8:"download";s:59:"https://downloads.wordpress.org/release/wordpress-4.2.5.zip";s:6:"locale";s:5:"en_US";s:8:"packages";O:8:"stdClass":5:{s:4:"full";s:59:"https://downloads.wordpress.org/release/wordpress-4.2.5.zip";s:10:"no_content";s:70:"https://downloads.wordpress.org/release/wordpress-4.2.5-no-content.zip";s:11:"new_bundled";s:71:"https://downloads.wordpress.org/release/wordpress-4.2.5-new-bundled.zip";s:7:"partial";s:69:"https://downloads.wordpress.org/release/wordpress-4.2.5-partial-2.zip";s:8:"rollback";s:70:"https://downloads.wordpress.org/release/wordpress-4.2.5-rollback-2.zip";}s:7:"current";s:5:"4.2.5";s:7:"version";s:5:"4.2.5";s:11:"php_version";s:5:"5.2.4";s:13:"mysql_version";s:3:"5.0";s:11:"new_bundled";s:3:"4.1";s:15:"partial_version";s:5:"4.2.2";s:13:"support_email";s:26:"updatehelp42@wordpress.org";s:9:"new_files";s:0:"";}}s:12:"last_checked";i:1449256643;s:15:"version_checked";s:5:"4.2.2";s:12:"translations";a:0:{}}', 'yes' );
INSERT INTO `wp_options`(`option_id`,`option_name`,`option_value`,`autoload`) VALUES ( '113', 'auth_key', 'o<(~K$r:zttKb`%KAVU=jy~}]g?:_4Xef$=]>r4 JC?Me/*$,.ks+e@l$XN{O[Bq', 'yes' );
INSERT INTO `wp_options`(`option_id`,`option_name`,`option_value`,`autoload`) VALUES ( '114', 'auth_salt', 's#@[wkC!rkh>1fsU8]|N??oYNrYPRp!EU93?aW?jyTx:3,=PU<0VIJH|q0wUaycn', 'yes' );
INSERT INTO `wp_options`(`option_id`,`option_name`,`option_value`,`autoload`) VALUES ( '115', 'logged_in_key', 'NoptN> 7G^Ce3AH*b$fkHs?6=-Td+n@1.Y!de`03nB#HLwv,$5:i1}6%|^ .mj{[', 'yes' );
INSERT INTO `wp_options`(`option_id`,`option_name`,`option_value`,`autoload`) VALUES ( '116', 'logged_in_salt', 'iL*]}9/ O<^&/(|Xi S672wb-gXSr;K6F <Isn`9 PAjB.#&ZTeW3GoT=n8t7 q8', 'yes' );
INSERT INTO `wp_options`(`option_id`,`option_name`,`option_value`,`autoload`) VALUES ( '120', 'can_compress_scripts', '0', 'yes' );
INSERT INTO `wp_options`(`option_id`,`option_name`,`option_value`,`autoload`) VALUES ( '127', 'recently_activated', 'a:0:{}', 'yes' );
INSERT INTO `wp_options`(`option_id`,`option_name`,`option_value`,`autoload`) VALUES ( '191', 'widget_my_news_plugin', 'a:2:{i:2;a:3:{s:5:"title";s:0:"";s:6:"number";i:3;s:29:"no_displayed_news_with_status";s:8:"featured";}s:12:"_multiwidget";i:1;}', 'yes' );
INSERT INTO `wp_options`(`option_id`,`option_name`,`option_value`,`autoload`) VALUES ( '193', '_site_transient_timeout_available_translations', '1448827881', 'yes' );
INSERT INTO `wp_options`(`option_id`,`option_name`,`option_value`,`autoload`) VALUES ( '194', '_site_transient_available_translations', 'a:59:{s:2:"ar";a:8:{s:8:"language";s:2:"ar";s:7:"version";s:5:"4.2.2";s:7:"updated";s:19:"2015-05-26 06:57:37";s:12:"english_name";s:6:"Arabic";s:11:"native_name";s:14:"العربية";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.2.2/ar.zip";s:3:"iso";a:2:{i:1;s:2:"ar";i:2;s:3:"ara";}s:7:"strings";a:1:{s:8:"continue";s:16:"المتابعة";}}s:2:"az";a:8:{s:8:"language";s:2:"az";s:7:"version";s:5:"4.2.2";s:7:"updated";s:19:"2015-07-04 19:52:42";s:12:"english_name";s:11:"Azerbaijani";s:11:"native_name";s:16:"Azərbaycan dili";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.2.2/az.zip";s:3:"iso";a:2:{i:1;s:2:"az";i:2;s:3:"aze";}s:7:"strings";a:1:{s:8:"continue";s:5:"Davam";}}s:5:"bg_BG";a:8:{s:8:"language";s:5:"bg_BG";s:7:"version";s:5:"4.2.2";s:7:"updated";s:19:"2015-05-27 06:36:25";s:12:"english_name";s:9:"Bulgarian";s:11:"native_name";s:18:"Български";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.2.2/bg_BG.zip";s:3:"iso";a:2:{i:1;s:2:"bg";i:2;s:3:"bul";}s:7:"strings";a:1:{s:8:"continue";s:22:"Продължение";}}s:5:"bs_BA";a:8:{s:8:"language";s:5:"bs_BA";s:7:"version";s:5:"4.2.2";s:7:"updated";s:19:"2015-07-08 17:43:43";s:12:"english_name";s:7:"Bosnian";s:11:"native_name";s:8:"Bosanski";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.2.2/bs_BA.zip";s:3:"iso";a:2:{i:1;s:2:"bs";i:2;s:3:"bos";}s:7:"strings";a:1:{s:8:"continue";s:7:"Nastavi";}}s:2:"ca";a:8:{s:8:"language";s:2:"ca";s:7:"version";s:5:"4.2.2";s:7:"updated";s:19:"2015-07-04 19:52:42";s:12:"english_name";s:7:"Catalan";s:11:"native_name";s:7:"Català";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.2.2/ca.zip";s:3:"iso";a:2:{i:1;s:2:"ca";i:2;s:3:"cat";}s:7:"strings";a:1:{s:8:"continue";s:8:"Continua";}}s:2:"cy";a:8:{s:8:"language";s:2:"cy";s:7:"version";s:5:"4.2.2";s:7:"updated";s:19:"2015-07-08 11:08:34";s:12:"english_name";s:5:"Welsh";s:11:"native_name";s:7:"Cymraeg";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.2.2/cy.zip";s:3:"iso";a:2:{i:1;s:2:"cy";i:2;s:3:"cym";}s:7:"strings";a:1:{s:8:"continue";s:6:"Parhau";}}s:5:"da_DK";a:8:{s:8:"language";s:5:"da_DK";s:7:"version";s:5:"4.2.2";s:7:"updated";s:19:"2015-06-03 00:26:43";s:12:"english_name";s:6:"Danish";s:11:"native_name";s:5:"Dansk";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.2.2/da_DK.zip";s:3:"iso";a:2:{i:1;s:2:"da";i:2;s:3:"dan";}s:7:"strings";a:1:{s:8:"continue";s:12:"Forts&#230;t";}}s:5:"de_CH";a:8:{s:8:"language";s:5:"de_CH";s:7:"version";s:5:"4.2.2";s:7:"updated";s:19:"2015-07-04 19:52:42";s:12:"english_name";s:20:"German (Switzerland)";s:11:"native_name";s:17:"Deutsch (Schweiz)";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.2.2/de_CH.zip";s:3:"iso";a:1:{i:1;s:2:"de";}s:7:"strings";a:1:{s:8:"continue";s:10:"Fortfahren";}}s:5:"de_DE";a:8:{s:8:"language";s:5:"de_DE";s:7:"version";s:5:"4.2.2";s:7:"updated";s:19:"2015-07-13 14:52:11";s:12:"english_name";s:6:"German";s:11:"native_name";s:7:"Deutsch";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.2.2/de_DE.zip";s:3:"iso";a:1:{i:1;s:2:"de";}s:7:"strings";a:1:{s:8:"continue";s:10:"Fortfahren";}}s:12:"de_DE_formal";a:8:{s:8:"language";s:12:"de_DE_formal";s:7:"version";s:5:"4.1.8";s:7:"updated";s:19:"2015-03-26 14:36:24";s:12:"english_name";s:15:"German (Formal)";s:11:"native_name";s:13:"Deutsch (Sie)";s:7:"package";s:71:"https://downloads.wordpress.org/translation/core/4.1.8/de_DE_formal.zip";s:3:"iso";a:1:{i:1;s:2:"de";}s:7:"strings";a:1:{s:8:"continue";s:10:"Fortfahren";}}s:2:"el";a:8:{s:8:"language";s:2:"el";s:7:"version";s:5:"4.2.2";s:7:"updated";s:19:"2015-07-22 11:37:31";s:12:"english_name";s:5:"Greek";s:11:"native_name";s:16:"Ελληνικά";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.2.2/el.zip";s:3:"iso";a:2:{i:1;s:2:"el";i:2;s:3:"ell";}s:7:"strings";a:1:{s:8:"continue";s:16:"Συνέχεια";}}s:5:"en_CA";a:8:{s:8:"language";s:5:"en_CA";s:7:"version";s:5:"4.2.2";s:7:"updated";s:19:"2015-07-04 19:52:42";s:12:"english_name";s:16:"English (Canada)";s:11:"native_name";s:16:"English (Canada)";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.2.2/en_CA.zip";s:3:"iso";a:3:{i:1;s:2:"en";i:2;s:3:"eng";i:3;s:3:"eng";}s:7:"strings";a:1:{s:8:"continue";s:8:"Continue";}}s:5:"en_GB";a:8:{s:8:"language";s:5:"en_GB";s:7:"version";s:5:"4.2.2";s:7:"updated";s:19:"2015-07-04 19:52:42";s:12:"english_name";s:12:"English (UK)";s:11:"native_name";s:12:"English (UK)";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.2.2/en_GB.zip";s:3:"iso";a:3:{i:1;s:2:"en";i:2;s:3:"eng";i:3;s:3:"eng";}s:7:"strings";a:1:{s:8:"continue";s:8:"Continue";}}s:5:"en_AU";a:8:{s:8:"language";s:5:"en_AU";s:7:"version";s:5:"4.2.2";s:7:"updated";s:19:"2015-07-04 19:52:42";s:12:"english_name";s:19:"English (Australia)";s:11:"native_name";s:19:"English (Australia)";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.2.2/en_AU.zip";s:3:"iso";a:3:{i:1;s:2:"en";i:2;s:3:"eng";i:3;s:3:"eng";}s:7:"strings";a:1:{s:8:"continue";s:8:"Continue";}}s:2:"eo";a:8:{s:8:"language";s:2:"eo";s:7:"version";s:5:"4.2.2";s:7:"updated";s:19:"2015-07-04 19:52:42";s:12:"english_name";s:9:"Esperanto";s:11:"native_name";s:9:"Esperanto";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.2.2/eo.zip";s:3:"iso";a:2:{i:1;s:2:"eo";i:2;s:3:"epo";}s:7:"strings";a:1:{s:8:"continue";s:8:"Daŭrigi";}}s:5:"es_MX";a:8:{s:8:"language";s:5:"es_MX";s:7:"version";s:5:"4.2.2";s:7:"updated";s:19:"2015-07-04 19:52:42";s:12:"english_name";s:16:"Spanish (Mexico)";s:11:"native_name";s:19:"Español de México";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.2.2/es_MX.zip";s:3:"iso";a:2:{i:1;s:2:"es";i:2;s:3:"spa";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:5:"es_ES";a:8:{s:8:"language";s:5:"es_ES";s:7:"version";s:5:"4.2.2";s:7:"updated";s:19:"2015-07-04 19:52:42";s:12:"english_name";s:15:"Spanish (Spain)";s:11:"native_name";s:8:"Español";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.2.2/es_ES.zip";s:3:"iso";a:1:{i:1;s:2:"es";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:5:"es_PE";a:8:{s:8:"language";s:5:"es_PE";s:7:"version";s:5:"4.2.2";s:7:"updated";s:19:"2015-04-25 13:39:01";s:12:"english_name";s:14:"Spanish (Peru)";s:11:"native_name";s:17:"Español de Perú";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.2.2/es_PE.zip";s:3:"iso";a:2:{i:1;s:2:"es";i:2;s:3:"spa";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:5:"es_CL";a:8:{s:8:"language";s:5:"es_CL";s:7:"version";s:3:"4.0";s:7:"updated";s:19:"2014-09-04 19:47:01";s:12:"english_name";s:15:"Spanish (Chile)";s:11:"native_name";s:17:"Español de Chile";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.0/es_CL.zip";s:3:"iso";a:2:{i:1;s:2:"es";i:2;s:3:"spa";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:2:"et";a:8:{s:8:"language";s:2:"et";s:7:"version";s:5:"4.2.2";s:7:"updated";s:19:"2015-07-05 20:09:08";s:12:"english_name";s:8:"Estonian";s:11:"native_name";s:5:"Eesti";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.2.2/et.zip";s:3:"iso";a:2:{i:1;s:2:"et";i:2;s:3:"est";}s:7:"strings";a:1:{s:8:"continue";s:6:"Jätka";}}s:2:"eu";a:8:{s:8:"language";s:2:"eu";s:7:"version";s:5:"4.2.2";s:7:"updated";s:19:"2015-07-04 19:52:42";s:12:"english_name";s:6:"Basque";s:11:"native_name";s:7:"Euskara";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.2.2/eu.zip";s:3:"iso";a:2:{i:1;s:2:"eu";i:2;s:3:"eus";}s:7:"strings";a:1:{s:8:"continue";s:8:"Jarraitu";}}s:5:"fa_IR";a:8:{s:8:"language";s:5:"fa_IR";s:7:"version";s:5:"4.2.2";s:7:"updated";s:19:"2015-07-04 19:52:42";s:12:"english_name";s:7:"Persian";s:11:"native_name";s:10:"فارسی";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.2.2/fa_IR.zip";s:3:"iso";a:2:{i:1;s:2:"fa";i:2;s:3:"fas";}s:7:"strings";a:1:{s:8:"continue";s:10:"ادامه";}}s:2:"fi";a:8:{s:8:"language";s:2:"fi";s:7:"version";s:5:"4.2.2";s:7:"updated";s:19:"2015-05-15 10:49:37";s:12:"english_name";s:7:"Finnish";s:11:"native_name";s:5:"Suomi";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.2.2/fi.zip";s:3:"iso";a:2:{i:1;s:2:"fi";i:2;s:3:"fin";}s:7:"strings";a:1:{s:8:"continue";s:5:"Jatka";}}s:5:"fr_FR";a:8:{s:8:"language";s:5:"fr_FR";s:7:"version";s:5:"4.2.2";s:7:"updated";s:19:"2015-07-10 14:16:27";s:12:"english_name";s:15:"French (France)";s:11:"native_name";s:9:"Français";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.2.2/fr_FR.zip";s:3:"iso";a:1:{i:1;s:2:"fr";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuer";}}s:2:"gd";a:8:{s:8:"language";s:2:"gd";s:7:"version";s:3:"4.0";s:7:"updated";s:19:"2014-09-05 17:37:43";s:12:"english_name";s:15:"Scottish Gaelic";s:11:"native_name";s:9:"Gàidhlig";s:7:"package";s:59:"https://downloads.wordpress.org/translation/core/4.0/gd.zip";s:3:"iso";a:3:{i:1;s:2:"gd";i:2;s:3:"gla";i:3;s:3:"gla";}s:7:"strings";a:1:{s:8:"continue";s:15:"Lean air adhart";}}s:5:"gl_ES";a:8:{s:8:"language";s:5:"gl_ES";s:7:"version";s:5:"4.2.2";s:7:"updated";s:19:"2015-07-04 19:52:42";s:12:"english_name";s:8:"Galician";s:11:"native_name";s:6:"Galego";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.2.2/gl_ES.zip";s:3:"iso";a:2:{i:1;s:2:"gl";i:2;s:3:"glg";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:3:"haz";a:8:{s:8:"language";s:3:"haz";s:7:"version";s:5:"4.1.8";s:7:"updated";s:19:"2015-03-26 15:20:27";s:12:"english_name";s:8:"Hazaragi";s:11:"native_name";s:15:"هزاره گی";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.1.8/haz.zip";s:3:"iso";a:1:{i:3;s:3:"haz";}s:7:"strings";a:1:{s:8:"continue";s:10:"ادامه";}}s:5:"he_IL";a:8:{s:8:"language";s:5:"he_IL";s:7:"version";s:5:"4.2.2";s:7:"updated";s:19:"2015-07-12 08:05:04";s:12:"english_name";s:6:"Hebrew";s:11:"native_name";s:16:"עִבְרִית";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.2.2/he_IL.zip";s:3:"iso";a:1:{i:1;s:2:"he";}s:7:"strings";a:1:{s:8:"continue";s:12:"להמשיך";}}s:2:"hr";a:8:{s:8:"language";s:2:"hr";s:7:"version";s:5:"4.2.2";s:7:"updated";s:19:"2015-07-07 17:26:35";s:12:"english_name";s:8:"Croatian";s:11:"native_name";s:8:"Hrvatski";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.2.2/hr.zip";s:3:"iso";a:2:{i:1;s:2:"hr";i:2;s:3:"hrv";}s:7:"strings";a:1:{s:8:"continue";s:7:"Nastavi";}}s:5:"hu_HU";a:8:{s:8:"language";s:5:"hu_HU";s:7:"version";s:5:"4.2.2";s:7:"updated";s:19:"2015-05-26 06:43:50";s:12:"english_name";s:9:"Hungarian";s:11:"native_name";s:6:"Magyar";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.2.2/hu_HU.zip";s:3:"iso";a:2:{i:1;s:2:"hu";i:2;s:3:"hun";}s:7:"strings";a:1:{s:8:"continue";s:7:"Tovább";}}s:5:"id_ID";a:8:{s:8:"language";s:5:"id_ID";s:7:"version";s:5:"4.2.2";s:7:"updated";s:19:"2015-07-04 19:52:42";s:12:"english_name";s:10:"Indonesian";s:11:"native_name";s:16:"Bahasa Indonesia";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.2.2/id_ID.zip";s:3:"iso";a:2:{i:1;s:2:"id";i:2;s:3:"ind";}s:7:"strings";a:1:{s:8:"continue";s:9:"Lanjutkan";}}s:5:"is_IS";a:8:{s:8:"language";s:5:"is_IS";s:7:"version";s:5:"4.2.2";s:7:"updated";s:19:"2015-07-04 19:52:42";s:12:"english_name";s:9:"Icelandic";s:11:"native_name";s:9:"Íslenska";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.2.2/is_IS.zip";s:3:"iso";a:2:{i:1;s:2:"is";i:2;s:3:"isl";}s:7:"strings";a:1:{s:8:"continue";s:6:"Áfram";}}s:5:"it_IT";a:8:{s:8:"language";s:5:"it_IT";s:7:"version";s:5:"4.2.2";s:7:"updated";s:19:"2015-07-04 19:52:42";s:12:"english_name";s:7:"Italian";s:11:"native_name";s:8:"Italiano";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.2.2/it_IT.zip";s:3:"iso";a:2:{i:1;s:2:"it";i:2;s:3:"ita";}s:7:"strings";a:1:{s:8:"continue";s:8:"Continua";}}s:2:"ja";a:8:{s:8:"language";s:2:"ja";s:7:"version";s:5:"4.2.2";s:7:"updated";s:19:"2015-07-04 19:52:42";s:12:"english_name";s:8:"Japanese";s:11:"native_name";s:9:"日本語";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.2.2/ja.zip";s:3:"iso";a:1:{i:1;s:2:"ja";}s:7:"strings";a:1:{s:8:"continue";s:9:"続ける";}}s:5:"ko_KR";a:8:{s:8:"language";s:5:"ko_KR";s:7:"version";s:5:"4.2.2";s:7:"updated";s:19:"2015-07-04 19:52:42";s:12:"english_name";s:6:"Korean";s:11:"native_name";s:9:"한국어";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.2.2/ko_KR.zip";s:3:"iso";a:2:{i:1;s:2:"ko";i:2;s:3:"kor";}s:7:"strings";a:1:{s:8:"continue";s:6:"계속";}}s:5:"lt_LT";a:8:{s:8:"language";s:5:"lt_LT";s:7:"version";s:5:"4.2.2";s:7:"updated";s:19:"2015-04-23 15:23:08";s:12:"english_name";s:10:"Lithuanian";s:11:"native_name";s:15:"Lietuvių kalba";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.2.2/lt_LT.zip";s:3:"iso";a:2:{i:1;s:2:"lt";i:2;s:3:"lit";}s:7:"strings";a:1:{s:8:"continue";s:6:"Tęsti";}}s:5:"my_MM";a:8:{s:8:"language";s:5:"my_MM";s:7:"version";s:5:"4.1.8";s:7:"updated";s:19:"2015-03-26 15:57:42";s:12:"english_name";s:17:"Myanmar (Burmese)";s:11:"native_name";s:15:"ဗမာစာ";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.1.8/my_MM.zip";s:3:"iso";a:2:{i:1;s:2:"my";i:2;s:3:"mya";}s:7:"strings";a:1:{s:8:"continue";s:54:"ဆက်လက်လုပ်ေဆာင်ပါ။";}}s:5:"nb_NO";a:8:{s:8:"language";s:5:"nb_NO";s:7:"version";s:5:"4.2.2";s:7:"updated";s:19:"2015-07-07 10:32:20";s:12:"english_name";s:19:"Norwegian (Bokmål)";s:11:"native_name";s:13:"Norsk bokmål";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.2.2/nb_NO.zip";s:3:"iso";a:2:{i:1;s:2:"nb";i:2;s:3:"nob";}s:7:"strings";a:1:{s:8:"continue";s:8:"Fortsett";}}s:5:"nl_NL";a:8:{s:8:"language";s:5:"nl_NL";s:7:"version";s:5:"4.2.2";s:7:"updated";s:19:"2015-07-16 14:25:19";s:12:"english_name";s:5:"Dutch";s:11:"native_name";s:10:"Nederlands";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.2.2/nl_NL.zip";s:3:"iso";a:2:{i:1;s:2:"nl";i:2;s:3:"nld";}s:7:"strings";a:1:{s:8:"continue";s:8:"Doorgaan";}}s:5:"nn_NO";a:8:{s:8:"language";s:5:"nn_NO";s:7:"version";s:5:"4.2.2";s:7:"updated";s:19:"2015-06-08 07:10:14";s:12:"english_name";s:19:"Norwegian (Nynorsk)";s:11:"native_name";s:13:"Norsk nynorsk";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.2.2/nn_NO.zip";s:3:"iso";a:2:{i:1;s:2:"nn";i:2;s:3:"nno";}s:7:"strings";a:1:{s:8:"continue";s:9:"Hald fram";}}s:3:"oci";a:8:{s:8:"language";s:3:"oci";s:7:"version";s:5:"4.2.2";s:7:"updated";s:19:"2015-06-10 17:07:58";s:12:"english_name";s:7:"Occitan";s:11:"native_name";s:7:"Occitan";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.2.2/oci.zip";s:3:"iso";a:2:{i:1;s:2:"oc";i:2;s:3:"oci";}s:7:"strings";a:1:{s:8:"continue";s:9:"Contunhar";}}s:5:"pl_PL";a:8:{s:8:"language";s:5:"pl_PL";s:7:"version";s:5:"4.2.2";s:7:"updated";s:19:"2015-05-09 10:15:05";s:12:"english_name";s:6:"Polish";s:11:"native_name";s:6:"Polski";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.2.2/pl_PL.zip";s:3:"iso";a:2:{i:1;s:2:"pl";i:2;s:3:"pol";}s:7:"strings";a:1:{s:8:"continue";s:9:"Kontynuuj";}}s:2:"ps";a:8:{s:8:"language";s:2:"ps";s:7:"version";s:5:"4.1.8";s:7:"updated";s:19:"2015-03-29 22:19:48";s:12:"english_name";s:6:"Pashto";s:11:"native_name";s:8:"پښتو";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.1.8/ps.zip";s:3:"iso";a:2:{i:1;s:2:"ps";i:2;s:3:"pus";}s:7:"strings";a:1:{s:8:"continue";s:8:"دوام";}}s:5:"pt_BR";a:8:{s:8:"language";s:5:"pt_BR";s:7:"version";s:5:"4.2.2";s:7:"updated";s:19:"2015-07-04 19:52:42";s:12:"english_name";s:19:"Portuguese (Brazil)";s:11:"native_name";s:20:"Português do Brasil";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.2.2/pt_BR.zip";s:3:"iso";a:2:{i:1;s:2:"pt";i:2;s:3:"por";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:5:"pt_PT";a:8:{s:8:"language";s:5:"pt_PT";s:7:"version";s:5:"4.2.2";s:7:"updated";s:19:"2015-07-22 10:25:51";s:12:"english_name";s:21:"Portuguese (Portugal)";s:11:"native_name";s:10:"Português";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.2.2/pt_PT.zip";s:3:"iso";a:1:{i:1;s:2:"pt";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:5:"ro_RO";a:8:{s:8:"language";s:5:"ro_RO";s:7:"version";s:5:"4.2.2";s:7:"updated";s:19:"2015-07-08 14:53:48";s:12:"english_name";s:8:"Romanian";s:11:"native_name";s:8:"Română";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.2.2/ro_RO.zip";s:3:"iso";a:2:{i:1;s:2:"ro";i:2;s:3:"ron";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuă";}}s:5:"ru_RU";a:8:{s:8:"language";s:5:"ru_RU";s:7:"version";s:5:"4.2.2";s:7:"updated";s:19:"2015-05-31 11:58:44";s:12:"english_name";s:7:"Russian";s:11:"native_name";s:14:"Русский";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.2.2/ru_RU.zip";s:3:"iso";a:2:{i:1;s:2:"ru";i:2;s:3:"rus";}s:7:"strings";a:1:{s:8:"continue";s:20:"Продолжить";}}s:5:"sk_SK";a:8:{s:8:"language";s:5:"sk_SK";s:7:"version";s:5:"4.2.2";s:7:"updated";s:19:"2015-05-26 09:29:23";s:12:"english_name";s:6:"Slovak";s:11:"native_name";s:11:"Slovenčina";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.2.2/sk_SK.zip";s:3:"iso";a:2:{i:1;s:2:"sk";i:2;s:3:"slk";}s:7:"strings";a:1:{s:8:"continue";s:12:"Pokračovať";}}s:5:"sl_SI";a:8:{s:8:"language";s:5:"sl_SI";s:7:"version";s:5:"4.1.8";s:7:"updated";s:19:"2015-03-26 16:25:46";s:12:"english_name";s:9:"Slovenian";s:11:"native_name";s:13:"Slovenščina";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.1.8/sl_SI.zip";s:3:"iso";a:2:{i:1;s:2:"sl";i:2;s:3:"slv";}s:7:"strings";a:1:{s:8:"continue";s:10:"Nadaljujte";}}s:2:"sq";a:8:{s:8:"language";s:2:"sq";s:7:"version";s:5:"4.2.2";s:7:"updated";s:19:"2015-05-29 08:27:12";s:12:"english_name";s:8:"Albanian";s:11:"native_name";s:5:"Shqip";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.2.2/sq.zip";s:3:"iso";a:2:{i:1;s:2:"sq";i:2;s:3:"sqi";}s:7:"strings";a:1:{s:8:"continue";s:6:"Vazhdo";}}s:5:"sr_RS";a:8:{s:8:"language";s:5:"sr_RS";s:7:"version";s:5:"4.2.2";s:7:"updated";s:19:"2015-07-04 19:52:42";s:12:"english_name";s:7:"Serbian";s:11:"native_name";s:23:"Српски језик";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.2.2/sr_RS.zip";s:3:"iso";a:2:{i:1;s:2:"sr";i:2;s:3:"srp";}s:7:"strings";a:1:{s:8:"continue";s:14:"Настави";}}s:5:"sv_SE";a:8:{s:8:"language";s:5:"sv_SE";s:7:"version";s:5:"4.2.2";s:7:"updated";s:19:"2015-07-12 00:55:52";s:12:"english_name";s:7:"Swedish";s:11:"native_name";s:7:"Svenska";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.2.2/sv_SE.zip";s:3:"iso";a:2:{i:1;s:2:"sv";i:2;s:3:"swe";}s:7:"strings";a:1:{s:8:"continue";s:9:"Fortsätt";}}s:2:"th";a:8:{s:8:"language";s:2:"th";s:7:"version";s:5:"4.2.2";s:7:"updated";s:19:"2015-07-04 19:52:42";s:12:"english_name";s:4:"Thai";s:11:"native_name";s:9:"ไทย";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.2.2/th.zip";s:3:"iso";a:2:{i:1;s:2:"th";i:2;s:3:"tha";}s:7:"strings";a:1:{s:8:"continue";s:15:"ต่อไป";}}s:2:"tl";a:8:{s:8:"language";s:2:"tl";s:7:"version";s:5:"4.2.2";s:7:"updated";s:19:"2015-07-06 10:10:09";s:12:"english_name";s:7:"Tagalog";s:11:"native_name";s:7:"Tagalog";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.2.2/tl.zip";s:3:"iso";a:2:{i:1;s:2:"tl";i:2;s:3:"tgl";}s:7:"strings";a:1:{s:8:"continue";s:10:"Magpatuloy";}}s:5:"tr_TR";a:8:{s:8:"language";s:5:"tr_TR";s:7:"version";s:5:"4.2.2";s:7:"updated";s:19:"2015-07-22 10:57:52";s:12:"english_name";s:7:"Turkish";s:11:"native_name";s:8:"Türkçe";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.2.2/tr_TR.zip";s:3:"iso";a:2:{i:1;s:2:"tr";i:2;s:3:"tur";}s:7:"strings";a:1:{s:8:"continue";s:5:"Devam";}}s:5:"ug_CN";a:8:{s:8:"language";s:5:"ug_CN";s:7:"version";s:5:"4.1.8";s:7:"updated";s:19:"2015-03-26 16:45:38";s:12:"english_name";s:6:"Uighur";s:11:"native_name";s:9:"Uyƣurqə";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.1.8/ug_CN.zip";s:3:"iso";a:2:{i:1;s:2:"ug";i:2;s:3:"uig";}s:7:"strings";a:1:{s:8:"continue";s:26:"داۋاملاشتۇرۇش";}}s:2:"uk";a:8:{s:8:"language";s:2:"uk";s:7:"version";s:5:"4.2.2";s:7:"updated";s:19:"2015-07-05 10:51:50";s:12:"english_name";s:9:"Ukrainian";s:11:"native_name";s:20:"Українська";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.2.2/uk.zip";s:3:"iso";a:2:{i:1;s:2:"uk";i:2;s:3:"ukr";}s:7:"strings";a:1:{s:8:"continue";s:20:"Продовжити";}}s:5:"zh_CN";a:8:{s:8:"language";s:5:"zh_CN";s:7:"version";s:5:"4.2.2";s:7:"updated";s:19:"2015-07-04 19:52:42";s:12:"english_name";s:15:"Chinese (China)";s:11:"native_name";s:12:"简体中文";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.2.2/zh_CN.zip";s:3:"iso";a:2:{i:1;s:2:"zh";i:2;s:3:"zho";}s:7:"strings";a:1:{s:8:"continue";s:6:"继续";}}s:5:"zh_TW";a:8:{s:8:"language";s:5:"zh_TW";s:7:"version";s:5:"4.2.2";s:7:"updated";s:19:"2015-04-29 06:37:03";s:12:"english_name";s:16:"Chinese (Taiwan)";s:11:"native_name";s:12:"繁體中文";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.2.2/zh_TW.zip";s:3:"iso";a:2:{i:1;s:2:"zh";i:2;s:3:"zho";}s:7:"strings";a:1:{s:8:"continue";s:6:"繼續";}}}', 'yes' );
INSERT INTO `wp_options`(`option_id`,`option_name`,`option_value`,`autoload`) VALUES ( '195', 'rewrite_rules', 'a:91:{s:17:"index.php/news/?$";s:24:"index.php?post_type=news";s:47:"index.php/news/feed/(feed|rdf|rss|rss2|atom)/?$";s:41:"index.php?post_type=news&feed=$matches[1]";s:42:"index.php/news/(feed|rdf|rss|rss2|atom)/?$";s:41:"index.php?post_type=news&feed=$matches[1]";s:34:"index.php/news/page/([0-9]{1,})/?$";s:42:"index.php?post_type=news&paged=$matches[1]";s:57:"index.php/category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$";s:52:"index.php?category_name=$matches[1]&feed=$matches[2]";s:52:"index.php/category/(.+?)/(feed|rdf|rss|rss2|atom)/?$";s:52:"index.php?category_name=$matches[1]&feed=$matches[2]";s:45:"index.php/category/(.+?)/page/?([0-9]{1,})/?$";s:53:"index.php?category_name=$matches[1]&paged=$matches[2]";s:27:"index.php/category/(.+?)/?$";s:35:"index.php?category_name=$matches[1]";s:54:"index.php/tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?tag=$matches[1]&feed=$matches[2]";s:49:"index.php/tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?tag=$matches[1]&feed=$matches[2]";s:42:"index.php/tag/([^/]+)/page/?([0-9]{1,})/?$";s:43:"index.php?tag=$matches[1]&paged=$matches[2]";s:24:"index.php/tag/([^/]+)/?$";s:25:"index.php?tag=$matches[1]";s:55:"index.php/type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?post_format=$matches[1]&feed=$matches[2]";s:50:"index.php/type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?post_format=$matches[1]&feed=$matches[2]";s:43:"index.php/type/([^/]+)/page/?([0-9]{1,})/?$";s:51:"index.php?post_format=$matches[1]&paged=$matches[2]";s:25:"index.php/type/([^/]+)/?$";s:33:"index.php?post_format=$matches[1]";s:42:"index.php/news/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:52:"index.php/news/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:72:"index.php/news/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:67:"index.php/news/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:67:"index.php/news/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:35:"index.php/news/([^/]+)/trackback/?$";s:31:"index.php?news=$matches[1]&tb=1";s:55:"index.php/news/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?news=$matches[1]&feed=$matches[2]";s:50:"index.php/news/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?news=$matches[1]&feed=$matches[2]";s:43:"index.php/news/([^/]+)/page/?([0-9]{1,})/?$";s:44:"index.php?news=$matches[1]&paged=$matches[2]";s:50:"index.php/news/([^/]+)/comment-page-([0-9]{1,})/?$";s:44:"index.php?news=$matches[1]&cpage=$matches[2]";s:35:"index.php/news/([^/]+)(/[0-9]+)?/?$";s:43:"index.php?news=$matches[1]&page=$matches[2]";s:31:"index.php/news/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:41:"index.php/news/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:61:"index.php/news/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:56:"index.php/news/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:56:"index.php/news/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:12:"robots\\.txt$";s:18:"index.php?robots=1";s:48:".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$";s:18:"index.php?feed=old";s:20:".*wp-app\\.php(/.*)?$";s:19:"index.php?error=403";s:18:".*wp-register.php$";s:23:"index.php?register=true";s:42:"index.php/feed/(feed|rdf|rss|rss2|atom)/?$";s:27:"index.php?&feed=$matches[1]";s:37:"index.php/(feed|rdf|rss|rss2|atom)/?$";s:27:"index.php?&feed=$matches[1]";s:30:"index.php/page/?([0-9]{1,})/?$";s:28:"index.php?&paged=$matches[1]";s:51:"index.php/comments/feed/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?&feed=$matches[1]&withcomments=1";s:46:"index.php/comments/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?&feed=$matches[1]&withcomments=1";s:54:"index.php/search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:40:"index.php?s=$matches[1]&feed=$matches[2]";s:49:"index.php/search/(.+)/(feed|rdf|rss|rss2|atom)/?$";s:40:"index.php?s=$matches[1]&feed=$matches[2]";s:42:"index.php/search/(.+)/page/?([0-9]{1,})/?$";s:41:"index.php?s=$matches[1]&paged=$matches[2]";s:24:"index.php/search/(.+)/?$";s:23:"index.php?s=$matches[1]";s:57:"index.php/author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?author_name=$matches[1]&feed=$matches[2]";s:52:"index.php/author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?author_name=$matches[1]&feed=$matches[2]";s:45:"index.php/author/([^/]+)/page/?([0-9]{1,})/?$";s:51:"index.php?author_name=$matches[1]&paged=$matches[2]";s:27:"index.php/author/([^/]+)/?$";s:33:"index.php?author_name=$matches[1]";s:79:"index.php/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$";s:80:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]";s:74:"index.php/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$";s:80:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]";s:67:"index.php/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$";s:81:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]";s:49:"index.php/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$";s:63:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]";s:66:"index.php/([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$";s:64:"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]";s:61:"index.php/([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$";s:64:"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]";s:54:"index.php/([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$";s:65:"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]";s:36:"index.php/([0-9]{4})/([0-9]{1,2})/?$";s:47:"index.php?year=$matches[1]&monthnum=$matches[2]";s:53:"index.php/([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?year=$matches[1]&feed=$matches[2]";s:48:"index.php/([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?year=$matches[1]&feed=$matches[2]";s:41:"index.php/([0-9]{4})/page/?([0-9]{1,})/?$";s:44:"index.php?year=$matches[1]&paged=$matches[2]";s:23:"index.php/([0-9]{4})/?$";s:26:"index.php?year=$matches[1]";s:68:"index.php/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:78:"index.php/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:98:"index.php/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:93:"index.php/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:93:"index.php/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:67:"index.php/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/trackback/?$";s:85:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&tb=1";s:87:"index.php/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:97:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&feed=$matches[5]";s:82:"index.php/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:97:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&feed=$matches[5]";s:75:"index.php/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/page/?([0-9]{1,})/?$";s:98:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&paged=$matches[5]";s:82:"index.php/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/comment-page-([0-9]{1,})/?$";s:98:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&cpage=$matches[5]";s:67:"index.php/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)(/[0-9]+)?/?$";s:97:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&page=$matches[5]";s:57:"index.php/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:67:"index.php/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:87:"index.php/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:82:"index.php/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:82:"index.php/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:74:"index.php/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/comment-page-([0-9]{1,})/?$";s:81:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&cpage=$matches[4]";s:61:"index.php/([0-9]{4})/([0-9]{1,2})/comment-page-([0-9]{1,})/?$";s:65:"index.php?year=$matches[1]&monthnum=$matches[2]&cpage=$matches[3]";s:48:"index.php/([0-9]{4})/comment-page-([0-9]{1,})/?$";s:44:"index.php?year=$matches[1]&cpage=$matches[2]";s:37:"index.php/.?.+?/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:47:"index.php/.?.+?/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:67:"index.php/.?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:62:"index.php/.?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:62:"index.php/.?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:30:"index.php/(.?.+?)/trackback/?$";s:35:"index.php?pagename=$matches[1]&tb=1";s:50:"index.php/(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$";s:47:"index.php?pagename=$matches[1]&feed=$matches[2]";s:45:"index.php/(.?.+?)/(feed|rdf|rss|rss2|atom)/?$";s:47:"index.php?pagename=$matches[1]&feed=$matches[2]";s:38:"index.php/(.?.+?)/page/?([0-9]{1,})/?$";s:48:"index.php?pagename=$matches[1]&paged=$matches[2]";s:45:"index.php/(.?.+?)/comment-page-([0-9]{1,})/?$";s:48:"index.php?pagename=$matches[1]&cpage=$matches[2]";s:30:"index.php/(.?.+?)(/[0-9]+)?/?$";s:47:"index.php?pagename=$matches[1]&page=$matches[2]";}', 'yes' );
INSERT INTO `wp_options`(`option_id`,`option_name`,`option_value`,`autoload`) VALUES ( '281', 'category_children', 'a:0:{}', 'yes' );
INSERT INTO `wp_options`(`option_id`,`option_name`,`option_value`,`autoload`) VALUES ( '294', '_site_transient_browser_7327d20f6ad3b4eb458291a9ebeba3ee', 'a:9:{s:8:"platform";s:5:"Linux";s:4:"name";s:6:"Chrome";s:7:"version";s:13:"45.0.2454.101";s:10:"update_url";s:28:"http://www.google.com/chrome";s:7:"img_src";s:49:"http://s.wordpress.org/images/browsers/chrome.png";s:11:"img_src_ssl";s:48:"https://wordpress.org/images/browsers/chrome.png";s:15:"current_version";s:2:"18";s:7:"upgrade";b:0;s:8:"insecure";b:0;}', 'yes' );
INSERT INTO `wp_options`(`option_id`,`option_name`,`option_value`,`autoload`) VALUES ( '296', '_site_transient_timeout_browser_7327d20f6ad3b4eb458291a9ebeba3ee', '1449833643', 'yes' );
INSERT INTO `wp_options`(`option_id`,`option_name`,`option_value`,`autoload`) VALUES ( '300', '_transient_timeout_feed_ac0b00fe65abe10e0c5b588f3ed8c7ca', '1449272056', 'no' );
INSERT INTO `wp_options`(`option_id`,`option_name`,`option_value`,`autoload`) VALUES ( '301', '_transient_feed_ac0b00fe65abe10e0c5b588f3ed8c7ca', 'a:4:{s:5:"child";a:1:{s:0:"";a:1:{s:3:"rss";a:1:{i:0;a:6:{s:4:"data";s:3:"


";s:7:"attribs";a:1:{s:0:"";a:1:{s:7:"version";s:3:"2.0";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:1:{s:0:"";a:1:{s:7:"channel";a:1:{i:0;a:6:{s:4:"data";s:49:"
	
	
	
	
	
	
	
	
	
	
		
		
		
		
		
		
		
		
		
	";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:3:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:14:"WordPress News";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:26:"https://wordpress.org/news";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:14:"WordPress News";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:13:"lastBuildDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 25 Nov 2015 23:04:05 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"language";a:1:{i:0;a:5:{s:4:"data";s:5:"en-US";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:9:"generator";a:1:{i:0;a:5:{s:4:"data";s:38:"https://wordpress.org/?v=4.4-RC1-35761";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"item";a:10:{i:0;a:6:{s:4:"data";s:39:"
		
		
		
		
				
		
		

		
		
				
			";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:3:{s:0:"";a:6:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:31:"WordPress 4.4 Release Candidate";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:67:"https://wordpress.org/news/2015/11/wordpress-4-4-release-candidate/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 25 Nov 2015 23:04:05 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:3:{i:0;a:5:{s:4:"data";s:11:"Development";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:8:"Releases";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:2;a:5:{s:4:"data";s:3:"4.4";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:34:"https://wordpress.org/news/?p=3982";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:328:"The release candidate for WordPress 4.4 is now available. RC means we think we’re done, but with millions of users and thousands of plugins and themes, it’s possible we’ve missed something. We hope to ship WordPress 4.4 on Tuesday, December 8, but we need your help to get there. If you haven’t tested 4.4 yet, [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:12:"Scott Taylor";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:1801:"<p>The release candidate for WordPress 4.4 is now available.</p>
<p>RC means we think we’re done, but with millions of users and thousands of plugins and themes, it’s possible we’ve missed something. We hope to ship WordPress 4.4 on <strong>Tuesday, December 8</strong>, but we need your help to get there.</p>
<p>If you haven’t tested 4.4 yet, now is the time!</p>
<p><strong>Think you&#8217;ve found a bug?</strong> Please post to the <a href="https://wordpress.org/support/forum/alphabeta/">Alpha/Beta support forum</a>. If any known issues come up, you&#8217;ll be able to <a href="https://core.trac.wordpress.org/report/5">find them here</a>.</p>
<p>To test WordPress 4.4 RC1, you can use the <a href="https://wordpress.org/plugins/wordpress-beta-tester/">WordPress Beta Tester</a> plugin or you can <a href="https://wordpress.org/wordpress-4.4-RC1.zip">download the release candidate here</a> (zip).</p>
<p>For more information about what’s new in version 4.4, check out the <a href="https://wordpress.org/news/2015/10/wordpress-4-4-beta-1/">Beta</a> blog post.</p>
<p><strong>Developers</strong>, please test your plugins and themes against WordPress 4.4 and update your plugin&#8217;s <em>Tested up to</em> version in the readme to 4.4 before next week. If you find compatibility problems, we never want to break things, so please be sure to post to the support forums so we can figure those out before the final release.</p>
<p>Be sure to <a href="https://make.wordpress.org/core/">follow along the core development blog</a>, where we&#8217;ll continue to post <a href="https://make.wordpress.org/core/tag/dev-notes+4-4/">notes for developers</a> for 4.4.</p>
<p><em>Tickets are all closed</em><br />
<em>Help test the latest changes</em><br />
<em>New WordPress for All</em></p>
";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:1;a:6:{s:4:"data";s:39:"
		
		
		
		
				
		
		

		
		
				
			";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:3:{s:0:"";a:6:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:20:"WordPress 4.4 Beta 4";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:56:"https://wordpress.org/news/2015/11/wordpress-4-4-beta-4/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 12 Nov 2015 00:04:51 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:3:{i:0;a:5:{s:4:"data";s:11:"Development";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:8:"Releases";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:2;a:5:{s:4:"data";s:3:"4.4";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:34:"https://wordpress.org/news/?p=3977";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:337:"WordPress 4.4 Beta 4 is now available! This software is still in development, so we don’t recommend you run it on a production site. Consider setting up a test site just to play with the new version. To test WordPress 4.4, try the WordPress Beta Tester plugin (you’ll want &#8220;bleeding edge nightlies&#8221;). Or you can [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:12:"Scott Taylor";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:1407:"<p>WordPress 4.4 Beta 4 is now available!</p>
<p><strong>This software is still in development,</strong> so we don’t recommend you run it on a production site. Consider setting up a test site just to play with the new version. To test WordPress 4.4, try the <a href="https://wordpress.org/plugins/wordpress-beta-tester/">WordPress Beta Tester</a> plugin (you’ll want &#8220;bleeding edge nightlies&#8221;). Or you can <a href="https://wordpress.org/wordpress-4.4-beta4.zip">download the beta here</a> (zip).</p>
<p>For more information about what’s new in version 4.4, check out the <a href="https://wordpress.org/news/2015/10/wordpress-4-4-beta-1/" target="_blank">Beta 1</a> blog post. This our final planned beta. Next week will be our first Release Candidate.</p>
<p>If you think you’ve found a bug, you can post to the <a href="https://wordpress.org/support/forum/alphabeta">Alpha/Beta area</a> in the support forums. Or, if you’re comfortable writing a bug report, <a href="https://core.trac.wordpress.org/">file one on the WordPress Trac</a>. There, you can also find <a href="https://core.trac.wordpress.org/tickets/major">a list of known bugs</a> and <a href="https://core.trac.wordpress.org/query?status=closed&amp;group=component&amp;milestone=4.4">everything we’ve fixed</a>.</p>
<p><em>Closer To The End</em><br />
<em>Tickets Are Being Shuffled</em><br />
<i>Onward to RC</i></p>
";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:2;a:6:{s:4:"data";s:36:"
		
		
		
		
				
		

		
		
				
			";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:3:{s:0:"";a:6:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:20:"WordPress 4.4 Beta 3";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:56:"https://wordpress.org/news/2015/11/wordpress-4-4-beta-3/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 04 Nov 2015 22:10:41 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:2:{i:0;a:5:{s:4:"data";s:11:"Development";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:8:"Releases";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:34:"https://wordpress.org/news/?p=3969";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:374:"WordPress 4.4 Beta 3 is now available for download and testing. This is software still in development, so we don’t recommend that you run it on a production site. To get the beta, try the WordPress Beta Tester plugin (you’ll want “bleeding edge nightlies”). Or you can download the beta here (zip). For more of what’s new in version 4.4, check out [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:12:"Scott Taylor";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:1245:"<p>WordPress 4.4 Beta 3 is now available for download and testing. This is software still in development, so we don’t recommend that you run it on a production site. To get the beta, try the <a href="https://wordpress.org/extend/plugins/wordpress-beta-tester/">WordPress Beta Tester</a> plugin (you’ll want “bleeding edge nightlies”). Or you can <a href="https://wordpress.org/wordpress-4.4-beta3.zip">download the beta here</a> (zip).</p>
<p>For more of what’s new in version 4.4, <a href="https://wordpress.org/news/2015/10/wordpress-4-4-beta-1/" target="_blank">check out the Beta 1 blog post</a>.</p>
<p>If you think you’ve found a bug, you can post to the <a href="https://wordpress.org/support/forum/alphabeta">Alpha/Beta area</a> in the support forums. Or, if you’re comfortable writing a bug report, <a href="https://core.trac.wordpress.org/">file one on the WordPress Trac</a>. There, you can also find <a href="https://core.trac.wordpress.org/tickets/major">a list of known bugs</a> and <a href="https://core.trac.wordpress.org/query?status=closed&amp;group=component&amp;milestone=4.4">everything we’ve fixed</a>.</p>
<p><em>Four-four beta three<br />
Even more activity<br />
Nary a shared term</em></p>
";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:3;a:6:{s:4:"data";s:36:"
		
		
		
		
				
		

		
		
				
			";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:3:{s:0:"";a:6:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:20:"WordPress 4.4 Beta 2";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:56:"https://wordpress.org/news/2015/10/wordpress-4-4-beta-2/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 28 Oct 2015 20:50:53 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:2:{i:0;a:5:{s:4:"data";s:11:"Development";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:8:"Releases";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:34:"https://wordpress.org/news/?p=3966";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:374:"WordPress 4.4 Beta 2 is now available for download and testing. This is software still in development, so we don’t recommend that you run it on a production site. To get the beta, try the WordPress Beta Tester plugin (you’ll want “bleeding edge nightlies”). Or you can download the beta here (zip). For more of what’s new in version 4.4, check out [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:12:"Scott Taylor";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:1246:"<p>WordPress 4.4 Beta 2 is now available for download and testing. This is software still in development, so we don’t recommend that you run it on a production site. To get the beta, try the <a href="https://wordpress.org/extend/plugins/wordpress-beta-tester/">WordPress Beta Tester</a> plugin (you’ll want “bleeding edge nightlies”). Or you can <a href="https://wordpress.org/wordpress-4.4-beta2.zip">download the beta here</a> (zip).</p>
<p>For more of what’s new in version 4.4, <a href="https://wordpress.org/news/2015/10/wordpress-4-4-beta-1/" target="_blank">check out the Beta 1 blog post</a>.</p>
<p>If you think you’ve found a bug, you can post to the <a href="https://wordpress.org/support/forum/alphabeta">Alpha/Beta area</a> in the support forums. Or, if you’re comfortable writing a bug report, <a href="https://core.trac.wordpress.org/">file one on the WordPress Trac</a>. There, you can also find <a href="https://core.trac.wordpress.org/tickets/major">a list of known bugs</a> and <a href="https://core.trac.wordpress.org/query?status=closed&amp;group=component&amp;milestone=4.4">everything we’ve fixed</a>.</p>
<p><em>Four-four beta two<br />
Another week of progress<br />
REST API lives!</em></p>
";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:4;a:6:{s:4:"data";s:36:"
		
		
		
		
				
		

		
		
				
			";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:3:{s:0:"";a:6:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:20:"WordPress 4.4 Beta 1";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:56:"https://wordpress.org/news/2015/10/wordpress-4-4-beta-1/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 22 Oct 2015 23:54:19 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:2:{i:0;a:5:{s:4:"data";s:11:"Development";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:8:"Releases";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:34:"https://wordpress.org/news/?p=3926";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:329:"WordPress 4.4 Beta 1 is now available! This software is still in development, so we don’t recommend you run it on a production site. Consider setting up a test site just to play with the new version. To test WordPress 4.4, try the WordPress Beta Tester plugin (you’ll want “bleeding edge nightlies”). Or you can [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:12:"Scott Taylor";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:4293:"<p>WordPress 4.4 Beta 1 is now available!</p>
<p><strong>This software is still in development,</strong> so we don’t recommend you run it on a production site. Consider setting up a test site just to play with the new version. To test WordPress 4.4, try the <a href="https://wordpress.org/plugins/wordpress-beta-tester/" target="_blank">WordPress Beta Tester</a> plugin (you’ll want “bleeding edge nightlies”). Or you can <a href="https://wordpress.org/wordpress-4.4-beta1.zip" target="_blank">download the beta here</a> (zip).</p>
<p>WordPress 4.4 is slated for release on <a href="https://make.wordpress.org/core/version-4-4-project-schedule/" target="_blank">December 8</a>, but to get there, we need your help testing what we have been working on, including:</p>
<ul>
<li><strong>Twenty Sixteen </strong>— The <a href="https://make.wordpress.org/core/2015/08/25/introducing-twenty-sixteen/">newest</a> default theme for WordPress.</li>
<li><strong>Responsive Images </strong>— WordPress automatically delivers a <a href="https://make.wordpress.org/core/2015/09/30/responsive-images-merge-proposal/">more appropriate image</a> to users depending on a variety of conditions like screen size, viewport size, and screen resolution.</li>
<li><strong>Embeds </strong>— WordPress can now embed rich content from nearly all sites that support the oEmbed standard — not just YouTube, Flickr, Twitter, and the like. You can even embed <a href="https://make.wordpress.org/core/2015/09/30/feature-plugin-merge-proposal-oembed/">previews of posts</a> from other WordPress sites by pasting the URL on its own line.</li>
</ul>
<p>There have been a lot of changes for developers to play with as well:</p>
<ul>
<li><strong>REST API (phase 1) </strong>— The underlying infrastructure of the WordPress REST API <a href="https://wordpress.org/plugins/rest-api/">plugin</a> has been <a href="https://make.wordpress.org/core/2015/09/21/wp-rest-api-merge-proposal/">included in WordPress 4.4</a>. Plugin authors can take advantage of this by adding custom endpoints.</li>
<li><strong>Term Metadata </strong>— Taxonomy term metadata is <a href="https://make.wordpress.org/core/2015/09/04/taxonomy-term-metadata-proposal/">now included</a> in WordPress 4.4. If you&#8217;ve already been using a plugin to implement term metadata, you should read <a href="https://make.wordpress.org/core/2015/09/22/preparing-your-plugins-and-your-client-sites-for-termmeta/">this post</a> on how to prepare. Also, the underlying <code>WP_Term</code> class improves caching when working with terms. (<a href="https://core.trac.wordpress.org/ticket/14162">#14162</a>)</li>
<li><strong>Improved <code>&lt;title&gt;</code> output</strong> — <code>wp_title()</code> is now deprecated; WordPress can <a href="https://make.wordpress.org/core/2015/10/20/document-title-in-4-4/">handle the rendering</a> of the document title automatically.</li>
<li><strong>Comments </strong>— Comment queries are now split for performance. Also, the underlying <code>WP_Comment</code> class improves caching and introduces strong-typing. (<a href="https://core.trac.wordpress.org/ticket/8071">#8071</a>, <a href="https://core.trac.wordpress.org/ticket/32619">#32619</a>)</li>
</ul>
<p>If you want a more in-depth view of what major changes have made it into 4.4, <a href="https://make.wordpress.org/core/tag/4-4/" target="_blank">check out all 4.4-tagged posts</a> on the main development blog, or check out a <a href="https://core.trac.wordpress.org/query?status=closed&amp;group=component&amp;milestone=4.4">list of everything</a> that&#8217;s changed.</p>
<p><strong>If you think you’ve found a bug</strong>, you can post to the <a href="https://wordpress.org/support/forum/alphabeta" target="_blank">Alpha/Beta area</a> in the support forums. We’d love to hear from you! If you’re comfortable writing a reproducible bug report, <a href="https://make.wordpress.org/core/reports/" target="_blank">file one on the WordPress Trac</a>. There, you can also find <a href="https://core.trac.wordpress.org/tickets/major" target="_blank">a list of known bugs</a>.</p>
<p>Happy testing!</p>
<p><em>Many small changes</em><br />
<em>Some groundbreaking new features<br />
Fun times had by all<br />
</em></p>
";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:5;a:6:{s:4:"data";s:39:"
		
		
		
		
				
		
		

		
		
				
			";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:3:{s:0:"";a:6:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:48:"WordPress 4.3.1 Security and Maintenance Release";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:51:"https://wordpress.org/news/2015/09/wordpress-4-3-1/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Tue, 15 Sep 2015 15:22:37 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:3:{i:0;a:5:{s:4:"data";s:8:"Releases";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:8:"Security";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:2;a:5:{s:4:"data";s:3:"4.3";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:33:"http://wordpress.org/news/?p=3914";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:439:"WordPress 4.3.1 is now available. This is a security release for all previous versions and we strongly encourage you to update your sites immediately. This release addresses three issues, including two cross-site scripting vulnerabilities and a potential privilege escalation. WordPress versions 4.3 and earlier are vulnerable to a cross-site scripting vulnerability when processing shortcode tags (CVE-2015-5714). Reported by [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Samuel Sidler";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:4022:"<div class="storycontent">
<p>WordPress 4.3.1 is now available. This is a<strong> security release</strong> for all previous versions and we strongly encourage you to update your sites immediately.</p>
<p>This release addresses three issues, including two cross-site scripting vulnerabilities and a potential privilege escalation.</p>
<ul>
<li>WordPress versions 4.3 and earlier are vulnerable to a cross-site scripting vulnerability when processing shortcode tags (CVE-2015-5714). Reported by Shahar Tal and Netanel Rubin of <a href="http://checkpoint.com/">Check Point</a>.</li>
<li>A separate cross-site scripting vulnerability was found in the user list table. Reported by Ben Bidner of the WordPress security team.</li>
<li>Finally, in certain cases, users without proper permissions could publish private posts and make them sticky (CVE-2015-5715). Reported by Shahar Tal and Netanel Rubin of <a href="http://checkpoint.com/">Check Point</a>.</li>
</ul>
<p>Our thanks to those who have practiced <a href="https://make.wordpress.org/core/handbook/testing/reporting-security-vulnerabilities/">responsible disclosure</a> of security issues.</p>
<p>WordPress 4.3.1 also fixes twenty-six bugs. For more information, see the <a href="https://codex.wordpress.org/Version_4.3.1">release notes</a> or consult the <a href="https://core.trac.wordpress.org/log/branches/4.3/?rev=34199&amp;stop_rev=33647">list of changes</a>.</p>
<p><a href="https://wordpress.org/download/">Download WordPress 4.3.1</a> or venture over to Dashboard → Updates and simply click “Update Now.” Sites that support automatic background updates are already beginning to update to WordPress 4.3.1.</p>
</div>
<p>Thanks to everyone who contributed to 4.3.1:</p>
<p><a href="https://profiles.wordpress.org/adamsilverstein">Adam Silverstein</a>, <a href="https://profiles.wordpress.org/afercia">Andrea Fercia</a>, <a href="https://profiles.wordpress.org/azaozz">Andrew Ozz</a>, <a href="https://profiles.wordpress.org/boonebgorges">Boone Gorges</a>, <a href="https://profiles.wordpress.org/kraftbj">Brandon Kraft</a>, <a href="https://profiles.wordpress.org/chriscct7">chriscct7</a>, <a href="https://profiles.wordpress.org/extendwings">Daisuke Takahashi</a>, <a href="https://profiles.wordpress.org/dd32">Dion Hulse</a>, <a href="https://profiles.wordpress.org/ocean90">Dominik Schilling</a>, <a href="https://profiles.wordpress.org/DrewAPicture">Drew Jaynes</a>, <a href="https://profiles.wordpress.org/dustinbolton">dustinbolton</a>, <a href="https://profiles.wordpress.org/pento">Gary Pendergast</a>, <a href="https://profiles.wordpress.org/hauvong">hauvong</a>, <a href="https://profiles.wordpress.org/macmanx">James Huff</a>, <a href="https://profiles.wordpress.org/jeremyfelt">Jeremy Felt</a>, <a href="https://profiles.wordpress.org/jobst">jobst</a>, <a href="https://profiles.wordpress.org/tyxla">Marin Atanasov</a>, <a href="https://profiles.wordpress.org/celloexpressions">Nick Halsey</a>, <a href="https://profiles.wordpress.org/nikeo">nikeo</a>, <a href="https://profiles.wordpress.org/nbachiyski">Nikolay Bachiyski</a>, <a href="https://profiles.wordpress.org/swissspidy">Pascal Birchler</a>, <a href="https://profiles.wordpress.org/figureone">Paul Ryan</a>, <a href="https://profiles.wordpress.org/peterwilsoncc">Peter Wilson</a>, <a href="https://profiles.wordpress.org/miqrogroove">Robert Chapin</a>, <a href="https://profiles.wordpress.org/otto42">Samuel Wood</a>, <a href="https://profiles.wordpress.org/wonderboymusic">Scott Taylor</a>, <a href="https://profiles.wordpress.org/SergeyBiryukov">Sergey Biryukov</a>, <a href="https://profiles.wordpress.org/tmatsuur">tmatsuur</a>, <a href="https://profiles.wordpress.org/liljimmi">Tracy Levesque</a>, <a href="https://profiles.wordpress.org/umeshnevase">Umesh Nevase</a>, <a href="https://profiles.wordpress.org/vortfu">vortfu</a>, <a href="https://profiles.wordpress.org/welcher">welcher</a>, <a href="https://profiles.wordpress.org/westonruter">Weston Ruter</a></p>
";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:6;a:6:{s:4:"data";s:36:"
		
		
		
		
				
		

		
		
				
			";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:3:{s:0:"";a:6:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:26:"WordPress 4.3 “Billie”";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:42:"https://wordpress.org/news/2015/08/billie/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Tue, 18 Aug 2015 19:12:38 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:2:{i:0;a:5:{s:4:"data";s:8:"Releases";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:3:"4.3";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:33:"http://wordpress.org/news/?p=3845";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:352:"Version 4.3 of WordPress, named &#8220;Billie&#8221; in honor of jazz singer Billie Holiday, is available for download or update in your WordPress dashboard. New features in 4.3 make it even easier to format your content and customize your site. Menus in the Customizer Create your menu, update it, and assign it, all while live-previewing in [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:14:"Matt Mullenweg";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:22525:"<p style="margin: 0;height: 0"><img src="https://wordpress.org/news/files/2015/08/WordPress-4-3-billie-1024x574.png" alt="WordPress 4.3 - &quot;Billie&quot;" width="692" height="388" class="alignnone size-large wp-image-3896" style="height:0px;width: 0px;margin: 0" srcset="https://wordpress.org/news/files/2015/08/WordPress-4-3-billie-300x168.png 300w, https://wordpress.org/news/files/2015/08/WordPress-4-3-billie-1024x574.png 1024w" sizes="(max-width: 692px) 100vw, 692px" /></p>
<p>Version 4.3 of WordPress, named &#8220;Billie&#8221; in honor of jazz singer <a href="https://en.wikipedia.org/wiki/Billie_Holiday">Billie Holiday</a>, is available for <a href="https://wordpress.org/download/">download</a> or update in your WordPress dashboard. New features in 4.3 make it even easier to format your content and customize your site.</p>
<p><iframe width=\'692\' height=\'389\' src=\'https://videopress.com/embed/T54Iy7Tw?hd=1\' frameborder=\'0\' allowfullscreen></iframe><script src=\'https://v0.wordpress.com/js/next/videopress-iframe.js?m=1435166243\'></script></p>
<hr />
<h2>Menus in the Customizer</h2>
<div><img src="//s.w.org/images/core/4.3/menu-customizer.png" alt="" /></div>
<p>Create your menu, update it, and assign it, all while live-previewing in the customizer. The streamlined customizer design provides a mobile-friendly and accessible interface. With every release, it becomes easier and faster to make your site just the way you want it.</p>
<hr />
<h2>Formatting Shortcuts</h2>
<div style="margin-bottom: 0"><div style="width: 640px; " class="wp-video"><!--[if lt IE 9]><script>document.createElement(\'video\');</script><![endif]-->
<video class="wp-video-shortcode" id="video-3845-1" width="640" height="360" loop="1" autoplay="1" preload="metadata" controls="controls"><source type="video/mp4" src="//s.w.org/images/core/4.3/formatting.mp4?_=1" /><source type="video/webm" src="//s.w.org/images/core/4.3/formatting.webm?_=1" /><source type="video/ogg" src="//s.w.org/images/core/4.3/formatting.ogv?_=1" /><a href="//s.w.org/images/core/4.3/formatting.mp4">//s.w.org/images/core/4.3/formatting.mp4</a></video></div></div>
<p>Your writing flow just got faster with new formatting shortcuts in WordPress 4.3. Use asterisks to create lists and number signs to make a heading. No more breaking your flow; your text looks great with a <code>*</code> and a <code>#</code>.</p>
<hr />
<h2>Site Icons</h2>
<p><img src="//s.w.org/images/core/4.3/site-icon-customizer.png" alt="" /><br />
&nbsp;<br />
Site icons represent your site in browser tabs, bookmark menus, and on the home screen of mobile devices. Add your unique site icon in the customizer; it will even stay in place when you switch themes. Make your whole site reflect your brand.</p>
<hr />
<h2>Better Passwords</h2>
<p><img src="//s.w.org/images/core/4.3/better-passwords.png" alt="" /><br />
&nbsp;<br />
Keep your site more secure with WordPress’ improved approach to passwords. Instead of receiving passwords via email, you’ll get a password reset link. When you add new users to your site or edit a user profile, WordPress will automatically generate a secure password.</p>
<hr />
<h2>Other improvements</h2>
<ul>
<li><strong>A smoother admin experience</strong> &#8211; Refinements to the list view across the admin make your WordPress more accessible and easier to work with on any device.</li>
<li><strong>Comments turned off on pages</strong> &#8211; All new pages that you create will have comments turned off. Keep discussions to your blog, right where they’re supposed to happen.</li>
<li><strong>Customize your site quickly</strong> &#8211; Wherever you are on the front-end, you can click the customize link in the toolbar to swiftly make changes to your site.</li>
</ul>
<hr />
<h2>The Team</h2>
<p><a class="alignleft" href="https://profiles.wordpress.org/obenland"><img src="https://www.gravatar.com/avatar/2370ea5912750f4cb0f3c51ae1cbca55?d=mm&amp;s=180&amp;r=G" alt="Konstantin Obenland" width="80" height="80" /></a>This release was led by <a href="http://konstantin.obenland.it/">Konstantin Obenland</a>, with the help of these fine individuals. There are 246 contributors with props in this release. Pull up some Billie Holiday on your music service of choice, and check out some of their profiles:</p>
<a href="https://profiles.wordpress.org/mercime">@mercime</a>, <a href="https://profiles.wordpress.org/aaroncampbell">Aaron D. Campbell</a>, <a href="https://profiles.wordpress.org/jorbin">Aaron Jorbin</a>, <a href="https://profiles.wordpress.org/adamkheckler">Adam Heckler</a>, <a href="https://profiles.wordpress.org/adamsilverstein">Adam Silverstein</a>, <a href="https://profiles.wordpress.org/akibjorklund">Aki Bjorklund</a>, <a href="https://profiles.wordpress.org/akirk">Alex Kirk</a>, <a href="https://profiles.wordpress.org/viper007bond">Alex Mills (Viper007Bond)</a>, <a href="https://profiles.wordpress.org/tellyworth">Alex Shiels</a>, <a href="https://profiles.wordpress.org/deconf">Alin Marcu</a>, <a href="https://profiles.wordpress.org/andfinally">andfinally</a>, <a href="https://profiles.wordpress.org/afercia">Andrea Fercia</a>, <a href="https://profiles.wordpress.org/andg">Andrea Gandino</a>, <a href="https://profiles.wordpress.org/nacin">Andrew Nacin</a>, <a href="https://profiles.wordpress.org/azaozz">Andrew Ozz</a>, <a href="https://profiles.wordpress.org/afragen">Andy Fragen</a>, <a href="https://profiles.wordpress.org/ankit-k-gupta">Ankit K Gupta</a>, <a href="https://profiles.wordpress.org/antpb">Anthony Burchell</a>, <a href="https://profiles.wordpress.org/anubisthejackle">anubisthejackle</a>, <a href="https://profiles.wordpress.org/aramzs">Aram Zucker-Scharff</a>, <a href="https://profiles.wordpress.org/arjunskumar">Arjun S Kumar</a>, <a href="https://profiles.wordpress.org/avnarun">avnarun</a>, <a href="https://profiles.wordpress.org/brad2dabone">Bad Feather</a>, <a href="https://profiles.wordpress.org/bcole808">Ben Cole</a>, <a href="https://profiles.wordpress.org/empireoflight">Ben Dunkle</a>, <a href="https://profiles.wordpress.org/binarykitten">BinaryKitten</a>, <a href="https://profiles.wordpress.org/birgire">Birgir Erlendsson (birgire)</a>, <a href="https://profiles.wordpress.org/bjornjohansen">Bjorn Johansen</a>, <a href="https://profiles.wordpress.org/bolo1988">bolo1988</a>, <a href="https://profiles.wordpress.org/boonebgorges">Boone B. Gorges</a>, <a href="https://profiles.wordpress.org/bradt">Brad Touesnard</a>, <a href="https://profiles.wordpress.org/bramd">Bram Duvigneau</a>, <a href="https://profiles.wordpress.org/kraftbj">Brandon Kraft</a>, <a href="https://profiles.wordpress.org/krogsgard">Brian Krogsgard</a>, <a href="https://profiles.wordpress.org/brianlayman">Brian Layman</a>, <a href="https://profiles.wordpress.org/icaleb">Caleb Burks</a>, <a href="https://profiles.wordpress.org/calevans">CalEvans</a>, <a href="https://profiles.wordpress.org/chasewiseman">Chase Wiseman</a>, <a href="https://profiles.wordpress.org/chipbennett">Chip Bennett</a>, <a href="https://profiles.wordpress.org/chouby">Chouby</a>, <a href="https://profiles.wordpress.org/c3mdigital">Chris Olbekson</a>, <a href="https://profiles.wordpress.org/chriscct7">chriscct7</a>, <a href="https://profiles.wordpress.org/craig-ralston">Craig Ralston</a>, <a href="https://profiles.wordpress.org/extendwings">Daisuke Takahashi</a>, <a href="https://profiles.wordpress.org/danielbachhuber">Daniel Bachhuber</a>, <a href="https://profiles.wordpress.org/redsweater">Daniel Jalkut (Red Sweater)</a>, <a href="https://profiles.wordpress.org/mte90">Daniele Scasciafratte</a>, <a href="https://profiles.wordpress.org/daniluk4000">daniluk4000</a>, <a href="https://profiles.wordpress.org/dmchale">Dave McHale</a>, <a href="https://profiles.wordpress.org/daveal">DaveAl</a>, <a href="https://profiles.wordpress.org/davidakennedy">David A. Kennedy</a>, <a href="https://profiles.wordpress.org/dlh">David Herrera</a>, <a href="https://profiles.wordpress.org/daxelrod">daxelrod</a>, <a href="https://profiles.wordpress.org/denis-de-bernardy">Denis de Bernardy</a>, <a href="https://profiles.wordpress.org/realloc">Dennis Ploetner</a>, <a href="https://profiles.wordpress.org/valendesigns">Derek Herman</a>, <a href="https://profiles.wordpress.org/dd32">Dion Hulse</a>, <a href="https://profiles.wordpress.org/dipeshkakadiya">dipesh.kakadiya</a>, <a href="https://profiles.wordpress.org/dmsnell">dmsnell</a>, <a href="https://profiles.wordpress.org/ocean90">Dominik Schilling</a>, <a href="https://profiles.wordpress.org/drewapicture">Drew Jaynes</a>, <a href="https://profiles.wordpress.org/dustinbolton">dustinbolton</a>, <a href="https://profiles.wordpress.org/kucrut">Dzikri Aziz</a>, <a href="https://profiles.wordpress.org/eclev91">eclev91</a>, <a href="https://profiles.wordpress.org/eligijus">eligijus</a>, <a href="https://profiles.wordpress.org/eliorivero">Elio Rivero</a>, <a href="https://profiles.wordpress.org/iseulde">Ella Iseulde Van Dorpe</a>, <a href="https://profiles.wordpress.org/ericlewis">Eric Andrew Lewis</a>, <a href="https://profiles.wordpress.org/ebinnion">Eric Binnion</a>, <a href="https://profiles.wordpress.org/ericmann">Eric Mann</a>, <a href="https://profiles.wordpress.org/fab1en">Fabien Quatravaux</a>, <a href="https://profiles.wordpress.org/flixos90">Felix Arntz</a>, <a href="https://profiles.wordpress.org/francoeurdavid">francoeurdavid</a>, <a href="https://profiles.wordpress.org/frank-klein">Frank Klein</a>, <a href="https://profiles.wordpress.org/gabrielperezs">gabrielperezs</a>, <a href="https://profiles.wordpress.org/voldemortensen">Garth Mortensen</a>, <a href="https://profiles.wordpress.org/garyj">Gary Jones</a>, <a href="https://profiles.wordpress.org/pento">Gary Pendergast</a>, <a href="https://profiles.wordpress.org/georgestephanis">George Stephanis</a>, <a href="https://profiles.wordpress.org/glennm">glennm</a>, <a href="https://profiles.wordpress.org/gtuk">gtuk</a>, <a href="https://profiles.wordpress.org/hailin">hailin</a>, <a href="https://profiles.wordpress.org/hauvong">hauvong</a>, <a href="https://profiles.wordpress.org/helen">Helen Hou-Sandí</a>, <a href="https://profiles.wordpress.org/henrikakselsen">henrikakselsen</a>, <a href="https://profiles.wordpress.org/hnle">Hinaloe</a>, <a href="https://profiles.wordpress.org/hrishiv90">Hrishikesh Vaipurkar</a>, <a href="https://profiles.wordpress.org/hugobaeta">Hugo Baeta</a>, <a href="https://profiles.wordpress.org/polevaultweb">Iain Poulson</a>, <a href="https://profiles.wordpress.org/imath">imath</a>, <a href="https://profiles.wordpress.org/ipstenu">Ipstenu (Mika Epstein)</a>, <a href="https://profiles.wordpress.org/isaacchapman">isaacchapman</a>, <a href="https://profiles.wordpress.org/izem">izem</a>, <a href="https://profiles.wordpress.org/jdgrimes">J.D. Grimes</a>, <a href="https://profiles.wordpress.org/jacklenox">Jack Lenox</a>, <a href="https://profiles.wordpress.org/jadpm">jadpm</a>, <a href="https://profiles.wordpress.org/macmanx">James Huff</a>, <a href="https://profiles.wordpress.org/jamesgol">jamesgol</a>, <a href="https://profiles.wordpress.org/jancbeck">jancbeck</a>, <a href="https://profiles.wordpress.org/jfarthing84">Jeff Farthing</a>, <a href="https://profiles.wordpress.org/jeremyfelt">Jeremy Felt</a>, <a href="https://profiles.wordpress.org/jpry">Jeremy Pry</a>, <a href="https://profiles.wordpress.org/jmichaelward">Jeremy Ward</a>, <a href="https://profiles.wordpress.org/jesin">Jesin A</a>, <a href="https://profiles.wordpress.org/jipmoors">jipmoors</a>, <a href="https://profiles.wordpress.org/eltobiano">jjberry</a>, <a href="https://profiles.wordpress.org/jobst">Jobst Schmalenbach</a>, <a href="https://profiles.wordpress.org/joedolson">Joe Dolson</a>, <a href="https://profiles.wordpress.org/joehoyle">Joe Hoyle</a>, <a href="https://profiles.wordpress.org/joemcgill">Joe McGill</a>, <a href="https://profiles.wordpress.org/jkudish">Joey Kudish</a>, <a href="https://profiles.wordpress.org/johnbillion">John Blackbourn</a>, <a href="https://profiles.wordpress.org/johnjamesjacoby">John James Jacoby</a>, <a href="https://profiles.wordpress.org/picard102">John Leschinski</a>, <a href="https://profiles.wordpress.org/joostdevalk">Joost de Valk</a>, <a href="https://profiles.wordpress.org/maxxsnake">Josh Davis</a>, <a href="https://profiles.wordpress.org/jpyper">Jpyper</a>, <a href="https://profiles.wordpress.org/jrf">jrf</a>, <a href="https://profiles.wordpress.org/juliobox">Julio Potier</a>, <a href="https://profiles.wordpress.org/jtsternberg">Justin Sternberg</a>, <a href="https://profiles.wordpress.org/ungestaltbar">Kai</a>, <a href="https://profiles.wordpress.org/karinchristen">karinchristen</a>, <a href="https://profiles.wordpress.org/karpstrucking">karpstrucking</a>, <a href="https://profiles.wordpress.org/ryelle">Kelly Dwan</a>, <a href="https://profiles.wordpress.org/kevkoeh">Kevin Koehler</a>, <a href="https://profiles.wordpress.org/kitchin">kitchin</a>, <a href="https://profiles.wordpress.org/ixkaito">Kite</a>, <a href="https://profiles.wordpress.org/kovshenin">Konstantin Kovshenin</a>, <a href="https://profiles.wordpress.org/lancewillett">Lance Willett</a>, <a href="https://profiles.wordpress.org/leewillis77">Lee Willis</a>, <a href="https://profiles.wordpress.org/leogopal">Leo Gopal</a>, <a href="https://profiles.wordpress.org/loushou">loushou</a>, <a href="https://profiles.wordpress.org/lumaraf">Lumaraf</a>, <a href="https://profiles.wordpress.org/tyxla">Marin Atanasov</a>, <a href="https://profiles.wordpress.org/nofearinc">Mario Peshev</a>, <a href="https://profiles.wordpress.org/clorith">Marius (Clorith)</a>, <a href="https://profiles.wordpress.org/markjaquith">Mark Jaquith</a>, <a href="https://profiles.wordpress.org/markoheijnen">Marko Heijnen</a>, <a href="https://profiles.wordpress.org/marsjaninzmarsa">marsjaninzmarsa</a>, <a href="https://profiles.wordpress.org/martinsachse">martinsachse</a>, <a href="https://profiles.wordpress.org/matt">Matt Mullenweg</a>, <a href="https://profiles.wordpress.org/veraxus">Matt van Andel</a>, <a href="https://profiles.wordpress.org/mattwiebe">Matt Wiebe</a>, <a href="https://profiles.wordpress.org/mattyrob">mattyrob</a>, <a href="https://profiles.wordpress.org/melchoyce">Mel Choyce</a>, <a href="https://profiles.wordpress.org/nikonratm">Michael</a>, <a href="https://profiles.wordpress.org/mdawaffe">Michael Adams (mdawaffe)</a>, <a href="https://profiles.wordpress.org/michael-arestad">Michael Arestad</a>, <a href="https://profiles.wordpress.org/michaelryanmcneill">michaelryanmcneill</a>, <a href="https://profiles.wordpress.org/mcguive7">Mickey Kay</a>, <a href="https://profiles.wordpress.org/mihai">mihai</a>, <a href="https://profiles.wordpress.org/mikehansenme">Mike Hansen</a>, <a href="https://profiles.wordpress.org/mnelson4">Mike Nelson</a>, <a href="https://profiles.wordpress.org/dh-shredder">Mike Schroder</a>, <a href="https://profiles.wordpress.org/dimadin">Milan Dinic</a>, <a href="https://profiles.wordpress.org/morganestes">Morgan Estes</a>, <a href="https://profiles.wordpress.org/mrutz">mrutz</a>, <a href="https://profiles.wordpress.org/nabil_kadimi">nabil_kadimi</a>, <a href="https://profiles.wordpress.org/Nao">Naoko Takano</a>, <a href="https://profiles.wordpress.org/nazmulhossainnihal">Nazmul Hossain Nihal</a>, <a href="https://profiles.wordpress.org/nicholas_io">nicholas_io</a>, <a href="https://profiles.wordpress.org/celloexpressions">Nick Halsey</a>, <a href="https://profiles.wordpress.org/nickmomrik">Nick Momrik</a>, <a href="https://profiles.wordpress.org/nikeo">nikeo</a>, <a href="https://profiles.wordpress.org/nbachiyski">Nikolay Bachiyski</a>, <a href="https://profiles.wordpress.org/rabmalin">Nilambar Sharma</a>, <a href="https://profiles.wordpress.org/onnimonni">Onni Hakala</a>, <a href="https://profiles.wordpress.org/ozh">Ozh</a>, <a href="https://profiles.wordpress.org/pareshradadiya-1">Paresh Radadiya</a>, <a href="https://profiles.wordpress.org/swissspidy">Pascal Birchler</a>, <a href="https://profiles.wordpress.org/djpaul">Paul Gibbs</a>, <a href="https://profiles.wordpress.org/figureone">Paul Ryan</a>, <a href="https://profiles.wordpress.org/paulwilde">Paul Wilde</a>, <a href="https://profiles.wordpress.org/pavelevap">pavelevap</a>, <a href="https://profiles.wordpress.org/gungeekatx">Pete Nelson</a>, <a href="https://profiles.wordpress.org/peterwilsoncc">Peter Wilson</a>, <a href="https://profiles.wordpress.org/peterrknight">PeterRKnight</a>, <a href="https://profiles.wordpress.org/philiparthurmoore">Philip Arthur Moore</a>, <a href="https://profiles.wordpress.org/mordauk">Pippin Williamson</a>, <a href="https://profiles.wordpress.org/posykrat">posykrat</a>, <a href="https://profiles.wordpress.org/pragunbhutani">pragunbhutani</a>, <a href="https://profiles.wordpress.org/rachelbaker">Rachel Baker</a>, <a href="https://profiles.wordpress.org/ramiy">Rami Yushuvaev</a>, <a href="https://profiles.wordpress.org/rarylson">rarylson</a>, <a href="https://profiles.wordpress.org/lamosty">Rastislav Lamos</a>, <a href="https://profiles.wordpress.org/rauchg">rauchg</a>, <a href="https://profiles.wordpress.org/ravinderk">Ravinder Kumar</a>, <a href="https://profiles.wordpress.org/rclations">RC Lations</a>, <a href="https://profiles.wordpress.org/greuben">Reuben Gunday</a>, <a href="https://profiles.wordpress.org/rianrietveld">Rian Rietveld</a>, <a href="https://profiles.wordpress.org/ritteshpatel">Ritesh Patel</a>, <a href="https://profiles.wordpress.org/miqrogroove">Robert Chapin</a>, <a href="https://profiles.wordpress.org/rdall">Robert Dall</a>, <a href="https://profiles.wordpress.org/rodrigosprimo">Rodrigo Primo</a>, <a href="https://profiles.wordpress.org/rommelxcastro">Rommel Castro</a>, <a href="https://profiles.wordpress.org/magicroundabout">Ross Wintle</a>, <a href="https://profiles.wordpress.org/rhurling">Rouven Hurling</a>, <a href="https://profiles.wordpress.org/ryan">Ryan Boren</a>, <a href="https://profiles.wordpress.org/rmarks">Ryan Marks</a>, <a href="https://profiles.wordpress.org/rmccue">Ryan McCue</a>, <a href="https://profiles.wordpress.org/ohryan">Ryan Neudorf</a>, <a href="https://profiles.wordpress.org/welcher">Ryan Welcher</a>, <a href="https://profiles.wordpress.org/sagarjadhav">Sagar Jadhav</a>, <a href="https://profiles.wordpress.org/salcode">Sal Ferrarello</a>, <a href="https://profiles.wordpress.org/solarissmoke">Samir Shah</a>, <a href="https://profiles.wordpress.org/santagada">santagada</a>, <a href="https://profiles.wordpress.org/sc0ttkclark">Scott Kingsley Clark</a>, <a href="https://profiles.wordpress.org/coffee2code">Scott Reilly</a>, <a href="https://profiles.wordpress.org/wonderboymusic">Scott Taylor</a>, <a href="https://profiles.wordpress.org/scribu">scribu</a>, <a href="https://profiles.wordpress.org/scruffian">scruffian</a>, <a href="https://profiles.wordpress.org/seanchayes">Sean Hayes</a>, <a href="https://profiles.wordpress.org/sebastiantiede">Sebastian</a>, <a href="https://profiles.wordpress.org/sergeybiryukov">Sergey Biryukov</a>, <a href="https://profiles.wordpress.org/shooper">Shawn Hooper</a>, <a href="https://profiles.wordpress.org/designsimply">Sheri Bigelow</a>, <a href="https://profiles.wordpress.org/simonwheatley">Simon Wheatley</a>, <a href="https://profiles.wordpress.org/siobhan">Siobhan</a>, <a href="https://profiles.wordpress.org/metodiew">Stanko Metodiev</a>, <a href="https://profiles.wordpress.org/stephdau">Stephane Daury (stephdau)</a>, <a href="https://profiles.wordpress.org/netweb">Stephen Edgar</a>, <a href="https://profiles.wordpress.org/stevegrunwell">Steve Grunwell</a>, <a href="https://profiles.wordpress.org/stevenkword">Steven Word</a>, <a href="https://profiles.wordpress.org/stuartshields">stuartshields</a>, <a href="https://profiles.wordpress.org/sudar">Sudar Muthu</a>, <a href="https://profiles.wordpress.org/sunnyratilal">Sunny Ratilal</a>, <a href="https://profiles.wordpress.org/taka2">taka2</a>, <a href="https://profiles.wordpress.org/tharsheblows">tharsheblows</a>, <a href="https://profiles.wordpress.org/thorbrink">Thor Brink</a>, <a href="https://profiles.wordpress.org/creativeinfusion">Tim Smith</a>, <a href="https://profiles.wordpress.org/tlexcellent">tlexcellent</a>, <a href="https://profiles.wordpress.org/tmatsuur">tmatsuur</a>, <a href="https://profiles.wordpress.org/tobiasbg">TobiasBg</a>, <a href="https://profiles.wordpress.org/tomasm">Tomas Mackevicius</a>, <a href="https://profiles.wordpress.org/tomharrigan">TomHarrigan</a>, <a href="https://profiles.wordpress.org/toro_unit">Toro_Unit (Hiroshi Urabe)</a>, <a href="https://profiles.wordpress.org/toru">Toru Miki</a>, <a href="https://profiles.wordpress.org/liljimmi">Tracy (LilJimmi) Levesque</a>, <a href="https://profiles.wordpress.org/tryon">Tryon Eggleston</a>, <a href="https://profiles.wordpress.org/tywayne">Ty Carlson</a>, <a href="https://profiles.wordpress.org/desaiuditd">Udit Desai</a>, <a href="https://profiles.wordpress.org/umeshnevase">Umesh Nevase</a>, <a href="https://profiles.wordpress.org/vivekbhusal">vivekbhusal</a>, <a href="https://profiles.wordpress.org/vortfu">vortfu</a>, <a href="https://profiles.wordpress.org/westonruter">Weston Ruter</a>, <a href="https://profiles.wordpress.org/willnorris">Will Norris</a>, <a href="https://profiles.wordpress.org/willgladstone">willgladstone</a>, <a href="https://profiles.wordpress.org/earnjam">William Earnhardt</a>, <a href="https://profiles.wordpress.org/willstedt">willstedt</a>, <a href="https://profiles.wordpress.org/yoavf">Yoav Farhi</a>, <a href="https://profiles.wordpress.org/ysalame">Yuri Salame</a>, <a href="https://profiles.wordpress.org/oxymoron">Zach Wills</a>, <a href="https://profiles.wordpress.org/katzwebdesign">Zack Katz</a>, and <a href="https://profiles.wordpress.org/tollmanz">Zack Tollman</a>.
<p>&nbsp;</p>
<p>Special thanks go to <a href="http://siobhanmckeown.com/">Siobhan McKeown</a> for producing the release video, <a href="http://hugobaeta.com/">Hugo Baeta</a> for the design, and <a href="http://jacklenox.com/">Jack Lenox</a> for the voice-over.</p>
<p>Finally, thanks to all of the contributors who provided subtitles for the release video, which at last count had been translated into 30 languages!</p>
<p>If you want to follow along or help out, check out <a href="https://make.wordpress.org/">Make WordPress</a> and our <a href="https://make.wordpress.org/core/">core development blog</a>. Thanks for choosing WordPress. See you soon for version 4.4!</p>
";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:7;a:6:{s:4:"data";s:39:"
		
		
		
		
				
		
		

		
		
				
			";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:3:{s:0:"";a:6:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:48:"WordPress 4.2.4 Security and Maintenance Release";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:84:"https://wordpress.org/news/2015/08/wordpress-4-2-4-security-and-maintenance-release/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Tue, 04 Aug 2015 12:10:40 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:3:{i:0;a:5:{s:4:"data";s:8:"Releases";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:8:"Security";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:2;a:5:{s:4:"data";s:3:"4.2";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:33:"http://wordpress.org/news/?p=3827";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:397:"WordPress 4.2.4 is now available. This is a security release for all previous versions and we strongly encourage you to update your sites immediately. This release addresses six issues, including three cross-site scripting vulnerabilities and a potential SQL injection that could be used to compromise a site, which were discovered by Marc-Alexandre Montpas of Sucuri, Helen Hou-Sandí [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Samuel Sidler";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:2011:"<p>WordPress 4.2.4 is now available. This is a<strong> security release</strong> for all previous versions and we strongly encourage you to update your sites immediately.</p>
<p>This release addresses six issues, including three cross-site scripting vulnerabilities and a potential SQL injection that could be used to compromise a site, which were discovered by <a href="https://sucuri.net/">Marc-Alexandre Montpas</a> of Sucuri, <a href="http://helenhousandi.com/">Helen Hou-Sandí</a> of the WordPress security team, <a href="http://www.checkpoint.com/">Netanel Rubin</a> of Check Point, and <a href="https://hackerone.com/reactors08">Ivan Grigorov</a>. It also includes a fix for a potential timing side-channel attack, discovered by <a href="http://www.scrutinizer-ci.com/">Johannes Schmitt</a> of Scrutinizer, and prevents an attacker from locking a post from being edited, discovered by <a href="https://www.linkedin.com/in/symbiansymoh">Mohamed A. Baset</a>.</p>
<p>Our thanks to those who have practiced <a href="https://make.wordpress.org/core/handbook/testing/reporting-security-vulnerabilities/">responsible disclosure</a> of security issues.</p>
<p>WordPress 4.2.4 also fixes four bugs. For more information, see the <a href="https://codex.wordpress.org/Version_4.2.4">release notes</a> or consult the <a href="https://core.trac.wordpress.org/log/branches/4.2?rev=33573&amp;stop_rev=33396">list of changes</a>.</p>
<p><a href="https://wordpress.org/download/">Download WordPress 4.2.4</a> or venture over to Dashboard → Updates and simply click “Update Now.” Sites that support automatic background updates are already beginning to update to WordPress 4.2.4.</p>
<p><em>Already testing WordPress 4.3? The second release candidate is now available (<a href="https://wordpress.org/wordpress-4.3-RC2.zip">zip</a>) and it contains these fixes. For more on 4.3, see <a href="https://wordpress.org/news/2015/07/wordpress-4-3-release-candidate/">the RC 1 announcement post</a>.</em></p>
";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:8;a:6:{s:4:"data";s:39:"
		
		
		
		
				
		
		

		
		
				
			";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:3:{s:0:"";a:6:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:31:"WordPress 4.3 Release Candidate";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:67:"https://wordpress.org/news/2015/07/wordpress-4-3-release-candidate/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 29 Jul 2015 23:50:43 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:3:{i:0;a:5:{s:4:"data";s:11:"Development";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:8:"Releases";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:2;a:5:{s:4:"data";s:3:"4.3";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:33:"http://wordpress.org/news/?p=3817";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:340:"The release candidate for WordPress 4.3 is now available. We&#8217;ve made more than 100 changes since releasing Beta 4 a week ago. RC means we think we’re done, but with millions of users and thousands of plugins and themes, it’s possible we’ve missed something. We hope to ship WordPress 4.3 on Tuesday, August 18, but we [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:19:"Konstantin Obenland";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:2256:"<p>The release candidate for WordPress 4.3 is now available.</p>
<p>We&#8217;ve made more than <a href="https://core.trac.wordpress.org/log/trunk?action=stop_on_copy&amp;mode=stop_on_copy&amp;rev=33512&amp;stop_rev=33372&amp;limit=120">100 changes</a> since releasing Beta 4 a week ago. RC means we think we’re done, but with millions of users and thousands of plugins and themes, it’s possible we’ve missed something. We hope to ship WordPress 4.3 on <strong>Tuesday, August 18</strong>, but we need your help to get there.</p>
<p>If you haven’t tested 4.3 yet, now is the time!</p>
<p><strong>Think you&#8217;ve found a bug?</strong> Please post to the <a href="https://wordpress.org/support/forum/alphabeta/">Alpha/Beta support forum</a>. If any known issues come up, you&#8217;ll be able to <a href="https://core.trac.wordpress.org/report/5">find them here</a>.</p>
<p>To test WordPress 4.3 RC1, you can use the <a href="https://wordpress.org/plugins/wordpress-beta-tester/">WordPress Beta Tester</a> plugin or you can <a href="https://wordpress.org/wordpress-4.3-RC1.zip">download the release candidate here</a> (zip).</p>
<p>For more information about what’s new in version 4.3, check out the <a href="https://wordpress.org/news/2015/07/wordpress-4-3-beta-1/">Beta 1</a>, <a href="https://wordpress.org/news/2015/07/wordpress-4-3-beta-2/">Beta 2</a>, <a href="https://wordpress.org/news/2015/07/wordpress-4-3-beta-3/">Beta 3</a>, and <a href="https://wordpress.org/news/2015/07/wordpress-4-3-beta-4/">Beta 4</a> blog posts.</p>
<p><strong>Developers</strong>, please test your plugins and themes against WordPress 4.3 and update your plugin&#8217;s <em>Tested up to</em> version in the readme to 4.3 before next week. If you find compatibility problems, we never want to break things, so please be sure to post to the support forums so we can figure those out before the final release.</p>
<p>Be sure to <a href="https://make.wordpress.org/core/">follow along the core development blog</a>, where we&#8217;ll continue to post <a href="https://make.wordpress.org/core/tag/dev-notes+4-3/">notes for developers</a> for 4.3.</p>
<p><em>Drei Monate Arbeit</em><br />
<em>Endlich das Ziel vor Augen</em><br />
<em>Bald hab ich Urlaub!</em></p>
";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:9;a:6:{s:4:"data";s:39:"
		
		
		
		
				
		
		

		
		
				
			";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:3:{s:0:"";a:6:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:48:"WordPress 4.2.3 Security and Maintenance Release";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:51:"https://wordpress.org/news/2015/07/wordpress-4-2-3/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 23 Jul 2015 11:21:10 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:3:{i:0;a:5:{s:4:"data";s:8:"Releases";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:8:"Security";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:2;a:5:{s:4:"data";s:3:"4.2";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:33:"http://wordpress.org/news/?p=3807";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:380:"WordPress 4.2.3 is now available. This is a security release for all previous versions and we strongly encourage you to update your sites immediately. WordPress versions 4.2.2 and earlier are affected by a cross-site scripting vulnerability, which could allow users with the Contributor or Author role to compromise a site. This was initially reported by Jon Cave and [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:15:"Gary Pendergast";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:2708:"<p>WordPress 4.2.3 is now available. This is a<strong> security release</strong> for all previous versions and we strongly encourage you to update your sites immediately.</p>
<p>WordPress versions 4.2.2 and earlier are affected by a cross-site scripting vulnerability, which could allow users with the Contributor or Author role to compromise a site. This was initially reported by <a href="https://profiles.wordpress.org/duck_">Jon Cave</a> and fixed by <a href="http://www.miqrogroove.com/">Robert Chapin</a>, both of the WordPress security team, and later reported by <a href="http://klikki.fi/">Jouko Pynnönen</a>.</p>
<p>We also fixed an issue where it was possible for a user with Subscriber permissions to create a draft through Quick Draft. Reported by Netanel Rubin from <a href="https://www.checkpoint.com/">Check Point Software Technologies</a>.</p>
<p>Our thanks to those who have practiced <a href="https://make.wordpress.org/core/handbook/reporting-security-vulnerabilities/">responsible disclosure</a> of security issues.</p>
<p>WordPress 4.2.3 also contains fixes for 20 bugs from 4.2. For more information, see the <a href="https://codex.wordpress.org/Version_4.2.3">release notes</a> or consult the <a href="https://core.trac.wordpress.org/log/branches/4.2?rev=33382&amp;stop_rev=32430">list of changes</a>.</p>
<p><a href="https://wordpress.org/download/">Download WordPress 4.2.3</a> or venture over to Dashboard → Updates and simply click “Update Now.” Sites that support automatic background updates are already beginning to update to WordPress 4.2.3.</p>
<p>Thanks to everyone who contributed to 4.2.3:</p>
<p><a href="https://profiles.wordpress.org/jorbin">Aaron Jorbin</a>, <a href="https://profiles.wordpress.org/nacin">Andrew Nacin</a>, <a href="https://profiles.wordpress.org/azaozz">Andrew Ozz</a>, <a href="https://profiles.wordpress.org/boonebgorges">Boone Gorges</a>, <a href="https://profiles.wordpress.org/chriscct7">Chris Christoff</a>, <a href="https://profiles.wordpress.org/dd32">Dion Hulse</a>, <a href="https://profiles.wordpress.org/ocean90">Dominik Schilling</a>, <a href="https://profiles.wordpress.org/iseulde">Ella Iseulde Van Dorpe</a>, <a href="https://profiles.wordpress.org/gabrielperezs">Gabriel Pérez</a>, <a href="https://profiles.wordpress.org/pento">Gary Pendergast</a>, <a href="https://profiles.wordpress.org/mdawaffe">Mike Adams</a>, <a href="https://profiles.wordpress.org/miqrogroove">Robert Chapin</a>, <a href="https://profiles.wordpress.org/nbachiyski">Nikolay Bachiyski</a>, <a href="https://profiles.wordpress.org/magicroundabout">Ross Wintle</a>, and <a href="https://profiles.wordpress.org/wonderboymusic">Scott Taylor</a>.</p>
";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}}}s:27:"http://www.w3.org/2005/Atom";a:1:{s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:0:"";s:7:"attribs";a:1:{s:0:"";a:3:{s:4:"href";s:32:"https://wordpress.org/news/feed/";s:3:"rel";s:4:"self";s:4:"type";s:19:"application/rss+xml";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:44:"http://purl.org/rss/1.0/modules/syndication/";a:2:{s:12:"updatePeriod";a:1:{i:0;a:5:{s:4:"data";s:6:"hourly";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:15:"updateFrequency";a:1:{i:0;a:5:{s:4:"data";s:1:"1";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}}}}}}}}s:4:"type";i:128;s:7:"headers";a:9:{s:6:"server";s:5:"nginx";s:4:"date";s:29:"Fri, 04 Dec 2015 11:34:14 GMT";s:12:"content-type";s:34:"application/rss+xml; charset=UTF-8";s:10:"connection";s:5:"close";s:25:"strict-transport-security";s:11:"max-age=360";s:13:"last-modified";s:29:"Wed, 25 Nov 2015 23:04:05 GMT";s:4:"link";s:63:"<https://wordpress.org/news/wp-json/>; rel="https://api.w.org/"";s:15:"x-frame-options";s:10:"SAMEORIGIN";s:4:"x-nc";s:11:"HIT lax 249";}s:5:"build";s:14:"20130911040210";}', 'no' );
INSERT INTO `wp_options`(`option_id`,`option_name`,`option_value`,`autoload`) VALUES ( '302', '_transient_timeout_feed_mod_ac0b00fe65abe10e0c5b588f3ed8c7ca', '1449272056', 'no' );
INSERT INTO `wp_options`(`option_id`,`option_name`,`option_value`,`autoload`) VALUES ( '303', '_transient_feed_mod_ac0b00fe65abe10e0c5b588f3ed8c7ca', '1449228856', 'no' );
INSERT INTO `wp_options`(`option_id`,`option_name`,`option_value`,`autoload`) VALUES ( '305', '_transient_timeout_feed_d117b5738fbd35bd8c0391cda1f2b5d9', '1449272065', 'no' );
INSERT INTO `wp_options`(`option_id`,`option_name`,`option_value`,`autoload`) VALUES ( '306', '_transient_feed_d117b5738fbd35bd8c0391cda1f2b5d9', 'a:4:{s:5:"child";a:1:{s:0:"";a:1:{s:3:"rss";a:1:{i:0;a:6:{s:4:"data";s:3:"


";s:7:"attribs";a:1:{s:0:"";a:1:{s:7:"version";s:3:"2.0";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:1:{s:0:"";a:1:{s:7:"channel";a:1:{i:0;a:6:{s:4:"data";s:61:"
	
	
	
	




















































";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:1:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:16:"WordPress Planet";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:28:"http://planet.wordpress.org/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"language";a:1:{i:0;a:5:{s:4:"data";s:2:"en";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:47:"WordPress Planet - http://planet.wordpress.org/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"item";a:50:{i:0;a:6:{s:4:"data";s:13:"
	
	
	
	
	
	
";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:71:"WPTavern: A More RESTful WP-CLI Kickstarter Campaign is Now 187% Funded";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=49283";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:80:"http://wptavern.com/a-more-restful-wp-cli-kickstarter-campaign-is-now-187-funded";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:2741:"<p><a href="http://i2.wp.com/wptavern.com/wp-content/uploads/2015/12/restful-wp-cli.png" rel="attachment wp-att-49286"><img src="http://i2.wp.com/wptavern.com/wp-content/uploads/2015/12/restful-wp-cli.png?resize=1025%2C459" alt="restful-wp-cli" class="aligncenter size-full wp-image-49286" /></a></p>
<p><a href="https://danielbachhuber.com/" target="_blank">Daniel Bachhuber</a>, the current maintainer of <a href="http://wp-cli.org/" target="_blank">WP-CLI</a>, announced today that his Kickstarter campaign to develop a more RESTful WP-CLI is now complete. The original goal of $17,500 was <a href="http://wptavern.com/daniel-bachhuber-raises-more-than-17-5k-to-develop-a-restful-wp-cli" target="_blank">fully funded within 12 hours</a> of launching the campaign, pushing it onto the stretch goal where every additional $100 raised equals one hour of his time towards the WP REST API project in 2016.</p>
<p>As Bachhuber is also a strong contributor on the WP REST API team, he is uniquely positioned to tackle the goal of this project &#8211; to get all WP REST API endpoints registered via plugins and themes to be automagically usable as WP-CLI commands.</p>
<p>WP-CLI is one of the most indispensable tools for WordPress developers, so it&#8217;s not surprising that the campaign ended with 187% funding, $32,822 raised via 107 backers. Rewards for the higher tiers of support include consultation and education on advanced uses of WP-CLI and the WP REST API.</p>
<p>Bachhuber announced the end of the campaign in a <a href="https://www.kickstarter.com/projects/danielbachhuber/a-more-restful-wp-cli/posts/1433825" target="_blank">note</a> published today, which concludes with questions he hopes to explore through his work in 2016.</p>
<p>&#8220;Once you have the WP REST API, what is the single compelling reason to use WordPress?&#8221; he asked. &#8220;Or, why use WordPress at all? Gut reaction from creating my first React + WP app today: I don’t need WordPress. I just need the easiest way to create a powerful REST API.</p>
<p>As the technology around WordPress continues to evolve, Bachhuber sees WordPress as the representation of a set of ideals.</p>
<p>&#8220;I believe WordPress is the embodiment of core philosophies, rather than a specific manifestation of software: ownership over personal data, design for the users, commitment to backwards compatibility, etc.,&#8221; Bachhuber said.</p>
<p>&#8220;To get to 100%, WordPress needs to interoperate with every part of the web.&#8221;</p>
<p>Bachhuber will be working on the project during the first six months of 2016. He plans to post bi-weekly progress updates to the WP-CLI blog and will cross-post to Kickstarter as well.</p>
<div id="epoch-width-sniffer"></div>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 04 Dec 2015 02:58:02 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Sarah Gooding";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:1;a:6:{s:4:"data";s:13:"
	
	
	
	
	
	
";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:71:"WPTavern: WPWeekly Episode 215 – All About Logos With Andrew Bergeron";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:44:"http://wptavern.com?p=49295&preview_id=49295";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:77:"http://wptavern.com/wpweekly-episode-215-all-about-logos-with-andrew-bergeron";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:2985:"<p>In this episode, <a href="http://marcuscouch.com/">Marcus Couch</a> and I are joined by Andrew Bergeron, founder of <a href="http://visualrhythm.com/">Visual Rhythm. </a>Bergeron explains the effort and investment it takes to create memorable logos. He also shares tips on how to avoid designing forgettable logos. We also learn the history of the <a href="https://en.wikipedia.org/wiki/Swoosh">Nike Swoosh logo</a> created by Carolyn Davidson in 1971.</p>
<h2>Stories Discussed:</h2>
<p><a href="https://wordpress.org/news/2015/11/wordpress-4-4-release-candidate/">WordPress 4.4 RC1 Released</a><br />
<a href="http://wptavern.com/nearly-half-of-the-wordpress-plugins-in-the-directory-are-not-updated-after-two-years">Nearly Half of the WordPress Plugins in the Directory Are Not Updated After Two Years</a><br />
<a href="http://wptavern.com/freemius-insights-enables-plugin-developers-to-make-data-driven-decisions">Freemius Insights Enables Plugin Developers to Make Data-Driven Decisions</a><br />
<a href="http://wptavern.com/joost-de-valk-on-the-lessons-learned-after-releasing-wordpress-seo-3-0">Joost de Valk on the Lessons Learned After Releasing WordPress SEO 3.0</a></p>
<h2>Plugins Picked By Marcus:</h2>
<p><a href="https://wordpress.org/plugins/featured-image-reminder/">Featured Image Reminder</a> by <a href="http://www.aaronhockley.com/">Aaron Hockley</a> from Vancouver, WA, displays a reminder if you press the Publish button and forget to assign a featured image to the post.</p>
<p><a href="https://wordpress.org/plugins/soft79-cart-links-for-woocommerce/">Cart links for WooCommerce</a> by <a href="https://profiles.wordpress.org/josk79/">Soft79</a> allows store managers to create urls that redirect a customer to a pre-populated cart. This is useful for email campaigns and call to action buttons.</p>
<p><a href="https://wordpress.org/plugins/wavesurfer-wp/">WaveSurfer-WP</a> by <a href="https://profiles.wordpress.org/x-raym/">Raymond Radet</a> from France, replaces the default WordPress audio player with one that displays audio waveforms. It displays a mix of different audio channels for podcasts, radio, e-learning, and music or all channels simultaneously for audio tutorials, sound-packs, product demos, etc. which is its main purpose.</p>
<h2>WPWeekly Meta:</h2>
<p><strong>Next Episode:</strong> Wednesday, December 9th 9:30 P.M. Eastern</p>
<p><strong>Subscribe To WPWeekly Via Itunes: </strong><a href="https://itunes.apple.com/us/podcast/wordpress-weekly/id694849738" target="_blank">Click here to subscribe</a></p>
<p><strong>Subscribe To WPWeekly Via RSS: </strong><a href="http://www.wptavern.com/feed/podcast" target="_blank">Click here to subscribe</a></p>
<p><strong>Subscribe To WPWeekly Via Stitcher Radio: </strong><a href="http://www.stitcher.com/podcast/wordpress-weekly-podcast?refid=stpr" target="_blank">Click here to subscribe</a></p>
<p><strong>Listen To Episode #215:</strong><br />
</p>
<div id="epoch-width-sniffer"></div>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 03 Dec 2015 23:25:30 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Jeff Chandler";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:2;a:6:{s:4:"data";s:13:"
	
	
	
	
	
	
";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:19:"Matt: George Lakoff";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:21:"http://ma.tt/?p=45642";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:35:"http://ma.tt/2015/12/george-lakoff/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:583:"<p>George Lakoff is an academic whose books I came across in my college years, and he&#8217;s been very influential on me, especially his approach to language through metaphors. He has an updated version of a classic book, <a href="http://georgelakoff.com/about/the-all-new-dont-think-of-an-elephant_george-lakoff/">Don&#8217;t Think of an Elephant</a>, which is a great read if you&#8217;re interested in progressive politics. I noticed a link to a PDF to a WordPress-sounding address, and it <a href="http://georgelakoff.com/">turns out his entire site is on WordPress.com</a>!</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 03 Dec 2015 03:11:38 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:4:"Matt";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:3;a:6:{s:4:"data";s:13:"
	
	
	
	
	
	
";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:80:"WPTavern: Joost de Valk on the Lessons Learned After Releasing WordPress SEO 3.0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=49272";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:90:"http://wptavern.com/joost-de-valk-on-the-lessons-learned-after-releasing-wordpress-seo-3-0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:3844:"<p><a href="http://i0.wp.com/wptavern.com/wp-content/uploads/2015/12/WordPressSEOFeaturedImage.png" rel="attachment wp-att-49274"><img class="aligncenter size-full wp-image-49274" src="http://i0.wp.com/wptavern.com/wp-content/uploads/2015/12/WordPressSEOFeaturedImage.png?resize=839%2C271" alt="WordPress SEO Featured Image" /></a>Within the last few weeks, a number of readers have contacted us to look into the recent upgrade woes experienced by <a href="https://wordpress.org/plugins/wordpress-seo/">WordPress SEO</a> users. Since 3.0&#8217;s release on November 18th, the development team <a href="https://wordpress.org/plugins/wordpress-seo/changelog/">has released </a>six point releases.</p>
<p>Joost de Valk, founder of <a href="https://yoast.com/">Yoast.com</a>, and lead developer of WordPress SEO, <a href="https://yoast.com/yoast-seo-3-0-release-a-recap/">explains</a> the mistakes made with the release and apologizes for the lack of communication, &#8220;We’ve made mistakes, obviously. Of course, there were bugs, which we have worked hard on and are still working on right now. We’ve made mistakes in communication too. We’re sorry about that,&#8221; he said.</p>
<p><a href="https://wordpress.org/plugins/wordpress-seo/">WordPress SEO</a> is active on more than a million sites and the fallout from issues experienced by users upgrading to the 3.0 branch has resulted in <a href="https://wordpress.org/support/view/plugin-reviews/wordpress-seo?filter=1">many negative reviews</a>. Over time, the plugin has <a href="https://wordpress.org/support/topic/too-many-updates-instead-of-one-stable-release#post-">gained a reputation</a> of breaking with each upgrade.</p>
<h2>More Beta Testers Needed</h2>
<p>de Valk admits that when 3.0 was pushed out to the public, users would encounter bugs, but says it&#8217;s part of having a large variety of configurations across their install base, &#8220;There were a few bugs that I think we should’ve caught in our testing period which was extensive and we’re taking precautions to make sure we do next time,&#8221; he said.</p>
<p>Despite the <a href="https://yoast.com/dev-blog/road-to-yoast-seo-3-0/">roadmap to Yoast SEO 3.0</a> published in November, the amount of people who tested the releases was small compared to every day users. The team is asking for ideas on how to encourage more people to participate in the beta testing process.</p>
<h2>Communication Breakdown</h2>
<p>de Valk and his team of five actively responded to users on Twitter and email but didn&#8217;t immediately address users on Facebook which led to harsh criticism. Paying customers were prioritized while free users were told that they wouldn&#8217;t be supported over email.</p>
<p>de Valk admits it was probably the wrong course of action, &#8220;This was probably, in hindsight, not what we should’ve done. For future major releases we will try to actively support <em>everybody</em> for a period of time,&#8221; he said.</p>
<h2>It’s Difficult to Change a Reputation</h2>
<p>He also addresses the usability issues caused by changes to the user interface of the snippet editor, &#8220;We thought the interface was intuitive, we also thought people would watch that (30 second) video, but we were obviously wrong. We’re now thinking about how to improve the snippet editor so it’s more obvious <em>how</em> you are able to edit,&#8221; he said.</p>
<p>The issues experienced by people upgrading WordPress SEO is a good example as to why automatically updating plugins is a bad idea. While the team continues to work hard to fix issues in the 3.0 branch, it&#8217;s going to take a number of excellent releases to erode the negative reputation that WordPress SEO upgrades will either break functionality or the site that&#8217;s using it.</p>
<div id="epoch-width-sniffer"></div>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 02 Dec 2015 23:29:36 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Jeff Chandler";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:4;a:6:{s:4:"data";s:13:"
	
	
	
	
	
	
";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:83:"WPTavern: Freemius Insights Enables Plugin Developers to Make Data-Driven Decisions";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=49239";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:93:"http://wptavern.com/freemius-insights-enables-plugin-developers-to-make-data-driven-decisions";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:10614:"<p>The WordPress plugin directory gives authors a set of statistics but many are left wanting more. <a href="http://freemius.com/wordpress/insights/">Freemius Insights,</a> is a new service founded by <a href="https://twitter.com/vovafeldman">Vova Feldman</a>, that allows authors to accumulate detailed statistics from users.</p>
<p>Feldman and his team of four, created the service after speaking to more than 100 plugin developers and realizing there&#8217;s a huge gap between what WordPress authors have in terms of data, compared to what web and mobile products have in the market.</p>
<h2>Up Front Opt-in</h2>
<p>According to the WordPress <a href="https://wordpress.org/plugins/about/guidelines/">plugin directory guidelines</a>, plugins are not allowed to phone home. That is, secretly send data without the user&#8217;s consent. Freemius Insights provides an opt-in form that displays immediately after activating a plugin. If a user skips this step, data won&#8217;t be sent to the author and the user is forwarded to the plugin&#8217;s settings screen.</p>
<a href="http://i1.wp.com/wptavern.com/wp-content/uploads/2015/12/FreemiusInsightsopt-in.png" rel="attachment wp-att-49240"><img class="size-full wp-image-49240" src="http://i1.wp.com/wptavern.com/wp-content/uploads/2015/12/FreemiusInsightsopt-in.png?resize=1025%2C769" alt="Freemius Insights Ope-in" /></a>Freemius Insights Opt-in
<p>The opt-in form is compatible with the plugin directory&#8217;s guidelines and is an easy way to be <a href="http://wptavern.com/wordpress-plugin-authors-be-up-front-and-honest-with-users-about-tracking">up front and honest</a> with users that data is sent to a third-party.</p>
<h2>Data Collected by Freemius Insights</h2>
<p>If a user clicks the allow and continue button in the opt-in form, the following data is collected by Freemius Insights.</p>
<ul>
<li>Active Sites</li>
<li>Users</li>
<li>How many users are connected to Freemius</li>
<li>How many users deactivated the plugin</li>
<li>How many users uninstalled the plugin</li>
<li>Plugin versions</li>
<li>WordPress versions</li>
<li>PHP versions</li>
<li>Reasons for uninstalling</li>
<li>Top 10 languages</li>
</ul>
<p>Developers can use the Insights dashboard to see compiled data at a glance.</p>
<a href="http://i0.wp.com/wptavern.com/wp-content/uploads/2015/12/FreemiusInsightsstats.png" rel="attachment wp-att-49241"><img class="size-full wp-image-49241" src="http://i0.wp.com/wptavern.com/wp-content/uploads/2015/12/FreemiusInsightsstats.png?resize=1025%2C742" alt="Freemium Insights Stats Dashboard" /></a>Freemium Insights Stats Dashboard
<p>This type of information helps developers make critical decisions such as what new features to work on, backwards compatibility, what translations to focus on, and more.</p>
<h2>See Which Sites Are Using Your Plugins</h2>
<p>In addition to these stats, developers can see which domains the plugin is activated on. Knowing the sites a plugin is activated on is valuable data. For example, if a plugin is used on Microsoft.com, the developer can leverage that information to possibly establish a one to one relationship. <span class="_5yl5">Developers can also create up sells to those specific sites.</span></p>
<a href="http://i2.wp.com/wptavern.com/wp-content/uploads/2015/12/FreemiumInsightssites.png" rel="attachment wp-att-49242"><img class="size-full wp-image-49242" src="http://i2.wp.com/wptavern.com/wp-content/uploads/2015/12/FreemiumInsightssites.png?resize=1025%2C709" alt="Sites the Plugin is Activated On" /></a>Sites the Plugin is Activated On
<p><span class="_5yl5">Freemius Insights also uses this data to automatically send an email if a user uninstalls the plugin within the first hour after installation. The email template is personalized with the user&#8217;s name and site address. It asks for feedback on how the plugin can be improved or why it didn&#8217;t meet their needs.<br />
</span></p>
<p>Developers can even dive deep into a site&#8217;s activity and view recent events associated with their plugin such as updates, installs, activation, and who initiated the action. You can see the site&#8217;s language, PHP version, and a variety of other data.</p>
<a href="http://i0.wp.com/wptavern.com/wp-content/uploads/2015/12/FreemiusInsightssite.png" rel="attachment wp-att-49243"><img class="size-full wp-image-49243" src="http://i0.wp.com/wptavern.com/wp-content/uploads/2015/12/FreemiusInsightssite.png?resize=1025%2C917" alt="Detailed Site View" /></a>Detailed Site View
<p>If you want to know the names of the people who opted in, you can see that too. Since Freemius Insights collects a user&#8217;s email address, developers can interact with users on an individual level instead of broadcasting emails.</p>
<a href="http://i0.wp.com/wptavern.com/wp-content/uploads/2015/12/FreemiusInsightsusers.png" rel="attachment wp-att-49244"><img class="size-full wp-image-49244" src="http://i0.wp.com/wptavern.com/wp-content/uploads/2015/12/FreemiusInsightsusers.png?resize=1025%2C709" alt="See Who Opted In" /></a>See Who Opted In
<h2>Receiving Feedback at a Critical Time</h2>
<p>One of the most annoying things plugin developers face are one star reviews with no explanation behind the review. Based on data collected during the beta testing process, Feldman discovered that more than 20% of the users who install a plugin will uninstall it within the first 15 minutes.</p>
<p>Freemius Insights has a Deactivation Feedback Form. This form appears when a user deactivates the plugin and gives users an opportunity to explain why they deactivated it.</p>
<a href="http://i2.wp.com/wptavern.com/wp-content/uploads/2015/12/FreemiumInsightsdeactivation-form.png" rel="attachment wp-att-49245"><img class="size-full wp-image-49245" src="http://i2.wp.com/wptavern.com/wp-content/uploads/2015/12/FreemiumInsightsdeactivation-form.png?resize=1025%2C759" alt="Deactivation Form" /></a>Deactivation Form
<p>This could be annoying if you&#8217;re deactivating a plugin to troubleshoot WordPress but Feldman explains why the form is tied to the deactivation procedure, &#8220;O<span class="_5yl5">nce the user deactivates the plugin, the plugin can&#8217;t modify anything in the dashboard.</span></p>
<p><span class="_5yl5">The data is not sent until the plugin is deleted. If the user provides feedback, it&#8217;s stored locally in the database. When a user proceeds with the deletion process, it fires the uninstall hook and sends the data to the server,&#8221; he said.<br />
</span></p>
<h2>Reasons Why Users Uninstall a Plugin</h2>
<p>In general, people <a href="https://en.wikipedia.org/wiki/Negativity_bias">give negative</a> feedback more than positive. During the beta testing period, Freemius Insights witnessed more than a 82% conversion rate with the feedback form. This data is invaluable to developers and can be viewed on the Insights dashboard.</p>
<a href="http://i0.wp.com/wptavern.com/wp-content/uploads/2015/12/FreemiumInsightsDetailedStats.png" rel="attachment wp-att-49247"><img class="size-full wp-image-49247" src="http://i0.wp.com/wptavern.com/wp-content/uploads/2015/12/FreemiumInsightsDetailedStats.png?resize=385%2C197" alt="Reasons Why Users Deactivated The Plugin" /></a>Reasons Why Users Deactivated The Plugin
<p>Although Other is not helpful in this chart, it&#8217;s valuable because it represents how many users chose to provide custom feedback. It reinforces the fact that users are more than willing to tell developers what&#8217;s wrong if given the opportunity. Developers can also filter sites by Uninstalls to get a deeper understanding as to why a specific user uninstalled the plugin.</p>
<h2>Webhooks for Developers</h2>
<p>Freemius Insights has a webhooks mechanism built-in that enables developers to forward events to another location. For example, when a user installs a plugin, the developer can push the user&#8217;s email address into MailChimp. Another example is when a user upgrades a plugin, you can send them an email that lists new features in that version.</p>
<h2>Free and Paid Subscription Plans</h2>
<p>Freemius Insights has a free plan available to developers of free plugins. The free plan includes an unlimited amount of team members and captured users, but no email export. Paid plans start at $29.99 a month up to $299.99 a month depending on your install base.</p>
<a href="http://i1.wp.com/wptavern.com/wp-content/uploads/2015/12/FreemiusInsightsPricingChart.png" rel="attachment wp-att-49253"><img class="size-full wp-image-49253" src="http://i1.wp.com/wptavern.com/wp-content/uploads/2015/12/FreemiusInsightsPricingChart.png?resize=1025%2C636" alt="Freemium Insights Pricing Chart" /></a>Freemium Insights Pricing Chart
<p>If you&#8217;re interested in connecting your plugin to Freemius Insights, you&#8217;ll need to request a <a href="http://freemius.com/wordpress/insights/#demo_form">hands-on demo</a> with the team. Feldman explains the benefits of a hands-on approach:</p>
<ul>
<li>We want to be in control of our scale. Analytics requires a significant amount of storage and performance. If one of the most popular plugins joins the service without a heads up, it might drain our server&#8217;s resources and affect the performance of the rest of our users.</li>
<li>FTUE (first-time user experience) is crucial for every service. Signing into an empty dashboard might make the wrong impression, and we know the first impression is critical. Therefore, we prefer to demo the platform by showing real data from our plugin.</li>
<li>We believe the personal touch is more than a cliché. We are willing to spend time getting to know each developer we work with, building a personal relationship, and making sure every integration is a success story. We also love to learn new things, and user feedback is extremely valuable to us.</li>
</ul>
<p>Feldman says Insights is for plugin developers who want to make data driven decisions, &#8220;Freemius Insights provides ad-hoc data so developers don&#8217;t have to base decisions on gut instinct.&#8221;</p>
<h2>Out of Beta</h2>
<p>Freemius Insights is out of beta and today marks the first opportunity the public has to see Insights in action. I&#8217;ve only scratched the surface of <a href="http://freemius.com/wordpress/insights/#faq">what&#8217;s possible</a> and how developers can leverage the data collected by the service. Again, if you&#8217;re interested in using Freemius Insights, <a href="http://freemius.com/wordpress/insights/#demo_form">schedule a demo</a> with the team as spots will fill up quickly.</p>
<div id="epoch-width-sniffer"></div>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 02 Dec 2015 14:05:47 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Jeff Chandler";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:5;a:6:{s:4:"data";s:13:"
	
	
	
	
	
	
";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:29:"Matt: Joule Sous Vide Machine";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:21:"http://ma.tt/?p=45647";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:45:"http://ma.tt/2015/12/joule-sous-vide-machine/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:561:"<p>&nbsp;</p>
<p><img class="alignnone size-full wp-image-45682" src="http://i1.wp.com/ma.tt/files/2015/12/kitchen-essential-1.jpg?resize=604%2C340" alt="kitchen-essential (1)" /></p>
<p>On Eater <a href="http://www.eater.com/2015/11/24/9788798/chefsteps-sous-vide-gabe-newell-immersion-circulator">check out the story of how a video game mogul, an airplane engineer, a scientist, a designer, and a bunch of chefs developed a new immersion circulator they named Joule</a>. I&#8217;m a big fan of the <a href="https://www.chefsteps.com/">Chefsteps</a> team.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Tue, 01 Dec 2015 18:10:45 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:4:"Matt";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:6;a:6:{s:4:"data";s:13:"
	
	
	
	
	
	
";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:66:"WPTavern: Matt Mullenweg Joins the Gillmor Gang to Discuss Calypso";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=49150";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:76:"http://wptavern.com/matt-mullenweg-joins-the-gillmor-gang-to-discuss-calypso";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:2326:"<p><a href="http://i1.wp.com/wptavern.com/wp-content/uploads/2015/11/gillmor-gang.png" rel="attachment wp-att-49223"><img src="http://i1.wp.com/wptavern.com/wp-content/uploads/2015/11/gillmor-gang.png?resize=900%2C444" alt="gillmor-gang" class="aligncenter size-full wp-image-49223" /></a></p>
<p>Last week Matt Mullenweg, CEO of <a href="https://automattic.com/" target="_blank">Automattic</a> and co-creator of WordPress, joined Robert Scoble, John Borthwick, and Steve Gillmor to discuss Calypso on <a href="http://techcrunch.com/2015/11/28/gillmor-gang-more-gravy/" target="_blank">an episode of the Gillmor Gang</a>. The video was recorded Tuesday, November 24 and published over the weekend.</p>
<p>Mullenweg offers a hands-on tour of the new reader, notifications, and editor and explains WordPress.com&#8217;s new architecture for audience members who are not development-oriented. He also explains how the desktop client and browser version were developed simultaneously so that WordPress.com can continue to iterate just as quickly as it has in the past, with developers committing new code 140+ times per day.</p>
<p>If you can&#8217;t get enough of WordPress vs. Medium comparisons, then this episode is for you. When asked if he sees Medium as a competitor to WordPress, Mullenweg replied, &#8220;In some ways we compete with every place that people publish online, even Twitter or Facebook, but in day to day, that competition doesn&#8217;t really drive product decisions and for most people what we provide is pretty distinct from what these other platforms have.&#8221;</p>
<p>Later in the episode Mullenweg is asked, &#8220;What are the holes still left unfilled in publishing?&#8221;</p>
<p>&#8220;Publishing is still so mediocre,&#8221; he replied. &#8220;Some of the best stuff Medium did is around their editor. I think the whole writing/collaboration experience can be significantly better than it is today.&#8221;</p>
<p>Mullenweg elaborates on the differences between WordPress.com and Medium&#8217;s user base and his vision for where Automattic will take Calypso in the future. Unfortunately, we can&#8217;t embed the episode here, but you can <a href="http://techcrunch.com/2015/11/28/gillmor-gang-more-gravy/" target="_blank">check it out on TechCrunch</a>.</p>
<div id="epoch-width-sniffer"></div>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 30 Nov 2015 22:28:19 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Sarah Gooding";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:7;a:6:{s:4:"data";s:13:"
	
	
	
	
	
	
";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:91:"WPTavern: State of the Word Idea: Remembering Those We’ve Lost in the WordPress Community";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=49212";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:97:"http://wptavern.com/state-of-the-word-idea-remembering-those-weve-lost-in-the-wordpress-community";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:3074:"<p><a href="http://i0.wp.com/wptavern.com/wp-content/uploads/2015/11/IdeaLightbulbFeaturedImage.png" rel="attachment wp-att-49216"><img class="size-full wp-image-49216" src="http://i0.wp.com/wptavern.com/wp-content/uploads/2015/11/IdeaLightbulbFeaturedImage.png?resize=696%2C306" alt="Idea Lightbulb Featured Image" /></a>photo credit: <a href="http://www.flickr.com/photos/7537092@N07/4318850016">[17:38] idee?</a> &#8211; <a href="https://creativecommons.org/licenses/by-nc-nd/2.0/">(license)</a>Later this week, nearly 2,000 people will be in Philadelphia, PA to attend <a href="https://2015.us.wordcamp.org/">WordCamp US</a>, the annual conference devoted to WordPress. One of the event&#8217;s highlights is Matt Mullenweg&#8217;s State of the Word presentation. In it, Mullenweg shares data on WordPress&#8217; growth throughout the year and gives insight to where the project is heading.</p>
<p>About a week before his presentation, Mullenweg asks members of the WordPress community for feedback. Questions include:</p>
<ol>
<li>What are the things you&#8217;re most proud of WordPress or people in the community doing over the past year?</li>
<li>Have there been people who you feel have influenced the project in a big way, including yourself, and how?</li>
<li>What do you think we should focus on and work on the most in the next year?</li>
<li>Any stories you&#8217;ve heard with or around WordPress that you think deserve being highlighted?</li>
<li>Anything else?</li>
</ol>
<p>This year, the most important question he asks is number five. Each year during the State of the Word, Mullenweg highlights new and existing contributors and we as a community cheer and celebrate them. This year, we&#8217;ve lost some incredibly talented and important people in the community.</p>
<p>I suggest that Mullenweg adds one slide to his presentation that remembers the lives of those lost in the community this year. The slide should have Gravatars or photos and the names of those who passed away. Here are a few people who would be on the slide.</p>
<ul>
<li><a href="http://wptavern.com/kim-parsell-affectionately-known-as-wpmom-passes-away">Kim Parsell</a></li>
<li><a href="http://wptavern.com/alex-king-founder-of-crowd-favorite-passes-away">Alex King</a></li>
<li><a href="https://mattreport.com/honoring-clint-warren/">Clint Warren</a></li>
<li><a href="https://twitter.com/wordcampmiami/status/561953493360336896">Jacqueline Jiminez</a></li>
</ul>
<p>If you&#8217;re in favor of this idea and know someone in the WordPress community who passed away this year, please leave a comment with their name and if possible, a link to their obituary.</p>
<p>WordPress is a 12-year-old open source software project that will likely survive long after the people who help maintain it pass on. Adding a slide to the State of the Word that remembers contributors who passed away during the year is a small price to pay. It also humanizes the software and serves as a reminder that without contributors, WordPress wouldn&#8217;t exist.</p>
<div id="epoch-width-sniffer"></div>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 30 Nov 2015 20:22:55 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Jeff Chandler";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:8;a:6:{s:4:"data";s:13:"
	
	
	
	
	
	
";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:82:"WPTavern: Early Reviews Show Applications Like Calypso Are the Future of WordPress";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=49161";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:92:"http://wptavern.com/early-reviews-show-applications-like-calypso-are-the-future-of-wordpress";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:6086:"<p><a href="http://i2.wp.com/wptavern.com/wp-content/uploads/2015/11/calypso.png" rel="attachment wp-att-49205"><img src="http://i2.wp.com/wptavern.com/wp-content/uploads/2015/11/calypso.png?resize=900%2C475" alt="calypso" class="aligncenter size-full wp-image-49205" /></a></p>
<p>Last week <a href="http://wptavern.com/automattic-unveils-open-source-wordpress-desktop-application-for-the-mac" target="_blank">Automattic unveiled Project Calypso</a>, a brand new architecture for WordPress.com and a <a href="https://desktop.wordpress.com/" target="_blank">Mac app</a> that mirrors the experience on desktop. The overhaul was nearly two years in the making, a risky bet for Automattic but one that shows a glimpse of what the future of WordPress could be.</p>
<p>The new JavaScript and REST API-powered WordPress.com technologically pivots the platform into a lithe modern publishing engine while shedding 10 years of legacy code in the process. It&#8217;s easy to see why Calypso has so far received <a href="http://ma.tt/2015/11/calypso-24-hours-later/" target="_blank">glowing reviews</a> from news outlets around the web. The <a href="https://developer.files.wordpress.com/2015/11/whats-new-wpcom2.pdf" target="_blank">giant technological leap forward</a> results in a publishing experience that is a night-and-day difference when it comes to page loads, content previewing, and real-time updating.</p>
<p>In an <a href="http://venturebeat.com/2015/11/24/wordpress-creator-matt-mullenweg-breaks-down-the-blogging-platforms-biggest-overhaul-in-years/" target="_blank">interview with VentureBeat</a>, Matt Mullenweg answers a burning question that the community wants to know &#8211; <em>What does Calypso mean for WordPress core?</em> Will core adopt a similar technology stack? Mullenweg sees Calypso as just one example of what is possible with WordPress.</p>
<blockquote><p>So I think what might happen is that the technology that drives the server side of WordPress and what drives the client side can diverge. Again, this is really up to the community, so we’ll see where it takes us. This thing we released has only been out there one day. Maybe someone will make something much better?</p></blockquote>
<p>WordPress.com&#8217;s new architecture isn&#8217;t the first case of &#8220;headless WordPress,&#8221; though it is one of the most prominent and easiest examples for users to demo. Many other WordPress-powered sites have already adopted an approach that decouples the interface using the new WP REST API. Apps like <a href="https://storycorps.me/" target="_blank">StoryCorps</a>, <a href="http://nomadbase.io/" target="_blank">Nomadbase</a>, the New York Times, and the <a href="http://www.wired.com/2015/09/apple-liveblog-iphone-apple-tv-news/" target="_blank">Wired.com liveblog</a> are a few early pioneers using the API to deliver content.</p>
<p>Another example offered in the <a href="https://developer.wordpress.com/2015/11/23/the-story-behind-the-new-wordpress-com/#comment-7275" target="_blank">comments</a> on the WordPress.com developer blog cites <a href="https://ustwo.com/" target="_blank">ustwo.com</a> (the makers of Monument Valley, Dice, and other popular apps) as using a similar setup. The site is a <a href="https://facebook.github.io/react/" target="_blank">React.js</a> single-page application that serves WordPress content via the WP REST API using custom endpoints. Like WordPress.com, the code for this site is also <a href="https://github.com/ustwo/ustwo.com-frontend" target="_blank">open source on GitHub</a>.</p>
<p>Despite the risk of sharing the large innovative codebase with competitors, Automattic opted to keep Calypso open and available for anyone in the WordPress community to learn from and build upon.</p>
<p>&#8220;A lot of people thought we should keep this proprietary, but throughout my life I’ve learned that the more you give away, the more you get back,&#8221; Mullenweg said in his <a href="http://ma.tt/2015/11/dance-to-calypso/" target="_blank">announcement</a>.</p>
<p>Within the first 24 hours the <a href="https://github.com/Automattic/wp-calypso" target="_blank">repo</a> was already <a href="https://github.com/trending" target="_blank">trending on GitHub</a>, with developers eagerly reviewing the code. ManageWP, a competitor to Jetpack Manage, <a href="https://managewp.com/will-calypso-change-game" target="_blank">praised Calypso</a> as an important tool to help drive up WordPress marketshare and move the platform forward:</p>
<blockquote><p>That’s the beauty of WordPress – the Foundation is not looking to put us under Automattic’s thumb; Matt and his team are actively encouraging the WordPress community, through open source policy, to keep building, innovating, making lives easier for everyone, and find their own place in the ecosystem.</p></blockquote>
<p>Automattic&#8217;s commitment to open sourcing its code demonstrates that any innovations they release are not designed to eclipse competitors&#8217; efforts but rather to add to the shared knowledge bank that drives WordPress improvements.</p>
<p>Mullenweg, in a <a href="http://ma.tt/2015/11/calypso-24-hours-later/" target="_blank">roundup of press on Calypso</a>, brings it back to the core value of democratizing publishing.</p>
<p>&#8220;At the end of the day, it’s not about technology for technology’s sake, it’s about technology at the service of human voices,&#8221; he said. &#8220;Embracing change to support the free, open web where everyone has a voice.&#8221;</p>
<p>Calypso is one of the best new examples of having WordPress your way. It demonstrates the flexibility of using a REST API to run any kind of JavaScript application on top of WordPress while maintaining the use of its world class CMS features. Greater architectural freedom for developers means more compelling publishing experiences for users. The success of the open source Calypso project will likely pave the way for many more JavaScript and REST API-powered WordPress sites and desktop applications.</p>
<div id="epoch-width-sniffer"></div>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 30 Nov 2015 19:29:00 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Sarah Gooding";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:9;a:6:{s:4:"data";s:13:"
	
	
	
	
	
	
";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:103:"WPTavern: New WordPress Plugin Replaces Hello Dolly Lyrics With Random Quotes From Star Wars Characters";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=49194";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:113:"http://wptavern.com/new-wordpress-plugin-replaces-hello-dolly-lyrics-with-random-quotes-from-star-wars-characters";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:1848:"<p>On <a href="http://www.imdb.com/title/tt2488496/releaseinfo">December 18th</a>, fans across the U.S. will flock to movie theaters to watch <a href="http://www.imdb.com/title/tt2488496/">Star Wars: The Force Awakens</a>. If you&#8217;d like to get your site in the spirit of the movie, check out <a href="https://wordpress.org/plugins/the-force/">The Force</a>, a new plugin created by <a href="https://profiles.wordpress.org/rohittm/">Rohit Motwani</a> who lives in India.</p>
<p>The Force replaces lyrics from the Hello Dolly plugin with random quotes from Star Wars characters. Quotes include:</p>
<ul>
<li>I find your lack of faith disturbing.</li>
<li>Don&#8217;t Underestimate the power of The Dark Side.</li>
<li>Hmm! Adventure. Hmmpf! Excitement. A Jedi craves not these things.</li>
<li>Hey R2 , What do you think?</li>
<li>Peeeeee poooo peeee peeee peee pooooo tuiiiiiiiiii.</li>
<li>Good Relations with Wookies I have.</li>
</ul>
<p id="force">My favorite quote is from Chewbacca, &#8220;AAAAAAAhhhhhhhhhhhhh AAAAAAAAhhhhhhhhhhhhhhhhh.&#8221;</p>
<a href="http://i1.wp.com/wptavern.com/wp-content/uploads/2015/11/ChewbaccaQuote.png" rel="attachment wp-att-49197"><img class="size-full wp-image-49197" src="http://i1.wp.com/wptavern.com/wp-content/uploads/2015/11/ChewbaccaQuote.png?resize=544%2C152" alt="Quote from Chewbacca " /></a>Quote from Chewbacca
<p>I discovered typos in some of the quotes but Motwani is already in the process of fixing them. The Force works as expected in WordPress 4.4 and is <a href="https://wordpress.org/plugins/the-force/">available for free</a> from the WordPress plugin directory. Last but not least, I hear that Wookies are <a href="http://www.amazon.com/s/ref=nb_sb_noss_2?url=search-alias%3Dtoys-and-games&field-keywords=wookie">great Christmas gifts</a>.</p>
<div id="epoch-width-sniffer"></div>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 30 Nov 2015 18:45:10 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Jeff Chandler";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:10;a:6:{s:4:"data";s:13:"
	
	
	
	
	
	
";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:18:"Matt: Two Podcasts";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:21:"http://ma.tt/?p=45673";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:34:"http://ma.tt/2015/11/two-podcasts/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:616:"<p>Last week I did two podcasts around the Calypso news that are both now up, and show very different sides of the announcement. The first was <a href="https://poststatus.com/interviews-matt-mullenweg/">with Brian Krogsgard of the WordPress-focused site Post Status</a> and we talked a lot about the Calypso launch in the context of the WordPress community. The second was the <a href="http://techcrunch.com/2015/11/28/gillmor-gang-more-gravy/">always-fun video group the Gillmor Gang</a> which ranged quite a bit but mostly focused on Calypso in the context of the wider tech world and where we&#8217;re going.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 30 Nov 2015 18:15:11 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:4:"Matt";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:11;a:6:{s:4:"data";s:13:"
	
	
	
	
	
	
";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:103:"WPTavern: WPWeekly Episode 214 – Chris Lema on WordPress in the Enterprise, Market Share, and Calypso";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=49160";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:107:"http://wptavern.com/wpweekly-episode-214-chris-lema-on-wordpress-in-the-enterprise-market-share-and-calypso";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:4449:"<p>In this episode of WordPress Weekly, <a href="http://marcuscouch.com/">Marcus Couch</a> and I are joined by <a href="http://chrislema.com/">Chris Lema</a> to discuss WordPress in the enterprise, the on boarding experience, and Calypso. Lema shares his experience beta testing a Windows version of Automattic&#8217;s new desktop application. We discuss how WordPress is going to grow its market share from 25% to 50% and how important Jetpack is to reaching that goal. Near the end of the interview, Lema shares what he&#8217;s most thankful for as it relates to WordPress.</p>
<h2>Stories Discussed:</h2>
<p><a href="http://wptavern.com/automattic-unveils-open-source-wordpress-desktop-application-for-the-mac">Automattic Unveils Open Source WordPress.com Desktop Application for the Mac</a></p>
<h2>Plugins Picked By Marcus:</h2>
<p><a href="https://wordpress.org/plugins/wp-tao/">WP TAO</a> by Michal Jaworski and Damian Gora from Poland, is a free powerful WordPress plugin for tracking website visitors. It allows you to identify your users and keep track of their activities in an easy to read digital dashboard and log format.</p>
<p><a href="https://wordpress.org/plugins/cool-timeline/">Cool Timeline</a> is Narinder Singh&#8217;s first plugin in the repository. It creates responsive, vertical story lines in chronological order based on the year and date of your posts.</p>
<p><a href="https://wordpress.org/plugins/the-force/">The Force</a> created by Rohit Motwani from India, is a Hello Dolly clone that when activated, replaces music lyrics with random quotes from Star Wars characters.</p>
<h2>What I&#8217;m Thankful For:</h2>
<p>This has been a rough year for me. I’m struggling with my health and maintaining a schedule as a distributed worker. A dear WordPress friend of mine (Kim Parsell) passed away at the beginning of the year. My grandma was recently diagnosed with lung cancer and I’ve been dealing with wild swings between feeling positive and downright depressed.</p>
<p>The thing I’m most thankful for this year as it relates to WordPress are the people who make up the community. Some are personal friends, others live on the other side of the world. Their consistent reinforcement of positive vibes has helped me get through some turbulent times in my life this year. To everyone who has and continues to give me encouragement, advice, and positive reinforcement, thank you.</p>
<h2>What Marcus is Thankful For:</h2>
<p>This year was one of the hardest years for me in terms of professional struggles and hardships. I lost relatives and friends, a job, and had to start from square one. I had a lot of support from within the WordPress community coming really close to working with a few people directly. In the end, it was my WordPress skills that landed me a new gig, which I now call <em>The Dream Gig</em>.</p>
<p>I’m thankful for the opportunities to meet people from within the WordPress community in real life. From Chris Lema and Cory Miller to Jeff Chandler and beyond. Every time I meet someone, they not only share their successes, but their struggles. It’s good to know that I’m not the only one and be able to use their strength and perseverance to fuel my drive and passion for WordPress.</p>
<p>I’m thankful for the opportunity to share what I know to thousands of people around the world. I feel the best sense of accomplishment when I receive an email from someone that&#8217;s stuck on a particular problem and discovers a solution after they hear me talk about a plugin or technique on a podcast. It’s a great outlet for me personally that I hope to continue for many more years to come. Thanks to all who are listening and to those who are listening for the first time.</p>
<h2>WPWeekly Meta:</h2>
<p><strong>Next Episode:</strong> Wednesday, December 2nd 9:30 P.M. Eastern</p>
<p><strong>Subscribe To WPWeekly Via Itunes: </strong><a href="https://itunes.apple.com/us/podcast/wordpress-weekly/id694849738" target="_blank">Click here to subscribe</a></p>
<p><strong>Subscribe To WPWeekly Via RSS: </strong><a href="http://www.wptavern.com/feed/podcast" target="_blank">Click here to subscribe</a></p>
<p><strong>Subscribe To WPWeekly Via Stitcher Radio: </strong><a href="http://www.stitcher.com/podcast/wordpress-weekly-podcast?refid=stpr" target="_blank">Click here to subscribe</a></p>
<p><strong>Listen To Episode #214:</strong><br />
</p>
<div id="epoch-width-sniffer"></div>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 30 Nov 2015 16:05:20 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Jeff Chandler";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:12;a:6:{s:4:"data";s:13:"
	
	
	
	
	
	
";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:30:"Matt: Dan Gilbert on Happiness";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:21:"http://ma.tt/?p=45670";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:46:"http://ma.tt/2015/11/dan-gilbert-on-happiness/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:200:"<p></p>
<p>This is an oldie but a goodie, <a href="https://www.ted.com/talks/dan_gilbert_asks_why_are_we_happy?language=en">Dan Gilbert&#8217;s TED talk on the Surprising Science of Happiness</a>.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 30 Nov 2015 06:10:59 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:4:"Matt";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:13;a:6:{s:4:"data";s:13:"
	
	
	
	
	
	
";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:79:"Post Status: Interview with Automattic CEO, Matt Mullenweg, on Calypso and more";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:31:"https://poststatus.com/?p=15012";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:49:"https://poststatus.com/interviews-matt-mullenweg/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:18644:"<p>I had the opportunity to interview Matt Mullenweg about an ambitious project that included more than a year and a half of development to create an all new WordPress.com interface, both for the web and a desktop app. The project was codenamed Calypso, and we talked about many aspects of Calypso, as well as a variety of subjects that relate to it.</p>
<!--[if lt IE 9]><script>document.createElement(\'audio\');</script><![endif]-->
<a href="https://audio.simplecast.fm/21252.mp3">https://audio.simplecast.fm/21252.mp3</a>
<p><a href="https://audio.simplecast.fm/21252.mp3">Direct Download</a></p>
<p>You can subscribe (and you should!) to the <a href="https://poststatus.com/category/draft/">Post Status Draft</a> Podcast <a href="https://itunes.apple.com/us/podcast/post-status-draft-wordpress/id976403008">on iTunes</a>, <a href="http://www.stitcher.com/podcast/krogsgard/post-status-draft-wordpress-podcast">Stitcher</a> or <a href="http://simplecast.fm/podcasts/1061/rss">via RSS</a>. If you like the show, I&#8217;d highly appreciate if you share it with your friends and colleagues.</p>
<h3>Why did you make such a big bet on Calypso?</h3>
<p>Matt has talked for a while now about his vision that WordPress can become an &#8220;app platform,&#8221; and this is an example of what that meant to him.</p>
<p>He also notes how he&#8217;s always  looking for things that will &#8220;move the needle&#8221; for greater WordPress adoption. We were both thinking about the same statistic: that <a href="https://poststatus.com/2013-state-of-the-word-from-matt-mullenweg/">roughly 96% of WordPress.com users</a> (and probably a high number of WordPress.org users too) essentially abandon their websites after a short tenure. So anything that can increase that number, to say 8% or 15% of folks that stick with it long term, can make a huge difference.</p>
<h3>How do you think about investing in feature development for WordPress.com, and how it affects WordPress as well?</h3>
<p>When Matt considers where he wants to invest Automattic developer and designer time, he says he thinks of WordPress as a whole first, before considering specifics for WordPress.com. He&#8217;d rather see WordPress.com as a gateway to a self-hosted install. And whether someone stays on .com or moves to a self-hosted install, he wants to help ensure that their problems are solved.</p>
<h3>WordPresses</h3>
<p>It&#8217;s new to me, but Matt says he&#8217;s been saying it for years, that he calls WordPress websites &#8220;WordPresses,&#8221; after a long time internal debate about whether to call WordPress.com websites sites or blogs.</p>
<h3>WordPress.com as a network versus a platform</h3>
<p>The new homepage for logged in users, or users in the WordPress.com app, defaults to the Reader view of the interface, versus the writing view. This intrigued me, as I don&#8217;t personally think of WordPress.com as a read-first ecosystem, but rather a place to write. I think more of Tumblr or Medium when I think of a destination for reading, where I may also write.</p>
<p>Matt and I talked about the merits of WordPress as a network versus a platform. He thinks it can be both. And I think this touches on one of the big goals for Calypso that we haven&#8217;t discussed yet: to make WordPress a better network.</p>
<p>To me, WordPress.com is a platform, but WordPress (both .com and Jetpack enabled sites) are ripe to be a hugely successful network, through the huge number of websites and independent publishers that are interconnected via WordPress.com.</p>
<p>There is more evidence that this is a goal for them too, with the <a href="https://discover.wordpress.com/2015/11/23/hello-world/">launch of Discover WordPress</a> along with the release of the new interface. Discover WordPress is a project by the editorial team to surface the best writing across WordPress.com and Jetpack enabled websites.</p>
<p>Furthermore, beyond the human curated content, much could be done in the future algorithmically. We didn&#8217;t get as much into this stuff as I would&#8217;ve liked, but I think it&#8217;s  an enormous growth area for Automattic.</p>
<h3>Open sourcing Calypso</h3>
<p>The Calypso <a href="https://github.com/Automattic/wp-calypso">project code</a> is fully open source, and is a top trending project on Github right now. There are few requirements to run the code locally, so you can pretty quickly get a working web view.</p>
<p>There are a slew of <a href="https://github.com/Automattic/wp-calypso/tree/master/client/components">fancy React components</a> that could be pretty easily lifted from Calypso and used independently, as well as a <a href="https://github.com/Automattic/wp-calypso/blob/master/docs/guide/hello-world.md">guide to getting started</a> with the full codebase.</p>
<h3>How can the community anticipate the future, with more abstracted implementations of WordPress?</h3>
<p>As WordPress projects continue to use REST APIs to create fully custom frontends, backends, and inbetweens, I was curious what Matt thinks the community can do to anticipate and educate users on how to deal with these scenarios, that may fragment WordPress and be confusing for people who expect WordPress plugins and code to interact well with one another.</p>
<p>He doesn&#8217;t think it&#8217;s too much of a problem, but says it&#8217;s important that we experiment and learn from our experiments; he was hesitant to call the potential for confusion fragmentation as much as experimentation. Either way, I do think education and documentation will be important as other folks continue to use parts of WordPress to make impressive things, without supporting every specific thing that can <em>also</em> run on WordPress.</p>
<p>An example of this is the WordPress.com app itself. You can manage Jetpack enabled sites through it, but that doesn&#8217;t mean you get everything in the editor you&#8217;d get with a WordPress.org site, like custom fields and other plugin functionality that the desktop app doesn&#8217;t support.</p>
<h3>What is Automattic&#8217;s differentiating factor?</h3>
<p>I wanted to know what Automattic&#8217;s differentiating factor is, in Matt&#8217;s mind. He defaulted, I guess unsurprisingly, to &#8220;everything,&#8221; but as I pushed him a little further, he dug a bit more into some of the things that make Automattic interesting.</p>
<p>From a self-hosted perspective, WordPress.com integrated tools like Stats, VaultPress, and Akismet are difficult to match with other tools.</p>
<p>For WordPress.com, he thinks the potential power of the Reader and network can be compelling. I agree there that the diversity of the WordPress.com and Jetpack author audience could make for a compelling Reading product, that has more potential than I see right now in a competitor like Medium, which is quite tech heavy.</p>
<p>Matt says, <span class="pullquote alignright">&#8220;We&#8217;ve built up a lot of trust in the community, and that goodwill definitely pays back.&#8221;</span> Part of what makes it hard to identify Automattic&#8217;s specific differentiator is that they do a lot of things. Matt acknowledged this, but counters by saying that they work hard on user experience and being a good community citizen.</p>
<h3>How have teams changed at Automattic over time?</h3>
<p>Automattic scales by splitting teams when they get too big. Today, there are 46 teams. Some of those teams are embedded in larger teams and have some hierarchy, but the company is still quite flat for a company of 400 people.</p>
<p>The rule of thumb Matt wants to maintain is that someone should have no more than 10 people that report directly to them, though he has around 23.</p>
<p>According to the standards of the tech world, Automattic&#8217;s scale in terms of the number of employees may be somewhat ordinary, but they have still had massive and consistent change over the decade of the company&#8217;s existence. And they are hiring as fast as they can to this day.</p>
<h3>The challenge of customizing WordPress sites</h3>
<p>A couple of years ago, someone from Automattic told me how concerned they were about the WordPress customizer&#8217;s ability to scale, both for use on mobile devices, and as a utility that could manage a lot of features. And I wanted to know how Matt thinks that has evolved, now that the customizer is in such significant use on both WordPress.com and for self-hosted websites.</p>
<p>As he notes, the customizer has undergone a lot of positive iteration over the last several releases, and today the WordPress.com and WordPress.org customizers are using the same base code; whereas for a while WordPress.com had their own custom implementation.</p>
<p>But he still says that, &#8220;If we&#8217;re candid with ourselves, &#8230; customization is still the worst part of WordPress, you know? It&#8217;s the hardest. It&#8217;s where people get stuck. It&#8217;s where there&#8217;s a real gap between the promise and what people are able to realize and create when they get started using WordPress.&#8221;</p>
<p>It&#8217;s not as much a problem with the use of themes, or if you can code, but for new users, &#8220;it&#8217;s their biggest struggle.&#8221;</p>
<p>One idea that I have is to have a more Medium-like interface be the &#8220;default&#8221; view, versus a changing default theme. That way, WordPress.com could be more opinionated about the default view, and change the theme at will, or along with trends, versus giving new users the default theme of a particular year and then that theme is untouched unless the user decides to switch.</p>
<p>Matt said they have that a bit on the Reader view, but that is what someone in the WordPress.com network would see, versus what an outside website visitor would see.</p>
<p>Anyway, there are definitely challenges ahead for enabling customizations and, more importantly, just ensuring sites look good for users. I think that this is an area where other platforms &#8212; like Medium and Squarespace, though in different ways &#8212; are doing a good job.</p>
<h3>The first line of the Automattic creed</h3>
<p>The <a href="http://ma.tt/2011/09/automattic-creed/">Automattic creed</a> states at the very beginning, &#8220;I will never stop learning.&#8221; That was part of Matt&#8217;s response when I asked just how they managed to <a href="http://dentedreality.com.au/2015/11/23/all-new-wordpress-com/">cross-train a workforce</a> that was primarily made of PHP developers to create a world-class JavaScript driven application.</p>
<p>Additionally to the natural desires that Automattic employees should have to learn, they created internal resources for helping people, and are considering releasing some of that material, maybe in the form of webinars or an online conference.</p>
<p>Matt said Automatticians will also be sharing what they learn at other conferences, like the upcoming <a href="https://feelingrestful.com/speakers/">A Day of REST</a>, where two Automatticians will be speaking.</p>
<p>Matt did admit that he hasn&#8217;t made the PHP to JavaScript switch yet, and personally feels more comfortable in PHP; though some of his team have said it wasn&#8217;t as intimidating as it sounds.</p>
<h3>Bug bounties</h3>
<p>Did you know all Automattic properties are on <a href="https://hackerone.com/automattic">Hacker One</a>, the bug bounty community? If you find a security bug, you can get a bounty if you report it. I didn&#8217;t know this until the Calypso launch.</p>
<h3>How is Automattic thinking about revenue?</h3>
<p>With my napkin math and a few small things I know about Automattic, I&#8217;d guesstimate they are somewhere in the neighborhood of $100 million in annual revenue. I didn&#8217;t even attempt to get confirmation of this, because I know they don&#8217;t reveal this kind of information. So instead I wanted to get more insights of how Matt thinks about revenue at Automattic.</p>
<p>Generally, he says they put their focus in, &#8220;three main buckets.&#8221; They use that focus both for revenue purposes and product purposes. Those areas are WordPress.com, Jetpack, and WooCommerce.</p>
<p>They group things like VaultPress and Akismet under Jetpack; so it&#8217;s basically their WordPress.org SaaS revenue stream. Those are paid subscription products.  They have been transitioning that offering, as Matt shared, &#8220;a big trend over the past few years, has been to move away from a la carte upgrades, and have more bundles.&#8221;</p>
<p>They&#8217;ve discovered that bundled plans of $100 per year and $300 per year have been successful. Here are those plans, for both WordPress.com and WordPress.org, as shown in the new WordPress.com/Calypso interface:</p>
<p><img class="alignnone size-full wp-image-15013" src="https://cdn.poststatus.com/wp-content/uploads/2015/11/wp-org-plan.png" alt="wp-org-plan" width="739" height="693" /><img class="alignnone size-full wp-image-15014" src="https://cdn.poststatus.com/wp-content/uploads/2015/11/wpcom-plan.png" alt="wpcom-plan" width="736" height="798" /></p>
<p>It appears they get most of their revenue from this stream. I do know, and have previously reported, that at least at one point, WordPress.com VIP accounted for upwards of 25% of overall revenue, and though that gross number has gone up over the years, its percentage of overall revenue has gone down, meaning that these paid plans have outpaced VIP, growth-wise. I&#8217;d guess VIP revenue is now less than half of that 25% number now, but can&#8217;t confirm it.</p>
<h3>Total sites, versus engagement</h3>
<p>There are a lot of WordPress.com websites, but as Matt noted, it&#8217;s a vanity metric due to the fact that such a small percentage are active, engaged users. So they are trying more to track engagement versus total sites.</p>
<p>I tried to get him to share the number of active websites, but that&#8217;s not something he could share.</p>
<h3>Helping site owners monetize, and WooCommerce integration to WordPress.com</h3>
<p>I talked about the roadmap some, and asked Matt about what they may offer in the future to help authors monetize their sites. They currently have a <a href="https://wordads.co/">WordAds</a> program, but that is a pageview driven strategy, and I&#8217;d love to see them introduce a way for authors to get paid via a tip jar, private paid posts, or subscription system like I&#8217;ve heard Medium is investigating. It&#8217;s not on their current roadmap, but he says he&#8217;d be open to it.</p>
<p>He also noted that since WooCommerce is now &#8220;part of the family,&#8221; that there may be future monetization opportunities through that, though he said they don&#8217;t have current plans for a hosted version of WooCommerce on WordPress.com. I was honestly pretty surprised by this:</p>
<blockquote><p>In the beginning, our focus is really going to be on people hosting their stores, you know, with web hosts. Because, part of the beauty of why WooCommerce is so popular is the flexibility, and I don&#8217;t think the usability is there &#8212; yet &#8212; to be competitive with, like, a  Shopify, or a BigCommerce. So, it&#8217;s just a lot of work to do there.</p></blockquote>
<p><span class="pullquote alignright">Matt said he thinks of WooCommerce as how WordPress was around version 1.5. He called it, &#8220;very early days&#8221;</span>, in that people are using it and see the potential, but says, &#8220;there&#8217;s just so much to work on and improve to make it accessible to a wider audience.&#8221;</p>
<p>He says the Woo team is now 63 people, and a number of Automatticians are doing &#8220;Wootations,&#8221; or rotations with the Woo team.</p>
<h3>What to expect next in the new WordPress.com interface</h3>
<p>They are still working on a lot of things for the new interface. There are certain things that aren&#8217;t there yet. For instance, showing and hiding your sites you are personally attached to still requires the regular admin. I actually experienced this myself. Some parts of the interface are pretty circular and confusing.</p>
<p>But they plan to do more going forward; their values on the project state that, &#8220;we are here for the long haul.&#8221; They want to see what there is demand for, and what other people do with the open source nature of the project.</p>
<p>Matt also noted that he&#8217;d like to &#8220;loop back&#8221; to content blocks (code named <a href="https://make.wordpress.org/core/features-as-plugins/">CEUX</a>) &#8212; the project that stalled last year. And he&#8217;s like to see what can be done around collaboration, editing, and the suggestion process.</p>
<h3>Power and ease of use</h3>
<p>One of the biggest challenges for WordPress is to continue to get easier to use, as other avenues for sharing information have gotten easier and easier, while continuing to enable powerful, feature rich implementations of WordPress.</p>
<p>Matt thinks this balance is important, and that we must continue to improve in both directions to continue WordPress&#8217;s growth.</p>
<h3>Wrapping up</h3>
<p>I really enjoyed my first audio interview with Matt. He says we can expect more announcements around WordCamp US, which starts next week.</p>
<p>The Calypso project is a fascinating one, and it&#8217;s a great example of what we should continue to expect: powerful, catered tools that run on a RESTful API. They aren&#8217;t always going to be tools for use everywhere, but we can expect to continue to see WordPress used in innovative ways, and be an exceptional platform for all kinds of applications.</p>
<p>And finally, at the end of the interview, I pitched Matt on one of my most harebrained ideas. The naming conflict between WordPress.com and WordPress was really bad with this project, as nearly everyone not deeply embedded within the WordPress world got it wrong, and conflated Automattic&#8217;s WordPress.com with WordPress the software.</p>
<p>And I think Jetpack&#8217;s brand has really blossomed. I think there is an argument to be made that Automattic could change the name of WordPress.com to Jetpack, and both Automattic and WordPress would win from the change. It wouldn&#8217;t be easy, but all I asked from him, is whether he&#8217;d read my post if I wrote one to give the pitch. He said he would, so expect that sometime soon.</p>
<p>Thanks to Matt for the interview, and thanks to <a href="https://twitter.com/markarms">Mark Armstrong</a> for helping me get going with the new WordPress.com app and arranging the interview.</p>
<p><a href="http://ma.tt/2013/07/wcsf-contributor-day-2013/">* Photo credit Sheri Bigelow</a></p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 25 Nov 2015 19:13:27 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:15:"Brian Krogsgard";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:14;a:6:{s:4:"data";s:13:"
	
	
	
	
	
	
";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:99:"WPTavern: The WordPress Theme Directory Replaces Download Counts With the Number of Active Installs";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=49123";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:109:"http://wptavern.com/the-wordpress-theme-directory-replaces-download-counts-with-the-number-of-active-installs";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:3429:"<p>Earlier this year, the <a href="http://wptavern.com/wordpress-plugin-directory-launches-new-design">WordPress plugin directory was redesigned</a>. As part of the redesign, download counts were replaced with the number of Active Installs to reflect more accurate data. The <a href="https://wordpress.org/themes/">WordPress theme directory</a> has finally followed suit by replacing download counts with the number of Active Installs.</p>
<a href="http://i2.wp.com/wptavern.com/wp-content/uploads/2015/11/ActiveInstallsofTwentyFifteen.png" rel="attachment wp-att-49125"><img class="size-full wp-image-49125" src="http://i2.wp.com/wptavern.com/wp-content/uploads/2015/11/ActiveInstallsofTwentyFifteen.png?resize=891%2C547" alt="Active Installs of Twenty Fifteen" /></a>Active Installs of Twenty Fifteen
<p>As you can see from the above screenshot, the Twenty Fifteen default theme included in WordPress 4.1, 4.2, and 4.3, is active on more than one million sites. Active themes are those that are activated and in use on a site. Themes that are installed and not activated are not counted, neither are child themes.</p>
<p>In the Themereview Slack Channel, Tom Usborne <a href="https://wordpress.slack.com/archives/themereview/p1447998481000578">explains why</a> active installs for child themes should be counted.</p>
<blockquote><p>I think an argument for child themes to be included in the active installs count can be made. For example, we offer a completely blank child theme for our customers so they can make CSS and PHP adjustments. This means our install count isn&#8217;t accurate on w.org, even though those people are using the theme actively.</p></blockquote>
<p>Dion Hulse, WordPress lead developer, <a href="https://wordpress.slack.com/archives/themereview/p1447998501000579">agrees</a> that child themes should be counted but the team doesn&#8217;t have the data yet. Some theme authors are concerned that new themes will have a tough time making it on the <a href="https://wordpress.org/themes/browse/popular/">popular themes page</a>.</p>
<p>Originally, the popular themes page was determined by the number of downloads over the previous week, which led to some authors to try to <a href="http://wptavern.com/the-wordpress-theme-directory-no-longer-counts-automated-downloads">game the system</a>. Hulse says, &#8220;The actual comparison between active installs and the previous week&#8217;s downloads were very similar, except for a handful of themes that had a lot more downloads than installs.&#8221;</p>
<p>Hulse plans to experiment with the algorithms to give newer themes a chance, &#8220;I’m also looking at ranking popular themes based on the age of the theme and installs, which will help promote some of the newer themes,&#8221; he said.</p>
<p>Thanks to active install counts for themes, we can see which default WordPress theme is the most popular.</p>
<ul>
<li>Twenty Fifteen 1+ Million</li>
<li>Twenty Fourteen 800K+</li>
<li>Twenty Twelve 500K+</li>
<li>Twenty Eleven 500K+</li>
<li>Twenty Ten 300K+</li>
<li>Twenty Thirteen 300K+</li>
</ul>
<p>Download counts are a terrible way to determine a theme or plugin&#8217;s popularity which is why I support this change. It&#8217;s more accurate and helps to further level the playing field for authors. Are you a fan of the change and if you&#8217;re a theme author, what other stats would you like to see?</p>
<div id="epoch-width-sniffer"></div>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 25 Nov 2015 08:31:22 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Jeff Chandler";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:15;a:6:{s:4:"data";s:13:"
	
	
	
	
	
	
";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:86:"WPTavern: Justin Tadlock Is Seeking Beta Testers for His First Major Commercial Plugin";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=49112";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:96:"http://wptavern.com/justin-tadlock-is-seeking-beta-testers-for-his-first-major-commercial-plugin";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:2712:"<p>Justin Tadlock, founder of <a href="http://themehybrid.com/">Theme Hybrid</a>, is <a href="http://themehybrid.com/weblog/theme-designer-beta">looking for beta testers</a> for a new plugin aimed at theme developers. The plugin is called <a href="https://github.com/justintadlock/theme-designer">Theme Designer</a> and allows authors to manage themes in the WordPress backend. It also displays them on the frontend similar to <a href="https://wordpress.com/themes">WordPress.com</a> and <a href="https://wordpress.org/themes">WordPress.org&#8217;s</a> theme pages.</p>
<p>Tadlock has moved beyond using WordPress pages to display and manage themes, &#8220;I’m not sure what everyone else is doing, but I’ve been building and tweaking a custom solution for a number of years. I’ve just never packaged it up and made it useful for others,&#8221; he said.</p>
<a href="http://i0.wp.com/wptavern.com/wp-content/uploads/2015/11/ThemeDesignerPlugin.png" rel="attachment wp-att-49114"><img class="size-full wp-image-49114" src="http://i0.wp.com/wptavern.com/wp-content/uploads/2015/11/ThemeDesignerPlugin.png?resize=1025%2C618" alt="Manage Themes in the WordPress Backend" /></a>Manage Themes in the WordPress Backend
<p>Under the hood, it uses a custom post type, taxonomies, custom metadata, and a number of hooks. Theme Designer can pull data from the WordPress.org theme directory API and store it on your site. There’s also a built-in feature set for adding custom meta fields to the edit theme screen.</p>
<p>In addition to managing themes, Tadlock plans to create add-ons and integrate Theme Designer with other plugins. He&#8217;s already created an add-on for Easy Digital Downloads and it&#8217;s possible he&#8217;ll create one for WooCommerce.</p>
<h2>Tadlock&#8217;s First Commercial Plugin</h2>
<p>During the beta testing period, Theme Designer will be free of charge. When the beta is complete, Tadlock will charge for access making it his first major commercial plugin. Theme Designer will come in two flavors, a supported and non-supported version.</p>
<p>The supported version gives customers a <strong>developer level</strong> membership to Theme Hybrid which is currently $35 a year. The non-supported version contains the plugin only. Both versions will have free lifetime updates.</p>
<p>To participate in the beta testing process, grab the free plugin <a href="https://github.com/justintadlock/theme-designer">from GitHub</a>. Pull requests and reporting issues are welcomed. It&#8217;s important to note that Theme Designer is <strong>only compatible</strong> with WordPress 4.4 and is a work in progress so it should not be used on a live site.</p>
<div id="epoch-width-sniffer"></div>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Tue, 24 Nov 2015 22:26:13 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Jeff Chandler";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:16;a:6:{s:4:"data";s:13:"
	
	
	
	
	
	
";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:90:"WPTavern: Stanko Metodiev’s First-time Experience Contributing Patches to WordPress Core";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=49104";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:97:"http://wptavern.com/stanko-metodievs-first-time-experience-contributing-patches-to-wordpress-core";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:2041:"<p>Stanko Metodiev, project manager for <a href="http://devrix.com/">Devrix</a>, shares his experience <a href="http://metodiew.com/my-first-wordpress-patch/">contributing a patch</a> to WordPress core for the first time. While browsing <a href="https://core.trac.wordpress.org/">Trac</a>, Metodiev discovered <a href="https://core.trac.wordpress.org/ticket/32813">a bug report</a> with the menu customizer.</p>
<p>Although a patch was already attached to the ticket, it didn&#8217;t work, &#8220;The change didn’t fix the issue for me, so I submitted a new patch to adjust the size by a few more pixels,&#8221; Metodiev said.</p>
<p>The change was merged into core by WordPress lead developer, Helen Hou-Sandí.</p>
<a href="http://i0.wp.com/wptavern.com/wp-content/uploads/2015/11/Changeset33107.png" rel="attachment wp-att-49105"><img class="size-full wp-image-49105" src="http://i0.wp.com/wptavern.com/wp-content/uploads/2015/11/Changeset33107.png?resize=990%2C680" alt="Merged into Core" /></a>Merged into Core
<p>It&#8217;s a small change but as I learned from <a href="http://wptavern.com/i-contributed-to-the-core-of-wordpress-and-you-can-too">my experience contributing to core</a>, every merged patch is important no matter how small it is. Metodiev offers the following advice to new contributors, &#8220;Don’t be scared and don’t be shy. The core team is hospitable, especially for first timers and they will give guidance and advice if needed, so feel free to contribute patches!&#8221;</p>
<p>Since his experience with WordPress 4.3, Metodiev continues to contribute to core and has seven merged patches in WordPress 4.4. If you&#8217;re thinking about contributing patches to core but don&#8217;t know where to start, I highly encourage you to read the <a href="https://make.wordpress.org/core/handbook/">Core Contributor Handbook</a>. In it you&#8217;ll find best practices, testing techniques, and how to submit patches to <a href="https://core.trac.wordpress.org/">Trac</a>.</p>
<div id="epoch-width-sniffer"></div>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Tue, 24 Nov 2015 20:55:38 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Jeff Chandler";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:17;a:6:{s:4:"data";s:13:"
	
	
	
	
	
	
";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:29:"Matt: Calypso, 24 Hours Later";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:21:"http://ma.tt/?p=45628";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:44:"http://ma.tt/2015/11/calypso-24-hours-later/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:7560:"<p>The reaction to <a href="http://ma.tt/2015/11/dance-to-calypso/">yesterday&#8217;s Calypso announcement</a> has really blown me away.Here&#8217;s a tiny selection of of the coverage, analysis, and reactions to Calypso and the new WordPress.com:</p>
<p><span id="more-45628"></span></p>
<p>&#8220;If you’re a regular user, you’ll notice a new look and feel. If you’re a code geek, you’ll notice something more remarkable below the surface: JavaScript instead of PHP.&#8221; <a href="https://href.li/?http://www.wired.com/2015/11/wordpress-com-gets-a-new-face-and-joins-the-javascript-age/"><em>Wired</em></a></p>
<p>&#8220;&#8230;I am personally extremely excited about this. Not only because the new UI is really nice and pleasant to use but also because this finally shows the modern side of WordPress, or at least starts to&#8230;&#8221; <em><a href="http://blog.versionpress.net/2015/11/thoughts-on-calypso/">VersionPress</a></em></p>
<blockquote class="twitter-tweet" width="550"><p lang="en" dir="ltr">Damn. Can\'t wait to dig into the new WP digs <a href="https://twitter.com/photomatt">@photomatt</a> and co have knocked together. Huge congrats, looks amazing: <a href="https://t.co/TJGgbBwHb0">https://t.co/TJGgbBwHb0</a></p>
<p>&mdash; Craig Mod (@craigmod) <a href="https://twitter.com/craigmod/status/669006749886615553">November 24, 2015</a></p></blockquote>
<p></p>
<p>&#8220;What I love most about the whole project is the lessons it has for everyone regarding innovation.&#8221; <a href="http://chrislema.com/wordpress-desktop-client/">Chris Lema</a></p>
<p>&#8220;So why did Automattic, the company behind WordPress.com, go through this <a href="https://developer.wordpress.com/2015/11/23/the-story-behind-the-new-wordpress-com/" target="_blank">painful rewriting process</a>? WordPress.com now feels and works like a modern web app. It’s back in the game against newcomers, such as Medium.&#8221; <em><a href="http://techcrunch.com/2015/11/23/wordpress-com-goes-open-source-and-gets-a-desktop-app/">TechCrunch</a></em></p>
<p>&#8220;Calypso looks like a huge leap forward for a project that seemed to stagnate for many years.&#8221; <a href="http://thenextweb.com/insider/2015/11/23/wordpress-com-reboots-from-scratch-to-take-on-medium/"><em>The Next Web</em></a></p>
<p>&#8220;Clean, responsive, faster than ever&#8230; WordPress is such a great success story. I&#8217;m very happy I chose to use it over six years ago.&#8221; <em><a href="https://www.macstories.net/linked/wordpress-com-goes-open-source-launches-mac-app/">Mac Stories</a></em></p>
<blockquote class="twitter-tweet" width="550"><p lang="en" dir="ltr">So impressed by the risk <a href="https://twitter.com/photomatt">@photomatt</a> and the <a href="https://twitter.com/WordPress">@WordPress</a> community took with Calypso. Faster, modern and still open. <a href="https://t.co/h0B2K0mo6k">https://t.co/h0B2K0mo6k</a></p>
<p>&mdash; ? Chris Messina ? (@chrismessina) <a href="https://twitter.com/chrismessina/status/668895604123152384">November 23, 2015</a></p></blockquote>
<p></p>
<p>&#8220;Calypso is a great example of what’s possible with the WordPress REST API.&#8221; <a href="http://wptavern.com/automattic-unveils-open-source-wordpress-desktop-application-for-the-mac"><em>WP Tavern</em></a></p>
<p>&#8220;I think the new WordPress.com editor, and the corresponding WordPress.com app, are a great improvement to the writing experience&#8230; [T]he investment they’ve made is a smart one.&#8221; <a href="https://poststatus.com/wordpress-com-mac-app/"><em>Post Status</em></a></p>
<blockquote class="twitter-tweet" width="550"><p lang="en" dir="ltr">WordPress just got interesting again. They\'re rebooting on modern web tech to take on Medium <a href="https://t.co/oVW1uGs0gu">https://t.co/oVW1uGs0gu</a> <a href="https://t.co/TT6tJDkQcG">pic.twitter.com/TT6tJDkQcG</a></p>
<p>&mdash; Owen Williams (@ow) <a href="https://twitter.com/ow/status/668850348321210368">November 23, 2015</a></p></blockquote>
<p></p>
<p>&#8220;&#8230; the fastest and most streamlined WordPress experience so far.&#8221; <a href="http://9to5mac.com/2015/11/23/wordpress-redesign-mac-app/"><em>9 to 5 Mac</em></a></p>
<p><a href="http://venturebeat.com/2015/11/23/automattic-revamps-and-open-sources-wordpress-com/"><em>VentureBeat</em></a> also reported on the launch yesterday, and there&#8217;s a <a href="http://venturebeat.com/2015/11/24/wordpress-creator-matt-mullenweg-breaks-down-the-blogging-platforms-biggest-overhaul-in-years/">longer interview with me </a>up there today.</p>
<blockquote class="twitter-tweet" width="550"><p lang="en" dir="ltr">WordPress\' new Calypso is also another GitHub success story <a href="https://t.co/pcLGgIKQph">https://t.co/pcLGgIKQph</a> <a href="https://t.co/ZnVNGabv6l">pic.twitter.com/ZnVNGabv6l</a></p>
<p>&mdash; Mikeal Rogers (@mikeal) <a href="https://twitter.com/mikeal/status/668992015300845568">November 24, 2015</a></p></blockquote>
<p></p>
<p>So far, we&#8217;ve seen articles in <a href="https://href.li/?http://www.blogdumoderateur.com/wordpress-calypso/">French</a>, <a href="https://href.li/?http://dailysocial.id/post/dirombak-total-wordpress-com-kini-jadi-open-source-dan-usung-javascript">Indonesian</a>, <a href="https://href.li/?http://www.mactechnews.de/news/article/Automattic-veroeffentlicht-WordPress-App-fuer-Mac-162882.html">German</a>, <a href="https://href.li/?http://wwwhatsnew.com/2015/11/23/automattic-lanza-el-nuevo-wordpress-com-disponible-tambien-como-codigo-abierto/">Spanish</a>,  and <a href="https://href.li/?http://yablyk.com/129418-vyshlo-oficialnoe-prilozhenie-wordpress-dlya-mac/">Russian</a>. Calypso is a <a href="https://github.com/trending">trending repo on GitHub</a>. The news was <a href="http://www.techmeme.com/151123/h2325">on top of TechMeme</a>, and voted to the top of <a href="https://href.li/?https://www.producthunt.com/tech/the-new-wordpress-com">Product Hunt</a>, and <a href="https://news.ycombinator.com/item?id=10615918">even Hacker News</a>.</p>
<p>One of my favorite takes was from Om Malik, in &#8220;<a href="http://om.co/2015/11/23/some-thoughts-on-the-new-wordpress-com-and-mac-app/">Some Thoughts on the New WordPress.com and Mac App&#8221;</a>:</p>
<blockquote>
<p class="p1">I view the shift to this newer, more flexible model as a way for WordPress.com to adapt to become a growing part of the open web. Blogging has always been mistaken for its containers, tools, the length of the posts or just a replacement for the rapid-fire publishing of old-fashioned news. In reality, blogging is essentially a philosophy built on the ethos of sharing.</p>
<p class="p1">Today sharing on the internet is a major social behavior: We share photos, links, videos, thoughts, opinions, news. Except instead of sharing on a blog, we do the sharing in increasingly proprietary and corporate silos: Instagram, Facebook, YouTube, Twitter, Periscope and LinkedIn. You see, the blogging ethos is alive and well. However, the old blogging tools have to embrace change.</p>
</blockquote>
<p class="p1">At the end of the day, it&#8217;s not about technology for technology&#8217;s sake, it&#8217;s about technology at the service of human voices. Embracing change to support the free, open web where everyone has a voice.</p>
<p class="p1">Finally, it was a weird coincidence we didn&#8217;t even notice, but the Calypso announcement was <a href="https://en.blog.wordpress.com/2005/11/23/opening-it-up/">ten years to the day after we opened up WordPress.com</a>.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Tue, 24 Nov 2015 19:42:59 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:4:"Matt";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:18;a:6:{s:4:"data";s:13:"
	
	
	
	
	
	
";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:86:"WPTavern: Automattic Unveils Open Source WordPress.com Desktop Application for the Mac";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=49077";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:92:"http://wptavern.com/automattic-unveils-open-source-wordpress-desktop-application-for-the-mac";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:5489:"<p>In the last two years, Automattic has made significant improvements to WordPress.com and Jetpack. From managing<a href="http://wptavern.com/you-can-now-search-for-and-install-plugins-from-within-jetpack-manage"> plugins, themes, and other updates</a> to <a href="https://en.blog.wordpress.com/2013/06/17/beautiful-makeover/">New Dash</a> and a revamped <a href="https://en.support.wordpress.com/new-post-screen/">post editor</a>. The individual changes represent iteration but when seen as a whole, show off an entirely new WordPress.com.</p>
<p>Automattic has <a href="https://en.blog.wordpress.com/2015/11/23/the-new-wordpress-dot-com/">announced</a> that the improvements its made in the last two years are part of an internal project <a href="https://desktop.wordpress.com/">named Calypso</a>. The company also released a WordPress.com desktop application for the Mac and <a href="https://developer.wordpress.com/calypso/">open sourced</a> the code on <a href="https://github.com/Automattic/wp-calypso">GitHub</a>.</p>
<p>The application is written entirely in JavaScript using the <a href="https://nodejs.org/en/">Node</a> and <a href="https://facebook.github.io/react/">React</a> libraries. It&#8217;s also <a href="https://developer.wordpress.com/docs/api/">100% reliant</a> on APIs, including the REST API.</p>
<h2>My Experience with Calypso</h2>
<p>Over the weekend, I tested the application on my Macbook Pro. I initially thought it was inconsistent as there were many instances where a button opened a browser and took me outside the app. However, Calypso has gone through a number of updates and most of the inconsistencies have disappeared.</p>
<a href="http://i0.wp.com/wptavern.com/wp-content/uploads/2015/11/Calypso1.png" rel="attachment wp-att-49080"><img class="wp-image-49080 size-full" src="http://i0.wp.com/wptavern.com/wp-content/uploads/2015/11/Calypso1.png?resize=1025%2C795" alt="Calypso1" /></a>Calypso
<p>Most of what you&#8217;re able to accomplish in the WordPress backend you can do in the app including, editing posts, creating drafts, and moderating comments.</p>
<p><a href="http://i1.wp.com/wptavern.com/wp-content/uploads/2015/11/Calypso2.png" rel="attachment wp-att-49081"><img class="aligncenter size-full wp-image-49081" src="http://i1.wp.com/wptavern.com/wp-content/uploads/2015/11/Calypso2.png?resize=1025%2C799" alt="Calypso2" /></a>Although there is the occasional Beep&#8230;.Beep&#8230;.Boop, the application is fast. Some of the pages within the app feel like they load faster than their browser counterparts. Some things still require action from within a browser such as applying updates. This doesn&#8217;t make sense considering the Jetpack Manage module is enabled.</p>
<p>When managing themes, I noticed at least two of the them don&#8217;t include the white bottom bar making the titles difficult to read. Also, the details link loads a browser window to the backend of the site I&#8217;m managing. It feels like an interruption instead of a seamless experience. There should be no reason to load a browser window except for previewing a post.</p>
<a href="http://i2.wp.com/wptavern.com/wp-content/uploads/2015/11/Calypso3.png" rel="attachment wp-att-49082"><img class="wp-image-49082 size-full" src="http://i2.wp.com/wptavern.com/wp-content/uploads/2015/11/Calypso3.png?resize=1025%2C790" alt="Calypso3" /></a>Managing Themes in Calypso
<p>If you&#8217;re familiar with or use the WordPress.com post editor, the editor in Calypso is pretty much the same.</p>
<p>For years I&#8217;ve written posts with meta boxes on the right and getting used to them on the left will take a while. The editor has most of the features available in WordPress. For example, oEmbed support which many other third-party WordPress apps don&#8217;t have.</p>
<p>When the application is in full-screen mode, it looks great and blocks out distractions. In the most recent update however, the Preview button acts like a Save button and doesn&#8217;t show a preview of the post. This is likely a bug and will be fixed in a later version.</p>
<p><a href="http://i2.wp.com/wptavern.com/wp-content/uploads/2015/11/CalypsoPostEditingScreen.png" rel="attachment wp-att-49083"><img class="aligncenter size-full wp-image-49083" src="http://i2.wp.com/wptavern.com/wp-content/uploads/2015/11/CalypsoPostEditingScreen.png?resize=1025%2C790" alt="CalypsoPostEditingScreen" /></a>Calypso is a great example of what&#8217;s possible with the WordPress REST API. There are still a few instances when clicking a button takes you outside the app but those will be fixed in future updates.</p>
<p>Overall, it&#8217;s convenient to have access to most of WordPress&#8217; features without interacting with a browser. For those who use a Mac, I can easily see Calypso being the preferred way to interact and manage WordPress sites.</p>
<p>As Matt Mullenweg <a href="http://ma.tt/2015/11/dance-to-calypso/">mentions in his post</a>, there&#8217;s still a lot of work left to do, &#8220;This is a beginning, not an ending. (<a href="http://ma.tt/2010/11/one-point-oh/">1.0 is the loneliest</a>.) Better things are yet to come, as all of you dig in.&#8221; Calypso is <a href="https://desktop.wordpress.com/">available for free</a> but you&#8217;ll need a <a href="https://wordpress.com/start">WordPress.com account</a> which is also free.</p>
<p>If you own a Mac and test drive Calypso, please share your experience with us in the comments.</p>
<div id="epoch-width-sniffer"></div>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 23 Nov 2015 18:01:30 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Jeff Chandler";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:19;a:6:{s:4:"data";s:13:"
	
	
	
	
	
	
";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:73:"Post Status: Automattic has released an open source WordPress.com Mac app";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:31:"https://poststatus.com/?p=14990";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:45:"https://poststatus.com/wordpress-com-mac-app/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:5070:"<p>Today, Automattic released their official WordPress.com Mac app, that was codenamed <a href="https://en.blog.wordpress.com/2015/11/23/the-new-wordpress-dot-com/">Calypso</a> during development, that allows users to manage both WordPress.com and Jetpack enabled websites using a desktop interface. The code behind the app is also the foundation for a new version of the WordPress.com browser editor.</p>
<p>Here&#8217;s a quick video walkthrough:</p>
<p></p>
<p>The new WordPress.com app development occurred over the course of at least 18 months, according to the press release, with input from more than 140 Automatticians. <a href="http://apeatling.com/about-me/">Andy Peatling</a>, who has been at Automattic since 2008, was the project lead.</p>
<h3>If you could rebuild the admin from scratch</h3>
<p>Matt Mullenweg said that Automattic wanted to completely rethink the WordPress admin experience, without the burden of backward compatibility that WordPress core must hold sacred:</p>
<blockquote><p><strong>What would we build if we were starting from scratch today, knowing all we’ve learned over the past 13 years of building WordPress?</strong> At the beginning of last year, we decided to start experimenting and see.</p></blockquote>
<p>Calypso was an ambitious project. Not only does it bring the WordPress editing and publishing experience to a Mac app, but pretty much the entire WordPress.com admin experience is now available on the desktop, from stats to theme shopping.</p>
<p>While the app is definitely geared toward the experience one would expect on a WordPress.com website, you can also manage <a href="http://jetpack.me/2015/11/23/jwordpress-com-app-for-mac/">Jetpack enabled</a> websites with it. The Jetpack Manage feature must be enabled for it to work, and I admit I struggled to get it to function with my own (personal) website. However, I&#8217;m sure it&#8217;ll get any kinks worked out, and anyone looking for basic website management, but are on WordPress.org, may enjoy the experience.</p>
<h3>Open sourcing WordPress.com</h3>
<p>The most important part of the announcement is that Automattic is open sourcing Calypso and the many APIs that help drive it.</p>
<blockquote><p>A lot of people thought we should keep this proprietary, but throughout my life I’ve learned that the more you give away, the more you get back. We still have a ton to figure out around plugins, extensibility, contributions, Windows and Linux releases, API speed, localization, and harmonizing the WordPress.com API and WP-API so it can work with core WordPress. Thousands more PHP developers will need to become fluent with Javascript to recreate their admin interfaces in this fashion. I’m also really excited to revisit and redesign many more screens now that we have this first version out the door.</p></blockquote>
<p>I&#8217;m really glad they chose to open source it. I agree with Matt that both the app and the broader community will benefit from the decision; though I don&#8217;t doubt it may have been a tough sell to investors.</p>
<p>I also agree with Ben Thompson (a former Automattician, by chance), <a href="https://stratechery.com/2015/tensorflow-and-monetizing-intellectual-property/">who once said</a> that proprietary software itself isn&#8217;t necessarily what makes a company successful, but rather, &#8220;companies that are built on software but differentiated by a difficult-to-replicate complement to said software.&#8221;</p>
<p>In Automattic&#8217;s case, open sourcing the techniques to build the app isn&#8217;t giving away what is most valuable. What is most valuable to them is what they gain from the open source nature of the software, that will allow them to improve the experience for their vast WordPress.com user base.</p>
<h3>Calypso is a good step forward for WordPress.com</h3>
<p>I&#8217;ve worried for a while now that Automattic may be letting their audience slip, by falling behind the ease of use of other tools, like Medium. I think the new WordPress.com editor, and the corresponding WordPress.com app, are a great improvement to the writing experience, and I think that the investment they&#8217;ve made is a smart one.</p>
<p>I&#8217;ll be digging more into the code and developer components of the new APIs and the Mac app soon. I didn&#8217;t have access to that data prior to launch.</p>
<p>The new app is available for <a href="http://desktop.wordpress.com/">download from WordPress.com</a> now, or you can of course test drive the browser version directly on WordPress.com. You can also see the <a href="https://developer.wordpress.com/calypso/">developer features</a>, <a href="https://github.com/Automattic/wp-calypso">code on Github</a>, <a href="https://developer.wordpress.com/2015/11/23/the-story-behind-the-new-wordpress-com">the backstory</a> from Andy Peatling, and see both <a href="https://en.blog.wordpress.com/2015/11/23/the-new-wordpress-dot-com/">WordPress.com&#8217;s announcement</a>, as <a href="http://ma.tt/2015/11/dance-to-calypso/">well as Matt&#8217;</a>s.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 23 Nov 2015 17:06:08 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:15:"Brian Krogsgard";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:20;a:6:{s:4:"data";s:13:"
	
	
	
	
	
	
";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:22:"Matt: Dance to Calypso";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:21:"http://ma.tt/?p=45611";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:38:"http://ma.tt/2015/11/dance-to-calypso/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:7834:"<p><strong>One of the hardest things to do in technology is disrupt yourself.</strong></p>
<p>But we&#8217;re trying our darndest, and have some cool news to introduce today. When I took on the <a href="http://ma.tt/2014/01/toni-automattic-ceo/">responsibility of CEO of Automattic January of last year</a>, we faced two huge problems: our growth was constrained by lack of capital, and the technological foundations of the past decade weren’t strong enough for the demands of next one.</p>
<p>The first has a relatively straightforward answer. We found some fantastic partners, agreed on a fair price, <a href="http://ma.tt/2014/05/new-funding-for-automattic/">issued new equity in the company to raise $160M</a>, and started investing in areas we felt were high potential, like <a href="http://ma.tt/2015/05/woomattic/">this year’s WooCommerce acquisition</a>. This &#8220;war chest&#8221; gives us a huge array of options, especially given our fairly flat burn rate &#8212; we don&#8217;t need to raise money again to keep the company going, and any capital we raise in the future will be purely discretionary. (Since last May when the round happened we&#8217;ve only spent $3M of the investment on <a href="https://en.wikipedia.org/wiki/Operating_expense">opex</a>.)</p>
<p>The second is much harder to address. The <a href="https://wordpress.org/">WordPress</a> codebase is actually incredible in many ways &#8212; the result of many thousands of people collaborating over 13 years &#8212; but some of WordPress’ greatest strengths were also holding it back.</p>
<p>The WordPress codebase contains a sea of institutional knowledge and countless bug fixes. It handles hundreds of edge cases. Integrates constant security improvements. Is coded to scale. Development moves at a fast clip, with <a href="https://wordpress.org/news/category/releases/">six major releases over the past two years</a> and more <a href="https://make.wordpress.org/core/tag/4-4/">around the corner</a>. Its power and flexibility is undeniable: WordPress just passed a huge milestone, <a href="http://ma.tt/2015/11/seventy-five-to-go/">and now powers 25% of the web</a>. You can run it on a $5-a-month web host, or scale it up to serve billions of pageviews on one of the largest sites on the web, <a href="https://wordpress.com/">WordPress.com</a>.</p>
<p>The interface, however, has been a struggle. Many of us attempted to give it a reboot with the <a href="https://make.wordpress.org/core/2013/10/23/mp6-3-8-proposal/">MP6 project</a> and the <a href="https://wordpress.org/news/2013/12/parker/">version 3.8 release</a>, but what that release made clear to me is that an incremental approach wouldn&#8217;t give us the improvements we needed, and that two of the things that helped make WordPress the strong, stable, powerful tool it is &#8212; backward compatibility and working without JavaScript &#8212; were actually holding it back.</p>
<p>The basic paradigms of wp-admin are largely the same as they were five years ago. Working within them had become limiting. The time seemed ripe for something new, something big… but if you&#8217;re going to break back compat, it needs to be for a really good reason. A 20x improvement, not a 2x. Most open source projects fade away rather than make evolutionary jumps.</p>
<p>So we asked ourselves a big question. <strong>What would we build if we were starting from scratch today, knowing all we&#8217;ve learned over the past 13 years of building WordPress?</strong> At the beginning of last year, we decided to start experimenting and see.</p>
<p>Today we&#8217;re announcing something brand new, a new approach to WordPress, and open sourcing the code behind it. The project, codenamed Calypso, is the culmination of more than 20 months of work by dozens of the most talented engineers and designers I&#8217;ve had the pleasure of working with (127 contributors with over 26,000 commits!).</p>
<p><img class="aligncenter size-medium wp-image-45613" src="http://i1.wp.com/ma.tt/files/2015/11/gm-2015-final.jpg?resize=604%2C431" alt="gm-2015-final" /></p>
<p>Calypso is&#8230;</p>
<ul>
<li>Incredibly fast. It&#8217;ll charm you.</li>
<li>Written purely in JavaScript, leveraging libraries like <a href="https://nodejs.org/en/">Node</a> and <a href="https://facebook.github.io/react/">React</a>.</li>
<li>100% API-powered. Those APIs <a href="https://developer.wordpress.com/docs/api/">are open</a>, and now available to every developer in the world.</li>
<li>A great place to read, allowing you to follow sites across the web (even if they&#8217;re not using WordPress).</li>
<li>Social, with stats, likes, and notifications baked in.</li>
<li>Fully responsive. Make it small and put it in your sidebar, or go full-screen.</li>
<li>Really fun to write in, especially the drag-and-drop image uploads.</li>
<li>Fully multi-site for advanced users, so you can manage hundreds of WordPresses from one place.</li>
<li>Able to manage plugins and themes on <a href="http://jetpack.me/">Jetpack</a> sites, including auto-upgrading them!</li>
<li>100% open source, with all future development happening in the open.</li>
<li>Available for anyone to adapt to make their own, including building custom interfaces, distributions, or working with web services besides WordPress.com.</li>
</ul>
<p>A lot of people thought we should keep this proprietary, but throughout my life I&#8217;ve learned that the more you give away, the more you get back. We still have a ton to figure out around plugins, extensibility, contributions, Windows and Linux releases, API speed, localization, and harmonizing the WordPress.com API and WP-API so it can work with core WordPress. Thousands more PHP developers will need to become fluent with JavaScript to recreate their admin interfaces in this fashion. I&#8217;m also really excited to revisit and redesign many more screens now that we have this first version out the door.</p>
<p>This is a beginning, not an ending. (<a href="http://ma.tt/2010/11/one-point-oh/">1.0 is the loneliest</a>.) Better things are yet to come, as all of you dig in. Check out these links to read more about Calypso from different perpsectives:</p>
<ul>
<li><a href="https://desktop.wordpress.com/">Download the Mac desktop app, or sign up to be notified about Windows or Linux</a>.</li>
<li><a href="https://developer.wordpress.com/calypso/">Learn about Calypso from the developer’s point of view</a>.</li>
<li><a href="http://en.blog.wordpress.com/2015/11/23/the-new-wordpress-dot-com">See the user announcement on WordPress.com</a>.</li>
<li><a href="https://github.com/Automattic/wp-calypso">Browse the GitHub repository</a>.</li>
<li><a href="https://developer.wordpress.com/2015/11/23/the-story-behind-the-new-wordpress-com">Hear about the backstory from Calypso&#8217;s lead, Andy Peatling</a>.</li>
</ul>
<p>This was a huge bet, incredibly risky, and difficult to execute, but it paid off. Like any disruption it is uncomfortable, and I&#8217;m sure will be controversial in some circles. What the team has accomplished in such a short time is amazing, and I’m incredibly proud of everyone who has contributed and will contribute in the future. This is the most exciting project I&#8217;ve been involved with in my career.</p>
<p>With core WordPress on the server and Calypso as a client I think we have a good chance to bring another 25% of the web onto open source, making the web a more open place, and people&#8217;s lives <a href="http://ma.tt/2014/01/four-freedoms/">more free</a>.</p>
<p>If you&#8217;re curious more about the before and after, what&#8217;s changed, here&#8217;s a chart:</p>
<p><img class="alignnone size-full wp-image-45626" src="http://i1.wp.com/ma.tt/files/2015/11/Whats-New-WPcom@2x.png?resize=604%2C1300" alt="Whats-New-WPcom@2x" /></p>
<p>&nbsp;</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 23 Nov 2015 17:01:05 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:4:"Matt";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:21;a:6:{s:4:"data";s:13:"
	
	
	
	
	
	
";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:95:"WPTavern: Nearly Half of the WordPress Plugins in the Directory Are Not Updated After Two Years";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=49050";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:105:"http://wptavern.com/nearly-half-of-the-wordpress-plugins-in-the-directory-are-not-updated-after-two-years";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:2813:"<p>Luca Fracassi, founder of <a href="https://addendio.com/">Addendio</a>, an alternative search engine for the WordPress plugin and theme directories published an <a href="https://addendio.com/2015-will-be-a-record-year-for-wordpress-plugins/">in-depth look</a> at the WordPress plugin directory. The post includes data that shows the number of plugins added to the directory per year, what year the plugins were last updated, and other metrics.</p>
<p>My favorite data point is the number of plugins approved per year. Based on this data, it looks like it&#8217;s going to be another record year for the directory. The five active team members including, Mika Epstein, Pippin Williamson, and Samuel Wood have their work cut out for them.</p>
<a href="http://i0.wp.com/wptavern.com/wp-content/uploads/2015/11/NumberOfPluginsAddedPerYear.png" rel="attachment wp-att-49062"><img class="size-full wp-image-49062" src="http://i0.wp.com/wptavern.com/wp-content/uploads/2015/11/NumberOfPluginsAddedPerYear.png?resize=939%2C684" alt="Number of Plugins Added Per Year" /></a>Number of Plugins Added Per Year
<p>According to the data, about 22K plugins have been updated in the last 24 months representing a little more than half the directory. This means that approximately half of the plugins in the directory are displaying a notice that the plugin hasn&#8217;t been updated in two years.</p>
<a href="http://i2.wp.com/wptavern.com/wp-content/uploads/2015/11/PluginUpdateTwoYearNotice.png" rel="attachment wp-att-49066"><img class="size-full wp-image-49066" src="http://i2.wp.com/wptavern.com/wp-content/uploads/2015/11/PluginUpdateTwoYearNotice.png?resize=785%2C84" alt="Update Notice After Two Years of No Updates" /></a>Update Notice After Two Years of No Updates
<p>Fracassi says that based on the data, &#8220;Two out of ten plugins are updated after three years. If you pick a free plugin that is released today, there’s a 80-90% chance that in three years time you won’t have any more updates.&#8221;</p>
<p>There are a number of possibilities as to why a plugin doesn&#8217;t get updated for two years or more.</p>
<ol>
<li>The developer burns out or moves on.</li>
<li>The plugin doesn&#8217;t need an update.</li>
<li>Lack of donations.</li>
<li>Support is too much of a burden.</li>
<li>No time.</li>
</ol>
<p>The data doesn&#8217;t spell doom and gloom for users but it clearly shows that many plugins within the directory don&#8217;t have a long shelf life. I encourage you to <a href="https://addendio.com/2015-will-be-a-record-year-for-wordpress-plugins/">read Fracassi&#8217;s post</a> and review the data he&#8217;s collected. Also check out our guide on <a href="http://wptavern.com/user-guide-how-to-choose-a-plugin">how to choose a WordPress plugin</a>.</p>
<div id="epoch-width-sniffer"></div>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 20 Nov 2015 19:36:51 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Jeff Chandler";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:22;a:6:{s:4:"data";s:13:"
	
	
	
	
	
	
";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:60:"WPTavern: How to Add Right to Left Support to Plugin Banners";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=49052";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:70:"http://wptavern.com/how-to-add-right-to-left-support-to-plugin-banners";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:2206:"<p>Now that the WordPress plugin directory is <a href="https://make.wordpress.org/plugins/2015/09/01/plugin-translations-on-wordpress-org/">using language packs</a>, translated plugins will start to show up in international directories. For some plugin banners however, this is a problem. For Right to Left languages, the icons and titles are displayed on the opposite side of the banner.</p>
<a href="http://i2.wp.com/wptavern.com/wp-content/uploads/2015/11/NinjaformsHebrew.png" rel="attachment wp-att-49055"><img class="size-full wp-image-49055" src="http://i2.wp.com/wptavern.com/wp-content/uploads/2015/11/NinjaformsHebrew.png?resize=768%2C386" alt="Ninja Forms in the Hebrew Plugin Directory" /></a>Old Ninja Forms Plugin Header in the Hebrew Plugin Directory
<p>To fix this issue, plugin directories have <a href="https://make.wordpress.org/plugins/2015/11/11/making-better-banners-for-your-plugins/">implemented Right to Left support</a> for plugin banners. To take advantage of RTL support, create a new banner and add <strong>-rtl</strong> to the end of the file name. Banner images live in the assets directory.</p>
<p>Here&#8217;s <a href="https://wordpress.org/plugins/pluginception/">an example</a> of a plugin banner on the Hebrew directory that has RTL support.</p>
<a href="http://i2.wp.com/wptavern.com/wp-content/uploads/2015/11/EnglishPluginceptionPluginBanner.png" rel="attachment wp-att-49056"><img class="size-full wp-image-49056" src="http://i2.wp.com/wptavern.com/wp-content/uploads/2015/11/EnglishPluginceptionPluginBanner.png?resize=768%2C386" alt="English Plugin Banner" /></a>English Plugin Banner
<a href="http://i2.wp.com/wptavern.com/wp-content/uploads/2015/11/HebrewPluginceptionPluginBanner.png" rel="attachment wp-att-49057"><img class="size-full wp-image-49057" src="http://i2.wp.com/wptavern.com/wp-content/uploads/2015/11/HebrewPluginceptionPluginBanner.png?resize=768%2C386" alt="Hebrew Plugin Banner" /></a>Hebrew Plugin Banner
<p>Although RTL banners are active on WordPress.org, they are not available in core. Banners won&#8217;t display properly but the team is working on adding it in time for a WordPress 4.4.1 release.</p>
<div id="epoch-width-sniffer"></div>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 20 Nov 2015 17:36:27 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Jeff Chandler";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:23;a:6:{s:4:"data";s:13:"
	
	
	
	
	
	
";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:61:"WPTavern: WPWeekly Episode 213 – Aesop Interactive Acquired";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=49044";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:67:"http://wptavern.com/wpweekly-episode-213-aesop-interactive-acquired";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:2433:"<p>In this short and sweet episode of WordPress Weekly, <a href="http://marcuscouch.com/">Marcus Couch</a> and I discuss the news of the week including, WordCamp Europe 2016, a credit card scam hitting freelancers, and Envato Sites. We also unmask the anonymous buyer who purchased Aesop Interactive.</p>
<h2>Stories Discussed:</h2>
<p><a href="http://wptavern.com/tickets-on-sale-for-wordcamp-europe-2016">Tickets on Sale for WordCamp Europe 2016</a><br />
<a href="http://wptavern.com/aesop-interactive-llc-acquired-by-anonymous-buyer">Aesop Interactive LLC Acquired by Anonymous Buyer</a><br />
<a href="http://wptavern.com/wordpress-freelancer-adam-soucie-on-the-dangers-of-accepting-credit-cards">WordPress Freelancer Adam Soucie on the Dangers of Accepting Credit Cards</a><br />
<a href="http://inside.envato.com/introducing-envato-sites/">Introducing Envato Sites</a></p>
<h2>Plugins Picked By Marcus:</h2>
<p><a href="https://wordpress.org/plugins/pay-payment-pal-multiple-emails-for-woocommerce/">PayPal Multiple Emails for WooCommerce </a>allows you to set up a second PayPal email address so you can use a different PayPal account to process payments in WooCommerce when a product in a specific product category is added to the customer&#8217;s shopping cart</p>
<p><a href="https://wordpress.org/plugins/wp-video-floater/">WP Video Floater</a> allows you to insert a video to a page and as the user scrolls down, the video is pushed to the bottom-right.</p>
<p><a href="https://wordpress.org/plugins/customize-submit-button-for-gravity-forms/">Customize Submit Button for Gravity Forms</a> lets you customize the submit button in Gravity Forms by switching it to a button element and changing its CSS classes</p>
<h2>WPWeekly Meta:</h2>
<p><strong>Next Episode:</strong> Wednesday, November 25th 9:30 P.M. Eastern</p>
<p><strong>Subscribe To WPWeekly Via Itunes: </strong><a href="https://itunes.apple.com/us/podcast/wordpress-weekly/id694849738" target="_blank">Click here to subscribe</a></p>
<p><strong>Subscribe To WPWeekly Via RSS: </strong><a href="http://www.wptavern.com/feed/podcast" target="_blank">Click here to subscribe</a></p>
<p><strong>Subscribe To WPWeekly Via Stitcher Radio: </strong><a href="http://www.stitcher.com/podcast/wordpress-weekly-podcast?refid=stpr" target="_blank">Click here to subscribe</a></p>
<p><strong>Listen To Episode #213:</strong><br />
</p>
<div id="epoch-width-sniffer"></div>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 20 Nov 2015 08:06:30 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Jeff Chandler";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:24;a:6:{s:4:"data";s:13:"
	
	
	
	
	
	
";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:25:"Matt: Cool Uses of WP-API";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:21:"http://ma.tt/?p=45609";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:41:"http://ma.tt/2015/11/cool-uses-of-wp-api/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:194:"<p>What&#8217;s the coolest uses and applications built on top of WordPress APIs that you&#8217;ve seen? I&#8217;m looking for some examples to highlight in the State of the Word next month.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 18 Nov 2015 15:25:09 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:4:"Matt";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:25;a:6:{s:4:"data";s:13:"
	
	
	
	
	
	
";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:64:"WPTavern: How to Replace WordPress’ Default Avatars With Wapuu";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=49023";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:71:"http://wptavern.com/how-to-replace-wordpress-default-avatars-with-wapuu";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:2429:"<p>Out of the box, WordPress allows you to configure the default avatar that displays for commenters that don&#8217;t have one. The choices leave a lot to be desired. Thanks to a new plugin created by <a href="https://profiles.wordpress.org/leewillis77/">Lee Willis,</a> called <a href="https://wordpress.org/plugins/wapuuvatar/">Wapuuvatar</a>, you can replace default avatars with images of Wapuu.</p>
<a href="http://i0.wp.com/wptavern.com/wp-content/uploads/2015/11/WapuuavatarSettings.png" rel="attachment wp-att-49025"><img class="size-full wp-image-49025" src="http://i0.wp.com/wptavern.com/wp-content/uploads/2015/11/WapuuavatarSettings.png?resize=822%2C456" alt="Settings for Wapuuavatar" /></a>Settings for Wapuuavatar
<p>If you&#8217;re not familiar with Wapuu, it&#8217;s the <a href="http://wptavern.com/community-translation-and-wapuu-how-japan-is-shaping-wordpress-history">official, GPL Licensed mascot</a> of the WordPress project. Throughout the year, a number of WordCamps and local communities across the world have created local versions of the character. In fact, the Tavern has its own Wapuu.</p>
<a href="http://i1.wp.com/wptavern.com/wp-content/uploads/2015/06/wapuu-wptavern.png" rel="attachment wp-att-45028"><img class="size-full wp-image-45028" src="http://i1.wp.com/wptavern.com/wp-content/uploads/2015/06/wapuu-wptavern.png?resize=800%2C958" alt="WP Tavern Wapuu" /></a>WP Tavern Wapuu
<p>The plugin has two settings. You can either replace the default avatar with random Wapuus or replace <strong>all</strong> Gravatars with Wapuu. Wapuuavatar uses a library of images from the <a href="https://github.com/jawordpressorg/wapuu">official Wapuu GitHub repository</a> and art work created by <a href="http://marktimemedia.com/">Michelle Schulp</a>. Here&#8217;s how it looks in action on WP Tavern.</p>
<a href="http://i2.wp.com/wptavern.com/wp-content/uploads/2015/11/WapuuavatarInAction.png" rel="attachment wp-att-49027"><img class="size-full wp-image-49027" src="http://i2.wp.com/wptavern.com/wp-content/uploads/2015/11/WapuuavatarInAction.png?resize=329%2C348" alt="Wapuuavatar on the Tavern" /></a>Wapuuavatar on the Tavern
<p>Wapuuavatar is an easy way to replace boring avatars with works of art. The plugin works without issue on WordPress 4.4 beta 4 and is <a href="https://wordpress.org/plugins/wapuuvatar/">available for free</a> on WordPress.org.</p>
<div id="epoch-width-sniffer"></div>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 18 Nov 2015 02:24:25 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Jeff Chandler";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:26;a:6:{s:4:"data";s:13:"
	
	
	
	
	
	
";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:86:"WPTavern: Why Some Theme Authors Are Waiting Two Months or More for Their First Review";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=49009";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:96:"http://wptavern.com/why-some-theme-authors-are-waiting-two-months-or-more-for-their-first-review";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:7043:"<a href="http://i0.wp.com/wptavern.com/wp-content/uploads/2014/12/time.jpg" rel="attachment wp-att-35409"><img class="size-full wp-image-35409" src="http://i0.wp.com/wptavern.com/wp-content/uploads/2014/12/time.jpg?resize=1024%2C496" alt="photo credit: Βethan - cc" /></a>photo credit: <a href="https://www.flickr.com/photos/beth19/4721798240/">Βethan</a> &#8211; <a href="http://creativecommons.org/licenses/by-nc-nd/2.0/">cc</a>
<p>Within the last few weeks, we&#8217;ve received emails from readers wanting to know why it&#8217;s taking so long for new themes to be reviewed on WordPress.org. Some theme authors are having to <a href="https://themes.trac.wordpress.org/query?status=new&status=reopened&keywords=!~buddypress&col=id&col=summary&col=priority&col=status&col=owner&col=type&col=time&col=changetime&report=5&order=priority">wait two months</a> or more for their first review.</p>
<p>Ashley Evans submitted <a href="https://themes.trac.wordpress.org/ticket/25318">her theme</a> in June and she&#8217;s yet to complete the review process. Throughout that time period, both Evans and the reviewer experienced delays in responding to each other. A few months into the review, the <a href="https://themes.trac.wordpress.org/ticket/25318#comment:21">reviewer disappeared</a> and Evans was <a href="https://themes.trac.wordpress.org/ticket/25318#comment:23">assigned a new reviewer</a> two days ago.</p>
<p>Understandably, the experience has discouraged Evan&#8217;s from submitting anymore themes to the directory:</p>
<blockquote><p>Back in August, I said, &#8216;Screw it&#8217; and released the theme as a free download on my blog. This process has basically made me vow to stick to adding plugins to the repo and stop adding any more themes.</p>
<p>I&#8217;m not blaming the theme review team since I can only imagine how much stuff they have to wade through. It&#8217;s just sad that the process has discouraged me from ever doing it again.</p></blockquote>
<p>On October 9th, Tammie Lister <a href="https://make.wordpress.org/themes/2015/10/09/forgotten-review-push-sometimes-themes-get-forgotten-in/">updated the Theme Review queues</a> and identified a number of themes that fell through the cracks. Most of those <a href="https://themes.trac.wordpress.org/query?id=26151,26016,26194,25318,26167,25685,25310,25818,25650,26135,26195,25000,23405,23342,24027,24087,24094,24101,24143,24178,24203,26164,26084,24277,25651,24597,24411,25269,25992,25217,24540,25980,25969,25814,25245,25241,25181,25154,25122,25076,25068,24274,24993,25046,24178,24087,24101,24143,24765&col=id&col=summary&col=owner&col=status&col=time&col=reporter&report=30&order=time">themes were approved</a> or are still in the review process.</p>
<h2>The System is Broken</h2>
<p>Members of the WordPress Theme Review team agree that the system is broken. In June, the team <a href="https://make.wordpress.org/themes/2015/06/05/suggested-roadmap/">published its suggested roadmap</a> to improve multiple facets of the review process. One of the items on the list to help cut down the review queue is the <a href="https://make.wordpress.org/themes/2015/10/07/automation-here-we-come/">auto-approval</a> of theme updates. However, the team is still hard at work trying to code and implement changes to improve the system.</p>
<h2>Help Them Help You</h2>
<a href="http://i2.wp.com/wptavern.com/wp-content/uploads/2014/08/school.jpg" rel="attachment wp-att-27795"><img class="size-full wp-image-27795" src="http://i2.wp.com/wptavern.com/wp-content/uploads/2014/08/school.jpg?resize=1025%2C487" alt="photo credit: Rob Shenk via - cc" /></a>photo credit: <a href="https://www.flickr.com/photos/rcsj/2915797223/">Rob Shenk</a> via &#8211; <a href="http://creativecommons.org/licenses/by-nc-nd/2.0/">cc</a>
<p>One of the items high on the team&#8217;s to-do list is to put more effort towards education. In order to do that, Justin Tadlock says the team has to free up resources, &#8220;We need to free up our biggest resources, which are the team members themselves. However, we can&#8217;t free up those people when they&#8217;re spending 100% of their time doing reviews.&#8221;</p>
<p>The most important thing theme authors can do to speed up the review process is to check that your theme meets the <a href="https://make.wordpress.org/themes/handbook/review/required/">Theme Review Requirements</a>. According to Tadlock, &#8220;The majority of themes submitted don&#8217;t follow the guidelines which considerably slows down the process. Themes will often have 20-30 issues or more. If we can get to a point to where the majority of submissions only have a few minor issues, we really wouldn&#8217;t have a queue.&#8221;</p>
<p>Theme authors who test their themes against <a href="https://codex.wordpress.org/Theme_Unit_Test">Theme Unit Test Data</a> and the <a href="https://wordpress.org/plugins/theme-check/">Theme Check Plugin</a> substantially improve the system for everyone. What the team needs most is help. Tadlock offers three ways contributors can get involved to improve the situation.</p>
<ol>
<li><a href="https://make.wordpress.org/themes/handbook/get-involved/become-a-reviewer/">Doing reviews</a>.</li>
<li>Tackling Meta Trac tickets related to the theme directory.</li>
<li>Writing tutorials.</li>
</ol>
<p>Tadlock isn&#8217;t sure how to get theme authors to raise the quality of their themes before the initial review, &#8220;That&#8217;s the sort of feedback I want to see from fellow theme authors. What do we need to do to help them get their themes ready before submission?&#8221;</p>
<h2>How to Get Involved</h2>
<p>The team is always in need of more theme reviewers. Reviewing themes is a great way to learn theme development and what not to do. If you&#8217;re interested in reviewing themes, read the <a href="https://make.wordpress.org/themes/handbook/get-involved/become-a-reviewer/">following document</a> from the Theme Review Handbook. It explains how to set up a testing environment with an example of a <a href="https://make.wordpress.org/themes/handbook/review/review-workflow/">testing workflow</a>.</p>
<p>The Theme Review Team also has a project meeting every <a href="http://www.timeanddate.com/worldclock/fixedtime.html?iso=20151110T1800"><abbr class="date" title="2015-11-10T18:00:00+00:00">Tuesday, November 10, 2015, 1:00 PM EST</abbr></a> in the <strong>#themereview</strong> channel on <a href="https://make.wordpress.org/chat/">Slack</a>.</p>
<h2>Exercise Patience</h2>
<p>Exercising patience is a difficult thing to do if you&#8217;ve already waited eight weeks or more for the first review. However, fixing the system is going to take time. If you want to know about the status of your theme and it has an assigned reviewer, you should ask for a status update within the ticket. If your theme doesn&#8217;t have an assigned reviewer, you can ask about its status in the <a href="https://make.wordpress.org/chat/">Theme Review Team Slack</a> channel with a link to the theme.</p>
<div id="epoch-width-sniffer"></div>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Tue, 17 Nov 2015 17:20:59 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Jeff Chandler";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:27;a:6:{s:4:"data";s:13:"
	
	
	
	
	
	
";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:102:"WPTavern: Imperva’s Web Application Attack Report Shows Spam Is WordPress’ Largest Security Threat";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=48995";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:106:"http://wptavern.com/impervas-web-application-attack-report-shows-spam-is-wordpress-largest-security-threat";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:6738:"<p><a href="http://www.imperva.com">Imperva</a>, an international cyber security company founded in 2002, published its <a href="http://www.imperva.com/docs/HII_Web_Application_Attack_Report_Ed6.pdf">2015 web application attack report</a>. The report includes a thorough analysis of attack data obtained through its WAF or Web Application Firewall.</p>
<p>In the report, Imperva&#8217;s application defense center group analyzed 297,954 attacks and 22,850,023 alerts on 198 of the applications it protects behind its WAF. The data is from January 1st, 2015 &#8211; June 30th, 2015 and provides a solid overview of the number and types of attacks web applications are experiencing.</p>
<p>The report covers a lot of ground but for the purpose of this site, I&#8217;m focusing on WordPress.</p>
<h2>Analysis Methodology</h2>
<p>Automated tools recorded the web applications’ traffic and malicious events were documented in log files. Imperva&#8217;s application defense center group analyzed the data using special-purpose software and its knowledge base.</p>
<p>You can find more information that explains how the data was analyzed on page seven of the report.</p>
<h2>WordPress Is the Most Attacked CMS Application</h2>
<p>Out of the 198 applications protected, Imperva identified 55 that are CMS-based, 20 WordPress applications, 11 Drupal, and 24 that are based on 11 other CMS frameworks.</p>
<a href="http://i1.wp.com/wptavern.com/wp-content/uploads/2015/11/ImpervaAttackIncidentCMSAverage.png" rel="attachment wp-att-48998"><img class="size-full wp-image-48998" src="http://i1.wp.com/wptavern.com/wp-content/uploads/2015/11/ImpervaAttackIncidentCMSAverage.png?resize=875%2C470" alt="Average Number of Incidents per Applications CMS Slice" /></a>Average Number of Incidents per Applications CMS Slice
<p>According to the report, CMS applications suffered an average of three times more attacks than non-CMS applications. WordPress applications suffered from 3,497 attacks in the reported period which is 250% more than non-CMS Applications. Note from the above image that spam attacks against WordPress outnumber all other types of attacks.</p>
<p>Imperva says the attraction to CMS applications, especially WordPress is not new.</p>
<blockquote><p>CMS frameworks have an open nature,  with open developer communities that generate a never-ending sequence of plug-ins and add-ons, with varying levels of security. This situation has led to corresponding never-ending flow of CMS vulnerabilities, with WordPress as the leading CMS taking the lead also in the amount of published attacks.</p>
<p>Furthermore, the fact that WordPress and other CMS applications resemble each other facilitates automated scanning attacks that work effectively on all applications of this type with only minimal adjustments.</p></blockquote>
<p>Varying levels of security in plugins have led to many vulnerabilities making WordPress the leader in the amount of published attacks.</p>
<h2>Proportions of Attacks</h2>
<p>Taking spam attacks out of the equation, the most popular attack type against WordPress applications is (RCE) Remote Command Execution with (RFI) Remote File Inclusion taking second place.</p>
<a href="http://i0.wp.com/wptavern.com/wp-content/uploads/2015/11/ImpervaAttackTypeProportions.png" rel="attachment wp-att-49000"><img class="size-full wp-image-49000" src="http://i0.wp.com/wptavern.com/wp-content/uploads/2015/11/ImpervaAttackTypeProportions.png?resize=719%2C400" alt="Proportion of Attack Types" /></a>Proportion of Attack Types
<ul>
<li>Remote File Inclusion (RFI) is an attack that allows an attacker to include a remote file, usually through a script, on the web server. This attack can lead to data theft or manipulation, malicious code execution on the web server, or malicious code execution on the application client side such as JavaScript execution, which can lead to other attacks. This vulnerability occurs due to the use of user-supplied input without proper validation.</li>
</ul>
<ul>
<li>Remote Command Execution (RCE) is an attack that allows the attacker to execute operating system commands in a system shell. The attack exploits applications that suffer from insufficient input validation in conjunction with passing this input to a system shell. The attacker’s payload is executed with the same privileges of the vulnerable application and can lead to full compromise of the server.</li>
</ul>
<p>Even though the other monitored CMS applications are written in PHP, RFI attacks on WordPress are significantly higher than all other applications. Imperva offers one possible explanation:</p>
<blockquote><p>Attackers don’t target a specific application, but start with scanning the Internet for vulnerable applications. A Low Hanging Fruit approach that is simple and effective for the detection of potential RFI targets, would be to run a WordPress test and mount an RFI attack in case of success.</p></blockquote>
<p>The <a href="http://www.imperva.com/docs/HII_Web_Application_Attack_Report_Ed6.pdf">report</a> goes on to show geographic attack trends, PHP vs non-PHP attack incidents, traffic volume, case studies, and more.</p>
<h2>No Need to Panic</h2>
<p>Even though it&#8217;s only six months of data, the results don&#8217;t surprise me. WordPress is <a href="http://wptavern.com/a-quarter-of-the-top-10-million-sites-ranked-by-alexa-use-wordpress">used on a quarter of the top 10 million websites</a> ranked by Alexa so of course its going to be the most attacked CMS.</p>
<p>The data in the report reinforces my belief that every public site online is likely being scanned or attacked multiple times a day. Unless you&#8217;re using a service or plugin that logs these types of attacks, its hard to know how popular of a target a site is.</p>
<p>If you&#8217;re aware of a plugin or service that provides a user-friendly interface that shows and explains the attacks it&#8217;s protecting against a site, please send me a link in the comments.</p>
<h2>Basic Security Principles</h2>
<p>It&#8217;s imperative that you use a <a href="https://en.wikipedia.org/wiki/Two-factor_authentication">strong password</a> and <a href="https://en.wikipedia.org/wiki/Two-factor_authentication">two-factor authentication</a>. Consider using a service like <a href="https://getclef.com/">Clef</a> that allows you to login to WordPress without a password. I also highly encourage you to read the <a href="http://wptavern.com/wordpress-publishes-security-white-paper">WordPress security whitepaper</a> to learn how WordPress protects itself against common attacks mentioned in Imperva&#8217;s report and how to responsibly disclose a WordPress security vulnerability.</p>
<div id="epoch-width-sniffer"></div>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Tue, 17 Nov 2015 02:11:51 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Jeff Chandler";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:28;a:6:{s:4:"data";s:13:"
	
	
	
	
	
	
";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:83:"WPTavern: WordPress Freelancer Adam Soucie on the Dangers of Accepting Credit Cards";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=48990";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:93:"http://wptavern.com/wordpress-freelancer-adam-soucie-on-the-dangers-of-accepting-credit-cards";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:2202:"<p>If you&#8217;re running or opening a new WordPress business, you should read <a href="http://adamsoucie.com/chargebacks-the-dangers-of-accepting-credit-cards/">Adam Soucie&#8217;s warning</a> on the dangers of accepting credit cards. Soucie, a WordPress Developer based in Orlando, Florida describes what happened after working with a client that claimed to be hearing disabled.</p>
<p>Soucie went through the usual process of sending over a contract, bringing in a designer, discussing scope, and sending over an invoice. The client then claimed to be in the hospital and requested help to pay for one of the contractors involved in the project because he didn&#8217;t accept credit cards. According to Soucie, this should have been the red flag:</p>
<blockquote><p>But I ignored it because I’ve also been a trusting person who is sympathetic to people with disabilities.  Plus I figured I had proof of everything, so I’d be protected.  I was so wrong.</p>
<p>To make a long story short, the &#8216;client&#8217; was paying with stolen credit cards and the other contractor was in on the scam.  I discovered the scam when they started getting pushy about the contractor receiving his payments.  When leaving to make the final payment, I got a call from the person whose credit card info was stolen.  I reached out to my &#8216;client&#8217; and she had disappeared.</p></blockquote>
<p>As the merchant, Soucie was liable for the transaction. After not receiving help from the FBI Cyber Crimes division and the credit card companies, QuickBooks, Soucie&#8217;s payment processor, went after him for the total amount of $10,000. He was able to get the amount slightly reduced after working with QuickBooks. What looked like an awesome project quickly turned into a nightmare.</p>
<p>I highly encourage you to <a href="http://adamsoucie.com/chargebacks-the-dangers-of-accepting-credit-cards/">read his article</a> as it includes tips to protect yourself and why you shouldn&#8217;t be too trusting. What advice do you have for freelancers who accept credit card payments? What signs should freelancers look for to avoid fraudulent scams like this one?</p>
<div id="epoch-width-sniffer"></div>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 16 Nov 2015 18:26:21 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Jeff Chandler";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:29;a:6:{s:4:"data";s:13:"
	
	
	
	
	
	
";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:59:"WPTavern: Aesop Interactive LLC Acquired by Anonymous Buyer";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=48972";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:69:"http://wptavern.com/aesop-interactive-llc-acquired-by-anonymous-buyer";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:2890:"<p><a href="http://i1.wp.com/wptavern.com/wp-content/uploads/2014/02/aesop.png" rel="attachment wp-att-17210"><img class="aligncenter size-full wp-image-17210" src="http://i1.wp.com/wptavern.com/wp-content/uploads/2014/02/aesop.png?resize=800%2C259" alt="aesop" /></a>Earlier this year, Nick Haskins, founder of <a href="http://aesopinteractive.com/">Aesop Interactive LLC</a>, announced he was <a href="http://nickhaskins.com/2015/07/on-life-and-family/">selling the company</a>. Haskins was initially going to list the company on Flippa but after receiving advice from <a href="https://syedbalkhi.com/">Syed Balkhi</a>, used <a href="http://feinternational.com/">FE International</a> to facilitate the sale. FE International is composed of website brokers that do the heavy lifting to help businesses find buyers.</p>
<p>An anonymous company based on the US East Coast without ties to the WordPress community is the new owner of Aesop Interactive LLC. Although terms of the deal are not public, Haskins confirms that he received close to his asking price of $100K.</p>
<p>When Haskins put the company up for sale, he specified two conditions the new owner must follow.</p>
<ol>
<li>Aesop Story Engine MUST absolutely be maintained and kept free.</li>
<li>Editus must continue forward with development, in some way shape or form.</li>
</ol>
<p>It&#8217;s unclear what the new owner&#8217;s plans are for Aesop Story Engine, Editus, and Story.AM.</p>
<h2>Advice for Selling Your Company</h2>
<p>The WordPress ecosystem is filled with thousands of companies from individuals to 50+ person agencies. Haskins offers the following advice for those thinking about selling their business, &#8220;Make sure that the books are buttoned up tight, because every check, every payment, every expense will be scrutinized and will ultimately determine what the appraisal price will be. Run a lean ship as the less overhead you have, the better.&#8221;</p>
<p>During the appraisal process, Haskins had to account for and explain every check number written during the last few months. Although it was a lot of work on his end, he highly recommends using FE International as they manage the negotiating, contract writing, and appraisal processes.</p>
<h2>What’s Next for Haskins?</h2>
<p>Haskins isn&#8217;t giving up WordPress development as he continues to work with the software on a daily basis managing <a href="https://cgcookie.com/">CGCookie</a>. When I asked what&#8217;s next in his WordPress journey, he replied, &#8220;Overall, there will be another project. It&#8217;s just that this chapter of the story is finished. I want to eventually write and publish an eBook on my experiences of starting, running, and selling a business.&#8221;</p>
<p>Who do you think the buyer is and what do you think will happen to Aesop Story Engine, Editus, and Story.AM?</p>
<div id="epoch-width-sniffer"></div>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 13 Nov 2015 22:31:07 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Jeff Chandler";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:30;a:6:{s:4:"data";s:13:"
	
	
	
	
	
	
";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:50:"WPTavern: Tickets on Sale for WordCamp Europe 2016";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=48959";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:60:"http://wptavern.com/tickets-on-sale-for-wordcamp-europe-2016";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:2056:"<p><a href="http://i1.wp.com/wptavern.com/wp-content/uploads/2015/11/WordCampEuropeFeaturedImage2.png" rel="attachment wp-att-48961"><img class="aligncenter size-full wp-image-48961" src="http://i1.wp.com/wptavern.com/wp-content/uploads/2015/11/WordCampEuropeFeaturedImage2.png?resize=1025%2C450" alt="WordCamp Europe Featured Image" /></a>Nearly seven months before the event takes place, tickets for <a href="https://europe.wordcamp.org/2016/">WordCamp Europe 2016</a> in Vienna, Austria on June 24-26 <a href="https://europe.wordcamp.org/2016/tickets/">are on sale. </a> There are two types of tickets available, General admission and Microsponsor.</p>
<p>General admission tickets are € 40.00 each and cover both days to the event, <span class="tix-ticket-excerpt">access to all sessions, lunch, coffee breaks, warm up events, and the after party. It also includes a WCEU 2016 t-shirt, stickers and other swag. </span></p>
<p>Microsponsor tickets are € 150.00 and includes everything the general admission ticket offers. The major difference between the two besides cost, is that the microsponsor ticket is a<span class="tix-ticket-excerpt"> great way to support the European WordPress community. Microsponsorships shows appreciation of the event and grants you a special mention on the <a href="https://europe.wordcamp.org/2016/wordcamp-europe-2016-call-for-sponsors-wceu/">sponsorship page</a>.</span></p>
<p>Before you purchase tickets, it&#8217;s important to note that due to Paypal&#8217;s 60 day refund policy, the event is not issuing refunds. If you buy a ticket and want to give it away as a gift, or sell it to someone, you&#8217;ll need to edit the details using the link in your ticket purchase confirmation email.</p>
<p>Although the schedule is not yet posted, WordCamp Europe has an <a href="http://wptavern.com/wordpress-beyond-boundaries-a-recap-of-wordcamp-europe-2014">established history</a> of being one of the best WordPress events of the year. Let us know if you plan on attending.</p>
<div id="epoch-width-sniffer"></div>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 12 Nov 2015 20:02:08 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Jeff Chandler";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:31;a:6:{s:4:"data";s:13:"
	
	
	
	
	
	
";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:84:"WPTavern: BuddyPress 2.4.0 “Pietro” Contains Major Improvements to Accessibility";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=48951";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:88:"http://wptavern.com/buddypress-2-4-0-pietro-contains-major-improvements-to-accessibility";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:3538:"<p>BuddyPress 2.4.0 &#8220;Pietro&#8221; named after an authentic Italian restaurant in Paris, France is <a href="https://buddypress.org/2015/11/buddypress-2-4-0-pietro/">available for download</a>. This release includes support for cover photos that users can add to their profile or a group.</p>
<a href="http://i1.wp.com/wptavern.com/wp-content/uploads/2015/11/BuddyPressCoverPhotos.png" rel="attachment wp-att-48952"><img class="size-full wp-image-48952" src="http://i1.wp.com/wptavern.com/wp-content/uploads/2015/11/BuddyPressCoverPhotos.png?resize=790%2C310" alt="BuddyPress Cover Photo Support" /></a>BuddyPress Cover Photos
<p>Cover photos are built on top of the BuddyPress Attachments API meaning they should seamlessly integrate into themes. If you need to fine-tune the output for your site, check out the <a href="https://codex.buddypress.org/themes/buddypress-cover-images/">following Codex article</a>.</p>
<p>Initially added in BuddyPress 2.2.0, <a href="https://codex.buddypress.org/developer/member-types/">Member Types</a> allows developers to categorize the members of their community in a variety of ways. If you use this feature in your community, you can now specify that profile fields be made available to either one, some, or none of the registered Member Types.</p>
<a href="http://i1.wp.com/wptavern.com/wp-content/uploads/2015/11/MemberTypeFields.png" rel="attachment wp-att-48953"><img class="size-full wp-image-48953" src="http://i1.wp.com/wptavern.com/wp-content/uploads/2015/11/MemberTypeFields.png?resize=844%2C464" alt="Member Type Fields" /></a>Member Type Fields
<p>Two companion stylesheets are included with 2.4.0 to make sure content looks great on both the TwentySixteen and TwentyThirteen themes.</p>
<a href="http://i1.wp.com/wptavern.com/wp-content/uploads/2015/11/CompanionStylesheets.png" rel="attachment wp-att-48954"><img class="size-full wp-image-48954" src="http://i1.wp.com/wptavern.com/wp-content/uploads/2015/11/CompanionStylesheets.png?resize=844%2C464" alt="Companion StyleSheets" /></a>Companion StyleSheets
<p>This release also includes major accessibility improvements to front-end templates and the Dashboard screens. According to BuddyPress developers, accessibility is a major focus of the project and there is a concentrated, ongoing effort to make the software more accessible to users of all abilities.</p>
<p>Thanks to a new <a href="https://codex.buddypress.org/themes/theme-compatibility-1-7/template-hierarchy/#single-groups-front-page">template hierarchy</a>, groups can now have unique header images and layouts. Simply use the new <code>front.php</code> template inside the single groups templates directory.</p>
<a href="http://i2.wp.com/wptavern.com/wp-content/uploads/2015/11/UniqueHomepages.png" rel="attachment wp-att-48955"><img class="size-full wp-image-48955" src="http://i2.wp.com/wptavern.com/wp-content/uploads/2015/11/UniqueHomepages.png?resize=844%2C464" alt="Unique Homepages for Groups" /></a>Unique Homepages for Groups
<p>In addition to all of the improvements listed above, 2.4.0 has over 100 bug fixes. It also contains the <a href="http://wptavern.com/buddypress-2-3-5-patches-privilege-escalation-issue">security patch</a> applied in 2.3.5. BuddyPress is <a href="https://wordpress.org/plugins/buddypress/">available for free</a> from the WordPress plugin directory and if you run into any issues, you&#8217;re encouraged to report them in the <a href="https://buddypress.org/support/">support forums</a>.</p>
<div id="epoch-width-sniffer"></div>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 12 Nov 2015 19:25:10 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Jeff Chandler";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:32;a:6:{s:4:"data";s:13:"
	
	
	
	
	
	
";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:58:"WPTavern: A Field Guide to Major Features in WordPress 4.4";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=48946";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:68:"http://wptavern.com/a-field-guide-to-major-features-in-wordpress-4-4";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:1036:"<p>The <a href="https://make.wordpress.org/core/2015/11/11/wordpress-4-4-field-guide/">WordPress 4.4 field guide</a> is available and covers all of the major features in WordPress 4.4. The guide explains what the features are and more specifically, links to posts that explain how they work.</p>
<blockquote class="wp-embedded-content"><p><a href="https://make.wordpress.org/core/2015/11/11/wordpress-4-4-field-guide/">WordPress 4.4: Field Guide</a></p></blockquote>
<p></p>
<p>While it doesn&#8217;t cover every single change, it gives developers and site maintainers an opportunity to learn and understand the major features before WordPress 4.4&#8217;s release.</p>
<p>If you haven&#8217;t tested your plugins and themes with WordPress 4.4, now is a great time to do so. In testing WordPress 4.4 betas on WP Tavern, I discovered two broken plugins. I notified the developers and they quickly released an update addressing the issues.</p>
<p>WordPress 4.4 is scheduled for release in December.</p>
<div id="epoch-width-sniffer"></div>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 12 Nov 2015 18:18:22 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Jeff Chandler";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:33;a:6:{s:4:"data";s:13:"
	
	
	
	
	
	
";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:56:"WPTavern: WPWeekly Episode 212 – Criticizing Criticism";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=48941";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:62:"http://wptavern.com/wpweekly-episode-212-criticizing-criticism";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:2845:"<p>In this episode, <a href="http://marcuscouch.com/">Marcus Couch</a> and I discuss the last two weeks of WordPress news. We go in-depth on what&#8217;s coming in WordPress 4.4 and I share a story of how upgrading WP Tavern to WordPress 4.4 beta 4 generated a white screen of death.</p>
<p>We cover what&#8217;s new in BuddyPress 2.4 and celebrate the milestone that WordPress is used on 25% of the top 10 million sites ranked by Alexa. Last but not least, we discuss how WordPress may reach 50% and what it means for the web.</p>
<h2>Stories Discussed:</h2>
<p><a href="https://wordpress.org/news/2015/11/wordpress-4-4-beta-4/">WordPress 4.4 Beta 4 Released</a><br />
<a href="http://wptavern.com/wp-remote-is-up-for-sale">WP Remote Is Up for Sale</a><br />
<a href="http://wptavern.com/pro-plugin-directory-is-seeking-a-new-owner">Pro Plugin Directory Is Seeking a New Owner</a><br />
<a href="https://buddypress.org/2015/11/buddypress-2-4-0-pietro/">BuddyPress 2.4.0 – “Pietro”</a><br />
<a href="http://wptavern.com/more-than-250-tickets-still-available-for-wordcamp-us">More Than 250 Tickets Still Available for WordCamp US</a><br />
<a href="http://wptavern.com/a-quarter-of-the-top-10-million-sites-ranked-by-alexa-use-wordpress">A Quarter of the Top 10 Million Sites Ranked by Alexa Use WordPress</a></p>
<h2>Plugins Picked By Marcus:</h2>
<p><a href="https://wordpress.org/plugins/ad-blocking-advisor/">Ad Blocking Advisor</a> adds a simple and elegant notification bar to your site that only displays to visitors who are using ad blocking software. The purpose of the notification is to ask (or advise) visitors to whitelist your site.</p>
<p><a href="https://wordpress.org/plugins/matchheight/">MatchHeight</a> adds the MatchHeight jQuery plugin to make the height of all selected elements exactly equal.</p>
<p><a href="https://wordpress.org/plugins/wp-term-images/">WP Term Images</a> by <a href="https://profiles.wordpress.org/johnjamesjacoby/">John James Jacoby </a>allows users to assign images to any visible category, tag, or taxonomy term using the media library, providing a customized look for taxonomies.</p>
<h2>WPWeekly Meta:</h2>
<p><strong>Next Episode:</strong> Wednesday, November 18th 9:30 P.M. Eastern</p>
<p><strong>Subscribe To WPWeekly Via Itunes: </strong><a href="https://itunes.apple.com/us/podcast/wordpress-weekly/id694849738" target="_blank">Click here to subscribe</a></p>
<p><strong>Subscribe To WPWeekly Via RSS: </strong><a href="http://www.wptavern.com/feed/podcast" target="_blank">Click here to subscribe</a></p>
<p><strong>Subscribe To WPWeekly Via Stitcher Radio: </strong><a href="http://www.stitcher.com/podcast/wordpress-weekly-podcast?refid=stpr" target="_blank">Click here to subscribe</a></p>
<p><strong>Listen To Episode #212:</strong><br />
</p>
<div id="epoch-width-sniffer"></div>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 12 Nov 2015 17:55:50 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Jeff Chandler";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:34;a:6:{s:4:"data";s:13:"
	
	
	
	
	
	
";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:34:"WPTavern: WP Remote Is Up for Sale";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=48911";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:44:"http://wptavern.com/wp-remote-is-up-for-sale";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:2556:"<p><a href="https://hmn.md/">Human Made LTD</a> is <a href="https://hmn.md/2015/11/06/wp-remote-deserves-a-better-home-so-were-selling-it/">selling</a> its WordPress remote management service <a href="https://wpremote.com">WP Remote</a>. Launched in 2009 as a plugin called Site Monitor, the service has evolved over time to allow users to upgrade themes, plugins, and WordPress remotely. The service allows an unlimited amount of sites to be tracked for free.</p>
<p>Human Made is not able to devote the time and resources necessary to maintain the service, even as it continues to do well. According to Tom Willmot, Co-founder and CEO of Human Made, the team backed out of the <a href="https://wpremote.com/2013/10/04/the-new-wpremote/">premium version</a> of the service due to a lack of resources:</p>
<blockquote><p>We had <a href="https://wpremote.com/blog/">ambitious plans for a version 2</a>, we <a href="https://wpremote.com/2013/10/04/the-new-wpremote/">introduced a premium version</a> that we backed out of because we didn’t have the resources to run and grow it, and we’ve got lots of great ideas both from its users and ourselves that we haven’t been able to act on. We’re too busy with other things, including Happytables, our client work, events, and more.</p></blockquote>
<p>WP Remote has over 18K users with more than 96K sites monitored. Here are some other notable statistics:</p>
<ul>
<li>1,850 people logged in during the past 30 days.</li>
<li>1,200 of those have more than five sites added to their account and 110 of them have more than 50 sites monitored.</li>
<li>In the past 30 days WP Remote was used to perform over 20,000 plugin updates.</li>
<li>Each week between 50 and 100 new users sign up and over half of them go on to add a site.</li>
</ul>
<p>Although WP Remote converted 60 free users to its premium service, the company eliminated it due to the lack of internal resources to support, develop, and market it. WP Remote also has key relationships with web hosting companies such as, Pressable, BlueHost, and SiteGround.</p>
<p>Before inquiring about purchasing the service, I recommend that you <a href="https://wpremote.com/2013/08/08/the-story-of-wp-remote/">read the history</a> on how it was created. If you&#8217;re interested in acquiring WP Remote or have questions, contact Tom at  <a href="mailto:tom@hmn.md">tom@hmn.md</a>. The company plans to decide who the buyer is by the end of February 2016 and is in early discussions with a few interested parties.</p>
<div id="epoch-width-sniffer"></div>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 12 Nov 2015 00:52:21 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Jeff Chandler";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:35;a:6:{s:4:"data";s:13:"
	
	
	
	
	
	
";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:53:"WPTavern: Pro Plugin Directory Is Seeking a New Owner";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=48913";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:63:"http://wptavern.com/pro-plugin-directory-is-seeking-a-new-owner";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:3263:"<p>Steven Gliebe, creator of<a href="https://proplugindirectory.com/"> Pro Plugin Directory,</a> is looking for <a href="https://proplugindirectory.com/for-sale/">a new owner</a>. The site launched earlier this year and has more than 170 plugins listed in the directory. Gliebe doesn&#8217;t have the time to manage the project anymore and is looking to give it to someone who is capable of maximizing the site&#8217;s potential.</p>
<p>Since May of this year, commercial plugin developers have slowly added their products to the directory. Gliebe explains his original strategy for monetizing the site, &#8220;Build the directory up (get authors to list their plugins) in order to attract traffic (plugin buyers) then monetize it with display ads, affiliate links and/or sponsorships (not yet started).&#8221;</p>
<p>Gliebe spends 1-2 hours per week managing the directory which includes, moderating submissions, moderating comments, moderating reviews, answering emails, and responding to tweets. He suggests that the new owner will need to spend more time marketing in order for the project to keep growing.</p>
<p>One of the most interesting parts of the sale offer is where Gliebe explains what powers the site:</p>
<blockquote><p>The site is powered by Easy Digital Downloads, the <a href="https://easydigitaldownloads.com/downloads/frontend-submissions/" target="_blank">Frontend Submissions</a> extension, the <a href="https://easydigitaldownloads.com/downloads/product-reviews/" target="_blank">Product Reviews</a> extension and Array’s <a href="https://arraythemes.com/themes/checkout-wordpress-theme/" target="_blank">Checkout</a> theme (using a child theme for customizations like showing categories on the homepage).</p></blockquote>
<p>Looking at the analytics, the site is experiencing low traffic numbers compared to when the site was launched. However, organic search traffic is steadily rising thanks to the content published on the <a href="https://proplugindirectory.com/blog/">site&#8217;s blog</a>.</p>
<a href="http://i2.wp.com/wptavern.com/wp-content/uploads/2015/11/ProPluginTrafficStats.png" rel="attachment wp-att-48925"><img class="size-full wp-image-48925" src="http://i2.wp.com/wptavern.com/wp-content/uploads/2015/11/ProPluginTrafficStats.png?resize=814%2C1216" alt="Pro Plugin Directory Traffic" /></a>Pro Plugin Directory Traffic
<p>Outside of Codecanyon, Pro Plugin Directory is one of the only other directories exclusively catered to commercial plugins. Here&#8217;s what Gliebe will give the buyer after purchasing the site:</p>
<blockquote><p>The buyer will receive the domain, website files, database dump, mailing lists and Twitter account. Easy Digital Downloads add-on licenses and Checkout theme licenses will be transferred. You will need to purchase a new SSL certificate. I am looking for a capable buyer but if you require migration assistance or technical support after the sale, I will offer my services at $200/hour (five hours max).</p></blockquote>
<p>Escrow will be used to facilitate the sale between both parties. If you&#8217;re interested in taking over the site or have questions, <a href="https://proplugindirectory.com/contact/">contact Steven Gliebe.</a></p>
<div id="epoch-width-sniffer"></div>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 11 Nov 2015 22:51:59 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Jeff Chandler";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:36;a:6:{s:4:"data";s:13:"
	
	
	
	
	
	
";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:73:"Post Status: How to design a commercial WordPress theme — Draft podcast";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:31:"https://poststatus.com/?p=14888";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:80:"https://poststatus.com/how-to-design-a-commercial-wordpress-theme-draft-podcast/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:2386:"<p>Welcome to the Post Status Draft podcast, which you can find <a href="https://itunes.apple.com/us/podcast/post-status-draft-wordpress/id976403008">on iTunes</a>, <a href="http://www.stitcher.com/podcast/krogsgard/post-status-draft-wordpress-podcast">Stitcher</a>, and <a href="http://simplecast.fm/podcasts/1061/rss">via RSS</a> for your favorite podcatcher.</p>
<p>Joe is away this week, so Brian goes solo. Brian highlights WordCamp US and A Day of REST and describes why you should attend these events. He also tells the story of his first ever WordCamp San Francisco (the precursor to WCUS). Then, he interviews Mike McAlister, of Array Themes, and they talk about the process of building a commercial WordPress theme from the ground up.</p>
<p>The interview with Mike starts around 14 minutes in.</p>
<a href="https://audio.simplecast.fm/19978.mp3">https://audio.simplecast.fm/19978.mp3</a>
<p><a href="http://audio.simplecast.fm/19978.mp3">Direct Download</a><br />
<strong>Topics &amp; Links</strong></p>
<h3>Event Links</h3>
<ul>
<li><a href="https://2015.us.wordcamp.org/">WordCamp US</a></li>
<li><a href="https://feelingrestful.com/">A Day of REST</a></li>
<li><a href="https://poststatus.com/a-day-of-rest-a-conference-devoted-to-the-wordpress-rest-api/">Brian&#8217;s post on A Day of REST</a></li>
<li><a href="https://sf.wordcamp.org/2014/my-first-wordcamp-san-francisco/">Brian&#8217;s first WordCamp SF</a></li>
<li><a href="https://poststatus.com/product/wordcamp-us-party/">Post Status and Pagely party</a></li>
<li><a href="https://poststatus.com/club/">Join the Post Status Club</a></li>
<li><a href="https://poststatus.com/the-wordpress-rest-api-draft-podcast/">Podcast on the REST API</a></li>
</ul>
<h3>Interview with Mike</h3>
<ul>
<li><a href="https://arraythemes.com/">Array Themes</a></li>
<li>Previous<a href="https://poststatus.com/array-wordpress-theme-business-mike-mcalister/"> interview with Mike</a></li>
<li><a href="http://typecast.com/">Typecast</a> for testing typefaces</li>
<li><a href="https://www.typewolf.com/">Typewolf</a> for type inspiration and resources</li>
<li><a href="https://poststatus.com/playing-with-type/">Playing with type</a></li>
<li>Brian&#8217;s 2010 article on the <a href="http://wpcandy.com/thinks/is-there-a-profit-ceiling-to-the-premium-theme-market/#.VkOQb66rTeQ">profit ceiling in the theme market</a></li>
</ul>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 11 Nov 2015 19:13:28 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:14:"Katie Richards";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:37;a:6:{s:4:"data";s:13:"
	
	
	
	
	
	
";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:61:"WPTavern: BuddyPress 2.3.5 Patches Privilege Escalation Issue";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=48918";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:71:"http://wptavern.com/buddypress-2-3-5-patches-privilege-escalation-issue";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:994:"<p>BuddyPress 2.3.5 <a href="https://buddypress.org/2015/11/buddypress-2-3-5/">is available</a> and patches a security vulnerability that may allow privilege escalation for logged-in users. BuddyPress 2.3.4 and previous versions are affected however, versions 2.0.4, 2.1.2, and 2.2.4 include the patch.</p>
<p>According to the BuddyPress development team, there is no evidence that the bug has been exploited in the wild. If your WordPress site supports automatic updates to point releases, it will likely be updated by the time you read this post.</p>
<p><a href="https://profiles.wordpress.org/slaFFik">Slava Abakumov</a> discovered the vulnerability and <a href="https://make.wordpress.org/core/handbook/reporting-security-vulnerabilities/">responsibly disclosed</a> it to the development team. If you run into any issues with the update, you&#8217;re encouraged to post on the BuddyPress <a href="https://buddypress.org/support/">support forums</a>.</p>
<div id="epoch-width-sniffer"></div>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 11 Nov 2015 07:42:53 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Jeff Chandler";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:38;a:6:{s:4:"data";s:13:"
	
	
	
	
	
	
";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:42:"Matt: Arthur C. Clarke on Distributed Work";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:21:"http://ma.tt/?p=45546";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:57:"http://ma.tt/2015/11/arthur-c-clarke-on-distributed-work/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:1737:"<p><span class="embed-youtube"></span></p>
<p>I saw the new Steve Jobs movie a few days ago, which I enjoyed as a movie even though <a href="http://daringfireball.net/linked/2015/10/22/mossberg-steve-jobs">the main elements were fiction and it should have been titled something else</a>.</p>
<p>But they had an awesome video interview with <a href="https://en.wikipedia.org/wiki/Arthur_C._Clarke">the amazing Arthur C. Clarke</a> in 1974, which I&#8217;ve embedded above, where he said the following right around 0:56.</p>
<blockquote><p>Interviewer: I wonder though, what sort of a life will it be in social terms if our whole life is built around the computer, if we become a computer-dependent society, computer-dependent individuals.</p>
<p>ACC: In some ways, but they&#8217;ll also enrich our society because it&#8217;ll make it possible for us to live anywhere we like. Any businessman, any executive could live almost anywhere on earth and still do his business through a device like this, and this is a wonderful thing, it means we won&#8217;t have to be stuck in cities, we can live out in the country or wherever we please, and still carry on complete interaction with human beings, as well as with other computers.</p></blockquote>
<p>Wow, extremely prescient. Remember, this was 1974! The dominant technology companies of today still follow the same office-centric model as when computers took up entire rooms, but the dominant companies of tomorrow will be built and grow in a completely distributed fashion. (And of course, <a href="https://automattic.com/work-with-us/">we&#8217;re hiring</a>.)</p>
<p>See also, from 2012: <a href="http://ma.tt/2012/09/future-of-work/">Automattic, Forbes, and the Future of Work</a>.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Tue, 10 Nov 2015 22:00:00 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:4:"Matt";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:39;a:6:{s:4:"data";s:13:"
	
	
	
	
	
	
";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:63:"WPTavern: More Than 250 Tickets Still Available for WordCamp US";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=48902";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:73:"http://wptavern.com/more-than-250-tickets-still-available-for-wordcamp-us";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:2861:"<a href="http://i2.wp.com/wptavern.com/wp-content/uploads/2014/10/WordCampUSAFeaturedImage.png" rel="attachment wp-att-32754"><img class="size-full wp-image-32754" src="http://i2.wp.com/wptavern.com/wp-content/uploads/2014/10/WordCampUSAFeaturedImage.png?resize=640%2C276" alt="WordCamp USA Featured Image" /></a>photo credit: <a href="https://www.flickr.com/photos/vgrigoriu/363904283/">vgrigoriu</a> &#8211; <a href="http://creativecommons.org/licenses/by-nc-sa/2.0/">cc</a>
<p>In a little less than a month, the first annual <a href="https://2015.us.wordcamp.org/">WordCamp US</a> will be underway in Philadelphia, PA. There&#8217;s still <a href="https://2015.us.wordcamp.org/tickets/">251 tickets available</a> to attend the event in person. The <a href="https://2015.us.wordcamp.org/schedule/">schedule and sessions</a> are published and it looks like an informational packed two-day event.</p>
<p>There are three tracks available, two of which will have typical length sessions with a third track dedicated to lightning talks. I highly encourage you to <a href="https://2015.us.wordcamp.org/schedule/">view the schedule</a> and create a list of sessions to attend as the first day has over 40 of them.</p>
<p>Reed Gustow, one of the event&#8217;s primary organizers says they&#8217;re expecting a lot of attendees, &#8220;We&#8217;re expecting 2,000 attendees from across the United States and from many other countries, and it will be a wonderful opportunity to learn, share knowledge and meet others in the amazing WordPress community.&#8221;</p>
<p>In addition to WordCamp US, there will be a <a href="https://2015.us.wordcamp.org/2015/11/09/join-us-for-the-wordcamp-us-contributor-day/">WordPress contributor day</a> on December 6th. During contributor day, people from all walks of life get together and contribute to various parts of the WordPress project whether it&#8217;s the support forums, core code, documentation, and more. Mentors will be on hand to help new contributors.</p>
<p>Last but not least, the most important information is where to eat a great tasting cheesesteak. After all, it&#8217;s one of the things <a href="http://www.visitphilly.com/itineraries/philadelphia/where-to-find-the-best-cheesesteaks-in-philadelphia/">Philadelphia is known for</a>. The WordCamp US organizing team has you <a href="https://2015.us.wordcamp.org/2015/11/09/the-cheesesteak-post/">covered with a post</a> that describes the different types of cheesesteaks and where to find the best tasting ones.</p>
<p><a href="https://2015.us.wordcamp.org/location/">Hotel and venue information</a> for the event is on the WordCamp US website. Unfortunately, I&#8217;m not attending the event this year, but <a href="http://wptavern.com/contributors">Sarah Gooding</a> will be there. If you see her, stop her and say hi.</p>
<div id="epoch-width-sniffer"></div>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Tue, 10 Nov 2015 05:39:14 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Jeff Chandler";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:40;a:6:{s:4:"data";s:13:"
	
	
	
	
	
	
";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:77:"WPTavern: A Quarter of the Top 10 Million Sites Ranked by Alexa Use WordPress";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=48885";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:87:"http://wptavern.com/a-quarter-of-the-top-10-million-sites-ranked-by-alexa-use-wordpress";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:4996:"<p>According to Matthias Gelbmann of <a href="http://w3techs.com">W3Techs</a>, 25% of the <a href="http://w3techs.com/blog/entry/wordpress-powers-25-percent-of-all-websites">sites it surveys</a> are using WordPress. The milestone comes two years after reaching the 20% mark.</p>
<a href="http://i0.wp.com/wptavern.com/wp-content/uploads/2015/11/QuarterOfTheWebWP.png" rel="attachment wp-att-48888"><img class="size-full wp-image-48888" src="http://i0.wp.com/wptavern.com/wp-content/uploads/2015/11/QuarterOfTheWebWP.png?resize=557%2C398" alt="Quarter of the Web" /></a>Quarter of the Web
<p>The following image shows WordPress&#8217; rapid growth from 13.1% in January 2011 to 25% today.</p>
<a href="http://i0.wp.com/wptavern.com/wp-content/uploads/2015/11/UsageHistory.png" rel="attachment wp-att-48889"><img class="size-full wp-image-48889" src="http://i0.wp.com/wptavern.com/wp-content/uploads/2015/11/UsageHistory.png?resize=900%2C298" alt="WordPress\' Growth" /></a>WordPress&#8217; Growth
<p>Drupal and Joomla, two other popular open source content management systems combine for 4.9%, slightly less than 1/5th of WordPress.</p>
<p>W3Techs counts both self hosted WordPress and WordPress.com sites, &#8220;We only count the hosted sites if they are reachable via their own domain (not only as subdomain of wordpress.com), and they must qualify like all other sites in our surveys by getting enough visitors on that separate domain to make it into the top 10 million Alexa sites,&#8221; Gelbmann says.</p>
<p>This means that only those sites on WordPress.com that use domain mapping and have enough traffic to be in the top 10 million Alexa sites are counted leaving millions of WordPress.com sites uncounted. Only 1.25% of WordPress sites in the survey are hosted at WordPress.com.</p>
<h2>The Fastest Growing CMS</h2>
<p>The survey also shows that WordPress is still the fastest growing CMS, &#8220;Every 74 seconds a site within the top 10 million starts using WordPress. Compare this with Shopify, the second-fastest growing CMS, which is gaining a new site every 22 minutes,&#8221; Gelbmann says.</p>
<p>When sites are broken down into languages, WordPress is used on 37.3% of English language sites. Portuguese, Spanish, Swedish and Turkish sites are inbetween 38-40% while Bengali is 51.3% and 54.4% for Bosnian. Only 10.6% of WordPress sites are in Chinese with 6.9% for Korean.</p>
<p>About 94% of sites surveyed use a Unix-like operating system such as Ubuntu. Windows servers host 6.2% of WordPress sites making it the most popular CMS running on Windows servers.</p>
<p>Matt Mullenweg, Co-founder of the WordPress project, says the <a href="http://ma.tt/2015/11/seventy-five-to-go/">largest opportunity for growth</a> is in the 57% of sites not using <em>any</em> identifiable CMS. Earlier this year, we learned that <a href="http://wptavern.com/how-important-is-jetpack-on-wordpress-road-to-50-market-share">Jetpack is going to play a significant role</a> in WordPress gaining 50% or more of market share.</p>
<p>In an <a href="http://kitchensinkwp.com/podcast-e048-interview-with-matt-mullenweg/" target="_blank">interview with Adam Silver on the KitchensinkWP podcast</a>, Mullenweg explains the path to 50% and beyond.</p>
<blockquote><p>The next goal is the majority of websites. We want to get to 50%+ and there’s a lot of work between now and then. As the percentage increases, it gets harder and harder to grow the market share, and we have to grow the market share by doing things we haven’t done in the past – really thinking about the onboarding process, really thinking about the integration with social networks, and with how WordPress works on touch devices, which is going to be the predominant computing platform of the future. These things are going to be really important.</p>
<p>What got us here isn’t going to get us there. Once we get to 50%, we can decide something new we want to do</p></blockquote>
<p>Automattic is experimenting with a new side project called <a href="https://github.com/automattic/jetpack-onboarding">Jetpack Onboarding</a>. The project is an attempt to improve WordPress&#8217; new user experience. Hosting companies that choose to implement it can modify, add, or remove steps.</p>
<a href="http://i2.wp.com/wptavern.com/wp-content/uploads/2015/11/JetpackOnboardingScreen.png" rel="attachment wp-att-48891"><img class="size-full wp-image-48891" src="http://i2.wp.com/wptavern.com/wp-content/uploads/2015/11/JetpackOnboardingScreen.png?resize=1025%2C469" alt="Jetpack Onboarding Screen" /></a>Jetpack Onboarding Wizard
<p>Keep in mind that W3Techs&#8217; market share numbers are based on the top 10 million sites in Alexa. Fifty percent market share is 5 million of those 10 million sites. Are these the sites WordPress should be targeting with development efforts? Are they more important than the millions of sites not ranked by Alexa? I don&#8217;t think so but only time will tell.</p>
<div id="epoch-width-sniffer"></div>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Tue, 10 Nov 2015 04:34:26 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Jeff Chandler";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:41;a:6:{s:4:"data";s:13:"
	
	
	
	
	
	
";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:21:"Matt: AVC On Tracking";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:21:"http://ma.tt/?p=45572";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:37:"http://ma.tt/2015/11/avc-on-tracking/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:524:"<blockquote><p>If you listed the habits of successful people, tracking and measuring would be near the top of that list. I see it with people, companies, and teams that I work with. I see it in my own behavior.</p></blockquote>
<p>Fred Wilson writes on <a href="http://avc.com/2015/11/track-and-measure/">Tracking and Measuring</a>. Lack of measurement &#8212; picking stats and watching them before and after a launch &#8212; is one of the most common mistakes I see product teams make, certainly inside of Automattic.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 09 Nov 2015 23:29:30 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:4:"Matt";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:42;a:6:{s:4:"data";s:13:"
	
	
	
	
	
	
";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:24:"Matt: Seventy-Five to Go";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:21:"http://ma.tt/?p=45568";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:40:"http://ma.tt/2015/11/seventy-five-to-go/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:1391:"<p>People are abuzz because it looks like the <a href="http://w3techs.com/">W3Techs survey</a> of the web <a href="http://w3techs.com/technologies/history_overview/content_management/all/y">now has WordPress at 25% market share</a>.</p>
<p><a href="https://cloudup.com/cys3qUJxyRT"><img src="https://cldup.com/jX4J6C_emK-900x900.png" alt="Screen Shot" width="900" height="298" /></a></p>
<p>Sometimes it goes up and down through the course of a month, but it&#8217;s still a pretty fun milestone that we can now say about one in four websites are now powered by the <a href="https://wordpress.org/">scrappy open source underdog</a> with its roots stretching all the way back to a single person in Corsica, France. We should be comfortably past 25% by the end of the year.</p>
<p>The big opportunity is still the 57% of websites that don&#8217;t use <em>any</em> identifiable CMS yet, and that&#8217;s where I think there is still a ton of growth for us (and I&#8217;m also rooting for all the other open source CMSes).</p>
<p>If you want to celebrate with us <a href="https://2015.us.wordcamp.org/">come to the first-ever WordCamp US event next month in Philadelphia</a> (tickets still available) &#8212; it&#8217;s shaping up to be an amazing event. We just <a href="https://2015.us.wordcamp.org/schedule/">published the schedule and there are some amazing speakers and sessions</a>.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Sun, 08 Nov 2015 13:15:57 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:4:"Matt";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:43;a:6:{s:4:"data";s:13:"
	
	
	
	
	
	
";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:58:"WPTavern: How Not to Communicate Grievances with WordPress";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=48861";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:68:"http://wptavern.com/how-not-to-communicate-grievances-with-wordpress";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:9778:"<p>A few days ago, <a href="http://wptavern.com/how-non-developers-can-contribute-to-and-influence-wordpress-core-development">I offered advice</a> on how non-developers can contribute to and influence core WordPress development. Communicating online is hard but where and how you communicate affects the likelihood of making an impact.</p>
<p><a href="https://www.cmscritic.com/">CMS Critic</a> is a site I&#8217;ve read for years as it routinely publishes articles on a variety of content management systems, including WordPress.</p>
<p>In late October, Kaya Ismail <a href="http://www.cmscritic.com/how-wordpress-needs-to-improve-itself/">published an article</a> that describes how WordPress needs to improve itself in six ways. What could have been a great article, is instead a great example of <strong>how not to</strong> communicate grievances you have with WordPress.</p>
<h2>Twenty Sixteen Developers Are Lazy</h2>
<p>Many people, including myself <a href="http://wptavern.com/first-look-at-the-twenty-sixteen-default-wordpress-theme#comments">have an opinion</a> of the Twenty Sixteen theme in WordPress 4.4. Ismail thinks the developers behind the theme are lazy.</p>
<blockquote><p>I totally understand that WordPress doesn&#8217;t need to compete with the massive library of third-party themes available out there, but that doesn&#8217;t mean that they should lead with a default theme as bad as that. It&#8217;s nothing short of lazy.</p></blockquote>
<p>Tammie Lister, Takashi Irie, and others continue to work hard on Twenty Sixteen to prepare it for the WordPress 4.4 release in December. They are far from lazy people making Ismail&#8217;s opinion more of an insult. He doesn&#8217;t provide any examples or ideas on what should be in a default theme.</p>
<h2>The WordPress Plugin Directory</h2>
<p>According to Ismail, the WordPress plugin directory is filled with large chunks of trash in addition to great plugins. While some plugins in the directory could be coded better, his explanation falls short of describing a solution.</p>
<blockquote><p>Many plugins simply don&#8217;t work, while many more are poorly put together, which in turn makes WordPress as a platform harder to use. Quality control needs to improve.</p></blockquote>
<p>He doesn&#8217;t link to plugins that are broken, provide any code samples, or show where quality control is lacking. His statement is an assumption that&#8217;s not backed by evidence.</p>
<p>Those who <a href="http://wptavern.com/behind-the-scenes-in-the-wordpress-plugin-directory-with-mika-epstein">oversee the plugin directory</a> don&#8217;t test every submitted plugin to make sure it works with WordPress. Among other things, their job is to make sure plugin submissions don&#8217;t have security issues. If the moderators performed quality control on every plugin, the submission queue would likely have a substantial backlog.</p>
<p>Instead of writing baseless assumptions, Ismail should monitor the <a href="https://make.wordpress.org/plugins/">Make WordPress Plugins</a> site to stay on top of what&#8217;s going on with the plugin directory and submit feedback where necessary. If a broken plugin is discovered, he should create a forum thread within the plugin&#8217;s support area.</p>
<p>This way, his feedback is seen by those who directly control the WordPress plugin directory. The simple act of reporting a broken plugin to the developer is a major step towards being part of the solution and not the problem.</p>
<h2>Admin Menu Clutter</h2>
<p>I agree with Ismail&#8217;s opinion that the WordPress admin menus can become cluttered if the right plugins are activated. At least in this case, he suggests an alternative.</p>
<blockquote><p>I&#8217;d like to see WordPress group third-party menu options together, in a way that&#8217;s a little more organized and less intrusive. Perhaps this can be done by giving them a sub-section within the menu which can be collapsed. The solution itself is up to them, but the problem is evident.</p></blockquote>
<p>There <a href="https://codex.wordpress.org/Administration_Menus">are guidelines</a> for when plugin developers should create top-level or sub-level menu items but they&#8217;re not followed as well as they could be. Without strictly enforcing these guidelines, it&#8217;s out of WordPress&#8217; hands. The complaint is aimed in the wrong direction and should point towards third-party developers, not WordPress itself.</p>
<p>If you want more control in how items are displayed in the admin menu, I recommend using the <a href="https://wordpress.org/plugins/menu-humility/">Menu Humility</a> plugin by Mark Jaquith.</p>
<h2>Akismet is Not Enough</h2>
<p>According to Ismail, comment spam is a major issue with WordPress sites and Akismet doesn&#8217;t do enough to stop it.</p>
<blockquote><p>Akismet, a spam comment filter, now comes with every WordPress install &#8211; which is a good thing. But the free version doesn&#8217;t do enough for me, as comments still pile up in the back end. If you ask me, WordPress needs to find another way to turn the unrelenting tide of spam.</p></blockquote>
<p>To clarify, Akismet has been bundled with WordPress since <a href="https://wordpress.org/news/2005/12/wp2/">version 2.0</a> and there&#8217;s no difference between the free and commercial versions in how Akismet protects sites. He doesn&#8217;t provide any suggestions on what WordPress could do to thwart spam but says it has to do something.</p>
<p>What are members of the WordPress core team supposed to do with this kind of feedback? It&#8217;s not helpful, doesn&#8217;t provide any ideas, and is easy to discard.</p>
<h2>Updates are Hard</h2>
<p>Depending on your webhost&#8217;s configuration, updating themes, plugins, and WordPress is as simple as clicking a button. For the more adventurous, you can configure them to happen automatically. For Ismail, the update process is difficult.</p>
<blockquote><p>Updating a plugin may cause conflicts between it and another plugin. Updating a theme can erase your modifications (unless you use a child theme), whereas updating WordPress itself can render a variety of your plugins redundant until their developers apply a patch. Confused yet? You should be.</p></blockquote>
<p>He makes a few good points but editing a theme instead of a child theme is like editing WordPress core files which should almost never happen. It&#8217;s true that there is a slight risk of <a href="http://wptavern.com/plugin-developers-demand-a-better-security-release-process-after-wordpress-4-2-3-breaks-thousands-of-websites">things breaking</a> after an update but it&#8217;s more of an anomaly than a common occurrence.</p>
<p>Ismail suggests that WordPress look into preserving theme changes across the board and to provide alerts if  plugins interfere with each other. I like these suggestions and my hope is that one day, WordPress will be able to create a snapshot during the update process to provide assurance that the site won&#8217;t break after an update is applied.</p>
<h2>WordPress Hack-a-thon</h2>
<p>Ismail&#8217;s last point is how WordPress can improve its security.</p>
<blockquote><p>I think we can all agree that WordPress needs to beef itself up (by shoring up its admin login page, for example), but I call for it to go a step further and start offering better protection, even if it comes at a small price.</p>
<p>Third party solutions exist, sure. But why should I have to patch together several security plugins, each with their own confusing settings, just to secure my website? Many WordPress users have become accustom to handling their own security in this way; but I think WordPress needs to take on more responsibility.</p></blockquote>
<p>He wants WordPress to go a step further and offer better protection but doesn&#8217;t say what that protection is. He also doesn&#8217;t explain where, how, or why WordPress should take on more responsibility to make sites more secure.</p>
<h2>Be Part of the Solution, Not the Problem</h2>
<p>Ismail concludes his article by saying it&#8217;s time for WordPress to innovate. He also says, &#8220;The onus isn&#8217;t on me to provide the solution, it&#8217;s upon WordPress. And it&#8217;s about time they started coming up with innovative solutions for their long-standing issues.&#8221;</p>
<p>The article is <a href="https://www.cmscritic.com/wordpress-4.4-beta-bare-bones/">another example</a> of how CMS Critic chooses not to be part of the solution. Everyone is entitled to their opinions, but airing grievances which sound more like demands and telling core developers to start innovating is not a recipe for results.</p>
<p><a href="http://www.smashingmagazine.com/2013/05/contributing-to-wordpress/">This quote</a> from WordPress core developer, Mark Jaquith, eloquently describes how important communication skills are in an open source project.</p>
<blockquote><p>The number one skill you need for just about any job, but specifically working on open source, is communication skills. You need to have clarity, consistency, compassion, relatability, a little bit of a thick skin and a decent sense of humor.</p></blockquote>
<p>The onus may not be on Ismail or any of us to come up with solutions, but he and others can help discover and be part of solutions by taking an active role in giving constructive feedback in <a href="http://hughlashbrooke.com/2015/11/03/a-non-developers-guide-to-getting-involved-in-wordpress-core-development/">the right place</a>. WordPress has its fair share of issues but there are <a href="http://www.smashingmagazine.com/2013/05/contributing-to-wordpress/">plenty of opportunities</a> for people to step up and contribute to make the software better.</p>
<div id="epoch-width-sniffer"></div>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 06 Nov 2015 18:52:26 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Jeff Chandler";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:44;a:6:{s:4:"data";s:13:"
	
	
	
	
	
	
";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:80:"WPTavern: Jetpack 3.8 Adds Google+ Badges and Fixes Contact Form Response Emails";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=48853";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:89:"http://wptavern.com/jetpack-3-8-adds-google-badges-and-fixes-contact-form-response-emails";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:3200:"<p>Jetpack 3.8 is <a href="http://jetpack.me/2015/11/04/jetpack-3-8-google-badges-and-more/">available for download</a> and includes, Google+ badges, Twitch.TV embed shortcode, improvements to the contact form module, and bug fixes.</p>
<p>Users can now display a Google+ Badge widget that shows your Google+ profile, page, or community.</p>
<a href="http://i2.wp.com/wptavern.com/wp-content/uploads/2015/11/GooglePlusBadgeSettings.png" rel="attachment wp-att-48854"><img class="size-full wp-image-48854" src="http://i2.wp.com/wptavern.com/wp-content/uploads/2015/11/GooglePlusBadgeSettings.png?resize=443%2C493" alt="Google Plus Badge Settings" /></a>Google Plus Badge Settings
<p>You can configure the badge&#8217;s width, layout, and choose between a light or dark color scheme. A Google+ icon has also been added to the Social Media Icons widget bringing the total number of available icons to nine.</p>
<p>Those who use the Shortcode Embeds module can now easily embed videos from <a href="http://www.twitch.tv/">Twitch.tv</a> using the <a href="https://en.support.wordpress.com/videos/twitch-tv-shortcode/">[ twitchtv ] shortcode</a>. The shortcode&#8217;s attributes allow you to modify the width, height, and whether or not the video autoplays.</p>
<p>In previous versions of Jetpack, the Contact Form module checkbox field type was limited to a single item. In Jetpack 3.8, check box field types can have multiple items.</p>
<a href="http://i1.wp.com/wptavern.com/wp-content/uploads/2015/11/JetpackContactFormMultipleFields.png" rel="attachment wp-att-48855"><img class="size-full wp-image-48855" src="http://i1.wp.com/wptavern.com/wp-content/uploads/2015/11/JetpackContactFormMultipleFields.png?resize=746%2C713" alt="Multiple Options Field" /></a>Multiple Options Field
<p>One of my favorite enhancements in Jetpack 3.8 is the improved styling to contact form email responses. In previous versions of Jetpack, emails <a href="https://github.com/Automattic/jetpack/issues/49">didn&#8217;t match the order of the fields</a> within the contact form. Now, any responses to the contact form will show up in the order you set.</p>
<p>Other notable improvements in Jetpack 3.8 include:</p>
<ul>
<li>Lots of new filters to allow further customization of Jetpack.</li>
<li>Better error messaging for Subscription Widget sign up forms.</li>
<li>Improvements and enhancements to accessibility.</li>
</ul>
<p>In addition to features and bug fixes, this release contains contributions from Daisuke Takahashi and Eduardo Reveles. Takahashi lives in Japan and is responsible for the Google+ Badge Widget. Reveles not only filed a <a href="https://github.com/osiux">substantial amount of issue reports on Github</a> but also submitted a lot of patches.</p>
<p>These two are among a group of more than 40 people who worked on Jetpack 3.8. Check out Jetpack&#8217;s <a href="http://jetpack.me/contribute/">contribute page</a> if you&#8217;d like to get involved with the project. Also, be sure to read how you can <a href="http://wptavern.com/jetpack-relaunches-beta-testing-program">join the Jetpack beta testing team</a> to be among the first to test new features.</p>
<div id="epoch-width-sniffer"></div>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 06 Nov 2015 07:12:34 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Jeff Chandler";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:45;a:6:{s:4:"data";s:13:"
	
	
	
	
	
	
";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:31:"Matt: Most Miles of Road: Texas";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:21:"http://ma.tt/?p=45563";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:46:"http://ma.tt/2015/11/most-miles-of-road-texas/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:405:"<p>I was wondering the other day how many miles of road were in every state, and guessed that Texas must be the highest. It turns out it is, <a href="http://blog.cubitplanning.com/2010/02/road-miles-by-state/">according to this list of the road mileage of every state</a>. It&#8217;s about 70% more than the runner-up, California. After TX and CA, it&#8217;s Illinois, Kansas, Minnesota, and Missouri.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 05 Nov 2015 16:20:01 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:4:"Matt";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:46;a:6:{s:4:"data";s:13:"
	
	
	
	
	
	
";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:52:"WPTavern: Justin Tadlock Explains Taxonomy Term Meta";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=48843";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:62:"http://wptavern.com/justin-tadlock-explains-taxonomy-term-meta";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:1323:"<p>While developers celebrate the <a href="http://wptavern.com/the-first-half-of-the-rest-api-is-officially-added-to-wordpress-core">first half of the WordPress REST API</a> being merged into WordPress, there&#8217;s also another reason to celebrate. Six years <a href="https://core.trac.wordpress.org/ticket/10142">in the making</a>, taxonomy term meta <a href="https://make.wordpress.org/core/2015/10/23/4-4-taxonomy-roundup/">will be available</a> in WordPress 4.4.</p>
<p>If you&#8217;re like me and don&#8217;t have a clue as to what taxonomy term meta is, I highly encourage you to read Justin Tadlock&#8217;s <a href="http://themehybrid.com/weblog/introduction-to-wordpress-term-meta">explanation and tutorial</a>. In the post, Tadlock explains why term meta is significant and some of the possibilities it affords developers.</p>
<p>After reading through the tutorial, I have a better understanding as to why developers are so excited. Not only does it create more opportunities to extend WordPress, but does so in a standard and expected way. Previous to WordPress 4.4, developers had to rely on work-arounds to add term meta to taxonomies.</p>
<p>Let us know what you think of the tutorial and how you plan to take advantage of this feature once WordPress 4.4 is released.</p>
<div id="epoch-width-sniffer"></div>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 05 Nov 2015 08:45:57 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Jeff Chandler";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:47;a:6:{s:4:"data";s:13:"
	
	
	
	
	
	
";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:75:"WPTavern: Easily Add Citations to Quotes With the Better Blockquotes Plugin";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=48833";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:85:"http://wptavern.com/easily-add-citations-to-quotes-with-the-better-blockquotes-plugin";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:2123:"<p><a href="https://github.com/devinsays/better-blockquotes">Better Blockquotes</a> is a free WordPress plugin created by <a href="http://wptheming.com/">Devin Price</a> that makes it easy to add citations to blockquotes. When a user clicks the blockquote button with no text highlighted, a dialogue box pops up with options to add a quote, citation, and a citation link.</p>
<a href="http://i2.wp.com/wptavern.com/wp-content/uploads/2015/11/BetterBlockquoteOptions.png" rel="attachment wp-att-48834"><img class="size-full wp-image-48834" src="http://i2.wp.com/wptavern.com/wp-content/uploads/2015/11/BetterBlockquoteOptions.png?resize=448%2C307" alt="Better Blockquote Options" /></a>Better Blockquote Options
<p>Citations are inserted into the post with HTML5 markup. The blockquote button retains its default behaviour with highlighted text. I tested the plugin on WordPress 4.4 beta 3 and it works as advertised.</p>
<p>I did notice however, that the citation displays immediately after the last character in the quote. I&#8217;d prefer to have</p>
<p>a space between the last character and the citation.</p>
<a href="http://i0.wp.com/wptavern.com/wp-content/uploads/2015/11/BetterBlockquotesVisualEditor.png" rel="attachment wp-att-48835"><img class="size-full wp-image-48835" src="http://i0.wp.com/wptavern.com/wp-content/uploads/2015/11/BetterBlockquotesVisualEditor.png?resize=593%2C321" alt="Better Blockquotes in the Visual Editor" /></a>Better Blockquotes in the Visual Editor
<p>An example of how better blockquotes looks in a post.</p>
<a href="http://i2.wp.com/wptavern.com/wp-content/uploads/2015/11/BetterBlockquotesInaPost.png" rel="attachment wp-att-48836"><img class="size-full wp-image-48836" src="http://i2.wp.com/wptavern.com/wp-content/uploads/2015/11/BetterBlockquotesInaPost.png?resize=605%2C195" alt="How a Blockquote Looks in a Post" /></a>How a Better Blockquote Looks in a Post
<p>Based on feedback, Price says he&#8217;ll attempt to add it to WordPress core as an enhancement. Is better blockquotes something you&#8217;d like to see added to WordPress?</p>
<div id="epoch-width-sniffer"></div>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 05 Nov 2015 00:08:34 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Jeff Chandler";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:48;a:6:{s:4:"data";s:13:"
	
	
	
	
	
	
";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:33:"Matt: Journalistic Accountability";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:21:"http://ma.tt/?p=45560";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:49:"http://ma.tt/2015/11/journalistic-accountability/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:522:"<p>Tech blog idea: A site that covers the top headlines on <a href="http://techmeme.com/">Techmeme</a> 6, 12, or 18 months after they happened, and explores the delta between what people said was going to happen when they raised funding, or did an acquisition, and what actually happens after time has run its course. We keep covering announcements like they matter. Can also compare analyst and commentator predictions for <a href="https://duckduckgo.com/?q=site%3Adaringfireball.net+claim+chowder">claim chowder</a>.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 04 Nov 2015 15:01:32 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:4:"Matt";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:49;a:6:{s:4:"data";s:13:"
	
	
	
	
	
	
";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:87:"WPTavern: How Non-Developers Can Contribute to and Influence WordPress Core Development";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=48823";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:97:"http://wptavern.com/how-non-developers-can-contribute-to-and-influence-wordpress-core-development";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:1995:"<p>If you don&#8217;t consider yourself a developer and want to contribute to WordPress core, <a href="http://hughlashbrooke.com/2015/11/03/a-non-developers-guide-to-getting-involved-in-wordpress-core-development/">Hugh Lashbrooke&#8217;s guide</a> offers a few different techniques. The guide explains how and where to provide feedback and how important it is to beta test new features.</p>
<p>Over the years, I&#8217;ve used WP Tavern to advocate for and against features in WordPress. One of the best pieces of advice I can give non-developers is to organize your thoughts or stance on a specific feature or direction and publish them on your site. This allows you to control the conversation and gives you plenty of space to explain your perspective.</p>
<p>A great example <a href="http://wptavern.com/help-me-add-comment-approval-notifications-to-wordpress">is this post</a> asking for help to add comment moderation approval notifications to WordPress. I explain why it&#8217;s needed with a <a href="https://core.trac.wordpress.org/ticket/33717">link to the ticket</a> I created to keep track of the conversation. I prefer to write about potential features and based on feedback, I&#8217;ll either create a trac ticket myself or someone will do it for me with a link to the post.</p>
<p>The Tavern is in the dashboard and is read by a large audience, including core developers. However, thanks to social media, a well constructed post with solid points will make the rounds on Twitter, Facebook, and within WordPress sub-communities.</p>
<p>It&#8217;s those posts and associated comments that serve as one of many foundations for change in WordPress without touching a line of code. Keep in mind that there&#8217;s no guarantee you&#8217;ll be able to directly influence WordPress core development with words alone, but respectful, in-depth conversations with differing opinions and perspectives are an important part of the community regardless.</p>
<div id="epoch-width-sniffer"></div>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 04 Nov 2015 08:42:11 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Jeff Chandler";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}}}}}}}}}}}}s:4:"type";i:128;s:7:"headers";a:10:{s:6:"server";s:5:"nginx";s:4:"date";s:29:"Fri, 04 Dec 2015 11:34:18 GMT";s:12:"content-type";s:8:"text/xml";s:14:"content-length";s:6:"213461";s:10:"connection";s:5:"close";s:4:"vary";s:15:"Accept-Encoding";s:13:"last-modified";s:29:"Fri, 04 Dec 2015 11:15:19 GMT";s:15:"x-frame-options";s:10:"SAMEORIGIN";s:4:"x-nc";s:11:"HIT lax 249";s:13:"accept-ranges";s:5:"bytes";}s:5:"build";s:14:"20130911040210";}', 'no' );
INSERT INTO `wp_options`(`option_id`,`option_name`,`option_value`,`autoload`) VALUES ( '307', '_transient_timeout_feed_mod_d117b5738fbd35bd8c0391cda1f2b5d9', '1449272065', 'no' );
INSERT INTO `wp_options`(`option_id`,`option_name`,`option_value`,`autoload`) VALUES ( '308', '_transient_feed_mod_d117b5738fbd35bd8c0391cda1f2b5d9', '1449228865', 'no' );
INSERT INTO `wp_options`(`option_id`,`option_name`,`option_value`,`autoload`) VALUES ( '309', '_transient_timeout_feed_b9388c83948825c1edaef0d856b7b109', '1449272067', 'no' );
INSERT INTO `wp_options`(`option_id`,`option_name`,`option_value`,`autoload`) VALUES ( '310', '_transient_feed_b9388c83948825c1edaef0d856b7b109', 'a:4:{s:5:"child";a:1:{s:0:"";a:1:{s:3:"rss";a:1:{i:0;a:6:{s:4:"data";s:3:"
	
";s:7:"attribs";a:1:{s:0:"";a:1:{s:7:"version";s:3:"2.0";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:1:{s:0:"";a:1:{s:7:"channel";a:1:{i:0;a:6:{s:4:"data";s:117:"
		
		
		
		
		
		
				

		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		

	";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:34:"WordPress Plugins » View: Popular";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:45:"https://wordpress.org/plugins/browse/popular/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:34:"WordPress Plugins » View: Popular";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"language";a:1:{i:0;a:5:{s:4:"data";s:5:"en-US";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 04 Dec 2015 11:11:32 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:9:"generator";a:1:{i:0;a:5:{s:4:"data";s:25:"http://bbpress.org/?v=1.1";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"item";a:30:{i:0;a:6:{s:4:"data";s:30:"
			
			
			
			
			
			
					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:21:"Regenerate Thumbnails";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:62:"https://wordpress.org/plugins/regenerate-thumbnails/#post-6743";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Sat, 23 Aug 2008 14:38:58 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"6743@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:76:"Allows you to regenerate your thumbnails after changing the thumbnail sizes.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:25:"Alex Mills (Viper007Bond)";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:1;a:6:{s:4:"data";s:30:"
			
			
			
			
			
			
					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:14:"Contact Form 7";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:55:"https://wordpress.org/plugins/contact-form-7/#post-2141";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 02 Aug 2007 12:45:03 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"2141@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:54:"Just another contact form plugin. Simple but flexible.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:16:"Takayuki Miyoshi";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:2;a:6:{s:4:"data";s:30:"
			
			
			
			
			
			
					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:9:"Yoast SEO";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:54:"https://wordpress.org/plugins/wordpress-seo/#post-8321";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 01 Jan 2009 20:34:44 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"8321@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:114:"Improve your WordPress SEO: Write better content and have a fully optimized WordPress site using Yoast SEO plugin.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Joost de Valk";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:3;a:6:{s:4:"data";s:30:"
			
			
			
			
			
			
					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:18:"Wordfence Security";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:51:"https://wordpress.org/plugins/wordfence/#post-29832";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Sun, 04 Sep 2011 03:13:51 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"29832@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:138:"The Wordfence WordPress security plugin provides free enterprise-class WordPress security, protecting your website from hacks and malware.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:9:"Wordfence";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:4;a:6:{s:4:"data";s:30:"
			
			
			
			
			
			
					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:11:"Hello Dolly";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:52:"https://wordpress.org/plugins/hello-dolly/#post-5790";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 29 May 2008 22:11:34 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"5790@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:150:"This is not just a plugin, it symbolizes the hope and enthusiasm of an entire generation summed up in two words sung most famously by Louis Armstrong.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:14:"Matt Mullenweg";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:5;a:6:{s:4:"data";s:30:"
			
			
			
			
			
			
					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:16:"TinyMCE Advanced";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:57:"https://wordpress.org/plugins/tinymce-advanced/#post-2082";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 27 Jun 2007 15:00:26 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"2082@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:71:"Enables the advanced features of TinyMCE, the WordPress WYSIWYG editor.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:10:"Andrew Ozz";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:6;a:6:{s:4:"data";s:30:"
			
			
			
			
			
			
					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:11:"WP-PageNavi";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:51:"https://wordpress.org/plugins/wp-pagenavi/#post-363";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 09 Mar 2007 23:17:57 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:34:"363@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:49:"Adds a more advanced paging navigation interface.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:11:"Lester Chan";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:7;a:6:{s:4:"data";s:30:"
			
			
			
			
			
			
					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:33:"WooCommerce - excelling eCommerce";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:53:"https://wordpress.org/plugins/woocommerce/#post-29860";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 05 Sep 2011 08:13:36 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"29860@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:97:"WooCommerce is a powerful, extendable eCommerce plugin that helps you sell anything. Beautifully.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:9:"WooThemes";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:8;a:6:{s:4:"data";s:30:"
			
			
			
			
			
			
					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:15:"NextGEN Gallery";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:56:"https://wordpress.org/plugins/nextgen-gallery/#post-1169";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 23 Apr 2007 20:08:06 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"1169@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:121:"The most popular WordPress gallery plugin and one of the most popular plugins of all time with over 13 million downloads.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:9:"Alex Rabe";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:9;a:6:{s:4:"data";s:30:"
			
			
			
			
			
			
					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:19:"Google XML Sitemaps";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:64:"https://wordpress.org/plugins/google-sitemap-generator/#post-132";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 09 Mar 2007 22:31:32 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:34:"132@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:105:"This plugin will generate a special XML sitemap which will help search engines to better index your blog.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:14:"Arne Brachhold";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:10;a:6:{s:4:"data";s:30:"
			
			
			
			
			
			
					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:7:"Akismet";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:46:"https://wordpress.org/plugins/akismet/#post-15";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 09 Mar 2007 22:11:30 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:33:"15@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:98:"Akismet checks your comments against the Akismet Web service to see if they look like spam or not.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:14:"Matt Mullenweg";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:11;a:6:{s:4:"data";s:30:"
			
			
			
			
			
			
					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:14:"W3 Total Cache";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:56:"https://wordpress.org/plugins/w3-total-cache/#post-12073";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 29 Jul 2009 18:46:31 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"12073@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:132:"Easy Web Performance Optimization (WPO) using caching: browser, page, object, database, minify and content delivery network support.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:16:"Frederick Townes";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:12;a:6:{s:4:"data";s:30:"
			
			
			
			
			
			
					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:18:"WordPress Importer";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:60:"https://wordpress.org/plugins/wordpress-importer/#post-18101";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 20 May 2010 17:42:45 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"18101@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:101:"Import posts, pages, comments, custom fields, categories, tags and more from a WordPress export file.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:14:"Brian Colinger";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:13;a:6:{s:4:"data";s:30:"
			
			
			
			
			
			
					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:25:"Google Analytics by Yoast";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:71:"https://wordpress.org/plugins/google-analytics-for-wordpress/#post-2316";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 14 Sep 2007 12:15:27 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"2316@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:124:"Track your WordPress site easily with the latest tracking codes and lots added data for search result pages and error pages.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Joost de Valk";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:14;a:6:{s:4:"data";s:30:"
			
			
			
			
			
			
					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:24:"Jetpack by WordPress.com";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:49:"https://wordpress.org/plugins/jetpack/#post-23862";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 20 Jan 2011 02:21:38 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"23862@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:27:"Your WordPress, Simplified.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:9:"Tim Moore";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:15;a:6:{s:4:"data";s:30:"
			
			
			
			
			
			
					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:14:"WP Super Cache";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:55:"https://wordpress.org/plugins/wp-super-cache/#post-2572";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 05 Nov 2007 11:40:04 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"2572@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:73:"A very fast caching engine for WordPress that produces static html files.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:16:"Donncha O Caoimh";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:16;a:6:{s:4:"data";s:30:"
			
			
			
			
			
			
					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:21:"Really Simple CAPTCHA";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:62:"https://wordpress.org/plugins/really-simple-captcha/#post-9542";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 09 Mar 2009 02:17:35 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"9542@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:138:"Really Simple CAPTCHA is a CAPTCHA module intended to be called from other plugins. It is originally created for my Contact Form 7 plugin.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:16:"Takayuki Miyoshi";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:17;a:6:{s:4:"data";s:30:"
			
			
			
			
			
			
					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:22:"Advanced Custom Fields";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:64:"https://wordpress.org/plugins/advanced-custom-fields/#post-25254";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 17 Mar 2011 04:07:30 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"25254@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:68:"Customise WordPress with powerful, professional and intuitive fields";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:12:"elliotcondon";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:18;a:6:{s:4:"data";s:30:"
			
			
			
			
			
			
					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:19:"All in One SEO Pack";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:59:"https://wordpress.org/plugins/all-in-one-seo-pack/#post-753";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 30 Mar 2007 20:08:18 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:34:"753@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:126:"All in One SEO Pack is a WordPress SEO plugin to automatically optimize your WordPress blog for Search Engines such as Google.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:8:"uberdose";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:19;a:6:{s:4:"data";s:30:"
			
			
			
			
			
			
					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:14:"Duplicate Post";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:55:"https://wordpress.org/plugins/duplicate-post/#post-2646";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 05 Dec 2007 17:40:03 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"2646@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:22:"Clone posts and pages.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:4:"Lopo";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:20;a:6:{s:4:"data";s:30:"
			
			
			
			
			
			
					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:16:"Disable Comments";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:58:"https://wordpress.org/plugins/disable-comments/#post-26907";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 27 May 2011 04:42:58 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"26907@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:134:"Allows administrators to globally disable comments on their site. Comments can be disabled according to post type. Multisite friendly.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:10:"Samir Shah";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:21;a:6:{s:4:"data";s:30:"
			
			
			
			
			
			
					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:18:"WP Multibyte Patch";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:60:"https://wordpress.org/plugins/wp-multibyte-patch/#post-28395";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 14 Jul 2011 12:22:53 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"28395@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:71:"Multibyte functionality enhancement for the WordPress Japanese package.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"plugin-master";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:22;a:6:{s:4:"data";s:30:"
			
			
			
			
			
			
					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:27:"Black Studio TinyMCE Widget";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:69:"https://wordpress.org/plugins/black-studio-tinymce-widget/#post-31973";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 10 Nov 2011 15:06:14 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"31973@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:39:"The visual editor widget for Wordpress.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:12:"Marco Chiesi";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:23;a:6:{s:4:"data";s:30:"
			
			
			
			
			
			
					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:46:"iThemes Security (formerly Better WP Security)";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:60:"https://wordpress.org/plugins/better-wp-security/#post-21738";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 22 Oct 2010 22:06:05 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"21738@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:150:"Protect your WordPress site by hiding vital areas of your site, protecting access to important files, preventing brute-force login attempts, detecting";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Chris Wiegman";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:24;a:6:{s:4:"data";s:30:"
			
			
			
			
			
			
					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:26:"Page Builder by SiteOrigin";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:59:"https://wordpress.org/plugins/siteorigin-panels/#post-51888";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 11 Apr 2013 10:36:42 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"51888@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:111:"Build responsive page layouts using the widgets you know and love using this simple drag and drop page builder.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:11:"Greg Priday";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:25;a:6:{s:4:"data";s:30:"
			
			
			
			
			
			
					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:33:"Google Analytics Dashboard for WP";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:75:"https://wordpress.org/plugins/google-analytics-dashboard-for-wp/#post-50539";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Sun, 10 Mar 2013 17:07:11 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"50539@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:127:"Displays Google Analytics reports in your WordPress Dashboard. Inserts the latest Google Analytics tracking code in your pages.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:10:"Alin Marcu";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:26;a:6:{s:4:"data";s:30:"
			
			
			
			
			
			
					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:11:"Meta Slider";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:51:"https://wordpress.org/plugins/ml-slider/#post-49521";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 14 Feb 2013 16:56:31 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"49521@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:145:"Easy to use WordPress slider plugin. Create SEO optimised responsive slideshows with Nivo Slider, Flex Slider, Coin Slider and Responsive Slides.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:11:"Matcha Labs";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:27;a:6:{s:4:"data";s:30:"
			
			
			
			
			
			
					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:30:"Clef Two-Factor Authentication";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:48:"https://wordpress.org/plugins/wpclef/#post-47509";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 27 Dec 2012 01:25:57 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"47509@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:138:"Modern two-factor that people love to use: strong authentication without passwords or tokens; single sign on/off; magical user experience.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:9:"Dave Ross";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:28;a:6:{s:4:"data";s:30:"
			
			
			
			
			
			
					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:34:"UpdraftPlus Backup and Restoration";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:53:"https://wordpress.org/plugins/updraftplus/#post-38058";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 21 May 2012 15:14:11 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"38058@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:148:"Backup and restoration made easy. Complete backups; manual or scheduled (backup to S3, Dropbox, Google Drive, Rackspace, FTP, SFTP, email + others).";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:14:"David Anderson";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:29;a:6:{s:4:"data";s:30:"
			
			
			
			
			
			
					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:10:"Duplicator";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:52:"https://wordpress.org/plugins/duplicator/#post-26607";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 16 May 2011 12:15:41 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"26607@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:88:"Duplicate, clone, backup, move and transfer an entire site from one location to another.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:10:"Cory Lamle";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}}}s:27:"http://www.w3.org/2005/Atom";a:1:{s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:0:"";s:7:"attribs";a:1:{s:0:"";a:3:{s:4:"href";s:46:"https://wordpress.org/plugins/rss/view/popular";s:3:"rel";s:4:"self";s:4:"type";s:19:"application/rss+xml";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}}}}}}}}s:4:"type";i:128;s:7:"headers";a:12:{s:6:"server";s:5:"nginx";s:4:"date";s:29:"Fri, 04 Dec 2015 11:34:27 GMT";s:12:"content-type";s:23:"text/xml; charset=UTF-8";s:10:"connection";s:5:"close";s:4:"vary";s:15:"Accept-Encoding";s:25:"strict-transport-security";s:11:"max-age=360";s:7:"expires";s:29:"Fri, 04 Dec 2015 11:46:32 GMT";s:13:"cache-control";s:0:"";s:6:"pragma";s:0:"";s:13:"last-modified";s:31:"Fri, 04 Dec 2015 11:11:32 +0000";s:15:"x-frame-options";s:10:"SAMEORIGIN";s:4:"x-nc";s:11:"HIT lax 249";}s:5:"build";s:14:"20130911040210";}', 'no' );
INSERT INTO `wp_options`(`option_id`,`option_name`,`option_value`,`autoload`) VALUES ( '311', '_transient_timeout_feed_mod_b9388c83948825c1edaef0d856b7b109', '1449272068', 'no' );
INSERT INTO `wp_options`(`option_id`,`option_name`,`option_value`,`autoload`) VALUES ( '312', '_transient_feed_mod_b9388c83948825c1edaef0d856b7b109', '1449228868', 'no' );
INSERT INTO `wp_options`(`option_id`,`option_name`,`option_value`,`autoload`) VALUES ( '313', '_transient_timeout_plugin_slugs', '1449321129', 'no' );
INSERT INTO `wp_options`(`option_id`,`option_name`,`option_value`,`autoload`) VALUES ( '314', '_transient_plugin_slugs', 'a:6:{i:0;s:19:"akismet/akismet.php";i:1;s:9:"hello.php";i:2;s:39:"my-gallery-slider/my-gallery-slider.php";i:3;s:33:"my-menu-widget/my-menu-widget.php";i:4;s:33:"my-news-plugin/my-news-plugin.php";i:5;s:51:"post-publish-email-send/post-publish-email-send.php";}', 'no' );
INSERT INTO `wp_options`(`option_id`,`option_name`,`option_value`,`autoload`) VALUES ( '315', '_transient_timeout_dash_4077549d03da2e451c8b5f002294ff51', '1449272069', 'no' );
INSERT INTO `wp_options`(`option_id`,`option_name`,`option_value`,`autoload`) VALUES ( '316', '_transient_dash_4077549d03da2e451c8b5f002294ff51', '<div class="rss-widget"><ul><li><a class=\'rsswidget\' href=\'https://wordpress.org/news/2015/11/wordpress-4-4-release-candidate/\'>WordPress 4.4 Release Candidate</a> <span class="rss-date">November 25, 2015</span><div class="rssSummary">The release candidate for WordPress 4.4 is now available. RC means we think we’re done, but with millions of users and thousands of plugins and themes, it’s possible we’ve missed something. We hope to ship WordPress 4.4 on Tuesday, December 8, but we need your help to get there. If you haven’t tested 4.4 yet, [&hellip;]</div></li></ul></div><div class="rss-widget"><ul><li><a class=\'rsswidget\' href=\'http://wptavern.com/a-more-restful-wp-cli-kickstarter-campaign-is-now-187-funded\'>WPTavern: A More RESTful WP-CLI Kickstarter Campaign is Now 187% Funded</a></li><li><a class=\'rsswidget\' href=\'http://wptavern.com/wpweekly-episode-215-all-about-logos-with-andrew-bergeron\'>WPTavern: WPWeekly Episode 215 – All About Logos With Andrew Bergeron</a></li><li><a class=\'rsswidget\' href=\'http://ma.tt/2015/12/george-lakoff/\'>Matt: George Lakoff</a></li></ul></div><div class="rss-widget"><ul><li class=\'dashboard-news-plugin\'><span>Popular Plugin:</span> <a href=\'https://wordpress.org/plugins/wpclef/\' class=\'dashboard-news-plugin-link\'>Clef Two-Factor Authentication</a>&nbsp;<span>(<a href=\'plugin-install.php?tab=plugin-information&amp;plugin=wpclef&amp;_wpnonce=ab8b7595e1&amp;TB_iframe=true&amp;width=600&amp;height=800\' class=\'thickbox\' title=\'Clef Two-Factor Authentication\'>Install</a>)</span></li></ul></div>', 'no' );
INSERT INTO `wp_options`(`option_id`,`option_name`,`option_value`,`autoload`) VALUES ( '350', 'topic_for_news_children', 'a:0:{}', 'yes' );
INSERT INTO `wp_options`(`option_id`,`option_name`,`option_value`,`autoload`) VALUES ( '353', '_site_transient_timeout_theme_roots', '1449258440', 'yes' );
INSERT INTO `wp_options`(`option_id`,`option_name`,`option_value`,`autoload`) VALUES ( '354', '_site_transient_theme_roots', 'a:3:{s:13:"twentyfifteen";s:7:"/themes";s:14:"twentyfourteen";s:7:"/themes";s:14:"twentythirteen";s:7:"/themes";}', 'yes' );
INSERT INTO `wp_options`(`option_id`,`option_name`,`option_value`,`autoload`) VALUES ( '355', '_site_transient_update_themes', 'O:8:"stdClass":4:{s:12:"last_checked";i:1449256644;s:7:"checked";a:3:{s:13:"twentyfifteen";s:3:"1.2";s:14:"twentyfourteen";s:3:"1.4";s:14:"twentythirteen";s:3:"1.5";}s:8:"response";a:3:{s:13:"twentyfifteen";a:4:{s:5:"theme";s:13:"twentyfifteen";s:11:"new_version";s:3:"1.3";s:3:"url";s:43:"https://wordpress.org/themes/twentyfifteen/";s:7:"package";s:59:"https://downloads.wordpress.org/theme/twentyfifteen.1.3.zip";}s:14:"twentyfourteen";a:4:{s:5:"theme";s:14:"twentyfourteen";s:11:"new_version";s:3:"1.5";s:3:"url";s:44:"https://wordpress.org/themes/twentyfourteen/";s:7:"package";s:60:"https://downloads.wordpress.org/theme/twentyfourteen.1.5.zip";}s:14:"twentythirteen";a:4:{s:5:"theme";s:14:"twentythirteen";s:11:"new_version";s:3:"1.6";s:3:"url";s:44:"https://wordpress.org/themes/twentythirteen/";s:7:"package";s:60:"https://downloads.wordpress.org/theme/twentythirteen.1.6.zip";}}s:12:"translations";a:0:{}}', 'yes' );
INSERT INTO `wp_options`(`option_id`,`option_name`,`option_value`,`autoload`) VALUES ( '356', '_site_transient_update_plugins', 'O:8:"stdClass":4:{s:12:"last_checked";i:1449256644;s:8:"response";a:1:{s:19:"akismet/akismet.php";O:8:"stdClass":8:{s:2:"id";s:2:"15";s:4:"slug";s:7:"akismet";s:6:"plugin";s:19:"akismet/akismet.php";s:11:"new_version";s:5:"3.1.5";s:3:"url";s:38:"https://wordpress.org/plugins/akismet/";s:7:"package";s:56:"https://downloads.wordpress.org/plugin/akismet.3.1.5.zip";s:14:"upgrade_notice";s:78:"Version 3.1.5 contains security fixes and is highly recommended for all users.";s:10:"autoupdate";b:1;}}s:12:"translations";a:0:{}s:9:"no_update";a:1:{s:9:"hello.php";O:8:"stdClass":6:{s:2:"id";s:4:"3564";s:4:"slug";s:11:"hello-dolly";s:6:"plugin";s:9:"hello.php";s:11:"new_version";s:3:"1.6";s:3:"url";s:42:"https://wordpress.org/plugins/hello-dolly/";s:7:"package";s:58:"https://downloads.wordpress.org/plugin/hello-dolly.1.6.zip";}}}', 'yes' );
INSERT INTO `wp_options`(`option_id`,`option_name`,`option_value`,`autoload`) VALUES ( '393', '_transient_is_multi_author', '0', 'yes' );
INSERT INTO `wp_options`(`option_id`,`option_name`,`option_value`,`autoload`) VALUES ( '394', '_transient_twentyfifteen_categories', '1', 'yes' );
-- ---------------------------------------------------------


-- Dump data of "wp_postmeta" ------------------------------
INSERT INTO `wp_postmeta`(`meta_id`,`post_id`,`meta_key`,`meta_value`) VALUES ( '1', '2', '_wp_page_template', 'default' );
INSERT INTO `wp_postmeta`(`meta_id`,`post_id`,`meta_key`,`meta_value`) VALUES ( '2', '21', '_edit_last', '1' );
INSERT INTO `wp_postmeta`(`meta_id`,`post_id`,`meta_key`,`meta_value`) VALUES ( '3', '21', '_edit_lock', '1449233164:1' );
INSERT INTO `wp_postmeta`(`meta_id`,`post_id`,`meta_key`,`meta_value`) VALUES ( '4', '23', '_edit_last', '1' );
INSERT INTO `wp_postmeta`(`meta_id`,`post_id`,`meta_key`,`meta_value`) VALUES ( '5', '23', '_edit_lock', '1449233073:1' );
INSERT INTO `wp_postmeta`(`meta_id`,`post_id`,`meta_key`,`meta_value`) VALUES ( '6', '28', '_edit_last', '1' );
INSERT INTO `wp_postmeta`(`meta_id`,`post_id`,`meta_key`,`meta_value`) VALUES ( '7', '28', '_edit_lock', '1449260343:1' );
INSERT INTO `wp_postmeta`(`meta_id`,`post_id`,`meta_key`,`meta_value`) VALUES ( '8', '33', '_edit_last', '1' );
INSERT INTO `wp_postmeta`(`meta_id`,`post_id`,`meta_key`,`meta_value`) VALUES ( '9', '33', '_edit_lock', '1449232867:1' );
INSERT INTO `wp_postmeta`(`meta_id`,`post_id`,`meta_key`,`meta_value`) VALUES ( '10', '33', 'news_status', 'featured' );
INSERT INTO `wp_postmeta`(`meta_id`,`post_id`,`meta_key`,`meta_value`) VALUES ( '11', '34', '_edit_last', '1' );
INSERT INTO `wp_postmeta`(`meta_id`,`post_id`,`meta_key`,`meta_value`) VALUES ( '12', '34', '_edit_lock', '1449232934:1' );
INSERT INTO `wp_postmeta`(`meta_id`,`post_id`,`meta_key`,`meta_value`) VALUES ( '13', '34', 'news_status', 'featured' );
INSERT INTO `wp_postmeta`(`meta_id`,`post_id`,`meta_key`,`meta_value`) VALUES ( '14', '34', 'news_price', '65.75' );
INSERT INTO `wp_postmeta`(`meta_id`,`post_id`,`meta_key`,`meta_value`) VALUES ( '15', '1', '_edit_lock', '1449264086:1' );
INSERT INTO `wp_postmeta`(`meta_id`,`post_id`,`meta_key`,`meta_value`) VALUES ( '16', '1', '_edit_last', '1' );
INSERT INTO `wp_postmeta`(`meta_id`,`post_id`,`meta_key`,`meta_value`) VALUES ( '18', '37', '_edit_last', '1' );
INSERT INTO `wp_postmeta`(`meta_id`,`post_id`,`meta_key`,`meta_value`) VALUES ( '19', '37', '_edit_lock', '1449264566:1' );
INSERT INTO `wp_postmeta`(`meta_id`,`post_id`,`meta_key`,`meta_value`) VALUES ( '20', '33', 'news_price', '123.98' );
INSERT INTO `wp_postmeta`(`meta_id`,`post_id`,`meta_key`,`meta_value`) VALUES ( '21', '28', 'news_status', 'featured' );
INSERT INTO `wp_postmeta`(`meta_id`,`post_id`,`meta_key`,`meta_value`) VALUES ( '22', '28', 'news_price', '45' );
INSERT INTO `wp_postmeta`(`meta_id`,`post_id`,`meta_key`,`meta_value`) VALUES ( '23', '23', 'news_status', 'featured' );
INSERT INTO `wp_postmeta`(`meta_id`,`post_id`,`meta_key`,`meta_value`) VALUES ( '24', '23', 'news_price', '13' );
INSERT INTO `wp_postmeta`(`meta_id`,`post_id`,`meta_key`,`meta_value`) VALUES ( '25', '21', 'news_status', 'featured' );
INSERT INTO `wp_postmeta`(`meta_id`,`post_id`,`meta_key`,`meta_value`) VALUES ( '26', '21', 'news_price', '75' );
INSERT INTO `wp_postmeta`(`meta_id`,`post_id`,`meta_key`,`meta_value`) VALUES ( '27', '41', '_edit_last', '1' );
INSERT INTO `wp_postmeta`(`meta_id`,`post_id`,`meta_key`,`meta_value`) VALUES ( '28', '41', '_edit_lock', '1449253935:1' );
INSERT INTO `wp_postmeta`(`meta_id`,`post_id`,`meta_key`,`meta_value`) VALUES ( '29', '41', 'news_status', 'archive' );
INSERT INTO `wp_postmeta`(`meta_id`,`post_id`,`meta_key`,`meta_value`) VALUES ( '30', '41', 'news_price', '111' );
INSERT INTO `wp_postmeta`(`meta_id`,`post_id`,`meta_key`,`meta_value`) VALUES ( '31', '42', '_edit_last', '1' );
INSERT INTO `wp_postmeta`(`meta_id`,`post_id`,`meta_key`,`meta_value`) VALUES ( '32', '42', '_edit_lock', '1449253912:1' );
INSERT INTO `wp_postmeta`(`meta_id`,`post_id`,`meta_key`,`meta_value`) VALUES ( '33', '42', 'news_status', 'archive' );
INSERT INTO `wp_postmeta`(`meta_id`,`post_id`,`meta_key`,`meta_value`) VALUES ( '34', '42', 'news_price', '176.80' );
INSERT INTO `wp_postmeta`(`meta_id`,`post_id`,`meta_key`,`meta_value`) VALUES ( '35', '43', '_edit_last', '1' );
INSERT INTO `wp_postmeta`(`meta_id`,`post_id`,`meta_key`,`meta_value`) VALUES ( '36', '43', '_edit_lock', '1449253869:1' );
INSERT INTO `wp_postmeta`(`meta_id`,`post_id`,`meta_key`,`meta_value`) VALUES ( '37', '43', 'news_status', 'archive' );
INSERT INTO `wp_postmeta`(`meta_id`,`post_id`,`meta_key`,`meta_value`) VALUES ( '38', '43', 'news_price', '34' );
INSERT INTO `wp_postmeta`(`meta_id`,`post_id`,`meta_key`,`meta_value`) VALUES ( '39', '44', '_edit_last', '1' );
INSERT INTO `wp_postmeta`(`meta_id`,`post_id`,`meta_key`,`meta_value`) VALUES ( '40', '44', '_edit_lock', '1449261236:1' );
INSERT INTO `wp_postmeta`(`meta_id`,`post_id`,`meta_key`,`meta_value`) VALUES ( '41', '44', 'news_status', 'archive' );
INSERT INTO `wp_postmeta`(`meta_id`,`post_id`,`meta_key`,`meta_value`) VALUES ( '42', '44', 'news_price', '34.78' );
INSERT INTO `wp_postmeta`(`meta_id`,`post_id`,`meta_key`,`meta_value`) VALUES ( '43', '45', '_edit_last', '1' );
INSERT INTO `wp_postmeta`(`meta_id`,`post_id`,`meta_key`,`meta_value`) VALUES ( '44', '45', '_edit_lock', '1449256440:1' );
INSERT INTO `wp_postmeta`(`meta_id`,`post_id`,`meta_key`,`meta_value`) VALUES ( '45', '45', 'news_status', 'archive' );
INSERT INTO `wp_postmeta`(`meta_id`,`post_id`,`meta_key`,`meta_value`) VALUES ( '46', '45', 'news_price', '543' );
-- ---------------------------------------------------------


-- Dump data of "wp_posts" ---------------------------------
INSERT INTO `wp_posts`(`ID`,`post_author`,`post_date`,`post_date_gmt`,`post_content`,`post_title`,`post_excerpt`,`post_status`,`comment_status`,`ping_status`,`post_password`,`post_name`,`to_ping`,`pinged`,`post_modified`,`post_modified_gmt`,`post_content_filtered`,`post_parent`,`guid`,`menu_order`,`post_type`,`post_mime_type`,`comment_count`) VALUES ( '1', '1', '2015-11-25 12:12:12', '2015-11-25 12:12:12', 'Welcome to WordPress. This is your first post. Edit or delete it, then start blogging!', 'Hello world!', '', 'publish', 'open', 'open', '', 'hello-world', '', '', '2015-12-04 21:23:39', '2015-12-04 21:23:39', '', '0', 'http://wordpress.local/?p=1', '0', 'post', '', '1' );
INSERT INTO `wp_posts`(`ID`,`post_author`,`post_date`,`post_date_gmt`,`post_content`,`post_title`,`post_excerpt`,`post_status`,`comment_status`,`ping_status`,`post_password`,`post_name`,`to_ping`,`pinged`,`post_modified`,`post_modified_gmt`,`post_content_filtered`,`post_parent`,`guid`,`menu_order`,`post_type`,`post_mime_type`,`comment_count`) VALUES ( '2', '1', '2015-11-25 12:12:12', '2015-11-25 12:12:12', 'This is an example page. It\'s different from a blog post because it will stay in one place and will show up in your site navigation (in most themes). Most people start with an About page that introduces them to potential site visitors. It might say something like this:

<blockquote>Hi there! I\'m a bike messenger by day, aspiring actor by night, and this is my blog. I live in Los Angeles, have a great dog named Jack, and I like pi&#241;a coladas. (And gettin\' caught in the rain.)</blockquote>

...or something like this:

<blockquote>The XYZ Doohickey Company was founded in 1971, and has been providing quality doohickeys to the public ever since. Located in Gotham City, XYZ employs over 2,000 people and does all kinds of awesome things for the Gotham community.</blockquote>

As a new WordPress user, you should go to <a href="http://wordpress.local/wp-admin/">your dashboard</a> to delete this page and create new pages for your content. Have fun!', 'Sample Page', '', 'publish', 'open', 'open', '', 'sample-page', '', '', '2015-11-25 12:12:12', '2015-11-25 12:12:12', '', '0', 'http://wordpress.local/?page_id=2', '0', 'page', '', '0' );
INSERT INTO `wp_posts`(`ID`,`post_author`,`post_date`,`post_date_gmt`,`post_content`,`post_title`,`post_excerpt`,`post_status`,`comment_status`,`ping_status`,`post_password`,`post_name`,`to_ping`,`pinged`,`post_modified`,`post_modified_gmt`,`post_content_filtered`,`post_parent`,`guid`,`menu_order`,`post_type`,`post_mime_type`,`comment_count`) VALUES ( '4', '1', '2015-11-29 16:01:05', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2015-11-29 16:01:05', '0000-00-00 00:00:00', '', '0', 'http://wordpress.local/?post_type=news&p=4', '0', 'news', '', '0' );
INSERT INTO `wp_posts`(`ID`,`post_author`,`post_date`,`post_date_gmt`,`post_content`,`post_title`,`post_excerpt`,`post_status`,`comment_status`,`ping_status`,`post_password`,`post_name`,`to_ping`,`pinged`,`post_modified`,`post_modified_gmt`,`post_content_filtered`,`post_parent`,`guid`,`menu_order`,`post_type`,`post_mime_type`,`comment_count`) VALUES ( '5', '1', '2015-11-29 16:24:07', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2015-11-29 16:24:07', '0000-00-00 00:00:00', '', '0', 'http://wordpress.local/?post_type=news&p=5', '0', 'news', '', '0' );
INSERT INTO `wp_posts`(`ID`,`post_author`,`post_date`,`post_date_gmt`,`post_content`,`post_title`,`post_excerpt`,`post_status`,`comment_status`,`ping_status`,`post_password`,`post_name`,`to_ping`,`pinged`,`post_modified`,`post_modified_gmt`,`post_content_filtered`,`post_parent`,`guid`,`menu_order`,`post_type`,`post_mime_type`,`comment_count`) VALUES ( '6', '1', '2015-11-29 16:37:05', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2015-11-29 16:37:05', '0000-00-00 00:00:00', '', '0', 'http://wordpress.local/?p=6', '0', 'post', '', '0' );
INSERT INTO `wp_posts`(`ID`,`post_author`,`post_date`,`post_date_gmt`,`post_content`,`post_title`,`post_excerpt`,`post_status`,`comment_status`,`ping_status`,`post_password`,`post_name`,`to_ping`,`pinged`,`post_modified`,`post_modified_gmt`,`post_content_filtered`,`post_parent`,`guid`,`menu_order`,`post_type`,`post_mime_type`,`comment_count`) VALUES ( '7', '1', '2015-11-29 17:13:42', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2015-11-29 17:13:42', '0000-00-00 00:00:00', '', '0', 'http://wordpress.local/?post_type=news&p=7', '0', 'news', '', '0' );
INSERT INTO `wp_posts`(`ID`,`post_author`,`post_date`,`post_date_gmt`,`post_content`,`post_title`,`post_excerpt`,`post_status`,`comment_status`,`ping_status`,`post_password`,`post_name`,`to_ping`,`pinged`,`post_modified`,`post_modified_gmt`,`post_content_filtered`,`post_parent`,`guid`,`menu_order`,`post_type`,`post_mime_type`,`comment_count`) VALUES ( '8', '1', '2015-11-29 17:29:56', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2015-11-29 17:29:56', '0000-00-00 00:00:00', '', '0', 'http://wordpress.local/?post_type=news&p=8', '0', 'news', '', '0' );
INSERT INTO `wp_posts`(`ID`,`post_author`,`post_date`,`post_date_gmt`,`post_content`,`post_title`,`post_excerpt`,`post_status`,`comment_status`,`ping_status`,`post_password`,`post_name`,`to_ping`,`pinged`,`post_modified`,`post_modified_gmt`,`post_content_filtered`,`post_parent`,`guid`,`menu_order`,`post_type`,`post_mime_type`,`comment_count`) VALUES ( '9', '1', '2015-11-29 20:31:25', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2015-11-29 20:31:25', '0000-00-00 00:00:00', '', '0', 'http://wordpress.local/?post_type=news&p=9', '0', 'news', '', '0' );
INSERT INTO `wp_posts`(`ID`,`post_author`,`post_date`,`post_date_gmt`,`post_content`,`post_title`,`post_excerpt`,`post_status`,`comment_status`,`ping_status`,`post_password`,`post_name`,`to_ping`,`pinged`,`post_modified`,`post_modified_gmt`,`post_content_filtered`,`post_parent`,`guid`,`menu_order`,`post_type`,`post_mime_type`,`comment_count`) VALUES ( '10', '1', '2015-11-29 20:33:24', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2015-11-29 20:33:24', '0000-00-00 00:00:00', '', '0', 'http://wordpress.local/?post_type=news&p=10', '0', 'news', '', '0' );
INSERT INTO `wp_posts`(`ID`,`post_author`,`post_date`,`post_date_gmt`,`post_content`,`post_title`,`post_excerpt`,`post_status`,`comment_status`,`ping_status`,`post_password`,`post_name`,`to_ping`,`pinged`,`post_modified`,`post_modified_gmt`,`post_content_filtered`,`post_parent`,`guid`,`menu_order`,`post_type`,`post_mime_type`,`comment_count`) VALUES ( '11', '1', '2015-11-29 20:39:29', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2015-11-29 20:39:29', '0000-00-00 00:00:00', '', '0', 'http://wordpress.local/?post_type=news&p=11', '0', 'news', '', '0' );
INSERT INTO `wp_posts`(`ID`,`post_author`,`post_date`,`post_date_gmt`,`post_content`,`post_title`,`post_excerpt`,`post_status`,`comment_status`,`ping_status`,`post_password`,`post_name`,`to_ping`,`pinged`,`post_modified`,`post_modified_gmt`,`post_content_filtered`,`post_parent`,`guid`,`menu_order`,`post_type`,`post_mime_type`,`comment_count`) VALUES ( '12', '1', '2015-11-29 20:39:50', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2015-11-29 20:39:50', '0000-00-00 00:00:00', '', '0', 'http://wordpress.local/?post_type=news&p=12', '0', 'news', '', '0' );
INSERT INTO `wp_posts`(`ID`,`post_author`,`post_date`,`post_date_gmt`,`post_content`,`post_title`,`post_excerpt`,`post_status`,`comment_status`,`ping_status`,`post_password`,`post_name`,`to_ping`,`pinged`,`post_modified`,`post_modified_gmt`,`post_content_filtered`,`post_parent`,`guid`,`menu_order`,`post_type`,`post_mime_type`,`comment_count`) VALUES ( '13', '1', '2015-11-29 20:40:22', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2015-11-29 20:40:22', '0000-00-00 00:00:00', '', '0', 'http://wordpress.local/?post_type=news&p=13', '0', 'news', '', '0' );
INSERT INTO `wp_posts`(`ID`,`post_author`,`post_date`,`post_date_gmt`,`post_content`,`post_title`,`post_excerpt`,`post_status`,`comment_status`,`ping_status`,`post_password`,`post_name`,`to_ping`,`pinged`,`post_modified`,`post_modified_gmt`,`post_content_filtered`,`post_parent`,`guid`,`menu_order`,`post_type`,`post_mime_type`,`comment_count`) VALUES ( '14', '1', '2015-11-29 20:40:49', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2015-11-29 20:40:49', '0000-00-00 00:00:00', '', '0', 'http://wordpress.local/?post_type=news&p=14', '0', 'news', '', '0' );
INSERT INTO `wp_posts`(`ID`,`post_author`,`post_date`,`post_date_gmt`,`post_content`,`post_title`,`post_excerpt`,`post_status`,`comment_status`,`ping_status`,`post_password`,`post_name`,`to_ping`,`pinged`,`post_modified`,`post_modified_gmt`,`post_content_filtered`,`post_parent`,`guid`,`menu_order`,`post_type`,`post_mime_type`,`comment_count`) VALUES ( '15', '1', '2015-11-29 20:50:25', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2015-11-29 20:50:25', '0000-00-00 00:00:00', '', '0', 'http://wordpress.local/?post_type=news&p=15', '0', 'news', '', '0' );
INSERT INTO `wp_posts`(`ID`,`post_author`,`post_date`,`post_date_gmt`,`post_content`,`post_title`,`post_excerpt`,`post_status`,`comment_status`,`ping_status`,`post_password`,`post_name`,`to_ping`,`pinged`,`post_modified`,`post_modified_gmt`,`post_content_filtered`,`post_parent`,`guid`,`menu_order`,`post_type`,`post_mime_type`,`comment_count`) VALUES ( '16', '1', '2015-11-29 20:52:20', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2015-11-29 20:52:20', '0000-00-00 00:00:00', '', '0', 'http://wordpress.local/?post_type=news&p=16', '0', 'news', '', '0' );
INSERT INTO `wp_posts`(`ID`,`post_author`,`post_date`,`post_date_gmt`,`post_content`,`post_title`,`post_excerpt`,`post_status`,`comment_status`,`ping_status`,`post_password`,`post_name`,`to_ping`,`pinged`,`post_modified`,`post_modified_gmt`,`post_content_filtered`,`post_parent`,`guid`,`menu_order`,`post_type`,`post_mime_type`,`comment_count`) VALUES ( '17', '1', '2015-11-29 20:56:38', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2015-11-29 20:56:38', '0000-00-00 00:00:00', '', '0', 'http://wordpress.local/?post_type=news&p=17', '0', 'news', '', '0' );
INSERT INTO `wp_posts`(`ID`,`post_author`,`post_date`,`post_date_gmt`,`post_content`,`post_title`,`post_excerpt`,`post_status`,`comment_status`,`ping_status`,`post_password`,`post_name`,`to_ping`,`pinged`,`post_modified`,`post_modified_gmt`,`post_content_filtered`,`post_parent`,`guid`,`menu_order`,`post_type`,`post_mime_type`,`comment_count`) VALUES ( '18', '1', '2015-11-29 20:57:51', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2015-11-29 20:57:51', '0000-00-00 00:00:00', '', '0', 'http://wordpress.local/?post_type=news&p=18', '0', 'news', '', '0' );
INSERT INTO `wp_posts`(`ID`,`post_author`,`post_date`,`post_date_gmt`,`post_content`,`post_title`,`post_excerpt`,`post_status`,`comment_status`,`ping_status`,`post_password`,`post_name`,`to_ping`,`pinged`,`post_modified`,`post_modified_gmt`,`post_content_filtered`,`post_parent`,`guid`,`menu_order`,`post_type`,`post_mime_type`,`comment_count`) VALUES ( '19', '1', '2015-11-29 20:58:33', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2015-11-29 20:58:33', '0000-00-00 00:00:00', '', '0', 'http://wordpress.local/?post_type=news&p=19', '0', 'news', '', '0' );
INSERT INTO `wp_posts`(`ID`,`post_author`,`post_date`,`post_date_gmt`,`post_content`,`post_title`,`post_excerpt`,`post_status`,`comment_status`,`ping_status`,`post_password`,`post_name`,`to_ping`,`pinged`,`post_modified`,`post_modified_gmt`,`post_content_filtered`,`post_parent`,`guid`,`menu_order`,`post_type`,`post_mime_type`,`comment_count`) VALUES ( '20', '1', '2015-11-30 00:03:49', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2015-11-30 00:03:49', '0000-00-00 00:00:00', '', '0', 'http://wordpress.local/?post_type=news&p=20', '0', 'news', '', '0' );
INSERT INTO `wp_posts`(`ID`,`post_author`,`post_date`,`post_date_gmt`,`post_content`,`post_title`,`post_excerpt`,`post_status`,`comment_status`,`ping_status`,`post_password`,`post_name`,`to_ping`,`pinged`,`post_modified`,`post_modified_gmt`,`post_content_filtered`,`post_parent`,`guid`,`menu_order`,`post_type`,`post_mime_type`,`comment_count`) VALUES ( '21', '1', '2015-11-30 00:05:48', '2015-11-30 00:05:48', 'Эйнштейн и Инфельд писали:
"Мы имеем законы, но не знаем, каково то тело отсчета к которому следует их отнести, и все наше физическое построение оказывается возведенным на песке".
Они правы.
Суть в том , что нет четкой границы которая разделяет две системы отсчета:
1) систему Вакуум и
2) гравитационные системы отсчета.
Сейчас считают, что эти две системы как бы общими.
Но это совершенно разные системы отсчета.
Вселенная Двумерна.
Там, где есть Вакуум - нет Гравитации (теория СТО).
В системе Вакуум действуют одни законы - законы вакуума ( не учитывающие внешнее воздействие).
Там, где есть Гравитация - нет Вакуума ( теория ОТО).
В гравитационной системе отсчета действуют совершенно другие законы - законы связанные и учитывающие внешнее воздействие.
А о том, как эти две системы взаимодействуют между собой, рассказывается на сайте.', 'Featured->Эйнштейн и Инфельд писали', '', 'publish', 'closed', 'closed', '', 'asd', '', '', '2015-12-04 12:48:08', '2015-12-04 12:48:08', '', '0', 'http://wordpress.local/?post_type=news&#038;p=21', '0', 'news', '', '0' );
INSERT INTO `wp_posts`(`ID`,`post_author`,`post_date`,`post_date_gmt`,`post_content`,`post_title`,`post_excerpt`,`post_status`,`comment_status`,`ping_status`,`post_password`,`post_name`,`to_ping`,`pinged`,`post_modified`,`post_modified_gmt`,`post_content_filtered`,`post_parent`,`guid`,`menu_order`,`post_type`,`post_mime_type`,`comment_count`) VALUES ( '22', '1', '2015-11-30 08:18:12', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2015-11-30 08:18:12', '0000-00-00 00:00:00', '', '0', 'http://wordpress.local/?post_type=news&p=22', '0', 'news', '', '0' );
INSERT INTO `wp_posts`(`ID`,`post_author`,`post_date`,`post_date_gmt`,`post_content`,`post_title`,`post_excerpt`,`post_status`,`comment_status`,`ping_status`,`post_password`,`post_name`,`to_ping`,`pinged`,`post_modified`,`post_modified_gmt`,`post_content_filtered`,`post_parent`,`guid`,`menu_order`,`post_type`,`post_mime_type`,`comment_count`) VALUES ( '23', '1', '2015-12-04 12:46:49', '2015-12-04 12:46:49', 'Проблема №1 при обсуждении законов движения оказывается вопрос:
"В какой системе отсчета это движение происходит?
В какой системе отсчета формулируются законы движения?"
И этот вопрос является самым неприятным для любителей абстрактных рассуждений и домыслов.
Бог учит человека думать просто, конкретно и логично.
А Дьявол говорит с человеком красивыми, общими и абстрактными фразами.
Таким методом он легко скрывает правду от людей.', 'Featured->Проблема №1 при обсуждении законов движения', '', 'publish', 'closed', 'closed', '', 'featured-%d0%bf%d1%80%d0%be%d0%b1%d0%bb%d0%b5%d0%bc%d0%b0-%e2%84%961-%d0%bf%d1%80%d0%b8-%d0%be%d0%b1%d1%81%d1%83%d0%b6%d0%b4%d0%b5%d0%bd%d0%b8%d0%b8-%d0%b7%d0%b0%d0%ba%d0%be%d0%bd%d0%be%d0%b2-%d0%b4', '', '', '2015-12-04 12:46:49', '2015-12-04 12:46:49', '', '0', 'http://wordpress.local/?post_type=news&#038;p=23', '0', 'news', '', '0' );
INSERT INTO `wp_posts`(`ID`,`post_author`,`post_date`,`post_date_gmt`,`post_content`,`post_title`,`post_excerpt`,`post_status`,`comment_status`,`ping_status`,`post_password`,`post_name`,`to_ping`,`pinged`,`post_modified`,`post_modified_gmt`,`post_content_filtered`,`post_parent`,`guid`,`menu_order`,`post_type`,`post_mime_type`,`comment_count`) VALUES ( '24', '1', '2015-11-30 08:46:32', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2015-11-30 08:46:32', '0000-00-00 00:00:00', '', '0', 'http://wordpress.local/?post_type=news&p=24', '0', 'news', '', '0' );
INSERT INTO `wp_posts`(`ID`,`post_author`,`post_date`,`post_date_gmt`,`post_content`,`post_title`,`post_excerpt`,`post_status`,`comment_status`,`ping_status`,`post_password`,`post_name`,`to_ping`,`pinged`,`post_modified`,`post_modified_gmt`,`post_content_filtered`,`post_parent`,`guid`,`menu_order`,`post_type`,`post_mime_type`,`comment_count`) VALUES ( '25', '1', '2015-11-30 08:47:35', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2015-11-30 08:47:35', '0000-00-00 00:00:00', '', '0', 'http://wordpress.local/?post_type=news&p=25', '0', 'news', '', '0' );
INSERT INTO `wp_posts`(`ID`,`post_author`,`post_date`,`post_date_gmt`,`post_content`,`post_title`,`post_excerpt`,`post_status`,`comment_status`,`ping_status`,`post_password`,`post_name`,`to_ping`,`pinged`,`post_modified`,`post_modified_gmt`,`post_content_filtered`,`post_parent`,`guid`,`menu_order`,`post_type`,`post_mime_type`,`comment_count`) VALUES ( '26', '1', '2015-11-30 08:49:10', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2015-11-30 08:49:10', '0000-00-00 00:00:00', '', '0', 'http://wordpress.local/?post_type=news&p=26', '0', 'news', '', '0' );
INSERT INTO `wp_posts`(`ID`,`post_author`,`post_date`,`post_date_gmt`,`post_content`,`post_title`,`post_excerpt`,`post_status`,`comment_status`,`ping_status`,`post_password`,`post_name`,`to_ping`,`pinged`,`post_modified`,`post_modified_gmt`,`post_content_filtered`,`post_parent`,`guid`,`menu_order`,`post_type`,`post_mime_type`,`comment_count`) VALUES ( '27', '1', '2015-11-30 09:28:17', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2015-11-30 09:28:17', '0000-00-00 00:00:00', '', '0', 'http://wordpress.local/?post_type=news&p=27', '0', 'news', '', '0' );
INSERT INTO `wp_posts`(`ID`,`post_author`,`post_date`,`post_date_gmt`,`post_content`,`post_title`,`post_excerpt`,`post_status`,`comment_status`,`ping_status`,`post_password`,`post_name`,`to_ping`,`pinged`,`post_modified`,`post_modified_gmt`,`post_content_filtered`,`post_parent`,`guid`,`menu_order`,`post_type`,`post_mime_type`,`comment_count`) VALUES ( '28', '1', '2015-11-30 09:40:18', '2015-11-30 09:40:18', 'Астрономы установили факт вращения Галактик.
Но никто не говорит, в какой именно системе отсчета они вращаются.
А без указания системы отсчета слова о вращении Галактик лишены всякого содержания. Чтобы избежать этого пишут: каждую Галактику окружают " сопутствующая система отсчета" . Причем, каждая " сопутствующая система отсчета" расширяется.
/Физика Космоса. маленькая энциклопедия.
Издательство Советская энциклопедия. 1986./
Анекдот. Ну и терминология.
Например. Я нахожусь дома и меня окружает "сопутствующая система отсчета" - дом.
Потом я поехал на работу. Проезжая мимо почты зафиксировал:
меня окружает "сопутствующая система отсчета " - почта.
А когда приехал на работу, то меня окружает "сопутствующая система отсчета " - университет. Но разве мы не понимаем , что действуем в системе отсчета- Земля.
А астрономы не понимают, в какой системе отсчета вращаются миллиарды Галактик.
Только когда указана система отсчета, слова "Галактики вращаются", "большой взрыв" имеют смысл.', 'Featured->Астрономы установили факт вращения Галактик.', '', 'publish', 'closed', 'closed', '', '28', '', '', '2015-12-04 20:20:59', '2015-12-04 20:20:59', '', '0', 'http://wordpress.local/?post_type=news&#038;p=28', '0', 'news', '', '0' );
INSERT INTO `wp_posts`(`ID`,`post_author`,`post_date`,`post_date_gmt`,`post_content`,`post_title`,`post_excerpt`,`post_status`,`comment_status`,`ping_status`,`post_password`,`post_name`,`to_ping`,`pinged`,`post_modified`,`post_modified_gmt`,`post_content_filtered`,`post_parent`,`guid`,`menu_order`,`post_type`,`post_mime_type`,`comment_count`) VALUES ( '29', '1', '2015-11-30 10:26:49', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2015-11-30 10:26:49', '0000-00-00 00:00:00', '', '0', 'http://wordpress.local/?p=29', '0', 'post', '', '0' );
INSERT INTO `wp_posts`(`ID`,`post_author`,`post_date`,`post_date_gmt`,`post_content`,`post_title`,`post_excerpt`,`post_status`,`comment_status`,`ping_status`,`post_password`,`post_name`,`to_ping`,`pinged`,`post_modified`,`post_modified_gmt`,`post_content_filtered`,`post_parent`,`guid`,`menu_order`,`post_type`,`post_mime_type`,`comment_count`) VALUES ( '30', '1', '2015-11-30 10:28:31', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2015-11-30 10:28:31', '0000-00-00 00:00:00', '', '0', 'http://wordpress.local/?page_id=30', '0', 'page', '', '0' );
INSERT INTO `wp_posts`(`ID`,`post_author`,`post_date`,`post_date_gmt`,`post_content`,`post_title`,`post_excerpt`,`post_status`,`comment_status`,`ping_status`,`post_password`,`post_name`,`to_ping`,`pinged`,`post_modified`,`post_modified_gmt`,`post_content_filtered`,`post_parent`,`guid`,`menu_order`,`post_type`,`post_mime_type`,`comment_count`) VALUES ( '31', '1', '2015-11-30 10:29:56', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2015-11-30 10:29:56', '0000-00-00 00:00:00', '', '0', 'http://wordpress.local/?page_id=31', '0', 'page', '', '0' );
INSERT INTO `wp_posts`(`ID`,`post_author`,`post_date`,`post_date_gmt`,`post_content`,`post_title`,`post_excerpt`,`post_status`,`comment_status`,`ping_status`,`post_password`,`post_name`,`to_ping`,`pinged`,`post_modified`,`post_modified_gmt`,`post_content_filtered`,`post_parent`,`guid`,`menu_order`,`post_type`,`post_mime_type`,`comment_count`) VALUES ( '32', '1', '2015-11-30 10:30:20', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2015-11-30 10:30:20', '0000-00-00 00:00:00', '', '0', 'http://wordpress.local/?post_type=news&p=32', '0', 'news', '', '0' );
INSERT INTO `wp_posts`(`ID`,`post_author`,`post_date`,`post_date_gmt`,`post_content`,`post_title`,`post_excerpt`,`post_status`,`comment_status`,`ping_status`,`post_password`,`post_name`,`to_ping`,`pinged`,`post_modified`,`post_modified_gmt`,`post_content_filtered`,`post_parent`,`guid`,`menu_order`,`post_type`,`post_mime_type`,`comment_count`) VALUES ( '33', '1', '2015-11-30 12:13:26', '2015-11-30 12:13:26', 'На дереве много листьев.
Они шумят, говорят, спорят, дискуссируют между собой.
Но разве знают они, что их питают корни?
Физики ведут себя как листья.
Они шумят, говорят, спорят, дискуссируют между собой.
Но разве знают они корни науки, если строят фундамент Науки на абстрактных идеях.
Фундамент классической механики построен на абстрактном отдельном абсолютном пространстве и абстрактном отдельном абсолютном времени Ньютона.
Фундамент термодинамики построен на абстрактной теории Идеального газа.
Фундамент теории излучения построен на абстрактной теории Черного тела.
Фундамент СТО построен на абстрактной теории отрицательного Четырехмерного пространства.
На этом абстрактном фундаменте физики строят конкретное здание науки и потом удивляются, что есть некоторые парадоксы в природе.
Но не в природе наблюдаются парадоксы.
Что- то не в порядке с логическим мышлением.
Надо бы остановиться, оглянутся назад и пересмотреть абстрактный фундамент науки.
Но все спешат куда-то вперед и, чтобы понять реальность, создают новые абстракции.
Это путь в "дурную бесконечность".
Вот и живем мы в мире абстракций, парадоксов, в мире Джорджа Орвелла.
Как разорвать эту цепь абстракций?', 'Featured->Листья и корни, абстракция и сознание.', '', 'publish', 'closed', 'closed', '', 'title_4', '', '', '2015-12-04 12:42:51', '2015-12-04 12:42:51', '', '0', 'http://wordpress.local/?post_type=news&#038;p=33', '0', 'news', '', '0' );
INSERT INTO `wp_posts`(`ID`,`post_author`,`post_date`,`post_date_gmt`,`post_content`,`post_title`,`post_excerpt`,`post_status`,`comment_status`,`ping_status`,`post_password`,`post_name`,`to_ping`,`pinged`,`post_modified`,`post_modified_gmt`,`post_content_filtered`,`post_parent`,`guid`,`menu_order`,`post_type`,`post_mime_type`,`comment_count`) VALUES ( '34', '1', '2015-11-30 12:18:49', '2015-11-30 12:18:49', 'Со времен Ньютона в классической физике действовал принцип: "Пока не указана система отсчета, всякие разговоры о движении совершенно лишены содержания."
Именно Ньютон первый из физиков осознал, какую решающую роль имеет система отсчета.
Выбор системы отсчета - это центральный, основной вопрос при решении какой-то задачи.
Но создатели "большого взрыва" забыли об этом факте.
Нигде не пишут в какой системе отсчета произошел "большой взрыв"
И в какой системе отсчета распространяется вещество "сингулярной точки".
И поэтому теория "большого взрыва" построена на песке.', 'Featured->О системах отсчета.', '', 'publish', 'closed', 'closed', '', '34', '', '', '2015-12-04 12:44:31', '2015-12-04 12:44:31', '', '0', 'http://wordpress.local/?post_type=news&#038;p=34', '0', 'news', '', '0' );
INSERT INTO `wp_posts`(`ID`,`post_author`,`post_date`,`post_date_gmt`,`post_content`,`post_title`,`post_excerpt`,`post_status`,`comment_status`,`ping_status`,`post_password`,`post_name`,`to_ping`,`pinged`,`post_modified`,`post_modified_gmt`,`post_content_filtered`,`post_parent`,`guid`,`menu_order`,`post_type`,`post_mime_type`,`comment_count`) VALUES ( '35', '1', '2015-12-01 10:05:41', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2015-12-01 10:05:41', '0000-00-00 00:00:00', '', '0', 'http://wordpress.local/?page_id=35', '0', 'page', '', '0' );
INSERT INTO `wp_posts`(`ID`,`post_author`,`post_date`,`post_date_gmt`,`post_content`,`post_title`,`post_excerpt`,`post_status`,`comment_status`,`ping_status`,`post_password`,`post_name`,`to_ping`,`pinged`,`post_modified`,`post_modified_gmt`,`post_content_filtered`,`post_parent`,`guid`,`menu_order`,`post_type`,`post_mime_type`,`comment_count`) VALUES ( '36', '1', '2015-12-02 09:48:46', '2015-12-02 09:48:46', 'Welcome to WordPress. This is your first post. Edit or delete it, then start blogging!', 'Hello world!', '', 'inherit', 'open', 'open', '', '1-revision-v1', '', '', '2015-12-02 09:48:46', '2015-12-02 09:48:46', '', '1', 'http://wordpress.local/index.php/2015/12/02/1-revision-v1/', '0', 'revision', '', '0' );
INSERT INTO `wp_posts`(`ID`,`post_author`,`post_date`,`post_date_gmt`,`post_content`,`post_title`,`post_excerpt`,`post_status`,`comment_status`,`ping_status`,`post_password`,`post_name`,`to_ping`,`pinged`,`post_modified`,`post_modified_gmt`,`post_content_filtered`,`post_parent`,`guid`,`menu_order`,`post_type`,`post_mime_type`,`comment_count`) VALUES ( '37', '1', '2015-12-02 09:50:12', '2015-12-02 09:50:12', '&nbsp;

Some new Post with News

[news num="2"]', 'New post', '', 'publish', 'open', 'open', '', 'new-post', '', '', '2015-12-04 21:30:53', '2015-12-04 21:30:53', '', '0', 'http://wordpress.local/?p=37', '0', 'post', '', '0' );
INSERT INTO `wp_posts`(`ID`,`post_author`,`post_date`,`post_date_gmt`,`post_content`,`post_title`,`post_excerpt`,`post_status`,`comment_status`,`ping_status`,`post_password`,`post_name`,`to_ping`,`pinged`,`post_modified`,`post_modified_gmt`,`post_content_filtered`,`post_parent`,`guid`,`menu_order`,`post_type`,`post_mime_type`,`comment_count`) VALUES ( '38', '1', '2015-12-02 09:50:12', '2015-12-02 09:50:12', 'Hello,wjekbwkbfkwqbfkqwbkfwkqfbwbfwkfnwk

wefwfeqfqwfqwfwqfwefqwef', 'New post', '', 'inherit', 'open', 'open', '', '37-revision-v1', '', '', '2015-12-02 09:50:12', '2015-12-02 09:50:12', '', '37', 'http://wordpress.local/index.php/2015/12/02/37-revision-v1/', '0', 'revision', '', '0' );
INSERT INTO `wp_posts`(`ID`,`post_author`,`post_date`,`post_date_gmt`,`post_content`,`post_title`,`post_excerpt`,`post_status`,`comment_status`,`ping_status`,`post_password`,`post_name`,`to_ping`,`pinged`,`post_modified`,`post_modified_gmt`,`post_content_filtered`,`post_parent`,`guid`,`menu_order`,`post_type`,`post_mime_type`,`comment_count`) VALUES ( '39', '1', '2015-12-04 12:21:49', '2015-12-04 12:21:49', 'На дереве много листьев.
Они шумят, говорят, спорят, дискуссируют между собой.
Но разве знают они, что их питают корни?
Физики ведут себя как листья.
Они шумят, говорят, спорят, дискуссируют между собой.
Но разве знают они корни науки, если строят фундамент Науки на абстрактных идеях.
Фундамент классической механики построен на абстрактном отдельном абсолютном пространстве и абстрактном отдельном абсолютном времени Ньютона.
Фундамент термодинамики построен на абстрактной теории Идеального газа.
Фундамент теории излучения построен на абстрактной теории Черного тела.
Фундамент СТО построен на абстрактной теории отрицательного Четырехмерного пространства.
На этом абстрактном фундаменте физики строят конкретное здание науки и потом удивляются, что есть некоторые парадоксы в природе.
Но не в природе наблюдаются парадоксы.
Что- то не в порядке с логическим мышлением.
Надо бы остановиться, оглянутся назад и пересмотреть абстрактный фундамент науки.
Но все спешат куда-то вперед и, чтобы понять реальность, создают новые абстракции.
Это путь в "дурную бесконечность".
Вот и живем мы в мире абстракций, парадоксов, в мире Джорджа Орвелла.
Как разорвать эту цепь абстракций?', 'Featured->Листья и корни, абстракция и сознание.', '', 'inherit', 'open', 'open', '', '33-autosave-v1', '', '', '2015-12-04 12:21:49', '2015-12-04 12:21:49', '', '33', 'http://wordpress.local/index.php/2015/12/04/33-autosave-v1/', '0', 'revision', '', '0' );
INSERT INTO `wp_posts`(`ID`,`post_author`,`post_date`,`post_date_gmt`,`post_content`,`post_title`,`post_excerpt`,`post_status`,`comment_status`,`ping_status`,`post_password`,`post_name`,`to_ping`,`pinged`,`post_modified`,`post_modified_gmt`,`post_content_filtered`,`post_parent`,`guid`,`menu_order`,`post_type`,`post_mime_type`,`comment_count`) VALUES ( '40', '1', '2015-12-04 12:48:06', '2015-12-04 12:48:06', 'Эйнштейн и Инфельд писали:
"Мы имеем законы, но не знаем, каково то тело отсчета к которому следует их отнести, и все наше физическое построение оказывается возведенным на песке".
Они правы.
Суть в том , что нет четкой границы которая разделяет две системы отсчета:
1) систему Вакуум и
2) гравитационные системы отсчета.
Сейчас считают, что эти две системы как бы общими.
Но это совершенно разные системы отсчета.
Вселенная Двумерна.
Там, где есть Вакуум - нет Гравитации (теория СТО).
В системе Вакуум действуют одни законы - законы вакуума ( не учитывающие внешнее воздействие).
Там, где есть Гравитация - нет Вакуума ( теория ОТО).
В гравитационной системе отсчета действуют совершенно другие законы - законы связанные и учитывающие внешнее воздействие.
А о том, как эти две системы взаимодействуют между собой, рассказывается на сайте.', 'Featured->Эйнштейн и Инфельд писали', '', 'inherit', 'open', 'open', '', '21-autosave-v1', '', '', '2015-12-04 12:48:06', '2015-12-04 12:48:06', '', '21', 'http://wordpress.local/index.php/2015/12/04/21-autosave-v1/', '0', 'revision', '', '0' );
INSERT INTO `wp_posts`(`ID`,`post_author`,`post_date`,`post_date_gmt`,`post_content`,`post_title`,`post_excerpt`,`post_status`,`comment_status`,`ping_status`,`post_password`,`post_name`,`to_ping`,`pinged`,`post_modified`,`post_modified_gmt`,`post_content_filtered`,`post_parent`,`guid`,`menu_order`,`post_type`,`post_mime_type`,`comment_count`) VALUES ( '41', '1', '2015-12-04 12:49:35', '2015-12-04 12:49:35', 'Какие геометрические и физические параметры могут иметь частицы в Вакууме? Могут ли они иметь объем?
Нет.
Какая тогда геометрическая форма этих плоских призраков?
Круг: <strong>C/D=<img src="http://www.socratus.com/formuls/p.gif" alt="" width="15" height="12" /> =3,14</strong>
Классическая физика говорит, что они находятся в состоянии покоя.
Квантовая физика говорит, что они должны находится в движении .
Кто из них прав?
И те и другие правы.
Вначале они находились в покое, а потом стали двигаться.
Какое это движение?
Майкельсон это открыл в 1881году.
Квант света в Вакууме прямолинейно летит с постоянной максимальной скоростью <strong>с=1</strong>.
В таком движении он плоский призрак. Круг сжатый в эллипс.
В таком полете его спин равен <strong>h=1</strong>.
Какая сила изменяет состояние покоя на движение?
Математики говорят : Механизм Хиггса.', 'Archive->Вакуум и частицы.', '', 'publish', 'closed', 'closed', '', 'arcive-%d0%b2%d0%b0%d0%ba%d1%83%d1%83%d0%bc-%d0%b8-%d1%87%d0%b0%d1%81%d1%82%d0%b8%d1%86%d1%8b', '', '', '2015-12-04 18:34:33', '2015-12-04 18:34:33', '', '0', 'http://wordpress.local/?post_type=news&#038;p=41', '0', 'news', '', '0' );
INSERT INTO `wp_posts`(`ID`,`post_author`,`post_date`,`post_date_gmt`,`post_content`,`post_title`,`post_excerpt`,`post_status`,`comment_status`,`ping_status`,`post_password`,`post_name`,`to_ping`,`pinged`,`post_modified`,`post_modified_gmt`,`post_content_filtered`,`post_parent`,`guid`,`menu_order`,`post_type`,`post_mime_type`,`comment_count`) VALUES ( '42', '1', '2015-12-04 12:50:53', '2015-12-04 12:50:53', 'СТО рассматривает поведение кванта света в Вакууме.
1)Первый закон СТО - скорость кванта света в Вакууме (А/Зеро, Эфире) величина максимальная, постоянная: <strong>с=1</strong>.
2)Утверждают - в СТО не рассматривается гравитационное поле.
Именно поэтому Эйнштейн создал ОТО.
А поле, в котором отсутствует гравитация - это Вакуум, А/Зеро.
3)Утверждают, что действие с частицами в СТО происходит в отрицательном четырех - мерном пространстве.
Это пространство является абсолютным.
Математики построили ее абстрактную модель и говорят , что это отрицательное пространство абстрактно.
Никто не видит ее связь с реальным Бытием.
Это похоже на печальный анекдот.
100 лет все восхищаются СТО .
Написано миллионы статей, рецензий, книг о СТО.
ООН решило 2005 год отметить как год создания СТО.
Все говорят, что все понятно в этой теории , но вот только отрицательное четырех - мерное пространство абстрактно.
Никто не понимает , что такое отрицательное четырех - мерное пространство в реальности.
Бог мой.
Некому смеяться над этим анекдотом.
Все ищут сложные модели отрицательного четырех - мерного пространства, а истина в простоте.
Все просто.
Отрицательную характеристику пространства мы встречаем только в А/Зеро, в Вакууме, в Эфире.
Это отрицательное пространство обладает отрицательной температурой.
И в нем пространство слито с временем (отрицательное четырех - мерное пространство )', 'Archive->Вакуум и СТО.', '', 'publish', 'closed', 'closed', '', 'arcive-%d0%b2%d0%b0%d0%ba%d1%83%d1%83%d0%bc-%d0%b8-%d1%81%d1%82%d0%be', '', '', '2015-12-04 18:34:10', '2015-12-04 18:34:10', '', '0', 'http://wordpress.local/?post_type=news&#038;p=42', '0', 'news', '', '0' );
INSERT INTO `wp_posts`(`ID`,`post_author`,`post_date`,`post_date_gmt`,`post_content`,`post_title`,`post_excerpt`,`post_status`,`comment_status`,`ping_status`,`post_password`,`post_name`,`to_ping`,`pinged`,`post_modified`,`post_modified_gmt`,`post_content_filtered`,`post_parent`,`guid`,`menu_order`,`post_type`,`post_mime_type`,`comment_count`) VALUES ( '43', '1', '2015-12-04 12:52:12', '2015-12-04 12:52:12', 'Теория Пифагора справедлива как для самого большого треугольника, так и для самого маленького треугольника.
Математики решили, что такой взгляд на теорию справедлив и для электромагнитных явлений, то есть законы природы в макромире и в микромире одинаковы.
Оказалось, что это не так.
В макромире действуют законы Максвелла.
В микромире действуют другие законы, законы СТО.
Эти законы взаимосвязаны.
СТО является продолжением развития электродинамики Максвелла.', 'Archive->Теория Пифагора, Электродинамика и СТО.', '', 'publish', 'closed', 'closed', '', 'arcive-%d1%82%d0%b5%d0%be%d1%80%d0%b8%d1%8f-%d0%bf%d0%b8%d1%84%d0%b0%d0%b3%d0%be%d1%80%d0%b0-%d1%8d%d0%bb%d0%b5%d0%ba%d1%82%d1%80%d0%be%d0%b4%d0%b8%d0%bd%d0%b0%d0%bc%d0%b8%d0%ba%d0%b0-%d0%b8-%d1%81', '', '', '2015-12-04 18:33:29', '2015-12-04 18:33:29', '', '0', 'http://wordpress.local/?post_type=news&#038;p=43', '0', 'news', '', '0' );
INSERT INTO `wp_posts`(`ID`,`post_author`,`post_date`,`post_date_gmt`,`post_content`,`post_title`,`post_excerpt`,`post_status`,`comment_status`,`ping_status`,`post_password`,`post_name`,`to_ping`,`pinged`,`post_modified`,`post_modified_gmt`,`post_content_filtered`,`post_parent`,`guid`,`menu_order`,`post_type`,`post_mime_type`,`comment_count`) VALUES ( '44', '1', '2015-12-04 12:53:19', '2015-12-04 12:53:19', 'Что делает электрон в теории Максвелла?
Уравнения Максвелла не имеют никакого отношения к прямолинейному движению электрона.
Они описывают распространение электромагнитной волны, а не частицы - электрона.
В теории Максвелла заряд - электрон рассматривается как локальная, как будто "покоящаяся "частица.
Имеется в виду, что эта частица не движется прямолинейно, а вращается на месте вокруг своего диаметра (имеет форму шара).
Такое вращение электрона создает электрические волны.
2) Что делает электрон в СТО?
Тогда ,в конце ХIХ начало ХХ века , многих физиков (Эйнштейн, Лорентц, Фицджеральд, Пуанкаре, Абрагам) заинтересовал вопрос:
" Что произойдет, если электрон, создающий электрическое поле, начнет двигаться (прямолинейно)?"
Все они пришли к выводу, что с электроном произойдут коренные изменения.
Эти изменения описываются преобразованиями Лорентца (СТО).
То есть, когда первоначально вращающийся электрон (шар) начинает двигаться прямолинейно. то в процессе движения он постепенно изменит свою геометрическую форму и физические параметры.
И ,достигнув постоянной скоростью <strong>с=1</strong> ,его форма станет круг.
В таком состоянии его величают " квантом света".
А когда, квант света вращается вокруг своего диаметра, его зовут электрон.
"Электрон "- это активно работающий квант света.
В такой интерпретации теория Максвелла и СТО одна общая теория.', 'Archive->Что делает электрон в теории Максвелла', '', 'publish', 'closed', 'closed', '', 'arcive-%d1%87%d1%82%d0%be-%d0%b4%d0%b5%d0%bb%d0%b0%d0%b5%d1%82-%d1%8d%d0%bb%d0%b5%d0%ba%d1%82%d1%80%d0%be%d0%bd-%d0%b2-%d1%82%d0%b5%d0%be%d1%80%d0%b8%d0%b8-%d0%bc%d0%b0%d0%ba%d1%81%d0%b2%d0%b5%d0%bb', '', '', '2015-12-04 20:36:09', '2015-12-04 20:36:09', '', '0', 'http://wordpress.local/?post_type=news&#038;p=44', '0', 'news', '', '0' );
INSERT INTO `wp_posts`(`ID`,`post_author`,`post_date`,`post_date_gmt`,`post_content`,`post_title`,`post_excerpt`,`post_status`,`comment_status`,`ping_status`,`post_password`,`post_name`,`to_ping`,`pinged`,`post_modified`,`post_modified_gmt`,`post_content_filtered`,`post_parent`,`guid`,`menu_order`,`post_type`,`post_mime_type`,`comment_count`) VALUES ( '45', '1', '2015-12-04 12:54:15', '2015-12-04 12:54:15', 'К концу ХIХ cтолетия многие ученые считали, что физика по сути дела закончена. Надо было решить только две проблемы:
1) объяснить излучение абсолютно черного тела (это привело к разработке Квантовой теории),
2) и объяснить постоянство скорости света в опытах Майкельсона (это привело к созданию СТО).
Больше чем сто лет считали, что СТО и Квантовая теория это две различные теории .
Но с высоты XXI cтолетия мы можем понять, что нет двух проблем, нет двух различных теорий .
Есть изначальное единство СТО и Квантовой теории.', 'Archive->Единство СТО и Квантовой теории.', '', 'publish', 'closed', 'closed', '', 'archive-%d0%b5%d0%b4%d0%b8%d0%bd%d1%81%d1%82%d0%b2%d0%be-%d1%81%d1%82%d0%be-%d0%b8-%d0%ba%d0%b2%d0%b0%d0%bd%d1%82%d0%be%d0%b2%d0%be%d0%b9-%d1%82%d0%b5%d0%be%d1%80%d0%b8%d0%b8', '', '', '2015-12-04 12:54:15', '2015-12-04 12:54:15', '', '0', 'http://wordpress.local/?post_type=news&#038;p=45', '0', 'news', '', '0' );
INSERT INTO `wp_posts`(`ID`,`post_author`,`post_date`,`post_date_gmt`,`post_content`,`post_title`,`post_excerpt`,`post_status`,`comment_status`,`ping_status`,`post_password`,`post_name`,`to_ping`,`pinged`,`post_modified`,`post_modified_gmt`,`post_content_filtered`,`post_parent`,`guid`,`menu_order`,`post_type`,`post_mime_type`,`comment_count`) VALUES ( '46', '1', '2015-12-04 18:03:19', '2015-12-04 18:03:19', 'Welcome to WordPress. This is your first post. Edit or delete it, then start blogging!

&nbsp;

Last news: [news num="3"]', 'Hello world!', '', 'inherit', 'open', 'open', '', '1-revision-v1', '', '', '2015-12-04 18:03:19', '2015-12-04 18:03:19', '', '1', 'http://wordpress.local/index.php/2015/12/04/1-revision-v1/', '0', 'revision', '', '0' );
INSERT INTO `wp_posts`(`ID`,`post_author`,`post_date`,`post_date_gmt`,`post_content`,`post_title`,`post_excerpt`,`post_status`,`comment_status`,`ping_status`,`post_password`,`post_name`,`to_ping`,`pinged`,`post_modified`,`post_modified_gmt`,`post_content_filtered`,`post_parent`,`guid`,`menu_order`,`post_type`,`post_mime_type`,`comment_count`) VALUES ( '47', '1', '2015-12-04 18:04:28', '2015-12-04 18:04:28', 'Welcome to WordPress. This is your first post. Edit or delete it, then start blogging!

&nbsp;

Last news: [news num="5"]', 'Hello world!', '', 'inherit', 'open', 'open', '', '1-revision-v1', '', '', '2015-12-04 18:04:28', '2015-12-04 18:04:28', '', '1', 'http://wordpress.local/index.php/2015/12/04/1-revision-v1/', '0', 'revision', '', '0' );
INSERT INTO `wp_posts`(`ID`,`post_author`,`post_date`,`post_date_gmt`,`post_content`,`post_title`,`post_excerpt`,`post_status`,`comment_status`,`ping_status`,`post_password`,`post_name`,`to_ping`,`pinged`,`post_modified`,`post_modified_gmt`,`post_content_filtered`,`post_parent`,`guid`,`menu_order`,`post_type`,`post_mime_type`,`comment_count`) VALUES ( '48', '1', '2015-12-04 18:05:36', '2015-12-04 18:05:36', 'Welcome to WordPress. This is your first post. Edit or delete it, then start blogging!

&nbsp;

Last news: [news num="5"exempted_category=""]', 'Hello world!', '', 'inherit', 'open', 'open', '', '1-autosave-v1', '', '', '2015-12-04 18:05:36', '2015-12-04 18:05:36', '', '1', 'http://wordpress.local/index.php/2015/12/04/1-autosave-v1/', '0', 'revision', '', '0' );
INSERT INTO `wp_posts`(`ID`,`post_author`,`post_date`,`post_date_gmt`,`post_content`,`post_title`,`post_excerpt`,`post_status`,`comment_status`,`ping_status`,`post_password`,`post_name`,`to_ping`,`pinged`,`post_modified`,`post_modified_gmt`,`post_content_filtered`,`post_parent`,`guid`,`menu_order`,`post_type`,`post_mime_type`,`comment_count`) VALUES ( '49', '1', '2015-12-04 18:06:42', '2015-12-04 18:06:42', 'Welcome to WordPress. This is your first post. Edit or delete it, then start blogging!

&nbsp;

Last news: [news num="5" exempted_category="featured"]', 'Hello world!', '', 'inherit', 'open', 'open', '', '1-revision-v1', '', '', '2015-12-04 18:06:42', '2015-12-04 18:06:42', '', '1', 'http://wordpress.local/index.php/2015/12/04/1-revision-v1/', '0', 'revision', '', '0' );
INSERT INTO `wp_posts`(`ID`,`post_author`,`post_date`,`post_date_gmt`,`post_content`,`post_title`,`post_excerpt`,`post_status`,`comment_status`,`ping_status`,`post_password`,`post_name`,`to_ping`,`pinged`,`post_modified`,`post_modified_gmt`,`post_content_filtered`,`post_parent`,`guid`,`menu_order`,`post_type`,`post_mime_type`,`comment_count`) VALUES ( '50', '1', '2015-12-04 18:08:15', '2015-12-04 18:08:15', 'Welcome to WordPress. This is your first post. Edit or delete it, then start blogging!

&nbsp;

Last news: [news num="2"]', 'Hello world!', '', 'inherit', 'open', 'open', '', '1-revision-v1', '', '', '2015-12-04 18:08:15', '2015-12-04 18:08:15', '', '1', 'http://wordpress.local/index.php/2015/12/04/1-revision-v1/', '0', 'revision', '', '0' );
INSERT INTO `wp_posts`(`ID`,`post_author`,`post_date`,`post_date_gmt`,`post_content`,`post_title`,`post_excerpt`,`post_status`,`comment_status`,`ping_status`,`post_password`,`post_name`,`to_ping`,`pinged`,`post_modified`,`post_modified_gmt`,`post_content_filtered`,`post_parent`,`guid`,`menu_order`,`post_type`,`post_mime_type`,`comment_count`) VALUES ( '51', '1', '2015-12-04 18:09:35', '2015-12-04 18:09:35', 'Welcome to WordPress. This is your first post. Edit or delete it, then start blogging!

&nbsp;

Last news: [news num="2" exempted_category="featured"]', 'Hello world!', '', 'inherit', 'open', 'open', '', '1-revision-v1', '', '', '2015-12-04 18:09:35', '2015-12-04 18:09:35', '', '1', 'http://wordpress.local/index.php/2015/12/04/1-revision-v1/', '0', 'revision', '', '0' );
INSERT INTO `wp_posts`(`ID`,`post_author`,`post_date`,`post_date_gmt`,`post_content`,`post_title`,`post_excerpt`,`post_status`,`comment_status`,`ping_status`,`post_password`,`post_name`,`to_ping`,`pinged`,`post_modified`,`post_modified_gmt`,`post_content_filtered`,`post_parent`,`guid`,`menu_order`,`post_type`,`post_mime_type`,`comment_count`) VALUES ( '52', '1', '2015-12-04 18:28:08', '2015-12-04 18:28:08', 'Welcome to WordPress. This is your first post. Edit or delete it, then start blogging!

&nbsp;

[news num="2"]', 'Hello world!', '', 'inherit', 'open', 'open', '', '1-revision-v1', '', '', '2015-12-04 18:28:08', '2015-12-04 18:28:08', '', '1', 'http://wordpress.local/index.php/2015/12/04/1-revision-v1/', '0', 'revision', '', '0' );
INSERT INTO `wp_posts`(`ID`,`post_author`,`post_date`,`post_date_gmt`,`post_content`,`post_title`,`post_excerpt`,`post_status`,`comment_status`,`ping_status`,`post_password`,`post_name`,`to_ping`,`pinged`,`post_modified`,`post_modified_gmt`,`post_content_filtered`,`post_parent`,`guid`,`menu_order`,`post_type`,`post_mime_type`,`comment_count`) VALUES ( '53', '1', '2015-12-04 18:29:26', '2015-12-04 18:29:26', '&nbsp;

Some new Post with

[news num=5]', 'New post', '', 'inherit', 'open', 'open', '', '37-autosave-v1', '', '', '2015-12-04 18:29:26', '2015-12-04 18:29:26', '', '37', 'http://wordpress.local/index.php/2015/12/04/37-autosave-v1/', '0', 'revision', '', '0' );
INSERT INTO `wp_posts`(`ID`,`post_author`,`post_date`,`post_date_gmt`,`post_content`,`post_title`,`post_excerpt`,`post_status`,`comment_status`,`ping_status`,`post_password`,`post_name`,`to_ping`,`pinged`,`post_modified`,`post_modified_gmt`,`post_content_filtered`,`post_parent`,`guid`,`menu_order`,`post_type`,`post_mime_type`,`comment_count`) VALUES ( '54', '1', '2015-12-04 18:29:33', '2015-12-04 18:29:33', '&nbsp;

Some new Post with news

[news num=5]', 'New post', '', 'inherit', 'open', 'open', '', '37-revision-v1', '', '', '2015-12-04 18:29:33', '2015-12-04 18:29:33', '', '37', 'http://wordpress.local/index.php/2015/12/04/37-revision-v1/', '0', 'revision', '', '0' );
INSERT INTO `wp_posts`(`ID`,`post_author`,`post_date`,`post_date_gmt`,`post_content`,`post_title`,`post_excerpt`,`post_status`,`comment_status`,`ping_status`,`post_password`,`post_name`,`to_ping`,`pinged`,`post_modified`,`post_modified_gmt`,`post_content_filtered`,`post_parent`,`guid`,`menu_order`,`post_type`,`post_mime_type`,`comment_count`) VALUES ( '55', '1', '2015-12-04 19:20:08', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2015-12-04 19:20:08', '0000-00-00 00:00:00', '', '0', 'http://wordpress.local/?post_type=news&p=55', '0', 'news', '', '0' );
INSERT INTO `wp_posts`(`ID`,`post_author`,`post_date`,`post_date_gmt`,`post_content`,`post_title`,`post_excerpt`,`post_status`,`comment_status`,`ping_status`,`post_password`,`post_name`,`to_ping`,`pinged`,`post_modified`,`post_modified_gmt`,`post_content_filtered`,`post_parent`,`guid`,`menu_order`,`post_type`,`post_mime_type`,`comment_count`) VALUES ( '56', '1', '2015-12-04 21:02:45', '2015-12-04 21:02:45', 'Welcome to WordPress. This is your first post. Edit or delete it, then start blogging!

&nbsp;

[news num=2]', 'Hello world!', '', 'inherit', 'open', 'open', '', '1-revision-v1', '', '', '2015-12-04 21:02:45', '2015-12-04 21:02:45', '', '1', 'http://wordpress.local/index.php/2015/12/04/1-revision-v1/', '0', 'revision', '', '0' );
INSERT INTO `wp_posts`(`ID`,`post_author`,`post_date`,`post_date_gmt`,`post_content`,`post_title`,`post_excerpt`,`post_status`,`comment_status`,`ping_status`,`post_password`,`post_name`,`to_ping`,`pinged`,`post_modified`,`post_modified_gmt`,`post_content_filtered`,`post_parent`,`guid`,`menu_order`,`post_type`,`post_mime_type`,`comment_count`) VALUES ( '57', '1', '2015-12-04 21:03:47', '2015-12-04 21:03:47', 'Welcome to WordPress. This is your first post. Edit or delete it, then start blogging!

&nbsp;

[news num="2"]', 'Hello world!', '', 'inherit', 'open', 'open', '', '1-revision-v1', '', '', '2015-12-04 21:03:47', '2015-12-04 21:03:47', '', '1', 'http://wordpress.local/index.php/2015/12/04/1-revision-v1/', '0', 'revision', '', '0' );
INSERT INTO `wp_posts`(`ID`,`post_author`,`post_date`,`post_date_gmt`,`post_content`,`post_title`,`post_excerpt`,`post_status`,`comment_status`,`ping_status`,`post_password`,`post_name`,`to_ping`,`pinged`,`post_modified`,`post_modified_gmt`,`post_content_filtered`,`post_parent`,`guid`,`menu_order`,`post_type`,`post_mime_type`,`comment_count`) VALUES ( '58', '1', '2015-12-04 21:06:31', '2015-12-04 21:06:31', '&nbsp;

Some new Post with news

[news num=1]', 'New post', '', 'inherit', 'open', 'open', '', '37-revision-v1', '', '', '2015-12-04 21:06:31', '2015-12-04 21:06:31', '', '37', 'http://wordpress.local/index.php/2015/12/04/37-revision-v1/', '0', 'revision', '', '0' );
INSERT INTO `wp_posts`(`ID`,`post_author`,`post_date`,`post_date_gmt`,`post_content`,`post_title`,`post_excerpt`,`post_status`,`comment_status`,`ping_status`,`post_password`,`post_name`,`to_ping`,`pinged`,`post_modified`,`post_modified_gmt`,`post_content_filtered`,`post_parent`,`guid`,`menu_order`,`post_type`,`post_mime_type`,`comment_count`) VALUES ( '59', '1', '2015-12-04 21:07:09', '2015-12-04 21:07:09', '&nbsp;

Some new Post with news

[news num="2"]', 'New post', '', 'inherit', 'open', 'open', '', '37-revision-v1', '', '', '2015-12-04 21:07:09', '2015-12-04 21:07:09', '', '37', 'http://wordpress.local/index.php/2015/12/04/37-revision-v1/', '0', 'revision', '', '0' );
INSERT INTO `wp_posts`(`ID`,`post_author`,`post_date`,`post_date_gmt`,`post_content`,`post_title`,`post_excerpt`,`post_status`,`comment_status`,`ping_status`,`post_password`,`post_name`,`to_ping`,`pinged`,`post_modified`,`post_modified_gmt`,`post_content_filtered`,`post_parent`,`guid`,`menu_order`,`post_type`,`post_mime_type`,`comment_count`) VALUES ( '60', '1', '2015-12-04 21:07:58', '2015-12-04 21:07:58', 'Welcome to WordPress. This is your first post. Edit or delete it, then start blogging!

&nbsp;

[news num="4"]', 'Hello world!', '', 'inherit', 'open', 'open', '', '1-revision-v1', '', '', '2015-12-04 21:07:58', '2015-12-04 21:07:58', '', '1', 'http://wordpress.local/index.php/2015/12/04/1-revision-v1/', '0', 'revision', '', '0' );
INSERT INTO `wp_posts`(`ID`,`post_author`,`post_date`,`post_date_gmt`,`post_content`,`post_title`,`post_excerpt`,`post_status`,`comment_status`,`ping_status`,`post_password`,`post_name`,`to_ping`,`pinged`,`post_modified`,`post_modified_gmt`,`post_content_filtered`,`post_parent`,`guid`,`menu_order`,`post_type`,`post_mime_type`,`comment_count`) VALUES ( '61', '1', '2015-12-04 21:08:40', '2015-12-04 21:08:40', '&nbsp;

Some new Post with news

&nbsp;', 'New post', '', 'inherit', 'open', 'open', '', '37-revision-v1', '', '', '2015-12-04 21:08:40', '2015-12-04 21:08:40', '', '37', 'http://wordpress.local/index.php/2015/12/04/37-revision-v1/', '0', 'revision', '', '0' );
INSERT INTO `wp_posts`(`ID`,`post_author`,`post_date`,`post_date_gmt`,`post_content`,`post_title`,`post_excerpt`,`post_status`,`comment_status`,`ping_status`,`post_password`,`post_name`,`to_ping`,`pinged`,`post_modified`,`post_modified_gmt`,`post_content_filtered`,`post_parent`,`guid`,`menu_order`,`post_type`,`post_mime_type`,`comment_count`) VALUES ( '62', '1', '2015-12-04 21:21:48', '2015-12-04 21:21:48', '&nbsp;

Some new Post with News

[news num="2"]', 'New post', '', 'inherit', 'open', 'open', '', '37-revision-v1', '', '', '2015-12-04 21:21:48', '2015-12-04 21:21:48', '', '37', 'http://wordpress.local/index.php/2015/12/04/37-revision-v1/', '0', 'revision', '', '0' );
INSERT INTO `wp_posts`(`ID`,`post_author`,`post_date`,`post_date_gmt`,`post_content`,`post_title`,`post_excerpt`,`post_status`,`comment_status`,`ping_status`,`post_password`,`post_name`,`to_ping`,`pinged`,`post_modified`,`post_modified_gmt`,`post_content_filtered`,`post_parent`,`guid`,`menu_order`,`post_type`,`post_mime_type`,`comment_count`) VALUES ( '63', '1', '2015-12-04 21:23:12', '2015-12-04 21:23:12', 'Welcome to WordPress. This is your first post. Edit or delete it, then start blogging!

&nbsp;

[news num=4]', 'Hello world!', '', 'inherit', 'open', 'open', '', '1-revision-v1', '', '', '2015-12-04 21:23:12', '2015-12-04 21:23:12', '', '1', 'http://wordpress.local/index.php/2015/12/04/1-revision-v1/', '0', 'revision', '', '0' );
INSERT INTO `wp_posts`(`ID`,`post_author`,`post_date`,`post_date_gmt`,`post_content`,`post_title`,`post_excerpt`,`post_status`,`comment_status`,`ping_status`,`post_password`,`post_name`,`to_ping`,`pinged`,`post_modified`,`post_modified_gmt`,`post_content_filtered`,`post_parent`,`guid`,`menu_order`,`post_type`,`post_mime_type`,`comment_count`) VALUES ( '64', '1', '2015-12-04 21:23:39', '2015-12-04 21:23:39', 'Welcome to WordPress. This is your first post. Edit or delete it, then start blogging!', 'Hello world!', '', 'inherit', 'open', 'open', '', '1-revision-v1', '', '', '2015-12-04 21:23:39', '2015-12-04 21:23:39', '', '1', 'http://wordpress.local/index.php/2015/12/04/1-revision-v1/', '0', 'revision', '', '0' );
INSERT INTO `wp_posts`(`ID`,`post_author`,`post_date`,`post_date_gmt`,`post_content`,`post_title`,`post_excerpt`,`post_status`,`comment_status`,`ping_status`,`post_password`,`post_name`,`to_ping`,`pinged`,`post_modified`,`post_modified_gmt`,`post_content_filtered`,`post_parent`,`guid`,`menu_order`,`post_type`,`post_mime_type`,`comment_count`) VALUES ( '65', '1', '2015-12-04 21:29:21', '2015-12-04 21:29:21', '&nbsp;

Some new Post with News

[news num="er"]', 'New post', '', 'inherit', 'open', 'open', '', '37-revision-v1', '', '', '2015-12-04 21:29:21', '2015-12-04 21:29:21', '', '37', 'http://wordpress.local/index.php/2015/12/04/37-revision-v1/', '0', 'revision', '', '0' );
INSERT INTO `wp_posts`(`ID`,`post_author`,`post_date`,`post_date_gmt`,`post_content`,`post_title`,`post_excerpt`,`post_status`,`comment_status`,`ping_status`,`post_password`,`post_name`,`to_ping`,`pinged`,`post_modified`,`post_modified_gmt`,`post_content_filtered`,`post_parent`,`guid`,`menu_order`,`post_type`,`post_mime_type`,`comment_count`) VALUES ( '66', '1', '2015-12-04 21:29:54', '2015-12-04 21:29:54', '&nbsp;

Some new Post with News

[news num="2er"]', 'New post', '', 'inherit', 'open', 'open', '', '37-revision-v1', '', '', '2015-12-04 21:29:54', '2015-12-04 21:29:54', '', '37', 'http://wordpress.local/index.php/2015/12/04/37-revision-v1/', '0', 'revision', '', '0' );
INSERT INTO `wp_posts`(`ID`,`post_author`,`post_date`,`post_date_gmt`,`post_content`,`post_title`,`post_excerpt`,`post_status`,`comment_status`,`ping_status`,`post_password`,`post_name`,`to_ping`,`pinged`,`post_modified`,`post_modified_gmt`,`post_content_filtered`,`post_parent`,`guid`,`menu_order`,`post_type`,`post_mime_type`,`comment_count`) VALUES ( '67', '1', '2015-12-04 21:30:53', '2015-12-04 21:30:53', '&nbsp;

Some new Post with News

[news num="2"]', 'New post', '', 'inherit', 'open', 'open', '', '37-revision-v1', '', '', '2015-12-04 21:30:53', '2015-12-04 21:30:53', '', '37', 'http://wordpress.local/index.php/2015/12/04/37-revision-v1/', '0', 'revision', '', '0' );
-- ---------------------------------------------------------


-- Dump data of "wp_term_relationships" --------------------
INSERT INTO `wp_term_relationships`(`object_id`,`term_taxonomy_id`,`term_order`) VALUES ( '1', '2', '0' );
INSERT INTO `wp_term_relationships`(`object_id`,`term_taxonomy_id`,`term_order`) VALUES ( '28', '5', '0' );
INSERT INTO `wp_term_relationships`(`object_id`,`term_taxonomy_id`,`term_order`) VALUES ( '37', '2', '0' );
INSERT INTO `wp_term_relationships`(`object_id`,`term_taxonomy_id`,`term_order`) VALUES ( '44', '6', '0' );
-- ---------------------------------------------------------


-- Dump data of "wp_term_taxonomy" -------------------------
INSERT INTO `wp_term_taxonomy`(`term_taxonomy_id`,`term_id`,`taxonomy`,`description`,`parent`,`count`) VALUES ( '1', '1', 'category', '', '0', '0' );
INSERT INTO `wp_term_taxonomy`(`term_taxonomy_id`,`term_id`,`taxonomy`,`description`,`parent`,`count`) VALUES ( '2', '2', 'category', '', '0', '2' );
INSERT INTO `wp_term_taxonomy`(`term_taxonomy_id`,`term_id`,`taxonomy`,`description`,`parent`,`count`) VALUES ( '3', '3', 'topic_for_news', '', '0', '0' );
INSERT INTO `wp_term_taxonomy`(`term_taxonomy_id`,`term_id`,`taxonomy`,`description`,`parent`,`count`) VALUES ( '4', '4', 'topic_for_news', '', '0', '0' );
INSERT INTO `wp_term_taxonomy`(`term_taxonomy_id`,`term_id`,`taxonomy`,`description`,`parent`,`count`) VALUES ( '5', '5', 'topic_for_news', '', '0', '1' );
INSERT INTO `wp_term_taxonomy`(`term_taxonomy_id`,`term_id`,`taxonomy`,`description`,`parent`,`count`) VALUES ( '6', '6', 'topic_for_news', '', '0', '1' );
INSERT INTO `wp_term_taxonomy`(`term_taxonomy_id`,`term_id`,`taxonomy`,`description`,`parent`,`count`) VALUES ( '7', '7', 'topic_for_news', '', '0', '0' );
-- ---------------------------------------------------------


-- Dump data of "wp_terms" ---------------------------------
INSERT INTO `wp_terms`(`term_id`,`name`,`slug`,`term_group`) VALUES ( '1', 'Uncategorized', 'uncategorized', '0' );
INSERT INTO `wp_terms`(`term_id`,`name`,`slug`,`term_group`) VALUES ( '2', 'Popular', 'popular', '0' );
INSERT INTO `wp_terms`(`term_id`,`name`,`slug`,`term_group`) VALUES ( '3', 'Politics', 'politics', '0' );
INSERT INTO `wp_terms`(`term_id`,`name`,`slug`,`term_group`) VALUES ( '4', 'Spotrs', 'spotrs', '0' );
INSERT INTO `wp_terms`(`term_id`,`name`,`slug`,`term_group`) VALUES ( '5', 'Tech', 'tech', '0' );
INSERT INTO `wp_terms`(`term_id`,`name`,`slug`,`term_group`) VALUES ( '6', 'World', 'world', '0' );
INSERT INTO `wp_terms`(`term_id`,`name`,`slug`,`term_group`) VALUES ( '7', 'Cars', 'cars', '0' );
-- ---------------------------------------------------------


-- Dump data of "wp_usermeta" ------------------------------
INSERT INTO `wp_usermeta`(`umeta_id`,`user_id`,`meta_key`,`meta_value`) VALUES ( '1', '1', 'nickname', 'admin' );
INSERT INTO `wp_usermeta`(`umeta_id`,`user_id`,`meta_key`,`meta_value`) VALUES ( '2', '1', 'first_name', '' );
INSERT INTO `wp_usermeta`(`umeta_id`,`user_id`,`meta_key`,`meta_value`) VALUES ( '3', '1', 'last_name', '' );
INSERT INTO `wp_usermeta`(`umeta_id`,`user_id`,`meta_key`,`meta_value`) VALUES ( '4', '1', 'description', '' );
INSERT INTO `wp_usermeta`(`umeta_id`,`user_id`,`meta_key`,`meta_value`) VALUES ( '5', '1', 'rich_editing', 'true' );
INSERT INTO `wp_usermeta`(`umeta_id`,`user_id`,`meta_key`,`meta_value`) VALUES ( '6', '1', 'comment_shortcuts', 'false' );
INSERT INTO `wp_usermeta`(`umeta_id`,`user_id`,`meta_key`,`meta_value`) VALUES ( '7', '1', 'admin_color', 'fresh' );
INSERT INTO `wp_usermeta`(`umeta_id`,`user_id`,`meta_key`,`meta_value`) VALUES ( '8', '1', 'use_ssl', '0' );
INSERT INTO `wp_usermeta`(`umeta_id`,`user_id`,`meta_key`,`meta_value`) VALUES ( '9', '1', 'show_admin_bar_front', 'true' );
INSERT INTO `wp_usermeta`(`umeta_id`,`user_id`,`meta_key`,`meta_value`) VALUES ( '10', '1', 'wp_capabilities', 'a:1:{s:13:"administrator";b:1;}' );
INSERT INTO `wp_usermeta`(`umeta_id`,`user_id`,`meta_key`,`meta_value`) VALUES ( '11', '1', 'wp_user_level', '10' );
INSERT INTO `wp_usermeta`(`umeta_id`,`user_id`,`meta_key`,`meta_value`) VALUES ( '12', '1', 'dismissed_wp_pointers', 'wp360_locks,wp390_widgets,wp410_dfw' );
INSERT INTO `wp_usermeta`(`umeta_id`,`user_id`,`meta_key`,`meta_value`) VALUES ( '13', '1', 'show_welcome_panel', '1' );
INSERT INTO `wp_usermeta`(`umeta_id`,`user_id`,`meta_key`,`meta_value`) VALUES ( '14', '1', 'session_tokens', 'a:1:{s:64:"5d5ce9011f1e8caea1b330f2454a388a2ee33492ba6f410c6a121f542c83aa67";a:4:{s:10:"expiration";i:1449953277;s:2:"ip";s:9:"127.0.0.1";s:2:"ua";s:103:"Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36";s:5:"login";i:1448743677;}}' );
INSERT INTO `wp_usermeta`(`umeta_id`,`user_id`,`meta_key`,`meta_value`) VALUES ( '15', '1', 'wp_dashboard_quick_press_last_post_id', '3' );
INSERT INTO `wp_usermeta`(`umeta_id`,`user_id`,`meta_key`,`meta_value`) VALUES ( '16', '1', 'wp_user-settings', 'posts_list_mode=list&editor=tinymce&post_dfw=on' );
INSERT INTO `wp_usermeta`(`umeta_id`,`user_id`,`meta_key`,`meta_value`) VALUES ( '17', '1', 'wp_user-settings-time', '1449260780' );
INSERT INTO `wp_usermeta`(`umeta_id`,`user_id`,`meta_key`,`meta_value`) VALUES ( '18', '1', 'closedpostboxes_news', 'a:0:{}' );
INSERT INTO `wp_usermeta`(`umeta_id`,`user_id`,`meta_key`,`meta_value`) VALUES ( '19', '1', 'metaboxhidden_news', 'a:1:{i:0;s:7:"slugdiv";}' );
INSERT INTO `wp_usermeta`(`umeta_id`,`user_id`,`meta_key`,`meta_value`) VALUES ( '20', '1', 'meta-box-order_news', 'a:3:{s:4:"side";s:41:"news_meta_box,submitdiv,topic_for_newsdiv";s:6:"normal";s:7:"slugdiv";s:8:"advanced";s:0:"";}' );
INSERT INTO `wp_usermeta`(`umeta_id`,`user_id`,`meta_key`,`meta_value`) VALUES ( '21', '1', 'screen_layout_news', '2' );
-- ---------------------------------------------------------


-- Dump data of "wp_users" ---------------------------------
INSERT INTO `wp_users`(`ID`,`user_login`,`user_pass`,`user_nicename`,`user_email`,`user_url`,`user_registered`,`user_activation_key`,`user_status`,`display_name`) VALUES ( '1', 'admin', '$P$B.KfhVuVfLYE2kEyY6pahmKxcMqh7p1', 'admin', 'dmytriistelmakh@gmail.com', '', '2015-11-25 12:12:11', '', '0', 'admin' );
-- ---------------------------------------------------------


-- CREATE INDEX "comment_id" -------------------------------
CREATE INDEX `comment_id` USING BTREE ON `wp_commentmeta`( `comment_id` );
-- ---------------------------------------------------------


-- CREATE INDEX "meta_key" ---------------------------------
CREATE INDEX `meta_key` USING BTREE ON `wp_commentmeta`( `meta_key` );
-- ---------------------------------------------------------


-- CREATE INDEX "comment_approved_date_gmt" ----------------
CREATE INDEX `comment_approved_date_gmt` USING BTREE ON `wp_comments`( `comment_approved`, `comment_date_gmt` );
-- ---------------------------------------------------------


-- CREATE INDEX "comment_author_email" ---------------------
CREATE INDEX `comment_author_email` USING BTREE ON `wp_comments`( `comment_author_email` );
-- ---------------------------------------------------------


-- CREATE INDEX "comment_date_gmt" -------------------------
CREATE INDEX `comment_date_gmt` USING BTREE ON `wp_comments`( `comment_date_gmt` );
-- ---------------------------------------------------------


-- CREATE INDEX "comment_parent" ---------------------------
CREATE INDEX `comment_parent` USING BTREE ON `wp_comments`( `comment_parent` );
-- ---------------------------------------------------------


-- CREATE INDEX "comment_post_ID" --------------------------
CREATE INDEX `comment_post_ID` USING BTREE ON `wp_comments`( `comment_post_ID` );
-- ---------------------------------------------------------


-- CREATE INDEX "link_visible" -----------------------------
CREATE INDEX `link_visible` USING BTREE ON `wp_links`( `link_visible` );
-- ---------------------------------------------------------


-- CREATE INDEX "meta_key" ---------------------------------
CREATE INDEX `meta_key` USING BTREE ON `wp_postmeta`( `meta_key` );
-- ---------------------------------------------------------


-- CREATE INDEX "post_id" ----------------------------------
CREATE INDEX `post_id` USING BTREE ON `wp_postmeta`( `post_id` );
-- ---------------------------------------------------------


-- CREATE INDEX "post_author" ------------------------------
CREATE INDEX `post_author` USING BTREE ON `wp_posts`( `post_author` );
-- ---------------------------------------------------------


-- CREATE INDEX "post_name" --------------------------------
CREATE INDEX `post_name` USING BTREE ON `wp_posts`( `post_name` );
-- ---------------------------------------------------------


-- CREATE INDEX "post_parent" ------------------------------
CREATE INDEX `post_parent` USING BTREE ON `wp_posts`( `post_parent` );
-- ---------------------------------------------------------


-- CREATE INDEX "type_status_date" -------------------------
CREATE INDEX `type_status_date` USING BTREE ON `wp_posts`( `post_type`, `post_status`, `post_date`, `ID` );
-- ---------------------------------------------------------


-- CREATE INDEX "term_taxonomy_id" -------------------------
CREATE INDEX `term_taxonomy_id` USING BTREE ON `wp_term_relationships`( `term_taxonomy_id` );
-- ---------------------------------------------------------


-- CREATE INDEX "taxonomy" ---------------------------------
CREATE INDEX `taxonomy` USING BTREE ON `wp_term_taxonomy`( `taxonomy` );
-- ---------------------------------------------------------


-- CREATE INDEX "name" -------------------------------------
CREATE INDEX `name` USING BTREE ON `wp_terms`( `name` );
-- ---------------------------------------------------------


-- CREATE INDEX "slug" -------------------------------------
CREATE INDEX `slug` USING BTREE ON `wp_terms`( `slug` );
-- ---------------------------------------------------------


-- CREATE INDEX "meta_key" ---------------------------------
CREATE INDEX `meta_key` USING BTREE ON `wp_usermeta`( `meta_key` );
-- ---------------------------------------------------------


-- CREATE INDEX "user_id" ----------------------------------
CREATE INDEX `user_id` USING BTREE ON `wp_usermeta`( `user_id` );
-- ---------------------------------------------------------


-- CREATE INDEX "user_login_key" ---------------------------
CREATE INDEX `user_login_key` USING BTREE ON `wp_users`( `user_login` );
-- ---------------------------------------------------------


-- CREATE INDEX "user_nicename" ----------------------------
CREATE INDEX `user_nicename` USING BTREE ON `wp_users`( `user_nicename` );
-- ---------------------------------------------------------


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
-- ---------------------------------------------------------


