<?php

/**
 * Function to create Custom Post Type - 'news'
 */
function create_news()
{
    register_post_type( 'news',
        [
            'labels' => [
                'name'               => 'News',
                'singular_name'      => 'News',
                'add_new'            => 'Add new',
                'add_new_item'       => 'Add new News',
                'edit'               => 'Edit',
                'edit_item'          => 'Edit News',
                'new_item'           => 'Create new News',
                'view'               => 'View',
                'view_item'          => 'View News',
                'search_items'       => 'Search News',
                'not_found'          => 'No News found',
                'not_found_in_trash' => 'No News found in trash',
                'menu_name'          => 'News',
            ],
            'public'        => true,
            'menu_position' => 15,
            'menu_icon'     => 'dashicons-format-aside',
            'has_archive'   => true,
        ]
    );
}
