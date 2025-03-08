extends Node2D

var laser_scene: PackedScene = preload("res://scenes/projectiles/laser.tscn")
var grenade_scene: PackedScene = preload("res://scenes/projectiles/grenade.tscn")

func _on_gate_player_entered_gate(_body) -> void:
	print("player has entered gate")

func _on_player_laser(laser_start_position: Vector2, player_direction: Vector2) -> void:
	var laser = laser_scene.instantiate() as Area2D
	$Projectiles.add_child(laser)
	laser.position = laser_start_position
	laser.direction = player_direction
	laser.rotation = player_direction.angle() + PI/2 

func _on_player_grenade(grenade_start_position: Vector2, player_direction: Vector2) -> void:
	var grenade = grenade_scene.instantiate() as RigidBody2D
	$Projectiles.add_child(grenade)
	grenade.linear_velocity = player_direction * grenade.speed
	grenade.position = grenade_start_position
