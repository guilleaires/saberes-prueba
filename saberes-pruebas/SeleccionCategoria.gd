extends Control

signal categoria_seleccionada(categoria)
onready var buttons:Array =	[
		$VBoxContainer/Tierra,
		$VBoxContainer/Tierra_Sol,
		$VBoxContainer/Astrologia
]

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _on_Tierra_pressed():
	emit_signal("categoria_seleccionada","Tierra")

func _on_Luna_pressed():
	emit_signal("categoria_seleccionada","Tierra_Sol")
	pass


func _on_Astrologia_pressed():
	emit_signal("categoria_seleccionada","Astrologia")
	pass # Replace with function body.


