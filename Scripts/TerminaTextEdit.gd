extends TextEdit


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var help_msg = "List of available commands (type 'help CMD' for detaild info about command CMD).\n breakyou: dictionary-based password enumeration tool\n clear: reset the terminal.\n exit: close the terminal.\n filetoox: extract metafata from files.\n help: get help on available commands.\n netdog: connect and communicate with remote systems.\n nscan: scan a remote system over the network.\n whichip: translate machine names into ip addresses."
var localhost = "127.0.0.1"
var target_ip = "86.84.73.127"
var target_port = "21"
var target_ns = "anonymous.hosting.com"
var picture = "chloe_unveiled.jpg"
var pwd_list = ["123456", "12345", "123456789", "password", "iloveyou", "princess", "1234567", "rockyou", "12345678", "abc123", "nicole", "daniel", "babygirl", "monkey", "lovely", "jessica", "654321", "michael", "ashley", "qwerty", "111111", "iloveu", "000000", "michelle", "tigger", "sunshine", "chocolate", "password1", "soccer", "anthony", "friends", "butterfly", "purple", "angel", "jordan", "liverpool", "justin", "loveme", "fuckyou", "123123", "football", "secret", "andrea", "carlos", "jennifer", "joshua", "bubbles", "1234567890", "superman", "hannah", "amanda", "loveyou", "pretty", "basketball", "andrew", "angels", "tweety", "flower", "playboy", "hello", "elizabeth", "hottie", "tinkerbell", "charlie", "samantha", "barbie", "chelsea", "lovers", "teamo", "jasmine", "brandon", "666666", "shadow", "melissa", "eminem", "matthew", "robert", "danielle", "forever", "family", "jonathan", "987654321", "computer", "whatever", "dragon", "vanessa", "cookie", "naruto", "summer", "sweety", "spongebob", "joseph", "junior", "softball", "taylor", "yellow", "daniela", "lauren", "mickey", "princesa", "alexandra", "alexis", "jesus", "estrella", "miguel", "william", "thomas", "beautiful", "mylove", "angela", "poohbear", "patrick", "iloveme", "sakura", "adrian", "alexander", "destiny", "christian", "121212", "sayang", "america", "dancer", "monica", "richard", "112233", "princess1", "555555", "diamond", "carolina", "steven", "rangers", "louise", "orange", "789456", "999999", "shorty", "11111", "nathan", "snoopy", "gabriel", "hunter", "cherry", "killer", "sandra", "alejandro", "buster", "george", "brittany", "alejandra", "patricia", "rachel", "tequiero", "7777777", "cheese", "159753", "arsenal", "dolphin", "antonio", "heather", "david", "ginger", "stephanie", "peanut", "blink182", "sweetie", "222222", "beauty", "987654", "victoria", "honey", "00000", "fernando", "pokemon", "maggie", "corazon"]
var pwd_list_post =["123321", "chicken", "pepper", "cristina", "rainbow", "kisses", "manuel", "myspace", "rebelde", "angel1", "ricardo", "babygurl", "heaven", "55555", "baseball", "martin", "greenday", "november", "alyssa", "madison", "mother"]
var target_pwd = "123321"
var target_usr = "secreteye"

var interactive = false

# Called when the node enters the scene tree for the first time.
func _ready():
	self.grab_focus()
	self.cursor_set_column(2)

# Called every frame. 'delta' is the elapsed time since the previous frame.
# func _process(delta):
#	pass


func _on_TextEdit_text_changed():
	if not interactive:
		var nline = self.get_line_count()
		var line = self.get_line(nline - 1)
		if line == "" :
			var cmd = self.get_line(nline - 2)
			exec_command(cmd)


func _on_TextEdit_cursor_changed():
	if not interactive:
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
			cprint("Syntax: clear\n\nClear the terminal from all the text.\n\nUsage examples:\n clear")
		elif token[2] == "exit":
			cprint("Syntax: exit\n\nClose the terminal.\n\nUsage examples:\n exit")
		elif token[2] == "help":
			cprint("Syntax: help [CMD]\n\nGet help about commands. Returns a list of available commands or specific details about CMD (optional parameter).\n\nUsage examples:\n help\n help clear")
		elif token[2] == "breakyou":
			cprint("Syntax: breakyou USER IP PORT\n\nConnects to remote the service running an address IP:PORT and attempts to login as USER by means of a predefined password list.\n\n\nUsage examples:\n breakyou micky 110.37.21.5 80\n breakyou daisy 77.125.9.1 22")
		else:
			cprint("Cannot help with unknown command '" + token[2] +"'. Type 'help' for a list of available commands")
	elif token[1] == "filetoox":
		filetoox(token)
	elif token[1] == "netdog":
		netdog(token)
	elif token[1] == "breakyou":
		breakyou(token)
	elif token[1] == "nscan":
		nscan(token)
	else:
		cprint("Unknown commnad '" + token[1] + "'. Type 'help' for a list of available commnds")

func cprint(msg):
	self.insert_text_at_cursor(msg)
	self.insert_text_at_cursor("\n$ ")
	
func cwriteline(msg):
	self.insert_text_at_cursor(msg + "\n")
	
func filetoox(token):
	interactive = true
	
	interactive = false

func netdog(token):
	interactive = true
	
	interactive = false

func breakyou(token):
	interactive = true
	if token.size() < 5:
		cprint("Not enough arguments. Type 'help breakyou' for more details") 
	else:
		cwriteline("Connecting to " + token[3])
		yield(get_tree().create_timer(1.0), "timeout")
		if not token[3] == target_ip:
			cprint("Target host did not respond")
		elif not token[4] == target_port:
			cprint("No service running on port " + token[3])
		else:
			cwriteline("Connected! User exists")
			for pwd in pwd_list:
				cwriteline("Trying " + pwd)
				yield(get_tree().create_timer(0.1), "timeout")
				cwriteline("Wrong")
			if not token[2] == target_usr:
				for pwdp in pwd_list_post:
					cwriteline("Trying " + pwdp)
					yield(get_tree().create_timer(0.1), "timeout")
					cwriteline("Wrong")
				cprint("Password not found. Try with another user")
			else:
				cwriteline("Trying " + target_pwd)
				yield(get_tree().create_timer(0.1), "timeout")
				cwriteline("Correct!")
				cprint("Password found!")
	interactive = false

func nscan(token):
	interactive = true
	
	interactive = false
