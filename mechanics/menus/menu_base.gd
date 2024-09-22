class_name menuBase extends Control

var prev: Control
var prevContext : Array

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func assign(arg:Control) -> void:
	prev = arg 
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"): 
		get_parent().add_child(prev)
		get_parent().remove_child(self)
		
