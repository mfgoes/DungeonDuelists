// Proof of concept: retro 3D monsters built from 2D pixel art.
// Every filled pixel becomes a column of voxels. Columns get thicker towards the middle
// of the shape, so flat pixel art turns into a chunky, rounded model.
// Models render into a small surface at room resolution, so they stay pixel-sharp.
// Toggle between 3D and 2D in game with the "3" key.

#macro VOXEL_SIZE 2 //room pixels per voxel
#macro VOXEL_MAX_DEPTH 4 //max thickness (in voxels) from the front to the middle
#macro VOXEL_PITCH 20 //tilt so the top of the model shows. flip the sign if you see the bottom instead
#macro VOXEL_SURF_SIZE 64 //render surface size in room pixels

/// @desc pixel-art models. '.' = empty, other letters = palette colours. art faces right.
function voxel_model_grids() {
	return {
		troll: {
			palette: { W: make_colour_rgb(236, 232, 214), K: make_colour_rgb(30, 20, 30), P: make_colour_rgb(214, 110, 120), G: make_colour_rgb(120, 170, 90) },
			rows: [
				"....................",
				"......WWWWWWW.......",
				".....WWWWWWWWW......",
				"....WWWWWWWWWWW.....",
				"....WWWWWWWKWWK.....",
				"....WWWWWWWKWWK.....",
				"....WWWWWWWWWWW.....",
				"....WWWWWWWWPPW.....",
				"...GWWWWWWWWWWWG....",
				"..GGWWWWWWWWWWWGG...",
				"..GG.WWWWWWWWWW.GG..",
				".....WWWWWWWWWW.....",
				".....WWWWWWWWWW.....",
				".....WWWWWWWWWW.....",
				".....WWW....WWW.....",
				".....GGG....GGG.....",
				"....GGGG....GGGG....",
			],
		},
		mumak: {
			palette: { B: make_colour_rgb(96, 120, 84), S: make_colour_rgb(190, 230, 140), K: make_colour_rgb(20, 20, 20), W: make_colour_rgb(240, 236, 220), D: make_colour_rgb(60, 76, 54) },
			rows: [
				"..........S..S......",
				".........SSSSSS.....",
				"...S.S..SBBBBBBS....",
				"..SBBBBBBBBBBBBBB...",
				"..BBBBBBBBBBBBBBBB..",
				".SBBBBBBBBBBBBBKBB..",
				"..BBBBBBBBBBBBBBBBW.",
				"..BBBBBBBBBBBBBBBBWW",
				"..BBBBBBBBBBBBBB.BB.",
				"..BBBBBBBBBBBBBB.BB.",
				"..BBBBBBBBBBBBBB..B.",
				"...BBB.BB...BB.BB...",
				"...BBB.BB...BB.BB...",
				"...BBB.BB...BB.BB...",
				"..DDDD.DDD.DDD.DDD..",
			],
		},
		phoenix: {
			palette: { R: make_colour_rgb(230, 70, 40), O: make_colour_rgb(250, 150, 40), Y: make_colour_rgb(255, 230, 90), K: make_colour_rgb(30, 20, 20) },
			rows: [
				"..........YY........",
				".........YOOY.......",
				"........OORRO.......",
				".......ORRRKRO......",
				".......ORRRRRRYY....",
				".O.....ORRRRRO......",
				".OO...ORRRRRRO......",
				".ORO..ORRRRRRRO..O..",
				"..ORRRRRRRRRRRRO.OO.",
				"...ORRRRRRRRRRRRROO.",
				"....ORRRRRRRRRRRRO..",
				".....ORRRRRRRRRRO...",
				"......OORRRRRROO....",
				".......O.OOOO.O.....",
				"......O..O..O..O....",
				"........YY..YY......",
			],
		},
		goblin: {
			palette: { G: make_colour_rgb(110, 160, 70), K: make_colour_rgb(20, 20, 20), W: make_colour_rgb(240, 236, 220), B: make_colour_rgb(130, 90, 60), D: make_colour_rgb(80, 56, 40) },
			rows: [
				".....G.......G......",
				".....GG.....GG......",
				"......GGGGGGG.......",
				".....GGGGGGGGG......",
				".....GGGKGGGKG......",
				".....GGGGGGGGG......",
				"......GGWWWGG.......",
				".......GGGGG........",
				".....BBBBBBBBB......",
				"....GBBBBBBBBBG.....",
				"....GBBBBBBBBBG.....",
				"....G.BBBBBBB.G.....",
				"......BBBBBBB.......",
				"......DD...DD.......",
				"......GG...GG.......",
				".....GGG...GGG......",
			],
		},
	};
}

/// @desc returns a (cached) vertex buffer for a model
/// @param {string|asset} model name from voxel_model_grids(), or a sprite to build from its first frame
function voxel_model_get(_model) {
	if (!variable_global_exists("voxel_cache")) global.voxel_cache = {};
	if (!is_string(_model)) return voxel_model_from_sprite(_model);

	var _vb = global.voxel_cache[$ _model];
	if (_vb != undefined) return _vb;

	var _grids = voxel_model_grids();
	var _def = _grids[$ _model];
	if (_def == undefined) _def = _grids.goblin;
	var _rows = _def.rows;
	var _h = array_length(_rows);
	var _w = 0;
	for (var i = 0; i < _h; i++) _w = max(_w, string_length(_rows[i]));

	var _cols = array_create(_w * _h, -1);
	for (var _y = 0; _y < _h; _y++) {
		for (var _x = 0; _x < string_length(_rows[_y]); _x++) {
			var _ch = string_char_at(_rows[_y], _x + 1);
			if (_ch == ".") continue;
			var _c = _def.palette[$ _ch];
			_cols[_y * _w + _x] = (_c == undefined) ? c_fuchsia : _c; //pink = typo in the palette
		}
	}
	_vb = voxel_build(_cols, _w, _h);
	global.voxel_cache[$ _model] = _vb;
	return _vb;
}

/// @desc builds a model from a sprite's first frame (for your own pixel art)
/// @param {asset} sprite
function voxel_model_from_sprite(_spr) {
	var _key = "spr_" + sprite_get_name(_spr);
	var _vb = global.voxel_cache[$ _key];
	if (_vb != undefined) return _vb;

	var _w = sprite_get_width(_spr);
	var _h = sprite_get_height(_spr);
	var _surf = surface_create(_w, _h);
	surface_set_target(_surf);
	draw_clear_alpha(c_black, 0);
	draw_sprite(_spr, 0, sprite_get_xoffset(_spr), sprite_get_yoffset(_spr));
	surface_reset_target();

	var _cols = array_create(_w * _h, -1);
	for (var _y = 0; _y < _h; _y++) {
		for (var _x = 0; _x < _w; _x++) {
			var _p = surface_getpixel_ext(_surf, _x, _y); //ABGR
			if (((_p >> 24) & 255) > 127) _cols[_y * _w + _x] = _p & $FFFFFF;
		}
	}
	surface_free(_surf);
	_vb = voxel_build(_cols, _w, _h);
	global.voxel_cache[$ _key] = _vb;
	return _vb;
}

/// @desc turns a grid of colours (-1 = empty) into a frozen vertex buffer
function voxel_build(_cols, _w, _h) {
	//thickness: distance to the nearest empty pixel, capped
	var _d = array_create(_w * _h, 0);
	for (var i = 0; i < _w * _h; i++) if (_cols[i] != -1) _d[i] = 99;
	repeat (VOXEL_MAX_DEPTH) {
		for (var _y = 0; _y < _h; _y++) {
			for (var _x = 0; _x < _w; _x++) {
				var _i = _y * _w + _x;
				if (_d[_i] == 0) continue;
				_d[_i] = min(_d[_i], VOXEL_MAX_DEPTH,
					voxel_depth_at(_d, _w, _h, _x - 1, _y) + 1, voxel_depth_at(_d, _w, _h, _x + 1, _y) + 1,
					voxel_depth_at(_d, _w, _h, _x, _y - 1) + 1, voxel_depth_at(_d, _w, _h, _x, _y + 1) + 1);
			}
		}
	}

	if (!variable_global_exists("voxel_format")) {
		vertex_format_begin();
		vertex_format_add_position_3d();
		vertex_format_add_colour();
		vertex_format_add_texcoord();
		global.voxel_format = vertex_format_end();
	}

	var _vb = vertex_create_buffer();
	vertex_begin(_vb, global.voxel_format);
	var _s = VOXEL_SIZE;
	for (var _y = 0; _y < _h; _y++) {
		for (var _x = 0; _x < _w; _x++) {
			var _i = _y * _w + _x;
			var _c = _cols[_i];
			if (_c == -1) continue;
			var _hd = _d[_i];
			var _x1 = (_x - _w / 2) * _s, _x2 = _x1 + _s;
			var _y1 = (_y - _h / 2) * _s, _y2 = _y1 + _s;
			var _z1 = -_hd * _s / 2, _z2 = _hd * _s / 2;
			voxel_quad(_vb, _x1, _y1, _z1, _x2, _y1, _z1, _x2, _y2, _z1, _x1, _y2, _z1, voxel_shade(_c, 1)); //front
			voxel_quad(_vb, _x1, _y1, _z2, _x2, _y1, _z2, _x2, _y2, _z2, _x1, _y2, _z2, voxel_shade(_c, 0.6)); //back
			//sides: only the part that sticks out past the neighbour
			voxel_side(_vb, 0, _x1, _y1, _x2, _y2, _hd, voxel_depth_at(_d, _w, _h, _x - 1, _y), voxel_shade(_c, 0.88));
			voxel_side(_vb, 1, _x1, _y1, _x2, _y2, _hd, voxel_depth_at(_d, _w, _h, _x + 1, _y), voxel_shade(_c, 0.8));
			voxel_side(_vb, 2, _x1, _y1, _x2, _y2, _hd, voxel_depth_at(_d, _w, _h, _x, _y - 1), voxel_shade(_c, 1.12));
			voxel_side(_vb, 3, _x1, _y1, _x2, _y2, _hd, voxel_depth_at(_d, _w, _h, _x, _y + 1), voxel_shade(_c, 0.6));
		}
	}
	vertex_end(_vb);
	vertex_freeze(_vb);
	return _vb;
}

function voxel_depth_at(_d, _w, _h, _x, _y) {
	if (_x < 0 || _y < 0 || _x >= _w || _y >= _h) return 0;
	return _d[_y * _w + _x];
}

/// @desc face: 0 left, 1 right, 2 top, 3 bottom
function voxel_side(_vb, _face, _x1, _y1, _x2, _y2, _hd, _nd, _col) {
	if (_nd >= _hd) return;
	var _s = VOXEL_SIZE / 2;
	for (var k = 0; k < 2; k++) {
		var _za = (k == 0) ? -_hd * _s : _nd * _s;
		var _zb = (k == 0) ? -_nd * _s : _hd * _s;
		switch (_face) {
			case 0: voxel_quad(_vb, _x1, _y1, _za, _x1, _y2, _za, _x1, _y2, _zb, _x1, _y1, _zb, _col); break;
			case 1: voxel_quad(_vb, _x2, _y1, _za, _x2, _y2, _za, _x2, _y2, _zb, _x2, _y1, _zb, _col); break;
			case 2: voxel_quad(_vb, _x1, _y1, _za, _x2, _y1, _za, _x2, _y1, _zb, _x1, _y1, _zb, _col); break;
			case 3: voxel_quad(_vb, _x1, _y2, _za, _x2, _y2, _za, _x2, _y2, _zb, _x1, _y2, _zb, _col); break;
		}
	}
}

function voxel_quad(_vb, _ax, _ay, _az, _bx, _by, _bz, _cx, _cy, _cz, _dx, _dy, _dz, _col) {
	voxel_vertex(_vb, _ax, _ay, _az, _col);
	voxel_vertex(_vb, _bx, _by, _bz, _col);
	voxel_vertex(_vb, _cx, _cy, _cz, _col);
	voxel_vertex(_vb, _ax, _ay, _az, _col);
	voxel_vertex(_vb, _cx, _cy, _cz, _col);
	voxel_vertex(_vb, _dx, _dy, _dz, _col);
}

function voxel_vertex(_vb, _x, _y, _z, _col) {
	vertex_position_3d(_vb, _x, _y, _z);
	vertex_colour(_vb, _col, 1);
	vertex_texcoord(_vb, 0, 0);
}

/// @desc darken (amount < 1) or lighten (amount > 1) a colour
function voxel_shade(_col, _amount) {
	if (_amount <= 1) return merge_colour(c_black, _col, _amount);
	return merge_colour(_col, c_white, _amount - 1);
}

/// @desc draws a model centred on x,y. call from a Draw event.
/// @param {string|asset} model
/// @param {real} x
/// @param {real} y
/// @param {bool} flip mirror to face left
/// @param {real} yaw turn left/right in degrees
/// @param {real} alpha
/// @param {real} flash 0-1 white flash on top
function voxel_draw(_model, _x, _y, _flip, _yaw, _alpha, _flash) {
	var _vb = voxel_model_get(_model);
	var _size = VOXEL_SURF_SIZE;
	if (!variable_global_exists("voxel_surf") || !surface_exists(global.voxel_surf)) global.voxel_surf = surface_create(_size, _size);

	var _old_view = matrix_get(matrix_view);
	var _old_proj = matrix_get(matrix_projection);
	var _old_world = matrix_get(matrix_world);
	var _old_ztest = gpu_get_ztestenable();
	var _old_zwrite = gpu_get_zwriteenable();
	var _old_cull = gpu_get_cullmode();

	surface_set_target(global.voxel_surf);
	draw_clear_alpha(c_black, 0);
	matrix_set(matrix_view, matrix_build_lookat(0, 0, -1000, 0, 0, 0, 0, 1, 0));
	matrix_set(matrix_projection, matrix_build_projection_ortho(_size, _size, 1, 3000));
	var _m = matrix_build(0, 0, 0, 0, 0, 0, _flip ? -1 : 1, 1, 1);
	_m = matrix_multiply(_m, matrix_build(0, 0, 0, 0, _yaw, 0, 1, 1, 1));
	_m = matrix_multiply(_m, matrix_build(0, 0, 0, VOXEL_PITCH, 0, 0, 1, 1, 1));
	matrix_set(matrix_world, _m);
	gpu_set_ztestenable(true);
	gpu_set_zwriteenable(true);
	gpu_set_cullmode(cull_noculling);
	vertex_submit(_vb, pr_trianglelist, -1);
	surface_reset_target();

	matrix_set(matrix_world, _old_world);
	matrix_set(matrix_view, _old_view);
	matrix_set(matrix_projection, _old_proj);
	gpu_set_ztestenable(_old_ztest);
	gpu_set_zwriteenable(_old_zwrite);
	gpu_set_cullmode(_old_cull);

	draw_surface_ext(global.voxel_surf, _x - _size / 2, _y - _size / 2, 1, 1, 0, c_white, _alpha);
	if (_flash > 0) {
		gpu_set_blendmode(bm_add);
		draw_surface_ext(global.voxel_surf, _x - _size / 2, _y - _size / 2, 1, 1, 0, c_white, _flash);
		gpu_set_blendmode(bm_normal);
	}
}
