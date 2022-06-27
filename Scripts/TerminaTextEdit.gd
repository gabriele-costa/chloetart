extends TextEdit


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var help_msg = "List of available commands (type 'help CMD' for detaild info about command CMD).\n clear: reset the terminal.\n exit: close the terminal.\n help: get help on available commands.\n netdog: connect and communicate with remote systems.\n nscan: scan a remote system over the network.\n whichip: translate machine names into ip addresses."

# Called when the node enters the scene tree for the first time.
func _ready():
	self.grab_focus()
	self.cursor_set_column(2)

# Called every frame. 'delta' is the elapsed time since the previous frame.
# func _process(delta):
#	pass


func _on_TextEdit_text_changed():
	var nline = self.get_line_count()
	var line = self.get_line(nline - 1)
	if line == "" :
		var cmd = self.get_line(nline - 2)
		exec_command(cmd)


func _on_TextEdit_cursor_changed():
	var nline = self.get_line_count()
	var cline = self.cursor_get_line()
	if not (nline-1) == cline:
		self.cursor_set_line(nline-1)
	if self.get_line(cline).length() < 2:
		self.set_line(cline, "$ ")
		self.cursor_set_column(2)


func exec_command(command):
	var token = command.split(" ")
	if token[1] == "":
		pass
	elif token[1] == "clear":
		self.select_all()
		self.cut()
		self.insert_text_at_cursor("$ ")
	elif token[1] == "exit":
		get_tree().change_scene("res://Scenes/Desktop.tscn")
	elif token[1] == "help":
		if token.size() < 3:
			cprint(help_msg)
		elif token[2] == "clear":
			pass
	else:
		cprint("Unknown commnad '" + token[1] + "'. Type 'help' for a list of available commnds")

func cprint(msg):
	self.insert_text_at_cursor(msg)
	self.insert_text_at_cursor("\n$ ")
