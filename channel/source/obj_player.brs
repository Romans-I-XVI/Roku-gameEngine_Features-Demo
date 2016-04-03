function obj_player()
	return function(object)
		object.onCreate = function()
			m.x = m.gameEngine.Frame.GetWidth()/2
			m.y = m.gameEngine.Frame.GetHeight()/2
			m.depth = -100
			m.radius = 32
			m.persistent = true
			m.addColliderCircle("head", m.radius*.7, 0, -32-32*.7)
			m.addColliderCircle("body", m.radius)
			m.addColliderRectangle("left_arm", -32-50, -15, 50, 30)
			m.addColliderRectangle("right_arm", 32, -15, 50, 30)
			m.addColliderRectangle("left_leg", -10-20, 26, 20, 50)
			m.addColliderRectangle("right_leg", 10, 26, 20, 50)

			body_properties = {
				image_width: 200
				image_height: 200
				image_count: 8
				animation_speed: 500
				origin_x: 100
				origin_y: 100
				color: &hFF0000
			}
			m.addImage(m.gameEngine.getBitmap("ball"), body_properties)

			head_properties = {
				image_width: 200
				image_height: 200
				image_count: 8
				animation_speed: 600
				scale_x: 0.7
				scale_y: 0.7
				offset_y: -32-32*0.7
				origin_x: 100
				origin_y: 100
				color: &hFFFF00
			}
			m.addImage(m.gameEngine.getBitmap("ball"), head_properties)

			arm_properties = body_properties
			arm_properties.color = &h00ff00
			arm_properties.animation_speed = 400
			arm_properties.scale_y = 0.5
			arm_properties.offset_x = -32-25
			m.addImage(m.gameEngine.getBitmap("ball"), arm_properties)
			arm_properties.offset_x = 32+25
			m.addImage(m.gameEngine.getBitmap("ball"), arm_properties)

			leg_properties = body_properties
			leg_properties.color = &h0000ff
			leg_properties.animation_speed = 700
			leg_properties.scale_x = 0.35
			leg_properties.scale_y = 0.95
			leg_properties.offset_y = 26+25
			leg_properties.offset_x = -20
			m.addImage(m.gameEngine.getBitmap("ball"), leg_properties)
			leg_properties.offset_x = 20
			m.addImage(m.gameEngine.getBitmap("ball"), leg_properties)

			m.gameEngine.cameraSetFollow(m)
		end function

		object.onDrawEnd = function(frame)
			' m.gameEngine.drawColliders(m)
		end function

		object.onCollision = function(collider, other_collider, other_object)
			print other_object.name ; " " ; other_object.id ; "'s " ; other_collider ; " is in collision with my " ; collider
			' if other_object.name = "ball" and collider = "body" then
			' 	m.gameEngine.destroyInstance(other_object)
			' 	if m.gameEngine.currentRoom.name = "room_main" then
			' 		ball_count = m.gameEngine.instanceCount("ball")
			' 		print "There are now " ; ball_count ; " balls left in the room."
			' 		if ball_count = 0
			' 			m.gameEngine.changeRoom("room_example")
			' 		end if
			' 	end if
			' end if
		end function

		object.onButton = function(button)
			if button = 5 or button = 1005 then
				m.xspeed = m.xspeed + 10
			end if
			if button = 4 or button = 1004 then
				m.xspeed = m.xspeed - 10
			end if
			if button = 3 or button = 1003 then
				m.yspeed = m.yspeed + 10
			end if
			if button = 2 or button = 1002 then
				m.yspeed = m.yspeed - 10
			end if
		end function

		object.onUpdate = function(dt)
			' Handle Bouncing Off Walls
			if m.x-m.radius <= 10 then
			    m.xspeed = abs(m.xspeed)
			end if
			if m.x+m.radius >= m.gameEngine.frame.GetWidth()-10 then
				m.xspeed = abs(m.xspeed)*-1
			end if
			if m.y-m.radius <= 10 then
			    m.yspeed = abs(m.yspeed)
			end if
			if m.y+m.radius >= m.gameEngine.frame.GetHeight()-10 then
				m.yspeed = abs(m.yspeed)*-1
			end if
		end function

	end function
end function
