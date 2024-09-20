extends Phases

func _ready() -> void:
	super._ready()
	var battlers = battle.get_field()
	for b in battlers:
		if not b.isPlayer:
			continue
		await _select_command(b)

	_end()
	
func _select_command(pkm):
	pkm.active()
	var node = load("res://mechanics/battle/command.tscn").instantiate()
	$"../../UI".add_child(node)
	var curr = await node.await_select_command()
	pkm.exit_active()
	$"../../UI".remove_child(node)
	node.queue_free()
