function obj_ball(object)

	' ################ What we are doing here is modifying the empty object with our ball specific function overrides ###################

	object.onCreate = function(args)
		canvas = m.game.getCanvas()
		' This is just for if not all of the required arguments are passed, do random stuff
		m.x = rnd(canvas.GetWidth())
		m.y = rnd(canvas.GetHeight())
		m.radius = 20+rnd(30)
		m.xspeed = (rnd(10)-5)*60
		m.yspeed = (rnd(10)-5)*60
		m.depth = 0

		m.addColliderCircle("main_collider", m.radius, 0, 0)
		region = CreateObject("roRegion", m.game.getBitmap("ball"), 0, 0, 200, 200)
		m.addImage(region, {scale_x: m.radius/32, scale_y: m.radius/32, origin_x: 100, origin_y: 100})

	end function

	object.onDrawEnd = function(canvas)
		' Uncomment if you want to view the object depth and colliders
		' m.game.drawColliders(m)
		' if m.game.debug then : canvas.DrawText(m.depth.ToStr(), m.x+m.radius+5, m.y-m.radius-10, &hFFFFFFFF, m.game.Fonts.default) : end if
	end function

	' Run if a button is pressed, released, or held
	object.onButton = function(button)

		' if button = 9 or button = 1009 then
		' 	m.radius = m.radius+1
		' 	m.colliders.main_collider.radius = m.radius
		' 	m.images["0"].scale_x = 1*(m.radius/32)
		' 	m.images["0"].scale_y = 1*(m.radius/32)
		' end if
		' if (button = 8 or button = 1008) and m.radius > 1 then
		' 	m.radius = m.radius-1
		' 	m.colliders.main_collider.radius = m.radius
		' 	m.images["0"].scale_x = 1*(m.radius/32)
		' 	m.images["0"].scale_y = 1*(m.radius/32)
		' end if

	end function

	' This is run on every frame
	object.onUpdate = function(dt)
		canvas = m.game.getCanvas()
		' Handle Movement
		if m.x-m.radius <= 10 then
		    m.xspeed = abs(m.xspeed)
		end if
		if m.x+m.radius >= canvas.GetWidth()-10 then
			m.xspeed = abs(m.xspeed)*-1
		end if
		if m.y-m.radius <= 10 then
		    m.yspeed = abs(m.yspeed)
		end if
		if m.y+m.radius >= canvas.GetHeight()-10 then
			m.yspeed = abs(m.yspeed)*-1
		end if
	end function

	' This function is called when I get destroyed
	object.onDestroy = function()
		print "I've been destroyed!"
	end function
end function