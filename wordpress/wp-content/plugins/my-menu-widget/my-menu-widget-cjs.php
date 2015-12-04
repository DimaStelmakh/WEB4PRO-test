<?php

class my_menu
{
    public function my_menu()
    {
        if (!is_admin()) {
            add_action('wp_head', array('my_menu', 'header'));
        }
    }

    public function header()
    {
        // Styles
        wp_enqueue_style('my-menu-widget-css', my_menu::get_directory_of_widget() . "/my-menu-widget.css");

        // Scripts
        wp_enqueue_script('jquery', 'https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js');
        wp_enqueue_script('jquery-ui', 'https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js', array('jquery'));
        wp_enqueue_script('my-menu-jquery-ui-accordion', my_menu::get_directory_of_widget() . '/my-menu-widget.js', array('jquery', 'jquery-ui'));
    }

    public static function get_directory_of_widget()
    {
        return WP_PLUGIN_URL . '/my-menu-widget';
    }
}

$my_menu = new my_menu();