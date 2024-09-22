extends Phases

func _ready() -> void:
	super._ready()
	var battlers = battle.get_field()
	var n:= 0
	await control.controller.select_commands()

	_end()
	
func _select_command(pkm) -> int:
	pkm.active()
	var node = load("res://mechanics/battle/command.tscn").instantiate()
	node.assign(pkm)
	$"../../UI".add_child(node)
	var curr = await node.await_select_command()
	pkm.exit_active()
	$"../../UI".remove_child(node)
	node.queue_free()
	return curr
