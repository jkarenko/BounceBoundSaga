extends Node2D

var segment_generator: SegmentGenerator
var game_manager: GameManager

func _ready():
    segment_generator = SegmentGenerator.new()
    game_manager = GameManager.new()
    add_child(segment_generator)
    add_child(game_manager)
    
    # Initialize the first three segments
    for i in range(3):
        var new_segment = segment_generator.generate_segment(i)
        add_child(new_segment)

func _process(delta):
    # Implement screen scrolling logic here
    pass

func _on_segment_passed():
    # Remove the leftmost segment and generate a new one on the right
    pass
