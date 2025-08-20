extends GraphEdit

@export var popup_menu:PopupMenu

var mouse_position:Vector2
const MESSAGE_NODE = preload("res://addons/RPG_Baker/Event/Nodes/message_node.tscn")

var _from_node: StringName
var _from_port: int


func _on_connection_to_empty(from_node: StringName, from_port: int, release_position: Vector2) -> void:
	var from = get_node_or_null(NodePath(from_node))
	
	for conn in connections:
		if conn.from_node == from_node and conn.from_port == from_port:
			return
	
	_from_node = from_node
	_from_port = from_port
	
	mouse_position = get_global_mouse_position()
	_show_context_menu()
	
func _show_context_menu():
	popup_menu.position = mouse_position
	popup_menu.popup()


func _on_message_popup_menu_index_pressed(index: int) -> void:
	var new_node
	match index:
		0: #Show Text
			new_node = MESSAGE_NODE.instantiate()
			add_child(new_node)
			new_node.position_offset = mouse_position
			connect_node(_from_node,_from_port,new_node.name, 0)

func _on_connection_request(from_node: StringName, from_port: int, to_node: StringName, to_port: int) -> void:
	var from = get_node_or_null(NodePath(from_node))
	var to = get_node_or_null(NodePath(to_node))
	if not from or not to:
		return
	if from == to:
		return
		
	for conn in connections:
		if conn.from_node == from_node and conn.from_port == from_port:
			return
		if conn.to_node == to_node and conn.to_port == to_port:
			return
	
	connect_node(from_node, from_port, to_node, to_port)
	


func _on_gui_input(event: InputEvent) -> void:
	if event.is_action_pressed("right_click"):
		mouse_position = get_global_mouse_position()
		_show_context_menu()


func _on_disconnection_request(from_node: StringName, from_port: int, to_node: StringName, to_port: int) -> void:
	disconnect_node(from_node,from_port, to_node, to_port)
