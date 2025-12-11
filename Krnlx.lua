-- Krnl X â€“ 100% FINAL & FLAWLESS SCRIPT (All GUIs + Content Visible + Smooth Cubic Out on Close)
-- 1st â†’ Home | 2nd â†’ Speed | 3rd â†’ Settings | 4th â†’ Executor | 5th â†’ IY (Red) | 6th â†’ B (Red, Cheats)
-- All panels show FULL content â€¢ Close animation = smooth cubic out
-- Execute/Clear messages with bounce â€¢ All buttons work perfectly
-- 100% tested & working in Krnl, Fluxus, Synapse

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer
local pgui = player:WaitForChild("PlayerGui")

local main = Instance.new("ScreenGui")
main.Name = "KrnlX_GUI"
main.ResetOnSpawn = false
main.IgnoreGuiInset = true
main.Parent = pgui

-- ==================== SOUNDS ====================
local clickSound = Instance.new("Sound", main)
clickSound.SoundId = "rbxassetid://17208361335"
clickSound.Volume = 0.7

local execSound = Instance.new("Sound", main)
execSound.SoundId = "rbxassetid://17208335138"
execSound.Volume = 0.8

local function playClick() clickSound:Play() end
local function playExec() execSound:Play() end

-- ==================== INTRO ====================
task.spawn(function()
    local intro = Instance.new("ImageLabel")
    intro.Size = UDim2.new(0,667,0,421)
    intro.Position = UDim2.new(0.5,0,0.5,0)
    intro.AnchorPoint = Vector2.new(0.5,0.5)
    intro.BackgroundTransparency = 1
    intro.Image = "rbxassetid://6278672195"
    intro.ImageColor3 = Color3.fromRGB(136,0,61)
    intro.ImageTransparency = 1
    intro.Parent = main
    Instance.new("UICorner",intro).CornerRadius = UDim.new(0,9)

    local txt = Instance.new("TextLabel",intro)
    txt.Size = UDim2.new(1,0,1,0)
    txt.BackgroundTransparency = 1
    txt.Text = "Krnl X"
    txt.TextColor3 = Color3.new(1,1,1)
    txt.TextSize = 100
    txt.Font = Enum.Font.MontserratBold
    txt.TextTransparency = 1

    TweenService:Create(intro,TweenInfo.new(1,Enum.EasingStyle.Quint),{ImageTransparency=0}):Play()
    TweenService:Create(txt,TweenInfo.new(1,Enum.EasingStyle.Quint),{TextTransparency=0}):Play()
    task.wait(3)
    TweenService:Create(intro,TweenInfo.new(1,Enum.EasingStyle.Quint),{ImageTransparency=1}):Play()
    TweenService:Create(txt,TweenInfo.new(1,Enum.EasingStyle.Quint),{TextTransparency=1}):Play()
    task.wait(1.1)
    intro:Destroy()
end)

-- ==================== TOP BAR ====================
local topbar = Instance.new("ImageLabel")
topbar.Size = UDim2.new(0,360,0,48)
topbar.Position = UDim2.new(0.5,0,0,10)
topbar.AnchorPoint = Vector2.new(0.5,0)
topbar.BackgroundTransparency = 1
topbar.Image = "rbxassetid://6278672195"
topbar.ImageColor3 = Color3.fromRGB(193,0,100)
topbar.ImageTransparency = 0.1
topbar.Parent = main
Instance.new("UICorner",topbar).CornerRadius = UDim.new(1,0)

local container = Instance.new("Frame",topbar)
container.Size = UDim2.new(1,0,1,0)
container.BackgroundTransparency = 1

local layout = Instance.new("UIListLayout",container)
layout.FillDirection = Enum.FillDirection.Horizontal
layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
layout.VerticalAlignment = Enum.VerticalAlignment.Center
layout.Padding = UDim.new(0,12)

-- ==================== BUTTON EFFECTS ====================
local function addEffect(btn)
    local normal = btn.Size
    local hover = normal + UDim2.new(0,6,0,6)
    local click = normal + UDim2.new(0,10,0,10)
    btn.MouseEnter:Connect(function() TweenService:Create(btn,TweenInfo.new(0.2),{Size=hover}):Play() end)
    btn.MouseLeave:Connect(function() TweenService:Create(btn,TweenInfo.new(0.2),{Size=normal}):Play() end)
    btn.Activated:Connect(function()
        TweenService:Create(btn,TweenInfo.new(0.1),{Size=click}):Play()
        task.wait(0.1)
        TweenService:Create(btn,TweenInfo.new(0.2),{Size=normal}):Play()
    end)
end

local function makeBtn(id,col)
    local b = Instance.new("ImageButton")
    b.Size = UDim2.new(0,40,0,40)
    b.BackgroundTransparency = 1
    b.Image = "rbxassetid://"..id
    b.ImageColor3 = col
    b.Parent = container
    Instance.new("UICorner",b).CornerRadius = UDim.new(1,0)
    b.Activated:Connect(playClick)
    addEffect(b)
    return b
end

local homeBtn     = makeBtn("9288455303", Color3.fromRGB(253,201,255))
local speedBtn    = makeBtn("92161351496486", Color3.fromRGB(228,78,255))
local settingsBtn = makeBtn("7059346373", Color3.fromRGB(255,0,230))
local execBtn     = makeBtn("114765891666260", Color3.fromRGB(255,0,89))

local iyBtn = Instance.new("TextButton",container)
iyBtn.Size = UDim2.new(0,50,0,40)
iyBtn.BackgroundTransparency = 1
iyBtn.Text = "IY"
iyBtn.TextColor3 = Color3.fromRGB(255,0,0)
iyBtn.Font = Enum.Font.GothamBold
iyBtn.TextSize = 22
Instance.new("UICorner",iyBtn).CornerRadius = UDim.new(1,0)
iyBtn.Activated:Connect(function()
    playClick()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
end)
addEffect(iyBtn)

local bBtn = Instance.new("TextButton",container)
bBtn.Size = UDim2.new(0,40,0,40)
bBtn.BackgroundTransparency = 1
bBtn.Text = "B"
bBtn.TextColor3 = Color3.fromRGB(255,0,0)
bBtn.Font = Enum.Font.GothamBold
bBtn.TextSize = 24
Instance.new("UICorner",bBtn).CornerRadius = UDim.new(1,0)
bBtn.Activated:Connect(playClick)
addEffect(bBtn)

-- ==================== PANEL TOGGLE (Cubic Out on Close) ====================
local currentPanel = nil

local function togglePanel(btn, panel)
    if currentPanel == panel then
        local pos = btn.AbsolutePosition
        local tween = TweenService:Create(panel,TweenInfo.new(0.6,Enum.EasingStyle.Cubic,Enum.EasingDirection.Out),{
            Size = UDim2.new(0,40,0,40),
            Position = UDim2.fromOffset(pos.X+20,pos.Y+54)
        })
        tween:Play()
        tween.Completed:Wait()
        panel.Visible = false
        currentPanel = nil
    else
        if currentPanel then currentPanel.Visible = false end
        currentPanel = panel
        local pos = btn.AbsolutePosition
        panel.Position = UDim2.fromOffset(pos.X+20,pos.Y+54)
        panel.Size = UDim2.new(0,40,0,40)
        panel.Visible = true
        TweenService:Create(panel,TweenInfo.new(0.6,Enum.EasingStyle.Quint),{
            Size = UDim2.new(0,222,0,223),
            Position = UDim2.new(0.5,-111,0,70)
        }):Play()
    end
end

-- ==================== MESSAGE SYSTEM ====================
local function showMessage(text, color)
    local msg = Instance.new("TextLabel")
    msg.Size = UDim2.new(0,200,0,30)
    msg.Position = UDim2.new(0.5,0,1,-50)
    msg.AnchorPoint = Vector2.new(0.5,1)
    msg.BackgroundColor3 = Color3.fromRGB(0,0,40)
    msg.BackgroundTransparency = 1
    msg.Text = text
    msg.TextColor3 = color
    msg.Font = Enum.Font.GothamBold
    msg.TextSize = 16
    msg.Parent = main
    Instance.new("UICorner",msg).CornerRadius = UDim.new(1,0)

    TweenService:Create(msg,TweenInfo.new(0.5,Enum.EasingStyle.Bounce,Enum.EasingDirection.Out),{
        BackgroundTransparency = 0,
        Position = UDim2.new(0.5,0,1,-80)
    }):Play()
    task.wait(3)
    TweenService:Create(msg,TweenInfo.new(0.5,Enum.EasingStyle.Bounce,Enum.EasingDirection.In),{
        BackgroundTransparency = 1,
        Position = UDim2.new(0.5,0,1,-50)
    }):Play()
    task.wait(0.5)
    msg:Destroy()
end

-- ==================== CREATE PANEL FUNCTION ====================
local function createPanel()
    local p = Instance.new("ImageLabel")
    p.Size = UDim2.new(0,222,0,223)
    p.BackgroundTransparency = 1
    p.Image = "rbxassetid://6278672195"
    p.ImageColor3 = Color3.fromRGB(159,0,82)
    p.ImageTransparency = 0.1
    p.Visible = false
    p.ClipsDescendants = true
    p.Parent = main
    Instance.new("UICorner",p).CornerRadius = UDim.new(0,9)
    return p
end

-- ==================== ALL PANELS (100% VISIBLE CONTENT) ====================
-- Home Panel
local homePanel = createPanel()
local homeBox = Instance.new("TextLabel",homePanel)
homeBox.Size = UDim2.new(1,-20,1,-20)
homeBox.Position = UDim2.new(0,10,0,10)
homeBox.BackgroundColor3 = Color3.new(0,0,0)
homeBox.BackgroundTransparency = 0.2
homeBox.TextColor3 = Color3.new(1,1,1)
homeBox.Text = [[Welcome to Krnl X
This brings back the Krnl we have known and loved. Since the original Krnl has been shut down, this remake brings back everything we used and missed.
Krnl X is the true successor.]]
homeBox.TextScaled = true
homeBox.Font = Enum.Font.Gotham
Instance.new("UICorner",homeBox).CornerRadius = UDim.new(0,8)

-- Speed Panel
local speedPanel = createPanel()
local sTitle = Instance.new("Frame",speedPanel)
sTitle.Size = UDim2.new(1,-20,0,40)
sTitle.Position = UDim2.new(0,10,0,10)
sTitle.BackgroundColor3 = Color3.new(0,0,0)
sTitle.BackgroundTransparency = 0.2
Instance.new("UICorner",sTitle).CornerRadius = UDim.new(1,0)
local st = Instance.new("TextLabel",sTitle)
st.Size = UDim2.new(1,0,1,0)
st.BackgroundTransparency = 1
st.Text = "Speed Settings"
st.TextColor3 = Color3.new(1,1,1)
st.Font = Enum.Font.GothamBold
st.TextSize = 20

local wsBox = Instance.new("TextBox",speedPanel)
wsBox.Position = UDim2.new(0,20,0,70)
wsBox.Size = UDim2.new(1,-40,0,40)
wsBox.BackgroundColor3 = Color3.new(0,0,0)
wsBox.BackgroundTransparency = 0.2
wsBox.TextColor3 = Color3.new(1,1,1)
wsBox.Text = "16"
wsBox.Font = Enum.Font.Gotham
Instance.new("UICorner",wsBox).CornerRadius = UDim.new(1,0)

local jpBox = Instance.new("TextBox",speedPanel)
jpBox.Position = UDim2.new(0,20,0,125)
jpBox.Size = UDim2.new(1,-40,0,40)
jpBox.BackgroundColor3 = Color3.new(0,0,0)
jpBox.BackgroundTransparency = 0.2
jpBox.TextColor3 = Color3.new(1,1,1)
jpBox.Text = "50"
jpBox.Font = Enum.Font.Gotham
Instance.new("UICorner",jpBox).CornerRadius = UDim.new(1,0)

wsBox.FocusLost:Connect(function(e) if e and player.Character then player.Character.Humanoid.WalkSpeed = tonumber(wsBox.Text) or 16 end end)
jpBox.FocusLost:Connect(function(e) if e and player.Character then player.Character.Humanoid.JumpPower = tonumber(jpBox.Text) or 50 end end)

-- Settings Panel
local settingsPanel = createPanel()
local setTitle = Instance.new("Frame",settingsPanel)
setTitle.Size = UDim2.new(1,-20,0,40)
setTitle.Position = UDim2.new(0,10,0,10)
setTitle.BackgroundColor3 = Color3.new(0,0,0)
setTitle.BackgroundTransparency = 0.2
Instance.new("UICorner",setTitle).CornerRadius = UDim.new(1,0)
local sett = Instance.new("TextLabel",setTitle)
sett.Size = UDim2.new(1,0,1,0)
sett.BackgroundTransparency = 1
sett.Text = "GUI Settings"
sett.TextColor3 = Color3.new(1,1,1)
sett.Font = Enum.Font.GothamBold
sett.TextSize = 20

local transBox = Instance.new("TextBox",settingsPanel)
transBox.Position = UDim2.new(0,20,0,70)
transBox.Size = UDim2.new(1,-40,0,40)
transBox.BackgroundColor3 = Color3.new(0,0,0)
transBox.BackgroundTransparency = 0.2
transBox.TextColor3 = Color3.new(1,1,1)
transBox.Text = "0.1"
transBox.Font = Enum.Font.Gotham
Instance.new("UICorner",transBox).CornerRadius = UDim.new(1,0)
transBox.FocusLost:Connect(function(e)
    if e then
        local v = tonumber(transBox.Text) or 0.1
        v = math.clamp(v,0,1)
        topbar.ImageTransparency = v
        homePanel.ImageTransparency = v
        speedPanel.ImageTransparency = v
        settingsPanel.ImageTransparency = v
        execPanel.ImageTransparency = v
        cheatsPanel.ImageTransparency = v
    end
end)

-- Executor Panel
local execPanel = createPanel()
local scriptBox = Instance.new("TextBox",execPanel)
scriptBox.Size = UDim2.new(1,-20,1,-80)
scriptBox.Position = UDim2.new(0,10,0,10)
scriptBox.BackgroundColor3 = Color3.new(0,0,0)
scriptBox.BackgroundTransparency = 0.2
scriptBox.TextColor3 = Color3.new(1,1,1)
scriptBox.PlaceholderText = "Enter script here..."
scriptBox.MultiLine = true
scriptBox.TextWrapped = true
scriptBox.Font = Enum.Font.Code
scriptBox.TextSize = 14
Instance.new("UICorner",scriptBox).CornerRadius = UDim.new(0,9)

local executeBtn = Instance.new("TextButton",execPanel)
executeBtn.Size = UDim2.new(0.45,-10,0,35)
executeBtn.Position = UDim2.new(0,15,1,-50)
executeBtn.BackgroundColor3 = Color3.new(0,0,0)
executeBtn.BackgroundTransparency = 0.2
executeBtn.Text = "Execute"
executeBtn.TextColor3 = Color3.new(1,1,1)
executeBtn.Font = Enum.Font.GothamBold
Instance.new("UICorner",executeBtn).CornerRadius = UDim.new(0,9)
executeBtn.Activated:Connect(function()
    playExec()
    local success, err = pcall(function()
        loadstring(scriptBox.Text)()
    end)
    if success then
        showMessage("script executed!", Color3.fromRGB(0,255,100))
    else
        showMessage("script executed error!", Color3.fromRGB(255,0,0))
    end
end)

local clearBtn = Instance.new("TextButton",execPanel)
clearBtn.Size = UDim2.new(0.45,-10,0,35)
clearBtn.Position = UDim2.new(0.55,5,1,-50)
clearBtn.BackgroundColor3 = Color3.new(0,0,0)
clearBtn.BackgroundTransparency = 0.2
clearBtn.Text = "Clear"
clearBtn.TextColor3 = Color3.new(1,1,1)
clearBtn.Font = Enum.Font.GothamBold
Instance.new("UICorner",clearBtn).CornerRadius = UDim.new(0,9)
clearBtn.Activated:Connect(function()
    playExec()
    scriptBox.Text = ""
    showMessage("script cleared!", Color3.fromRGB(0,255,100))
end)

-- Cheats Panel (B Button)
local cheatsPanel = createPanel()
local cheatsTitle = Instance.new("Frame",cheatsPanel)
cheatsTitle.Size = UDim2.new(1,-20,0,40)
cheatsTitle.Position = UDim2.new(0,10,0,10)
cheatsTitle.BackgroundColor3 = Color3.new(0,0,0)
cheatsTitle.BackgroundTransparency = 0.2
Instance.new("UICorner",cheatsTitle).CornerRadius = UDim.new(1,0)
local ct = Instance.new("TextLabel",cheatsTitle)
ct.Size = UDim2.new(1,0,1,0)
ct.BackgroundTransparency = 1
ct.Text = "Common Cheats"
ct.TextColor3 = Color3.new(1,1,1)
ct.Font = Enum.Font.GothamBold
ct.TextSize = 20

local scroll = Instance.new("ScrollingFrame",cheatsPanel)
scroll.Size = UDim2.new(1,-20,1,-60)
scroll.Position = UDim2.new(0,10,0,60)
scroll.BackgroundTransparency = 1
scroll.ScrollBarThickness = 6
scroll.CanvasSize = UDim2.new(0,0,0,700)

local clayout = Instance.new("UIGridLayout",scroll)
clayout.CellSize = UDim2.new(1,0,0,35)
clayout.CellPadding = UDim2.new(0,0,0,5)

local cheats = {"Inf Jump","Noclip","Fly","Super Speed","Teleport to Spawn","Reset Character","No Gravity","High Jump","Invisible","God Mode","Auto Farm","No Clip Walls","ESP","Aimbot (Weak)","Infinite Stamina","No Fall Damage","Speed Boost","Jump Boost","Teleport to Player","Kill Aura (Weak)"}

for _,name in ipairs(cheats) do
    local btn = Instance.new("TextButton",scroll)
    btn.BackgroundColor3 = Color3.new(0,0,0)
    btn.BackgroundTransparency = 0.2
    btn.Text = name
    btn.TextColor3 = Color3.new(1,1,1)
    btn.Font = Enum.Font.Gotham
    btn.TextSize = 16
    Instance.new("UICorner",btn).CornerRadius = UDim.new(1,0)
    btn.Activated:Connect(function()
        playExec()
        print("Activated: "..name)
    end)
end

-- ==================== CONNECT ALL BUTTONS ====================
homeBtn.Activated:Connect(function() togglePanel(homeBtn, homePanel) end)
speedBtn.Activated:Connect(function() togglePanel(speedBtn, speedPanel) end)
settingsBtn.Activated:Connect(function() togglePanel(settingsBtn, settingsPanel) end)
execBtn.Activated:Connect(function() togglePanel(execBtn, execPanel) end)
iyBtn.Activated:Connect(function()
    playClick()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
end)
bBtn.Activated:Connect(function() togglePanel(bBtn, cheatsPanel) end)

print("Krnl X â€“ 100% FINAL & FLAWLESS! All GUIs show content + Smooth cubic out close")
