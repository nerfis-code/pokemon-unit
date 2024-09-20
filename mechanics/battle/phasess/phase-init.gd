class_name Phases extends Node

var battle : Battle
var control : Node

func _ready() -> void:
	control = get_parent()
	battle = control.get_parent()
	print("new phase")

func _end() -> void:
	get_parent().remove_child(self)
	self.queue_free()
	control.change_phase()


class Initialize extends Phases:

	var player: Trainer
	var enemy: Trainer
	var enemyParty : Array[Pokemon]
	var double : bool

	func _ready() -> void:
		super._ready()

		var EntreredPokemonPhase = load("res://mechanics/battle/phasess/entrered_pokemon_phase.gd")
		var CommandPhase = load("res://mechanics/battle/phasess/command_phase.gd")

		battle.player = player
		battle.enemy = enemy
		battle.enemyParty = enemyParty
		battle.double = double

		battle.type = battle.battleType.TRAINER
		if enemy == null:
			battle.type = battle.battleType.WILD
		
		if enemyParty == []:
			enemyParty = _get_random_party()
		
		for p in _search_firts_pokemon_index(player.party):
			control.waitingList.push_front(EntreredPokemonPhase.new(p,true))
		for p in  _search_firts_pokemon_index(enemyParty):
			control.waitingList.push_front(EntreredPokemonPhase.new(p,false))
		control.waitingList.push_back(CommandPhase.new())
		_end()

	
	func _init(t1 : Trainer, t2party: Array[Pokemon],t2 : Trainer = null, d : bool = false) -> void:
		player = t1
		enemyParty = t2party
		enemy = t2
		double = d
	
	func _search_firts_pokemon_index(party:Array[Pokemon]) -> Array[Pokemon]:
		var res : Array[Pokemon] = []
		var limint := 2 if battle.double else 1
		var n := 0
		while res.size() < limint && n < party.size():
			if !party[n].defeated:
				res.append(party[n])
			n += 1
		return res
	func _get_random_party() -> Array[Pokemon]:
		var res : Array[Pokemon] = []
		res.append(Pokemon.new(PokemonSpecies.new("BULBASAUR")))
		if battle.double:
			res.append(Pokemon.new(PokemonSpecies.new("CHARIZARD")))
		return res  




		


		
