extends StaticBody2D

signal player_entered_gate(body)

func _on_entrance_body_entered(body: Node2D) -> void:
	player_entered_gate.emit(body)

func _on_entrance_body_exited(_body: Node2D) -> void:
	print("player exited??")
