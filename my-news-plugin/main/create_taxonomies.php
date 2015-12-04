<?php

/**
 *  Create Custom Taxonomy - 'Topics for News' for Custom Post Type - 'news'
 */
function create_my_taxonomies() {
    register_taxonomy(
        'topic_for_news',
        'news',
        array(
            'labels' => array(
                'name' => 'Topics for News',
                'add_new_item' => 'Add New Topic for News',
                'new_item_name' => 'New Topic for News'
            ),
            'show_ui' => true,
            'show_tagcloud' => false,
            'hierarchical' => true
        )
    );
}


/**
 * Create filter For custom Taxonomy
 * Function for display drop-down list with the results of content filtering
 */
function my_filtering() {
    $screen = get_current_screen();
    global $wp_query;
    if ( $screen->post_type == 'news' ) {
        wp_dropdown_categories( array(
            'show_option_all' => 'Show All Topics for News',
            'taxonomy' => 'topic_for_news',
            'name' => 'topic_for_news',
            'orderby' => 'name',
            'selected' => ( isset( $wp_query->query['topic_for_news'] ) ? $wp_query->query['topic_for_news'] : '' ),
            'hierarchical' => false,
            'depth' => 3,
            'show_count' => false,
            'hide_empty' => true,
        ) );
    }
}


/**
 * Register function my_filtering()
 */
add_action( 'restrict_manage_posts', 'my_filtering' );



/**
 * Function to display the results of filtering
 */
function display_filtering( $query ) {
    $qv = &$query->query_vars;
    if ( ( $qv['topic_for_news'] ) && is_numeric( $qv['topic_for_news'] ) ) {
        $term = get_term_by( 'id', $qv['topic_for_news'], 'topic_for_news' );
        $qv['topic_for_news'] = $term->slug;
    }
}



/**
 * Register function
 */
add_filter( 'parse_query','display_filtering' );