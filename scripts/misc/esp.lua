local client = game.Players.LocalPlayer;
local char = client.Character;
local root = char.HumanoidRootPart
local camera = game.Workspace.CurrentCamera;
local flags = {
  settings = {
    ['executed'] = false;
  }
}
 function esp(plr)
  if flags.settings['executed'] == false then
    flags.settings['executed'] == true
   else
    return 
  end
  
  assert(Drawing, return print('Executor doesnt support Drawing function')
  local tracer = Drawing.new('Line')
  local tracer.Visible = false;
  local tracer.Thickness = 1;
  local tracer.Transparency = 1;
  
  local connect;
  connect = game:GetService('RunService').RenderStepped:Connect(function()
    if ( plr.Character and plr.Character.Humanoid and plr.Character.HumanoidRootPart ) then
      if ( plr.Character.Humanoid.Health > 0 ) then
        local x, y, = camera:getWorldToViewportPoint(plr.Character.HumanoidRootPart.Position)
         
          if x then
              tracer.To(camera.ViewportSize.x / 2, camera.ViewportSize.y / 2)
              tracer.From(y.x, y.y)
              tracer.Visible = x
             else
              tracer.Visible = x
              end
            else
            tracer.Visible = x
            if connect then
              connect:Disconnect()
              end
            end
          end
        end
      end
    end
  end
end
