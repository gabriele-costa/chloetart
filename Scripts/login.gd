extends LineEdit


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var password = "Chloe"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_password_text_entered(input):
	if input == password:
		# scene change
		get_tree().change_scene("res://Scenes/Desktop.tscn")
	else:
		# wrong password
		get_node("wp_message").visible = true
