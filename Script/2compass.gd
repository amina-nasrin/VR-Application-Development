extends Node3D

@onready var compass_mesh: MeshInstance3D = $CompassMesh
@onready var path_mesh_instance: MeshInstance3D = $PathMesh
@onready var miniature_path_instance: MeshInstance3D = $MiniaturePath

var path_points: Array[Vector3] = []
var max_points := 100
var point_interval := 0.2
var time_accumulator := 0.0

var immediate_mesh := ImmediateMesh.new()
var miniature_mesh := ImmediateMesh.new()

var glowing_material := StandardMaterial3D.new()

# Tweak this if your miniature environment is parented differently
var is_miniature_visible := false

func _ready():
	# Setup main path
	path_mesh_instance.mesh = immediate_mesh
	
	glowing_material.emission_enabled = true
	glowing_material.emission = Color(0.3, 0.7, 1.0)
	glowing_material.emission_energy_multiplier = 15.0
	glowing_material.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	path_mesh_instance.material_override = glowing_material
	
	# Setup miniature path
	miniature_path_instance.mesh = miniature_mesh
	
	var mini_material = StandardMaterial3D.new()
	mini_material.emission_enabled = true
	mini_material.emission = Color(0.3, 0.7, 1.0)
	mini_material.emission_energy_multiplier = 15.0
	mini_material.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	miniature_path_instance.material_override = mini_material

func _process(delta):
	time_accumulator += delta

	if time_accumulator >= point_interval:
		time_accumulator = 0.0
		update_path_point(global_transform.origin)

	draw_path()

	# Auto update miniature path only when visible
	if is_miniature_visible:
		draw_miniature_path()

func update_path_point(pos: Vector3):
	path_points.append(pos)
	if path_points.size() > max_points:
		path_points.pop_front()

func draw_path():
	immediate_mesh.clear_surfaces()
	immediate_mesh.surface_begin(Mesh.PRIMITIVE_LINE_STRIP)

	for pt in path_points:
		immediate_mesh.surface_add_vertex(pt)

	immediate_mesh.surface_end()

func draw_miniature_path():
	miniature_mesh.clear_surfaces()
	miniature_mesh.surface_begin(Mesh.PRIMITIVE_LINE_STRIP)

	for pt in path_points:
		var mini_pt = miniature_path_instance.get_parent().to_local(pt)
		miniature_mesh.surface_add_vertex(mini_pt)

	miniature_mesh.surface_end()

# Call this when gesture shows miniature
func on_miniature_shown():
	is_miniature_visible = true

# Call this when gesture hides miniature
func on_miniature_hidden():
	is_miniature_visible = false
