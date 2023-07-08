extends ShapeCast3D

var holding := false
var heldObject : RigidBody3D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	GrabShape()

func GrabShape():
	if Input.is_action_just_pressed("action"):
		if holding:
			ReleaseHeldObject()
		else:
			GrabFirstObject()
	
func GrabFirstObject():
	force_shapecast_update()
	for body in collision_result:
		if body.collider.name.contains("Ragdoll"):
			heldObject = body.collider
			heldObject.top_level = false
			heldObject.linear_velocity = Vector3.ZERO
			heldObject.angular_velocity = Vector3.ZERO
			heldObject.sleeping = true
			print(heldObject.name)
			heldObject.reparent(self)
			holding = true
			pass

func ReleaseHeldObject():
	heldObject.top_level = true
	heldObject.sleeping = false
	heldObject.apply_impulse(self.get_parent().velocity)
	holding = false
