shader_type canvas_item;

void fragment() {
    vec2 uv = UV - vec2(0.5);

    if (length(uv) > 0.5) {
        discard;
    }
	else {
	    COLOR = texture(TEXTURE, UV);
		float minval = min(COLOR.r, min(COLOR.g, COLOR.b));
		COLOR = vec4(minval, minval, minval, 0.5);
	}


}