extends Node2D

export(Vector2) var newUbication


func _ready():
	pass


func _on_Area2D_body_entered(body):
	body.newUbication(newUbication)