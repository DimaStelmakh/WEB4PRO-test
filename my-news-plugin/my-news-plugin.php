<?php
/*
Plugin Name: News Plugin by Dmytro Stelmakh
Description: This plugin is designed to create and output the news
Version: 1.0
Author: Dmytro Stelmakh
*/

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

// Include file with all others files that will be used in my plugin
include_once(plugin_dir_path( __FILE__ ) . 'includes.php');


// create new post type 'news'
add_action( 'init', 'create_news' );

// create meta-box for adding fields status and price
add_action( 'add_meta_boxes', 'news_meta_box' );

//var_dump($_POST); die;


// Register the widget
add_action("widgets_init", function () {
    register_widget("my_news_plugin");
});


// create shortcode for news widget
add_shortcode('news', 'shotrtcode_for_news_widget');

// create custom taxonomies
add_action( 'init', 'create_my_taxonomies', 0 );
