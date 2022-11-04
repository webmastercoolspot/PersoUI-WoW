
-- Copyright (c) 2018, Coolspot

local Version = 3

-- Detect events
local frame = CreateFrame("FRAME", "PersoUIFrame")
frame:RegisterEvent("PLAYER_LOGIN")
frame:RegisterEvent("ARENA_PREP_OPPONENT_SPECIALIZATIONS")
frame:RegisterEvent("PLAYER_ENTERING_WORLD")
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
	
		--ChatFrame1:SetScale(1.18)		
		StatusTrackingBarManager:ClearAllPoints()
		StatusTrackingBarManager:SetPoint("TOP",0,0)
		
		QueueStatusButton:ClearAllPoints()
		QueueStatusButton:SetPoint("TOP", "MinimapBackdrop", "CENTER", -40, -80)
	
	end
	
	if (event == "ARENA_PREP_OPPONENT_SPECIALIZATIONS") then
	
		eventHandlerDamp:Show()
	end
	
	if (event == "PLAYER_ENTERING_WORLD") then
		--Cache le quest tracker en pvp
		--Quest Tracker en BG
		--ObjectiveTrackerBlocksFrame:Hide()
		
		--cache les buff de la focus frame
		FocusFrame.maxBuffs = 0
        	FocusFrame.maxDebuffs = 0	
        	
        	FocusFrameToT:ClearAllPoints()
		FocusFrameToT:Hide()
		--FocusFrameToT:SetPoint("CENTER", FocusFrame, "CENTER", -35,50)
		
		FocusFrameSpellBar:SetScale("1.2")
               	--Repositionner SpellBar dans une hooksecurefunction a cause de OnShow
		local function MySetPoint(self, _, _, _, _, _, PreventLoop)
			if  not PreventLoop then
				FocusFrameSpellBar:ClearAllPoints()
				FocusFrameSpellBar:SetPoint("CENTER", FocusFrame, "CENTER", 22, -50, true)
			end
		end
		hooksecurefunc(FocusFrameSpellBar, "SetPoint", MySetPoint)
		
		local isInstance, instanceType = IsInInstance();
		
		eventHandlerDamp:Hide()
		
		if (isInstance and instanceType == "pvp") then
			if(not ObjectiveTrackerFrame.collapsed) then
				ObjectiveTracker_Collapse();
				StatusTrackingBarManager:Hide();
			end
			
		elseif (isInstance and instanceType == "arena") then
			if(not ObjectiveTrackerFrame.collapsed) then
				ObjectiveTracker_Collapse();
				StatusTrackingBarManager:Hide();
			end
			
		elseif (isInstance==false and instanceType == "none") then
			if(ObjectiveTrackerFrame.collapsed) then
				ObjectiveTracker_Expand();
				StatusTrackingBarManager:Show();
			end
			
		
		else
			if(ObjectiveTrackerFrame.collapsed) then
				ObjectiveTracker_Expand();
				StatusTrackingBarManager:Show();
			end
			
					
		end

	end
end

frame:HookScript("OnEvent", eventHandler)
--frame:UnregisterAllEvents();	
