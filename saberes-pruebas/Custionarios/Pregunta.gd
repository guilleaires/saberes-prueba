class_name Pregunta
extends Node

onready var pregunta:String =""
onready var respuestas:Array
var correcta:int
var siguiente_correcta:int
var siguiente_incorrecta:int
onready var indice_textura:int = 0
onready var numero_pregunta = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func cargar(var pregunta_str:String,var respuestas:Array,var correcta:int, var indice_textura:int):
	if respuestas.size() == 0 :
		return
	pregunta = pregunta_str
	self.indice_textura = indice_textura
	self.correcta = correcta
	for i in range(0,respuestas.size()):
		self.respuestas.append(respuestas[i])

func elegir_respuesta(var respuesta:int):
	if respuesta == correcta:
		return siguiente_correcta
	else:
		return siguiente_incorrecta

func test():
	print("Texto Pregunta: "+pregunta)
	print("Respuestas....")
	for i in range(respuestas.size()):
		print(respuestas[i])
	print("La correcta es "+str(correcta))
	
