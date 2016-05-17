sub Main()
	' ------- These two lines are required --------
	game = new_game(1280, 720, true) ' This initializes the game engine
	game.loadBitmap("ball", "pkg:/sprites/ball_spritesheet.png")
	game.loadBitmap("background", "pkg:/sprites/background.png")
	game.defineRoom("room_main", room_main)
	game.defineRoom("room_example", room_example)
	game.defineObject("ball", obj_ball)
	game.defineObject("player", obj_player)
	game.changeRoom("room_main")
	game.createInstance("player")
	game.Play()
end sub