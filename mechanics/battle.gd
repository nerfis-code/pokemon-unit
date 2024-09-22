class_name Battle extends Node3D

@onready var message = $UI/Control/Message
@onready var ui = $UI
@onready var phase = $PhasesControl


enum command {
  	FIGHT,
  	BALL,
  	POKEMON,
  	RUN,
  	ITEM
}

enum battleType{
	WILD,
	TRAINER
}

enum battlerIndex{
	player1,
	player2,
	enemy1,
	enemy2
}


##region elementbattle
var player : Trainer
var enemy : Trainer
var enemyParty : Array[Pokemon]

@onready var playerField = $Field/PlayerField
@onready var enemyField =  $Field/EnemyField

var turn : int
var double : bool
var type : battleType

var currCommand : TurnCommand
var turnCommand = {}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:

	var a = PokemonSpecies.new("BULBASAUR")
	var pkm = Pokemon.new(PokemonSpecies.new("BULBASAUR"))
	var pkm2 = Pokemon.new(PokemonSpecies.new("CHARMANDER"))
	player = Trainer.new()
	player.name = "nerfis"
	player.player  = true
	player.party = [pkm,pkm2]
	var foeParty :Array[Pokemon] = []
	phase.initialize(player,foeParty,null,true)


func get_field() -> Array[Node]:
	return enemyField.get_children() + playerField.get_children()

class QueuedMove :
	var move 
	var targets : Array[battlerIndex]
	var ignorePP : bool

class TurnCommand :
	var currCommand: command
	#cursor?: integer;
	var move: QueuedMove
	var targets: Array[battlerIndex]
	var skip: bool
	var args
	
