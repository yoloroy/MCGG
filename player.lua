print("player")
player = {}
player.images = {love.graphics.newImage("player1.png"),
                 love.graphics.newImage("player2.png"),
                 love.graphics.newImage("player3.png"),
                 love.graphics.newImage("player4.png"),
                 love.graphics.newImage("player5.png")}

player.x = 100
player.y = 100
player.x2 = 300
player.y2 = 100
player.u = 100
player.len = 100
player.size = {30, 30}

player.data =  {}
player.data2 =  {}
for i =1, player.len do
    player.data[i] = {player.x, player.y}
    player.data2[i] = {player.x2, player.y2}
end
player.dt = 0

function player.render()
--    print("render")
    -- main
    --love.graphics.setBlendMode("alpha")
h=20

    love.graphics.draw(player.images[1],
                       player.x2,
                       player.y2,0,1,1,64,32)
    for i=0, 3 do
        num=i+1
        if num>5 then
            num=5
        end
        if (player.data2[i+1][1]~=player.data2[1][1]) or
        (player.data2[i+1][2]~=player.data2[1][2]) then
        love.graphics.draw(player.images[num],
                       player.data2[i+1][1],
                       player.data2[i+1][2],0,1/(i/10+1),1/(i/10+1),64,32)
        end
    end


end

function player.go(dir, dt)
    --print("go")
    rz=10
    if dir == 'N' then
        player.y2 = player.y2 - player.u*dt
    elseif dir == 'S' then
        player.y2 = player.y2 + player.u*dt
    elseif dir == 'W' then
        player.x2 = player.x2 - player.u*dt
    elseif dir == 'E' then
        player.x2 = player.x2 + player.u*dt
    elseif dir == ' ' then
        rz=0.005
    end
    if player.dt > rz then
        player.data[1][1] = player.x
        player.data[1][2] = player.y
        for i=1, player.len-1 do
            player.data[player.len-i+1][1] = player.data[player.len-i][1]
            player.data[player.len-i+1][2] = player.data[player.len-i][2]
        end
    player.dt = 0
           -----------
        player.data2[1][1] = player.x2
        player.data2[1][2] = player.y2
        for i=1, player.len-1 do
            rz_x=player.data2[player.len-i+1][1] - player.data2[player.len-i][1]
            rz_y=player.data2[player.len-i+1][2] - player.data2[player.len-i][2]
            player.data2[player.len-i+1][1] = player.data2[player.len-i+1][1] - rz_x/50
            player.data2[player.len-i+1][2] = player.data2[player.len-i+1][2] - rz_y/50
        end
    player.dt = 0

    end
    player.data[1][1] = player.x
    player.data[1][2] = player.y

    player.data2[1][1] = player.x2
    player.data2[1][2] = player.y2
    player.dt = player.dt + dt
    --print(data)
end









return player
