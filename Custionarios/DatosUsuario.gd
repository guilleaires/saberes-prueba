extends VBoxContainer

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func check_inputs() -> bool:
	var result:bool = true
	for input in get_children():
		if not input.is_valid():
			result = false
	return result
