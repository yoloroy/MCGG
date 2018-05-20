print("player")
player = {}
player.images = {love.graphics.newImage("player1.png"),
                 love.graphics.newImage("player2.png")}

player.x2 = 100
player.y2 = 100
player.x1 = 100
player.y1 = 100
player.u = 100
player.len = 100
player.size = {30, 30}

player.dt = 0

function player.render()
    love.graphics.draw(player.images[1],
                       player.x1,
                       player.y1,0,1,1,64,32)
    love.graphics.draw(player.images[2],
                       player.x2,
                       player.y2,0,1,1,64,32)


end

function player.go(dir, dt)
    ---dir - {horisontal, vertical}
    --  horisontal: if 1 - right
    --              if -1 - left
    --  vertical: if 1 - down
    --            if -1 - up
    --  all: if 0 - nothing

    local rz = 50
    if dir[1]==1 and dir[2]==1 then
        player.y1 = player.y1 + (player.u/(2^0.5))*dt
        player.x1 = player.x1 + (player.u/(2^0.5))*dt
    elseif dir[1] == -1 and dir[2] == -1 then
        player.y1 = player.y1 - (player.u/(2^0.5))*dt
        player.x1 = player.x1 - (player.u/(2^0.5))*dt
    elseif dir[1] == -1 and dir[2] == 1 then
        player.y1 = player.y1 + (player.u/(2^0.5))*dt
        player.x1 = player.x1 - (player.u/(2^0.5))*dt
    elseif dir[1] == 1 and dir[2] == -1 then
        player.y1 = player.y1 - (player.u/(2^0.5))*dt
        player.x1 = player.x1 + (player.u/(2^0.5))*dt
    elseif dir[1] == 0 and dir[2] == 1 then
        player.y1 = player.y1 + player.u*dt
    elseif dir[1] == 0 and dir[2] == -1 then
        player.y1 = player.y1 - player.u*dt
    elseif dir[1] == -1 and dir[2] == 0 then
        player.x1 = player.x1 - player.u*dt
    elseif dir[1] == 1 and dir[2] == 0 then
        player.x1 = player.x1 + player.u*dt
    elseif dir[1] == 0 and dir[2] == 0 then
        rz=0.005
    end

    if player.dt > rz then
        player.dt = 0
           -----------
        local rz_x = player.x2 - player.x1
        local rz_y = player.y2 - player.y1

        if {player.x1, player.y1} ~=
           {player.x2, player.y2} then

            player.x2 = player.x2 - rz_x*dt
            player.y2 = player.y2 - rz_y*dt
        end
    end

    player.dt = player.dt + dt
end









return player
