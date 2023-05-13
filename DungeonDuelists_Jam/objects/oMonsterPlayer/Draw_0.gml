/// @description Draw self + flash
// If the flash_timer is greater than 0, use the white blending mode
if (flash_timer > 0) {
    draw_self();
    gpu_set_blendmode(bm_add);
    draw_set_color(c_white);
    draw_set_alpha(flash_timer / flash_duration);
    draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_white, flash_timer / flash_duration);
    draw_set_alpha(1);
    draw_set_color(c_white);
    gpu_set_blendmode(bm_normal);
} else {
    // If not flashing, draw the sprite normally
    draw_self();
}

