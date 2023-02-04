extends StaticBody2D

# @note: for ObjectPool.
func get_height() -> float:
	return $Sprite.texture.get_size().y * scale.y * $Sprite.scale.y

