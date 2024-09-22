extends Control

var command : int = -1
var error : int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$GridContainer/TextureButton.grab_focus() #command = Battle.Command.FIGHT
	$GridContainer/TextureButton.pressed.connect(func (): command = 0)

func await_select_command() -> int:
	while command == -1 and error == 0:
		await get_tree().process_frame
	return command

		
func _input(event: InputEvent) -> void: # 
	if event.is_action_pressed("ui_cancel"): 
		error = 1
	
