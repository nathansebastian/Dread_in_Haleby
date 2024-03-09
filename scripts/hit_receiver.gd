extends Node

@export var call_received_function:String = ""

var receiver_callable: Callable

func _ready():
	if call_received_function:
		receiver_callable = Callable(get_parent(),call_received_function)

func on_receiver_called(sender):
	
	print("called from " + sender.name)
	
	if call_received_function:
		receiver_callable.call(sender)
