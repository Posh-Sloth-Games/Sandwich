extends ShapeCast3D

@export var HeadSetter: Node3D
@export var RArmSetter: Node3D
@export var LArmSetter: Node3D
@export var RLegSetter: Node3D
@export var LLegSetter: Node3D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	SetBodyPart()

func SetBodyPart():
	force_shapecast_update()
	for Body in collision_result:
		if (not Body.collider.name.contains("Snap")):
			continue
		Body.collider.top_level = false
		Body.collider.freeze = true
		if (Body.collider.name.contains("Head")):
			Body.collider.reparent(HeadSetter)
		if (Body.collider.name.contains("Rarm")):
			Body.collider.reparent(RArmSetter)
		if (Body.collider.name.contains("lArm")):
			Body.collider.reparent(LArmSetter)
		if (Body.collider.name.contains("rLeg")):
			Body.collider.reparent(RLegSetter)
		if (Body.collider.name.contains("Lleg")):
			Body.collider.reparent(LLegSetter)
		Body.collider.position = Vector3.ZERO
		Body.collider.rotation = Vector3.ZERO