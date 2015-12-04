<?php


class my_news_plugin extends WP_Widget
{

    //================ W I D G E T   C O N S T R U C T O R ===========================================
    public $id_base = 'my_news_plugin';
    public $name = 'News Plugin by Dmytro Stelmakh';
    public $widget_options = array(
        'classname' => 'my_news_plugin',
        'description' => 'This plugin is designed to create and output the news',);


    function __construct()
    {

        parent::__construct($this->id_base, $this->name, $this->widget_options);

        add_action( 'save_post', array($this, 'flush_widget_cache') );
        add_action( 'deleted_post', array($this, 'flush_widget_cache') );
        add_action( 'switch_theme', array($this, 'flush_widget_cache') );

    }



    //============================================ W I D G E T ===========================================
    /**
     * Front-end display of widget.
     * @see WP_Widget::widget()
     */
    public  function widget($args, $instance) {
        $cache = wp_cache_get('my_news_plugin', 'widget');



        if ( !is_array($cache) )
            $cache = array();

        if ( ! isset( $args['widget_id'] ) )
            $args['widget_id'] = $this->id;

        if ( isset( $cache[ $args['widget_id'] ] ) ) {
            echo $cache[ $args['widget_id'] ];
            return;
        }



        ob_start();
        extract($args);

        $title = ( ! empty( $instance['title'] ) ) ? $instance['title'] :'Recent News';
        $title = apply_filters( 'widget_title', $title, $instance, $this->id_base );
        $number = ( ! empty( $instance['number'] ) ) ? absint( $instance['number'] ) : 3;
        if ( ! $number )
            $number = 3;
        $no_displayed_news_with_status =
            isset( $instance['no_displayed_news_with_status'] )
                ? $instance['no_displayed_news_with_status']
                : 'archive';

        $my_query = new WP_Query( apply_filters(
                'widget_posts_args',
                array(
                    'post_type' => 'news',
                    'posts_per_page' => $number,
                    'post_status' => 'publish',
                    'meta_query' => array(
                        array(
                            'key' => 'news_status',
                            'value' => $no_displayed_news_with_status,
                            'compare' => '!='
                        ),
                    ),
                ) )
        );

        if ($my_query->have_posts()) :
            ?>
            <?php echo $before_widget; ?>
            <?php if ( $title ) echo $before_title . $title . $after_title; ?>
            <ul>
                <?php while ( $my_query->have_posts() ) : $my_query->the_post(); ?>
                    <li>
                        <a href="<?php the_permalink() ?>"
                           title="<?php echo esc_attr( get_the_title() ? get_the_title() : get_the_ID() ); ?>">

                            <?php if ( get_the_title() ) the_title(); else the_ID(); ?>

                        </a>
                    </li>
                <?php endwhile; ?>
            </ul>
            <?php echo $after_widget; ?>
            <?php
            // Reset the global $the_post as this query will have stomped on it
            wp_reset_postdata();

        endif;

        $cache[$args['widget_id']] = ob_get_flush();
        wp_cache_set('my_news_plugin', $cache, 'widget');
        //var_dump($args, $instance, $cache); die;
        //var_dump($instance); die;
    }



    //============================================ F O R M ===========================================
    /**
     * Back-end widget form.
     * @see WP_Widget::form()
     */
    public function form( $instance ) {

            $title     = isset( $instance['title'] ) ? esc_attr( $instance['title'] ) : 'Recent News';
            $number    = isset( $instance['number'] ) ? absint( $instance['number'] ) : 3;
            $no_displayed_news_with_status =
                isset( $instance['no_displayed_news_with_status'] )
                ? $instance['no_displayed_news_with_status']
                : 'archive';

            ?>
            <p>
                <label for="<?php echo $this->get_field_id( 'title' ); ?>">Title: </label>
                <input class="widefat" id="<?php echo $this->get_field_id( 'title' ); ?>"
                       name="<?php echo $this->get_field_name( 'title' ); ?>" type="text"
                       value="<?php echo $title; ?>" />
            </p>

            <p>
                <label for="<?php echo $this->get_field_id( 'number' ); ?>">Number of posts to show: </label>
                <input id="<?php echo $this->get_field_id( 'number' ); ?>" name="<?php echo $this->get_field_name( 'number' ); ?>"
                       type="number" min="1" onkeydown="return false;" value="<?php echo $number; ?>" size="3" />
            </p>

            <p>
                <label for="<?php echo $this->get_field_id( 'no_displayed_news_with_status' ); ?>">
                    Select news status which shouldn't be displayed:
                </label>
                <select class="select" id="<?php echo $this->get_field_id( 'no_displayed_news_with_status' ); ?>"
                        name="<?php echo $this->get_field_name( 'no_displayed_news_with_status' ); ?>" >

                    <option value="archive" selected>Choose...</option>
                    <option value="featured">Featured</option>
                    <option value="archive">Archive</option>

                </select>
            </p>
        <?php
    }




    //========================================== U P D A T E ===========================================
    /**
     * @see WP_Widget::update()
     */
    public  function update( $new_instance, $old_instance ) {
        $instance = $old_instance;
        //var_dump($instance); die;
        $instance['title'] = strip_tags($new_instance['title']);
        $instance['number'] = (int) $new_instance['number'];
        $instance['no_displayed_news_with_status'] = strval($new_instance['no_displayed_news_with_status']) ;
        $this->flush_widget_cache();


        $alloptions = wp_cache_get( 'alloptions', 'options' );
        if ( isset($alloptions['my_news_plugins']) )
            delete_option('my_news_plugin');
        return $instance;

    }

    public function flush_widget_cache() {
        wp_cache_delete('my_news_plugin', 'widget');
    }



}