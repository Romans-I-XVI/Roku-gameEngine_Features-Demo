function room_main()
	return function(room)

		room.onCreate = function()
			m.depth = 100
			for i = 1 to 5
				m.gameEngine.createInstance("ball")
			end for
			m.gameEngine.setBackgroundColor(&h000000FF)
		end function

		room.onUpdate = function(dt)
		end function

		room.onDrawBegin = function(gameLayer)
			gameLayer.DrawObject(0, 0, m.gameEngine.getBitmap("background"))
			gameLayer.DrawRect(0, 0, gameLayer.GetWidth(), 10, &h676767FF)
			gameLayer.DrawRect(0, gameLayer.GetHeight()-10, gameLayer.GetWidth(), 10, &h676767FF)
			gameLayer.DrawRect(0, 0, 10, gameLayer.GetHeight(), &h676767FF)
			gameLayer.DrawRect(gameLayer.GetWidth()-10, 0, 10, gameLayer.GetHeight(), &h676767FF)
		end function

		room.onDrawGui = function(screen)
			if m.gameEngine.debug then : screen.DrawText("room: room_main", 10, 720-10-m.gameEngine.Fonts.default.GetOneLineHeight(), &hFFFFFFFF, m.gameEngine.Fonts.default) : end if
		end function

		room.onButton = function(button)
			if button = 10
				m.gameEngine.changeRoom("room_example")
			end if

			' if button = 5 or button = 1005 then
			' 	m.gameEngine.cameraIncreaseOffset(5,0)
			' end if
			' if button = 4 or button = 1004 then
			' 	m.gameEngine.cameraIncreaseOffset(-5,0)
			' end if
			' if button = 3 or button = 1003 then
			' 	m.gameEngine.cameraIncreaseOffset(0,5)
			' end if
			' if button = 2 or button = 1002 then
			' 	m.gameEngine.cameraIncreaseOffset(0,-5)
			' end if
			if button = 9 or button = 1009 then
				m.gameEngine.cameraIncreaseZoom(0.02)
			end if
			if button = 8 or button = 1008 then
				m.gameEngine.cameraIncreaseZoom(-0.02)
			end if

			if button = 7 then
				m.gameEngine.cameraFitToScreen()
			end if

		end function

	end function
end function
