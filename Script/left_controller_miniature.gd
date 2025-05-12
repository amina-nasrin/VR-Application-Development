extends XRNode3D  # or XRController3D

@onready var pose_action_map = $LeftHandHumanoid2/HandPoseDetector/HandPoseController
@onready var target_node = $Node3D/EnvironmentMiniature
@onready var controller = XRHelpers.get_xr_controller(get_parent().get_node("LeftController"))
#@onready var controller = XRHelpers.get_xr_controller(get_node("XROrigin3D/LeftController"))
#@onready var controller = XRHelpers.get_xr_controller(self)

func _process(delta):
	target_node.visible = false
	if controller.get_float("grip")>0.001:
		target_node.visible = true
	else:
		target_node.visible = false
