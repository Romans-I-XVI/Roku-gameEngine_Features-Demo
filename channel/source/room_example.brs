function room_example()
	return function(room)

		room.onCreate = function()
			m.depth = 10000
			ball_data = {x: m.gameEngine.gameLayer.GetWidth()/2, y: m.gameEngine.gameLayer.GetHeight()/2, depth: 0, xspeed: 0, yspeed: 0,  radius: 32}
			m.gameEngine.createInstance("ball", ball_data)
		end function


		room.onDrawBegin = function(gameLayer)
			gameLayer.DrawObject(0, 0, m.gameEngine.getBitmap("background"))
			gameLayer.DrawRect(0, 0, gameLayer.GetWidth(), 10, &h676767FF)
			gameLayer.DrawRect(0, gameLayer.GetHeight()-10, gameLayer.GetWidth(), 10, &h676767FF)
			gameLayer.DrawRect(0, 0, 10, gameLayer.GetHeight(), &h676767FF)
			gameLayer.DrawRect(gameLayer.GetWidth()-10, 0, 10, gameLayer.GetHeight(), &h676767FF)
		end function

		room.onDrawGui = function(screen)
			if m.gameEngine.debug then : screen.DrawText("room: room_example", 10, 720-10-m.gameEngine.Fonts.default.GetOneLineHeight(), &hFFFFFFFF, m.gameEngine.Fonts.default) : end if
		end function

		room.onButton = function(button)
			if button = 10
				m.gameEngine.changeRoom("room_main")
			end if


			if button = 9 or button = 1009 then
				m.gameEngine.cameraIncreaseZoom(0.01)
			end if
			if button = 8 or button = 1008 then
				m.gameEngine.cameraIncreaseZoom(-0.01)
			end if

			if button = 7 then
				m.gameEngine.cameraFitToScreen()
			end if
		end function

	end function
end function