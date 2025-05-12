extends Node3D

func _ready():
	var floor := MeshInstance3D.new()
	floor.name = "CheckerboardFloor"
	
	var plane := PlaneMesh.new()
	plane.size = Vector2(20, 20)
	floor.mesh = plane
	
	var shader := Shader.new()
	shader.code = """
		shader_type spatial;

		uniform vec3 color1 : source_color = vec3(0.1, 0.1, 0.1);
		uniform vec3 color2 : source_color = vec3(0.9, 0.9, 0.9);
		uniform float size = 1.0;

		void fragment() {
			vec2 coord = UV * 10.0 / size;
			int checker = int(floor(coord.x) + floor(coord.y)) % 2;
			vec3 color = checker == 0 ? color1 : color2;
			ALBEDO = color;
		}
	"""

	var shader_material := ShaderMaterial.new()
	shader_material.shader = shader
	shader_material.set_shader_parameter("size", 0.5)  # Smaller = more squares
	floor.material_override = shader_material
	
	add_child(floor)
