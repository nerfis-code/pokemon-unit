extends Node

enum {
	OK,
	CANCEL
}

func select_commands() -> void:
	var curr = $"../..".playerField.get_children()
	var n := 0
	
	while n < curr.size():
		
		curr[n].active()
		var node = load("res://mechanics/battle/command.tscn").instantiate()
		$"../../UI".add_child(node)
		var res = await node.await_select_command()
		var err = node.error
		
		$"../../UI".remove_child(node)
		node.queue_free()
		
		if(err == CANCEL):
			curr[n].exit_active()
			n = max(0,n-1)
			continue
		
		if(res == 0):
			node = load("res://mechanics/battle/battle_component/select_att.tscn").instantiate()
			node.assign(curr[n])
			$"../../UI".add_child(node)
			res = await node.await_select_command()
			err = node.error
			$"../../UI".remove_child(node)
			node.queue_free()
			
		if(err == CANCEL):
			curr[n].exit_active()
			continue
		curr[n].exit_active()
		n+= 1
