class_name moveData

var move            :String
var name            :String
var type            :String
var power           :int
var accuracy        :int
var totalPP         :int
var priority        :int
var target          :String
var effectChance    :int
var functionCode    :String
var description     :String
var category:       String
var flags           :Array

func _init(fileName:String) -> void:
	var json = JSON.new()
	var file = FileAccess.open("res://data/pbs/moves/" + fileName + ".json",FileAccess.READ).get_as_text()
	var error = json.parse(file)

	if error == OK:
		var data_received = json.data
		move =          data_received["move"]
		name =          data_received["name"]
		type =          data_received["type"]
		power =         data_received["power"]
		accuracy =      data_received["accuracy"]
		totalPP =       data_received["totalPP"]
		priority =      data_received["priority"]
		target =        data_received["target"]
		effectChance =  data_received["effectChance"]
		functionCode =  data_received["functionCode"]
		description =   data_received["description"]
		category =      data_received["category"]
		flags =         data_received["flags"]
