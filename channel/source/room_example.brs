function room_example(room)

	room.onCreate = function(args)
		m.depth = 10000
		canvas = m.game.getCanvas()
		ball_data = {x: canvas.GetWidth()/2, y: canvas.GetHeight()/2, depth: 0, xspeed: 0, yspeed: 0,  radius: 32}
		m.game.createInstance("ball", ball_data)
	end function


	room.onDrawBegin = function(canvas)
		canvas.DrawObject(0, 0, m.game.getBitmap("background"))
		canvas.DrawRect(0, 0, canvas.GetWidth(), 10, &h676767FF)
		canvas.DrawRect(0, canvas.GetHeight()-10, canvas.GetWidth(), 10, &h676767FF)
		canvas.DrawRect(0, 0, 10, canvas.GetHeight(), &h676767FF)
		canvas.DrawRect(canvas.GetWidth()-10, 0, 10, canvas.GetHeight(), &h676767FF)
	end function

	room.onDrawGui = function(screen)
		if m.game.debug then : screen.DrawText("room: room_example", 10, 720-10-m.game.Fonts.default.GetOneLineHeight(), &hFFFFFFFF, m.game.Fonts.default) : end if
	end function

	room.onButton = function(button)
		if button = 10
			m.game.changeRoom("room_main")
		end if


		if button = 9 or button = 1009 then
			m.game.canvasIncreaseScale(0.01)
		end if
		if button = 8 or button = 1008 then
			m.game.canvasIncreaseScale(-0.01)
		end if

		if button = 7 then
			m.game.canvasFitToScreen()
		end if
	end function

end function