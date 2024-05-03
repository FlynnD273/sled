class_name TwoWayDictionary extends RefCounted


var keys_dict: Dictionary
var values_dict: Dictionary


func _init() -> void:
	keys_dict = { }
	values_dict = { }


func get_value(key: Variant) -> Variant:
	return keys_dict[key]


func get_key(value: Variant) -> Variant:
	return values_dict[value]


func add(key: Variant, value: Variant) -> void:
	keys_dict[key] = value
	values_dict[value] = key


func erase_key(key: Variant) -> void:
	var value = keys_dict[key]
	keys_dict.erase(key)
	values_dict.erase(value)


func erase_value(value: Variant) -> void:
	var key = values_dict[value]
	values_dict.erase(value)
	keys_dict.erase(key)


func clear() -> void:
	keys_dict.clear()
	values_dict.clear()