local layoutName = "BlizzTourney"
local layout = {}
layout.name = "|cff00b4ffBlizz|r Tourney"

layout.defaultSettings = {
    posX = 330,
    posY = 140,
    scale = 1.3,
    classIconFontSize = 12,
    spacing = 20,
    growthDirection = 1,
    specIcon = {
        posX = 26,
        posY = 26,
        scale = 1,
    },
    trinket = {
        posX = 43,
        posY = -17,
        scale = 1,
        fontSize = 12,
    },
    racial = {
        posX = 74,
        posY = -17,
        scale = 1,
        fontSize = 12,
    },
    castBar = {
        posX = -100,
        posY = -18,
        scale = 1.2,
        width = 90,
        iconScale = 1,
        keepDefaultModernTextures = true,
    },
    dr = {
        posX = -79,
        posY = 6,
        size = 24,
        borderSize = 2.5,
        fontSize = 12,
        spacing = 6,
        growthDirection = 4,
    },

    textures          = {
        generalStatusBarTexture       = "sArena Default",
        healStatusBarTexture          = "sArena Stripes",
        castbarStatusBarTexture       = "sArena Default",
    },
    retextureHealerClassStackOnly = true,

    -- custom layout settings
    frameFont = "Prototype",
    cdFont  = "Prototype",
    mirrored = true,
}

local function getSetting(info)
    return layout.db[info[#info]]
end

local function setSetting(info, val)
    layout.db[info[#info]] = val

    for i = 1, sArenaMixin.maxArenaOpponents do
        local frame = info.handler["arena" .. i]
        layout:UpdateOrientation(frame)
    end
    sArenaMixin:RefreshConfig()
end

local function setupOptionsTable(self)
    layout.optionsTable = self:GetLayoutOptionsTable(layoutName)

    layout.optionsTable.arenaFrames.args.positioning.args.mirrored = {
        order = 5,
        name = "Mirrored Frames",
        type = "toggle",
        width = "full",
        get = getSetting,
        set = setSetting,
    }

end

function layout:Initialize(frame)
    self.db = frame.parent.db.profile.layoutSettings[layoutName]

    if (not self.optionsTable) then
        setupOptionsTable(frame.parent)
    end

    if (frame:GetID() == sArenaMixin.maxArenaOpponents) then
        frame.parent:UpdateCastBarSettings(self.db.castBar)
        frame.parent:UpdateDRSettings(self.db.dr)
        frame.parent:UpdateFrameSettings(self.db)
        frame.parent:UpdateSpecIconSettings(self.db.specIcon)
        frame.parent:UpdateTrinketSettings(self.db.trinket)
        frame.parent:UpdateRacialSettings(self.db.racial)
    end

    frame.ClassIconCooldown:SetSwipeTexture("Interface\\CharacterFrame\\TempPortraitAlphaMask")
    frame.ClassIconCooldown:SetUseCircularEdge(true)

    frame:SetSize(126, 66)
    frame.SpecIcon:SetSize(14, 14)
    frame.SpecIcon.Texture:AddMaskTexture(frame.SpecIcon.Mask)
    frame.Trinket:SetSize(25, 25)
    frame.Racial:SetSize(25, 25)

    local hp = frame.HealthBar
    hp:SetSize(87, 23)
    hp:SetStatusBarTexture("Interface\\RaidFrame\\Raid-Bar-Hp-Fill")

    local pp = frame.PowerBar
    pp:SetSize(87, 12)
    pp:SetStatusBarTexture("Interface\\RaidFrame\\Raid-Bar-Resource-Fill")

    local f = frame.ClassIcon
    f:SetSize(34, 34)
    f:Show()
    f:AddMaskTexture(frame.ClassIconMask)

    frame.ClassIconMask:SetSize(34, 34)

    -- SpecIcon border (owned by SpecIcon)
    if not frame.SpecIcon.Border then
        frame.SpecIcon.Border = frame.SpecIcon:CreateTexture(nil, "ARTWORK", nil, 3)
    end

    local specBorder = frame.SpecIcon.Border
    specBorder:ClearAllPoints()
    specBorder:SetTexture("Interface\\CHARACTERFRAME\\TotemBorder")
    specBorder:SetPoint("TOPLEFT", frame.SpecIcon, "TOPLEFT", -5, 5)
    specBorder:SetPoint("BOTTOMRIGHT", frame.SpecIcon, "BOTTOMRIGHT", 5, -5)
    specBorder:Show()

    f = frame.CastBar
    f:SetStatusBarTexture("Interface\\RaidFrame\\Raid-Bar-Hp-Fill")

    f = frame.DeathIcon
    f:ClearAllPoints()
    f:SetPoint("CENTER", frame.HealthBar, "CENTER")
    f:SetSize(32, 32)

    frame.HealthText:SetPoint("CENTER", frame.HealthBar)
    frame.HealthText:SetShadowOffset(0, 0)

    frame.PowerText:SetPoint("CENTER", frame.PowerBar)
    frame.PowerText:SetShadowOffset(0, 0)
    frame.PowerBar:SetHeight(10)

    local underlay = frame.TexturePool:Acquire()
    underlay:SetDrawLayer("BACKGROUND", 1)
    underlay:SetColorTexture(0, 0, 0, 0.75)
    underlay:SetPoint("TOPLEFT", hp, "TOPLEFT")
    underlay:SetPoint("BOTTOMRIGHT", pp, "BOTTOMRIGHT")
    underlay:Show()

    -- Full-frame texture (owned by the frame)
    if not frame.frameTexture then
        frame.frameTexture = frame:CreateTexture(nil, "ARTWORK", nil, 2)
    end

    local frameTexture = frame.frameTexture
    frameTexture:ClearAllPoints()
    frameTexture:SetDrawLayer("ARTWORK", 2)
    frameTexture:SetSize(160, 80)
    frameTexture:SetAtlas("UnitFrame")
    frameTexture:SetPoint("CENTER", frame, "CENTER")
    frameTexture:Show()

    -- Health bar underlay
    if not frame.hpUnderlay then
        frame.hpUnderlay = frame:CreateTexture(nil, "BACKGROUND", nil, 1)
        frame.hpUnderlay:SetPoint("TOPLEFT", frame.HealthBar, "TOPLEFT")
        frame.hpUnderlay:SetPoint("BOTTOMRIGHT", frame.HealthBar, "BOTTOMRIGHT")
        frame.hpUnderlay:SetColorTexture(0, 0, 0, 0.65)
        frame.hpUnderlay:Show()
    end

    -- Power bar underlay
    if not frame.ppUnderlay then
        frame.ppUnderlay = frame:CreateTexture(nil, "BACKGROUND", nil, 1)
        frame.ppUnderlay:SetPoint("TOPLEFT", frame.PowerBar, "TOPLEFT")
        frame.ppUnderlay:SetPoint("BOTTOMRIGHT", frame.PowerBar, "BOTTOMRIGHT")
        frame.ppUnderlay:SetColorTexture(0, 0, 0, 0.65)
        frame.ppUnderlay:Show()
    end

    self:UpdateOrientation(frame)
end

function layout:UpdateOrientation(frame)
    local frameTexture = frame.frameTexture
    local healthBar = frame.HealthBar
    local powerBar = frame.PowerBar
    local classIcon = frame.ClassIcon
    local classIconMask = frame.ClassIconMask
    local name = frame.Name

    healthBar:ClearAllPoints()
    powerBar:ClearAllPoints()
    classIcon:ClearAllPoints()
    classIconMask:ClearAllPoints()
    name:ClearAllPoints()

    if (self.db.mirrored) then
        frameTexture:SetTexCoord(1, 0, 0, 1)
        frameTexture:SetPoint("TOPLEFT", frame, "TOPLEFT", -26, 6)

        healthBar:SetPoint("TOPLEFT", frame, "TOPLEFT", 3, -30)
        powerBar:SetPoint("TOPLEFT", frame, "TOPLEFT", 3, -53)
        classIcon:SetPoint("TOPRIGHT", -2, -2)
        classIconMask:SetPoint("TOPRIGHT", -2, -2)

        name:SetJustifyH("RIGHT")
    else
        frameTexture:SetTexCoord(0, 1, 0, 1)
        frameTexture:SetPoint("TOPLEFT", frame, "TOPLEFT", -7, 6)

        healthBar:SetPoint("TOPRIGHT", frame, "TOPRIGHT", -2, -30)
        powerBar:SetPoint("TOPRIGHT", frame, "TOPRIGHT", -2, -53)
        classIcon:SetPoint("TOPLEFT", 3, -2)
        classIconMask:SetPoint("TOPLEFT", 3, -2)

        name:SetJustifyH("LEFT")
    end

    name:SetJustifyV("BOTTOM")
    name:SetPoint("BOTTOMLEFT", frame.HealthBar, "TOPLEFT", 5, 5)
    name:SetPoint("BOTTOMRIGHT", frame.HealthBar, "TOPRIGHT", -5, 5)
    name:SetHeight(12)
end

sArenaMixin.layouts[layoutName] = layout
sArenaMixin.defaultSettings.profile.layoutSettings[layoutName] = layout.defaultSettings
