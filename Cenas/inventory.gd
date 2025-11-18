extends Control

@onready var bagContainer = $ColorRect/slotsInv

const ITEM_TEXTURES = {
	"key": preload("res://Assets/Png.adicionais/Chave_objeto.tres"),
	"Codigo": preload("res://Assets/Png.adicionais/codigo.png"),
	"Bengala": preload("res://Assets/Png.adicionais/bengala.png"),
	"Martelo": preload("res://Assets/Png.adicionais/martelo.png"),
	"Anel": preload("res://Assets/Png.adicionais/anel.png"),
}
var inventory_slots: Array = []
var chave_adicionada: bool
var codigo_adicionado: bool
var bengala_adicionado: bool
var martelo_adicionado: bool
var anel_adicionado: bool

func _ready() -> void:
	for i in bagContainer.get_child_count():
		inventory_slots.append(null)
	refresh_inventory_display()

func _physics_process(delta: float) -> void:
	if Global.pegou_chave and !chave_adicionada:
		chave_adicionada = true
		add_item_to_inventory("key")
		return
	if Global.pegou_codigo and !codigo_adicionado:
		codigo_adicionado = true
		add_item_to_inventory("Codigo")
		return
	if Global.pegou_bengala and !bengala_adicionado:
		bengala_adicionado = true
		add_item_to_inventory("Bengala")
		return
	if Global.pegou_martelo and !martelo_adicionado:
		martelo_adicionado = true
		add_item_to_inventory("Martelo")
		return
	if Global.tem_anel and !anel_adicionado:
		anel_adicionado = true
		add_item_to_inventory("Anel")
		return
		
func add_item_to_inventory(item_name: String) -> bool:
	# 1. Verifica se o item existe no seu mapeamento
	if not ITEM_TEXTURES.has(item_name):
		return false
		
	# 2. Encontra o primeiro slot vazio
	var empty_slot_index = inventory_slots.find(null)
	
	if empty_slot_index != -1:
		# Slot vazio encontrado: 
		
		# 3. Adiciona o nome do item ao array de rastreamento
		inventory_slots[empty_slot_index] = item_name
		
		# 4. Atualiza a exibição visual
		refresh_inventory_display()
		
		return true
	
	# Nenhum slot vazio
	return false

# --- FUNÇÃO PARA ATUALIZAR A INTERFACE ---
func refresh_inventory_display():
	var allSlotNodes = bagContainer.get_children()
	
	for i in range(inventory_slots.size()):
		var item_name = inventory_slots[i]
		var slot_node = allSlotNodes[i]
		
		if item_name != null and ITEM_TEXTURES.has(item_name):
			slot_node.texture = ITEM_TEXTURES[item_name]
		else:
			slot_node.texture = null
			
func _get_drag_data(at_position: Vector2) -> Variant:
	var dragSlotNode = get_slots_node_at_position(at_position)
	
	if dragSlotNode == null:
		return null

	if dragSlotNode.texture == null:
		return null
		
	var drag_data = {
		"source_node": dragSlotNode,
		"texture": dragSlotNode.texture
	}
	
	var dragPreviewNode = dragSlotNode.duplicate()
	dragPreviewNode.custom_minimum_size = Vector2(60, 60)
	set_drag_preview(dragPreviewNode)
	
	return drag_data

func _can_drop_data(at_position: Vector2, data: Variant) -> bool:
	var targetSlotNode = get_slots_node_at_position(at_position)
	
	return targetSlotNode != null

func _drop_data(at_position: Vector2, data: Variant) -> void:
	if typeof(data) != TYPE_DICTIONARY or not data.has("texture") or not data.has("source_node"):
		return
	
	var targetSlotNode = get_slots_node_at_position(at_position)
	var dragSlotNode = data.source_node
	
	if targetSlotNode == null or dragSlotNode == null:
		return
		
	var targetTexture = targetSlotNode.texture
	
	targetSlotNode.texture = data.texture 
	
	if targetTexture == null:
		dragSlotNode.texture = null
	else:
		dragSlotNode.texture = targetTexture

func get_slots_node_at_position(position):
	var allSlotNodes = bagContainer.get_children()
	
	for node in allSlotNodes:
		var node_rect = node.get_global_rect()
		
		if node_rect.has_point(position): return node
