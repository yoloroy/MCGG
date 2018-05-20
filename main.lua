function love.load(arg)
    player = require("player")
    dir = {"", ""}
    back_color = {r = 88, g = 199, b = 167}
end

function love.draw()
    love.graphics.setBackgroundColor(back_color.r,
                                     back_color.g,
                                     back_color.b)
    player.render()
end

--[[function love.keypressed(key, unicode)
    print(key)
    if key == "left" or key == "a" then
        player.go("W", dt)
    end

    if key == "right" or key == "d" then
        player.go("E", dt)
    end

    if key == "up" or key == "w" then
        player.go("N", dt)
    end

    if key == "down" or key == "s" then
        player.go("S", dt)
    end
end]]

function love.update(dt)
    if love.keyboard.isDown("left") or love.keyboard.isDown("a") then
        player.go("W", dt)
    end

    if love.keyboard.isDown("right") or love.keyboard.isDown("d") then
        player.go("E", dt)
    end

    if love.keyboard.isDown("up") or love.keyboard.isDown("w") then
        player.go("N", dt)
    end

    if love.keyboard.isDown("down") or love.keyboard.isDown("s") then
        player.go("S", dt)
    end
    player.go(" ", dt)
end

