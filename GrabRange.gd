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
	
	force_shapecast_update() #Ensure that shapecast is updated
	var i: int = 0
	var nearest: int = -1
	for body in collision_result:
		print(body.collider.name)
		if (not body.collider.name.contains("Ragdoll")):
			i += 1 #prepare to check next index
			continue #Only evaluate bodies marked ragdoll
		if nearest == -1:
			nearest = i
		if (self.position.distance_to(body.collider.position) < 
		self.position.distance_to(collision_result[nearest].collider.position)):
			nearest = i #save nearest body's index
		i += 1 #prepare to check next index
	if (nearest != -1):
		print(collision_result[nearest].collider.name)
		heldObject = collision_result[nearest].collider #hold the object at nearest body's index
		# held object logic
		heldObject.top_level = false
		heldObject.linear_velocity = Vector3.ZERO
		heldObject.angular_velocity = Vector3.ZERO
		heldObject.sleeping = true
		print(heldObject.name)
		heldObject.reparent(self)
		holding = true
		return


func ReleaseHeldObject():
	heldObject.top_level = true
	heldObject.sleeping = false
	heldObject.apply_impulse(self.get_parent().velocity)
	heldObject = RigidBody3D.new()
	holding = false
