extends Node2D

var _plugin_name = "AndroidLocationPlugin"
var _android_plugin

@onready var label = $VBoxContainer/Label

func _ready():
	if Engine.has_singleton(_plugin_name):
		_android_plugin = Engine.get_singleton(_plugin_name)
		_android_plugin.connect("locationSignal",_on_locationSignal)
	else:
		printerr("Couldn't find plugin " + _plugin_name)


func _on_button_pressed() -> void:
	if _android_plugin:
		_android_plugin.getLocation()


func _on_button_2_pressed() -> void:
	if _android_plugin:
		_android_plugin.stopLocation()

func _on_locationSignal(data):
	label.text =str(data)
