class_name Battler extends CharacterBody3D

var pokemon        :Pokemon
var stats            :Array[int] 
var form                :int
var primaryType               :String # <- object
var secondaryType             :String # <- object
var abilities           :String
var battle : Battle
var tags
var isPlayer: bool
#node part
@onready var sprite = $Sprite3D

func assing(pkm:Pokemon,scene:Battle,player:bool=true) -> void:
	pokemon = pkm
	stats = pkm.stats
	primaryType = pkm.primaryType
	secondaryType = pkm.secondaryType
	abilities = pkm.abilities
	battle = scene
	isPlayer = player

func _ready() -> void:
	
	update()

func update() -> void:
	_get_sprite()
	_animated()
	_created_sprite()
	_set_ui()

func _set_ui() -> void:
	if has_node("Data"):
		get_node("Data").update(pokemon.ps)
		return
	var node = load("res://mechanics/battle/battle_component/databox.tscn").instantiate() if isPlayer else load("res://mechanics/battle/battle_component/databox_foe.tscn").instantiate()
	var pos = Vector2(0,-100*get_index()) if isPlayer else Vector2(0,100*get_index())
	node.position += pos
	node.name = "Data"
	add_child(node)

func active() -> void:
	if has_node("Data"):
		get_node("Data").active()

func exit_active() -> void:
	if has_node("Data"):
		get_node("Data").exit_active()

func _animated() -> void:
	var tween = create_tween().set_loops()
	var cap = sprite.texture.get_width() / sprite.texture.get_height()
	sprite.hframes = cap
	tween.tween_property(sprite,"frame",cap-1,cap*0.05)
	tween.tween_callback(_reload)
	

func _reload() -> void:
	sprite.frame = 0

func _get_sprite() -> void:
	sprite.texture = load("res://data/graphics/pokemon/" + ("back/" if isPlayer else "front/") + pokemon.species.name.to_upper() + ".png")

func _created_sprite():
	var bitmap = BitMap.new()
	var box = sprite.texture.get_height()
	var tex = AtlasTexture.new()
	tex.atlas = sprite.texture
	tex.region = Rect2(0,0,box,box)
	bitmap.create_from_image_alpha(tex.get_image())

	var polys = bitmap.opaque_to_polygons(Rect2(Vector2.ZERO, Vector2i(box,box)))
	for poly in polys:
		var collision_polygon = CollisionPolygon3D.new()
		collision_polygon.depth = 0.1
		collision_polygon.polygon = poly
		add_child(collision_polygon)
		
		if sprite.centered:
			var fixedPos = bitmap.get_size()/2
			collision_polygon.position -= Vector3(fixedPos.x,fixedPos.y, 0)

	
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	move_and_slide()
