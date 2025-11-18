extends Sprite2D

@onready var tile_map_layer: TileMapLayer = $TileMapLayer
@onready var tile_map_layer_2: TileMapLayer = $TileMapLayer2
@onready var navigation_link_2d: NavigationLink2D = $NavigationLink2D

func _ready():
	navigation_link_2d.enabled = false

func _process(delta):
	if Global.apertou_botao == true:
		navigation_link_2d.enabled = true
		tile_map_layer.hide()
		tile_map_layer_2.show()
