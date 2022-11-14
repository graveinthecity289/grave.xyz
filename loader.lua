local xyz = {
  [7525610732] = 'https://raw.githubusercontent.com/graveinthecity289/grave.xyz/main/scripts/kaizen.lua'
}

if xyz[game.PlaceId] then
  for i,v in pairs(getconnections(game:GetService("Players").LocalPlayer.Idled)) do
    v:Disable()
  end
   pcall(function() return loadstring(game:HttpGet(xyz[game.PlaceId]))() end);
end
