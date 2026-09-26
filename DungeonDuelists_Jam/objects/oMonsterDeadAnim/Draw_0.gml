/// @description 3D or 2D
if (global.use_3d && has_model) {
	voxel_draw(model, x, y, flip, VOXEL_YAW, image_alpha, 0);
	exit;
}
draw_self();
