<?php


/**
 * Meta box functions for adding the meta box and saving the data
 */
function news_meta_box()
{
    // create our custom meta box
    add_meta_box(
        'news_meta_box',
        'News Details',
        'news_meta_box_showup',
        'news',
        'side',
        'default'
    );
}

/**
 * Callback function that show the context of meta box
 *
 * @param $news
 */
function news_meta_box_showup( $news )
{
    $news_status = get_post_meta( $news->ID, 'news_status', true );
    $news_price = get_post_meta( $news->ID, 'news_price', true );

    //nonce for security
    wp_nonce_field( plugin_basename( __FILE__ ), 'save_news_meta_box' );

    ?>

    <div class="news_meta_box">

        <div class="news_meta_box_status">
            <label for="status_for_news">Satus: </label>
            <select id="status_for_news" name="status_for_plugin" required>
                <option selected disabled>Select status</option>
                <option value="featured">Featured</option>
                <option value="archive">Archive</option>
            </select>
        </div>

        <div class="news_meta_box_price">
            <label for="price_for_news">Price: </label>
            <input id="price_for_news" name="price_for_plugin" required type="text"
                   pattern="(0\.((0[1-9]{1})|([1-9]{1}([0-9]{1})?)))|(([1-9]+[0-9]*)(\.([0-9]{1,2}))?)" />
        </div>

    </div>

<?php
}

/**
 * Hook to save our meta box data when the post is saved
 */
add_action( 'save_post', 'save_news_meta_box' );



/**
 * Function to save data from Custom Meta Box
 *
 * @param $news_id
 */
function save_news_meta_box( $news_id )
{
    // if auto saving skip saving our meta box data
    if ( defined( 'DOING_AUTOSAVE' ) && DOING_AUTOSAVE ) {
        return;
    }

    //check nonce for security
    wp_verify_nonce( plugin_basename( __FILE__ ), 'save_news_meta_box' );

    if( isset($_POST['status_for_plugin']) && $_POST['status_for_plugin'] != '' ){
        update_post_meta($news_id, 'news_status', sanitize_text_field( $_POST['status_for_plugin']) );
    }

    if( isset($_POST['price_for_plugin']) && $_POST['price_for_plugin'] != '' ){
        update_post_meta( $news_id, 'news_price', sanitize_text_field( $_POST['price_for_plugin']) );
    }

}

/**
 * New filter for registration function called during the preparation of the list of the news
 * Here used variable filter 'manage_edit-(Custom_Post_Type)_columns'
 */
add_filter( 'manage_edit-news_columns', 'my_columns' );


/**
 * Add 2 columns Status and Price to display on Dashboard
 *
 * @param $columns
 * @return mixed
 */
function my_columns( $columns ) {
    $columns['status_for_plugin'] = 'Status';
    $columns['price_for_plugin'] = 'Price';
    unset( $columns['comments'] );
    return $columns;
}



/**
 * Checking filled columns
 *
 * @param $column
 */
function columns_fill( $column ) {

    if ( 'status_for_plugin' == $column ) {
        $news_status = get_post_meta( get_the_ID(), 'news_status', true );
        echo $news_status;
    }
    elseif ( 'price_for_plugin' == $column ) {
        $news_price = get_post_meta( get_the_ID(), 'news_price', true );
        echo $news_price;
    }
}

/**
 * Registering a function to fill the column.
 */
add_action( 'manage_posts_custom_column', 'columns_fill' );



/**
 * Sorting column
 *
 * @param $columns
 * @return mixed
 */
function sort_columns( $columns ) {
    $columns['price_for_plugin'] = 'price_for_plugin';
    return $columns;
}

/**
 * Register columns for sorting
 * Here used variable filter 'manage_edit-(Custom_Post_Type)_sortable_columns'
 */
add_filter( 'manage_edit-news_sortable_columns', 'sort_columns' );



/**
 * Order by selected column
 *
 * @param $vars
 * @return array
 */
function column_orderby ( $vars ) {
    if ( !is_admin() )
        return $vars;
    if ( isset( $vars['orderby'] ) && 'price_for_plugin' == $vars['orderby'] ) {
        $vars = array_merge( $vars, array( 'meta_key' => 'news_price', 'orderby' => 'meta_value_num' ) );
    }
    return $vars;

}

/**
 * Add request filter
 */
add_filter( 'request', 'column_orderby' );