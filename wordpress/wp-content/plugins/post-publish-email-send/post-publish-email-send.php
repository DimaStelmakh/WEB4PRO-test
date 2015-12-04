<?php
/*
Plugin Name: post-publish-email-send
Plugin URI: N/A
Description: Плагин отправляет почту на указанный адрес после публикации поста
Version: 0.1
Author: Dmytro Stelmakh
Author URI: N/A
*/
?>

<?php
/*  Copyright YEAR  PLUGIN_AUTHOR_NAME  (email : dmytriistelmakh@gmail.com)

    This program is free software; you can redistribute it and/or modify
    it under the terms of the GNU General Public License, version 2, as
    published by the Free Software Foundation.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program; if not, write to the Free Software
    Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
*/
?>

<?php
header("Content-Type: text/html; charset=utf-8");
function post_publish_email_send($post_ID){
    $to = "dmytriistelmakh@gmail.com";//e-mail получателя
    $subject = "Новый пост";//Теам письма
    $message = "Опубликована статья на сайте с ID = " . $post_ID;//Текст письма
    wp_mail($to, $subject, $message);
    return $post_ID;
}
add_action("publish_post", "post_publish_email_send");