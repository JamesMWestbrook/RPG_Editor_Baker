@tool
extends CharacterBody2D
class_name Event
@onready var sprite_2d: Sprite2D = $Sprite2D


@export var image:Texture:
	set(value):
		image = value
		if image:
			print(image.resource_name)
		if sprite_2d:
			sprite_2d.texture = value
@export var single_sprite:bool:
	set(value):
		if value:
			sprite_2d.hframes = 3
			sprite_2d.vframes = 4
		else:
			sprite_2d.hframes = 12
			sprite_2d.vframes = 8
		single_sprite = value
@export_range(1,8) var character_index:int:
	set(value):
		_set_sprite(value)
		character_index = value


@export var direction:DIRECTION:
	set(value):
		direction = value
		_set_sprite(character_index)
enum DIRECTION{
	UP = 36,
	DOWN = 0,
	LEFT = 12,
	RIGHT = 24
}

func _ready() -> void:
	sprite_2d.texture = image
	_set_sprite(character_index)
	
func _set_sprite(value):
	if sprite_2d:
		if value >= 5:
			sprite_2d.frame = 3 * value + 34 + direction

		else:
			sprite_2d.frame = 3 * value - 2 + direction
