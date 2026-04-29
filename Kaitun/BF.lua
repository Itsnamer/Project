repeat wait() until game:IsLoaded() 

local player = game:GetService("Players")
local localplayer = player.LocalPlayer

repeat wait() until localplayer

local StartingTime = tick()

-- Luraph Obfuscated

empty_function = function(...) return ... end

if not LPH_OBFUSCATED then
	LPH_JIT_MAX = empty_function
	LPH_NO_VIRTUALIZE = empty_function
	LPH_NO_UPVALUES = empty_function
end

-- Checking PlaceId

local PlaceId = game.PlaceId
if PlaceId == 2753915549 then
	FirstSea = true
elseif PlaceId == 4442272183 then
	SecondSea = true
elseif PlaceId == 7449423635 then
	ThirdSea = true
end

SeaIndex = ThirdSea and 3 or SecondSea and 2 or FirstSea and 1 or localplayer:Kick("Game not Support")

repeat wait() until localplayer

-- Variable Script

local runservice = game:GetService("RunService")
local collectionservice = game:GetService("CollectionService")
local tweenservice = game:GetService("TweenService")
local replicatedstorage = game:GetService("ReplicatedStorage")
local virtualUser = game:GetService("VirtualUser")
local virtualinput = game:service('VirtualInputManager')
local userinputservice = game:GetService("UserInputService")
local httpservice = game:GetService("HttpService")
local teleportservice = game:GetService("TeleportService")
local startergui = game:GetService("StarterGui")
local WorldOrigin = workspace["_WorldOrigin"]
local Player_Data = localplayer.Data

local KaitunUi = loadstring(game:HttpGet("https://pastebin.com/raw/Qa5mqrr5"))()
local ClosedUi = loadstring(game:HttpGet("https://pastebin.com/raw/5viYcbFW"))()

CanTeleport = {
	{
		["Sky3"] = Vector3.new(-7894, 5547, -380),
		["Sky3Exit"] = Vector3.new(-4607, 874, -1667),
		["UnderWater"] = Vector3.new(61163, 11, 1819),
		["UnderwaterExit"] = Vector3.new(3864, 6, -1926),
	},
	{
		["Swan Mansion"] = Vector3.new(-390, 332, 673),
		["Swan Room"] = Vector3.new(2285, 15, 905),
		["Cursed Ship"] = Vector3.new(923, 126, 32852),
	},
	{
		["Floating Turtle"] = Vector3.new(-12462, 375, -7552),
		["Hydra Island"] = Vector3.new(5745, 610, -267),
		["Mansion"] = Vector3.new(-12462, 375, -7552),
		["Castle"] = Vector3.new(-5036, 315, -3179),
	}
}

recentlySpawn = 0

-- Configs Blox Fruit

_G.KaitunConfig = _G.KaitunConfig or {
	["Start Farm"] = true,
	["Team"] = "Pirates",

	["Melee"] = {
		["Superhuman"] = true,
		["Death Step"] = true,
		["Sharkman Karate"] = true,
		["Electric Claw"] = true,
		["Dragon Talon"] = true,
		["God Human"] = true,
	},

	["Sword"] = {
		["World 1"] = {
			["Saber"] = true,
			["Pole"] = true,
		},

		["World 2"] = {
			["Rengoku"] = true,
			["Midnight Blade"] = true,
			["Soul Cane"] = true,
			["Gravity Cane"] = true,
			["Dragon Trident"] = true,
			["Legendary Sword"] = true,
			["True Triple Katana"] = true,
		},

		["World 3"] = {
			["Twin Hooks"] = true,
			["Canvander"] = true,
			["Buddy Sword"] = true,
			["Hallow Scythe"] = true,
			["Yama"] = true,
			["Tushita"] = true,
			["Cursed Dual Katana"] = true,

			["Shark Anchor"] = {
				["Enabled"] = true,
				["Money"] = 30000000,
			},
		},
	},

	["Gun"] = {
		["World 2"] = {
			["Acidum Rifle"] = true,
			["Kabucha"] = true,
		},

		["World 3"] = {
			["Serpent Bow"] = true,
			["Soul Guitar"] = true,
		},
	},

	["Fruit"] = {
		["Main Fruits"] = {"Dough-Dough"},
		["Sec Fruits"] = {"Flame-Flame","Ice-Ice","Dark-Dark","Light-Light","Magma-Magma"},
	},

	["Race"] = {
		["Select Race"] = {"Human","Mink","Fishman"}, -- "Human", "Mink", "Fishman",
		["Race V2"] = true,
		["Race V3"] = true,
		["Reroll Race"] = true,
	},

	["Mastery"] = {
		["Mastery Sword"] = true,
		["Mastery Fruit"] = true,

		["Select Rarity"] = {"Mythical","Legendary"}, -- "Mythical", "Legendary", "Rare", "Uncommon", "Common",
	},

	["Quest"] = {
		["World 2"] = {
			["Factory"] = true,
			["Bartilo"] = true,
			["Dark Fragment"] = true,
		},

		["World 3"] = {
			["Musketeer Hat"] = true,
			["Pirates Raid"] = true,
			["Rainbow Haki"] = true,
			["Dough Awaken"] = true,
			["Dough Mirror"] = true,
			["Pull Lever"] = true, -- Pull lever isn't working rn.
		},
	},

	["Setting"] = {
		["Farm When Lvl Max"] = "Cake Prince", -- "Cake Prince", "Bone", "Cocoa",
		["Item Finder Fully"] = true,

		["Hop Server"] = true,

		["Kaitun Ui"] = true,

		["Buy Base Sword"] = true,
		["Buy Haki Color"] = true,

		["Auto Stats"] = true,
		["Stats Mode"] = "Fruit", -- "Fruit", "Gun", "Sword",

		["Notify Remove"] = true,
		["Disabled Ui"] = true,
		["Redeem Code"] = true,

		["White Screen"] = true,
		["Booster FPS"] = true,
		["Locking FPS"] = 240,
	},
}

print("Get Config Value")

-- Selecting Team

if not localplayer.Team then
	repeat wait()
		local Success,Result = pcall(function()
			local MainMinimal = localplayer.PlayerGui:WaitForChild("Main (minimal)")

			repeat wait() until MainMinimal:FindFirstChild("ChooseTeam") and MainMinimal.ChooseTeam.Visible

			local TeamSelect = _G.KaitunConfig["Team"] or "Pirates"
			local TeamButton = (TeamSelect == "Marines" and MainMinimal.ChooseTeam.Container.Marines or MainMinimal.ChooseTeam.Container.Pirates).Frame.TextButton
			for _, v in pairs(getconnections(TeamButton.Activated)) do 
				v.Function() 

				print("[Selecting Team]: "..TeamSelect)
			end
		end)
		if not Success then warn("[Selecting Team]: "..Result) end
	until localplayer.Team
end

-- Destroy Lava-Damage

function IsLava(v)
	if v:IsA("Script") and v.Name == "LavaDamage" then
		wait()
		v.Parent:Destroy()
	end
end

for i,v in pairs(workspace:GetDescendants()) do
	IsLava(v)
end

-- Destory BaseAtmosphere

game.Lighting.FogEnd = 9e9

if game:GetService("Lighting"):FindFirstChild("BaseAtmosphere") then
	game:GetService("Lighting"):FindFirstChild("BaseAtmosphere"):Destroy()
end
if game:GetService("Lighting"):FindFirstChild("LightingLayers") then
	game:GetService("Lighting"):FindFirstChild("LightingLayers"):Destroy()
end

-- Quest Function

repeat wait() until replicatedstorage:FindFirstChild("GuideModule") and replicatedstorage:FindFirstChild("Quests")
repeat wait() until Player_Data.Level

local Farm = {}
local QuestHandler = {}

wait(2)

-- Checkquest Globals Variables

QuestHandler.Guide = require(replicatedstorage.GuideModule)
QuestHandler.AllQuests = require(replicatedstorage.Quests)
QuestHandler.QuestAssignments = {}
QuestHandler.BagNumber = {} 
QuestHandler.QuestData = {
	[1] = nil,
	[2] = nil,
}
QuestHandler.CountCheck = 0 

-- Checkquest Functions

QuestHandler.GetAllQuests = LPH_JIT_MAX(function()
	local QuestData  = {}

	for questIndex, questDetails in pairs(QuestHandler.AllQuests) do
		QuestData[questIndex] = {
			ID = questIndex,
			Info = questDetails
		}
	end
	return QuestData 
end)

QuestHandler.DetermineLevelRequirements = LPH_JIT_MAX(function()
	local LevelRequirements = {}

	for _, quest in pairs(QuestHandler.GetAllQuests()) do
		for _, details in pairs(quest.Info) do
			table.insert(LevelRequirements, details.LevelReq)
		end
	end

	local PlayerLevel
	if not QuestHandler.CustomLevel then
		PlayerLevel = Player_Data.Level.Value
	else
		PlayerLevel = QuestHandler.CustomLevel
	end

	-- Adjust PlayerLevel for specific ranges

	if PlayerLevel >= 325 and PlayerLevel < 375 then
		PlayerLevel = 325
	elseif FirstSea and PlayerLevel > 675 then
		PlayerLevel = 650
	elseif SecondSea then
		if PlayerLevel > 850 and PlayerLevel < 875 then
			PlayerLevel = 800
		elseif PlayerLevel > 1450 then
			PlayerLevel = 1450
		end
	elseif PlayerLevel >= 1550 and PlayerLevel < 1575 then
		PlayerLevel = 1525
	elseif PlayerLevel >= 2575 then
		PlayerLevel = 2575
	elseif PlayerLevel >= 210 and PlayerLevel < 250 then
		PlayerLevel = 210
	elseif PlayerLevel >= 100 and PlayerLevel < 120 then
		PlayerLevel = 100
	elseif PlayerLevel >= 250 and PlayerLevel < 300 then
		PlayerLevel = 250
	end

	-- Sort LevelRequirements
	table.sort(LevelRequirements)

	local PrimaryQuest, SecondaryQuest, TertiaryQuest

	for i, levelRequirement in pairs(LevelRequirements) do
		if PlayerLevel == levelRequirement then
			PrimaryQuest = LevelRequirements[i]
			if Double_Quest then
				SecondaryQuest = LevelRequirements[i - 1]
				TertiaryQuest = LevelRequirements[i - 2]
			end
			break
		elseif PlayerLevel < levelRequirement then
			PrimaryQuest = LevelRequirements[i - 1]
			if Double_Quest then
				SecondaryQuest = LevelRequirements[i - 2]
				TertiaryQuest = LevelRequirements[i - 3]
			end
			break
		end
	end

	QuestHandler.QuestAssignments = {
		[1] = PrimaryQuest,
		[2] = SecondaryQuest or nil,
	}

	if (PlayerLevel >= 400 and PlayerLevel < 625) or (PlayerLevel > 700 and PlayerLevel <= 1450) then
		QuestHandler.QuestAssignments = {
			[1] = PrimaryQuest,
			[2] = SecondaryQuest or nil,
			[3] = TertiaryQuest,
		}
	end

	-- Specific conditions for quest assignment
	if 
		(PlayerLevel > 90 and PlayerLevel < 100) or
		(PlayerLevel > 190 and PlayerLevel < 210) or
		(PlayerLevel > 300 and PlayerLevel < 325) or
		(PlayerLevel >= 950 and PlayerLevel < 975) or
		(PlayerLevel > 1000 and PlayerLevel < 1050) or
		(PlayerLevel > 1100 and PlayerLevel < 1125) or
		(PlayerLevel > 1250 and PlayerLevel < 1275) or
		(PlayerLevel > 1350 and PlayerLevel < 1375) or
		(PlayerLevel > 1425 and PlayerLevel < 1450) or
		(PlayerLevel > 1575 and PlayerLevel < 1600) or
		(PlayerLevel > 1625 and PlayerLevel < 1650) or
		(PlayerLevel > 1700 and PlayerLevel < 1725) or
		(PlayerLevel > 1775 and PlayerLevel < 1800) or
		(PlayerLevel > 1825 and PlayerLevel < 1850) or
		(PlayerLevel > 1900 and PlayerLevel < 1925) or
		(PlayerLevel > 1975 and PlayerLevel < 2000) or
		(PlayerLevel > 2025 and PlayerLevel < 2050) or
		(PlayerLevel > 2075 and PlayerLevel < 2100) or
		(PlayerLevel > 2125 and PlayerLevel < 2150) or
		(PlayerLevel > 2200 and PlayerLevel < 2225) or
		(PlayerLevel > 2250 and PlayerLevel < 2275) or
		(PlayerLevel > 2300 and PlayerLevel < 2325) or
		(PlayerLevel > 2350 and PlayerLevel < 2400) or
		(PlayerLevel > 2450 and PlayerLevel < 2475) then
		QuestHandler.QuestAssignments = {
			[1] = PrimaryQuest,
			[2] = nil,
			[3] = nil,
		}
	end

	return PrimaryQuest
end)

QuestHandler.DetermineLevelRequirements()

QuestHandler.CheckBossLevel = LPH_JIT_MAX(function(bossData)
	local indexList = {}
	local dataIndex = {}

	-- Collect and sort indices
	for key, _ in pairs(bossData) do
		table.insert(indexList, key)
	end
	table.sort(indexList)

	-- Create a value table based on indices
	for key, value in pairs(bossData) do
		dataIndex[key] = value
	end

	local result

	for _, sortedIndex in pairs(indexList) do
		for _, quest in pairs(QuestHandler.QuestAssignments) do
			if sortedIndex ~= quest then
				continue
			end

			-- Check task validity
			if QuestHandler:FindValue(dataIndex[sortedIndex].Value.Task) == 1 then
				result = dataIndex[indexList[_ - 1]]
			else
				result = dataIndex[indexList[_]]
			end
		end
	end

	return result
end)

QuestHandler.MyData = LPH_JIT_MAX(function()
	QuestHandler.BagNumber = {}

	for _, v in pairs(QuestHandler.QuestData) do
		if not v.Used then
			continue
		end
		QuestHandler.CountCheck += 1
	end

	-- Reset condition
	if QuestHandler.CountCheck >= 2 then
		QuestHandler.CountCheck = 0
		QuestHandler.QuestData = {
			[1] = nil,
			[2] = nil,
		}
	end

	if not Double_Quest then
		QuestHandler.QuestData = {}
	end

	local questPool = {}

	for i, v in pairs(QuestHandler.GetAllQuests()) do
		for _, quest in pairs(v.Info) do
			if (i:sub(1, 11) == "MarineQuest" and #i == 11) or i == "BartiloQuest" or i == "CitizenQuest" then
				continue
			end
			questPool[quest.LevelReq] = {
				Index = i,
				Value = quest,
			}
		end
	end

	local selectedData = QuestHandler.CheckBossLevel(questPool)

	if Double_Quest then
		for i, quest in pairs(questPool) do
			for _, questReq in pairs(QuestHandler.QuestAssignments) do
				if questPool[i].Value.LevelReq == questReq then
					if QuestHandler:FindValue(quest.Value.Task) == 1 and Double_Quest then
						continue
					end
					table.insert(QuestHandler.BagNumber, questReq)
					if not QuestHandler.QuestData[questReq] then
						QuestHandler.QuestData[questReq] = {
							Index = quest.Index,
							Value = quest.Value,
							Used = false,
						}
					end
				end
			end
		end
	else
		for _, quest in pairs(questPool) do
			if quest.Value.LevelReq == selectedData.Value.LevelReq then
				table.insert(QuestHandler.BagNumber, selectedData.Value.LevelReq)
				if not QuestHandler.QuestData[selectedData.Value.LevelReq] then
					QuestHandler.QuestData[selectedData.Value.LevelReq] = {
						Index = quest.Index,
						Value = quest.Value,
						Used = false,
					}
				end
			end
		end
	end

	return QuestHandler.QuestData
end)

function QuestHandler:FindValue(p1)
	if not p1 then 
		warn("havenil") 
		return 
	end
	for _, v in pairs(p1) do
		return v
	end
end

function QuestHandler:FindIndex(p1)
	if not p1 then 
		warn("havenil") 
		return 
	end
	for i, _ in pairs(p1) do
		return i
	end
end

function QuestHandler:FindData(questName, levelReq)
	for i, v in pairs(QuestHandler.AllQuests[questName]) do
		if v.LevelReq == levelReq then
			return {
				Value = v,
				Index = i,
			}
		end
	end
end

function QuestHandler:Npcs(levelReq, npcData)
	local positionMon
	for _, spawn in pairs(WorldOrigin.EnemySpawns:GetChildren()) do
		if spawn.Name == self:FindIndex(npcData) or spawn.Name:match(self:FindIndex(npcData)) then
			positionMon = spawn
		end
	end

	for i, npc in pairs(self.Guide.Data.NPCList) do
		for _, level in pairs(npc.Levels) do
			if level == levelReq then
				return {
					Index = i,
					Value = npc,
					MonPosition = positionMon or nil,
				}
			end
		end
	end
end

function QuestHandler:GetQuest()
	QuestHandler.DetermineLevelRequirements()
	local Data = {}

	local M_Data = self.MyData()

	local p1, p2

	if Double_Quest then
		p1 = math.max(unpack(QuestHandler.BagNumber))
	else
		p1 = QuestHandler.DetermineLevelRequirements()
	end

	table.sort(QuestHandler.BagNumber)

	for _, v in pairs(QuestHandler.BagNumber) do
		if v == p1 then continue end
		p2 = v
	end

	if not p2 then p2 = p1 end

	if Double_Quest then
		if not QuestHandler.QuestData[M_Data[p1].Value.LevelReq].Used then
			Data[M_Data[p1].Value.LevelReq] = {
				Mon = self:FindIndex(M_Data[p1].Value.Task),
				NameQuest = M_Data[p1].Index,
				NumberQuest = self:FindData(M_Data[p1].Index, M_Data[p1].Value.LevelReq).Index,
				CFrameQuest = self:Npcs(M_Data[p1].Value.LevelReq, M_Data[p1].Value.Task).Index.CFrame,
				CFrameMon = self:Npcs(M_Data[p1].Value.LevelReq, M_Data[p1].Value.Task).MonPosition,
			}
		else
			Data[M_Data[p2].Value.LevelReq] = {
				Mon = self:FindIndex(M_Data[p2].Value.Task),
				NameQuest = M_Data[p2].Index,
				NumberQuest = self:FindData(M_Data[p2].Index, M_Data[p2].Value.LevelReq).Index,
				CFrameQuest = self:Npcs(M_Data[p2].Value.LevelReq, M_Data[p2].Value.Task).Index.CFrame,
				CFrameMon = self:Npcs(M_Data[p2].Value.LevelReq, M_Data[p2].Value.Task).MonPosition,
			}
		end
	else
		local C = p2
		Data[M_Data[C].Value.LevelReq] = {
			Mon = self:FindIndex(M_Data[C].Value.Task),
			NameQuest = M_Data[C].Index,
			NumberQuest = self:FindData(M_Data[C].Index, M_Data[C].Value.LevelReq).Index,
			CFrameQuest = self:Npcs(M_Data[C].Value.LevelReq, M_Data[C].Value.Task).Index.CFrame,
			CFrameMon = self:Npcs(M_Data[C].Value.LevelReq, M_Data[C].Value.Task).MonPosition,
		}
	end

	return self:FindIndex(Data), Data
end

Double_Quest = true

-- local Level, Data = QuestHandler:GetQuest()

-- print(Data[Level].Mon)

getgenv().network = network or {
	cache = {
		connections = {
			insert = function(self,value)
				self[#self + 1] = value
			end,
			clear = function(self)
				for i=1,#self do local v = self[i]
					if type(v) ~= "function" then
						v:Disconnect()
						table.remove(self,table.find(self,v))
					end
				end
			end,
		},
		remotes = {
			insert = function(self,value)
				self[#self + 1] = value
			end,
		},
	},
	Retrieve = function(self,name,func)
		local Remote = self.cache.remotes[name] or (typeof(name) == "Instance" and name) or game:FindFirstChild(name,true)
		if Remote then
			if Remote:IsA("RemoteEvent") then
				self.cache.connections:insert(Remote.OnClientEvent:Connect(func))
				self.cache.remotes[name] = Remote
			elseif Remote:IsA("RemoteFunction") then
				Remote.OnClientInvoke = func
				self.cache.connections:insert(Remote.OnClientInvoke)
				self.cache.remotes[name] = Remote
			else
				warn("Unable to Connect Network")
			end
		else
			warn("Unable to Indentify Remote Network")
		end
	end,
	Send = function(self, name, ...)
		local success, result = pcall(function(...)
			local Remote = self.cache.remotes[name] or (typeof(name) == "Instance" and name) or game:FindFirstChild(name, true)
			if Remote then
				if Remote:IsA("RemoteEvent") then
					self.cache.remotes[name] = Remote
					Remote:FireServer(...)
				elseif Remote:IsA("RemoteFunction") then
					self.cache.remotes[name] = Remote
					return Remote:InvokeServer(...)
				else
					error("Unable to Connect Network")
				end
			else
				error("Unable to Identify Remote Network")
			end
		end, ...)
		if not success then
			warn("Error in Send function:", result)
		end
		return result
	end,
}

-- CommF_

CommF_ = LPH_JIT_MAX(function(...)
	local ARGS = {...}
	local Data = network:Send("CommF_",...)
	local r,s = pcall(function()
		if ARGS[1] == "requestEntrance" then
			collectionservice:AddTag(localplayer,"Teleporting")
			task.delay(3,function()
				collectionservice:RemoveTag(localplayer,"Teleporting")
			end)
			wait(.25)
		end
	end)
	if not r then warn("Remote : "..s) end
	return Data
end)

-- Debugging Function

Debug = LPH_JIT_MAX(function(Text,Typing)
	if Debug_Mode then
		print("[Debug Function] : "..Text)
	else
		if Typing then
			print("[Debug Function] : "..Text)
		else
			print("[Notification] : "..Text)
		end
	end
end)

Debug_Mode = false

-- Inventory Sequency

Check_Inventory = LPH_JIT_MAX(function(...)
	local toolsToCheck = {...}
	for _, toolName in pairs(toolsToCheck) do
		if localplayer.Backpack:FindFirstChild(toolName) or localplayer.Character:FindFirstChild(toolName) then
			return true
		end
	end
	return false
end)

Equip_Tool = LPH_JIT_MAX(function(Tool_Name)
	local Tool = localplayer.Backpack:FindFirstChild(Tool_Name)
	if Tool and localplayer.Character:FindFirstChild("Humanoid") then
		localplayer.Character.Humanoid:EquipTool(Tool)
	end
end)

Check_Tool_Mastery = LPH_JIT_MAX(function(Tool,Mastery)
	local Character_Tool = localplayer.Character:FindFirstChild(Tool)
	if Character_Tool and Character_Tool:IsA('Tool') and Character_Tool:FindFirstChild("Level") and Character_Tool.Level.Value >= Mastery then
		return true
	end
	local Backpack_Tool = localplayer.Backpack:FindFirstChild(Tool)
	if Backpack_Tool and Backpack_Tool:IsA('Tool') and Backpack_Tool:FindFirstChild("Level") and Backpack_Tool.Level.Value >= Mastery then
		return true
	end
	return false
end)

-- Monster Function

Check_Monster = LPH_JIT_MAX(function(Monster)
	local Table_Monster = Monster
	if type(Monster) == "string" then 
		Table_Monster = {Monster} 
	end

	local nearestEnemy = nil
	local shortestDistance = math.huge

	for _, v in pairs(workspace.Enemies:GetChildren()) do
		if table.find(Table_Monster, v.Name) and Check_Alive_Monster(v) and Distance(v.HumanoidRootPart.Position) <= 2000 then
			local distance = Distance(v.HumanoidRootPart.Position)
			if distance < shortestDistance then
				nearestEnemy = v
				shortestDistance = distance
			end
		end
	end

	if not nearestEnemy then
		for _, v in pairs(replicatedstorage:GetChildren()) do
			if table.find(Table_Monster, v.Name) then
				local distance = Distance(v.HumanoidRootPart.Position)
				if distance < shortestDistance then
					nearestEnemy = v
					shortestDistance = distance
				end
			end
		end
	end

	return nearestEnemy
end)

Check_Alive_Monster = LPH_JIT_MAX(function(Mon)
	return Mon and Mon.Parent and Mon:FindFirstChild("Humanoid") and Mon:FindFirstChild("HumanoidRootPart") and Mon:FindFirstChild("Humanoid").Health > 0
end)

function Convert_To_CFrame(value)
	if typeof(value) == "Vector3" then
		return CFrame.new(value)
	elseif typeof(value) == "CFrame" then
		return value
	else
		return nil
	end
end

Distance = LPH_JIT_MAX(function(a, b, noHeight)
	local vector_a = Vector3.new(a.X, not noHeight and a.Y or 0, a.Z)
	local success, result = pcall(function()
		if not b then
			while true do
				local Root = localplayer.Character and localplayer.Character:FindFirstChild("HumanoidRootPart")
				if Root and Root.Position then
					b = Root.Position
					break
				end
				wait(.5) 
			end
		end

		local vector_b = Vector3.new(b.X, not noHeight and b.Y or 0, b.Z)
		return (vector_a - vector_b).magnitude
	end)

	if success then
		return result
	else
		warn("Distance Calculation Failed", result)
		return nil
	end
end)

FindNearestLocation = LPH_JIT_MAX(function(Pos, Location)
	local nearest, scale = nil, 0
	if Location then
		if Distance(Pos, Location.Position, true) <= (Location.Mesh.Scale.X / 2) + 500 then
			return Location
		end
	end
	for i, v in pairs(WorldOrigin.Locations:GetChildren()) do
		if Distance(Pos, v.Position, true) <= (v.Mesh.Scale.X / 2) + 500 then
			if scale < v.Mesh.Scale.X then
				scale = v.Mesh.Scale.X
				nearest = v
			end
		end
	end
	return nearest
end)

Is_player_ready = LPH_JIT_MAX(function()
	return localplayer.Character and localplayer.Character:FindFirstChild("Humanoid") and localplayer.Character:FindFirstChild("HumanoidRootPart") and localplayer.Character:FindFirstChild("Humanoid").Health > 0
end)

Is_raiding = LPH_JIT_MAX(function()
	return localplayer.PlayerGui.Main.TopHUDList.RaidTimer.Visible or StartingRaid
end)

Check_raid_chip = LPH_JIT_MAX(function()
	local function Has_chip(container)
		for _, item in ipairs(container:GetChildren()) do
			if item:IsA("Tool") and item.Name:lower():find("microchip") then
				return true
			end
		end
		return false
	end

	return Has_chip(localplayer.Backpack) or Has_chip(localplayer.Character)
end)

Check_Fruit = LPH_JIT_MAX(function() 
	for i,v in pairs(workspace:GetChildren()) do
		if v.Name:find("Fruit") and v:FindFirstChild("Handle") then
			return true
		end
	end
	return false
end)

Check_fruit_inventory = LPH_JIT_MAX(function()
	local function hasFruit(container)
		for _, item in ipairs(container:GetChildren()) do
			if item:IsA("Tool") and item.Name:lower():find("fruit") then
				return true
			end
		end
		return false
	end

	return hasFruit(localplayer.Backpack) or hasFruit(localplayer.Character)
end)

Is_Safe_Zone = LPH_JIT_MAX(function(p)
	for i,v in pairs(WorldOrigin.SafeZones:GetChildren()) do
		if v:IsA("Part") then
			if Distance(v.Position, p.HumanoidRootPart.Position, true) <= 1000 then
				return true
			end
		end
	end
	return false
end)

-- Notify Function

function NotifyText(tbl, status)
	local ScreenGui = Instance.new("ScreenGui")
	ScreenGui.Parent = game.CoreGui
	ScreenGui.ResetOnSpawn = false
	ScreenGui.Name = "NotifyGUI_" .. tostring(math.random(100000, 999999))

	local Frame = Instance.new("Frame")
	Frame.Size = UDim2.new(0, 400, 0, 60)
	Frame.Position = UDim2.new(1, -420, 1, -110)
	Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Frame.BorderSizePixel = 0
	Frame.AnchorPoint = Vector2.new(0, 0)
	Frame.Parent = ScreenGui
	Frame.BackgroundTransparency = 0.05

	local ColorBar = Instance.new("Frame")
	ColorBar.Size = UDim2.new(0, 5, 1, 0)
	ColorBar.Position = UDim2.new(0, 0, 0, 0)
	ColorBar.BorderSizePixel = 0
	ColorBar.BackgroundColor3 = status == "Success" and Color3.fromRGB(0, 200, 0)
		or status == "Warning" and Color3.fromRGB(255, 170, 0)
		or status == "Error" and Color3.new(1, 0, 0)
		or Color3.fromRGB(0, 122, 255)
	ColorBar.Parent = Frame

	local Title = Instance.new("TextLabel")
	Title.Size = UDim2.new(1, -20, 0, 25)
	Title.Position = UDim2.new(0, 15, 0, 5)
	Title.Text = tbl.Title or "Notification"
	Title.TextColor3 = Color3.fromRGB(0, 0, 0)
	Title.TextScaled = true
	Title.BackgroundTransparency = 1
	Title.Font = Enum.Font.SourceSansSemibold
	Title.TextXAlignment = Enum.TextXAlignment.Left
	Title.Parent = Frame

	local Text = Instance.new("TextLabel")
	Text.Size = UDim2.new(1, -20, 0, 25)
	Text.Position = UDim2.new(0, 15, 0, 30)
	Text.Text = tbl.Text or "..."
	Text.TextColor3 = Color3.fromRGB(34, 34, 34)
	Text.TextScaled = true
	Text.BackgroundTransparency = 1
	Text.Font = Enum.Font.SourceSans
	Text.TextXAlignment = Enum.TextXAlignment.Left
	Text.Parent = Frame

	local duration = tbl.Time or 3

	task.delay(duration, function()
		local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
		local fadeTween = tweenservice:Create(Frame, tweenInfo, {BackgroundTransparency = 1})
		local fadeTitle = tweenservice:Create(Title, tweenInfo, {TextTransparency = 1})
		local fadeText = tweenservice:Create(Text, tweenInfo, {TextTransparency = 1})
		local fadeBar = tweenservice:Create(ColorBar, tweenInfo, {BackgroundTransparency = 1})

		fadeTween:Play()
		fadeTitle:Play()
		fadeText:Play()
		fadeBar:Play()

		fadeTween.Completed:Wait()
		ScreenGui:Destroy()
	end)
end

-- toTarget Function

function Boat_Tween(pos, boat)
	local info = TweenInfo.new((boat.CFrame.Position - pos.Position).Magnitude / 300, Enum.EasingStyle.Linear)
	local tween = tweenservice:Create(boat, info, {CFrame = pos})
	local stopboat = {}
	function stopboat:Stop()
		tween:Cancel()
	end
	if (boat.CFrame.Position - pos.Position).Magnitude <= 25 then
		stopboat:Stop()
	else
		tween:Play()
	end
	return stopboat
end

totarget = LPH_JIT_MAX(function(CFgo)
	local rootPart = localplayer.Character:FindFirstChild("HumanoidRootPart")

	if not rootPart then
		warn("HumanoidRootPart not found")
		return
	end

	-- เธซเธขเธธเธ” tween เธซเธฒเธเธกเธตเธเธฒเธฃ tween เธญเธขเธนเนเธเนเธญเธเธซเธเนเธฒ
	if isTweening then
		stoptp()
	end

	rootPart.CFrame = CFrame.new(rootPart.Position.X, CFgo.Position.Y + 300, rootPart.Position.Z)

	local Dis = Distance(rootPart.Position, CFgo.Position, true)

	if Dis < 170 then
		rootPart.CFrame = CFgo
		speed = 350
	elseif Dis < 1000 then
		speed = 330
	elseif Dis >= 1000 then
		speed = 325
	end

	local distance = (rootPart.Position - CFgo.Position).Magnitude
	local duration = distance / speed

	local startTime = tick()
	local startCFrame = rootPart.CFrame
	isTweening = true

	-- เน€เธฃเธดเนเธก tween
	currentTween = task.spawn(function()
		while isTweening and tick() - startTime < duration do
			local alpha = math.clamp((tick() - startTime) / duration, 0, 1) -- เธเนเธฒ 0 เธ–เธถเธ 1\
			if Distance(CFgo.Position, nil, true) > 50 then
				local TOP_CFrame = CFrame.new(CFgo.Position.X, CFgo.Position.Y + 300, CFgo.Position.Z)
				rootPart.CFrame = startCFrame:Lerp(TOP_CFrame, alpha)
				task.wait(0.001) -- เธฃเธญเน€เธเธทเนเธญเนเธซเนเธญเธฑเธเน€เธ”เธ•เนเธกเนเธเธดเธเธ—เธฃเธฑเธเธขเธฒเธเธฃ
			else
				rootPart.CFrame = startCFrame:Lerp(CFgo, alpha)
				task.wait(0.001) -- เธฃเธญเน€เธเธทเนเธญเนเธซเนเธญเธฑเธเน€เธ”เธ•เนเธกเนเธเธดเธเธ—เธฃเธฑเธเธขเธฒเธเธฃ
			end
		end

		-- เธ•เธฑเนเธเธเนเธฒ CFrame เนเธซเนเธ–เธถเธเธเธธเธ”เธซเธกเธฒเธขเธชเธธเธ”เธ—เนเธฒเธขเธซเธฒเธเธขเธฑเธเธ—เธณเธเธฒเธ
		if isTweening then
			rootPart.CFrame = CFgo
		end

		isTweening = false
	end)
end)

function StopTween()
	if activeTween and activeTween.PlaybackState == Enum.PlaybackState.Playing then
		activeTween:Cancel()
		activeTween = nil
	end
end

Tween = LPH_JIT_MAX(function(CFgo)
	local rootPart = localplayer.Character:FindFirstChild("HumanoidRootPart")

	if not rootPart and not Is_player_ready() then
		warn("HumanoidRootPart not found")
		return
	end 

	local Distance = Distance(rootPart.Position, CFgo.Position, true)
	local speed

	if Distance < 170 then
		speed = 350
	elseif Distance < 1000 then
		speed = 330
	else
		speed = 300
	end

	local distance = (rootPart.Position - CFgo.Position).Magnitude
	local duration = distance / speed

	rootPart.CFrame = CFrame.new(rootPart.Position.X, CFgo.Position.Y, rootPart.Position.Z)

	StopTween()

	local info = TweenInfo.new(duration, Enum.EasingStyle.Linear)
	local success, err = pcall(function()
		activeTween = tweenservice:Create(rootPart, info, {CFrame = CFgo}) -- เธชเธฃเนเธฒเธ Tween เนเธซเธกเน
		activeTween:Play()
		activeTween.Completed:Wait()
	end)

	if not success then
		warn("Tween error:", err)
	end
end)

stoptp = function()
	isTweening = false
	if currentTween then
		task.cancel(currentTween)
		currentTween = nil
	end
end

TP = LPH_JIT_MAX(function(...)
	local target = Convert_To_CFrame(...)
	local succ,err = pcall(function()
		local Dista, distm, middle = Distance(target, nil, true), 1/0
		if Is_player_ready() and FindNearestLocation(localplayer.Character.HumanoidRootPart.Position) ~= FindNearestLocation(target.p) and Dista >= 2000 and tick() - recentlySpawn > 10 then
			task.wait(0.5)
			if FindNearestLocation(localplayer.Character.HumanoidRootPart.Position) ~= FindNearestLocation(target.p) then
				for _, v in pairs(CanTeleport[SeaIndex]) do
					local distance = Distance(v, target, true)
					if distance < Distance(target, nil, true) and distance < distm then
						distm, middle = distance, v
					end
				end

				if middle and FindNearestLocation(localplayer.Character.HumanoidRootPart.Position) ~= FindNearestLocation(middle) and not Is_raiding() then
					stoptp()
					CommF_("requestEntrance", middle)
				end

				if not Is_raiding() and not Check_raid_chip() and not Check_fruit_inventory() and not Check_Inventory("God's Chalice", "Red Key", "Apple", "Banana", "Pineapple", "Flower 1", "Flower 2", "Flower 3") then
					local SpawnPoint = WorldOrigin.PlayerSpawns[localplayer.Team.Name]:GetChildren()
					local dista, distm, charDist, nearest = 2000, 9000

					for _, v in pairs(SpawnPoint) do
						local Position = v:GetPivot().p
						local distance = Distance(target.p, Position, true)
						if distance <= dista then
							charDist = Distance(Position, nil, true)
							dista, nearest = distance, v
						end
					end

					if nearest and (charDist <= 4000) and FindNearestLocation(localplayer.Character.HumanoidRootPart.Position) ~= FindNearestLocation(target.p) then
						if not Is_player_ready() then return end
						if localplayer.Character.HumanoidRootPart:FindFirstChild("Died") then
							localplayer.Character.HumanoidRootPart.Died:Destroy()
						end

						repeat task.wait()
							task.spawn(CommF_, "SetLastSpawnPoint", nearest.Name)
						until Player_Data.LastSpawnPoint.Value == nearest.Name

						localplayer.Character.Humanoid.Health = 0

						repeat task.wait()
							localplayer.Character.HumanoidRootPart.CFrame = target
						until Is_player_ready()
					end
				end
			end
		end
		totarget(target)
	end)
end)

-- Fruit Function

Get_Inventory_Fruits = LPH_JIT_MAX(function(minValue, maxValue)
	local Fruits = CommF_("getInventory")
	local FruitTable = {}
	local FruitCount = 0

	for _, v in pairs(Fruits) do
		if v.Type == "Blox Fruit" and v.Value and v.Value > minValue and v.Value < maxValue then
			table.insert(FruitTable, {Name = v.Name, Value = v.Value})
			FruitCount = FruitCount + 1 -- เน€เธเธดเนเธกเธเธณเธเธงเธเน€เธกเธทเนเธญเธเธเธเธฅเนเธกเนเธ—เธตเนเน€เธเนเธฒเน€เธเธทเนเธญเธเนเธ
		end
	end

	return FruitTable, FruitCount
end)

function RemoveSpaces(str)
	return str:gsub(" Fruit", "")
end

StoreFruit = LPH_JIT_MAX(function(fruitName, fruit)
	local Remote_Inventory_Fruit = Get_Inventory_Fruits(0,math.huge)
	local HaveFruitInStore = false

	for _, v1 in pairs(Remote_Inventory_Fruit) do
		if v1.Name == fruitName then
			HaveFruitInStore = true
			break
		end
	end

	if not HaveFruitInStore then
		if fruit then
			CommF_("StoreFruit", fruitName, fruit)
		end
	end
end)

ProcessFruits = LPH_JIT_MAX(function(container)
	for _, v in pairs(container:GetChildren()) do
		if string.find(v.Name, "Fruit") then
			local FruitName = RemoveSpaces(v.Name)
			local NameFruit
			if v.Name == "Bird: Falcon Fruit" then
				NameFruit = "Bird-Bird: Falcon"
			elseif v.Name == "Bird: Phoenix Fruit" then
				NameFruit = "Bird-Bird: Phoenix"
			elseif v.Name == "Human: Buddha Fruit" then
				NameFruit = "Human-Human: Buddha"
			else
				NameFruit = FruitName .. "-" .. FruitName
			end
			StoreFruit(NameFruit, v)
		end
	end
end)

-- Bring Entities

BringMob = function(Mon)
	Has_Near_Mob = false
	for _, enemy in pairs(workspace.Enemies:GetChildren()) do
		local humanoidRootPart = enemy:FindFirstChild("HumanoidRootPart")
		local humanoid = enemy:FindFirstChildOfClass("Humanoid")

		if Check_Alive_Monster(enemy) and Distance(humanoidRootPart.Position, Mon.HumanoidRootPart.Position) <= 5000 then
			local isValidMob = not Mon or (enemy ~= Mon and enemy.Name == Mon.Name)

			if isValidMob then
				if not enemy:FindFirstChild("HumanoidRootPart"):FindFirstChild("BodyVelocity") then
					local G = Instance.new("BodyVelocity")
					G.Parent = enemy:FindFirstChild("HumanoidRootPart")
					G.Name = "BodyVelocity"
					G.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
					G.Velocity = Vector3.new(0, 0, 0)
				end

				if enemy:FindFirstChild("HumanoidRootPart"):FindFirstChild("BodyVelocity") then
					enemy:FindFirstChild("HumanoidRootPart").BodyVelocity.Velocity = Vector3.new(0, 0, 0)
					enemy:FindFirstChild("HumanoidRootPart").BodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
				end

				for _, v in pairs(Mon:GetDescendants()) do
					if v:IsA("BasePart") then
						v.CanCollide = false
					end
				end

				local monPos = Mon.HumanoidRootPart.CFrame.Position
				local distanceToMon = Distance(humanoidRootPart.Position, monPos)

				if distanceToMon <= 10 then
					Has_Near_Mob = true
				end
				if not Has_Near_Mob and (isnetworkowner(humanoidRootPart) or Distance(humanoidRootPart.Position, Mon.HumanoidRootPart.CFrame.Position) < 300) then
					humanoidRootPart.CFrame = CFrame.new(Mon.HumanoidRootPart.CFrame.Position) * CFrame.Angles(0, math.rad(0), 0)
				end
			end
		end
	end
end

-- Attacking Entities

Attack = LPH_JIT_MAX(function(Mon,Statement,Para_Weapon)
	local Statement = Statement or function() return true end
	local Humanoid = Mon:FindFirstChild("Humanoid")
	local HumanoidRootPart = Mon:FindFirstChild("HumanoidRootPart")

	if Humanoid and HumanoidRootPart then
		local succ,err = pcall(function()
			Checking_Bug = true
			repeat task.wait(0.1)        
				if not localplayer.Character:FindFirstChild("HasBuso") then
					CommF_("Buso")
				end     

				if Check_Tool_Mastery("Dark Step", 150) or Check_Tool_Mastery("Death Step", 400) then
					virtualinput:SendKeyEvent(true, "V", false, game)
					virtualinput:SendKeyEvent(false, "V", false, game)
				end

				Magnet_monster = Mon.Name
				Pos_mon = HumanoidRootPart.CFrame

				Humanoid.JumpPower = 0
				Humanoid.WalkSpeed = 0
				HumanoidRootPart.CanCollide = false

				Equip_Tool(Para_Weapon or Current_Weapon)

				if Mon == "Core" then
					TP(CFrame.new(502.7349853515625, 143.0749053955078, -379.078125))
				else
					TP(HumanoidRootPart.CFrame * CFrame.new(0, 50, 0))
				end
			until Statement()
			Checking_Bug = false
			stoptp()
		end)
		if not succ then warn("Attack Function "..err) end
	end

end)

-- Hop Servers

function Server_Hop(Text)
	pcall(function()
		NotifyText({
			Title = "Pictures Hub",
			Text = "Hop Server : "..Text,
			Time = 5
		}, "Success")

		for count = math.random(1, math.random(40, 75)), 100 do
			remote = replicatedstorage.__ServerBrowser:InvokeServer(count)
			for _i ,v in pairs(remote) do
				if tonumber(v['Count']) < 12 then
					teleportservice:TeleportToPlaceInstance(game.PlaceId, _i)
				end
			end    
		end
	end)
end

Remote_Check_Tool = LPH_JIT_MAX(function(action, name, value)
	local Remote_Inventory = CommF_("getInventory")
	for _, item in pairs(Remote_Inventory) do
		if action == "Tool" and item.Name == name then
			return true
		elseif action == "Mastery" and item.Name == name and item.Mastery >= value then
			return true
		elseif action == "Material" and item.Type == "Material" and item.Name == name then
			return item.Count
		end
	end
	return action == "Material" and 0 or false
end)

Find_Monster_Spawner = LPH_JIT_MAX(function(Name_Mon)
	local Mon = type(Name_Mon) == "string" and {Name_Mon} or Name_Mon
	local matchingSpawns = {}

	for _, Mob in pairs(Mon) do
		for _, spawn in pairs(WorldOrigin.EnemySpawns:GetChildren()) do
			if spawn.Name:match("^" .. Mob) then
				table.insert(matchingSpawns, spawn)
			end
		end
	end

	return #matchingSpawns > 0 and matchingSpawns or nil
end)

Go_To_Spawner = LPH_JIT_MAX(function(Name_Mon,Expression)
	local Expression = Expression or function() return true end
	local Enemy_Spawn = Find_Monster_Spawner(Name_Mon)
	if not Enemy_Spawn then return end
	for _, spawn in pairs(Enemy_Spawn) do
		if not Check_Monster(Name_Mon) or not Expression() then
			repeat task.wait(0.5)
				TP(spawn.CFrame * CFrame.new(0, 30, 0))
			until Check_Monster(Name_Mon) or Expression()
			stoptp()
		end
		if Check_Monster(Name_Mon) or Expression() then
			break
		end
	end
end)

Go_To_Position = LPH_JIT_MAX(function(Part,Expression) 
	local Expression = Expression or function() return true end
	local succ,err = pcall(function()
		if not Expression() then
			repeat task.wait(0.5) 
				TP(Part.Position) 
			until Expression()
			stoptp()
		end
	end)
	if not succ then warn("Go_To_Positon "..err) end
end)

Check_Match_Race = LPH_JIT_MAX(function()
	local Player_Race = Player_Data.Race.Value
	for i,v in pairs(_G.KaitunConfig["Race"]["Select Race"]) do
		if Player_Race == v then
			return true
		end
	end
	return false
end)

Check_Fruit_Match = LPH_JIT_MAX(function()
	local current_fruit = localplayer:WaitForChild("Data").DevilFruit.Value
	local selected_Main_Fruits = _G.KaitunConfig["Fruit"]["Main Fruits"] or {}
	local selected_Sec_Fruits = _G.KaitunConfig["Fruit"]["Sec Fruits"] or {}
	local fruits = CommF_("getInventory")

	-- If have main fruit then return false
	if table.find(selected_Main_Fruits, current_fruit) then
		return false
	end

	-- Check main fruit first
	for _, fruit_name in ipairs(selected_Main_Fruits) do
		local Fruit = GetEquippedFruitName(fruit_name)
		if Check_Inventory(Fruit) then
			return fruit_name
		end
	end

	for _, fruit_data in ipairs(fruits) do
		if table.find(selected_Main_Fruits, fruit_data.Name) then
			print("Found Main-Fruit [Inventory]: ", fruit_data.Name)
			return fruit_data.Name
		end
	end

	if table.find(selected_Sec_Fruits, current_fruit) then
		return false
	end

	-- If not have main find second
	for _, fruit_name in ipairs(selected_Sec_Fruits) do
		local Fruit = GetEquippedFruitName(fruit_name)
		if Check_Inventory(Fruit) then
			return fruit_name
		end
	end

	for _, fruit_data in ipairs(fruits) do
		if table.find(selected_Sec_Fruits, fruit_data.Name) then
			print("Found Sec-Fruit [Invetory]: ", fruit_data.Name)
			return fruit_data.Name
		end
	end
	return false
end)

function GetEquippedFruitName(fruit)
	local base_name = fruit:match("^(%w+)-%w+$")
	if base_name then
		return base_name .. " Fruit"
	end
	return fruit
end

function FindFruitByName(container, fruit)
	for _, item in pairs(container:GetChildren()) do
		if item.Name == fruit then
			return item
		end
	end
	return nil
end

function Eat_Select_Fruit(fruit)
	if not fruit then return end

	Stop_Store_Fruit = true

	local equipped_fruit_name = GetEquippedFruitName(fruit)

	-- If not have fruit in backpack loaded fruit from inventory
	if not FindFruitByName(localplayer.Backpack, equipped_fruit_name) and not FindFruitByName(localplayer.Character, equipped_fruit_name) then
		local fruits = CommF_("getInventory")
		if fruits then
			CommF_("LoadFruit", fruit)
		end
	end

	-- Wait until your fruit gonna get keep to backpack
	repeat wait(0.5) until FindFruitByName(localplayer.Backpack, equipped_fruit_name)

	-- Equip fruit from backpack
	if FindFruitByName(localplayer.Backpack, equipped_fruit_name) then
		repeat
			Equip_Tool(equipped_fruit_name)
			wait()
		until not FindFruitByName(localplayer.Backpack, equipped_fruit_name)
	end

	-- Eat fruit from your character
	repeat wait(0.5) until FindFruitByName(localplayer.Character, equipped_fruit_name)

	if FindFruitByName(localplayer.Character, equipped_fruit_name) then
		localplayer.Character:WaitForChild(equipped_fruit_name).EatRemote:InvokeServer("Eat")
		print("Eating Fruit :", equipped_fruit_name)
	end

	Stop_Store_Fruit = false
end


function Buy_Fruit()
	local function buyFruit(fruit)
		CommF_("PurchaseRawFruit", fruit)
		print("Purchase Fruit :", fruit)
	end

	local current_fruit = localplayer:WaitForChild("Data").DevilFruit.Value
	local Beli = localplayer:WaitForChild("Data").Beli.Value
	local Remote_GetFruits = CommF_("GetFruits")

	local MainFruits = _G.KaitunConfig["Fruit"]["Main Fruits"] or {}
	local SecFruits = _G.KaitunConfig["Fruit"]["Sec Fruits"] or {}

	if table.find(MainFruits, current_fruit) then
		return
	end

	local mainOnSale = {}
	local secOnSale = {}

	for _, fruit in next, Remote_GetFruits do
		if fruit.OnSale then
			if table.find(MainFruits, fruit.Name) then
				table.insert(mainOnSale, fruit)
			elseif table.find(SecFruits, fruit.Name) then
				table.insert(secOnSale, fruit)
			end
		end
	end

	if #mainOnSale > 0 then
		table.sort(mainOnSale, function(a, b)
			return a.Price > b.Price
		end)

		local bestMain = mainOnSale[1]
		if Beli >= bestMain.Price then
			buyFruit(bestMain.Name)
			return
		end
	end

	if #secOnSale > 0 then
		table.sort(secOnSale, function(a, b)
			return a.Price > b.Price
		end)

		local bestSec = secOnSale[1]
		if Beli >= bestSec.Price then
			buyFruit(bestSec.Name)
		end
	end

end

LPH_JIT_MAX(function()
	function Auto_Farm_Level()
		CurrentStatus("Auto Farm Level")
		
		local Quest_gui = localplayer.PlayerGui.Main.Quest

		if Quest_gui.Visible then
			warn("[Auto_Farm_Level] Quest GUI is visible.")
			local Mon = Data[Level].Mon
			warn("[Auto_Farm_Level] Target Monster:", Mon)

			local Enemy = Check_Monster(Mon)
			if Enemy then
				warn("[Auto_Farm_Level] Found Enemy:", Enemy.Name)
				Attack(Enemy, function()
					local condition = not _G.KaitunConfig["Start Farm"] or not Check_Monster(Mon) or not Check_Alive_Monster(Enemy) or not Quest_gui.Visible
					if condition then
						warn("[Auto_Farm_Level] Stopping Attack due to condition.")
					end
					return condition
				end)
			else
				warn("[Auto_Farm_Level] No Enemy found. Going to Spawner...")
				Go_To_Spawner(Mon, function()
					local condition = not _G.KaitunConfig["Start Farm"] or not Quest_gui.Visible
					if condition then
						warn("[Auto_Farm_Level] Stopping Go_To_Spawner due to condition.")
					end
					return condition
				end)
			end
		else
			warn("[Auto_Farm_Level] Quest GUI is not visible. Fetching quest...")
			Level, Data = QuestHandler:GetQuest()
			warn("[Auto_Farm_Level] Current Level:", Level, "Quest Data:", Data)

			if not QuestHandler.QuestData[Level].Used then
				warn("[Auto_Farm_Level] Marking quest as used.")
				QuestHandler.QuestData[Level].Used = true
			end

			if Player_Data.Level.Value > 10 then
				warn("[Auto_Farm_Level] Player Level:", Player_Data.Level.Value, "Going to Quest Position.")
				Go_To_Position(Data[Level].CFrameQuest, function()
					local condition = not _G.KaitunConfig["Start Farm"] or Distance(Data[Level].CFrameQuest.Position) <= 5
					if condition then
						warn("[Auto_Farm_Level] Stopping Go_To_Position due to condition.")
					end
					return condition
				end)
			end

			task.wait(0.1)
			warn("[Auto_Farm_Level] Starting Quest:", Data[Level].NameQuest, "Number:", Data[Level].NumberQuest)
			CommF_("StartQuest", Data[Level].NameQuest, Data[Level].NumberQuest)
			task.wait(0.1)
		end
	end

	function Get_Saber()
		local Remote_Saber = CommF_("ProQuestProgress")
		if Player_Data.Level.Value >= 200 and not Remote_Saber.KilledShanks then
			for i = 1,#Remote_Saber.Plates do
				if not Remote_Saber.Plates[i] then
					CommF_("ProQuestProgress","Plate",i)
				end
			end

			if not Remote_Saber.UsedTorch then
				repeat wait() CommF_("ProQuestProgress","GetTorch") until Check_Inventory("Torch") 
				repeat wait() CommF_("ProQuestProgress","DestroyTorch") until not Check_Inventory("Torch") 
			elseif not Remote_Saber.UsedCup then
				repeat wait() CommF_("ProQuestProgress","GetCup") until Check_Inventory("Cup") 
				repeat wait() CommF_("ProQuestProgress","FillCup",localplayer.Backpack.Cup or localplayer.Character.Cup) CommF_("ProQuestProgress","SickMan") until not Check_Inventory("Cup") 
			elseif not Remote_Saber.TalkedSon then
				CommF_("ProQuestProgress","RichSon")
			elseif not Remote_Saber.KilledMob then
				local Mon = "Mob Leader"
				local Enemy = Check_Monster(Mon)

				if Enemy then
					Attack(Enemy,function()
						return not _G.KaitunConfig["Start Farm"] or not Check_Monster(Mon) or not Check_Alive_Monster(Enemy)
					end)
				end
			elseif not Remote_Saber.UsedRelic then
				repeat wait() CommF_("ProQuestProgress","RichSon") until Check_Inventory("Relic")
				repeat wait() CommF_("ProQuestProgress","PlaceRelic") until not Check_Inventory("Relic")
			elseif not Remote_Saber.KilledShanks then
				local Mon = "Saber Expert"
				local Enemy = Check_Monster(Mon)

				if Enemy then
					Attack(Enemy,function()
						return not _G.KaitunConfig["Start Farm"] or not Check_Monster(Mon) or not Check_Alive_Monster(Enemy)
					end)
				end
			end
		end
	end

	function Get_Pole()
		local Mon = "Thunder God"
		local Enemy = Check_Monster(Mon)

		if Enemy then
			Attack(Enemy,function()
				return not _G.KaitunConfig["Start Farm"] or not Check_Monster(Mon) or not Check_Alive_Monster(Enemy)
			end)
		end
	end

	function Travel_To_Second_Sea()
		local Dressrosa_Remote = CommF_("DressrosaQuestProgress")

		if not Dressrosa_Remote.UsedKey then
			repeat wait()
				CommF_("DressrosaQuestProgress","Detective")
			until Check_Inventory("Key")
			repeat wait()
				CommF_("DressrosaQuestProgress","UseKey")
			until not Check_Inventory("Key")
		elseif not Dressrosa_Remote.KilledIceBoss then
			local Mon = "Ice Admiral"
			local Enemy = Check_Monster(Mon)

			if Enemy then
				Attack(Enemy,function()
					return not _G.KaitunConfig["Start Farm"] or not Check_Monster(Mon) or not Check_Alive_Monster(Enemy)
				end)
				CommF_("TravelDressrosa")
			else
				Go_To_Spawner(Mon,function()
					return not _G.KaitunConfig["Start Farm"]
				end)
			end
		end
	end

	function Factory()
		local Mon ="Core"
		local Enemy = Check_Monster(Mon)

		if Enemy then
			Attack(Enemy,function()
				return not _G.KaitunConfig["Start Farm"] or not Check_Monster(Mon) or not Check_Alive_Monster(Enemy)
			end)
		end
	end 

	function Attack_Dark_beard()
		local Mon ="Darkbeard"
		local Enemy = Check_Monster(Mon)

		if Enemy then
			Attack(Enemy,function()
				return not _G.KaitunConfig["Start Farm"] or not Check_Monster(Mon) or not Check_Alive_Monster(Enemy)
			end)
		end
	end

	function Bartilo_Quest()		
		local Remote_Check_Bartilo = CommF_("BartiloQuestProgress")

		if not Remote_Check_Bartilo.KilledBandits then
			local Quest_gui = localplayer.PlayerGui.Main.Quest

			if Quest_gui.Visible then
				local Mon = "Swan Pirate"
				local Enemy = Check_Monster(Mon)
				local QuestTitle = Quest_gui.Container.QuestTitle.Title.Text

				if not string.find(QuestTitle, Mon) then
					CommF_("AbandonQuest")
				end

				if Enemy then
					Attack(Enemy,function()
						return not _G.KaitunConfig["Start Farm"] or not Check_Monster(Mon) or not Check_Alive_Monster(Enemy) 
					end)
				else
					Go_To_Spawner(Mon,function()
						return not _G.KaitunConfig["Start Farm"]
					end)
				end
			else
				local Pos_Quest = CFrame.new(-456.28952, 73.0200958, 299.895966)
				Go_To_Position(Pos_Quest,function()
					return not _G.KaitunConfig["Start Farm"] or Distance(Pos_Quest) <= 5
				end)
				task.wait(0.5)
				CommF_("StartQuest","BartiloQuest",1)
				task.wait(0.5)
			end
		elseif not Remote_Check_Bartilo.KilledSpring then
			local Mon = "Jeremy"
			local Enemy = Check_Monster(Mon)

			if Enemy then
				Attack(Enemy,function()
					return not _G.KaitunConfig["Start Farm"] or not Check_Monster(Mon) or not Check_Alive_Monster(Enemy) 
				end)
			else
				if _G.KaitunConfig["Setting"]["Hop Server"] then
					Server_Hop("Finding Jeremy")
				end
			end
		elseif not Remote_Check_Bartilo.DidPlates then
			CommF_("BartiloQuestProgress","DidPlates")
		end
	end

	function Evo_Race_V2()
		if not Player_Data.Race:FindFirstChild("Evolved") then
			local Remote_Check_Race_V2 = CommF_("Alchemist","1")
			if Remote_Check_Race_V2 == 0 then  CommF_("Alchemist","2") end
			if not (game.Lighting.ClockTime < 18 and game.Lighting.ClockTime > 5) then
				local Flower = {
					workspace:FindFirstChild("Flower1"),
					workspace:FindFirstChild("Flower2"),
				}

				if not Check_Inventory("Flower 1") and Flower[1] and Flower[1].Transparency ~= 0 then
					Go_To_Position(Flower[1].CFrame,function()
						if Distance(Flower[1].CFrame.Position) <= 5 then
							game:service('VirtualInputManager'):SendKeyEvent(true, "Space", false, game)
							wait(0.5)
							game:service('VirtualInputManager'):SendKeyEvent(false, "Space", false, game)
						end
						return not _G.KaitunConfig["Start Farm"] or Check_Inventory("Flower 1") or Distance(Flower[1].CFrame.Position) < 5
					end)
					repeat task.wait(0.5)
						firetouchinterest(localplayer.Character.HumanoidRootPart,Flower[1],0)
					until Check_Inventory("Flower 1") or _G.KaitunConfig["Start Farm"]
				elseif not Check_Inventory("Flower 2") and Flower[2] and Flower[2].Transparency ~= 0 then
					Go_To_Position(Flower[2].CFrame,function()
						return not _G.KaitunConfig["Start Farm"] or Check_Inventory("Flower 2") or Distance(Flower[2].CFrame.Position) < 5
					end)
					repeat task.wait(0.5)
						firetouchinterest(localplayer.Character.HumanoidRootPart,Flower[2],0)
					until Check_Inventory("Flower 2") or _G.KaitunConfig["Start Farm"]
				elseif not Check_Inventory("Flower 3") then
					local Mon = "Zombie"
					local Enemy = Check_Monster(Mon)

					if Enemy then
						Attack(Enemy,function()
							return not _G.KaitunConfig["Start Farm"] or Check_Inventory("Flower 3") or not Check_Alive_Monster(Enemy) or not Check_Monster(Mon) 
						end)
					else
						Go_To_Spawner(Mon,function()
							return not _G.KaitunConfig["Start Farm"] 
						end)
					end
				elseif Check_Inventory("Flower 1") and Check_Inventory("Flower 2") and Check_Inventory("Flower 3") then
					CommF_("Alchemist","3")
				end 
			end
		end
	end

	function Change_Race()
		local Fragment = Player_Data.Fragments.Value
		if not Check_Match_Race() then
			if Fragment >= 3000 then
				DoRaid = false
				CommF_("BlackbeardReward","Reroll","1")
				CommF_("BlackbeardReward","Reroll","2")
			else
				DoRaid = true
			end
		end
	end

	function Evo_Race_V3()
		local Player_Race = Player_Data.Race.Value
		if Player_Data.Race:FindFirstChild("Evolved") then
			local Remote_Check_Race_V3 = CommF_("Wenlocktoad", "1")

			if Remote_Check_Race_V3 ~= 1 or Remote_Check_Race_V3 ~= 2 then
				CommF_("Wenlocktoad", "2")
			elseif Remote_Check_Race_V3 == 1 then
				if Player_Race == "Human" then
					CommF_("Wenlocktoad","3")
					if Check_Monster("Jeremy") then
						local Mon = "Jeremy"
						local Enemy = Check_Monster(Mon)

						if Enemy then
							Attack(Enemy,function()
								return not _G.KaitunConfig["Start Farm"] or not Check_Alive_Monster(Enemy) or Check_Monster(Mon)
							end)
						end
					elseif Check_Monster("Diamond") then
						local Mon = "Diamond"
						local Enemy = Check_Monster(Mon)

						if Enemy then
							Attack(Enemy,function()
								return not _G.KaitunConfig["Start Farm"] or not Check_Alive_Monster(Enemy) or Check_Monster(Mon)
							end)
						end
					elseif Check_Monster("Fajita") then
						local Mon = "Fajita"
						local Enemy = Check_Monster(Mon)

						if Enemy then
							Attack(Enemy,function()
								return not _G.KaitunConfig["Start Farm"] or not Check_Alive_Monster(Enemy) or Check_Monster(Mon)
							end)
						end
					end
				elseif Player_Race == "Mink" then
					local function Get_Chest()
						local humanoidRootPart = localplayer.Character:FindFirstChild("HumanoidRootPart")

						if not humanoidRootPart then return nil end

						local closestChest = nil
						local minDistance = math.huge

						for _, v in pairs(workspace.Map:GetDescendants()) do
							if v:IsA("BasePart") and v.Name:find("Chest") then
								local distance = Distance(v.Position,humanoidRootPart.Position)

								if distance < minDistance then
									minDistance = distance
									closestChest = v
									break
								end
							end
						end

						return closestChest
					end

					local Chest = Get_Chest()
					Go_To_Position(Chest.Position, function()
						return not _G.KaitunConfig["Start Farm"] or not Chest.Parent
					end)
				elseif Player_Race == "Fishman" then
				elseif Player_Race == "Fishman" then
					local function Check_Available_Boat()
						for i,v in pairs(workspace.Boats:GetChildren()) do
							if tostring(v.Owner.Value) == localplayer.Name then
								return v.VehicleSeat
							end
						end
						return false
					end
					local function Check_Sea_Beast()
						for i,v in pairs(workspace.SeaBeasts:GetChildren()) do
							if v:FindFirstChild("Humanoid") or v:FindFirstChild("HumanoidRootPart") or v.Humanoid.Health > 0 then
								return v
							end
						end
					end
					local Player_Boat = Check_Available_Boat()
					if Player_Boat then
						local Sea_Position = CFrame.new(500, 20 ,4500)
						if Check_Sea_Beast() then
							local function Dodge_Sea_Beast()
								for _, seaBeast in pairs(workspace.SeaBeasts:GetChildren()) do
									if seaBeast:FindFirstChild("Humanoid") and seaBeast:FindFirstChild("Anims") then
										local humanoid = seaBeast.Humanoid;
										local animator = humanoid:FindFirstChildOfClass("Animator") or humanoid
										for _, anim in pairs(seaBeast.Anims:GetChildren()) do
											if anim:IsA("Animation") then
												if anim.AnimationId == "rbxassetid://8708221792" or anim.AnimationId == "rbxassetid://8708222556" or anim.AnimationId == "rbxassetid://8708223619" or anim.AnimationId == "rbxassetid://8708225668" then
													for _, animationTrack in pairs(animator:GetPlayingAnimationTracks()) do
														if animationTrack.Animation.AnimationId == anim.AnimationId then
															if animationTrack.IsPlaying then
																return true
															else
																return false
															end
														end
													end
												end
											end
										end
									end
								end
							end
							repeat task.wait(0.02)
								localplayer.Character:WaitForChild("Humanoid").Sit = false
								local Sea_Beast_CFrame = Check_Sea_Beast().HumanoidRootPart.CFrame
								if not localplayer.Character:FindFirstChild("HasBuso") then
									CommF_("Buso")
								end    
								if Distance(Sea_Beast_CFrame.Position) <= 50 then
									Start_Use_All_Weapon_Skill = true
								else
									Start_Use_All_Weapon_Skill = false
								end
								Use_AimBot_Skill = true
								Aimbot_Target_Position = Sea_Beast_CFrame.Position
								if Dodge_Sea_Beast() then
									TP(Sea_Beast_CFrame * CFrame.new(0, 400, 0))
								else
									TP(Sea_Beast_CFrame * CFrame.new(0, 400, 0));
								end 
							until not _G.KaitunConfig["Start Farm"] or not Check_Sea_Beast()
							Start_Use_All_Weapon_Skill = false
							Use_AimBot_Skill = false
							Aimbot_Target_Position = nil
						else
							local Sea_Position = CFrame.new(500, 20, 4500)
							if Distance(Sea_Position.Position,Player_Boat.CFrame.Position) > 30 and localplayer.Character:WaitForChild("Humanoid").Sit then
								Boat_Tween(Sea_Position, Player_Boat)
								-- Player_Boat.CFrame = Sea_CFrame
							elseif Distance(Sea_Position.Position,Player_Boat.CFrame.Position) > 30 and not localplayer.Character:WaitForChild("Humanoid").Sit then
								Go_To_Position(Player_Boat.CFrame,function()
									return not _G.KaitunConfig["Start Farm"] or localplayer.Character:WaitForChild("Humanoid").Sit or Distance(Player_Boat.Position) < 30
								end)
							elseif Distance(Sea_Position.Position,Player_Boat.CFrame.Position) < 30 and Distance(Player_Boat.CFrame.Position) > 30 then
								Go_To_Position(Player_Boat.CFrame,function()
									return not _G.KaitunConfig["Start Farm"] or Distance(Sea_Position.Position) < 30
								end)
							end
						end
					else
						local Npc_Position = CFrame.new(94, 11, 2949)
						if Distance(Npc_Position.Position) > 30 then
							Go_To_Position(Npc_Position,function()
								return not _G.KaitunConfig["Start Farm"] or Distance(Npc_Position.Position) < 30
							end)
							CommF_("BuyBoat","Guardian")
						end
					end
				end
			end
		end
	end

	function Get_Gravity_Cane()
		local Mon = "Fajita"
		local Enemy = Check_Monster(Mon)

		if Enemy then
			Attack(Enemy,function()
				return not _G.KaitunConfig["Start Farm"] or not Check_Alive_Monster(Enemy) or not Check_Monster(Mon)
			end)
		end
	end

	function Get_Dragon_Trident()
		local Mon = "Tide Keeper"
		local Enemy = Check_Monster(Mon)

		if Enemy then
			Attack(Enemy,function()
				return not _G.KaitunConfig["Start Farm"] or not Check_Alive_Monster(Enemy) or not Check_Monster(Mon)
			end)
		end
	end

	function Get_Midnight_Blade()
		if Remote_Check_Tool("Material","Ectoplasm") >= 100 then
			CommF_("Ectoplasm","Buy",3)
		else
			local Mon = {"Ship Deckhand", "Ship Engineer", "Ship Steward", "Ship Officer"}
			local Enemy = Check_Monster(Mon)

			if Enemy then
				Attack(Enemy,function()
					return not _G.KaitunConfig["Start Farm"] or Remote_Check_Tool("Material","Ectoplasm") >= 100 or not Check_Alive_Monster(Enemy) or not Check_Monster(Mon)
				end)
			else
				Go_To_Spawner(Mon,function()
					return not _G.KaitunConfig["Start Farm"]
				end)
			end
		end
	end

	function Get_Rengoku()
		local Remote_Rengoku = CommF_("OpenRengoku")

		if not Remote_Rengoku then
			if Check_Inventory("Hidden Key") then
				repeat wait(0.5) CommF_("OpenRengoku") until not Check_Inventory("Hidden Key")
			else
				local Boss = "Awakened Ice Admiral"
				local Enemy_Boss = Check_Monster(Boss)
				if Enemy_Boss then
					Attack(Enemy_Boss,function()
						return not _G.KaitunConfig["Start Farm"] or not Check_Alive_Monster(Enemy_Boss) or not Check_Monster(Boss)
					end)
				else
					local Mon = {"Snow Lurker","Arctic Warrior"}
					local Enemy = Check_Monster(Mon)

					if Enemy then
						Attack(Enemy,function()
							return not _G.KaitunConfig["Start Farm"] or not Check_Alive_Monster(Enemy) or not Check_Monster(Mon)
						end)
					else
						Go_To_Spawner(Mon,function()
							return not _G.KaitunConfig["Start Farm"]
						end)
					end
				end
			end
		end
	end

	function Open_Library()
		if Check_Inventory("Library Key") then
			CommF_("OpenLibrary")
		else
			local Boss = "Awakened Ice Admiral"
			local Enemy = Check_Near_Mon(Boss)
			if Enemy then
				Attack(Enemy,function()
					return not _G.KaitunConfig["Start Farm"] or not Check_Alive_Monster(Enemy) or not Check_Monster(Boss)
				end)
			else
				Server_Hop("Finding Library Key")
			end
		end
	end

	function Find_Water_Key()
		if Check_Inventory("Water Key") then
			CommF_("BuySharkmanKarate", true)
		else
			local Boss = "Tide Keeper"
			local Enemy = Check_Near_Mon(Boss)
			if Enemy then
				Attack(Enemy,function()
					return not _G.KaitunConfig["Start Farm"] or not Check_Alive_Monster(Enemy) or not Check_Monster(Boss)
				end)
			else
				Server_Hop("Finding Water Key")
			end
		end
	end

	function Get_Kabucha()
		if localplayer.Data.Fragments.Value >= 1500 then
			DoRaid = false
			CommF_("BlackbeardReward", "Slingshot", "1")
			CommF_("BlackbeardReward", "Slingshot", "2")
		else
			DoRaid = true
			return
		end
	end

	function Get_TTK()
		local Beli = Player_Data.Beli.Value
		if Remote_Check_Tool("Tool", "Shizu") and Remote_Check_Tool("Tool", "Oroshi") and Remote_Check_Tool("Tool", "Saishi") then
			local Mastery_Shizu = Remote_Check_Tool("Mastery", "Shizu", 300)
			local Mastery_Oroshi = Remote_Check_Tool("Mastery", "Oroshi", 300)
			local Mastery_Saishi = Remote_Check_Tool("Mastery", "Saishi", 300)

			if not Mastery_Shizu then
				Weapon = "Sword"
				CommF_("LoadItem","Shizu")
			elseif not Mastery_Oroshi then
				Weapon = "Sword"
				CommF_("LoadItem","Oroshi")
			elseif not Mastery_Saishi then
				Weapon = "Sword"
				CommF_("LoadItem","Saishi")
			elseif Beli >= 2000000 and Mastery_Shizu and Mastery_Oroshi and Mastery_Saishi then
				Weapon = "Melee"
				CommF_("MysteriousMan","1")
				CommF_("MysteriousMan","2")
			end
		end
	end

	function Travel_To_Third_Sea()
		if CommF_("ZQuestProgress").KilledIndraBoss then
			CommF_("TravelZou")
		end

		if not CommF_("GetUnlockables").FlamingoAccess then
			local Fruits = Get_Inventory_Fruits(1000000,math.huge)
			local Cheapest = nil
			for _, v in pairs(Fruits or {}) do
				if not Cheapest or v.Value < Cheapest.Value then
					Cheapest = v
				end
			end  
			if Cheapest.Name then
				Stop_Store_Fruit = true
				task.wait(0.1)
				CommF_("LoadFruit",Cheapest.Name)
				task.wait(0.1)
				CommF_("TalkTrevor","1")
				CommF_("TalkTrevor","2")
				CommF_("TalkTrevor","3")
				task.wait(0.1)
				Stop_Store_Fruit = false
			end
		elseif not CommF_("ZQuestProgress","Check") then
			local Mon = "Don Swan"
			local Enemy = Check_Monster(Mon)

			if Enemy then
				Attack(Enemy,function()
					return not _G.KaitunConfig["Start Farm"] or not Check_Alive_Monster(Enemy) or not Check_Monster(Mon)
				end)
			else
				Server_Hop("Finding "..Mon)
			end
		elseif not CommF_("ZQuestProgress").KilledIndraBoss then
			local Mon = "Don Swan"
			local Enemy = Check_Monster(Mon)

			if Enemy then
				Attack(Enemy,function()
					return not _G.KaitunConfig["Start Farm"] or CommF_("ZQuestProgress").KilledIndraBoss or not Check_Alive_Monster(Enemy) or not Check_Monster(Mon)
				end)
			end
		end

		if CommF_("ZQuestProgress").KilledIndraBoss then
			CommF_("TravelZou")
		elseif not CommF_("ZQuestProgress").KilledIndraBoss then
			Server_Hop("Finding Fruit")
		end
	end

	function Get_Twin_Hooks()
		local Mon = "Captain Elephant"
		local Enemy = Check_Monster(Mon)

		if Enemy then
			Attack(Enemy,function()
				return not _G.KaitunConfig["Start Farm"] or not Check_Alive_Monster(Enemy) or not Check_Monster(Mon)
			end)
		end
	end

	function Get_Canvander()
		local Mon = "Beautiful Pirate"
		local Enemy = Check_Monster(Mon)

		if Enemy then
			Attack(Enemy,function()
				return not _G.KaitunConfig["Start Farm"] or not Check_Alive_Monster(Enemy) or not Check_Monster(Mon)
			end)
		end
	end

	function Get_Buddy_Sword()
		local Mon = "Cake Queen"
		local Enemy = Check_Monster(Mon)

		if Enemy then
			Attack(Enemy,function()
				return not _G.KaitunConfig["Start Farm"] or not Check_Alive_Monster(Enemy) or not Check_Monster(Mon)
			end)
		end
	end

	function Get_Serpent_Bow()
		local Mon = "Island Empress"
		local Enemy = Check_Monster(Mon)

		if Enemy then
			Attack(Enemy,function()
				return not _G.KaitunConfig["Start Farm"] or not Check_Alive_Monster(Enemy) or not Check_Monster(Mon)
			end)
		end
	end

	function Get_Hallow_Scythe()
		local Boss = "Soul Reaper"
		local Enemy_Boss = Check_Monster(Boss)

		if Enemy_Boss then
			Attack(Enemy_Boss,function()
				return not _G.KaitunConfig["Start Farm"] or not Check_Alive_Monster(Enemy_Boss) or not Check_Monster(Boss)
			end)
		elseif Check_Inventory("Hallow Essence") then
			firetouchinterest(localplayer.Character.Head, workspace.Map["Haunted Castle"].Summoner.Detection, 0)
			firetouchinterest(localplayer.Character.Head, workspace.Map["Haunted Castle"].Summoner.Detection, 1)
		elseif not Check_Inventory("Hallow Essence") and Remote_Check_Tool("Material","Bones") >= 500 then
			CommF_("Bones", "Buy", 1, 1)
		else
			local Mon = {"Posessed Mummy","Living Zombie","Reborn Skeleton","Demonic Soul"}
			local Enemy = Check_Monster(Mon)

			if Enemy then
				Attack(Enemy,function()
					return not _G.KaitunConfig["Start Farm"] or not Check_Alive_Monster(Enemy) or not Check_Monster(Mon)
				end)
			else
				Go_To_Spawner(Mon,function()
					return not _G.KaitunConfig["Start Farm"]
				end)
			end 
		end
	end

	function Do_Dough_Awaken()
		local Boss = "Dough King"
		local Enemy_Boss = Check_Monster(Boss)

		if Check_Inventory("Red Key") then
			Equip_Tool("Red Key")
			local Pos = CFrame.new(-2681.51099, 64.3663483, -12852.7773)
			if Distance(Pos.Position) < 10 then
				CommF_("CakeScientist","Check")
			else
				Go_To_Position(Pos,function()
					return not _G.KaitunConfig["Start Farm"]
				end)
			end
		elseif Enemy_Boss then
			Attack(Enemy_Boss,function()
				return not _G.KaitunConfig["Start Farm"] or not Check_Alive_Monster(Enemy_Boss) or not Check_Monster(Boss)
			end)
		elseif Check_Inventory("Sweet Chalice") then
			Max_Level_Farm("Cake Prince")
		elseif not Check_Inventory("Sweet Chalice") and Check_Inventory("God's Chalice") then
			if Remote_Check_Tool("Material","Conjured Cocoa") >= 10 then
				CommF_("SweetChaliceNpc")
			else
				local Mon = {"Cocoa Warrior","Chocolate Bar Battler","Sweet Thief","Candy Rebel"}
				local Enemy = Check_Monster(Mon)
				if Enemy then
					Attack(Enemy,function()
						return not _G.KaitunConfig["Start Farm"] or Remote_Check_Tool("Material","Conjured Cocoa") >= 10 or not Check_Alive_Monster(Enemy) or not Check_Monster(Mon)
					end)
				else
					Go_To_Spawner(Mon,function()
						return not _G.KaitunConfig["Start Farm"]
					end)
				end
			end
		elseif not Check_Inventory("God's Chalice") then
			if Check_Monster("Diablo") or Check_Monster("Deandre") or Check_Monster("Urban") then
				Elite_Hunter()
			else
				Server_Hop("Finding Elite Hunter")
			end
		end
	end

	function Attack_Dough_King()
		local Mon = "Dough King"
		local Enemy = Check_Monster(Mon)

		if Enemy then
			Attack(Enemy,function()
				return not _G.KaitunConfig["Start Farm"] or not Check_Alive_Monster(Enemy) or not Check_Monster(Mon)
			end)
		end
	end

	function Attack_Rip_Indra()
		local Mon = "rip_indra True Form"
		local Enemy = Check_Monster(Mon)

		if Enemy then
			Attack(Enemy,function()
				return not _G.KaitunConfig["Start Farm"] or not Check_Alive_Monster(Enemy) or not Check_Monster(Mon)
			end)
		end
	end

	function Elite_Hunter()
		local Mon = {"Diablo", "Deandre", "Urban"}
		local Enemy = Check_Monster(Mon)

		if Enemy then
			Attack(Enemy,function()
				return not _G.KaitunConfig["Start Farm"] or not Check_Alive_Monster(Enemy) or not Check_Monster(Mon)
			end)
		else
			Go_To_Spawner(Mon,function()
				return not _G.KaitunConfig["Start Farm"]
			end)
		end
	end

	function Get_Tushita()
		if Tushita_Quest.OpenedDoor and not Tushita_Quest.KilledLongma then
			local Mon = "Longma"
			local Enemy = Check_Monster(Mon)

			if Enemy then
				Attack(Enemy,function()
					return not _G.KaitunConfig["Start Farm"] or not Check_Alive_Monster(Enemy) or not Check_Monster(Mon)
				end)
			else
				Server_Hop("Finding "..Mon)
			end
		elseif not Tushita_Quest.OpenedDoor then
			if Check_Monster("rip_indra True Form") then
				Go_To_Position(workspace.Map.Waterfall.SecretRoom.Room.Door.Door.Hitbox.CFrame,function()
					return Check_Inventory("Holy Torch") or _G.KaitunConfig["Start Farm"] or Distance(workspace.Map.Waterfall.SecretRoom.Room.Door.Door.Hitbox.Position) < 3 
				end)
				Equip_Tool("Holy Torch")
				for i = 1,5 do
					CommF_("TushitaProgress","Torch",i)
				end
			else
				local function Color_Path_Check()
					local OpenAll = 0
					for i,v in pairs(game:GetService("Workspace").Map["Boat Castle"].Summoner.Circle:GetChildren()) do
						if v:IsA("Part") then
							if v:FindFirstChild("Part") and v:FindFirstChild("Part").BrickColor == BrickColor.new("Lime green") then
								OpenAll = OpenAll + 1
							end
						end
					end
					return OpenAll == 3
				end
				local Is_Color_All_Path = Color_Path_Check()
				if Is_Color_All_Path then
					if Check_Inventory("God's Chalice") then
						Equip_Tool("God's Chalice")
						Go_To_Position(workspace.Map["Boat Castle"].Summoner.Detection.CFrame,function()
							return not Check_Inventory("God's Chalice") or not _G.KaitunConfig["Start Farm"] or Distance(workspace.Map["Boat Castle"].Summoner.Detection.Position) < 3 
						end)
						firetouchinterest(localplayer.Character.HumanoidRootPart, workspace.Map["Boat Castle"].Summoner.Detection, 0)
						firetouchinterest(localplayer.Character.HumanoidRootPart, workspace.Map["Boat Castle"].Summoner.Detection, 1)
					else
						repeat wait(0.5)
							return Elite_Hunter()
						until not _G.KaitunConfig["Start Farm"] or not Is_Color_All_Path or Check_Inventory("God's Chalice") or Check_Monster("rip_indra True Form")
					end
				else
					repeat wait()
						Server_Hop("Finding Toggle Color Path Server")
					until Is_Color_All_Path or not _G.KaitunConfig["Start Farm"]
				end
			end
		end
	end

	function Get_Musketeer_Hat()
		local Level = Player_Data.Level.Value
		local CitizenQuestProgress = CommF_("CitizenQuestProgress")
		if CitizenQuestProgress.KilledBandits == false then
			if string.find(localplayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Forest Pirate") and string.find(localplayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "50") then
				local Mon = "Forest Pirate"
				local Enemy = Check_Monster(Mon)

				if Enemy then
					Attack(Enemy,function()
						return not _G.KaitunConfig["Start Farm"] or not Check_Alive_Monster(Enemy) or not Check_Monster(Mon)
					end)
				else
					Go_To_Spawner(Mon,function()
						return not _G.KaitunConfig["Start Farm"]
					end)
				end
			else
				CommF_("StartQuest","CitizenQuest",1)
			end
		elseif CitizenQuestProgress.KilledBoss == false then
			if string.find(localplayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Captain Elephant") and localplayer.PlayerGui.Main.Quest.Visible == true then
				local Mon = "Captain Elephant"
				local Enemy = Check_Monster(Mon)

				if Enemy then
					Attack(Enemy,function()
						return not _G.KaitunConfig["Start Farm"] or not Check_Alive_Monster(Enemy) or not Check_Monster(Mon)
					end)
				else
					Go_To_Spawner(Mon,function()
						return not _G.KaitunConfig["Start Farm"]
					end)
				end
			else
				CommF_("StartQuest","CitizenQuest",2)
			end
		elseif CommF_("CitizenQuestProgress","Citizen") == 2 then
			Go_To_Position(CFrame.new(-12512.138671875, 340.39279174805, -9872.8203125),function()
				return not _G.KaitunConfig["Start Farm"] or Check_Inventory("Musketeer Hat")
			end)
		end
	end

	function Max_Level_Farm(Value,Manual_Weapon)
		if Value == "Bone" then
			local Mon = {"Posessed Mummy","Living Zombie","Reborn Skeleton","Demonic Soul"}
			local Enemy = Check_Monster(Mon)

			if Enemy then
				Attack(Enemy,function()
					return not _G.KaitunConfig["Start Farm"] or not Check_Alive_Monster(Enemy) or not Check_Monster(Mon)
				end,Manual_Weapon)
			else
				Go_To_Spawner(Mon,function()
					return not _G.KaitunConfig["Start Farm"]
				end)
			end
		elseif Value == "Cake Prince" then
			local Remote_Cake_Prince = CommF_("CakePrinceSpawner")
			if string.find(Remote_Cake_Prince, "Do you want to open") then
				CommF_("CakePrinceSpawner")
			end
			local Boss = "Cake Prince"
			local Enemy_Boss = Check_Monster(Boss)
			if Enemy_Boss then
				Attack(Enemy_Boss,function()
					return not _G.KaitunConfig["Start Farm"] or not Check_Alive_Monster(Enemy_Boss) or not Check_Monster(Boss)
				end,Manual_Weapon)
			else
				local Mon = {"Baking Staff", "Head Baker", "Cake Guard", "Cookie Crafter"}
				local Enemy = Check_Monster(Mon)
				if Enemy then
					Attack(Enemy,function()
						return not _G.KaitunConfig["Start Farm"] or Check_Monster(Boss) or not Check_Alive_Monster(Enemy) or not Check_Monster(Mon)
					end,Manual_Weapon)
				else
					Go_To_Spawner(Mon,function()
						return not _G.KaitunConfig["Start Farm"]
					end)
				end
			end
		elseif Value == "Cocoa" then
			local Mon = {"Cocoa Warrior","Chocolate Bar Battler","Sweet Thief","Candy Rebel"}
			local Enemy = Check_Monster(Mon)

			if Enemy then
				Attack(Enemy,function()
					return not _G.KaitunConfig["Start Farm"] or not Check_Alive_Monster(Enemy) or not Check_Monster(Mon)
				end,Manual_Weapon)
			else
				Go_To_Spawner(Mon,function()
					return not _G.KaitunConfig["Start Farm"]
				end)
			end
		end
	end

	function Get_Cursed_Dual_Katana()
		local function Check_Mastery_Yama_Tushita()
			local Mastery_Yama = Remote_Check_Tool("Mastery", "Yama", 300)
			local Mastery_Tushita = Remote_Check_Tool("Mastery", "Tushita", 300)
			if not Mastery_Yama then
				return Max_Level_Farm("Bone")
			elseif not Mastery_Tushita then
				return Max_Level_Farm("Cake Prince")
			end
			return Mastery_Yama and Mastery_Tushita
		end
		local Is_Ready_To_Get_Cursed_Dual_Katana = Check_Mastery_Yama_Tushita()
		if Is_Ready_To_Get_Cursed_Dual_Katana then
			local Is_Door_Open = CommF_("CDKQuest","OpenDoor") == 'opened'
			if not Is_Door_Open then
				CommF_("CDKQuest","OpenDoor",true)
			end

			if Is_Door_Open then
				if CDK_Quest['Evil'] == 0 or CDK_Quest['Evil'] == -3 then
					if CDK_Quest['Evil'] == 0 then
						CommF_("CDKQuest","Progress","Evil")
						CommF_("CDKQuest","StartTrial","Evil")
					elseif CDK_Quest['Evil'] == -3 then
						local Mon = "Mythological Pirate"
						local Enemy = Check_Monster(Mon)
						if Enemy then
							Go_To_Position(Enemy.HumanoidRootPart.CFrame * CFrame.new(0,0,-2),function()
								return not _G.KaitunConfig["Start Farm"] or not Check_Alive_Monster(Enemy) or CDK_Quest['Evil'] ~= -3
							end)
						else
							Go_To_Spawner(Mon,function()
								return not _G.KaitunConfig["Start Farm"]
							end)
						end
					end
				elseif CDK_Quest['Evil'] == 1 or CDK_Quest['Evil'] == -4 then
					if CDK_Quest['Evil'] == 1 then
						CommF_("CDKQuest","Progress","Evil")
						CommF_("CDKQuest","StartTrial","Evil")
					elseif CDK_Quest['Evil'] == -4 then
						local function Quest_Haze_Mon()
							for i,v in pairs(localplayer.QuestHaze:GetChildren()) do 
								if v.Value > 0 then
									return v.Name
								end
							end
							return false
						end

						local Mon = Quest_Haze_Mon()
						local Enemy = Check_Monster(Mon)
						if Enemy then
							Attack(Enemy,function()
								return not _G.KaitunConfig["Start Farm"] or not Check_Alive_Monster(Enemy) or not Check_Monster(Mon)
							end)
						else
							Go_To_Spawner(Mon,function()
								return not _G.KaitunConfig["Start Farm"]
							end)
						end
					end
				elseif CDK_Quest['Evil'] == 2 or CDK_Quest['Evil'] == -5 then
					if CDK_Quest['Evil'] == 2 then
						CommF_("CDKQuest","Progress","Evil")
						CommF_("CDKQuest","StartTrial","Evil")
					elseif CDK_Quest['Evil'] == -5 then
						local HellDimension = workspace.Map:FindFirstChild('HellDimension')
						if HellDimension then
							if Distance(HellDimension.WorldPivot.Position) <= 1200 then
								local Mon = {"Cursed Skeleton","Hell's Messenger"}       
								local Enemy = Check_Monster(Mon)
								local function HellDimension_Torch()
									local Torch = {
										HellDimension:FindFirstChild("Torch1"),
										HellDimension:FindFirstChild("Torch2"),
										HellDimension:FindFirstChild("Torch3")
									}

									for _, torch in pairs(Torch) do
										repeat
											task.wait(.5)
											TP(torch.CFrame)
										until not _G.KaitunConfig["Start Farm"] or Check_Monster(Mon) or Distance(torch.CFrame.Position) < 3 or not workspace.Map:FindFirstChild('HellDimension') or CDK_Quest['Evil'] ~= -5
										wait(.5)
										fireproximityprompt(torch.ProximityPrompt, math.huge)
										wait(.5)
									end
									Go_To_Position(HellDimension.Exit.CFrame, function()
										return not _G.KaitunConfig["Start Farm"] or not workspace.Map:FindFirstChild('HellDimension') or Distance(HellDimension.Exit.CFrame.Position) < 3 or CDK_Quest['Evil'] ~= -5
									end)
								end

								if Enemy and Distance(Enemy.HumanoidRootPart.CFrame) < 1500 then
									Attack(Enemy,function()
										return not _G.KaitunConfig["Start Farm"] or not Check_Alive_Monster(Enemy) or not Check_Monster(Mon)
									end)
								else
									HellDimension_Torch()
								end
							end
						else
							local Boss = "Soul Reaper"
							local Enemy_Boss = Check_Monster(Boss)
							if Enemy_Boss then
								Go_To_Position(Enemy_Boss.HumanoidRootPart.CFrame * CFrame.new(0, 0, -2),function()
									return not _G.KaitunConfig["Start Farm"] or workspace.Map:FindFirstChild('HellDimension') or not Check_Alive_Monster(Enemy_Boss) or not Check_Monster(Boss)
								end)
							else
								if Check_Monster("Hallow Essence") then
									firetouchinterest(localplayer.Character.Head, workspace.Map["Haunted Castle"].Summoner.Detection, 0)
									firetouchinterest(localplayer.Character.Head, workspace.Map["Haunted Castle"].Summoner.Detection, 1)
								elseif Bone_Check > 0 and Check_Total_Material('Bones') > 500 then
									CommF_("Bones", "Buy", 1, 1) 
								else 
									Max_Level_Farm("Bone")
								end
							end
						end
					end 
				elseif CDK_Quest['Good'] == 0 or CDK_Quest['Good'] == -3 then
					if CDK_Quest['Good'] == 0 then
						CommF_("CDKQuest","Progress","Good")
						CommF_("CDKQuest","StartTrial","Good")
					elseif CDK_Quest['Good'] == -3 then 
						local P1_Position = CFrame.new(-4600.37, 15.1245, -2881.18)
						local P2_Position = CFrame.new(-2068.63, 3.37222, -9887.08)
						local P3_Position = CFrame.new(-9531.19, 5.91675, -8377.75)
						if not P1_Clear then
							Go_To_Position(P1_Position,function()
								return not _G.KaitunConfig["Start Farm"] or CDK_Quest['Good'] ~= -3 or Distance(P1_Position.Position) < 3
							end)
							if Distance(P1_Position.Position) < 10 then
								wait(1)
								if workspace.NPCs:FindFirstChild("Luxury Boat Dealer") and localplayer.Character.Humanoid.Health > 0 then
									CommF_("CDKQuest", "BoatQuest", workspace.NPCs:FindFirstChild("Luxury Boat Dealer")) 
									P1_Clear = true
								end
							end
						elseif not P2_Clear then
							Go_To_Position(P2_Position,function()
								return not _G.KaitunConfig["Start Farm"] or CDK_Quest['Good'] ~= -3 or Distance(P2_Position.Position) < 3
							end)
							if Distance(P2_Position.Position) < 10 then
								wait(1)
								if workspace.NPCs:FindFirstChild("Luxury Boat Dealer") and localplayer.Character.Humanoid.Health > 0 then
									CommF_("CDKQuest", "BoatQuest", workspace.NPCs:FindFirstChild("Luxury Boat Dealer")) 
									P2_Clear = true
								end
							end
						elseif not P3_Clear then
							Go_To_Position(P3_Position,function()
								return not _G.KaitunConfig["Start Farm"] or CDK_Quest['Good'] ~= -3 or Distance(P3_Position.Position) < 3
							end)
							if Distance(P3_Position.Position) < 10 then
								wait(1)
								if workspace.NPCs:FindFirstChild("Luxury Boat Dealer") and localplayer.Character.Humanoid.Health > 0 then
									CommF_("CDKQuest", "BoatQuest", workspace.NPCs:FindFirstChild("Luxury Boat Dealer")) 
									P3_Clear = true
								end
							end
						end
					end
				elseif CDK_Quest['Good'] == 1 or CDK_Quest['Good'] == -4 then
					if CDK_Quest['Good'] == 1 then
						CommF_("CDKQuest", "Progress", "Good")
						CommF_("CDKQuest", "StartTrial", "Good")
					elseif CDK_Quest['Good'] == -4 then
						local Sea_Castle_CFrame = CFrame.new(-5036, 315, -3179)
						if Distance(Sea_Castle_CFrame.Position) < 1500 then
							for _, enemy in pairs(workspace.Enemies:GetChildren()) do
								if Check_Alive_Monster(enemy) then
									if Distance(enemy.HumanoidRootPart.Position) <= 1500 then
										Attack(enemy, function()
											return not _G.KaitunConfig["Start Farm"] or not Check_Alive_Monster(enemy) or CDK_Quest['Good'] ~= -4
										end)
									end
								end
							end
						else
							Go_To_Position(Sea_Castle_CFrame,function()
								return not _G.KaitunConfig["Start Farm"] or CDK_Quest['Good'] ~= -4 or Distance(Sea_Castle_CFrame.Position) < 1500
							end)
						end
					end
				elseif CDK_Quest['Good'] == 2 or CDK_Quest['Good'] == -5 then
					if CDK_Quest['Good'] == 2 then
						CommF_("CDKQuest", "Progress", "Good")
						CommF_("CDKQuest", "StartTrial", "Good")
					elseif CDK_Quest['Good'] == -5 then
						local HeavenlyDimension = workspace.Map:FindFirstChild('HeavenlyDimension')
						if HeavenlyDimension then
							if Distance(HeavenlyDimension.WorldPivot.Position) <= 1200 then
								local Mon = {"Cursed Skeleton","Heaven's Guardian"}
								local Enemy = Check_Monster(Mon)
								local function HeavenlyDimension_Torch()
									local Torch = {
										HeavenlyDimension:FindFirstChild("Torch1"),
										HeavenlyDimension:FindFirstChild("Torch2"),
										HeavenlyDimension:FindFirstChild("Torch3")
									}

									for _, torch in pairs(Torch) do
										repeat
											task.wait(.5)
											TP(torch.CFrame)
										until not _G.KaitunConfig["Start Farm"] or Check_Monster(Mon) or Distance(torch.CFrame.Position) < 3 or not workspace.Map:FindFirstChild('HeavenlyDimension') or CDK_Quest['Good'] ~= -5
										wait(.5)
										fireproximityprompt(torch.ProximityPrompt, math.huge)
										wait(.5)
									end
									Go_To_Position(HeavenlyDimension.Exit.CFrame, function()
										return not _G.KaitunConfig["Start Farm"] or not workspace.Map:FindFirstChild('HeavenlyDimension') or Distance(HeavenlyDimension.Exit.CFrame.Position) < 3 or CDK_Quest['Good'] ~= -5
									end)
								end
								if Enemy and Distance(Enemy.HumanoidRootPart.CFrame) < 1500 then
									Attack(Enemy,function()
										return not _G.KaitunConfig["Start Farm"] or not Check_Alive_Monster(Enemy) or not Check_Monster(Mon)
									end)
								else
									HeavenlyDimension_Torch()
								end
							end
						else
							local Boss = "Cake Queen"
							local Enemy_Boss = Check_Monster(Boss)
							if Enemy_Boss then
								Attack(Enemy_Boss,function()
									return not _G.KaitunConfig["Start Farm"] or workspace.Map:FindFirstChild('HeavenlyDimension') or not Check_Alive_Monster(Enemy_Boss) or not Check_Monster(Boss)
								end)
							else
								Server_Hop("Finding "..Boss)
							end
						end
					end
				elseif CDK_Quest['Good'] == 3 then
					print("Exotic Good")
					CommF_("CDKQuest", "Progress", "Good")
					CommF_("CDKQuest", "StartTrial", "Good")
					Server_Hop("reseting CDKQuest Good")
				elseif CDK_Quest['Evil'] == 3 then
					print("Exotic Evil")
					CommF_("CDKQuest", "Progress", "Evil")
					CommF_("CDKQuest", "StartTrial", "Evil")
					Server_Hop("reseting CDKQuest Evil")
				elseif CDK_Quest['Good'] == 4 and CDK_Quest['Evil'] == 4 then
					local Mon = {"Cursed Skeleton Boss","Cursed Skeleton"}
					local Enemy = Check_Monster(Mon)

					if Enemy then
						Attack(Enemy,function()
							return not _G.KaitunConfig["Start Farm"] or Remote_Check_Tool("Tool","Cursed Dual Katana") or not Check_Alive_Monster(Enemy) or not Check_Monster(Mon)
						end)
					elseif workspace.Map.Turtle.Cursed.BossDoor.Position.Y <= 584 then
						local Boss_CFrame = CFrame.new(-12253.5419921875, 598.8999633789062, -6546.8388671875)
						repeat task.wait(.1)
							Tween(Boss_CFrame)
						until not _G.KaitunConfig["Start Farm"] or Distance(Boss_CFrame.Position) < 5 or Check_Monster(Mon)
					elseif workspace.Map.Turtle.Cursed.BossDoor.Position.Y > 584 then
						local targetCFrame = CFrame.new(-12361.7060546875, 603.3547973632812, -6550.5341796875)
						Go_To_Position(targetCFrame, function()
							return not _G.KaitunConfig["Start Farm"] or Distance(targetCFrame.Position) < 5
						end)
						wait(.5)
						if Distance(targetCFrame.Position) < 5 then
							game:GetService'VirtualUser':CaptureController()
							game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
							wait(.5)
							game:service('VirtualInputManager'):SendKeyEvent(true, "E", false, game)
							wait(.5)
							game:service('VirtualInputManager'):SendKeyEvent(false, "E", false, game)
							wait(.5)
						end
					end
				end
			end
		end
	end

	function Get_Soul_Guitar()
		local Bones = Remote_Check_Tool("Material","Bones")
		local Ectoplasm = Remote_Check_Tool("Material","Ectoplasm")
		local DarkFragment = Remote_Check_Tool("Material","Dark Fragment")

		if Bones >= 500 and Ectoplasm >= 250 and DarkFragment >= 1 then
			if not ThirdSea then return CommF_("TravelZou") end
			if Check_Moon_Phase() == "Full Moon" then
				if (CFrame.new(-9681.458984375, 6.139880657196045, 6341.3720703125).Position - localplayer.Character.HumanoidRootPart.Position).Magnitude <= 3000 then
					if game:GetService("Workspace").Map["Haunted Castle"].Candle1.Transparency == 0 then
						local GuitarPuzzle = CommF_("GuitarPuzzleProgress", "Check")
						if not GuitarPuzzle then 
							local GraveStone = CommF_("gravestoneEvent", 2)
							if GraveStone == true then
								CommF_("gravestoneEvent", 2, true)
							else 
								if _G.KaitunConfig["Setting"]["Hop Server"] then
									Server_Hop("Soul Guitar Progress")
								end
							end
						end
						if GuitarPuzzle then
							local Swamp = GuitarProgress.Swamp
							local GraveStone = GuitarProgress.Gravestones
							local Ghost = GuitarProgress.Ghost
							local Trophies = GuitarProgress.Trophies
							local Pipes = GuitarProgress.Pipes
							local CraftedOnce = GuitarProgress.CraftedOnce
							if not Swamp then
								local Pos_Quest = CFrame.new(-10141.462890625, 138.6524658203125, 5935.06298828125)

								Go_To_Position(Pos_Quest,function()
									return not _G.KaitunConfig["Start Farm"] or Distance(Pos_Quest) <= 5
								end)

								local Mon = "Living Zombie"
								local Enemy = Check_Monster(Mon)

								if Enemy then
									Attack(Enemy,function()
										return not _G.KaitunConfig["Start Farm"] or not Check_Alive_Monster(Enemy) or not Check_Monster(Mon)
									end)
								else
									Go_To_Spawner(Mon,function()
										return not _G.KaitunConfig["Start Farm"]
									end)
								end
							end
							if Swamp and not GraveStone then
								CommF_("GuitarPuzzleProgress", "Gravestones")
							elseif Swamp and GraveStone and not Ghost then
								CommF_("GuitarPuzzleProgress", "Ghost")
							elseif Swamp and GraveStone and Ghost and not Trophies then
								CommF_("GuitarPuzzleProgress", "Trophies")
							elseif Swamp and Gravestone and Ghost and Trophies and not Pipes then
								CommF_("GuitarPuzzleProgress", "Pipes")
							end
						end
					else
						if string.find(CommF_("gravestoneEvent",2), "Error") then
							local Pos_Quest = CFrame.new(-8653.2060546875, 140.98487854003906, 6160.033203125)

							Go_To_Position(Pos_Quest,function()
								return not _G.KaitunConfig["Start Farm"] or Distance(Pos_Quest) <= 5
							end)
						elseif string.find(CommF_("gravestoneEvent",2), "Nothing") then
							print("Nothing")
						else
							CommF_("gravestoneEvent",2,true)
						end
					end
				else
					local Pos_Quest = CFrame.new(-9681.458984375, 6.139880657196045, 6341.3720703125)

					Go_To_Position(Pos_Quest,function()
						return not _G.KaitunConfig["Start Farm"] or Distance(Pos_Quest) <= 5
					end)
				end
			elseif Check_Moon_Phase() == "Full Moon Next Night" then
				Debug("Waiting for Full Moon...")
			else
				Server_Hop("Find Full Moon Server") 
			end
		else   
			if Ectoplasm <= 250 then
				if SecondSea then
					local Mon = {"Ship Deckhand","Ship Engineer","Ship Steward","Ship Officer"}
					local Enemy = Check_Monster(Mon)

					if Enemy then
						Attack(Enemy,function()
							return not _G.KaitunConfig["Start Farm"] or not Check_Alive_Monster(Enemy) or not Check_Monster(Mon)
						end)
					else
						Go_To_Spawner(Mon,function()
							return not _G.KaitunConfig["Start Farm"]
						end)
					end
				else
					CommF_("TravelDressrosa")
				end
			elseif DarkFragment <= 1 then
				if SecondSea then
					local Mon = "Darkbeard"
					local Enemy = Check_Monster(Mon)

					if Enemy then
						Attack(Enemy,function()
							return not _G.KaitunConfig["Start Farm"] or not Check_Alive_Monster(Enemy) or not Check_Monster(Mon)
						end)
					end
				else
					CommF_("TravelDressrosa")
				end
			elseif Bones <= 500 then
				if ThirdSea then
					local Mon = {"Posessed Mummy","Living Zombie","Reborn Skeleton","Demonic Soul"}
					local Enemy = Check_Monster(Mon)

					if Enemy then
						Attack(Enemy,function()
							return not _G.KaitunConfig["Start Farm"] or not Check_Alive_Monster(Enemy) or not Check_Monster(Mon)
						end)
					else
						Go_To_Spawner(Mon,function()
							return not _G.KaitunConfig["Start Farm"]
						end)
					end
				else
					CommF_("TravelZou")
				end
			end
		end
	end

	function Kill_Pirates_Raid()
		if Pirate_Raid then
			local Pos_Quest = CFrame.new(-5539.3115234375, 313.800537109375, -2972.372314453125)
			if Distance(Pos_Quest.Position) < 1500 then
				for _, enemy in pairs(workspace.Enemies:GetChildren()) do
					if Check_Alive_Monster(enemy) then
						if Distance(enemy.HumanoidRootPart.Position) <= 1500 then					
							Attack(enemy, function()
								return not _G.KaitunConfig["Start Farm"] or not Pirate_Raid or not Check_Alive_Monster(enemy)
							end)
						end
					end
				end
			else
				Go_To_Position(Pos_Quest, function()
					return not _G.KaitunConfig["Start Farm"] or not Pirate_Raid or Distance(Pos_Quest.Position) < 1500
				end)
			end
		end
	end

	function Get_Rainbow_Haki()
		local ListBossRainBow = {
			[1] = "Stone",
			[2] = "Island Empress",
			[3] = "Kilo Admiral",
			[4] = "Captain Elephant",
			[5] = "Beautiful Pirate"
		}

		local Quest_gui = localplayer.PlayerGui.Main.Quest

		if Quest_gui.Visible then
			for i,v in pairs(ListBossRainBow) do
				if string.find(localplayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text,v) then
					Name_Mon = v
				end
			end

			if Name_Mon then
				local Enemy = Check_Monster(Name_Mon)
				if Enemy then
					Attack(Enemy,function()
						return not _G.KaitunConfig["Start Farm"] or not Check_Alive_Monster(Enemy) or not Check_Monster(Name_Mon)
					end)
				else
					Server_Hop("Finding "..Name_Mon)
				end
			end
		else
			CommF_("HornedMan","Bet")
		end
	end

	function Get_Godhuman()
		local function check_and_buy(tool_name, mastery_var, mastery_level)
			if not mastery_var then
				if Check_Inventory(tool_name) then
					if Remote_Check_Tool("Mastery",tool_name, mastery_level) then
						return true
					else
						return Max_Level_Farm(_G.KaitunConfig["Setting"]["Farm When Lvl Max"])
					end
				else
					CommF_("Buy" .. tool_name:gsub(" ", ""))
					return
				end
			end
			return mastery_var
		end

		Superhuman_Mastery = check_and_buy("Superhuman", Superhuman_Mastery, 400)
		if not Superhuman_Mastery then return end

		Death_Step_Mastery = check_and_buy("Death Step", Death_Step_Mastery, 400)
		if not Death_Step_Mastery then return end

		Sharkman_Karate_Mastery = check_and_buy("Sharkman Karate", Sharkman_Karate_Mastery, 400)
		if not Sharkman_Karate_Mastery then return end

		ElecticClaw_Mastery = check_and_buy("Electric Claw", ElecticClaw_Mastery, 400)
		if not ElecticClaw_Mastery then return end

		Dragon_Talon_Mastery = check_and_buy("Dragon Talon", Dragon_Talon_Mastery, 400)
		if not Dragon_Talon_Mastery then return end

		local God_Human_Remote = CommF_("BuyGodhuman", true)
		local Player_Fragment = Player_Data.Fragments.Value
		local Player_Beli = Player_Data.Beli.Value
		if God_Human_Remote == 0 then
			if Player_Fragment >= 5000 then
				DoRaid = false
				if Player_Beli >= 5000000 then
					CommF_("BuyGodhuman")
					HasGodhuman = true
				end
			else
				DoRaid = true
				return true
			end
		else
			local materials = {
				["Fish Tail"] = {required = 20, flag = "GetFishTail"},
				["Magma Ore"] = {required = 20, flag = "GetMagmaOre"},
				["Mystic Droplet"] = {required = 10, flag = "GetMysticDroplet"},
				["Dragon Scale"] = {required = 10, flag = "GetDragonScale"}
			}

			local GetFishTail, GetMagmaOre, GetMysticDroplet, GetDragonScale = false, false, false, false
			for material, data in pairs(materials) do
				if Remote_Check_Tool("Material",material) >= data.required then
					if data.flag == "GetFishTail" then 
						GetFishTail = true
					elseif data.flag == "GetMagmaOre" then 
						GetMagmaOre = true
					elseif data.flag == "GetMysticDroplet" then 
						GetMysticDroplet = true
					elseif data.flag == "GetDragonScale" then 
						GetDragonScale = true
					end
				end
			end

			local Mon
			if not GetFishTail then
				if not ThirdSea then CommF_("TravelZou") end
				Mon = {"Fishman Raider", "Fishman Captain"}
			elseif GetFishTail and not GetMagmaOre then
				if not SecondSea then CommF_("TravelDressrosa") end
				Mon = {"Magma Ninja", "Lava Pirate"}
			elseif GetFishTail and GetMagmaOre and not GetMysticDroplet then
				if not SecondSea then CommF_("TravelDressrosa") end
				Mon = {"Water Fighter", "Sea Soldier"}
			elseif GetFishTail and GetMagmaOre and GetMysticDroplet and not GetDragonScale then
				if not ThirdSea then CommF_("TravelZou") end
				Mon = {"Dragon Crew Archer", "Dragon Crew Warrior"}
			end

			local Enemy = Check_Monster(Mon)
			if Enemy then
				Attack(Enemy,function()
					return not _G.KaitunConfig["Start Farm"] or not Check_Alive_Monster(Enemy) or not Check_Monster(Mon)
				end)
			else
				Go_To_Spawner(Mon,function()
					return not _G.KaitunConfig["Start Farm"]
				end)
			end
		end
	end 

	function Get_Shark_Anchor()
		local function Check_Available_Boat()
			for i,v in pairs(workspace.Boats:GetChildren()) do
				if tostring(v.Owner.Value) == localplayer.Name then
					return v.VehicleSeat
				end
			end
			return false
		end

		local function Check_Terror_Shark()
			for i,v in pairs(workspace.Enemies:GetChildren()) do
				if v.Name == "Terrorshark" and Check_Alive_Monster(v) then
					return v
				end
			end
			return false
		end

		local function Check_Piranha()
			for i,v in pairs(workspace.Enemies:GetChildren()) do
				if v.Name == "Piranha" and Check_Alive_Monster(v) then
					return v
				end
			end
			return false
		end

		local function Check_Shark()
			for i,v in pairs(workspace.Enemies:GetChildren()) do
				if v.Name == "Shark" and Check_Alive_Monster(v) then
					return v
				end
			end
			return false
		end

		local function Check_Enemy_Boat()
			for i,v in pairs(workspace.Enemies:GetChildren()) do
				if (v.Name == "FishBoat" or v.Name == "PirateBrigade" or v.Name == "PirateGrandBrigade") and v.Health.Value > 0 then
					return v
				end
			end
			return false
		end

		local function Check_Sea_Beast()
			for i,v in pairs(workspace.SeaBeasts:GetChildren()) do
				if v:FindFirstChild("Humanoid") or v:FindFirstChild("HumanoidRootPart") or v.Humanoid.Health > 0 then
					return v
				end
			end
		end

		local Player_Boat = Check_Available_Boat()
		local Npc_Position = CFrame.new(-6044.32031, 15.1150599, -2038.65674, 0.363744795, -0, -0.931498647, 0, 1, -0, 0.931498647, 0, 0.363744795)
		local Sea_Position = CFrame.new(-44541.7617, 30.0003204, -1244.8584, -0.0844199061, -0.00553312758, 0.9964149, -0.0654025897, 0.997858942, 2.02319411e-10, -0.99428153, -0.0651681125, -0.0846010372)

		if Player_Boat then
			local Found_Terror_Shark = Check_Terror_Shark()
			local Found_Piranha = Check_Piranha()
			local Found_Shark = Check_Shark()
			local Found_Enemy_Boat = Check_Enemy_Boat()
			local Found_Sea_Beast = Check_Sea_Beast()
			local Total_Terror_Eyes = Remote_Check_Tool("Material","Terror Eyes")
			local Total_Electric_Wings = Remote_Check_Tool("Material","Electric Wing")
			local Total_Shark_Tooth = Remote_Check_Tool("Material","Shark Tooth")
			local Total_Fool_Gold = Remote_Check_Tool("Material","Fool's Gold")
			local Check_Monster_Magnet = Remote_Check_Tool("Tool","Monster Magnet")

			if Check_Monster_Magnet and (Total_Terror_Eyes >= 2 and Total_Electric_Wings >= 8 and Total_Fool_Gold >= 20 and Total_Shark_Tooth >= 10) then
				CommF_("CraftItem","Check","MonsterMagnet")
				CommF_("CraftItem","Craft","MonsterMagnet")
				CommF_("CraftItem","Check","SharkAnchor")
				CommF_("CraftItem","Craft","SharkAnchor")
			end

			if Found_Terror_Shark then
				localplayer.Character:WaitForChild("Humanoid").Sit = false
				Attack(Found_Terror_Shark,function()
					return not _G.KaitunConfig["Start Farm"] or not Check_Alive_Monster(Found_Terror_Shark) or not Check_Terror_Shark()
				end)
			elseif Found_Piranha then
				localplayer.Character:WaitForChild("Humanoid").Sit = false
				Attack(Found_Piranha,function()
					return not _G.KaitunConfig["Start Farm"] or not Check_Alive_Monster(Found_Piranha) or not Check_Piranha()
				end)
			elseif Found_Shark then
				localplayer.Character:WaitForChild("Humanoid").Sit = false
				Attack(Found_Shark,function()
					return not _G.KaitunConfig["Start Farm"] or not Check_Alive_Monster(Found_Shark) or not Check_Shark()
				end)
			elseif Found_Enemy_Boat then
				localplayer.Character:WaitForChild("Humanoid").Sit = false
				repeat task.wait(0.02)
					local Enemy_Boat_CFrame = Check_Enemy_Boat().Engine.CFrame
					if not localplayer.Character:FindFirstChild("HasBuso") then
						CommF_("Buso")
					end    
					if Distance(Enemy_Boat_CFrame.Position) <= 50 then
						Start_Use_All_Weapon_Skill = true
					else
						Start_Use_All_Weapon_Skill = false
					end
					Use_AimBot_Skill = true
					Aimbot_Target_Position = Enemy_Boat_CFrame * CFrame.new(0, (-15), 0)
					TP(Enemy_Boat_CFrame)
				until not _G.KaitunConfig["Start Farm"] or not Check_Enemy_Boat()
				Start_Use_All_Weapon_Skill = false
				Use_AimBot_Skill = false
				Aimbot_Target_Position = nil
			elseif Found_Sea_Beast then
				local function Dodge_Sea_Beast()
					for _, seaBeast in pairs(workspace.SeaBeasts:GetChildren()) do
						if seaBeast:FindFirstChild("Humanoid") and seaBeast:FindFirstChild("Anims") then
							local humanoid = seaBeast.Humanoid;
							local animator = humanoid:FindFirstChildOfClass("Animator") or humanoid
							for _, anim in pairs(seaBeast.Anims:GetChildren()) do
								if anim:IsA("Animation") then
									if anim.AnimationId == "rbxassetid://8708221792" or anim.AnimationId == "rbxassetid://8708222556" or anim.AnimationId == "rbxassetid://8708223619" or anim.AnimationId == "rbxassetid://8708225668" then
										for _, animationTrack in pairs(animator:GetPlayingAnimationTracks()) do
											if animationTrack.Animation.AnimationId == anim.AnimationId then
												if animationTrack.IsPlaying then
													return true
												else
													return false
												end
											end
										end
									end
								end
							end
						end
					end
				end
				repeat task.wait(0.02)
					localplayer.Character:WaitForChild("Humanoid").Sit = false
					local Sea_Beast_CFrame = Check_Sea_Beast().HumanoidRootPart.CFrame
					if not localplayer.Character:FindFirstChild("HasBuso") then
						CommF_("Buso")
					end    
					if Distance(Sea_Beast_CFrame.Position) <= 50 then
						Start_Use_All_Weapon_Skill = true
					else
						Start_Use_All_Weapon_Skill = false
					end
					Use_AimBot_Skill = true
					Aimbot_Target_Position = Sea_Beast_CFrame.Position
					if Dodge_Sea_Beast() then
						TP(Sea_Beast_CFrame * CFrame.new(0, 400, 0))
					else
						TP(Sea_Beast_CFrame * CFrame.new(0, 400, 0));
					end 
				until not _G.KaitunConfig["Start Farm"] or not Check_Sea_Beast()
				Start_Use_All_Weapon_Skill = false
				Use_AimBot_Skill = false
				Aimbot_Target_Position = nil
			else
				if Distance(Sea_Position.Position,Player_Boat.CFrame.Position) > 30 and localplayer.Character:WaitForChild("Humanoid").Sit then
					-- Tp_Boat(Sea_CFrame,Player_Boat)
					Boat_Tween(Sea_Position, Player_Boat)
					-- Player_Boat.CFrame = Sea_CFrame
				elseif Distance(Sea_Position.Position,Player_Boat.CFrame.Position) > 30 and not localplayer.Character:WaitForChild("Humanoid").Sit then
					Go_To_Position(Player_Boat.CFrame,function()
						return not _G.KaitunConfig["Start Farm"] or localplayer.Character:WaitForChild("Humanoid").Sit or Distance(Player_Boat.Position) < 30
					end)
				elseif Distance(Sea_Position.Position,Player_Boat.CFrame.Position) < 30 and Distance(Player_Boat.CFrame.Position) > 30 then
					Go_To_Position(Player_Boat.CFrame,function()
						return not _G.KaitunConfig["Start Farm"] or Distance(Sea_Position.Position) < 30
					end)
				end
			end
		else
			if Distance(Npc_Position.Position) > 30 then
				Go_To_Position(Npc_Position,function()
					return not _G.KaitunConfig["Start Farm"] or Distance(Npc_Position.Position) < 30
				end)
				CommF_("BuyBoat","Guardian")
			end
		end
	end
end)()

-- Anti AFK

localplayer.Idled:connect(function()
	virtualUser:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
	wait(1)
	virtualUser:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)

-- Attacked Modules

local module = {}

local NetworkModule = loadstring(game:HttpGet("https://raw.githubusercontent.com/NightsTimeZ/Megumint-Utilities/main/RBX-FastNetwork.lua"))()

local LocalPlayer = game.Players.LocalPlayer

local max_multi_hits = 5

local getAllBladeHits = function(Sizes)
	local Hits = {}
	local freefirstpath = nil
	local FORCESTOP = false
	local processEntity = function(entity)
		if #Hits >= max_multi_hits then
			FORCESTOP = true
			return
		end
		local Human = entity:FindFirstChild("Humanoid")
		local RootPart = entity:FindFirstChild("HumanoidRootPart")
		if Human and RootPart and Human.Health > 0 and LocalPlayer:DistanceFromCharacter(RootPart.Position) < Sizes + 5 then
			if not freefirstpath then
				freefirstpath = entity:FindFirstChild("Head")
			else
				Hits[#Hits+1] = {
					entity,
					entity:FindFirstChild("Head") or RootPart
				}
				--table.insert(Hits,{
				--	entity,
				--	RootPart
				--})
			end
		end
	end

	local EnemiesAndCharacters = {}
	for _, enemy in ipairs(workspace.Enemies:GetChildren()) do
		processEntity(enemy)
	end
	for _, character in ipairs(workspace.Characters:GetChildren()) do
		if character.Name ~= LocalPlayer.Name then
			processEntity(character)
		end
	end

	return freefirstpath, Hits
end

local CombatUtil = require(game:GetService("ReplicatedStorage").Modules.CombatUtil)

local getupval = debug.getupvalue or getupvalue

local thread = getupval(getupval(CombatUtil.RunHitDetection,5),4)

module.attack = function()
	local bladehit,v2 = getAllBladeHits(60)
	if bladehit then
		NetworkModule:Send("RE/RegisterAttack",0.1)
		coroutine.resume(thread,bladehit,v2)
		task.wait(0.1)
	end
end

module.pure_attack = function(...)
	NetworkModule:Send("RE/RegisterAttack",0.1)
	coroutine.resume(thread,...)
	task.wait(0.1)
end

getgenv().ayaya_module = module

-- Attacked Function

function GetBladeHits()
	local bladeHits = {}
	local MAX_DISTANCE = 65

	for _, entity in ipairs(workspace.Enemies:GetChildren()) do
		local humanoid = entity:FindFirstChildOfClass("Humanoid")
		if humanoid and humanoid.Health > 0 and humanoid.RootPart and Distance(humanoid.RootPart.Position) < MAX_DISTANCE then
			table.insert(bladeHits, humanoid.RootPart)
		end
	end

	for _, player in ipairs(game.Players:GetPlayers()) do
		local character = player.Character
		if character and not player:GetAttribute("PvpDisabled") and character ~= localplayer.Character then
			local humanoid = character:FindFirstChildOfClass("Humanoid")
			if humanoid and humanoid.Health > 0 and humanoid.RootPart and Distance(humanoid.RootPart.Position) < MAX_DISTANCE then
				local IsAlly = collectionservice:HasTag(player, "Ally"..localplayer.Name)

				if not IsAlly then
					table.insert(bladeHits, humanoid.RootPart)
				end
			end
		end
	end

	return bladeHits
end

task.spawn(function()
	while task.wait() do
		local BladeHits = GetBladeHits()
		if Start_Attack and #BladeHits > 0 then
			local Current_Blade = {}
			for _, hit in pairs(BladeHits) do
				table.insert(Current_Blade, {hit.Parent, hit})
			end

			if #Current_Blade > 0 then
				for _, Target in pairs(Current_Blade) do
					getgenv().ayaya_module.pure_attack(Target[2], Current_Blade)
				end
			end
		end
	end
end)

task.spawn(function()
	runservice.Stepped:Connect(function()
		if setscriptable then
			setscriptable(localplayer, "SimulationRadius", true)
			localplayer.SimulationRadius = math.huge
		end
		if sethiddenproperty then
			sethiddenproperty(localplayer, "SimulationRadius", math.huge)
		end 
	end)
end)

task.spawn(function()
	runservice.Stepped:Connect(function()
		if _G.KaitunConfig["Start Farm"] then
			if Is_player_ready() then
				for _, v in pairs(localplayer.Character:GetDescendants()) do
					if v:IsA("BasePart") then
						v.CanCollide = false
					end
				end
			end
		end
	end)
end)

task.spawn(function()
	while task.wait(0.5) do
		if _G.KaitunConfig["Start Farm"] then
			if Is_player_ready() then
				local humanoidRootPart = localplayer.Character:FindFirstChild("HumanoidRootPart")
				if humanoidRootPart then
					if not humanoidRootPart:FindFirstChild("BodyClip") then
						local Noclip = Instance.new("BodyVelocity")
						Noclip.Name = "BodyClip"
						Noclip.MaxForce = Vector3.new(100000, 100000, 100000)
						Noclip.Velocity = Vector3.new(0, 0, 0)
						Noclip.Parent = humanoidRootPart
					end
				end
			end
		else
			local humanoidRootPart = localplayer.Character:FindFirstChild("HumanoidRootPart")
			if humanoidRootPart then
				local bodyClip = humanoidRootPart:FindFirstChild("BodyClip")
				if bodyClip then
					bodyClip:Destroy()
				end
			end
		end
	end
end)

wait(1)

function Check_Awake()
	return CommF_("getAwakenedAbilities")['V']['Awakened'] == true
end

function Check_Chip()
	local Player_Fruit = localplayer.Data.DevilFruit.Value
	local fruit_to_map = {
		["Dark-Dark"] = "Dark",
		["Sand-Sand"] = "Sand",
		["Magma-Magma"] = "Magma",
		["Rumble-Rumble"] = "Rumble",
		["Flame-Flame"] = "Flame",
		["Ice-Ice"] = "Ice",
		["Light-Light"] = "Light",
		["String-String"] = "String",
		["Quake-Quake"] = "Quake",
		["Buddha-Buddha"] = "Buddha",
		["Dough-Dough"] = "Dough",
	}

	local select_map = fruit_to_map[Player_Fruit] or "Dark"

	return select_map
end

task.spawn(LPH_NO_VIRTUALIZE(function()
	if FirstSea then return end
	while task.wait(0.1) do
		local Chip = Check_Chip()
		if DoRaid then 
			Stop_Store_Fruit = true
		else
			Stop_Store_Fruit = false
		end
		if DoRaid and not Is_raiding() then
			wait(3)
			if DoRaid and not Is_raiding() then
				Stop_Store_Fruit = true
				if not Check_raid_chip() and not Is_raiding() then
					if CommF_("RaidsNpc","Select",Chip) ~= 1 then
						if not Check_fruit_inventory() then
							local Fruits = Get_Inventory_Fruits(0,1000000)
							local Cheapest = nil
							for _, v in pairs(Fruits or {}) do
								if not Cheapest or v.Value < Cheapest.Value then
									Cheapest = v
								end
							end  
							if Cheapest.Name then
								CommF_("LoadFruit",Cheapest.Name)
							elseif not Cheapest.Name and not Check_fruit_inventory() and not Check_Fruit() and not Is_raiding() then
								Server_Hop("Finding Fruit")
							end
						end
						if Check_fruit_inventory() then
							CommF_("RaidsNpc","Select",Chip)
						end
					end
				elseif Check_raid_chip() and not Is_raiding() then
					pcall(function()
						if ThirdSea then
							if not workspace.Map["Boat Castle"].RaidSummon2.Button:FindFirstChild("Main") or not workspace.Map["Boat Castle"].RaidSummon2.Button.Main:FindFirstChild("ClickDetector") then
								repeat task.wait(0.5)
									TP(CFrame.new(-5036, 315, -3179))
								until not DoRaid or Is_raiding() or workspace.Map["Boat Castle"].RaidSummon2.Button:FindFirstChild("Main") or workspace.Map["Boat Castle"].RaidSummon2.Button.Main:FindFirstChild("ClickDetector")
								fireclickdetector(workspace.Map["Boat Castle"].RaidSummon2.Button.Main.ClickDetector)
							else
								fireclickdetector(workspace.Map["Boat Castle"].RaidSummon2.Button.Main.ClickDetector)
							end
						elseif SecondSea then
							fireclickdetector(workspace.Map.CircleIsland.RaidSummon2.Button.Main.ClickDetector) 
						end
						local ID = game:GetService("HttpService"):GenerateGUID()
						RaidID = ID
						StartingRaid = true 
						task.delay(60,function()
							if RaidID == ID then
								StartingRaid = false
							end
						end)
					end)
				end
			end
		elseif DoRaid and Is_raiding() then
			if localplayer.PlayerGui.Main.TopHUDList.RaidTimer.Visible then
				local function FindRaidIsland(islandName, maxDistance)
					for _, island in pairs(WorldOrigin.Locations:GetChildren()) do
						if island:IsA('BasePart') and island.Name == islandName and Distance(island.Position) <= maxDistance then
							return island
						end
					end
					return nil
				end    
				repeat task.wait(0.1)
					if #workspace.Enemies:GetChildren() > 0 then
						for i,v in pairs(workspace.Enemies:GetChildren()) do
							if Check_Alive_Monster(v) and Distance(v.HumanoidRootPart.Position) < 1500 then
								Attack(v,function()
									return not DoRaid or not _G.KaitunConfig["Start Farm"] or not Check_Alive_Monster(v) 
								end)
							else
								if FindRaidIsland('Island 5',2500) then
									TP(FindRaidIsland('Island 5',2500).CFrame*CFrame.new(0,50,100))
								elseif FindRaidIsland('Island 4',2500) then
									TP(FindRaidIsland('Island 4',2500).CFrame*CFrame.new(0,50,100))
								elseif FindRaidIsland('Island 3',2500) then
									TP(FindRaidIsland('Island 3',2500).CFrame*CFrame.new(0,50,100))
								elseif FindRaidIsland('Island 2',2500) then
									TP(FindRaidIsland('Island 2',2500).CFrame*CFrame.new(0,50,100))
								elseif FindRaidIsland('Island 1',2500) then
									TP(FindRaidIsland('Island 1',2500).CFrame*CFrame.new(0,50,100))
								end
							end 
						end
					else
						if FindRaidIsland('Island 5',2500) then
							TP(FindRaidIsland('Island 5',2500).CFrame*CFrame.new(0,70,100))
						elseif FindRaidIsland('Island 4',2500) then
							TP(FindRaidIsland('Island 4',2500).CFrame*CFrame.new(0,70,100))
						elseif FindRaidIsland('Island 3',2500) then
							TP(FindRaidIsland('Island 3',2500).CFrame*CFrame.new(0,70,100))
						elseif FindRaidIsland('Island 2',2500) then
							TP(FindRaidIsland('Island 2',2500).CFrame*CFrame.new(0,70,100))
						elseif FindRaidIsland('Island 1',2500) then
							TP(FindRaidIsland('Island 1',2500).CFrame*CFrame.new(0,70,100))
						end
					end
				until not localplayer.PlayerGui.Main.TopHUDList.RaidTimer.Visible or not Is_raiding()
				if Start_Awake then
					CommF_("Awakener","Check")
					CommF_("Awakener","Awaken")
				end
				Start_Awake = false
				-- Need_Noclip = false
				DoRaid = false
				Stop_Store_Fruit = false
			end
		end
	end
end))

-- Checking item condition

function Check_Item_Condition(itemType, world, itemName, hasItem)
	local config = _G.KaitunConfig

	if not config["Setting"]["Item Finder Fully"] then
		return true
	end

	local isRequired = config[itemType] and config[itemType][world] and config[itemType][world][itemName]

	if not isRequired then
		return true
	end

	return hasItem == true
end

-- First Sea Functiom.

First_Sea_Function = LPH_JIT_MAX(function()
	local Level = Player_Data.Level.Value 
	local Has_Saber = Remote_Check_Tool("Tool", "Saber")
	local Has_Pole = Remote_Check_Tool("Tool", "Pole (1st Form)")

	if _G.KaitunConfig["Sword"]["World 1"]["Saber"] and Level >= 200 and Check_Monster("Saber Expert")  and not Has_Saber then
		Get_Saber()

		CurrentStatus("Doing Saber Sword")

		return true
	elseif _G.KaitunConfig["Sword"]["World 1"]["Saber"] and _G.KaitunConfig["Setting"]["Hop Server"] and Level >= 200 and not Has_Saber and not Check_Monster("Saber Expert") then
		Server_Hop("Finding Saber Sword")
		return true
	elseif _G.KaitunConfig["Sword"]["World 1"]["Pole"] and Level >= 300 and not Has_Pole and Check_Monster("Thunder God") then
		Get_Pole()

		CurrentStatus("Doing Pole Sword")

		return true
	elseif _G.KaitunConfig["Sword"]["World 1"]["Pole"] and _G.KaitunConfig["Setting"]["Hop Server"] and Level >= 700 and not Has_Pole and not Check_Monster("Thunder God") then
		Server_Hop("Finding Pole Sword")
		return true
	elseif Level >= 700 and Check_Item_Condition("Sword", "World 1", "Saber", Has_Saber) and Check_Item_Condition("Sword", "World 1", "Pole", Has_Pole) then
		Travel_To_Second_Sea()

		CurrentStatus("Doing Second Sea Quest")

		return true
	end
	return false
end)

-- Second Sea Function

Second_Sea_Function = LPH_JIT_MAX(function()
	local Is_Match_Race = Check_Match_Race()
	local Level = Player_Data.Level.Value
	local Player_Race = Player_Data.Race.Value
	local Player_Beli = Player_Data.Beli.Value
	local Is_Evo_V2 = Player_Data.Race:FindFirstChild("Evolved")
	local Has_Warrior_Helmet = Remote_Check_Tool("Tool", "Warrior Helmet")
	local Has_Rengoku = Remote_Check_Tool("Tool", "Rengoku")
	local Has_TTK = Remote_Check_Tool("Tool", "True Triple Katana")
	local Has_Kabucha = Remote_Check_Tool("Tool", "Kabucha")
	local Has_Soul_Cane = Remote_Check_Tool("Tool", "Soul Cane")
	local Has_Midnight_Blade = Remote_Check_Tool("Tool", "Midnight Blade")
	local Has_Gravity_Cane = Remote_Check_Tool("Tool", "Gravity Cane")
	local Has_Dragon_Trident = Remote_Check_Tool("Tool", "Dragon Trident")

	if _G.KaitunConfig["Quest"]["World 2"]["Factory"] and Check_Monster("Core") then
		Factory()

		CurrentStatus("Doing Factory")

		return true
	elseif _G.KaitunConfig["Quest"]["World 2"]["Dark Fragment"] and Check_Monster("Darkbeard") then
		Attack_Dark_beard()

		CurrentStatus("Finding Dark Fragment")

		return true
	elseif _G.KaitunConfig["Quest"]["World 2"]["Bartilo"] and Level >= 850 and not Has_Warrior_Helmet then
		if not Remote_Check_Bartilo.DidPlates and Remote_Check_Bartilo.KilledSpring or (not Remote_Check_Bartilo.KilledSpring and Remote_Check_Bartilo.KilledBandits and Check_Monster("Jeremy")) or not Remote_Check_Bartilo.KilledBandits then
			Bartilo_Quest()

			CurrentStatus("Doing Bartilo Quest")

			return true
		end
	elseif Level >= 1100 and Has_Warrior_Helmet and _G.KaitunConfig["Race"]["Reroll Race"] and not Is_Match_Race and #_G.KaitunConfig["Race"]["Select Race"] > 0 then
		Change_Race()
		return true
	elseif _G.KaitunConfig["Race"]["Evo Race V2"] and Has_Warrior_Helmet and not Is_Evo_V2 and Is_Match_Race and Level >= 850 and Player_Beli >= 500000 then
		Evo_Race_V2()

		CurrentStatus("Doing Race V2 Quest")

		return true
	elseif _G.KaitunConfig["Race"]["Evo Race V3"] and Level >= 1500 and Is_Evo_V2 then
		Evo_Race_V3()

		CurrentStatus("Doing Race V3 Quest")

		return true
	elseif _G.KaitunConfig["Sword"]["World 2"]["Gravity Cane"] and Check_Monster("Fajita") and not Has_Gravity_Cane then
		Get_Gravity_Cane()

		CurrentStatus("Doing Gravity Cane")

		return true
	elseif _G.KaitunConfig["Sword"]["World 2"]["Gravity Cane"] and _G.KaitunConfig["Setting"]["Hop Server"] and Level >= 1500 and not Check_Monster("Fajita") and not Has_Gravity_Cane then
		Server_Hop("Finding Gravity Cane")
		return true
	elseif _G.KaitunConfig["Sword"]["World 2"]["Dragon Trident"] and Check_Monster("Tide Keeper") and not Has_Dragon_Trident then
		Get_Dragon_Trident()

		CurrentStatus("Doing Dragon Trident")

		return true
	elseif _G.KaitunConfig["Sword"]["World 2"]["Dragon Trident"] and _G.KaitunConfig["Setting"]["Hop Server"] and Level >= 1500 and not Check_Monster("Tide Keeper") and not Has_Dragon_Trident then
		Server_Hop("Finding Dragon Trident")
		return true
	elseif _G.KaitunConfig["Sword"]["World 2"]["Soul Cane"] and Player_Beli >= 750000 and not Has_Soul_Cane then
		CommF_("BuyItem","Soul Cane")

		CurrentStatus("Buying Soul Cane")
	elseif _G.KaitunConfig["Sword"]["World 2"]["Midnight Blade"] and Level >= 1500 and not Has_Midnight_Blade then
		Get_Midnight_Blade()

		CurrentStatus("Buying Midnight Blade")

		return true
	elseif _G.KaitunConfig["Sword"]["World 2"]["Rengoku"] and Level >= 1500 and not Has_Rengoku then
		Get_Rengoku()

		CurrentStatus("Doing Rengoku")

		return true
	elseif _G.KaitunConfig["Gun"]["World 2"]["Kabucha"] and Level >= 1500 and not Has_Kabucha then
		Get_Kabucha()

		CurrentStatus("Finding Kabucha")

		return true
	elseif _G.KaitunConfig["Sword"]["World 2"]["True Triple Katana"] and Level >= 1500 and not Has_TTK then
		Get_TTK()

		CurrentStatus("Finding True Triple Katana")

		return true
	elseif Level >= 1500 and Check_Item_Condition("Sword", "World 2", "Rengoku", Has_Rengoku) and Check_Item_Condition("Sword", "World 2", "Dragon Trident", Has_Dragon_Trident) and Check_Item_Condition("Sword", "World 2", "Gravity Cane", Has_Gravity_Cane) and Check_Item_Condition("Gun", "World 2", "Kabucha", Has_Kabucha) and Check_Item_Condition("Sword", "World 2", "True Triple Katana", Has_TTK) then
		Travel_To_Third_Sea()

		CurrentStatus("Doing Third Sea Quest")

		return true
	end

	return false
end)

-- Getting Moon-Data.

function Get_Moon_Texture()
	local placeId = game.PlaceId
	local lighting = game:GetService("Lighting")

	if placeId == 2753915549 or placeId == 4442272183 then
		return lighting.FantasySky.MoonTextureId
	elseif placeId == 7449423635 then
		return lighting.Sky.MoonTextureId
	end
end

function Check_Moon_Phase()
	local moon5 = "http://www.roblox.com/asset/?id=9709149431"
	local moon4 = "http://www.roblox.com/asset/?id=9709149052"
	local moonTextureId = Get_Moon_Texture()
	local moonStatus

	if moonTextureId == moon5 then
		moonStatus = "Full Moon"
	elseif moonTextureId == moon4 then
		moonStatus = "Full Moon Next Night"
	else
		moonStatus = "Not Full Mon"
	end

	return moonStatus
end

-- Third Sea Function

Third_Sea_Function = LPH_JIT_MAX(function()
	local Level = Player_Data.Level.Value
	local Beli = Player_Data.Beli.Value
	local Has_Twin_Hooks = Remote_Check_Tool("Tool", "Twin Hooks")
	local Has_Canvander = Remote_Check_Tool("Tool", "Canvander")
	local Has_Buddy_Sword = Remote_Check_Tool("Tool", "Buddy Sword")
	local Has_Hallow_Scythe = Remote_Check_Tool("Tool", "Hallow Scythe")
	local Has_Yama = Remote_Check_Tool("Tool", "Yama")
	local Has_Tushita = Remote_Check_Tool("Tool", "Tushita")
	local Has_Cursed_Dual_Katana = Remote_Check_Tool("Tool", "Cursed Dual Katana")
	local Has_Musketeer_Hat = Remote_Check_Tool("Tool", "Musketeer Hat")
	local Has_Serpent_Bow = Remote_Check_Tool("Tool", "Serpent Bow")
	local Has_Shark_Anchor = Remote_Check_Tool("Tool", "Shark Anchor")

	if Check_Monster("rip_indra") and Has_Tushita then
		CurrentStatus("Attacking Rip Indra")
		Attack_Rip_Indra()
		return true
	elseif _G.KaitunConfig["Quest"]["World 3"]["Pirates Raid"] and Pirate_Raid then
		CurrentStatus("Killing Pirates Raid")
		Kill_Pirates_Raid()
		return true
	elseif Remote_Elite_Hunter_Progress < 30 and (Check_Monster("Diablo") or Check_Monster("Deandre") or Check_Monster("Urban")) then
		CurrentStatus("Doing Elite Hunter")
		Elite_Hunter()
		return true
	elseif _G.KaitunConfig["Sword"]["World 3"]["Twin Hooks"] and Check_Monster("Captain Elephant") and not Has_Twin_Hooks then
		CurrentStatus("Doing Twin Hooks")
		Get_Twin_Hooks()
		return true
	elseif Level >= 1950 and _G.KaitunConfig["Sword"]["World 3"]["Canvander"] and Check_Monster("Beautiful Pirate") and not Has_Canvander then
		CurrentStatus("Doing Canvander")
		Get_Canvander()
		return true
	elseif _G.KaitunConfig["Sword"]["World 3"]["Buddy Sword"] and Check_Monster("Cake Queen") and not Has_Buddy_Sword then
		CurrentStatus("Doing Buddy Sword")
		Get_Buddy_Sword()
		return true
	elseif _G.KaitunConfig["Sword"]["World 3"]["Yama"] and Remote_Elite_Hunter_Progress >= 30 and not Has_Yama then
		CurrentStatus("Doing Yama")
		repeat wait(0.1)
			fireclickdetector(workspace:FindFirstChild("SealedKatana", true).Handle.ClickDetector)
		until Remote_Check_Tool("Tool", "Yama")
		return true
	elseif _G.KaitunConfig["Gun"]["World 3"]["Serpent Bow"] and Check_Monster("Island Empress") and not Has_Serpent_Bow then
		CurrentStatus("Doing Serpent Bow")
		Get_Serpent_Bow()
		return true
	elseif Level >= 1800 and _G.KaitunConfig["Quest"]["World 3"]["Musketeer Hat"] and not Has_Musketeer_Hat then
		CurrentStatus("Doing Musketeer Hat")
		Get_Musketeer_Hat()
		return true
	elseif _G.KaitunConfig["Sword"]["World 3"]["Tushita"] and not Has_Tushita and ((Level >= 2000 and Check_Monster("rip_indra True Form")) or (Level >= 2650 and not Check_Monster("rip_indra True Form")) or (Tushita_Quest.OpenedDoor and not Tushita_Quest.KilledLongma)) then
		CurrentStatus("Doing Tushita")
		Get_Tushita()
		return true
	elseif _G.KaitunConfig["Sword"]["World 3"]["Cursed Dual Katana"] and Has_Tushita and Has_Yama and not Has_Cursed_Dual_Katana then
		CurrentStatus("Doing Cursed Dual Katana")
		Get_Cursed_Dual_Katana()
		return true
	elseif Level >= 2650 and _G.KaitunConfig["Quest"]["World 3"]["Rainbow Haki"] and not Is_Rainbow_Quest then
		CurrentStatus("Doing Rainbow Haki")
		Get_Rainbow_Haki()
		return true
	elseif Level >= 2650 and _G.KaitunConfig["Sword"]["World 3"]["Hallow Scythe"] and not Has_Hallow_Scythe and Bone_Check > 0 then
		CurrentStatus("Doing Hallow Scythe")
		Get_Hallow_Scythe()
		return true
	elseif Level >= 2650 and _G.KaitunConfig["Quest"]["World 3"]["Dough Awaken"] and Dough_Raid ~= true then
		CurrentStatus("Doing Dough Awaken")
		Do_Dough_Awaken()
		return true
	elseif _G.KaitunConfig["Quest"]["World 3"]["Dough Mirror"] and Check_Monster("Dough King") then
		CurrentStatus("Attacking Dough King")
		Attack_Dough_King()
		return true
	elseif _G.KaitunConfig["Sword"]["World 3"]["Shark Anchor"]["Enabled"] and Beli >= _G.KaitunConfig["Sword"]["World 3"]["Shark Anchor"]["Money"] and not Has_Shark_Anchor then
		CurrentStatus("Doing Shark Anchor")
		Get_Shark_Anchor()
		return true
	end

	return false
end)


-- Farm All Item

function Farm_All_Item()
	local Level = Player_Data.Level.Value
	local sea_by_place_id = {
		[2753915549] = "FirstSea",
		[4442272183] = "SecondSea",
		[7449423635] = "ThirdSea"
	}

	local CurrentSea = sea_by_place_id[placeId]

	local Has_Saber = Remote_Check_Tool("Tool", "Saber")
	local Has_Pole = Remote_Check_Tool("Tool", "Pole (1nd Form)")

	local Has_Rengoku = Remote_Check_Tool("Tool", "Rengoku")
	local Has_Kabucha = Remote_Check_Tool("Tool", "Kabucha")
	local Has_Gravity_Cane = Remote_Check_Tool("Tool", "Gravity Cane")
	local Has_Midnight_Blade = Remote_Check_Tool("Tool", "Midnight Blade")
	local Has_Soul_Cane = Remote_Check_Tool("Tool", "Soul Cane")
	local Has_TTK = Remote_Check_Tool("Tool", "True Triple Katana")

	local Has_Twin_Hooks = Remote_Check_Tool("Tool", "Twin Hooks")
	local Has_Canvander = Remote_Check_Tool("Tool", "Canvander")
	local Has_Buddy_Sword = Remote_Check_Tool("Tool", "Buddy Sword")
	local Has_Hallow_Scythe = Remote_Check_Tool("Tool", "Hallow Scythe")
	local Has_Yama = Remote_Check_Tool("Tool", "Yama")
	local Has_Tushita = Remote_Check_Tool("Tool", "Tushita")
	local Has_Cursed_Dual_Katana = Remote_Check_Tool("Tool", "Cursed Dual Katana")
	local Has_Musketeer_Hat = Remote_Check_Tool("Tool", "Musketeer Hat")
	local Has_Serpent_Bow = Remote_Check_Tool("Tool", "Serpent Bow")
	local Has_Shark_Anchor = Remote_Check_Tool("Tool", "Shark Anchor")
	local Has_Soul_Guitar = Remote_Check_Tool("Tool", "Skull Guitar")

	local Item_Task = {
		{typeof_weapon = "Sword", world = "World 1", name = "Saber", has = Has_Saber, sea = "FirstSea", get = Get_Saber, travel = "TravelMain"},
		{typeof_weapon = "Sword", world = "World 1", name = "Pole", has = Has_Pole, sea = "FirstSea", get = Get_Pole, travel = "TravelMain"},
		{typeof_weapon = "Sword", world = "World 2", name = "Rengoku", has = Has_Rengoku, sea = "SecondSea", get = Get_Rengoku, travel = "TravelDressrosa"},
		{typeof_weapon = "Sword", world = "World 2", name = "Gravity Cane", has = Has_Gravity_Cane, sea = "SecondSea", get = Get_Gravity_Cane, travel = "TravelDressrosa"},
		{typeof_weapon = "Gun", world = "World 2", name = "Kabucha", has = Has_Kabucha, sea = "SecondSea", get = Get_Kabucha, travel = "TravelDressrosa"},
		{typeof_weapon = "Sword", world = "World 2", name = "Midnight Blade", has = Has_Midnight_Blade, sea = "SecondSea", get = Get_Midnight_Blade, travel = "TravelDressrosa"},
		{typeof_weapon = "Sword", world = "World 2", name = "True Triple Katana", has = Has_TTK, sea = "SecondSea", get = Get_TTK, travel = "TravelDressrosa"},
		{typeof_weapon = "Sword", world = "World 3", name = "Twin Hooks", has = Has_Twin_Hooks, sea = "ThirdSea", get = Get_Twin_Hooks, travel = "TravelZou"},
		{typeof_weapon = "Sword", world = "World 3", name = "Canvander", has = Has_Canvander, sea = "ThirdSea", get = Get_Canvander, travel = "TravelZou"},
		{typeof_weapon = "Sword", world = "World 3", name = "Buddy Sword", has = Has_Buddy_Sword, sea = "ThirdSea", get = Get_Buddy_Sword, travel = "TravelZou"},
		{typeof_weapon = "Sword", world = "World 3", name = "Hallow Scythe", has = Has_Hallow_Scythe, sea = "ThirdSea", get = Get_Hallow_Scythe, travel = "TravelZou"},
		{typeof_weapon = "Sword", world = "World 3", name = "Tushita", has = Has_Tushita, sea = "ThirdSea", get = Get_Tushita, travel = "TravelZou"},
		{typeof_weapon = "Sword", world = "World 3", name = "Cursed Dual Katana", has = Has_Cursed_Dual_Katana, sea = "ThirdSea", get = Get_Cursed_Dual_Katana, travel = "TravelZou"},
		-- {typeof_weapon = "Gun", world = "World 3", name = "Soul Guitar", has = Has_Soul_Guitar, sea = "ThirdSea", get = Get_Soul_Guitar, travel = "TravelZou"},
	}

	for _, task in ipairs(Item_Task) do
		if not Check_Item_Condition(task.typeof_weapon, task.world, task.name, task.has) then
			if CurrentSea == task.sea then
				task.get()

				CurrentStatus("Doing Find Item Task")

				return true
			else
				CommF_(task.travel)

				CurrentStatus("Doing Find Item Task")

				return true
			end
		end
	end
	return false
end

Handle_Sea_Function = LPH_JIT_MAX(function()
	Debug("Handle Item " ..SeaIndex.. "")

	if FirstSea then
		return First_Sea_Function()
	elseif SecondSea then
		return Second_Sea_Function()
	elseif ThirdSea then
		return Third_Sea_Function()
	end

	return false
end)

Handle_Melee_Function = LPH_JIT_MAX(function()
	Debug("Handle Melee")

	local Level = Player_Data.Level.Value
	local Player_Fragment = Player_Data.Fragments.Value
	local Player_Beli = Player_Data.Beli.Value

	if not Hassuperhuman and _G.KaitunConfig["Melee"]["Superhuman"] then
		if not HasBlackleg and Player_Beli >= 150000 then
			CommF_("BuyBlackLeg")
		elseif Check_Tool_Mastery("Black Leg", 300) then
			CommF_("BuyElectro")
		elseif Check_Tool_Mastery("Electro", 300) then
			CommF_("BuyFishmanKarate")
		elseif Check_Tool_Mastery("Fishman Karate", 300) and Level > 1100 then
			if Player_Fragment >= 1500 then
				DoRaid = false
				CommF_("BlackbeardReward", "DragonClaw", "1")
				CommF_("BlackbeardReward", "DragonClaw", "2")
			else
				DoRaid = true
				return true
			end
		elseif Check_Tool_Mastery("Dragon Claw", 300) and Player_Beli >= 3000000 then
			CommF_("BuySuperhuman")
			Hassuperhuman = true
		end
		
		CurrentStatus("Doing Superhuman")
	elseif _G.KaitunConfig["Melee"]["Death Step"] and not HasDeathStep and SecondSea and Level >= 1500 and not Is_Open and Hassuperhuman then
		Open_Library()

		CurrentStatus("Doing Death Step")

		return true
	elseif _G.KaitunConfig["Melee"]["Sharkman Karate"] and not HasSharkmanKarate and SecondSea and Level >= 1500 and not Is_Use_key and Hassuperhuman then
		Find_Water_Key()

		CurrentStatus("Doing Sharkman Karate")

		return true
	elseif _G.KaitunConfig["Melee"]["Death Step"] and Is_Open and ThirdSea and (Hassuperhuman and not HasDeathStep) then
		if Check_Inventory("Black Leg") then
			if Check_Tool_Mastery("Black Leg",400) then
				if Player_Fragment >= 5000 then
					DoRaid = false
					if Player_Beli >= 2500000 then
						CommF_("BuyDeathStep")
						HasDeathStep = true
					end
				else
					DoRaid = true
					return true
				end
			end
		else
			CommF_("BuyBlackLeg")
		end
		
		CurrentStatus("Doing Death Step")
	elseif _G.KaitunConfig["Melee"]["Sharkman Karate"] and Is_Use_key and ThirdSea and (Hassuperhuman and HasDeathStep and not HasSharkmanKarate) then
		if Check_Inventory("Fishman Karate") then
			if Check_Tool_Mastery("Fishman Karate",400) then
				if Player_Fragment >= 5000 then
					DoRaid = false
					if Player_Beli >= 2500000 then
						CommF_("BuySharkmanKarate")
						HasDeathStep = true
					end
				else
					DoRaid = true
					return true
				end
			end
		else
			CommF_("BuyFishmanKarate")
		end
		
		CurrentStatus("Doing Sharkman Karate")
	elseif _G.KaitunConfig["Melee"]["Electric Claw"] and ThirdSea and (Hassuperhuman and HasDeathStep and HasSharkman and not HasElectricClaw) then
		if Check_Inventory("Electro") then
			if Check_Tool_Mastery("Electro", 400) then
				if Electric_Quest then
					CommF_("BuyElectricClaw", "Start")
					wait(1)
					CommF_("requestEntrance", Vector3.new(-12462, 375, -7552))
				elseif Player_Fragment >= 5000 then
					DoRaid = false
					if Player_Beli >= 3000000 then
						CommF_("BuyElectricClaw")
						HasElectricClaw = true
					end
				else
					DoRaid = true
					return true
				end
			end
		else
			CommF_("BuyElectro")
		end
		
		CurrentStatus("Doing Electric Claw")
	elseif _G.KaitunConfig["Melee"]["Dragon Talon"] and ThirdSea and (Hassuperhuman and HasDeathStep and HasSharkman and HasElectricClaw and not HasDragonTalon) then
		local Total_Bones = Remote_Check_Tool("Material","Bones")
		if Used_Fire_Essence then
			if Check_Inventory("Dragon Claw") then
				if Check_Tool_Mastery("Dragon Claw", 400) then
					if Player_Fragment >= 5000 then
						DoRaid = false
						if Player_Beli >= 3000000 then
							CommF_("BuyDragonTalon")
							HasDragonTalon = true
						end
					else
						DoRaid = true
						return true
					end
				end
			else
				CommF_("BlackbeardReward", "DragonClaw", "1")
				CommF_("BlackbeardReward", "DragonClaw", "2")
			end
			
			CurrentStatus("Doing Dragon Talon")
		elseif Bone_Check > 0 and Total_Bones >= 500 then
			CommF_("Bones","Buy",1,1)
		elseif Bone_Check > 0 and Total_Bones < 500 then
			Max_Level_Farm("Bone")
			return true
		end
	elseif _G.KaitunConfig["Melee"]["Godhuman"] and Level >= 2650 and (Hassuperhuman and HasDeathStep and HasSharkman and HasElectricClaw and HasDragonTalon and not HasGodhuman) then
		Get_Godhuman()

		CurrentStatus("Doing God Human")

		return true
	end

	return false
end)

localplayer.CharacterAdded:Connect(function(Character)
	local humanoid = localplayer.Character:WaitForChild("Humanoid")
	Character:WaitForChild("Busy").Changed:Connect(function()
		if Character.Busy.Value then
			Character.Busy.Value = false
		end
	end)
	Character:WaitForChild("Stun").Changed:Connect(function()
		if Character.Stun.Value > 0 then
			Character.Stun.Value = 0
		end
	end)
	humanoid.StateChanged:Connect(function(oldState, newState)
		if newState == Enum.HumanoidStateType.Seated then
			print("Humanoid Sit True")

			task.wait(0.1)

			if humanoid.Sit then
				print("Humanoid Sit False")
				humanoid.Sit = false
			end
		end
	end)
end)

task.spawn(function()
	local weaponToolTipMap = {
		["Melee"] = "Melee",
		["Sword"] = "Sword",
		["Devil Fruit"] = "Blox Fruit"
	}
	while task.wait(0.5) do
		for _, tool in pairs(localplayer.Backpack:GetChildren()) do
			local weaponToolTip = weaponToolTipMap[Weapon or "Melee"]
			if weaponToolTip and tool.ToolTip == weaponToolTip and Check_Inventory(tool.Name) then
				Current_Weapon = tool.Name
				break
			end
		end
	end
end)

task.spawn(LPH_NO_VIRTUALIZE(function()
	while task.wait(0.1) do
		if Start_Magnet then
			local enemiesFolder = workspace:FindFirstChild("Enemies")
			if not enemiesFolder then
				continue
			end
			local enemies = enemiesFolder:GetChildren()
			for _, v in pairs(enemies) do
				if v.Name ~= Magnet_monster then
					continue
				end
				local Human = v:FindFirstChild("Humanoid")
				if not Human then
					continue
				end
				local HumanRootPart = v:FindFirstChild("RootPart") or v:FindFirstChild("HumanoidRootPart")
				if not HumanRootPart then
					continue
				end

				local BodyVelocity = HumanRootPart:FindFirstChild("BodyVelocity")
				if not BodyVelocity then
					BodyVelocity = Instance.new("BodyVelocity")
					BodyVelocity.Parent = HumanRootPart
					BodyVelocity.Name = "BodyVelocity"
					BodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
					BodyVelocity.Velocity = Vector3.new(0, 0, 0)
				end
				if isnetworkowner(HumanRootPart) or Distance(HumanRootPart.Position, Pos_mon.Position) <= 300 then
					task.spawn(function()
						for _, val in pairs(v:GetDescendants()) do
							if val:IsA("BasePart") then
								val.CanCollide = false
							end
						end
					end)
					HumanRootPart.CFrame = Pos_mon
				end
			end
		end
	end
end))

task.spawn(function()
	while task.wait(0.5) do
		if _G.KaitunConfig["Setting"]["Auto Stats"] then
			if localplayer.Data.Stats.Melee.Level.Value < 2650 then
				CommF_("AddPoint","Melee",math.huge)
			elseif localplayer.Data.Stats.Defense.Level.Value < 2650 then
				CommF_("AddPoint","Defense",math.huge)
			else
				if _G.KaitunConfig["Setting"]["Stats Mode"] == "Sword" then
					CommF_("AddPoint","Sword",math.huge)
				elseif _G.KaitunConfig["Setting"]["Stats Mode"] == "Gun" then
					CommF_("AddPoint","Gun",math.huge)
				elseif _G.KaitunConfig["Setting"]["Stats Mode"] == "Fruit" then
					CommF_("AddPoint","Demon Fruit",math.huge)
				end
			end
		end
	end
end)

task.spawn(function()
	while task.wait(1) do
		local Has_Buso = CommF_("BuyHaki","Buso")
		local Has_Geppo = CommF_("BuyHaki","Geppo")
		local Has_Soru = CommF_("BuyHaki","Soru")
		local Has_Observation_Haki = CommF_("KenTalk","Buy")

		local Player_Beli = Player_Data.Beli.Value

		if _G.KaitunConfig["Setting"]["Buy Base Sword"] then
			local List = {
				{"Katana", 1000},
				{"Cutlass", 1000},
				{"Duel Katana", 12000},
				{"Iron Mace", 25000},
				{"Triple Katana", 60000},
				{"Pipe", 100000},
				{"Dual-Headed Blade", 400000},
				{"Bisento", 1000000}
			}

			for _, v in ipairs(List) do
				local name, price = v[1], v[2]
				if not Remote_Check_Tool("Tool", name) and Player_Beli >= price then
					CommF_("BuyItem", name)
				end
			end
		end

		if Has_Buso == 1 then
			CommF_("BuyHaki","Buso")
		end
		if Has_Geppo == 1 then
			CommF_("BuyHaki","Geppo")
		end
		if Has_Soru == 1 then
			CommF_("BuyHaki","Soru")
		end
		if Has_Observation_Haki == 0 then
			CommF_("KenTalk","Buy")
		end

		if CommF_("Cousin","Buy") == 1 then
			CommF_("Cousin","Buy")
		end
	end	
end)

task.spawn(LPH_NO_VIRTUALIZE(function()
	while task.wait(0.1) do
		local succ,err = pcall(function()
			Is_Open = CommF_("OpenLibrary")

			local useKeyResult = CommF_("BuySharkmanKarate", true)
			Is_Use_key = useKeyResult == 0 or useKeyResult == 3

			Electric_Quest = CommF_("BuyElectricClaw", true) == 4

			local result = CommF_("BuyDragonTalon", true)
			Used_Fire_Essence = result == 0 or result == 3

			Dough_Raid = CommF_("CakeScientist","Check")

			if SecondSea then
				if _G.KaitunConfig["Sword"]["World 2"]["Legendary Sword"] then
					CommF_("LegendarySwordDealer","1")
					CommF_("LegendarySwordDealer","2")
					CommF_("LegendarySwordDealer","3")
				end

				if _G.KaitunConfig["Setting"]["Buy Haki Color"] then
					CommF_("ColorsDealer","2")
				end

				Remote_Check_Bartilo = CommF_("BartiloQuestProgress")
			elseif ThirdSea then
				Bone_Check = CommF_("Bones", "Check")
				CDK_Quest = CommF_("CDKQuest", "Progress")
				Remote_Elite_Hunter_Progress = CommF_("EliteHunter", "Progress")
				Tushita_Quest = CommF_("TushitaProgress")

				task.spawn(function() 
					local Remote_Haki = CommF_("getColors")
					for i,v in pairs(Remote_Haki) do
						if v.HiddenName == "Rainbow Saviour" and v.Unlocked == true then
							Is_Rainbow_Quest = true
						end
					end
				end)
			end

			if ThirdSea and localplayer.PlayerGui.Notifications:FindFirstChild("NotificationTemplate") then
				local function checkNotify(msg)
					msg = string.lower(msg)
					for _, k in ipairs(localplayer.PlayerGui.Notifications:GetDescendants()) do
						if k:IsA("TextLabel") and k.Text then
							if string.find(string.lower(k.Text), msg, 1, true) then
								return true
							end
						end
					end
					return false
				end                        

				if _G.KaitunConfig["Setting"]["Buy Haki Color"] then
					CommF_("ColorsDealer","2")
				end

				if checkNotify("good job") or checkNotify("the pirates have stopped") then
					Pirate_Raid = false
				elseif checkNotify("pirates have been spotted") or checkNotify("the pirates are raiding") then
					Pirate_Raid = true
				end
			end

			if CommF_("BuyElectro",true) == 1 then
				HasElectro = true
			end
			if CommF_("BuyBlackLeg",true) == 1 then
				HasBlackleg = true
			end
			if CommF_("BuyFishmanKarate",true) == 1 then
				HasFishman = true
			end
			if CommF_("BlackbeardReward","DragonClaw","1") == 1 then
				HasDragonClaw = true
			end
			if CommF_("BuySuperhuman",true) == 1 then
				Hassuperhuman = true
			end
			if CommF_("BuyDeathStep",true) == 1 then
				HasDeathStep = true
			end
			if CommF_("BuySharkmanKarate",true) == 1 then
				HasSharkman = true
			end
			if CommF_("BuyElectricClaw",true) == 1 then
				HasElectricClaw = true
			end
			if CommF_("BuyDragonTalon",true) == 1 then
				HasDragonTalon = true
			end
			if CommF_("BuyGodhuman",true) == 1 then
				HasGodhuman = true
			end            

			if CommF_("Cousin","Buy") == 1 then
				CommF_("Cousin","Buy")
			end

			if not Ready_To_Farm then
				Ready_To_Farm = true
			end
		end)
		if not succ then warn("Alt Function "..err) end
	end
end))

local gg = getrawmetatable(game)
local old = gg.__namecall
setreadonly(gg, false)
gg.__namecall = newcclosure(function(...)
	local method = getnamecallmethod()
	local args = {...}
	if tostring(method) == "FireServer" then
		if tostring(args[1]) == "RemoteEvent" then
			if tostring(args[2]) ~= "true" and tostring(args[2]) ~= "false" then
				if Use_AimBot_Skill then
					args[2] = Aimbot_Target_Position;
					return old(unpack(args))
				end;
			end;
		end;
	end;
	return old(...)
end)

task.spawn(function()
	while wait() do
		pcall(function()
			if Start_Use_All_Weapon_Skill then
				if DoneSkillFruit == false then
					for _, v in pairs(localplayer.Backpack:GetChildren()) do
						if v.ToolTip == "Blox Fruit" and v:IsA("Tool") then
							localplayer.Character.Humanoid:EquipTool(v)
						end
					end
					virtualUser:SendKeyEvent(true, "Z", false, game)
					task.wait(1)
					virtualUser:SendKeyEvent(false, "Z", false, game)
					virtualUser:SendKeyEvent(true, "X", false, game)
					task.wait(1)
					virtualUser:SendKeyEvent(false, "X", false, game)
					virtualUser:SendKeyEvent(true, "C", false, game)
					task.wait(1)
					virtualUser:SendKeyEvent(false, "C", false, game)
					virtualUser:SendKeyEvent(true, "V", false, game)
					task.wait(1)
					virtualUser:SendKeyEvent(false, "V", false, game)
					virtualUser:SendKeyEvent(true, "F", false, game)
					task.wait(1)
					virtualUser:SendKeyEvent(false, "F", false, game)
					DoneSkillFruit = true
				end
				if DoneSkillMelee == false then
					for _, v in pairs(localplayer.Backpack:GetChildren()) do
						if v.ToolTip == "Melee" and v:IsA("Tool") then
							localplayer.Character.Humanoid:EquipTool(v)
						end
					end
					virtualUser:SendKeyEvent(true, "Z", false, game)
					task.wait(1)
					virtualUser:SendKeyEvent(false, "Z", false, game)
					virtualUser:SendKeyEvent(true, "X", false, game)
					task.wait(1)
					virtualUser:SendKeyEvent(false, "X", false, game)
					virtualUser:SendKeyEvent(true, "C", false, game)
					task.wait(1)
					virtualUser:SendKeyEvent(false, "C", false, game)
					virtualUser:SendKeyEvent(true, "V", false, game)
					task.wait(1)
					virtualUser:SendKeyEvent(false, "V", false, game)
					DoneSkillMelee = true
				end;
				if DoneSkillSword == false then
					for _, v in pairs(localplayer.Backpack:GetChildren()) do
						if v.ToolTip == "Sword" and v:IsA("Tool") then
							localplayer.Character.Humanoid:EquipTool(v)
						end
					end
					virtualUser:SendKeyEvent(true, "Z", false, game)
					task.wait(0)
					virtualUser:SendKeyEvent(false, "Z", false, game)
					virtualUser:SendKeyEvent(true, "X", false, game)
					task.wait(0)
					virtualUser:SendKeyEvent(false, "X", false, game)
					DoneSkillSword = true;
				end
				if DoneSkillGun == false then
					for _, v in pairs(localplayer.Backpack:GetChildren()) do
						if v.ToolTip == "Gun" and v:IsA("Tool") then
							localplayer.Character.Humanoid:EquipTool(v)
						end
					end
					virtualUser:SendKeyEvent(true, "Z", false, game)
					task.wait(0.1)
					virtualUser:SendKeyEvent(false, "Z", false, game)
					virtualUser:SendKeyEvent(true, "X", false, game)
					task.wait(0.1)
					virtualUser:SendKeyEvent(false, "X", false, game)
					DoneSkillGun = true
				end
				DoneSkillGun = false
				DoneSkillSword = false
				DoneSkillFruit = false
				DoneSkillMelee = false
			end
		end)
	end
end)

local Code = {
	"EXP_5B",
	"CONTROL",
	"UPDATE11",
	"XMASEXP",
	"1BILLION",
	"ShutDownFix2",
	"UPD14",
	"STRAWHATMAINE",
	"TantaiGaming",
	"Colosseum",
	"Axiore",
	"Sub2Daigrock",
	"Sky Island 3",
	"Sub2OfficialNoobie",
	"SUB2NOOBMASTER123",
	"THEGREATACE",
	"Fountain City",
	"BIGNEWS",
	"FUDD10",
	"SUB2GAMERROBOT_EXP1",
	"UPD15",
	"2BILLION",
	"UPD16",
	"3BVISITS",
	"fudd10_v2",
	"Starcodeheo",
	"KITT_RESET",
	"Sub2UncleKizaru",
	"SUB2GAMERROBOT_RESET1",
	"Magicbus",
	"JCWK",
	"Bluxxy",
	"Sub2Fer999",
	"Enyu_is_Pro",
	"GAMER_ROBOT_1M",
	"ADMINGIVEAWAY",
	"GAMERROBOT_YT",
	"kittgaming",
	"ADMIN_TROLL",
	"staffbattle",
	"youtuber_shipbattle",
	"Sub2CaptainMaui",
	"DEVSCOOKING",
}

function Hadx2EXP()
	local Title = localplayer.PlayerGui.Main.Level.Exp.Text
	return string.find(Title,"2x ends in") ~= nil
end

function Redeem_Code()
	for i,v in pairs(Code) do
		if Hadx2EXP() then
			break
		end
		replicatedstorage.Remotes.Redeem:InvokeServer(v)
		print("[Redeem Code] : "..v)
	end
end

function Check_Farm_Mastery_Sword()
	local Rarity_Tier = {
		["Common"] = 0,
		["Uncommon"] = 1,
		["Rare"] = 2,
		["Legendary"] = 3,
		["Mythical"] = 4,
	}

	local Select_Rarity = _G.KaitunConfig["Mastery"]["Select Rarity"]

	local Rarity_Filter = {}
	for _, name in pairs(Select_Rarity) do
		if Rarity_Tier[name] then
			table.insert(Rarity_Filter, Rarity_Tier[name])
		end
	end

	local Remote_Inventory = CommF_("getInventory")
	for i, v in pairs(Remote_Inventory) do
		if v.Type == "Sword" and v.Rarity and v.Mastery < 600 then
			for _, allowed_rarity in pairs(Rarity_Filter) do
				if v.Rarity == allowed_rarity then
					return v.Name
				end
			end
		end
	end
	return true
end

function Farm_Fruit_Mastery()
	local function pressKey(key)
		virtualinput:SendKeyEvent(true, key, false, game)
		task.wait(0.5)
		virtualinput:SendKeyEvent(false, key, false, game)
	end
	local Mon = {"Posessed Mummy","Living Zombie","Reborn Skeleton","Demonic Soul"}
	local Enemy = Check_Monster(Mon)

	if Enemy then
		Health_Percent = Enemy.Humanoid.MaxHealth * 25/100
		if Enemy.Humanoid.Health < Health_Percent then
			repeat task.wait(0.1)
				local Player_Fruit = localplayer.Data.DevilFruit.Value
				TP(Enemy.HumanoidRootPart.CFrame * CFrame.new(0, 10, 5))
				if localplayer.Character:FindFirstChild(Player_Fruit) then
					MasteryDevilFruit = require(localplayer.Character[Player_Fruit].Data)
					DevilFruitMastery = localplayer.Character[Player_Fruit].Level.Value
				elseif localplayer.Backpack:FindFirstChild(Player_Fruit) then
					MasteryDevilFruit = require(localplayer.Backpack[Player_Fruit].Data)
					DevilFruitMastery = localplayer.Backpack[Player_Fruit].Level.Value
				end

				local skillLevels = {
					Z = MasteryDevilFruit.Lvl.Z,
					X = MasteryDevilFruit.Lvl.X,
					C = MasteryDevilFruit.Lvl.C,
					V = MasteryDevilFruit.Lvl.V,
				}
				Equip_Tool(Player_Fruit)
				Use_AimBot_Skill = true
				Aimbot_Target_Position = Enemy.HumanoidRootPart.Position
				Start_Attack = false 

				for _, skillKey in pairs({"Z","X","C"}) do
					local requiredLevel = skillLevels[skillKey]
					if requiredLevel and DevilFruitMastery >= requiredLevel then
						pressKey(skillKey)
					end
				end
			until not _G.KaitunConfig["Start Farm"] or not Check_Alive_Monster(Enemy) or not Check_Monster(Mon)
			Use_AimBot_Skill = false
			Aimbot_Target_Position = nil
		else
			repeat task.wait(0.1)        
				if not localplayer.Character:FindFirstChild("HasBuso") then
					CommF_("Buso")
				end     

				if Check_Tool_Mastery("Dark Step", 150) or Check_Tool_Mastery("Death Step", 400) then
					virtualinput:SendKeyEvent(true, "V", false, game)
					virtualinput:SendKeyEvent(false, "V", false, game)
				end

				Magnet_monster = Mon.Name
				Pos_mon = HumanoidRootPart.CFrame

				Humanoid.JumpPower = 0
				Humanoid.WalkSpeed = 0
				HumanoidRootPart.CanCollide = false

				Equip_Tool(Current_Weapon)
				TP(HumanoidRootPart.CFrame * CFrame.new(0, 50, 0))
			until not _G.KaitunConfig["Start Farm"] or Enemy.Humanoid.Health < Health_Percent or not Check_Alive_Monster(Enemy) or not Check_Monster(Mon)
		end
	else
		Go_To_Spawner(Mon,function()
			return not _G.KaitunConfig["Start Farm"]
		end)
	end
end

function Farm_Item_Max_Level()
	local Has_Soul_Guitar = Remote_Check_Tool("Tool", "Skull Guitar")
	if _G.KaitunConfig["Gun"]["World 3"]["Soul Guitar"] and not Has_Soul_Guitar then
		Get_Soul_Guitar()

		CurrentStatus("DOing Soul Guitar (Lvl Max)")

		return true
	end
	return false
end

task.spawn(LPH_NO_VIRTUALIZE(function()
	while task.wait(0.1) do
		if _G.KaitunConfig["Start Farm"] and Ready_To_Farm then
			local succ,err = pcall(function()
				Debug("Started Thread")

				local Level = Player_Data.Level.Value
				local checkFruit = Check_Fruit()
				local matchedFruit = Check_Fruit_Match()
				local Remote_Rengoku = CommF_("OpenRengoku")

				if matchedFruit then
					Debug("Eat Fruit")
					return Eat_Select_Fruit(matchedFruit)
				end

				if checkFruit and not Is_raiding() then
					Debug("Finding Fruit")
					CurrentStatus("Finding Fruit")

					for i, v in pairs(workspace:GetChildren()) do
						if v.Name:find("Fruit") and v:FindFirstChild("Handle") then
							repeat task.wait(0.1)
								TP(v.Handle.CFrame)
							until not v.Parent or _G.KaitunConfig["Start Farm"] or not checkFruit or Is_raiding()
						end
					end
					return 
				end

				if not Stop_Store_Fruit then
					ProcessFruits(localplayer.Backpack)
					ProcessFruits(localplayer.Character)
					Debug("Store Fruit")
				end

				if Check_Inventory("Hidden Key") and not Remote_Rengoku then
					repeat wait(0.5) CommF_("OpenRengoku") until not Check_Inventory("Hidden Key")
				elseif Check_Inventory("Water Key") then
					repeat wait(0.5) CommF_("BuySharkmanKarate", true) until not Check_Inventory("Water Key")
				elseif Check_Inventory("Library Key") then
					repeat wait(0.5) CommF_("OpenLibrary") until not Check_Inventory("Library Key")
				end

				local Alt_Function = Handle_Melee_Function() or Handle_Sea_Function() or (Level >= 2650 and Farm_Item_Max_Level()) or (Level >= 2650 and Farm_All_Item())
				if not Alt_Function then
					if Level < 2650 then
						if _G.KaitunConfig["Setting"]["Redeem Code"] then
							Redeem_Code()
						end

						Auto_Farm_Level()

						Debug("Auto Farm Level")
					else
						local All_Sword_Matery_Max = Check_Farm_Mastery_Sword() == true
						local Current_Sword = nil
						if _G.KaitunConfig["Mastery"]["Mastery Sword"] and not All_Sword_Matery_Max then
							Current_Sword = Check_Farm_Mastery_Sword()
						end

						if All_Sword_Matery_Max and not Check_Awake() and (CommF_("getAwakenedAbilities") ~= nil and CommF_("getAwakenedAbilities") ~= '') then
							DoRaid = true
							Start_Awake = true

							CurrentStatus("Doing Awakening Fruit")

							return
						elseif All_Sword_Matery_Max and Check_Awake() and ((localplayer.Character:FindFirstChild(localplayer.Data.DevilFruit.Value) and localplayer.Character[localplayer.Data.DevilFruit.Value].Level.Value < 600) or (localplayer.Backpack:FindFirstChild(localplayer.Data.DevilFruit.Value) and localplayer.Backpack[localplayer.Data.DevilFruit.Value].Level.Value < 600)) then
							CurrentStatus("Farm Fruit Mastery")

							return Farm_Fruit_Mastery()
						end

						Max_Level_Farm(_G.KaitunConfig["Setting"]["Farm When Lvl Max"],Current_Sword)
						CurrentStatus("Farm Sword Mastery")
					end
				end

				setfpscap(_G.KaitunConfig["Setting"]["Locking FPS"])

				Buy_Fruit()
			end)  
			if not succ then warn("Main Function "..err) end
		end
	end
end))

if _G.KaitunConfig["Setting"]["Notify Remove"] then
	localplayer.PlayerGui.Notifications.Enabled = false

	NotifyText({Title = "Pictures Hub",Text = "Disable Notification",Time = 5}, "Success")
	Debug("Disabled Notification")
end

if _G.KaitunConfig["Setting"]["White Screen"] then
	runservice:Set3dRenderingEnabled(false)
	KeyCode = false

	NotifyText({Title = "Pictures Hub",Text = "Disable 3d Rendering",Time = 5}, "Success")
	Debug("Disabled 3d Rendering")
end

userinputservice.InputBegan:Connect(function(input, isTyping)
	if not isTyping then
		if input.KeyCode == Enum.KeyCode.Y then
			if KeyCode then
				runservice:Set3dRenderingEnabled(false)
				KeyCode = false
			else
				runservice:Set3dRenderingEnabled(true)
				KeyCode = true
			end
		end
	end
end)

if _G.KaitunConfig["Setting"]["Booster FPS"] then
	local Terrain = game.Workspace.Terrain
	Terrain.WaterWaveSize = 0
	Terrain.WaterWaveSpeed = 0
	Terrain.WaterReflectance = 0
	Terrain.WaterTransparency = 0

	local Lighting = game:GetService("Lighting")
	Lighting.GlobalShadows = false
	Lighting.FogEnd = math.huge
	Lighting.Brightness = 0

	settings().Rendering.QualityLevel = "Level01"

	for _, v in ipairs(game:GetDescendants()) do
		pcall(function()
			if v:IsA("BasePart") or v:IsA("MeshPart") then
				v.Material = "Plastic"
				v.Reflectance = 0
				if v:IsA("MeshPart") then
					v.TextureID = 10385902758728957
				end
			elseif v:IsA("Decal") or v:IsA("Texture") then
				v.Transparency = 1
			elseif v:IsA("Explosion") then
				v.BlastPressure = 1
				v.BlastRadius = 1
			elseif v:IsA("Fire") or v:IsA("SpotLight") or v:IsA("Smoke") or v:IsA("Sparkles") then
				v.Enabled = false
			end
		end)
	end

	for _, effect in ipairs(Lighting:GetChildren()) do
		if effect:IsA("BlurEffect") or effect:IsA("SunRaysEffect")
			or effect:IsA("ColorCorrectionEffect") or effect:IsA("BloomEffect")
			or effect:IsA("DepthOfFieldEffect") then
			effect.Enabled = false
		end
	end
end

function SetMonsterTransparency(monster, transparencyValue)
	if monster:IsA("Model") then
		for _, part in pairs(monster:GetDescendants()) do
			if part:IsA("BasePart") then
				part.Transparency = transparencyValue
			end
		end
	end
end

workspace.Enemies.ChildAdded:Connect(function(monster)
	task.wait(0.1)
	if monster:IsA("Model") then
		SetMonsterTransparency(monster, 0.9)
		monster.DescendantAdded:Connect(function(descendant)
			if descendant:IsA("BasePart") then
				-- print("Part added to monster:", descendant.Name)
				descendant.Transparency = 0.9
			end
		end)
	end
end)

for _, monster in pairs(workspace.Enemies:GetChildren()) do
	if monster:IsA("Model") then
		SetMonsterTransparency(monster, 0.9)
		monster.DescendantAdded:Connect(function(descendant)
			if descendant:IsA("BasePart") then
				-- print("Part added to existing monster:", descendant.Name)
				descendant.Transparency = 0.9
			end
		end)
	end
end

Start_Attack = true
Start_Magnet = true

NotifyText({
	Title = "Pictures Hub",
	Text = "Loaded Successfully",
	Time = 5
}, "Success")

if _G.KaitunConfig["Setting"]["Kaitun Ui"] then
	KaitunUi.Load()
	ClosedUi.Load()

	print("Loaded Kaitun Ui")
end

print("Loaded Success in " ..StartingTime-tick().. " sec.")
