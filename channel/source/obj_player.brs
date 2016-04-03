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

			arm_properties = body_properties
			arm_properties.name = "left_arm"
			arm_properties.color = &h00ff00
			arm_properties.animation_speed = 400
			arm_properties.scale_y = 0.5
			arm_properties.offset_x = -32-25
			m.addImage(m.gameEngine.getBitmap("ball"), arm_properties)
			arm_properties.name = "right_arm"
			arm_properties.offset_x = 32+25
			m.addImage(m.gameEngine.getBitmap("ball"), arm_properties)

			leg_properties = body_properties
			leg_properties.name = "left_leg"
			leg_properties.color = &h0000ff
			leg_properties.animation_speed = 700
			leg_properties.scale_x = 0.35
			leg_properties.scale_y = 0.95
			leg_properties.offset_y = 26+25
			leg_properties.offset_x = -20
			m.addImage(m.gameEngine.getBitmap("ball"), leg_properties)
			leg_properties.name = "right_leg"
			leg_properties.offset_x = 20
			m.addImage(m.gameEngine.getBitmap("ball"), leg_properties)

			m.gameEngine.cameraSetFollow(m)
		end function

		object.onDrawEnd = function(frame)
			m.gameEngine.drawColliders(m)
		end function

		object.onCollision = function(collider, other_collider, other_object)
			print other_object.type ; " " ; other_object.id ; "'s " ; other_collider ; " is in collision with my " ; collider
			if other_object.type = "ball" and other_object.name <> "old_body_part"
				properties = {}
				properties.name = "old_body_part"
				properties.images = []
				properties.onUpdate = function(dt)
					if m.x < -500 or m.y < -500 or m.y > m.gameEngine.frame.GetWidth()+500 or m.x > m.gameEngine.frame.GetHeight()+500 then
						m.gameEngine.destroyInstance(m)
						print "I'm destroying myself!"
					end if
				end function
				for i = 0 to m.images.count()-1
					image = m.images[i]
					if image.name = collider then
						properties.x = m.x
						properties.y = m.y
						image.alpha = 120
						properties.images.Push(image)
						m.removeImage(i)
						exit for
					end if
				end for
					
				new_instance = m.gameEngine.createInstance("ball", properties)
				new_instance.removeCollider("main_collider")
				if m.colliders.DoesExist(collider)
					collider = m.colliders[collider]
					if collider.type = "circle" then
						new_instance.addColliderCircle("main_collider", collider.radius, collider.offset_x, collider.offset_y)
					else if collider.type = "rectangle"
						new_instance.addColliderRectangle("main_collider", collider.offset_x, collider.offset_y, collider.width, collider.height)
					end if

					m.removeCollider(collider.name)
				end if
			end if
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
			if m.x+m.radius >= m.gameEngine.frame.GetWidth()-10 then
				m.x = m.gameEngine.frame.GetWidth()-10-m.radius
			end if
			if m.y-m.radius <= 10 then
			    m.y = 10+m.radius
			end if
			if m.y+m.radius >= m.gameEngine.frame.GetHeight()-10 then
				m.y = m.gameEngine.frame.GetHeight()-10-m.radius
			end if
		end function

	end function
end function
