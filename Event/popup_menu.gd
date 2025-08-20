extends PopupMenu
@onready var popup_menu_list: PopupMenu = $PopupMenuList
@onready var message_popup_menu: PopupMenu = $PopupMenuList/MessagePopupMenu


func _ready() -> void:
	set_popup_menus()
	
func set_popup_menus():
	add_submenu_node_item("Add Node", popup_menu_list,0)
	popup_menu_list.add_submenu_node_item("Message", message_popup_menu, 0)
