extends HBoxContainer

onready var input = $NombreInput
export var nombreLabel:String

# Called when the node enters the scene tree for the first time.
func _ready():
	$Nombre.text = nombreLabel

func is_valid() -> bool:
	var regex = RegEx.new()
	regex.compile("^[A-Za-z]+$")
	var result = regex.search(input.text)
	if result:
		return true
	else:
		input.text = "no es una palabra"
		return false
