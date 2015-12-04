<?php

$path = plugin_dir_path( __FILE__ ) . 'main/';

/**
 * Array which contains all files that will be used in my plugin
 *
 * @array  $include
 */
$include =  [
    $path . '/widget.php',
    $path . '/create_news.php',
    $path . '/news_meta_box.php',
    $path . '/news_shortcode.php',
    $path . '/create_taxonomies.php',
];



/**
 * Include all files that will be used in my plugin
 */
foreach($include as $files){
    include_once($files);
}

