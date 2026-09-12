if game.PlaceId == 142823291 then

-- Quantum Hub - Ultimate MM2 Edition
-- Script Owner: h8_h80
-- Quantum Hub Owner: xmijovanxmi

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local CoreGui = game:GetService("CoreGui")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local Camera = Workspace.CurrentCamera

local LocalPlayer = Players.LocalPlayer

if CoreGui:FindFirstChild("QuantumHubUltimate") then
    CoreGui.QuantumHubUltimate:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "QuantumHubUltimate"
ScreenGui.Parent = CoreGui
ScreenGui.ResetOnSpawn = false

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(11, 11, 15)
MainFrame.BorderColor3 = Color3.fromRGB(55, 55, 85)
MainFrame.BorderSizePixel = 1
MainFrame.Position = UDim2.new(0.5, -310, 0.5, -195)
MainFrame.Size = UDim2.new(0, 620, 0, 390)
MainFrame.Active = true
MainFrame.Draggable = true

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 10)
MainCorner.Parent = MainFrame

local MainGlow = Instance.new("UIStroke")
MainGlow.Parent = MainFrame
MainGlow.Color = Color3.fromRGB(0, 150, 255)
MainGlow.Transparency = 0.6
MainGlow.Thickness = 1.5

local TopBar = Instance.new("Frame")
TopBar.Name = "TopBar"
TopBar.Parent = MainFrame
TopBar.BackgroundColor3 = Color3.fromRGB(16, 16, 22)
TopBar.BorderSizePixel = 0
TopBar.Size = UDim2.new(1, 0, 0, 50)

local TopBarCorner = Instance.new("UICorner")
TopBarCorner.CornerRadius = UDim.new(0, 10)
TopBarCorner.Parent = TopBar

local TopBarCover = Instance.new("Frame")
TopBarCover.Parent = TopBar
TopBarCover.BackgroundColor3 = Color3.fromRGB(16, 16, 22)
TopBarCover.BorderSizePixel = 0
TopBarCover.Position = UDim2.new(0, 0, 1, -8)
TopBarCover.Size = UDim2.new(1, 0, 0, 8)

local LogoImage = Instance.new("ImageLabel")
LogoImage.Parent = TopBar
LogoImage.BackgroundTransparency = 1
LogoImage.Position = UDim2.new(0, 15, 0, 10)
LogoImage.Size = UDim2.new(0, 30, 0, 30)
LogoImage.Image = "rbxassetid://10328984242"

local TitleLabel = Instance.new("TextLabel")
TitleLabel.Parent = TopBar
TitleLabel.BackgroundTransparency = 1
TitleLabel.Position = UDim2.new(0, 55, 0, 7)
TitleLabel.Size = UDim2.new(0, 220, 0, 20)
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.Text = "Quantum Hub"
TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleLabel.TextSize = 16
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left

local SubtitleLabel = Instance.new("TextLabel")
SubtitleLabel.Parent = TopBar
SubtitleLabel.BackgroundTransparency = 1
SubtitleLabel.Position = UDim2.new(0, 55, 0, 26)
SubtitleLabel.Size = UDim2.new(0, 220, 0, 16)
SubtitleLabel.Font = Enum.Font.Gotham
SubtitleLabel.Text = "Murder Mystery 2 • Ultimate Edition"
SubtitleLabel.TextColor3 = Color3.fromRGB(140, 140, 180)
SubtitleLabel.TextSize = 10
SubtitleLabel.TextXAlignment = Enum.TextXAlignment.Left

local OpenButton = Instance.new("ImageButton")
OpenButton.Parent = ScreenGui
OpenButton.BackgroundColor3 = Color3.fromRGB(16, 16, 22)
OpenButton.Position = UDim2.new(1, -60, 0.5, -30)
OpenButton.Size = UDim2.new(0, 50, 0, 50)
OpenButton.Image = "rbxassetid://10328984242"
OpenButton.ScaleType = Enum.ScaleType.Fit
OpenButton.Visible = false

local OpenButtonCorner = Instance.new("UICorner")
OpenButtonCorner.CornerRadius = UDim.new(1, 0)
OpenButtonCorner.Parent = OpenButton

local OpenButtonStroke = Instance.new("UIStroke")
OpenButtonStroke.Parent = OpenButton
OpenButtonStroke.Color = Color3.fromRGB(0, 150, 255)
OpenButtonStroke.Thickness = 1.5

local CloseButton = Instance.new("ImageButton")
CloseButton.Parent = TopBar
CloseButton.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
CloseButton.Position = UDim2.new(1, -42, 0, 10)
CloseButton.Size = UDim2.new(0, 30, 0, 30)
CloseButton.Image = "rbxassetid://4917745937"
CloseButton.ScaleType = Enum.ScaleType.Fit

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 8)
CloseCorner.Parent = CloseButton

local function ToggleMenu()
    MainFrame.Visible = not MainFrame.Visible
    OpenButton.Visible = not MainFrame.Visible
end

CloseButton.MouseButton1Click:Connect(ToggleMenu)
OpenButton.MouseButton1Click:Connect(ToggleMenu)

local Sidebar = Instance.new("ScrollingFrame")
Sidebar.Parent = MainFrame
Sidebar.Active = true
Sidebar.BackgroundColor3 = Color3.fromRGB(13, 13, 18)
Sidebar.BorderSizePixel = 0
Sidebar.Position = UDim2.new(0, 0, 0, 50)
Sidebar.Size = UDim2.new(0, 160, 1, -50)
Sidebar.CanvasSize = UDim2.new(0, 0, 0, 0)
Sidebar.ScrollBarThickness = 2

local SidebarLayout = Instance.new("UIListLayout")
SidebarLayout.Parent = Sidebar
SidebarLayout.SortOrder = Enum.SortOrder.LayoutOrder
SidebarLayout.Padding = UDim.new(0, 6)

local ContentContainer = Instance.new("Frame")
ContentContainer.Parent = MainFrame
ContentContainer.BackgroundTransparency = 1
ContentContainer.Position = UDim2.new(0, 175, 0, 60)
ContentContainer.Size = UDim2.new(1, -185, 1, -70)

local Tabs = {}
local activePage = nil

local function CreateTab(name, order)
    local TabBtn = Instance.new("TextButton")
    TabBtn.Parent = Sidebar
    TabBtn.BackgroundColor3 = Color3.fromRGB(25, 25, 38)
    TabBtn.BackgroundTransparency = 1
    TabBtn.BorderSizePixel = 0
    TabBtn.Size = UDim2.new(1, 0, 0, 40)
    TabBtn.Font = Enum.Font.GothamMedium
    TabBtn.Text = "    " .. name
    TabBtn.TextColor3 = Color3.fromRGB(150, 150, 190)
    TabBtn.TextSize = 13
    TabBtn.TextXAlignment = Enum.TextXAlignment.Left
    TabBtn.LayoutOrder = order

    local Page = Instance.new("ScrollingFrame")
    Page.Parent = ContentContainer
    Page.Active = true
    Page.BackgroundTransparency = 1
    Page.BorderSizePixel = 0
    Page.Size = UDim2.new(1, 0, 1, 0)
    Page.CanvasSize = UDim2.new(0, 0, 0, 500)
    Page.ScrollBarThickness = 4
    Page.Visible = false

    local PageLayout = Instance.new("UIListLayout")
    PageLayout.Parent = Page
    PageLayout.SortOrder = Enum.SortOrder.LayoutOrder
    PageLayout.Padding = UDim.new(0, 10)

    TabBtn.MouseButton1Click:Connect(function()
        for _, t in pairs(Tabs) do
            t.Page.Visible = false
            TweenService:Create(t.Button, TweenInfo.new(0.25, Enum.EasingStyle.Quad), {BackgroundTransparency = 1, TextColor3 = Color3.fromRGB(150, 150, 190)}):Play()
        end
        Page.Visible = true
        TweenService:Create(TabBtn, TweenInfo.new(0.25, Enum.EasingStyle.Quad), {BackgroundTransparency = 0.3, TextColor3 = Color3.fromRGB(255, 255, 255)}):Play()
    end)

    if not activePage then
        Page.Visible = true
        TabBtn.BackgroundTransparency = 0.3
        TabBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        activePage = Page
    end

    Tabs[name] = {Button = TabBtn, Page = Page}
    return Page
end

local MainTab = CreateTab("Main", 1)
local VisualsTab = CreateTab("Visuals", 2)
local MovementTab = CreateTab("Movement", 3)
local AutoFarmTab = CreateTab("AutoFarm", 4)
local CreditsTab = CreateTab("Credits", 5)
local ThemesTab = CreateTab("Themes", 6)

local ThemeElements = {}

local function RegisterElement(element, elementType)
    table.insert(ThemeElements, {Object = element, Type = elementType})
end

local function ApplyGlobalTheme(bgColor, sidebarColor, topbarColor, accentColor, textColor)
    MainFrame.BackgroundColor3 = bgColor
    Sidebar.BackgroundColor3 = sidebarColor
    TopBar.BackgroundColor3 = topbarColor
    TopBarCover.BackgroundColor3 = topbarColor
    MainGlow.Color = accentColor
    OpenButtonStroke.Color = accentColor
    OpenButton.BackgroundColor3 = topbarColor
    TitleLabel.TextColor3 = textColor
    SubtitleLabel.TextColor3 = Color3.fromRGB(textColor.R * 255 * 0.7, textColor.G * 255 * 0.7, textColor.B * 255 * 0.7)

    for _, item in pairs(ThemeElements) do
        if item.Type == "Card" then
            item.Object.BackgroundColor3 = sidebarColor
        elseif item.Type == "Text" then
            item.Object.TextColor3 = textColor
        elseif item.Type == "Button" then
            item.Object.BackgroundColor3 = accentColor
        end
    end
end

local function AddThemeButton(parent, themeName, bgColor, sidebarColor, topbarColor, accentColor, textColor)
    local Btn = Instance.new("TextButton")
    Btn.Parent = parent
    Btn.BackgroundColor3 = sidebarColor
    Btn.BorderSizePixel = 0
    Btn.Size = UDim2.new(1, -10, 0, 48)
    Btn.Font = Enum.Font.GothamBold
    Btn.Text = "  " .. themeName .. " Theme"
    Btn.TextColor3 = accentColor
    Btn.TextSize = 14
    Btn.TextXAlignment = Enum.TextXAlignment.Left

    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 8)
    Corner.Parent = Btn

    local Stroke = Instance.new("UIStroke")
    Stroke.Parent = Btn
    Stroke.Color = accentColor
    Stroke.Transparency = 0.4
    Stroke.Thickness = 1.5

    Btn.MouseButton1Click:Connect(function()
        ApplyGlobalTheme(bgColor, sidebarColor, topbarColor, accentColor, textColor)
    end)
end

-- İngilizce Temalar (Tam Kapsamlı)
AddThemeButton(ThemesTab, "Dark", Color3.fromRGB(11, 11, 15), Color3.fromRGB(13, 13, 18), Color3.fromRGB(16, 16, 22), Color3.fromRGB(0, 150, 255), Color3.fromRGB(255, 255, 255))
AddThemeButton(ThemesTab, "Gray", Color3.fromRGB(35, 35, 45), Color3.fromRGB(25, 25, 32), Color3.fromRGB(30, 30, 38), Color3.fromRGB(180, 180, 180), Color3.fromRGB(240, 240, 240))
AddThemeButton(ThemesTab, "Light", Color3.fromRGB(240, 240, 245), Color3.fromRGB(225, 225, 230), Color3.fromRGB(230, 230, 235), Color3.fromRGB(40, 100, 255), Color3.fromRGB(30, 30, 40))
AddThemeButton(ThemesTab, "Blue", Color3.fromRGB(15, 25, 45), Color3.fromRGB(10, 18, 32), Color3.fromRGB(12, 22, 38), Color3.fromRGB(0, 180, 255), Color3.fromRGB(230, 240, 255))
AddThemeButton(ThemesTab, "Halloween", Color3.fromRGB(25, 15, 8), Color3.fromRGB(18, 10, 5), Color3.fromRGB(32, 18, 8), Color3.fromRGB(255, 120, 0), Color3.fromRGB(255, 200, 150))
AddThemeButton(ThemesTab, "Easter", Color3.fromRGB(30, 20, 35), Color3.fromRGB(22, 14, 26), Color3.fromRGB(38, 25, 45), Color3.fromRGB(255, 150, 220), Color3.fromRGB(245, 220, 255))
AddThemeButton(ThemesTab, "Winter", Color3.fromRGB(15, 28, 38), Color3.fromRGB(10, 20, 28), Color3.fromRGB(20, 35, 48), Color3.fromRGB(100, 210, 255), Color3.fromRGB(220, 245, 255))
AddThemeButton(ThemesTab, "Cyberpunk", Color3.fromRGB(18, 5, 28), Color3.fromRGB(12, 2, 20), Color3.fromRGB(24, 8, 38), Color3.fromRGB(255, 0, 128), Color3.fromRGB(255, 150, 220))
AddThemeButton(ThemesTab, "Retro", Color3.fromRGB(35, 28, 15), Color3.fromRGB(26, 20, 10), Color3.fromRGB(45, 36, 18), Color3.fromRGB(255, 200, 0), Color3.fromRGB(255, 240, 180))
AddThemeButton(ThemesTab, "Sunset", Color3.fromRGB(32, 12, 25), Color3.fromRGB(22, 8, 18), Color3.fromRGB(42, 16, 32), Color3.fromRGB(255, 90, 60), Color3.fromRGB(255, 210, 190))
AddThemeButton(ThemesTab, "Matrix", Color3.fromRGB(5, 20, 10), Color3.fromRGB(2, 14, 6), Color3.fromRGB(8, 28, 14), Color3.fromRGB(0, 255, 65), Color3.fromRGB(180, 255, 200))
AddThemeButton(ThemesTab, "Emerald", Color3.fromRGB(10, 28, 22), Color3.fromRGB(6, 18, 14), Color3.fromRGB(14, 38, 30), Color3.fromRGB(0, 200, 150), Color3.fromRGB(200, 255, 235))

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed then
        if input.KeyCode == Enum.KeyCode.LeftControl then
            ToggleMenu()
        end
    end
end)

local Keybinds = {}
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed then
        for _, kb in pairs(Keybinds) do
            if kb.Key and input.KeyCode == kb.Key then
                if kb.Callback then
                    kb.Callback()
                end
            end
        end
    end
end)

local function AddToggleWithKeybind(parent, title, defaultState, callback)
    local Frame = Instance.new("Frame")
    Frame.Parent = parent
    Frame.BackgroundColor3 = Color3.fromRGB(18, 18, 25)
    Frame.BorderSizePixel = 0
    Frame.Size = UDim2.new(1, -10, 0, 48)
    RegisterElement(Frame, "Card")

    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 8)
    Corner.Parent = Frame

    local Stroke = Instance.new("UIStroke")
    Stroke.Parent = Frame
    Stroke.Color = Color3.fromRGB(35, 35, 50)
    Stroke.Transparency = 0.6

    local Label = Instance.new("TextLabel")
    Label.Parent = Frame
    Label.BackgroundTransparency = 1
    Label.Position = UDim2.new(0, 15, 0, 0)
    Label.Size = UDim2.new(0.45, 0, 1, 0)
    Label.Font = Enum.Font.GothamMedium
    Label.Text = title
    Label.TextColor3 = Color3.fromRGB(230, 230, 250)
    Label.TextSize = 13
    Label.TextXAlignment = Enum.TextXAlignment.Left
    RegisterElement(Label, "Text")

    local KeybindBtn = Instance.new("TextButton")
    KeybindBtn.Parent = Frame
    KeybindBtn.BackgroundColor3 = Color3.fromRGB(28, 28, 40)
    KeybindBtn.Position = UDim2.new(1, -115, 0.5, -12)
    KeybindBtn.Size = UDim2.new(0, 50, 0, 24)
    KeybindBtn.Font = Enum.Font.GothamMedium
    KeybindBtn.Text = "( ... )"
    KeybindBtn.TextColor3 = Color3.fromRGB(160, 160, 200)
    KeybindBtn.TextSize = 11

    local KbCorner = Instance.new("UICorner")
    KbCorner.CornerRadius = UDim.new(0, 6)
    KbCorner.Parent = KeybindBtn

    local SwitchBg = Instance.new("TextButton")
    SwitchBg.Parent = Frame
    SwitchBg.BackgroundColor3 = defaultState and Color3.fromRGB(0, 150, 255) or Color3.fromRGB(32, 32, 45)
    SwitchBg.Position = UDim2.new(1, -55, 0.5, -12)
    SwitchBg.Size = UDim2.new(0, 44, 0, 24)
    SwitchBg.AutoButtonColor = false
    SwitchBg.Text = ""

    local SwitchCorner = Instance.new("UICorner")
    SwitchCorner.CornerRadius = UDim.new(1, 0)
    SwitchCorner.Parent = SwitchBg

    local Indicator = Instance.new("Frame")
    Indicator.Parent = SwitchBg
    Indicator.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Indicator.Position = defaultState and UDim2.new(1, -21, 0.5, -9) or UDim2.new(0, 3, 0.5, -9)
    Indicator.Size = UDim2.new(0, 18, 0, 18)

    local IndCorner = Instance.new("UICorner")
    IndCorner.CornerRadius = UDim.new(1, 0)
    IndCorner.Parent = Indicator

    local state = defaultState
    local currentKey = nil

    local function trigger()
        state = not state
        local targetColor = state and Color3.fromRGB(0, 150, 255) or Color3.fromRGB(32, 32, 45)
        local targetPos = state and UDim2.new(1, -21, 0.5, -9) or UDim2.new(0, 3, 0.5, -9)
        TweenService:Create(SwitchBg, TweenInfo.new(0.2), {BackgroundColor3 = targetColor}):Play()
        TweenService:Create(Indicator, TweenInfo.new(0.2), {Position = targetPos}):Play()
        callback(state)
    end

    SwitchBg.MouseButton1Click:Connect(trigger)

    local binding = false
    KeybindBtn.MouseButton1Click:Connect(function()
        binding = true
        KeybindBtn.Text = "( ... )"
        local connection
        connection = UserInputService.InputBegan:Connect(function(input)
            if binding and input.UserInputType == Enum.UserInputType.Keyboard then
                if input.KeyCode == Enum.KeyCode.Escape then
                    currentKey = nil
                    KeybindBtn.Text = "( ... )"
                else
                    currentKey = input.KeyCode
                    KeybindBtn.Text = "(" .. input.KeyCode.Name .. ")"
                end
                binding = false
                connection:Disconnect()
            end
        end)
    end)

    table.insert(Keybinds, {
        Getters = function() return currentKey end,
        Callback = function()
            trigger()
        end
    })

    local kbEntry = Keybinds[#Keybinds]
    task.spawn(function()
        while true do
            kbEntry.Key = currentKey
            task.wait(0.5)
        end
    end)

    return Frame
end

local function AddToggle(parent, title, defaultState, callback)
    local Frame = Instance.new("Frame")
    Frame.Parent = parent
    Frame.BackgroundColor3 = Color3.fromRGB(18, 18, 25)
    Frame.BorderSizePixel = 0
    Frame.Size = UDim2.new(1, -10, 0, 48)
    RegisterElement(Frame, "Card")

    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 8)
    Corner.Parent = Frame

    local Stroke = Instance.new("UIStroke")
    Stroke.Parent = Frame
    Stroke.Color = Color3.fromRGB(35, 35, 50)
    Stroke.Transparency = 0.6

    local Label = Instance.new("TextLabel")
    Label.Parent = Frame
    Label.BackgroundTransparency = 1
    Label.Position = UDim2.new(0, 15, 0, 0)
    Label.Size = UDim2.new(0.5, 0, 1, 0)
    Label.Font = Enum.Font.GothamMedium
    Label.Text = title
    Label.TextColor3 = Color3.fromRGB(230, 230, 250)
    Label.TextSize = 13
    Label.TextXAlignment = Enum.TextXAlignment.Left
    RegisterElement(Label, "Text")

    local SwitchBg = Instance.new("TextButton")
    SwitchBg.Parent = Frame
    SwitchBg.BackgroundColor3 = defaultState and Color3.fromRGB(0, 150, 255) or Color3.fromRGB(32, 32, 45)
    SwitchBg.Position = UDim2.new(1, -60, 0.5, -12)
    SwitchBg.Size = UDim2.new(0, 44, 0, 24)
    SwitchBg.AutoButtonColor = false
    SwitchBg.Text = ""

    local SwitchCorner = Instance.new("UICorner")
    SwitchCorner.CornerRadius = UDim.new(1, 0)
    SwitchCorner.Parent = SwitchBg

    local Indicator = Instance.new("Frame")
    Indicator.Parent = SwitchBg
    Indicator.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Indicator.Position = defaultState and UDim2.new(1, -21, 0.5, -9) or UDim2.new(0, 3, 0.5, -9)
    Indicator.Size = UDim2.new(0, 18, 0, 18)

    local IndCorner = Instance.new("UICorner")
    IndCorner.CornerRadius = UDim.new(1, 0)
    IndCorner.Parent = Indicator

    local state = defaultState
    local function trigger()
        state = not state
        local targetColor = state and Color3.fromRGB(0, 150, 255) or Color3.fromRGB(32, 32, 45)
        local targetPos = state and UDim2.new(1, -21, 0.5, -9) or UDim2.new(0, 3, 0.5, -9)
        TweenService:Create(SwitchBg, TweenInfo.new(0.2), {BackgroundColor3 = targetColor}):Play()
        TweenService:Create(Indicator, TweenInfo.new(0.2), {Position = targetPos}):Play()
        callback(state)
    end

    SwitchBg.MouseButton1Click:Connect(trigger)
end

local function AddSlider(parent, title, min, max, default, callback)
    local Frame = Instance.new("Frame")
    Frame.Parent = parent
    Frame.BackgroundColor3 = Color3.fromRGB(18, 18, 25)
    Frame.BorderSizePixel = 0
    Frame.Size = UDim2.new(1, -10, 0, 58)
    RegisterElement(Frame, "Card")

    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 8)
    Corner.Parent = Frame

    local Stroke = Instance.new("UIStroke")
    Stroke.Parent = Frame
    Stroke.Color = Color3.fromRGB(35, 35, 50)
    Stroke.Transparency = 0.6

    local Label = Instance.new("TextLabel")
    Label.Parent = Frame
    Label.BackgroundTransparency = 1
    Label.Position = UDim2.new(0, 15, 0, 6)
    Label.Size = UDim2.new(1, -30, 0, 20)
    Label.Font = Enum.Font.GothamMedium
    Label.Text = title .. ": " .. tostring(default)
    Label.TextColor3 = Color3.fromRGB(230, 230, 250)
    Label.TextSize = 13
    Label.TextXAlignment = Enum.TextXAlignment.Left
    RegisterElement(Label, "Text")

    local SliderBar = Instance.new("TextButton")
    SliderBar.Parent = Frame
    SliderBar.BackgroundColor3 = Color3.fromRGB(32, 32, 45)
    SliderBar.BorderSizePixel = 0
    SliderBar.Position = UDim2.new(0, 15, 0, 36)
    SliderBar.Size = UDim2.new(1, -30, 0, 8)
    SliderBar.AutoButtonColor = false
    SliderBar.Text = ""

    local BarCorner = Instance.new("UICorner")
    BarCorner.CornerRadius = UDim.new(1, 0)
    BarCorner.Parent = SliderBar

    local Fill = Instance.new("Frame")
    Fill.Parent = SliderBar
    Fill.BackgroundColor3 = Color3.fromRGB(0, 150, 255)
    Fill.BorderSizePixel = 0
    Fill.Size = UDim2.new((default - min) / (max - min), 0, 1, 0)

    local FillCorner = Instance.new("UICorner")
    FillCorner.CornerRadius = UDim.new(1, 0)
    FillCorner.Parent = Fill

    local dragging = false
    SliderBar.MouseButton1Down:Connect(function()
        dragging = true
    end)

    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)

    RunService.RenderStepped:Connect(function()
        if dragging then
            local mousePos = UserInputService:GetMouseLocation().X
            local barPos = SliderBar.AbsolutePosition.X
            local barSize = SliderBar.AbsoluteSize.X
            local percent = math.clamp((mousePos - barPos) / barSize, 0, 1)
            local value = math.floor(min + (max - min) * percent)
            Fill.Size = UDim2.new(percent, 0, 1, 0)
            Label.Text = title .. ": " .. tostring(value)
            callback(value)
        end
    end)
end

local murdererEspActive = false
local sheriffEspActive = false
local innocentsEspActive = false

local function UpdateRoleEsp()
    for _, player in pairs(Players:GetChildren()) do
        if player ~= LocalPlayer and player.Character then
            local char = player.Character
            local highlight = char:FindFirstChild("QuantumRoleEsp")
            
            local hasKnife = false
            local hasGun = false
            if player.Backpack then
                for _, item in pairs(player.Backpack:GetChildren()) do
                    if item.Name == "Knife" then hasKnife = true end
                    if item.Name == "Revolver" or item.Name == "Gun" then hasGun = true end
                end
            end
            if char then
                for _, item in pairs(char:GetChildren()) do
                    if item.Name == "Knife" then hasKnife = true end
                    if item.Name == "Revolver" or item.Name == "Gun" then hasGun = true end
                end
            end

            local shouldShow = false
            local roleColor = Color3.fromRGB(0, 255, 0)

            if hasKnife then
                if murdererEspActive then
                    shouldShow = true
                    roleColor = Color3.fromRGB(255, 30, 30)
                end
            elseif hasGun then
                if sheriffEspActive then
                    shouldShow = true
                    roleColor = Color3.fromRGB(30, 144, 255)
                end
            else
                if innocentsEspActive then
                    shouldShow = true
                    roleColor = Color3.fromRGB(0, 255, 100)
                end
            end

            if shouldShow then
                if not highlight then
                    highlight = Instance.new("Highlight")
                    highlight.Name = "QuantumRoleEsp"
                    highlight.Parent = char
                    highlight.Adornee = char
                    highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                end
                highlight.FillColor = roleColor
                highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
                highlight.FillTransparency = 0.4
                highlight.OutlineTransparency = 0.1
            else
                if highlight then highlight:Destroy() end
            end
        end
    end
end

RunService.RenderStepped:Connect(function()
    if murdererEspActive or sheriffEspActive or innocentsEspActive then
        UpdateRoleEsp()
    end
end)

local function GetMurderer()
    for _, p in pairs(Players:GetPlayers()) do
        if p ~= LocalPlayer and p.Character then
            local hasKnife = false
            if p.Backpack then
                for _, item in pairs(p.Backpack:GetChildren()) do
                    if item.Name == "Knife" then hasKnife = true end
                end
            end
            for _, item in pairs(p.Character:GetChildren()) do
                if item.Name == "Knife" then hasKnife = true end
            end
            if hasKnife then
                return p.Character
            end
        end
    end
    return nil
end

local aimbotActive = false
RunService.RenderStepped:Connect(function()
    if aimbotActive then
        pcall(function()
            local targetChar = GetMurderer()
            if targetChar and targetChar:FindFirstChild("HumanoidRootPart") then
                Camera.CFrame = CFrame.new(Camera.CFrame.Position, targetChar.HumanoidRootPart.Position)
            end
        end)
    end
end)

local gunGrabberActive = false
local function BringGunFunc()
    pcall(function()
        local rootPart = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if not rootPart then return end

        local function teleportGun(targetObj)
            if targetObj:IsA("BasePart") then
                if targetObj.Name == "GunDrop" or targetObj.Name == "RevolverDrop" then
                    targetObj.CFrame = rootPart.CFrame
                end
            elseif targetObj:IsA("Model") then
                for _, p in pairs(targetObj:GetDescendants()) do
                    if p:IsA("BasePart") and (p.Name == "GunDrop" or p.Name == "RevolverDrop") then
                        p.CFrame = rootPart.CFrame
                    end
                end
            end
        end

        local gunDrop = Workspace:FindFirstChild("GunDrop")
        if gunDrop then
            teleportGun(gunDrop)
        end
        
        for _, obj in pairs(Workspace:GetDescendants()) do
            if obj.Name == "GunDrop" or obj.Name == "RevolverDrop" then
                teleportGun(obj)
            end
        end
    end)
end

task.spawn(function()
    while true do
        if gunGrabberActive then
            BringGunFunc()
        end
        task.wait(0.5)
    end
end)

local flying = false
local flyConnection = nil
local function ToggleFly(state)
    flying = state
    local char = LocalPlayer.Character
    if not char then return end
    local humanoid = char:FindFirstChild("Humanoid")
    local rootPart = char:FindFirstChild("HumanoidRootPart")
    if not humanoid or not rootPart then return end

    if flying then
        humanoid.PlatformStand = true
        local bv = Instance.new("BodyVelocity")
        bv.Name = "QuantumFlyVelocity"
        bv.Parent = rootPart
        bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
        bv.Velocity = Vector3.new(0, 0, 0)

        local bg = Instance.new("BodyGyro")
        bg.Name = "QuantumFlyGyro"
        bg.Parent = rootPart
        bg.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
        bg.CFrame = rootPart.CFrame

        if flyConnection then flyConnection:Disconnect() end
        flyConnection = RunService.RenderStepped:Connect(function()
            if not flying or not char or not char.Parent then
                if flyConnection then flyConnection:Disconnect() end
                return
            end
            local cam = Workspace.CurrentCamera
            local moveDir = Vector3.new()
            if UserInputService:IsKeyDown(Enum.KeyCode.W) then
                moveDir = moveDir + cam.CFrame.LookVector
            end
            if UserInputService:IsKeyDown(Enum.KeyCode.S) then
                moveDir = moveDir - cam.CFrame.LookVector
            end
            if UserInputService:IsKeyDown(Enum.KeyCode.A) then
                moveDir = moveDir - cam.CFrame.RightVector
            end
            if UserInputService:IsKeyDown(Enum.KeyCode.D) then
                moveDir = moveDir + cam.CFrame.RightVector
            end
            if moveDir.Magnitude > 0 then
                bv.Velocity = moveDir.Unit * 50
            else
                bv.Velocity = Vector3.new(0, 0.1, 0)
            end
            bg.CFrame = cam.CFrame
        end)
    else
        if flyConnection then flyConnection:Disconnect() end
        if rootPart:FindFirstChild("QuantumFlyVelocity") then rootPart.QuantumFlyVelocity:Destroy() end
        if rootPart:FindFirstChild("QuantumFlyGyro") then rootPart.QuantumFlyGyro:Destroy() end
        humanoid.PlatformStand = false
    end
end

local noclipActive = false
RunService.Stepped:Connect(function()
    if noclipActive and LocalPlayer.Character then
        for _, part in pairs(LocalPlayer.Character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = false
            end
        end
    end
end)

local infJumpActive = false
UserInputService.JumpRequest:Connect(function()
    if infJumpActive and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
    end
end)

local coinFarmActive = false
task.spawn(function()
    while true do
        task.wait(0.05)
        if coinFarmActive then
            pcall(function()
                local char = LocalPlayer.Character
                local rootPart = char and char:FindFirstChild("HumanoidRootPart")
                if rootPart then
                    for _, obj in pairs(Workspace:GetDescendants()) do
                        if not coinFarmActive then break end
                        if obj.Name == "CoinContainer" or obj.Name == "Coin" then
                            for _, coin in pairs(obj:GetDescendants()) do
                                if coin:IsA("BasePart") and (coin.Name == "CoinVisual" or coin.Name == "TouchInterest" or coin.Parent.Name == "Coin") then
                                    rootPart.CFrame = coin.CFrame
                                    task.wait(0.02)
                                end
                            end
                        end
                    end
                end
            end)
        end
    end
end)

AddToggle(MainTab, "Gun Grabber", false, function(state)
    gunGrabberActive = state
end)

AddToggleWithKeybind(MainTab, "Aimbot (Murderer)", false, function(state)
    aimbotActive = state
end)

AddToggle(VisualsTab, "Murderer ESP", false, function(state)
    murdererEspActive = state
    if not state then
        for _, player in pairs(Players:GetChildren()) do
            if player.Character and player.Character:FindFirstChild("QuantumRoleEsp") then
                player.Character.QuantumRoleEsp:Destroy()
            end
        end
    end
end)

AddToggle(VisualsTab, "Sheriff ESP", false, function(state)
    sheriffEspActive = state
    if not state then
        for _, player in pairs(Players:GetChildren()) do
            if player.Character and player.Character:FindFirstChild("QuantumRoleEsp") then
                player.Character.QuantumRoleEsp:Destroy()
            end
        end
    end
end)

AddToggle(VisualsTab, "Innocents ESP", false, function(state)
    innocentsEspActive = state
    if not state then
        for _, player in pairs(Players:GetChildren()) do
            if player.Character and player.Character:FindFirstChild("QuantumRoleEsp") then
                player.Character.QuantumRoleEsp:Destroy()
            end
        end
    end
end)

AddToggleWithKeybind(VisualsTab, "X-Ray Vision", false, function(state)
    for _, obj in pairs(Workspace:GetDescendants()) do
        if obj:IsA("BasePart") and not obj.Parent:FindFirstChild("Humanoid") then
            obj.LocalTransparencyModifier = state and 0.75 or 0
        end
    end
end)

AddToggle(MovementTab, "Infinite Jump", false, function(state)
    infJumpActive = state
end)

AddToggleWithKeybind(MovementTab, "Fly Mode", false, function(state)
    ToggleFly(state)
end)

AddToggleWithKeybind(MovementTab, "Noclip", false, function(state)
    noclipActive = state
end)

AddSlider(MovementTab, "WalkSpeed", 16, 150, 16, function(val)
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.Character.Humanoid.WalkSpeed = val
    end
end)

AddSlider(MovementTab, "JumpPower", 50, 300, 50, function(val)
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.Character.Humanoid.UseJumpPower = true
        LocalPlayer.Character.Humanoid.JumpPower = val
    end
end)

AddToggle(AutoFarmTab, "Coin Farm", false, function(state)
    coinFarmActive = state
end)

local CreditsBox = Instance.new("Frame")
CreditsBox.Parent = CreditsTab
CreditsBox.BackgroundColor3 = Color3.fromRGB(18, 18, 25)
CreditsBox.BorderSizePixel = 0
CreditsBox.Size = UDim2.new(1, -10, 0, 95)
RegisterElement(CreditsBox, "Card")

local CreditsCorner = Instance.new("UICorner")
CreditsCorner.CornerRadius = UDim.new(0, 8)
CreditsCorner.Parent = CreditsBox

local CreditsStroke = Instance.new("UIStroke")
CreditsStroke.Parent = CreditsBox
CreditsStroke.Color = Color3.fromRGB(35, 35, 50)
CreditsStroke.Transparency = 0.6

local CreditsText1 = Instance.new("TextLabel")
CreditsText1.Parent = CreditsBox
CreditsText1.BackgroundTransparency = 1
CreditsText1.Position = UDim2.new(0, 15, 0, 12)
CreditsText1.Size = UDim2.new(1, -30, 0, 30)
CreditsText1.Font = Enum.Font.GothamBold
CreditsText1.Text = "Script Owner: h8_h80"
CreditsText1.TextColor3 = Color3.fromRGB(0, 150, 255)
CreditsText1.TextSize = 13
CreditsText1.TextXAlignment = Enum.TextXAlignment.Left
RegisterElement(CreditsText1, "Text")

local Glow1 = Instance.new("UIStroke")
Glow1.Parent = CreditsText1
Glow1.Color = Color3.fromRGB(0, 150, 255)
Glow1.Thickness = 1
Glow1.Transparency = 0.2

local CreditsText2 = Instance.new("TextLabel")
CreditsText2.Parent = CreditsBox
CreditsText2.BackgroundTransparency = 1
CreditsText2.Position = UDim2.new(0, 15, 0, 48)
CreditsText2.Size = UDim2.new(1, -30, 0, 30)
CreditsText2.Font = Enum.Font.GothamBold
CreditsText2.Text = "Quantum Hub Owner: xmijovanxmi"
CreditsText2.TextColor3 = Color3.fromRGB(0, 150, 255)
CreditsText2.TextSize = 13
CreditsText2.TextXAlignment = Enum.TextXAlignment.Left
RegisterElement(CreditsText2, "Text")

local Glow2 = Instance.new("UIStroke")
Glow2.Parent = CreditsText2
Glow2.Color = Color3.fromRGB(0, 150, 255)
Glow2.Thickness = 1
Glow2.Transparency = 0.2

task.spawn(function()
    for _, v in pairs(getconnections(game.Players.LocalPlayer.Idled)) do v:Disable() end
end)

end