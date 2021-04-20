extends Control

signal todo_ok

func _ready():
	pass

func _on_Button_pressed():
	if $DatosUsuario.check_inputs():
		emit_signal("todo_ok")
		print("todo ok")

