-- ============================================
-- WindUI - 动态建筑生成器 (智能翻译 + 实体版)
-- ============================================
local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/ggsq1741-debug/cQ/refs/heads/main/main.lua"))()

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local Window = WindUI:CreateWindow({
    Title = "动态建筑生成器",
    Author = "WindUI",
    Icon = "solar:buildings-bold",
    Folder = "BuildingSpawner",
    Size = UDim2.fromOffset(450, 500),
    ToggleKey = Enum.KeyCode.RightControl,
    Transparent = true,
    Theme = "Dark",
    HideSearchBar = true,
    User = { Enabled = true },
})

local Tab = Window:Tab({ Title = "建造", Icon = "hammer" })

-- ================= 模糊翻译字典 =================
-- 规则：只要原名字里包含左边(key)的词，就会显示成右边的中文(cn)
local fuzzyMap = {
    -- 优先匹配长词条，避免被短词条拦截
    { key = "RoadsAndSidewalks", cn = "🛣️ 公路" },
    { key = "Auto Repair",       cn = "🔧 汽车修理厂" },
    { key = "Papas Pizzeria",    cn = "🍕 帕帕斯披萨店" },
    { key = "City Customs Shop", cn = "🏪 城市改装店" },
    { key = "Garage",            cn = "🅿️ 车库" },

    -- 基础翻译
    { key = "Bank",      cn = "🏦 银行" },
    { key = "Vault",     cn = "🔐 金库" },
    { key = "ATM",       cn = "🏧 自动取款机" },
    { key = "Jewel",     cn = "💎 珠宝店" },
    { key = "Gun",       cn = "🔫 枪架" },
    { key = "Crate",     cn = "📦 箱子" },
    { key = "Safe",      cn = "🛡️ 保险箱" },
    { key = "Door",      cn = "🚪 门" },
    { key = "Wall",      cn = "🧱 墙" },
    { key = "Car",       cn = "🚗 汽车" },
    { key = "Heli",      cn = "🚁 直升机" },
    { key = "Bunker",    cn = "🕳️ 地堡" },
    { key = "Tower",     cn = "🗼 塔楼" },
    { key = "House",     cn = "🏠 房屋" },
    { key = "Penthouse", cn = "🏠 顶层公寓" },
    { key = "Police",    cn = "🚓 警察局" },
    { key = "Ferris",    cn = "🎡 摩天轮" },
    { key = "Fuel",      cn = "⛽ 油罐车" },
    { key = "Laser",     cn = "🔴 红外线" },
    { key = "Turret",    cn = "🔫 炮台" },
    { key = "Chair",     cn = "🪑 椅子" },
    { key = "Table",     cn = "🪵 桌子" },
    { key = "Desk",      cn = "🖥️ 办公桌" },
    { key = "Chest",     cn = "📦 宝箱" },
    { key = "Military",  cn = "🎖️ 军需箱" },
    { key = "Gold",      cn = "🪙 金块" },
    { key = "Bitcoin",   cn = "🪙 比特币" },
    { key = "Ruby",      cn = "💎 红宝石" },
    { key = "Sapphire",  cn = "💎 蓝宝石" },
    { key = "Amethyst",  cn = "💍 紫水晶" },
    { key = "Cargo",     cn = "💳 货物卡" },
    { key = "C4",        cn = "💣 C4炸弹" },
    { key = "RPG",       cn = "🚀 RPG火箭筒" },
    { key = "AWM",       cn = "🔫 AWM狙击枪" },
    { key = "AK",        cn = "🔫 AK47步枪" },
    { key = "M4",        cn = "🔫 M4A1步枪" },
}

local function translateName(engName)
    if not engName then return "未知" end
    local lowerName = string.lower(engName)
    for _, pair in ipairs(fuzzyMap) do
        if string.find(lowerName, string.lower(pair.key), 1, true) then
            return pair.cn .. " (" .. engName .. ")"
        end
    end
    return engName
end
-- ============================================

local Locations = workspace:FindFirstChild("Map") and workspace.Map:FindFirstChild("Locations")
if not Locations then
    warn("找不到 workspace.Map.Locations")
    WindUI:Notify({ Title = "错误", Content = "找不到 Locations 文件夹", Duration = 5 })
    return
end

local itemFolder = Locations
local children = Locations:GetChildren()
if #children >= 2 and children[2]:IsA("Folder") then
    itemFolder = children[2]
end

local isSolid = false
local spawnOffset = 10
local autoRefreshEnabled = false
local showRawName = false

local rawItems = {}
local displayItems = {}
local selectedItemEN = nil
local dropdownInstance = nil

local function scanItems()
    local rawList = {}
    local function checkObject(obj)
        if (obj:IsA("Model") or obj:IsA("BasePart")) and obj.Name ~= "" then
            table.insert(rawList, obj.Name)
        end
    end
    
    for _, obj in ipairs(itemFolder:GetChildren()) do checkObject(obj) end
    if #rawList == 0 then
        for _, obj in ipairs(Locations:GetChildren()) do checkObject(obj) end
    end

    local seen = {}
    local uniqueRaw = {}
    for _, name in ipairs(rawList) do
        if not seen[name] then
            seen[name] = true
            table.insert(uniqueRaw, name)
        end
    end
    
    local finalDisplay = {}
    for _, engName in ipairs(uniqueRaw) do
        if showRawName then
            table.insert(finalDisplay, engName)
        else
            table.insert(finalDisplay, translateName(engName))
        end
    end
    
    return uniqueRaw, finalDisplay
end

local function spawnBuilding(engName)
    if not engName or engName == "" then return false end
    
    local sourceObj = nil
    for _, obj in ipairs(itemFolder:GetChildren()) do
        if obj.Name == engName then sourceObj = obj break end
    end
    if not sourceObj then
        for _, obj in ipairs(Locations:GetChildren()) do
            if obj.Name == engName then sourceObj = obj break end
        end
    end
    if not sourceObj then warn("找不到英文原名: " .. engName) return false end

    local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    local hrp = char:WaitForChild("HumanoidRootPart", 5)
    if not hrp then warn("找不到 HRP") return false end
    local myPos = hrp.Position

    local clone = sourceObj:Clone()
    clone.Name = "Spawned_" .. sourceObj.Name

    for _, d in ipairs(clone:GetDescendants()) do
        if d:IsA("BasePart") then
            d.Anchored = true
            d.CanCollide = isSolid
            d.CastShadow = false
        end
        if d:IsA("Script") or d:IsA("LocalScript") then
            d:Destroy()
        end
    end

    clone.Parent = workspace
    local targetCF = CFrame.new(myPos + Vector3.new(0, spawnOffset, 0))

    if clone:IsA("Model") then
        if clone.PrimaryPart then
            clone:PivotTo(targetCF)
        else
            local validParts = {}
            for _, p in ipairs(clone:GetDescendants()) do
                if p:IsA("BasePart") then table.insert(validParts, p) end
            end
            if #validParts > 0 then
                local sum = Vector3.zero
                for _, p in ipairs(validParts) do sum = sum + p.Position end
                local center = sum / #validParts
                local offset = targetCF.Position - center
                for _, p in ipairs(validParts) do p.CFrame = p.CFrame + offset end
            end
        end
    elseif clone:IsA("BasePart") then
        clone.CFrame = targetCF
    end

    return true
end

-- ================= UI 控件 =================
local rawList, cnList = scanItems()
rawItems = rawList
displayItems = cnList

dropdownInstance = Tab:Dropdown({
    Title = "选择要生成的物品",
    Desc = "共 " .. #cnList .. " 个物品 (智能翻译)",
    Values = cnList,
    Value = cnList[1] or "",
    Callback = function(v)
        local eng = v
        local bracket = string.find(v, "%s*%(")
        if bracket then
            eng = string.sub(v, 1, bracket - 1)
        end
        local realName = string.match(v, "%((.-)%)")
        if realName then eng = realName end
        
        for _, name in ipairs(rawItems) do
            if name == v or name == eng then
                eng = name
                break
            end
        end
        
        selectedItemEN = eng
        print("已选择: " .. tostring(selectedItemEN))
    end,
})

Tab:Toggle({
    Title = "生成实体 (不可穿透)",
    Value = false,
    Callback = function(v) isSolid = v end,
})

Tab:Slider({
    Title = "生成高度偏移",
    Value = { Min = 5, Max = 100, Default = 10 },
    Step = 1,
    Callback = function(v) spawnOffset = v end,
})

Tab:Toggle({
    Title = "显示英文原名",
    Desc = "关闭智能翻译，查看游戏原始名字",
    Value = false,
    Callback = function(v)
        showRawName = v
        local newRaw, newDisplay = scanItems()
        rawItems = newRaw
        displayItems = newDisplay
        if dropdownInstance and dropdownInstance.Refresh then
            pcall(function() dropdownInstance:Refresh(newDisplay) end)
        end
    end,
})

Tab:Button({
    Title = "🔨 生成到脚下",
    Callback = function()
        if not selectedItemEN then
            WindUI:Notify({ Title = "提示", Content = "请先下拉选择物品", Duration = 3 })
            return
        end
        local ok = spawnBuilding(selectedItemEN)
        if ok then
            WindUI:Notify({ 
                Title = "生成成功", 
                Content = "已生成: " .. (selectedItemEN), 
                Duration = 3 
            })
        end
    end,
})

Tab:Divider()

Tab:Toggle({
    Title = "🔄 自动刷新列表",
    Value = false,
    Callback = function(v)
        autoRefreshEnabled = v
    end,
})

task.spawn(function()
    while task.wait(3) do
        if autoRefreshEnabled then
            local newRaw, newDisplay = scanItems()
            
            local oldSet = {}
            for _, name in ipairs(displayItems) do oldSet[name] = true end
            
            local newItems = {}
            for _, name in ipairs(newDisplay) do
                if not oldSet[name] then
                    table.insert(newItems, name)
                end
            end
            
            if #newItems > 0 then
                rawItems = newRaw
                displayItems = newDisplay
                
                if dropdownInstance and dropdownInstance.Refresh then
                    pcall(function() dropdownInstance:Refresh(newDisplay) end)
                end
                
                WindUI:Notify({ 
                    Title = "发现新建筑", 
                    Content = "新增: " .. table.concat(newItems, ", "), 
                    Duration = 5 
                })
            end
        end
    end
end)

print("✅ 智能翻译生成器已启动")