<?php

class my_menu_widget extends WP_Widget
{
    public $id_base = 'my_menu_widget';
    public $name = 'My Menu Widget';
    public $widget_options = array(
        'classname' => 'my_menu_widget',
        'description' => "This plugin create new menu with jQueryUI Accordion",);


    //================ W I D G E T   C O N S T R U C T O R ===========================================
    public function __construct()
    {
        parent::__construct($this->id_base, $this->name, $this->widget_options);
    }

    //============================================ F O R M ===========================================
    /**
     * Back-end widget form.
     * @see WP_Widget::form()
     */
    public function form($instance)
    {

        $nav_menu = isset($instance['nav_menu']) ? $instance['nav_menu'] : '';
        extract($instance);
        $menus = get_terms('nav_menu');

        if (!$menus) {
            echo '<p>You have not any menus. If you want the widget to work - <a href="nav-menus.php">create a new</a> menu.</p>';
            return;
        }
        ?>

        <p>
            <label for="<?php echo $this->get_field_id('nav_menu'); ?>"><?php _e('Select Menu:'); ?></label>
            <select id="<?php echo $this->get_field_id('nav_menu'); ?>"
                    name="<?php echo $this->get_field_name('nav_menu'); ?>">
                <?php
                foreach ($menus as $menu) {
                    $selected = $nav_menu == $menu->term_id ? ' selected="selected"' : '';
                    echo '<option' . $selected . ' value="' . $menu->term_id . '">' . $menu->name . '</option>';
                }
                ?>
            </select>
        </p>

    <?php
    }

    //============================================ W I D G E T ===========================================
    /**
     * Front-end display of widget.
     * @see WP_Widget::widget()
     */
    public function widget($args, $instance)
    {

        $nav_menu = wp_get_nav_menu_object($instance['nav_menu']);

        if (!$nav_menu)
            return;

        echo $args['before_widget'];

        if (!empty($instance['title']))
            echo $args['before_title'] . $instance['title'] . $args['after_title'];
        ?>
        <div>
            <?php
            wp_nav_menu(array(
                'menu_id' => 'my-menu-widget',
                'menu' => $nav_menu,
                'container' => '',));
            ?>
        </div>
        <?php
        echo $args['after_widget'];
    }


    //========================================== U P D A T E ===========================================
    /**
     * @see WP_Widget::update()
     */
    public function update($new_instance, $old_instance)
    {
        $instance = $old_instance;
        $instance['nav_menu'] = (int)$new_instance['nav_menu'];
        return $instance;
    }
}