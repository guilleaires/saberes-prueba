extends Node

onready var texturas = []

func _ready():
	for image in get_children():
		self.texturas.append(image)

