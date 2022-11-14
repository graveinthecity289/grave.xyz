repeat wait() until game:IsLoaded()

library = loadstring(game:HttpGet("https://raw.githubusercontent.com/vozoid/ui-libraries/main/drawing/void/source.lua"))()

local watermark = library:Watermark("grave.xyz | https://discord.gg/2f3CjGtyjc")

local xyz = library:Load{
    Name = "grave.xyz | kaizen",
    SizeX = 600,
    SizeY = 650,
    Theme = "Midnight",
    Extension = "json",
    Folder = "grave" 
}

local x = xyz:Tab("Tab")

getgenv().settings = {
    ['farm_mobs'] = false;
    ['chosen_mob'] = nil;
    ['auto_equip'] = false;
    ['a_attack'] = false;
    ['weapon'] = false;
}

local weapons = {}
for i,v in pairs(game:GetService('Players').LocalPlayer.Backpack:GetChildren()) do
    if v:IsA('Tool') and v.Name ~= 'Curse Sense' then
        if not table.find(weapons, v.Name) then
            table.insert(weapons, v.Name)
        end
    end
end

local client = game.Players.LocalPlayer;
local char = client.Character
local root = char.HumanoidRootPart
local rs = game:GetService('RunService')
local functions = functions or {}
local flags = {
    mobs = {
        'Fly Head';
        'Crabion';
        'Rogue Sorcerer';
        'Gnasher';
        'Armed Bandit';
        'Fire Shroom';
        'Junior';
        'Hanamato';
        'Rogue Bandit';
        'Saku';
        'Senior';
    };
    settings = {
        ['anti_falldamage'] = false;
        ['inf_stamina'] = false;
        ['inf_cursedenergy'] = false;
        autostats = {
            ['Melee'] = false;
            ['Stamina'] = false;
            ['Defense'] = false;
            ['Curse'] = false;
            ['Weapon'] = false;
            ['Amount'] = 1;
        };
    };
}

local function getmobDistance()
    local z, y = math.huge;
    for i,v in pairs(game:GetService("Workspace").Living.Mobs:GetChildren()) do
        if v:FindFirstChild('HumanoidRootPart') and v.Humanoid.Health > 0 and v:IsA('Model') and v.Name:match(settings.chosen_mob) then
            local m = (root.Position - v.HumanoidRootPart.Position).magnitude
            if m < z then
                z = m
                y = v
            end
        end
    end
    return y
end

local main = x:Section{
    Name = "Farming",
    Side = "Left"
}

local main2 = x:Section{
    Name = "Other",
    Side = "Left"
}

local as = x:Section{
    Name = "Auto Stats",
    Side = "Right"
}

local creds = x:Section{
    Name = 'Credits';
    Side = 'Left';
}

local tg  = main:Toggle{
    Name = "Auto-Farm Mob(s)",
    Flag = "Autofarming Mobs",
    Callback  = function(yz)
        settings.farm_mobs = yz
    end
}

main:Dropdown{
    Name = 'Select Mob',
    Content = flags['mobs'],
    Flag = "Selected Mob",
    Callback = function(xy)
        settings.chosen_mob = xy
    end
}

local xys = main:Separator("Separator")


main:Dropdown{
    Name = 'Select Weapon',
    Content = weapons,
    Flag = "Selected Weapon",
    Callback = function(xp)
        settings.weapon = xp
    end
}

local tx = main:Toggle{
    Name = 'Auto Equip Weapon';
    Flag = 'Auto Equip',
    Callback = function(pz)
        settings.auto_equip = pz
    end
}

local axy = main:Toggle{
    Name = 'Auto Attack';
    Flag = 'Auto Attack',
    Callback = function(x)
        settings.a_attack = x
    end
}

local x2 = main2:Toggle{
    Name = 'Anti Fall Damage';
    Flag = 'Anti Fall Damage';
    Callback = function(a)
        flags.settings['anti_falldamage'] = a
    end
}

local x52 = main2:Toggle{
    Name = 'Infinite Stamina';
    Flag = 'Infinite Stamina';
    Callback = function(x)
        flags.settings['inf_stamina'] = x
    end
}

local x22 = main2:Toggle{
    Name = 'Infinite Cursed Energy';
    Flag = 'Infinite Cursed Energ';
    Callback = function(p)
        flags.settings['inf_cursedenergy'] = p
    end
}


asm = as:Toggle{
    Name = 'Melee';
    Flag = 'Melee';
    Callback = function(x)
        flags.settings.autostats['Melee'] = x
    end
}

ass = as:Toggle{
    Name = 'Stamina';
    Flag = 'Stamina';
    Callback = function(x)
        flags.settings.autostats['Stamina'] = x
    end
}

asd = as:Toggle{
    Name = 'Defense';
    Flag = 'Defense';
    Callback = function(x)
        flags.settings.autostats['Defense'] = x
    end
}

asc = as:Toggle{
    Name = 'Curse';
    Flag = 'Curse';
    Callback = function(x)
        flags.settings.autostats['Curse'] = x
    end
}

asw = as:Toggle{
    Name = 'Weapon';
    Flag = 'Weapon';
    Callback = function(x)
        flags.settings.autostats['Weapon'] = x
    end
}


as:Slider{
    Text = "Amount Here [1-5]",
    Min = 1,
    Max = 5,
    Float = 1,
    Flag = "Amount",
    Callback = function(value)
        flags.settings.autostats['Amount'] = value
    end
}


spawn(function()
    while task.wait() do
        if flags.settings.autostats['Amount'] then
            if flags.settings.autostats['Melee'] == true then
                repeat task.wait()
                    local args = {
                        [1] = "Physical",
                        [2] = flags.settings.autostats['Amount']
                    }
                    
                    game:GetService("ReplicatedStorage").Knit.Services.attributeService.RE.IncrementAttribute:FireServer(unpack(args))
                until not flags.settings.autostats['Melee']
            end
            if flags.settings.autostats['Stamina'] == true then
                repeat task.wait()
                    local args = {
                        [1] = "Stamina",
                        [2] = flags.settings.autostats['Amount']
                    }
                    
                    game:GetService("ReplicatedStorage").Knit.Services.attributeService.RE.IncrementAttribute:FireServer(unpack(args))
                until not flags.settings.autostats['Stamina']
            end
            if flags.settings.autostats['Defense'] == true then
                repeat task.wait()
                    local args = {
                        [1] = "Defense",
                        [2] = flags.settings.autostats['Amount']
                    }
                    
                    game:GetService("ReplicatedStorage").Knit.Services.attributeService.RE.IncrementAttribute:FireServer(unpack(args))
                until not flags.settings.autostats['Defense']
            end
            if flags.settings.autostats['Curse'] == true then
                repeat task.wait()
                    local args = {
                        [1] = "Ability",
                        [2] = flags.settings.autostats['Amount']
                    }
                    
                    game:GetService("ReplicatedStorage").Knit.Services.attributeService.RE.IncrementAttribute:FireServer(unpack(args))
                until not flags.settings.autostats['Curse']
            end
            if flags.settings.autostats['Weapon'] == true then
                repeat task.wait()
                    local args = {
                        [1] = "Weapon",
                        [2] = flags.settings.autostats['Amount']
                    }
                    
                    game:GetService("ReplicatedStorage").Knit.Services.attributeService.RE.IncrementAttribute:FireServer(unpack(args))
                until not flags.settings.autostats['Weapon']
            end
        end
    end                
end)


spawn(function()
    while task.wait() do
        if settings.auto_equip then
            for i,v in pairs(client.Backpack:GetChildren()) do
                if v:IsA("Tool") and v.Name:match(tostring(settings.weapon)) then
                    client.Character.Humanoid:EquipTool(v)
                end
            end
        end
    end
end)


local credit = creds:Label('https://discord.gg/2f3CjGtyjc')
local credit2 = creds:Label('graveinthecity289#4857')


local mt = getrawmetatable(game);
        
make_writeable(mt);


local old_mt = mt.__index

mt.__index = function(a , b)
    if tostring(a):match("CursedEnergy") or tostring(a):match('MaxCursedEnergy') and flags.settings['inf_cursedenergy'] then
        if tostring(b):match("Value") then
            return math.huge
        end
    end
    
    return old_mt(a , b);
    
end;


local mt = getrawmetatable(game);
        
make_writeable(mt);


local old_mt = mt.__index

mt.__index = function(a , b)
    if tostring(a):match("Stamina") and flags.settings['inf_stamina'] then
        if tostring(b):match("Value") then
            return math.huge
        end
    end
    
    return old_mt(a , b);
    
end;


local x;
x = hookmetamethod(game, '__namecall', function(self, ...)
    local args = {...}

    if not checkcaller() and self.Name == 'FallDamage' and flags.settings['anti_falldamage']  then
        if args[1] ~= 0 then
            args[1] = 0
        end
        return x(self, unpack(args))
    end

    return x(self, ...)
end)

spawn(function()
    pcall(function()
    while task.wait() do
        if ( settings.farm_mobs and settings.chosen_mob ~= nil ) then
            if settings.a_attack == true and settings.farm_mobs then
                    repeat task.wait()
                        root.CFrame = getmobDistance().HumanoidRootPart.CFrame * CFrame.new(0,-7,0) * CFrame.Angles(math.rad(90),0,0)
                        game:GetService("Players").LocalPlayer.Character.Fists.CombatHandler.Attack:FireServer(false)
                    until not settings.a_attack or not settings.farm_mobs or not getmobDistance():IsDescendantOf(workspace)
                elseif not settings.a_attack and settings.farm_mobs then
                    repeat task.wait()
                        root.CFrame = getmobDistance().HumanoidRootPart.CFrame * CFrame.new(0,-7,0) * CFrame.Angles(math.rad(90),0,0)
                    until not settings.farm_mobs or not getmobDistance():IsDescendantOf(workspace)
                end
            end
        end
    end)
end)
