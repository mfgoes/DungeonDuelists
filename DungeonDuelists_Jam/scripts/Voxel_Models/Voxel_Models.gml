// Proof of concept: retro 3D monsters built from 2D pixel art.
// Every filled pixel becomes a column of voxels. Each part of the shape gets about as thick
// as it is wide, so flat pixel art turns into a chunky voxel model (thin legs stay thin, bodies get round).
// Models render into a small surface at room resolution, so they stay pixel-sharp.
// Toggle between 3D and 2D in game with the "3" key.

#macro VOXEL_SIZE 2 //room pixels per voxel
#macro VOXEL_MAX_DEPTH 6 //max half thickness in voxels
#macro VOXEL_YAW 30 //default turn so the side of the model shows
#macro VOXEL_PITCH 25 //tilt so the top of the model shows. flip the sign if you see the bottom instead
#macro VOXEL_SURF_SIZE 64 //render surface size in room pixels

/// @desc pixel-art models. '.' = empty, other letters = palette colours. art faces right.
/// keep all models the same height (pad with empty rows at the top) so their feet line up.
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
				"....................",
				"....................",
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
				"....................",
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
				"....................",
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
		twig: {
			palette: { L: make_colour_rgb(90, 170, 70), l: make_colour_rgb(150, 210, 90), T: make_colour_rgb(120, 85, 55), K: make_colour_rgb(250, 230, 120) },
			rows: [
				"....................",
				"........LLL.........",
				"......LLLLLLL.......",
				".....LLLlLLLLL......",
				"......LLLLLlLL......",
				".......LLLLLL.......",
				"........TTTT........",
				"........TKTK........",
				"........TTTT........",
				"......T.TTTT.T......",
				".....T..TTTT..T.....",
				"....T...TTTT...T....",
				"........TTTT........",
				"........TTTT........",
				".......TT..TT.......",
				"......TT....TT......",
				".....TT......TT.....",
			],
		},
		spider: {
			palette: { B: make_colour_rgb(70, 60, 90), P: make_colour_rgb(170, 90, 200), H: make_colour_rgb(90, 75, 110), R: make_colour_rgb(240, 60, 60), L: make_colour_rgb(95, 85, 120) },
			rows: [
				"....................",
				"....................",
				"....................",
				"....................",
				"....................",
				"........BBBBB.......",
				".......BBBBBBB......",
				"......BBBPBBBBB.....",
				"......BBPPPBBBBHH...",
				"......BBBPBBBBHHHH..",
				".......BBBBBBBHHRHH.",
				"........BBBBBBHHHHH.",
				"....L.L.L.L..HHHHH..",
				"...L.L.L.L.L..L.L...",
				"..L.L.L.L.L.L..L.L..",
				"..L..L..L..L...L..L.",
				".L..L..L..L.....L...",
			],
		},
		knight: {
			palette: { H: make_colour_rgb(140, 145, 160), V: make_colour_rgb(230, 60, 60), A: make_colour_rgb(100, 105, 120), G: make_colour_rgb(220, 180, 60), C: make_colour_rgb(140, 40, 50), D: make_colour_rgb(60, 62, 75), S: make_colour_rgb(220, 225, 235) },
			rows: [
				"....................",
				"...................S",
				"......HHHHH.......S.",
				".....HHHHHHH.....S..",
				".....HHHVVVV....S...",
				".....HHHHHHH...S....",
				"......HHHHH...S.....",
				"....AAAAAAAA.S......",
				"...AAAAAAAAAG.......",
				"...AA.AAAAAAAA......",
				"...AA.AAAAAAG.......",
				"...AA.AAAAAAA.......",
				"......AAAAAAA.......",
				"......CCCCCCC.......",
				"......AA...AA.......",
				"......AA...AA.......",
				".....DDD...DDD......",
			],
		},
		ghost: {
			palette: { G: make_colour_rgb(120, 110, 170), g: make_colour_rgb(150, 140, 200), E: make_colour_rgb(240, 240, 255), M: make_colour_rgb(40, 30, 60) },
			rows: [
				"....................",
				"....................",
				".......GGGGGG.......",
				".....GGGGGGGGGG.....",
				"....GGGGGGGGGGGG....",
				"...GGGGGGGGEGGEGG...",
				"...GGGGGGGGEGGEGG...",
				"...GGGGGGGGGGGGGG...",
				"...GGGGGGGGGMMGGG...",
				"..gGGGGGGGGGGGGGGg..",
				".gg.GGGGGGGGGGGG.gg.",
				"....GGGGGGGGGGGG....",
				"....GGGGGGGGGGGGG...",
				".....GGGGGGGGGGGG...",
				"......GGGGGGGGGG....",
				".......GGG.GGG.GG...",
				"........G...G...G...",
			],
		},
		wolf: {
			palette: { M: make_colour_rgb(90, 100, 140), m: make_colour_rgb(170, 180, 210), E: make_colour_rgb(255, 220, 80), D: make_colour_rgb(60, 66, 95) },
			rows: [
				"....................",
				"....................",
				"................MM..",
				"...............MMM..",
				"..............MMMMm.",
				"..............MMEMMm",
				"..............MMMMM.",
				"....MMMMMMMMMMMMMM..",
				"...MMMMMMMMMMMMMMM..",
				"M.MMMMMMMMMMMMMMMm..",
				"MMMMMMMMMMMMMMMMmm..",
				".MMMMMMMMMMMMMMMm...",
				"...MMMMMMMMMMMMM....",
				"...MM.MM....MM.MM...",
				"...MM.MM....MM.MM...",
				"...MM.MM....MM.MM...",
				"..DDD.DDD..DDD.DDD..",
			],
		},
		drake: {
			palette: { R: make_colour_rgb(200, 60, 50), H: make_colour_rgb(210, 70, 55), E: make_colour_rgb(255, 230, 80), W: make_colour_rgb(150, 40, 50), Y: make_colour_rgb(240, 180, 90), F: make_colour_rgb(255, 160, 40), D: make_colour_rgb(120, 30, 30) },
			rows: [
				"....................",
				"....................",
				"..............HH....",
				"........W....HHHH...",
				".......WWW..HHHEHHH.",
				"......WWWWW.HHHHHHHF",
				".....WWWWWW.HHHHHH.F",
				"....WWWWWWHHHHH.....",
				"...WWWWWWRRRRRR.....",
				"....R.RRRRRRRRRR....",
				"...RR.RRRRRRRRRRR...",
				"..RR..RRRRRRRRRRR...",
				".RR...RRYYYYYRRRR...",
				".R.....RRRRRRRRR....",
				"........RR...RR.....",
				"........RR...RR.....",
				".......DDD..DDD.....",
			],
		},
		imp: {
			palette: { I: make_colour_rgb(130, 110, 60), S: make_colour_rgb(190, 230, 140), E: make_colour_rgb(255, 90, 60), W: make_colour_rgb(240, 236, 220) },
			rows: [
				"....................",
				"....................",
				"....................",
				"....................",
				"......S...S.........",
				"......SS.SS.........",
				".....SIIIIIS........",
				".....IIIIIII........",
				"....SIIIEIIEI.......",
				".....IIIIIIII.......",
				"......IIWWII........",
				"....S.IIIIII.S......",
				"....IIIIIIIIII......",
				"......IIIIII........",
				".....SIIIIIIS.......",
				"......II..II........",
				".....III..III.......",
			],
		},
		chick: {
			palette: { O: make_colour_rgb(255, 160, 50), F: make_colour_rgb(255, 90, 40), R: make_colour_rgb(230, 80, 40), K: make_colour_rgb(30, 20, 20), Y: make_colour_rgb(255, 220, 90) },
			rows: [
				"....................",
				"....................",
				"....................",
				"....................",
				"........F...........",
				".......FOF..........",
				"......OOOOO.........",
				".....OOOOOOO........",
				".....OOOOKOOYY......",
				".....OOOOOOOY.......",
				"....ROOOOOOOO.......",
				"...RROOOOOOOO.......",
				"....ROOOOOOOO.......",
				".....OOOOOOO........",
				"......OOOOO.........",
				".......Y.Y..........",
				"......YY.YY.........",
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
	//distance to the nearest empty pixel (8 neighbours, diagonals cost more)
	var _d = array_create(_w * _h, 0);
	for (var i = 0; i < _w * _h; i++) if (_cols[i] != -1) _d[i] = 99;
	repeat (VOXEL_MAX_DEPTH + 2) {
		for (var _y = 0; _y < _h; _y++) {
			for (var _x = 0; _x < _w; _x++) {
				var _i = _y * _w + _x;
				if (_d[_i] == 0) continue;
				_d[_i] = min(_d[_i],
					voxel_value_at(_d, _w, _h, _x - 1, _y) + 1, voxel_value_at(_d, _w, _h, _x + 1, _y) + 1,
					voxel_value_at(_d, _w, _h, _x, _y - 1) + 1, voxel_value_at(_d, _w, _h, _x, _y + 1) + 1,
					voxel_value_at(_d, _w, _h, _x - 1, _y - 1) + 1.41, voxel_value_at(_d, _w, _h, _x + 1, _y - 1) + 1.41,
					voxel_value_at(_d, _w, _h, _x - 1, _y + 1) + 1.41, voxel_value_at(_d, _w, _h, _x + 1, _y + 1) + 1.41);
			}
		}
	}
	//thickness in whole voxels (always odd so it stays centred). grows quickly at the edges, then levels off
	var _t = array_create(_w * _h, 0);
	for (var i = 0; i < _w * _h; i++) {
		if (_d[i] > 0) _t[i] = min(VOXEL_MAX_DEPTH, round(1.7 * sqrt(_d[i]))) * 2 - 1;
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
			var _n = _t[_i];
			var _ck = ((_x + _y) mod 2 == 0) ? 1 : 0.94; //subtle checker so single voxels read
			var _x1 = (_x - _w / 2) * _s, _x2 = _x1 + _s;
			var _y1 = (_y - _h / 2) * _s, _y2 = _y1 + _s;
			var _z1 = -_n * _s / 2, _z2 = _n * _s / 2;
			voxel_quad(_vb, _x1, _y1, _z1, _x2, _y1, _z1, _x2, _y2, _z1, _x1, _y2, _z1, voxel_shade(_c, _ck)); //front
			voxel_quad(_vb, _x1, _y1, _z2, _x2, _y1, _z2, _x2, _y2, _z2, _x1, _y2, _z2, voxel_shade(_c, 0.6 * _ck)); //back
			//sides: only the voxels that stick out past the neighbour
			voxel_side(_vb, 0, _x1, _y1, _x2, _y2, _n, voxel_value_at(_t, _w, _h, _x - 1, _y), _c, 0.88, _x + _y);
			voxel_side(_vb, 1, _x1, _y1, _x2, _y2, _n, voxel_value_at(_t, _w, _h, _x + 1, _y), _c, 0.8, _x + _y);
			voxel_side(_vb, 2, _x1, _y1, _x2, _y2, _n, voxel_value_at(_t, _w, _h, _x, _y - 1), _c, 1.12, _x + _y);
			voxel_side(_vb, 3, _x1, _y1, _x2, _y2, _n, voxel_value_at(_t, _w, _h, _x, _y + 1), _c, 0.6, _x + _y);
		}
	}
	vertex_end(_vb);
	vertex_freeze(_vb);
	return _vb;
}

function voxel_value_at(_arr, _w, _h, _x, _y) {
	if (_x < 0 || _y < 0 || _x >= _w || _y >= _h) return 0;
	return _arr[_y * _w + _x];
}

/// @desc one quad per exposed voxel on a side. face: 0 left, 1 right, 2 top, 3 bottom
/// @param {real} n thickness of this column, m thickness of the neighbour (both in voxels)
function voxel_side(_vb, _face, _x1, _y1, _x2, _y2, _n, _m, _col, _light, _parity) {
	if (_m >= _n) return;
	var _s = VOXEL_SIZE;
	for (var k = 0; k < _n; k++) {
		var _zc = -_n / 2 + k;
		if (_zc >= -_m / 2 && _zc < _m / 2) continue; //covered by the neighbour
		var _za = _zc * _s, _zb = (_zc + 1) * _s;
		var _c = voxel_shade(_col, _light * (((_parity + k) mod 2 == 0) ? 1 : 0.94));
		switch (_face) {
			case 0: voxel_quad(_vb, _x1, _y1, _za, _x1, _y2, _za, _x1, _y2, _zb, _x1, _y1, _zb, _c); break;
			case 1: voxel_quad(_vb, _x2, _y1, _za, _x2, _y2, _za, _x2, _y2, _zb, _x2, _y1, _zb, _c); break;
			case 2: voxel_quad(_vb, _x1, _y1, _za, _x2, _y1, _za, _x2, _y1, _zb, _x1, _y1, _zb, _c); break;
			case 3: voxel_quad(_vb, _x1, _y2, _za, _x2, _y2, _za, _x2, _y2, _zb, _x1, _y2, _zb, _c); break;
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
