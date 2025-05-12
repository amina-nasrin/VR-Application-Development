extends Node3D

@onready var compass_mesh: MeshInstance3D = $CompassMesh
@onready var path_mesh_instance: MeshInstance3D = $PathMesh

var path_points: Array[Vector3] = []
var max_points := 100
var point_interval := 0.2
var time_accumulator := 0.0

var immediate_mesh := ImmediateMesh.new()
var glowing_material := StandardMaterial3D.new()

func _ready():
	path_mesh_instance.mesh = immediate_mesh

	# Create and assign a glowing material
	glowing_material.emission_enabled = true
	glowing_material.emission = Color(0.3, 0.7, 1.0) # beautiful blue
	glowing_material.emission_energy_multiplier = 15.0 # strong glow
	glowing_material.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED # << Important!
	path_mesh_instance.material_override = glowing_material

func _process(delta):
	time_accumulator += delta

	if time_accumulator >= point_interval:
		time_accumulator = 0.0
		update_path_point(global_transform.origin)

	draw_path()

func update_path_point(pos: Vector3):
	path_points.append(pos)
	if path_points.size() > max_points:
		path_points.pop_front()

func draw_path():
	immediate_mesh.clear_surfaces()
	immediate_mesh.surface_begin(Mesh.PRIMITIVE_LINE_STRIP)

	for pt in path_points:
		immediate_mesh.surface_add_vertex(to_local(pt))

	immediate_mesh.surface_end()
