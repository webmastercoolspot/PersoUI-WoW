
-- Copyright (c) 2019, Coolspot

local Version = 1

-- Detect events
local frame = CreateFrame("FRAME", "PersoUIFrame")
frame:RegisterEvent("PLAYER_LOGIN")
frame:RegisterEvent("PLAYER_ENTERING_WORLD")
frame:RegisterEvent("MERCHANT_SHOW")
frame:RegisterEvent("UI_ERROR_MESSAGE")

local errorMessages = {
	[ERR_ATTACK_MOUNTED]			= true,
	[ERR_MOUNT_ALREADYMOUNTED]		= true,
	[ERR_NOT_WHILE_MOUNTED]			= true,
	[ERR_TAXIPLAYERALREADYMOUNTED]		= true,
	[SPELL_FAILED_NOT_MOUNTED]		= true,
}

local function eventHandler(self, event, ...)
--------Interface Perso-----------------------
	if (event == "PLAYER_LOGIN") then
		--self:UnregisterEvent("PLAYER_ENTERING_WORLD")
		--Print qui confirme le chargement de l'addon
		DEFAULT_CHAT_FRAME:AddMessage(string.format("PersoUI Classic %i loaded.", Version ))

		--if(UnitClass("player") == "Voleuse" or UnitClass("player") == "Voleur" or UnitClass("player") == "Chasseur de démons" or UnitClass("player") == "Chasseuse de démons") then 


			--Cache UIError
			--UIErrorsFrame:Hide()
						
			--Cache dragon
			MainMenuBarLeftEndCap:Hide()
			MainMenuBarRightEndCap:Hide()
			
			--Enleve interaction Main bmenu bar pour pouvoir interagir a la souris avec les autre frame
			MainMenuBar:EnableMouse(false)
			MainMenuBarArtFrame:EnableMouse(false)
			MainMenuBarOverlayFrame:EnableMouse(false)

			--Cache Background
			--Cache la texture
			for i=0,3 do _G["MainMenuBarTexture"..i]:Hide();end
			for i=0,3 do _G["MainMenuBarTexture"..i]:SetAlpha(0);end

			for i=0,3 do _G["MainMenuMaxLevelBar"..i]:Hide();end
			for i=0,3 do _G["MainMenuMaxLevelBar"..i]:SetAlpha(0);end

			--Cache xp bar 
			--MainMenuExpBar:Hide()
			--MainMenuBarMaxLevelBar:Hide()
			--MainMenuBarMaxLevelBar:SetAlpha(0)
			MainMenuExpBar:ClearAllPoints()
			MainMenuExpBar:SetPoint("BOTTOM",0,0)
			local MainMenuExpBarMoving;
			hooksecurefunc(MainMenuExpBar, "SetPoint", function(self)
				if MainMenuExpBarMoving then return end
				MainMenuExpBarMoving = true
				self:SetMovable(true)
				self:SetUserPlaced(true)
				self:ClearAllPoints()
				self:SetPoint("BOTTOM",0,0);
				self:SetMovable(false)
				MainMenuExpBarMoving = nil
				end)
			
			ReputationWatchBar:ClearAllPoints()
			ReputationWatchBar:SetPoint("BOTTOM",0,8)
			local ReputationWatchBarMoving;
			hooksecurefunc(ReputationWatchBar, "SetPoint", function(self)
				if ReputationWatchBarMoving then return end
				ReputationWatchBarMoving = true
				self:SetMovable(true)
				self:SetUserPlaced(true)
				self:ClearAllPoints()
				self:SetPoint("BOTTOM",0,8);
				self:SetMovable(false)
				ReputationWatchBarMoving = nil
				end)
			
			--ReputationWatchBar.StatusBar:ClearAllPoints()
			--ReputationWatchBar.StatusBar:SetPoint("BOTTOM",0,6)
			--ReputationWatchBar.StatusBar.SetPoint = function() end
			
			--Cache Up down bar button et numéro page 1 - 2
			ActionBarUpButton:Hide()
			ActionBarUpButton:SetAlpha(0)
			ActionBarDownButton:Hide()
			ActionBarDownButton:SetAlpha(0)
			MainMenuBarPageNumber:Hide()
			MainMenuBarPageNumber:SetAlpha(0)
			
			--Main bar
			--MainMenuBarArtFrame:SetScale(1.28)--1.23
			for i=1,12 do _G["ActionButton"..i]:SetScale(1.28); end;

			ActionButton1:ClearAllPoints()
			ActionButton1:SetPoint("CENTER",-231,15)
			local ActionButton1Moving;
			hooksecurefunc(ActionButton1, "SetPoint", function(self)
				if ActionButton1Moving then return end
				ActionButton1Moving = true
				self:SetMovable(true)
				self:SetUserPlaced(true)
				self:ClearAllPoints()
				self:SetPoint("CENTER", -231,15);
				self:SetMovable(false)
				ActionButton1Moving = nil
				end)
			
			
			--StatusTrackingBarManager:SetScale(1.18)		

			--Barre bas gauche
			--MultiBarBottomLeft:SetScale(1.5)
			MultiBarBottomLeft:SetScale(1.28)
			--MultiBarBottomLeft:ClearAllPoints()
			MultiBarBottomLeft:SetPoint("CENTER",1,57)
			local MultiBarBottomLeftMoving;
			hooksecurefunc(MultiBarBottomLeft, "SetPoint", function(self)
				if MultiBarBottomLeftMoving then return end
				MultiBarBottomLeftMoving = true
				self:SetMovable(true)
				self:SetUserPlaced(true)
				self:ClearAllPoints()
				self:SetPoint("CENTER", 1,57);
				self:SetMovable(false)
				MultiBarBottomLeftMoving = nil
				end)
					
			--Barre Bas droite
			--MultiBarBottomRight:SetScale(1.5)
			MultiBarBottomRight:SetScale(1.28)
			--MultiBarBottomRight:ClearAllPoints()
			MultiBarBottomRight:SetPoint("LEFT",75,49)
			local MultiBarBottomRightMoving;
			hooksecurefunc(MultiBarBottomRight, "SetPoint", function(self)
				if MultiBarBottomRightMoving then return end
				MultiBarBottomRightMoving = true
				self:SetMovable(true)
				self:SetUserPlaced(true)
				self:ClearAllPoints()
				self:SetPoint("LEFT", 75,49);
				self:SetMovable(false)
				MultiBarBottomRightMoving = nil
				end)
			
			MultiBarBottomRightButton1:ClearAllPoints()			
			MultiBarBottomRightButton1:SetPoint("LEFT",76,48)
			local MultiBarBottomRightButton1Moving;
			hooksecurefunc(MultiBarBottomRightButton1, "SetPoint", function(self)
				if MultiBarBottomRightButton1Moving then return end
				MultiBarBottomRightButton1Moving = true
				self:SetMovable(true)
				self:SetUserPlaced(true)
				self:ClearAllPoints()
				self:SetPoint("LEFT",76,48);
				self:SetMovable(false)
				MultiBarBottomRightButton1Moving = nil
				end)

			--Bar des sac
			--CharacterBag0Slot:SetScale(1)
			--CharacterBag1Slot:SetScale(1)
			--CharacterBag2Slot:SetScale(1)
			--CharacterBag3Slot:SetScale(1)
			--MainMenuBarBackpackButton:SetScale(1)
			--MainMenuBarBackpackButton:ClearAllPoints()
			--MainMenuBarBackpackButton:SetPoint("BOTTOMRIGHT",245,40)
			--local MainMenuBarBackpackButtonMoving;
			--hooksecurefunc(MainMenuBarBackpackButton, "SetPoint", function(self)
			--	if MainMenuBarBackpackButtonMoving then return end
			--	MainMenuBarBackpackButtonMoving = true
			--	self:SetMovable(true)
			--	self:SetUserPlaced(true)
			--	self:ClearAllPoints()
			--	self:SetPoint("BOTTOMRIGHT",245,40);
			--	self:SetMovable(false)
			--	MainMenuBarBackpackButtonMoving = nil
			--	end)

			--barre des menu
			--CharacterMicroButton:ClearAllPoints()
			--CharacterMicroButton:SetPoint("BOTTOMRIGHT", 90,0)
			--local CharacterMicroButtonMoving;
			--hooksecurefunc(CharacterMicroButton, "SetPoint", function(self)
			--	if CharacterMicroButtonMoving then return end
			--	CharacterMicroButtonMoving = true
			--	self:SetMovable(true)
			--	self:SetUserPlaced(true)
			--	self:ClearAllPoints()
			--	self:SetPoint("BOTTOMRIGHT", 90,0);
			--	self:SetMovable(false)
			--	CharacterMicroButtonMoving = nil
			--	end)

			--icone performance
			--MainMenuBarPerformanceBarFrame:ClearAllPoints()
			--MainMenuBarPerformanceBarFrame:SetPoint("BOTTOMRIGHT", 25,-11)
			--local MainMenuBarPerformanceBarFrameMoving;
			--hooksecurefunc(MainMenuBarPerformanceBarFrame, "SetPoint", function(self)
			--	if MainMenuBarPerformanceBarFrameMoving then return end
			--	MainMenuBarPerformanceBarFrameMoving = true
			--	self:SetMovable(true)
			--	self:SetUserPlaced(true)
			--	self:ClearAllPoints()
			--	self:SetPoint("BOTTOMRIGHT", 25,-11);
			--	self:SetMovable(false)
			--	MainMenuBarPerformanceBarFrameMoving = nil
			--	end)


			-- Artwork
			MicroMenuArt:Show()
			MicroMenuArt:SetFrameStrata("BACKGROUND")

			-- MicroMenu Buttons
			for i = 1, #MICRO_BUTTONS do
				local button, previousButton = _G[MICRO_BUTTONS[i]], _G[MICRO_BUTTONS[i-1]]

				button:ClearAllPoints()
				-- button:SetSize(28, 58)

				if i == 1 then
					button:SetPoint("BOTTOMRIGHT", 47, 4)
					local buttonMoving;
					hooksecurefunc(button, "SetPoint", function(self)
						if buttonMoving then return end
						buttonMoving = true
						self:SetMovable(true)
						self:SetUserPlaced(true)
						self:ClearAllPoints()
						self:SetPoint("BOTTOMRIGHT", 47, 4)
						self:SetMovable(false)
						buttonMoving = nil
						end)
				elseif i == 4 and UnitLevel("player") < SHOW_SPEC_LEVEL then
					button:SetPoint("BOTTOMLEFT", previousButton, "BOTTOMRIGHT", 0, 0)
				else
					button:SetPoint("BOTTOMRIGHT", previousButton, 28, 0)
				end
			end

			-- Latency Bar
			MainMenuBarPerformanceBarFrame:SetFrameStrata("HIGH")
			MainMenuBarPerformanceBarFrame:SetScale((HelpMicroButton:GetWidth() / MainMenuBarPerformanceBarFrame:GetWidth()) * (1 / 3))

			MainMenuBarPerformanceBar:SetRotation(math.pi * 0.5)
			MainMenuBarPerformanceBar:ClearAllPoints()
			MainMenuBarPerformanceBar:SetPoint("BOTTOM", HelpMicroButton, -1, -24)

			MainMenuBarPerformanceBarFrameButton:ClearAllPoints()
			MainMenuBarPerformanceBarFrameButton:SetPoint("BOTTOMLEFT", MainMenuBarPerformanceBar, -(MainMenuBarPerformanceBar:GetWidth() / 2), 0)
			MainMenuBarPerformanceBarFrameButton:SetPoint("TOPRIGHT", MainMenuBarPerformanceBar, MainMenuBarPerformanceBar:GetWidth() / 2, -28)

			--KeyRingButton
			KeyRingButton:ClearAllPoints()
			KeyRingButton:SetPoint("BOTTOM", HelpMicroButton, -171, 39)
			local KeyRingButtonMoving;
			hooksecurefunc(KeyRingButton, "SetPoint", function(self)
				if KeyRingButtonMoving then return end
				KeyRingButtonMoving = true
				self:ClearAllPoints()
				self:SetPoint("BOTTOM", HelpMicroButton, -171, 39)
				KeyRingButtonMoving = nil
				end)

			-- Bags
			MainMenuBarBackpackButton:SetScale(1)
			MainMenuBarBackpackButton:ClearAllPoints()
			MainMenuBarBackpackButton:SetPoint("BOTTOM", HelpMicroButton, -7, 42)
			for i = 0, 3 do
				local bagFrame, previousBag = _G["CharacterBag" .. i .. "Slot"], _G["CharacterBag" .. i-1 .. "Slot"]

				bagFrame:SetScale(0.75)
				bagFrame:ClearAllPoints()

				if i == 0 then
					bagFrame:SetPoint("BOTTOMRIGHT", MainMenuBarBackpackButton, "BOTTOMLEFT", -9, 1)
				else
					bagFrame:SetPoint("BOTTOMRIGHT", previousBag, "BOTTOMLEFT", -6, 0)
				end
			end
			
			--FramerateText
			FramerateLabel:ClearAllPoints()
			FramerateLabel:SetPoint("BOTTOM", 0,160)
			local FramerateLabelMoving;
			hooksecurefunc(FramerateLabel, "SetPoint", function(self)
				if FramerateLabelMoving then return end
				FramerateLabelMoving = true
				self:ClearAllPoints()
				self:SetPoint("BOTTOM", 0,160);
				FramerateLabelMoving = nil
				end)

			--Stance
			StanceButton1:ClearAllPoints()
			StanceButton1:SetPoint("CENTER",162,95)
			local StanceButton1Moving;
			hooksecurefunc(StanceButton1, "SetPoint", function(self)
				if StanceButton1Moving then return end
				StanceButton1Moving = true
				self:SetMovable(true)
				self:SetUserPlaced(true)
				self:ClearAllPoints()
				self:SetPoint("CENTER",162,95);
				self:SetMovable(false)
				StanceButton1Moving = nil
				end)

			--Buff et Debuff
			BuffFrame:ClearAllPoints()
			BuffFrame:SetScale(1.3)
			BuffFrame:SetPoint("TOPRIGHT",-250,-10)
			local BuffFrameMoving;
			hooksecurefunc(BuffFrame, "SetPoint", function(self)
				if BuffFrameMoving then return end
				BuffFrameMoving = true
				self:SetMovable(true)
				self:SetUserPlaced(true)
				self:ClearAllPoints()
				self:SetPoint("TOPRIGHT",-250,-10);
				self:SetMovable(false)
				BuffFrameMoving = nil
				end)

			--Player Frame
			PlayerFrame:SetScale(1.18)
			TargetFrame:SetScale(1.25)
		
		
		--Bouton Leave Vehicule
			MainMenuBarVehicleLeaveButton:ClearAllPoints();
			MainMenuBarVehicleLeaveButton:SetPoint("CENTER",-235,175);
			local MainMenuBarVehicleLeaveButtonMoving;
			hooksecurefunc(MainMenuBarVehicleLeaveButton, "SetPoint", function(self)
				if MainMenuBarVehicleLeaveButtonMoving then return end
				MainMenuBarVehicleLeaveButtonMoving = true
				self:SetMovable(true)
				self:SetUserPlaced(true)
				self:ClearAllPoints()
				self:SetPoint("CENTER",-235,175)
				self:SetMovable(false)
				MainMenuBarVehicleLeaveButtonMoving = nil
				end)
			
			--Framerate Label
			FramerateLabel:ClearAllPoints();
			FramerateLabel:SetPoint("BOTTOM",0,160);
			local FramerateLabelMoving;
			hooksecurefunc(FramerateLabel, "SetPoint", function(self)
				if FramerateLabelMoving then return end
				FramerateLabelMoving = true
				self:ClearAllPoints()
				self:SetPoint("BOTTOM",0,160)
				FramerateLabelMoving = nil
				end)
				
			--FocusFrame:SetScale(1.25)
			--FocusFrameSpellBar:SetScale(1.35)

			--MiniMap et Quest Tracker
			--MinimapCluster:SetScale(1.3)

			--ObjectiveTrackerFrame:SetScale(0.9)

			--Quest Tracker en BG
			--local _, instanceType = IsInInstance()
			--if instanceType == "pvp" then
			--	ObjectiveTrackerFrame:Hide()
			--end

			
			
	end

--------Reparer et vendre---------------------
	if (event == "MERCHANT_SHOW") then
		--Vente
		OpenAllBags();
		local copper = 0;
		for bags = 0, 4 do
			for slot = 1, GetContainerNumSlots( bags ) do
				local item = GetContainerItemLink( bags, slot );
				if( item ) then
					local _,_,quality,_,_,_,_,_,_,_,price = GetItemInfo( item );
					local _, count = GetContainerItemInfo( bags, slot );
					if( quality == 0 and price ~= 0 ) then
						DEFAULT_CHAT_FRAME:AddMessage(item);						
						copper = copper + ( price * count );
						UseContainerItem( bags, slot );
					end
				end
			end
		end
		if( copper ~= 0 ) then
			DEFAULT_CHAT_FRAME:AddMessage("Items vendu pour : " .. GetCoinText( copper ) );
		end

		--Repair		
		if (CanMerchantRepair()) then
			repairCost = GetRepairAllCost();
			curMoney = GetMoney();
			if (0 < repairCost) then
				if (repairCost <= curMoney) then
					RepairAllItems(false);
					DEFAULT_CHAT_FRAME:AddMessage("Réparation faite pour " .. GetCoinText(repairCost, " "));
				else
					DEFAULT_CHAT_FRAME:AddMessage("Pas asser de gold");
				end
			end
		end
		--self:UnregisterEvent("MERCHANT_SHOW")	
	end
-------------------------------------	

--------Auto Dismount ---------------------
	if (event == "UI_ERROR_MESSAGE") then

		if not IsMounted() or not errorMessages[select(2, ...)] then return end

		Dismount()
		UIErrorsFrame:Clear()

	end
-------------------------------------	
end

frame:HookScript("OnEvent", eventHandler)
