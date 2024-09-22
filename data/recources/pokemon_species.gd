class_name PokemonSpecies 

var name                    :String
var species                 :String
var primaryType             :String # <- object
var secondaryType           :String # <- object
var baseStats               :Array
var evs                     :Array
var abilities               :Array
var hiddenAbilitie          :Array
var generation              :int
var baseExp                 :int
var happiness               :int
var growthRate              :String # <- object
var genderRatio             :float
var catchRate               :int
var internationalPokedex    :int
var height                  :float
var weight                  :float
var flags                   :Array
var eggMoves                :Array
var moves                   :Array
var tutorMoves              :Array

func _init(fileName:String) -> void:

	var json = JSON.new()
	var file = FileAccess.open("res://data/pbs/species/" + fileName + ".json",FileAccess.READ).get_as_text()
	var error = json.parse(file)

	if error == OK:
		var data_received = json.data
		name =                  data_received["name"]
		primaryType =           data_received["primaryType"]
		secondaryType =         data_received["secondaryType"]
		species =               data_received["species"]
		catchRate =             data_received["catchRate"]
		happiness =             data_received["happiness"]
		baseExp =               data_received["baseExp"]
		height =                data_received["height"]
		weight =                data_received["weight"]
		growthRate =            data_received["growthRate"]
		genderRatio =           data_received["genderRatio"]
		generation =            data_received["generation"]
		internationalPokedex =  data_received["internationalPokedex"]
		abilities =             data_received["abilities"]
		hiddenAbilitie =        data_received["hiddenAbilitie"]
		baseStats =             data_received["baseStats"]
		flags =                 data_received["flags"]
		evs =                   data_received["evs"]
		eggMoves =              data_received["eggMoves"]
		tutorMoves =            data_received["tutorMoves"]
		moves =                 data_received["moves"]

#var evolutions        :String
#var evs        :String

#var moves        :String
#var tutorMoves        :String
#var eggMoves        :String
#var eggGroups        :String

#var flags        :String
#var category    :String
#var color        :String
#var shape        :String
#var habitat        :String

#var hatchSteps        :String
#var pokedex        :String 
#var wildItemCommon        :String
#var wildItemUncommon        :String
#var wildItemRare        :String
#var incense        :String
#var offspring        :String
