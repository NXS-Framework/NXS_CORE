playerList = {}
Player = {}

function Player:new(name, source)
    local newPlayer = {};
    setmetatable(newPlayer, self);
    self.__index = self;

    newPlayer.Name = name;
    newPlayer.Source = source;
    table.insert(playerList, newPlayer);

    return newPlayer;
end

function Player:Get(input)
    if Player:GetByName(input) == true then
        return true;
    end
    return false;
end
    
function Player:GetByName(searchedName)
    for i, player in ipairs(playerList) do
        print("name inputed: " .. player.Name);
        print("name searched: " .. searchedName);
        if(searchedName == player.Name) then
            return true; 
            end;
    end
    return false;
end
 

--test funkcnosti:
--  local playerr = Player:new("not name", "test");
--  local playerrr = Player:new("err name", "test");
--  local player = Player:new("epic name", "test");
--  print(player.Name)  -- Output: epic name;

--  print("Trying to get player by name 'epic name'. Got him?: " .. tostring(Player:Get("epic name")));
--  print("Trying to get player by name 'err name'. Got him?: " .. tostring(Player:Get("err name")));
--  print("Trying to get player by name 'test'. Got him?: " .. tostring(Player:Get("test")));