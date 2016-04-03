function room_main()
	return function(room)

		room.onCreate = function()
			m.depth = 100
			for i = 1 to 20
				m.gameEngine.createInstance("ball")
			end for
		end function

		room.onUpdate = function(dt)
			if m.gameEngine.instanceCount("ball") = 0 then
				m.gameEngine.changeRoom("room_example")
			end if
		end function

		room.onDrawBegin = function(frame)
			frame.DrawObject(0, 0, m.gameEngine.getBitmap("background"))
			frame.DrawRect(0, 0, frame.GetWidth(), 10, &h676767FF)
			frame.DrawRect(0, frame.GetHeight()-10, frame.GetWidth(), 10, &h676767FF)
			frame.DrawRect(0, 0, 10, frame.GetHeight(), &h676767FF)
			frame.DrawRect(frame.GetWidth()-10, 0, 10, frame.GetHeight(), &h676767FF)
			if true then : frame.DrawText("room: room_main", 10, 720-10-m.gameEngine.Fonts.default.GetOneLineHeight(), &hFFFFFFFF, m.gameEngine.Fonts.default) : end if
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
