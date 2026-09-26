/// @description 3D or 2D
if (global.use_3d && has_model) {
	voxel_draw(model, x, y, flip, 0, image_alpha, 0);
	exit;
}
draw_self();
