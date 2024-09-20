extends Node

var waitingList: Array[Phases]
var curr : Phases

func change_phase() -> void:
	if waitingList.size() == 0:
		print("Se acabo el juegesito ete no mal echo")
		return
	curr = waitingList.pop_front()
	add_child(curr)

func initialize(t1 : Trainer, foeParty: Array[Pokemon],foe : Trainer = null, double : bool = false) -> void:
	waitingList.push_front(Phases.Initialize.new(t1,foeParty,foe,double))
	change_phase()
		
