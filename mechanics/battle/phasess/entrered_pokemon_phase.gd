extends Phases

var pkm: Pokemon
var isPlayer: bool

func _init(pokemon: Pokemon,player : bool) -> void:
	pkm = pokemon
	self.isPlayer = player

func _ready() -> void:
	super._ready()
	BattleSignal.entreredPokemon.emit(pkm)
	var ufn = preload("res://mechanics/battle/battler.tscn").instantiate()
	ufn.assing(pkm,battle,isPlayer)
	var field  = battle.playerField if isPlayer else battle.enemyField
	field.add_child(ufn)
	ufn.position += Vector3(ufn.get_index()*0.4,0,0)
		
	await battle.message.append_text("El pokemon " + pkm.species.name + " ha entrado al combate")
	_end()
