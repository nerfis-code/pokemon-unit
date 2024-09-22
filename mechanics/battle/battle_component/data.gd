extends Control

@onready var bar = $TextureProgressBar
@onready var label = $Label
var tween
var realPos: Vector2
# Called when the node enters the scene tree for the first time.
func _ready() -> void:

	tween = create_tween().set_loops()
	tween.tween_property(self,"position:y",position.y+5,0.8)
	tween.tween_property(self,"position:y",position.y-5,0.8)
	tween.stop()

	bar.max_value = get_parent().pokemon.ps
	bar.value = get_parent().pokemon.ps
	label.text = get_parent().pokemon.species.name
	realPos = position
	
func update(val:int) -> void:
	tween.play()
	tween.tween_property(bar,"value",val,3)

func active() -> void:
	tween.play()
	
func exit_active() -> void:
	tween.stop()
	position = realPos
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if bar.value < bar.max_value * 0.3:
		bar.texture_progress.region = Rect2(0,12,0,6)
	elif bar.value < bar.max_value * 0.5:
		bar.texture_progress.region = Rect2(0,6,0,6)
	else:
		bar.texture_progress.region = Rect2(0,0,0,6)
	
