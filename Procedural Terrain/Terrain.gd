extends TileMap

@onready var player = $"../Player"

var moisture = FastNoiseLite.new()
var temperature = FastNoiseLite.new()
var altitude = FastNoiseLite.new()
var offset = FastNoiseLite.new()

@export var width = 64
@export var height = 32

func _ready():
	moisture.seed = randi()
	temperature.seed = randi()
	altitude.seed = randi()
	offset.seed = randi()



func _process(delta):
	pass

func generate_chunk(position):
	var tile_pos = local_to_map(position)
	for x in range(width):
		for y in range(height):
			var moist = (moisture.get_noise_2d(tile_pos.x+x-width/2, tile_pos.y+y-height/2))*10.0
			var temp = temperature.get_noise_2d(tile_pos.x+x-width/2, tile_pos.y+y-height/2)*10.0
			var alt = altitude.get_noise_2d(tile_pos.x-width/2+x, tile_pos.y-height/2+y)*10.0
			var off = offset.get_noise_2d(tile_pos.x-width/2+x, tile_pos.y-height/2+y)*10.0

			var pickedVec = Vector2(round((moist+10)),round((temp+10)))
			
			set_cell(0, Vector2i((tile_pos.x-width/2+x), tile_pos.y-height/2+y), 0, pickedVec)
#			print(PackedFloat32Array([moist, temp]),pickedVec)
			
			


func _on_player_moving():
	generate_chunk(player.position)
