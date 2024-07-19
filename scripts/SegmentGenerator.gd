extends Node

const SEGMENT_WIDTH = 640
const SEGMENT_HEIGHT = 200
const TILE_SIZE = 16
const SAFETY_MARGIN = 2

var current_difficulty = 1

func generate_segment(index: int) -> Node2D:
    var segment = Node2D.new()
    segment.name = "Segment_" + str(index)
    segment.position.x = index * SEGMENT_WIDTH
    
    var terrain = generate_terrain()
    segment.add_child(terrain)
    
    var num_obstacles = randi() % current_difficulty + 1
    for i in range(num_obstacles):
        var obstacle = generate_obstacle()
        obstacle.position.x = randf_range(SAFETY_MARGIN * TILE_SIZE, (40 - SAFETY_MARGIN) * TILE_SIZE)
        obstacle.position.y = randf_range(0, SEGMENT_HEIGHT)
        segment.add_child(obstacle)
    
    if randf() < 0.1:  # 1/10 chance for item
        var item = generate_item()
        item.position.x = randf_range(SAFETY_MARGIN * TILE_SIZE, (40 - SAFETY_MARGIN) * TILE_SIZE)
        item.position.y = randf_range(0, SEGMENT_HEIGHT)
        segment.add_child(item)
    
    return segment

func generate_terrain() -> Node2D:
    var terrain = Node2D.new()
    # Implement more complex terrain generation here
    var ground = ColorRect.new()
    ground.color = Color.GREEN
    ground.rect_size = Vector2(SEGMENT_WIDTH, TILE_SIZE)
    ground.position.y = SEGMENT_HEIGHT - TILE_SIZE
    terrain.add_child(ground)
    return terrain

func generate_obstacle() -> Node2D:
    var obstacle = Node2D.new()
    var obstacle_shape = ColorRect.new()
    obstacle_shape.color = Color.GREEN
    obstacle_shape.rect_size = Vector2(TILE_SIZE, TILE_SIZE)
    obstacle.add_child(obstacle_shape)
    return obstacle

func generate_item() -> Node2D:
    var item = Node2D.new()
    var item_shape = ColorRect.new()
    item_shape.color = Color.YELLOW
    item_shape.rect_size = Vector2(TILE_SIZE, TILE_SIZE)
    item.add_child(item_shape)
    return item
