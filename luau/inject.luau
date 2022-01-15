--# selene: allow(undefined_variable)
for _,v in next,getgc(true) do
    if type(v)=='table' then
        if rawget(v,'Call') and getinfo(rawget(v,'Call')).source:find('Remote') then
            -- selene: allow(unscoped_variables)
            -- selene: allow(unused_variable)
            call=rawget(v,'Call')
            break
        end
    end
end
type Map = {
    DisplayName: string,
    Creator: string,
    Type: string,
    Game: string
}
-- selene: allow(unused_variable)
function getMapInfo(): Map
    local mapInfo: Map = {}
    mapInfo.Game = game:GetService('MarketplaceService'):GetProductInfo(game.PlaceId).Name
    for _,v in next,game.Workspace:GetChildren() do
        if v.ClassName=='Model' then
            if v.Name:find('bhop_') or v.Name:find('surf_') then
                mapInfo.Type=v.Name:split('_')[1]
                if v:FindFirstChild('Creator',true) then
                    mapInfo.Creator=v:FindFirstChild('Creator',true).Value
                end
                if v:FindFirstChild('DisplayName',true) then
                    mapInfo.DisplayName=v:FindFirstChild('DisplayName',true).Value
                end
                break
            end
        end
    end
    return mapInfo
end
local jobid=game.JobId or 1
local name=game:GetService('MarketplaceService'):GetProductInfo(game.PlaceId).Name:gsub(' ','-')
setclipboard('https://www.roblox.com/games/'..game.PlaceId..'/'.. name ..'?gameId='..jobid) --ok hold up
-- why it not work im crying
-- doge send me a vip link join
-- we can look at the console while i join and see if there's anything it logs
-- its just the Roblox.GameLauncher.joinPlaceInstance or whatever
-- the vipserver link doesnt have the uuid, im guessing it searches the servers for the game and see if the vip server link key is valid for a server
-- what im saying is, there might be another way
-- https://devforum.roblox.com/t/how-do-you-get-a-link-to-automatically-play-the-game-in-a-certain-server/279318/9

-- MapInfo:
-- DisplayName: Test Map
-- Creator: Quaternions
-- Type: bhop
-- Game: Surf Maptest
-- Server: 6606ca6c-a76c-4370-b413-694da3904905

-- chief what u doin rn and why is the code above commented
-- 