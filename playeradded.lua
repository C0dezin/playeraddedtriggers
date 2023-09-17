local tps = game:GetService("TeleportService")
local placeid = 11926088664

local DataStoreService = game:GetService("DataStoreService")
local DataStore = DataStoreService:GetDataStore("PlayerData")

local StarterData = {
	Money = 100,
	HistoryName = "none",
	alicequest = 0,
	Level = 1,
	Ban = 0,
	Mana = 100,
	MaxMana = 100,
	lostmemoriesquest = 0,
	therealthing = 0,
	LastTask = "nenhuma",
	carnageblueflowers = 0,
	azhdrinkedpotion = 0,
	carnagebluecompleted = 0,
	orcafindtiquincompletedtask = 0,
	InicialSword = 0,
	carnagefortnite = 0,
	alreadyhavebenefits = 0
}

game.Players.PlayerAdded:connect(function(Player)
	local function fixhealth()
	local char = Player.Character or Player.CharacterAdded:Wait()
	char.Humanoid.Health = -100
	wait(2)
		char.Humanoid.Health = 100
	end
	local function checkban()
		local yep = true
		while yep do
			wait(0.5)
			local ban = Player:GetAttribute('Ban')
			if ban == 1 then
				tps:Teleport(placeid,Player)
				wait(15)
				Player:Kick("[ANTI-CHEAT] Netlimiter? you're joking w me")
			end
		end
	end	
	local function alicequestchecks()
		wait(5)
		local LSM = Player:GetAttribute('lostmemoriesquest')
		local aq = Player:GetAttribute("alicequest")
		if LSM == 1 then
			workspace.tampacaverna:Destroy()
			workspace.neonarrowquest1:Destroy()
			workspace.neonarrowquest2:Destroy()
			workspace.neonarrowquest3:Destroy()
			workspace.neonarrowquest4:Destroy()
			workspace.caminho2:Destroy()
			workspace.caminho3:Destroy()
			workspace.caminho4:Destroy()
			workspace.caminho5:Destroy()
			workspace.caminho7:Destroy()
			workspace.caminho8:Destroy()
			workspace.caminho9:Destroy()
			workspace.caminho10:Destroy()
			workspace.caminho11:Destroy()
			workspace.caminho12:Destroy()
			workspace.caminho13:Destroy()
			workspace.caminho14:Destroy()

			if aq == 1 then
				workspace.Mariah.Torso.CFrame = workspace.mariahteleportinside.CFrame
				workspace.Alice.Torso.CFrame = workspace.tpsaver.CFrame
				workspace.Mariahreal.Torso.CFrame = workspace.realmomalice.CFrame
				workspace.Boss:Destroy()
				workspace.proximityalicejail:Destroy()
				workspace.poweractive:Destroy()
				workspace.Jaula:Destroy()
				local completed = Player:GetAttribute("therealthing")
				if completed == 0 then
					workspace.startlistening.CanCollide = true
					workspace.startlistening.CanTouch = true
				end
			end
		end
	end
	local function alphaplayersbadge()
		local BadgeID = 2130044059
		local DefaultNum = 00000000  -- <-- DO NOT change this to your ID or the script will break!
		print("Giving BadgeID: " .. BadgeID .. " to: " .. Player.Name)
		local b = game:GetService("BadgeService")
		b:AwardBadge(Player.userId, BadgeID)
	end
	local function deleteuselessobjectsonload()
		workspace.panda07448:Destroy()
		workspace.Dummyone:Destroy()
		workspace.Dummytwo:Destroy()
		workspace.Dummythree:Destroy()
		workspace.Dummyfour:Destroy()
		workspace.Dummyfive:Destroy()
		workspace["Sword Dummy"]:Destroy()
		workspace.Dummy:Destroy()
		workspace.goofypart:Destroy()
		workspace.TemplateR15:Destroy()
		workspace.TemplateR16:Destroy()
		workspace.TemplateR17:Destroy()
	end
	local function resetzombiebosslife()
		wait(15)
		local aq = Player:GetAttribute("alicequest")
		Player.CharacterAdded:connect(function()
			if aq == 0 then
				workspace.Boss.Humanoid.Health = 200
			end
		end)
	end
	local function falldamage()
		local character = Player.Character or Player.CharacterAdded:Wait()
		local humanoid = character:WaitForChild("Humanoid")

		local minVelocity = -65
		local multiplier = 4

		humanoid.StateChanged:Connect(function(oldState, newState)
			if newState == Enum.HumanoidStateType.Freefall then
				local fallVelocity = character.PrimaryPart.AssemblyLinearVelocity.Y
				if fallVelocity < minVelocity then
					local fallDamage = multiplier * math.sqrt(math.abs(fallVelocity - minVelocity))
					humanoid:TakeDamage(fallDamage)
				end
			end
		end)
	end
	local function givegearsfordaboys()
		wait(10)
		local ss = game:GetService("ServerStorage")
		local is = game:GetService("InsertService")
		--orca
		if Player.UserId == 136511722 then
			local item = ss.BatKnightBatSword:Clone()
			item.Parent = Player.Backpack		
			ss.BatKnightBatSword:Destroy()
			--carnage
		elseif Player.UserId == 1176082613 then
			local item = ss.Carnagecopia:Clone()
			item.Parent = Player.Backpack
			ss.Carnagecopia:Destroy()
			--nag
		elseif Player.UserId == 21945492 then
			local item = ss.AlienStaff:Clone()
			item.Parent = Player.Backpack
			ss.AlienStaff:Destroy()

		elseif Player.UserId == 915008280 then
			local item = ss.SwordOfLight:Clone()
			item.Parent = Player.Backpack
			ss.SwordOfLight:Destroy()
		else
			ss.AlienStaff:Destroy()
			ss.BatKnightBatSword:Destroy()
			ss.Carnagecopia:Destroy()
			ss.SwordOfLight:Destroy()
		end
	end
	local function datastoreload()
		--pcall = Protect Call
		local succes, PlayerData = pcall(function()
			return DataStore:GetAsync(Player.UserId) or StarterData
		end)
		Player:SetAttribute("Money", PlayerData["Money"])
		Player:SetAttribute("HistoryName", PlayerData["HistoryName"])
		Player:SetAttribute("alicequest", PlayerData["alicequest"])
		Player:SetAttribute("Ban", PlayerData["Ban"])
		Player:SetAttribute("Level", PlayerData["Level"])
		Player:SetAttribute("Mana", PlayerData["Mana"])
		Player:SetAttribute("MaxMana", PlayerData["MaxMana"])
		Player:SetAttribute("lostmemoriesquest", PlayerData["lostmemoriesquest"])
		Player:SetAttribute("therealthing", PlayerData["therealthing"])
		Player:SetAttribute("LastTask", PlayerData["LastTask"])
		Player:SetAttribute("carnageblueflowers", PlayerData["carnageblueflowers"])
		Player:SetAttribute("azhpotiondrinked", PlayerData["azhdrinkedpotion"])
		Player:SetAttribute("carnagebluequestcompleted", PlayerData["carnagebluecompleted"])
		Player:SetAttribute("orcafindtiquincompleted", PlayerData["orcafindtiquincompletedtask"])
		Player:SetAttribute("InicialSword", PlayerData["InicialSword"])
		Player:SetAttribute("carnagefortnite", PlayerData["carnagefortnite"])
		Player:SetAttribute("alreadyhavebenefits", PlayerData["alreadyhavebenefits"])

		if not PlayerData["carnagefortnite"] then
			print("carnagenaobanana7")
		end

		wait(5)

		local is = Player:GetAttribute("InicialSword")

		if is == 1 then
			local sword = game.ServerStorage.Tools.Katana:Clone()
			sword.Parent = Player.Backpack
		end
	end
	local function setlastquest()
		local s = workspace.questsound

		workspace.tiquin.MeshPart.Transparency = 1

		game.Workspace.CarnagecopiaEnjoyer.Head.proximityholder.proximity.Enabled = false
		game.Workspace.orca.Head.proximityone.Enabled = false

		s:Stop()
		wait(10)
		local aq = Player:GetAttribute("alicequest")
		local is = Player:GetAttribute("InicialSword")
		local lm = Player:GetAttribute("lostmemoriesquest")
		local trt = Player:GetAttribute("therealthing")
		local lt = Player:GetAttribute("LastTask")
		local azhdp = Player:GetAttribute("azhpotiondrinked")
		local orcatiquintask = Player:GetAttribute("orcafindtiquincompleted")
		local carnagebluetask = Player:GetAttribute("carnagebluequestcompleted")

		if is == 1 and aq == 0 then
			s:Play()
			local qgui = Player:WaitForChild("PlayerGui"):WaitForChild("QuestsGUI")
			qgui.Frame.questname.Text = "An good search"
			qgui.Frame.questdescription.Text = "Find Alice"
			qgui.Frame.questispors.Text = "Primary quest"
			qgui.Enabled = true
			game.Workspace.caminhoiceinicio.Transparency = 0
			game.Workspace["Neon Arrow"]:Destroy()
			workspace.caminho15.Transparency = 0
			workspace.caminho16.Transparency = 0
			workspace.caminho17.Transparency = 0
			workspace.caminho18.Transparency = 0
			workspace.caminho19.Transparency = 0
			workspace.caminho20.Transparency = 0
			workspace.caminho21.Transparency = 0
		end
		if is == 1 and aq == 1 and lm == 0 then
			s:Play()
			local qgui = Player:WaitForChild("PlayerGui"):WaitForChild("QuestsGUI")
			qgui.Frame.questname.Text = "Lost memories"
			qgui.Frame.questdescription.Text = "Why you said ?"
			qgui.Frame.questispors.Text = "Primary quest"
			qgui.Enabled = true
			workspace.Boss:Destroy()
			workspace.Alice.Torso.CFrame = workspace.tpsaver.CFrame
			workspace.Jaula:Destroy()
			workspace.neonarrowquest1.Transparency = 0
			workspace.neonarrowquest2.Transparency = 0
			workspace.neonarrowquest3.Transparency = 0
			workspace.neonarrowquest4.Transparency = 0
			workspace.caminho2.Transparency = 0
			workspace.caminho3.Transparency = 0
			workspace.caminho4.Transparency = 0
			workspace.caminho5.Transparency = 0
			workspace.caminho7.Transparency = 0
			workspace.caminho8.Transparency = 0
			workspace.caminho9.Transparency = 0
			workspace.caminho10.Transparency = 0
			workspace.caminho11.Transparency = 0
			workspace.caminho12.Transparency = 0
			workspace.caminho13.Transparency = 0
			workspace.caminho14.Transparency = 0
			workspace.caminho22.Transparency = 0
			workspace.caminho21:Destroy()
			workspace.caminho20:Destroy()
			workspace.caminho19:Destroy()
			workspace.caminho18:Destroy()
			workspace.caminho17:Destroy()
			workspace.caminho16:Destroy()
			workspace.caminho15:Destroy()
			workspace.caminho22:Destroy()

			workspace.caminhoiceinicio:Destroy()
			game.Workspace["Neon Arrow"]:Destroy()
		end
		if is == 1 and aq == 1 and lm == 1 and trt == 0 then
			s:Play()
			workspace.onquestdisable:Destroy()		
			local qgui = Player:WaitForChild("PlayerGui"):WaitForChild("QuestsGUI")
			qgui.Frame.questname.Text = " WAIT WHAT??!!"
			qgui.Frame.questdescription.Text = "Go to the ice montain cave!!!"
			qgui.Frame.questispors.Text = "Secondary quest"
			qgui.Enabled = true
			local event = game:GetService("ReplicatedStorage").cutscenetwomariah
			event:FireAllClients()
			workspace.caminho15:Destroy()
			workspace.caminho16:Destroy()
			workspace.caminho17:Destroy()
			workspace.caminho18:Destroy()
			workspace.caminho19:Destroy()
			workspace.caminho20:Destroy()
			workspace.caminho21:Destroy()
			workspace.caminhoiceinicio:Destroy()
			game.Workspace["Neon Arrow"]:Destroy()
		end
		if is == 1 and aq == 1 and lm == 1 and trt == 1 then
			local sss = game:GetService("ServerScriptService")
			sss.fire:Destroy()
			workspace.onquestdisable:Destroy()
		end
		--carnageblueflowers
		local proximitypromptcarnagetwo = game.Workspace.CarnagecopiaEnjoyer.Head.proximityholder.proximitytwo
		if lt == "carnageblue" then
			s:Play()
			game.Workspace.CarnagecopiaEnjoyer.Head.proximityholder.proximity.Enabled = false
			local currentflowers = Player:GetAttribute("carnageblueflowers")
			local qgui = Player:WaitForChild("PlayerGui"):WaitForChild("QuestsGUI")
			qgui.Frame.questname.Text = "Find 5 flowers"
			qgui.Frame.questdescription.Text = currentflowers.."/5"
			qgui.Frame.questispors.Text = "Secondary quest"
			qgui.Enabled = true
			game.Workspace.blueflowerone.Model.holder.ProximityPrompt.Enabled = true
			game.Workspace.blueflowertwo.Model.holder.ProximityPrompt.Enabled = true
			game.Workspace.blueflowerthree.Model.holder.ProximityPrompt.Enabled = true
			game.Workspace.blueflowerfour.Model.holder.ProximityPrompt.Enabled = true
			game.Workspace.blueflowerfive.Model.holder.ProximityPrompt.Enabled = true
			if currentflowers >= 5 then
				local qgui = Player:WaitForChild("PlayerGui"):WaitForChild("QuestsGUI")
				qgui.Frame.questdescription.Text = "Talk to carnage again!"
				proximitypromptcarnagetwo.Enabled = true
				game.Workspace.blueflowerone.Model.holder.ProximityPrompt.Enabled = false
				game.Workspace.blueflowertwo.Model.holder.ProximityPrompt.Enabled = false
				game.Workspace.blueflowerthree.Model.holder.ProximityPrompt.Enabled = false
				game.Workspace.blueflowerfour.Model.holder.ProximityPrompt.Enabled = false
				game.Workspace.blueflowerfive.Model.holder.ProximityPrompt.Enabled = false
			end
		end
		if trt == 1 and orcatiquintask == 0 then
			game.Workspace.orca.Head.proximityone.Enabled = true
		end

		if trt == 1 and carnagebluetask == 0 then
			game.Workspace.CarnagecopiaEnjoyer.Head.proximityholder.proximity.Enabled = true
		end

		if azhdp == 1 then
			game.Workspace.AZH291.Head.ProximityPrompt.Enabled = false
			game.ServerStorage.potion:Destroy()
			game.Workspace.azhactive:Destroy()
		end

		if lt == "orcatiquin" then
			game.Workspace.orca.Head.proximityone.Enabled = false
			game.Workspace.tiquin.holder.proximity.Enabled = true
			game.Workspace.tiquin.Highlight.Enabled = true
			game.Workspace.tiquin.MeshPart.Transparency = 0
			local qgui = Player:WaitForChild("PlayerGui"):WaitForChild("QuestsGUI")
			qgui.Frame.questname.Text = "Find tiquin"
			qgui.Frame.questdescription.Text = "Please find the dog!"
			qgui.Frame.questispors.Text = "Secondary quest"
			qgui.Enabled = true
		end
	end
	coroutine.wrap(fixhealth)
	coroutine.wrap(checkban)
	coroutine.wrap(alicequestchecks)
	coroutine.wrap(alphaplayersbadge)
	coroutine.wrap(resetzombiebosslife)
	coroutine.wrap(falldamage)
	coroutine.wrap(givegearsfordaboys)
	coroutine.wrap(datastoreload)
	coroutine.wrap(setlastquest)
end)
