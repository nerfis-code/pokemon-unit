class_name move

var data : moveData
var pp : int
var isUsable : bool

func _init(moveName: String) -> void:
    var _data = moveData.new(moveName)
    data = _data
    pp = _data.totalPP
    isUsable = true