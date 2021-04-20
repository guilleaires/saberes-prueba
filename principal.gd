extends Control

export var cuestionario:PackedScene # para tener a mano los escena para instanciar un nodo
export var bienvenida:PackedScene
export var seleccion_categoria:PackedScene
#export var botton_path:NodePath # Cosas instanciadas, pro podes renombrar los nodos y no se rompe
var botton
var bienvenida_instance
var menu_categoria
var cuestionario_instance
var pregunta_anterior
onready var categorias_completadas:int = 0
onready var respuestas:Dictionary = {}

func _ready():
	pass

func _on_Button_pressed():
	$MenuInicio.hide()
	bienvenida_instance = bienvenida.instance()
	bienvenida_instance.connect("todo_ok",self,"mostrar_categoria")
	add_child(bienvenida_instance)

func _on_Button2_pressed():
	get_tree().quit()
	pass
	
func mostrar_categoria():
	#remove_child(bienvenida_instance)	
	if bienvenida_instance != null:
		bienvenida_instance.queue_free()
	menu_categoria = seleccion_categoria.instance()
	menu_categoria.connect("categoria_seleccionada",self,"mostrar_cuestionario")
	add_child(menu_categoria)

func mostrar_cuestionario(categoria):
	menu_categoria.queue_free()
	cuestionario_instance = cuestionario.instance()
	add_child(cuestionario_instance)
	cuestionario_instance.connect("categoria_completa",self,"on_categoria_completada")
	cuestionario_instance.connect("categoria_interrumpida",self,"on_categoria_interrumpida")
	cuestionario_instance.cargar_categoria(categoria)

func on_categoria_completada(categoria,devolucion):
	if not respuestas.has(categoria):
		cuestionario_instance.queue_free()
		categorias_completadas += 1
		respuestas[categoria] = devolucion
		if categorias_completadas < Categorias.categorias_cargadas.size():
			mostrar_categoria()
		else:
			terminar_cuestionario()

func on_categoria_interrumpida():
	cuestionario_instance.queue_free()
	mostrar_categoria()

func terminar_cuestionario():
	save("user://respuestas.txt",respuestas)

func save(var path : String, var thing_to_save):
	var file = File.new()
	file.open(path, File.WRITE)
	file.store_var(to_json(thing_to_save))
	file.close()
	if not file.file_exists("user://respuestas.txt"):
		print("Salio mal")
		return # Error! We don't have a save to load.

func volver(event):
	 if event.is_action_pressed("volver"):
			pregunta_anterior = cuestionario.instance()
			add_child(pregunta_anterior)
