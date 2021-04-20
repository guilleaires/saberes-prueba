extends CanvasLayer

onready var principal:Control = $Principal # Cosas instanciadas
export var pregunta:PackedScene # para tener a mano los escena para instanciar un nodo
export var botton_path:NodePath # Cosas instanciadas, pro podes renombrar los nodos y no se rompe
var botton
var pregunta_instance


func _ready():
	botton = get_node_or_null(botton_path)
	pass # Replace with function body.

func _on_Button_pressed():
	principal.hide()
	add_child(pregunta_instance)
	

	
	
