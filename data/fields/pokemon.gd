class_name Pokemon

var species         :PokemonSpecies
var form         	:int
var level         	:int
var primaryType		:String # <- object
var secondaryType   :String # <- object
var abilities       :String
var moves           :Array[move]
var stats           :Array[int] 
var ps            	:int 
var ivs            	:Array[int] 
var evs            	:Array[int]

var defeated : bool = false

func _init(species: PokemonSpecies) -> void:
	self.species = species
	self.primaryType = species.primaryType
	self.primaryType = species.primaryType
	self.level = 50
	ivs.resize(6)
	evs.resize(6)
	for i in range(6):
		ivs[i] = 31

	if species.hiddenAbilitie != [] && Utils.rng_by_percet(10):
		self.abilities = species.hiddenAbilitie[0]
	else:
		self.abilities =  species.abilities[1] if Utils.rng_by_percet(40) &&  species.abilities.size() > 1 else species.abilities[0]
		pass
		
	calculate_stats()
	learn_any_move()

func calculate_stats():
	
	stats.resize(6)
	
	for s in range(6):
		var scale : float = float(level) / 100
		if s == Stat.HP:
			var newPs := int(10 +  scale * (species.baseStats[Stat.HP] * 2 + ivs[Stat.HP] + evs[Stat.HP] ) + level)
			var missingPs := stats[Stat.HP] - ps
			ps = newPs - missingPs
			stats[Stat.HP] = newPs
			continue
		stats[s] = int(5 + scale * (species.baseStats[s] * 2 + ivs[s] + evs[s] )) # nature

func learn_any_move():
	var res:Array[String] = []

	for curr in species.moves:
		var lv = curr[0]
		var mov = curr[1]

		if lv > level : break

		if res.size() < 4: res.append(mov)		
		else : res[randi_range(0,3)] = mov
	
	var cache : Array[move] = []
	for str in res:
		cache.append(move.new(str))
			
	moves = cache
