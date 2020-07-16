shader_type spatial;
render_mode cull_front,diffuse_toon,unshaded;
uniform vec4 albedo : hint_color;
uniform float grow : hint_range(0,1);

// Gold Noise function
//
float gold_noise(in vec2 coordinate, in float seed)
{
    // Irrationals with precision shifting 
    //
    float PHI = 1.61803398874989484820459 * 00000.1; // Golden Ratio   
    float PI  = 3.14159265358979323846264 * 00000.1; // PI
    float SRT = 1.41421356237309504880169 * 10000.0; // Square Root of Two
    seed+=PHI;
    return fract(sin(dot(coordinate*seed, vec2(PHI, PI)))*SRT);
}

void vertex() {
    float seed = ceil(mod(TIME,15.0));
    float n = gold_noise(UV,seed);
    VERTEX+=NORMAL*(n)*grow;
}

void fragment() {
    ALBEDO = albedo.rgb;
}