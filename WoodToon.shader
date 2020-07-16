shader_type spatial;
render_mode blend_mix,depth_draw_opaque,cull_back,diffuse_burley,specular_schlick_ggx;
uniform vec4 albedo : hint_color;
uniform float specular;

//Cel Shading
uniform bool ativar_tres_linhas;

//Exploder
uniform float expandir : hint_range(0,5);

void vertex() {
	float raiz = ceil(mod(TIME,15.0));
    VERTEX+=NORMAL*expandir;
	VERTEX.z += sin(TIME * 0.7);
}

void fragment() {
	ALBEDO = albedo.rgb;
	METALLIC = 0.0;
	ROUGHNESS = 1.0;
	NORMALMAP_DEPTH = 0.0;
}

float defineluz(vec3 light, vec3 normal)
{
	float novaLuz = dot(normalize(light), normal);
	return novaLuz;
}

float tres_linhas(float luz)
{
	if(luz >= 0.6)
	{
		return specular;
	} 
	else if (luz < 0.6 && luz >= 0.3)
	{
		return specular * 0.6;
	}
	else
	{
		return specular * 0.3;
	}
}

float duas_linhas(float luz)
{
	if(luz >= 0.5)
	{
		return specular;
	} 
	else
	{
		return specular * 0.3;
	}
}

void light()
{
	float novaLuz = defineluz(LIGHT, NORMAL);
	float intensidade = 0.0;
	if (ativar_tres_linhas)
	{
		intensidade = tres_linhas(novaLuz);
	}
	else
	{
		intensidade = duas_linhas(novaLuz);
	}
	
	DIFFUSE_LIGHT = ALBEDO*intensidade*ATTENUATION;
}
