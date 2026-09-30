-- ============================================
-- WindUI - 环境与天气控制器 (性能优化 + 雪花修复版)
-- ============================================
local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/ggsq1741-debug/cQ/refs/heads/main/main.lua"))()

local Lighting = game:GetService("Lighting")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local Atmosphere = Lighting:FindFirstChildOfClass("Atmosphere")
if not Atmosphere then
    Atmosphere = Instance.new("Atmosphere")
    Atmosphere.Parent = Lighting
end

local Sky = Lighting:FindFirstChild("Realistic Skybox")
if not Sky then
    Sky = Instance.new("Sky")
    Sky.Name = "Realistic Skybox"
    Sky.Parent = Lighting
end

local ProfilesFolder = Lighting:FindFirstChild("LightingProfiles")

local Window = WindUI:CreateWindow({
    Title = "环境控制器",
    Author = "WindUI",
    Icon = "solar:sun-bold",
    Folder = "EnvController",
    Size = UDim2.fromOffset(450, 600),
    ToggleKey = Enum.KeyCode.RightControl,
    Transparent = true,
    Theme = "Dark",
    HideSearchBar = true,
    User = { Enabled = true },
})

local Tab = Window:Tab({ Title = "环境控制", Icon = "sun" })

-- ================= 防覆盖核心（性能优化） =================
local forceApply = {}
local forceRunning = false
local forceThread = nil
local lastWritten = {}

local function tryApplyOne(key, value)
    if lastWritten[key] == value then return end
    lastWritten[key] = value
    pcall(function()
        if key:find("Atmosphere_") then
            local prop = key:gsub("Atmosphere_", "")
            Atmosphere[prop] = value
        else
            Lighting[key] = value
        end
    end)
end

local function startForceApply()
    if forceRunning then return end
    forceRunning = true
    forceThread = task.spawn(function()
        while forceRunning do
            for k, v in pairs(forceApply) do
                tryApplyOne(k, v)
            end
            task.wait(0.2)
        end
    end)
end

local function stopForceApply()
    forceRunning = false
    forceApply = {}
    lastWritten = {}
    forceThread = nil
end

-- ================= 下雪系统（雪花向下修复） =================
local snowPart = nil
local snowEmitter = nil
local snowEnabled = false

local function createSnowEmitter()
    local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    local hrp = char:WaitForChild("HumanoidRootPart")
    
    if snowPart and snowPart.Parent then
        snowPart:Destroy()
    end
    
    snowPart = Instance.new("Part")
    snowPart.Name = "SnowPart"
    snowPart.Size = Vector3.new(150, 1, 150)
    snowPart.Position = hrp.Position + Vector3.new(0, 40, 0)
    snowPart.Anchored = true
    snowPart.CanCollide = false
    snowPart.Transparency = 1
    snowPart.CastShadow = false
    snowPart.Parent = workspace
    
    snowEmitter = Instance.new("ParticleEmitter")
    snowEmitter.Name = "SnowEmitter"
    snowEmitter.Texture = "rbxassetid://1316045217"
    snowEmitter.Rate = 100
    snowEmitter.Lifetime = NumberRange.new(4, 6)
    snowEmitter.Speed = NumberRange.new(1, 3)                     -- 初速度慢
    snowEmitter.SpreadAngle = Vector2.new(15, 15)                 -- 左右扩散
    snowEmitter.Rotation = NumberRange.new(0, 360)
    snowEmitter.RotSpeed = NumberRange.new(-30, 30)
    snowEmitter.Acceleration = Vector3.new(0, -35, 0)             -- ★ 关键：向下的重力
    snowEmitter.Drag = 2                                          -- 空气阻力，飘得更自然
    snowEmitter.Size = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.5),
        NumberSequenceKeypoint.new(1, 0.3),
    })
    snowEmitter.Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.3),
        NumberSequenceKeypoint.new(1, 0.8),
    })
    snowEmitter.Color = ColorSequence.new(Color3.fromRGB(255, 255, 255))
    snowEmitter.LightEmission = 0
    snowEmitter.Parent = snowPart
    
    -- 跟随玩家
    task.spawn(function()
        while snowEnabled and snowPart and snowPart.Parent do
            local c = LocalPlayer.Character
            local h = c and c:FindFirstChild("HumanoidRootPart")
            if h then
                snowPart.Position = h.Position + Vector3.new(0, 40, 0)
            end
            task.wait(0.3)
        end
    end)
end

local function toggleSnow(enable)
    snowEnabled = enable
    if enable then
        if not snowEmitter then createSnowEmitter() end
    else
        if snowPart and snowPart.Parent then
            snowPart:Destroy()
        end
        snowPart = nil
        snowEmitter = nil
    end
end

-- ================= 预设 =================
local presets = {
    ["白天"] = {
        ClockTime = 14, Brightness = 3,
        Ambient = Color3.fromRGB(100,100,100),
        OutdoorAmbient = Color3.fromRGB(100,100,100),
        FogEnd = 10000,
        Atmosphere_Density = 0, Atmosphere_Haze = 0,
        Snow = false,
    },
    ["夜晚"] = {
        ClockTime = 0, Brightness = 1,
        Ambient = Color3.fromRGB(20,20,20),
        OutdoorAmbient = Color3.fromRGB(20,20,20),
        FogEnd = 500,
        Atmosphere_Density = 0.5, Atmosphere_Haze = 2,
        Snow = false,
    },
    ["黄昏"] = {
        ClockTime = 18, Brightness = 2,
        Ambient = Color3.fromRGB(80,50,50),
        OutdoorAmbient = Color3.fromRGB(80,50,50),
        FogEnd = 1000,
        Atmosphere_Density = 0.3, Atmosphere_Haze = 5,
        Snow = false,
    },
    ["雾天"] = {
        ClockTime = 12, Brightness = 1,
        Ambient = Color3.fromRGB(150,150,150),
        OutdoorAmbient = Color3.fromRGB(150,150,150),
        FogEnd = 100,
        Atmosphere_Density = 0.6, Atmosphere_Haze = 10,
        Snow = false,
    },
    ["下雪天"] = {
        ClockTime = 8, Brightness = 2,
        Ambient = Color3.fromRGB(180,190,210),
        OutdoorAmbient = Color3.fromRGB(180,190,210),
        FogEnd = 800,
        Atmosphere_Density = 0.4, Atmosphere_Haze = 6,
        Snow = true,
    },
    ["暴风雪"] = {
        ClockTime = 2, Brightness = 1,
        Ambient = Color3.fromRGB(120,130,150),
        OutdoorAmbient = Color3.fromRGB(120,130,150),
        FogEnd = 200,
        Atmosphere_Density = 0.7, Atmosphere_Haze = 15,
        Snow = true,
    },
}

local function applyPreset(presetName)
    local p = presets[presetName]
    if not p then return end
    
    lastWritten = {}
    forceApply = {}
    
    for k, v in pairs(p) do
        if k ~= "Snow" then
            forceApply[k] = v
        end
    end
    
    startForceApply()
    toggleSnow(p.Snow == true)
    
    WindUI:Notify({ Title = "已切换", Content = presetName, Duration = 3 })
end

-- ================= UI 控件 =================
Tab:Paragraph({
    Title = "环境与天气 (雪花向下修复版)",
    Desc = "0.2 秒抢一次控制权，雪花自然向下飘落",
})

local presetList = {}
for k, _ in pairs(presets) do table.insert(presetList, k) end
table.sort(presetList)

Tab:Dropdown({
    Title = "快速切换天气",
    Values = presetList,
    Value = " 白天",
    Callback = function(v) applyPreset(v) end,
})

Tab:Toggle({
    Title = "停止强制覆盖",
    Desc = "恢复服务器默认环境",
    Value = false,
    Callback = function(v)
        if v then
            stopForceApply()
            toggleSnow(false)
        end
    end,
})

Tab:Divider()

local manualLighting = Tab:AddLeftGroupbox("光照微调")

manualLighting:AddSlider("ClockTime", {
    Title = "时间",
    Default = 14, Min = 0, Max = 24, Rounding = 0,
    Callback = function(v)
        forceApply.ClockTime = v
        lastWritten.ClockTime = nil
        startForceApply()
    end,
})

manualLighting:AddSlider("Brightness", {
    Title = "亮度",
    Default = 3, Min = 0, Max = 10, Rounding = 1,
    Callback = function(v)
        forceApply.Brightness = v
        lastWritten.Brightness = nil
        startForceApply()
    end,
})

manualLighting:AddSlider("FogEnd", {
    Title = "雾距",
    Default = 10000, Min = 0, Max = 10000, Rounding = 0,
    Callback = function(v)
        forceApply.FogEnd = v
        lastWritten.FogEnd = nil
        startForceApply()
    end,
})

local manualAtmos = Tab:AddRightGroupbox("氛围微调")

manualAtmos:AddSlider("Density", {
    Title = "雾密度",
    Default = 0, Min = 0, Max = 1, Rounding = 2,
    Callback = function(v)
        forceApply.Atmosphere_Density = v
        lastWritten.Atmosphere_Density = nil
        startForceApply()
    end,
})

manualAtmos:AddSlider("Haze", {
    Title = "雾霾",
    Default = 0, Min = 0, Max = 10, Rounding = 1,
    Callback = function(v)
        forceApply.Atmosphere_Haze = v
        lastWritten.Atmosphere_Haze = nil
        startForceApply()
    end,
})

Tab:Divider()

Tab:Toggle({
    Title = "开启下雪",
    Desc = "粒子数 100/s，雪花自然向下飘",
    Value = false,
    Callback = function(v) toggleSnow(v) end,
})

Tab:Button({
    Title = "清除环境（恢复默认）",
    Callback = function()
        stopForceApply()
        toggleSnow(false)
        WindUI:Notify({ Title = "已清除", Content = "环境已恢复默认", Duration = 3 })
    end,
})

WindUI:Notify({ Title = "环境控制器", Content = "雪花修复版已加载", Duration = 5 })