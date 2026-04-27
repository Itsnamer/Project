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
local StarterGui = game:GetService("StarterGui")
local VirtualUser = game:GetService("VirtualUser")
local HttpService = game:GetService("HttpService")
local TweenService = game:GetService("TweenService")

local Pics = loadstring(game:HttpGet("https://raw.githubusercontent.com/Itsnamer/Scripts/refs/heads/main/UI/Kaitun.lua"))()
local Existing = loadstring(game:HttpGet("https://raw.githubusercontent.com/Itsnamer/Scripts/refs/heads/main/UI/Existing.lua"))()

_G.KaitunConfig = _G.KaitunConfig or {
	["Enabled Farm"] = true,

	["UI"] = true,

  ["Fast"] = true,
  ["Quest"] = true,

	["AI"] = {
	  ["Enabled"] = true,
	  ["Select"] = "None",
	},

	["Tool"] = {
		"Painting Tool",
		"Binding Tool",
		"Property Tool",
		"Scaling Tool",
		"Trowel Tool"
	},

	["Chest"] = "Legendary Chest",

	["Buy Tool"] = false,
	["Buy Chest"] = false,
	
	["Webhook"] = {
	  ["Enabled"] = false,
	  ["Url"] = "",
	  ["Delay"] = 30,
	},
}

local VerifyTool = {
	"Painting Tool",
	"Binding Tool",
	"Property Tool",
	"Scaling Tool",
	"Trowel Tool"
}

local ConfirmTool = {
  "PaintingTool",
  "BindTool",
  "PropertiesTool",
  "ScalingTool",
  "TrowelTool"
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

Rejoin = LPH_JIT_MAX(function(Text, Delay)
	LocalPlayer:Kick(Text)
	
	task.wait(Delay or 3)
	
	TeleportService:Teleport(game.PlaceId)
end)

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

Sent = LPH_JIT_MAX(function(Text)
  StarterGui:SetCore("SendNotification", {
    Title = "Pictures Hub Kaitun",
    Text = Text,
    Duration = 5
  })
end)

CheckInventory = LPH_JIT_MAX(function(...)
	local Argument = {...}

	for _, ToolName in pairs(Argument) do
		if LocalPlayer.Backpack:FindFirstChild(ToolName)
		or LocalPlayer.Character:FindFirstChild(ToolName) then
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

local WantTool = function(Name)
	for _, v in pairs(_G.KaitunConfig["Tool"]) do
		if v == Name then
			return true
		end
	end
	return false
end

local CodeList = {"hi","Squid Army","=D","=P","chillthrill709 was here"}
local Already = {}

-- Item

task.spawn(LPH_NO_VIRTUALIZE(function()
	while task.wait(1) do
		local Function = _G.KaitunConfig

		local HasPainting = CheckInventory("PaintingTool")
		local HasBinding = CheckInventory("BindTool")
		local HasProperty = CheckInventory("PropertiesTool")
		local HasScaling = CheckInventory("ScalingTool")
		local HasTrowel = CheckInventory("TrowelTool")

		local MyMoney = LocalPlayer.Data.Gold.Value

		local Readied =
			HasPainting and HasBinding and HasProperty and HasScaling and HasTrowel

		if Function["AI"]["Enabled"] then
			if not CheckInventory("PaintingTool") and MyMoney >= 1500 then
				workspace:WaitForChild("ItemBoughtFromShop"):InvokeServer("Painting Tool",1)

			elseif not CheckInventory("BindTool") and MyMoney >= 2000 then
				workspace:WaitForChild("ItemBoughtFromShop"):InvokeServer("Binding Tool",1)

			elseif not CheckInventory("PropertiesTool") and MyMoney >= 2500 then
				workspace:WaitForChild("ItemBoughtFromShop"):InvokeServer("Property Tool",1)

			elseif not CheckInventory("ScalingTool") and MyMoney >= 5000 then
				workspace:WaitForChild("ItemBoughtFromShop"):InvokeServer("Scaling Tool",1)

			elseif not CheckInventory("TrowelTool") and MyMoney >= 7500 then
				workspace:WaitForChild("ItemBoughtFromShop"):InvokeServer("Trowel Tool",1)

			elseif Readied then
			  if Function["AI"]["Select"] == "Chest" and MyMoney >= 405 then
  	      workspace:WaitForChild("ItemBoughtFromShop"):InvokeServer("Legendary Chest",1)
			  elseif Function["AI"]["Select"] == "None" then
	       
	       end
      end
		else
			if Function["Buy Tool"] then
				if WantTool("Painting Tool") and not CheckInventory("PaintingTool") and MyMoney >= 1500 then
					workspace:WaitForChild("ItemBoughtFromShop"):InvokeServer("Painting Tool",1)

				elseif WantTool("Binding Tool") and not CheckInventory("BindTool") and MyMoney >= 2000 then
					workspace:WaitForChild("ItemBoughtFromShop"):InvokeServer("Binding Tool",1)

				elseif WantTool("Property Tool") and not CheckInventory("PropertiesTool") and MyMoney >= 2500 then
					workspace:WaitForChild("ItemBoughtFromShop"):InvokeServer("Property Tool",1)

				elseif WantTool("Scaling Tool") and not CheckInventory("ScalingTool") and MyMoney >= 5000 then
					workspace:WaitForChild("ItemBoughtFromShop"):InvokeServer("Scaling Tool",1)

				elseif WantTool("Trowel Tool") and not CheckInventory("TrowelTool") and MyMoney >= 7500 then
					workspace:WaitForChild("ItemBoughtFromShop"):InvokeServer("Trowel Tool",1)
				end

			elseif Function["Buy Chest"] then
				workspace:WaitForChild("ItemBoughtFromShop"):InvokeServer(Function["Chest"],1)
			end
		end
	end
end))

if _G.KaitunConfig["Buy Tool"] and _G.KaitunConfig["Buy Chest"] then
	Rejoin("Security TBRPTA",3)
end

-- AI (Farm Checking)

local LastPosition = nil
local LastMovement = tick()

task.spawn(LPH_NO_VIRTUALIZE(function()
	while task.wait(1) do
	  local Function = _G.KaitunConfig
	  if Function["AI"]["Enabled"] then
  		local Timeout = 30
  
  		local RootPart = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
  
  		if not RootPart then
  			LastPosition = nil
  			LastMovement = tick()
  			continue
  		end
  
  		local RootPosition = RootPart.Position
  
  		if not LastPosition then
  			LastPosition = RootPosition
  			LastMovement = tick()
  			continue
  		end
  
  		if (RootPosition - LastPosition).Magnitude > 1 then
  			LastPosition = RootPosition
  			LastMovement = tick()
  		end
  
  		if tick() - LastMovement >= Timeout then
  			Rejoin("AI: AFK")
  		end
  	end
	end
end))

-- AI (Gold Checking)

local LastGold = LocalPlayer.Data.Gold.Value
local LastTick = tick()

local RejoinCooldown = 0

task.spawn(LPH_NO_VIRTUALIZE(function()
	while task.wait(10) do
		if _G.KaitunConfig["AI"]["Enabled"] then
  		local Money = LocalPlayer.Data.Gold.Value
  		local Start = tick()
  
  		if Money <= LastGold then
  			if Start - LastTick >= 60 then
  				if Start - RejoinCooldown >= 30 then
  					RejoinCooldown = Start
  					Rejoin("AI: No Progress")
  				end
  			end
  		else
  			LastGold = Money
  			LastTick = Start
  		end
  	end
	end
end))

-- Farm

LPH_JIT_MAX(function()
  function StartingFarm(StageOffset,DelayTime)
    local RootPart = LocalPlayer.Character.HumanoidRootPart
    
    RootPart.CFrame = RootPart.CFrame + Vector3.new(0, 80, 0)
    
    TP(CFrame.new(-52.1085777, 59.5893059, -75.0531387, -0.999996901, 1.68085098e-05, 0.00249710004, 1.25927632e-12, 0.99997735, -0.00673105894, -0.00249715662, -0.00673103798, -0.999974251), 2):Play()
    task.wait(2)
    
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
    
    TP(CFrame.new(-52.1085777, 59.5893059, -75.0531387, -0.999996901, 1.68085098e-05, 0.00249710004, 1.25927632e-12, 0.99997735, -0.00673105894, -0.00249715662, -0.00673103798, -0.999974251), 2):Play()
    task.wait(2)
    
    for i = 1, 10 do
  		local Sand = Workspace.BoatStages.NormalStages["CaveStage"..i].Sand
  		TP(Sand.CFrame + StageOffset, 0):Play()
  		task.wait(DelayTime)
    end
  end
  
end)()

-- Quest

if _G.KaitunConfig["Quest"] then
  Sent("[1/2]: Initiating Quest - First Phase")
  
  local Zone = GettingZone()
  
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

  task.wait(2.5)
end

task.wait(1)

if _G.KaitunConfig["Quest"] then
  Sent("[2/2]: Initiating Quest - Final Phase")
  
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
    task.wait(1)
  end
    
  task.wait(1)
  LocalPlayer.Character:BreakJoints()
end

task.wait(1)

-- Main

task.spawn(LPH_NO_VIRTUALIZE(function()
	while task.wait(0.1) do
		if _G.KaitunConfig["Enabled Farm"] and IsReadied then
		  
			local Success, Error = pcall(function()
				local Function = _G.KaitunConfig

				if Function["Fast"] then
					FastingFarm(Vector3.new(0, 80, 0), 2)
					task.wait(1)

					LocalPlayer.Character:BreakJoints()
					task.wait(10)
					
					CreateVelocity()
				else
					StartingFarm(Vector3.new(0, 80, 0), 2)
					task.wait(18)
				end
			end)

			if not Success then
				warn("Main: "..Error)
			end
		end
	end
end))

-- Misc

for _, v in ipairs(CodeList) do
	if not Already[v] then
		pcall(function()
			workspace:WaitForChild("CheckCodeFunction"):InvokeServer(v)
			Sent("[Code]: Claiming Reward - "..v)
		end)

		Already[v] = true
		task.wait(1.2)
	end
end

if _G.KaitunConfig["UI"] then
	Pics.LoadUI()
	Existing.LoadUI()
end

LocalPlayer.Idled:Connect(function()
	VirtualUser:CaptureController()
	VirtualUser:ClickButton2(Vector2.new())
end)

for _, v in next, getconnections(LocalPlayer.Idled) do
	v:Disable()
end

local request = request or http_request

SendWebhook = LPH_JIT_MAX(function()
	if not request then
		warn("Webhook not supported")
		return
	end

	if not _G.KaitunConfig["Webhook"]["Enabled"] then
		return
	end

	if _G.KaitunConfig["Webhook"]["Url"] == "" then
		warn("Webhook URL is empty")
		return
	end

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
			["title"] = "🏆 Kaitun Notify",
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

	local success, res = pcall(function()
		return request({
			Url = _G.KaitunConfig["Webhook"]["Url"],
			Method = "POST",
			Headers = {
				["Content-Type"] = "application/json"
			},
			Body = HttpService:JSONEncode(data)
		})
	end)

	if success and res then
		print("Webhook Send", res.StatusCode or "")
	else
		warn("Webhook Failed", res)
	end
end)

task.spawn(function()
	while true do
		SendWebhook()
		task.wait(_G.KaitunConfig["Webhook"]["Delay"] or 30)
	end
end)

print("true")
print("kaitun script v.0.0.5")

IsReadied = true
