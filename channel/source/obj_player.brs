function obj_player()
	return function(object)
		object.onCreate = function()
			m.x = m.gameEngine.gameLayer.GetWidth()/2
			m.y = m.gameEngine.gameLayer.GetHeight()/2
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
				name: "body"
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
				name: "head"
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

			arm_properties = {
				name: "left_arm"
				image_width: 200
				image_height: 200
				image_count: 8
				animation_speed: 400
				scale_x: 1.0
				scale_y: 0.5
				offset_x: -32-25
				origin_x: 100
				origin_y: 100
				color: &h00FF00
			}
			m.addImage(m.gameEngine.getBitmap("ball"), arm_properties)
			arm_properties.name = "right_arm"
			arm_properties.offset_x = 32+25
			m.addImage(m.gameEngine.getBitmap("ball"), arm_properties)

			leg_properties = {
				name: "left_leg"
				image_width: 200
				image_height: 200
				image_count: 8
				animation_speed: 750
				scale_x: 0.35
				scale_y: 0.95
				offset_x: -20
				offset_y: 26+25
				origin_x: 100
				origin_y: 100
				color: &h0000FF
			}
			m.addImage(m.gameEngine.getBitmap("ball"), leg_properties)
			leg_properties.name = "right_leg"
			leg_properties.offset_x = 20
			m.addImage(m.gameEngine.getBitmap("ball"), leg_properties)

			m.gameEngine.cameraSetFollow(m)
		end function

		object.onCollision = function(collider, other_collider, other_object)
			print other_object.type ; " " ; other_object.id ; "'s " ; other_collider ; " is in collision with my " ; collider
			
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
			if button = 5 then
				m.xspeed = 5*60
			end if
			if button = 4 then
				m.xspeed = -5*60
			end if
			if button = 3 then
				m.yspeed = 5*60
			end if
			if button = 2 then
				m.yspeed = -5*60
			end if
			if button = 105 or button = 104 or button = 103 or button = 102
				m.yspeed = 0
				m.xspeed = 0
			end if
		end function

		object.onUpdate = function(dt)
			' Handle Bouncing Off Walls
			if m.x-m.radius <= 10 then
			    m.x = 10+m.radius
			end if
			if m.x+m.radius >= m.gameEngine.gameLayer.GetWidth()-10 then
				m.x = m.gameEngine.gameLayer.GetWidth()-10-m.radius
			end if
			if m.y-m.radius <= 10 then
			    m.y = 10+m.radius
			end if
			if m.y+m.radius >= m.gameEngine.gameLayer.GetHeight()-10 then
				m.y = m.gameEngine.gameLayer.GetHeight()-10-m.radius
			end if
		end function

	end function
end function
