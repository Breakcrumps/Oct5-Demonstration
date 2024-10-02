extends Area2D

@export_file("*.tscn") var scene: String
	
func on_transition(body: Node2D) -> void:
	var next_scene := load(scene)
	get_tree().call_deferred("change_scene_to_packed", next_scene)
