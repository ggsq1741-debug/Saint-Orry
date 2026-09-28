-- ============================================
-- 检测多个指定玩家加入服务器并提示（纯源码）
-- ============================================

local TARGET_NAMES = {
    "Suponjibobu00",
    "YK666308",
    "某某某3",
} -- 需要监控的玩家名字，随意增加

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- 快速查表
local targetSet = {}
for _, name in ipairs(TARGET_NAMES) do
    targetSet[string.lower(name)] = name
end

-- 创建提示界面
local function showNotification(playerName)
    local oldGui = LocalPlayer:WaitForChild("PlayerGui"):FindFirstChild("TargetJoinNotify")
    if oldGui then oldGui:Destroy() end

    local gui = Instance.new("ScreenGui")
    gui.Name = "TargetJoinNotify"
    gui.ResetOnSpawn = false
    gui.IgnoreGuiInset = true
    gui.Parent = LocalPlayer:WaitForChild("PlayerGui")

    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 400, 0, 80)
    frame.Position = UDim2.new(0.5, -200, 0, 50)
    frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    frame.BackgroundTransparency = 0.2
    frame.BorderSizePixel = 0
    frame.Parent = gui

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 12)
    corner.Parent = frame

    local stroke = Instance.new("UIStroke")
    stroke.Color = Color3.fromRGB(255, 80, 80)
    stroke.Thickness = 2
    stroke.Parent = frame

    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, 0, 0, 30)
    title.Position = UDim2.new(0, 0, 0, 8)
    title.BackgroundTransparency = 1
    title.Text = "目标玩家加入不是脚本作者就是管理员"
    title.TextColor3 = Color3.fromRGB(255, 80, 80)
    title.TextSize = 20
    title.Font = Enum.Font.GothamBold
    title.Parent = frame

    local content = Instance.new("TextLabel")
    content.Size = UDim2.new(1, 0, 0, 28)
    content.Position = UDim2.new(0, 0, 0, 40)
    content.BackgroundTransparency = 1
    content.Text = playerName .. " 加入了服务器！"
    content.TextColor3 = Color3.fromRGB(255, 255, 255)
    content.TextSize = 16
    content.Font = Enum.Font.Gotham
    content.Parent = frame

    -- 淡入
    frame.BackgroundTransparency = 1
    title.TextTransparency = 1
    content.TextTransparency = 1
    task.spawn(function()
        for i = 0, 20 do
            local t = i / 20
            frame.BackgroundTransparency = 0.8 - 0.6 * t
            title.TextTransparency = 1 - t
            content.TextTransparency = 1 - t
            task.wait(0.01)
        end
    end)

    -- 30 秒后淡出
    task.delay(30, function()
        for i = 0, 20 do
            local t = i / 20
            frame.BackgroundTransparency = 0.2 + 0.8 * t
            title.TextTransparency = t
            content.TextTransparency = t
            task.wait(0.01)
        end
        gui:Destroy()
    end)

    -- 提示音
    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://4590662766"
    sound.Volume = 0.9
    sound.Parent = gui
    sound:Play()
end

-- 检查玩家是否在监控列表里
local function checkPlayer(player)
    if targetSet[string.lower(player.Name)] then
        showNotification(player.Name)
    end
end

-- 检查已经在服务器里的玩家
for _, player in ipairs(Players:GetPlayers()) do
    checkPlayer(player)
end

-- 监听后续加入的玩家
Players.PlayerAdded:Connect(checkPlayer)

print = function() end
warn = function() end
printidentity = function() end

local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/ggsq1741-debug/cQ/refs/heads/main/main.lua"))()
WindUI:Notify({
    Title = "",
    Content = "有问题bug联系作者",
    Icon = "circle-user-round",
    Duration = 20,
})
WindUI:Notify({
    Title = "问题",
    Content = "跑步拉回的话请连续跳跃在奔跑",
    Icon = "circle-user-round",
    Duration = 10,
})
WindUI:Notify({
    Title = "纸飞机",
    Content = "@you25801",
    Icon = "circle-user-round",
    Duration = 120,
})
WindUI:Notify({
    Title = "更新",
    Content = "灵魂/实体飞行和ESP2",
    Icon = "circle-user-round",
    Duration = 15,
})
local Popup = WindUI:Popup({
    Title = "hi你好👋",
    Content = "更新了愤怒机器人自动化农场刷钱",
    Buttons = {
        {
            Title = "Get Started",
            Callback = function()
                print("Getting started...")
            end
        }
    }
})
-- ==================== 自定义三角洲行动风格主题（精确覆盖所有文字） ====================
local techGreen = Color3.fromRGB(0, 255, 160)   -- 科技绿
local white = Color3.fromRGB(245, 248, 255)
local lightGray = Color3.fromRGB(175, 185, 200)

WindUI:AddTheme({
    Name = "DeltaForce",
    -- 【全局所有图标颜色！侧边标签图标、控件小图标全部变成绿色】
    Icon = Color3.fromHex("#22c55e"), 

    WindowTopbarTitle = techGreen,
    WindowTopbarAuthor = techGreen,
    TabTitle = techGreen,

    ElementTitle = white,
    ButtonText = white,
    PopupTitle = white,
    DialogTitle = white,

    ElementDesc = lightGray,
    PopupContent = lightGray,
    DialogContent = lightGray,

    PlaceholderText = techGreen,

    TooltipText = white,
    TooltipSecondaryText = white,
})
WindUI:SetTheme("DeltaForce")
-- 获取服务
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
-- 创建主窗口
local Window = WindUI:CreateWindow({
    Title = "港猫的通缉Wanted中国希望",
    Author = "作者港猫",
    Folder = "MyHub",
    Transparent = true,
    Theme = "DeltaForce",
    SideBarWidth = 130,
    HideSearchBar = false,
    ScrollBarEnabled = true,
    Background = "https://raw.githubusercontent.com/ggsq1741-debug/cQ/refs/heads/main/73bb4309-492f-4ecd-964f-7aa362722299.png",
    BackgroundImageTransparency = 0.4,
    User = { Enabled = true },
    ToggleKey = Enum.KeyCode.F,
})

print("窗口标题应为绿色，控件标题应为白色")
local Tabs = {
    wj = Window:Tab({ Title = "玩家", Icon = "users" }),
    sf = Window:Tab({ Title = "甩飞", Icon = "rbxassetid://7733799371" }),
    fc = Window:Tab({ Title = "亚洲车王", Icon = "rbxassetid://7733708835" }),
    jq = Window:Tab({ Title = "愤怒BOT", Icon = "rbxassetid://7733916988" }),
    lc = Window:Tab({ Title = "自动农场", Icon = "rbxassetid://7733920117" }),
    jx = Window:Tab({ Title = "远程击杀+雷达", Icon = "crown" }), 
    gh = Window:Tab({ Title = "光环", Icon = "crown" }),
    bot = Window:Tab({ Title = "瞄准", Icon = "target" }),
    zj = Window:Tab({ Title = "子弹追踪", Icon = "target" }),
    ESP = Window:Tab({ Title = "ESP", Icon = "eye" }),
    ESPP = Window:Tab({ Title = "ESP2", Icon = "eye" }),
    pg = Window:Tab({ Title = "苹果端ESP", Icon = "eye" }),
    wb = Window:Tab({ Title = "ESP物品", Icon = "box" }),
    qq = Window:Tab({ Title = "删除", Icon = "trash-2" }),
    rsao = Window:Tab({ Title = "娱乐功能", Icon = "zap" }),
    gm = Window:Tab({ Title = "购买", Icon = "shopping-cart" }),
}
-- ============================================================
-- ==================== 工具函数 ====================
local function getCharacter()
    if LocalPlayer and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        return LocalPlayer.Character
    end
    return nil
end
-- ==================== 无限跳（JumpRequest 事件） ====================
local isInfiniteJumpEnabled = false
UserInputService.JumpRequest:Connect(function()
    if isInfiniteJumpEnabled then
        local character = getCharacter()
        if character then
            local humanoid = character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
            end
        end
    end
end)
------------===============----------
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local speedConn = nil
local currentSpeed = 1
-- 刷新角色&重连加速
local speedConn = nil
local currentSpeed = 1
-- 角色销毁/关闭功能自动断开连接
local function updateChar()
    local char = LocalPlayer.Character
    local hum = char and char:FindFirstChildOfClass("Humanoid")
    if speedConn then
        speedConn:Disconnect()
        speedConn = nil
    end
    if not hum or currentSpeed <= 1 then return end
    -- 降低更新频率，不用每帧
    speedConn = RunService.Heartbeat:Connect(function()
        if not LocalPlayer.Character then
            speedConn:Disconnect()
            speedConn = nil
            return
        end
        local h = LocalPlayer.Character.Humanoid
        if h.MoveDirection.Magnitude > 0 then
            LocalPlayer.Character:TranslateBy(h.MoveDirection * currentSpeed / 10)
        end
    end)
end
LocalPlayer.CharacterAdded:Connect(updateChar)
task.spawn(updateChar)
Tabs.wj:Code({
    Title = "你好",
    Code = "QQ售后1125514261"
})
Tabs.wj:Input({
    Title = "超级快跑",
    Placeholder = "输入1~200数字",
    Default = "1",
    Numeric = true,
    Callback = function(val)
        local num = tonumber(val)
        if not num then return end
        currentSpeed = math.clamp(num,1,200)
        updateChar()
    end
})
Tabs.wj:Slider({
    Title = "超级快跑",
    Desc = "",
    Value = {Min = 1, Max = 200, Default = 1},
    Step = 1,
    IsTextbox = true,
    Callback = function(val)
        currentSpeed = val
        updateChar()
    end
})
-- ==================== 玩家页：飞行（摇杆/键盘控制） ====================
local FlyingEnabled = false
local FlightSpeed = 180
local CurrentAO, CurrentLV, CurrentMoverAttachment, FlightConnection
local flyHumanoid = nil

local function getFlyControlModule()
    local PlayerModule = LocalPlayer:WaitForChild("PlayerScripts"):WaitForChild("PlayerModule")
    return require(PlayerModule:WaitForChild("ControlModule"))
end

local function setupFlyBodyMovers(character)
    local hrp = character:WaitForChild("HumanoidRootPart")
    local humanoid = character:WaitForChild("Humanoid")
    local moverParent = workspace:FindFirstChildOfClass("Terrain") or workspace

    local moverAttachment = Instance.new("Attachment", hrp)
    moverAttachment.Name = "FlightAttachment"

    local alignOrientation = Instance.new("AlignOrientation")
    alignOrientation.Mode = Enum.OrientationAlignmentMode.OneAttachment
    alignOrientation.RigidityEnabled = true
    alignOrientation.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
    alignOrientation.CFrame = hrp.CFrame
    alignOrientation.Attachment0 = moverAttachment
    alignOrientation.Parent = moverParent

    local linearVelocity = Instance.new("LinearVelocity")
    linearVelocity.VectorVelocity = Vector3.new(0, 0, 0)
    linearVelocity.MaxForce = 9e9
    linearVelocity.Attachment0 = moverAttachment
    linearVelocity.Parent = moverParent

    return alignOrientation, linearVelocity, moverAttachment, humanoid
end

local function startFlying()
    if FlyingEnabled then return end
    local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    if not character then return end

    CurrentAO, CurrentLV, CurrentMoverAttachment, flyHumanoid = setupFlyBodyMovers(character)
    FlyingEnabled = true

    local controlModule = getFlyControlModule()

    FlightConnection = RunService.Heartbeat:Connect(function()
        if not FlyingEnabled or not CurrentLV or not CurrentAO then
            if FlightConnection then
                FlightConnection:Disconnect()
                FlightConnection = nil
            end
            return
        end

        local moveVector = controlModule:GetMoveVector()
        local cam = workspace.CurrentCamera

        local F, B, L, R, Q, E = 0, 0, 0, 0, 0, 0
        F = -moveVector.Z
        B = moveVector.Z
        L = -moveVector.X
        R = moveVector.X

        if UserInputService:IsKeyDown(Enum.KeyCode.W) then F = 1 end
        if UserInputService:IsKeyDown(Enum.KeyCode.S) then B = 1 end
        if UserInputService:IsKeyDown(Enum.KeyCode.A) then L = 1 end
        if UserInputService:IsKeyDown(Enum.KeyCode.D) then R = 1 end
        if UserInputService:IsKeyDown(Enum.KeyCode.Space) then Q = 1 end
        if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then E = 1 end

        local flightVector = (cam.CFrame.LookVector * (F - B) +
                              cam.CFrame.RightVector * (R - L) +
                              Vector3.new(0, 1, 0) * (Q - E))

        if flightVector.Magnitude > 0 then
            CurrentLV.VelocityConstraintMode = Enum.VelocityConstraintMode.Vector
            CurrentLV.VectorVelocity = flightVector.Unit * FlightSpeed
        else
            CurrentLV.VectorVelocity = Vector3.new(0, 0, 0)
        end

        CurrentAO.CFrame = workspace.CurrentCamera.CFrame
        if character and character:FindFirstChild("Humanoid") then
            character.Humanoid.PlatformStand = true
        end
    end)

    print("飞行已开启，速度:", FlightSpeed)
end

local function stopFlying()
    if not FlyingEnabled then return end
    FlyingEnabled = false

    if FlightConnection then
        FlightConnection:Disconnect()
        FlightConnection = nil
    end

    local character = LocalPlayer.Character
    if character and character:FindFirstChild("Humanoid") then
        character.Humanoid.PlatformStand = false
    end

    if CurrentAO then CurrentAO:Destroy() CurrentAO = nil end
    if CurrentLV then CurrentLV:Destroy() CurrentLV = nil end
    if CurrentMoverAttachment then CurrentMoverAttachment:Destroy() CurrentMoverAttachment = nil end

    print("飞行已关闭")
end

-- ==================== WindUI 控件 ====================
Tabs.wj:Toggle({
    Title = "飞行模式",
    Desc = "",
    Default = false,
    Callback = function(v)
        if v then
            startFlying()
        else
            stopFlying()
        end
    end
})

Tabs.wj:Slider({
    Title = "飞行速度",
    Desc = "",
    Value = {
        Min = 50,
        Max = 400,
        Default = 180
    },
    Step = 10,
    Callback = function(val)
        FlightSpeed = val
    end
})
-- =================== 旋转模块（完全修复版） ===================

local SpinEnabled = false
local SpinSpeed = 5
local SpinConnection = nil

-- ⭐线程控制（核心修复）
local AnimationLockThread = nil
-- ================= 开始旋转 =================
local function StartSpin()

    if SpinConnection then return end

    local plr = game.Players.LocalPlayer

    SpinConnection = game:GetService("RunService").RenderStepped:Connect(function(dt)

        if not SpinEnabled then return end

        local char = plr.Character
        if not char then return end

        local hrp = char:FindFirstChild("HumanoidRootPart")
        if not hrp then return end

        hrp.CFrame = hrp.CFrame * CFrame.Angles(0, math.rad(SpinSpeed) * dt * 60, 0)

    end)

    ApplyAnimationLock(plr.Character)
end

-- ================= 停止旋转 =================
local function StopSpin()

    SpinEnabled = false -- ⭐必须

    if SpinConnection then
        SpinConnection:Disconnect()
        SpinConnection = nil
    end

    RemoveAnimationLock(game.Players.LocalPlayer.Character)
end

-- ================= 重生修复 =================
game.Players.LocalPlayer.CharacterAdded:Connect(function(char)

    if SpinEnabled then

        task.wait(0.5)

        ApplyAnimationLock(char)

        if not SpinConnection then
            StartSpin()
        end
    end
end)

Tabs.wj:Toggle({
    Title = "人物自转",
    Default = false,
    Callback = function(v)

        SpinEnabled = v

        if v then
            StartSpin()
            AddFeature("自转")
        else
            StopSpin()
            RemoveFeature("自转")
        end

    end
})

-- ⭐ Input → Slider（稳定）
Tabs.wj:Slider({
    Title = "旋转速度",
    Value = {
        Min = 1,
        Max = 200,
        Default = SpinSpeed,
    },
    Increment = 5,
    Callback = function(v)
        SpinSpeed = v
    end
})
-- ============================================
-- WindUI - 其他玩家头部缩放（本地修改）
-- ============================================

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

-- ========== 配置 ==========
local CONFIG = {
    defaultSize = 1,
    minSize = 1,
    maxSize = 5000,
    loadDelay = 0.15,
}

-- ========== 状态管理 ==========
local HeadScaler = {
    enabled = false,
    headSize = CONFIG.defaultSize,
    heartbeatConn = nil,
    playerAddedConn = nil,
    charBindings = {},
    _initialized = false,
}

-- ========== 核心功能 ==========

function HeadScaler:UpdateAllHeads()
    local size = Vector3.new(self.headSize, self.headSize, self.headSize)
    local localPlayer = Players.LocalPlayer
    
    for _, player in ipairs(Players:GetPlayers()) do
        if player == localPlayer then continue end
        
        local character = player.Character
        if not character then continue end
        
        local head = character:FindFirstChild("Head")
        if not head then continue end
        
        pcall(function()
            head.Size = size
            head.CanCollide = false
        end)
    end
end

function HeadScaler:BindPlayer(player)
    if self.charBindings[player] then return end
    
    local conn = player.CharacterAdded:Connect(function()
        task.wait(CONFIG.loadDelay)
        self:UpdateAllHeads()
    end)
    
    self.charBindings[player] = conn
    
    -- 立即处理当前角色
    task.spawn(function()
        task.wait(CONFIG.loadDelay)
        self:UpdateAllHeads()
    end)
end

function HeadScaler:UnbindPlayer(player)
    local conn = self.charBindings[player]
    if conn then
        conn:Disconnect()
        self.charBindings[player] = nil
    end
end

function HeadScaler:ClearAll()
    -- 清理心跳
    if self.heartbeatConn then
        self.heartbeatConn:Disconnect()
        self.heartbeatConn = nil
    end
    
    -- 清理玩家加入事件
    if self.playerAddedConn then
        self.playerAddedConn:Disconnect()
        self.playerAddedConn = nil
    end
    
    -- 清理所有角色绑定
    for player, conn in pairs(self.charBindings) do
        conn:Disconnect()
        self.charBindings[player] = nil
    end
end

function HeadScaler:SetEnabled(enable)
    if self.enabled == enable then return end
    
    self:ClearAll()
    self.enabled = enable
    
    if not enable then return end
    
    -- 开启功能
    local localPlayer = Players.LocalPlayer
    
    -- 1. 心跳连接
    self.heartbeatConn = RunService.Heartbeat:Connect(function()
        self:UpdateAllHeads()
    end)
    
    -- 2. 绑定已有玩家
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= localPlayer then
            self:BindPlayer(player)
        end
    end
    
    -- 3. 监听新玩家
    self.playerAddedConn = Players.PlayerAdded:Connect(function(player)
        if player ~= localPlayer then
            self:BindPlayer(player)
        end
    end)
    
    -- 4. 立即执行
    self:UpdateAllHeads()
end

function HeadScaler:SetSize(newSize)
    local clamped = math.clamp(newSize, CONFIG.minSize, CONFIG.maxSize)
    self.headSize = clamped
    
    if self.enabled then
        self:UpdateAllHeads()
    end
end

-- ========== 初始化 ==========

function HeadScaler:Init()
    if self._initialized then return end
    self._initialized = true
    
    -- 玩家离开时自动清理
    Players.PlayerRemoving:Connect(function(player)
        self:UnbindPlayer(player)
    end)
    
    print("[HeadScaler] 初始化完成 ✅")
end

-- ========== WindUI 控件 ==========

-- 初始化
HeadScaler:Init()

-- 🎛️ 开关控件
Tabs.wj:Toggle({
    Title = "修改别人头部大小(仅本地)",
    Default = false,
    Callback = function(value)
        HeadScaler:SetEnabled(value)
    end
})

-- 📝 输入控件
Tabs.wj:Input({
    Title = "别人头部尺寸",
    Placeholder = "输入数字 1-5000",
    Default = tostring(CONFIG.defaultSize),
    Numeric = true,
    Callback = function(value)
        local num = tonumber(value)
        if num then
            HeadScaler:SetSize(num)
        end
    end
})

-- ========== 调试命令 ==========

-- 在控制台输入 HeadScalerStatus() 查看状态
_G.HeadScalerStatus = function()
    local count = 0
    for _ in pairs(HeadScaler.charBindings) do count = count + 1 end
    
    print(string.format(
        [[
📊 HeadScaler 状态
├─ 启用: %s
├─ 尺寸: %.2f
├─ 绑定玩家: %d
└─ 心跳: %s
        ]],
        HeadScaler.enabled and "✅ 是" or "❌ 否",
        HeadScaler.headSize,
        count,
        HeadScaler.heartbeatConn and "🟢 运行中" or "🔴 已停止"
    ))
end

print("💡 输入 HeadScalerStatus() 查看状态")
Tabs.wj:Button({
    Title = "取消坠落状态",
    Callback = function()
        local mt = getrawmetatable(game)
local old = mt.__index
setreadonly(mt, false)

mt.__index = newcclosure(function(self, key)
    if (key == "AssemblyLinearVelocity" or key == "Velocity") and self:IsA("BasePart") then
        return Vector3.new(0, 0, 0)
    end
    return old(self, key)
end)

setreadonly(mt, true)
    end
})
Tabs.wj:Toggle({
    Title = "无限跳",
    Desc = "",
    Value = false,
    Callback = function(state)
        isInfiniteJumpEnabled = state
    end
})
Tabs.wj:Toggle({
    Title = "穿墙",
    Desc = "",
    Value = false,
    Callback = function(enabled)
        local RunService = game:GetService("RunService")
        local LocalPlayer = game:GetService("Players").LocalPlayer
        if clipConn then
            clipConn:Disconnect()
            clipConn = nil
        end
        if enabled then
            clipConn = RunService.Stepped:Connect(function()
                local char = LocalPlayer.Character
                if not char then return end
                for _, part in ipairs(char:GetChildren()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = false
                    end
                end
            end)
        else
            --关闭穿墙：恢复碰撞
            local char = LocalPlayer.Character
            if char then
                for _, part in ipairs(char:GetChildren()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = true
                    end
                end
            end
        end
    end
})
Tabs.wj:Button({
    Title = "踏空行走",
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Float'))()
    end
})
Tabs.wj:Button({
    Title = "定",
    Callback = function()
        -- 空中定住 + 可拖动GUI（缩小UI版本）
-- LocalScript
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer
local freeze = false
local lockY = nil
local character
local root
local function LoadCharacter()
	character = player.Character or player.CharacterAdded:Wait()
	root = character:WaitForChild("HumanoidRootPart")
end
LoadCharacter()
player.CharacterAdded:Connect(function()
	task.wait(1)
	LoadCharacter()
end)
-- 创建UI
local gui = Instance.new("ScreenGui")
gui.Name = "AirFreezeUI"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")
-- 缩小窗口尺寸 原240,140 → 140,90
local main = Instance.new("Frame")
main.Size = UDim2.new(0,90,0,90)
main.Position = UDim2.new(0.5,-70,0.65,0)
main.BackgroundColor3 = Color3.fromRGB(25,25,30)
main.Parent = gui
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0,12)
corner.Parent = main
-- 标题字号缩小
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1,0,0,26)
title.BackgroundTransparency = 1
title.Text = "定"
title.TextColor3 = Color3.new(1,1,1)
title.TextSize = 16
title.Parent = main
-- 缩小开关按钮 原170,45 → 100,32，位置居中适配
local toggle = Instance.new("TextButton")
toggle.Size = UDim2.new(0,100,0,32)
toggle.Position = UDim2.new(0.5,-50,0.48,0)
toggle.BackgroundColor3 = Color3.fromRGB(0,170,255)
toggle.Text = "开启"
toggle.TextColor3 = Color3.new(1,1,1)
toggle.TextSize = 14
toggle.Parent = main
local tc = Instance.new("UICorner")
tc.CornerRadius = UDim.new(0,8)
tc.Parent = toggle
-- 拖动功能（逻辑未改动）
local dragging = false
local dragStart
local startPos
main.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1
	or input.UserInputType == Enum.UserInputType.Touch then
		dragging = true
		dragStart = input.Position
		startPos = main.Position
		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				dragging = false
			end
		end)
	end
end)
main.InputChanged:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseMovement
	or input.UserInputType == Enum.UserInputType.Touch then
		input.Changed:Connect(function()
			if dragging then
				local delta = input.Position - dragStart
				main.Position = UDim2.new(
					startPos.X.Scale,
					startPos.X.Offset + delta.X,
					startPos.Y.Scale,
					startPos.Y.Offset + delta.Y
				)
			end
		end)
	end
end)
-- 开关切换逻辑不变
toggle.MouseButton1Click:Connect(function()
	freeze = not freeze
	if freeze then
		toggle.Text = "关闭"
		toggle.BackgroundColor3 = Color3.fromRGB(255,70,70)
		if root then
			lockY = root.Position.Y
		end
	else
		toggle.Text = "开启"
		toggle.BackgroundColor3 = Color3.fromRGB(0,170,255)
		lockY = nil
	end
end)
-- 空中锁定逻辑不变
RunService.Heartbeat:Connect(function()
	if freeze and root and lockY then
		local pos = root.Position
		root.AssemblyLinearVelocity = Vector3.zero
		root.AssemblyAngularVelocity = Vector3.zero
		root.CFrame =
			CFrame.new(
				pos.X,
				lockY,
				pos.Z
			)
			*
			root.CFrame.Rotation
	end
end)

    end
})

local Players          = game:GetService("Players")
local RunService       = game:GetService("RunService")
local Workspace        = game:GetService("Workspace")
local LocalPlayer      = Players.LocalPlayer
local Camera           = Workspace.CurrentCamera

-- ═══════════ 参数 ═══════════
local CONFIG = {
    SwingRange         = 8,
    SwingFreq          = 20,
    SwingSpeed         = 0.03,
    TeleportPerTick    = 8,
    AngularForce       = 200000,
    VelocityMultiplier = 3.0,
    TargetForce        = 2000,
    TargetAngular      = 500000,
    TeleportDuration   = 4,
    CameraOffset       = Vector3.new(0, 3, 15),
}

-- ═══════════ 工具 ═══════════
local function GetChar(p)
    if not p or not p.Parent then return nil end
    local c = p.Character
    if not c or not c.Parent then return nil end
    return c
end
local function GetHRP(c) return c and c:FindFirstChild("HumanoidRootPart") end
local function GetHum(c) return c and c:FindFirstChildOfClass("Humanoid") end

-- ═══════════ 相机锁定 ═══════════
local camConn, camSubject
local function LockCam(subj)
    camSubject = subj
    Camera.CameraType = Enum.CameraType.Scriptable
    Camera.CameraSubject = subj
    if camConn then camConn:Disconnect() end
    camConn = RunService.RenderStepped:Connect(function()
        if not camSubject or not camSubject.Parent then return end
        local tp = camSubject.Position
        local cp = tp + CONFIG.CameraOffset
        Camera.CFrame = CFrame.new(cp, tp)
        Camera.Focus = CFrame.new(tp)
    end)
end
local function UnlockCam()
    if camConn then camConn:Disconnect() camConn = nil end
    camSubject = nil
    local c = LocalPlayer.Character
    if c then
        local h = c:FindFirstChildOfClass("Humanoid")
        if h then
            Camera.CameraSubject = h
            Camera.CameraType = Enum.CameraType.Custom
        end
    end
end

-- ═══════════ 自甩 ═══════════
local selfConn, selfStep
local function EnableSelf()
    if selfConn then return end
    selfConn = RunService.Heartbeat:Connect(function()
        local c = LocalPlayer.Character
        if not c then return end
        local hrp = GetHRP(c) local hum = GetHum(c)
        if not hrp or not hum then return end
        pcall(function()
            hum.PlatformStand = false
            hum.Sit = false
            hum.AutoRotate = true
            local s = hum:GetState()
            if s == Enum.HumanoidStateType.Physics
                or s == Enum.HumanoidStateType.FallingDown
                or s == Enum.HumanoidStateType.Ragdoll then
                hum:ChangeState(Enum.HumanoidStateType.GettingUp)
            end
            hum:ChangeState(Enum.HumanoidStateType.Running)
            local vel = hrp.AssemblyLinearVelocity
            local sy = math.clamp(vel.Y, -40, 40)
            hrp.AssemblyAngularVelocity = Vector3.new(CONFIG.AngularForce, CONFIG.AngularForce, CONFIG.AngularForce)
            hrp.AssemblyLinearVelocity = Vector3.new(vel.X * CONFIG.VelocityMultiplier, sy, vel.Z * CONFIG.VelocityMultiplier)
            RunService.RenderStepped:Wait()
            if hrp and hrp.Parent then hrp.AssemblyAngularVelocity = Vector3.zero end
        end)
    end)
    selfStep = RunService.Stepped:Connect(function()
        for _, p in pairs(Players:GetPlayers()) do
            if p ~= LocalPlayer and p.Character then
                for _, part in pairs(p.Character:GetDescendants()) do
                    if part:IsA("BasePart") then
                        pcall(function() part.CanCollide = false end)
                    end
                end
            end
        end
    end)
end
local function DisableSelf()
    if selfConn then selfConn:Disconnect() selfConn = nil end
    if selfStep then selfStep:Disconnect() selfStep = nil end
end

-- ═══════════ 给目标施力 ═══════════
local function ForceTarget(p)
    if not p then return end
    local c = GetChar(p)
    if not c then return end
    local hrp = GetHRP(c)
    if not hrp then return end
    pcall(function() hrp:SetNetworkOwner(LocalPlayer) end)
    pcall(function()
        hrp.AssemblyLinearVelocity = Vector3.new(CONFIG.TargetForce, CONFIG.TargetForce, CONFIG.TargetForce)
        hrp.AssemblyAngularVelocity = Vector3.new(CONFIG.TargetAngular, CONFIG.TargetAngular, CONFIG.TargetAngular)
    end)
    local h = GetHum(c)
    if h then
        pcall(function()
            h.PlatformStand = true
            h:ChangeState(Enum.HumanoidStateType.Physics)
        end)
    end
end

-- ═══════════ 状态变量 ═══════════
local selectedPlayer = nil
local isTeleportFlying = false
local LoopFly = { Running = false, Target = nil, Orig = nil, Conn = nil, Leave = nil }

-- ═══════════ 传送甩飞 ═══════════
local function TeleportFly(target, duration)
    if isTeleportFlying then return false end
    duration = duration or CONFIG.TeleportDuration
    if not target then return false end
    local tc = GetChar(target)
    if not tc then return false end
    local mc = GetChar(LocalPlayer)
    local mhrp = GetHRP(mc)
    if not mhrp then return false end

    isTeleportFlying = true
    local orig = mhrp.Position
    LockCam(mhrp)
    EnableSelf()

    local t0 = tick()
    local dir = 1
    local lastSwitch = tick()
    local detected = false

    while tick() - t0 < duration do
        local tc2 = GetChar(target)
        if not tc2 then break end
        local thrp = GetHRP(tc2)
        if thrp then
            if tick() - lastSwitch > CONFIG.SwingSpeed then
                dir = dir * -1
                lastSwitch = tick()
            end
            local mc2 = GetChar(LocalPlayer)
            local mhrp2 = GetHRP(mc2)
            if mhrp2 then
                for i = 1, CONFIG.TeleportPerTick do
                    local off = dir * CONFIG.SwingRange * (i / CONFIG.TeleportPerTick)
                    local pos = thrp.Position + thrp.CFrame.LookVector * off
                    pcall(function() mhrp2.CFrame = CFrame.new(pos) end)
                end
                ForceTarget(target)
            end
            if not detected and thrp.AssemblyLinearVelocity.Magnitude > 30 then
                detected = true
            end
        end
        task.wait(0.02)
    end

    local fc = GetChar(LocalPlayer)
    local fhrp = GetHRP(fc)
    if fhrp then
        pcall(function()
            fhrp.CFrame = CFrame.new(orig)
            fhrp.AssemblyAngularVelocity = Vector3.zero
            fhrp.AssemblyLinearVelocity = Vector3.zero
        end)
    end

    DisableSelf()
    UnlockCam()
    isTeleportFlying = false
    return detected
end

-- ═══════════ 循环甩飞 ═══════════
local function LoopStart(target)
    if LoopFly.Running then LoopFly.Stop() task.wait(0.2) end
    if not target then return false end
    local tc = GetChar(target)
    if not tc then return false end
    local mc = GetChar(LocalPlayer)
    local mhrp = GetHRP(mc)
    if not mhrp then return false end

    LoopFly.Running = true
    LoopFly.Target = target
    LoopFly.Orig = mhrp.Position
    LockCam(mhrp)
    EnableSelf()

    LoopFly.Conn = RunService.Heartbeat:Connect(function()
        if not LoopFly.Running then return end
        local tc2 = GetChar(LoopFly.Target)
        if not tc2 then LoopFly.Stop() return end
        local thrp = GetHRP(tc2)
        if not thrp then return end
        local dir = math.sin(tick() * CONFIG.SwingFreq)
        local off = dir * CONFIG.SwingRange
        local mc2 = GetChar(LocalPlayer)
        local mhrp2 = GetHRP(mc2)
        if mhrp2 then
            for i = 1, CONFIG.TeleportPerTick do
                local sub = off * (i / CONFIG.TeleportPerTick)
                local pos = thrp.Position + thrp.CFrame.LookVector * sub
                pcall(function() mhrp2.CFrame = CFrame.new(pos) end)
            end
            ForceTarget(LoopFly.Target)
        end
    end)

    LoopFly.Leave = Players.PlayerRemoving:Connect(function(p)
        if p == LoopFly.Target and LoopFly.Running then LoopFly.Stop() end
    end)

    return true
end

function LoopFly.Stop()
    if not LoopFly.Running then return end
    LoopFly.Running = false
    if LoopFly.Conn then LoopFly.Conn:Disconnect() LoopFly.Conn = nil end
    if LoopFly.Leave then LoopFly.Leave:Disconnect() LoopFly.Leave = nil end
    local mc = GetChar(LocalPlayer)
    local mhrp = GetHRP(mc)
    if mhrp and LoopFly.Orig then
        pcall(function()
            mhrp.CFrame = CFrame.new(LoopFly.Orig)
            mhrp.AssemblyAngularVelocity = Vector3.zero
            mhrp.AssemblyLinearVelocity = Vector3.zero
        end)
    end
    DisableSelf()
    UnlockCam()
    LoopFly.Target = nil
    LoopFly.Orig = nil
end

-- ═══════════ 玩家选择 ═══════════
local function getPlayerList()
    local t = {}
    for _, p in pairs(Players:GetPlayers()) do
        if p ~= LocalPlayer then
            table.insert(t, p.Name)
        end
    end
    return t
end

local playerDropdown
playerDropdown = Tabs.sf:Dropdown({
    Title = "选择目标玩家",
    Desc = "选择要甩飞的玩家",
    Values = getPlayerList(),
    Value = nil,
    Callback = function(v)
        if v and v ~= "" then
            selectedPlayer = Players:FindFirstChild(v)
            WindUI:Notify({
                Title = "已选择",
                Content = v,
                Icon = "check",
                Duration = 2,
            })
            if LoopFly.Running then
                LoopFly.Stop()
                task.wait(0.2)
                LoopStart(selectedPlayer)
            end
        end
    end,
})

-- 刷新玩家列表按钮
Tabs.sf:Button({
    Title = "刷新玩家列表",
    Callback = function()
        if playerDropdown and playerDropdown.Refresh then
            playerDropdown:Refresh(getPlayerList())
        end
        WindUI:Notify({
            Title = "已刷新",
            Content = "共 " .. #getPlayerList() .. " 个玩家",
            Icon = "refresh-cw",
            Duration = 2,
        })
    end,
})

-- ═══════════ 传送甩飞 ═══════════
Tabs.sf:Button({
    Title = " 传送甩飞（一次）",
    Desc = "瞬移到目标身边来回摆动甩飞",
    Callback = function()
        if not selectedPlayer then
            WindUI:Notify({ Title = "未选择玩家", Icon = "alert-circle", Duration = 2 })
            return
        end
        if isTeleportFlying then
            WindUI:Notify({ Title = "正在执行中", Icon = "alert-circle", Duration = 2 })
            return
        end
        task.spawn(function()
            local ok = TeleportFly(selectedPlayer)
            WindUI:Notify({
                Title = ok and "甩飞成功" or "甩飞结束",
                Content = selectedPlayer.Name,
                Icon = ok and "check" or "x",
                Duration = 3,
            })
        end)
    end,
})

-- ═══════════ 循环甩飞 ═══════════
Tabs.sf:Toggle({
    Title = " 循环甩飞",
    Desc = "持续锁定目标来回摆动",
    Value = false,
    Callback = function(state)
        if state then
            if not selectedPlayer then
                WindUI:Notify({ Title = "未选择玩家", Icon = "alert-circle", Duration = 2 })
                return
            end
            LoopStart(selectedPlayer)
            WindUI:Notify({
                Title = "循环甩飞已开启",
                Content = selectedPlayer.Name,
                Icon = "check",
                Duration = 2,
            })
        else
            LoopFly.Stop()
            WindUI:Notify({ Title = "循环甩飞已关闭", Icon = "x", Duration = 2 })
        end
    end,
})

-- ═══════════ 参数标签页 ═══════════
Tabs.sf:Slider({
    Title = "摆动幅度（米）",
    Value = { Min = 2, Max = 20, Default = CONFIG.SwingRange },
    Step = 1,
    IsTextbox = true,
    Callback = function(v) CONFIG.SwingRange = v end,
})

Tabs.sf:Slider({
    Title = "摆动频率（Hz）",
    Value = { Min = 5, Max = 50, Default = CONFIG.SwingFreq },
    Step = 1,
    IsTextbox = true,
    Callback = function(v) CONFIG.SwingFreq = v end,
})

Tabs.sf:Slider({
    Title = "每次传送次数",
    Value = { Min = 1, Max = 20, Default = CONFIG.TeleportPerTick },
    Step = 1,
    IsTextbox = true,
    Callback = function(v) CONFIG.TeleportPerTick = v end,
})

Tabs.sf:Slider({
    Title = "目标施力",
    Value = { Min = 100, Max = 10000, Default = CONFIG.TargetForce },
    Step = 100,
    IsTextbox = true,
    Callback = function(v) CONFIG.TargetForce = v end,
})

Tabs.sf:Slider({
    Title = "传送甩飞时长（秒）",
    Value = { Min = 1, Max = 10, Default = CONFIG.TeleportDuration },
    Step = 1,
    IsTextbox = true,
    Callback = function(v) CONFIG.TeleportDuration = v end,
})

Tabs.sf:Button({
    Title = "重置为默认参数",
    Callback = function()
        CONFIG.SwingRange = 8
        CONFIG.SwingFreq = 20
        CONFIG.SwingSpeed = 0.03
        CONFIG.TeleportPerTick = 8
        CONFIG.AngularForce = 200000
        CONFIG.VelocityMultiplier = 3.0
        CONFIG.TargetForce = 2000
        CONFIG.TargetAngular = 500000
        CONFIG.TeleportDuration = 4
        WindUI:Notify({ Title = "已重置", Icon = "refresh-cw", Duration = 2 })
    end,
})

-- ═══════════ 快捷键 F ═══════════
game:GetService("UserInputService").InputBegan:Connect(function(input, gp)
    if gp then return end
    if input.KeyCode == Enum.KeyCode.F then
        -- WindUI 自带 ToggleKey 支持
    end
end)

-- ═══════════ 角色重生 ═══════════
LocalPlayer.CharacterAdded:Connect(function()
    task.wait(0.5)
    if LoopFly.Running then LoopFly.Stop() end
    UnlockCam()
end)

print("静默甩飞 WindUI 版已加载")
------====---
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera
local UserInputService = game:GetService("UserInputService")
local AimConfig = {
    Enabled = false,
    BulletTrack = false,
    FOV = 200,
    Smoothness = 0.15,
    Prediction = 0.12,
    BulletSpeed = 1500,
    BulletDrop = 0,
    WallCheck = true,
    ShowFOV = false,
    ShowTracer = true,
    AimPart = "Head",
    TeamCheck = true,
    JumpPrediction = true,
}
-- FOV圆圈绘图
local aimFOVCircle = Drawing.new("Circle")
aimFOVCircle.Visible = false
aimFOVCircle.Color = Color3.fromRGB(255, 50, 50)
aimFOVCircle.Thickness = 1.5
aimFOVCircle.Filled = false
aimFOVCircle.Transparency = 0.4
aimFOVCircle.NumSides = 64
aimFOVCircle.Radius = AimConfig.FOV
aimFOVCircle.Position = Camera.ViewportSize / 2
-- 瞄准射线
local aimTracer = Drawing.new("Line")
aimTracer.Visible = false
aimTracer.Color = Color3.fromRGB(255, 50, 50)
aimTracer.Thickness = 1.5
aimTracer.Transparency = 0.4
aimTracer.From = Camera.ViewportSize / 2
aimTracer.To = Camera.ViewportSize / 2
local aimTargetPart = nil
local mainConn = nil
-- 寻找准星FOV内最近敌人
local function findClosestPlayer()
    local mousePos = UserInputService:GetMouseLocation()
    local viewportSize = Camera.ViewportSize
    local center = Vector2.new(viewportSize.X / 2, viewportSize.Y / 2)
    local best = nil
    local bestDist = AimConfig.FOV
    for i = 1, #Players:GetPlayers() do
        local player = Players:GetPlayers()[i]
        if player == LocalPlayer then
        elseif player.Character then
            local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
            local hrp = player.Character:FindFirstChild("HumanoidRootPart")
            if not humanoid or not hrp or humanoid.Health <= 0 then
            elseif AimConfig.TeamCheck and player.Team and player.Team == LocalPlayer.Team then
            else
                local part = player.Character:FindFirstChild(AimConfig.AimPart)
                if not part then part = player.Character:FindFirstChild("Head") end
                if not part then part = hrp end
                if part then
                    local sp, vis = Camera:WorldToViewportPoint(part.Position)
                    if vis and sp.Z < 1000 then
                        local sd = (Vector2.new(sp.X, sp.Y) - center).Magnitude
                        if sd < bestDist then
                            best = part
                            bestDist = sd
                        end
                    end
                end
            end
        end
    end
    return best
end
-- 墙体检测
local function isWallHit(part)
    if not AimConfig.WallCheck then return false end
    local origin = Camera.CFrame.Position
    local dir = (part.Position - origin)
    local rayP = RaycastParams.new()
    rayP.FilterType = Enum.RaycastFilterType.Exclude
    rayP.FilterDescendantsInstances = {LocalPlayer.Character, Camera}
    local result = workspace:Raycast(origin, dir, rayP)
    if result and not result.Instance:IsDescendantOf(part.Parent) then
        return true
    end
    return false
end
-- 执行相机自瞄
local function doCameraAim()
    if not aimTargetPart or not aimTargetPart.Parent then return end
    local hum = aimTargetPart.Parent:FindFirstChildOfClass("Humanoid")
    if not hum or hum.Health <= 0 then return end
    if isWallHit(aimTargetPart) then return end
    local dist = (aimTargetPart.Position - Camera.CFrame.Position).Magnitude
    local time = dist / math.max(AimConfig.BulletSpeed, 100)
    local vel = Vector3.zero
    local tHrp = aimTargetPart.Parent:FindFirstChild("HumanoidRootPart")
    if tHrp then
        vel = tHrp.AssemblyLinearVelocity
    end
    local predictPos = aimTargetPart.Position + vel * AimConfig.Prediction
    local dropOffset = Vector3.new(0, -AimConfig.BulletDrop * time * time, 0)
    local jumpOff = Vector3.zero
    if AimConfig.JumpPrediction and tHrp then
        if tHrp.AssemblyLinearVelocity.Y > 10 then
            jumpOff = Vector3.new(0, tHrp.AssemblyLinearVelocity.Y * AimConfig.Prediction * 0.5, 0)
        end
    end
    local targetPos = predictPos + dropOffset + jumpOff
    local targetCF = CFrame.new(Camera.CFrame.Position, targetPos)
    local s = AimConfig.Smoothness
    if s >= 1 then
        Camera.CFrame = targetCF
    else
        Camera.CFrame = Camera.CFrame:Lerp(targetCF, s)
    end
end
-----------
-- ==================== 亚洲车王：视角稳定 ====================
-- ==================== 亚洲车王：视角稳定 ====================
local CamStabState = {
    Enabled = false,
    Mode = "稳定跟随",
    Smoothness = 0.3,
    LastCFrame = nil,
    Connection = nil,
    SubjectConn = nil,
}

local function CamStab_getCam()
    return workspace.CurrentCamera
end

local function CamStab_restore()
    local cam = CamStab_getCam()
    if not cam then return end
    if CamStabState.SubjectConn then
        CamStabState.SubjectConn:Disconnect()
        CamStabState.SubjectConn = nil
    end
    local char = LocalPlayer.Character
    if char then
        local hum = char:FindFirstChildOfClass("Humanoid")
        if hum then cam.CameraSubject = hum end
    end
    cam.CameraType = Enum.CameraType.Custom
end

local function CamStab_start()
    local cam = CamStab_getCam()
    if not cam then return end

    if CamStabState.Connection then CamStabState.Connection:Disconnect() CamStabState.Connection = nil end
    if CamStabState.SubjectConn then CamStabState.SubjectConn:Disconnect() CamStabState.SubjectConn = nil end

    -- 稳定跟随
    if CamStabState.Mode == "稳定跟随" then
        local function setSub()
            local char = LocalPlayer.Character
            if char then
                local hrp = char:FindFirstChild("HumanoidRootPart")
                if hrp then cam.CameraSubject = hrp end
            end
        end
        setSub()
        CamStabState.SubjectConn = RunService.Heartbeat:Connect(function()
            if not CamStabState.Enabled then return end
            local char = LocalPlayer.Character
            if char then
                local hrp = char:FindFirstChild("HumanoidRootPart")
                if hrp and cam.CameraSubject ~= hrp then
                    cam.CameraSubject = hrp
                end
            end
        end)
    end

    -- 固定朝向
    if CamStabState.Mode == "固定朝向" then
        cam.CameraType = Enum.CameraType.Scriptable
        local lockedRot = cam.CFrame - cam.CFrame.Position
        CamStabState.Connection = RunService.RenderStepped:Connect(function()
            if not CamStabState.Enabled then return end
            local c = CamStab_getCam()
            if not c then return end
            local char = LocalPlayer.Character
            if char then
                local hrp = char:FindFirstChild("HumanoidRootPart")
                if hrp then
                    local pos = hrp.Position + Vector3.new(0, 2, 0)
                    c.CFrame = CFrame.new(pos) * lockedRot
                end
            end
        end)
    end

    -- 抗抖动
    if CamStabState.Mode == "抗抖动" then
        cam.CameraType = Enum.CameraType.Custom
        CamStabState.LastCFrame = nil
        CamStabState.Connection = RunService.RenderStepped:Connect(function()
            if not CamStabState.Enabled then return end
            local c = CamStab_getCam()
            if not c then return end
            local currentCF = c.CFrame
            if not CamStabState.LastCFrame then
                CamStabState.LastCFrame = currentCF
            else
                local smooth = math.clamp(CamStabState.Smoothness, 0, 0.95)
                local newCF = CamStabState.LastCFrame:Lerp(currentCF, 1 - smooth)
                c.CFrame = CFrame.new(newCF.Position) * (currentCF - currentCF.Position)
                CamStabState.LastCFrame = c.CFrame
            end
        end)
    end
end

local function CamStab_stop()
    if CamStabState.Connection then CamStabState.Connection:Disconnect() CamStabState.Connection = nil end
    if CamStabState.SubjectConn then CamStabState.SubjectConn:Disconnect() CamStabState.SubjectConn = nil end
    CamStab_restore()
    CamStabState.LastCFrame = nil
end

-- 角色重生
LocalPlayer.CharacterAdded:Connect(function()
    if CamStabState.Enabled then
        task.wait(1)
        CamStab_stop()
        CamStabState.Enabled = true
        CamStab_start()
    end
end)

-- ==================== UI（Tabs.fc） ====================
Tabs.fc:Toggle({
    Title = "启用视角稳定",
    Desc = "开启后视角不再晃动",
    Default = false,
    Callback = function(v)
        CamStabState.Enabled = v
        if v then
            CamStab_start()
        else
            CamStab_stop()
        end
    end,
})

Tabs.fc:Dropdown({
    Title = "防抖模式",
    Desc = "稳定跟随=走路不颠簸 | 固定朝向=转向不晃 | 抗抖动=过滤开枪震动",
    Values = { "稳定跟随", "固定朝向", "抗抖动" },
    Default = "稳定跟随",
    Callback = function(v)
        CamStabState.Mode = v
        if CamStabState.Enabled then
            CamStab_stop()
            CamStabState.Enabled = true
            CamStab_start()
        end
    end,
})

Tabs.fc:Slider({
    Title = "平滑程度",
    Desc = "",
    Value = { Min = 0, Max = 0.9, Default = 0.3 },
    Step = 0.05,
    Callback = function(v)
        CamStabState.Smoothness = v
    end,
})

Tabs.fc:Button({
    Title = "重新应用稳定",
    Desc = "",
    Callback = function()
        if not CamStabState.Enabled then return end
        CamStab_stop()
        CamStabState.Enabled = true
        CamStab_start()
    end,
})
Tabs.fc:Button({
    Title = "飞车脚本",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ggsq1741-debug/BAL/refs/heads/main/GUI.lua"))()
    end
})
-- ═══════════════════════════════════════════════════
-- Ragebot 独立模块 (兼容 WindUI 大脚本)
-- ═══════════════════════════════════════════════════

local Players           = game:GetService("Players")
local RunService        = game:GetService("RunService")
local Workspace         = game:GetService("Workspace")
local Debris            = game:GetService("Debris")
local SoundService      = game:GetService("SoundService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local LocalPlayer = Players.LocalPlayer
local userId = LocalPlayer.UserId

-- ═══════════ 全局状态 ═══════════
local State = {
    Ragebot     = false,
    Wallbang    = true,
    TeamCheck   = true,
    IgnoreCrawl = true,
    IgnoreKnock = true,
    IgnoreGrab  = true,
    LastFire    = 0,
    FireRate    = 0.05,
    MaxDistance = 500,
    WallSpread  = 30,
    Running     = false,
    LoopConn    = nil,
    TracerEnabled  = true,
    TracerColor    = Color3.fromRGB(255, 80, 80),
    TracerWidth    = 0.25,
    TracerDuration = 1,
    HitSoundEnabled = true,
    HitSoundId      = "rbxassetid://4590662766",
    HitSoundVolume  = 0.5,
    LastToolId       = nil,
    LastAmmo         = nil,
    LastAmmoChangeAt = 0,
    ReloadRetryAt    = 0,
}

-- ═══════════ 尝试加载 Wanted 模块（不阻断执行）═══════════
local WantedReady = false
local nuid, Network, MathUtil, ClientPlayers, fireServer, ClientTools

pcall(function()
    local DevvFolder = ReplicatedStorage:FindFirstChild("Devv") or ReplicatedStorage:FindFirstChild("devv")
    if not DevvFolder then return end
    local DevvModule = require(DevvFolder)
    if type(DevvModule.load) ~= "function" then return end
    local load = DevvModule.load
    nuid          = load("NUID")
    Network       = load("Network")
    MathUtil      = load("MathUtil")
    ClientPlayers = load("ClientPlayers")
    fireServer    = Network.FireServer
    ClientTools   = require(ReplicatedStorage.Client.Wanted.Modules.ClientTools)
    WantedReady   = true
end)

-- ═══════════ 工具函数 ═══════════
local function getMyChar()
    local c = LocalPlayer.Character
    return c, c and c:FindFirstChild("HumanoidRootPart"), c and c:FindFirstChild("Head")
end

local function isAlive(p)
    local c = p and p.Character
    if not c then return false end
    local h = c:FindFirstChildOfClass("Humanoid")
    return h and h.Health > 0
end

local function isTeam(p)
    if not State.TeamCheck then return false end
    if p.Team and LocalPlayer.Team and p.Team == LocalPlayer.Team then return true end
    if p.TeamColor and LocalPlayer.TeamColor and p.TeamColor == LocalPlayer.TeamColor then return true end
    return false
end

local function getProp(p, key)
    if not ClientPlayers then return false end
    local CP = ClientPlayers.GetByPlayerId(p.UserId)
    if CP and CP.GetPlayerProperty then
        local ok, v = pcall(CP.GetPlayerProperty, CP, key)
        return ok and v == true
    end
    return false
end

local function shouldIgnore(p)
    if State.IgnoreCrawl and getProp(p, "crawling") then return true end
    if State.IgnoreKnock and getProp(p, "knocked")  then return true end
    if State.IgnoreGrab  and getProp(p, "grabbed")  then return true end
    return false
end

local function isRagdoll()
    local c = LocalPlayer.Character
    if not c then return true end
    local h = c:FindFirstChildOfClass("Humanoid")
    if not h or h.Health <= 0 then return true end
    local st = h:GetState()
    return st == Enum.HumanoidStateType.Physics
        or st == Enum.HumanoidStateType.Ragdoll
        or st == Enum.HumanoidStateType.FallingDown
end

-- ═══════════ 追踪线 ═══════════
local TracerFolder = Workspace:FindFirstChild("__MoonTracers")
if not TracerFolder then
    TracerFolder = Instance.new("Folder")
    TracerFolder.Name = "__MoonTracers"
    TracerFolder.Parent = Workspace
end

local function createTracer(fromPos, toPos, color, width, duration)
    if not State.TracerEnabled then return end
    pcall(function()
        local a0 = Instance.new("Attachment", TracerFolder); a0.WorldPosition = fromPos
        local a1 = Instance.new("Attachment", TracerFolder); a1.WorldPosition = toPos
        local beam = Instance.new("Beam", TracerFolder)
        beam.Attachment0, beam.Attachment1 = a0, a1
        beam.Color = ColorSequence.new(color or State.TracerColor)
        beam.Width0, beam.Width1 = width or State.TracerWidth, width or State.TracerWidth
        beam.LightEmission, beam.LightInfluence, beam.FaceCamera = 1, 0, true
        beam.Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 0.1),
            NumberSequenceKeypoint.new(1, 0.8),
        })
        local life = duration or State.TracerDuration
        Debris:AddItem(beam, life); Debris:AddItem(a0, life); Debris:AddItem(a1, life)
    end)
end

-- ═══════════ 命中音效 ═══════════
local function playHitSound()
    if not State.HitSoundEnabled then return end
    pcall(function()
        local snd = Instance.new("Sound", SoundService)
        snd.SoundId, snd.Volume = State.HitSoundId, State.HitSoundVolume
        snd:Play(); Debris:AddItem(snd, 2)
    end)
end

-- ═══════════ 穿墙解算 ═══════════
local RayParams = RaycastParams.new()
RayParams.FilterType = Enum.RaycastFilterType.Exclude
RayParams.IgnoreWater = true

local function Resolve(fromPos, toPos, spread, radius)
    local dir = toPos - fromPos
    local dist = dir.Magnitude
    if dist < 0.1 then return fromPos, toPos, true end

    RayParams.FilterDescendantsInstances = { LocalPlayer.Character }
    local hit = Workspace:Raycast(fromPos, dir, RayParams)
    if not hit or (hit.Position - toPos).Magnitude <= radius then
        return fromPos, toPos, true
    end

    local unit = dir.Unit
    local up = unit:Cross(math.abs(unit.Y) < 0.9 and Vector3.new(0,1,0) or Vector3.new(1,0,0)).Unit
    local right = unit:Cross(up).Unit
    for _, off in ipairs({ right, -right, -up, up }) do
        local testPos = fromPos + off * spread
        local testHit = Workspace:Raycast(testPos, toPos - testPos, RayParams)
        if not testHit or (testHit.Position - toPos).Magnitude <= radius then
            return testPos, toPos, true
        end
    end
    return nil, nil, false
end

-- ═══════════ 找敌人 ═══════════
local function getClosestEnemy()
    local _, myHRP = getMyChar()
    if not myHRP then return nil, nil end
    local best, bestDist, bestHead = nil, math.huge, nil
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= LocalPlayer and not isTeam(p) and isAlive(p) and not shouldIgnore(p) then
            local c = p.Character
            local hrp = c and c:FindFirstChild("HumanoidRootPart")
            local head = c and c:FindFirstChild("Head")
            if hrp and head then
                local d = (hrp.Position - myHRP.Position).Magnitude
                if d <= State.MaxDistance and d < bestDist then
                    bestDist, best, bestHead = d, p, head
                end
            end
        end
    end
    return best, bestHead
end

-- ═══════════ 开火 ═══════════
local RELOAD_RETRY_INTERVAL = 0.6
local AMMO_STUCK_THRESHOLD  = 1.5

local function fireAt(target, targetHead)
    if not WantedReady then return end
    if isRagdoll() then return end
    local now = tick()
    if now - State.LastFire < State.FireRate then return end

    local _, myHRP, myHead = getMyChar()
    if not myHRP or not myHead then return end

    local ok, tool = pcall(ClientTools.GetLocalEquippedTool)
    if not ok or not tool or not tool.toolState then return end
    local ts = tool.toolState

    if State.LastToolId ~= tool.toolId then
        State.LastToolId, State.ReloadRetryAt = tool.toolId, 0
        State.LastAmmo, State.LastAmmoChangeAt = nil, now
    end

    local curAmmo = tonumber(ts.ammo)
    if curAmmo ~= State.LastAmmo then
        State.LastAmmo, State.LastAmmoChangeAt = curAmmo, now
    elseif now - State.LastAmmoChangeAt > AMMO_STUCK_THRESHOLD then
        State.LastAmmoChangeAt = now
        if now >= State.ReloadRetryAt then
            State.ReloadRetryAt = now + RELOAD_RETRY_INTERVAL
            pcall(fireServer, "reload",  tool.toolId)
            pcall(fireServer, "chamber", tool.toolId)
        end
        return
    end

    if curAmmo == nil or ts.totalAmmo == nil then return end

    if curAmmo <= 0 then
        if now >= State.ReloadRetryAt then
            State.ReloadRetryAt = now + RELOAD_RETRY_INTERVAL
            if (tonumber(ts.totalAmmo) or 0) > 0 then
                pcall(fireServer, "reload",  tool.toolId)
                pcall(fireServer, "chamber", tool.toolId)
            end
        end
        return
    end

    if ts.reloading == true then return end

    local resolvedOrigin, resolvedTarget, okR = Resolve(myHead.Position, targetHead.Position, State.WallSpread, targetHead.Size.Magnitude)
    if not okR then return end

    local bulletId = nuid()
    local shootCF = MathUtil.CompressCFrame(CFrame.new(resolvedOrigin, resolvedTarget))
    fireServer("shoot", tool.toolId, shootCF, { { bulletId, shootCF } })

    local dir = resolvedTarget - resolvedOrigin
    local unit = dir.Magnitude > 0.001 and dir.Unit or myHRP.CFrame.LookVector
    local muzzle = tool.projectile and tool.projectile.muzzleVelocity
    local speed = type(muzzle) == "number" and muzzle > 0 and muzzle / 0.28 or 1600

    fireServer("registerProjectileHits", bulletId, tool.toolId, {
        {
            massLimit = 5, hit = targetHead, position = resolvedTarget, normal = -unit,
            material = targetHead.Material or Enum.Material.Plastic,
            distance = dir.Magnitude, collisionPoint = resolvedTarget,
            direction = unit, speed = speed,
            source = { sourceType = "Bullet", sourceId = bulletId, sourceToolId = tool.toolId, sourcePlayerId = userId },
        },
    })

    playHitSound()
    createTracer(resolvedOrigin, resolvedTarget, State.TracerColor, State.TracerWidth, State.TracerDuration)
    State.LastFire = now
end

-- ═══════════ 主循环 ═══════════
if not State.Running then
    State.Running = true
    State.LoopConn = RunService.Heartbeat:Connect(function()
        if State.Ragebot and WantedReady then
            local target, head = getClosestEnemy()
            if target and head then pcall(fireAt, target, head) end
        end
    end)
end

-- ═══════════ 对外暴露接口，用来挂载 UI ═══════════
_G.RagebotState = State

function _G.BuildRagebotUI(Tab)
    if not Tab then return warn("[Ragebot] 传进来的 Tab 是空的！") end

    Tab:Toggle({
        Title = "开启愤怒机器人", Value = false,
        Callback = function(v) State.Ragebot = v end,
    })
    Tabs.jq:Toggle({
        Title = "穿墙射击", Value = true,
        Callback = function(v) State.Wallbang = v end,
    })
    Tabs.jq:Toggle({
        Title = "忽略队友", Value = true,
        Callback = function(v) State.TeamCheck = v end,
    })
    Tabs.jq:Toggle({
        Title = "忽略倒地/被击倒/被抓", Value = true,
        Callback = function(v)
            State.IgnoreCrawl, State.IgnoreKnock, State.IgnoreGrab = v, v, v
        end,
    })
    Tabs.jq:Divider()
    Tabs.jq:Slider({
        Title = "最大攻击距离",
        Value = { Min = 50, Max = 5000, Default = 500 }, Step = 50, Suffix = " 米",
        Callback = function(v) State.MaxDistance = v end,
    })
    Tabs.jq:Slider({
        Title = "射击间隔（秒）",
        Value = { Min = 0.02, Max = 0.5, Default = 0.05 }, Step = 0.01,
        Callback = function(v) State.FireRate = v end,
    })
    Tabs.jq:Slider({
        Title = "穿墙偏移距离",
        Value = { Min = 5, Max = 100, Default = 30 }, Step = 5,
        Callback = function(v) State.WallSpread = v end,
    })
    Tabs.jq:Divider()
    Tabs.jq:Toggle({
        Title = "命中音效", Value = true,
        Callback = function(v) State.HitSoundEnabled = v end,
    })
    Tabs.jq:Slider({
        Title = "音效音量",
        Value = { Min = 0, Max = 1, Default = 0.5 }, Step = 0.05,
        Callback = function(v) State.HitSoundVolume = v end,
    })
    Tabs.jq:Dropdown({
        Title = "音效选择",
        Values = { "叮叮叮（经典）", "Neverlose", "Gamesense", "Fatality", "Minecraft" }, Value = "叮叮叮（经典）",
        Callback = function(v)
            local map = {
                ["叮叮叮（经典）"] = "rbxassetid://4590662766",
                ["Neverlose"]     = "rbxassetid://6607204501",
                ["Gamesense"]     = "rbxassetid://5633695679",
                ["Fatality"]      = "rbxassetid://6607142036",
                ["Minecraft"]     = "rbxassetid://7151570575",
            }
            State.HitSoundId = map[v] or "rbxassetid://4590662766"
        end,
    })
    Tabs.jq:Divider()
    Tabs.jq:Toggle({
        Title = "显示弹道追踪线", Value = true,
        Callback = function(v) State.TracerEnabled = v end,
    })
    Tabs.jq:Slider({
        Title = "追踪线宽度",
        Value = { Min = 0.05, Max = 1, Default = 0.25 }, Step = 0.05,
        Callback = function(v) State.TracerWidth = v end,
    })
    Tabs.jq:Slider({
        Title = "追踪线持续时间",
        Value = { Min = 0.2, Max = 5, Default = 1 }, Step = 0.1, Suffix = " 秒",
        Callback = function(v) State.TracerDuration = v end,
    })
    Tabs.jq:Dropdown({
        Title = "追踪线颜色",
        Values = { "红色", "绿色", "蓝色", "白色", "黄色", "紫色", "青色", "橙色" }, Value = "红色",
        Callback = function(v)
            local map = {
                ["红色"] = Color3.fromRGB(255, 80, 80), ["绿色"] = Color3.fromRGB(80, 255, 80),
                ["蓝色"] = Color3.fromRGB(80, 150, 255), ["白色"] = Color3.fromRGB(255, 255, 255),
                ["黄色"] = Color3.fromRGB(255, 255, 80), ["紫色"] = Color3.fromRGB(180, 80, 255),
                ["青色"] = Color3.fromRGB(80, 255, 255), ["橙色"] = Color3.fromRGB(255, 150, 60),
            }
            State.TracerColor = map[v] or Color3.fromRGB(255, 80, 80)
        end,
    })

    print("[Ragebot] 控件已成功挂载到你的 Tab 上！")
end

print("[Ragebot] 功能模块已加载，等待挂载...")
-- ═══════════════════════════════════════════════════
-- Wanted 农场光环 → 挂载到 Tabs.lc
-- ═══════════════════════════════════════════════════
do
    local FarmConfig = {
        Enabled    = false,
        Range      = 10,
        Cash       = true,
        ATM        = true,
        Safe       = true,
        BreakGlass = true,
    }

    local FarmReady = false
    local Network, ClientPlayers, ClientGizmos, ClientProps, ClientTools
    local fireServer, invokeServer

    -- ═══════════ 载入 Wanted 模块（失败也不中断主脚本）═══════════
    pcall(function()
        local DevvFolder = ReplicatedStorage:FindFirstChild("Devv") or ReplicatedStorage:FindFirstChild("devv")
        if not DevvFolder then
            warn("[FarmAura] 找不到 Devv 文件夹")
            return
        end
        local DevvModule = require(DevvFolder)
        if type(DevvModule.load) ~= "function" then
            warn("[FarmAura] Devv 加载失败")
            return
        end
        local load     = DevvModule.load
        Network        = load("Network")
        ClientPlayers  = load("ClientPlayers")
        ClientGizmos   = require(ReplicatedStorage.Client.Wanted.Modules.ClientGizmos)
        ClientProps    = require(ReplicatedStorage.Client.Wanted.Modules.ClientProps)
        ClientTools    = require(ReplicatedStorage.Client.Wanted.Modules.ClientTools)
        fireServer     = Network.FireServer
        invokeServer   = Network.InvokeServer
        FarmReady      = true
    end)

    -- ═══════════ 工具 ═══════════
    local function getMyChar()
        local c = LocalPlayer.Character
        return c, c and c:FindFirstChild("HumanoidRootPart")
    end

    local function getGizmos(hrp)
        local list = {}
        if not ClientGizmos then return list end
        local ok, source = pcall(debug.getupvalue, ClientGizmos.Get, 1)
        if not ok or type(source) ~= "table" then return list end
        for k, v in pairs(source) do
            if k and type(v) == "table" and v.position then
                v.objectId = v.objectId or k
                v.dist = hrp and (hrp.Position - v.position).Magnitude or math.huge
                table.insert(list, v)
            end
        end
        table.sort(list, function(a, b) return a.dist < b.dist end)
        return list
    end

    local function isCash(g)
        if type(g) ~= "table" then return false end
        if g.isCurrency == true then return true end
        local t = g.gizmoType
        return t == "Cash" or t == "CashPallet" or t == "MainCashPile"
    end

    local function getCashLeft(g)
        if type(g) ~= "table" then return nil end
        if type(g.cashLeft) == "number" then return g.cashLeft end
        if g.gizmoState and type(g.gizmoState.amount) == "number" then
            return g.gizmoState.amount
        end
        return nil
    end

    local function canInteract(g)
        if type(g) ~= "table" or not g.gizmoType then return false end
        local gs = g.gizmoState
        if gs and (gs.broken or gs.searched or gs.robbed or gs.used or gs.isDestroyed) then
            return false
        end
        if g.broken or g.searched or g.robbed or g.isCollected then
            return false
        end
        if isCash(g) then
            local left = getCashLeft(g)
            if left ~= nil and left <= 0 then return false end
            return g.objectId ~= nil
        end
        if g.gizmoType == "ATM" or g.gizmoType == "Register" then
            return g.position ~= nil
        end
        if g.gizmoType == "WorldSafe" then
            return g.objectId ~= nil
        end
        return false
    end

    local function interact(g)
        if type(g) ~= "table" then return false end
        local t = g.gizmoType

        if t == "ATM" or t == "Register" then
            local CP = ClientPlayers and ClientPlayers.Get()
            if CP and g.position then
                pcall(function() CP:Melee(g.position) end)
                return true
            end
            return false
        end

        if t == "WorldSafe" then
            if g.objectId then
                fireServer("gizmoInteraction", g.objectId, "OpenSafe")
                return true
            end
            return false
        end

        if isCash(g) then
            if not g.objectId then return false end
            local count = (t == "CashPallet" or t == "MainCashPile") and 10 or 1
            local ids = table.create(count, g.objectId)
            pcall(invokeServer, "collectCurrency", ids)
            return true
        end
        return false
    end

    local function tryBreakGlass(hrp)
        if not FarmConfig.BreakGlass then return end
        if not ClientProps or type(ClientProps.worldPropsById) ~= "table" then return end

        local best, bestD = nil, 10
        for _, v in pairs(ClientProps.worldPropsById) do
            if type(v) == "table" and v.name == "JewelSpawn" and not v.isShattered then
                local p = (v.GetPosition and v:GetPosition()) or
                          (v.model and v.model.PrimaryPart and v.model.PrimaryPart.Position)
                if p then
                    local d = (hrp.Position - p).Magnitude
                    if d < bestD then bestD = d; best = v end
                end
            end
        end
        if not best or best.isShattered then return end

        local buzz = nil
        local ok, items = pcall(ClientTools.GetItems)
        if ok and type(items) == "table" then
            for _, cat in pairs(items) do
                if type(cat) == "table" then
                    for guid, data in pairs(cat) do
                        if data and (data.name == "Buzzsaw" or data.isBuzzSaw) then
                            buzz = { guid = guid, data = data }
                            break
                        end
                    end
                end
                if buzz then break end
            end
        end
        if not buzz then return end

        local CP = ClientPlayers and ClientPlayers.Get()
        if not CP then return end

        fireServer("equip", buzz.guid)
        pcall(function()
            setthreadidentity(2)
            CP:SetEquipped({ toolId = buzz.guid, toolState = true })
            setthreadidentity(8)
        end)

        local p = (best.GetPosition and best:GetPosition()) or
                  (best.model and best.model.PrimaryPart and best.model.PrimaryPart.Position)
        if p then
            pcall(function() CP:Melee(p) end)
        end
    end

    local function tickFarmAura()
        if not FarmReady then return end
        local char, hrp = getMyChar()
        if not hrp then return end

        tryBreakGlass(hrp)

        local gizmos = getGizmos(hrp)
        local cashList, otherList = {}, {}

        for _, g in ipairs(gizmos) do
            if g.dist < FarmConfig.Range and canInteract(g) then
                if isCash(g) and FarmConfig.Cash then
                    table.insert(cashList, g)
                elseif (g.gizmoType == "ATM" or g.gizmoType == "Register") and FarmConfig.ATM then
                    table.insert(otherList, g)
                elseif g.gizmoType == "WorldSafe" and FarmConfig.Safe then
                    table.insert(otherList, g)
                end
            end
        end

        for i = 1, #cashList do interact(cashList[i]) end
        table.sort(otherList, function(a, b) return a.dist < b.dist end)
        for i = 1, math.min(3, #otherList) do interact(otherList[i]) end
    end

    -- ═══════════ 主循环 ═══════════
    RunService.Heartbeat:Connect(function()
        if not FarmConfig.Enabled then return end
        pcall(tickFarmAura)
    end)

    -- ═══════════ 挂载控件到 Tabs.lc ═══════════
    if not Tabs or not Tabs.lc then
        warn("[FarmAura] 没找到 Tabs.lc，请先在 Tabs 表里加 lc 标签")
    else
        Tabs.lc:Toggle({
            Title = "开启农场光环",
            Desc = "自动捡现金、开 ATM、开保险箱、破玻璃",
            Value = false,
            Callback = function(v) FarmConfig.Enabled = v end,
        })

        Tabs.lc:Slider({
            Title = "触发距离",
            Value = { Min = 5, Max = 50, Default = 10 },
            Step = 1,
            Suffix = " 格",
            Callback = function(v) FarmConfig.Range = v end,
        })

        Tabs.lc:Divider()

        Tabs.lc:Toggle({
            Title = "现金 / 钱堆",
            Value = true,
            Callback = function(v) FarmConfig.Cash = v end,
        })

        Tabs.lc:Toggle({
            Title = "ATM / 收银机",
            Value = true,
            Callback = function(v) FarmConfig.ATM = v end,
        })

        Tabs.lc:Toggle({
            Title = "世界保险箱",
            Value = true,
            Callback = function(v) FarmConfig.Safe = v end,
        })

        Tabs.lc:Toggle({
            Title = "破玻璃珠宝",
            Desc = "自动切 Buzzsaw 打碎珠宝柜玻璃",
            Value = true,
            Callback = function(v) FarmConfig.BreakGlass = v end,
        })
    end
end
------远程击杀*-------
Tabs.jx:Button({
    Title = "远程传送击杀",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ggsq1741-debug/cQ/refs/heads/main/%E8%BF%9C%E7%A8%8B%E5%87%BB%E6%9D%80.lua"))()
    end
})
Tabs.jx:Button({
    Title = "开启雷达扫描⚠️",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ggsq1741-debug/cQ/refs/heads/main/%E9%9B%B7%E8%BE%BE%E6%89%AB%E6%8F%8F.lua"))()
    end
})
local selectedPlayerName = "无"     -- 当前选中的目标玩家名字
local isLoopTeleport = false        -- 是否开启循环传送

-- ==================== 核心逻辑 ====================
-- 获取玩家的 HumanoidRootPart
local function getHRP(plr)
    if plr and plr.Character then
        return plr.Character:FindFirstChild("HumanoidRootPart")
    end
    return nil
end

-- 获取服务器所有玩家名字（排除自己）
local function getPlayerNames()
    local names = {"无"}
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer then
            table.insert(names, plr.Name)
        end
    end
    return names
end

-- 执行传送：把目标玩家传到我的面前
local function teleportTargetToMe()
    if selectedPlayerName == "无" then return end

    local localHRP = getHRP(LocalPlayer)
    if not localHRP then return end

    local targetPlr = Players:FindFirstChild(selectedPlayerName)
    local targetHRP = getHRP(targetPlr)
    if not targetHRP then return end

    -- 计算本地玩家前方 4 格的位置
    local frontPosition = localHRP.CFrame * CFrame.new(0, 0, -4)
    
    -- 强行把目标玩家传送到面前（本地视角）
    pcall(function()
        targetHRP.CFrame = frontPosition
    end)
end

-- ==================== UI 控件 ====================

Tabs.jx:Dropdown({
    Title = "选择服务器玩家",
    Desc = "",
    Values = getPlayerNames(),
    Default = "无",
    Callback = function(option)
        selectedPlayerName = option
    end,
})

-- 2. 刷新玩家列表按钮
Tabs.jx:Button({
    Title = "刷新玩家列表",
    Desc = "",
    Callback = function()
        local newNames = getPlayerNames()
        PlayerDropdown:SetValues(newNames)
        WindUI:Notify({
            Title = "刷新成功",
            Content = "玩家列表已更新",
            Duration = 3,
            Icon = "check",
        })
    end,
})
-- 4. 循环传送开关
Tabs.jx:Toggle({
    Title = "循环传送",
    Desc = "",
    Default = false,
    Callback = function(state)
        isLoopTeleport = state
    end,
})

-- 循环传送逻辑
RunService.RenderStepped:Connect(function()
    if isLoopTeleport and selectedPlayerName ~= "无" then
        teleportTargetToMe()
    end
end)

-- ==================== 监听玩家离开，更新列表 ====================
Players.PlayerRemoving:Connect(function(plr)
    if plr.Name == selectedPlayerName then
        selectedPlayerName = "无"
    end
    pcall(function()
        PlayerDropdown:SetValues(getPlayerNames())
    end)
end)
Tabs.jx:Code({
    Title = "使用方法",
    Code = "先开启ESP查看周围玩家名字再点击你要吸过来的玩家名字并击杀"
})
Tabs.jx:Code({
    Title = "当然你也可以在安全区内击杀玩家",
    Code = "天天开心哦"
})
-- ============================================
-- 服务
-- ============================================
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local Network = game:GetService("ReplicatedStorage").Shared.Core.Network

-- 事件索引
local Event87   = Network:GetChildren()[87]
local Event200  = Network:GetChildren()[200]
local Event156  = Network:GetChildren()[156]
local Event39   = Network:GetChildren()[39]

-- ============================================
-- 找最近敌人（跳过队友）
-- ============================================
local function findNearestEnemy()
    local char = LocalPlayer.Character
    local hrp = char and char:FindFirstChild("HumanoidRootPart")
    if not hrp then return nil end

    local nearest, nearestDist = nil, math.huge
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= LocalPlayer and p.Character then
            local hum = p.Character:FindFirstChildOfClass("Humanoid")
            local tHrp = p.Character:FindFirstChild("HumanoidRootPart")
            if hum and hum.Health > 0 and tHrp then
                local skip = false
                if p.Team and LocalPlayer.Team and p.Team == LocalPlayer.Team then
                    skip = true
                end
                if not skip then
                    local dist = (tHrp.Position - hrp.Position).Magnitude
                    if dist < nearestDist then
                        nearest = p
                        nearestDist = dist
                    end
                end
            end
        end
    end
    return nearest
end

-- ============================================
-- 配置
-- ============================================
local Config = {
    E87_Enabled = false,
    E87_Interval = 0.1,

    E200_Enabled = false,
    E200_Interval = 0.1,

    Arrest_Enabled = false,
    Arrest_Interval = 0.5,

    E39_Enabled = false,
    E39_Interval = 0.1,

}

-- ============================================
-- [87] 循环
-- ============================================
task.spawn(function()
    while true do
        if Config.E87_Enabled then
            local enemy = findNearestEnemy()
            if enemy then
                pcall(function()
                    Event87:FireServer(enemy.UserId)
                end)
            end
        end
        task.wait(Config.E87_Interval)
    end
end)

-- ============================================
-- [200] 循环
-- ============================================
task.spawn(function()
    while true do
        if Config.E200_Enabled then
            local enemy = findNearestEnemy()
            if enemy then
                pcall(function()
                    Event200:FireServer(enemy.UserId)
                end)
            end
        end
        task.wait(Config.E200_Interval)
    end
end)

-- ============================================
-- [156] 逮捕光环
-- ============================================
local lastArrest = 0

RunService.Heartbeat:Connect(function()
    if not Config.Arrest_Enabled then return end
    local now = tick()
    if now - lastArrest < Config.Arrest_Interval then return end
    local enemy = findNearestEnemy()
    if enemy then
        pcall(function()
            Event156:FireServer(enemy.UserId)
        end)
        lastArrest = now
    end
end)

-- ============================================
-- [39] 抓取光环
-- ============================================
local lastAura39 = 0

RunService.Heartbeat:Connect(function()
    if not Config.E39_Enabled then return end
    local now = tick()
    if now - lastAura39 < Config.E39_Interval then return end

    local enemy = findNearestEnemy()
    if enemy and Event39 then
        pcall(function()
            Event39:FireServer(enemy.UserId)
        end)
        lastAura39 = now
    end
end)

Tabs.gh:Toggle({
    Title = "启用救援",
    Default = false,
    Callback = function(v) Config.E87_Enabled = v end,
})

Tabs.gh:Slider({
    Title = "救援间隔",
    Value = { Min = 0.05, Max = 2, Default = 0.1 },
    Step = 0.05,
    Callback = function(v) Config.E87_Interval = v end,
})

-- [200] 控件
Tabs.gh:Toggle({
    Title = "启用脚踩",
    Default = false,
    Callback = function(v) Config.E200_Enabled = v end,
})

Tabs.gh:Slider({
    Title = "脚踩间隔",
    Value = { Min = 0.05, Max = 2, Default = 0.1 },
    Step = 0.05,
    Callback = function(v) Config.E200_Interval = v end,
})

-- 逮捕光环控件
Tabs.gh:Toggle({
    Title = "启用逮捕光环",
    Default = false,
    Callback = function(v) Config.Arrest_Enabled = v end,
})

Tabs.gh:Slider({
    Title = "逮捕间隔",
    Value = { Min = 0.1, Max = 3, Default = 0.5 },
    Step = 0.1,
    Callback = function(v) Config.Arrest_Interval = v end,
})
-- [39] 抓取光环控件
Tabs.gh:Toggle({
    Title = "启用抓取光环",
    Default = false,
    Callback = function(v) Config.E39_Enabled = v end,
})

Tabs.gh:Slider({
    Title = "抓取间隔",
    Value = { Min = 0.05, Max = 2, Default = 0.1 },
    Step = 0.05,
    Callback = function(v) Config.E39_Interval = v end,
})
-- ========== WindUI bot标签页UI控件 ==========
Tabs.bot:Paragraph({
    Title = "🎯自瞄与子弹追踪",
    Desc = "Camera暴力自瞄 + 扩大碰撞箱实现子弹命中",
})
Tabs.bot:Toggle({
    Title = "🎯 自瞄总开关",
    Desc = "暴力Camera自瞄，直接控制视角锁定目标",
    Default = false,
    Callback = function(state)
        AimConfig.Enabled = state
        if state then
            if not mainConn then
                mainConn = RunService.RenderStepped:Connect(function()
                    if not AimConfig.Enabled then
                        aimTargetPart = nil
                        aimFOVCircle.Visible = false
                        aimTracer.Visible = false
                        return
                    end
                    aimFOVCircle.Position = Camera.ViewportSize / 2
                    aimFOVCircle.Radius = AimConfig.FOV
                    aimFOVCircle.Visible = AimConfig.ShowFOV
                    aimTargetPart = findClosestPlayer()
                    doCameraAim()
                    if aimTargetPart and aimTargetPart.Parent then
                        local sp, vis = Camera:WorldToViewportPoint(aimTargetPart.Position)
                        if vis then
                            aimTracer.Visible = AimConfig.ShowTracer
                            aimTracer.From = Camera.ViewportSize / 2
                            aimTracer.To = Vector2.new(sp.X, sp.Y)
                        else
                            aimTracer.Visible = false
                        end
                    else
                        aimTracer.Visible = false
                    end
                end)
            end
        else
            if mainConn then
                mainConn:Disconnect()
                mainConn = nil
            end
            aimTargetPart = nil
            aimFOVCircle.Visible = false
            aimTracer.Visible = false
        end
    end
})
-- ======子弹追踪：扩大HumanoidRootPart碰撞箱【已经修改上色】 =====
local btHbSize = 8
local btHbConn = nil
local function btExpandPlayer(player)
    if player == LocalPlayer then return end
    if AimConfig.TeamCheck and player.Team and player.Team == LocalPlayer.Team then return end
    local char = player.Character
    if not char then return end
    local humanoid = char:FindFirstChildOfClass("Humanoid")
    if not humanoid or humanoid.Health <= 0 then return end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    local size = math.clamp(btHbSize, 0, 100)
    pcall(function()
    hrp.Size = Vector3.new(size, size, size)
    hrp.Transparency = 0.85
    hrp.Color = Color3.fromRGB(190, 190, 190)
    hrp.Material = Enum.Material.Neon
    hrp.CanCollide = false
end)

end
local function btResetPlayer(player)
    local char = player.Character
    if not char then return end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    pcall(function()
        hrp.Size = Vector3.new(2, 2, 1)
        hrp.Transparency = 0
        hrp.Color = Color3.fromRGB(163,162,165) --恢复原本灰色
        hrp.Material = Enum.Material.Plastic    --恢复普通材质
        hrp.CanCollide = true
    end)
end
Tabs.bot:Toggle({
    Title = "💣 子弹追踪总开关",
    Desc = "扩大敌人碰撞箱",
    Default = false,
    Callback = function(state)
        AimConfig.BulletTrack = state
        if state then
            if not btHbConn then
                btHbConn = RunService.Heartbeat:Connect(function()
                    if AimConfig.BulletTrack then
                        for i = 1, #Players:GetPlayers() do
                            btExpandPlayer(Players:GetPlayers()[i])
                        end
                    end
                end)
            end
            -- 重生监听
            for i = 1, #Players:GetPlayers() do
                local player = Players:GetPlayers()[i]
                if player ~= LocalPlayer then
                    player.CharacterAdded:Connect(function()
                        task.wait(1)
                        if AimConfig.BulletTrack then
                            btExpandPlayer(player)
                        end
                    end)
                end
            end
        else
            if btHbConn then
                btHbConn:Disconnect()
                btHbConn = nil
            end
            for i = 1, #Players:GetPlayers() do
                btResetPlayer(Players:GetPlayers()[i])
            end
        end
    end
})
Tabs.bot:Slider({
    Title = "📦 判定箱大小",
    Desc = "敌人碰撞箱扩大倍数 (0=关闭,100=巨大)",
    Value = { Min = 0, Max = 100, Default = 8 },
    Step = 1,
    Callback = function(value)
        btHbSize = value
    end
})
Tabs.bot:Slider({
    Title = "🎯 自瞄FOV范围",
    Desc = "屏幕准星搜索范围(像素)",
    Value = { Min = 20, Max = 1000, Default = 200 },
    Step = 10,
    Callback = function(value)
        AimConfig.FOV = value
        aimFOVCircle.Radius = value
    end
})
Tabs.bot:Slider({
    Title = "🔘 平滑系数",
    Desc = "1=瞬间锁头，数值越小越丝滑",
    Value = { Min = 0.01, Max = 1, Default = 0.15 },
    Step = 0.01,
    Callback = function(value)
        AimConfig.Smoothness = value
    end
})
Tabs.bot:Slider({
    Title = "⚡ 预判强度",
    Desc = "预判敌人移动速度",
    Value = { Min = 0, Max = 1, Default = 0.12 },
    Step = 0.01,
    Callback = function(value)
        AimConfig.Prediction = value
    end
})
Tabs.bot:Slider({
    Title = "🔫 子弹速度",
    Desc = "用于弹道预判",
    Value = { Min = 100, Max = 5000, Default = 1500 },
    Step = 50,
    Callback = function(value)
        AimConfig.BulletSpeed = value
    end
})
Tabs.bot:Slider({
    Title = "📉 弹道下坠补偿",
    Desc = "模拟子弹下坠",
    Value = { Min = 0, Max = 200, Default = 0 },
    Step = 1,
    Callback = function(value)
        AimConfig.BulletDrop = value
    end
})
Tabs.bot:Dropdown({
    Title = "🎯 瞄准部位",
    Desc = "优先瞄准身体哪个部位",
    Values = {"Head", "HumanoidRootPart", "UpperTorso", "LowerTorso"},
    Callback = function(option)
        AimConfig.AimPart = option
    end
})
Tabs.bot:Toggle({
    Title = "🧱 掩体判断",
    Desc = "被墙挡住就不锁定敌人",
    Default = true,
    Callback = function(state)
        AimConfig.WallCheck = state
    end
})
Tabs.bot:Toggle({
    Title = "⭕ 显示FOV圆圈",
    Desc = "屏幕绘制自瞄搜索圈",
    Default = false,
    Callback = function(state)
        AimConfig.ShowFOV = state
    end
})
Tabs.bot:Toggle({
    Title = "📏 显示自瞄射线",
    Desc = "绘制从准星到目标红线",
    Default = true,
    Callback = function(state)
        AimConfig.ShowTracer = state
    end
})
Tabs.bot:Toggle({
    Title = "👥 区分队友",
    Desc = "不会锁定同队伍玩家",
    Default = true,
    Callback = function(state)
        AimConfig.TeamCheck = state
    end
})
Tabs.bot:Toggle({
    Title = "🦘 跳跃预判",
    Desc = "预判敌人向上跳跃位移",
    Default = true,
    Callback = function(state)
        AimConfig.JumpPrediction = state
    end
})
-- ==================== zj 标签：子追静默瞄准（WindUI 格式） ====================

local SilentAimSettings = {
    Enabled = false,
    TeamCheck = false,
    VisibleCheck = false,
    TargetPart = "HumanoidRootPart",
    FOVRadius = 130,
    FOVVisible = false,
    ShowSilentAimTarget = false,
    HitChance = 100,
    FixedFOV = true,
    TargetIndicatorRadius = 20,
    MaxDistance = 500,
    PriorityMode = "准星最近",
    Wallbang = false,
    ShowTracer = false,
    TracerFromBottom = true,
    TracerThickness = 1,
    TracerTransparency = 0.3,
}

local sa_currentTargetPart = nil
local sa_lastTargetCharacter = nil

-- 目标指示器（红色）
local sa_target_circle = Drawing.new("Circle")
sa_target_circle.Visible = false
sa_target_circle.Thickness = 2
sa_target_circle.Filled = false
sa_target_circle.Color = Color3.fromRGB(255, 0, 0)

-- 瞄准射线（红色）
local sa_tracer = Drawing.new("Line")
sa_tracer.Visible = false
sa_tracer.Thickness = 1
sa_tracer.Transparency = 0.3
sa_tracer.Color = Color3.fromRGB(255, 0, 0)
sa_tracer.ZIndex = 999

-- FOV 圈（蓝色）
local sa_FOVGui = Instance.new("ScreenGui", LocalPlayer:WaitForChild("PlayerGui"))
sa_FOVGui.Name = "SA_FOVGui"
sa_FOVGui.ResetOnSpawn = false
sa_FOVGui.IgnoreGuiInset = true
sa_FOVGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
sa_FOVGui.Enabled = false

local sa_FOVFrame = Instance.new("Frame", sa_FOVGui)
sa_FOVFrame.AnchorPoint = Vector2.new(0.5, 0.5)
sa_FOVFrame.Position = UDim2.fromScale(0.5, 0.5)
sa_FOVFrame.BackgroundTransparency = 1
sa_FOVFrame.Size = UDim2.fromOffset(260, 260)

local sa_FOVStroke = Instance.new("UIStroke", sa_FOVFrame)
sa_FOVStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
sa_FOVStroke.Thickness = 1
sa_FOVStroke.Transparency = 0.5
sa_FOVStroke.Color = Color3.fromRGB(54, 57, 241)

local sa_FOVCorner = Instance.new("UICorner", sa_FOVFrame)
sa_FOVCorner.CornerRadius = UDim.new(1, 0)

-- 工具函数
local function SA_getScreenPos(v)
    local p, on = Camera:WorldToViewportPoint(v)
    return Vector2.new(p.X, p.Y), on
end

local function SA_isVisible(part, origin)
    if not part then return false end
    local char = LocalPlayer.Character
    if not char then return false end
    local o = origin or Camera.CFrame.Position
    local dir = part.Position - o
    local rp = RaycastParams.new()
    rp.FilterType = Enum.RaycastFilterType.Exclude
    rp.FilterDescendantsInstances = {char, part.Parent}
    return not workspace:Raycast(o, dir.Unit * dir.Magnitude, rp)
end

local function SA_getClosestPlayer()
    local myChar = LocalPlayer.Character
    if not myChar or not myChar:FindFirstChild("HumanoidRootPart") then return nil end
    local myRoot = myChar.HumanoidRootPart
    local aimPoint = SilentAimSettings.FixedFOV and (Camera.ViewportSize / 2) or UserInputService:GetMouseLocation()
    local list = {}

    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= LocalPlayer and not (SilentAimSettings.TeamCheck and p.Team == LocalPlayer.Team) then
            local c = p.Character
            local h = c and c:FindFirstChildOfClass("Humanoid")
            if c and h and h.Health > 0 then
                local part = c:FindFirstChild(SilentAimSettings.TargetPart) or c:FindFirstChild("HumanoidRootPart")
                if part then
                    if not (SilentAimSettings.VisibleCheck and not SA_isVisible(part, myChar.Head.Position)) then
                        local dist = (myRoot.Position - part.Position).Magnitude
                        if dist <= SilentAimSettings.MaxDistance then
                            local sp, on = SA_getScreenPos(part.Position)
                            if on then
                                local fovDist = (aimPoint - sp).Magnitude
                                if fovDist <= SilentAimSettings.FOVRadius then
                                    table.insert(list, {char = c, fov = fovDist, dist = dist, health = h.Health})
                                end
                            end
                        end
                    end
                end
            end
        end
    end

    if #list == 0 then return nil end
    table.sort(list, function(a, b)
        if SilentAimSettings.PriorityMode == "最低血量" then return a.health < b.health
        elseif SilentAimSettings.PriorityMode == "距离最近" then return a.dist < b.dist
        else return a.fov < b.fov end
    end)
    return list[1].char
end

-- ═══════════════════════════════════════════════════
-- WindUI 控件（全部挂在 Tabs.zj）
-- ═══════════════════════════════════════════════════

-- 主开关
Tabs.zj:Toggle({
    Title = "启用静默瞄准",
    Desc = "开启后子弹自动打向敌人",
    Default = false,
    Callback = function(v) SilentAimSettings.Enabled = v end,
})

Tabs.zj:Toggle({
    Title = "队伍检查",
    Desc = "忽略队友",
    Default = false,
    Callback = function(v) SilentAimSettings.TeamCheck = v end,
})

Tabs.zj:Toggle({
    Title = "可见性检查",
    Desc = "被墙挡住的不锁",
    Default = false,
    Callback = function(v) SilentAimSettings.VisibleCheck = v end,
})

Tabs.zj:Toggle({
    Title = "穿墙",
    Default = false,
    Callback = function(v) SilentAimSettings.Wallbang = v end,
})

Tabs.zj:Slider({
    Title = "命中率",
    Value = { Min = 0, Max = 100, Default = 100 },
    Step = 1,
    Callback = function(v) SilentAimSettings.HitChance = v end,
})

Tabs.zj:Divider()

-- 目标设置
Tabs.zj:Dropdown({
    Title = "目标部位",
    Values = { "Head", "HumanoidRootPart" },
    Default = "HumanoidRootPart",
    Callback = function(v) SilentAimSettings.TargetPart = v end,
})

Tabs.zj:Dropdown({
    Title = "优先模式",
    Values = { "准星最近", "距离最近", "最低血量" },
    Default = "准星最近",
    Callback = function(v) SilentAimSettings.PriorityMode = v end,
})

Tabs.zj:Slider({
    Title = "最大距离",
    Value = { Min = 10, Max = 2000, Default = 500 },
    Step = 10,
    Callback = function(v) SilentAimSettings.MaxDistance = v end,
})

Tabs.zj:Divider()

-- FOV 圈
Tabs.zj:Toggle({
    Title = "显示 FOV 圈",
    Default = false,
    Callback = function(v) sa_FOVGui.Enabled = v end,
})

Tabs.zj:Slider({
    Title = "FOV 圈半径",
    Value = { Min = 10, Max = 1000, Default = 130 },
    Step = 10,
    Callback = function(v)
        sa_FOVFrame.Size = UDim2.fromOffset(v * 2, v * 2)
        SilentAimSettings.FOVRadius = v
    end,
})

Tabs.zj:Toggle({
    Title = "固定 FOV（屏幕中心）",
    Default = true,
    Callback = function(v) SilentAimSettings.FixedFOV = v end,
})

Tabs.zj:Divider()

-- 目标指示器
Tabs.zj:Toggle({
    Title = "显示目标指示器",
    Desc = "被锁定的敌人头上显示红圈",
    Default = false,
    Callback = function(v) SilentAimSettings.ShowSilentAimTarget = v end,
})

Tabs.zj:Slider({
    Title = "指示器大小",
    Value = { Min = 5, Max = 50, Default = 20 },
    Step = 1,
    Callback = function(v) SilentAimSettings.TargetIndicatorRadius = v end,
})

Tabs.zj:Divider()

-- 瞄准射线
Tabs.zj:Toggle({
    Title = "显示瞄准射线",
    Default = false,
    Callback = function(v) SilentAimSettings.ShowTracer = v end,
})

Tabs.zj:Toggle({
    Title = "从屏幕底部发射",
    Desc = "关 = 从屏幕中心发射",
    Default = true,
    Callback = function(v) SilentAimSettings.TracerFromBottom = v end,
})

Tabs.zj:Slider({
    Title = "射线粗细",
    Value = { Min = 1, Max = 10, Default = 1 },
    Step = 1,
    Callback = function(v)
        SilentAimSettings.TracerThickness = v
        sa_tracer.Thickness = v
    end,
})

Tabs.zj:Slider({
    Title = "射线透明度",
    Value = { Min = 0, Max = 1, Default = 0.3 },
    Step = 0.05,
    Callback = function(v)
        SilentAimSettings.TracerTransparency = v
        sa_tracer.Transparency = v
    end,
})

-- ═══════════════════════════════════════════════════
-- 主循环
-- ═══════════════════════════════════════════════════
RunService.RenderStepped:Connect(function()
    sa_currentTargetPart = nil
    local target = nil

    if SilentAimSettings.Enabled then
        target = SA_getClosestPlayer()
    end

    sa_lastTargetCharacter = target

    if target then
        local h = target:FindFirstChildOfClass("Humanoid")
        if h and h.Health > 0 then
            sa_currentTargetPart = target:FindFirstChild(SilentAimSettings.TargetPart) or target:FindFirstChild("HumanoidRootPart")
        end
    end

    -- 目标指示器
    if sa_target_circle then
        sa_target_circle.Visible = false
        if sa_currentTargetPart and SilentAimSettings.ShowSilentAimTarget then
            local sp, on = SA_getScreenPos(sa_currentTargetPart.Position)
            if on then
                sa_target_circle.Visible = true
                sa_target_circle.Position = sp
                sa_target_circle.Radius = SilentAimSettings.TargetIndicatorRadius
            end
        end
    end

    -- 瞄准射线
    sa_tracer.Visible = false
    if sa_currentTargetPart and SilentAimSettings.ShowTracer and SilentAimSettings.Enabled then
        local sp, on = SA_getScreenPos(sa_currentTargetPart.Position)
        if on then
            local fromPos
            if SilentAimSettings.TracerFromBottom then
                fromPos = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y)
            else
                fromPos = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
            end
            sa_tracer.From = fromPos
            sa_tracer.To = sp
            sa_tracer.Thickness = SilentAimSettings.TracerThickness
            sa_tracer.Transparency = SilentAimSettings.TracerTransparency
            sa_tracer.Visible = true
        end
    end

    -- FOV 圈位置
    if sa_FOVGui.Enabled then
        if SilentAimSettings.FixedFOV then
            sa_FOVFrame.Position = UDim2.fromScale(0.5, 0.5)
        else
            local m = UserInputService:GetMouseLocation()
            sa_FOVFrame.Position = UDim2.fromOffset(m.X, m.Y)
        end
    end
end)

-- Hook Raycast（含相机避障过滤）
local sa_oldNamecall
sa_oldNamecall = hookmetamethod(game, "__namecall", newcclosure(function(...)
    local Method = getnamecallmethod()
    local Args = {...}
    local self = Args[1]
    if SilentAimSettings.Enabled and not checkcaller() and sa_currentTargetPart then
        if math.random() <= SilentAimSettings.HitChance / 100 then
            if Method == "Raycast" then
                if #Args >= 3 and typeof(Args[2]) == "Vector3" and typeof(Args[3]) == "Vector3" then
                    local origin = Args[2]
                    local direction = Args[3]

                    -- 相机避障过滤：direction 长度 < 100 放过
                    if direction.Magnitude < 100 then
                        return sa_oldNamecall(...)
                    end

                    Args[3] = (sa_currentTargetPart.Position - origin).Unit * 1000
                    return sa_oldNamecall(unpack(Args))
                end
            end
        end
    end
    return sa_oldNamecall(...)
end))

print("[静默瞄准] 已加载到 Tabs.zj（WindUI 格式）")
------=======ESP=======---
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

ESP_Config = {
    EnableESP = false,
    ShowBox = true,
    ShowHealth = true,
    ShowName = true,
    ShowDistance = true,
    ShowTracer = false,
    ShowSkeleton = false,
    ShowWeapon = false,
    WallHack = false,
    TeamCheck = false,
    MaxDrawDistance = 350,
    BoxThickness = 1,
    TracerThickness = 1,
    SkeletonThickness = 2,
    EnemyColor = Color3.new(1, 0.3, 0.3),
    TeammateColor = Color3.new(0.3, 1, 0.3),
    NPCColor = Color3.new(1, 1, 0.2),
    BoxColor = Color3.new(1, 1, 1),
    TracerColor = Color3.new(1, 0, 0),
    SkeletonColor = Color3.new(0.2, 0.8, 1),
    HealthBarColor = Color3.new(0, 1, 0),
}

-- Drawing API ESP组件表
local ESPComponents = {}

-- 创建单个玩家的Drawing ESP
local function createESP(player)
    local box = Drawing.new("Square")
    box.Visible = false
    box.Color = ESP_Config.BoxColor
    box.Thickness = ESP_Config.BoxThickness
    box.Filled = false

    local healthBar = Drawing.new("Square")
    healthBar.Visible = false
    healthBar.Color = ESP_Config.HealthBarColor
    healthBar.Thickness = 1
    healthBar.Filled = true

    local healthBarBackground = Drawing.new("Square")
    healthBarBackground.Visible = false
    healthBarBackground.Color = Color3.new(0, 0, 0)
    healthBarBackground.Transparency = 0.5
    healthBarBackground.Thickness = 1
    healthBarBackground.Filled = true

    local healthBarBorder = Drawing.new("Square")
    healthBarBorder.Visible = false
    healthBarBorder.Color = Color3.new(1, 1, 1)
    healthBarBorder.Thickness = 1
    healthBarBorder.Filled = false

    local healthText = Drawing.new("Text")
    healthText.Visible = false
    healthText.Color = Color3.new(1, 1, 1)
    healthText.Size = 14
    healthText.Font = Drawing.Fonts.Monospace
    healthText.Outline = true
    healthText.OutlineColor = Color3.new(0, 0, 0)

    local nameText = Drawing.new("Text")
    nameText.Visible = false
    nameText.Color = Color3.new(1, 1, 1)
    nameText.Size = 16
    nameText.Font = Drawing.Fonts.Monospace
    nameText.Outline = true
    nameText.OutlineColor = Color3.new(0, 0, 0)

    local distanceText = Drawing.new("Text")
    distanceText.Visible = false
    distanceText.Color = Color3.new(1, 1, 0)
    distanceText.Size = 14
    distanceText.Font = Drawing.Fonts.Monospace
    distanceText.Outline = true
    distanceText.OutlineColor = Color3.new(0, 0, 0)

    local weaponText = Drawing.new("Text")
    weaponText.Visible = false
    weaponText.Color = Color3.new(1, 0.5, 0)
    weaponText.Size = 14
    weaponText.Font = Drawing.Fonts.Monospace
    weaponText.Outline = true
    weaponText.OutlineColor = Color3.new(0, 0, 0)

    local tracer = Drawing.new("Line")
    tracer.Visible = false
    tracer.Color = ESP_Config.TracerColor
    tracer.Thickness = ESP_Config.TracerThickness

    -- 骨架线条与头部圆点
    local skeletonLines = {}
    local skeletonPoints = {}

    for i = 1, 15 do
        skeletonLines[i] = Drawing.new("Line")
        skeletonLines[i].Visible = false
        skeletonLines[i].Color = ESP_Config.SkeletonColor
        skeletonLines[i].Thickness = ESP_Config.SkeletonThickness
    end

    skeletonPoints["Head"] = Drawing.new("Circle")
    skeletonPoints["Head"].Visible = false
    skeletonPoints["Head"].Color = Color3.new(1, 0.5, 0)
    skeletonPoints["Head"].Thickness = 2
    skeletonPoints["Head"].Filled = true
    skeletonPoints["Head"].Radius = 4

    local lastHealth = 100
    local healthChangeTime = 0
    local smoothHealth = 100

    ESPComponents[player] = {
        box = box,
        healthBar = healthBar,
        healthBarBackground = healthBarBackground,
        healthBarBorder = healthBarBorder,
        healthText = healthText,
        nameText = nameText,
        distanceText = distanceText,
        weaponText = weaponText,
        tracer = tracer,
        skeletonLines = skeletonLines,
        skeletonPoints = skeletonPoints
    }

    local function hideAll()
        box.Visible = false
        healthBar.Visible = false
        healthBarBackground.Visible = false
        healthBarBorder.Visible = false
        healthText.Visible = false
        nameText.Visible = false
        distanceText.Visible = false
        weaponText.Visible = false
        tracer.Visible = false
        for _, line in pairs(skeletonLines) do
            line.Visible = false
        end
        for _, point in pairs(skeletonPoints) do
            point.Visible = false
        end
    end

    RunService.RenderStepped:Connect(function()
        if not ESP_Config.EnableESP then
            hideAll()
            return
        end
        if not player.Character
            or not player.Character:FindFirstChild("HumanoidRootPart")
            or not player.Character:FindFirstChild("Humanoid")
            or player == LocalPlayer then
            hideAll()
            return
        end

        -- 队友过滤
        if ESP_Config.TeamCheck and player.Team and player.Team == LocalPlayer.Team then
            hideAll()
            return
        end

        local character = player.Character
        local rootPart = character:FindFirstChild("HumanoidRootPart")
        local humanoid = character:FindFirstChild("Humanoid")

        if not rootPart or not humanoid or humanoid.Health <= 0 then
            hideAll()
            return
        end

        local dist = (rootPart.Position - Camera.CFrame.Position).Magnitude
        if dist > ESP_Config.MaxDrawDistance then
            hideAll()
            return
        end

        local rootPos, onScreen = Camera:WorldToViewportPoint(rootPart.Position)
        local headPos, _ = Camera:WorldToViewportPoint(rootPart.Position + Vector3.new(0, 3, 0))
        local legPos, _ = Camera:WorldToViewportPoint(rootPart.Position - Vector3.new(0, 3, 0))

        -- 判断颜色 (队友/敌人)
        local color = ESP_Config.EnemyColor
        if ESP_Config.TeamCheck and player.Team and player.Team == LocalPlayer.Team then
            color = ESP_Config.TeammateColor
        end

        -- 武器名称
        local weaponName = "无武器"
        for _, tool in ipairs(character:GetChildren()) do
            if tool:IsA("Tool") then
                weaponName = tool.Name
                break
            end
        end

        -- 方框透视
        if ESP_Config.ShowBox and onScreen then
            box.Size = Vector2.new(1000 / rootPos.Z, headPos.Y - legPos.Y)
            box.Position = Vector2.new(rootPos.X - box.Size.X / 2, rootPos.Y - box.Size.Y / 2)
            box.Visible = true
            box.Color = ESP_Config.BoxColor
            box.Thickness = ESP_Config.BoxThickness
        else
            box.Visible = false
        end

        -- 血量条
        if ESP_Config.ShowHealth and onScreen then
            local healthPercentage = humanoid.Health / humanoid.MaxHealth
            local barWidth = 50
            local barHeight = 5
            local barX = headPos.X - barWidth / 2
            local barY = headPos.Y - 20

            healthBarBackground.Size = Vector2.new(barWidth, barHeight)
            healthBarBackground.Position = Vector2.new(barX, barY)
            healthBarBackground.Visible = true

            healthBarBorder.Size = Vector2.new(barWidth, barHeight)
            healthBarBorder.Position = Vector2.new(barX, barY)
            healthBarBorder.Visible = true

            smoothHealth = smoothHealth + (humanoid.Health - smoothHealth) * 0.1
            local smoothHP = smoothHealth / humanoid.MaxHealth

            healthBar.Size = Vector2.new(barWidth * smoothHP, barHeight)
            healthBar.Position = Vector2.new(barX, barY)

            -- 血量颜色渐变 (绿>80%, 黄>50%, 橙>20%, 红<20%)
            if smoothHP >= 0.8 then
                healthBar.Color = Color3.new(0, 1, 0)
            elseif smoothHP >= 0.5 then
                healthBar.Color = Color3.new(1, 1, 0)
            elseif smoothHP >= 0.2 then
                healthBar.Color = Color3.new(1, 0.5, 0)
            else
                healthBar.Color = Color3.new(1, 0, 0)
            end

            -- 受伤闪烁
            if humanoid.Health ~= lastHealth then
                healthChangeTime = tick()
                lastHealth = humanoid.Health
            end
            if tick() - healthChangeTime < 0.5 then
                healthBar.Color = Color3.new(1, 0, 0)
            end

            healthBar.Visible = true

            healthText.Position = Vector2.new(barX + barWidth + 5, barY - 5)
            healthText.Text = math.floor(humanoid.Health) .. "/" .. math.floor(humanoid.MaxHealth)
            healthText.Color = color
            healthText.Visible = true
        else
            healthBar.Visible = false
            healthBarBackground.Visible = false
            healthBarBorder.Visible = false
            healthText.Visible = false
        end

        -- 名称 & 距离 & 武器
        if ESP_Config.ShowName and onScreen then
            nameText.Position = Vector2.new(headPos.X, headPos.Y - 35)
            nameText.Text = player.Name
            nameText.Color = color
            nameText.Visible = true

            if ESP_Config.ShowDistance then
                distanceText.Position = Vector2.new(headPos.X, headPos.Y + 10)
                distanceText.Text = math.floor(dist) .. "m"
                distanceText.Visible = true
            else
                distanceText.Visible = false
            end

            if ESP_Config.ShowWeapon then
                weaponText.Position = Vector2.new(headPos.X, headPos.Y - 50)
                weaponText.Text = weaponName
                weaponText.Visible = true
            else
                weaponText.Visible = false
            end
        else
            nameText.Visible = false
            distanceText.Visible = false
            weaponText.Visible = false
        end

        -- 射线透视 (从屏幕底部中心到头部)
        if ESP_Config.ShowTracer then
            local head = character:FindFirstChild("Head")
            if head then
                local hPos, hOnScreen = Camera:WorldToViewportPoint(head.Position)
                if hOnScreen then
                    tracer.From = Vector2.new(Camera.ViewportSize.X / 2, 0)
                    tracer.To = Vector2.new(hPos.X, hPos.Y)
                    tracer.Visible = true
                    tracer.Color = ESP_Config.TracerColor
                    tracer.Thickness = ESP_Config.TracerThickness

                    -- 距离变色
                    if dist < 20 then
                        tracer.Color = Color3.new(0, 1, 0)
                    elseif dist < 50 then
                        tracer.Color = Color3.new(1, 1, 0)
                    else
                        tracer.Color = ESP_Config.TracerColor
                    end
                else
                    tracer.Visible = false
                end
            else
                tracer.Visible = false
            end
        else
            tracer.Visible = false
        end

        -- 骨架透视
        if ESP_Config.ShowSkeleton and onScreen then
            local head = character:FindFirstChild("Head")
            local torso = character:FindFirstChild("Torso") or character:FindFirstChild("UpperTorso")
            local leftArm = character:FindFirstChild("Left Arm") or character:FindFirstChild("LeftUpperArm")
            local rightArm = character:FindFirstChild("Right Arm") or character:FindFirstChild("RightUpperArm")
            local leftLeg = character:FindFirstChild("Left Leg") or character:FindFirstChild("LeftUpperLeg")
            local rightLeg = character:FindFirstChild("Right Leg") or character:FindFirstChild("RightUpperLeg")

            if head and torso and leftArm and rightArm and leftLeg and rightLeg then
                local hP = Camera:WorldToViewportPoint(head.Position)
                local tP = Camera:WorldToViewportPoint(torso.Position)
                local laP = Camera:WorldToViewportPoint(leftArm.Position)
                local raP = Camera:WorldToViewportPoint(rightArm.Position)
                local llP = Camera:WorldToViewportPoint(leftLeg.Position)
                local rlP = Camera:WorldToViewportPoint(rightLeg.Position)

                skeletonPoints["Head"].Position = Vector2.new(hP.X, hP.Y)
                skeletonPoints["Head"].Visible = true

                -- 头->躯干
                skeletonLines[1].From = Vector2.new(hP.X, hP.Y)
                skeletonLines[1].To = Vector2.new(tP.X, tP.Y)
                skeletonLines[1].Visible = true
                -- 躯干->左臂
                skeletonLines[2].From = Vector2.new(tP.X, tP.Y)
                skeletonLines[2].To = Vector2.new(laP.X, laP.Y)
                skeletonLines[2].Visible = true
                -- 躯干->右臂
                skeletonLines[3].From = Vector2.new(tP.X, tP.Y)
                skeletonLines[3].To = Vector2.new(raP.X, raP.Y)
                skeletonLines[3].Visible = true
                -- 躯干->左腿
                skeletonLines[4].From = Vector2.new(tP.X, tP.Y)
                skeletonLines[4].To = Vector2.new(llP.X, llP.Y)
                skeletonLines[4].Visible = true
                -- 躯干->右腿
                skeletonLines[5].From = Vector2.new(tP.X, tP.Y)
                skeletonLines[5].To = Vector2.new(rlP.X, rlP.Y)
                skeletonLines[5].Visible = true

                -- 下臂/下腿 (6-9)
                if character:FindFirstChild("LeftLowerArm") then
                    local pos = Camera:WorldToViewportPoint(character.LeftLowerArm.Position)
                    skeletonLines[6].From = Vector2.new(laP.X, laP.Y)
                    skeletonLines[6].To = Vector2.new(pos.X, pos.Y)
                    skeletonLines[6].Visible = true
                end
                if character:FindFirstChild("RightLowerArm") then
                    local pos = Camera:WorldToViewportPoint(character.RightLowerArm.Position)
                    skeletonLines[7].From = Vector2.new(raP.X, raP.Y)
                    skeletonLines[7].To = Vector2.new(pos.X, pos.Y)
                    skeletonLines[7].Visible = true
                end
                if character:FindFirstChild("LeftLowerLeg") then
                    local pos = Camera:WorldToViewportPoint(character.LeftLowerLeg.Position)
                    skeletonLines[8].From = Vector2.new(llP.X, llP.Y)
                    skeletonLines[8].To = Vector2.new(pos.X, pos.Y)
                    skeletonLines[8].Visible = true
                end
                if character:FindFirstChild("RightLowerLeg") then
                    local pos = Camera:WorldToViewportPoint(character.RightLowerLeg.Position)
                    skeletonLines[9].From = Vector2.new(rlP.X, rlP.Y)
                    skeletonLines[9].To = Vector2.new(pos.X, pos.Y)
                    skeletonLines[9].Visible = true
                end
            else
                for _, line in pairs(skeletonLines) do line.Visible = false end
                for _, point in pairs(skeletonPoints) do point.Visible = false end
            end
        else
            for _, line in pairs(skeletonLines) do line.Visible = false end
            for _, point in pairs(skeletonPoints) do point.Visible = false end
        end
    end)
end

-- 清理玩家ESP Drawing对象
local function cleanupESP(player)
    if ESPComponents[player] then
        local comps = ESPComponents[player]
        for key, component in pairs(comps) do
            if typeof(component) == "table" then
                for _, drawing in pairs(component) do
                    if typeof(drawing) == "userdata" then
                        pcall(function() drawing:Remove() end)
                    end
                end
            else
                if typeof(component) == "userdata" then
                    pcall(function() component:Remove() end)
                end
            end
        end
        ESPComponents[player] = nil
    end
end

-- 为现有玩家创建ESP
for _, player in ipairs(Players:GetPlayers()) do
    if player ~= LocalPlayer then
        createESP(player)
    end
end

-- 新玩家加入时创建ESP
Players.PlayerAdded:Connect(function(player)
    if player ~= LocalPlayer then
        createESP(player)
    end
end)

-- 玩家离开时清理ESP
Players.PlayerRemoving:Connect(function(player)
    cleanupESP(player)
end)

-- ================= HB Tabs.zho UI控制面板 =================
Tabs.ESP:Paragraph({
    Title = "ESP透视设置",
    Desc = "Drawing API高性能透视",
    ImageSize = 22,
    ThumbnailSize = 0
})

-- ESP总开关
Tabs.ESP:Toggle({
    Title = "开启ESP总开关",
    Desc = "全局启用透视",
    Default = false,
    Callback = function(state)
        ESP_Config.EnableESP = state
        if not state then
            for _, player in ipairs(Players:GetPlayers()) do
                if player ~= LocalPlayer then
                    if ESPComponents[player] then
                        for key, component in pairs(ESPComponents[player]) do
                            if typeof(component) == "table" then
                                for _, drawing in pairs(component) do
                                    if typeof(drawing) == "userdata" then
                                        pcall(function() drawing.Visible = false end)
                                    end
                                end
                            else
                                if typeof(component) == "userdata" then
                                    pcall(function() component.Visible = false end)
                                end
                            end
                        end
                    end
                end
            end
        end
    end
})

-- 显示信息开关
Tabs.ESP:Toggle({
    Title = "显示头顶名称",
    Desc = "玩家ID",
    Default = true,
    Callback = function(v) ESP_Config.ShowName = v end
})
Tabs.ESP:Toggle({
    Title = "显示血量",
    Default = true,
    Callback = function(v) ESP_Config.ShowHealth = v end
})
Tabs.ESP:Toggle({
    Title = "显示距离",
    Default = true,
    Callback = function(v) ESP_Config.ShowDistance = v end
})

-- 功能开关
Tabs.ESP:Toggle({
    Title = "方框透视",
    Desc = "2D方框",
    Default = true,
    Callback = function(v) ESP_Config.ShowBox = v end
})
Tabs.ESP:Toggle({
    Title = "射线透视",
    Desc = "从屏幕顶部",
    Default = false,
    Callback = function(v) ESP_Config.ShowTracer = v end
})
Tabs.ESP:Toggle({
    Title = "骨架透视",
    Desc = "骨骼线条",
    Default = false,
    Callback = function(v) ESP_Config.ShowSkeleton = v end
})
Tabs.ESP:Toggle({
    Title = "武器显示",
    Desc = "显示手持武器名",
    Default = false,
    Callback = function(v) ESP_Config.ShowWeapon = v end
})
Tabs.ESP:Toggle({
    Title = "穿墙ESP",
    Desc = "墙体遮挡依旧显示",
    Default = false,
    Callback = function(v) ESP_Config.WallHack = v end
})
Tabs.ESP:Toggle({
    Title = "区分队友颜色",
    Desc = "队友绿/敌人红/NPC黄",
    Default = false,
    Callback = function(v) ESP_Config.TeamCheck = v end
})

-- 可视距离滑块
Tabs.ESP:Slider({
    Title = "ESP最大可视距离",
    Desc = "超出距离不渲染",
    Value = {Min=50, Max=1000, Default=350},
    Step = 10,
    IsTextbox = true,
    Callback = function(val) ESP_Config.MaxDrawDistance = val end
})
---------ESP2-----
-- ==============================================
-- ESP完整版｜直接挂载 Tabs.ESPP｜Toggle开关
-- 依赖：外部已加载WindUI，已定义 Tabs.ESPP
-- ==============================================
local FONT_SIZE = 16        
local FONT_NAME = Drawing.Fonts.Monospace
local MAX_DISTANCE = 1500   
local BOX_THICKNESS = 1     
local BOX_SCALE = 2.2       

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

local ESPEnabled = false
local DrawBox = false
local DrawDistance = false
local DrawName = false
local DrawTracer = false
local DrawHealth = false

local ESPObjects = {}
local ESP_RenderConn = nil
local ESP_Initialized = false

local function WorldToScreen(worldPos)
    local screenPos, onScreen = Camera:WorldToViewportPoint(worldPos)
    if not onScreen then return nil end
    return Vector2.new(screenPos.X, screenPos.Y)
end

local function GetCharacterData(player)
    local char = player.Character
    if not char then return nil end
    local humanoid = char:FindFirstChildOfClass("Humanoid")
    local root = char:FindFirstChild("HumanoidRootPart") or char:FindFirstChild("UpperTorso") or char:FindFirstChild("Torso")
    local head = char:FindFirstChild("Head")
    if not humanoid or not root or not head then return nil end
    return char, humanoid, root, head
end

local function CreateDrawingObjects()
    local objs = {}
    objs.Box = Drawing.new("Square")
    objs.Box.Filled = false
    objs.Box.Transparency = 1
    
    objs.Name = Drawing.new("Text")
    objs.Name.Size = FONT_SIZE
    objs.Name.Center = true
    objs.Name.Outline = true
    objs.Name.Font = FONT_NAME
    
    objs.Distance = Drawing.new("Text")
    objs.Distance.Size = FONT_SIZE - 2
    objs.Distance.Center = true
    objs.Distance.Outline = true
    objs.Distance.Font = FONT_NAME
    
    objs.Health = Drawing.new("Text")
    objs.Health.Size = FONT_SIZE - 2
    objs.Health.Center = true
    objs.Health.Outline = true
    objs.Health.Font = FONT_NAME
    
    objs.Tracer = Drawing.new("Line")
    objs.Tracer.Thickness = 1
    objs.Tracer.Transparency = 0.5
    return objs
end

local function DestroyDrawingObjects(objs)
    if not objs then return end
    for _, obj in pairs(objs) do
        if obj and obj.Remove then
            pcall(function() obj:Remove() end)
        end
    end
end

local function UpdatePlayerESP(player, objs)
    if player == LocalPlayer then return end
    local char, humanoid, root, head = GetCharacterData(player)

    if not char or not humanoid or humanoid.Health <= 0 then
        for _, obj in pairs(objs) do obj.Visible = false end
        return
    end

    local distance = (Camera.CFrame.Position - root.Position).Magnitude
    if distance > MAX_DISTANCE then
        for _, obj in pairs(objs) do obj.Visible = false end
        return
    end

    local headScreen = WorldToScreen(head.Position + Vector3.new(0, 0.5, 0))
    local rootScreen = WorldToScreen(root.Position)
    if not headScreen or not rootScreen then
        for _, obj in pairs(objs) do obj.Visible = false end
        return
    end

    local height = math.abs(headScreen.Y - rootScreen.Y) * BOX_SCALE
    local width = height * 0.65
    height = math.max(height, 15)
    width = math.max(width, 10)

    local topLeft = Vector2.new(headScreen.X - width / 2, headScreen.Y - height * 0.2)
    local bottomRight = Vector2.new(headScreen.X + width / 2, topLeft.Y + height)

    if DrawBox then
        objs.Box.Visible = true
        objs.Box.Size = bottomRight - topLeft
        objs.Box.Position = topLeft
        objs.Box.Thickness = BOX_THICKNESS
        local healthPercent = humanoid.Health / humanoid.MaxHealth
        if healthPercent > 0.5 then
            objs.Box.Color = Color3.fromRGB(0, 255, 0)
        elseif healthPercent > 0.25 then
            objs.Box.Color = Color3.fromRGB(255, 165, 0)
        else
            objs.Box.Color = Color3.fromRGB(255, 0, 0)
        end
    else
        objs.Box.Visible = false
    end

    if DrawName then
        objs.Name.Visible = true
        objs.Name.Text = player.Name
        objs.Name.Color = Color3.fromRGB(255, 255, 255)
        objs.Name.Position = Vector2.new(headScreen.X, topLeft.Y - FONT_SIZE - 2)
    else
        objs.Name.Visible = false
    end

    if DrawDistance then
        objs.Distance.Visible = true
        objs.Distance.Text = string.format("[%d m]", math.floor(distance))
        objs.Distance.Color = Color3.fromRGB(200, 200, 200)
        objs.Distance.Position = Vector2.new(headScreen.X, bottomRight.Y + 2)
    else
        objs.Distance.Visible = false
    end

    if DrawHealth then
        objs.Health.Visible = true
        objs.Health.Text = string.format("HP: %d/%d", math.floor(humanoid.Health), math.floor(humanoid.MaxHealth))
        objs.Health.Color = Color3.fromRGB(0, 255, 0)
        objs.Health.Position = Vector2.new(headScreen.X, bottomRight.Y + FONT_SIZE + 2)
    else
        objs.Health.Visible = false
    end

    if DrawTracer then
        objs.Tracer.Visible = true
        objs.Tracer.From = Vector2.new(Camera.ViewportSize.X / 2, 0)
        objs.Tracer.To = Vector2.new(headScreen.X, bottomRight.Y)
        objs.Tracer.Color = Color3.fromRGB(255, 255, 255)
    else
        objs.Tracer.Visible = false
    end
end

local function InitPlayer(player)
    if player == LocalPlayer then return end
    if ESPObjects[player] then DestroyDrawingObjects(ESPObjects[player]) end
    ESPObjects[player] = CreateDrawingObjects()
end

-- 【ESP初始化按钮】
Tabs.ESPP:Button({
    Title = "初始化ESP",
    Callback = function()
        if ESP_Initialized then
            print("⚠️ ESP已经初始化，无需重复点击")
            return
        end

        ESP_Initialized = true
        for _, player in ipairs(Players:GetPlayers()) do InitPlayer(player) end

        Players.PlayerAdded:Connect(InitPlayer)
        Players.PlayerRemoving:Connect(function(player)
            if ESPObjects[player] then
                DestroyDrawingObjects(ESPObjects[player])
                ESPObjects[player] = nil
            end
        end)

        ESP_RenderConn = RunService.RenderStepped:Connect(function()
            if not ESPEnabled then return end
            for player, objs in pairs(ESPObjects) do
                if player.Parent then
                    pcall(UpdatePlayerESP, player, objs)
                else
                    DestroyDrawingObjects(objs)
                    ESPObjects[player] = nil
                end
            end
        end)
        print("✅ ESP初始化完成，请使用下方Toggle开关控制功能")
    end
})

--========================= Toggle全部挂载 Tabs.ESPP =========================
Tabs.ESPP:Toggle({
    Title = "ESP总开关",
    Value = false,
    Callback = function(s)
        ESPEnabled = s
        print("ESP总开关：", s and "✅开启" or "❌关闭")
        if not s then
            for _, objs in pairs(ESPObjects) do
                for _, obj in pairs(objs) do obj.Visible = false end
            end
        end
    end
})

Tabs.ESPP:Toggle({
    Title = "玩家方框",
    Value = false,
    Callback = function(s)
        DrawBox = s
        print("玩家方框：", s and "✅开启" or "❌关闭")
    end
})

Tabs.ESPP:Toggle({
    Title = "玩家名字",
    Value = false,
    Callback = function(s)
        DrawName = s
        print("玩家名字：", s and "✅开启" or "❌关闭")
    end
})

Tabs.ESPP:Toggle({
    Title = "玩家距离",
    Value = false,
    Callback = function(s)
        DrawDistance = s
        print("玩家距离：", s and "✅开启" or "❌关闭")
    end
})

Tabs.ESPP:Toggle({
    Title = "生命值",
    Value = false,
    Callback = function(s)
        DrawHealth = s
        print("生命值：", s and "✅开启" or "❌关闭")
    end
})

Tabs.ESPP:Toggle({
    Title = "射线",
    Value = false,
    Callback = function(s)
        DrawTracer = s
        print("射线：", s and "✅开启" or "❌关闭")
    end
})

-- =================滑块设置=================
Tabs.ESPP:Slider({
    Title = "最大渲染距离",
    Desc = "超过这个距离的玩家将不绘制",
    Value = {Min=500, Max=5000, Default=1500},
    Step = 100,
    IsTextbox = true,
    Callback = function(value)
        MAX_DISTANCE = value
    end
})

Tabs.ESPP:Slider({
    Title = "方框大小倍数",
    Desc = "数值越大方框越大",
    Value = {Min=1.5, Max=3.0, Default=2.2},
    Step = 0.1,
    IsTextbox = true,
    Callback = function(value)
        BOX_SCALE = value
    end
})

Tabs.ESPP:Slider({
    Title = "方框线条粗细",
    Desc = "数字越大线条越粗",
    Value = {Min=1, Max=5, Default=1},
    Step = 1,
    IsTextbox = true,
    Callback = function(value)
        BOX_THICKNESS = value
    end
})
-------苹果ESP-----
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LP = Players.LocalPlayer

local espEnabled = false -- 开关状态，用于配置保存
local COLOR = Color3.fromRGB(255, 50, 50)
local MAX_DIST = 1000
local TEAM_CHECK = true
local ESP = {}
local espLoop = nil -- 渲染循环句柄

local function createESP(player)
    if player == LP then return end
    local hl = Instance.new("Highlight")
    hl.FillTransparency = 1
    hl.OutlineColor = COLOR
    hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    hl.Enabled = false
    local bb = Instance.new("BillboardGui")
    bb.Size = UDim2.fromOffset(120, 30)
    bb.StudsOffset = Vector3.new(0, 3, 0)
    bb.AlwaysOnTop = true
    bb.ResetOnSpawn = false
    bb.Enabled = false
    local name = Instance.new("TextLabel")
    name.Size = UDim2.new(1, 0, 0, 16)
    name.BackgroundTransparency = 1
    name.TextColor3 = Color3.new(1, 1, 1)
    name.TextSize = 14
    name.Font = Enum.Font.GothamBold
    name.TextStrokeTransparency = 0.3
    name.Text = player.Name
    name.Parent = bb
    local bg = Instance.new("Frame")
    bg.Size = UDim2.new(0, 50, 0, 3)
    bg.Position = UDim2.new(0.5, -25, 0, 18)
    bg.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    bg.BorderSizePixel = 0
    bg.Parent = bb
    local fill = Instance.new("Frame")
    fill.Size = UDim2.new(1, 0, 1, 0)
    fill.BackgroundColor3 = Color3.fromRGB(0, 255, 80)
    fill.BorderSizePixel = 0
    fill.Parent = bg
    ESP[player] = { hl = hl, bb = bb, fill = fill }
end

local function setup(player)
    if ESP[player] then
        ESP[player].hl:Destroy()
        ESP[player].bb:Destroy()
        ESP[player] = nil
    end
    local char = player.Character
    if not char then return end
    createESP(player)
    local e = ESP[player]
    if not e then return end
    local head = char:WaitForChild("Head", 5)
    if head then
        e.hl.Adornee = char
        e.hl.Parent = char
        e.bb.Adornee = head
        e.bb.Parent = head
    end
end

local function startESP()
    if espEnabled then return end
    espEnabled = true

    -- 初始化现有玩家
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= LP then
            if p.Character then setup(p) end
            p.CharacterAdded:Connect(function()
                if espEnabled then setup(p) end
            end)
        end
    end

    -- 新玩家加入
    Players.PlayerAdded:Connect(function(p)
        if p ~= LP then
            p.CharacterAdded:Connect(function()
                if espEnabled then setup(p) end
            end)
            if p.Character and espEnabled then setup(p) end
        end
    end)

    -- 玩家离开清理
    Players.PlayerRemoving:Connect(function(p)
        if ESP[p] then
            ESP[p].hl:Destroy()
            ESP[p].bb:Destroy()
            ESP[p] = nil
        end
    end)

    -- 渲染循环
    espLoop = RunService.RenderStepped:Connect(function()
        if not espEnabled then return end
        local myChar = LP.Character
        local myHRP = myChar and myChar:FindFirstChild("HumanoidRootPart")
        for player, e in pairs(ESP) do
            local char = player.Character
            local hum = char and char:FindFirstChildOfClass("Humanoid")
            local hrp = char and char:FindFirstChild("HumanoidRootPart")
            local show = hum and hrp and hum.Health > 0
            if show and TEAM_CHECK and player.Team and player.Team == LP.Team then show = false end
            if show and myHRP and (myHRP.Position - hrp.Position).Magnitude > MAX_DIST then show = false end
            e.hl.Enabled = show
            e.bb.Enabled = show
            if show then
                local r = math.clamp(hum.Health / math.max(hum.MaxHealth, 1), 0, 1)
                e.fill.Size = UDim2.new(r, 0, 1, 0)
                e.fill.BackgroundColor3 = Color3.fromHSV(r * 0.33, 1, 1)
            end
        end
    end)
end

local function stopESP()
    espEnabled = false
    if espLoop then
        espLoop:Disconnect()
        espLoop = nil
    end
    -- 销毁全部ESP实例
    for p, e in pairs(ESP) do
        e.hl:Destroy()
        e.bb:Destroy()
    end
    table.clear(ESP)
end

-- WindUI 开关控件，把 Tabs.pg 替换成你自己的页面对象
Tabs.pg:Toggle({
    Title = "ESP内透",
    Default = false,
    Callback = function(state)
        if state then
            startESP()
        else
            stopESP()
        end
    end
})

------esp-------
Tabs.wb:Button({
    Title = "检查全局看有人偷吃印钞机没有",
    Callback = function()
        -- ====== 全局搜索 MoneyPrinter（印钞机） ======
local targetName = "MoneyPrinter"

-- ====== 创建MoneyPrinter的ESP（绿色/金钱风格） ======
local function createMoneyPrinterESP(obj)
    if obj:FindFirstChild("ESP_Highlight") then
        return
    end
    
    -- 绿色高亮（金钱风格）
    local highlight = Instance.new("Highlight")
    highlight.Name = "ESP_Highlight"
    highlight.FillColor = Color3.new(0, 0.8, 0.2)           -- 绿色
    highlight.FillTransparency = 0.15
    highlight.OutlineColor = Color3.new(0.3, 1, 0.3)        -- 亮绿边框
    highlight.OutlineTransparency = 0.05
    highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    highlight.Parent = obj
    
    -- 标签
    local billboard = Instance.new("BillboardGui")
    billboard.Name = "ESP_Tag"
    billboard.Size = UDim2.new(0, 180, 0, 40)
    billboard.StudsOffset = Vector3.new(0, 3, 0)
    billboard.AlwaysOnTop = true
    billboard.MaxDistance = 999999
    billboard.Parent = obj
    
    -- 名称
    local textLabel = Instance.new("TextLabel")
    textLabel.Size = UDim2.new(1, 0, 0.5, 0)
    textLabel.Position = UDim2.new(0, 0, 0, 0)
    textLabel.BackgroundTransparency = 1
    textLabel.Text = "有人在偷吃印钞机 MoneyPrinter"
    textLabel.TextColor3 = Color3.new(0.3, 1, 0.3)          -- 亮绿文字
    textLabel.TextScaled = true
    textLabel.Font = Enum.Font.GothamBold
    textLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
    textLabel.TextStrokeTransparency = 0.3
    textLabel.Parent = billboard
    
    -- 距离
    local distLabel = Instance.new("TextLabel")
    distLabel.Size = UDim2.new(1, 0, 0.5, 0)
    distLabel.Position = UDim2.new(0, 0, 0.5, 0)
    distLabel.BackgroundTransparency = 1
    distLabel.Text = " --m"
    distLabel.TextColor3 = Color3.new(1, 1, 1)
    distLabel.TextScaled = true
    distLabel.Font = Enum.Font.Gotham
    distLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
    distLabel.TextStrokeTransparency = 0.3
    distLabel.Parent = billboard
    
    -- 更新距离
    local player = game.Players.LocalPlayer
    if player and player.Character then
        game:GetService("RunService").RenderStepped:Connect(function()
            local root = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
            if root then
                local position = nil
                if obj:IsA("BasePart") then
                    position = obj.Position
                elseif obj:IsA("Model") and obj.PrimaryPart then
                    position = obj.PrimaryPart.Position
                elseif obj:IsA("Model") then
                    local parts = obj:GetDescendants()
                    for _, part in ipairs(parts) do
                        if part:IsA("BasePart") then
                            position = part.Position
                            break
                        end
                    end
                end
                
                if position then
                    local dist = (root.Position - position).Magnitude
                    distLabel.Text = string.format(" %.1fm", dist)
                end
            end
        end)
    end
    
    print("💰 MoneyPrinter 已标记!")
end

-- ====== 搜索全图所有 MoneyPrinter ======
local function searchAllMoneyPrinters()
    local count = 0
    for _, obj in ipairs(workspace:GetDescendants()) do
        if (obj:IsA("BasePart") or obj:IsA("Model")) and obj.Name == targetName then
            createMoneyPrinterESP(obj)
            count = count + 1
        end
    end
    return count
end

-- 执行搜索
local total = searchAllMoneyPrinters()
print("✅ 找到 " .. total .. " 个 MoneyPrinter")
print("✅ MoneyPrinter 透视已启动 (绿色)")

-- ====== 每1秒重新搜索 ======
spawn(function()
    while true do
        wait(5)
        local count = 0
        for _, obj in ipairs(workspace:GetDescendants()) do
            if (obj:IsA("BasePart") or obj:IsA("Model")) and obj.Name == targetName then
                if not obj:FindFirstChild("ESP_Highlight") then
                    createMoneyPrinterESP(obj)
                    count = count + 1
                end
            end
        end
        if count > 0 then
            print("🔄 重新搜索: 找到并标记 " .. count .. " 个 MoneyPrinter")
        end
    end
end)

-- ====== 监听新增 ======
workspace.DescendantAdded:Connect(function(newObj)
    task.wait(0.1)
    if (newObj:IsA("BasePart") or newObj:IsA("Model")) and newObj.Name == targetName then
        if not newObj:FindFirstChild("ESP_Highlight") then
            createMoneyPrinterESP(newObj)
            print("💰 检测到新的 MoneyPrinter!")
        end
    end
end)

print("✅ 全图 MoneyPrinter（印钞机）透视已启动 (自动刷新)")
    end
})
local wbSec1 = Tabs.wb:Section({ Title = "变卖物" })
wbSec1:Button({
    Title = "金块",
    Callback = function()
        -- ====== 获取Gizmos容器 ======
local gizmos = workspace.Local and workspace.Local:FindFirstChild("Gizmos")

if not gizmos then
    warn("Gizmos不存在")
    return
end

-- ====== 检查是否为 Gold Bar（精确匹配） ======
local function isGoldBar(obj)
    return obj.Name == "Gold Bar"
end

-- ====== 创建Gold Bar ESP（金色） ======
local function createGoldBarESP(obj)
    -- 避免重复添加
    if obj:FindFirstChild("ESP_Highlight") then
        return
    end
    
    -- 金色高亮
    local highlight = Instance.new("Highlight")
    highlight.Name = "ESP_Highlight"
    highlight.FillColor = Color3.new(1, 0.8, 0)            -- 金色
    highlight.FillTransparency = 0.2
    highlight.OutlineColor = Color3.new(1, 1, 0)           -- 亮黄色边框
    highlight.OutlineTransparency = 0.05
    highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    highlight.Parent = obj
    
    -- 标签
    local billboard = Instance.new("BillboardGui")
    billboard.Name = "ESP_Tag"
    billboard.Size = UDim2.new(0, 160, 0, 50)
    billboard.StudsOffset = Vector3.new(0, 4, 0)
    billboard.AlwaysOnTop = true
    billboard.MaxDistance = 1000
    billboard.Parent = obj
    
    -- 名称
    local textLabel = Instance.new("TextLabel")
    textLabel.Size = UDim2.new(1, 0, 0.5, 0)
    textLabel.Position = UDim2.new(0, 0, 0, 0)
    textLabel.BackgroundTransparency = 1
    textLabel.Text = "金块 " .. obj.Name
    textLabel.TextColor3 = Color3.new(1, 0.8, 0)           -- 金色文字
    textLabel.TextScaled = true
    textLabel.Font = Enum.Font.GothamBold
    textLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
    textLabel.TextStrokeTransparency = 0.3
    textLabel.Parent = billboard
    
    -- 距离
    local distLabel = Instance.new("TextLabel")
    distLabel.Size = UDim2.new(1, 0, 0.5, 0)
    distLabel.Position = UDim2.new(0, 0, 0.5, 0)
    distLabel.BackgroundTransparency = 1
    distLabel.Text = " --m"
    distLabel.TextColor3 = Color3.new(1, 1, 1)
    distLabel.TextScaled = true
    distLabel.Font = Enum.Font.GothamBold
    distLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
    distLabel.TextStrokeTransparency = 0.3
    distLabel.Parent = billboard
    
    -- 更新距离
    local player = game.Players.LocalPlayer
    if player and player.Character then
        game:GetService("RunService").Heartbeat:Connect(function()
            local root = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
            if root and obj:IsA("BasePart") then
                local dist = (root.Position - obj.Position).Magnitude
                distLabel.Text = string.format(" %.1fm", dist)
            elseif root and obj:IsA("Model") and obj.PrimaryPart then
                local dist = (root.Position - obj.PrimaryPart.Position).Magnitude
                distLabel.Text = string.format(" %.1fm", dist)
            end
        end)
    end
    
    print("⭐ Gold Bar 已标记!")
end

-- ====== 递归搜索所有 Gold Bar ======
local function searchGoldBar(parent)
    local count = 0
    for _, obj in ipairs(parent:GetChildren()) do
        -- 检查当前物体
        if (obj:IsA("BasePart") or obj:IsA("Model")) and isGoldBar(obj) then
            createGoldBarESP(obj)
            count = count + 1
        end
        
        -- 如果是文件夹或模型，深入搜索
        if obj:IsA("Folder") or obj:IsA("Model") then
            count = count + searchGoldBar(obj)
        end
    end
    return count
end

-- ====== 执行扫描 ======
local total = searchGoldBar(gizmos)
print("✅ 找到 " .. total .. " 个 Gold Bar")

-- ====== 监听新增 Gold Bar ======
gizmos.DescendantAdded:Connect(function(newObj)
    task.wait(0.1)
    if (newObj:IsA("BasePart") or newObj:IsA("Model")) and isGoldBar(newObj) then
        if not newObj:FindFirstChild("ESP_Highlight") then
            createGoldBarESP(newObj)
            print("⭐ 新增 Gold Bar")
        end
    end
end)

print("✅ Gold Bar 透视已启动（仅精确匹配）")
    end
})
wbSec1:Button({
    Title = "BTCESP",
    Callback = function()
        -- ====== 全局搜索 Bitcoin ======
local targetName = "Bitcoin"

-- ====== 创建Bitcoin的ESP（橙色/加密货币风格） ======
local function createBitcoinESP(obj)
    if obj:FindFirstChild("ESP_Highlight") then
        return
    end
    
    -- 橙色高亮（比特币风格）
    local highlight = Instance.new("Highlight")
    highlight.Name = "ESP_Highlight"
    highlight.FillColor = Color3.new(1, 0.6, 0)            -- 橙色
    highlight.FillTransparency = 0.15
    highlight.OutlineColor = Color3.new(1, 0.8, 0.2)       -- 金色边框
    highlight.OutlineTransparency = 0.05
    highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    highlight.Parent = obj
    
    -- 标签
    local billboard = Instance.new("BillboardGui")
    billboard.Name = "ESP_Tag"
    billboard.Size = UDim2.new(0, 160, 0, 40)
    billboard.StudsOffset = Vector3.new(0, 3, 0)
    billboard.AlwaysOnTop = true
    billboard.MaxDistance = 999999
    billboard.Parent = obj
    
    -- 名称
    local textLabel = Instance.new("TextLabel")
    textLabel.Size = UDim2.new(1, 0, 0.5, 0)
    textLabel.Position = UDim2.new(0, 0, 0, 0)
    textLabel.BackgroundTransparency = 1
    textLabel.Text = "比特币 Bitcoin"
    textLabel.TextColor3 = Color3.new(1, 0.7, 0.1)          -- 金色文字
    textLabel.TextScaled = true
    textLabel.Font = Enum.Font.GothamBold
    textLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
    textLabel.TextStrokeTransparency = 0.3
    textLabel.Parent = billboard
    
    -- 距离
    local distLabel = Instance.new("TextLabel")
    distLabel.Size = UDim2.new(1, 0, 0.5, 0)
    distLabel.Position = UDim2.new(0, 0, 0.5, 0)
    distLabel.BackgroundTransparency = 1
    distLabel.Text = " --m"
    distLabel.TextColor3 = Color3.new(1, 1, 1)
    distLabel.TextScaled = true
    distLabel.Font = Enum.Font.Gotham
    distLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
    distLabel.TextStrokeTransparency = 0.3
    distLabel.Parent = billboard
    
    -- 更新距离
    local player = game.Players.LocalPlayer
    if player and player.Character then
        game:GetService("RunService").RenderStepped:Connect(function()
            local root = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
            if root then
                local position = nil
                if obj:IsA("BasePart") then
                    position = obj.Position
                elseif obj:IsA("Model") and obj.PrimaryPart then
                    position = obj.PrimaryPart.Position
                elseif obj:IsA("Model") then
                    local parts = obj:GetDescendants()
                    for _, part in ipairs(parts) do
                        if part:IsA("BasePart") then
                            position = part.Position
                            break
                        end
                    end
                end
                
                if position then
                    local dist = (root.Position - position).Magnitude
                    distLabel.Text = string.format(" %.1fm", dist)
                end
            end
        end)
    end
    
    print("₿ Bitcoin 已标记!")
end

-- ====== 搜索全图所有 Bitcoin ======
local function searchAllBitcoin()
    local count = 0
    for _, obj in ipairs(workspace:GetDescendants()) do
        if (obj:IsA("BasePart") or obj:IsA("Model")) and obj.Name == targetName then
            createBitcoinESP(obj)
            count = count + 1
        end
    end
    return count
end

-- 执行搜索
local total = searchAllBitcoin()
print("✅ 找到 " .. total .. " 个 Bitcoin")
print("✅ Bitcoin 透视已启动 (橙色)")

-- ====== 每1秒重新搜索 ======
spawn(function()
    while true do
        wait(5)
        local count = 0
        for _, obj in ipairs(workspace:GetDescendants()) do
            if (obj:IsA("BasePart") or obj:IsA("Model")) and obj.Name == targetName then
                if not obj:FindFirstChild("ESP_Highlight") then
                    createBitcoinESP(obj)
                    count = count + 1
                end
            end
        end
        if count > 0 then
            print("🔄 重新搜索: 找到并标记 " .. count .. " 个 Bitcoin")
        end
    end
end)

-- ====== 监听新增 ======
workspace.DescendantAdded:Connect(function(newObj)
    task.wait(5)
    if (newObj:IsA("BasePart") or newObj:IsA("Model")) and newObj.Name == targetName then
        if not newObj:FindFirstChild("ESP_Highlight") then
            createBitcoinESP(newObj)
            print("₿ 检测到新的 Bitcoin!")
        end
    end
end)

print("✅ 全图 Bitcoin 透视已启动 (自动刷新)")
    end
})
wbSec1:Button({
    Title = "紫宝石",
    Callback = function()
        -- ====== 扫描并透视所有宝石 ======
local function createGemESP(obj, color, icon)
    if obj:FindFirstChild("ESP_Highlight") then
        return
    end
    
    -- 高亮
    local highlight = Instance.new("Highlight")
    highlight.Name = "ESP_Highlight"
    highlight.FillColor = color
    highlight.FillTransparency = 0.2
    highlight.OutlineColor = color
    highlight.OutlineTransparency = 0.05
    highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    highlight.Parent = obj
    
    -- 标签
    local billboard = Instance.new("BillboardGui")
    billboard.Name = "ESP_Tag"
    billboard.Size = UDim2.new(0, 200, 0, 55)
    billboard.StudsOffset = Vector3.new(0, 4, 0)
    billboard.AlwaysOnTop = true
    billboard.MaxDistance = 0
    billboard.Parent = obj
    
    -- 名称
    local textLabel = Instance.new("TextLabel")
    textLabel.Size = UDim2.new(1, 0, 0.5, 0)
    textLabel.Position = UDim2.new(0, 0, 0, 0)
    textLabel.BackgroundTransparency = 1
    textLabel.Text = icon .. " " .. obj.Name
    textLabel.TextColor3 = color
    textLabel.TextScaled = true
    textLabel.Font = Enum.Font.GothamBold
    textLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
    textLabel.TextStrokeTransparency = 0.3
    textLabel.Parent = billboard
    
    -- 距离
    local distLabel = Instance.new("TextLabel")
    distLabel.Size = UDim2.new(1, 0, 0.5, 0)
    distLabel.Position = UDim2.new(0, 0, 0.5, 0)
    distLabel.BackgroundTransparency = 1
    distLabel.Text = " --m"
    distLabel.TextColor3 = Color3.new(1, 1, 1)
    distLabel.TextScaled = true
    distLabel.Font = Enum.Font.GothamBold
    distLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
    distLabel.TextStrokeTransparency = 0.3
    distLabel.Parent = billboard
    
    -- 更新距离
    local player = game.Players.LocalPlayer
    if player and player.Character then
        game:GetService("RunService").Heartbeat:Connect(function()
            local root = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
            if root then
                local position = nil
                if obj:IsA("BasePart") then
                    position = obj.Position
                elseif obj:IsA("Model") and obj.PrimaryPart then
                    position = obj.PrimaryPart.Position
                elseif obj:IsA("Model") then
                    local parts = obj:GetDescendants()
                    for _, part in ipairs(parts) do
                        if part:IsA("BasePart") then
                            position = part.Position
                            break
                        end
                    end
                end
                
                if position then
                    local dist = (root.Position - position).Magnitude
                    distLabel.Text = string.format(" %.1fm", dist)
                end
            end
        end)
    end
    
    print("💎紫宝石 " .. obj.Name .. " 已标记!")
end

-- ====== 获取Gizmos容器 ======
local gizmos = workspace.Local and workspace.Local:FindFirstChild("Gizmos")

if not gizmos then
    warn("Gizmos不存在")
    return
end

-- ====== 定义宝石颜色 ======
local gemColors = {
    ["Sapphire"] = {color = Color3.new(0.6, 0, 1), icon = "💎"},
}

-- ====== 扫描Gizmos下所有宝石 ======
local function scanAllGems()
    local count = 0
    for _, obj in ipairs(gizmos:GetChildren()) do
        local gemInfo = gemColors[obj.Name]
        if gemInfo and (obj:IsA("Model") or obj:IsA("BasePart")) then
            createGemESP(obj, gemInfo.color, gemInfo.icon)
            count = count + 1
        end
    end
    print("✅ 已标记 " .. count .. " 个宝石")
end

-- 执行
scanAllGems()

-- ====== 每5秒重新扫描 ======
spawn(function()
    while true do
        wait(5)
        -- 检查所有宝石是否还有ESP
        for _, obj in ipairs(gizmos:GetChildren()) do
            local gemInfo = gemColors[obj.Name]
            if gemInfo and (obj:IsA("Model") or obj:IsA("BasePart")) then
                if not obj:FindFirstChild("ESP_Highlight") then
                    createGemESP(obj, gemInfo.color, gemInfo.icon)
                end
            end
        end
    end
end)

print("✅ 所有宝石透视已启动")
    end
})
wbSec1:Button({
    Title = "保险箱",
    Callback = function()
-- ====== 全局搜索 SafeDoor ======
local targetName = "SafeDoor"

-- ====== 创建SafeDoor的ESP（金色/保险柜风格） ======
local function createSafeDoorESP(obj)
    -- 避免重复添加
    if obj:FindFirstChild("ESP_Highlight") then
        return
    end
    
    -- 金色高亮（保险柜风格）
    local highlight = Instance.new("Highlight")
    highlight.Name = "ESP_Highlight"
    highlight.FillColor = Color3.new(1, 0.7, 0)            -- 金色
    highlight.FillTransparency = 0.2
    highlight.OutlineColor = Color3.new(1, 0.9, 0.3)       -- 亮金边框
    highlight.OutlineTransparency = 0.05
    highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    highlight.Parent = obj
    
    -- 标签
    local billboard = Instance.new("BillboardGui")
    billboard.Name = "ESP_Tag"
    billboard.Size = UDim2.new(0, 160, 0, 40)
    billboard.StudsOffset = Vector3.new(0, 3, 0)
    billboard.AlwaysOnTop = true
    billboard.MaxDistance = 999999
    billboard.Parent = obj
    
    -- 名称
    local textLabel = Instance.new("TextLabel")
    textLabel.Size = UDim2.new(1, 0, 0.5, 0)
    textLabel.Position = UDim2.new(0, 0, 0, 0)
    textLabel.BackgroundTransparency = 1
    textLabel.Text = "保险箱 SafeDoor"
    textLabel.TextColor3 = Color3.new(1, 0.8, 0)
    textLabel.TextScaled = true
    textLabel.Font = Enum.Font.GothamBold
    textLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
    textLabel.TextStrokeTransparency = 0.3
    textLabel.Parent = billboard
    
    -- 距离
    local distLabel = Instance.new("TextLabel")
    distLabel.Size = UDim2.new(1, 0, 0.5, 0)
    distLabel.Position = UDim2.new(0, 0, 0.5, 0)
    distLabel.BackgroundTransparency = 1
    distLabel.Text = " --m"
    distLabel.TextColor3 = Color3.new(1, 1, 1)
    distLabel.TextScaled = true
    distLabel.Font = Enum.Font.Gotham
    distLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
    distLabel.TextStrokeTransparency = 0.3
    distLabel.Parent = billboard
    
    -- 更新距离
    local player = game.Players.LocalPlayer
    if player and player.Character then
        game:GetService("RunService").RenderStepped:Connect(function()
            local root = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
            if root then
                local position = nil
                if obj:IsA("BasePart") then
                    position = obj.Position
                elseif obj:IsA("Model") and obj.PrimaryPart then
                    position = obj.PrimaryPart.Position
                elseif obj:IsA("Model") then
                    local parts = obj:GetDescendants()
                    for _, part in ipairs(parts) do
                        if part:IsA("BasePart") then
                            position = part.Position
                            break
                        end
                    end
                end
                
                if position then
                    local dist = (root.Position - position).Magnitude
                    distLabel.Text = string.format(" %.1fm", dist)
                end
            end
        end)
    end
    
    print("🔐 SafeDoor 已标记!")
end

-- ====== 搜索所有SafeDoor ======
local function searchAllSafeDoors()
    local count = 0
    for _, obj in ipairs(workspace:GetDescendants()) do
        if (obj:IsA("BasePart") or obj:IsA("Model")) and obj.Name == targetName then
            createSafeDoorESP(obj)
            count = count + 1
        end
    end
    return count
end

-- 执行搜索
local total = searchAllSafeDoors()
print("✅ 找到 " .. total .. " 个 SafeDoor")
print("✅ SafeDoor 透视已启动 (金色)")

-- ====== 每1秒重新搜索 ======
spawn(function()
    while true do
        wait(5)
        local count = 0
        for _, obj in ipairs(workspace:GetDescendants()) do
            if (obj:IsA("BasePart") or obj:IsA("Model")) and obj.Name == targetName then
                if not obj:FindFirstChild("ESP_Highlight") then
                    createSafeDoorESP(obj)
                    count = count + 1
                end
            end
        end
        if count > 0 then
            print("🔄 重新搜索: 找到并标记 " .. count .. " 个 SafeDoor")
        end
    end
end)

-- ====== 监听新增 ======
workspace.DescendantAdded:Connect(function(newObj)
    task.wait(5)
    if (newObj:IsA("BasePart") or newObj:IsA("Model")) and newObj.Name == targetName then
        if not newObj:FindFirstChild("ESP_Highlight") then
            createSafeDoorESP(newObj)
            print(" 检测到新的 SafeDoor!")
        end
    end
end)

print("✅ SafeDoor 透视已启动 (全局搜索 + 自动刷新)")
    end
})

wbSec1:Button({
    Title = "紫水晶",
    Callback = function()
        -- ====== 获取Amethyst Ring ======
local gizmos = workspace.Local and workspace.Local:FindFirstChild("Gizmos")
local amethystRing = gizmos and gizmos:FindFirstChild("Amethyst Ring")

if not amethystRing then
    warn("Amethyst Ring 不存在")
    return
end

-- ====== 创建Amethyst Ring的ESP（紫色） ======
local function createAmethystRingESP(obj)
    if obj:FindFirstChild("ESP_Highlight") then
        return
    end
    
    -- 紫色高亮
    local highlight = Instance.new("Highlight")
    highlight.Name = "ESP_Highlight"
    highlight.FillColor = Color3.new(0.7, 0.2, 1)           -- 紫罗兰色
    highlight.FillTransparency = 0.2
    highlight.OutlineColor = Color3.new(0.9, 0.4, 1)        -- 亮紫边框
    highlight.OutlineTransparency = 0.05
    highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    highlight.Parent = obj
    
    -- 标签
    local billboard = Instance.new("BillboardGui")
    billboard.Name = "ESP_Tag"
    billboard.Size = UDim2.new(0, 200, 0, 55)
    billboard.StudsOffset = Vector3.new(0, 4, 0)
    billboard.AlwaysOnTop = true
    billboard.MaxDistance = 0
    billboard.Parent = obj
    
    -- 名称
    local textLabel = Instance.new("TextLabel")
    textLabel.Size = UDim2.new(1, 0, 0.5, 0)
    textLabel.Position = UDim2.new(0, 0, 0, 0)
    textLabel.BackgroundTransparency = 1
    textLabel.Text = " 紫水晶"
    textLabel.TextColor3 = Color3.new(0.8, 0.3, 1)          -- 紫色文字
    textLabel.TextScaled = true
    textLabel.Font = Enum.Font.GothamBold
    textLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
    textLabel.TextStrokeTransparency = 0.3
    textLabel.Parent = billboard
    
    -- 距离
    local distLabel = Instance.new("TextLabel")
    distLabel.Size = UDim2.new(1, 0, 0.5, 0)
    distLabel.Position = UDim2.new(0, 0, 0.5, 0)
    distLabel.BackgroundTransparency = 1
    distLabel.Text = " --m"
    distLabel.TextColor3 = Color3.new(1, 1, 1)
    distLabel.TextScaled = true
    distLabel.Font = Enum.Font.GothamBold
    distLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
    distLabel.TextStrokeTransparency = 0.3
    distLabel.Parent = billboard
    
    -- 更新距离
    local player = game.Players.LocalPlayer
    if player and player.Character then
        game:GetService("RunService").Heartbeat:Connect(function()
            local root = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
            if root then
                local position = nil
                if obj:IsA("BasePart") then
                    position = obj.Position
                elseif obj:IsA("Model") and obj.PrimaryPart then
                    position = obj.PrimaryPart.Position
                elseif obj:IsA("Model") then
                    local parts = obj:GetDescendants()
                    for _, part in ipairs(parts) do
                        if part:IsA("BasePart") then
                            position = part.Position
                            break
                        end
                    end
                end
                
                if position then
                    local dist = (root.Position - position).Magnitude
                    distLabel.Text = string.format(" %.1fm", dist)
                end
            end
        end)
    end
    
    print("💍 Amethyst Ring 已标记!")
end

-- 执行
createAmethystRingESP(amethystRing)
print("✅ Amethyst Ring 透视已启动")
    end
})

local wbSec2 = Tabs.wb:Section({ Title = "枪械显示" })
wbSec2:Button({
    Title = "AK47",
    Callback = function()
        -- ====== 获取AK-47 ======
local gizmos = workspace.Local and workspace.Local:FindFirstChild("Gizmos")
local pelicanCase = gizmos and gizmos:FindFirstChild("PelicanCase")
local ak47 = pelicanCase and pelicanCase:FindFirstChild("AK-47")

if not ak47 then
    warn("AK-47 不存在，请检查路径")
    return
end

-- ====== 创建AK-47的ESP ======
local function createAK47ESP(obj)
    -- 避免重复添加
    if obj:FindFirstChild("ESP_Highlight") then
        return
    end
    
    -- 高亮（红色/橙色，醒目）
    local highlight = Instance.new("Highlight")
    highlight.Name = "ESP_Highlight"
    highlight.FillColor = Color3.new(1, 0.2, 0)            -- 红橙色
    highlight.FillTransparency = 0.2
    highlight.OutlineColor = Color3.new(1, 0, 0)           -- 红色边框
    highlight.OutlineTransparency = 0.05
    highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    highlight.Parent = obj
    
    -- 标签（MaxDistance = 0 无限远）
    local billboard = Instance.new("BillboardGui")
    billboard.Name = "ESP_Tag"
    billboard.Size = UDim2.new(0, 200, 0, 35)
    billboard.StudsOffset = Vector3.new(0, 4, 0)
    billboard.AlwaysOnTop = true
    billboard.MaxDistance = 0  -- 无限远
    billboard.Parent = obj
    
    -- 名称
    local textLabel = Instance.new("TextLabel")
    textLabel.Size = UDim2.new(1, 0, 0.5, 0)
    textLabel.Position = UDim2.new(0, 0, 0, 0)
    textLabel.BackgroundTransparency = 1
    textLabel.Text = "AK-47"
    textLabel.TextColor3 = Color3.new(1, 0.3, 0)           -- 橙色文字
    textLabel.TextScaled = true
    textLabel.Font = Enum.Font.GothamBold
    textLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
    textLabel.TextStrokeTransparency = 0.3
    textLabel.Parent = billboard
    
    -- 距离
    local distLabel = Instance.new("TextLabel")
    distLabel.Size = UDim2.new(1, 0, 0.5, 0)
    distLabel.Position = UDim2.new(0, 0, 0.5, 0)
    distLabel.BackgroundTransparency = 1
    distLabel.Text = " --m"
    distLabel.TextColor3 = Color3.new(1, 1, 1)
    distLabel.TextScaled = true
    distLabel.Font = Enum.Font.GothamBold
    distLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
    distLabel.TextStrokeTransparency = 0.3
    distLabel.Parent = billboard
    
    -- 更新距离
    local player = game.Players.LocalPlayer
    if player and player.Character then
        game:GetService("RunService").Heartbeat:Connect(function()
            local root = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
            if root then
                -- 获取位置
                local position = nil
                if obj:IsA("BasePart") then
                    position = obj.Position
                elseif obj:IsA("Model") and obj.PrimaryPart then
                    position = obj.PrimaryPart.Position
                elseif obj:IsA("Model") then
                    local parts = obj:GetDescendants()
                    for _, part in ipairs(parts) do
                        if part:IsA("BasePart") then
                            position = part.Position
                            break
                        end
                    end
                end
                
                if position then
                    local dist = (root.Position - position).Magnitude
                    distLabel.Text = string.format(" %.1fm", dist)
                end
            end
        end)
    end
    
    print(" AK-47 已标记!")
end

-- 执行
createAK47ESP(ak47)
print("✅ AK-47 透视已启动")
    end
})

wbSec2:Button({
    Title = "AUG A1",
    Callback = function()
        -- ====== 全局搜索 AUG A1 ======
local targetName = "AUG A1"

-- ====== 创建AUG A1的ESP（紫色/步枪风格） ======
local function createAUGESP(obj)
    if obj:FindFirstChild("ESP_Highlight") then
        return
    end
    
    -- 紫色高亮（科技/步枪风格）
    local highlight = Instance.new("Highlight")
    highlight.Name = "ESP_Highlight"
    highlight.FillColor = Color3.new(0.6, 0.2, 1)           -- 紫色
    highlight.FillTransparency = 0.15
    highlight.OutlineColor = Color3.new(0.8, 0.4, 1)        -- 亮紫边框
    highlight.OutlineTransparency = 0.05
    highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    highlight.Parent = obj
    
    -- 标签
    local billboard = Instance.new("BillboardGui")
    billboard.Name = "ESP_Tag"
    billboard.Size = UDim2.new(0, 160, 0, 28)
    billboard.StudsOffset = Vector3.new(0, 3, 0)
    billboard.AlwaysOnTop = true
    billboard.MaxDistance = 999999
    billboard.Parent = obj
    
    -- 名称
    local textLabel = Instance.new("TextLabel")
    textLabel.Size = UDim2.new(1, 0, 0.5, 0)
    textLabel.Position = UDim2.new(0, 0, 0, 0)
    textLabel.BackgroundTransparency = 1
    textLabel.Text = "AUG A1"
    textLabel.TextColor3 = Color3.new(0.7, 0.3, 1)          -- 紫色文字
    textLabel.TextScaled = true
    textLabel.Font = Enum.Font.GothamBold
    textLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
    textLabel.TextStrokeTransparency = 0.3
    textLabel.Parent = billboard
    
    -- 距离
    local distLabel = Instance.new("TextLabel")
    distLabel.Size = UDim2.new(1, 0, 0.5, 0)
    distLabel.Position = UDim2.new(0, 0, 0.5, 0)
    distLabel.BackgroundTransparency = 1
    distLabel.Text = " --m"
    distLabel.TextColor3 = Color3.new(1, 1, 1)
    distLabel.TextScaled = true
    distLabel.Font = Enum.Font.Gotham
    distLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
    distLabel.TextStrokeTransparency = 0.3
    distLabel.Parent = billboard
    
    -- 更新距离
    local player = game.Players.LocalPlayer
    if player and player.Character then
        game:GetService("RunService").RenderStepped:Connect(function()
            local root = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
            if root then
                local position = nil
                if obj:IsA("BasePart") then
                    position = obj.Position
                elseif obj:IsA("Model") and obj.PrimaryPart then
                    position = obj.PrimaryPart.Position
                elseif obj:IsA("Model") then
                    local parts = obj:GetDescendants()
                    for _, part in ipairs(parts) do
                        if part:IsA("BasePart") then
                            position = part.Position
                            break
                        end
                    end
                end
                
                if position then
                    local dist = (root.Position - position).Magnitude
                    distLabel.Text = string.format(" %.1fm", dist)
                end
            end
        end)
    end
    
    print("🔫 AUG A1 已标记!")
end

-- ====== 搜索全图所有 AUG A1 ======
local function searchAllAUG()
    local count = 0
    for _, obj in ipairs(workspace:GetDescendants()) do
        if (obj:IsA("BasePart") or obj:IsA("Model")) and obj.Name == targetName then
            createAUGESP(obj)
            count = count + 1
        end
    end
    return count
end

-- 执行搜索
local total = searchAllAUG()
print("✅ 找到 " .. total .. " 个 AUG A1")
print("✅ AUG A1 透视已启动 (紫色)")

-- ====== 每1秒重新搜索 ======
spawn(function()
    while true do
        wait(5)
        local count = 0
        for _, obj in ipairs(workspace:GetDescendants()) do
            if (obj:IsA("BasePart") or obj:IsA("Model")) and obj.Name == targetName then
                if not obj:FindFirstChild("ESP_Highlight") then
                    createAUGESP(obj)
                    count = count + 1
                end
            end
        end
        if count > 0 then
            print("🔄 重新搜索: 找到并标记 " .. count .. " 个 AUG A1")
        end
    end
end)

-- ====== 监听新增 ======
workspace.DescendantAdded:Connect(function(newObj)
    task.wait(5)
    if (newObj:IsA("BasePart") or newObj:IsA("Model")) and newObj.Name == targetName then
        if not newObj:FindFirstChild("ESP_Highlight") then
            createAUGESP(newObj)
            print("🔫 检测到新的 AUG A1!")
        end
    end
end)

print("✅ 全图 AUG A1 透视已启动 (自动刷新)")
    end
})
wbSec2:Button({
    Title = "米拉玛狙神AWM",
    Callback = function()
        -- ====== 全局搜索 AWM（仅绘制可交互物品） ======
local targetName = "AWM"

-- ====== 检查物品是否可交互 ======
local function isInteractable(obj)
    if obj:FindFirstChild("ClickDetector") then
        return true
    end
    if obj:FindFirstChild("ProximityPrompt") then
        return true
    end
    if obj:FindFirstChild("TouchInterest") then
        return true
    end
    if obj:IsA("Tool") then
        return true
    end
    if obj:FindFirstChild("Handle") then
        return true
    end
    
    if obj.Parent then
        if obj.Parent:FindFirstChild("ClickDetector") then
            return true
        end
        if obj.Parent:FindFirstChild("ProximityPrompt") then
            return true
        end
        if obj.Parent:FindFirstChild("TouchInterest") then
            return true
        end
        if obj.Parent:IsA("Tool") then
            return true
        end
        if obj.Parent:FindFirstChild("Handle") then
            return true
        end
    end
    
    for _, child in ipairs(obj:GetChildren()) do
        if child:IsA("ClickDetector") or child:IsA("ProximityPrompt") or child:IsA("TouchInterest") then
            return true
        end
        if child.Name == "Handle" then
            return true
        end
    end
    
    return false
end

-- ====== 创建AWM的ESP ======
local function createAWMESP(obj)
    if obj:FindFirstChild("ESP_Highlight") then
        return
    end
    
    local highlight = Instance.new("Highlight")
    highlight.Name = "ESP_Highlight"
    highlight.FillColor = Color3.new(0.3, 0.3, 0.3)
    highlight.FillTransparency = 0.15
    highlight.OutlineColor = Color3.new(1, 0.2, 0.2)
    highlight.OutlineTransparency = 0.05
    highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    highlight.Parent = obj
    
    -- 标签（尺寸调小）
    local billboard = Instance.new("BillboardGui")
    billboard.Name = "ESP_Tag"
    billboard.Size = UDim2.new(0, 140, 0, 25)              -- 从200x55改为140x40
    billboard.StudsOffset = Vector3.new(0, 3, 0)           -- 从4改为3
    billboard.AlwaysOnTop = true
    billboard.MaxDistance = 999999
    billboard.Parent = obj
    
    -- 名称（字体调小）
    local textLabel = Instance.new("TextLabel")
    textLabel.Size = UDim2.new(1, 0, 0.5, 0)
    textLabel.Position = UDim2.new(0, 0, 0, 0)
    textLabel.BackgroundTransparency = 1
    textLabel.Text = " AWM"
    textLabel.TextColor3 = Color3.new(1, 0.3, 0.3)
    textLabel.TextScaled = true
    textLabel.Font = Enum.Font.GothamBold
    textLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
    textLabel.TextStrokeTransparency = 0.3
    textLabel.Parent = billboard
    
    -- 距离（字体调小）
    local distLabel = Instance.new("TextLabel")
    distLabel.Size = UDim2.new(1, 0, 0.5, 0)
    distLabel.Position = UDim2.new(0, 0, 0.5, 0)
    distLabel.BackgroundTransparency = 1
    distLabel.Text = "📏 --m"
    distLabel.TextColor3 = Color3.new(1, 1, 1)
    distLabel.TextScaled = true
    distLabel.Font = Enum.Font.Gotham
    distLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
    distLabel.TextStrokeTransparency = 0.3
    distLabel.Parent = billboard
    
    local player = game.Players.LocalPlayer
    if player and player.Character then
        game:GetService("RunService").RenderStepped:Connect(function()
            local root = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
            if root then
                local position = nil
                if obj:IsA("BasePart") then
                    position = obj.Position
                elseif obj:IsA("Model") and obj.PrimaryPart then
                    position = obj.PrimaryPart.Position
                elseif obj:IsA("Model") then
                    local parts = obj:GetDescendants()
                    for _, part in ipairs(parts) do
                        if part:IsA("BasePart") then
                            position = part.Position
                            break
                        end
                    end
                end
                
                if position then
                    local dist = (root.Position - position).Magnitude
                    distLabel.Text = string.format(" %.1fm", dist)
                end
            end
        end)
    end
    
    print("🎯 AWM 已标记 (可交互)")
end

-- ====== 搜索并绘制 ======
local function searchAndDrawAWM()
    local count = 0
    for _, obj in ipairs(workspace:GetDescendants()) do
        if (obj:IsA("BasePart") or obj:IsA("Model")) and obj.Name == targetName then
            if isInteractable(obj) then
                if not obj:FindFirstChild("ESP_Highlight") then
                    createAWMESP(obj)
                    count = count + 1
                end
            end
        end
    end
    return count
end

local total = searchAndDrawAWM()
print("✅ 找到 " .. total .. " 个可交互的 AWM")

-- ====== 每1秒重新搜索 ======
spawn(function()
    while true do
        wait(5)
        local count = 0
        for _, obj in ipairs(workspace:GetDescendants()) do
            if (obj:IsA("BasePart") or obj:IsA("Model")) and obj.Name == targetName then
                if isInteractable(obj) and not obj:FindFirstChild("ESP_Highlight") then
                    createAWMESP(obj)
                    count = count + 1
                end
            end
        end
    end
end)

-- ====== 监听新增 ======
workspace.DescendantAdded:Connect(function(newObj)
    task.wait(0.1)
    if (newObj:IsA("BasePart") or newObj:IsA("Model")) and newObj.Name == targetName then
        if isInteractable(newObj) and not newObj:FindFirstChild("ESP_Highlight") then
            createAWMESP(newObj)
        end
    end
end)

print("✅ AWM 透视已启动 (仅可交互, 字体已调小)")
    end
})
wbSec2:Button({
    Title = "M4A1",
    Callback = function()
       -- ====== 获取M4A1（支持自动重连） ======
local function getM4A1()
    local gizmos = workspace.Local and workspace.Local:FindFirstChild("Gizmos")
    local pelicanCase = gizmos and gizmos:FindFirstChild("PelicanCase")
    return pelicanCase and pelicanCase:FindFirstChild("M4A1")
end

-- ====== 创建M4A1的ESP ======
local function createM4A1ESP(obj)
    -- 避免重复添加
    if obj:FindFirstChild("ESP_Highlight") then
        return
    end
    
    -- 高亮（蓝色/青色，与AK-47区分）
    local highlight = Instance.new("Highlight")
    highlight.Name = "ESP_Highlight"
    highlight.FillColor = Color3.new(0, 0.5, 1)
    highlight.FillTransparency = 0.2
    highlight.OutlineColor = Color3.new(0, 1, 1)
    highlight.OutlineTransparency = 0.05
    highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    highlight.Parent = obj
    
    -- 标签
    local billboard = Instance.new("BillboardGui")
    billboard.Name = "ESP_Tag"
    billboard.Size = UDim2.new(0, 200, 0, 55)
    billboard.StudsOffset = Vector3.new(0, 4, 0)
    billboard.AlwaysOnTop = true
    billboard.MaxDistance = 0
    billboard.Parent = obj
    
    -- 名称
    local textLabel = Instance.new("TextLabel")
    textLabel.Size = UDim2.new(1, 0, 0.5, 0)
    textLabel.Position = UDim2.new(0, 0, 0, 0)
    textLabel.BackgroundTransparency = 1
    textLabel.Text = " M4A1"
    textLabel.TextColor3 = Color3.new(0, 0.6, 1)
    textLabel.TextScaled = true
    textLabel.Font = Enum.Font.GothamBold
    textLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
    textLabel.TextStrokeTransparency = 0.3
    textLabel.Parent = billboard
    
    -- 距离
    local distLabel = Instance.new("TextLabel")
    distLabel.Size = UDim2.new(1, 0, 0.5, 0)
    distLabel.Position = UDim2.new(0, 0, 0.5, 0)
    distLabel.BackgroundTransparency = 1
    distLabel.Text = " --m"
    distLabel.TextColor3 = Color3.new(1, 1, 1)
    distLabel.TextScaled = true
    distLabel.Font = Enum.Font.GothamBold
    distLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
    distLabel.TextStrokeTransparency = 0.3
    distLabel.Parent = billboard
    
    -- 更新距离
    local player = game.Players.LocalPlayer
    if player and player.Character then
        game:GetService("RunService").Heartbeat:Connect(function()
            local root = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
            if root then
                local position = nil
                if obj:IsA("BasePart") then
                    position = obj.Position
                elseif obj:IsA("Model") and obj.PrimaryPart then
                    position = obj.PrimaryPart.Position
                elseif obj:IsA("Model") then
                    local parts = obj:GetDescendants()
                    for _, part in ipairs(parts) do
                        if part:IsA("BasePart") then
                            position = part.Position
                            break
                        end
                    end
                end
                
                if position then
                    local dist = (root.Position - position).Magnitude
                    distLabel.Text = string.format(" %.1fm", dist)
                end
            end
        end)
    end
    
    print("🔫 M4A1 已标记!")
end

-- ====== 🔄 循环检测 + 绘制 ======
local function startLoopESP()
    local lastM4A1 = nil
    
    game:GetService("RunService").Heartbeat:Connect(function()
        local currentM4A1 = getM4A1()
        
        -- 如果M4A1存在且不是同一个对象实例（重新生成），重新绘制
        if currentM4A1 and currentM4A1 ~= lastM4A1 then
            -- 清理旧ESP（如果对象变了）
            if lastM4A1 then
                local oldHighlight = lastM4A1:FindFirstChild("ESP_Highlight")
                if oldHighlight then oldHighlight:Destroy() end
                local oldTag = lastM4A1:FindFirstChild("ESP_Tag")
                if oldTag then oldTag:Destroy() end
            end
            
            createM4A1ESP(currentM4A1)
            lastM4A1 = currentM4A1
        end
        
        -- 如果M4A1丢失，重置状态
        if not currentM4A1 then
            lastM4A1 = nil
        end
    end)
end

-- 启动循环
startLoopESP()
print("✅ M4A1 循环透视已启动（自动重连）")
    end
})

wbSec2:Button({
    Title = "RPG",
    Callback = function()
        -- ====== 全局搜索 RPG-7 ======
local targetName = "RPG-7"

-- ====== 创建RPG-7的ESP（火箭筒风格） ======
local function createRPG7ESP(obj)
    -- 避免重复添加
    if obj:FindFirstChild("ESP_Highlight") then
        return
    end
    
    -- 橙色/红色高亮（爆炸物风格）
    local highlight = Instance.new("Highlight")
    highlight.Name = "ESP_Highlight"
    highlight.FillColor = Color3.new(1, 0.5, 0)            -- 橙色
    highlight.FillTransparency = 0.2
    highlight.OutlineColor = Color3.new(1, 0.2, 0)         -- 红色边框
    highlight.OutlineTransparency = 0.05
    highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    highlight.Parent = obj
    
    -- 标签
    local billboard = Instance.new("BillboardGui")
    billboard.Name = "ESP_Tag"
    billboard.Size = UDim2.new(0, 200, 0, 55)
    billboard.StudsOffset = Vector3.new(0, 4, 0)
    billboard.AlwaysOnTop = true
    billboard.MaxDistance = 999999
    billboard.Parent = obj
    
    -- 名称
    local textLabel = Instance.new("TextLabel")
    textLabel.Size = UDim2.new(1, 0, 0.5, 0)
    textLabel.Position = UDim2.new(0, 0, 0, 0)
    textLabel.BackgroundTransparency = 1
    textLabel.Text = " RPG-7"
    textLabel.TextColor3 = Color3.new(1, 0.5, 0)           -- 橙色文字
    textLabel.TextScaled = true
    textLabel.Font = Enum.Font.GothamBold
    textLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
    textLabel.TextStrokeTransparency = 0.3
    textLabel.Parent = billboard
    
    -- 距离
    local distLabel = Instance.new("TextLabel")
    distLabel.Size = UDim2.new(1, 0, 0.5, 0)
    distLabel.Position = UDim2.new(0, 0, 0.5, 0)
    distLabel.BackgroundTransparency = 1
    distLabel.Text = " --m"
    distLabel.TextColor3 = Color3.new(1, 1, 1)
    distLabel.TextScaled = true
    distLabel.Font = Enum.Font.GothamBold
    distLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
    distLabel.TextStrokeTransparency = 0.3
    distLabel.Parent = billboard
    
    -- 更新距离
    local player = game.Players.LocalPlayer
    if player and player.Character then
        game:GetService("RunService").RenderStepped:Connect(function()
            local root = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
            if root then
                local position = nil
                if obj:IsA("BasePart") then
                    position = obj.Position
                elseif obj:IsA("Model") and obj.PrimaryPart then
                    position = obj.PrimaryPart.Position
                elseif obj:IsA("Model") then
                    local parts = obj:GetDescendants()
                    for _, part in ipairs(parts) do
                        if part:IsA("BasePart") then
                            position = part.Position
                            break
                        end
                    end
                end
                
                if position then
                    local dist = (root.Position - position).Magnitude
                    distLabel.Text = string.format(" %.1fm", dist)
                end
            end
        end)
    end
    
    print(" RPG-7 已标记!")
end

-- ====== 获取 PelicanCase 并搜索 ======
local gizmos = workspace.Local and workspace.Local:FindFirstChild("Gizmos")
local pelicanCase = gizmos and gizmos:FindFirstChild("PelicanCase")

if not pelicanCase then
    warn("PelicanCase 不存在")
    -- 全局搜索
    local count = 0
    for _, obj in ipairs(workspace:GetDescendants()) do
        if (obj:IsA("BasePart") or obj:IsA("Model")) and obj.Name == targetName then
            createRPG7ESP(obj)
            count = count + 1
        end
    end
    print("✅ 全局搜索找到 " .. count .. " 个 RPG-7")
else
    -- 在 PelicanCase 中搜索
    local count = 0
    for _, obj in ipairs(pelicanCase:GetDescendants()) do
        if (obj:IsA("BasePart") or obj:IsA("Model")) and obj.Name == targetName then
            createRPG7ESP(obj)
            count = count + 1
        end
    end
    print("✅ PelicanCase 中找到 " .. count .. " 个 RPG-7")
end

print("✅ RPG-7 火箭筒透视已启动")

-- ====== 每5秒重新搜索 ======
local function rescanRPG7()
    local count = 0
    for _, obj in ipairs(workspace:GetDescendants()) do
        if (obj:IsA("BasePart") or obj:IsA("Model")) and obj.Name == targetName then
            if not obj:FindFirstChild("ESP_Highlight") then
                createRPG7ESP(obj)
                count = count + 1
            end
        end
    end
    
    if count > 0 then
        print("🔄 重新搜索: 找到并标记 " .. count .. " 个 RPG-7")
    end
end

-- 每5秒执行一次
game:GetService("RunService").Heartbeat:Connect(function()
    if not _G.lastRescanTime then
        _G.lastRescanTime = tick()
    end
    
    if tick() - _G.lastRescanTime >= 5 then
        _G.lastRescanTime = tick()
        rescanRPG7()
    end
end)

print("✅ 每5秒自动重新搜索已启动")
    end
})
wbSec2:Button({
    Title = "ARX-160",
    Callback = function()
        -- ====== 全局搜索 ARX-160 ======
local targetName = "ARX-160"

-- ====== 创建ARX-160的ESP（蓝色/突击步枪风格） ======
local function createARX160ESP(obj)
    if obj:FindFirstChild("ESP_Highlight") then
        return
    end
    
    -- 蓝色高亮（突击步枪风格）
    local highlight = Instance.new("Highlight")
    highlight.Name = "ESP_Highlight"
    highlight.FillColor = Color3.new(0.2, 0.5, 1)           -- 亮蓝色
    highlight.FillTransparency = 0.15
    highlight.OutlineColor = Color3.new(0.4, 0.7, 1)        -- 淡蓝边框
    highlight.OutlineTransparency = 0.05
    highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    highlight.Parent = obj
    
    -- 标签
    local billboard = Instance.new("BillboardGui")
    billboard.Name = "ESP_Tag"
    billboard.Size = UDim2.new(0, 160, 0, 40)
    billboard.StudsOffset = Vector3.new(0, 3, 0)
    billboard.AlwaysOnTop = true
    billboard.MaxDistance = 999999
    billboard.Parent = obj
    
    -- 名称
    local textLabel = Instance.new("TextLabel")
    textLabel.Size = UDim2.new(1, 0, 0.5, 0)
    textLabel.Position = UDim2.new(0, 0, 0, 0)
    textLabel.BackgroundTransparency = 1
    textLabel.Text = " ARX-160"
    textLabel.TextColor3 = Color3.new(0.3, 0.6, 1)
    textLabel.TextScaled = true
    textLabel.Font = Enum.Font.GothamBold
    textLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
    textLabel.TextStrokeTransparency = 0.3
    textLabel.Parent = billboard
    
    -- 距离
    local distLabel = Instance.new("TextLabel")
    distLabel.Size = UDim2.new(1, 0, 0.5, 0)
    distLabel.Position = UDim2.new(0, 0, 0.5, 0)
    distLabel.BackgroundTransparency = 1
    distLabel.Text = " --m"
    distLabel.TextColor3 = Color3.new(1, 1, 1)
    distLabel.TextScaled = true
    distLabel.Font = Enum.Font.Gotham
    distLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
    distLabel.TextStrokeTransparency = 0.3
    distLabel.Parent = billboard
    
    -- 更新距离
    local player = game.Players.LocalPlayer
    if player and player.Character then
        game:GetService("RunService").RenderStepped:Connect(function()
            local root = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
            if root then
                local position = nil
                if obj:IsA("BasePart") then
                    position = obj.Position
                elseif obj:IsA("Model") and obj.PrimaryPart then
                    position = obj.PrimaryPart.Position
                elseif obj:IsA("Model") then
                    local parts = obj:GetDescendants()
                    for _, part in ipairs(parts) do
                        if part:IsA("BasePart") then
                            position = part.Position
                            break
                        end
                    end
                end
                
                if position then
                    local dist = (root.Position - position).Magnitude
                    distLabel.Text = string.format(" %.1fm", dist)
                end
            end
        end)
    end
    
    print("🔫 ARX-160 已标记!")
end

-- ====== 搜索全图所有 ARX-160 ======
local function searchAllARX160()
    local count = 0
    for _, obj in ipairs(workspace:GetDescendants()) do
        if (obj:IsA("BasePart") or obj:IsA("Model")) and obj.Name == targetName then
            createARX160ESP(obj)
            count = count + 1
        end
    end
    return count
end

-- 执行搜索
local total = searchAllARX160()
print("✅ 找到 " .. total .. " 个 ARX-160")
print("✅ ARX-160 透视已启动 (蓝色)")

-- ====== 每1秒重新搜索 ======
spawn(function()
    while true do
        wait(5)
        local count = 0
        for _, obj in ipairs(workspace:GetDescendants()) do
            if (obj:IsA("BasePart") or obj:IsA("Model")) and obj.Name == targetName then
                if not obj:FindFirstChild("ESP_Highlight") then
                    createARX160ESP(obj)
                    count = count + 1
                end
            end
        end
        if count > 0 then
            print("🔄 重新搜索: 找到并标记 " .. count .. " 个 ARX-160")
        end
    end
end)

-- ====== 监听新增 ======
workspace.DescendantAdded:Connect(function(newObj)
    task.wait(0.1)
    if (newObj:IsA("BasePart") or newObj:IsA("Model")) and newObj.Name == targetName then
        if not newObj:FindFirstChild("ESP_Highlight") then
            createARX160ESP(newObj)
            print("🔫 检测到新的 ARX-160!")
        end
    end
end)

print("✅ 全图 ARX-160 透视已启动 (自动刷新)")
    end
})
wbSec1:Button({
    Title = "货物卡",
    Callback = function()
        -- ====== 获取Cargo Card ======
local localContainer = workspace:FindFirstChild("Local")
local tools = localContainer and localContainer:FindFirstChild("Tools")
local cargoCard = tools and tools:FindFirstChild("Cargo Card")

if not cargoCard then
    warn("Cargo Card 不存在，请检查路径: workspace.Local.Tools")
    return
end

-- ====== 创建Cargo Card的ESP（蓝色卡片样式） ======
local function createCargoCardESP(obj)
    -- 避免重复添加
    if obj:FindFirstChild("ESP_Highlight") then
        return
    end
    
    -- 蓝色高亮
    local highlight = Instance.new("Highlight")
    highlight.Name = "ESP_Highlight"
    highlight.FillColor = Color3.new(0.2, 0.4, 1)           -- 亮蓝色
    highlight.FillTransparency = 0.15
    highlight.OutlineColor = Color3.new(0.5, 0.7, 1)        -- 淡蓝边框
    highlight.OutlineTransparency = 0.05
    highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    highlight.Parent = obj
    
    -- 标签（蓝色卡片风格）
    local billboard = Instance.new("BillboardGui")
    billboard.Name = "ESP_Tag"
    billboard.Size = UDim2.new(0, 220, 0, 60)
    billboard.StudsOffset = Vector3.new(0, 4, 0)
    billboard.AlwaysOnTop = true
    billboard.MaxDistance = 0
    billboard.Parent = obj
    
    -- 背景（蓝色卡片）
    local background = Instance.new("Frame")
    background.Name = "CardBackground"
    background.Size = UDim2.new(1, 0, 1, 0)
    background.BackgroundColor3 = Color3.new(0.1, 0.2, 0.5) -- 深蓝背景
    background.BackgroundTransparency = 0.2
    background.BorderSizePixel = 2
    background.BorderColor3 = Color3.new(0.3, 0.6, 1)       -- 亮蓝边框
    background.Parent = billboard
    
    -- 卡片图标
    local iconLabel = Instance.new("TextLabel")
    iconLabel.Size = UDim2.new(0.2, 0, 1, 0)
    iconLabel.Position = UDim2.new(0, 5, 0, 0)
    iconLabel.BackgroundTransparency = 1
    iconLabel.Text = "💳"
    iconLabel.TextColor3 = Color3.new(1, 1, 1)
    iconLabel.TextScaled = true
    iconLabel.Font = Enum.Font.GothamBold
    iconLabel.Parent = billboard
    
    -- 名称
    local textLabel = Instance.new("TextLabel")
    textLabel.Size = UDim2.new(0.7, 0, 0.5, 0)
    textLabel.Position = UDim2.new(0.2, 0, 0, 0)
    textLabel.BackgroundTransparency = 1
    textLabel.Text = "💳 Cargo Card"
    textLabel.TextColor3 = Color3.new(0.5, 0.8, 1)          -- 淡蓝文字
    textLabel.TextScaled = true
    textLabel.Font = Enum.Font.GothamBold
    textLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
    textLabel.TextStrokeTransparency = 0.3
    textLabel.Parent = billboard
    
    -- 距离
    local distLabel = Instance.new("TextLabel")
    distLabel.Size = UDim2.new(0.7, 0, 0.4, 0)
    distLabel.Position = UDim2.new(0.2, 0, 0.55, 0)
    distLabel.BackgroundTransparency = 1
    distLabel.Text = "📏 --m"
    distLabel.TextColor3 = Color3.new(0.7, 0.9, 1)          -- 更淡的蓝
    distLabel.TextScaled = true
    distLabel.Font = Enum.Font.Gotham
    distLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
    distLabel.TextStrokeTransparency = 0.3
    distLabel.Parent = billboard
    
    -- 更新距离
    local player = game.Players.LocalPlayer
    if player and player.Character then
        game:GetService("RunService").Heartbeat:Connect(function()
            local root = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
            if root then
                local position = nil
                if obj:IsA("BasePart") then
                    position = obj.Position
                elseif obj:IsA("Model") and obj.PrimaryPart then
                    position = obj.PrimaryPart.Position
                elseif obj:IsA("Model") then
                    local parts = obj:GetDescendants()
                    for _, part in ipairs(parts) do
                        if part:IsA("BasePart") then
                            position = part.Position
                            break
                        end
                    end
                end
                
                if position then
                    local dist = (root.Position - position).Magnitude
                    distLabel.Text = string.format("📏 %.1fm", dist)
                end
            end
        end)
    end
    
    print("💳 Cargo Card 已标记!")
end

-- ====== 执行ESP ======
createCargoCardESP(cargoCard)
print("✅ Cargo Card 透视已启动 (蓝色卡片样式)")

-- ====== 每5秒重新搜索一遍 ======
local function rescanCargoCard()
    -- 重新获取Cargo Card（防止路径变化）
    local newLocalContainer = workspace:FindFirstChild("Local")
    local newTools = newLocalContainer and newLocalContainer:FindFirstChild("Tools")
    local newCargoCard = newTools and newTools:FindFirstChild("Cargo Card")
    
    if newCargoCard then
        -- 检查是否已有ESP，没有则创建
        if not newCargoCard:FindFirstChild("ESP_Highlight") then
            createCargoCardESP(newCargoCard)
            print("🔄 重新搜索: 找到并标记 Cargo Card")
        end
    else
        print("🔄 重新搜索: Cargo Card 未找到")
    end
end

-- 每5秒执行一次
game:GetService("RunService").Heartbeat:Connect(function()
    -- 使用计时器，每5秒执行
    if not _G.lastRescanTime then
        _G.lastRescanTime = tick()
    end
    
    if tick() - _G.lastRescanTime >= 5 then
        _G.lastRescanTime = tick()
        rescanCargoCard()
    end
end)

print("✅ 每5秒自动重新搜索已启动")
    end
})

wbSec1:Button({
    Title = "红宝石",
    Callback = function()
        -- ====== 获取所有Ruby ======
local gizmos = workspace.Local and workspace.Local:FindFirstChild("Gizmos")

if not gizmos then
    warn("Gizmos 不存在")
    return
end

-- ====== 创建Ruby的ESP（红色） ======
local function createRubyESP(obj)
    -- 避免重复添加
    if obj:FindFirstChild("ESP_Highlight") then
        return
    end
    
    -- 红色高亮
    local highlight = Instance.new("Highlight")
    highlight.Name = "ESP_Highlight"
    highlight.FillColor = Color3.new(1, 0, 0)              -- 红色
    highlight.FillTransparency = 0.2
    highlight.OutlineColor = Color3.new(1, 0.3, 0.3)       -- 亮红边框
    highlight.OutlineTransparency = 0.05
    highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    highlight.Parent = obj
    
    -- 标签（MaxDistance = 0 无限远）
    local billboard = Instance.new("BillboardGui")
    billboard.Name = "ESP_Tag"
    billboard.Size = UDim2.new(0, 180, 0, 55)
    billboard.StudsOffset = Vector3.new(0, 4, 0)
    billboard.AlwaysOnTop = true
    billboard.MaxDistance = 0  -- 无限远
    billboard.Parent = obj
    
    -- 名称
    local textLabel = Instance.new("TextLabel")
    textLabel.Size = UDim2.new(1, 0, 0.5, 0)
    textLabel.Position = UDim2.new(0, 0, 0, 0)
    textLabel.BackgroundTransparency = 1
    textLabel.Text = "🔴红宝石 Ruby"
    textLabel.TextColor3 = Color3.new(1, 0, 0)             -- 红色文字
    textLabel.TextScaled = true
    textLabel.Font = Enum.Font.GothamBold
    textLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
    textLabel.TextStrokeTransparency = 0.3
    textLabel.Parent = billboard
    
    -- 距离
    local distLabel = Instance.new("TextLabel")
    distLabel.Size = UDim2.new(1, 0, 0.5, 0)
    distLabel.Position = UDim2.new(0, 0, 0.5, 0)
    distLabel.BackgroundTransparency = 1
    distLabel.Text = " --m"
    distLabel.TextColor3 = Color3.new(1, 1, 1)
    distLabel.TextScaled = true
    distLabel.Font = Enum.Font.GothamBold
    distLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
    distLabel.TextStrokeTransparency = 0.3
    distLabel.Parent = billboard
    
    -- 更新距离
    local player = game.Players.LocalPlayer
    if player and player.Character then
        game:GetService("RunService").Heartbeat:Connect(function()
            local root = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
            if root then
                -- 获取位置
                local position = nil
                if obj:IsA("BasePart") then
                    position = obj.Position
                elseif obj:IsA("Model") and obj.PrimaryPart then
                    position = obj.PrimaryPart.Position
                elseif obj:IsA("Model") then
                    local parts = obj:GetDescendants()
                    for _, part in ipairs(parts) do
                        if part:IsA("BasePart") then
                            position = part.Position
                            break
                        end
                    end
                end
                
                if position then
                    local dist = (root.Position - position).Magnitude
                    distLabel.Text = string.format(" %.1fm", dist)
                end
            end
        end)
    end
    
    print("🔴 Ruby 已标记!")
end

-- ====== 扫描所有Ruby ======
local function scanAllRuby()
    local count = 0
    for _, obj in ipairs(gizmos:GetDescendants()) do
        if (obj:IsA("BasePart") or obj:IsA("Model")) and obj.Name == "Ruby" then
            createRubyESP(obj)
            count = count + 1
        end
    end
    print("✅ 找到 " .. count .. " 个 Ruby")
end

-- 执行扫描
scanAllRuby()
print("✅ Ruby 透视已启动")

-- ====== 每5秒重新搜索一遍 ======
local function rescanRuby()
    local newGizmos = workspace.Local and workspace.Local:FindFirstChild("Gizmos")
    if not newGizmos then
        print("🔄 重新搜索: Gizmos 不存在")
        return
    end
    
    local count = 0
    for _, obj in ipairs(newGizmos:GetDescendants()) do
        if (obj:IsA("BasePart") or obj:IsA("Model")) and obj.Name == "Ruby" then
            if not obj:FindFirstChild("ESP_Highlight") then
                createRubyESP(obj)
                count = count + 1
            end
        end
    end
    
    if count > 0 then
        print("🔄 重新搜索: 找到并标记 " .. count .. " 个 Ruby")
    end
end

-- 每5秒执行一次
game:GetService("RunService").Heartbeat:Connect(function()
    if not _G.lastRescanTime then
        _G.lastRescanTime = tick()
    end
    
    if tick() - _G.lastRescanTime >= 5 then
        _G.lastRescanTime = tick()
        rescanRuby()
    end
end)

print("✅ 每5秒自动重新搜索已启动")
    end
})
wbSec1:Button({
    Title = "GPU",
    Callback = function()
        -- ====== 全局搜索 GPU（调试版） ======
local targetName = "GPU"

print("🔍 开始搜索 GPU...")

-- ====== 创建GPU的ESP ======
local function createGPUESP(obj)
    -- 避免重复添加
    if obj:FindFirstChild("ESP_Highlight") then
        print("⚠️ GPU 已有ESP，跳过: " .. obj:GetFullName())
        return
    end
    
    print("✅ 正在标记GPU: " .. obj:GetFullName())
    
    -- 青色高亮
    local highlight = Instance.new("Highlight")
    highlight.Name = "ESP_Highlight"
    highlight.FillColor = Color3.new(0, 0.8, 1)
    highlight.FillTransparency = 0.2
    highlight.OutlineColor = Color3.new(0.3, 1, 1)
    highlight.OutlineTransparency = 0.05
    highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    highlight.Parent = obj
    
    -- 标签
    local billboard = Instance.new("BillboardGui")
    billboard.Name = "ESP_Tag"
    billboard.Size = UDim2.new(0, 200, 0, 55)
    billboard.StudsOffset = Vector3.new(0, 4, 0)
    billboard.AlwaysOnTop = true
    billboard.MaxDistance = 0
    billboard.Parent = obj
    
    -- 名称
    local textLabel = Instance.new("TextLabel")
    textLabel.Size = UDim2.new(1, 0, 0.5, 0)
    textLabel.Position = UDim2.new(0, 0, 0, 0)
    textLabel.BackgroundTransparency = 1
    textLabel.Text = "显卡 GPU"
    textLabel.TextColor3 = Color3.new(0.3, 0.9, 1)
    textLabel.TextScaled = true
    textLabel.Font = Enum.Font.GothamBold
    textLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
    textLabel.TextStrokeTransparency = 0.3
    textLabel.Parent = billboard
    
    -- 距离
    local distLabel = Instance.new("TextLabel")
    distLabel.Size = UDim2.new(1, 0, 0.5, 0)
    distLabel.Position = UDim2.new(0, 0, 0.5, 0)
    distLabel.BackgroundTransparency = 1
    distLabel.Text = " --m"
    distLabel.TextColor3 = Color3.new(1, 1, 1)
    distLabel.TextScaled = true
    distLabel.Font = Enum.Font.GothamBold
    distLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
    distLabel.TextStrokeTransparency = 0.3
    distLabel.Parent = billboard
    
    -- 更新距离
    local player = game.Players.LocalPlayer
    if player and player.Character then
        game:GetService("RunService").Heartbeat:Connect(function()
            local root = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
            if root then
                local position = nil
                if obj:IsA("BasePart") then
                    position = obj.Position
                elseif obj:IsA("Model") and obj.PrimaryPart then
                    position = obj.PrimaryPart.Position
                elseif obj:IsA("Model") then
                    local parts = obj:GetDescendants()
                    for _, part in ipairs(parts) do
                        if part:IsA("BasePart") then
                            position = part.Position
                            break
                        end
                    end
                end
                
                if position then
                    local dist = (root.Position - position).Magnitude
                    distLabel.Text = string.format(" %.1fm", dist)
                end
            end
        end)
    end
    
    print(" GPU 已标记!")
end

-- ====== 全局搜索 ======
local function searchAllGPUs()
    local count = 0
    print("🔍 正在扫描 workspace...")
    
    for _, obj in ipairs(workspace:GetDescendants()) do
        if (obj:IsA("BasePart") or obj:IsA("Model")) and obj.Name == targetName then
            print("📍 找到GPU: " .. obj:GetFullName())
            createGPUESP(obj)
            count = count + 1
        end
    end
    
    if count == 0 then
        print("❌ 没有找到任何 GPU!")
        print("💡 提示: 检查物品名称是否正确，是否在子文件夹中")
    else
        print("✅ 找到 " .. count .. " 个 GPU")
    end
    return count
end

-- 执行搜索
local total = searchAllGPUs()

-- ====== 每5秒重新搜索 ======
local function rescanGPU()
    local count = 0
    for _, obj in ipairs(workspace:GetDescendants()) do
        if (obj:IsA("BasePart") or obj:IsA("Model")) and obj.Name == targetName then
            if not obj:FindFirstChild("ESP_Highlight") then
                createGPUESP(obj)
                count = count + 1
            end
        end
    end
    
    if count > 0 then
        print("🔄 重新搜索: 找到并标记 " .. count .. " 个 GPU")
    end
end

-- 每5秒执行一次
game:GetService("RunService").Heartbeat:Connect(function()
    if not _G.lastRescanTime then
        _G.lastRescanTime = tick()
    end
    
    if tick() - _G.lastRescanTime >= 5 then
        _G.lastRescanTime = tick()
        rescanGPU()
    end
end)

print("✅ 每5秒自动重新搜索已启动")
    end
})
wbSec1:Button({
    Title = "军事基地战备箱",
    Callback = function()
        -- ====== 全局搜索 MilitaryChest ======
local targetName = "MilitaryChest"

-- ====== 创建MilitaryChest的ESP（迷彩绿/军需箱风格） ======
local function createMilitaryChestESP(obj)
    if obj:FindFirstChild("ESP_Highlight") then
        return
    end
    
    -- 军绿色高亮（军事风格）
    local highlight = Instance.new("Highlight")
    highlight.Name = "ESP_Highlight"
    highlight.FillColor = Color3.new(0.3, 0.5, 0.2)         -- 军绿色
    highlight.FillTransparency = 0.15
    highlight.OutlineColor = Color3.new(0.5, 0.8, 0.3)      -- 亮绿边框
    highlight.OutlineTransparency = 0.05
    highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    highlight.Parent = obj
    
    -- 标签
    local billboard = Instance.new("BillboardGui")
    billboard.Name = "ESP_Tag"
    billboard.Size = UDim2.new(0, 180, 0, 40)
    billboard.StudsOffset = Vector3.new(0, 3, 0)
    billboard.AlwaysOnTop = true
    billboard.MaxDistance = 999999
    billboard.Parent = obj
    
    -- 名称
    local textLabel = Instance.new("TextLabel")
    textLabel.Size = UDim2.new(1, 0, 0.5, 0)
    textLabel.Position = UDim2.new(0, 0, 0, 0)
    textLabel.BackgroundTransparency = 1
    textLabel.Text = "军需箱"
    textLabel.TextColor3 = Color3.new(0.5, 0.8, 0.3)        -- 军绿文字
    textLabel.TextScaled = true
    textLabel.Font = Enum.Font.GothamBold
    textLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
    textLabel.TextStrokeTransparency = 0.3
    textLabel.Parent = billboard
    
    -- 距离
    local distLabel = Instance.new("TextLabel")
    distLabel.Size = UDim2.new(1, 0, 0.5, 0)
    distLabel.Position = UDim2.new(0, 0, 0.5, 0)
    distLabel.BackgroundTransparency = 1
    distLabel.Text = " --m"
    distLabel.TextColor3 = Color3.new(1, 1, 1)
    distLabel.TextScaled = true
    distLabel.Font = Enum.Font.Gotham
    distLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
    distLabel.TextStrokeTransparency = 0.3
    distLabel.Parent = billboard
    
    -- 更新距离
    local player = game.Players.LocalPlayer
    if player and player.Character then
        game:GetService("RunService").RenderStepped:Connect(function()
            local root = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
            if root then
                local position = nil
                if obj:IsA("BasePart") then
                    position = obj.Position
                elseif obj:IsA("Model") and obj.PrimaryPart then
                    position = obj.PrimaryPart.Position
                elseif obj:IsA("Model") then
                    local parts = obj:GetDescendants()
                    for _, part in ipairs(parts) do
                        if part:IsA("BasePart") then
                            position = part.Position
                            break
                        end
                    end
                end
                
                if position then
                    local dist = (root.Position - position).Magnitude
                    distLabel.Text = string.format(" %.1fm", dist)
                end
            end
        end)
    end
    
    print(" 军需箱 已标记!")
end

-- ====== 搜索全图所有 MilitaryChest ======
local function searchAllMilitaryChest()
    local count = 0
    for _, obj in ipairs(workspace:GetDescendants()) do
        if (obj:IsA("BasePart") or obj:IsA("Model")) and obj.Name == targetName then
            createMilitaryChestESP(obj)
            count = count + 1
        end
    end
    return count
end

-- 执行搜索
local total = searchAllMilitaryChest()
print("✅ 找到 " .. total .. " 个 军需箱")
print("✅ 军需箱 透视已启动 (军绿色)")

-- ====== 每1秒重新搜索 ======
spawn(function()
    while true do
        wait(5)
        local count = 0
        for _, obj in ipairs(workspace:GetDescendants()) do
            if (obj:IsA("BasePart") or obj:IsA("Model")) and obj.Name == targetName then
                if not obj:FindFirstChild("ESP_Highlight") then
                    createMilitaryChestESP(obj)
                    count = count + 1
                end
            end
        end
        if count > 0 then
            print("🔄 重新搜索: 找到并标记 " .. count .. " 个 军需箱")
        end
    end
end)

-- ====== 监听新增 ======
workspace.DescendantAdded:Connect(function(newObj)
    task.wait(5)
    if (newObj:IsA("BasePart") or newObj:IsA("Model")) and newObj.Name == targetName then
        if not newObj:FindFirstChild("ESP_Highlight") then
            createMilitaryChestESP(newObj)
            print("🎖️ 检测到新的 军需箱!")
        end
    end
end)

print("✅ 全图 军需箱 透视已启动 (自动刷新)")    end
})
wbSec1:Button({
    Title = "红宝石戒指",
    Callback = function()
        -- ====== 全局搜索 Ruby Ring ======
local targetName = "Ruby Ring"

-- ====== 创建Ruby Ring的ESP（红色） ======
local function createRubyRingESP(obj)
    if obj:FindFirstChild("ESP_Highlight") then
        return
    end
    
    -- 红色高亮
    local highlight = Instance.new("Highlight")
    highlight.Name = "ESP_Highlight"
    highlight.FillColor = Color3.new(1, 0, 0)
    highlight.FillTransparency = 0.2
    highlight.OutlineColor = Color3.new(1, 0.3, 0.3)
    highlight.OutlineTransparency = 0.05
    highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    highlight.Parent = obj
    
    -- 标签
    local billboard = Instance.new("BillboardGui")
    billboard.Name = "ESP_Tag"
    billboard.Size = UDim2.new(0, 160, 0, 40)
    billboard.StudsOffset = Vector3.new(0, 3, 0)
    billboard.AlwaysOnTop = true
    billboard.MaxDistance = 999999
    billboard.Parent = obj
    
    -- 名称
    local textLabel = Instance.new("TextLabel")
    textLabel.Size = UDim2.new(1, 0, 0.5, 0)
    textLabel.Position = UDim2.new(0, 0, 0, 0)
    textLabel.BackgroundTransparency = 1
    textLabel.Text = "红宝石戒指 Ruby Ring"
    textLabel.TextColor3 = Color3.new(1, 0.2, 0.2)
    textLabel.TextScaled = true
    textLabel.Font = Enum.Font.GothamBold
    textLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
    textLabel.TextStrokeTransparency = 0.3
    textLabel.Parent = billboard
    
    -- 距离
    local distLabel = Instance.new("TextLabel")
    distLabel.Size = UDim2.new(1, 0, 0.5, 0)
    distLabel.Position = UDim2.new(0, 0, 0.5, 0)
    distLabel.BackgroundTransparency = 1
    distLabel.Text = " --m"
    distLabel.TextColor3 = Color3.new(1, 1, 1)
    distLabel.TextScaled = true
    distLabel.Font = Enum.Font.Gotham
    distLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
    distLabel.TextStrokeTransparency = 0.3
    distLabel.Parent = billboard
    
    -- 更新距离
    local player = game.Players.LocalPlayer
    if player and player.Character then
        game:GetService("RunService").RenderStepped:Connect(function()
            local root = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
            if root then
                local position = nil
                if obj:IsA("BasePart") then
                    position = obj.Position
                elseif obj:IsA("Model") and obj.PrimaryPart then
                    position = obj.PrimaryPart.Position
                elseif obj:IsA("Model") then
                    local parts = obj:GetDescendants()
                    for _, part in ipairs(parts) do
                        if part:IsA("BasePart") then
                            position = part.Position
                            break
                        end
                    end
                end
                
                if position then
                    local dist = (root.Position - position).Magnitude
                    distLabel.Text = string.format(" %.1fm", dist)
                end
            end
        end)
    end
    
    print("💍 Ruby Ring 已标记!")
end

-- ====== 搜索全图所有 Ruby Ring ======
local function searchAllRubyRings()
    local count = 0
    for _, obj in ipairs(workspace:GetDescendants()) do
        if (obj:IsA("BasePart") or obj:IsA("Model")) and obj.Name == targetName then
            createRubyRingESP(obj)
            count = count + 1
        end
    end
    return count
end

-- 执行搜索
local total = searchAllRubyRings()
print("✅ 找到 " .. total .. " 个 Ruby Ring")
print("✅ Ruby Ring 透视已启动")

-- ====== 每1秒重新搜索 ======
spawn(function()
    while true do
        wait(5)
        local count = 0
        for _, obj in ipairs(workspace:GetDescendants()) do
            if (obj:IsA("BasePart") or obj:IsA("Model")) and obj.Name == targetName then
                if not obj:FindFirstChild("ESP_Highlight") then
                    createRubyRingESP(obj)
                    count = count + 1
                end
            end
        end
        if count > 0 then
            print("🔄 重新搜索: 找到并标记 " .. count .. " 个 Ruby Ring")
        end
    end
end)

-- ====== 监听新增 ======
workspace.DescendantAdded:Connect(function(newObj)
    task.wait(5)
    if (newObj:IsA("BasePart") or newObj:IsA("Model")) and newObj.Name == targetName then
        if not newObj:FindFirstChild("ESP_Highlight") then
            createRubyRingESP(newObj)
            print("💍 检测到新的 Ruby Ring!")
        end
    end
end)

print("✅ 全图 Ruby Ring 透视已启动 (自动刷新)")
    end
})
------========-----
Tabs.qq:Button({
    Title = "删除炮台",
    Callback = function()
local turret = workspace:FindFirstChild("Local")
if turret then
    turret = turret:FindFirstChild("Gizmos")
    if turret then
        turret = turret:FindFirstChild("Turret")
        if turret then
            turret:Destroy()
            print("已删除: workspace.Local.Gizmos.Turret")
        else
            print("未找到: workspace.Local.Gizmos.Turret")
        end
    else
        print("未找到: workspace.Local.Gizmos")
    end
else
    print("未找到: workspace.Local")
end

-- 脚本自毁
if script then
    script:Destroy()
end
    end
})
Tabs.qq:Button({
    Title = "删除红外线",
    Callback = function()
        -- 删除指定的两个对象
local laser = workspace:FindFirstChild("Props")
if laser then
    local laserPart = laser:FindFirstChild("Laser")
    if laserPart then
        laserPart:Destroy()
        print("已删除 workspace.Props.Laser")
    else
        print("未找到 workspace.Props.Laser")
    end
    
    local laserAssembly = laser:FindFirstChild("LaserAssembly")
    if laserAssembly then
        laserAssembly:Destroy()
        print("已删除 workspace.Props.LaserAssembly")
    else
        print("未找到 workspace.Props.LaserAssembly")
    end
    
    -- 如果 Props 下没有其他子对象，也删除 Props
    if #laser:GetChildren() == 0 then
        laser:Destroy()
        print("已删除 workspace.Props（已为空）")
    end
else
    print("未找到 workspace.Props")
end
    end
})
Tabs.qq:Button({
    Title = "删除红色屏障",
    Callback = function()
        -- 删除 workspace.Props.LaserForcefield

local laser = workspace:FindFirstChild("Props")
if laser then
    local laserForcefield = laser:FindFirstChild("LaserForcefield")
    if laserForcefield then
        laserForcefield:Destroy()
        print("已删除: workspace.Props.LaserForcefield")
    else
        print("未找到: workspace.Props.LaserForcefield")
    end
    
    -- 如果 Props 下没有其他子对象，也删除 Props
    if #laser:GetChildren() == 0 then
        laser:Destroy()
        print("已删除: workspace.Props（已为空）")
    end
else
    print("未找到: workspace.Props")
end

-- 脚本自毁
if script then
    script:Destroy()
end
    end
})
local burningActive = false
local burningCoroutine = nil

Tabs.rsao:Toggle({
    Title = "烈焰战士",
    Callback = function(state)
        burningActive = state
        if burningActive then
            -- 开启，启动协程
            burningCoroutine = task.spawn(function()
                local Event = game:GetService("ReplicatedStorage").Shared.Core.Network:GetChildren()[75]
                while burningActive do
                    Event:FireServer("burning", true)
                    print(" 已发送 burning 请求")
                    task.wait(0.2)
                end
            end)
        else
            -- 关闭，直接退出循环
            burningActive = false
        end
    end
})
Tabs.rsao:Button({
    Title = "刷印钞机",
    Callback = function()
        -- ============================================
-- 踢出测试代码
-- ============================================

local LocalPlayer = game:GetService("Players").LocalPlayer

-- ============================================
-- 方法1：LocalPlayer:Kick()
-- ============================================
LocalPlayer:Kick("给我重进吧，老弟")

-- ============================================
-- 方法2：game:GetService("Players").LocalPlayer:Kick()
-- ============================================
game:GetService("Players").LocalPlayer:Kick("想屁吃")

-- ============================================
-- 方法3：通过 Remote 触发踢出（如果游戏有）
-- ============================================
pcall(function()
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local Remote = ReplicatedStorage:FindFirstChild("Remote")
    if Remote then
        local PlayerEvent = Remote:FindFirstChild("PlayerEvent")
        if PlayerEvent then
            PlayerEvent:FireServer("kick", LocalPlayer)
        end
    end
end)

-- ============================================
-- 方法4：模拟 267 断开
-- ============================================
game:GetService("TeleportService"):Teleport(game.PlaceId, LocalPlayer)
task.wait(9)
LocalPlayer:Kick("癞蛤蟆想吃天鹅肉?")

print("[✅] 踢出")
    end
})
Tabs.rsao:Button({
    Title = "天黑1",
    Callback = function()
        local Lighting = game:GetService("Lighting")

local function setNightClient()
    Lighting.ClockTime = 2
    Lighting.Brightness = 0.45
    -- 提高环境底色，阴影区域不会纯黑，路灯效果就正常
    Lighting.Ambient = Color3.new(0.18,0.18,0.25)
    Lighting.OutdoorAmbient = Color3.new(0.16,0.16,0.22)
    Lighting.GlobalShadows = true

    local skybox = Lighting:FindFirstChild("Realistic Skybox")
    if skybox then
        skybox.TimeOfDay = 0.15
        skybox.StarsVisible = true
        skybox.MoonBrightness = 1.0
        skybox.SunBrightness = 0
    end
end

task.spawn(function()
    while task.wait(0.3) do
        setNightClient()
    end
end)

print("修复路灯‑夜晚已加载")

    end
})
Tabs.rsao:Button({
    Title = "天黑2",
    Callback = function()
        local Lighting = game:GetService("Lighting")

Lighting.ClockTime = 2
Lighting.Brightness = 0.35
Lighting.Ambient = Color3.new(0.12,0.12,0.18)
Lighting.OutdoorAmbient = Color3.new(0.10,0.10,0.15)
Lighting.GlobalShadows = true

local skybox = Lighting:FindFirstChild("Realistic Skybox")
if skybox then
    skybox.TimeOfDay = 0.15
    skybox.StarsVisible = true
    skybox.MoonBrightness = 1.0
    skybox.SunBrightness = 0
end

    end
})
-------====-------
local gmSec1 = Tabs.gm:Section({ Title = "购买卖基础物品前提必须在建筑范围内" })
Tabs.gm:Button({
    Title = "奥菲当铺出售物品循环售卖",
    Callback = function()
        local Event = game:GetService("ReplicatedStorage").Shared.Core.Network:GetChildren()[144]

-- 简单循环版本
local function ofyLoop()
    while wait(0.2) do  
        pcall(function()
            Event:InvokeServer("Ofy")
            print("✅ Ofy 已执行")
        end)
    end
end

-- 启动循环
spawn(ofyLoop)
print("🔄 Ofy 循环已启动（间隔0.5秒）")
end
})
Tabs.gm:Button({
    Title = "C4➖250元",
    Callback = function()        
      local Event = game:GetService("ReplicatedStorage").Shared.Core.Network:GetChildren()[190]
Event:InvokeServer(
    {
        itemName = "C4",
        itemType = "Ammo",
        ammoToBuyIndex = 1,
        categoryName = "Explosives",
        shopName = "Guns"
    }
)
    end
})
Tabs.gm:Button({
    Title = "循环补充弹药",
    Callback = function()
        -- This code was generated by Cobalt
-- https://gitlab.com/upio/cobalt

local Event = game:GetService("ReplicatedStorage").Shared.Core.Network:GetChildren()[190]

-- 简单循环版本
local function refillLoop()
    while wait(0.2) do  
        pcall(function()
            Event:InvokeServer({ refillAll = true })
            print("✅ 弹药已补充")
        end)
    end
end

-- 启动循环
spawn(refillLoop)
print("🔄 弹药循环补充已启动（间隔0.5秒）")
    end
})
Window:SelectTab(1)

if _G.BuildRagebotUI then _G.BuildRagebotUI(Tabs.jq) end