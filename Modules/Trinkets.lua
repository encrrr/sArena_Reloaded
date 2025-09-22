local isRetail = sArenaMixin.isRetail
local GetSpellTexture = GetSpellTexture or C_Spell.GetSpellTexture

function sArenaFrameMixin:FindTrinket()
    local trinket = self.Trinket
    trinket.Cooldown:SetCooldown(GetTime(), 120);
end

function sArenaFrameMixin:GetFactionTrinketIcon()
    -- if self.parent.db.profile.colorTrinket then
    --     self.Trinket.Texture:SetColorTexture(0,1,0)
    -- else
        local faction, _ = UnitFactionGroup(self.unit)
        if (faction == "Alliance") then
            self.Trinket.Texture:SetTexture(133452)
        else
            self.Trinket.Texture:SetTexture(133453)
        end
    --end
end

function sArenaFrameMixin:UpdateTrinketIcon(available)
    if available then
        if self.parent.db.profile.colorTrinket then
            self.Trinket.Texture:SetColorTexture(0,1,0)
        else
            self.Trinket.Texture:SetDesaturated(false)
        end
    else
        if self.parent.db.profile.colorTrinket then
            self.Trinket.Texture:SetColorTexture(1,0,0)
        else
            self.Trinket.Texture:SetDesaturated(true)
        end
    end
end

local function GetArenaCCInfo(unit)
    if isRetail then
        local spellID, startTime, duration = C_PvP.GetArenaCrowdControlInfo(unit)
        return spellID, startTime, duration
    else
        local spellID, itemID, startTime, duration = C_PvP.GetArenaCrowdControlInfo(unit)
        return spellID, startTime, duration
    end
end

function sArenaFrameMixin:UpdateTrinket()
    local spellID, startTime, duration = GetArenaCCInfo(self.unit)

    if (spellID) then
        if (spellID ~= self.Trinket.spellID) then
            local _, spellTextureNoOverride = GetSpellTexture(spellID)
            self.Trinket.spellID = spellID
            if spellTextureNoOverride and not isRetail then
                self:GetFactionTrinketIcon()
            else
                self.Trinket.Texture:SetTexture(spellTextureNoOverride or 638661) -- Surrender flag if no trinket
            end
            self:UpdateTrinketIcon(true)
            if self.TrinketMsq then
                self.TrinketMsq:Show()
            end
            if self.PixelBorders and self.PixelBorders.trinket then
                self.PixelBorders.trinket:Show()
            end
        end
        if (startTime ~= 0 and duration ~= 0 and self.Trinket.spellID) then
            self.Trinket.Cooldown:SetCooldown(startTime / 1000.0, duration / 1000.0)
            if self.parent.db.profile.colorTrinket then
                self.Trinket.Texture:SetColorTexture(1,0,0)
            else
                self.Trinket.Texture:SetDesaturated(true)
            end
        else
            self.Trinket.Cooldown:Clear()
            if self.parent.db.profile.colorTrinket then
                self.Trinket.Texture:SetColorTexture(0,1,0)
            else
                self.Trinket.Texture:SetDesaturated(false)
            end
        end
    end
end

function sArenaFrameMixin:ResetTrinket()
    self.Trinket.spellID = nil
    self.Trinket.Texture:SetTexture(nil)
    self.Trinket.Cooldown:Clear()
    self.Trinket.Texture:SetDesaturated(false)
    if self.TrinketMsq then
        self.TrinketMsq:Hide()
    end
    if self.PixelBorders and self.PixelBorders.trinket then
        self.PixelBorders.trinket:Hide()
    end
end
