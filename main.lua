function love.load(arg)
    player = require("player")
    dir = {hori = 0, verti = 0}
    back_color = {r = 88, g = 199, b = 167}
end

function love.draw()
    love.graphics.setBackgroundColor(back_color.r,
                                     back_color.g,
                                     back_color.b)
    player.render()
end

function love.keypressed(key, unicode)
    if key == "left" or key == "a" then
        dir.hori = dir.hori - 1
    end

    if key == "right" or key == "d" then
        dir.hori = dir.hori + 1
    end

    if key == "up" or key == "w" then
        dir.verti = dir.verti - 1
    end

    if key == "down" or key == "s" then
        dir.verti = dir.verti + 1
    end
    print (dir.hori, dir.verti)
end

function love.keyreleased(key, unicode)
    if key == "left" or key == "a" then
        dir.hori = dir.hori + 1
    end

    if key == "right" or key == "d" then
        dir.hori = dir.hori - 1
    end

    if key == "up" or key == "w" then
        dir.verti = dir.verti + 1
    end

    if key == "down" or key == "s" then
        dir.verti = dir.verti - 1
    end
end

function love.update(dt)
    player.go({dir.hori, dir.verti}, dt)
    player.go({0, 0}, dt)
end

