extends Control

@onready var tex = $RichTextLabel
var isRunning := false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

	
func append_text(msg: String) -> void:
	tex.text = ""
	$"../Data".visible = false
	visible = true
	isRunning = true
	for m in msg.split(""):
		tex.text += m
		await get_tree().create_timer(0.04).timeout
		if not isRunning:
			break
	tex.text = msg		
	isRunning = false
	await get_tree().create_timer(1).timeout
	visible = false
	$"../Data".visible = true

func _input(event: InputEvent) -> void: # 

	if event.is_action_pressed("ui_accept"): 
		isRunning = false

# func wait_for_key_press(action: String) -> void:
# 	# Bucle hasta que se presione la tecla
# 	while isRunning:
# 		await get_tree().process_frame  # Espera al siguiente frame
# 		if Input.is_action_pressed(action):
# 			tween.kill()
# 			tex.visible_ratio = 1
# 			break 
		
	
