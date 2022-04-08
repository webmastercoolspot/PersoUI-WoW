
-- Copyright (c) 2018, Coolspot

local Version = 2

-- Detect events
local frame = CreateFrame("FRAME", "PersoUIFrame")
frame:RegisterEvent("PLAYER_LOGIN")
frame:RegisterEvent("PLAYER_ENTERING_WORLD")
frame:RegisterEvent("MERCHANT_SHOW")
frame:RegisterEvent("TALKINGHEAD_REQUESTED")
frame:RegisterEvent("ARENA_PREP_OPPONENT_SPECIALIZATIONS")
--frame:RegisterEvent("VEHICLE_UPDATE") 
--frame:RegisterEvent("WORLD_MAP_UPDATE")

--local function styleActionButton()
	--hooksecurefunc(ActionButton1NormalTexture, "SetVertexColor", function(self)
	--	      ActionButton1NormalTexture:SetVertexColor(0.4,0.4,0.4,1)
	--	 end)
--end

--Dampening
local eventHandlerDamp = CreateFrame("Frame", "DampFrameArena" , UIParent)
-- Dampening indicator for arena. using the eventHandler frame because why not
local updateInterval = 5
local dampeningText = GetSpellInfo(110310)
eventHandlerDamp:Hide()
eventHandlerDamp:SetSize(200, 12)
eventHandlerDamp:SetScale(1.2)
eventHandlerDamp:SetPoint("TOP", UIWidgetTopCenterContainerFrame, "BOTTOM", 0, -5)
eventHandlerDamp.text = eventHandlerDamp:CreateFontString(nil, "BACKGROUND")
eventHandlerDamp.text:SetFontObject(GameFontNormalSmall)
eventHandlerDamp.text:SetAllPoints()
eventHandlerDamp.timeSinceLastUpdate = 0

eventHandlerDamp:SetScript("OnUpdate", function(self, elapsed)
	self.timeSinceLastUpdate = self.timeSinceLastUpdate + elapsed

	if self.timeSinceLastUpdate > updateInterval then
		self.timeSinceLastUpdate = 0

		self.text:SetText(dampeningText..": "..C_Commentator.GetDampeningPercent().."%")
	end
end)

local function eventHandler(self, event, ...)
--------Interface Perso-----------------------
	if (event == "PLAYER_LOGIN") then
		--self:UnregisterEvent("PLAYER_LOGIN")
		--Print qui confirme le chargement de l'addon
		DEFAULT_CHAT_FRAME:AddMessage(string.format("PersoUI %i loaded.", Version ))

		--if(UnitClass("player") == "Voleuse" or UnitClass("player") == "Voleur" or UnitClass("player") == "Chasseur de démons" or UnitClass("player") == "Chasseuse de démons") then 


			--Cache dragon
			MainMenuBarArtFrame.LeftEndCap:Hide()
			MainMenuBarArtFrame.RightEndCap:Hide()
			
			--Enleve interaction Main bmenu bar pour pouvoir interagir a la souris avec les autre frame
			MainMenuBar:EnableMouse(false)
			MainMenuBarArtFrame:EnableMouse(false)

			--Cache Background
			MainMenuBarArtFrameBackground:Hide()
			MainMenuBarArtFrameBackground:SetAlpha(0)
			
			--Cache Up down bar button et numéro page 1 - 2
			--ActionBarUpButton:Hide()
			--ActionBarUpButton:SetAlpha(0)
			--ActionBarDownButton:Hide()
			--ActionBarDownButton:SetAlpha(0)
			--MainMenuBarArtFrame.PageNumber:Hide()
			--MainMenuBarArtFrame.PageNumber:SetAlpha(0)
			--MainMenuBarArtFrame.PageNumber:ClearAllPoints()
			--MainMenuBarArtFrame.PageNumber:SetPoint("TOP",500,-300)
			local MainMenuBarArtFramePageNumberMoving;
			hooksecurefunc(MainMenuBarArtFrame.PageNumber, "SetPoint", function(self)
				if MainMenuBarArtFramePageNumberMoving then return end
				MainMenuBarArtFramePageNumberMoving = true
				--self:SetMovable(true)
				--self:SetUserPlaced(true)
				self:ClearAllPoints()
				self:SetPoint("BOTTOM",parent,352,35)
				--self:SetMovable(false)
				MainMenuBarArtFramePageNumberMoving = nil
				end)
			
			
			--Main bar
			--MainMenuBarArtFrame:SetScale(1.28)--1.23
			for i=1,12 do _G["ActionButton"..i]:SetScale(1.28); end;

			
			
			ActionButton1:ClearAllPoints()
			ActionButton1:SetPoint("CENTER",-217,-6)
			--local ActionButton1Moving;
			--hooksecurefunc(ActionButton1, "SetPoint", function(self)
			--	--if ActionButton1Moving then return end
			--	--ActionButton1Moving = true
			--	--self:SetMovable(true)
			--	--self:SetUserPlaced(true)
			--	self:ClearAllPoints()
			--	self:SetPoint("CENTER", -217,-6)
			--	--self:SetMovable(false)
			--	--ActionButton1Moving = nil
			--	end)
			
			
			--StatusTrackingBarManager:SetScale(1.18)		

			--Barre bas gauche
			--MultiBarBottomLeft:SetScale(1.5)
			MultiBarBottomLeft:SetScale(1.28)
			MultiBarBottomLeftButton1:ClearAllPoints()
			MultiBarBottomLeftButton1:SetPoint("BOTTOMLEFT",0,-9)
			--local MultiBarBottomLeftMoving;
			--hooksecurefunc(MultiBarBottomLeft, "SetPoint", function(self)
			--	if MultiBarBottomLeftMoving then return end
			--	MultiBarBottomLeftMoving = true
			--	--self:SetMovable(true)
			--	--self:SetUserPlaced(true)
			--	self:ClearAllPoints()
			---	self:SetPoint("CENTER", 15,35)
			--	--self:SetMovable(false)
			--	MultiBarBottomLeftMoving = nil
			--	end)
			
			--Barre Bas droite
			--MultiBarBottomRight:SetScale(1.5)
			MultiBarBottomRight:SetScale(1.28)
			--MultiBarBottomRight:ClearAllPoints()
			--MultiBarBottomRight:SetPoint("BOTTOMLEFT", 79,75)
			--local MultiBarBottomRightMoving;
			--hooksecurefunc(MultiBarBottomRight, "SetPoint", function(self)
			--	if MultiBarBottomRightMoving then return end
			--	MultiBarBottomRightMoving = true
			--	--self:SetMovable(true)
			--	--self:SetUserPlaced(true)
			--	self:ClearAllPoints()
			--	self:SetPoint("BOTTOMLEFT", 79,75)
			--	--self:SetMovable(false)
			--	MultiBarBottomRightMoving = nil
			--	end)
			
			MultiBarBottomRightButton1:ClearAllPoints()			
			MultiBarBottomRightButton1:SetPoint("BOTTOMLEFT",-543,80)
			--local MultiBarBottomRightButton1Moving;
			--hooksecurefunc(MultiBarBottomRightButton1, "SetPoint", function(self)
			--	if MultiBarBottomRightButton1Moving then return end
			--	MultiBarBottomRightButton1Moving = true
			--	--self:SetMovable(true)
			--	--self:SetUserPlaced(true)
			--	self:ClearAllPoints()
			--	self:SetPoint("CENTER",-200,-40)
			--	--self:SetMovable(false)
			--	MultiBarBottomRightButton1Moving = nil
			--	end)
			
			MultiBarBottomRightButton7:ClearAllPoints()			
			MultiBarBottomRightButton7:SetPoint("BOTTOMRIGHT",-505,80)
			--local MultiBarBottomRightButton7Moving;
			--hooksecurefunc(MultiBarBottomRightButton7, "SetPoint", function(self)
			--	if MultiBarBottomRightButton7Moving then return end
			--	MultiBarBottomRightButton7Moving = true
			--	--self:SetMovable(true)
			--	--self:SetUserPlaced(true)
			--	self:ClearAllPoints()
			--	self:SetPoint("RIGHT",38,-1)
			--	--self:SetMovable(false)
			--	MultiBarBottomRightButton7Moving = nil
			--	end)
			
			
			--Menu du perso
			--CharacterMicroButton:SetScale(0.79)
			--SpellbookMicroButton:SetScale(0.79)
			--TalentMicroButton:SetScale(0.79)
			--AchievementMicroButton:SetScale(0.79)
			--QuestLogMicroButton:SetScale(0.79)
			--GuildMicroButton:SetScale(0.79)
			--LFDMicroButton:SetScale(0.79)
			--CollectionsMicroButton:SetScale(0.79)
			--EJMicroButton:SetScale(0.79)
			--StoreMicroButton:SetScale(0.79)
			--MainMenuMicroButton:SetScale(0.79)

			--Buff et Debuff
			--BuffFrame:ClearAllPoints()
			BuffFrame:SetScale(1.15)
			--BuffFrame:SetPoint("TOPRIGHT",MiniMap,"TOPRIGHT",-290,-10)
			local BuffFrameMoving;
			hooksecurefunc(BuffFrame, "SetPoint", function(self)
				if BuffFrameMoving then return end
				BuffFrameMoving = true
				--self:SetMovable(true)
				--self:SetUserPlaced(true)
				self:ClearAllPoints()
				self:SetPoint("TOPRIGHT",MiniMap,"TOPRIGHT",-290,-10)
				--self:SetMovable(false)
				BuffFrameMoving = nil
				end)

			--Player Frame
			--PlayerFrame:SetScale(1.1)
			--TargetFrame:SetScale(1.17)
		
			--FocusFrame:SetScale(1.20)
			FocusFrameSpellBar:SetScale(1.35)
			--FocusFrameSpellBar:SetPoint("TOP", FocusFrame, "TOP", -100,-510)
		
			ObjectiveTrackerFrame:SetScale(0.9)

			--Quest Tracker en BG
			--local _, instanceType = IsInInstance()
			--if instanceType == "pvp" then
			--	ObjectiveTrackerFrame:Hide()
			--end

			--MiniMap et Quest Tracker
			--MinimapCluster:SetScale(1.3)



			
			--Stance
			StanceButton1:ClearAllPoints()
			StanceButton1:SetPoint("CENTER",70,75)
			--local StanceButton1Moving;
			--hooksecurefunc(StanceButton1, "SetPoint", function(self)
			--	if StanceButton1Moving then return end
			--	StanceButton1Moving = true
			--	--self:SetMovable(true)
			--	--self:SetUserPlaced(true)
			--	self:ClearAllPoints()
			--	self:SetPoint("CENTER",70,75)
			--	--self:SetMovable(false)
			--	StanceButton1Moving = nil
			--	end)

			--menu bar a virer si marche pas pour fly
			--MainMenuBarVehicleLeaveButton:ClearAllPoints()
			--MainMenuBarVehicleLeaveButton:SetPoint("CENTER",90,75)
			--local MainMenuBarVehicleLeaveButtonMoving;
			--hooksecurefunc(MainMenuBarVehicleLeaveButton, "SetPoint", function(self)
			--	if MainMenuBarVehicleLeaveButtonMoving then return end
			--	MainMenuBarVehicleLeaveButtonMoving = true
			--	self:SetMovable(true)
			--	self:SetUserPlaced(true)
			--	self:ClearAllPoints()
			--	self:SetPoint("CENTER",90,75);
			--	self:SetMovable(false)
			--	MainMenuBarVehicleLeaveButtonMoving = nil
			--	end)
			
			--Extra Bouton
			--ExtraActionButton1:ClearAllPoints()
			--ExtraActionButton1:SetPoint("BOTTOM",270,20)
			ExtraActionButton1.style:Hide()
			--local ExtraActionButton1Moving;
			--hooksecurefunc(ExtraActionButton1, "SetPoint", function(self)
			--	if ExtraActionButton1Moving then return end
			--	ExtraActionButton1Moving = true
			--	--self:SetMovable(true)
			--	--self:SetUserPlaced(true)
			--	self:ClearAllPoints()
			--	self:SetPoint("CENTER",350,40)
			--	--self:SetMovable(false)
			--	ExtraActionButton1Moving = nil
			--	end)
			
			--Procces Button event (echiquier)
			PossessButton1:ClearAllPoints()
			PossessButton1:SetPoint("LEFT",73,70)
			--MainMenuBarArtFrame:SetScale(1.28)--1.23
			for i=1,2 do _G["PossessBackground"..i]:Hide(); end;
			for i=1,2 do _G["PossessBackground"..i]:SetAlpha(0); end;
			
				
			--Zone Ability and extra Button Bouton
			ZoneAbilityFrame:ClearAllPoints()
			ZoneAbilityFrame:SetPoint("TOP",0,-560)
			ZoneAbilityFrame.Style:Hide()
			
			ExtraAbilityContainer:ClearAllPoints()
			ExtraAbilityContainer:SetPoint("TOP",0,-560)
			
			--local ZoneAbilityFrameMoving;
			--hooksecurefunc(ZoneAbilityFrame, "SetPoint", function(self)
			--	if ZoneAbilityFrame then return end
			--	ZoneAbilityFrameMoving = true
			--	--self:SetMovable(true)
			--	--self:SetUserPlaced(true)
			--	self:ClearAllPoints()
			--	self:SetPoint("TOP",350,-450)
			--	--self:SetMovable(false)
			--	ZoneAbilityFrameMoving = nil
			--	end)
			
			--Bouton Leave Vehicule
			--MainMenuBarVehicleLeaveButton:ClearAllPoints();
			--MainMenuBarVehicleLeaveButton:SetPoint("CENTER",-288,200);
			local MainMenuBarVehicleLeaveButtonMoving;
			hooksecurefunc(MainMenuBarVehicleLeaveButton, "SetPoint", function(self)
				if MainMenuBarVehicleLeaveButtonMoving then return end
				MainMenuBarVehicleLeaveButtonMoving = true
				--self:SetMovable(true)
				--self:SetUserPlaced(true)
				self:ClearAllPoints()
				self:SetPoint("CENTER",-288,200)
				--self:SetMovable(false)
				MainMenuBarVehicleLeaveButtonMoving = nil
				end)
			
			--Framerate Label
			--FramerateLabel:ClearAllPoints();
			--FramerateLabel:SetPoint("BOTTOM",0,160);
			local FramerateLabelMoving;
			hooksecurefunc(FramerateLabel, "SetPoint", function(self)
				if FramerateLabelMoving then return end
				FramerateLabelMoving = true
				self:ClearAllPoints()
				self:SetPoint("BOTTOM",0,160)
				FramerateLabelMoving = nil
				end)
			
			local PlayerPowerBarAltMoving;
			hooksecurefunc(PlayerPowerBarAlt, "SetPoint", function(self)
				if PlayerPowerBarAltMoving then return end
				PlayerPowerBarAltMoving = true
				self:ClearAllPoints()
				self:SetPoint("TOP",-460,-100)
				PlayerPowerBarAltMoving = nil
				end)
			
			--Casting Bar
			--CastingBarFrame:ClearAllPoints()
			--CastingBarFrame:SetPoint("CENTER",0,-200)
			local CastingBarFrameMoving;
			hooksecurefunc(CastingBarFrame, "SetPoint", function(self)
				if CastingBarFrameMoving then return end
				CastingBarFrameMoving = true
				--self:SetMovable(true)
				--self:SetUserPlaced(true)
				self:ClearAllPoints()
				self:SetPoint("CENTER",0,-200)
				--self:SetMovable(false)
				CastingBarFrameMoving = nil
				end)
		

		--Texture statusTrackingBar
		

		for i,v in pairs({
			StatusTrackingBarManager.SingleBarLarge,
			StatusTrackingBarManager.SingleBarLargeUpper,
			StatusTrackingBarManager.SingleBarSmall,
			StatusTrackingBarManager.SingleBarSmallUpper,
			
		}) do
			v:SetVertexColor(.3, .3, .3)		
		end
		
		--self:UnregisterEvent("PLAYER_LOGIN")	
	end

	if (event == "ARENA_PREP_OPPONENT_SPECIALIZATIONS") then
	
		eventHandlerDamp:Show()
	end
	
	if (event == "TALKINGHEAD_REQUESTED") then
	
		--TalkingHeadFrame
		TalkingHeadFrame:SetMovable(true)
		TalkingHeadFrame:SetClampedToScreen(true)
		TalkingHeadFrame.ignoreFramePositionManager = true -- important
		TalkingHeadFrame:ClearAllPoints()
		TalkingHeadFrame:SetPoint("CENTER",0,-198)
		--local TalkingHeadFrameMoving;
		--hooksecurefunc(TalkingHeadFrame, "SetPoint", function(self)
		--	if TalkingHeadFrameMoving then return end
		--	TalkingHeadFrameMoving = true
		--	self:ClearAllPoints()
		--	self:SetPoint("CENTER",0,-200)
		--	TalkingHeadFrameMoving = nil
		--	end)
		--self:UnregisterEvent("TALKINGHEAD_REQUESTED")
	end


	if (event == "PLAYER_ENTERING_WORLD") then
		--Cache le quest tracker en pvp
		--Quest Tracker en BG
		--ObjectiveTrackerBlocksFrame:Hide()
		local isInstance, instanceType = IsInInstance();
		
		eventHandlerDamp:Hide()
		
		if (isInstance and instanceType == "pvp") then
			if(not ObjectiveTrackerFrame.collapsed) then
				ObjectiveTracker_Collapse();
			end
			
			UIWidgetTopCenterContainerFrame:ClearAllPoints()
			UIWidgetTopCenterContainerFrame:SetPoint("TOP",0,-10)
			
		elseif (isInstance and instanceType == "arena") then
			if(not ObjectiveTrackerFrame.collapsed) then
				ObjectiveTracker_Collapse();
			end
			LoadAddOn("Blizzard_ArenaUI")
			ArenaEnemyFrame1:Hide()
			ArenaEnemyFrame2:Hide()
			ArenaEnemyFrame3:Hide()		
			--ArenaEnemyFrame1:SetScale(1.8)
			--ArenaEnemyFrame2:SetScale(1.8)
			--ArenaEnemyFrame3:SetScale(1.8)
			--ArenaEnemyFrame4:SetScale(1.8)
			--ArenaEnemyFrame5:SetScale(1.8)
			
			UIWidgetTopCenterContainerFrame:ClearAllPoints()
			UIWidgetTopCenterContainerFrame:SetPoint("TOP",0,-10)
			
		elseif (isInstance==false and instanceType == "none") then
			if(ObjectiveTrackerFrame.collapsed) then
				ObjectiveTracker_Expand();
			end
			
			--UIWidgetTopCenterContainerFrame:ClearAllPoints()
			--UIWidgetTopCenterContainerFrame:SetPoint("TOPLEFT",55,0)
			UIWidgetTopCenterContainerFrame:ClearAllPoints()
			UIWidgetTopCenterContainerFrame:SetPoint("TOP",0,-10)
			
		
		else
			if(ObjectiveTrackerFrame.collapsed) then
				ObjectiveTracker_Expand();
			end
			
			UIWidgetTopCenterContainerFrame:ClearAllPoints()
			UIWidgetTopCenterContainerFrame:SetPoint("TOP",0,-10)
						
		end

		--isInstance, instanceType = IsInInstance();
		--if (isInstance and (instanceType == 'pvp' or instanceType == 'arena')) then
		--    if(not ObjectiveTrackerFrame.collapsed) then
		--	ObjectiveTracker_Collapse();
		--   end
		--end
		--self:UnregisterEvent("PLAYER_ENTERING_WORLD")
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
--self:UnregisterAllEvents()
end

frame:HookScript("OnEvent", eventHandler)
--frame:UnregisterAllEvents();	
