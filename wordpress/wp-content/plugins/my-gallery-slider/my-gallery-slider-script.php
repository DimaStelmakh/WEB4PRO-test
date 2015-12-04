<?php
function my_gallery_slider($output, $attr)
{
    $ids = explode(',', $attr['ids']);
    $images = get_posts(array(
        'include' => $ids,
        'post_status' => 'inherit',
        'post_type' => 'attachment',
        'post_mime_type' => 'image'
    ));
    if ($images) {
        $output = gallery_slider_output($images);
        return $output;
    }
}

function gallery_slider_output($images)
{
    ob_start();
    include 'gallery-slider-on-page.php';
    $output = ob_get_clean();
    return $output;
}
