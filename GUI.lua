function love.load(arg)

end

function love.draw()
	love.graphics.setColor(1, 0, 0)
love.graphics.circle(50, 50, 20, 20)
love.graphics.setColor(0, 0, 1)
love.graphics.circle(50, 100, 20, 20)
myColor = {0, 1, 0, 1}
love.graphics.setColor(myColor)
love.graphics.circle(50, 150, 20, 20)
end

function love.update(dt)
    sec=sec+dt
end
