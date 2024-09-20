extends Control

var command : Battle.Command = -1
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$TextureButton.grab_focus()
	$TextureButton.pressed.connect(func () : command = Battle.Command.FIGHT)
	$TextureButton2.pressed.connect(func () : command = Battle.Command.ITEM)
	$TextureButton3.pressed.connect(func () : command = Battle.Command.POKEMON)
	$TextureButton4.pressed.connect(func () : command = Battle.Command.RUN)

func await_select_command() -> Battle.Command:
	while command == -1:
		await get_tree().process_frame
	return command
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
