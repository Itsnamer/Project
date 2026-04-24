repeat wait() until game:IsLoaded()

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

repeat wait() until LocalPlayer

if not LPH_OBFUSCATED then
	LPH_JIT_MAX = function(...) return ... end
	LPH_NO_VIRTUALIZE = function(...) return ... end
	LPH_NO_UPVALUES = function(...) return ... end
end

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TeleportService = game:GetService("TeleportService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local HttpService = game:GetService("HttpService")
local VirtualUser = game:GetService("VirtualUser")
local TweenService = game:GetService("TweenService")

local Existing = loadstring(game:HttpGet("https://api.mclo.gs/1/raw/aL3RV7I"))()

_G.Configs = _G.Configs or {
  ["Auto Farm Money"] = false,
  
  -- [Quest]
  ["Selecting Quest"] = "Cloud",
  ["Auto Doing Quest"] = false,
  
  -- [Tools]
  ["Selecting Tools"] = "Painting Tool",
  ["Auto Purchase Tools"] = false,
  
  -- [Chest]
  ["Selecting Chest"] = "Common Chest",
  ["Selecting Amount"] = 1,
  ["Auto Purchase Chest"] = false,
  
  -- [Setting]
  ["Selecting Mode"] = "Normal",
  ["Auto Redeem Code"] = false,
  ["Auto White Screen"] = false,
  
  -- [Webhook]
  ["Webhook Url"] = "",
  ["Auto Send Webhook"] = false,
  ["Delay"] = 30,
}

local TeamColor = {
	["Magenta"] = "MagentaZone",
	["Really red"] = "Really redZone",
	["Camo"] = "CamoZone",
	["Really blue"] = "Really blueZone",
	["Black"] = "BlackZone",
	["White"] = "WhiteZone",
	["New Yeller"] = "New YellerZone"
}

local ConfirmTool = {
  "PaintingTool",
  "BindTool",
  "PropertiesTool",
  "ScalingTool",
  "TrowelTool"
}

CreateVelocity = LPH_JIT_MAX(function()
  local BodyVelocity = Instance.new("BodyVelocity")
  local RootPart = LocalPlayer.Character.HumanoidRootPart

  BodyVelocity.Name = "BodyClip"
	BodyVelocity.Parent = RootPart
	BodyVelocity.MaxForce = Vector3.new(1, 1, 1) * math.huge
	BodyVelocity.Velocity = Vector3.zero
end)

TP = LPH_JIT_MAX(function(Target, Duration)
  CreateVelocity()
  
	local RootPart = LocalPlayer.Character.HumanoidRootPart
	
	return TweenService:Create(
    RootPart,
    TweenInfo.new(Duration or 0, Enum.EasingStyle.Linear),
    {CFrame = Target}
  )
end)

CheckInventory = LPH_JIT_MAX(function(...)
	local Arg = {...}
	for _, Tools in pairs(Arg) do
		if LocalPlayer.Backpack:FindFirstChild(Tools) or LocalPlayer.Character:FindFirstChild(Tools) then
			return true
		end
	end
	return false
end)

GettingZone = LPH_JIT_MAX(function()
  local Team = tostring(LocalPlayer.Team.TeamColor)
	local ZoneName = TeamColor[Team]
	
	if not ZoneName then return end
	return workspace:FindFirstChild(ZoneName)
end)

Touch = LPH_JIT_MAX(function(Part)
  firetouchinterest(LocalPlayer.Character.HumanoidRootPart, Part, 0)
  
	task.wait(0.1)
	
	firetouchinterest(LocalPlayer.Character.HumanoidRootPart, Part, 1)
end)

local CodeList = {"hi","Squid Army","=D","=P","chillthrill709 was here"}

RedeemingCode = LPH_JIT_MAX(function()
  for i,v in ipairs(CodeList) do
    workspace:WaitForChild("CheckCodeFunction"):InvokeServer(v)
  end
end)

LPH_JIT_MAX(function()
  function StartingFarm(StageOffset,DelayTime)
    local RootPart = LocalPlayer.Character.HumanoidRootPart
    
    RootPart.CFrame = RootPart.CFrame + Vector3.new(0, 80, 0)
    
    TP(CFrame.new(-52.1085777, 59.5893059, -75.0531387, -0.999996901, 1.68085098e-05, 0.00249710004, 1.25927632e-12, 0.99997735, -0.00673105894, -0.00249715662, -0.00673103798, -0.999974251), 2):Play()
    task.wait(1)
    
    for i = 1, 10 do
  		local Sand = Workspace.BoatStages.NormalStages["CaveStage"..i].Sand
  		TP(Sand.CFrame + StageOffset, 2):Play()
  		task.wait(DelayTime)
  	end

  	TP(CFrame.new(-59.09, -357.79, 9483.42), 0.1):Play()
  	task.wait(0.5)

  	TP(CFrame.new(-55.91, -357.97, 9490.36), 1):Play()
  end
  
  function FastingFarm(StageOffset,DelayTime)
    local RootPart = LocalPlayer.Character.HumanoidRootPart
    
    RootPart.CFrame = RootPart.CFrame + Vector3.new(0, 80, 0)
    
    TP(CFrame.new(-52.1085777, 59.5893059, -75.0531387, -0.999996901, 1.68085098e-05, 0.00249710004, 1.25927632e-12, 0.99997735, -0.00673105894, -0.00249715662, -0.00673103798, -0.999974251), 1):Play()
    task.wait(1)
    
    for i = 1, 10 do
  		local Sand = Workspace.BoatStages.NormalStages["CaveStage"..i].Sand
  		TP(Sand.CFrame + StageOffset, 0):Play()
  		task.wait(DelayTime)
    end
  end
end)()

-- UI

local Compkiller = loadstring(game:HttpGet("https://raw.githubusercontent.com/4lpaca-pin/CompKiller/refs/heads/main/src/source.luau"))();
local Notifier = Compkiller.newNotify();
local ConfigManager = Compkiller:ConfigManager({
	Directory = "Compkiller-UI",
	Config = "Example-Configs"
});

local Window = Compkiller.new({
	Name = "Pictures Hub",
	Keybind = "RightControl",
	Logo = "rbxassetid://136262031660297",
	TextSize = 15,
});
Notifier.new({
	Title = "Pictures Hub Notification",
	Content = "Thank you for use this script!",
	Duration = 10,
	Icon = "rbxassetid://136262031660297"
});

Window:DrawCategory({
	Name = "Main"
});

local NormalTab = Window:DrawTab({
	Name = "General",
	Icon = "home",
	EnableScrolling = true
});
local FarmGategory = NormalTab:DrawSection({Name = "Farming",Position = 'left'});

local DoFarm = FarmGategory:AddToggle({
	Name = "Auto Farm Money",
	Default = false,
	Callback = function(v) 
	  _G.Configs["Auto Farm Money"] = v
	end
});

task.spawn(function()
  while task.wait(0.1) do
    if _G.Configs["Auto Farm Money"] then
      local Succes,Error = pcall(function()
        local Config = _G.Configs
        
        if Config["Selecting Mode"] == "Fast" then
          FastingFarm(Vector3.new(0, 80, 0), 2)
          task.wait(1)
          
          LocalPlayer.Character:BreakJoints()
          task.wait(10)
          
          CreateVelocity()
          
        elseif Config["Selecting Mode"] == "Normal" then
          StartingFarm(Vector3.new(0, 80, 0), 2)
          task.wait(18)
        end
        
      end)
      
      if not Succes then warn("Farm: "..Error) end
      
    end
  end
end)

FarmGategory:AddButton({
	Name = "Force Cancel Farm",
	Callback = function()
		LocalPlayer.Character:BreakJoints()
	end,
})

local QuestGategory = NormalTab:DrawSection({Name = "Quest",Position = 'left'});

QuestGategory:AddDropdown({
	Name = "Selecting Quest",
	Default = "Cloud",
	Values = {"Cloud","Ramp","Target","Soccer","Find Me","Thin Ice"},
	Callback = function(v) 
	  _G.Configs["Selecting Quest"] = v
	end
})

local DoQuest = QuestGategory:AddToggle({
	Name = "Auto Doing Quest",
	Default = false,
	Callback = function(v) 
	  _G.Configs["Auto Doing Quest"] = v
	end
});

if _G.Configs["Auto Doing Quest"] then
  local RootPart = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
  
  local Zone = GettingZone()
  
  if _G.Configs["Selecting Quest"] == "Cloud" then
    workspace.QuestMakerEvent:FireServer(1)
		task.wait(1)

		local Part = Zone.Quest.Cloud and Zone.Quest.Cloud:FindFirstChild("Part1")
		if Part then
			firetouchinterest(RootPart, Part, 0)
			task.wait(0.1)
			firetouchinterest(RootPart, Part, 1)
		end
  elseif _G.Configs["Selecting Quest"] == "Ramp" then
    workspace.QuestMakerEvent:FireServer(2)
		task.wait(1)

		local Part = Zone.Quest.Target and Zone.Quest.Target:FindFirstChild("Part")
		if Part then
			firetouchinterest(RootPart, Part, 0)
			task.wait(0.1)
			firetouchinterest(RootPart, Part, 1)
		end
  elseif _G.Configs["Selecting Quest"] == "Target" then
    workspace.QuestMakerEvent:FireServer(3)
		task.wait(1)

		local Ramp = Zone.Quest.Ramp and Zone.Quest.Ramp:GetChildren()[20]
		if Ramp then
			firetouchinterest(RootPart, Ramp, 0)
			task.wait(0.1)
			firetouchinterest(RootPart, Ramp, 1)
		end
  elseif _G.Configs["Selecting Quest"] == "Find Me" then
    workspace.QuestMakerEvent:FireServer(4)
		task.wait(1)

		local Butter = Zone.Quest.Butter and Zone.Quest.Butter:FindFirstChild("PPart")and Zone.Quest.Butter.PPart:FindFirstChildOfClass("ClickDetector")

		if Butter then
			local Failed = 0
			while true do
				fireclickdetector(Butter)
				task.wait(0.5)

				if not Butter.Parent then
					Failed += 1
					if Failed >= 3 then break end
				end
			end
		end
  elseif _G.Configs["Selecting Quest"] == "Soccer" then
    workspace.QuestMakerEvent:FireServer(8)
		task.wait(1)

		local Tool = CheckInventory("BuildingTool")

		if Tool then
			Tool.RF:InvokeServer("WoodBlock", 9, Zone, CFrame.new(49,6.1,-27), true, CFrame.new(), false)
			workspace.ClearAllPlayersBoatParts:FireServer()
		end
  elseif _G.Configs["Selecting Quest"] == "Ice Thin" then
    workspace.QuestMakerEvent:FireServer(9)
		task.wait(1)

		local Positions = {
			Vector3.new(-62,67,1363),
			Vector3.new(-65,58,2135),
			Vector3.new(-52,73,2903),
			Vector3.new(-58,76,3672),
			Vector3.new(-60,80,4445),
			Vector3.new(-55,73,5217),
			Vector3.new(-53,64,5984),
			Vector3.new(-63,63,6751),
			Vector3.new(-50,28,7527),
			Vector3.new(-104,37,8298),
			Vector3.new(-57,-312,9497)
		}

		for _,v in ipairs(Positions) do
			TP(CFrame.new(v)):Play()
			task.wait(0.5)
		end
  end
end

local ToolsGategory = NormalTab:DrawSection({Name = "Tools",Position = 'left'});

ToolsGategory:AddDropdown({
	Name = "Selecting Tools",
	Default = "Painting Tool",
	Values = {"Painting Tool","Binding Tool","Property Tool","Scaling Tool","Trowel Tool"},
	Callback = function(v) 
	  _G.Configs["Selecting Tools"] = v
	end
})

local PurchaseTools = ToolsGategory:AddToggle({
	Name = "Auto Purchase Tools",
	Default = false,
	Callback = function(v) 
	  _G.Configs["Auto Purchase Tools"] = v
	 end
});

local ChestGategory = NormalTab:DrawSection({Name = "Chest",Position = 'left'});

ChestGategory:AddDropdown({
	Name = "Selecting Chest",
	Default = "Common Chest",
	Values = {"Common Chest","Uncommon Chest","Rare Chest","Epic Chest","Legendary Chest"},
	Callback = function(v) 
	  _G.Configs["Selecting Chest"] = v
	end
})

ChestGategory:AddSlider({
	Name = "Selecting Amount",
	Min = 1,
	Max = 25,
	Default = 1,
	Round = 0,
	Callback = function(v)
  	_G.Configs["Selecting Amount"] = v
	end
});

local PurchaseChest = ChestGategory:AddToggle({
	Name = "Auto Purchase Chest",
	Default = false,
	Callback = function(v) 
	  _G.Configs["Auto Purchase Chest"] = v
	end
});

task.spawn(function()
  while task.wait(1) do
    local IF = _G.Configs["Selecting Tools"]
    local MyMoney = LocalPlayer.Data.Gold.Value
    
    if _G.Configs["Auto Purchase Tools"] then
      if IF == "Painting Tool" and not CheckInventory("PaintingTool") and MyMoney >= 1500 then
        workspace:WaitForChild("ItemBoughtFromShop"):InvokeServer("Painting Tool",1)
      elseif IF == "Binding Tool" and not CheckInventory("BindTool") and MyMoney >= 2000 then
        workspace:WaitForChild("ItemBoughtFromShop"):InvokeServer("Binding Tool",1)
      elseif IF == "Property Tool" and not CheckInventory("PropertiesTool") and MyMoney >= 2500 then
        workspace:WaitForChild("ItemBoughtFromShop"):InvokeServer("Property Tool",1)
      elseif IF == "Scaling Tool" and not CheckInventory("ScalingTool") and MyMoney >= 5000 then
        workspace:WaitForChild("ItemBoughtFromShop"):InvokeServer("Scaling Tool",1)
      elseif IF == "Trowel Tool" and not CheckInventory("TrowelTool") and MyMoney >= 7500 then
        workspace:WaitForChild("ItemBoughtFromShop"):InvokeServer("Trowel Tool",1)
      end
    elseif _G.Configs["Auto Purchase Chest"] then
      workspace:WaitForChild("ItemBoughtFromShop"):InvokeServer(_G.Configs["Selecting Chest"],_G.Configs["Selecting Amount"])
    end
  end
end)

local DrawElements = function(Tab,Position)
	do
	  local SettingRight = Tab:DrawSection({
	    Name = "Setting",
	    Position = Position
	  })
	  
	  SettingRight:AddDropdown({
			Name = "Selecting Mode",
			Default = "Normal",
			Values = {"Normal","Fast"},
			Callback = function(v) 
		    _G.Configs["Selecting Mode"] = v 
			end
		})
		
		local RedeemCode = SettingRight:AddToggle({
    	Name = "Auto Redeem Code",
      Default = false,
      Callback = function(v) 
        _G.Configs["Auto Redeem Code"] = v
        if v == true then
          RedeemingCode()
        end
      end
    });
    
    local FPSRight = Tab:DrawSection({
	    Name = "FPS",
	    Position = Position
	  })
	
	  local WhiteScreen = FPSRight:AddToggle({
    	Name = "Auto White Screen",
      Default = false,
      Callback = function(v) 
        _G.Configs["Auto White Screen"] = v
        if v == true then
          RunService:Set3dRenderingEnabled(false)
        else
          RunService:Set3dRenderingEnabled(true)
        end
      end
    });
  
    local Webhook = Tab:DrawSection({
	    Name = "Webhook",
	    Position = Position
	  })
	
  	Webhook:AddTextBox({
    	Name = "Webhook Url",
    	Placeholder = "",
    	Default = "",
    	Callback = _G.Configs["Webhook Url"]
    })
  
    local SendWebhook = Webhook:AddToggle({
    	Name = "Auto Send Webhook",
      Default = false,
      Callback = function(v) 
        _G.Configs["Auto Send Webhook"] = v
      end
    });
  
    Webhook:AddSlider({
    	Name = "Selecting Delay",
    	Min = 1,
    	Max = 200,
    	Default = 30,
    	Round = 0,
    	Callback = function(v)
     	  _G.Configs["Delay"] = v
      end
    });
	end;
end;

local ToolText = ""

for _, ToolName in pairs(ConfirmTool) do
    if CheckInventory(ToolName) then
        ToolText = ToolText .. "- " .. ToolName .. "\n"
    end
end

if ToolText == "" then
    ToolText = "None"
end

local request = request or http_request or syn.request

task.spawn(function()
  while task.wait(_G.Configs["Delay"]) do
    if _G.Configs["Auto Send Webhook"] then

      local ToolText = ""

      for _, ToolName in pairs(ConfirmTool) do
        if CheckInventory(ToolName) then
          ToolText = ToolText .. "- " .. ToolName .. "\n"
        end
      end

      if ToolText == "" then
        ToolText = "None"
      end

      local data = {
        ["embeds"] = {{
          ["title"] = "🏆 Main Notify",
          ["description"] = "**Build A Boat For Treasure**\nPlayer: "..LocalPlayer.Name,
          ["color"] = 16766720,

          ["fields"] = {
            {
              ["name"] = "⭐ Money",
              ["value"] = tostring(LocalPlayer.Data.Gold.Value),
              ["inline"] = true
            },
            {
              ["name"] = "🎁 Tool",
              ["value"] = ToolText,
              ["inline"] = false
            }
          }
        }}
      }

      request({
        Url = _G.Configs["Webhook Url"],
        Method = "POST",
        Headers = {
          ["Content-Type"] = "application/json"
        },
        Body = HttpService:JSONEncode(data)
      })

    end
  end
end)

DrawElements(NormalTab,"right")

Window:DrawCategory({
	Name = "Misc"
});

local SettingTab = Window:DrawTab({
	Icon = "settings-3",
	Name = "Settings",
	Type = "Single",
	EnableScrolling = true
});

local ThemeTab = Window:DrawTab({
	Icon = "paintbrush",
	Name = "Themes",
	Type = "Single"
});

local Settings = SettingTab:DrawSection({
	Name = "UI Settings",
});

Settings:AddToggle({
	Name = "Alway Show Frame",
	Default = false,
	Callback = function(v)
		Window.AlwayShowTab = v;
	end,
});

Settings:AddColorPicker({
	Name = "Highlight",
	Default = Compkiller.Colors.Highlight,
	Callback = function(v)
		Compkiller.Colors.Highlight = v;
		Compkiller:RefreshCurrentColor();
	end,
});

Settings:AddColorPicker({
	Name = "Toggle Color",
	Default = Compkiller.Colors.Toggle,
	Callback = function(v)
		Compkiller.Colors.Toggle = v;
		
		Compkiller:RefreshCurrentColor(v);
	end,
});

Settings:AddColorPicker({
	Name = "Drop Color",
	Default = Compkiller.Colors.DropColor,
	Callback = function(v)
		Compkiller.Colors.DropColor = v;

		Compkiller:RefreshCurrentColor(v);
	end,
});

Settings:AddColorPicker({
	Name = "Risky",
	Default = Compkiller.Colors.Risky,
	Callback = function(v)
		Compkiller.Colors.Risky = v;

		Compkiller:RefreshCurrentColor(v);
	end,
});

Settings:AddColorPicker({
	Name = "Mouse Enter",
	Default = Compkiller.Colors.MouseEnter,
	Callback = function(v)
		Compkiller.Colors.MouseEnter = v;

		Compkiller:RefreshCurrentColor(v);
	end,
});

Settings:AddColorPicker({
	Name = "Block Color",
	Default = Compkiller.Colors.BlockColor,
	Callback = function(v)
		Compkiller.Colors.BlockColor = v;

		Compkiller:RefreshCurrentColor(v);
	end,
});

Settings:AddColorPicker({
	Name = "Background Color",
	Default = Compkiller.Colors.BGDBColor,
	Callback = function(v)
		Compkiller.Colors.BGDBColor = v;

		Compkiller:RefreshCurrentColor(v);
	end,
});

Settings:AddColorPicker({
	Name = "Block Background Color",
	Default = Compkiller.Colors.BlockBackground,
	Callback = function(v)
		Compkiller.Colors.BlockBackground = v;

		Compkiller:RefreshCurrentColor(v);
	end,
});

Settings:AddColorPicker({
	Name = "Stroke Color",
	Default = Compkiller.Colors.StrokeColor,
	Callback = function(v)
		Compkiller.Colors.StrokeColor = v;

		Compkiller:RefreshCurrentColor(v);
	end,
});

Settings:AddColorPicker({
	Name = "High Stroke Color",
	Default = Compkiller.Colors.HighStrokeColor,
	Callback = function(v)
		Compkiller.Colors.HighStrokeColor = v;

		Compkiller:RefreshCurrentColor(v);
	end,
});

Settings:AddColorPicker({
	Name = "Switch Color",
	Default = Compkiller.Colors.SwitchColor,
	Callback = function(v)
		Compkiller.Colors.SwitchColor = v;

		Compkiller:RefreshCurrentColor(v);
	end,
});

Settings:AddColorPicker({
	Name = "Line Color",
	Default = Compkiller.Colors.LineColor,
	Callback = function(v)
		Compkiller.Colors.LineColor = v;

		Compkiller:RefreshCurrentColor(v);
	end,
});

Settings:AddButton({
	Name = "Get Theme",
	Callback = function()
		print(Compkiller:GetTheme())
		
		Notifier.new({
			Title = "Notification",
			Content = "Copied Them Color to your clipboard",
			Duration = 5,
			Icon = "rbxassetid://136262031660297"
		});
	end,
});

ThemeTab:DrawSection({
	Name = "UI Themes"
}):AddDropdown({
	Name = "Select Theme",
	Default = "Default",
	Values = {
		"Default",
		"Dark Green",
		"Dark Blue",
		"Purple Rose",
		"Skeet"
	},
	Callback = function(v)
		Compkiller:SetTheme(v)
	end,
})

local ConfigUI = Window:DrawConfig({
	Name = "Config",
	Icon = "folder",
	Config = ConfigManager
});

ConfigUI:Init();

LocalPlayer.Idled:Connect(function()
	VirtualUser:CaptureController()
	VirtualUser:ClickButton2(Vector2.new())
end)

for _,v in next,getconnections(LocalPlayer.Idled) do
	v:Disable()
end

print("true")

Existing.LoadUI()
