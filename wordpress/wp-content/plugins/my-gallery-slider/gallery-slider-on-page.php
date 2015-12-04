<div id="my-slider">
    <ul class="bjqs">
        <?php
        foreach ($images as $image) {
            $src = wp_get_attachment_url($image->ID);?>
            <li><img src="<?php echo $src; ?>"></li>
        <?php } ?>
    </ul>
</div>




