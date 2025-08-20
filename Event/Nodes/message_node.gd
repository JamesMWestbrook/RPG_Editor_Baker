extends GraphNode
class_name MessageNode
@onready var face_texture_rect: TextureRect = $HBoxContainer/VBoxContainer2/FaceTextureRect
@onready var face_index_spin_box: SpinBox = $HBoxContainer/VBoxContainer2/FaceIndexSpinBox
@onready var name_line_edit: LineEdit = $HBoxContainer/VBoxContainer/HBoxContainer/NameLineEdit
@onready var dialog_text_edit: TextEdit = $HBoxContainer/VBoxContainer/DialogTextEdit


func _on_texture_rect_gui_input(event: InputEvent) -> void:
	if event.is_pressed():
		print("Texture was clicked")
