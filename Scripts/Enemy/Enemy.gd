extends CharacterBody2D

@onready var animations = $Root/AnimatedSprite2D
@onready var root = $Root

var speed = 100.0
var is_death = false
var attack = false

var player_name = "Player"
var player

@onready var absolute_parent = get_parent()

func _ready():
	if absolute_parent.get_node_or_null(player_name) != null:
		player = absolute_parent.get_node(player_name)

func death():
	is_death = true
	$Root/AnimatedSprite2D.modulate = Color.RED

func _on_area_body_entered(body):
	if body.is_in_group("Player"):
		attack = true
