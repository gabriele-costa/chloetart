extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	set_process_input(true)

func _input(ev):
	if ev.type==InputEvent.MOUSE_BUTTON and ev.is_pressed() and ev.button_index==1 and ev.doubleclick:
		get_tree().change_scene("res://Scenes/Files.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
