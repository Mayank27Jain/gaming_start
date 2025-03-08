extends CharacterBody2D

var can_laser: bool = true
var can_grenade: bool = true

signal laser(position: Vector2, player_direction: Vector2)
signal grenade(position: Vector2, direction: Vector2)


func _process(_delta):
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * 500
	move_and_slide()
	look_at(get_global_mouse_position())
	
	if Input.is_action_pressed("primary action") and can_laser:
		var laser_markers = $LaserStartPositions.get_children()
		var selected_laser = laser_markers[randi() % laser_markers.size()]
		var player_direction = (get_global_mouse_position() - position).normalized()
		
		can_laser = false
		laser.emit(selected_laser.global_position, player_direction)
		$LaserTimer.start()
	
	if Input.is_action_pressed("secondary action") and can_grenade:
		var laser_markers = $LaserStartPositions.get_children()
		var selected_laser = laser_markers[randi() % laser_markers.size()]
		var player_direction = (get_global_mouse_position() - position).normalized()
		
		can_grenade = false
		grenade.emit(selected_laser.global_position, player_direction)
		$GrenadeTimer.start()

func _on_laser_timer_timeout() -> void:
	can_laser = true

func _on_grenade_timer_timeout() -> void:
	can_grenade = true
