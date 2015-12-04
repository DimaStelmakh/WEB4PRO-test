<?php

class my_slider
{
    public function my_slider()
    {
        if (!is_admin()) {
            // Header styles
            add_action('wp_head', array('my_slider', 'header'));
        }
    }

    public function header()
    {
        // Styles
        wp_enqueue_style('bjqs-css', my_slider::get_directory_of_plugin() . "/bjqs/bjqs.css");

        // Scripts
        wp_enqueue_script('jquery', 'https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js');
        wp_enqueue_script('bjqs', my_slider::get_directory_of_plugin() . "/bjqs/bjqs-1.3.js", array('jquery'));
        wp_enqueue_script('my-gallery-slider-jquery', my_slider::get_directory_of_plugin() . '/my-gallery-slider.js', array('jquery', 'bjqs'));
    }

    public static function get_directory_of_plugin()
    {
        return WP_PLUGIN_URL . '/my-gallery-slider';
    }
}

$my_slider = new my_slider();