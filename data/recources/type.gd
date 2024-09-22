class_name Type

var type            :String
var name            :String
var iconPosition    :int
var isSpecialType   :bool
var isPseudoType    :bool
var weaknesses      :Array
var resistances     :Array
var immunities      :Array
var flags           :Array

func _init(fileName:String) -> void:

	var json = JSON.new()
	var file = FileAccess.open("res://data/pbs/species/" + fileName + ".json",FileAccess.READ).get_as_text()
	var error = json.parse(file)

	if error == OK:
		var data_received = json.data

		type            = data_received["type"]
		name            = data_received["name"]
		iconPosition    = data_received["iconPosition"]       
		isSpecialType   = data_received["isSpecialType"]
		isPseudoType    = data_received["isPseudoType"]
		weaknesses      = data_received["weaknesses"]
		resistances     = data_received["resistances"]
		immunities      = data_received["immunities"]
		flags           = data_received["flags"]
