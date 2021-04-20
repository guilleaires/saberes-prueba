extends Control

export var pregunta:PackedScene
export var imagen_ui_path:NodePath
var imagenes
var imagen_ui

var textura_actual:Texture
var devolucion:Dictionary
var pregunta_actual:Pregunta
var categoria_actual:String
var cantidad_preguntas:int
var puede_interrumpirse:bool = true

signal categoria_completa(categoria,devolucion)
signal categoria_interrumpida

onready var buttons:Array = [
		$VScrollBar/VBoxContainer2/Control/Button,
		$VScrollBar/VBoxContainer2/Control/Button2,
		$VScrollBar/VBoxContainer2/Control/Button3,
		$VScrollBar/VBoxContainer2/Control/Button4,
		$VScrollBar/VBoxContainer2/Control/Button5,
		$VScrollBar/VBoxContainer2/Control/Button6,
]

func _ready():
	imagenes = Categorias.texturas
	imagen_ui = get_node_or_null(imagen_ui_path)

func cargar_categoria(var categoria:String):
	categoria_actual = categoria
	cantidad_preguntas = Categorias.cantidad_preguntas(categoria_actual)
	pregunta_actual = Categorias.obtener_pregunta(categoria_actual,0)
	_cargar_pregunta(pregunta_actual)

func _cargar_pregunta(var siguiente:Pregunta):
	$VBoxContainer/Label.text = siguiente.pregunta
	var i_tex = siguiente.indice_textura
	var texturas = imagenes.texturas
#	Le pusimos +1 porque el indice 0 no es valido pero el array arranca en 0
	if(i_tex - 1 >= 0):
		textura_actual = texturas[i_tex].texture
		imagen_ui.texture = textura_actual
		imagen_ui.visible = true
	else:
		imagen_ui.visible = false
	var cantidad_respuestas:int = siguiente.respuestas.size()
	for i in range(0,buttons.size()):
		var button = buttons[i]
		if i < cantidad_respuestas:
			button.cargar_texto(siguiente.respuestas[i])
			button.show()
		else:
			button.hide()

func _respuesta_elegida(var respuesta:int):
	puede_interrumpirse = false
	devolucion[pregunta_actual.numero_pregunta] = respuesta;
	var siguiente:int = pregunta_actual.elegir_respuesta(respuesta)
	if siguiente < cantidad_preguntas:
		var siguiente_pregunta = Categorias.obtener_pregunta(categoria_actual,siguiente)
		_cargar_pregunta(siguiente_pregunta)
		pregunta_actual = siguiente_pregunta
		puede_interrumpirse = true
	else:
		print(siguiente)
		emit_signal("categoria_completa",categoria_actual,devolucion)

func _process(delta):
	if puede_interrumpirse and Input.is_action_pressed("ui_cancel"):
		emit_signal("categoria_interrumpida")

func _on_Button_pressed():
	_respuesta_elegida(0)

func _on_Button2_pressed():
	_respuesta_elegida(1)

func _on_Button3_pressed():
	_respuesta_elegida(2)

func _on_Button4_pressed():
	_respuesta_elegida(3)

func _on_Button5_pressed():
	_respuesta_elegida(4)

func _on_Button6_pressed():
	_respuesta_elegida(5)



	
