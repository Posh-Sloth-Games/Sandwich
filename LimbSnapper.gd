extends ShapeCast3D

@export var DanceChef: Node3D

@export var HeadSetter: Node3D
@export var RArmSetter: Node3D
@export var LArmSetter: Node3D
@export var RLegSetter: Node3D
@export var LLegSetter: Node3D

var hasHead := false
var hasRArm := false
var hasLArm := false
var hasRLeg := false
var hasLLeg := false

signal gameIsWon

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	SetBodyPart()
	CheckWin()

func SetBodyPart():
	force_shapecast_update()
	for Body in collision_result:
		if (not Body.collider.name.contains("Snap")):
			continue
		Body.collider.top_level = false
		Body.collider.freeze = true
		if (Body.collider.name.contains("Head")):
			hasHead = true
			Body.collider.reparent(HeadSetter)
		if (Body.collider.name.contains("Rarm")):
			hasRArm = true
			Body.collider.reparent(RArmSetter)
		if (Body.collider.name.contains("lArm")):
			hasLArm = true
			Body.collider.reparent(LArmSetter)
		if (Body.collider.name.contains("rLeg")):
			hasRLeg = true
			Body.collider.reparent(RLegSetter)
		if (Body.collider.name.contains("Lleg")):
			hasLLeg = true
			Body.collider.reparent(LLegSetter)
		Body.collider.position = Vector3.ZERO
		Body.collider.rotation = Vector3.ZERO

func CheckWin():
	if hasHead && hasRArm && hasLArm && hasRLeg && hasLLeg:
		gameIsWon.emit()
		DanceChef.visible = true
		self.visible = false
