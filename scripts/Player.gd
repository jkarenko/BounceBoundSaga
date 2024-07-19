extends KinematicBody2D

export var move_speed = 200.0
export var jump_force = 400.0
export var gravity = 800.0

var velocity = Vector2.ZERO
var is_jumping = false
var screen_scroll_speed = 100.0  # Adjust this to match the autoscroll speed

onready var sprite = $Sprite
onready var collision_shape = $CollisionShape2D

func _ready():
    # Set up the player's appearance (temporary rectangle for now)
    sprite = ColorRect.new()
    sprite.color = Color.GREEN
    sprite.rect_size = Vector2(32, 32)  # Player size is 2x2 tiles
    add_child(sprite)
    
    # Set up collision shape
    collision_shape = CollisionShape2D.new()
    var shape = RectangleShape2D.new()
    shape.extents = Vector2(16, 16)
    collision_shape.shape = shape
    add_child(collision_shape)

func _physics_process(delta):
    # Apply gravity
    velocity.y += gravity * delta
    
    # Handle horizontal movement
    var input_vector = Vector2.ZERO
    input_vector.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
    
    # Adjust player's horizontal speed relative to screen scroll
    velocity.x = (input_vector.x * move_speed) + screen_scroll_speed
    
    # Handle jumping
    if is_on_floor():
        is_jumping = false
        if Input.is_action_just_pressed("jump"):
            velocity.y = -jump_force
            is_jumping = true
    
    # Apply movement
    velocity = move_and_slide(velocity, Vector2.UP)
    
    # Ensure player stays within screen bounds
    var viewport_rect = get_viewport_rect()
    position.x = clamp(position.x, 0, viewport_rect.size.x - sprite.rect_size.x)

func _on_hit():
    # Handle player getting hit by enemy or obstacle
    pass

func _on_item_pickup(item_type):
    # Handle item pickup (bucket or shoes)
    pass

# Add signals for important events
signal player_died
signal item_collected(item_type)
