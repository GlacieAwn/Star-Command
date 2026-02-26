extends Node

var scene_instance: Node

# Loads a scene with the given path, and decide whether to hide or delete the current scene depending on the input of `free`. 
# If free is true, then the scene is deleted, only getting loaded again when called. If false, then the scene is merely hidden. This is useful for menus, where the current scene might not need to be completely destroyed as you might need to go back to it. 
func load_scene(path: String, free: bool) -> Node:
	if scene_instance:
		if free:
			scene_instance.queue_free()
		else:
			scene_instance.hide()

	var loaded_scene = ResourceLoader.load(path)
	if loaded_scene == null:
		return
	
	scene_instance = loaded_scene.instantiate()
	return scene_instance