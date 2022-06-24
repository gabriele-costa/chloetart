extends TextEdit


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
# func _process(delta):
#	pass


func _on_TextEdit_text_changed():
	var nline = self.get_line_count()
	var line = self.get_line(nline - 1)
	if line == "" :
		var cmd = self.get_line(nline - 2)
		print(cmd)


func _on_TextEdit_cursor_changed():
	var nline = self.get_line_count()
	var cline = self.cursor_get_line()
	if not (nline-1) == cline:
		self.cursor_set_line(nline-1)  
