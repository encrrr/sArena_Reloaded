local GetTime = GetTime
local isRetail = sArenaMixin.isRetail

local racialSpells
local racialData
local trinkets

-- 283167 "PvP Trinket" spell
-- 336139 Adapted Aura/Spell

if isRetail then
	sArenaMixin.defaultSettings.profile.racialCategories = {
		["Human"] = true,
		["Scourge"] = true,
		["Dwarf"] = true,
		["NightElf"] = true,
		["Gnome"] = true,
		["Draenei"] = true,
		["Worgen"] = true,
		["Pandaren"] = true,
		["Orc"] = true,
		["Tauren"] = true,
		["Troll"] = true,
		["BloodElf"] = true,
		["Goblin"] = true,
		["LightforgedDraenei"] = true,
		["HighmountainTauren"] = true,
		["Nightborne"] = true,
		["MagharOrc"] = true,
		["DarkIronDwarf"] = true,
		["ZandalariTroll"] = true,
		["VoidElf"] = true,
		["KulTiran"] = true,
		["Mechagnome"] = true,
		["Vulpera"] = true,
		["Dracthyr"] = true,
		["EarthenDwarf"] = true
	}

	racialSpells = {
		[59752] = 180,  -- Will to Survive
		[7744] = 120,   -- Will of the Forsaken
		[20594] = 120, -- Stoneform
		[65116] = 120, -- Stoneform (Aura)
		[58984] = 120,  -- Shadowmeld
		[20589] = 60,   -- Escape Artist
		[59542] = 120,  -- Gift of the Naaru
		[68992] = 120,  -- Darkflight
		[107079] = 120, -- Quaking Palm
		[33697] = 120,  -- Blood Fury
		[20549] = 90,   -- War Stomp
		[26297] = 180,  -- Berserking
		[202719] = 90,  -- Arcane Torrent
		[69070] = 90,   -- Rocket Jump
		[255647] = 150, -- Light's Judgment
		[255654] = 120, -- Bull Rush
		[260364] = 180, -- Arcane Pulse
		[274738] = 120, -- Ancestral Call
		[265221] = 120, -- Fireblood
		[273104] = 120, -- FIreblood (Aura)
		[291944] = 160, -- Regeneratin'
		[256948] = 180, -- Spatial Rift
		[287712] = 160, -- Haymaker
		[312924] = 180, -- Hyper Organic Light Originator
		[312411] = 90,  -- Bag of Tricks
		[368970] = 90,  -- Tail Swipe
		[357214] = 90,  -- Wing Buffet
		[436344] = 120, -- Azerite Surge

		-- Trinkets
		[336126] = 0,
		[336139] = 0,
	}

	trinkets = {
		[336126] = true, -- Trinket Spell Cast
		[336139] = true, -- Adaption Aura Applied
	}

	racialData = {
		["Human"] = { texture = C_Spell.GetSpellTexture(59752), sharedCD = 90 },
		["Scourge"] = { texture = C_Spell.GetSpellTexture(7744), sharedCD = 30 },
		["Dwarf"] = { texture = C_Spell.GetSpellTexture(20594), sharedCD = 30 },
		["NightElf"] = { texture = C_Spell.GetSpellTexture(58984), sharedCD = 0 },
		["Gnome"] = { texture = C_Spell.GetSpellTexture(20589), sharedCD = 0 },
		["Draenei"] = { texture = C_Spell.GetSpellTexture(59542), sharedCD = 0 },
		["Worgen"] = { texture = C_Spell.GetSpellTexture(68992), sharedCD = 0 },
		["Pandaren"] = { texture = C_Spell.GetSpellTexture(107079), sharedCD = 0 },
		["Orc"] = { texture = C_Spell.GetSpellTexture(33697), sharedCD = 0 },
		["Tauren"] = { texture = C_Spell.GetSpellTexture(20549), sharedCD = 0 },
		["Troll"] = { texture = C_Spell.GetSpellTexture(26297), sharedCD = 0 },
		["BloodElf"] = { texture = C_Spell.GetSpellTexture(202719), sharedCD = 0 },
		["Goblin"] = { texture = C_Spell.GetSpellTexture(69070), sharedCD = 0 },
		["LightforgedDraenei"] = { texture = C_Spell.GetSpellTexture(255647), sharedCD = 0 },
		["HighmountainTauren"] = { texture = C_Spell.GetSpellTexture(255654), sharedCD = 0 },
		["Nightborne"] = { texture = C_Spell.GetSpellTexture(260364), sharedCD = 0 },
		["MagharOrc"] = { texture = C_Spell.GetSpellTexture(274738), sharedCD = 0 },
		["DarkIronDwarf"] = { texture = C_Spell.GetSpellTexture(265221), sharedCD = 30 },
		["ZandalariTroll"] = { texture = C_Spell.GetSpellTexture(291944), sharedCD = 0 },
		["VoidElf"] = { texture = C_Spell.GetSpellTexture(256948), sharedCD = 0 },
		["KulTiran"] = { texture = C_Spell.GetSpellTexture(287712), sharedCD = 0 },
		["Mechagnome"] = { texture = C_Spell.GetSpellTexture(312924), sharedCD = 0 },
		["Vulpera"] = { texture = C_Spell.GetSpellTexture(312411), sharedCD = 0 },
		["Dracthyr"] = { texture = C_Spell.GetSpellTexture(368970), sharedCD = 0 },
		["EarthenDwarf"] = { texture = C_Spell.GetSpellTexture(436344), sharedCD = 0 }
	}
else
	sArenaMixin.defaultSettings.profile.racialCategories = {
		["Human"] = true,
		["Scourge"] = true,
		["Gnome"] = true,
		["Dwarf"] = true,
		["Orc"] = true,
		["Tauren"] = true,
		["BloodElf"] = true,
		["Troll"] = true,
		["Draenei"] = true,
		["NightElf"] = true,
		["Goblin"] = true,
		["Worgen"] = true,
		["Pandaren"] = true,
	}
	racialSpells = {
		[20549] = 120, -- War Stomp
		[7744] = 120, -- Will of the Forsaken
		[20554] = 180, -- Berserking
		[20572] = 120, -- Blood Fury
		[58984] = 10, -- Shadowmeld
		[20589] = 105, -- Escape Artist
		[20594] = 180, -- Stoneform
		[59752] = 120, -- Will to Survive
		[26297] = 180, -- Berserking - Rogue
		[28880] = 180, -- Gift of the Naaru
		[26296] = 180, -- Berserking - Warr
		[33702] = 120, -- Blood Fury - Caster
		[25046] = 120, -- Arcane Torrent - Rogue
		[28730] = 120, -- Arcane Torrent
		[50613] = 120, -- Arcane Torrent - Death Knight
		[69070] = 120, -- Rocket Jump
		[69041] = 120, -- Rocket Barrage
		[68992] = 120, -- Darkflight
		[107079] = 120, -- Quaking Palm
	}
	racialData = {
		["Human"] = { texture = GetSpellTexture(59752), sharedCD = 120 },
		["Scourge"] = { texture = GetSpellTexture(7744), sharedCD = 45 },
		["Gnome"] = { texture = GetSpellTexture(20589) },
		["Dwarf"] = { texture = GetSpellTexture(20594) },
		["Orc"] = { texture = GetSpellTexture(20572) },
		["Tauren"] = { texture = GetSpellTexture(20549) },
		["BloodElf"] = { texture = GetSpellTexture(28730) },
		["Troll"] = { texture = GetSpellTexture(26297) },
		["Draenei"] = { texture = GetSpellTexture(28880) },
		["NightElf"] = { texture = GetSpellTexture(58984) },
		["Goblin"] = { texture = GetSpellTexture(69041) },
		["Worgen"] = { texture = GetSpellTexture(68992) },
		["Pandaren"] = { texture = GetSpellTexture(107079) },
	}
end

sArenaMixin.racialSpells = racialSpells
sArenaMixin.racialData = racialData


local function GetRemainingCD(frame)
    local startTime, duration = frame:GetCooldownTimes()
    if ( startTime == 0 ) then return 0 end

    local currTime = GetTime()

    return (startTime + duration) / 1000 - currTime
end

function sArenaFrameMixin:GetSharedCD()
    -- Human healers have Will to Survive Shared CD reduced from 90 to 60 sec.
    if self.race == "Human" and self:IsHealer(self.unit) and self.Trinket.spellID == 336126 then
        return 60
    end
    return racialData[self.race] and racialData[self.race].sharedCD
end

if isRetail then
	function sArenaFrameMixin:FindRacial(event, spellID)
		local duration = racialSpells[spellID]
		local currTime = GetTime()

		-- Racial used
		if duration and not trinkets[spellID] then
			-- Handle racial cooldown
			if self.Racial.Texture:GetTexture() then
				self.Racial.Cooldown:SetCooldown(currTime, duration)
			end

			-- Handle shared CD from racial -> trinket
			if self.Trinket.spellID == 336126 then
				local remainingCD = GetRemainingCD(self.Trinket.Cooldown)
				local sharedCD = self:GetSharedCD()

				if sharedCD and remainingCD < sharedCD then
					self.Trinket.Cooldown:SetCooldown(currTime, sharedCD)
					if self.parent.db.profile.colorTrinket then
						self.Trinket.Texture:SetColorTexture(1, 0, 0)
					else
						self.Trinket.Texture:SetDesaturated(true)
					end
				end
			end

			-- Trinket used
		elseif self.Racial.Texture:GetTexture() then
			-- Handle shared CD from trinket -> racial (inverse case)
			local remainingCD = GetRemainingCD(self.Racial.Cooldown)
			local sharedCD = self:GetSharedCD()

			if sharedCD and remainingCD < sharedCD then
				self.Racial.Cooldown:SetCooldown(currTime, sharedCD)
			end
		end
	end

	function sArenaFrameMixin:UpdateRacial()
		self.race = nil
		self.Racial.Texture:SetTexture(nil)
		if (not self.race) then
			self.race = select(2, UnitRace(self.unit))

			if (self.parent.db.profile.racialCategories[self.race]) then
				self.Racial.Texture:SetTexture(racialData[self.race].texture)
				if self.RacialMsq then
					self.RacialMsq:Show()
				end
				if self.PixelBorders and self.PixelBorders.racial then
					self.PixelBorders.racial:Show()
				end
			end
		end
	end
else
	-- Mists of Pandaria
	function sArenaFrameMixin:FindRacial(event, spellID)
		local duration = racialSpells[spellID]

		if (duration) then
			local currTime = GetTime()

			if (self.Racial.Texture:GetTexture()) then
				self.Racial.Cooldown:SetCooldown(currTime, duration)
			end
			local remainingCD = GetRemainingCD(self.Trinket.Cooldown)
			local sharedCD = racialData[self.race].sharedCD

			if (sharedCD and remainingCD < sharedCD) then
				self.Trinket.Cooldown:SetCooldown(currTime, sharedCD)
				if self.parent.db.profile.colorTrinket then
					self.Trinket.Texture:SetColorTexture(1, 0, 0)
				else
					self.Trinket.Texture:SetDesaturated(true)
				end
			end
		elseif ((spellID == 42292) and self.Racial.Texture:GetTexture()) then
			local remainingCD = GetRemainingCD(self.Racial.Cooldown)
			local sharedCD = racialData[self.race].sharedCD

			if (sharedCD and remainingCD < sharedCD) then
				self.Racial.Cooldown:SetCooldown(GetTime(), sharedCD)
			end
		end
	end

	function sArenaFrameMixin:UpdateRacial(update)
		if (not self.race) or update then
			self.race = select(2, UnitRace(self.unit))

			if (self.parent.db.profile.racialCategories[self.race]) then
				self.Racial.Texture:SetTexture(racialData[self.race].texture)
				if self.RacialMsq then
					self.RacialMsq:Show()
				end
				if self.PixelBorders and self.PixelBorders.racial then
					self.PixelBorders.racial:Show()
				end
			end

			if self.parent.db.profile.swapHumanTrinket and self.race == "Human" then
				self.Racial.Texture:SetTexture(nil)
				if self.RacialMsq then
					self.RacialMsq:Hide()
				end
				if self.PixelBorders and self.PixelBorders.racial then
					self.PixelBorders.racial:Hide()
				end

				if self.parent.db.profile.colorTrinket then
					local start, duration = self.Trinket.Cooldown:GetCooldownTimes()
					if duration and duration > 0 and (start > 0) then
						self.Trinket.Texture:SetColorTexture(1, 0, 0)
					else
						self.Trinket.Texture:SetColorTexture(0, 1, 0)
					end
				else
					self.Trinket.Texture:SetTexture(racialData[self.race].texture)
				end
			end
		end
	end
end

function sArenaFrameMixin:ResetRacial()
    self.race = nil
    self.Racial.Texture:SetTexture(nil)
    self.Racial.Cooldown:Clear()
    if self.RacialMsq then
        self.RacialMsq:Hide()
    end
    if self.PixelBorders and self.PixelBorders.racial then
        self.PixelBorders.racial:Hide()
    end
    self:UpdateRacial()
end
