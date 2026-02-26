extends Node

var scene_instance: Node

#TODO: Create a load_scene function with 2 arguments: scene name as path, and if the scene should be queue_free()'d or just hidden(useful for gameplay vs menus), and returns that scene to be added as a child of other nodes for flexibility