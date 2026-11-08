-- hamer client (no key)
local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local Lighting = game:GetService("Lighting")
local Workspace = game:GetService("Workspace")
local SoundService = game:GetService("SoundService")
local TeleportService = game:GetService("TeleportService")
local Stats = game:GetService("Stats")
local HttpService = game:GetService("HttpService")
local LocalPlayer = Players.LocalPlayer
while not LocalPlayer do
    task.wait(0.1)
    LocalPlayer = Players.LocalPlayer
end
local Camera = Workspace.CurrentCamera
while not Camera do
    task.wait(0.1)
    Camera = Workspace.CurrentCamera
end

local FONT_BLACK = Enum.Font.GothamBlack
local FONT_BOLD = Enum.Font.GothamBold
local FONT_REG = Enum.Font.Gotham

local ACCENTS = {
    Mint = Color3.fromRGB(0, 224, 184),
    Cyan = Color3.fromRGB(0, 229, 255),
    Purple = Color3.fromRGB(186, 120, 255),
    Pink = Color3.fromRGB(255, 120, 200),
    Red = Color3.fromRGB(255, 78, 100),
    Lime = Color3.fromRGB(160, 240, 90),
    Gold = Color3.fromRGB(255, 205, 80),
    Blue = Color3.fromRGB(90, 150, 255),
    Emerald = Color3.fromRGB(70, 235, 155),
    Orange = Color3.fromRGB(255, 150, 70),
    White = Color3.fromRGB(240, 245, 255)
}
local ACCENT_ORDER = {"Mint", "Cyan", "Purple", "Pink", "Red", "Lime", "Gold", "Blue", "Emerald", "Orange", "White"}

local S = {
    Accent = "Mint", MenuOpen = false,
    ESP = false, ESPNames = true, ESPDist = true, ESPColor = Color3.fromRGB(0, 229, 255),
    ESPRole = true, ESPHealth = true, ESPTracer = false, ESPSkeleton = false, ESPHeadDot = false,
    ESPChams = false, ESPChamsThrough = false, ESPMaxDist = 1000, ESPVisCheck = false,
    ESPCorners = true, ESPThickness = 1.5, ESPOffscreen = false, ESPTool = false,
    ESPItems = false, ESPItemColor = Color3.fromRGB(255, 210, 60),
    ESPMurdererColor = Color3.fromRGB(255, 64, 64), ESPSheriffColor = Color3.fromRGB(80, 150, 255),
    ESPHeroColor = Color3.fromRGB(255, 210, 60), ESPInnocentColor = Color3.fromRGB(90, 230, 130),
    Fullbright = false, Fog = false, FogDensity = 0.35,
    MotionBlur = false, MotionBlurStrength = 16,
    Aspect = false, AspectValue = 0.8,
    World = false, WorldSaturation = 0, WorldContrast = 0,
    Shader = "off", ShaderIntensity = 1, CosFolder = "all",
    Aimbot = false, AimbotFOV = 160, AimbotSmooth = 0.35, AimbotPart = "Head",
    Speed = false, SpeedValue = 32,
    Jump = false, JumpValue = 80,
    Fly = false, FlySpeed = 60,
    Noclip = false,
    Hitbox = false, HitboxSize = 8,
    InfJump = false,
    AntiAfk = false,
    AutoCollect = false,
    Watermark = true,
    Dong = false, DongSize = 1, DongGlow = false, DongColor = Color3.fromRGB(232, 190, 158),
    DongHeadColor = Color3.fromRGB(200, 60, 60),
    Wings = false, Halo = false, ChinaHat = false, Kagune = false, Companion = false, NoAnims = false,
    Korblox = false, GhostLegs = false,
    AvatarScale = 1, ConfigName = "default", DroneActive = false, DroneView = 1, DroneManual = false, DroneSpeed = 45, Mobile = false, Optimize = 2,
    Transparent = false, Fox = false, FoxSize = 1, Lang = "EN",
    CoinFarm = false, FarmNoClip = false, FarmUnderMap = false, FarmSpeed = 80,
    SilentAim = false, SilentAimFOV = 180, SilentAimMaxDist = 600, SilentAimPredict = 120, SilentAimWallbang = false,
    KillAll = false,
    Keybinds = {ESP = "F", Aimbot = "G", SilentAim = "V", KillAll = "K"},
    AutoLoadConfig = true,
    Aura = false, Crown = false, Horns = false, CatEars = false, Jetpack = false,
    Tail = false, TopHat = false, Visor = false, Scythe = false,
    OniMask = false, GasMask = false, NeonMask = false, Cap = false,
    CyberPack = false, AngelPack = false,
    MM2AutoEquip = false, MM2AutoGun = false, MM2KnifeAura = false, MM2AuraRange = 12,
    Rainbow = false, GlowTrail = false, Invisible = false, ClickTP = false,
    TrollSpin = false, TrollSpinSpeed = 12, TrollDance = false,
    TrollFlingAura = false, TrollFlingRadius = 18,
    TrollFollow = false, TrollOrbit = false, TrollOrbitSpeed = 0.8, TrollOrbitRadius = 8,
    TrollSit = false, TrollJump = false, TrollRagdoll = false,
    Flick = false, FlickAimMode = "Camera", FlickAutoFire = true,
    FlickFOV = 160, FlickMaxDist = 600, FlickPriority = "Crosshair", FlickHitbox = "Adaptive",
    FlickMultipoint = true, FlickPrediction = true, FlickGravity = true,
    FlickLatency = 0, FlickMaxPrediction = 0.8, FlickSmooth = 4, FlickScanHz = 25,
    FlickNoRecoil = true, FlickAutoReload = true,
    FlickTeamCheck = false, FlickSpawnProtect = true, FlickWallCheck = true,
    FlickShowFov = true, FlickHighlight = true,
    FlickSpinbot = false, FlickSpinSpeed = 420, FlickSpinDir = "Clockwise",
    FlickJitter = false, FlickJitterAngle = 60, FlickJitterHz = 8,
    FlickTracers = false, FlickTracerColor = Color3.fromRGB(178, 112, 255)
}

local COSMETIC_DEFAULTS = {
    FoxColor1 = Color3.fromRGB(232, 122, 46), FoxColor2 = Color3.fromRGB(246, 241, 234), FoxGlow = false,
    WingsColor1 = Color3.fromRGB(0, 224, 184), WingsColor2 = Color3.fromRGB(255, 255, 255), WingsGlow = true,
    HaloColor1 = Color3.fromRGB(0, 224, 184), HaloColor2 = Color3.fromRGB(255, 255, 255), HaloGlow = true,
    ChinaHatColor1 = Color3.fromRGB(220, 55, 62), ChinaHatColor2 = Color3.fromRGB(255, 210, 90), ChinaHatGlow = true,
    KaguneColor1 = Color3.fromRGB(180, 22, 38), KaguneColor2 = Color3.fromRGB(255, 82, 96), KaguneGlow = true,
    CompanionColor1 = Color3.fromRGB(0, 224, 184), CompanionColor2 = Color3.fromRGB(255, 255, 255), CompanionGlow = true,
    AuraColor1 = Color3.fromRGB(0, 224, 184), AuraColor2 = Color3.fromRGB(255, 255, 255), AuraGlow = true,
    CrownColor1 = Color3.fromRGB(255, 205, 70), CrownColor2 = Color3.fromRGB(0, 224, 184), CrownGlow = true,
    HornsColor1 = Color3.fromRGB(210, 36, 48), HornsColor2 = Color3.fromRGB(255, 148, 76), HornsGlow = true,
    CatEarsColor1 = Color3.fromRGB(0, 224, 184), CatEarsColor2 = Color3.fromRGB(255, 168, 205), CatEarsGlow = true,
    JetpackColor1 = Color3.fromRGB(0, 224, 184), JetpackColor2 = Color3.fromRGB(255, 255, 255), JetpackGlow = true,
    TailColor1 = Color3.fromRGB(0, 224, 184), TailColor2 = Color3.fromRGB(255, 255, 255), TailGlow = true,
    TopHatColor1 = Color3.fromRGB(0, 224, 184), TopHatColor2 = Color3.fromRGB(255, 70, 110), TopHatGlow = true,
    VisorColor1 = Color3.fromRGB(0, 224, 184), VisorColor2 = Color3.fromRGB(255, 255, 255), VisorGlow = true,
    ScytheColor1 = Color3.fromRGB(0, 224, 184), ScytheColor2 = Color3.fromRGB(96, 34, 42), ScytheGlow = true,
    OniMaskColor1 = Color3.fromRGB(168, 26, 40), OniMaskColor2 = Color3.fromRGB(0, 224, 184), OniMaskGlow = true,
    GasMaskColor1 = Color3.fromRGB(0, 224, 184), GasMaskColor2 = Color3.fromRGB(34, 38, 46), GasMaskGlow = true,
    NeonMaskColor1 = Color3.fromRGB(0, 224, 184), NeonMaskColor2 = Color3.fromRGB(255, 255, 255), NeonMaskGlow = true,
    CapColor1 = Color3.fromRGB(0, 224, 184), CapColor2 = Color3.fromRGB(255, 255, 255), CapGlow = true,
    CyberPackColor1 = Color3.fromRGB(0, 224, 184), CyberPackColor2 = Color3.fromRGB(255, 255, 255), CyberPackGlow = true,
    AngelPackColor1 = Color3.fromRGB(255, 252, 240), AngelPackColor2 = Color3.fromRGB(255, 210, 110), AngelPackGlow = true
}
for k, v in pairs(COSMETIC_DEFAULTS) do
    if S[k] == nil then S[k] = v end
end

S.Mobile = (UIS.TouchEnabled and not UIS.KeyboardEnabled) or false

local Unloaded = false
local toast
local Conns = {}
local function conn(c)
    table.insert(Conns, c)
    return c
end
local FrameTick = 0
conn(RunService.RenderStepped:Connect(function()
    FrameTick = FrameTick + 1
    if FrameTick > 100000 then FrameTick = 0 end
end))
local function optSkip()
    local step = S.Optimize >= 3 and 4 or (S.Optimize == 2 and 3 or 2)
    return FrameTick % step ~= 0
end
local ItemCache = (function()
    local nextScan = 0
    local items = {}
    local function scan()
        local now = os.clock()
        if now < nextScan then return items end
        nextScan = now + 0.4
        local list = {}
        for _, d in ipairs(Workspace:GetDescendants()) do
            if d:IsA("BasePart") then
                local n = string.lower(d.Name)
                local p = d.Parent
                local pn = p and string.lower(p.Name) or ""
                local pp = p and p.Parent
                local ppn = pp and string.lower(pp.Name) or ""
                if string.find(n, "coin", 1, true) or string.find(n, "cash", 1, true) or string.find(n, "gem", 1, true) or string.find(n, "money", 1, true) or string.find(n, "diamond", 1, true) or string.find(pn, "coin", 1, true) or string.find(pn, "cash", 1, true) or string.find(pn, "gem", 1, true) or string.find(ppn, "coin", 1, true) or string.find(ppn, "cash", 1, true) or string.find(ppn, "gem", 1, true) then
                    list[#list + 1] = d
                end
            end
        end
        items = list
        return items
    end
    return {scan = scan}
end)()
local function applyOptimization()
    if S.Optimize >= 3 then
        S.MotionBlur = false
        local mb = Lighting:FindFirstChild("HamerMotionBlur")
        if mb then mb.Size = 0 end
    end
    local label = S.Optimize >= 3 and "max" or (S.Optimize == 2 and "medium" or "weak")
    toast("optimization: " .. label)
end
local function clamp(v, a, b)
    if v < a then return a elseif v > b then return b end
    return v
end
local function FS(n)
    if S.Mobile then return math.floor(n * 1.25 + 0.5) end
    return n
end
local function RH(n)
    if S.Mobile then return math.floor(n * 1.22 + 0.5) end
    return n
end
local function tw(o, t, props, style, dir)
    local t1 = TweenService:Create(o, TweenInfo.new(t or 0.2, style or Enum.EasingStyle.Quart, dir or Enum.EasingDirection.Out), props)
    t1:Play()
    return t1
end
local function accent()
    return ACCENTS[S.Accent] or ACCENTS.Cyan
end

local SoundFolder = Instance.new("Folder")
SoundFolder.Name = "HamerSounds"
SoundFolder.Parent = SoundService
local clickSound = Instance.new("Sound")
clickSound.SoundId = "rbxassetid://6895079853"
clickSound.Volume = 0.25
clickSound.PlaybackSpeed = 2
clickSound.Parent = SoundFolder
local function click()
    pcall(function()
        clickSound:Stop()
        clickSound:Play()
    end)
end

local gui = Instance.new("ScreenGui")
gui.Name = "Hamer"
gui.ResetOnSpawn = false
gui.IgnoreGuiInset = true
gui.DisplayOrder = 999
gui.ZIndexBehavior = Enum.ZIndexBehavior.Global
gui.Parent = LocalPlayer:WaitForChild("PlayerGui")

local blur = Instance.new("BlurEffect")
blur.Name = "HamerBlur"
blur.Size = 0
blur.Parent = Lighting

local dim = Instance.new("Frame")
dim.Size = UDim2.new(1, 0, 1, 0)
dim.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
dim.BackgroundTransparency = 1
dim.BorderSizePixel = 0
dim.Visible = false
dim.ZIndex = 5
dim.Parent = gui

local main = Instance.new("Frame")
main.Name = "Main"
main.AnchorPoint = Vector2.new(0.5, 0.5)
main.Position = UDim2.new(0.5, 0, 0.5, 0)
main.Size = UDim2.new(0, 900, 0, 600)
main.BackgroundColor3 = Color3.fromRGB(18, 21, 28)
main.BackgroundTransparency = S.Transparent and 0.35 or 0
main.BorderSizePixel = 0
main.ClipsDescendants = true
main.Visible = false
main.ZIndex = 10
main.Parent = gui
local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0, 20)
mainCorner.Parent = main
local mainStroke = Instance.new("UIStroke")
mainStroke.Color = accent()
mainStroke.Transparency = 0.55
mainStroke.Thickness = 1.3
mainStroke.Parent = main
local mainGrad = Instance.new("UIGradient")
mainGrad.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(23, 27, 36)),
    ColorSequenceKeypoint.new(0.55, Color3.fromRGB(13, 16, 22)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(10, 12, 17))
})
mainGrad.Rotation = 125
mainGrad.Parent = main

local uiScale = Instance.new("UIScale")
uiScale.Parent = main

local function computeScale()
    local vp = Camera.ViewportSize
    local sc
    if S.Mobile then
        sc = math.min((vp.X - 16) / 900, (vp.Y - 16) / 600)
        return clamp(sc, 0.7, 2.4)
    end
    sc = math.min((vp.X - 60) / 900, (vp.Y - 60) / 600, 1.15)
    return clamp(sc, 0.6, 1.15)
end
uiScale.Scale = computeScale()
conn(Camera:GetPropertyChangedSignal("ViewportSize"):Connect(function()
    if S.MenuOpen then
        uiScale.Scale = computeScale()
    end
end))

local themeFns = {}
local function bindAccent(fn)
    table.insert(themeFns, fn)
    fn(accent())
end
local function applyAccent()
    local c = accent()
    for _, fn in ipairs(themeFns) do
        pcall(fn, c)
    end
end
bindAccent(function(c)
    mainStroke.Color = c
end)

local topLine = Instance.new("Frame")
topLine.Size = UDim2.new(1, -28, 0, 2)
topLine.Position = UDim2.new(0, 14, 0, 0)
topLine.BackgroundColor3 = accent()
topLine.BorderSizePixel = 0
topLine.ZIndex = 13
topLine.Parent = main
local topLineGrad = Instance.new("UIGradient")
topLineGrad.Rotation = 0
topLineGrad.Parent = topLine
bindAccent(function(c)
    topLine.BackgroundColor3 = c
    topLineGrad.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, c),
        ColorSequenceKeypoint.new(0.55, c:Lerp(Color3.fromRGB(255, 255, 255), 0.35)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(168, 85, 247))
    })
end)

local UI = {
    bg = Color3.fromRGB(22, 23, 27),
    panel = Color3.fromRGB(27, 29, 34),
    card = Color3.fromRGB(36, 38, 44),
    cardHi = Color3.fromRGB(44, 47, 54),
    field = Color3.fromRGB(33, 35, 41),
    navHi = Color3.fromRGB(52, 55, 63),
    text = Color3.fromRGB(242, 244, 248),
    sub = Color3.fromRGB(138, 143, 153),
    line = Color3.fromRGB(255, 255, 255)
}

local SUBTITLES = {
    ESP = "Role ESP, chams, skeleton, tracers", ESPNames = "Show player names", ESPDist = "Show distance",
    ESPOffscreen = "Edge arrows for off-screen players", ESPTool = "Show held tool name",
    ESPItems = "Highlight nearby coins and loot", ESPItemColor = "Item highlight color",
    Fullbright = "Maximum brightness", Fog = "Atmospheric fog effect", FogDensity = "Fog thickness",
    MotionBlur = "Blur on movement", MotionBlurStrength = "Blur intensity",
    Aspect = "Stretch screen view", AspectValue = "Screen stretch",
    World = "Saturation & contrast", WorldSaturation = "Color saturation", WorldContrast = "Color contrast",
    Shader = "Post-processing preset", ShaderIntensity = "Shader strength",
    Speed = "Movement speed", SpeedValue = "Walk speed", Jump = "Jump power", JumpValue = "Jump height",
    Fly = "Free flight", FlySpeed = "Flight speed", Noclip = "Walk through walls",
    Aimbot = "Auto aim at target", AimbotFOV = "Aim radius", AimbotSmooth = "Aim smoothing",
    Hitbox = "Expand hitbox", HitboxSize = "Hitbox size", InfJump = "Infinite jumping",
    AntiAfk = "Stay active", AutoCollect = "Collect nearby items", Watermark = "On-screen watermark",
    Dong = "Attach a 3D model", DongGlow = "Neon skin",
    DongSize = "Model size", Korblox = "Replace right leg", GhostLegs = "Transparent legs",
    NoAnims = "Disable animations", Wings = "Layered feather wings", Halo = "Neon halo",
    ChinaHat = "Neon hat", Kagune = "Neon kagune", Companion = "Floating orb",
    AvatarScale = "Character size", Mobile = "Phone / tablet layout",
    Transparent = "Glass background", Fox = "Mini fox on your shoulder", FoxSize = "Fox size",
    CoinFarm = "Auto collect MM2 coins", FarmNoClip = "Pass through walls",
    FarmUnderMap = "Farm below the map", FarmSpeed = "Movement speed",
    SilentAim = "Route shots onto target", SilentAimFOV = "Target search radius",
    SilentAimMaxDist = "Maximum lock distance", SilentAimPredict = "Velocity prediction",
    SilentAimWallbang = "Shoot through walls", KillAll = "Knife every player",
    AutoLoadConfig = "Load config on inject", Optimize = "1 weak, 2 medium, 3 max",
    Aura = "Swirling particle aura",
    DroneView = "1 third person, 2 first person", DroneManual = "Pilot the drone manually", DroneSpeed = "Manual flight speed",
    Crown = "Floating neon crown", Horns = "Demon horns", CatEars = "Neon cat ears",
    Jetpack = "Neon jetpack", Tail = "Animated neon tail", TopHat = "Classic top hat",
    Visor = "Glowing visor", Scythe = "Neon scythe on your back",
    OniMask = "Crimson demon mask", GasMask = "Tactical gas mask", NeonMask = "Cyber face mask",
    Cap = "Neon baseball cap", CyberPack = "Glowing tech backpack", AngelPack = "Winged holy backpack",
    MM2AutoEquip = "Equip knife automatically", MM2AutoGun = "Equip gun automatically", MM2KnifeAura = "Hit players near you",
    MM2AuraRange = "Knife aura radius", Rainbow = "Cycle avatar colors",
    GlowTrail = "Neon trail while moving", Invisible = "Hide your character locally",
    ClickTP = "Teleport where you click or tap",
    TrollSpin = "Spin your character rapidly", TrollSpinSpeed = "Spin speed in rad/s",
    TrollDance = "Play random emotes repeatedly", TrollFlingAura = "Fling players near you",
    TrollFlingRadius = "Fling aura radius", TrollFollow = "Teleport behind the closest player",
    TrollOrbit = "Circle around the closest player", TrollOrbitSpeed = "Orbit speed in rev/s",
    TrollOrbitRadius = "Orbit radius", TrollSit = "Sit and stand repeatedly",
    TrollJump = "Jump automatically", TrollRagdoll = "Ragdoll your character",
    Flick = "Ragebot for FPS Flick and other shooters", FlickAimMode = "Camera or silent shot redirect",
    FlickAutoFire = "Fire automatically while a target is locked", FlickFOV = "Target search cone",
    FlickMaxDist = "Maximum target distance", FlickPriority = "Target scoring mode",
    FlickHitbox = "Preferred hitbox", FlickMultipoint = "Probe exposed hitbox points",
    FlickPrediction = "Lead moving targets", FlickGravity = "Compensate projectile drop",
    FlickLatency = "Extra prediction delay", FlickMaxPrediction = "Maximum lead time",
    FlickSmooth = "0 = instant snap", FlickScanHz = "Target scan frequency",
    FlickNoRecoil = "Remove FPS Flick camera recoil", FlickAutoReload = "Reload when magazine is empty",
    FlickTeamCheck = "Ignore same-team players",
    FlickSpawnProtect = "Skip spawn-shielded players", FlickWallCheck = "Only aim at visible targets",
    FlickShowFov = "Draw the aiming cone", FlickHighlight = "Highlight the locked target",
    FlickSpinbot = "Rotate your character", FlickSpinSpeed = "Spin speed in degrees/s",
    FlickSpinDir = "Spin direction", FlickJitter = "Add yaw jitter",
    FlickJitterAngle = "Jitter amplitude", FlickJitterHz = "Jitter frequency",
    FlickTracers = "Draw local shot tracers", FlickTracerColor = "Tracer color"
}

local Loc = (function()
    local ru = {
        ["Combat"] = "Бой", ["Flick"] = "Флик", ["Cosmetics"] = "Косметика", ["Visuals"] = "Визуалы",
        ["MM2"] = "MM2", ["Fun"] = "Развлечения", ["Places"] = "Места", ["Configs"] = "Конфиги",
        ["Themes"] = "Темы", ["Player"] = "Игрок", ["Search features..."] = "Поиск функций...",
        ["NAVIGATION"] = "НАВИГАЦИЯ", ["CONNECTED"] = "ПОДКЛЮЧЕНО",
        ["MODULES"] = "МОДУЛИ", ["PROFILE"] = "ПРОФИЛЬ",
        ["3D Dick"] = "3D член", ["Aimbot"] = "Аимбот", ["Angel backpack"] = "Ангельский рюкзак",
        ["Anti AFK"] = "Анти-АФК", ["Aspect Ratio"] = "Соотношение сторон", ["Auto collect"] = "Автосбор",
        ["Auto equip gun"] = "Авто-экип пистолета", ["Auto equip knife"] = "Авто-экип ножа",
        ["Cap"] = "Кепка", ["Cat ears"] = "Кошачьи уши", ["Character"] = "Персонаж",
        ["China hat"] = "Китайская шляпа", ["Click teleport"] = "Телепорт по клику",
        ["Coin Farm (MM2)"] = "Фарм монет (MM2)", ["Companion"] = "Компаньон", ["Crown"] = "Корона",
        ["Cyber backpack"] = "Кибер-рюкзак", ["Demon horns"] = "Демонические рога",
        ["Drone settings"] = "Настройки дрона", ["ESP 2D"] = "ESP 2D", ["Fly"] = "Полёт",
        ["Fog"] = "Туман", ["Fullbright"] = "Полная яркость", ["Gas mask"] = "Противогаз",
        ["Ghost legs"] = "Призрачные ноги", ["Glow all cosmetics"] = "Свечение косметики",
        ["Glow trail"] = "Светящийся след", ["Halo"] = "Нимб", ["Hitbox expander"] = "Расширение хитбокса",
        ["Hotkey manager"] = "Менеджер горячих клавиш", ["Infinite jump"] = "Бесконечный прыжок",
        ["Invisible"] = "Невидимость", ["Jetpack"] = "Джетпак", ["Jump power"] = "Сила прыжка",
        ["Kagune"] = "Кагуне", ["Kill All (MM2)"] = "Убить всех (MM2)", ["Knife aura"] = "Аура ножа",
        ["Korblox leg"] = "Нога Korblox", ["Mini Fox"] = "Мини-лиса", ["Motion Blur"] = "Размытие движения",
        ["Neon Aura"] = "Неоновая аура", ["Neon mask"] = "Неоновая маска", ["Neon tail"] = "Неоновый хвост",
        ["Neon visor"] = "Неоновый визор", ["No animations"] = "Без анимаций", ["Noclip"] = "Ноклип",
        ["Oni mask"] = "Маска они", ["Phone mode"] = "Режим телефона", ["Ragebot"] = "Рейджбот",
        ["Rainbow avatar"] = "Радужный аватар", ["Scythe"] = "Коса", ["Shaders"] = "Шейдеры",
        ["Silent Aim"] = "Сайлент-аим", ["Speed"] = "Скорость", ["Targeting"] = "Таргетинг",
        ["Top hat"] = "Цилиндр", ["Transparent UI"] = "Прозрачный интерфейс", ["Troll"] = "Троллинг",
        ["Troll+"] = "Троллинг+", ["Visuals"] = "Визуалы", ["Watermark"] = "Водяной знак",
        ["Wings"] = "Крылья", ["World Color"] = "Цвет мира",
        ["Auto dance"] = "Автотанец", ["Auto fire"] = "Автоогонь", ["Auto load on start"] = "Автозагрузка при старте",
        ["Auto reload"] = "Автоперезарядка", ["Bullet tracers"] = "Трассеры пуль", ["Chams"] = "Чамсы",
        ["Chams through walls"] = "Чамсы сквозь стены", ["Corner box"] = "Угловой бокс", ["Distance"] = "Дистанция",
        ["FOV circle"] = "Круг FOV", ["Fling aura"] = "Аура отбрасывания", ["Follow nearest"] = "Следовать за ближайшим",
        ["Glow"] = "Свечение", ["Gravity compensation"] = "Компенсация гравитации", ["Head circle"] = "Круг головы",
        ["Health bar"] = "Полоса здоровья", ["Jitter"] = "Джиттер", ["Jump spam"] = "Спам прыжками",
        ["Manual control"] = "Ручное управление", ["Multipoint"] = "Мультипоинт", ["Names"] = "Имена",
        ["No recoil"] = "Без отдачи", ["Orbit nearest"] = "Орбита вокруг ближайшего", ["Player ESP"] = "ESP игроков",
        ["Prediction"] = "Предсказание", ["Ragdoll self"] = "Рэгдолл себя", ["Role colors"] = "Цвета ролей",
        ["Show distance"] = "Показывать дистанцию", ["Show names"] = "Показывать имена", ["Sit spam"] = "Спам сидением",
        ["Skeleton"] = "Скелет", ["Spawn protection"] = "Защита на спавне", ["Spin"] = "Вращение",
        ["Spinbot"] = "Спинбот", ["Target highlight"] = "Подсветка цели", ["Team check"] = "Проверка команды",
        ["Tracer"] = "Трассер", ["Under map"] = "Под картой", ["Visibility check"] = "Проверка видимости",
        ["Wall check"] = "Проверка стен", ["Wallbang"] = "Стрельба сквозь стены",
        ["Aspect value"] = "Значение аспекта", ["Aura radius"] = "Радиус ауры", ["Avatar scale"] = "Масштаб аватара",
        ["Blur strength"] = "Сила размытия", ["Box thickness"] = "Толщина бокса", ["Camera"] = "Камера",
        ["Contrast"] = "Контраст", ["Extra latency"] = "Доп. задержка", ["FOV"] = "FOV",
        ["Fly speed"] = "Скорость полёта", ["Fog density"] = "Плотность тумана", ["Hitbox size"] = "Размер хитбокса",
        ["Intensity"] = "Интенсивность", ["Jitter angle"] = "Угол джиттера", ["Jitter rate"] = "Частота джиттера",
        ["Jump value"] = "Значение прыжка", ["Manual speed"] = "Ручная скорость", ["Max distance"] = "Макс. дистанция",
        ["Max prediction"] = "Макс. предсказание", ["Optimization"] = "Оптимизация", ["Orbit radius"] = "Радиус орбиты",
        ["Orbit speed"] = "Скорость орбиты", ["Range"] = "Радиус", ["Saturation"] = "Насыщенность",
        ["Scan rate"] = "Частота сканирования", ["Size"] = "Размер", ["Smooth"] = "Плавность",
        ["Smoothing"] = "Сглаживание", ["Spin speed"] = "Скорость вращения", ["Walk speed"] = "Скорость ходьбы",
        ["Anime"] = "Аниме", ["Cinematic"] = "Кинематограф", ["Clear all keybinds"] = "Очистить все бинды",
        ["Clear target"] = "Сбросить цель", ["Copy Job ID"] = "Копировать Job ID", ["Dance now"] = "Танцевать",
        ["Delete config"] = "Удалить конфиг", ["Destroy GUI"] = "Выгрузить GUI", ["Disable shader"] = "Отключить шейдер",
        ["Emote menu"] = "Меню эмоций", ["Equip knife now"] = "Экипировать нож",
        ["Export to clipboard"] = "Экспорт в буфер", ["Fling all players"] = "Отбросить всех",
        ["Fling nearest player"] = "Отбросить ближайшего", ["Fling self"] = "Отбросить себя", ["Horror"] = "Хоррор",
        ["Import from clipboard"] = "Импорт из буфера", ["Kamikaze Drone"] = "Дрон-камикадзе",
        ["Load config"] = "Загрузить конфиг", ["Neon"] = "Неон", ["Prepare silent adapter"] = "Подготовить silent-адаптер",
        ["Random teleport"] = "Случайный телепорт", ["Rejoin server"] = "Перезайти на сервер",
        ["Reset character"] = "Сбросить персонажа", ["Retro"] = "Ретро", ["Save config"] = "Сохранить конфиг",
        ["Teleport all to me"] = "Телепортировать всех ко мне", ["Teleport to nearest coin"] = "Телепорт к монете",
        ["Teleport to nearest player"] = "Телепорт к игроку", ["Vaporwave"] = "Вейпорвейв",
        ["Custom color"] = "Свой цвет", ["Head color"] = "Цвет головы", ["Hero color"] = "Цвет героя",
        ["Innocent color"] = "Цвет невиновного", ["Murderer color"] = "Цвет убийцы", ["Sheriff color"] = "Цвет шерифа",
        ["Skin color"] = "Цвет кожи", ["Tracer color"] = "Цвет трассера", ["Item color"] = "Цвет предметов",
        ["Aim mode"] = "Режим прицела", ["Direction"] = "Направление", ["Hitbox"] = "Хитбокс",
        ["Priority"] = "Приоритет", ["Config name"] = "Имя конфига", ["Language"] = "Язык",
        ["Offscreen arrows"] = "Стрелки за экраном", ["Tool info"] = "Инфо о предмете", ["Item ESP"] = "ESP предметов",
        ["Accent theme"] = "Акцентная тема", ["Run action"] = "Выполнить действие", ["Adjust value"] = "Изменить значение",
        ["Tap to open settings"] = "Открыть настройки", ["Toggle feature"] = "Переключить функцию",
        ["Tap to change color"] = "Изменить цвет", ["Type a value"] = "Введите значение",
        ["Remove saved config."] = "Удалить сохранённый конфиг.", ["Write current settings to file."] = "Записать текущие настройки в файл.",
        ["Apply saved settings."] = "Применить сохранённые настройки.", ["Copy current config as JSON."] = "Скопировать конфиг в JSON.",
        ["Apply a config from clipboard."] = "Применить конфиг из буфера.", ["Remove every hotkey"] = "Удалить все горячие клавиши",
        ["Quick dance / cheer / sit."] = "Быстрый танец / радость / сидеть.", ["Unload hamer."] = "Выгрузить hamer."
    }
    local ruSub = {
        ["Role ESP, chams, skeleton, tracers"] = "ESP ролей, чамсы, скелет, трассеры",
        ["Show player names"] = "Показывать имена игроков", ["Show distance"] = "Показывать дистанцию",
        ["Edge arrows for off-screen players"] = "Стрелки у края для игроков за экраном",
        ["Show held tool name"] = "Показывать название предмета в руке",
        ["Highlight nearby coins and loot"] = "Подсвечивать монеты и лут рядом",
        ["Item highlight color"] = "Цвет подсветки предметов", ["Maximum brightness"] = "Максимальная яркость",
        ["Atmospheric fog effect"] = "Атмосферный туман", ["Fog thickness"] = "Плотность тумана",
        ["Blur on movement"] = "Размытие при движении", ["Blur intensity"] = "Сила размытия",
        ["Stretch screen view"] = "Растягивать изображение", ["Screen stretch"] = "Растяжение экрана",
        ["Saturation & contrast"] = "Насыщенность и контраст", ["Color saturation"] = "Насыщенность цвета",
        ["Color contrast"] = "Контраст цвета", ["Post-processing preset"] = "Пресет постобработки",
        ["Shader strength"] = "Сила шейдера", ["Movement speed"] = "Скорость передвижения",
        ["Walk speed"] = "Скорость ходьбы", ["Jump power"] = "Сила прыжка", ["Jump height"] = "Высота прыжка",
        ["Free flight"] = "Свободный полёт", ["Flight speed"] = "Скорость полёта",
        ["Walk through walls"] = "Проходить сквозь стены", ["Auto aim at target"] = "Автонаведение на цель",
        ["Aim radius"] = "Радиус наведения", ["Aim smoothing"] = "Сглаживание наведения",
        ["Expand hitbox"] = "Увеличить хитбокс", ["Hitbox size"] = "Размер хитбокса",
        ["Infinite jumping"] = "Бесконечные прыжки", ["Stay active"] = "Оставаться активным",
        ["Collect nearby items"] = "Собирать предметы рядом", ["On-screen watermark"] = "Водяной знак на экране",
        ["Neon materials"] = "Неоновые материалы", ["Attach a 3D model"] = "Прикрепить 3D-модель",
        ["Neon skin"] = "Неоновая кожа", ["Model size"] = "Размер модели",
        ["Replace right leg"] = "Заменить правую ногу", ["Transparent legs"] = "Прозрачные ноги",
        ["Disable animations"] = "Отключить анимации", ["Layered feather wings"] = "Слоистые перьевые крылья",
        ["Neon halo"] = "Неоновый нимб", ["Neon hat"] = "Неоновая шляпа", ["Neon kagune"] = "Неоновое кагуне",
        ["Floating orb"] = "Парящая сфера", ["Character size"] = "Размер персонажа",
        ["Phone / tablet layout"] = "Раскладка для телефона/планшета", ["Glass background"] = "Стеклянный фон",
        ["Mini fox on your shoulder"] = "Мини-лиса на плече", ["Fox size"] = "Размер лисы",
        ["Auto collect MM2 coins"] = "Автосбор монет MM2", ["Pass through walls"] = "Проходить сквозь стены",
        ["Farm below the map"] = "Фарм под картой", ["Route shots onto target"] = "Направлять выстрелы в цель",
        ["Target search radius"] = "Радиус поиска цели", ["Maximum lock distance"] = "Макс. дистанция захвата",
        ["Velocity prediction"] = "Предсказание скорости", ["Shoot through walls"] = "Стрелять сквозь стены",
        ["Knife every player"] = "Бить ножом каждого игрока", ["Load config on inject"] = "Загружать конфиг при запуске",
        ["1 weak, 2 medium, 3 max"] = "1 слабая, 2 средняя, 3 макс.", ["Swirling particle aura"] = "Вихревая аура из частиц",
        ["1 third person, 2 first person"] = "1 третье лицо, 2 первое лицо",
        ["Pilot the drone manually"] = "Управлять дроном вручную", ["Manual flight speed"] = "Ручная скорость полёта",
        ["Floating neon crown"] = "Парящая неоновая корона", ["Demon horns"] = "Демонические рога",
        ["Neon cat ears"] = "Неоновые кошачьи уши", ["Neon jetpack"] = "Неоновый джетпак",
        ["Animated neon tail"] = "Анимированный неоновый хвост", ["Classic top hat"] = "Классический цилиндр",
        ["Glowing visor"] = "Светящийся визор", ["Neon scythe on your back"] = "Неоновая коса на спине",
        ["Crimson demon mask"] = "Багровая маска демона", ["Tactical gas mask"] = "Тактический противогаз",
        ["Cyber face mask"] = "Кибер-маска", ["Neon baseball cap"] = "Неоновая бейсболка",
        ["Glowing tech backpack"] = "Светящийся технорюкзак", ["Winged holy backpack"] = "Святой рюкзак с крыльями",
        ["Equip knife automatically"] = "Автоматически экипировать нож",
        ["Equip gun automatically"] = "Автоматически экипировать пистолет", ["Hit players near you"] = "Бить игроков рядом",
        ["Knife aura radius"] = "Радиус ауры ножа", ["Cycle avatar colors"] = "Циклически менять цвета аватара",
        ["Neon trail while moving"] = "Неоновый след при движении",
        ["Hide your character locally"] = "Скрыть персонажа локально",
        ["Teleport where you click or tap"] = "Телепорт по клику или тапу",
        ["Spin your character rapidly"] = "Быстро вращать персонажа", ["Spin speed in rad/s"] = "Скорость вращения в рад/с",
        ["Play random emotes repeatedly"] = "Повторять случайные эмоции", ["Fling players near you"] = "Отбрасывать игроков рядом",
        ["Fling aura radius"] = "Радиус ауры отбрасывания",
        ["Teleport behind the closest player"] = "Телепорт за ближайшего игрока",
        ["Circle around the closest player"] = "Кружить вокруг ближайшего игрока",
        ["Orbit speed in rev/s"] = "Скорость орбиты в об/с", ["Orbit radius"] = "Радиус орбиты",
        ["Sit and stand repeatedly"] = "Многократно садиться и вставать", ["Jump automatically"] = "Прыгать автоматически",
        ["Ragdoll your character"] = "Включить рэгдолл персонажа",
        ["Ragebot for FPS Flick and other shooters"] = "Рейджбот для FPS Flick и других шутеров",
        ["Camera or silent shot redirect"] = "Камера или перенаправление выстрелов",
        ["Fire automatically while a target is locked"] = "Стрелять автоматически при захвате цели",
        ["Target search cone"] = "Конус поиска цели", ["Maximum target distance"] = "Макс. дистанция цели",
        ["Target scoring mode"] = "Режим выбора цели", ["Preferred hitbox"] = "Предпочитаемый хитбокс",
        ["Probe exposed hitbox points"] = "Проверять открытые точки хитбокса",
        ["Lead moving targets"] = "Упреждение движущихся целей", ["Compensate projectile drop"] = "Компенсация падения снаряда",
        ["Extra prediction delay"] = "Доп. задержка предсказания", ["Maximum lead time"] = "Макс. время упреждения",
        ["0 = instant snap"] = "0 = мгновенный захват", ["Target scan frequency"] = "Частота сканирования цели",
        ["Remove FPS Flick camera recoil"] = "Убрать отдачу камеры FPS Flick",
        ["Reload when magazine is empty"] = "Перезаряжать при пустом магазине",
        ["Ignore same-team players"] = "Игнорировать игроков своей команды",
        ["Skip spawn-shielded players"] = "Пропускать игроков со спавн-щитом",
        ["Only aim at visible targets"] = "Целиться только в видимых", ["Draw the aiming cone"] = "Рисовать конус прицеливания",
        ["Highlight the locked target"] = "Подсвечивать захваченную цель", ["Rotate your character"] = "Вращать персонажа",
        ["Spin speed in degrees/s"] = "Скорость вращения в град/с", ["Spin direction"] = "Направление вращения",
        ["Add yaw jitter"] = "Добавить джиттер по рысканью", ["Jitter amplitude"] = "Амплитуда джиттера",
        ["Jitter frequency"] = "Частота джиттера", ["Draw local shot tracers"] = "Рисовать локальные трассеры",
        ["Tracer color"] = "Цвет трассера"
    }
    for k, v in pairs(ruSub) do ru[k] = v end

    local function L(text)
        if S.Lang == "RU" and type(text) == "string" then return ru[text] or text end
        return text
    end
    return {L = L}
end)()

local TabIcons = (function()
    local DATA = {
        combat = "iVBORw0KGgoAAAANSUhEUgAAAEAAAABACAYAAACqaXHeAAADXUlEQVR42u2av2tUQRDHZ98lgWASE1GwSoyFjaUKgij6P9jZiacENKaxsbJXEUSIXhQEQdTWWkHEIlaioEJEUBEExUKMP5LcfSycxeVxl7vkdt++e75p9rg7bufzfTvz3syNSGmllVZaae0NMID5L/3LM3hw/4BE163ARN4E6da/pN2PG2MawEYReSgiR/SjSl7gg/lnVQRGgMf8tbsaa315OfYp/+7pexUfCSUBxoFX/LO3eUiKq/j3GhhYi1+m1QbGGIBJEdkrIrtEZLeIjIrIExFJjDFTGn8YY8haAMe/fSKyQ0SmRWRQRHYaY97Y8PC98TlH7Zo9brGTInAY+A7UgfvABj0hxsdR69Nj1Q9cV/jF2CLYPARMqS/Luj4DNnkNURtz+rqmG/2IJYIDX1Uffun6FBgNcqvOiwhAv65Hm8CPuc8GobJvJZYIDvxU5vCxRXDgT2vCO5M5fCwRHPhTwAowAVwCnjsxn0jGWTgTEZrAjwOzwIdo8FmJsAr8O2A4KnxoEXoCPpQIPQXvW4SehPclQk/DdytCIeDXK0Kh4NchwkDh4NciQmHhOxThAnBCa/niwbcR4bdT0W3T998XDr6FCOcV/rNT2LwARrKGz2wjbZzadvWCiCxqo/WYiMyIyCNjzDft9iBFs9Strg5MApdTPca5vDRaQ8LbbH8NeAlcUfifees2h4S32X5IP5uL3WiNAT+c+k6tUCJ0+ngbu9EaFT52ozUX8IUSoduqrqdF8FXS9pQIoer5NYiQdD0M0QV8koI/6bOk7bSUjlI4OfBbdJ0JUc+3EeEqMAQctCciK3j71/QeBb0DfAS2h6jnW4hgZwEWdK26vmUF/9WZFjkLXNS/q7zX8ykRZvW0WRHqmYjQAn4FWNLXn0LW885T46AOQzV0f7uGE8GJeRfeKt/Qq7EE7HcHKQIJcMjZv+H4kBYh8b3xAeCLc+VJxeMNYNjLcFL7C3Hc8aOZCDPqR+Jj04oOSj1I9fJc+Fr62SBgHrK5oNpEBBuOt9Xviq8EZIDNwLwDvpyjIam6Az+vecLvlJiuYzqSQo7G5KqOP/POuIwJFX+jOppyK/ZzuSPCNHAzeEvdEWHISY6xp0STZqc1eAGUs0o0CXn3aZkYpbTSSiuttNJK62X7A6SjUD7RIP7PAAAAAElFTkSuQmCC",
        flick = "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",
        cosmetics = "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",
        visuals = "iVBORw0KGgoAAAANSUhEUgAAAEAAAABACAYAAACqaXHeAAAFcElEQVR42u2aS2hdVRSG/32TmtRXTQMObLE4qLSJoHQQQZFqrFbiwPqkE5EKnbfovHdu6EActdCBs5SCFSpIY60gFVrhIoopmJlUqI9UctFK7z3nfA6ydtnunvt+ROv54XBucs9+/P9ae52917pSgQIFChQoUKBAgQIFChT4/8Gtx6BASVJJUiYJSSN2z5xz3JYCBKTTZiSB0WGK4QZI2BlhF5MGpiTNSHpV0qSkU5K+lFRxzqXBcyP2ceie0TVpYMSsGH83BbwLXAAS8rEEvAc8EZC/KQYwap707/GAwNLKsd7jkl6WtFvSLlvrHmnYjX0XzmdJ0iVJpyWdd85V82KIcy5bFwGMIOEEgHskzUp6WtLzkqaiZomNWWowl8yuWIwrkhZtmSw6565EBhhxziVDEwAoeeLApKQnzdJ7JG2NLJtGpL1gI1G3aeQJXoxSJFhV0hfmGeeccz96IYYSJ/z6Bl4BPgZ+jdZxCtTtHiLJ+ft3u663eNb3Gf//T+Ar4HAQg9wwyB9sk7RH3e43gNPAAQuKk8BmYJsJegL4Oegzy+krMyFiMY4FwdINg3xixDKaw3//KTDdxjj3A+/ntKeJGDcGKkID8q2Ih8+VG/S72a681+YbwG/Wvp2x6gMRoQfyfkJla39HYOEycBFYset74DjwSPTsnsDKDF2EHi0PsGjtx+y+F/ipSbsacMiC2UZrU24QGAcrQg/kvcteBx4O+tsTTjJN07RWq2W1Wi1LkiQOot5rRoENtkOkSZDtrwg9kA8tdcbvGSzaX/XunGW3dpWmqRevZvfdwXzeiYgNToQeyYcCHPADBm5c9+Sr1SpHjx6lXC6zvLy85jpr3/n25008B+wIhGFgIviDRg/kvRX/ArZbXxuAb7z10zRlZWWFmZkZbOfH5OQklUqFLMtIkiQL+tjmg6IFyk6WQa4Iwfb5VvJ2He6RPBbZ7/NbZeAaQK1WywDm5+eRxNjYGOPj40hibm5ubdAkIV1bDxkwG8xvscNgmCfCh8Bd3rOUcyhxkh4N9uy9vEfDtv8YZ3V1VXZ6VJZlKpVKqlaree1Lfc5d7JI0Zp6Xe5b3S+BYF0En9IAqsMX62ggsA1mSJGmWZVy+fJmJiYmbS0ASCwsLNz0gCIbTwdq92KUHeA6XgE0Nl0AfRfATfCkIgseD1x8AlUqFffv2MTs7y8mTJ8M3gXf/JWCDtd9iBx86XJYh+YkwzrXM6vQggn/2RNDfjvDs0OQ1SLCvfyto/2YX1u+cfJ9E8FH8F2Ai8KhDAYkkSZIsSRKSJKFer2dmeU/+lAUq7wGfd7kb7Jx8n0TwE/0g2gofyTlGx6+1BRPOnwdeHzr5PovwWiTCs8BZ4I9o0t8Cb4fZYOAhe4WmHR7AeiffBxH8UrgG7I3S3AIeBJ6xa2ewA/X37cDXHWx++k++hQi1NiYWWu2Id+s2xttvuQDaHKM2MPItRGgnHRYmNL6zg82UD3BB/9vs/HA26jsPeTnCrsi7TkVY28C5DJiXtF/SlpwssK8IuSjrOxJ8/kHSVfv7bknTku6MdqFh+2ZZ4s8kHXTOXQsz1gNJi/vNjXMOqwPMSHpB0ouSdjapA4Sp7tEG3adBytzvEpvVCc5IuuTrBN2kxnsqjHRZCSoF3kLOecFXjGORWlWK6KYu4HqNC966cWXGCqBzJshjgXvHRZBGpP0y+UTSR5IuNiic0mt5rO+F0fiwYa+8A1ZIWW2xd7hgRdSpBgXSvqa8B1kez/09ALBV0nOSnpK0V9K9ks5Zueusc25pPX8vMDAx8krbwCbggRxPGg2TFrfVT2QCz8CvaXN1149y93/NM9wwrFygQIECBQoUKFCgQIECBSL8DRfJDf15+hybAAAAAElFTkSuQmCC",
        mm2 = "iVBORw0KGgoAAAANSUhEUgAAAEAAAABACAYAAACqaXHeAAACp0lEQVR42u2bvYoUQRDHq+d25RLhVk0uEzQUhL1bRAwP1AcwVg5uRYx8hAtMfYA7UXwIzRRT8SMzE01Eg/uK9MDdm/kZWI3FMsPu7RlY3VOw9GzvzsLv311d1V2zIq211lprrbXm0oAFIOQKX1ghsht5ba8D56IgWQgBdLTd4I99AtYn3KJIFb6r7VDhx/y1l8BanYukAB7MtI/wR0AFlHod7SlwMd6XCnyh1w8UslR4a0em7xdw296bwshv14BOWnSJD8AFvT+kBD+i2aIbvAWWXLtAA/x4Rvie60XwBPBfcoQvtT0AVl1nhTaTmwN+4B7eXM8L33END5wGnuQK39MVPHv4UTvyLXwtfJkrfGUSnVt2S+z5FGce+KH3kW/hgeUc4eP53QD4PrF5yQr+oIWfDl+mDF9OgR/nCm/T303vcX4e+Djy2/E3XJ7j/SP4wjv8tRPAL3iHHxqoLOEnQ1ny8E11uizgixYeLpkpX80Y55/9j/DFnN/vi0gQkUrbJjsSka6IvBOR+yogIQRcCWCqrBH2sohMgyhFpKPwN0IIhyIiIYTK27QPE++7wPspIS+NYqXx+SXgBdAHFoFD9f2q5gAzwn8GzqQA3wPeKNRX4KGJ+3V7eYB94KoNmS6nvY78tKKFBf8I3ASW69zHDby+zuujJjaOVw2+PwY2gVNNa4erqa8CrKqv21GugNcGegw8j9PddZLT4P8rZoc3Au5of6zi/gT62rcoKZnJ9we6qAE8Mp/HOv4ucMX1UdaMBx1RhK0aEXbc1+1mFGGnRoQt7dvLWYTHJv5nK8KrGhGKlEXYjQsjsA78MOFyH1hz/6zuMUSoK3LcdZsKH1OEPZMYxQxxI0kXmCFE+i9vzSnCCvANuJcNfE3afDb5aT+DCHn+h88z/G+oK6p/H7P1aAAAAABJRU5ErkJggg==",
        fun = "iVBORw0KGgoAAAANSUhEUgAAAEAAAABACAYAAACqaXHeAAAErUlEQVR42u2aS4gcVRSG/1M9E8wD8zJBJC4UjUREUBhFs1FJ8ImPRVwKCpKtuHJn0L07cSe6EkcQFyY+xqjgIojufL9wI0nUcWRMICTTVZ+bc+Vyre6u6u7qCXp/KOpOuqr+c88997xupIyMjIyMjIyMjIyMjIyMjIz/GWzaHwSsc6HNuGgUABSSCklIqqYp3BDOnstemVm1LgrwiZuZlcm/b+vIuoJiz8ScbnFFKkenCgB6gRDYI+mgpAck7ZF0bccGcErSL5KWJB01s2+iBaFTCwQs7HHgBuBlYJX1wxrwPnAwscxOJl9E4yPA+UiQfnRVHV+l86wlyngN2Bn5iOlPHtgBvJusQOXjKhp3iSrh7LtSAL4HFtoowZqYvQ93SHpH0oKkNUlz/n7p9yJyVqWk3pQd4Sievsv0p6S7zewzoBgVJaypwwOWJB3wyc9HQoRvrEqqJG1PPLdNKQI04QlK+E3SjX63sUNlMCPgWTexCzVm+AbwILAb2A7cDryQPDupybfhCb5hCSjG9gfRvr/OScqIJIwPD3l/P7A8oRLG5QlKeGxspxit/qvJR/t+P+K/zwO9ECJd6xv8twOR8tpiEp6guG+BjXH4bpXPA5cDZ5MwBHDKP9wb9GFg3u9Hkwm1MftJeML9/mFWMChpCA/fK2mzO53g8SXpmJmdG1GY4EK/PqbHn5QHvw4NIypG5N0PDfj9RycdZlYhLf3BvfM40aANz09JZAvh8SCwySOZNVVABcxJunJAuNzVoGQt3ZF+LumEc7UtWHa12LI7k8UL462SLhsU9ou6j7lGL5V0dfJieP6+GrI6oXq++v2WE2/ME22Ph5NnzcebowKtsQWED1U1z5eS9ko65Ku8oc60zAwzW3PhyjEUMJQnRAL/7SZJj7jMvSE+RW0UYJ5V1b2DpJeAW8zsgpkR5Q0hTO0GFoHjkm5uwNeYxyceW8WdkrZFzjrFfOuS18PP11FcrQtTq8BT3hOQCzfv9zenVPj8i8e5LgHmonzluZpwWwHngH2tSuVoNd8bEsPj7O4v4O2kZP7I3zs/YTqc8nwMfAh8AWyJcpZbk8UK7y0DW1r1Kz0CCHgmyQLrhIuV8wlw3AX8Y0q1QB1PwNNRlrhYkwhVwLGwbRpXg6GMBPZK+qpBaRuSjm66MfWOOZTGJ3z/70uqxlAqP25mrwBzZtZvXA5HGvtA0h1OPKqoKBMnZjNQSOCokl4BklYkXS9peVA2WQwPr1ZJer7FRHrR1fn5QJSeV8lcSv/7RTP73bvGtG6IRM2QRc+p+wNC48WEEAp/9vB7Zli3eJQCQh6+zVPaq6K9dbFOPszrNjP7dFRbrGhyBGVmK5Ie9X5bb4zUdhaIe4aHffK9SU+O0ubIAnAyCo0l648qCtNrwJNxKJ/2eZyAK5LWeD9Sxizb4v0kN/gO2N/J5FMl+PgJ4MsBfbwurxSn/aBm6zj9PxtDCRb8g/fk7vFK7C6vuzfNYK+veAL0lneNfo0TuFmdDveSU9qNroBrOlbAaUknzWw1scyxjuZtwi3xz0nNuMfTEx7XFZLKSU6EbYoChZxhFukvs/iPGBkZGRkZGRkZGRkZ/138DTvn+lgbnYdqAAAAAElFTkSuQmCC",
        places = "iVBORw0KGgoAAAANSUhEUgAAAEAAAABACAYAAACqaXHeAAAKmklEQVR42u1ba7BVZRl+3n323kdALkfiohEOICAqFiYx4SUvkE05DVkw1UzRRWKaxmIapX5AUjON46CYDP4AkYw/ZdI0WUpANqOmR0EcmQPIRRyRQMDDkatwzt57Pf3w+fLtY+1z9t7ngtX5Ztastb713d7L916/BfSW3tJb/p+LnauJSZ41t5nxfxIBJDMAMnpNADANWLUzXQSQdDdSrJspXAegVAbYBgEZ1nHMzJKUdlkhIvmvQECgopmVXN1lAD4F4OMArgTQH8AlUde3ARwE8BaAVwE0AtgcxhFCM37cD1UhaSTr3PsIkneSfIFkkbWVbSQXk7wymifzYQPeA34FyVUkjzlAEiGhoKtc8W1KUf16ktPT5jynW4Bk1syKJIcCWABgLoC8Pp8BUO/mSSQM9wPYGc0/HMAE1wZujLyrWwtgvpltFSfwXGiP/2BFkreQ3O8odsY9F0g2uW3wN5L902QHyV84iu8mecSN0+bGaCU5L5I75wz4u90iW93zQZJLSF5Ccr5YuoXkmMA5AjpDsk5jZkluVP8/kRxK8i4hMG2Ox0he0KNI8MKO5ApHsTZH8aUkh6nNAJKH9W2hU21p6g4kr5fMIMnrVXceyTtIHnJzhPk2SqV2PxIiyq9wFAmL2UxyihdU0gQk+TbJj4ji1p4wlcAjyT8HLlH9RaI6xVGtPYqEFMq3OWn9SNjbjr3zJF8VRR/Rt7y+p131Qto3NeYJkmOF+Lxbx7xINgQkDFZb6w7gA4sucpQvCLhFEdUDoqY4BH2uirmGkDyqfndGSA1jzyLZHHHChmpVpFVKeTMrSQ+vB1CUGZsD8HMzWyQElcyMJOsBFADcA2A+gD0ApgIYDGAYgJG6fDkGoAnAaQDbAKwCMBPA8wBu0FqLGj9nZgWS0wBsAFDSlffrMbNil+17kg2S7J7tHlWbXBCOfg+SfFkc8k+Sr1dhEe4nuUt9T5IckrINc7rPdYIxcOR1XWYsuQmXRWpoC8m+DkHeGpwmNZZm9TVLra2TsFuv50Z9i/skJDeR/FaQA/Gcsjz92jZLnmQ6JQ+c9B2vhRWduTrJU0LPN5NcGy2+QHI1ydkkJ4uT6srM10ByAskZJO8n+a5TiZRA/bZrnxPX9SO5R20DEmZ3mgschn8TWXjLVF+ve3+SD7qFHie50xlEVsby81damyc1xj6Sb7nxnyI5LlrDV9z2TEjuINmnZq0QOpG8UPuwpIEPiVJBK0wSi4byJMlRDmnPSoLnnMVnHcibevW5R2PskGa4n+Rp1R0iOSuoVt2fjrbCrTVzgQMwGDJh4vtcm8nOXj9M8quRACTJh6tdhJs72AMnSY5wqtUjfI7jqM87BCQk/1KzceRY80Vn7raSnKjvw5xW2ORkgpEc5MzfBeXM3wq23mccoDe4+gaSv3Pfpqm+r7RHkD/HSV5YLgZZifAbJ6CDMdPoEPOc6g4ENeX24wSSp/T9SzVwQJh/pDOIZvs59LzObYfRqlsccezs9ghQjjVC/TUyLtr0vk6xuQUArpWv/mUze0cTBMNjBIC+em6uRf7qflRzwIXQSs4/+DqAXQCGAliuuqfUP8BwUzRmRQgI5ZORxfiS7nsA7ABwr5k1plhdZ9xzfSfMkKwuyEIM4fNEcccjAH4IYAuAx7XOJgAnXFBmolR1UssWeNrtp1NiSUux/kxXqPuR+r0b+kTtKrnqNF6jxlrjYgYWeaYZJ7dyJF9x8qGF5MByciDbgSTu7zjgHQAHQ/jJzAqBJV23gvoO0nsbgGb1qTaaWxK7H9V7g8YpxlslhMx1T0juBjBJVM8CGCBfw+KtkBaYMDNLBMQ49+lNAH1Jnq+B06RqnRZe796HOSCqjVcSQJ+wXeXzW7n97Obf4wjSX3DsS1tztgNBlLjnqRI4lZQgABsAbKpq/51dBuo+VYHUSko/3XMuGFtWyFQijcNgQ6pcfEYucFeUfA3zW3saoCMEmMMgALwOYLXYLGkH4ET++40A3gOwVBK8PdZtbwvMBjBabL26wi1wLYDpkhe5CI6K/H+TI7HNSdMtVYxxV3CEusAdDw7R2ir6PORiBO+RnFDOJD6LAxRxyZjZaZKHAFymT2NIXgTgsNf50rF04xWdEMySHC5jqFoOyKh9kCcmzZRxHPjvKJF3ipz9kgVwCsCBclsh08He2e/UWR8AY5QF+gTJR0nOlDqkkFLQ/UX1uwDAONUlZlas5FJorU3C7NJghPlxdC8AGE9yuXyRotY5ysFyCEBbOV+gIwRsdDo5A+Bqvc/V3lyqlFgS2fo+7d2ZsJTvz5TUOwA8COB7AJar/RgJ3sClW83stDLLFXNAYLFGPQchMk33heKO4QD+aGZU2jrjApxtFWqajkzhMGaLQ0pGQdElAD4rYH+qNUwXcoKh9o+a8qAShPUKRnj38qP6PtUFOVe6nECd3NVmfftJJ9zha1xI7KZgTrvcQPBS57m5Y/f90ppiAi4ocV/kXv7YLeJ2pyUaXZiqD8ntqn+gBnc4IOA2N3eIQwwUwkNZ4fyAyUJKCKy+VPN5AudgXO4CohRgWReW/o6cnhDxDfm/ELDYIMpkKwlKhCyQ+vxMY7zp4n7bHfBLohD5r6PY5Zxqua8cEv4exdp+EAVArtJJEM8Nz+j5jZRIU12Z1FgmavtbFxN8wo2/z8UDgwd6ldZXFBc0KxdZe6rMseKNUS6wRalrc9jPkVwQnRMIaavvK0rUr5I55ULPUCQ4ic4drJQ9EtJlYas+G1F/USVbrxKWzMg7XCeJ2ya7fI2ZzdQC6A4zDZWanAPgY5Fm2SuTeq8ub6s3AJgozTLaOTRUgOP3AH5lZtscYCa7ZB6AByT56wAcBnBF0BydOkESJUeK0VmAeXFwJEpy7BYFj9VwQOqY46DJEYeYo/ynU9ZVcVKk2uSox7RJT880szUuYWkA8mbWSnIlgO8q2Xk7gPHiipEALhZ1zcX/mgCcVOjtDgBfA7BdnBHOA5XcuaRRAF4W9wTH5w8AZiE6qteVOcI1Uey9heQtEXXC/QtOJ0+s0gbZq773Rmo53Me6/EAQzm+I87r+jECUJd4YZYlJcq63IdR+gEtpLRZizgtZ5OgK33Ikb3Xe3BS3zTLOQDoSraGF5NXdekrELcAjwecNHnYByLwAC3H61zrK2Ea5yETqNJdyOqQQUb4lyImuOj9YLRL8EbadUYpsgqPSN8oZJgExYu2QVPGZ4Ck6Ysd2gM+iJ0qEhL+mHFqisjYzInN6pzLJ2ZSzQvnIgnzB+RyrHNX9CbFdPQ58jAQ93x0dWvKHHLaSfNxxyLJ2xpzlhOYzLi+RdgDzMZKDO8v21lnBKHWTkLwZwC8BTHEhaboMTTCGMgCeAPBKNP/FAG4DcD4++GcgxCJ8lOkAgIVmtsqraJzL4lRTTs5RU0S5VncAOunAACo5V7YUnTxdJEsTnT7+0g1I8FZgnuQXdU7oeAqQidjZX8Uyp8efJzknnDztaklvXYyEs35q0MGG6QCuA3A5gLFi574pqbDjeP+nidcAPAdgvZltjwDv0t9orJu4wZzpmkTfBiH9j5GDeP+vkRMRAsNY3fL/kPWQtggh7oqACJ4euvFfoR5DQDnNkTI38UG2l+gtvaW39JYeKP8CplUcugxtSaMAAAAASUVORK5CYII=",
        configs = "iVBORw0KGgoAAAANSUhEUgAAAEAAAABACAYAAACqaXHeAAADe0lEQVR42u2bsWsUQRTGf+/uEklQEwUbG0ktGC3SCHZiaxE7Cy3sUop/g2IRBEtBW0FEbAS7IAiC2mmbRsSIpIgxQXPZ/SzyxixHLreb2927i/NgWO6Y2Xnzve/tzHszA1GiRPmfxfJWlGRAc58qqZmldShduy6SGqNm2bw6Wx60zUySTgHXgamOtinQAJbMbMk7rgowmVkiaQa4ASijh/yZAC/M7LOkRl9MCChKmpX0VfvLfa/brMG6V3rosiXpZh4mtHJ01gIeAqeBP3v43ra/55f/npC0AEx0WKiITACTmfYCfgKPzWwZaHu/6R5sS4Fx4IGk18BKYHEhALxRKmkaOO9KjHcZUCsDzCRwr08jfwKW/J3ychv4ACz7/60uAAQ3mALOmtk3Z2VyIAZ45+2MJfLU/wGcOAAD2sAY8MTMFjsMMlvg2xJ03e5VsVXghUWk5UUHbDvtrhesnLpbFJ3irSwA6pbUzLYl/ZvT5T/KlpGb3yMAEYByZVi/AZZdUbr72ygBkHgpOgskXn/Tl7BbmWlwa1QAMGC6R7TWTUKbO5KudcQbc8DdUQCgDbwCjvWxFD7iJTv1vQFWOgKf4QLA/XbDzK5WFAQ1yw7NywTgT6fflu5bZokDsTFMAAS/vSXpcoGYoR+ZPuASvRIAghIzXmqdLofJBdIaLJ8deGPYvgEjuaqMsUAEIAIQAYgAxHxAn0v0QecOhmUl+F8yIOzYpDXFAJ3Ay8PuVt0AhDh/Dbjgz7A8rZoRYjdzJOAlcMn/aw6CAatmtj4oCktqD/obMJbZQp8HztF9z65fsA1YZWeztpFxvYEC0PDBXwOe1WT4M2Z22xkwNPmAObfSb3Y2OKuQxHW+OEzrgCCbDsYY1aXbw9mg0lJiZfppnavKxigqHWOBCEAEIAIQAYgARAAiABGAwwpAXXuD8r5qDYbyDGzCg5WkQmaFrM/RnDqrDAZYD6CCNZ57suKIv7eKMu59Pcqp91hfDPCrKZvAd3aSj212T3AHa6cAZvZe0hw7ZwT6ztTsM6g1M/uYuQyRsnsqLctWAV8KMHhPAJr+nO9yMaEt6WS2bh0iqZG5zPGui26LefTalwF+PcXM7Lkff1kAjmfcZ91ZAZC6UpVnhf3wdHDft87SJMPKp2b2xOukpSB+WKdBK+oOnf5U11W5AsaxwF6iRIkSpYf8Bfjzz17T7UjbAAAAAElFTkSuQmCC",
        themes = "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",
    }
    local B64 = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
    local function decode(data)
        data = string.gsub(data, "[^" .. B64 .. "=]", "")
        local out = {}
        for i = 1, #data, 4 do
            local chunk = string.sub(data, i, i + 3)
            local a = string.find(B64, string.sub(chunk, 1, 1), 1, true)
            local b = string.find(B64, string.sub(chunk, 2, 2), 1, true)
            local c = string.find(B64, string.sub(chunk, 3, 3), 1, true)
            local d = string.find(B64, string.sub(chunk, 4, 4), 1, true)
            a = a and a - 1 or 0
            b = b and b - 1 or 0
            c = c and c - 1 or 0
            d = d and d - 1 or 0
            local n = a * 262144 + b * 4096 + c * 64 + d
            local pad = 0
            if string.sub(chunk, 3, 3) == "=" then pad = 2 elseif string.sub(chunk, 4, 4) == "=" then pad = 1 end
            out[#out + 1] = string.char(math.floor(n / 65536) % 256)
            if pad < 2 then out[#out + 1] = string.char(math.floor(n / 256) % 256) end
            if pad < 1 then out[#out + 1] = string.char(n % 256) end
        end
        return table.concat(out)
    end
    local cache = {}
    local function get(id)
        if cache[id] ~= nil then return cache[id] or nil end
        local data = DATA[id]
        if not data or type(getcustomasset) ~= "function" or type(writefile) ~= "function" then
            cache[id] = false
            return nil
        end
        local ok, path = pcall(function()
            local dir = "hamer_icons"
            if type(makefolder) == "function" and type(isfolder) == "function" and not isfolder(dir) then makefolder(dir) end
            local file = dir .. "/tab_" .. id .. ".png"
            if type(isfile) == "function" and isfile(file) then return getcustomasset(file) end
            writefile(file, decode(data))
            return getcustomasset(file)
        end)
        cache[id] = (ok and type(path) == "string" and path ~= "") and path or false
        return cache[id] or nil
    end
    return {get = get}
end)()

local ThemeH = (function()
    local DATA = {
        Mint = "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",
        Cyan = "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",
        Purple = "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",
        Pink = "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",
        Red = "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",
        Lime = "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",
        Gold = "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",
        Blue = "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",
        Emerald = "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",
        Orange = "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",
        White = "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",
    }
    local B64 = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
    local function decode(data)
        data = string.gsub(data, "[^" .. B64 .. "=]", "")
        local out = {}
        for i = 1, #data, 4 do
            local chunk = string.sub(data, i, i + 3)
            local a = string.find(B64, string.sub(chunk, 1, 1), 1, true)
            local b = string.find(B64, string.sub(chunk, 2, 2), 1, true)
            local c = string.find(B64, string.sub(chunk, 3, 3), 1, true)
            local d = string.find(B64, string.sub(chunk, 4, 4), 1, true)
            a = a and a - 1 or 0
            b = b and b - 1 or 0
            c = c and c - 1 or 0
            d = d and d - 1 or 0
            local n = a * 262144 + b * 4096 + c * 64 + d
            local pad = 0
            if string.sub(chunk, 3, 3) == "=" then pad = 2 elseif string.sub(chunk, 4, 4) == "=" then pad = 1 end
            out[#out + 1] = string.char(math.floor(n / 65536) % 256)
            if pad < 2 then out[#out + 1] = string.char(math.floor(n / 256) % 256) end
            if pad < 1 then out[#out + 1] = string.char(n % 256) end
        end
        return table.concat(out)
    end
    local cache = {}
    local function get(name)
        name = tostring(name or "Mint")
        local key = string.lower(name)
        local id = nil
        for k in pairs(DATA) do
            if string.lower(k) == key then id = k break end
        end
        if not id then id = "Mint" end
        if cache[id] ~= nil then return cache[id] or nil end
        local data = DATA[id]
        if not data or type(getcustomasset) ~= "function" or type(writefile) ~= "function" then
            cache[id] = false
            return nil
        end
        local ok, path = pcall(function()
            local dir = "hamer_theme_h"
            if type(makefolder) == "function" and type(isfolder) == "function" and not isfolder(dir) then makefolder(dir) end
            local file = dir .. "/" .. id .. ".png"
            if type(isfile) == "function" and isfile(file) then return getcustomasset(file) end
            writefile(file, decode(data))
            return getcustomasset(file)
        end)
        cache[id] = (ok and type(path) == "string" and path ~= "") and path or false
        return cache[id] or nil
    end
    return {get = get}
end)()

local PALETTE = {
    Color3.fromRGB(0, 229, 255),
    Color3.fromRGB(255, 120, 200),
    Color3.fromRGB(255, 78, 100),
    Color3.fromRGB(160, 240, 90),
    Color3.fromRGB(186, 120, 255),
    Color3.fromRGB(255, 205, 80),
    Color3.fromRGB(255, 255, 255),
    Color3.fromRGB(232, 190, 158),
    Color3.fromRGB(150, 100, 70),
    Color3.fromRGB(200, 60, 60),
    Color3.fromRGB(0, 224, 184),
    Color3.fromRGB(255, 150, 70),
    Color3.fromRGB(90, 150, 255),
    Color3.fromRGB(70, 235, 155),
    Color3.fromRGB(120, 230, 255),
    Color3.fromRGB(200, 160, 255),
    Color3.fromRGB(255, 60, 180),
    Color3.fromRGB(255, 170, 200),
    Color3.fromRGB(255, 240, 120),
    Color3.fromRGB(255, 180, 40),
    Color3.fromRGB(255, 110, 90),
    Color3.fromRGB(220, 30, 60),
    Color3.fromRGB(130, 80, 255),
    Color3.fromRGB(35, 60, 160),
    Color3.fromRGB(0, 140, 150),
    Color3.fromRGB(40, 150, 80),
    Color3.fromRGB(130, 145, 165),
    Color3.fromRGB(210, 220, 235),
    Color3.fromRGB(55, 60, 72),
    Color3.fromRGB(14, 16, 22)
}

local function corner(inst, r)
    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, r)
    c.Parent = inst
    return c
end

local function stroke(inst, color, transparency, thickness)
    local st = Instance.new("UIStroke")
    st.Color = color
    st.Transparency = transparency
    st.Thickness = thickness or 1
    st.Parent = inst
    return st
end

local header = Instance.new("Frame")
header.Size = UDim2.new(1, 0, 0, 64)
header.BackgroundTransparency = 1
header.ZIndex = 11
header.Parent = main

local brandH = Instance.new("ImageLabel")
brandH.Size = UDim2.new(0, 52, 0, 52)
brandH.Position = UDim2.new(0, 24, 0, 6)
brandH.BackgroundTransparency = 1
brandH.ZIndex = 12
brandH.Parent = header

local brandText = Instance.new("TextLabel")
brandText.Text = "amer"
brandText.Font = FONT_BLACK
brandText.TextSize = FS(24)
brandText.TextColor3 = UI.text
brandText.TextXAlignment = Enum.TextXAlignment.Left
brandText.Size = UDim2.new(0, 140, 1, 0)
brandText.Position = UDim2.new(0, 68, 0, 0)
brandText.BackgroundTransparency = 1
brandText.ZIndex = 12
brandText.Parent = header

bindAccent(function()
    local asset = ThemeH.get(S.Accent)
    if asset then
        brandH.Image = asset
        brandH.Visible = true
        brandText.Text = "amer"
        brandText.Position = UDim2.new(0, 68, 0, 0)
        brandText.TextSize = FS(24)
    else
        brandH.Visible = false
        brandText.Text = "Hamer"
        brandText.Position = UDim2.new(0, 24, 0, 0)
        brandText.TextSize = FS(22)
    end
end)

local profile = Instance.new("Frame")
profile.Size = UDim2.new(0, 176, 0, 36)
profile.Position = UDim2.new(1, -264, 0, 15)
profile.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
profile.BackgroundTransparency = 0.93
profile.BorderSizePixel = 0
profile.ZIndex = 12
profile.Parent = header
corner(profile, 18)
stroke(profile, UI.line, 0.9, 1)
local profileDot = Instance.new("Frame")
profileDot.Size = UDim2.new(0, 24, 0, 24)
profileDot.Position = UDim2.new(0, 8, 0.5, -12)
profileDot.BackgroundColor3 = accent()
profileDot.BorderSizePixel = 0
profileDot.ZIndex = 13
profileDot.Parent = profile
corner(profileDot, 12)
bindAccent(function(c) profileDot.BackgroundColor3 = c end)
local profileInitial = Instance.new("TextLabel")
profileInitial.Text = string.sub(LocalPlayer.DisplayName ~= "" and LocalPlayer.DisplayName or LocalPlayer.Name, 1, 1)
profileInitial.Font = FONT_BLACK
profileInitial.TextSize = FS(10)
profileInitial.TextColor3 = Color3.fromRGB(15, 18, 24)
profileInitial.Size = UDim2.new(1, 0, 1, 0)
profileInitial.BackgroundTransparency = 1
profileInitial.ZIndex = 14
profileInitial.Parent = profileDot
local profileName = Instance.new("TextLabel")
profileName.Text = string.sub(LocalPlayer.DisplayName ~= "" and LocalPlayer.DisplayName or LocalPlayer.Name, 1, 14)
profileName.Font = FONT_BOLD
profileName.TextSize = FS(10)
profileName.TextColor3 = UI.text
profileName.TextXAlignment = Enum.TextXAlignment.Left
profileName.Size = UDim2.new(1, -44, 0, 16)
profileName.Position = UDim2.new(0, 42, 0, 5)
profileName.BackgroundTransparency = 1
profileName.ZIndex = 13
profileName.Parent = profile
local profileSub = Instance.new("TextLabel")
profileSub.Text = "premium"
profileSub.Font = FONT_REG
profileSub.TextSize = FS(8)
profileSub.TextColor3 = UI.sub
profileSub.TextXAlignment = Enum.TextXAlignment.Left
profileSub.Size = UDim2.new(1, -44, 0, 12)
profileSub.Position = UDim2.new(0, 42, 0, 20)
profileSub.BackgroundTransparency = 1
profileSub.ZIndex = 13
profileSub.Parent = profile

local headerLine = Instance.new("Frame")
headerLine.Size = UDim2.new(1, -32, 0, 1)
headerLine.Position = UDim2.new(0, 16, 0, 63)
headerLine.BackgroundColor3 = UI.line
headerLine.BackgroundTransparency = 0.92
headerLine.BorderSizePixel = 0
headerLine.ZIndex = 12
headerLine.Parent = header

local closeDot
for i = 1, 3 do
    local isClose = i == 3
    local d
    if isClose then
        d = Instance.new("TextButton")
        d.Text = ""
        d.AutoButtonColor = false
    else
        d = Instance.new("Frame")
    end
    d.Size = UDim2.new(0, 12, 0, 12)
    d.Position = UDim2.new(1, -22 - (3 - i) * 22, 0, 26)
    d.BackgroundColor3 = isClose and Color3.fromRGB(240, 242, 246) or Color3.fromRGB(58, 61, 68)
    d.BorderSizePixel = 0
    d.ZIndex = 12
    d.Parent = header
    corner(d, 6)
    if isClose then closeDot = d end
end

local tabs = {
    {id = "combat", label = "Combat", icon = "⚔️"},
    {id = "flick", label = "Flick", icon = "🎯"},
    {id = "cosmetics", label = "Cosmetics", icon = "✨"},
    {id = "visual", label = "Visuals", icon = "👁️"},
    {id = "mm2", label = "MM2", icon = "🔪"},
    {id = "fun", label = "Fun", icon = "🎮"},
    {id = "places", label = "Places", icon = "🌐"},
    {id = "configs", label = "Configs", icon = "💾"},
    {id = "themes", label = "Themes", icon = "🎨"}
}

local navLabel = Instance.new("TextLabel")
navLabel.Text = Loc.L("NAVIGATION")
navLabel.Font = FONT_BOLD
navLabel.TextSize = FS(8)
navLabel.TextColor3 = UI.sub
navLabel.TextXAlignment = Enum.TextXAlignment.Left
navLabel.Size = UDim2.new(0, 160, 0, 14)
navLabel.Position = UDim2.new(0, 26, 0, 78)
navLabel.BackgroundTransparency = 1
navLabel.ZIndex = 11
navLabel.Parent = main

local tabBar = Instance.new("Frame")
local tabHeight = 40
local tabGap = 4
tabBar.Size = UDim2.new(0, 166, 0, #tabs * tabHeight + (#tabs - 1) * tabGap)
tabBar.Position = UDim2.new(0, 22, 0, 100)
tabBar.BackgroundTransparency = 1
tabBar.ZIndex = 11
tabBar.Parent = main
local tabList = Instance.new("UIListLayout")
tabList.FillDirection = Enum.FillDirection.Vertical
tabList.Padding = UDim.new(0, tabGap)
tabList.SortOrder = Enum.SortOrder.LayoutOrder
tabList.Parent = tabBar

local tabDivider = Instance.new("Frame")
tabDivider.Size = UDim2.new(0, 166, 0, 1)
tabDivider.Position = UDim2.new(0, 22, 1, -76)
tabDivider.BackgroundColor3 = UI.line
tabDivider.BackgroundTransparency = 0.92
tabDivider.BorderSizePixel = 0
tabDivider.ZIndex = 11
tabDivider.Parent = main

local playerBtn = Instance.new("TextButton")
playerBtn.Size = UDim2.new(0, 166, 0, 46)
playerBtn.Position = UDim2.new(0, 22, 1, -62)
playerBtn.BackgroundColor3 = UI.card
playerBtn.BackgroundTransparency = S.Transparent and 0.75 or 0.55
playerBtn.BorderSizePixel = 0
playerBtn.Text = ""
playerBtn.AutoButtonColor = false
playerBtn.ZIndex = 12
playerBtn.Parent = main
corner(playerBtn, 10)
local playerStroke = stroke(playerBtn, UI.line, 0.85, 1)
local playerIconBox = Instance.new("Frame")
playerIconBox.Size = UDim2.new(0, 24, 0, 24)
playerIconBox.Position = UDim2.new(0, 12, 0.5, -12)
playerIconBox.BackgroundTransparency = 1
playerIconBox.ZIndex = 13
playerIconBox.Parent = playerBtn
corner(playerIconBox, 6)
stroke(playerIconBox, UI.line, 0.6, 1.2)
local playerIcon = Instance.new("TextLabel")
playerIcon.Text = "?"
playerIcon.Font = FONT_BOLD
playerIcon.TextSize = FS(13)
playerIcon.TextColor3 = UI.sub
playerIcon.Size = UDim2.new(1, 0, 1, 0)
playerIcon.BackgroundTransparency = 1
playerIcon.ZIndex = 14
playerIcon.Parent = playerIconBox
local playerTxt = Instance.new("TextLabel")
playerTxt.Text = "Player"
playerTxt.Font = FONT_REG
playerTxt.TextSize = FS(14)
playerTxt.TextColor3 = UI.sub
playerTxt.TextXAlignment = Enum.TextXAlignment.Left
playerTxt.Size = UDim2.new(1, -54, 1, 0)
playerTxt.Position = UDim2.new(0, 46, 0, 0)
playerTxt.BackgroundTransparency = 1
playerTxt.ZIndex = 13
playerTxt.Parent = playerBtn

local content = Instance.new("Frame")
content.Size = UDim2.new(1, -228, 1, -96)
content.Position = UDim2.new(0, 206, 0, 76)
content.BackgroundColor3 = UI.panel
content.BackgroundTransparency = S.Transparent and 0.5 or 0
content.BorderSizePixel = 0
content.ZIndex = 10
content.Parent = main
corner(content, 18)
stroke(content, UI.line, 0.94, 1)

local contentTitle = Instance.new("TextLabel")
contentTitle.Text = "VISUALS"
contentTitle.Font = FONT_BLACK
contentTitle.TextSize = FS(24)
contentTitle.TextColor3 = UI.text
contentTitle.TextXAlignment = Enum.TextXAlignment.Left
contentTitle.Size = UDim2.new(1, -36, 0, 32)
contentTitle.Position = UDim2.new(0, 18, 0, 16)
contentTitle.BackgroundTransparency = 1
contentTitle.ZIndex = 12
contentTitle.Parent = content

local contentSubtitle = Instance.new("TextLabel")
contentSubtitle.Text = Loc.L("MODULES")
contentSubtitle.Font = FONT_REG
contentSubtitle.TextSize = FS(10)
contentSubtitle.TextColor3 = UI.sub
contentSubtitle.TextXAlignment = Enum.TextXAlignment.Left
contentSubtitle.Size = UDim2.new(1, -36, 0, 18)
contentSubtitle.Position = UDim2.new(0, 18, 0, 52)
contentSubtitle.BackgroundTransparency = 1
contentSubtitle.ZIndex = 12
contentSubtitle.Parent = content

local searchFrame = Instance.new("Frame")
searchFrame.Size = UDim2.new(1, -36, 0, 42)
searchFrame.Position = UDim2.new(0, 18, 0, 80)
searchFrame.BackgroundColor3 = UI.card
searchFrame.BackgroundTransparency = S.Transparent and 0.55 or 0
searchFrame.BorderSizePixel = 0
searchFrame.ZIndex = 12
searchFrame.Parent = content
corner(searchFrame, 11)
stroke(searchFrame, UI.line, 0.94, 1)

local mag = Instance.new("Frame")
mag.Size = UDim2.new(0, 20, 0, 20)
mag.Position = UDim2.new(0, 14, 0.5, -10)
mag.BackgroundTransparency = 1
mag.ZIndex = 13
mag.Parent = searchFrame
local lens = Instance.new("Frame")
lens.Size = UDim2.new(0, 11, 0, 11)
lens.Position = UDim2.new(0, 1, 0, 1)
lens.BackgroundTransparency = 1
lens.ZIndex = 13
lens.Parent = mag
corner(lens, 6)
stroke(lens, UI.sub, 0.2, 1.6)
local magHandle = Instance.new("Frame")
magHandle.Size = UDim2.new(0, 2, 0, 6)
magHandle.Position = UDim2.new(0, 11, 0, 12)
magHandle.Rotation = -45
magHandle.BackgroundColor3 = UI.sub
magHandle.BackgroundTransparency = 0.2
magHandle.BorderSizePixel = 0
magHandle.ZIndex = 13
magHandle.Parent = mag
corner(magHandle, 1)

local searchBox = Instance.new("TextBox")
searchBox.Size = UDim2.new(1, -52, 1, 0)
searchBox.Position = UDim2.new(0, 40, 0, 0)
searchBox.BackgroundTransparency = 1
searchBox.Font = FONT_REG
searchBox.TextSize = FS(13)
searchBox.TextColor3 = UI.text
searchBox.PlaceholderText = Loc.L("Search features...")
searchBox.PlaceholderColor3 = UI.sub
searchBox.TextXAlignment = Enum.TextXAlignment.Left
searchBox.ClearTextOnFocus = false
searchBox.Text = ""
searchBox.ZIndex = 13
searchBox.Parent = searchFrame

local grid = Instance.new("ScrollingFrame")
grid.Size = UDim2.new(1, -36, 1, -196)
grid.Position = UDim2.new(0, 18, 0, 136)
grid.BackgroundTransparency = 1
grid.BorderSizePixel = 0
grid.ScrollBarThickness = 3
grid.ScrollBarImageColor3 = Color3.fromRGB(255, 255, 255)
grid.ScrollBarImageTransparency = 0.6
grid.ScrollingDirection = Enum.ScrollingDirection.Y
grid.AutomaticCanvasSize = Enum.AutomaticSize.Y
grid.CanvasSize = UDim2.new(0, 0, 0, 0)
grid.ZIndex = 11
grid.Parent = content
local gridLayout = Instance.new("UIListLayout")
gridLayout.Padding = UDim.new(0, 10)
gridLayout.SortOrder = Enum.SortOrder.LayoutOrder
gridLayout.Parent = grid

local statusLine = Instance.new("Frame")
statusLine.Size = UDim2.new(1, -36, 0, 1)
statusLine.Position = UDim2.new(0, 18, 1, -38)
statusLine.BackgroundColor3 = UI.line
statusLine.BackgroundTransparency = 0.92
statusLine.BorderSizePixel = 0
statusLine.ZIndex = 11
statusLine.Parent = content

local statusDot = Instance.new("Frame")
statusDot.Size = UDim2.new(0, 7, 0, 7)
statusDot.Position = UDim2.new(0, 18, 1, -26)
statusDot.BackgroundColor3 = Color3.fromRGB(74, 222, 128)
statusDot.BorderSizePixel = 0
statusDot.ZIndex = 12
statusDot.Parent = content
corner(statusDot, 4)

local statusText = Instance.new("TextLabel")
statusText.Text = Loc.L("CONNECTED")
statusText.Font = FONT_BOLD
statusText.TextSize = FS(8)
statusText.TextColor3 = Color3.fromRGB(154, 230, 180)
statusText.TextXAlignment = Enum.TextXAlignment.Left
statusText.Size = UDim2.new(0, 100, 0, 14)
statusText.Position = UDim2.new(0, 30, 1, -30)
statusText.BackgroundTransparency = 1
statusText.ZIndex = 12
statusText.Parent = content

local statusRight = Instance.new("TextLabel")
statusRight.Text = "HAMER  /  UI"
statusRight.Font = FONT_BOLD
statusRight.TextSize = FS(8)
statusRight.TextColor3 = UI.sub
statusRight.TextXAlignment = Enum.TextXAlignment.Right
statusRight.Size = UDim2.new(0, 160, 0, 14)
statusRight.Position = UDim2.new(1, -178, 1, -30)
statusRight.BackgroundTransparency = 1
statusRight.ZIndex = 12
statusRight.Parent = content

local builders = {}
local tabButtons = {}
local currentTab = "combat"

local ActiveCards = {}
local cardOrder = 0
local settingOrder = 0
local currentPanel = nil
local selectTab

local function nextOrder()
    cardOrder = cardOrder + 1
    return cardOrder
end

local function registerCard(obj, titleText, subText)
    table.insert(ActiveCards, {obj = obj, text = string.lower(Loc.L(titleText) .. " " .. Loc.L(subText or ""))})
end

local function cardBase(titleText, subText, reserveRight)
    local card = Instance.new("TextButton")
    card.Size = UDim2.new(1, 0, 0, S.Mobile and 102 or 92)
    card.BackgroundColor3 = UI.card
    card.BackgroundTransparency = S.Transparent and 0.45 or 0
    card.BorderSizePixel = 0
    card.Text = ""
    card.AutoButtonColor = false
    card.LayoutOrder = nextOrder()
    card.ZIndex = 12
    card.Parent = grid
    corner(card, 13)
    local st = stroke(card, UI.line, 0.93, 1)
    local rw = reserveRight or 54
    local tl = Instance.new("TextLabel")
    tl.Text = Loc.L(titleText)
    tl.Font = FONT_BOLD
    tl.TextSize = FS(15)
    tl.TextColor3 = UI.text
    tl.TextXAlignment = Enum.TextXAlignment.Left
    tl.TextYAlignment = Enum.TextYAlignment.Top
    tl.TextWrapped = true
    tl.Size = UDim2.new(1, -(24 + rw), 0, 22)
    tl.Position = UDim2.new(0, 16, 0, subText and 17 or 27)
    tl.BackgroundTransparency = 1
    tl.ZIndex = 13
    tl.Parent = card
    if subText then
        local sb = Instance.new("TextLabel")
        sb.Text = Loc.L(subText)
        sb.Font = FONT_REG
        sb.TextSize = FS(11)
        sb.TextColor3 = UI.sub
        sb.TextXAlignment = Enum.TextXAlignment.Left
        sb.TextYAlignment = Enum.TextYAlignment.Top
        sb.TextWrapped = true
        sb.Size = UDim2.new(1, -(24 + rw), 0, 38)
        sb.Position = UDim2.new(0, 16, 0, 43)
        sb.BackgroundTransparency = 1
        sb.ZIndex = 13
        sb.Parent = card
    end
    card.MouseEnter:Connect(function()
        tw(card, 0.12, {BackgroundColor3 = UI.cardHi})
        st.Transparency = 0.86
    end)
    card.MouseLeave:Connect(function()
        tw(card, 0.12, {BackgroundColor3 = UI.card})
        st.Transparency = 0.93
    end)
    registerCard(card, titleText, subText)
    return card, st
end

local function styleBox(box, mark, bst, on)
    local c = accent()
    box.BackgroundColor3 = on and c or UI.field
    bst.Color = on and c or UI.line
    bst.Transparency = on and 0 or 0.75
    if mark then mark.Text = on and "✓" or "" end
end

local function makeBox(parent, x, y, size)
    local box = Instance.new("Frame")
    box.Size = UDim2.new(0, size, 0, size)
    box.Position = UDim2.new(1, x, 0.5, y)
    box.BackgroundColor3 = UI.field
    box.BorderSizePixel = 0
    box.ZIndex = 20
    box.Parent = parent
    corner(box, math.floor(size * 0.26))
    local bst = stroke(box, UI.line, 0.75, 1.4)
    local mark = Instance.new("TextLabel")
    mark.Text = ""
    mark.Font = FONT_BOLD
    mark.TextSize = FS(math.floor(size * 0.55))
    mark.TextColor3 = Color3.fromRGB(18, 20, 24)
    mark.Size = UDim2.new(1, 0, 1, 0)
    mark.BackgroundTransparency = 1
    mark.ZIndex = 21
    mark.Parent = box
    return box, mark, bst
end

local function sectionRow(_) end

local function panelRow(text, height)
    settingOrder = settingOrder + 1
    local row = Instance.new("TextButton")
    row.Size = UDim2.new(1, 0, 0, height or 44)
    row.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    row.BackgroundTransparency = 1
    row.BorderSizePixel = 0
    row.Text = ""
    row.AutoButtonColor = false
    row.LayoutOrder = settingOrder
    row.ZIndex = 14
    row.Parent = currentPanel
    corner(row, 8)
    local lbl = Instance.new("TextLabel")
    lbl.Text = Loc.L(text)
    lbl.Font = FONT_REG
    lbl.TextSize = FS(13)
    lbl.TextColor3 = UI.text
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    lbl.Size = UDim2.new(1, -120, 1, 0)
    lbl.Position = UDim2.new(0, 6, 0, 0)
    lbl.BackgroundTransparency = 1
    lbl.ZIndex = 15
    lbl.Parent = row
    row.MouseEnter:Connect(function() row.BackgroundTransparency = 0.94 end)
    row.MouseLeave:Connect(function() row.BackgroundTransparency = 1 end)
    return row, lbl
end

local function settingToggle(text, key, onChange)
    local row = panelRow(text, 44)
    local box, mark, bst = makeBox(row, -34, -12, 24)
    styleBox(box, mark, bst, S[key])
    row.MouseButton1Click:Connect(function()
        S[key] = not S[key]
        styleBox(box, mark, bst, S[key])
        click()
        if onChange then onChange(S[key]) end
    end)
end

local function settingStep(text, key, minv, maxv, step, suffix, onChange)
    local row = panelRow(text, 46)
    local val = Instance.new("TextLabel")
    val.Font = FONT_BOLD
    val.TextSize = FS(12)
    val.TextColor3 = accent()
    val.Size = UDim2.new(0, 34, 1, 0)
    val.Position = UDim2.new(1, -70, 0, 0)
    val.TextXAlignment = Enum.TextXAlignment.Center
    val.BackgroundTransparency = 1
    val.ZIndex = 15
    val.Parent = row
    bindAccent(function(c) val.TextColor3 = c end)
    local function refresh()
        local v = S[key]
        if type(v) == "number" then
            if v == math.floor(v) then
                val.Text = tostring(math.floor(v)) .. (suffix or "")
            else
                val.Text = string.format("%.2f", v) .. (suffix or "")
            end
        end
    end
    local function mk(txt, x)
        local b = Instance.new("TextButton")
        b.Size = UDim2.new(0, 24, 0, 24)
        b.Position = UDim2.new(1, x, 0.5, -12)
        b.BackgroundColor3 = UI.field
        b.Text = txt
        b.Font = FONT_BOLD
        b.TextSize = FS(14)
        b.TextColor3 = UI.text
        b.AutoButtonColor = false
        b.ZIndex = 16
        b.Parent = row
        corner(b, 6)
        stroke(b, UI.line, 0.86, 1)
        return b
    end
    local minus = mk("−", -94)
    local plus = mk("+", -34)
    minus.MouseButton1Click:Connect(function()
        S[key] = clamp(S[key] - step, minv, maxv)
        refresh()
        click()
        if onChange then onChange(S[key]) end
    end)
    plus.MouseButton1Click:Connect(function()
        S[key] = clamp(S[key] + step, minv, maxv)
        refresh()
        click()
        if onChange then onChange(S[key]) end
    end)
    refresh()
end

local function openPalette(current, onPick)
    local old = gui:FindFirstChild("HamerPalette")
    if old then old:Destroy() end
    local overlay = Instance.new("Frame")
    overlay.Name = "HamerPalette"
    overlay.Size = UDim2.new(1, 0, 1, 0)
    overlay.BackgroundColor3 = Color3.fromRGB(4, 6, 10)
    overlay.BackgroundTransparency = 0.35
    overlay.ZIndex = 60
    overlay.Parent = gui
    local dismiss = Instance.new("TextButton")
    dismiss.Size = UDim2.new(1, 0, 1, 0)
    dismiss.BackgroundTransparency = 1
    dismiss.Text = ""
    dismiss.AutoButtonColor = false
    dismiss.ZIndex = 60
    dismiss.Parent = overlay
    dismiss.MouseButton1Click:Connect(function()
        overlay:Destroy()
    end)
    local box = Instance.new("TextButton")
    box.Size = UDim2.new(0, 254, 0, 254)
    box.AnchorPoint = Vector2.new(0.5, 0.5)
    box.Position = UDim2.new(0.5, 0, 0.5, 0)
    box.BackgroundColor3 = UI.panel
    box.BackgroundTransparency = 0.02
    box.Text = ""
    box.AutoButtonColor = false
    box.ZIndex = 61
    box.Parent = overlay
    corner(box, 14)
    stroke(box, accent(), 0.55, 1)
    local title = Instance.new("TextLabel")
    title.Text = "COLOR"
    title.Font = FONT_BOLD
    title.TextSize = FS(11)
    title.TextColor3 = UI.sub
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.Size = UDim2.new(1, -60, 0, 30)
    title.Position = UDim2.new(0, 12, 0, 6)
    title.BackgroundTransparency = 1
    title.ZIndex = 62
    title.Parent = box
    local close = Instance.new("TextButton")
    close.Text = "×"
    close.Font = FONT_BOLD
    close.TextSize = FS(18)
    close.TextColor3 = UI.sub
    close.BackgroundTransparency = 1
    close.Size = UDim2.new(0, 30, 0, 30)
    close.Position = UDim2.new(1, -38, 0, 5)
    close.ZIndex = 62
    close.Parent = box
    close.MouseButton1Click:Connect(function()
        overlay:Destroy()
    end)
    local gridFrame = Instance.new("Frame")
    gridFrame.Size = UDim2.new(0, 234, 0, 194)
    gridFrame.Position = UDim2.new(0, 10, 0, 46)
    gridFrame.BackgroundTransparency = 1
    gridFrame.ZIndex = 62
    gridFrame.Parent = box
    local gridLayout = Instance.new("UIGridLayout")
    gridLayout.CellSize = UDim2.new(0, 34, 0, 34)
    gridLayout.CellPadding = UDim2.new(0, 6, 0, 6)
    gridLayout.FillDirection = Enum.FillDirection.Horizontal
    gridLayout.SortOrder = Enum.SortOrder.LayoutOrder
    gridLayout.Parent = gridFrame
    for i, c in ipairs(PALETTE) do
        local sw = Instance.new("TextButton")
        sw.Size = UDim2.fromOffset(34, 34)
        sw.BackgroundColor3 = c
        sw.Text = c == current and "✓" or ""
        sw.TextSize = FS(15)
        sw.Font = FONT_BOLD
        sw.TextColor3 = (c.R * 0.299 + c.G * 0.587 + c.B * 0.114) > 0.62 and Color3.fromRGB(10, 12, 18) or Color3.fromRGB(255, 255, 255)
        sw.AutoButtonColor = false
        sw.LayoutOrder = i
        sw.ZIndex = 63
        sw.Parent = gridFrame
        corner(sw, 8)
        stroke(sw, UI.line, 0.35, 1)
        sw.MouseButton1Click:Connect(function()
            click()
            overlay:Destroy()
            onPick(c)
        end)
    end
end

local function settingColor(text, key, onChange)
    local row = panelRow(text, 44)
    local dot = Instance.new("Frame")
    dot.Size = UDim2.new(0, 24, 0, 24)
    dot.Position = UDim2.new(1, -34, 0.5, -12)
    dot.BackgroundColor3 = S[key]
    dot.BorderSizePixel = 0
    dot.ZIndex = 15
    dot.Parent = row
    corner(dot, 12)
    stroke(dot, UI.line, 0.5, 2)
    row.MouseButton1Click:Connect(function()
        openPalette(S[key], function(c)
            S[key] = c
            dot.BackgroundColor3 = c
            if onChange then onChange(c) end
        end)
    end)
end

local function settingText(text, key, placeholder)
    local row = panelRow(text, 48)
    local box = Instance.new("TextBox")
    box.Size = UDim2.new(0, 120, 0, 32)
    box.Position = UDim2.new(1, -130, 0.5, -16)
    box.BackgroundColor3 = UI.field
    box.BorderSizePixel = 0
    box.Font = FONT_REG
    box.TextSize = FS(12)
    box.TextColor3 = UI.text
    box.PlaceholderText = placeholder or ""
    box.PlaceholderColor3 = UI.sub
    box.Text = tostring(S[key] or "")
    box.ClearTextOnFocus = false
    box.ZIndex = 16
    box.Parent = row
    corner(box, 7)
    stroke(box, UI.line, 0.86, 1)
    box:GetPropertyChangedSignal("Text"):Connect(function()
        S[key] = box.Text
    end)
end

local function settingChoice(text, key, values, onChange)
    local row = panelRow(text, 46)
    local val = Instance.new("TextLabel")
    val.Font = FONT_BOLD
    val.TextSize = FS(11)
    val.TextColor3 = accent()
    val.Size = UDim2.new(0, 126, 1, 0)
    val.Position = UDim2.new(1, -146, 0, 0)
    val.TextXAlignment = Enum.TextXAlignment.Right
    val.BackgroundTransparency = 1
    val.ZIndex = 15
    val.Parent = row
    bindAccent(function(c) val.TextColor3 = c end)
    local function refresh()
        val.Text = tostring(S[key] or "") .. "  ›"
    end
    row.MouseButton1Click:Connect(function()
        local idx = 0
        for i, v in ipairs(values) do
            if v == S[key] then idx = i; break end
        end
        S[key] = values[idx % #values + 1]
        refresh()
        click()
        if onChange then onChange(S[key]) end
    end)
    refresh()
end

local function settingAction(text, sub, callback)
    local row = panelRow(text, 46)
    if sub then
        local lbl = row:FindFirstChildOfClass("TextLabel")
        if lbl then
            lbl.Size = UDim2.new(1, -150, 1, 0)
            local sb = Instance.new("TextLabel")
            sb.Text = Loc.L(sub)
            sb.Font = FONT_REG
            sb.TextSize = FS(10)
            sb.TextColor3 = UI.sub
            sb.TextXAlignment = Enum.TextXAlignment.Left
            sb.Size = UDim2.new(1, -150, 0, 14)
            sb.Position = UDim2.new(0, 6, 0, 26)
            sb.BackgroundTransparency = 1
            sb.ZIndex = 15
            sb.Parent = row
        end
    end
    local arrow = Instance.new("TextLabel")
    arrow.Text = "›"
    arrow.Font = FONT_BOLD
    arrow.TextSize = FS(18)
    arrow.TextColor3 = UI.sub
    arrow.Size = UDim2.new(0, 22, 1, 0)
    arrow.Position = UDim2.new(1, -32, 0, 0)
    arrow.BackgroundTransparency = 1
    arrow.ZIndex = 15
    arrow.Parent = row
    row.MouseButton1Click:Connect(function()
        click()
        if callback then callback() end
    end)
end

local function moduleRow(text, key, settingsFn, onChange)
    local holder = Instance.new("Frame")
    holder.Size = UDim2.new(1, 0, 0, 0)
    holder.AutomaticSize = Enum.AutomaticSize.Y
    holder.BackgroundColor3 = UI.card
    holder.BackgroundTransparency = S.Transparent and 0.45 or 0
    holder.ClipsDescendants = true
    holder.LayoutOrder = nextOrder()
    holder.ZIndex = 12
    holder.Parent = grid
    corner(holder, 13)
    local hst = stroke(holder, UI.line, 0.93, 1)

    local stateBar
    if key then
        stateBar = Instance.new("Frame")
        stateBar.Size = UDim2.new(0, 3, 0, 24)
        stateBar.Position = UDim2.new(0, 0, 0, 34)
        stateBar.BackgroundColor3 = accent()
        stateBar.BorderSizePixel = 0
        stateBar.Visible = S[key] and true or false
        stateBar.ZIndex = 15
        stateBar.Parent = holder
        corner(stateBar, 2)
        bindAccent(function(c) stateBar.BackgroundColor3 = c end)
    end
    local function syncState()
        if stateBar then stateBar.Visible = S[key] and true or false end
    end

    local hlist = Instance.new("UIListLayout")
    hlist.SortOrder = Enum.SortOrder.LayoutOrder
    hlist.Parent = holder

    local headH = S.Mobile and 102 or 92
    local head = Instance.new("Frame")
    head.Size = UDim2.new(1, 0, 0, headH)
    head.BackgroundTransparency = 1
    head.LayoutOrder = 1
    head.ZIndex = 12
    head.Parent = holder
    if stateBar then stateBar.Parent = head end

    local headBtn = Instance.new("TextButton")
    headBtn.Size = UDim2.new(1, 0, 1, 0)
    headBtn.BackgroundTransparency = 1
    headBtn.Text = ""
    headBtn.AutoButtonColor = false
    headBtn.ZIndex = 12
    headBtn.Parent = head

    local arrowW = settingsFn and 34 or 0
    local boxW = key and 46 or 0
    local reserve = arrowW + boxW + 14
    local subText = SUBTITLES[key] or (settingsFn and "Tap to open settings" or "Toggle feature")

    local tl = Instance.new("TextLabel")
    tl.Text = Loc.L(text)
    tl.Font = FONT_BOLD
    tl.TextSize = FS(15)
    tl.TextColor3 = UI.text
    tl.TextXAlignment = Enum.TextXAlignment.Left
    tl.TextYAlignment = Enum.TextYAlignment.Top
    tl.TextWrapped = true
    tl.Size = UDim2.new(1, -(28 + reserve), 0, 22)
    tl.Position = UDim2.new(0, 18, 0, 17)
    tl.BackgroundTransparency = 1
    tl.ZIndex = 13
    tl.Parent = head

    local sb = Instance.new("TextLabel")
    sb.Text = Loc.L(subText)
    sb.Font = FONT_REG
    sb.TextSize = FS(11)
    sb.TextColor3 = UI.sub
    sb.TextXAlignment = Enum.TextXAlignment.Left
    sb.TextYAlignment = Enum.TextYAlignment.Top
    sb.TextWrapped = true
    sb.Size = UDim2.new(1, -(28 + reserve), 0, 38)
    sb.Position = UDim2.new(0, 18, 0, 43)
    sb.BackgroundTransparency = 1
    sb.ZIndex = 13
    sb.Parent = head

    local arrow
    if settingsFn then
        arrow = Instance.new("TextLabel")
        arrow.Text = "▾"
        arrow.Font = FONT_BOLD
        arrow.TextSize = FS(16)
        arrow.TextColor3 = UI.sub
        arrow.Size = UDim2.new(0, 22, 0, 22)
        arrow.Position = UDim2.new(1, key and -82 or -38, 0.5, -11)
        arrow.BackgroundTransparency = 1
        arrow.ZIndex = 13
        arrow.Parent = head
    end

    local box, mark, bst
    if key then
        box, mark, bst = makeBox(head, -48, -16, 32)
        box.BackgroundColor3 = UI.field
        styleBox(box, mark, bst, S[key])
        local btn = Instance.new("TextButton")
        btn.Size = UDim2.new(1, 0, 1, 0)
        btn.BackgroundTransparency = 1
        btn.Text = ""
        btn.AutoButtonColor = false
        btn.ZIndex = 22
        btn.Parent = box
        btn.MouseButton1Click:Connect(function()
            S[key] = not S[key]
            styleBox(box, mark, bst, S[key])
            syncState()
            click()
            if onChange then onChange(S[key]) end
        end)
    end

    local panel = Instance.new("Frame")
    panel.Size = UDim2.new(1, 0, 0, 0)
    panel.Name = "SettingsPanel"
    panel.BackgroundColor3 = Color3.fromRGB(30, 32, 38)
    panel.BackgroundTransparency = S.Transparent and 0.6 or 0
    panel.BorderSizePixel = 0
    panel.ClipsDescendants = true
    panel.LayoutOrder = 2
    panel.Visible = false
    panel.ZIndex = 12
    panel.Parent = holder
    local pad = Instance.new("UIPadding")
    pad.PaddingLeft = UDim.new(0, 10)
    pad.PaddingRight = UDim.new(0, 10)
    pad.PaddingTop = UDim.new(0, 4)
    pad.PaddingBottom = UDim.new(0, 10)
    pad.Parent = panel
    local plist = Instance.new("UIListLayout")
    plist.Padding = UDim.new(0, 2)
    plist.SortOrder = Enum.SortOrder.LayoutOrder
    plist.Parent = panel

    local built, expanded, target = false, false, 0

    headBtn.MouseEnter:Connect(function()
        tw(holder, 0.12, {BackgroundColor3 = UI.cardHi})
        hst.Color = accent()
        hst.Transparency = 0.78
    end)
    headBtn.MouseLeave:Connect(function()
        tw(holder, 0.12, {BackgroundColor3 = UI.card})
        hst.Color = UI.line
        hst.Transparency = 0.93
    end)

    headBtn.MouseButton1Click:Connect(function()
        if not settingsFn then
            if key then
                S[key] = not S[key]
                styleBox(box, mark, bst, S[key])
                syncState()
            end
            click()
            if key and onChange then onChange(S[key]) end
            return
        end
        expanded = not expanded
        if expanded then
            if not built then
                built = true
                panel.Visible = true
                panel.Size = UDim2.new(1, 0, 0, 0)
                settingOrder = 0
                currentPanel = panel
                local ok, err = pcall(settingsFn)
                currentPanel = nil
                if not ok then warn("hamer settings error: " .. tostring(err)) end
                task.defer(function()
                    target = plist.AbsoluteContentSize.Y + 18
                    if target <= 18 then
                        task.delay(0.03, function()
                            target = plist.AbsoluteContentSize.Y + 18
                            if expanded then
                                tw(panel, 0.28, {Size = UDim2.new(1, 0, 0, target)}, Enum.EasingStyle.Quart)
                            end
                        end)
                        return
                    end
                    if expanded then
                        tw(panel, 0.28, {Size = UDim2.new(1, 0, 0, target)}, Enum.EasingStyle.Quart)
                    end
                end)
            else
                panel.Visible = true
                tw(panel, 0.28, {Size = UDim2.new(1, 0, 0, target)}, Enum.EasingStyle.Quart)
            end
        else
            tw(panel, 0.22, {Size = UDim2.new(1, 0, 0, 0)}, Enum.EasingStyle.Quart, Enum.EasingDirection.In)
            task.delay(0.24, function()
                if not expanded then panel.Visible = false end
            end)
        end
        if arrow then
            tw(arrow, 0.24, {Rotation = expanded and 180 or 0})
        end
        click()
    end)

    registerCard(holder, text, subText)
    return holder
end

local function toggleRow(text, key, onChange)
    if currentPanel then
        return settingToggle(text, key, onChange)
    end
    return moduleRow(text, key, nil, onChange)
end

local function settingStepTop(text, key, minv, maxv, step, suffix, onChange)
    local card = cardBase(text, SUBTITLES[key] or "Adjust value", 112)
    local val = Instance.new("TextLabel")
    val.Font = FONT_BOLD
    val.TextSize = FS(12)
    val.TextColor3 = accent()
    val.Size = UDim2.new(0, 40, 0, 20)
    val.Position = UDim2.new(1, -82, 0.5, -10)
    val.TextXAlignment = Enum.TextXAlignment.Right
    val.BackgroundTransparency = 1
    val.ZIndex = 14
    val.Parent = card
    bindAccent(function(c) val.TextColor3 = c end)
    local function refresh()
        local v = S[key]
        if type(v) == "number" then
            if v == math.floor(v) then
                val.Text = tostring(math.floor(v)) .. (suffix or "")
            else
                val.Text = string.format("%.2f", v) .. (suffix or "")
            end
        end
    end
    local function mk(txt, x)
        local b = Instance.new("TextButton")
        b.Size = UDim2.new(0, 26, 0, 26)
        b.Position = UDim2.new(1, x, 0.5, -13)
        b.BackgroundColor3 = UI.field
        b.Text = txt
        b.Font = FONT_BOLD
        b.TextSize = FS(15)
        b.TextColor3 = UI.text
        b.AutoButtonColor = false
        b.ZIndex = 14
        b.Parent = card
        corner(b, 7)
        stroke(b, UI.line, 0.86, 1)
        return b
    end
    local minus = mk("−", -108)
    local plus = mk("+", -40)
    minus.MouseButton1Click:Connect(function()
        S[key] = clamp(S[key] - step, minv, maxv)
        refresh()
        click()
        if onChange then onChange(S[key]) end
    end)
    plus.MouseButton1Click:Connect(function()
        S[key] = clamp(S[key] + step, minv, maxv)
        refresh()
        click()
        if onChange then onChange(S[key]) end
    end)
    refresh()
    return card
end

local function stepRow(text, key, minv, maxv, step, suffix, onChange)
    if currentPanel then
        return settingStep(text, key, minv, maxv, step, suffix, onChange)
    end
    return settingStepTop(text, key, minv, maxv, step, suffix, onChange)
end

local function choiceRow(text, key, values, onChange)
    if currentPanel then settingChoice(text, key, values, onChange) end
end

local function actionRow(text, sub, callback)
    if currentPanel then
        return settingAction(text, sub, callback)
    end
    local card = cardBase(text, sub or "Run action", 40)
    local arrow = Instance.new("TextLabel")
    arrow.Text = "›"
    arrow.Font = FONT_BOLD
    arrow.TextSize = FS(20)
    arrow.TextColor3 = UI.sub
    arrow.Size = UDim2.new(0, 24, 0, 28)
    arrow.Position = UDim2.new(1, -34, 0.5, -14)
    arrow.BackgroundTransparency = 1
    arrow.ZIndex = 13
    arrow.Parent = card
    card.MouseButton1Click:Connect(function()
        click()
        if callback then callback() end
    end)
end

local function colorRow(text, key, onChange)
    if currentPanel then
        return settingColor(text, key, onChange)
    end
    local card = cardBase(text, SUBTITLES[key] or "Tap to change color")
    local dot = Instance.new("Frame")
    dot.Size = UDim2.new(0, 28, 0, 28)
    dot.Position = UDim2.new(1, -42, 0.5, -14)
    dot.BackgroundColor3 = S[key]
    dot.BorderSizePixel = 0
    dot.ZIndex = 14
    dot.Parent = card
    corner(dot, 14)
    stroke(dot, UI.line, 0.5, 2)
    card.MouseButton1Click:Connect(function()
        openPalette(S[key], function(c)
            S[key] = c
            dot.BackgroundColor3 = c
            if onChange then onChange(c) end
        end)
    end)
end

local function textRow(labelText, key, placeholder)
    if currentPanel then
        return settingText(labelText, key, placeholder)
    end
    local card = cardBase(labelText, "Type a value", 140)
    local box = Instance.new("TextBox")
    box.Size = UDim2.new(0, 110, 0, 34)
    box.Position = UDim2.new(1, -124, 0.5, -17)
    box.BackgroundColor3 = UI.field
    box.BorderSizePixel = 0
    box.Font = FONT_REG
    box.TextSize = FS(12)
    box.TextColor3 = UI.text
    box.PlaceholderText = placeholder or ""
    box.PlaceholderColor3 = UI.sub
    box.Text = tostring(S[key] or "")
    box.ClearTextOnFocus = false
    box.ZIndex = 14
    box.Parent = card
    corner(box, 8)
    stroke(box, UI.line, 0.86, 1)
    box:GetPropertyChangedSignal("Text"):Connect(function()
        S[key] = box.Text
    end)
end

UI.activeBind = nil
UI.KEYBIND_LIST = {
    {"ESP", "ESP"}, {"Aimbot", "Aimbot"}, {"Silent Aim", "SilentAim"}, {"Kill All", "KillAll"},
    {"Fly", "Fly"}, {"Noclip", "Noclip"}, {"Speed", "Speed"}, {"Coin Farm", "CoinFarm"},
    {"Fullbright", "Fullbright"}, {"Mini Fox", "Fox"}, {"Wings", "Wings"}, {"Aura", "Aura"}
}

UI.keybindRow = function(text, action)
    local row = panelRow(text, 46)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0, 86, 0, 28)
    btn.Position = UDim2.new(1, -94, 0.5, -14)
    btn.BackgroundColor3 = UI.field
    btn.BorderSizePixel = 0
    btn.Font = FONT_BOLD
    btn.TextSize = FS(12)
    btn.TextColor3 = UI.text
    btn.AutoButtonColor = false
    btn.ZIndex = 16
    btn.Parent = row
    corner(btn, 7)
    stroke(btn, UI.line, 0.86, 1)
    local function refresh()
        btn.Text = S.Keybinds[action] or "None"
        btn.TextColor3 = S.Keybinds[action] and accent() or UI.sub
    end
    btn.MouseButton1Click:Connect(function()
        if UI.activeBind and UI.activeBind.refresh then UI.activeBind.refresh() end
        UI.activeBind = {action = action, refresh = refresh}
        btn.Text = "Press key..."
        btn.TextColor3 = accent()
        click()
    end)
    refresh()
end

local function themeCard(name)
    local col = ACCENTS[name]
    local card, cst = cardBase(name, "Accent theme")
    if S.Accent == name then
        cst.Color = accent()
        cst.Transparency = 0.35
    end
    local hAsset = ThemeH.get(name)
    local dot
    if hAsset then
        dot = Instance.new("ImageLabel")
        dot.Image = hAsset
        dot.Size = UDim2.new(0, 46, 0, 46)
        dot.Position = UDim2.new(1, -58, 0.5, -23)
        dot.BackgroundTransparency = 1
        dot.ZIndex = 14
        dot.Parent = card
    else
        dot = Instance.new("Frame")
        dot.Size = UDim2.new(0, 28, 0, 28)
        dot.Position = UDim2.new(1, -42, 0.5, -14)
        dot.BackgroundColor3 = col
        dot.BorderSizePixel = 0
        dot.ZIndex = 14
        dot.Parent = card
        corner(dot, 14)
        stroke(dot, UI.line, 0.5, 1.4)
        if S.Accent == name then
            local m = Instance.new("TextLabel")
            m.Text = "✓"
            m.Font = FONT_BOLD
            m.TextSize = FS(15)
            m.TextColor3 = Color3.fromRGB(18, 20, 24)
            m.Size = UDim2.new(1, 0, 1, 0)
            m.BackgroundTransparency = 1
            m.ZIndex = 15
            m.Parent = dot
        end
    end
    card.MouseButton1Click:Connect(function()
        S.Accent = name
        applyAccent()
        click()
        task.defer(function()
            if not Unloaded and S.MenuOpen then selectTab(currentTab) end
        end)
    end)
end

local function themeRow() end

local function clearContent()
    ActiveCards = {}
    cardOrder = 0
    currentPanel = nil
    for _, ch in ipairs(grid:GetChildren()) do
        if ch:IsA("GuiObject") then
            ch:Destroy()
        end
    end
end

local function cardMatches(c, q)
    if q == "" or string.find(c.text, q, 1, true) then return true end
    for _, d in ipairs(c.obj:GetDescendants()) do
        if d:IsA("TextLabel") then
            if string.find(string.lower(d.Text or ""), q, 1, true) then return true end
        elseif d:IsA("TextBox") then
            if string.find(string.lower(d.Text or ""), q, 1, true) or string.find(string.lower(d.PlaceholderText or ""), q, 1, true) then return true end
        end
    end
    return false
end

local function filterCards()
    local q = string.lower(searchBox.Text or "")
    for _, c in ipairs(ActiveCards) do
        c.obj.Visible = cardMatches(c, q)
    end
end

selectTab = function(id)
    currentTab = id
    for tid, b in pairs(tabButtons) do
        local on = tid == id
        if tid == "player" then
            b.btn.BackgroundColor3 = UI.card
            b.btn.BackgroundTransparency = on and (S.Transparent and 0.4 or 0.15) or (S.Transparent and 0.75 or 0.55)
            b.stroke.Color = on and accent() or UI.line
            b.stroke.Transparency = on and 0.4 or 0.85
        else
            b.btn.BackgroundColor3 = UI.navHi
            b.btn.BackgroundTransparency = on and (S.Transparent and 0.55 or 0) or 1
            b.stroke.Color = on and accent() or UI.line
            b.stroke.Transparency = on and 0.55 or 1
        end
        b.txt.TextColor3 = on and UI.text or UI.sub
        b.txt.Font = on and FONT_BOLD or FONT_REG
        if b.icon then
            if b.icon:IsA("ImageLabel") then
                b.icon.ImageColor3 = on and accent() or UI.sub
            else
                b.icon.TextColor3 = on and accent() or UI.sub
            end
        end
        if b.bar then
            b.bar.Visible = on
            b.bar.BackgroundColor3 = accent()
        end
    end
    for _, t in ipairs(tabs) do
        if t.id == id then
            contentTitle.Text = string.upper(Loc.L(t.label))
            contentSubtitle.Text = string.upper(Loc.L(t.label)) .. "  ·  " .. Loc.L("MODULES")
        end
    end
    clearContent()
    if searchBox.Text ~= "" then searchBox.Text = "" end
    if id == "player" then
        contentTitle.Text = string.upper(Loc.L("Player"))
        contentSubtitle.Text = string.upper(Loc.L("Player")) .. "  ·  " .. Loc.L("PROFILE")
    end
    if builders[id] then
        local ok, err = pcall(builders[id])
        if not ok then
            warn("hamer ui error: " .. tostring(err))
            local card = cardBase("UI error", tostring(err))
            card.BackgroundColor3 = Color3.fromRGB(70, 24, 30)
        end
    end
    grid.CanvasPosition = Vector2.new(0, 0)
    filterCards()
end

for i, t in ipairs(tabs) do
    local b = Instance.new("TextButton")
    b.Size = UDim2.new(1, 0, 0, tabHeight)
    b.BackgroundColor3 = UI.navHi
    b.BackgroundTransparency = 1
    b.BorderSizePixel = 0
    b.Text = ""
    b.AutoButtonColor = false
    b.LayoutOrder = i
    b.ZIndex = 12
    b.Parent = tabBar
    corner(b, 10)
    local bst = stroke(b, UI.line, 1, 1)
    local asset = TabIcons.get(t.id)
    local ic
    if asset then
        ic = Instance.new("ImageLabel")
        ic.Image = asset
        ic.ImageColor3 = UI.sub
        ic.BackgroundTransparency = 1
        ic.Size = UDim2.new(0, 24, 0, 24)
        ic.Position = UDim2.new(0, 14, 0.5, -12)
        ic.ZIndex = 13
        ic.Parent = b
    else
        ic = Instance.new("TextLabel")
        ic.Text = t.icon
        ic.Font = FONT_REG
        ic.TextSize = FS(15)
        ic.TextColor3 = UI.sub
        ic.Size = UDim2.new(0, 26, 1, 0)
        ic.Position = UDim2.new(0, 14, 0, 0)
        ic.BackgroundTransparency = 1
        ic.ZIndex = 13
        ic.Parent = b
    end
    local tx = Instance.new("TextLabel")
    tx.Text = Loc.L(t.label)
    tx.Font = FONT_REG
    tx.TextSize = FS(14)
    tx.TextColor3 = UI.sub
    tx.TextXAlignment = Enum.TextXAlignment.Left
    tx.Size = UDim2.new(1, -52, 1, 0)
    tx.Position = UDim2.new(0, 46, 0, 0)
    tx.BackgroundTransparency = 1
    tx.ZIndex = 13
    tx.Parent = b
    local bar = Instance.new("Frame")
    bar.Size = UDim2.new(0, 3, 0, 20)
    bar.Position = UDim2.new(0, 5, 0.5, -10)
    bar.BackgroundColor3 = accent()
    bar.BorderSizePixel = 0
    bar.Visible = false
    bar.ZIndex = 14
    bar.Parent = b
    corner(bar, 2)
    tabButtons[t.id] = {btn = b, stroke = bst, txt = tx, icon = ic, bar = bar}
    b.MouseEnter:Connect(function()
        if currentTab ~= t.id then b.BackgroundTransparency = 0.85 end
    end)
    b.MouseLeave:Connect(function()
        if currentTab ~= t.id then b.BackgroundTransparency = 1 end
    end)
    b.MouseButton1Click:Connect(function()
        selectTab(t.id)
        click()
    end)
end

tabButtons.player = {btn = playerBtn, stroke = playerStroke, txt = playerTxt, icon = playerIcon}
playerBtn.MouseEnter:Connect(function()
    if currentTab ~= "player" then playerBtn.BackgroundTransparency = 0.35 end
end)
playerBtn.MouseLeave:Connect(function()
    if currentTab ~= "player" then playerBtn.BackgroundTransparency = S.Transparent and 0.75 or 0.55 end
end)
playerBtn.MouseButton1Click:Connect(function()
    selectTab("player")
    click()
end)

searchBox:GetPropertyChangedSignal("Text"):Connect(filterCards)

local function applyLanguageUI()
    searchBox.PlaceholderText = Loc.L("Search features...")
    for _, t in ipairs(tabs) do
        local b = tabButtons[t.id]
        if b and b.txt then b.txt.Text = Loc.L(t.label) end
    end
    if playerTxt then playerTxt.Text = Loc.L("Player") end
    if navLabel then navLabel.Text = Loc.L("NAVIGATION") end
    if statusText then statusText.Text = Loc.L("CONNECTED") end
    if currentTab and S.MenuOpen then selectTab(currentTab) end
end

local toggler = Instance.new("TextButton")
toggler.Size = UDim2.new(0, S.Mobile and 58 or 46, 0, S.Mobile and 58 or 46)
toggler.Position = UDim2.new(1, S.Mobile and -74 or -62, 0, S.Mobile and 72 or 60)
toggler.Text = "H"
toggler.Font = FONT_BLACK
toggler.TextSize = FS(20)
toggler.TextColor3 = accent()
toggler.BackgroundColor3 = UI.bg
toggler.BackgroundTransparency = 0.12
toggler.BorderSizePixel = 0
toggler.AutoButtonColor = false
toggler.ZIndex = 30
toggler.Parent = gui
local tc = Instance.new("UICorner")
tc.CornerRadius = UDim.new(0, 13)
tc.Parent = toggler
local ts = Instance.new("UIStroke")
ts.Color = accent()
ts.Transparency = 0.4
ts.Thickness = 1.2
ts.Parent = toggler
local togglerH = Instance.new("ImageLabel")
togglerH.Size = UDim2.new(0, 42, 0, 42)
togglerH.Position = UDim2.new(0.5, -21, 0.5, -21)
togglerH.BackgroundTransparency = 1
togglerH.ZIndex = 31
togglerH.Parent = toggler
bindAccent(function(c)
    local asset = ThemeH.get(S.Accent)
    if asset then
        togglerH.Image = asset
        togglerH.Visible = true
        toggler.Text = ""
    else
        togglerH.Visible = false
        toggler.Text = "H"
        toggler.TextColor3 = c
    end
    ts.Color = c
end)

local function applyUITransparency()
    main.BackgroundTransparency = S.Transparent and 0.35 or 0
    content.BackgroundTransparency = S.Transparent and 0.5 or 0
    searchFrame.BackgroundTransparency = S.Transparent and 0.55 or 0
end

local function setMenu(open)
    S.MenuOpen = open
    toggler.Visible = not open
    if open then
        main.Visible = true
        uiScale.Scale = computeScale() * 0.9
        tw(uiScale, 0.24, {Scale = computeScale()}, Enum.EasingStyle.Back)
        tw(blur, 0.3, {Size = 16})
        dim.Visible = true
        dim.BackgroundTransparency = 1
        tw(dim, 0.3, {BackgroundTransparency = 0.55})
    else
        tw(blur, 0.24, {Size = 0})
        tw(dim, 0.24, {BackgroundTransparency = 1})
        uiScale.Scale = computeScale()
        tw(uiScale, 0.18, {Scale = computeScale() * 0.9}, Enum.EasingStyle.Quart, Enum.EasingDirection.In)
        task.delay(0.2, function()
            if not S.MenuOpen then
                main.Visible = false
                dim.Visible = false
                uiScale.Scale = computeScale()
            end
        end)
    end
end

closeDot.MouseButton1Click:Connect(function()
    setMenu(false)
    click()
end)
toggler.MouseButton1Click:Connect(function()
    setMenu(true)
    click()
end)

conn(UIS.InputBegan:Connect(function(input, gp)
    if gp then return end
    if input.KeyCode == Enum.KeyCode.RightShift then
        setMenu(not S.MenuOpen)
    end
end))

local dragging, dragStart, startPos = false, nil, nil
header.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = main.Position
    end
end)
conn(UIS.InputChanged:Connect(function(input)
    if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local d = input.Position - dragStart
        main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + d.X, startPos.Y.Scale, startPos.Y.Offset + d.Y)
    end
end))
conn(UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = false
    end
end))
local ESPEngine = (function()
local espGui = Instance.new("ScreenGui")
espGui.Name = "HamerESP"
espGui.ResetOnSpawn = false
espGui.IgnoreGuiInset = true
espGui.DisplayOrder = 998
espGui.ZIndexBehavior = Enum.ZIndexBehavior.Global
espGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

local ESP_BOXES = {}

local function espFrame(parent)
    local f = Instance.new("Frame")
    f.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    f.BorderSizePixel = 0
    f.Visible = false
    f.ZIndex = 3
    f.Parent = parent
    return f
end

local function espLabel(parent, size)
    local t = Instance.new("TextLabel")
    t.BackgroundTransparency = 1
    t.Font = FONT_BOLD
    t.TextSize = size or 12
    t.TextColor3 = Color3.fromRGB(255, 255, 255)
    t.TextStrokeTransparency = 0.35
    t.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    t.TextXAlignment = Enum.TextXAlignment.Center
    t.ZIndex = 4
    t.Visible = false
    t.Parent = parent
    return t
end

local function makeESPBox(plr)
    local folder = Instance.new("Folder")
    folder.Name = "ESP_" .. plr.Name
    folder.Parent = espGui
    local b = {plr = plr, folder = folder, corners = {}, bones = {}}
    b.box = espFrame(folder)
    b.box.BackgroundTransparency = 1
    b.stroke = Instance.new("UIStroke")
    b.stroke.Thickness = 1.5
    b.stroke.Parent = b.box
    b.corner = Instance.new("UICorner")
    b.corner.CornerRadius = UDim.new(0, 6)
    b.corner.Parent = b.box
    for i = 1, 8 do b.corners[i] = espFrame(folder) end
    b.hpBg = espFrame(folder)
    b.hpFill = espFrame(folder)
    b.name = espLabel(folder, 13)
    b.dist = espLabel(folder, 11)
    b.tool = espLabel(folder, 10)
    b.arrow = espLabel(folder, 18)
    b.arrow.Text = "➤"
    b.head = espFrame(folder)
    local hc = Instance.new("UICorner")
    hc.CornerRadius = UDim.new(1, 0)
    hc.Parent = b.head
    b.tracer = espFrame(folder)
    b.tracer.AnchorPoint = Vector2.new(0.5, 0.5)
    return b
end

local function hideESPBox(b)
    b.box.Visible = false
    b.hpBg.Visible = false
    b.hpFill.Visible = false
    b.name.Visible = false
    b.dist.Visible = false
    b.tool.Visible = false
    b.arrow.Visible = false
    b.head.Visible = false
    b.tracer.Visible = false
    for _, c in ipairs(b.corners) do c.Visible = false end
    for _, l in ipairs(b.bones) do l.Visible = false end
end

local function destroyESPBox(b)
    if b.folder then b.folder:Destroy() end
end

local function ensureBones(b, count)
    while #b.bones < count do
        local line = espFrame(b.folder)
        line.AnchorPoint = Vector2.new(0.5, 0.5)
        table.insert(b.bones, line)
    end
end

local function setLine(line, x1, y1, x2, y2, color, thickness, transparency)
    local dx, dy = x2 - x1, y2 - y1
    local len = math.sqrt(dx * dx + dy * dy)
    if len < 1 then
        line.Visible = false
        return
    end
    line.Visible = true
    line.Position = UDim2.new(0, (x1 + x2) / 2, 0, (y1 + y2) / 2)
    line.Size = UDim2.new(0, len, 0, math.max(thickness or 1, 1))
    line.Rotation = math.deg(math.atan2(dy, dx))
    line.BackgroundColor3 = color
    line.BackgroundTransparency = transparency or 0.2
end

local function espRoleColor(role)
    if S.ESPRole then
        if role == "Murderer" then return S.ESPMurdererColor end
        if role == "Sheriff" then return S.ESPSheriffColor end
        if role == "Hero" then return S.ESPHeroColor end
        if role == "Innocent" then return S.ESPInnocentColor end
    end
    return S.ESPColor
end

local ROLE_MAP = {
    Zombie = "Murderer", Vampire = "Murderer", Freezer = "Murderer",
    Survivor = "Innocent", Hunter = "Innocent", Villager = "Innocent", Runner = "Innocent"
}

local roleSource = nil
local roleLoading = false
local roleTryAt = 0
local function loadRoleSource()
    if roleSource or roleLoading then return end
    local now = os.clock()
    if now < roleTryAt then return end
    roleTryAt = now + 5
    roleLoading = true
    task.spawn(function()
        local ok, rs = pcall(function() return game:GetService("ReplicatedStorage") end)
        if ok and rs then
            local candidates = {}
            local modules = rs:FindFirstChild("Modules")
            if modules then
                local client = modules:FindFirstChild("Client")
                if client then
                    local m = client:FindFirstChild("CurrentRoundClient")
                    if m then table.insert(candidates, m) end
                end
                local m2 = modules:FindFirstChild("CurrentRoundClient")
                if m2 then table.insert(candidates, m2) end
            end
            local client = rs:FindFirstChild("Client")
            if client then
                local m = client:FindFirstChild("CurrentRoundClient")
                if m then table.insert(candidates, m) end
            end
            local m3 = rs:FindFirstChild("CurrentRoundClient")
            if m3 then table.insert(candidates, m3) end
            for _, m in ipairs(candidates) do
                local ok2, src = pcall(require, m)
                if ok2 and type(src) == "table" and type(src.GetLatestPlayerData) == "function" then
                    roleSource = src
                    break
                end
            end
        end
        roleLoading = false
    end)
end

local function hasTool(plr, name)
    local ch, bp = plr.Character, plr:FindFirstChild("Backpack")
    for _, cont in ipairs({ch, bp}) do
        if cont then
            for _, tool in ipairs(cont:GetChildren()) do
                if tool:IsA("Tool") and string.find(string.lower(tool.Name), name, 1, true) then
                    return true
                end
            end
        end
    end
    return false
end

local function toolRole(plr)
    if hasTool(plr, "knife") then return "Murderer" end
    if hasTool(plr, "gun") then return "Sheriff" end
end

local roleCache = {}
local roleData = nil
local roleRefreshing = false
local roleNext = 0
local rolesNext = 0
local function refreshRoleData()
    if roleRefreshing or not roleSource then return end
    local now = os.clock()
    if now < roleNext then return end
    roleNext = now + 0.3
    roleRefreshing = true
    task.spawn(function()
        local ok, d = pcall(function() return roleSource.GetLatestPlayerData() end)
        if ok and type(d) == "table" then roleData = d end
        roleRefreshing = false
    end)
end
local function refreshRoles()
    local now = os.clock()
    if now < rolesNext and next(roleCache) ~= nil then return end
    rolesNext = now + 0.2
    refreshRoleData()
    for _, plr in ipairs(Players:GetPlayers()) do
        local role
        if roleData then
            local d = roleData[plr.Name]
            if d and not d.Dead and not d.Killed then role = d.Role end
        end
        if role then
            role = tostring(role)
            role = role:sub(1, 1):upper() .. role:sub(2):lower()
            role = ROLE_MAP[role] or role
        end
        if not role then role = toolRole(plr) end
        if role == "Innocent" and hasTool(plr, "gun") then role = "Hero" end
        if role ~= "Murderer" and role ~= "Sheriff" and role ~= "Hero" and role ~= "Innocent" then role = nil end
        roleCache[plr] = role
    end
end

local visCache = {}
local rayParams = RaycastParams.new()
rayParams.FilterType = Enum.RaycastFilterType.Exclude
rayParams.IgnoreWater = true
local rayFilterChar = nil
local function visibilityCheck(plr, char)
    local now = os.clock()
    local cached = visCache[plr]
    if cached and now - cached.at < 0.2 then return cached.v end
    local part = char and (char:FindFirstChild("Head") or char:FindFirstChild("HumanoidRootPart"))
    if not part then return true end
    if rayFilterChar ~= LocalPlayer.Character then
        rayFilterChar = LocalPlayer.Character
        rayParams.FilterDescendantsInstances = rayFilterChar and {rayFilterChar} or {}
    end
    local origin = Camera.CFrame.Position
    local result = Workspace:Raycast(origin, part.Position - origin, rayParams)
    local visible = (result == nil) or (result.Instance and result.Instance:IsDescendantOf(char))
    visCache[plr] = {at = now, v = visible}
    return visible
end

local R6_BONES = {
    {"Head", "Torso"}, {"Torso", "Left Arm"}, {"Torso", "Right Arm"},
    {"Torso", "Left Leg"}, {"Torso", "Right Leg"}
}
local R15_BONES = {
    {"Head", "UpperTorso"}, {"UpperTorso", "LowerTorso"},
    {"UpperTorso", "LeftUpperArm"}, {"LeftUpperArm", "LeftLowerArm"}, {"LeftLowerArm", "LeftHand"},
    {"UpperTorso", "RightUpperArm"}, {"RightUpperArm", "RightLowerArm"}, {"RightLowerArm", "RightHand"},
    {"LowerTorso", "LeftUpperLeg"}, {"LeftUpperLeg", "LeftLowerLeg"}, {"LeftLowerLeg", "LeftFoot"},
    {"LowerTorso", "RightUpperLeg"}, {"RightUpperLeg", "RightLowerLeg"}, {"RightLowerLeg", "RightFoot"}
}
local function bonesFor(char)
    if char:FindFirstChild("UpperTorso") then return R15_BONES end
    return R6_BONES
end

local ITEM_HL = {}
local itemNext = 0
local function isItemPart(p)
    local n = string.lower(p.Name)
    if string.find(n, "coin", 1, true) or string.find(n, "cash", 1, true) or string.find(n, "gem", 1, true) or string.find(n, "money", 1, true) or string.find(n, "diamond", 1, true) then return true end
    local parent = p.Parent
    local pn = parent and string.lower(parent.Name) or ""
    return string.find(pn, "coin", 1, true) ~= nil or string.find(pn, "cash", 1, true) ~= nil or string.find(pn, "gem", 1, true) ~= nil
end
local function cleanupItemESP()
    for part, hl in pairs(ITEM_HL) do
        if hl then hl:Destroy() end
        ITEM_HL[part] = nil
    end
end
local function updateItemESP()
    if not S.ESPItems then
        if next(ITEM_HL) then cleanupItemESP() end
        return
    end
    local now = os.clock()
    if now < itemNext then return end
    itemNext = now + 0.25
    local char = LocalPlayer.Character
    local root = char and char:FindFirstChild("HumanoidRootPart")
    if not root then cleanupItemESP(); return end
    local seen = {}
    for _, part in ipairs(ItemCache.scan()) do
        if part.Parent and isItemPart(part) and not part:IsDescendantOf(char) then
            local dist = (part.Position - root.Position).Magnitude
            if dist <= S.ESPMaxDist then
                local hl = ITEM_HL[part]
                if not hl or hl.Parent ~= part then
                    if hl then hl:Destroy() end
                    hl = Instance.new("Highlight")
                    hl.Name = "HamerItemESP"
                    hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                    hl.Parent = part
                    ITEM_HL[part] = hl
                end
                hl.FillColor = S.ESPItemColor
                hl.OutlineColor = S.ESPItemColor
                hl.FillTransparency = 0.6
                hl.OutlineTransparency = 0.1
                hl.Enabled = true
                seen[part] = true
            end
        end
    end
    for part, hl in pairs(ITEM_HL) do
        if not seen[part] or not part.Parent then
            if hl then hl:Destroy() end
            ITEM_HL[part] = nil
        end
    end
end

local function updateESP()
    updateItemESP()
    if not S.ESP then
        for _, b in pairs(ESP_BOXES) do
            hideESPBox(b)
            local char = b.plr.Character
            local hl = char and char:FindFirstChild("HamerChams")
            if hl then hl.Enabled = false end
        end
        return
    end
    loadRoleSource()
    refreshRoles()
    local myChar = LocalPlayer.Character
    local myRoot = myChar and myChar:FindFirstChild("HumanoidRootPart")
    local vp = Camera.ViewportSize
    local centerX, bottomY = vp.X / 2, vp.Y
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer then
            local b = ESP_BOXES[plr]
            if not b then
                b = makeESPBox(plr)
                ESP_BOXES[plr] = b
            end
            local char = plr.Character
            local hum = char and char:FindFirstChildOfClass("Humanoid")
            local charRoot = char and char:FindFirstChild("HumanoidRootPart")
            local role = roleCache[plr]
            local color = espRoleColor(role)
            local hl = char and char:FindFirstChild("HamerChams")
            if char and charRoot and hum and hum.Health > 0 then
                local cf, size = char:GetBoundingBox()
                local dist = myRoot and (myRoot.Position - cf.Position).Magnitude or 0
                local headPos = cf.Position + Vector3.new(0, size.Y / 2, 0)
                local feetPos = cf.Position - Vector3.new(0, size.Y / 2, 0)
                local hw, hOn = Camera:WorldToViewportPoint(headPos)
                local fw, fOn = Camera:WorldToViewportPoint(feetPos)
                if dist <= S.ESPMaxDist and hw.Z > 0 and fw.Z > 0 and (hOn or fOn) then
                    local top = math.min(hw.Y, fw.Y)
                    local bottom = math.max(hw.Y, fw.Y)
                    local h = math.max(bottom - top, 12)
                    local w = clamp(h * 0.55, 20, 400)
                    local cx = (hw.X + fw.X) / 2
                    local left, right = cx - w / 2, cx + w / 2
                    local hidden = S.ESPVisCheck and not visibilityCheck(plr, char)
                    local alpha = hidden and 0.7 or 0
                    local th = S.ESPThickness
                    local cs = math.clamp(w * 0.22, 8, 30)
                    b.arrow.Visible = false

                    b.box.Visible = not S.ESPCorners
                    if b.box.Visible then
                        b.box.Position = UDim2.new(0, left, 0, top)
                        b.box.Size = UDim2.new(0, w, 0, h)
                        b.stroke.Color = color
                        b.stroke.Thickness = th
                        b.stroke.Transparency = 0.05 + alpha
                    end
                    for _, c in ipairs(b.corners) do
                        c.Visible = S.ESPCorners
                        c.BackgroundColor3 = color
                        c.BackgroundTransparency = 0.05 + alpha
                    end
                    if S.ESPCorners then
                        local c1, c2 = b.corners[1], b.corners[2]
                        local c3, c4 = b.corners[3], b.corners[4]
                        local c5, c6 = b.corners[5], b.corners[6]
                        local c7, c8 = b.corners[7], b.corners[8]
                        c1.Position = UDim2.new(0, left, 0, top)
                        c1.Size = UDim2.new(0, cs, 0, th)
                        c2.Position = UDim2.new(0, left, 0, top)
                        c2.Size = UDim2.new(0, th, 0, cs)
                        c3.Position = UDim2.new(0, right - cs, 0, top)
                        c3.Size = UDim2.new(0, cs, 0, th)
                        c4.Position = UDim2.new(0, right - th, 0, top)
                        c4.Size = UDim2.new(0, th, 0, cs)
                        c5.Position = UDim2.new(0, left, 0, bottom - th)
                        c5.Size = UDim2.new(0, cs, 0, th)
                        c6.Position = UDim2.new(0, left, 0, bottom - cs)
                        c6.Size = UDim2.new(0, th, 0, cs)
                        c7.Position = UDim2.new(0, right - cs, 0, bottom - th)
                        c7.Size = UDim2.new(0, cs, 0, th)
                        c8.Position = UDim2.new(0, right - th, 0, bottom - cs)
                        c8.Size = UDim2.new(0, th, 0, cs)
                    end

                    if S.ESPHealth and hum.MaxHealth > 0 then
                        local ratio = clamp(hum.Health / hum.MaxHealth, 0, 1)
                        local hx = left - 6
                        b.hpBg.Visible = true
                        b.hpBg.BackgroundColor3 = Color3.fromRGB(15, 15, 18)
                        b.hpBg.BackgroundTransparency = 0.35
                        b.hpBg.Position = UDim2.new(0, hx, 0, top)
                        b.hpBg.Size = UDim2.new(0, 3, 0, h)
                        b.hpFill.Visible = true
                        b.hpFill.BackgroundColor3 = Color3.fromRGB(235, 60, 60):Lerp(Color3.fromRGB(90, 225, 120), ratio)
                        b.hpFill.BackgroundTransparency = 0.05 + alpha
                        b.hpFill.Position = UDim2.new(0, hx, 0, top + h * (1 - ratio))
                        b.hpFill.Size = UDim2.new(0, 3, 0, math.max(h * ratio, 1))
                    else
                        b.hpBg.Visible = false
                        b.hpFill.Visible = false
                    end

                    b.name.Visible = S.ESPNames
                    if S.ESPNames then
                        local label = plr.DisplayName
                        if role then label = role .. " | " .. label end
                        b.name.Text = label
                        b.name.TextColor3 = role and color or Color3.fromRGB(245, 245, 245)
                        b.name.TextTransparency = alpha
                        b.name.TextStrokeTransparency = 0.35 + alpha
                        b.name.Size = UDim2.new(0, 260, 0, 16)
                        b.name.Position = UDim2.new(0, cx - 130, 0, top - 20)
                    end
                    b.dist.Visible = S.ESPDist
                    if S.ESPDist then
                        b.dist.Text = math.floor(dist) .. "m"
                        b.dist.TextColor3 = color
                        b.dist.TextTransparency = alpha
                        b.dist.TextStrokeTransparency = 0.35 + alpha
                        b.dist.Size = UDim2.new(0, 160, 0, 14)
                        b.dist.Position = UDim2.new(0, cx - 80, 0, bottom + 2)
                    end

                    b.head.Visible = S.ESPHeadDot
                    if S.ESPHeadDot then
                        local hd = clamp(w * 0.18, 5, 14)
                        b.head.BackgroundColor3 = color
                        b.head.BackgroundTransparency = 0.15 + alpha
                        b.head.Position = UDim2.new(0, hw.X - hd / 2, 0, hw.Y - hd / 2)
                        b.head.Size = UDim2.new(0, hd, 0, hd)
                    end

                    b.tool.Visible = S.ESPTool
                    if S.ESPTool then
                        local tool = char:FindFirstChildOfClass("Tool")
                        b.tool.Visible = tool ~= nil
                        b.tool.Text = tool and tool.Name:sub(1, 20) or ""
                        b.tool.TextColor3 = color
                        b.tool.TextTransparency = alpha
                        b.tool.Size = UDim2.new(0, 200, 0, 12)
                        b.tool.Position = UDim2.new(0, cx - 100, 0, bottom + 17)
                    end

                    if S.ESPTracer then
                        setLine(b.tracer, centerX, bottomY, cx, top + h / 2, color, 1.2, 0.5 + alpha)
                    else
                        b.tracer.Visible = false
                    end

                    if S.ESPSkeleton then
                        local list = bonesFor(char)
                        ensureBones(b, #list)
                        local idx = 1
                        for _, pair in ipairs(list) do
                            local line = b.bones[idx]
                            idx = idx + 1
                            local pa = char:FindFirstChild(pair[1])
                            local pb = char:FindFirstChild(pair[2])
                            if pa and pb then
                                local wa, onA = Camera:WorldToViewportPoint(pa.Position)
                                local wb, onB = Camera:WorldToViewportPoint(pb.Position)
                                if wa.Z > 0 and wb.Z > 0 and (onA or onB) then
                                    setLine(line, wa.X, wa.Y, wb.X, wb.Y, color, 1.2, 0.35 + alpha)
                                else
                                    line.Visible = false
                                end
                            else
                                line.Visible = false
                            end
                        end
                        for i = idx, #b.bones do b.bones[i].Visible = false end
                    else
                        for _, line in ipairs(b.bones) do line.Visible = false end
                    end

                    if S.ESPChams then
                        if not hl then
                            hl = Instance.new("Highlight")
                            hl.Name = "HamerChams"
                            hl.Parent = char
                        end
                        hl.Enabled = true
                        hl.FillColor = color
                        hl.OutlineColor = color
                        hl.FillTransparency = 0.55
                        hl.OutlineTransparency = 0.15
                        hl.DepthMode = S.ESPChamsThrough and Enum.HighlightDepthMode.AlwaysOnTop or Enum.HighlightDepthMode.Occluded
                    elseif hl then
                        hl.Enabled = false
                    end
                else
                    hideESPBox(b)
                    if hl then hl.Enabled = false end
                    if S.ESPOffscreen and dist <= S.ESPMaxDist then
                        local sp, on = Camera:WorldToViewportPoint(cf.Position)
                        if not on or sp.Z <= 0 then
                            local dx, dy = sp.X - vp.X / 2, sp.Y - vp.Y / 2
                            if sp.Z <= 0 then dx, dy = -dx, -dy end
                            if math.abs(dx) + math.abs(dy) < 1 then dx = 1 end
                            local len = math.sqrt(dx * dx + dy * dy)
                            dx, dy = dx / len, dy / len
                            local sx = (vp.X / 2 - 26) / math.max(math.abs(dx), 0.001)
                            local sy = (vp.Y / 2 - 26) / math.max(math.abs(dy), 0.001)
                            local edge = math.min(sx, sy)
                            local ax, ay = vp.X / 2 + dx * edge, vp.Y / 2 + dy * edge
                            b.arrow.Visible = true
                            b.arrow.Position = UDim2.new(0, ax - 12, 0, ay - 12)
                            b.arrow.Size = UDim2.new(0, 24, 0, 24)
                            b.arrow.Rotation = math.deg(math.atan2(dy, dx))
                            b.arrow.TextColor3 = color
                            b.arrow.TextTransparency = 0
                        end
                    end
                end
            else
                hideESPBox(b)
                if hl then hl.Enabled = false end
            end
        end
    end
end

local function cleanupESP()
    cleanupItemESP()
    for plr, b in pairs(ESP_BOXES) do
        destroyESPBox(b)
        ESP_BOXES[plr] = nil
    end
    for _, plr in ipairs(Players:GetPlayers()) do
        local char = plr.Character
        local hl = char and char:FindFirstChild("HamerChams")
        if hl then hl:Destroy() end
    end
    if LocalPlayer.Character then
        local hl = LocalPlayer.Character:FindFirstChild("HamerChams")
        if hl then hl:Destroy() end
    end
end

conn(Players.PlayerRemoving:Connect(function(plr)
    local b = ESP_BOXES[plr]
    if b then
        destroyESPBox(b)
        ESP_BOXES[plr] = nil
    end
    roleCache[plr] = nil
    visCache[plr] = nil
end))
conn(RunService.RenderStepped:Connect(function()
    if Unloaded or optSkip() then return end
    updateESP()
end))

    return {update = updateESP, cleanup = cleanupESP, gui = espGui}
end)()

UI.lightBase = {
    Ambient = Lighting.Ambient,
    OutdoorAmbient = Lighting.OutdoorAmbient,
    Brightness = Lighting.Brightness,
    ClockTime = Lighting.ClockTime,
    GlobalShadows = Lighting.GlobalShadows
}

local function applyFullbright()
    if S.Fullbright then
        Lighting.Ambient = Color3.fromRGB(255, 255, 255)
        Lighting.OutdoorAmbient = Color3.fromRGB(255, 255, 255)
        Lighting.Brightness = 3
        Lighting.ClockTime = 14
        Lighting.GlobalShadows = false
    else
        Lighting.Ambient = UI.lightBase.Ambient
        Lighting.OutdoorAmbient = UI.lightBase.OutdoorAmbient
        Lighting.Brightness = UI.lightBase.Brightness
        Lighting.ClockTime = UI.lightBase.ClockTime
        Lighting.GlobalShadows = UI.lightBase.GlobalShadows
    end
end

local function applyFog()
    local old = Lighting:FindFirstChild("HamerFog")
    if old then old:Destroy() end
    if not S.Fog then return end
    local a = Instance.new("Atmosphere")
    a.Name = "HamerFog"
    a.Density = clamp(S.FogDensity, 0, 1)
    a.Offset = 0.25
    a.Color = Color3.fromRGB(200, 205, 220)
    a.Decay = Color3.fromRGB(95, 105, 135)
    a.Haze = 1.5
    a.Glare = 0
    a.Parent = Lighting
end

local function applyWorld()
    local old = Lighting:FindFirstChild("HamerWorld")
    if old then old:Destroy() end
    if not S.World then return end
    local cc = Instance.new("ColorCorrectionEffect")
    cc.Name = "HamerWorld"
    cc.Saturation = S.WorldSaturation
    cc.Contrast = S.WorldContrast
    cc.Brightness = 0
    cc.TintColor = Color3.fromRGB(255, 255, 255)
    cc.Parent = Lighting
end

local Shaders = (function()
    local names = {"HamerShaderColor", "HamerShaderBloom", "HamerShaderBlur", "HamerShaderSun", "HamerShaderDoF", "HamerShaderAtmos"}
    local function clear()
        for _, name in ipairs(names) do
            local fx = Lighting:FindFirstChild(name)
            if fx then fx:Destroy() end
        end
    end
    local function make(class, name)
        local fx = Instance.new(class)
        fx.Name = name
        fx.Parent = Lighting
        return fx
    end
    local function apply(name)
        clear()
        name = name or "off"
        S.Shader = name
        if name == "off" then return end
        local k = clamp(tonumber(S.ShaderIntensity) or 1, 0, 2)
        local cc = make("ColorCorrectionEffect", "HamerShaderColor")
        local bloom = make("BloomEffect", "HamerShaderBloom")
        if name == "neon" then
            cc.Saturation = 0.45
            cc.Contrast = 0.18
            cc.Brightness = 0.02
            cc.TintColor = Color3.fromRGB(205, 245, 255)
            bloom.Intensity = 1.15 * k
            bloom.Size = 32
            bloom.Threshold = 0.82
        elseif name == "cinematic" then
            cc.Saturation = -0.12
            cc.Contrast = 0.3
            cc.Brightness = -0.01
            cc.TintColor = Color3.fromRGB(255, 236, 212)
            bloom.Intensity = 0.32 * k
            bloom.Size = 24
            bloom.Threshold = 1.25
            local sun = make("SunRaysEffect", "HamerShaderSun")
            sun.Intensity = 0.045 * k
            sun.Spread = 0.65
            local dof = make("DepthOfFieldEffect", "HamerShaderDoF")
            dof.FocusDistance = 48
            dof.InFocusRadius = 55
            dof.FarIntensity = 0.16 * k
            dof.NearIntensity = 0.08 * k
        elseif name == "horror" then
            cc.Saturation = -0.78
            cc.Contrast = 0.48
            cc.Brightness = -0.13
            cc.TintColor = Color3.fromRGB(255, 190, 190)
            bloom.Intensity = 0.55 * k
            bloom.Size = 40
            bloom.Threshold = 0.55
            local blurFx = make("BlurEffect", "HamerShaderBlur")
            blurFx.Size = 1.8 * k
            local atm = make("Atmosphere", "HamerShaderAtmos")
            atm.Density = 0.38
            atm.Offset = 0.15
            atm.Color = Color3.fromRGB(38, 34, 40)
            atm.Decay = Color3.fromRGB(70, 25, 30)
            atm.Haze = 2.4
            atm.Glare = 0
        elseif name == "anime" then
            cc.Saturation = 0.52
            cc.Contrast = 0.14
            cc.Brightness = 0.05
            cc.TintColor = Color3.fromRGB(255, 246, 255)
            bloom.Intensity = 0.85 * k
            bloom.Size = 24
            bloom.Threshold = 0.95
            local sun = make("SunRaysEffect", "HamerShaderSun")
            sun.Intensity = 0.03 * k
            sun.Spread = 0.45
        elseif name == "vaporwave" then
            cc.Saturation = 0.58
            cc.Contrast = 0.22
            cc.Brightness = 0.02
            cc.TintColor = Color3.fromRGB(255, 180, 255)
            bloom.Intensity = 1.05 * k
            bloom.Size = 36
            bloom.Threshold = 0.78
            local blurFx = make("BlurEffect", "HamerShaderBlur")
            blurFx.Size = 0.9 * k
            local atm = make("Atmosphere", "HamerShaderAtmos")
            atm.Density = 0.22
            atm.Offset = 0.2
            atm.Color = Color3.fromRGB(255, 190, 235)
            atm.Decay = Color3.fromRGB(85, 55, 140)
            atm.Haze = 1.6
            atm.Glare = 0
        elseif name == "retro" then
            cc.Saturation = -0.32
            cc.Contrast = 0.26
            cc.Brightness = -0.02
            cc.TintColor = Color3.fromRGB(255, 238, 185)
            bloom.Intensity = 0.38 * k
            bloom.Size = 20
            bloom.Threshold = 1.1
            local blurFx = make("BlurEffect", "HamerShaderBlur")
            blurFx.Size = 1.2 * k
        end
    end
    return {apply = apply, clear = clear}
end)()

UI.mbEffect = Instance.new("BlurEffect")
UI.mbEffect.Name = "HamerMotionBlur"
UI.mbEffect.Size = 0
UI.mbEffect.Parent = Lighting
UI.mbLast = nil
UI.mbAmount = 0
conn(RunService.RenderStepped:Connect(function(dt)
    if Unloaded then return end
    if not S.MotionBlur then
        UI.mbAmount = 0
        UI.mbEffect.Size = 0
        UI.mbLast = nil
        return
    end
    local look = Camera.CFrame.LookVector
    local speed = 0
    if UI.mbLast then
        local dot = clamp(look:Dot(UI.mbLast), -1, 1)
        speed = math.acos(dot) / math.max(dt, 0.001)
    end
    UI.mbLast = look
    local target = clamp(speed * 2, 0, S.MotionBlurStrength)
    UI.mbAmount = UI.mbAmount + (target - UI.mbAmount) * math.min(dt * 10, 1)
    UI.mbEffect.Size = UI.mbAmount
end))

UI.aspectBase, UI.aspectLast = nil, nil
conn(RunService.RenderStepped:Connect(function()
    if Unloaded then return end
    if S.Aspect then
        local cur = Camera.CFrame
        if not UI.aspectBase or (UI.aspectLast and (cur.Position - UI.aspectLast.Position).Magnitude > 0.001) then
            UI.aspectBase = cur
        end
        UI.aspectLast = cur
        Camera.CFrame = UI.aspectBase * CFrame.new(0, 0, 0, 1, 0, 0, 0, S.AspectValue, 0, 0, 0, 1)
    else
        UI.aspectBase = nil
        UI.aspectLast = nil
    end
end))

UI.fovCircle = Instance.new("Frame")
UI.fovCircle.AnchorPoint = Vector2.new(0.5, 0.5)
UI.fovCircle.Position = UDim2.new(0.5, 0, 0.5, 0)
UI.fovCircle.BackgroundTransparency = 1
UI.fovCircle.BorderSizePixel = 0
UI.fovCircle.Visible = false
UI.fovCircle.ZIndex = 6
UI.fovCircle.Parent = gui
UI.fovCorner = Instance.new("UICorner")
UI.fovCorner.CornerRadius = UDim.new(1, 0)
UI.fovCorner.Parent = UI.fovCircle
UI.fovStroke = Instance.new("UIStroke")
UI.fovStroke.Color = accent()
UI.fovStroke.Thickness = 1.4
UI.fovStroke.Transparency = 0.35
UI.fovStroke.Parent = UI.fovCircle
bindAccent(function(c) UI.fovStroke.Color = c end)

UI.flyBV, UI.flyBG = nil, nil
local Farm = {bv = nil, bg = nil, wasOn = false}
local noclipSaved = {}
local hitboxSaved = {}
local hitboxAcc = 0
local autoAcc = 0
UI.speedWasOn = false
UI.jumpWasOn = false

local function updateFly(char, hum, root)
    if S.Fly and char and hum and root then
        if not UI.flyBV then
            UI.flyBV = Instance.new("BodyVelocity")
            UI.flyBV.Name = "HamerFly"
            UI.flyBV.MaxForce = Vector3.new(1e5, 1e5, 1e5)
            UI.flyBV.Velocity = Vector3.zero
            UI.flyBV.Parent = root
        end
        if not UI.flyBG then
            UI.flyBG = Instance.new("BodyGyro")
            UI.flyBG.Name = "HamerGyro"
            UI.flyBG.MaxTorque = Vector3.new(1e5, 1e5, 1e5)
            UI.flyBG.P = 1500
            UI.flyBG.D = 60
            UI.flyBG.Parent = root
        end
        hum.PlatformStand = true
        local move = Vector3.zero
        local cf = Camera.CFrame
        if UIS:IsKeyDown(Enum.KeyCode.W) then move = move + cf.LookVector end
        if UIS:IsKeyDown(Enum.KeyCode.S) then move = move - cf.LookVector end
        if UIS:IsKeyDown(Enum.KeyCode.A) then move = move - cf.RightVector end
        if UIS:IsKeyDown(Enum.KeyCode.D) then move = move + cf.RightVector end
        if UIS:IsKeyDown(Enum.KeyCode.Space) then move = move + Vector3.new(0, 1, 0) end
        if UIS:IsKeyDown(Enum.KeyCode.LeftControl) then move = move - Vector3.new(0, 1, 0) end
        if move.Magnitude > 0 then
            UI.flyBV.Velocity = move.Unit * S.FlySpeed
        else
            UI.flyBV.Velocity = Vector3.zero
        end
        UI.flyBG.CFrame = cf
    else
        if UI.flyBV then UI.flyBV:Destroy(); UI.flyBV = nil end
        if UI.flyBG then UI.flyBG:Destroy(); UI.flyBG = nil end
        if hum then hum.PlatformStand = false end
    end
end

local Coin = (function()
local farmTarget = nil
local farmScanAcc = 0

local function isCoinPart(obj, char)
    if not obj.Parent or obj:IsDescendantOf(char) then return false end
    if obj.Transparency >= 1 then return false end
    local n = string.lower(obj.Name)
    if string.find(n, "coin", 1, true) then return true end
    local p = obj.Parent
    if p and string.find(string.lower(p.Name), "coin", 1, true) then return true end
    if p and p.Parent and string.find(string.lower(p.Parent.Name), "coin", 1, true) then return true end
    return false
end

local function findCoin(char, root)
    local best, bestDist = nil, math.huge
    for _, obj in ipairs(ItemCache.scan()) do
        if isCoinPart(obj, char) then
            local d = (obj.Position - root.Position).Magnitude
            if d < bestDist then
                best, bestDist = obj, d
            end
        end
    end
    return best
end

local function stopCoinFarm()
    if Farm.farmBV then Farm.farmBV:Destroy(); Farm.farmBV = nil end
    if Farm.farmBG then Farm.farmBG:Destroy(); Farm.farmBG = nil end
    local char = LocalPlayer.Character
    local hum = char and char:FindFirstChildOfClass("Humanoid")
    if hum then hum.PlatformStand = false end
end

local function updateCoinFarm(dt, char, hum, root)
    if not (char and hum and root) then return end
    if hum.Health <= 0 then return end
    if UI.flyBV then UI.flyBV:Destroy(); UI.flyBV = nil end
    if UI.flyBG then UI.flyBG:Destroy(); UI.flyBG = nil end
    if not Farm.farmBV or not Farm.farmBV.Parent then
        Farm.farmBV = Instance.new("BodyVelocity")
        Farm.farmBV.Name = "HamerFarm"
        Farm.farmBV.MaxForce = Vector3.new(1e5, 1e5, 1e5)
        Farm.farmBV.Velocity = Vector3.zero
        Farm.farmBV.Parent = root
    end
    if not Farm.farmBG or not Farm.farmBG.Parent then
        Farm.farmBG = Instance.new("BodyGyro")
        Farm.farmBG.Name = "HamerFarmGyro"
        Farm.farmBG.MaxTorque = Vector3.new(1e5, 1e5, 1e5)
        Farm.farmBG.P = 1500
        Farm.farmBG.D = 60
        Farm.farmBG.Parent = root
    end
    hum.PlatformStand = true
    farmScanAcc = farmScanAcc + dt
    local scanRate = S.Optimize >= 3 and 0.8 or (S.Optimize == 2 and 0.5 or 0.3)
    if farmScanAcc >= scanRate or not (farmTarget and farmTarget.Parent) then
        farmScanAcc = 0
        farmTarget = findCoin(char, root)
    end
    if not (farmTarget and farmTarget.Parent) then
        Farm.farmBV.Velocity = Vector3.zero
        return
    end
    local target = farmTarget.Position
    if S.FarmUnderMap then
        target = target - Vector3.new(0, 2, 0)
    end
    local delta = target - root.Position
    local dist = delta.Magnitude
    local speed = math.clamp(S.FarmSpeed or 80, 10, 300)
    if dist > 0.1 then
        local v = speed
        if dist < 12 then v = math.clamp(dist * 5, 3, speed) end
        Farm.farmBV.Velocity = delta.Unit * v
        local flat = Vector3.new(delta.X, 0, delta.Z)
        if flat.Magnitude > 0.1 then
            Farm.farmBG.CFrame = CFrame.lookAt(root.Position, root.Position + flat.Unit)
        end
    else
        Farm.farmBV.Velocity = Vector3.zero
    end
end

return {farm = Farm, update = updateCoinFarm, stop = stopCoinFarm}
end)()

conn(RunService.Heartbeat:Connect(function(dt)
    if Unloaded then return end
    local char = LocalPlayer.Character
    local hum = char and char:FindFirstChildOfClass("Humanoid")
    local root = char and char:FindFirstChild("HumanoidRootPart")

    if hum then
        if S.Speed then
            hum.WalkSpeed = S.SpeedValue
            UI.speedWasOn = true
        elseif UI.speedWasOn then
            hum.WalkSpeed = 16
            UI.speedWasOn = false
        end
        if S.Jump then
            hum.UseJumpPower = true
            hum.JumpPower = S.JumpValue
            UI.jumpWasOn = true
        elseif UI.jumpWasOn then
            hum.JumpPower = 50
            UI.jumpWasOn = false
        end
    end

    if S.CoinFarm then
        Coin.farm.farmWasOn = true
        Coin.update(dt, char, hum, root)
    else
        if Coin.farm.farmWasOn then
            Coin.farm.farmWasOn = false
            Coin.stop()
        end
        updateFly(char, hum, root)
    end

    if char then
        if S.Noclip or (S.CoinFarm and (S.FarmNoClip or S.FarmUnderMap)) then
            for _, p in ipairs(char:GetDescendants()) do
                if p:IsA("BasePart") and noclipSaved[p] == nil then
                    noclipSaved[p] = p.CanCollide
                    p.CanCollide = false
                end
            end
        else
            for p, v in pairs(noclipSaved) do
                if p.Parent then p.CanCollide = v end
            end
            noclipSaved = {}
        end
    end

    hitboxAcc = hitboxAcc + dt
    if hitboxAcc >= 0.3 then
        hitboxAcc = 0
        if S.Hitbox then
            for _, plr in ipairs(Players:GetPlayers()) do
                if plr ~= LocalPlayer and plr.Character then
                    local r = plr.Character:FindFirstChild("HumanoidRootPart")
                    if r then
                        if hitboxSaved[r] == nil then hitboxSaved[r] = r.Size end
                        r.Size = Vector3.new(S.HitboxSize, S.HitboxSize, S.HitboxSize)
                    end
                end
            end
        else
            for p, v in pairs(hitboxSaved) do
                if p.Parent then p.Size = v end
            end
            hitboxSaved = {}
        end
    end

    if S.AutoCollect and char and root then
        autoAcc = autoAcc + dt
        if autoAcc >= 0.6 then
            autoAcc = 0
            local best, bestD = nil, 60
            for _, d in ipairs(ItemCache.scan()) do
                if not d:IsDescendantOf(char) then
                    local n = string.lower(d.Name)
                    if string.find(n, "coin") or string.find(n, "cash") or string.find(n, "gem") or string.find(n, "money") or string.find(n, "diamond") then
                        local dist = (d.Position - root.Position).Magnitude
                        if dist < bestD then
                            bestD = dist
                            best = d
                        end
                    end
                end
            end
            if best then
                root.CFrame = CFrame.new(best.Position + Vector3.new(0, 3, 0))
            end
        end
    end
end))

conn(UIS.JumpRequest:Connect(function()
    if not S.InfJump then return end
    local char = LocalPlayer.Character
    local hum = char and char:FindFirstChildOfClass("Humanoid")
    if hum then
        hum:ChangeState(Enum.HumanoidStateType.Jumping)
    end
end))

local afkConn = nil
local function setAntiAfk(on)
    S.AntiAfk = on
    if on and not afkConn then
        afkConn = LocalPlayer.Idled:Connect(function()
            local vu = game:GetService("VirtualUser")
            pcall(function()
                vu:CaptureController()
                vu:ClickButton2(Vector2.new())
            end)
        end)
    elseif not on and afkConn then
        afkConn:Disconnect()
        afkConn = nil
    end
end

conn(RunService.RenderStepped:Connect(function()
    if Unloaded then return end
    if not S.Flick then UI.fovCircle.Visible = S.Aimbot end
    if not S.Aimbot then return end
    UI.fovCircle.Size = UDim2.new(0, S.AimbotFOV * 2, 0, S.AimbotFOV * 2)
    local vp = Camera.ViewportSize
    local center = Vector2.new(vp.X / 2, vp.Y / 2)
    local best, bestD = nil, math.huge
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer then
            local char = plr.Character
            local hum = char and char:FindFirstChildOfClass("Humanoid")
            local part = char and (char:FindFirstChild(S.AimbotPart) or char:FindFirstChild("HumanoidRootPart"))
            if hum and hum.Health > 0 and part then
                local sp, on = Camera:WorldToViewportPoint(part.Position)
                if on then
                    local d = (Vector2.new(sp.X, sp.Y) - center).Magnitude
                    if d <= S.AimbotFOV and d < bestD then
                        bestD = d
                        best = part
                    end
                end
            end
        end
    end
    if best then
        local goal = CFrame.new(Camera.CFrame.Position, best.Position)
        Camera.CFrame = Camera.CFrame:Lerp(goal, clamp(1 - S.AimbotSmooth, 0.03, 1))
    end
end))

local Drone = {model = nil, conn = nil, active = false, t = 0, prevType = nil, prevSubject = nil, gui = nil, hold = {f = false, b = false, l = false, r = false, u = false, d = false}, pads = {}, yaw = 0, pitch = 0, lookTouch = nil, touchPos = nil}

local function mkDronePart(model, name, shape, size, cf, material, color)
    local p = Instance.new("Part")
    p.Name = name
    p.Shape = shape
    p.Size = size
    p.CFrame = cf
    p.Anchored = true
    p.CanCollide = false
    p.CanQuery = false
    p.CanTouch = false
    p.CastShadow = false
    p.Material = material
    p.Color = color
    p.Parent = model
    return p
end

local function createDroneModel()
    local model = Instance.new("Model")
    model.Name = "HamerDrone"
    local c = accent()
    local body = mkDronePart(model, "Fuselage", Enum.PartType.Block, Vector3.new(0.9, 0.7, 3.2), CFrame.new(0, 0, 0), Enum.Material.Metal, Color3.fromRGB(205, 210, 220))
    local wingL = mkDronePart(model, "WingL", Enum.PartType.Block, Vector3.new(3.2, 0.1, 1.1), CFrame.new(-1.4, 0, 0.4), Enum.Material.Metal, Color3.fromRGB(190, 195, 205))
    local wingR = mkDronePart(model, "WingR", Enum.PartType.Block, Vector3.new(3.2, 0.1, 1.1), CFrame.new(1.4, 0, 0.4), Enum.Material.Metal, Color3.fromRGB(190, 195, 205))
    mkDronePart(model, "StripL", Enum.PartType.Block, Vector3.new(0.12, 0.13, 1.0), CFrame.new(-2.92, 0, 0.4), Enum.Material.Neon, c)
    mkDronePart(model, "StripR", Enum.PartType.Block, Vector3.new(0.12, 0.13, 1.0), CFrame.new(2.92, 0, 0.4), Enum.Material.Neon, c)
    mkDronePart(model, "TopStrip", Enum.PartType.Block, Vector3.new(0.34, 0.07, 2.0), CFrame.new(0, 0.37, -0.1), Enum.Material.Neon, c)
    mkDronePart(model, "Core", Enum.PartType.Ball, Vector3.new(0.34, 0.34, 0.34), CFrame.new(0, 0.1, 0.2), Enum.Material.Neon, c)
    local prop = mkDronePart(model, "Propeller", Enum.PartType.Block, Vector3.new(0.12, 1.5, 0.12), CFrame.new(0, 0, 1.9), Enum.Material.Metal, Color3.fromRGB(120, 126, 138))
    local nose = mkDronePart(model, "Nose", Enum.PartType.Ball, Vector3.new(0.6, 0.6, 0.9), CFrame.new(0, 0, -1.7), Enum.Material.Metal, Color3.fromRGB(60, 65, 75))
    local light = Instance.new("PointLight")
    light.Color = c
    light.Range = 8
    light.Brightness = 2
    light.Parent = nose
    model.PrimaryPart = body
    return model, prop
end

local function droneExplode(pos)
    local boom = Instance.new("Explosion")
    boom.Position = pos
    boom.BlastRadius = 9
    boom.BlastPressure = 0
    boom.DestroyJointRadiusPercent = 0
    boom.Parent = Workspace
    local ball = Instance.new("Part")
    ball.Shape = Enum.PartType.Ball
    ball.Material = Enum.Material.Neon
    ball.Color = Color3.fromRGB(255, 150, 45)
    ball.Size = Vector3.new(2, 2, 2)
    ball.Transparency = 0.15
    ball.Anchored = true
    ball.CanCollide = false
    ball.CanQuery = false
    ball.CanTouch = false
    ball.CastShadow = false
    ball.Position = pos
    ball.Parent = Workspace
    local light = Instance.new("PointLight")
    light.Color = Color3.fromRGB(255, 170, 70)
    light.Range = 18
    light.Brightness = 8
    light.Parent = ball
    TweenService:Create(ball, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        Size = Vector3.new(14, 14, 14),
        Transparency = 1
    }):Play()
    task.delay(0.55, function()
        if ball.Parent then ball:Destroy() end
    end)
end

local function droneLookFromCamera()
    local look = Camera and Camera.CFrame.LookVector or Vector3.new(0, 0, -1)
    Drone.pitch = math.asin(clamp(look.Y, -1, 1))
    Drone.yaw = math.atan2(-look.X, -look.Z)
end

local function destroyDroneControls()
    if Drone.gui then Drone.gui:Destroy(); Drone.gui = nil end
    for k in pairs(Drone.hold) do Drone.hold[k] = false end
    Drone.lookTouch, Drone.touchPos = nil, nil
    Drone.pads = {}
end

local function createDroneControls()
    destroyDroneControls()
    local sg = Instance.new("ScreenGui")
    sg.Name = "HamerDroneControls"
    sg.ResetOnSpawn = false
    sg.IgnoreGuiInset = true
    sg.DisplayOrder = 998
    sg.Parent = LocalPlayer:WaitForChild("PlayerGui")
    Drone.gui = sg
    local function pad(text, x, y, key)
        local b = Instance.new("TextButton")
        b.Size = UDim2.new(0, 50, 0, 50)
        b.Position = UDim2.new(0.5, x, 1, y)
        b.AnchorPoint = Vector2.new(0.5, 1)
        b.BackgroundColor3 = Color3.fromRGB(24, 26, 33)
        b.BackgroundTransparency = 0.12
        b.Text = text
        b.TextColor3 = Color3.fromRGB(235, 240, 250)
        b.Font = FONT_BOLD
        b.TextSize = FS(20)
        b.AutoButtonColor = false
        b.Parent = sg
        table.insert(Drone.pads, b)
        corner(b, 10)
        stroke(b, accent(), 0.45, 1)
        local function set(v)
            Drone.hold[key] = v
            tw(b, 0.1, {BackgroundColor3 = v and accent() or Color3.fromRGB(24, 26, 33)})
        end
        b.InputBegan:Connect(function(input)
            if Drone.lookTouch == input then Drone.lookTouch, Drone.touchPos = nil, nil end
        end)
        b.MouseButton1Down:Connect(function() set(true) end)
        b.MouseButton1Up:Connect(function() set(false) end)
        b.MouseLeave:Connect(function() if Drone.hold[key] then set(false) end end)
    end
    pad("▲", 0, -168, "f")
    pad("▼", 0, -52, "b")
    pad("◀", -58, -110, "l")
    pad("▶", 58, -110, "r")
    pad("↑", 140, -150, "u")
    pad("↓", 140, -72, "d")
end

local function stopDrone()
    Drone.active = false
    S.DroneActive = false
    destroyDroneControls()
    if Drone.conn then Drone.conn:Disconnect(); Drone.conn = nil end
    if Drone.prevType ~= nil then
        if Camera then
            Camera.CameraType = Drone.prevType
            local subject = Drone.prevSubject
            if not (subject and subject.Parent) then
                subject = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
            end
            Camera.CameraSubject = subject
        end
        Drone.prevType, Drone.prevSubject = nil, nil
    end
    if Drone.model and Drone.model.Parent then Drone.model:Destroy() end
    Drone.model = nil
end

conn(UIS.InputBegan:Connect(function(input, gp)
    if S.MenuOpen or not (Drone.active and S.DroneManual) then return end
    if input.UserInputType == Enum.UserInputType.Touch then
        local overPad = false
        if Drone.gui then
            for _, obj in ipairs(Drone.gui:GetChildren()) do
                if obj:IsA("TextButton") then
                    local p, s = obj.AbsolutePosition, obj.AbsoluteSize
                    if input.Position.X >= p.X and input.Position.X <= p.X + s.X and input.Position.Y >= p.Y and input.Position.Y <= p.Y + s.Y then
                        overPad = true
                        break
                    end
                end
            end
        end
        if gp or overPad or Drone.lookTouch then return end
        Drone.lookTouch, Drone.touchPos = input, input.Position
    end
end))
conn(UIS.InputChanged:Connect(function(input)
    if S.MenuOpen or not (Drone.active and S.DroneManual) then return end
    if input.UserInputType == Enum.UserInputType.MouseMovement and not S.Mobile then
        local dx = clamp(input.Delta.X, -80, 80)
        local dy = clamp(input.Delta.Y, -80, 80)
        Drone.yaw = Drone.yaw - dx * 0.004
        Drone.pitch = clamp(Drone.pitch - dy * 0.004, -1.25, 1.25)
    elseif input == Drone.lookTouch and input.UserInputType == Enum.UserInputType.Touch and Drone.touchPos then
        local d = input.Position - Drone.touchPos
        Drone.touchPos = input.Position
        Drone.yaw = Drone.yaw - clamp(d.X, -60, 60) * 0.006
        Drone.pitch = clamp(Drone.pitch - clamp(d.Y, -60, 60) * 0.006, -1.25, 1.25)
    end
    Drone.yaw = (Drone.yaw + math.pi) % (math.pi * 2) - math.pi
end))
conn(UIS.InputEnded:Connect(function(input)
    if input == Drone.lookTouch then Drone.lookTouch, Drone.touchPos = nil, nil end
end))

local function startDrone()
    if Drone.active then return end
    local char = LocalPlayer.Character
    local root = char and char:FindFirstChild("HumanoidRootPart")
    if not root then return end
    local model, prop = createDroneModel()
    model:PivotTo(CFrame.new(root.Position + root.CFrame.LookVector * 4 + Vector3.new(0, 4, 0)))
    model.Parent = Workspace
    Drone.model = model
    Drone.active = true
    S.DroneActive = true
    Drone.t = 0
    if Camera then
        Drone.prevType = Camera.CameraType
        Drone.prevSubject = Camera.CameraSubject
        Camera.CameraType = Enum.CameraType.Scriptable
    end
    if S.DroneManual then
        droneLookFromCamera()
        createDroneControls()
    end
    local target, bestDist = nil, math.huge
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= LocalPlayer and p.Character then
            local r = p.Character:FindFirstChild("HumanoidRootPart")
            if r then
                local d = (r.Position - root.Position).Magnitude
                if d < bestDist then
                    bestDist = d
                    target = p
                end
            end
        end
    end
    Drone.conn = RunService.Heartbeat:Connect(function(dt)
        if not Drone.active or not model.Parent then return end
        Drone.t = Drone.t + dt
        local fus = model:FindFirstChild("Fuselage")
        if not fus then return end
        if S.DroneManual then
            local rot = CFrame.fromOrientation(Drone.pitch, Drone.yaw, 0)
            local move = Vector3.zero
            if Drone.hold.f or UIS:IsKeyDown(Enum.KeyCode.W) then move = move + rot.LookVector end
            if Drone.hold.b or UIS:IsKeyDown(Enum.KeyCode.S) then move = move - rot.LookVector end
            if Drone.hold.r or UIS:IsKeyDown(Enum.KeyCode.D) then move = move + rot.RightVector end
            if Drone.hold.l or UIS:IsKeyDown(Enum.KeyCode.A) then move = move - rot.RightVector end
            if Drone.hold.u or UIS:IsKeyDown(Enum.KeyCode.Space) then move = move + Vector3.new(0, 1, 0) end
            if Drone.hold.d or UIS:IsKeyDown(Enum.KeyCode.LeftControl) then move = move - Vector3.new(0, 1, 0) end
            if move.Magnitude > 1 then move = move.Unit end
            local pos = fus.Position + move * S.DroneSpeed * dt
            model:PivotTo(CFrame.new(pos) * rot)
            if Camera then
                local goal
                if S.DroneView == 2 then
                    local camPos = pos + rot.LookVector * 2.45 + Vector3.new(0, 0.3, 0)
                    goal = CFrame.lookAt(camPos, camPos + rot.LookVector * 24)
                else
                    local camPos = pos - rot.LookVector * 9 + Vector3.new(0, 3.4, 0)
                    goal = CFrame.lookAt(camPos, pos + rot.LookVector * 8)
                end
                Camera.CFrame = Camera.CFrame:Lerp(goal, math.min(dt * 20, 1))
            end
        else
            local targetPos
            if target and target.Character then
                local tr = target.Character:FindFirstChild("HumanoidRootPart")
                if tr then targetPos = tr.Position end
            end
            if not targetPos then
                targetPos = fus.Position + fus.CFrame.LookVector * 10
            end
            local dir = targetPos - fus.Position
            if dir.Magnitude > 0.1 then
                model:PivotTo(CFrame.lookAt(fus.Position + dir.Unit * 45 * dt, targetPos))
            end
            if Camera then
                if S.DroneView == 2 then
                    Camera.CFrame = fus.CFrame * CFrame.new(0, 0.35, -2.0)
                else
                    Camera.CFrame = fus.CFrame * CFrame.new(0, 3.4, 9.0)
                end
            end
        end
        if prop and prop.Parent then
            prop.CFrame = fus.CFrame * CFrame.new(0, 0, 1.9) * CFrame.Angles(0, 0, Drone.t * 35)
        end
        for _, p in ipairs(Players:GetPlayers()) do
            if p ~= LocalPlayer and p.Character then
                local tr = p.Character:FindFirstChild("HumanoidRootPart")
                if tr and (tr.Position - fus.Position).Magnitude < 3.2 then
                    local hum = p.Character:FindFirstChildOfClass("Humanoid")
                    if hum then hum.Health = 0 end
                    droneExplode(fus.Position)
                    stopDrone()
                    return
                end
            end
        end
        if Drone.t > 30 then
            droneExplode(fus.Position)
            stopDrone()
        end
    end)
end

local CE = (function()
local setSilentAim, setKillAll
local silentHookReady, silentHookTried = false, false
local silentRay = RaycastParams.new()
silentRay.FilterType = Enum.RaycastFilterType.Exclude
silentRay.IgnoreWater = true

local function silentVisible(targetChar, part)
    local myChar = LocalPlayer.Character
    local filter = {}
    if myChar then table.insert(filter, myChar) end
    table.insert(filter, targetChar)
    silentRay.FilterDescendantsInstances = filter
    local origin = Camera.CFrame.Position
    local ok, result = pcall(function() return Workspace:Raycast(origin, part.Position - origin, silentRay) end)
    return (not ok) or result == nil
end

local function findSilentTarget()
    local vp = Camera.ViewportSize
    local center = Vector2.new(vp.X / 2, vp.Y / 2)
    local myRoot = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    local best, bestD = nil, math.huge
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer then
            local char = plr.Character
            local hum = char and char:FindFirstChildOfClass("Humanoid")
            local part = char and (char:FindFirstChild("Head") or char:FindFirstChild("HumanoidRootPart"))
            local root = char and char:FindFirstChild("HumanoidRootPart")
            if hum and hum.Health > 0 and part and root then
                local dist = myRoot and (myRoot.Position - part.Position).Magnitude or 0
                if dist <= S.SilentAimMaxDist then
                    local pos = part.Position
                    local predict = (S.SilentAimPredict or 0) / 1000
                    if predict > 0 then pos = pos + root.AssemblyLinearVelocity * predict end
                    local sp, on = Camera:WorldToViewportPoint(pos)
                    if on and sp.Z > 0 then
                        local d = (Vector2.new(sp.X, sp.Y) - center).Magnitude
                        if d <= S.SilentAimFOV and d < bestD and (S.SilentAimWallbang or silentVisible(char, part)) then
                            bestD = d
                            best = {part = part, char = char, pos = pos}
                        end
                    end
                end
            end
        end
    end
    return best
end

local function installSilentAimHook()
    if silentHookReady then return true end
    if silentHookTried then return false end
    silentHookTried = true
    if type(hookmetamethod) ~= "function" or type(getnamecallmethod) ~= "function" or type(newcclosure) ~= "function" then
        return false
    end
    local ok = pcall(function()
        local original
        original = hookmetamethod(game, "__namecall", newcclosure(function(remote, ...)
            local methodOk, method = pcall(getnamecallmethod)
            if not methodOk or method ~= "FireServer" or not S.SilentAim then
                return original(remote, ...)
            end
            if type(checkcaller) == "function" then
                local callerOk, caller = pcall(checkcaller)
                if callerOk and caller then return original(remote, ...) end
            end
            local nameOk, name = pcall(function() return remote.Name end)
            if not nameOk or type(name) ~= "string" or not string.find(string.lower(name), "shoot", 1, true) then
                return original(remote, ...)
            end
            local parentOk, parent = pcall(function() return remote.Parent end)
            if not parentOk or not parent or not string.find(string.lower(parent.Name), "gun", 1, true) then
                return original(remote, ...)
            end
            local target = findSilentTarget()
            if not target then return original(remote, ...) end
            local char = LocalPlayer.Character
            local gun = char and char:FindFirstChild("Gun")
            local handle = gun and (gun:FindFirstChild("Handle") or gun:FindFirstChildWhichIsA("BasePart"))
            local myRoot = char and char:FindFirstChild("HumanoidRootPart")
            local origin = handle and handle.Position or (myRoot and (myRoot.Position + Vector3.new(0, 1.2, 0)))
            if not origin or (target.pos - origin).Magnitude < 0.2 then
                return original(remote, ...)
            end
            return original(remote, CFrame.new(origin, target.pos), CFrame.new(target.pos))
        end))
    end)
    silentHookReady = ok
    return ok
end

local KNIFE_TARGET_PARTS = {"HumanoidRootPart", "UpperTorso", "Torso", "LowerTorso", "Head"}
local KillAll = {conn = nil, nextAt = 0}

local function findKnife(container)
    if not container then return nil end
    local knife = container:FindFirstChild("Knife")
    if knife and knife:IsA("Tool") then return knife end
    for _, tool in ipairs(container:GetChildren()) do
        if tool:IsA("Tool") and string.find(string.lower(tool.Name), "knife", 1, true) then return tool end
    end
end

local function knifeTouch(root)
    local char = LocalPlayer.Character
    if not char then return end
    local knife = findKnife(char)
    if not knife then
        local backpack = LocalPlayer:FindFirstChildOfClass("Backpack")
        knife = findKnife(backpack)
        if knife then pcall(function() knife.Parent = char end) end
    end
    if not knife then return end
    local handle = knife:FindFirstChild("Handle") or knife:FindFirstChildWhichIsA("BasePart")
    if handle and type(firetouchinterest) == "function" then
        for _, name in ipairs(KNIFE_TARGET_PARTS) do
            local part = root.Parent and root.Parent:FindFirstChild(name)
            if part then
                pcall(firetouchinterest, handle, part, 0)
                pcall(firetouchinterest, handle, part, 1)
                pcall(firetouchinterest, part, handle, 0)
                pcall(firetouchinterest, part, handle, 1)
            end
        end
    end
    pcall(function() knife:Activate() end)
end

local function killAllStep()
    if not S.KillAll or Unloaded then return end
    local now = os.clock()
    if now < KillAll.nextAt then return end
    KillAll.nextAt = now + 0.12
    local char = LocalPlayer.Character
    local hum = char and char:FindFirstChildOfClass("Humanoid")
    if not hum or hum.Health <= 0 then return end
    local backpack = LocalPlayer:FindFirstChildOfClass("Backpack")
    if not findKnife(char) and not findKnife(backpack) then return end
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer then
            local tchar = plr.Character
            local thum = tchar and tchar:FindFirstChildOfClass("Humanoid")
            local root = tchar and tchar:FindFirstChild("HumanoidRootPart")
            if thum and thum.Health > 0 and root then knifeTouch(root) end
        end
    end
end

setSilentAim = function(on)
    if on and not installSilentAimHook() then
        S.SilentAim = false
        toast("Silent Aim: executor has no hooks")
        return false
    end
    S.SilentAim = not not on
    return true
end

setKillAll = function(on)
    S.KillAll = not not on
    if S.KillAll then
        if not KillAll.conn then
            KillAll.conn = RunService.Heartbeat:Connect(killAllStep)
        end
        local char = LocalPlayer.Character
        local backpack = LocalPlayer:FindFirstChildOfClass("Backpack")
        if not findKnife(char) and not findKnife(backpack) then
            toast("Kill All: knife not found")
        end
    elseif KillAll.conn then
        KillAll.conn:Disconnect()
        KillAll.conn = nil
    end
end

return {setSilentAim = setSilentAim, setKillAll = setKillAll, KillAll = KillAll, findKnife = findKnife, knifeTouch = knifeTouch}
end)()

local Extras = (function()
    local trail = nil
    local savedColors = nil
    local savedTrans = nil
    local lastEquip, lastGun, lastAura = 0, 0, 0
    local spinAuto, danceIndex, lastDance, lastFlingAura = nil, 0, 0, 0
    local ragdollOn, sitSpam, lastFollow, lastSit, lastJump = false, false, 0, 0, 0

    local function getChar()
        local char = LocalPlayer.Character
        return char, char and char:FindFirstChild("HumanoidRootPart"), char and char:FindFirstChildOfClass("Humanoid")
    end

    local function nearestTarget()
        local _, root = getChar()
        if not root then return nil end
        local best, bestD = nil, math.huge
        for _, plr in ipairs(Players:GetPlayers()) do
            if plr ~= LocalPlayer then
                local r = plr.Character and plr.Character:FindFirstChild("HumanoidRootPart")
                local h = plr.Character and plr.Character:FindFirstChildOfClass("Humanoid")
                if r and h and h.Health > 0 then
                    local d = (r.Position - root.Position).Magnitude
                    if d < bestD then best, bestD = r, d end
                end
            end
        end
        return best
    end

    local function findCoin()
        local char, root = getChar()
        if not root then return nil end
        local best, bestD = nil, math.huge
        for _, d in ipairs(ItemCache.scan()) do
            if not d:IsDescendantOf(char) then
                local n = string.lower(d.Name)
                if string.find(n, "coin") or string.find(n, "cash") or string.find(n, "gem") or string.find(n, "money") or string.find(n, "diamond") then
                    local dist = (d.Position - root.Position).Magnitude
                    if dist < bestD then best, bestD = d, dist end
                end
            end
        end
        return best
    end

    local function equipKnife()
        local char, _, hum = getChar()
        if not char or not hum then return nil end
        local knife = CE.findKnife(char)
        if not knife then
            local bp = LocalPlayer:FindFirstChildOfClass("Backpack")
            knife = CE.findKnife(bp)
            if knife then
                local ok = pcall(function() hum:EquipTool(knife) end)
                if not ok then pcall(function() knife.Parent = char end) end
            end
        end
        return knife
    end

    local function findGun(container)
        if not container then return nil end
        for _, tool in ipairs(container:GetChildren()) do
            if tool:IsA("Tool") then
                local n = string.lower(tool.Name)
                if string.find(n, "gun", 1, true) or string.find(n, "revolver", 1, true) or string.find(n, "pistol", 1, true) or string.find(n, "sheriff", 1, true) then
                    return tool
                end
            end
        end
    end

    local function equipGun()
        local char, _, hum = getChar()
        if not char or not hum then return nil end
        local gun = findGun(char)
        if not gun then
            local bp = LocalPlayer:FindFirstChildOfClass("Backpack")
            gun = findGun(bp)
            if gun then
                local ok = pcall(function() hum:EquipTool(gun) end)
                if not ok then pcall(function() gun.Parent = char end) end
            end
        end
        return gun
    end

    local function flingRoot(r)
        pcall(function()
            r.AssemblyLinearVelocity = r.AssemblyLinearVelocity + Vector3.new(math.random(-140, 140), math.random(380, 560), math.random(-140, 140))
            r.AssemblyAngularVelocity = r.AssemblyAngularVelocity + Vector3.new(math.random(-8, 8), math.random(-8, 8), math.random(-8, 8))
        end)
    end

    local function flingNearest()
        local char, root = getChar()
        if not root then return end
        local best, bestD = nil, math.huge
        for _, plr in ipairs(Players:GetPlayers()) do
            if plr ~= LocalPlayer then
                local r = plr.Character and plr.Character:FindFirstChild("HumanoidRootPart")
                local h = plr.Character and plr.Character:FindFirstChildOfClass("Humanoid")
                if r and h and h.Health > 0 then
                    local d = (r.Position - root.Position).Magnitude
                    if d < bestD then best, bestD = r, d end
                end
            end
        end
        if best then
            flingRoot(best)
            toast("flung nearest player")
        else
            toast("no player found")
        end
    end

    local function flingAll()
        local _, root = getChar()
        if not root then return end
        local count = 0
        for _, plr in ipairs(Players:GetPlayers()) do
            if plr ~= LocalPlayer then
                local r = plr.Character and plr.Character:FindFirstChild("HumanoidRootPart")
                local h = plr.Character and plr.Character:FindFirstChildOfClass("Humanoid")
                if r and h and h.Health > 0 then
                    flingRoot(r)
                    count = count + 1
                end
            end
        end
        toast(count > 0 and ("flung " .. count .. " players") or "no players found")
    end

    local function dance()
        local _, _, hum = getChar()
        if not hum then return end
        local emotes = {"dance", "dance2", "dance3", "cheer", "wave", "laugh", "point"}
        danceIndex = danceIndex % #emotes + 1
        pcall(function() hum:PlayEmote(emotes[danceIndex]) end)
    end

    local function randomTp()
        local _, root = getChar()
        if not root then return end
        local list = {}
        for _, plr in ipairs(Players:GetPlayers()) do
            if plr ~= LocalPlayer then
                local r = plr.Character and plr.Character:FindFirstChild("HumanoidRootPart")
                local h = plr.Character and plr.Character:FindFirstChildOfClass("Humanoid")
                if r and h and h.Health > 0 then table.insert(list, r) end
            end
        end
        if #list == 0 then toast("no player found"); return end
        local target = list[math.random(1, #list)]
        root.CFrame = CFrame.new(target.Position + Vector3.new(math.random(-5, 5), 3, math.random(-5, 5)))
        toast("teleported to random player")
    end

    local function tpAll()
        local _, root = getChar()
        if not root then return end
        local count = 0
        for _, plr in ipairs(Players:GetPlayers()) do
            if plr ~= LocalPlayer then
                local r = plr.Character and plr.Character:FindFirstChild("HumanoidRootPart")
                local h = plr.Character and plr.Character:FindFirstChildOfClass("Humanoid")
                if r and h and h.Health > 0 then
                    pcall(function()
                        r.CFrame = CFrame.new(root.Position + Vector3.new(math.random(-6, 6), 3, math.random(-6, 6)))
                    end)
                    count = count + 1
                end
            end
        end
        toast(count > 0 and ("teleported " .. count .. " players") or "no players found")
    end

    local function flingSelf()
        local _, root = getChar()
        if not root then return end
        pcall(function()
            root.AssemblyLinearVelocity = root.AssemblyLinearVelocity + Vector3.new(math.random(-120, 120), math.random(420, 620), math.random(-120, 120))
            root.AssemblyAngularVelocity = root.AssemblyAngularVelocity + Vector3.new(math.random(-20, 20), math.random(-20, 20), math.random(-20, 20))
        end)
        toast("flung yourself")
    end

    local function tpCoin()
        local char, root = getChar()
        local best = findCoin()
        if best and root then
            root.CFrame = CFrame.new(best.Position + Vector3.new(0, 3, 0))
            toast("teleported to " .. best.Name)
        else
            toast("no coin found")
        end
    end

    local function tpNearest()
        local char, root = getChar()
        if not root then return end
        local best, bestD = nil, math.huge
        for _, plr in ipairs(Players:GetPlayers()) do
            if plr ~= LocalPlayer then
                local r = plr.Character and plr.Character:FindFirstChild("HumanoidRootPart")
                local h = plr.Character and plr.Character:FindFirstChildOfClass("Humanoid")
                if r and h and h.Health > 0 then
                    local d = (r.Position - root.Position).Magnitude
                    if d < bestD then best, bestD = r, d end
                end
            end
        end
        if best then
            root.CFrame = CFrame.new(best.Position + Vector3.new(0, 3, 0))
            toast("teleported to nearest player")
        else
            toast("no player found")
        end
    end

    local function saveChar()
        local char = LocalPlayer.Character
        if not char then return end
        savedColors = savedColors or {}
        savedTrans = savedTrans or {}
        for _, p in ipairs(char:GetDescendants()) do
            if p:IsA("BasePart") and savedColors[p] == nil then
                savedColors[p] = p.Color
                savedTrans[p] = p.Transparency
            end
        end
    end

    local function restoreChar()
        if savedColors then
            for p, c in pairs(savedColors) do
                if p.Parent then p.Color = c end
            end
            savedColors = nil
        end
        if savedTrans then
            for p, v in pairs(savedTrans) do
                if p.Parent then p.Transparency = v end
            end
            savedTrans = nil
        end
    end

    local function ensureTrail()
        local char, root = getChar()
        if not root then return end
        if trail and trail.trail.Parent then return end
        local a0 = Instance.new("Attachment")
        a0.Position = Vector3.new(-0.45, 0, 0)
        a0.Parent = root
        local a1 = Instance.new("Attachment")
        a1.Position = Vector3.new(0.45, 0, 0)
        a1.Parent = root
        local tr = Instance.new("Trail")
        tr.Attachment0 = a0
        tr.Attachment1 = a1
        tr.Lifetime = 0.65
        tr.MinLength = 0.1
        tr.WidthScale = NumberSequence.new({NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(1, 0)})
        tr.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, accent()), ColorSequenceKeypoint.new(1, accent():Lerp(Color3.fromRGB(255, 255, 255), 0.7))})
        tr.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0.15), NumberSequenceKeypoint.new(1, 1)})
        tr.LightEmission = 0.7
        tr.FaceCamera = true
        tr.Parent = root
        trail = {trail = tr, a0 = a0, a1 = a1}
    end

    local function clearTrail()
        if trail then
            pcall(function() trail.trail:Destroy() end)
            pcall(function() trail.a0:Destroy() end)
            pcall(function() trail.a1:Destroy() end)
            trail = nil
        end
    end

    local clickParams = RaycastParams.new()
    clickParams.FilterType = Enum.RaycastFilterType.Exclude
    clickParams.IgnoreWater = true
    conn(UIS.InputBegan:Connect(function(input, gp)
        if gp or S.MenuOpen or not S.ClickTP or Drone.active then return end
        if input.UserInputType ~= Enum.UserInputType.MouseButton1 and input.UserInputType ~= Enum.UserInputType.Touch then return end
        local char = LocalPlayer.Character
        local root = char and char:FindFirstChild("HumanoidRootPart")
        if not root then return end
        clickParams.FilterDescendantsInstances = {char}
        local pos = input.Position
        local ray = Camera:ViewportPointToRay(pos.X, pos.Y)
        local hit = Workspace:Raycast(ray.Origin, ray.Direction * 2000, clickParams)
        if hit then
            root.CFrame = CFrame.new(hit.Position + Vector3.new(0, 3, 0))
            click()
        end
    end))

    conn(RunService.Heartbeat:Connect(function(dt)
        if Unloaded then return end
        local char, root, hum = getChar()
        local now = os.clock()
        if S.TrollSpin and not S.TrollRagdoll and root and hum then
            if spinAuto == nil then spinAuto = hum.AutoRotate; hum.AutoRotate = false end
            root.CFrame = CFrame.new(root.Position) * CFrame.Angles(0, os.clock() * (S.TrollSpinSpeed or 12), 0)
        elseif spinAuto ~= nil then
            if hum then hum.AutoRotate = spinAuto end
            spinAuto = nil
        end
        if S.TrollRagdoll and hum then
            if not ragdollOn then
                ragdollOn = true
                pcall(function() hum.PlatformStand = true end)
                pcall(function() hum:ChangeState(Enum.HumanoidStateType.Physics) end)
                if root then pcall(function() root.AssemblyAngularVelocity = Vector3.new(6, 10, 4) end) end
            end
        elseif ragdollOn then
            ragdollOn = false
            if hum then
                pcall(function() hum:ChangeState(Enum.HumanoidStateType.GettingUp) end)
                pcall(function() hum.PlatformStand = false end)
            end
            if root then pcall(function() root.AssemblyAngularVelocity = Vector3.zero end) end
        end
        if not S.TrollRagdoll then
            if S.TrollOrbit and root then
                local target = nearestTarget()
                if target then
                    local a = os.clock() * (S.TrollOrbitSpeed or 0.8) * math.pi * 2
                    local pos = target.Position + Vector3.new(math.cos(a) * S.TrollOrbitRadius, 3, math.sin(a) * S.TrollOrbitRadius)
                    root.CFrame = CFrame.lookAt(pos, target.Position)
                end
            elseif S.TrollFollow and root and now - lastFollow > 0.25 then
                lastFollow = now
                local target = nearestTarget()
                if target then
                    local a = os.clock() * 1.6
                    root.CFrame = CFrame.new(target.Position + Vector3.new(math.cos(a) * 4, 0, math.sin(a) * 4))
                end
            end
        end
        if S.TrollSit and hum then
            sitSpam = true
            if now - lastSit > 0.35 then
                lastSit = now
                pcall(function() hum.Sit = not hum.Sit end)
            end
        elseif sitSpam then
            sitSpam = false
            if hum then pcall(function() hum.Sit = false end) end
        end
        if S.TrollJump and hum and now - lastJump > 0.22 then
            lastJump = now
            pcall(function() hum.Jump = true end)
        end
        if S.TrollDance and hum and now - lastDance > 1.8 then
            lastDance = now
            dance()
        end
        if S.TrollFlingAura and root and now - lastFlingAura > 0.35 then
            lastFlingAura = now
            for _, plr in ipairs(Players:GetPlayers()) do
                if plr ~= LocalPlayer then
                    local r = plr.Character and plr.Character:FindFirstChild("HumanoidRootPart")
                    local h = plr.Character and plr.Character:FindFirstChildOfClass("Humanoid")
                    if r and h and h.Health > 0 and (r.Position - root.Position).Magnitude <= S.TrollFlingRadius then
                        flingRoot(r)
                    end
                end
            end
        end
        if S.MM2AutoEquip and now - lastEquip > 1 then
            lastEquip = now
            if char and hum and not CE.findKnife(char) then equipKnife() end
        end
        if S.MM2AutoGun and now - lastGun > 1 then
            lastGun = now
            if char and hum and not findGun(char) then equipGun() end
        end
        if S.MM2KnifeAura and root and now - lastAura > 0.15 then
            lastAura = now
            local knife = CE.findKnife(char)
            if not knife and hum then knife = equipKnife() end
            if knife then
                for _, plr in ipairs(Players:GetPlayers()) do
                    if plr ~= LocalPlayer then
                        local tchar = plr.Character
                        local thum = tchar and tchar:FindFirstChildOfClass("Humanoid")
                        local troot = tchar and tchar:FindFirstChild("HumanoidRootPart")
                        if thum and thum.Health > 0 and troot and (troot.Position - root.Position).Magnitude <= S.MM2AuraRange then
                            CE.knifeTouch(troot)
                        end
                    end
                end
            end
        end
        if S.Rainbow or S.Invisible then
            saveChar()
            local t = os.clock()
            if char then
                for _, p in ipairs(char:GetDescendants()) do
                    if p:IsA("BasePart") then
                        if S.Rainbow then
                            local h = (t * 0.16 + p.Position.Y * 0.03 + p.Position.X * 0.01) % 1
                            p.Color = Color3.fromHSV(h, 0.82, 1)
                        end
                        if S.Invisible then p.Transparency = 1 end
                    end
                end
            end
        elseif savedColors or savedTrans then
            restoreChar()
        end
        if S.GlowTrail then
            ensureTrail()
        elseif trail then
            clearTrail()
        end
    end))

    local function stop()
        S.MM2AutoEquip, S.MM2AutoGun, S.MM2KnifeAura = false, false, false
        S.Rainbow, S.GlowTrail, S.Invisible, S.ClickTP = false, false, false, false
        S.TrollSpin, S.TrollDance, S.TrollFlingAura = false, false, false
        S.TrollFollow, S.TrollOrbit, S.TrollSit, S.TrollJump, S.TrollRagdoll = false, false, false, false, false
        local _, _, hum = getChar()
        if spinAuto ~= nil then
            if hum then hum.AutoRotate = spinAuto end
            spinAuto = nil
        end
        if ragdollOn then
            ragdollOn = false
            if hum then
                pcall(function() hum:ChangeState(Enum.HumanoidStateType.GettingUp) end)
                pcall(function() hum.PlatformStand = false end)
            end
        end
        if sitSpam then
            sitSpam = false
            if hum then pcall(function() hum.Sit = false end) end
        end
        restoreChar()
        clearTrail()
    end

    return {equip = equipKnife, equipGun = equipGun, tpCoin = tpCoin, tpNearest = tpNearest, fling = flingNearest,
        flingAll = flingAll, dance = dance, randomTp = randomTp, tpAll = tpAll, flingSelf = flingSelf, stop = stop}
end)()


local Flick = (function()
    local target, targetPart, targetPos, targetChar, targetPlayer, targetOffset
    local highlight
    local rotAuto, rotBaseYaw, rotHum, spinYaw = nil, 0, nil, 0
    local bulletHandler, bulletOriginal, bulletWrapper, bulletReady = nil, nil, nil, false
    local recoilHandler, recoilOriginal, recoilWrapper, recoilReady = nil, nil, nil, false
    local signalFolder, autoHeld, nextShot, lastReload = nil, false, 0, 0
    local lastScan = 0
    local ray = RaycastParams.new()
    ray.FilterType = Enum.RaycastFilterType.Exclude
    ray.IgnoreWater = true
    local tracerRay = RaycastParams.new()
    tracerRay.FilterType = Enum.RaycastFilterType.Exclude
    tracerRay.IgnoreWater = true
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local SPEED = 110 * 20.224489795918366

    local function getLocal()
        local char = LocalPlayer.Character
        return char, char and char:FindFirstChild("HumanoidRootPart"), char and char:FindFirstChildOfClass("Humanoid")
    end

    local function getTool()
        local char = getLocal()
        return char and char:FindFirstChildWhichIsA("Tool")
    end

    local function hitboxes(mode)
        if mode == "Head" then return {"Head"} end
        if mode == "Body" then return {"UpperTorso", "Torso", "HumanoidRootPart", "LowerTorso"} end
        return {"Head", "UpperTorso", "Torso", "HumanoidRootPart", "LowerTorso",
            "LeftUpperArm", "RightUpperArm", "Left Arm", "Right Arm", "LeftUpperLeg", "RightUpperLeg"}
    end

    local function offsets(part)
        if not S.FlickMultipoint then return {Vector3.zero} end
        local s = part.Size
        return {Vector3.zero,
            Vector3.new(s.X * 0.25, 0, 0), Vector3.new(-s.X * 0.25, 0, 0),
            Vector3.new(0, s.Y * 0.25, 0), Vector3.new(0, -s.Y * 0.25, 0),
            Vector3.new(0, 0, s.Z * 0.25), Vector3.new(0, 0, -s.Z * 0.25)}
    end

    local function enemy(plr, char, hum)
        if plr == LocalPlayer or not char or not hum or hum.Health <= 0 then return false end
        local team = plr.Team
        if team and team.Name == "Lobby" then return false end
        if S.FlickTeamCheck and not plr.Neutral and not LocalPlayer.Neutral and team and team == LocalPlayer.Team then return false end
        if S.FlickSpawnProtect and char:FindFirstChildWhichIsA("ForceField", true) then return false end
        return true
    end

    local function visible(char, pos)
        if not S.FlickWallCheck then return true end
        local me = LocalPlayer.Character
        local filter = {}
        if me then table.insert(filter, me) end
        if char then table.insert(filter, char) end
        ray.FilterDescendantsInstances = filter
        local ok, result = pcall(function() return Workspace:Raycast(Camera.CFrame.Position, pos - Camera.CFrame.Position, ray) end)
        return (not ok) or result == nil or (result.Instance and result.Instance:IsDescendantOf(char))
    end

    local function score(angle, dist, health, partName)
        local value
        if S.FlickPriority == "Distance" then
            value = dist / math.max(S.FlickMaxDist, 1) * 100
        elseif S.FlickPriority == "Health" then
            value = health + angle * 0.2
        else
            value = angle + dist / math.max(S.FlickMaxDist, 1) * 8
        end
        if partName == "Head" then value = value - 3
        elseif partName == "HumanoidRootPart" or partName == "Torso" or partName == "UpperTorso" then value = value - 1
        else value = value + 4 end
        return value
    end

    local function scan()
        local origin = Camera.CFrame.Position
        local look = Camera.CFrame.LookVector
        local tool = getTool()
        local force = tool and tonumber(tool:GetAttribute("Force"))
        local speed = force and force > 0 and force * 20.224489795918366 or SPEED
        local latency = (S.FlickLatency or 0) / 1000
        local maxTime = S.FlickMaxPrediction or 0.8
        local best, bestScore = nil, math.huge
        for _, plr in ipairs(Players:GetPlayers()) do
            local char = plr.Character
            local hum = char and char:FindFirstChildOfClass("Humanoid")
            local root = char and char:FindFirstChild("HumanoidRootPart")
            if enemy(plr, char, hum) and root then
                local dist = (root.Position - origin).Magnitude
                if dist <= S.FlickMaxDist then
                    for _, name in ipairs(hitboxes(S.FlickHitbox)) do
                        local part = char:FindFirstChild(name)
                        if part and part:IsA("BasePart") then
                            for _, offset in ipairs(offsets(part)) do
                                local pos = part.Position + part.CFrame:VectorToWorldSpace(offset)
                                local travel = latency
                                if S.FlickPrediction then
                                    travel = math.clamp(dist / speed, 0, maxTime) + latency
                                    pos = pos + root.AssemblyLinearVelocity * travel
                                end
                                if S.FlickGravity and travel > 0 then
                                    pos = pos + Vector3.new(0, 0.5 * Workspace.Gravity * travel * travel, 0)
                                end
                                local delta = pos - origin
                                if delta.Magnitude > 0.05 then
                                    local angle = math.deg(math.acos(clamp(look:Dot(delta.Unit), -1, 1)))
                                    if angle <= (S.FlickFOV or 160) * 0.5 and visible(char, pos) then
                                        local value = score(angle, dist, hum.Health, name)
                                        if value < bestScore then
                                            bestScore = value
                                            best = {part = part, char = char, player = plr, pos = pos, offset = offset}
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
        return best
    end

    local function setTarget(value)
        target = value
        targetPart = value and value.part or nil
        targetChar = value and value.char or nil
        targetPlayer = value and value.player or nil
        targetPos = value and value.pos or nil
        targetOffset = value and value.offset or nil
    end

    local function ensureHighlight()
        if highlight then return end
        local parent = LocalPlayer:FindFirstChild("PlayerGui")
        if not parent then return end
        highlight = Instance.new("Highlight")
        highlight.Name = "HamerFlickTarget"
        highlight.FillColor = accent()
        highlight.OutlineColor = accent()
        highlight.FillTransparency = 0.72
        highlight.OutlineTransparency = 0.05
        highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
        highlight.Enabled = false
        highlight.Parent = parent
    end

    local function updateHighlight()
        if not S.Flick or not S.FlickHighlight or not targetChar or not targetChar.Parent then
            if highlight then
                highlight.Enabled = false
                highlight.Adornee = nil
            end
            return
        end
        ensureHighlight()
        if highlight then
            highlight.Adornee = targetChar
            highlight.Enabled = true
        end
    end

    local function getSignals()
        if signalFolder and signalFolder.Parent then return signalFolder end
        local manager = ReplicatedStorage:FindFirstChild("SignalManager")
        signalFolder = manager and manager:FindFirstChild("SignalEvents")
        return signalFolder
    end

    local function fire(name, state)
        local folder = getSignals()
        local event = folder and folder:FindFirstChild(name)
        if event and event:IsA("BindableEvent") then
            pcall(function() event:Fire(state) end)
            return true
        end
        return false
    end

    local function release()
        if autoHeld then
            autoHeld = false
            fire("FireWeapon", Enum.UserInputState.End)
        end
    end

    local function tracer()
        if not S.FlickTracers then return end
        local origin = Camera.CFrame.Position
        local direction = Camera.CFrame.LookVector * 800
        local me = LocalPlayer.Character
        tracerRay.FilterDescendantsInstances = me and {me} or {}
        local hit = Workspace:Raycast(origin, direction, tracerRay)
        local point = hit and hit.Position or (origin + direction)
        local length = (point - origin).Magnitude
        if length < 1 then return end
        local part = Instance.new("Part")
        part.Name = "HamerFlickTracer"
        part.Anchored = true
        part.CanCollide = false
        part.CanQuery = false
        part.CanTouch = false
        part.Material = Enum.Material.Neon
        part.Color = S.FlickTracerColor or Color3.fromRGB(178, 112, 255)
        part.Transparency = 0.15
        part.Size = Vector3.new(0.08, 0.08, length)
        part.CFrame = CFrame.lookAt(origin + (point - origin) / 2, point)
        part.Parent = Workspace
        task.delay(0.55, function()
            if part.Parent then part:Destroy() end
        end)
    end

    local function ammoState()
        local playerGui = LocalPlayer:FindFirstChild("PlayerGui")
        local overlay = playerGui and playerGui:FindFirstChild("GunOverlay")
        local screen = overlay and overlay:FindFirstChild("ScreenSize")
        local ammo = screen and screen:FindFirstChild("AmmoFrame")
        local bar = ammo and ammo:FindFirstChild("BarCon")
        local text = bar and bar:FindFirstChild("TextLabel")
        local reload = screen and screen:FindFirstChild("Reload")
        return text and tonumber(text.Text), reload and reload.Visible == true
    end

    local function updateReload()
        if not S.Flick or not S.FlickAutoReload then return end
        local ammo, reloading = ammoState()
        if ammo == 0 and not reloading and os.clock() - lastReload > 0.5 then
            if fire("ReloadWeapon") then lastReload = os.clock() end
        end
    end

    local function updateAutoFire()
        local now = os.clock()
        if not S.Flick or not S.FlickAutoFire or not target or S.MenuOpen then
            release()
            return
        end
        local tool = getTool()
        if not tool then
            release()
            return
        end
        local ammo, reloading = ammoState()
        if ammo ~= nil and (ammo == 0 or reloading) then
            release()
            return
        end
        if now < nextShot then return end
        local interval = math.clamp(tonumber(tool:GetAttribute("FireRate")) or 0.15, 0.04, 1)
        nextShot = now + interval
        if not autoHeld then
            if fire("FireWeapon", Enum.UserInputState.Begin) then
                autoHeld = true
                tracer()
            end
        else
            tracer()
            fire("FireWeapon", Enum.UserInputState.End)
            fire("FireWeapon", Enum.UserInputState.Begin)
        end
    end

    local function updateAim(dt)
        if not S.Flick then
            setTarget(nil)
            return
        end
        local now = os.clock()
        if now - lastScan >= 1 / (S.FlickScanHz or 25) or not target then
            lastScan = now
            setTarget(scan())
        end
        if target and (not targetPart or not targetPart.Parent or not targetChar or not targetChar.Parent) then
            setTarget(nil)
        end
        if target and S.FlickAimMode == "Camera" then
            local goal = CFrame.new(Camera.CFrame.Position, targetPos)
            local smooth = tonumber(S.FlickSmooth) or 0
            if smooth <= 0 then
                Camera.CFrame = goal
            else
                Camera.CFrame = Camera.CFrame:Lerp(goal, clamp(dt * (30 / (smooth + 1)), 0.02, 1))
            end
        end
    end

    local function updateRotation(dt)
        local char, root, hum = getLocal()
        local active = S.Flick and (S.FlickSpinbot or S.FlickJitter) and not S.TrollSpin and not S.TrollRagdoll and not S.MenuOpen
        if active and root and hum then
            if rotAuto == nil or rotHum ~= hum then
                if rotHum and rotAuto ~= nil then pcall(function() rotHum.AutoRotate = rotAuto end) end
                rotAuto = hum.AutoRotate
                rotHum = hum
                spinYaw = 0
                rotBaseYaw = math.atan2(-root.CFrame.LookVector.X, -root.CFrame.LookVector.Z)
                hum.AutoRotate = false
            end
            local yaw = rotBaseYaw
            if S.FlickSpinbot then
                local direction = S.FlickSpinDir == "Counterclockwise" and -1 or 1
                spinYaw = spinYaw + direction * math.rad(S.FlickSpinSpeed or 360) * dt
                yaw = yaw + spinYaw
            end
            if S.FlickJitter then
                yaw = yaw + math.sin(os.clock() * math.pi * 2 * (S.FlickJitterHz or 8)) * math.rad(S.FlickJitterAngle or 60)
            end
            root.CFrame = CFrame.new(root.Position) * CFrame.Angles(0, yaw, 0)
        elseif rotAuto ~= nil then
            if rotHum then pcall(function() rotHum.AutoRotate = rotAuto end) end
            rotAuto, rotHum, spinYaw = nil, nil, 0
        end
    end

    local function updateCircle()
        if not S.Flick then return end
        UI.fovCircle.Visible = S.FlickShowFov == true
        if not S.FlickShowFov then return end
        local vp = Camera.ViewportSize
        local half = math.rad(clamp((S.FlickFOV or 160) * 0.5, 0.1, 89))
        local pixels = math.tan(half) / math.tan(math.rad(Camera.FieldOfView * 0.5)) * vp.Y * 0.5
        UI.fovCircle.Size = UDim2.fromOffset(pixels * 2, pixels * 2)
    end

    local function ensureRecoilHook()
        if recoilReady then return true end
        if game.PlaceId ~= 136801880565837 then return false end
        local modules = ReplicatedStorage:FindFirstChild("ModuleScripts")
        local guns = modules and modules:FindFirstChild("GunModules")
        local framework = guns and guns:FindFirstChild("GunFramework")
        local cameraHandler = framework and framework:FindFirstChild("CameraHandler")
        if not cameraHandler then return false end
        local ok, handler = pcall(require, cameraHandler)
        if not ok or type(handler) ~= "table" or type(handler.accelerate) ~= "function" then return false end
        if type(table.isfrozen) == "function" and table.isfrozen(handler) then return false end
        recoilHandler = handler
        recoilOriginal = handler.accelerate
        recoilWrapper = function(self, damping, speed, axes, tag, ...)
            if S.Flick and S.FlickNoRecoil and tag == "gun_recoil" then return end
            return recoilOriginal(self, damping, speed, axes, tag, ...)
        end
        local hooked = pcall(function() handler.accelerate = recoilWrapper end)
        if not hooked then
            recoilHandler, recoilOriginal, recoilWrapper = nil, nil, nil
            return false
        end
        recoilReady = true
        return true
    end

    local function ensureBulletHook()
        if bulletReady then return true end
        if game.PlaceId ~= 136801880565837 then return false end
        local modules = ReplicatedStorage:FindFirstChild("ModuleScripts")
        local guns = modules and modules:FindFirstChild("GunModules")
        local bullet = guns and guns:FindFirstChild("BulletHandler")
        if not bullet then return false end
        local ok, handler = pcall(require, bullet)
        if not ok or type(handler) ~= "table" or type(handler.Fire) ~= "function" then return false end
        if type(table.isfrozen) == "function" and table.isfrozen(handler) then return false end
        bulletHandler = handler
        bulletOriginal = handler.Fire
        bulletWrapper = function(payload, ...)
            if S.Flick and S.FlickAimMode == "Silent" and targetPos and type(payload) == "table"
                and typeof(payload.Origin) == "Vector3" then
                local okCopy, copy = pcall(function()
                    local value = {}
                    for k, v in pairs(payload) do value[k] = v end
                    local delta = targetPos - payload.Origin
                    if delta.Magnitude < 0.05 then return payload end
                    value.Direction = delta.Unit
                    if type(value.Misc) == "table" then
                        local misc = {}
                        for k, v in pairs(value.Misc) do misc[k] = v end
                        misc.CamCFrame = CFrame.lookAt(payload.Origin, targetPos)
                        value.Misc = misc
                    end
                    return value
                end)
                if okCopy and copy then payload = copy end
            end
            return bulletOriginal(payload, ...)
        end
        local hooked = pcall(function() handler.Fire = bulletWrapper end)
        if not hooked then
            bulletHandler, bulletOriginal, bulletWrapper = nil, nil, nil
            return false
        end
        bulletReady = true
        return true
    end

    local function clear()
        setTarget(nil)
        release()
        if highlight then
            highlight.Enabled = false
            highlight.Adornee = nil
        end
    end

    local function enable()
        S.Flick = true
        task.spawn(function()
            for _ = 1, 30 do
                if Unloaded then return end
                if ensureBulletHook() and ensureRecoilHook() then break end
                task.wait(1)
            end
        end)
    end

    local function disable()
        S.Flick = false
        clear()
    end

    local function stop()
        S.Flick = false
        clear()
        if bulletHandler and bulletOriginal and bulletHandler.Fire == bulletWrapper then
            pcall(function() bulletHandler.Fire = bulletOriginal end)
        end
        if recoilHandler and recoilOriginal and recoilHandler.accelerate == recoilWrapper then
            pcall(function() recoilHandler.accelerate = recoilOriginal end)
        end
        bulletHandler, bulletOriginal, bulletWrapper, bulletReady = nil, nil, nil, false
        recoilHandler, recoilOriginal, recoilWrapper, recoilReady = nil, nil, nil, false
        if rotAuto ~= nil then
            if rotHum then pcall(function() rotHum.AutoRotate = rotAuto end) end
            rotAuto, rotHum, spinYaw = nil, nil, 0
        end
        if highlight then
            highlight:Destroy()
            highlight = nil
        end
    end

    conn(UIS.InputBegan:Connect(function(input, gp)
        if gp or S.MenuOpen or not S.Flick or not S.FlickTracers then return end
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            tracer()
        end
    end))

    conn(RunService.RenderStepped:Connect(function(dt)
        if Unloaded then return end
        updateAim(dt)
        updateRotation(dt)
        updateCircle()
        updateHighlight()
        updateReload()
        updateAutoFire()
    end))

    local function initSilent()
        task.spawn(function()
            for _ = 1, 30 do
                if Unloaded then return end
                if ensureBulletHook() then
                    toast("flick: silent adapter ready")
                    return
                end
                task.wait(1)
            end
            if not Unloaded then toast("flick: silent adapter not found") end
        end)
    end

    return {enable = enable, disable = disable, clear = clear, stop = stop, initSilent = initSilent}
end)()

builders.flick = function()
    moduleRow("Ragebot", "Flick", function()
        choiceRow("Aim mode", "FlickAimMode", {"Camera", "Silent"}, function(v)
            if v == "Silent" then Flick.initSilent() end
        end)
        toggleRow("Auto fire", "FlickAutoFire")
        toggleRow("No recoil", "FlickNoRecoil")
        toggleRow("Auto reload", "FlickAutoReload")
        toggleRow("Spawn protection", "FlickSpawnProtect")
        toggleRow("Team check", "FlickTeamCheck")
        toggleRow("Wall check", "FlickWallCheck")
        actionRow("Prepare silent adapter", "Resolve FPS Flick bullet modules.", Flick.initSilent)
    end, function(v)
        if v then Flick.enable() else Flick.disable() end
    end)
    moduleRow("Targeting", nil, function()
        stepRow("FOV", "FlickFOV", 2, 360, 2, "°")
        stepRow("Max distance", "FlickMaxDist", 20, 800, 10, " st")
        choiceRow("Priority", "FlickPriority", {"Crosshair", "Distance", "Health"})
        choiceRow("Hitbox", "FlickHitbox", {"Adaptive", "Head", "Body"})
        toggleRow("Multipoint", "FlickMultipoint")
        toggleRow("Prediction", "FlickPrediction")
        stepRow("Extra latency", "FlickLatency", 0, 200, 5, " ms")
        stepRow("Max prediction", "FlickMaxPrediction", 0.1, 3, 0.1, " s")
        toggleRow("Gravity compensation", "FlickGravity")
        stepRow("Smoothing", "FlickSmooth", 0, 20, 1, "")
        stepRow("Scan rate", "FlickScanHz", 5, 60, 5, " Hz")
    end)
    moduleRow("Visuals", nil, function()
        toggleRow("Player ESP", "ESP")
        toggleRow("Names", "ESPNames")
        toggleRow("Distance", "ESPDist")
        toggleRow("Health bar", "ESPHealth")
        toggleRow("Target highlight", "FlickHighlight")
        toggleRow("FOV circle", "FlickShowFov")
        toggleRow("Bullet tracers", "FlickTracers")
        colorRow("Tracer color", "FlickTracerColor")
    end)
    moduleRow("Character", nil, function()
        toggleRow("Spinbot", "FlickSpinbot")
        stepRow("Spin speed", "FlickSpinSpeed", 30, 1440, 30, "°/s")
        choiceRow("Direction", "FlickSpinDir", {"Clockwise", "Counterclockwise"})
        toggleRow("Jitter", "FlickJitter")
        stepRow("Jitter angle", "FlickJitterAngle", 0, 180, 5, "°")
        stepRow("Jitter rate", "FlickJitterHz", 1, 30, 1, " Hz")
    end)
    actionRow("Clear target", "Drop the current ragebot target.", Flick.clear)
end

builders.combat = function()
    moduleRow("Speed", "Speed", function()
        stepRow("Walk speed", "SpeedValue", 16, 200, 4, "")
    end)
    moduleRow("Jump power", "Jump", function()
        stepRow("Jump value", "JumpValue", 50, 300, 10, "")
    end)
    moduleRow("Infinite jump", "InfJump")
    moduleRow("Fly", "Fly", function()
        stepRow("Fly speed", "FlySpeed", 10, 200, 5, "")
    end)
    moduleRow("Noclip", "Noclip")
    moduleRow("Aimbot", "Aimbot", function()
        stepRow("FOV", "AimbotFOV", 40, 400, 10, " px")
        stepRow("Smooth", "AimbotSmooth", 0, 0.9, 0.05, "")
    end)
    moduleRow("Silent Aim", "SilentAim", function()
        stepRow("FOV", "SilentAimFOV", 20, 600, 10, " px")
        stepRow("Max distance", "SilentAimMaxDist", 50, 2000, 50, " st")
        stepRow("Prediction", "SilentAimPredict", 0, 500, 10, " ms")
        toggleRow("Wallbang", "SilentAimWallbang")
    end, CE.setSilentAim)
    moduleRow("Hitbox expander", "Hitbox", function()
        stepRow("Hitbox size", "HitboxSize", 2, 30, 1, "")
    end)
    moduleRow("Auto collect", "AutoCollect")
    moduleRow("Coin Farm (MM2)", "CoinFarm", function()
        toggleRow("Noclip", "FarmNoClip")
        toggleRow("Under map", "FarmUnderMap")
        stepRow("Speed", "FarmSpeed", 10, 300, 10, "")
    end)
    moduleRow("Kill All (MM2)", "KillAll", nil, CE.setKillAll)
    moduleRow("Anti AFK", "AntiAfk", nil, setAntiAfk)
    actionRow("Kamikaze Drone", "Fly to nearest player and explode.", function()
        if Drone.active then stopDrone() else startDrone() end
    end)
    moduleRow("Drone settings", nil, function()
        stepRow("Camera", "DroneView", 1, 2, 1, "", function(v)
            if v ~= 1 and v ~= 2 then S.DroneView = 1 end
        end)
        toggleRow("Manual control", "DroneManual", function(v)
            if Drone.active then
                if v then
                    droneLookFromCamera()
                    createDroneControls()
                else
                    destroyDroneControls()
                end
            end
        end)
        stepRow("Manual speed", "DroneSpeed", 15, 120, 5, "")
    end)
end

builders.mm2 = function()
    moduleRow("Auto equip knife", "MM2AutoEquip")
    moduleRow("Auto equip gun", "MM2AutoGun")
    moduleRow("Knife aura", "MM2KnifeAura", function()
        stepRow("Range", "MM2AuraRange", 5, 30, 1, " st")
    end)
    actionRow("Equip knife now", "Move your knife into your hand.", Extras.equip)
    actionRow("Teleport to nearest coin", "Jump to the closest MM2 coin.", Extras.tpCoin)
end

builders.fun = function()
    moduleRow("Rainbow avatar", "Rainbow")
    moduleRow("Glow trail", "GlowTrail")
    moduleRow("Invisible", "Invisible")
    moduleRow("Click teleport", "ClickTP")
    moduleRow("Troll", nil, function()
        toggleRow("Spin", "TrollSpin")
        stepRow("Spin speed", "TrollSpinSpeed", 2, 40, 1, " rad/s")
        toggleRow("Auto dance", "TrollDance")
        toggleRow("Fling aura", "TrollFlingAura")
        stepRow("Aura radius", "TrollFlingRadius", 6, 40, 1, " st")
        actionRow("Fling all players", "Launch every player in the server.", Extras.flingAll)
        actionRow("Dance now", "Play a random emote.", Extras.dance)
    end)
    moduleRow("Troll+", nil, function()
        toggleRow("Follow nearest", "TrollFollow")
        toggleRow("Orbit nearest", "TrollOrbit")
        stepRow("Orbit speed", "TrollOrbitSpeed", 0.2, 3, 0.1, " rev/s")
        stepRow("Orbit radius", "TrollOrbitRadius", 4, 30, 1, " st")
        toggleRow("Sit spam", "TrollSit")
        toggleRow("Jump spam", "TrollJump")
        toggleRow("Ragdoll self", "TrollRagdoll")
        actionRow("Random teleport", "Teleport to a random player.", Extras.randomTp)
        actionRow("Teleport all to me", "Pull every player to your position.", Extras.tpAll)
        actionRow("Fling self", "Launch yourself into the sky.", Extras.flingSelf)
    end)
    actionRow("Teleport to nearest player", "Jump next to the closest player.", Extras.tpNearest)
    actionRow("Fling nearest player", "Launch the closest player into the sky.", Extras.fling)
end

builders.visual = function()
    moduleRow("Fog", "Fog", function()
        stepRow("Fog density", "FogDensity", 0, 1, 0.05, "", applyFog)
    end, applyFog)
    moduleRow("Fullbright", "Fullbright", nil, applyFullbright)
    moduleRow("Motion Blur", "MotionBlur", function()
        stepRow("Blur strength", "MotionBlurStrength", 0, 56, 2, "")
    end)
    moduleRow("World Color", "World", function()
        stepRow("Saturation", "WorldSaturation", -1, 1, 0.1, "", applyWorld)
        stepRow("Contrast", "WorldContrast", -1, 1, 0.1, "", applyWorld)
    end, applyWorld)
    moduleRow("Shaders", nil, function()
        actionRow("Neon", "Bright bloom and cool tint.", function()
            Shaders.apply("neon")
            toast("shader: neon")
        end)
        actionRow("Cinematic", "Warm contrast, bloom and depth of field.", function()
            Shaders.apply("cinematic")
            toast("shader: cinematic")
        end)
        actionRow("Horror", "Desaturated dark look with heavy haze.", function()
            Shaders.apply("horror")
            toast("shader: horror")
        end)
        actionRow("Anime", "Punchy colors and soft glow.", function()
            Shaders.apply("anime")
            toast("shader: anime")
        end)
        actionRow("Vaporwave", "Pink haze, bloom and blur.", function()
            Shaders.apply("vaporwave")
            toast("shader: vaporwave")
        end)
        actionRow("Retro", "Warm faded film look.", function()
            Shaders.apply("retro")
            toast("shader: retro")
        end)
        stepRow("Intensity", "ShaderIntensity", 0, 2, 0.1, "", function()
            Shaders.apply(S.Shader)
        end)
        actionRow("Disable shader", "Remove every post-processing effect.", function()
            Shaders.apply("off")
            toast("shader: off")
        end)
    end)
    moduleRow("Aspect Ratio", "Aspect", function()
        stepRow("Aspect value", "AspectValue", 0.5, 1.5, 0.05, "")
    end)
    moduleRow("ESP 2D", "ESP", function()
        toggleRow("Show names", "ESPNames")
        toggleRow("Show distance", "ESPDist")
        toggleRow("Role colors", "ESPRole")
        toggleRow("Corner box", "ESPCorners")
        toggleRow("Health bar", "ESPHealth")
        toggleRow("Head circle", "ESPHeadDot")
        toggleRow("Skeleton", "ESPSkeleton")
        toggleRow("Tracer", "ESPTracer")
        toggleRow("Chams", "ESPChams")
        toggleRow("Chams through walls", "ESPChamsThrough")
        toggleRow("Visibility check", "ESPVisCheck")
        toggleRow("Offscreen arrows", "ESPOffscreen")
        toggleRow("Tool info", "ESPTool")
        toggleRow("Item ESP", "ESPItems")
        stepRow("Max distance", "ESPMaxDist", 50, 2000, 50, " st")
        stepRow("Box thickness", "ESPThickness", 0.5, 5, 0.5, "")
        colorRow("Custom color", "ESPColor")
        colorRow("Murderer color", "ESPMurdererColor")
        colorRow("Sheriff color", "ESPSheriffColor")
        colorRow("Hero color", "ESPHeroColor")
        colorRow("Innocent color", "ESPInnocentColor")
        colorRow("Item color", "ESPItemColor")
    end)
end
local Cosmetics = (function()
local function gradColor(c1, c2, f)
    f = tonumber(f) or 0
    if f < 0 then f = 0 elseif f > 1 then f = 1 end
    return c1:Lerp(c2, f)
end
local function itemGlow(name)
    return S[name .. "Glow"] ~= false
end
local function cosmeticRoot(name)
    local model = Instance.new("Model")
    model.Name = name
    model.Archivable = false
    model.Parent = Workspace
    pcall(function()
        local hl = Instance.new("Highlight")
        hl.Name = "HamerCullingGuard"
        hl.Adornee = model
        hl.FillTransparency = 1
        hl.OutlineTransparency = 1
        hl.Parent = model
    end)
    return model
end

local function neonPart(parent, shape, size, color, glow)
    local p = Instance.new("Part")
    p.Shape = shape
    p.Size = size
    p.Anchored = true
    p.CanCollide = false
    p.CanQuery = false
    p.CanTouch = false
    p.CastShadow = false
    p.Massless = true
    if glow then
        p.Material = Enum.Material.Neon
    else
        p.Material = Enum.Material.SmoothPlastic
    end
    p.Color = color
    p.Parent = parent
    return p
end

local Dong = {model = nil, conn = nil}
local function applyDong()
    if Dong.conn then Dong.conn:Disconnect(); Dong.conn = nil end
    if Dong.model then Dong.model:Destroy(); Dong.model = nil end
    if not S.Dong then return end
    local char = LocalPlayer.Character
    local root = char and char:FindFirstChild("HumanoidRootPart")
    if not root then return end
    local s = S.DongSize
    local c1 = S.DongColor
    local c2 = S.DongHeadColor
    local glow = S.DongGlow
    local model = cosmeticRoot("HamerDong")
    Dong.model = model
    local ballL = neonPart(model, Enum.PartType.Ball, Vector3.new(0.56 * s, 0.56 * s, 0.56 * s), c1, glow)
    local ballR = neonPart(model, Enum.PartType.Ball, Vector3.new(0.56 * s, 0.56 * s, 0.56 * s), c1, glow)
    local len = 1.25 * s
    local segCount = 6
    local segLen = len / segCount
    local shaft = {}
    for i = 1, segCount do
        local f = (i - 1) / (segCount - 1) * 0.82
        local radius = 0.5 * s * (1 - (i - 1) * 0.025)
        shaft[i] = neonPart(model, Enum.PartType.Cylinder, Vector3.new(segLen + 0.012, radius, radius), gradColor(c1, c2, f), glow)
    end
    local head = neonPart(model, Enum.PartType.Ball, Vector3.new(0.62 * s, 0.62 * s, 0.62 * s), c2, glow)
    local t = 0
    Dong.conn = RunService.RenderStepped:Connect(function(dt)
        if not S.Dong or not model.Parent then return end
        local c = LocalPlayer.Character
        local r = c and c:FindFirstChild("HumanoidRootPart")
        if not r then return end
        t = t + dt
        local sway = math.sin(t * 2.2) * 0.08
        local bob = math.sin(t * 3.0) * 0.03
        local cf = r.CFrame * CFrame.new(0, bob, 0)
        local off = CFrame.new(0, -0.62 * s, -0.5 * s)
        ballL.CFrame = cf * off * CFrame.new(-0.28 * s, 0, 0)
        ballR.CFrame = cf * off * CFrame.new(0.28 * s, 0, 0)
        for i = 1, segCount do
            local z = -(i - 0.5) * segLen
            shaft[i].CFrame = cf * off * CFrame.new(0, 0, z) * CFrame.Angles(0, math.rad(90), 0) * CFrame.Angles(0, 0, sway)
        end
        head.CFrame = cf * off * CFrame.new(0, 0, -len) * CFrame.Angles(0, 0, sway)
    end)
end

local Fox = {model = nil, conn = nil}
local function applyFox()
    if Fox.conn then Fox.conn:Disconnect(); Fox.conn = nil end
    if Fox.model then Fox.model:Destroy(); Fox.model = nil end
    if not S.Fox then return end
    local char = LocalPlayer.Character
    local root = char and char:FindFirstChild("HumanoidRootPart")
    if not root then return end
    local sc = S.FoxSize or 1
    local c1 = S.FoxColor1
    local c2 = S.FoxColor2
    local glow = itemGlow("Fox")
    local dark = Color3.fromRGB(38, 30, 26)
    local pink = gradColor(c1, c2, 0.82)
    local model = cosmeticRoot("HamerFox")
    Fox.model = model
    local parts = {}
    local function add(shape, size, color, pos, rot, tail)
        local p = neonPart(model, shape, Vector3.new(size.X * sc, size.Y * sc, size.Z * sc), color, glow)
        local off = CFrame.new(pos.X * sc, pos.Y * sc, pos.Z * sc)
        if rot then off = off * rot end
        table.insert(parts, {p = p, off = off, tail = tail or 0})
    end
    add(Enum.PartType.Ball, Vector3.new(0.5, 0.42, 0.72), gradColor(c1, c2, 0.18), Vector3.new(0, 0, 0))
    add(Enum.PartType.Block, Vector3.new(0.3, 0.24, 0.18), c2, Vector3.new(0, -0.04, -0.35))
    add(Enum.PartType.Ball, Vector3.new(0.46, 0.44, 0.46), gradColor(c1, c2, 0.3), Vector3.new(0, 0.27, -0.36))
    add(Enum.PartType.Block, Vector3.new(0.24, 0.16, 0.24), c2, Vector3.new(0, 0.18, -0.59))
    add(Enum.PartType.Ball, Vector3.new(0.09, 0.08, 0.09), dark, Vector3.new(0, 0.2, -0.72))
    add(Enum.PartType.Ball, Vector3.new(0.075, 0.085, 0.075), dark, Vector3.new(-0.11, 0.34, -0.55))
    add(Enum.PartType.Ball, Vector3.new(0.075, 0.085, 0.075), dark, Vector3.new(0.11, 0.34, -0.55))
    add(Enum.PartType.Ball, Vector3.new(0.025, 0.025, 0.025), c2, Vector3.new(-0.09, 0.37, -0.57))
    add(Enum.PartType.Ball, Vector3.new(0.025, 0.025, 0.025), c2, Vector3.new(0.09, 0.37, -0.57))
    add(Enum.PartType.Block, Vector3.new(0.16, 0.26, 0.08), gradColor(c1, c2, 0.72), Vector3.new(-0.14, 0.52, -0.33), CFrame.Angles(0, 0, math.rad(16)))
    add(Enum.PartType.Block, Vector3.new(0.16, 0.26, 0.08), gradColor(c1, c2, 0.72), Vector3.new(0.14, 0.52, -0.33), CFrame.Angles(0, 0, math.rad(-16)))
    add(Enum.PartType.Block, Vector3.new(0.1, 0.16, 0.03), pink, Vector3.new(-0.14, 0.5, -0.37), CFrame.Angles(0, 0, math.rad(16)))
    add(Enum.PartType.Block, Vector3.new(0.1, 0.16, 0.03), pink, Vector3.new(0.14, 0.5, -0.37), CFrame.Angles(0, 0, math.rad(-16)))
    add(Enum.PartType.Block, Vector3.new(0.13, 0.17, 0.3), c1, Vector3.new(-0.16, -0.27, -0.2))
    add(Enum.PartType.Block, Vector3.new(0.13, 0.17, 0.3), c1, Vector3.new(0.16, -0.27, -0.2))
    add(Enum.PartType.Block, Vector3.new(0.12, 0.08, 0.12), dark, Vector3.new(-0.16, -0.36, -0.31))
    add(Enum.PartType.Block, Vector3.new(0.12, 0.08, 0.12), dark, Vector3.new(0.16, -0.36, -0.31))
    add(Enum.PartType.Block, Vector3.new(0.19, 0.19, 0.5), gradColor(c1, c2, 0.48), Vector3.new(0, 0.08, 0.5), CFrame.Angles(math.rad(30), 0, 0), 1)
    add(Enum.PartType.Block, Vector3.new(0.16, 0.16, 0.36), gradColor(c1, c2, 0.7), Vector3.new(0, 0.18, 0.79), CFrame.Angles(math.rad(20), 0, 0), 2)
    add(Enum.PartType.Ball, Vector3.new(0.18, 0.18, 0.18), c2, Vector3.new(0, 0.27, 0.97), nil, 3)
    local t = 0
    Fox.conn = RunService.RenderStepped:Connect(function(dt)
        if not S.Fox or not model.Parent then return end
        local c = LocalPlayer.Character
        local r = c and c:FindFirstChild("HumanoidRootPart")
        if not r then return end
        t = t + dt
        local bob = math.sin(t * 2.6) * 0.025
        local sway = math.sin(t * 1.8) * math.rad(2)
        local base = r.CFrame * CFrame.new(0.9, 1.02 + bob, -0.02) * CFrame.Angles(0, math.rad(-8), sway)
        for _, e in ipairs(parts) do
            if e.tail > 0 then
                local wag = math.sin(t * 4.2 - e.tail * 0.7) * math.rad(8 + e.tail * 3)
                e.p.CFrame = base * e.off * CFrame.Angles(0, wag, 0)
            else
                e.p.CFrame = base * e.off
            end
        end
    end)
end

local Wings = {model = nil, conn = nil}
local function applyWings()
    if Wings.conn then Wings.conn:Disconnect(); Wings.conn = nil end
    if Wings.model then Wings.model:Destroy(); Wings.model = nil end
    if not S.Wings then return end
    local char = LocalPlayer.Character
    local root = char and char:FindFirstChild("HumanoidRootPart")
    if not root then return end
    local c1 = S.WingsColor1
    local c2 = S.WingsColor2
    local glow = itemGlow("Wings")
    local model = cosmeticRoot("HamerWings")
    Wings.model = model
    local parts = {}
    local function buildWing(sign)
        for i = 1, 12 do
            local t = (i - 1) / 11
            local x = 0.55 + t * 2.65
            local topY = 2.06 + math.sin(t * math.pi) * 0.36 - t * 0.58
            local h = 1.25 + (1 - t) * 0.78
            local rot = 5 + t * 16
            for row = 1, 3 do
                local v = (row - 1) / 2
                local p = neonPart(model, Enum.PartType.Block, Vector3.new(0.4, h / 3 + 0.15, 0.12), gradColor(c1, c2, 0.08 + v * 0.58 + t * 0.34), glow)
                table.insert(parts, {p = p, sign = sign, x = x, y = topY - h * (row - 0.5) / 3, rot = rot, z = 0.46 + (row - 1) * 0.035})
            end
            local bone = neonPart(model, Enum.PartType.Block, Vector3.new(0.44, 0.13, 0.16), gradColor(c1, c2, 0.24 + t * 0.36), glow)
            table.insert(parts, {p = bone, sign = sign, x = x, y = topY, rot = rot, z = 0.45})
        end
        for i = 1, 6 do
            local t = 0.48 + (i - 1) / 5 * 0.52
            local x = 0.55 + t * 2.65
            local topY = 2.06 + math.sin(t * math.pi) * 0.36 - t * 0.58
            local h = 1.25 + (1 - t) * 0.78
            local len = 0.72 + (1 - t) * 0.5
            local p = neonPart(model, Enum.PartType.Block, Vector3.new(0.23, len, 0.11), gradColor(c1, c2, 0.58 + t * 0.24), glow)
            table.insert(parts, {p = p, sign = sign, x = x, y = topY - h - len * 0.32, rot = 9 + t * 28, z = 0.48})
        end
        local joint = neonPart(model, Enum.PartType.Ball, Vector3.new(0.36, 0.36, 0.36), gradColor(c1, c2, 0.2), glow)
        table.insert(parts, {p = joint, sign = sign, x = 0.55, y = 1.95, rot = 0, z = 0.45})
    end
    buildWing(-1)
    buildWing(1)
    local t = 0
    Wings.conn = RunService.RenderStepped:Connect(function(dt)
        if not S.Wings or not model.Parent then return end
        local ch = LocalPlayer.Character
        local r = ch and ch:FindFirstChild("HumanoidRootPart")
        if not r then return end
        t = t + dt
        local flap = math.sin(t * 3.0) * math.rad(23)
        for _, e in ipairs(parts) do
            if e.p.Parent then
                local pivot = r.CFrame * CFrame.new(e.sign * 0.55, 1.95, 0.45) * CFrame.Angles(0, 0, flap * e.sign)
                local off = CFrame.new(e.sign * (e.x - 0.55), e.y - 1.95, e.z - 0.45) * CFrame.Angles(0, math.rad(e.sign * 4), math.rad(e.sign * e.rot))
                e.p.CFrame = pivot * off
            end
        end
    end)
end

local Halo = {model = nil, conn = nil}
local function applyHalo()
    if Halo.conn then Halo.conn:Disconnect(); Halo.conn = nil end
    if Halo.model then Halo.model:Destroy(); Halo.model = nil end
    if not S.Halo then return end
    local char = LocalPlayer.Character
    if not char or not char:FindFirstChild("Head") then return end
    local c1 = S.HaloColor1
    local c2 = S.HaloColor2
    local glow = itemGlow("Halo")
    local model = cosmeticRoot("HamerHalo")
    Halo.model = model
    local balls = {}
    for i = 1, 40 do
        local a = (i - 1) / 40 * math.pi * 2
        local p = neonPart(model, Enum.PartType.Ball, Vector3.new(0.16, 0.16, 0.16), gradColor(c1, c2, (math.sin(a) + 1) * 0.5), glow)
        if i == 1 and glow then
            local light = Instance.new("PointLight")
            light.Color = c1
            light.Range = 8
            light.Brightness = 2
            light.Parent = p
        end
        table.insert(balls, {p = p, a = a})
    end
    local t = 0
    Halo.conn = RunService.RenderStepped:Connect(function(dt)
        if not S.Halo or not model.Parent then return end
        local ch = LocalPlayer.Character
        local h = ch and ch:FindFirstChild("Head")
        if not h then return end
        t = t + dt
        local bob = math.sin(t * 1.8) * 0.05
        for _, e in ipairs(balls) do
            local a = e.a + t * 1.35
            local s = 0.16 + math.sin(t * 4 + e.a * 3) * 0.025
            e.p.Size = Vector3.new(s, s, s)
            e.p.CFrame = h.CFrame * CFrame.new(math.cos(a) * 0.96, 1.16 + bob + math.sin(a * 4 + t * 2) * 0.025, math.sin(a) * 0.96)
        end
    end)
end

local ChinaHat = {model = nil, conn = nil}
local function applyChinaHat()
    if ChinaHat.conn then ChinaHat.conn:Disconnect(); ChinaHat.conn = nil end
    if ChinaHat.model then ChinaHat.model:Destroy(); ChinaHat.model = nil end
    if not S.ChinaHat then return end
    local char = LocalPlayer.Character
    if not char or not char:FindFirstChild("Head") then return end
    local c1 = S.ChinaHatColor1
    local c2 = S.ChinaHatColor2
    local glow = itemGlow("ChinaHat")
    local model = cosmeticRoot("HamerChinaHat")
    ChinaHat.model = model
    local brim = neonPart(model, Enum.PartType.Cylinder, Vector3.new(0.09, 3.05, 3.05), c1, glow)
    local band = neonPart(model, Enum.PartType.Cylinder, Vector3.new(0.12, 2.78, 2.78), gradColor(c1, c2, 0.14), glow)
    local rings = {}
    for i = 1, 28 do
        local t = i / 28
        local d = 2.68 * (1 - t) + 0.1 * t
        local p = neonPart(model, Enum.PartType.Cylinder, Vector3.new(0.065, d, d), gradColor(c1, c2, 0.16 + t * 0.84), glow)
        table.insert(rings, {p = p, y = 0.24 + t * 1.3})
    end
    local top = neonPart(model, Enum.PartType.Ball, Vector3.new(0.18, 0.18, 0.18), c2, glow)
    if glow then
        local light = Instance.new("PointLight")
        light.Color = c2
        light.Range = 7
        light.Brightness = 1.8
        light.Parent = top
    end
    local tassel = {}
    for i = 1, 5 do
        tassel[i] = neonPart(model, Enum.PartType.Ball, Vector3.new(0.1 - i * 0.012, 0.1 - i * 0.012, 0.1 - i * 0.012), gradColor(c1, c2, 0.3 + i * 0.12), glow)
    end
    local t = 0
    ChinaHat.conn = RunService.RenderStepped:Connect(function(dt)
        if not S.ChinaHat or not model.Parent then return end
        local ch = LocalPlayer.Character
        local h = ch and ch:FindFirstChild("Head")
        if not h then return end
        t = t + dt
        local bob = math.sin(t * 2) * 0.02
        local sway = math.sin(t * 2.4) * 0.03
        local base = h.CFrame * CFrame.new(0, 0.6 + bob, 0) * CFrame.Angles(sway, 0, 0)
        brim.CFrame = base * CFrame.Angles(0, 0, math.rad(90))
        band.CFrame = base * CFrame.new(0, 0.16, 0) * CFrame.Angles(0, 0, math.rad(90))
        for _, e in ipairs(rings) do
            e.p.CFrame = base * CFrame.new(0, e.y, 0) * CFrame.Angles(0, 0, math.rad(90))
        end
        local tip = base * CFrame.new(0, 1.58, 0)
        top.CFrame = tip
        for i, p in ipairs(tassel) do
            p.CFrame = tip * CFrame.new(math.sin(t * 3 + i * 0.5) * 0.035 * i, -0.16 - i * 0.12, math.cos(t * 3 + i * 0.5) * 0.035 * i)
        end
    end)
end

local KG = {model = nil, conn = nil, t = 0, blend = 0}
local function applyKagune()
    if KG.conn then KG.conn:Disconnect(); KG.conn = nil end
    if KG.model then KG.model:Destroy(); KG.model = nil end
    if not S.Kagune then return end
    local char = LocalPlayer.Character
    local root = char and char:FindFirstChild("HumanoidRootPart")
    if not root then return end
    local model = cosmeticRoot("HamerKagune")
    KG.model = model
    local c1 = S.KaguneColor1
    local c2 = S.KaguneColor2
    local glow = itemGlow("Kagune")
    local parts = {}
    for sx = -1, 1, 2 do
        for sy = -1, 1, 2 do
            for i = 1, 26 do
                local t = (i - 1) / 25
                local s = 0.36 * (1 - t * 0.58)
                local p = Instance.new("Part")
                p.Shape = Enum.PartType.Ball
                p.Size = Vector3.new(s, s, s)
                p.Color = gradColor(c1, c2, t)
                p.Material = glow and Enum.Material.Neon or Enum.Material.SmoothPlastic
                p.Anchored = true
                p.CanCollide = false
                p.CanQuery = false
                p.CanTouch = false
                p.CastShadow = false
                p.TopSurface = Enum.SurfaceType.Smooth
                p.BottomSurface = Enum.SurfaceType.Smooth
                p.Parent = model
                p:SetAttribute("x", (0.5 + t * 2.0) * sx)
                p:SetAttribute("y", (0.38 + t * 1.45) * sy)
                p:SetAttribute("z", 0.4 - math.max(0, (t - 0.4) / 0.6) * 1.7)
                p:SetAttribute("t", t)
                p:SetAttribute("si", i)
                p:SetAttribute("us", sy)
                if i == 26 and glow then
                    local light = Instance.new("PointLight")
                    light.Color = c2
                    light.Range = 5
                    light.Brightness = 1.6
                    light.Parent = p
                end
                table.insert(parts, p)
            end
        end
    end
    KG.t = 0
    KG.blend = 0
    KG.conn = RunService.RenderStepped:Connect(function(dt)
        if not S.Kagune or not model.Parent then return end
        local c = LocalPlayer.Character
        local r = c and c:FindFirstChild("HumanoidRootPart")
        if not r then return end
        local hum = c:FindFirstChildOfClass("Humanoid")
        KG.t = KG.t + dt
        local walking = hum and hum.MoveDirection.Magnitude > 0.1
        KG.blend = KG.blend + ((walking and 1 or 0) - KG.blend) * math.min(dt * 4, 1)
        local idle = math.sin(KG.t * 2.1) * 0.18
        local walk = math.sin(KG.t * 7) * 0.3
        for _, p in ipairs(parts) do
            if p.Parent then
                local t = p:GetAttribute("t")
                local us = p:GetAttribute("us")
                local fo = idle * (1 - KG.blend) + (walk + math.sin(KG.t * 7 - p:GetAttribute("si") * 0.4) * 0.2) * KG.blend
                local off = Vector3.new(
                    p:GetAttribute("x") + math.sin(KG.t * 2.4 + t * 3) * 0.08 * t,
                    p:GetAttribute("y") + fo * us * t * 0.38,
                    p:GetAttribute("z") + math.cos(KG.t * 2.6 + t * 2) * 0.08 * t
                )
                p.CFrame = r.CFrame * CFrame.new(off) * CFrame.Angles(0, 0, math.rad(us * 36) + fo * us * 0.2) * CFrame.Angles(t * 1.1, 0, 0)
            end
        end
    end)
end

local CMP = {model = nil, conn = nil, t = 0, pos = nil}
local function applyCompanion()
    if CMP.conn then CMP.conn:Disconnect(); CMP.conn = nil end
    if CMP.model then CMP.model:Destroy(); CMP.model = nil end
    if not S.Companion then return end
    local char = LocalPlayer.Character
    if not char or not char:FindFirstChild("HumanoidRootPart") then return end
    local c1 = S.CompanionColor1
    local c2 = S.CompanionColor2
    local glow = itemGlow("Companion")
    local model = cosmeticRoot("HamerCompanion")
    CMP.model = model
    local core = neonPart(model, Enum.PartType.Ball, Vector3.new(0.34, 0.34, 0.34), c2, glow)
    core.Transparency = 0.08
    if glow then
        local light = Instance.new("PointLight")
        light.Color = c1
        light.Range = 8
        light.Brightness = 2
        light.Parent = core
    end
    local r1, r2, mini = {}, {}, {}
    for i = 1, 16 do
        local a = (i - 1) / 16 * math.pi * 2
        r1[i] = {p = neonPart(model, Enum.PartType.Ball, Vector3.new(0.075, 0.075, 0.075), gradColor(c1, c2, (math.sin(a) + 1) * 0.5), glow), a = a}
        r2[i] = {p = neonPart(model, Enum.PartType.Ball, Vector3.new(0.065, 0.065, 0.065), gradColor(c2, c1, 0.35), glow), a = a}
    end
    for i = 1, 3 do
        mini[i] = {p = neonPart(model, Enum.PartType.Ball, Vector3.new(0.11, 0.11, 0.11), c1, glow), a = i * math.pi * 2 / 3}
    end
    CMP.t, CMP.pos = 0, nil
    CMP.conn = RunService.RenderStepped:Connect(function(dt)
        if not S.Companion or not model.Parent then return end
        local c = LocalPlayer.Character
        local r = c and c:FindFirstChild("HumanoidRootPart")
        if not r then return end
        CMP.t = CMP.t + dt
        local t = CMP.t
        local bob = math.sin(t * 2.5) * 0.15
        local sway = math.sin(t * 1.8) * 0.2
        local target = r.Position + r.CFrame.LookVector * (2.5 + sway) + r.CFrame.RightVector * 2.0 + r.CFrame.UpVector * (1.2 + bob)
        CMP.pos = CMP.pos and CMP.pos:Lerp(target, math.min(dt * 8, 1)) or target
        local base = CFrame.new(CMP.pos) * CFrame.Angles(math.sin(t * 2) * 0.2, t * 1.7, math.sin(t * 2) * 0.1)
        local cs = 0.34 + math.sin(t * 4) * 0.05
        core.Size = Vector3.new(cs, cs, cs)
        core.CFrame = base
        core.Transparency = 0.06 + math.sin(t * 4) * 0.08
        local spin1 = base * CFrame.Angles(0, 0, t * 1.6)
        local spin2 = base * CFrame.Angles(t * 1.9, 0, 0)
        for _, e in ipairs(r1) do
            e.p.CFrame = spin1 * CFrame.new(math.cos(e.a) * 0.52, math.sin(e.a) * 0.52, 0)
        end
        for _, e in ipairs(r2) do
            e.p.CFrame = spin2 * CFrame.new(math.cos(e.a) * 0.58, 0, math.sin(e.a) * 0.58)
        end
        for i, e in ipairs(mini) do
            local a = e.a + t * (1.2 + i * 0.2)
            e.p.CFrame = base * CFrame.new(math.cos(a) * 0.95, math.sin(t * 2 + i) * 0.3, math.sin(a) * 0.95)
        end
    end)
end

local Cos = (function()
local function cosmeticModel(name)
    local model = cosmeticRoot(name)
    return model
end

local function deco(parent, shape, size, color, material, glow, transparency)
    local p = neonPart(parent, shape, size, color, glow)
    if material then
        if glow then
            p.Material = material
        else
            p.Material = Enum.Material.SmoothPlastic
        end
    end
    if transparency then p.Transparency = transparency end
    return p
end

local Aura = {model = nil, conn = nil}
local function applyAura()
    if Aura.conn then Aura.conn:Disconnect(); Aura.conn = nil end
    if Aura.model then Aura.model:Destroy(); Aura.model = nil end
    if not S.Aura then return end
    local char = LocalPlayer.Character
    local root = char and char:FindFirstChild("HumanoidRootPart")
    if not root then return end
    local c1 = S.AuraColor1
    local c2 = S.AuraColor2
    local glow = itemGlow("Aura")
    local model = cosmeticModel("HamerAura")
    Aura.model = model
    local vortex = {}
    for i = 1, 80 do
        local a = i * 2.399
        local rad = 0.85 + (i % 7) / 6 * 1.35
        local baseY = 0.15 + (i * 0.37 % 1) * 1.9
        local s = 0.09 + (i * 0.13 % 1) * 0.1
        local col = gradColor(c2, c1, baseY / 2.05)
        local p = deco(model, Enum.PartType.Ball, Vector3.new(s, s, s), col, Enum.Material.Neon, glow, 0.05 + (i % 4) * 0.035)
        table.insert(vortex, {p = p, a = a, rad = rad, baseY = baseY, speed = 0.55 + (i % 5) * 0.19, amp = 0.1 + (i % 3) * 0.07, freq = 1.1 + (i % 4) * 0.32, size = s})
    end
    local halo = {}
    for i = 1, 32 do
        local s = 0.075 + (i % 4) * 0.012
        local a = (i - 1) / 32 * math.pi * 2
        local p = deco(model, Enum.PartType.Ball, Vector3.new(s, s, s), gradColor(c1, c2, (math.sin(a) + 1) * 0.5), Enum.Material.Neon, glow, 0.04)
        table.insert(halo, {p = p, a = a, size = s})
    end
    local embers = {}
    for i = 1, 12 do
        local s = 0.1 + (i % 3) * 0.03
        local p = deco(model, Enum.PartType.Ball, Vector3.new(s, s, s), gradColor(c1, c2, (i % 5) / 5), Enum.Material.Neon, glow, 0.02)
        table.insert(embers, {p = p, a = i * 0.9, rad = 2.55 + (i % 4) * 0.12, y = 0.45 + (i % 5) * 0.34, speed = 0.8 + (i % 3) * 0.2, size = s})
    end
    local core = deco(model, Enum.PartType.Ball, Vector3.new(0.38, 0.38, 0.38), c2, Enum.Material.Neon, glow, 0.68)
    if glow then
        local light = Instance.new("PointLight")
        light.Color = c1
        light.Range = 9
        light.Brightness = 1.8
        light.Parent = core
    end
    local t = 0
    Aura.conn = RunService.RenderStepped:Connect(function(dt)
        if not S.Aura or not model.Parent then return end
        local ch = LocalPlayer.Character
        local r = ch and ch:FindFirstChild("HumanoidRootPart")
        if not r then return end
        t = t + dt
        for _, e in ipairs(vortex) do
            local a = e.a + t * e.speed
            local y = e.baseY + math.sin(t * e.freq + e.a) * e.amp
            local s = e.size * (1 + math.sin(t * 3.2 + e.a * 2) * 0.24)
            e.p.Size = Vector3.new(s, s, s)
            e.p.CFrame = r.CFrame * CFrame.new(math.cos(a) * e.rad, y, math.sin(a) * e.rad)
        end
        for _, e in ipairs(halo) do
            local a = e.a + t * 0.32
            e.p.CFrame = r.CFrame * CFrame.new(math.cos(a) * 2.42, 0.08 + math.sin(t * 2 + e.a) * 0.03, math.sin(a) * 2.42)
        end
        for i, e in ipairs(embers) do
            local a = e.a + t * e.speed
            local s = e.size * (1 + math.sin(t * 3.6 + i) * 0.22)
            e.p.Size = Vector3.new(s, s, s)
            e.p.CFrame = r.CFrame * CFrame.new(math.cos(a) * e.rad, e.y + math.sin(t * 1.8 + i) * 0.22, math.sin(a) * e.rad)
        end
        core.CFrame = r.CFrame * CFrame.new(0, 1.05 + math.sin(t * 2) * 0.04, 0)
        core.Transparency = 0.64 + math.sin(t * 4) * 0.08
    end)
end

local Crown = {model = nil, conn = nil}
local function applyCrown()
    if Crown.conn then Crown.conn:Disconnect(); Crown.conn = nil end
    if Crown.model then Crown.model:Destroy(); Crown.model = nil end
    if not S.Crown then return end
    local char = LocalPlayer.Character
    local head = char and char:FindFirstChild("Head")
    if not head then return end
    local c1 = S.CrownColor1
    local c2 = S.CrownColor2
    local glow = itemGlow("Crown")
    local model = cosmeticModel("HamerCrown")
    Crown.model = model
    local bands = {}
    for i = 1, 16 do
        bands[i] = {p = deco(model, Enum.PartType.Block, Vector3.new(0.12, 0.2, 0.3), c1, Enum.Material.Neon, glow, 0.02), a = (i - 1) / 16 * math.pi * 2}
    end
    local trims = {}
    for i = 1, 16 do
        trims[i] = {p = deco(model, Enum.PartType.Block, Vector3.new(0.1, 0.07, 0.24), gradColor(c1, c2, 0.32), Enum.Material.Neon, glow, 0.12), a = (i - 1) / 16 * math.pi * 2}
    end
    local spikes = {}
    for i = 1, 8 do
        local a = (i - 1) / 8 * math.pi * 2
        spikes[i] = {
            a = a,
            base = deco(model, Enum.PartType.Block, Vector3.new(0.2, 0.32, 0.16), gradColor(c1, c2, 0.22), Enum.Material.Neon, glow, 0.02),
            mid = deco(model, Enum.PartType.Block, Vector3.new(0.13, 0.22, 0.12), gradColor(c1, c2, 0.66), Enum.Material.Neon, glow, 0.02),
            tip = deco(model, Enum.PartType.Ball, Vector3.new(0.1, 0.1, 0.1), c2, Enum.Material.Neon, glow, 0.02)
        }
    end
    local bezel = deco(model, Enum.PartType.Cylinder, Vector3.new(0.08, 0.3, 0.3), c2, Enum.Material.Neon, glow, 0.02)
    local gem = deco(model, Enum.PartType.Ball, Vector3.new(0.19, 0.19, 0.2), c2, Enum.Material.Neon, glow, 0.02)
    if glow then
        local light = Instance.new("PointLight")
        light.Color = c2
        light.Range = 6
        light.Brightness = 2
        light.Parent = gem
    end
    local t = 0
    Crown.conn = RunService.RenderStepped:Connect(function(dt)
        if not S.Crown or not model.Parent then return end
        local ch = LocalPlayer.Character
        local h = ch and ch:FindFirstChild("Head")
        if not h then return end
        t = t + dt
        local hc = h.CFrame * CFrame.new(0, 0.93 + math.sin(t * 2) * 0.035, 0)
        for _, e in ipairs(bands) do
            e.p.CFrame = hc * CFrame.new(math.cos(e.a) * 0.53, 0, math.sin(e.a) * 0.53) * CFrame.Angles(0, -e.a, 0)
        end
        for _, e in ipairs(trims) do
            e.p.CFrame = hc * CFrame.new(math.cos(e.a) * 0.535, 0.14, math.sin(e.a) * 0.535) * CFrame.Angles(0, -e.a, 0)
        end
        for _, e in ipairs(spikes) do
            local cf = hc * CFrame.new(math.cos(e.a) * 0.53, 0.25, math.sin(e.a) * 0.53) * CFrame.Angles(0, -e.a, 0)
            e.base.CFrame = cf
            e.mid.CFrame = cf * CFrame.new(0, 0.23, 0)
            e.tip.CFrame = cf * CFrame.new(0, 0.38, 0)
        end
        bezel.CFrame = hc * CFrame.new(0, 0, -0.56) * CFrame.Angles(0, math.rad(90), 0)
        gem.CFrame = hc * CFrame.new(0, 0, -0.6)
        gem.Transparency = 0.02 + math.sin(t * 4) * 0.06
    end)
end

local Horns = {model = nil, conn = nil}
local function applyHorns()
    if Horns.conn then Horns.conn:Disconnect(); Horns.conn = nil end
    if Horns.model then Horns.model:Destroy(); Horns.model = nil end
    if not S.Horns then return end
    local char = LocalPlayer.Character
    local head = char and char:FindFirstChild("Head")
    if not head then return end
    local c1 = S.HornsColor1
    local c2 = S.HornsColor2
    local glow = itemGlow("Horns")
    local model = cosmeticModel("HamerHorns")
    Horns.model = model
    local bases = {}
    local parts = {}
    for sign = -1, 1, 2 do
        bases[sign] = deco(model, Enum.PartType.Ball, Vector3.new(0.3, 0.28, 0.3), c1:Lerp(Color3.fromRGB(34, 24, 28), 0.72), Enum.Material.SmoothPlastic, glow, 0.02)
        for i = 1, 16 do
            local t = (i - 1) / 15
            local s = 0.27 * (1 - t * 0.68)
            local p = deco(model, Enum.PartType.Ball, Vector3.new(s, s, s), gradColor(c1, c2, t), Enum.Material.Neon, glow, 0.02)
            if i == 16 and glow then
                local light = Instance.new("PointLight")
                light.Color = c2
                light.Range = 5
                light.Brightness = 1.6
                light.Parent = p
            end
            parts[#parts + 1] = {p = p, sign = sign, t = t}
        end
    end
    local t = 0
    Horns.conn = RunService.RenderStepped:Connect(function(dt)
        if not S.Horns or not model.Parent then return end
        local ch = LocalPlayer.Character
        local h = ch and ch:FindFirstChild("Head")
        if not h then return end
        t = t + dt
        local hc = h.CFrame
        for sign, p in pairs(bases) do
            local pulse = 1 + math.sin(t * 3 + sign) * 0.03
            p.Size = Vector3.new(0.3 * pulse, 0.28 * pulse, 0.3 * pulse)
            p.CFrame = hc * CFrame.new(sign * 0.3, 0.58, -0.02)
        end
        for _, e in ipairs(parts) do
            local sign = e.sign
            local f = e.t
            local x = sign * (0.3 + f * 0.58 + math.sin(f * math.pi) * 0.12)
            local y = 0.6 + f * 1.08 - f * f * 0.08
            local z = -0.02 - f * 0.3
            local s = 0.27 * (1 - f * 0.68)
            e.p.Size = Vector3.new(s, s, s)
            e.p.CFrame = hc * CFrame.new(x, y, z)
        end
    end)
end

local CatEars = {model = nil, conn = nil}
local function applyCatEars()
    if CatEars.conn then CatEars.conn:Disconnect(); CatEars.conn = nil end
    if CatEars.model then CatEars.model:Destroy(); CatEars.model = nil end
    if not S.CatEars then return end
    local char = LocalPlayer.Character
    local head = char and char:FindFirstChild("Head")
    if not head then return end
    local c1 = S.CatEarsColor1
    local c2 = S.CatEarsColor2
    local glow = itemGlow("CatEars")
    local model = cosmeticModel("HamerCatEars")
    CatEars.model = model
    local ears = {}
    for sign = -1, 1, 2 do
        ears[#ears + 1] = {
            sign = sign,
            outer1 = deco(model, Enum.PartType.Block, Vector3.new(0.4, 0.24, 0.13), c1, Enum.Material.Neon, glow, 0.02),
            outer2 = deco(model, Enum.PartType.Block, Vector3.new(0.28, 0.22, 0.12), gradColor(c1, c2, 0.45), Enum.Material.Neon, glow, 0.02),
            outer3 = deco(model, Enum.PartType.Block, Vector3.new(0.15, 0.18, 0.11), c2, Enum.Material.Neon, glow, 0.02),
            inner1 = deco(model, Enum.PartType.Block, Vector3.new(0.26, 0.13, 0.05), gradColor(c1, c2, 0.6), Enum.Material.Neon, glow, 0.04),
            inner2 = deco(model, Enum.PartType.Block, Vector3.new(0.15, 0.12, 0.05), c2, Enum.Material.Neon, glow, 0.04),
            tip = deco(model, Enum.PartType.Ball, Vector3.new(0.07, 0.07, 0.07), c2, Enum.Material.Neon, glow, 0.02)
        }
    end
    local t = 0
    CatEars.conn = RunService.RenderStepped:Connect(function(dt)
        if not S.CatEars or not model.Parent then return end
        local ch = LocalPlayer.Character
        local h = ch and ch:FindFirstChild("Head")
        if not h then return end
        t = t + dt
        for _, e in ipairs(ears) do
            local sign = e.sign
            local tw = math.sin(t * 2.2 + sign) * 0.05
            local base = h.CFrame * CFrame.new(sign * 0.33, 0.6, -0.02) * CFrame.Angles(0, 0, math.rad(sign * 19) + tw)
            e.outer1.CFrame = base
            e.outer2.CFrame = base * CFrame.new(0, 0.2, 0)
            e.outer3.CFrame = base * CFrame.new(0, 0.37, 0)
            e.inner1.CFrame = base * CFrame.new(0, 0.02, -0.03)
            e.inner2.CFrame = base * CFrame.new(0, 0.2, -0.03)
            e.tip.CFrame = base * CFrame.new(0, 0.49, 0)
        end
    end)
end

local Jetpack = {model = nil, conn = nil}
local function applyJetpack()
    if Jetpack.conn then Jetpack.conn:Disconnect(); Jetpack.conn = nil end
    if Jetpack.model then Jetpack.model:Destroy(); Jetpack.model = nil end
    if not S.Jetpack then return end
    local char = LocalPlayer.Character
    if not char or not char:FindFirstChild("HumanoidRootPart") then return end
    local c1 = S.JetpackColor1
    local c2 = S.JetpackColor2
    local glow = itemGlow("Jetpack")
    local dark = Color3.fromRGB(42, 46, 56)
    local model = cosmeticModel("HamerJetpack")
    Jetpack.model = model
    local body = deco(model, Enum.PartType.Block, Vector3.new(0.82, 1.0, 0.34), c2:Lerp(dark, 0.72), Enum.Material.Metal, false, 0)
    local plate = deco(model, Enum.PartType.Block, Vector3.new(0.62, 0.7, 0.05), c2:Lerp(dark, 0.88), Enum.Material.SmoothPlastic, false, 0)
    local core = deco(model, Enum.PartType.Cylinder, Vector3.new(0.12, 0.34, 0.34), c1, Enum.Material.Neon, glow, 0.04)
    if glow then
        local light = Instance.new("PointLight")
        light.Color = c1
        light.Range = 6
        light.Brightness = 1.6
        light.Parent = core
    end
    local tanks, nozzles, fins, flames = {}, {}, {}, {}
    for sign = -1, 1, 2 do
        tanks[#tanks + 1] = {p = deco(model, Enum.PartType.Cylinder, Vector3.new(0.92, 0.3, 0.3), c2, Enum.Material.Neon, glow, 0.04), sign = sign}
        nozzles[#nozzles + 1] = {p = deco(model, Enum.PartType.Cylinder, Vector3.new(0.22, 0.25, 0.25), dark, Enum.Material.Metal, false, 0), sign = sign}
        fins[#fins + 1] = {p = deco(model, Enum.PartType.Block, Vector3.new(0.08, 0.5, 0.26), gradColor(c1, c2, 0.3), Enum.Material.Neon, glow, 0.08), sign = sign}
        flames[#flames + 1] = {p = deco(model, Enum.PartType.Ball, Vector3.new(0.24, 0.62, 0.24), c1:Lerp(Color3.fromRGB(255, 145, 45), 0.38), Enum.Material.Neon, glow, 0.32), sign = sign}
    end
    local t = 0
    Jetpack.conn = RunService.RenderStepped:Connect(function(dt)
        if not S.Jetpack or not model.Parent then return end
        local ch = LocalPlayer.Character
        local r = ch and ch:FindFirstChild("HumanoidRootPart")
        if not r then return end
        t = t + dt
        local base = r.CFrame * CFrame.new(0, 0.78, 0.58)
        body.CFrame = base
        plate.CFrame = base * CFrame.new(0, 0, 0.2)
        core.CFrame = base * CFrame.new(0, 0.12, 0.22) * CFrame.Angles(0, math.rad(90), 0)
        core.Transparency = 0.06 + math.sin(t * 5) * 0.08
        for _, e in ipairs(tanks) do
            e.p.CFrame = base * CFrame.new(e.sign * 0.34, 0.02, 0.02) * CFrame.Angles(0, 0, math.rad(90))
        end
        for _, e in ipairs(nozzles) do
            e.p.CFrame = base * CFrame.new(e.sign * 0.34, -0.52, 0.02) * CFrame.Angles(0, 0, math.rad(90))
        end
        for _, e in ipairs(fins) do
            e.p.CFrame = base * CFrame.new(e.sign * 0.57, 0.16, 0.03) * CFrame.Angles(0, 0, math.rad(e.sign * 20))
        end
        for _, e in ipairs(flames) do
            local s = 0.78 + math.sin(t * 18 + e.sign) * 0.22
            e.p.Size = Vector3.new(0.24 * s, 0.62 * s, 0.24 * s)
            e.p.CFrame = base * CFrame.new(e.sign * 0.34, -0.76, 0.02)
            e.p.Transparency = 0.26 + math.sin(t * 14 + e.sign) * 0.12
        end
    end)
end

local Tail = {model = nil, conn = nil}
local function applyTail()
    if Tail.conn then Tail.conn:Disconnect(); Tail.conn = nil end
    if Tail.model then Tail.model:Destroy(); Tail.model = nil end
    if not S.Tail then return end
    local char = LocalPlayer.Character
    if not char or not char:FindFirstChild("HumanoidRootPart") then return end
    local c1 = S.TailColor1
    local c2 = S.TailColor2
    local glow = itemGlow("Tail")
    local model = cosmeticModel("HamerTail")
    Tail.model = model
    local parts = {}
    for i = 1, 26 do
        local f = (i - 1) / 25
        local s = 0.27 * (1 - f * 0.66)
        local p = deco(model, Enum.PartType.Ball, Vector3.new(s, s, s), gradColor(c1, c2, f), Enum.Material.Neon, glow, 0.02)
        if i == 26 and glow then
            local light = Instance.new("PointLight")
            light.Color = c2
            light.Range = 5
            light.Brightness = 1.6
            light.Parent = p
        end
        parts[#parts + 1] = {p = p, f = f}
    end
    local t = 0
    Tail.conn = RunService.RenderStepped:Connect(function(dt)
        if not S.Tail or not model.Parent then return end
        local ch = LocalPlayer.Character
        local r = ch and ch:FindFirstChild("HumanoidRootPart")
        if not r then return end
        t = t + dt
        for _, e in ipairs(parts) do
            local f = e.f
            local wave = math.sin(t * 3.2 - f * 4.2)
            local x = wave * (0.07 + f * 0.34)
            local y = 0.9 - f * 0.55 + math.sin(t * 4 - f * 5) * 0.1
            local z = 0.52 + f * 2.0
            local s = 0.27 * (1 - f * 0.66)
            e.p.Size = Vector3.new(s, s, s)
            e.p.CFrame = r.CFrame * CFrame.new(x, y, z)
        end
    end)
end

local TopHat = {model = nil, conn = nil}
local function applyTopHat()
    if TopHat.conn then TopHat.conn:Disconnect(); TopHat.conn = nil end
    if TopHat.model then TopHat.model:Destroy(); TopHat.model = nil end
    if not S.TopHat then return end
    local char = LocalPlayer.Character
    local head = char and char:FindFirstChild("Head")
    if not head then return end
    local dark = Color3.fromRGB(22, 23, 28)
    local c1 = S.TopHatColor1
    local c2 = S.TopHatColor2
    local glow = itemGlow("TopHat")
    local body = c1:Lerp(dark, 0.82)
    local model = cosmeticModel("HamerTopHat")
    TopHat.model = model
    local brim = deco(model, Enum.PartType.Cylinder, Vector3.new(0.07, 1.72, 1.72), body, Enum.Material.SmoothPlastic, false, 0)
    local top = deco(model, Enum.PartType.Cylinder, Vector3.new(1.1, 1.02, 1.02), body, Enum.Material.SmoothPlastic, false, 0)
    local band = deco(model, Enum.PartType.Cylinder, Vector3.new(0.22, 1.06, 1.06), c1, Enum.Material.Neon, glow, 0.04)
    local rim = deco(model, Enum.PartType.Cylinder, Vector3.new(0.05, 1.05, 1.05), gradColor(c1, c2, 0.35), Enum.Material.Neon, glow, 0.1)
    local buckle = deco(model, Enum.PartType.Block, Vector3.new(0.2, 0.16, 0.06), c2, Enum.Material.Neon, glow, 0.02)
    local petals = {}
    for i = 1, 5 do
        local a = (i - 1) / 5 * math.pi * 2
        petals[i] = deco(model, Enum.PartType.Ball, Vector3.new(0.12, 0.09, 0.12), c2, Enum.Material.Neon, glow, 0.02)
        petals[i]:SetAttribute("a", a)
    end
    local rose = deco(model, Enum.PartType.Ball, Vector3.new(0.1, 0.08, 0.1), c2:Lerp(Color3.fromRGB(255, 255, 255), 0.42), Enum.Material.Neon, glow, 0.02)
    local t = 0
    TopHat.conn = RunService.RenderStepped:Connect(function(dt)
        if not S.TopHat or not model.Parent then return end
        local ch = LocalPlayer.Character
        local h = ch and ch:FindFirstChild("Head")
        if not h then return end
        t = t + dt
        local base = h.CFrame * CFrame.new(0, 0.72 + math.sin(t * 2) * 0.015, 0) * CFrame.Angles(math.rad(-3), 0, 0)
        brim.CFrame = base * CFrame.Angles(0, 0, math.rad(90))
        band.CFrame = base * CFrame.new(0, 0.24, 0) * CFrame.Angles(0, 0, math.rad(90))
        top.CFrame = base * CFrame.new(0, 0.6, 0) * CFrame.Angles(0, 0, math.rad(90))
        rim.CFrame = base * CFrame.new(0, 1.15, 0) * CFrame.Angles(0, 0, math.rad(90))
        buckle.CFrame = base * CFrame.new(0, 0.24, -0.55)
        local flower = base * CFrame.new(0.25, 0.24, -0.52)
        for _, p in ipairs(petals) do
            local a = p:GetAttribute("a")
            p.CFrame = flower * CFrame.new(math.cos(a) * 0.08, math.sin(a) * 0.08, 0)
        end
        rose.CFrame = flower * CFrame.new(0, 0, -0.04)
    end)
end

local Visor = {model = nil, conn = nil}
local function applyVisor()
    if Visor.conn then Visor.conn:Disconnect(); Visor.conn = nil end
    if Visor.model then Visor.model:Destroy(); Visor.model = nil end
    if not S.Visor then return end
    local char = LocalPlayer.Character
    local head = char and char:FindFirstChild("Head")
    if not head then return end
    local c1 = S.VisorColor1
    local c2 = S.VisorColor2
    local glow = itemGlow("Visor")
    local model = cosmeticModel("HamerVisor")
    Visor.model = model
    local bar = deco(model, Enum.PartType.Block, Vector3.new(0.72, 0.16, 0.07), c1, Enum.Material.Neon, glow, 0.03)
    local lens = deco(model, Enum.PartType.Block, Vector3.new(0.62, 0.1, 0.04), c2, Enum.Material.Neon, glow, 0.28)
    local sides = {}
    for sign = -1, 1, 2 do
        sides[#sides + 1] = {
            sign = sign,
            frame = deco(model, Enum.PartType.Block, Vector3.new(0.3, 0.16, 0.06), c1, Enum.Material.Neon, glow, 0.03),
            lens = deco(model, Enum.PartType.Block, Vector3.new(0.26, 0.1, 0.035), c2, Enum.Material.Neon, glow, 0.32),
            pod = deco(model, Enum.PartType.Ball, Vector3.new(0.14, 0.14, 0.14), gradColor(c1, c2, 0.4), Enum.Material.Neon, glow, 0.02)
        }
    end
    local scan = deco(model, Enum.PartType.Block, Vector3.new(0.1, 0.06, 0.02), c2, Enum.Material.Neon, glow, 0.02)
    local t = 0
    Visor.conn = RunService.RenderStepped:Connect(function(dt)
        if not S.Visor or not model.Parent then return end
        local ch = LocalPlayer.Character
        local h = ch and ch:FindFirstChild("Head")
        if not h then return end
        t = t + dt
        local base = h.CFrame * CFrame.new(0, 0.06, -0.57)
        bar.CFrame = base
        lens.CFrame = base * CFrame.new(0, 0, -0.045)
        bar.Transparency = 0.04 + math.sin(t * 4) * 0.07
        lens.Transparency = 0.24 + math.sin(t * 4 + 1) * 0.08
        for _, e in ipairs(sides) do
            local cf = base * CFrame.new(e.sign * 0.36, 0, 0.06) * CFrame.Angles(0, math.rad(e.sign * 34), 0)
            e.frame.CFrame = cf
            e.lens.CFrame = cf * CFrame.new(0, 0, -0.045)
            e.pod.CFrame = base * CFrame.new(e.sign * 0.5, 0, 0.14)
        end
        scan.CFrame = base * CFrame.new(math.sin(t * 2.4) * 0.27, 0, -0.055)
        scan.Transparency = 0.1 + math.sin(t * 7) * 0.12
    end)
end

local OniMask = {model = nil, conn = nil}
local function applyOniMask()
    if OniMask.conn then OniMask.conn:Disconnect(); OniMask.conn = nil end
    if OniMask.model then OniMask.model:Destroy(); OniMask.model = nil end
    if not S.OniMask then return end
    local char = LocalPlayer.Character
    local head = char and char:FindFirstChild("Head")
    if not head then return end
    local c1 = S.OniMaskColor1
    local c2 = S.OniMaskColor2
    local glow = itemGlow("OniMask")
    local dark = Color3.fromRGB(28, 14, 18)
    local white = Color3.fromRGB(255, 236, 214)
    local model = cosmeticModel("HamerOniMask")
    OniMask.model = model
    local face = deco(model, Enum.PartType.Block, Vector3.new(1.02, 0.86, 0.16), c1:Lerp(dark, 0.12), Enum.Material.SmoothPlastic, false, 0)
    local mouth = deco(model, Enum.PartType.Block, Vector3.new(0.46, 0.11, 0.08), dark, Enum.Material.SmoothPlastic, false, 0)
    local eyes, brows, fangs, horns = {}, {}, {}, {}
    for sign = -1, 1, 2 do
        eyes[#eyes + 1] = {p = deco(model, Enum.PartType.Ball, Vector3.new(0.17, 0.1, 0.06), c2, Enum.Material.Neon, glow, 0.03), sign = sign}
        brows[#brows + 1] = {p = deco(model, Enum.PartType.Block, Vector3.new(0.38, 0.1, 0.08), dark, Enum.Material.SmoothPlastic, false, 0), sign = sign}
        fangs[#fangs + 1] = {p = deco(model, Enum.PartType.Block, Vector3.new(0.09, 0.22, 0.07), c2:Lerp(white, 0.72), Enum.Material.SmoothPlastic, false, 0), sign = sign}
        for i = 1, 3 do
            local s = 0.17 - i * 0.03
            horns[#horns + 1] = {p = deco(model, Enum.PartType.Ball, Vector3.new(s, s, s), gradColor(c1, c2, 0.2 + i * 0.3), Enum.Material.Neon, glow, 0.02), sign = sign, i = i}
        end
    end
    if glow then
        local light = Instance.new("PointLight")
        light.Color = c2
        light.Range = 5
        light.Brightness = 1.4
        light.Parent = face
    end
    local t = 0
    OniMask.conn = RunService.RenderStepped:Connect(function(dt)
        if not S.OniMask or not model.Parent then return end
        local ch = LocalPlayer.Character
        local h = ch and ch:FindFirstChild("Head")
        if not h then return end
        t = t + dt
        local base = h.CFrame * CFrame.new(0, 0.03 + math.sin(t * 2) * 0.008, -0.5)
        face.CFrame = base
        mouth.CFrame = base * CFrame.new(0, -0.24, -0.1)
        for _, e in ipairs(eyes) do
            e.p.CFrame = base * CFrame.new(e.sign * 0.25, 0.11, -0.105) * CFrame.Angles(0, 0, math.rad(-e.sign * 14))
            e.p.Transparency = 0.03 + math.sin(t * 5 + e.sign) * 0.08
        end
        for _, e in ipairs(brows) do
            e.p.CFrame = base * CFrame.new(e.sign * 0.27, 0.29, -0.09) * CFrame.Angles(0, 0, math.rad(e.sign * 24))
        end
        for _, e in ipairs(fangs) do
            e.p.CFrame = base * CFrame.new(e.sign * 0.15, -0.33, -0.1) * CFrame.Angles(0, 0, math.rad(e.sign * 8))
        end
        for _, e in ipairs(horns) do
            local sway = math.sin(t * 2.2 + e.i * 0.4) * 0.05
            e.p.CFrame = base * CFrame.new(e.sign * (0.36 + e.i * 0.06), 0.42 + e.i * 0.17, -0.01) * CFrame.Angles(sway, 0, math.rad(e.sign * (18 + e.i * 8)))
        end
    end)
end

local GasMask = {model = nil, conn = nil}
local function applyGasMask()
    if GasMask.conn then GasMask.conn:Disconnect(); GasMask.conn = nil end
    if GasMask.model then GasMask.model:Destroy(); GasMask.model = nil end
    if not S.GasMask then return end
    local char = LocalPlayer.Character
    local head = char and char:FindFirstChild("Head")
    if not head then return end
    local c1 = S.GasMaskColor1
    local c2 = S.GasMaskColor2
    local glow = itemGlow("GasMask")
    local dark = Color3.fromRGB(34, 38, 46)
    local metal = Color3.fromRGB(64, 70, 82)
    local body = c2:Lerp(dark, 0.62)
    local trim = c2:Lerp(metal, 0.58)
    local model = cosmeticModel("HamerGasMask")
    GasMask.model = model
    local face = deco(model, Enum.PartType.Block, Vector3.new(1.04, 0.84, 0.2), body, Enum.Material.Metal, false, 0)
    local rim = deco(model, Enum.PartType.Block, Vector3.new(0.92, 0.42, 0.06), trim, Enum.Material.Metal, false, 0)
    local lens = deco(model, Enum.PartType.Block, Vector3.new(0.78, 0.28, 0.05), c1, Enum.Material.Neon, glow, 0.15)
    local filters = {}
    for sign = -1, 1, 2 do
        local f = {p = deco(model, Enum.PartType.Cylinder, Vector3.new(0.36, 0.32, 0.32), trim, Enum.Material.Metal, false, 0), sign = sign, hose = {}}
        f.cap = deco(model, Enum.PartType.Ball, Vector3.new(0.13, 0.13, 0.13), c1, Enum.Material.Neon, glow, 0.04)
        for i = 1, 4 do
            local s = 0.1 - i * 0.012
            f.hose[i] = deco(model, Enum.PartType.Ball, Vector3.new(s, s, s), body:Lerp(dark, 0.5), Enum.Material.SmoothPlastic, false, 0)
        end
        filters[#filters + 1] = f
    end
    if glow then
        local light = Instance.new("PointLight")
        light.Color = c1
        light.Range = 5
        light.Brightness = 1.2
        light.Parent = lens
    end
    local t = 0
    GasMask.conn = RunService.RenderStepped:Connect(function(dt)
        if not S.GasMask or not model.Parent then return end
        local ch = LocalPlayer.Character
        local h = ch and ch:FindFirstChild("Head")
        if not h then return end
        t = t + dt
        local base = h.CFrame * CFrame.new(0, 0.02, -0.49)
        face.CFrame = base
        rim.CFrame = base * CFrame.new(0, 0.1, -0.12)
        lens.CFrame = base * CFrame.new(0, 0.1, -0.15)
        lens.Transparency = 0.12 + math.sin(t * 4.5) * 0.08
        for _, e in ipairs(filters) do
            e.p.CFrame = base * CFrame.new(e.sign * 0.38, -0.18, -0.1) * CFrame.Angles(0, math.rad(90), 0)
            e.cap.CFrame = base * CFrame.new(e.sign * 0.38, -0.18, -0.3)
            for i, p in ipairs(e.hose) do
                p.CFrame = base * CFrame.new(e.sign * (0.36 + i * 0.015), -0.34 - i * 0.1, -0.18 + i * 0.04)
            end
        end
    end)
end

local NeonMask = {model = nil, conn = nil}
local function applyNeonMask()
    if NeonMask.conn then NeonMask.conn:Disconnect(); NeonMask.conn = nil end
    if NeonMask.model then NeonMask.model:Destroy(); NeonMask.model = nil end
    if not S.NeonMask then return end
    local char = LocalPlayer.Character
    local head = char and char:FindFirstChild("Head")
    if not head then return end
    local c1 = S.NeonMaskColor1
    local c2 = S.NeonMaskColor2
    local glow = itemGlow("NeonMask")
    local dark = Color3.fromRGB(22, 24, 32)
    local model = cosmeticModel("HamerNeonMask")
    NeonMask.model = model
    local face = deco(model, Enum.PartType.Block, Vector3.new(1.0, 0.78, 0.12), c2:Lerp(dark, 0.78), Enum.Material.SmoothPlastic, false, 0)
    local visor = deco(model, Enum.PartType.Block, Vector3.new(0.84, 0.18, 0.05), c1, Enum.Material.Neon, glow, 0.04)
    local scan = deco(model, Enum.PartType.Block, Vector3.new(0.12, 0.04, 0.02), c2, Enum.Material.Neon, glow, 0.02)
    local rails = {}
    for sign = -1, 1, 2 do
        rails[#rails + 1] = {p = deco(model, Enum.PartType.Block, Vector3.new(0.06, 0.62, 0.06), c1, Enum.Material.Neon, glow, 0.08), sign = sign}
    end
    local grill = {}
    for i = 1, 5 do
        grill[i] = deco(model, Enum.PartType.Block, Vector3.new(0.09, 0.09, 0.04), gradColor(c1, c2, (i - 1) / 4), Enum.Material.Neon, glow, 0.04)
    end
    local t = 0
    NeonMask.conn = RunService.RenderStepped:Connect(function(dt)
        if not S.NeonMask or not model.Parent then return end
        local ch = LocalPlayer.Character
        local h = ch and ch:FindFirstChild("Head")
        if not h then return end
        t = t + dt
        local base = h.CFrame * CFrame.new(0, 0.02, -0.5)
        face.CFrame = base
        visor.CFrame = base * CFrame.new(0, 0.12, -0.08)
        visor.Transparency = 0.04 + math.sin(t * 4) * 0.08
        for _, e in ipairs(rails) do
            e.p.CFrame = base * CFrame.new(e.sign * 0.45, -0.02, -0.06)
        end
        for i, p in ipairs(grill) do
            p.CFrame = base * CFrame.new(-0.24 + (i - 1) * 0.12, -0.28, -0.075)
        end
        scan.CFrame = base * CFrame.new(math.sin(t * 3) * 0.34, 0.12, -0.11)
    end)
end

local Cap = {model = nil, conn = nil}
local function applyCap()
    if Cap.conn then Cap.conn:Disconnect(); Cap.conn = nil end
    if Cap.model then Cap.model:Destroy(); Cap.model = nil end
    if not S.Cap then return end
    local char = LocalPlayer.Character
    local head = char and char:FindFirstChild("Head")
    if not head then return end
    local c1 = S.CapColor1
    local c2 = S.CapColor2
    local glow = itemGlow("Cap")
    local dark = Color3.fromRGB(28, 30, 38)
    local model = cosmeticModel("HamerCap")
    Cap.model = model
    local dome = deco(model, Enum.PartType.Ball, Vector3.new(1.08, 0.56, 1.08), c1:Lerp(dark, 0.82), Enum.Material.SmoothPlastic, false, 0)
    local brim = deco(model, Enum.PartType.Block, Vector3.new(1.02, 0.08, 0.62), c1, Enum.Material.Neon, glow, 0.02)
    local button = deco(model, Enum.PartType.Ball, Vector3.new(0.14, 0.14, 0.14), c2, Enum.Material.Neon, glow, 0.02)
    local logo = deco(model, Enum.PartType.Block, Vector3.new(0.24, 0.1, 0.04), c2, Enum.Material.Neon, glow, 0.02)
    local t = 0
    Cap.conn = RunService.RenderStepped:Connect(function(dt)
        if not S.Cap or not model.Parent then return end
        local ch = LocalPlayer.Character
        local h = ch and ch:FindFirstChild("Head")
        if not h then return end
        t = t + dt
        local base = h.CFrame * CFrame.new(0, 0.58 + math.sin(t * 2) * 0.01, -0.02)
        dome.CFrame = base
        brim.CFrame = base * CFrame.new(0, -0.12, -0.56) * CFrame.Angles(math.rad(-10), 0, 0)
        button.CFrame = base * CFrame.new(0, 0.28, 0)
        logo.CFrame = base * CFrame.new(0, 0.12, -0.52)
    end)
end

local CyberPack = {model = nil, conn = nil}
local function applyCyberPack()
    if CyberPack.conn then CyberPack.conn:Disconnect(); CyberPack.conn = nil end
    if CyberPack.model then CyberPack.model:Destroy(); CyberPack.model = nil end
    if not S.CyberPack then return end
    local char = LocalPlayer.Character
    local root = char and char:FindFirstChild("HumanoidRootPart")
    if not root then return end
    local c1 = S.CyberPackColor1
    local c2 = S.CyberPackColor2
    local glow = itemGlow("CyberPack")
    local dark = Color3.fromRGB(34, 38, 48)
    local dark2 = Color3.fromRGB(22, 24, 31)
    local model = cosmeticModel("HamerCyberPack")
    CyberPack.model = model
    local body = deco(model, Enum.PartType.Block, Vector3.new(0.86, 1.0, 0.34), c2:Lerp(dark, 0.78), Enum.Material.Metal, false, 0)
    local panel = deco(model, Enum.PartType.Block, Vector3.new(0.64, 0.74, 0.05), c2:Lerp(dark2, 0.9), Enum.Material.SmoothPlastic, false, 0)
    local core = deco(model, Enum.PartType.Ball, Vector3.new(0.24, 0.24, 0.24), c1, Enum.Material.Neon, glow, 0.02)
    local antenna = deco(model, Enum.PartType.Block, Vector3.new(0.05, 0.5, 0.05), c2:Lerp(dark, 0.75), Enum.Material.Metal, false, 0)
    local tip = deco(model, Enum.PartType.Ball, Vector3.new(0.09, 0.09, 0.09), c2, Enum.Material.Neon, glow, 0.02)
    local pods = {}
    for sign = -1, 1, 2 do
        pods[#pods + 1] = {p = deco(model, Enum.PartType.Block, Vector3.new(0.16, 0.6, 0.2), gradColor(c1, c2, 0.42), Enum.Material.Neon, glow, 0.12), sign = sign}
    end
    local ring = {}
    for i = 1, 12 do
        local s = 0.07
        local a = (i - 1) / 12 * math.pi * 2
        ring[i] = {p = deco(model, Enum.PartType.Ball, Vector3.new(s, s, s), gradColor(c1, c2, (math.sin(a) + 1) * 0.5), Enum.Material.Neon, glow, 0.02), a = a}
    end
    if glow then
        local light = Instance.new("PointLight")
        light.Color = c1
        light.Range = 7
        light.Brightness = 1.8
        light.Parent = core
    end
    local t = 0
    CyberPack.conn = RunService.RenderStepped:Connect(function(dt)
        if not S.CyberPack or not model.Parent then return end
        local ch = LocalPlayer.Character
        local r = ch and ch:FindFirstChild("HumanoidRootPart")
        if not r then return end
        t = t + dt
        local base = r.CFrame * CFrame.new(0, 0.72 + math.sin(t * 2) * 0.015, 0.62)
        body.CFrame = base
        panel.CFrame = base * CFrame.new(0, 0, 0.2)
        core.CFrame = base * CFrame.new(0, 0.12, 0.24)
        core.Transparency = 0.02 + math.sin(t * 5) * 0.08
        antenna.CFrame = base * CFrame.new(0, 0.7, 0.05)
        tip.CFrame = base * CFrame.new(0, 0.96, 0.05)
        tip.Transparency = 0.02 + math.sin(t * 6) * 0.2
        for _, e in ipairs(pods) do
            e.p.CFrame = base * CFrame.new(e.sign * 0.53, -0.02, 0.03)
        end
        for _, e in ipairs(ring) do
            local a = e.a + t * 1.6
            e.p.CFrame = base * CFrame.new(math.cos(a) * 0.36, 0.12 + math.sin(a) * 0.36, 0.26)
        end
    end)
end

local AngelPack = {model = nil, conn = nil}
local function applyAngelPack()
    if AngelPack.conn then AngelPack.conn:Disconnect(); AngelPack.conn = nil end
    if AngelPack.model then AngelPack.model:Destroy(); AngelPack.model = nil end
    if not S.AngelPack then return end
    local char = LocalPlayer.Character
    local root = char and char:FindFirstChild("HumanoidRootPart")
    if not root then return end
    local c1 = S.AngelPackColor1
    local c2 = S.AngelPackColor2
    local glow = itemGlow("AngelPack")
    local model = cosmeticModel("HamerAngelPack")
    AngelPack.model = model
    local body = deco(model, Enum.PartType.Block, Vector3.new(0.58, 0.78, 0.26), c1, Enum.Material.SmoothPlastic, false, 0)
    local trim = deco(model, Enum.PartType.Block, Vector3.new(0.44, 0.08, 0.06), c2, Enum.Material.Neon, glow, 0.04)
    local core = deco(model, Enum.PartType.Ball, Vector3.new(0.2, 0.2, 0.2), c1:Lerp(c2, 0.35), Enum.Material.Neon, glow, 0.02)
    local halo = {}
    for i = 1, 18 do
        local s = 0.06
        local a = (i - 1) / 18 * math.pi * 2
        halo[i] = {p = deco(model, Enum.PartType.Ball, Vector3.new(s, s, s), gradColor(c1, c2, (math.sin(a) + 1) * 0.5), Enum.Material.Neon, glow, 0.02), a = a}
    end
    local wings = {}
    for sign = -1, 1, 2 do
        for i = 1, 4 do
            local len = 0.7 - i * 0.07
            wings[#wings + 1] = {
                p = deco(model, Enum.PartType.Block, Vector3.new(0.13, len, 0.07), gradColor(c1, c2, 0.22 + i * 0.2), Enum.Material.Neon, glow, 0.03),
                sign = sign, i = i, len = len
            }
        end
    end
    if glow then
        local light = Instance.new("PointLight")
        light.Color = c1:Lerp(c2, 0.45)
        light.Range = 8
        light.Brightness = 1.7
        light.Parent = core
    end
    local t = 0
    AngelPack.conn = RunService.RenderStepped:Connect(function(dt)
        if not S.AngelPack or not model.Parent then return end
        local ch = LocalPlayer.Character
        local r = ch and ch:FindFirstChild("HumanoidRootPart")
        if not r then return end
        t = t + dt
        local base = r.CFrame * CFrame.new(0, 0.74 + math.sin(t * 2) * 0.02, 0.6)
        body.CFrame = base
        trim.CFrame = base * CFrame.new(0, 0.3, 0.15)
        core.CFrame = base * CFrame.new(0, 0.02, 0.18)
        core.Transparency = 0.02 + math.sin(t * 4.5) * 0.1
        for _, e in ipairs(halo) do
            local a = e.a + t * 0.9
            e.p.CFrame = base * CFrame.new(math.cos(a) * 0.42, 0.58, 0.05 + math.sin(a) * 0.42)
        end
        for _, e in ipairs(wings) do
            local flap = math.sin(t * 2.6 + e.sign) * math.rad(7)
            e.p.CFrame = base * CFrame.new(e.sign * (0.36 + e.i * 0.07), 0.1 + e.i * 0.08, 0.12) * CFrame.Angles(0, 0, math.rad(e.sign * (28 + e.i * 9)) + flap * e.sign)
        end
    end)
end

local Scythe = {model = nil, conn = nil}
local function applyScythe()
    if Scythe.conn then Scythe.conn:Disconnect(); Scythe.conn = nil end
    if Scythe.model then Scythe.model:Destroy(); Scythe.model = nil end
    if not S.Scythe then return end
    local char = LocalPlayer.Character
    if not char or not char:FindFirstChild("HumanoidRootPart") then return end
    local c1 = S.ScytheColor1
    local c2 = S.ScytheColor2
    local glow = itemGlow("Scythe")
    local dark = Color3.fromRGB(56, 60, 72)
    local dark2 = Color3.fromRGB(32, 34, 42)
    local model = cosmeticModel("HamerScythe")
    Scythe.model = model
    local shaft = deco(model, Enum.PartType.Cylinder, Vector3.new(5.6, 0.13, 0.13), c2:Lerp(dark2, 0.8), Enum.Material.Metal, false, 0)
    local collar = deco(model, Enum.PartType.Cylinder, Vector3.new(0.36, 0.33, 0.33), c2:Lerp(dark, 0.65), Enum.Material.Metal, false, 0)
    local grip = deco(model, Enum.PartType.Cylinder, Vector3.new(1.35, 0.2, 0.2), c2, Enum.Material.SmoothPlastic, false, 0)
    local pommel = deco(model, Enum.PartType.Ball, Vector3.new(0.28, 0.28, 0.28), c1, Enum.Material.Neon, glow, 0.02)
    local gem = deco(model, Enum.PartType.Ball, Vector3.new(0.17, 0.17, 0.17), c1, Enum.Material.Neon, glow, 0.02)
    local gripRings = {}
    for i = 1, 4 do
        gripRings[i] = deco(model, Enum.PartType.Cylinder, Vector3.new(0.07, 0.24, 0.24), gradColor(c2, c1, 0.35 + i * 0.1), Enum.Material.Neon, glow, 0.08)
    end
    local blade = {}
    for i = 1, 12 do
        local t = (i - 1) / 11
        local x = 2.45 + t * 1.65
        local y = 0.12 + math.sin(t * math.pi) * 0.72 + t * 0.06
        local ang = math.rad(-18 + t * 100)
        local body = deco(model, Enum.PartType.Block, Vector3.new(0.58, 0.2 - t * 0.06, 0.11), dark, Enum.Material.Metal, false, 0)
        local edge = deco(model, Enum.PartType.Block, Vector3.new(0.56, 0.055, 0.12), gradColor(c1, c2, 0.12 + t * 0.55), Enum.Material.Neon, glow, 0.02)
        blade[i] = {p = body, e = edge, off = CFrame.new(x, y, 0) * CFrame.Angles(0, 0, ang)}
    end
    if glow then
        local light = Instance.new("PointLight")
        light.Color = c1
        light.Range = 7
        light.Brightness = 2
        light.Parent = gem
    end
    local t = 0
    Scythe.conn = RunService.RenderStepped:Connect(function(dt)
        if not S.Scythe or not model.Parent then return end
        local ch = LocalPlayer.Character
        local r = ch and ch:FindFirstChild("HumanoidRootPart")
        if not r then return end
        t = t + dt
        local base = r.CFrame * CFrame.new(0, 1.0 + math.sin(t * 2) * 0.015, 0.78) * CFrame.Angles(0, 0, math.rad(28)) * CFrame.Angles(0, math.rad(18), 0)
        shaft.CFrame = base
        collar.CFrame = base * CFrame.new(2.35, 0, 0)
        grip.CFrame = base * CFrame.new(-2.35, 0, 0)
        pommel.CFrame = base * CFrame.new(-2.9, 0, 0)
        gem.CFrame = base * CFrame.new(2.35, 0.2, 0)
        for i, p in ipairs(gripRings) do
            p.CFrame = base * CFrame.new(-1.82 - (i - 1) * 0.28, 0, 0)
        end
        for _, e in ipairs(blade) do
            e.p.CFrame = base * e.off
            e.e.CFrame = base * e.off * CFrame.new(0, 0.1, 0)
        end
    end)
end

local function refreshCosmetics()
    if S.Dong then applyDong() end
    if S.Wings then applyWings() end
    if S.Halo then applyHalo() end
    if S.ChinaHat then applyChinaHat() end
    if S.Kagune then applyKagune() end
    if S.Companion then applyCompanion() end
    if S.Aura then applyAura() end
    if S.Crown then applyCrown() end
    if S.Horns then applyHorns() end
    if S.CatEars then applyCatEars() end
    if S.Jetpack then applyJetpack() end
    if S.Tail then applyTail() end
    if S.TopHat then applyTopHat() end
    if S.Visor then applyVisor() end
    if S.Scythe then applyScythe() end
    if S.OniMask then applyOniMask() end
    if S.GasMask then applyGasMask() end
    if S.NeonMask then applyNeonMask() end
    if S.Cap then applyCap() end
    if S.CyberPack then applyCyberPack() end
    if S.AngelPack then applyAngelPack() end
end

return {
    applyAura = applyAura, applyCrown = applyCrown, applyHorns = applyHorns,
    applyCatEars = applyCatEars, applyJetpack = applyJetpack, applyTail = applyTail,
    applyTopHat = applyTopHat, applyVisor = applyVisor, applyScythe = applyScythe,
    applyOniMask = applyOniMask, applyGasMask = applyGasMask, applyNeonMask = applyNeonMask,
    applyCap = applyCap, applyCyberPack = applyCyberPack, applyAngelPack = applyAngelPack,
    refresh = refreshCosmetics, cosmeticModel = cosmeticModel
}
end)()

    return {
        applyDong = applyDong, applyFox = applyFox, applyWings = applyWings, applyHalo = applyHalo,
        applyChinaHat = applyChinaHat, applyKagune = applyKagune, applyCompanion = applyCompanion,
        Cos = Cos
    }
end)()

local function applyNoAnims(on)
    S.NoAnims = on
    local char = LocalPlayer.Character
    local hum = char and char:FindFirstChildOfClass("Humanoid")
    if not hum then return end
    local animator = hum:FindFirstChildOfClass("Animator")
    if not animator then return end
    if on then
        for _, track in ipairs(animator:GetPlayingAnimationTracks()) do
            pcall(function() track:Stop() end)
        end
    end
end

local function applyKorblox(on)
    S.Korblox = on
    local char = LocalPlayer.Character
    if not char then return end
    for _, n in ipairs({"Right Leg", "RightUpperLeg", "RightLowerLeg"}) do
        local p = char:FindFirstChild(n)
        if p then
            p.Transparency = on and 1 or 0
        end
    end
end

local function applyGhostLegs(on)
    S.GhostLegs = on
    local char = LocalPlayer.Character
    if not char then return end
    for _, n in ipairs({"Left Leg", "Right Leg", "LeftUpperLeg", "RightUpperLeg", "LeftLowerLeg", "RightLowerLeg"}) do
        local p = char:FindFirstChild(n)
        if p then
            p.Transparency = on and 1 or 0
        end
    end
end

local function setAvatarScale(v)
    S.AvatarScale = v
    local char = LocalPlayer.Character
    local hum = char and char:FindFirstChildOfClass("Humanoid")
    if not hum then return end
    for _, n in ipairs({"BodyHeightScale", "BodyWidthScale", "BodyDepthScale", "HeadScale"}) do
        local nv = hum:FindFirstChild(n)
        if nv then nv.Value = v end
    end
end

local Wm = (function()
local wmGui = Instance.new("ScreenGui")
wmGui.Name = "HamerWatermark"
wmGui.ResetOnSpawn = false
wmGui.IgnoreGuiInset = true
wmGui.DisplayOrder = 997
wmGui.ZIndexBehavior = Enum.ZIndexBehavior.Global
wmGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

local wm = Instance.new("Frame")
wm.Size = UDim2.new(0, 210, 0, 26)
wm.Position = UDim2.new(0, 12, 0, 60)
wm.BackgroundColor3 = Color3.fromRGB(14, 18, 28)
wm.BackgroundTransparency = 0.12
wm.BorderSizePixel = 0
wm.ZIndex = 1
wm.Parent = wmGui
local wmc = Instance.new("UICorner")
wmc.CornerRadius = UDim.new(0, 8)
wmc.Parent = wm
local wms = Instance.new("UIStroke")
wms.Color = accent()
wms.Transparency = 0.5
wms.Thickness = 1
wms.Parent = wm
bindAccent(function(c) wms.Color = c end)
local wmText = Instance.new("TextLabel")
wmText.Text = "hamer"
wmText.Font = FONT_BOLD
wmText.TextSize = 11
wmText.TextColor3 = Color3.fromRGB(255, 255, 255)
wmText.TextTransparency = 0.15
wmText.TextXAlignment = Enum.TextXAlignment.Left
wmText.BackgroundTransparency = 1
wmText.Size = UDim2.new(1, -16, 1, 0)
wmText.Position = UDim2.new(0, 8, 0, 0)
wmText.ZIndex = 2
wmText.Parent = wm

local fpsCount, fpsAcc, fpsValue = 0, 0, 0
conn(RunService.RenderStepped:Connect(function(dt)
    if Unloaded then return end
    wmGui.Enabled = S.Watermark
    fpsAcc = fpsAcc + dt
    fpsCount = fpsCount + 1
    if fpsAcc >= 0.5 then
        fpsValue = math.floor(fpsCount / fpsAcc + 0.5)
        fpsAcc = 0
        fpsCount = 0
    end
    local ping = 0
    pcall(function()
        ping = math.floor(Stats.Network.ServerStatsItem["Data Ping"]:GetValue())
    end)
    wmText.Text = string.format("hamer  |  %d fps  |  %d ms", fpsValue, ping)
end))

local EmoteMenu = {gui = nil, track = nil}
local EMOTES = {
    {name = "Dance", id = "507771019"},
    {name = "Cheer", id = "507770677"},
    {name = "Hello", id = "507770239"},
    {name = "Point", id = "507770453"},
    {name = "Laugh", id = "507770818"},
    {name = "Sit", id = "2506281703"}
}

local function playEmote(id, looped)
    local char = LocalPlayer.Character
    local hum = char and char:FindFirstChildOfClass("Humanoid")
    if not hum then return end
    local animator = hum:FindFirstChildOfClass("Animator")
    if not animator then
        animator = Instance.new("Animator")
        animator.Parent = hum
    end
    if EmoteMenu.track then pcall(function() EmoteMenu.track:Stop() end) end
    local anim = Instance.new("Animation")
    anim.AnimationId = "rbxassetid://" .. id
    local ok, track = pcall(function() return animator:LoadAnimation(anim) end)
    if ok and track then
        track.Priority = Enum.AnimationPriority.Action4
        track.Looped = looped == true
        track:Play()
        EmoteMenu.track = track
    end
end

local function toggleEmoteMenu()
    if EmoteMenu.gui and EmoteMenu.gui.Parent then
        EmoteMenu.gui:Destroy()
        EmoteMenu.gui = nil
        return
    end
    local eg = Instance.new("ScreenGui")
    eg.Name = "HamerEmotes"
    eg.ResetOnSpawn = false
    eg.IgnoreGuiInset = true
    eg.DisplayOrder = 998
    eg.ZIndexBehavior = Enum.ZIndexBehavior.Global
    eg.Parent = LocalPlayer:WaitForChild("PlayerGui")

    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 170, 0, 258)
    frame.Position = UDim2.new(1, -190, 0.5, -129)
    frame.BackgroundColor3 = Color3.fromRGB(14, 18, 28)
    frame.BackgroundTransparency = 0.06
    frame.BorderSizePixel = 0
    frame.ZIndex = 10
    frame.Parent = eg
    local fc = Instance.new("UICorner")
    fc.CornerRadius = UDim.new(0, 16)
    fc.Parent = frame
    local fs = Instance.new("UIStroke")
    fs.Color = accent()
    fs.Transparency = 0.45
    fs.Thickness = 1.2
    fs.Parent = frame

    local tl = Instance.new("TextLabel")
    tl.Text = "EMOTES"
    tl.Font = FONT_BLACK
    tl.TextSize = 13
    tl.TextColor3 = Color3.fromRGB(255, 255, 255)
    tl.TextXAlignment = Enum.TextXAlignment.Left
    tl.BackgroundTransparency = 1
    tl.Size = UDim2.new(1, -24, 0, 26)
    tl.Position = UDim2.new(0, 12, 0, 10)
    tl.ZIndex = 11
    tl.Parent = frame

    for i, e in ipairs(EMOTES) do
        local b = Instance.new("TextButton")
        b.Size = UDim2.new(1, -24, 0, 30)
        b.Position = UDim2.new(0, 12, 0, 40 + (i - 1) * 34)
        b.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        b.BackgroundTransparency = 0.93
        b.BorderSizePixel = 0
        b.Text = e.name
        b.Font = FONT_REG
        b.TextSize = 12
        b.TextColor3 = Color3.fromRGB(255, 255, 255)
        b.AutoButtonColor = false
        b.ZIndex = 11
        b.Parent = frame
        local bc = Instance.new("UICorner")
        bc.CornerRadius = UDim.new(0, 8)
        bc.Parent = b
        local bs = Instance.new("UIStroke")
        bs.Color = Color3.fromRGB(255, 255, 255)
        bs.Transparency = 0.9
        bs.Parent = b
        b.MouseButton1Click:Connect(function()
            playEmote(e.id, e.name == "Sit")
            click()
        end)
    end
    EmoteMenu.gui = eg
end

return {
    toggle = toggleEmoteMenu,
    cleanup = function()
        if EmoteMenu.gui and EmoteMenu.gui.Parent then EmoteMenu.gui:Destroy() end
        EmoteMenu.gui = nil
        if EmoteMenu.track then pcall(function() EmoteMenu.track:Stop() end) end
        if wmGui then wmGui:Destroy() end
    end
}
end)()

toast = function(text)
    local t = Instance.new("TextLabel")
    t.Text = Loc.L(text)
    t.Font = FONT_BOLD
    t.TextSize = 12
    t.TextColor3 = Color3.fromRGB(255, 255, 255)
    t.BackgroundColor3 = Color3.fromRGB(14, 18, 28)
    t.BackgroundTransparency = 0.08
    t.Size = UDim2.new(0, 280, 0, 32)
    t.Position = UDim2.new(0.5, -140, 1, -104)
    t.ZIndex = 40
    t.Parent = gui
    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, 9)
    c.Parent = t
    local s = Instance.new("UIStroke")
    s.Color = accent()
    s.Transparency = 0.4
    s.Parent = t
    task.delay(2, function()
        if t and t.Parent then t:Destroy() end
    end)
end

local Cfg = (function()
local CONFIG_DIR = "hamer_configs"
local CONFIG_VERSION = 2

local function hasFileAPI()
    return type(writefile) == "function" and type(readfile) == "function"
end

local function safeName(n)
    n = tostring(n or "default")
    n = string.gsub(n, "[^%w_%- ]", "")
    if n == "" then n = "default" end
    return n
end

local function serialize()
    local t = {}
    for k, v in pairs(S) do
        if k ~= "MenuOpen" and k ~= "DroneActive" then
            if typeof(v) == "Color3" then
                t[k] = {math.floor(v.R * 255), math.floor(v.G * 255), math.floor(v.B * 255)}
            elseif type(v) == "boolean" or type(v) == "number" or type(v) == "string" then
                t[k] = v
            end
        end
    end
    t.Keybinds = S.Keybinds
    t._version = CONFIG_VERSION
    t._savedAt = os.time and os.time() or 0
    return HttpService:JSONEncode(t)
end

local function reapplyAll()
    applyFullbright()
    applyFog()
    applyWorld()
    Shaders.apply(S.Shader)
    Cosmetics.applyDong()
    Cosmetics.applyFox()
    Cosmetics.applyWings()
    Cosmetics.applyHalo()
    Cosmetics.applyChinaHat()
    Cosmetics.applyKagune()
    Cosmetics.applyCompanion()
    Cosmetics.Cos.applyAura()
    Cosmetics.Cos.applyCrown()
    Cosmetics.Cos.applyHorns()
    Cosmetics.Cos.applyCatEars()
    Cosmetics.Cos.applyJetpack()
    Cosmetics.Cos.applyTail()
    Cosmetics.Cos.applyTopHat()
    Cosmetics.Cos.applyVisor()
    Cosmetics.Cos.applyScythe()
    Cosmetics.Cos.applyOniMask()
    Cosmetics.Cos.applyGasMask()
    Cosmetics.Cos.applyNeonMask()
    Cosmetics.Cos.applyCap()
    Cosmetics.Cos.applyCyberPack()
    Cosmetics.Cos.applyAngelPack()
    applyKorblox(S.Korblox)
    applyGhostLegs(S.GhostLegs)
    applyNoAnims(S.NoAnims)
    setAvatarScale(S.AvatarScale)
    applyAccent()
    applyUITransparency()
    uiScale.Scale = computeScale()
    if S.Optimize >= 3 then
        S.MotionBlur = false
        local mb = Lighting:FindFirstChild("HamerMotionBlur")
        if mb then mb.Size = 0 end
    end
    task.defer(function()
        if not Unloaded and S.MenuOpen then selectTab(currentTab) end
    end)
end

local function saveConfig()
    if not hasFileAPI() then toast("file api unavailable"); return end
    local name = safeName(S.ConfigName)
    local ok, err = pcall(function()
        if type(makefolder) == "function" and type(isfolder) == "function" and not isfolder(CONFIG_DIR) then
            makefolder(CONFIG_DIR)
        end
        writefile(CONFIG_DIR .. "/" .. name .. ".json", serialize())
    end)
    toast(ok and ("saved: " .. name) or ("save failed: " .. tostring(err)))
end

local function applyDecoded(decoded)
    if type(decoded) ~= "table" then return false, 0 end
    local version = tonumber(decoded._version) or 1
    for k, v in pairs(decoded) do
        local cur = S[k]
        if type(k) == "string" and string.sub(k, 1, 1) ~= "_" and cur ~= nil then
            if typeof(cur) == "Color3" and type(v) == "table" then
                S[k] = Color3.fromRGB(
                    tonumber(v[1]) or math.floor(cur.R * 255),
                    tonumber(v[2]) or math.floor(cur.G * 255),
                    tonumber(v[3]) or math.floor(cur.B * 255)
                )
            elseif typeof(cur) ~= "Color3" and type(cur) == type(v) then
                S[k] = v
            end
        end
    end
    if type(decoded.Keybinds) == "table" then
        local binds = {}
        for action, key in pairs(decoded.Keybinds) do
            if type(action) == "string" and type(key) == "string" then binds[action] = key end
        end
        S.Keybinds = binds
    end
    if version < 2 then
        if type(S.Keybinds) ~= "table" then S.Keybinds = {} end
        if S.Optimize == nil then S.Optimize = 2 end
        if S.AutoLoadConfig == nil then S.AutoLoadConfig = true end
    end
    reapplyAll()
    CE.setSilentAim(S.SilentAim)
    CE.setKillAll(S.KillAll)
    return true, version
end

local function loadConfig()
    if not hasFileAPI() then toast("file api unavailable"); return end
    local name = safeName(S.ConfigName)
    local path = CONFIG_DIR .. "/" .. name .. ".json"
    local ok, data = pcall(function() return readfile(path) end)
    if not ok or not data then toast("config not found: " .. name); return end
    local decOk, decoded = pcall(function() return HttpService:JSONDecode(data) end)
    if not decOk then toast("broken config"); return end
    local applied, version = applyDecoded(decoded)
    if not applied then toast("broken config"); return end
    toast("loaded: " .. name .. " (v" .. tostring(version) .. ")")
end

local function exportClipboard()
    if type(setclipboard) ~= "function" then toast("clipboard unavailable"); return end
    local ok, err = pcall(setclipboard, serialize())
    toast(ok and "config copied to clipboard" or ("export failed: " .. tostring(err)))
end

local function importClipboard()
    if type(getclipboard) ~= "function" then toast("clipboard unavailable"); return end
    local ok, data = pcall(getclipboard)
    if not ok or type(data) ~= "string" or data == "" then toast("clipboard is empty"); return end
    local decOk, decoded = pcall(function() return HttpService:JSONDecode(data) end)
    if not decOk then toast("clipboard is not valid config"); return end
    local applied, version = applyDecoded(decoded)
    if not applied then toast("clipboard is not valid config"); return end
    toast("imported config v" .. tostring(version))
end

local function deleteConfig()
    if not hasFileAPI() then toast("file api unavailable"); return end
    local name = safeName(S.ConfigName)
    local ok = pcall(function()
        if type(delfile) == "function" then
            delfile(CONFIG_DIR .. "/" .. name .. ".json")
        end
    end)
    toast(ok and ("deleted: " .. name) or "delete failed")
end

return {
    dir = CONFIG_DIR, hasFileAPI = hasFileAPI, safeName = safeName,
    save = saveConfig, load = loadConfig, delete = deleteConfig, reapply = reapplyAll,
    exportClipboard = exportClipboard, importClipboard = importClipboard, version = CONFIG_VERSION
}
end)()

local function unload()
    Unloaded = true
    for _, c in ipairs(Conns) do
        pcall(function() c:Disconnect() end)
    end
    Conns = {}
    stopDrone()
    Flick.stop()
    Extras.stop()
    S.Dong, S.Wings, S.Halo, S.ChinaHat = false, false, false, false
    S.Kagune, S.Companion, S.NoAnims = false, false, false
    S.Fox, S.CoinFarm, S.FarmNoClip, S.FarmUnderMap = false, false, false, false
    S.ESP, S.ESPChams, S.ESPChamsThrough = false, false, false
    S.Aura, S.Crown, S.Horns, S.CatEars, S.Jetpack = false, false, false, false, false
    S.Tail, S.TopHat, S.Visor, S.Scythe = false, false, false, false
    S.OniMask, S.GasMask, S.NeonMask, S.Cap = false, false, false, false
    S.CyberPack, S.AngelPack = false, false
    S.KillAll, S.SilentAim = false, false
    if CE.KillAll.conn then CE.KillAll.conn:Disconnect(); CE.KillAll.conn = nil end
    ESPEngine.cleanup()
    Cosmetics.applyDong()
    Cosmetics.applyFox()
    Cosmetics.applyWings()
    Cosmetics.applyHalo()
    Cosmetics.applyChinaHat()
    Cosmetics.applyKagune()
    Cosmetics.applyCompanion()
    Cosmetics.Cos.applyAura()
    Cosmetics.Cos.applyCrown()
    Cosmetics.Cos.applyHorns()
    Cosmetics.Cos.applyCatEars()
    Cosmetics.Cos.applyJetpack()
    Cosmetics.Cos.applyTail()
    Cosmetics.Cos.applyTopHat()
    Cosmetics.Cos.applyVisor()
    Cosmetics.Cos.applyScythe()
    Cosmetics.Cos.applyOniMask()
    Cosmetics.Cos.applyGasMask()
    Cosmetics.Cos.applyNeonMask()
    Cosmetics.Cos.applyCap()
    Cosmetics.Cos.applyCyberPack()
    Cosmetics.Cos.applyAngelPack()
    for p, v in pairs(noclipSaved) do
        if p.Parent then p.CanCollide = v end
    end
    noclipSaved = {}
    if UI.flyBV then UI.flyBV:Destroy() end
    if UI.flyBG then UI.flyBG:Destroy() end
    Coin.stop()
    S.Fullbright = false
    applyFullbright()
    S.Fog = false
    applyFog()
    S.World = false
    applyWorld()
    S.Shader = "off"
    Shaders.clear()
    S.MotionBlur = false
    if UI.mbEffect then UI.mbEffect:Destroy() end
    Wm.cleanup()
    if blur then blur:Destroy() end
    if gui then gui:Destroy() end
    if ESPEngine.gui then ESPEngine.gui:Destroy() end
end

builders.cosmetics = function()
    local folders = {
        {"all", "All"}, {"hats", "Hats"}, {"masks", "Masks"},
        {"packs", "Packs"}, {"auras", "Auras"}, {"effects", "FX"}
    }
    local folder = S.CosFolder
    local valid = false
    for _, f in ipairs(folders) do
        if f[1] == folder then valid = true end
    end
    if not valid then
        folder = "all"
        S.CosFolder = "all"
    end
    local row = Instance.new("Frame")
    row.Size = UDim2.new(1, 0, 0, S.Mobile and 36 or 32)
    row.BackgroundTransparency = 1
    row.LayoutOrder = -1
    row.Parent = grid
    local rowLayout = Instance.new("UIListLayout")
    rowLayout.FillDirection = Enum.FillDirection.Horizontal
    rowLayout.Padding = UDim.new(0, 6)
    rowLayout.SortOrder = Enum.SortOrder.LayoutOrder
    rowLayout.Parent = row
    for i, f in ipairs(folders) do
        local b = Instance.new("TextButton")
        b.Size = UDim2.new(1 / #folders, -5, 1, 0)
        b.BackgroundColor3 = f[1] == folder and UI.navHi or UI.card
        b.BackgroundTransparency = f[1] == folder and 0 or 0.4
        b.Text = f[2]
        b.Font = FONT_BOLD
        b.TextSize = FS(11)
        b.TextColor3 = f[1] == folder and UI.text or UI.sub
        b.BorderSizePixel = 0
        b.AutoButtonColor = false
        b.LayoutOrder = i
        b.ZIndex = 12
        b.Parent = row
        corner(b, 8)
        stroke(b, f[1] == folder and accent() or UI.line, f[1] == folder and 0.4 or 0.94, 1)
        b.MouseButton1Click:Connect(function()
            S.CosFolder = f[1]
            click()
            selectTab("cosmetics")
        end)
    end
    local function cosmeticSettings(item, apply, c1Label, c2Label)
        colorRow(c1Label or "Main color", item .. "Color1", apply)
        colorRow(c2Label or "Accent color", item .. "Color2", apply)
        toggleRow("Glow", item .. "Glow", apply)
    end
    local function hats()
        moduleRow("Crown", "Crown", function()
            cosmeticSettings("Crown", Cosmetics.Cos.applyCrown, "Gold color", "Gem color")
        end, Cosmetics.Cos.applyCrown)
        moduleRow("Cap", "Cap", function()
            cosmeticSettings("Cap", Cosmetics.Cos.applyCap, "Cap color", "Detail color")
        end, Cosmetics.Cos.applyCap)
        moduleRow("Top hat", "TopHat", function()
            cosmeticSettings("TopHat", Cosmetics.Cos.applyTopHat, "Band color", "Flower color")
        end, Cosmetics.Cos.applyTopHat)
        moduleRow("China hat", "ChinaHat", function()
            cosmeticSettings("ChinaHat", Cosmetics.applyChinaHat, "Base color", "Top color")
        end, Cosmetics.applyChinaHat)
        moduleRow("Cat ears", "CatEars", function()
            cosmeticSettings("CatEars", Cosmetics.Cos.applyCatEars, "Outer color", "Inner color")
        end, Cosmetics.Cos.applyCatEars)
        moduleRow("Demon horns", "Horns", function()
            cosmeticSettings("Horns", Cosmetics.Cos.applyHorns, "Base color", "Tip color")
        end, Cosmetics.Cos.applyHorns)
    end
    local function masks()
        moduleRow("Oni mask", "OniMask", function()
            cosmeticSettings("OniMask", Cosmetics.Cos.applyOniMask, "Mask color", "Eye color")
        end, Cosmetics.Cos.applyOniMask)
        moduleRow("Gas mask", "GasMask", function()
            cosmeticSettings("GasMask", Cosmetics.Cos.applyGasMask, "Lens color", "Body color")
        end, Cosmetics.Cos.applyGasMask)
        moduleRow("Neon mask", "NeonMask", function()
            cosmeticSettings("NeonMask", Cosmetics.Cos.applyNeonMask, "Neon color", "Detail color")
        end, Cosmetics.Cos.applyNeonMask)
        moduleRow("Neon visor", "Visor", function()
            cosmeticSettings("Visor", Cosmetics.Cos.applyVisor, "Frame color", "Lens color")
        end, Cosmetics.Cos.applyVisor)
    end
    local function packs()
        moduleRow("Jetpack", "Jetpack", function()
            cosmeticSettings("Jetpack", Cosmetics.Cos.applyJetpack, "Core color", "Tank color")
        end, Cosmetics.Cos.applyJetpack)
        moduleRow("Cyber backpack", "CyberPack", function()
            cosmeticSettings("CyberPack", Cosmetics.Cos.applyCyberPack, "Core color", "Armor color")
        end, Cosmetics.Cos.applyCyberPack)
        moduleRow("Angel backpack", "AngelPack", function()
            cosmeticSettings("AngelPack", Cosmetics.Cos.applyAngelPack, "Feather color", "Gold color")
        end, Cosmetics.Cos.applyAngelPack)
        moduleRow("Wings", "Wings", function()
            cosmeticSettings("Wings", Cosmetics.applyWings, "Upper color", "Tip color")
        end, Cosmetics.applyWings)
        moduleRow("Scythe", "Scythe", function()
            cosmeticSettings("Scythe", Cosmetics.Cos.applyScythe, "Blade color", "Grip color")
        end, Cosmetics.Cos.applyScythe)
    end
    local function auras()
        moduleRow("Neon Aura", "Aura", function()
            cosmeticSettings("Aura", Cosmetics.Cos.applyAura, "Inner color", "Outer color")
        end, Cosmetics.Cos.applyAura)
        moduleRow("Halo", "Halo", function()
            cosmeticSettings("Halo", Cosmetics.applyHalo, "Halo color", "Spark color")
        end, Cosmetics.applyHalo)
    end
    local function effects()
        moduleRow("Kagune", "Kagune", function()
            cosmeticSettings("Kagune", Cosmetics.applyKagune, "Base color", "Tip color")
        end, Cosmetics.applyKagune)
        moduleRow("Neon tail", "Tail", function()
            cosmeticSettings("Tail", Cosmetics.Cos.applyTail, "Base color", "Tip color")
        end, Cosmetics.Cos.applyTail)
        moduleRow("Mini Fox", "Fox", function()
            colorRow("Fur color", "FoxColor1", Cosmetics.applyFox)
            colorRow("Accent color", "FoxColor2", Cosmetics.applyFox)
            toggleRow("Glow", "FoxGlow", Cosmetics.applyFox)
            stepRow("Size", "FoxSize", 0.5, 2, 0.1, "", Cosmetics.applyFox)
        end, Cosmetics.applyFox)
        moduleRow("Companion", "Companion", function()
            cosmeticSettings("Companion", Cosmetics.applyCompanion, "Inner color", "Outer color")
        end, Cosmetics.applyCompanion)
        moduleRow("3D Dick", "Dong", function()
            stepRow("Size", "DongSize", 0.4, 3, 0.1, "", function()
                if S.Dong then Cosmetics.applyDong() end
            end)
            toggleRow("Glow", "DongGlow", function()
                if S.Dong then Cosmetics.applyDong() end
            end)
            colorRow("Skin color", "DongColor", function()
                if S.Dong then Cosmetics.applyDong() end
            end)
            colorRow("Head color", "DongHeadColor", function()
                if S.Dong then Cosmetics.applyDong() end
            end)
        end, Cosmetics.applyDong)
        moduleRow("Korblox leg", "Korblox", nil, applyKorblox)
        moduleRow("Ghost legs", "GhostLegs", nil, applyGhostLegs)
        moduleRow("No animations", "NoAnims", nil, applyNoAnims)
    end
    if folder == "all" or folder == "hats" then hats() end
    if folder == "all" or folder == "masks" then masks() end
    if folder == "all" or folder == "packs" then packs() end
    if folder == "all" or folder == "auras" then auras() end
    if folder == "all" or folder == "effects" then effects() end
end

builders.themes = function()
    moduleRow("Transparent UI", "Transparent", nil, function()
        applyUITransparency()
        task.defer(function()
            if not Unloaded and S.MenuOpen then selectTab(currentTab) end
        end)
    end)
    for _, name in ipairs(ACCENT_ORDER) do
        themeCard(name)
    end
end

builders.places = function()
    actionRow("Rejoin server", "Reconnect to this place.", function()
        pcall(function()
            TeleportService:Teleport(game.PlaceId, LocalPlayer)
        end)
    end)
    actionRow("Reset character", "Respawn your avatar.", function()
        local char = LocalPlayer.Character
        local hum = char and char:FindFirstChildOfClass("Humanoid")
        if hum then hum.Health = 0 end
    end)
    actionRow("Copy Job ID", "Copy the server id.", function()
        if setclipboard then
            pcall(function() setclipboard(tostring(game.JobId)) end)
        end
    end)
end

builders.configs = function()
    textRow("Config name", "ConfigName", "default")
    moduleRow("Language", nil, function()
        settingChoice("Language", "Lang", {"EN", "RU"}, function()
            applyLanguageUI()
        end)
    end)
    toggleRow("Auto load on start", "AutoLoadConfig")
    stepRow("Optimization", "Optimize", 1, 3, 1, "", applyOptimization)
    actionRow("Save config", "Write current settings to file.", Cfg.save)
    actionRow("Load config", "Apply saved settings.", Cfg.load)
    actionRow("Export to clipboard", "Copy current config as JSON.", Cfg.exportClipboard)
    actionRow("Import from clipboard", "Apply a config from clipboard.", Cfg.importClipboard)
    actionRow("Delete config", "Remove saved config.", Cfg.delete)
    moduleRow("Hotkey manager", nil, function()
        for _, entry in ipairs(UI.KEYBIND_LIST) do
            UI.keybindRow(entry[1], entry[2])
        end
        actionRow("Clear all keybinds", "Remove every hotkey", function()
            S.Keybinds = {}
            toast("keybinds cleared")
        end)
    end)
end

builders.player = function()
    moduleRow("Phone mode", "Mobile", nil, function()
        uiScale.Scale = computeScale()
        task.defer(function()
            if not Unloaded and S.MenuOpen then selectTab(currentTab) end
        end)
    end)
    moduleRow("Watermark", "Watermark")
    stepRow("Avatar scale", "AvatarScale", 0.3, 2, 0.1, "", setAvatarScale)
    actionRow("Emote menu", "Quick dance / cheer / sit.", Wm.toggle)
    actionRow("Destroy GUI", "Unload hamer.", unload)
end

CE.KEY_ACTIONS = {
    ESP = function()
        S.ESP = not S.ESP
        toast("ESP " .. (S.ESP and "on" or "off"))
    end,
    Aimbot = function()
        S.Aimbot = not S.Aimbot
        toast("Aimbot " .. (S.Aimbot and "on" or "off"))
    end,
    SilentAim = function()
        if CE.setSilentAim(not S.SilentAim) then toast("Silent Aim " .. (S.SilentAim and "on" or "off")) end
    end,
    KillAll = function()
        CE.setKillAll(not S.KillAll)
        toast("Kill All " .. (S.KillAll and "on" or "off"))
    end,
    Fly = function()
        S.Fly = not S.Fly
        toast("Fly " .. (S.Fly and "on" or "off"))
    end,
    Noclip = function()
        S.Noclip = not S.Noclip
        toast("Noclip " .. (S.Noclip and "on" or "off"))
    end,
    Speed = function()
        S.Speed = not S.Speed
        toast("Speed " .. (S.Speed and "on" or "off"))
    end,
    CoinFarm = function()
        S.CoinFarm = not S.CoinFarm
        toast("Coin Farm " .. (S.CoinFarm and "on" or "off"))
    end,
    Fullbright = function()
        S.Fullbright = not S.Fullbright
        applyFullbright()
        toast("Fullbright " .. (S.Fullbright and "on" or "off"))
    end,
    Fox = function()
        S.Fox = not S.Fox
        Cosmetics.applyFox()
        toast("Mini Fox " .. (S.Fox and "on" or "off"))
    end,
    Wings = function()
        S.Wings = not S.Wings
        Cosmetics.applyWings()
        toast("Wings " .. (S.Wings and "on" or "off"))
    end,
    Aura = function()
        S.Aura = not S.Aura
        Cosmetics.Cos.applyAura()
        toast("Aura " .. (S.Aura and "on" or "off"))
    end
}

conn(UIS.InputBegan:Connect(function(input, gp)
    if gp or input.UserInputType ~= Enum.UserInputType.Keyboard then return end
    if UIS:GetFocusedTextBox() then return end
    if UI.activeBind then
        local action = UI.activeBind.action
        local key = input.KeyCode
        if key == Enum.KeyCode.Escape or key == Enum.KeyCode.Backspace or key == Enum.KeyCode.Delete then
            S.Keybinds[action] = nil
        elseif key ~= Enum.KeyCode.Unknown then
            for other, value in pairs(S.Keybinds) do
                if other ~= action and value == key.Name then S.Keybinds[other] = nil end
            end
            S.Keybinds[action] = key.Name
        end
        if UI.activeBind.refresh then UI.activeBind.refresh() end
        toast("keybind: " .. (S.Keybinds[action] or "none"))
        UI.activeBind = nil
        return
    end
    local pressed = input.KeyCode.Name
    for action, key in pairs(S.Keybinds) do
        if key == pressed and CE.KEY_ACTIONS[action] then
            CE.KEY_ACTIONS[action]()
            break
        end
    end
end))

conn(LocalPlayer.CharacterAdded:Connect(function()
    task.wait(1)
    if Unloaded then return end
    if S.Dong then Cosmetics.applyDong() end
    if S.Fox then Cosmetics.applyFox() end
    if S.Wings then Cosmetics.applyWings() end
    if S.Halo then Cosmetics.applyHalo() end
    if S.ChinaHat then Cosmetics.applyChinaHat() end
    if S.Kagune then Cosmetics.applyKagune() end
    if S.Companion then Cosmetics.applyCompanion() end
    if S.Aura then Cosmetics.Cos.applyAura() end
    if S.Crown then Cosmetics.Cos.applyCrown() end
    if S.Horns then Cosmetics.Cos.applyHorns() end
    if S.CatEars then Cosmetics.Cos.applyCatEars() end
    if S.Jetpack then Cosmetics.Cos.applyJetpack() end
    if S.Tail then Cosmetics.Cos.applyTail() end
    if S.TopHat then Cosmetics.Cos.applyTopHat() end
    if S.Visor then Cosmetics.Cos.applyVisor() end
    if S.Scythe then Cosmetics.Cos.applyScythe() end
    if S.OniMask then Cosmetics.Cos.applyOniMask() end
    if S.GasMask then Cosmetics.Cos.applyGasMask() end
    if S.NeonMask then Cosmetics.Cos.applyNeonMask() end
    if S.Cap then Cosmetics.Cos.applyCap() end
    if S.CyberPack then Cosmetics.Cos.applyCyberPack() end
    if S.AngelPack then Cosmetics.Cos.applyAngelPack() end
    applyKorblox(S.Korblox)
    applyGhostLegs(S.GhostLegs)
    applyNoAnims(S.NoAnims)
    setAvatarScale(S.AvatarScale)
end))

if S.AutoLoadConfig and Cfg.hasFileAPI() then
    local exists = true
    local path = Cfg.dir .. "/" .. Cfg.safeName(S.ConfigName) .. ".json"
    if type(isfile) == "function" then exists = isfile(path) end
    if exists then pcall(Cfg.load) end
end
Shaders.apply(S.Shader)
if S.KillAll then CE.setKillAll(true) end
if S.SilentAim then CE.setSilentAim(true) end
if S.Flick then Flick.enable() end

selectTab("visual")
applyLanguageUI()
setMenu(true)

print("hamer loaded (no key)")
