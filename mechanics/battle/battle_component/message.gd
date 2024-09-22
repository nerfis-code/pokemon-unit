extends Control

@onready var tex = $RichTextLabel
var isRunning := false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

	
func append_text(msg: String) -> void:
	tex.text = ""
	visible = true
	isRunning = true
	for m in msg.split(""):
		tex.text += m
		await get_tree().create_timer(0.04).timeout
		if not isRunning:
			break
	tex.text = msg		
	isRunning = true
	var timer = 1.0 
	while timer > 0:
		await get_tree().process_frame 
		timer -= get_process_delta_time()
		if not isRunning:
			break
	visible = false

func _input(event: InputEvent) -> void: # 

	if event.is_action_pressed("ui_accept"): 
		isRunning = false

		
	
