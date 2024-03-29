﻿-- Toolips thanks to jnwhiteh http://wowprogramming.com/forums/development/75
local function OnEnter11(Self)
  GameTooltip:SetOwner(Self, "ANCHOR_CURSOR")
  GameTooltip:AddLine("Lock or Make Moveable", 1, 1, 1)
  GameTooltip:Show()
end

local function OnEnter10(Self)
  GameTooltip:SetOwner(Self, "ANCHOR_CURSOR")
  GameTooltip:AddLine("Options", 1, 1, 1)
  GameTooltip:Show()
end

local function OnEnter9(Self)
  GameTooltip:SetOwner(Self, "ANCHOR_CURSOR")
  GameTooltip:AddLine("Close", 1, 1, 1)
  GameTooltip:Show()
end

local function OnLeave(Self)
  GameTooltip:Hide()
end

-- BGDefender - Added by Camealion - Start
local SkinBGDefender = CreateFrame("Frame")
	SkinBGDefender:RegisterEvent("PLAYER_ENTERING_WORLD")
	SkinBGDefender:SetScript("OnEvent", function(self, event, addon)
	if IsAddOnLoaded("Skinner") or IsAddOnLoaded("Aurora") then return end
	if not IsAddOnLoaded("BGDefender") then return end
	
	local StripAllTextures = {
				"BGDefenderFrame",
				"Button9",
				"Button10",
				"Button11",
				}

	local SetTemplateD = { -- Default Texture
				--"",
				}

	local SetTemplateT = {-- Transparent Texture
				"BGDefenderFrame",
				}	
	
	local buttons = {
				"Button1",
				"Button2",
				"Button3",
				"Button4",
				"Button5",
				"Button6",
				"Button7",
				"Button8",
				--"Button9",
				--"Button10",
				--"Button11",
				}
							
	for _, object in pairs(StripAllTextures) do
                _G[object]:StripTextures()
	end	

	for _, object in pairs(SetTemplateD) do
				_G[object]:SetTemplate("Default")
	end	

	for _, object in pairs(SetTemplateT) do
				_G[object]:SetTemplate("Transparent")
	end	
	
	-- Skin Buttons
	for _, button in pairs(buttons) do
					cSkinButton(_G[button])
	end	
	
	-- Change Sizes
		BGDefenderFrame:SetWidth(160)
		BGDefenderFrame:SetHeight(72)
		Button9:SetWidth(16)
		Button9:SetHeight(16)
		Button10:SetWidth(16)
		Button10:SetHeight(16)
		Button11:SetWidth(16)
		Button11:SetHeight(16)
		
	-- Move this
		Text1:Point("TOPLEFT", BGDefenderFrame, "TOPLEFT", 5, -3)
		Button1:Point("TOPLEFT", BGDefenderFrame, "TOPLEFT", 5, -25)
		Button2:Point("TOPLEFT", BGDefenderFrame, "TOPLEFT", 30, -25)
		Button3:Point("TOPLEFT", BGDefenderFrame, "TOPLEFT", 55, -25)
		Button4:Point("TOPLEFT", BGDefenderFrame, "TOPLEFT", 80, -25)
		Button5:Point("TOPLEFT", BGDefenderFrame, "TOPLEFT", 105, -25)
		Button6:Point("TOPLEFT", BGDefenderFrame, "TOPLEFT", 130, -25)
		Button7:Point("TOPLEFT", BGDefenderFrame, "TOPLEFT", 5, -48)
		Button8:Point("TOPLEFT", BGDefenderFrame, "TOPLEFT", 97, -48)
		--Button11:Point("TOPRIGHT", BGDefenderFrame, "TOPRIGHT", -40, -4)
	
	-- Skin Dropdown from Options framc  Why? Just because I could.
		cSkinDropDownBox(DropDown1, 200)
		cSkinDropDownBox(DropDown2, 200)
	
	-- Check box from Options framc Anal I know!
		cSkinCheckBox(BGDefenderPrefaceButton)
		
	-- Change Colors
		Text1:SetTextColor(23/255, 132/255, 209/255)-- Match ElvUI Blue!
		
		Button1:SetNormalFontObject("GameFontHighlight")
		local font = Button1:GetNormalFontObject()
		font:SetTextColor(1, 1, 1, 1)
		--font:SetHighlightTextColor(0,0,1,0)-- Not working!S
		Button1:SetNormalFontObject(font)
	
	-- Call Tooltips
		Button9:SetScript("OnEnter", OnEnter9)
		Button9:SetScript("OnLeave", OnLeave)
		Button10:SetScript("OnEnter", OnEnter10)
		Button10:SetScript("OnLeave", OnLeave)
		Button11:SetScript("OnEnter", OnEnter11)
		Button11:SetScript("OnLeave", OnLeave)
	
end)
    -- BGDefender