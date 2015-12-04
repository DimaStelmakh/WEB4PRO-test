<?php

/**
 * Function that inserting Widget With Shortcode.
 * Shortcode takes one parameter 'num' - number of news/
 * Shortcode must look like [news num="number of news"]
 *
 * @param $atts
 * @return string
 */
function shotrtcode_for_news_widget( $atts ){

    extract(shortcode_atts(array(
        'num' => '',
    ),
        $atts));

    if ( !is_numeric($num) ){
        return 'Invalid parameter of shortcode';
    }

    $widget = 'my_news_plugin';

    $args = array(
        'before_widget' => '',
        'after_widget'  => '',
        'before_title'  => '',
        'after_title'   => '',
    );

    $instance = [
        'number' => $num,
    ];

    ob_start();
    the_widget($widget, $instance, $args);
    $output = ob_get_clean();

    return $output;
}