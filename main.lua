--=====================================================
-- 🔑 GoScript Loader + 🌐 GoScript Finder AutoJoiner
-- All-in-one script with key system, full UI, toggles, logs
--=====================================================

-- // Loader Library (simplified)
local Loader = {}

function dragify(Frame)
    local UIS = game:GetService("UserInputService")
    local dragToggle, dragStart, startPos

    local function updateInput(input)
        local Delta = input.Position - dragStart
        local Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + Delta.X, startPos.Y.Scale, startPos.Y.Offset + Delta.Y)
        game:GetService("TweenService"):Create(Frame, TweenInfo.new(0.25), {Position = Position}):Play()
    end

    Frame.InputBegan:Connect(function(input)
        if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) and UIS:GetFocusedTextBox() == nil then
            dragToggle = true
            dragStart = input.Position
            startPos = Frame.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragToggle = false
                end
            end)
        end
    end)

    Frame.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            if dragToggle then
                updateInput(input)
            end
        end
    end)
end

function Loader:Create(info)
    local name = info.Name
    local image = info.ImageID
    local callback = info.Callback 

    if game.CoreGui:FindFirstChild(name) then
        game.CoreGui:FindFirstChild(name):Destroy()
    end

    local Login = Instance.new("ScreenGui")
    local Main = Instance.new("Frame")
    local UICorner = Instance.new("UICorner")
    local Title = Instance.new("TextLabel")
    local TextBox = Instance.new("TextBox")
    local Load = Instance.new("TextButton")
    local UICorner_3 = Instance.new("UICorner")

    Login.Name = name
    Login.Parent = game.CoreGui

    Main.Name = "Main"
    Main.Parent = Login
    Main.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    Main.Position = UDim2.new(0.35, 0, 0.35, 0)
    Main.Size = UDim2.new(0, 400, 0, 150)
    UICorner.Parent = Main

    Title.Name = "Title"
    Title.Parent = Main
    Title.BackgroundTransparency = 1
    Title.Position = UDim2.new(0, 10, 0, 10)
    Title.Size = UDim2.new(1, -20, 0, 30)
    Title.Font = Enum.Font.GothamBold
    Title.Text = name .. " Login"
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.TextSize = 18

    TextBox.Parent = Main
    TextBox.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    TextBox.Position = UDim2.new(0.1, 0, 0.4, 0)
    TextBox.Size = UDim2.new(0.8, 0, 0, 30)
    TextBox.Font = Enum.Font.Gotham
    TextBox.Text = ""
    TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    TextBox.TextSize = 14

    Load.Name = "Load"
    Load.Parent = Main
    Load.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    Load.Position = UDim2.new(0.25, 0, 0.75, 0)
    Load.Size = UDim2.new(0, 200, 0, 35)
    Load.Font = Enum.Font.GothamBold
    Load.Text = "Login"
    Load.TextColor3 = Color3.fromRGB(255, 255, 255)
    Load.TextSize = 16
    UICorner_3.CornerRadius = UDim.new(0, 4)
    UICorner_3.Parent = Load

    dragify(Main)

    Load.MouseButton1Click:Connect(function()
        task.spawn(callback, TextBox.Text)
    end)
end

function Loader:Delete(name)
    if game.CoreGui:FindFirstChild(name) then
        game.CoreGui:FindFirstChild(name):Destroy()
    end
end

--=====================================================
-- Loader Usage (GoScript key system)
--=====================================================
Loader:Create({
    Name = "GoScript",
    ImageID = "rbxassetid://14222444137",
    Callback = function(EnteredKey) 
        if EnteredKey == "Goscript" then
            print("✅ Whitelisted for GoScript")

            -----------------------------------------------------
            -- 🌐 GoScript Finder — AutoJoiner Full UI with Toggles
            -----------------------------------------------------

            repeat task.wait() until game:IsLoaded()

            local Settings = {
                WebSocketURL = "ws://127.0.0.1:51948",
                AutoJoinEnabled = true,
                Bypass10M = true
            }
            local AutoJoinSocket, Connected = nil, false

            -- UI Setup
            local ScreenGui = Instance.new("ScreenGui")
            ScreenGui.Name = "GoScriptFinderUI"
            ScreenGui.ResetOnSpawn = false
            ScreenGui.Parent = (gethui and gethui()) or game:GetService("CoreGui")

            local MainFrame = Instance.new("Frame")
            MainFrame.Size = UDim2.new(0, 620, 0, 520)
            MainFrame.Position = UDim2.new(0.5, -310, 0.5, -260)
            MainFrame.BackgroundColor3 = Color3.fromRGB(18, 18, 28)
            MainFrame.BorderSizePixel = 0
            MainFrame.Active = true
            MainFrame.Draggable = true
            MainFrame.Parent = ScreenGui
            Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 12)

            local TopBar = Instance.new("Frame")
            TopBar.Size = UDim2.new(1, 0, 0, 40)
            TopBar.BackgroundColor3 = Color3.fromRGB(40, 40, 60)
            TopBar.Parent = MainFrame
            Instance.new("UICorner", TopBar).CornerRadius = UDim.new(0, 12)

            local Title = Instance.new("TextLabel")
            Title.Size = UDim2.new(0.8, 0, 1, 0)
            Title.Position = UDim2.new(0, 10, 0, 0)
            Title.BackgroundTransparency = 1
            Title.Text = "🌐 GoScript Finder - AutoJoiner"
            Title.TextColor3 = Color3.fromRGB(255,255,255)
            Title.Font = Enum.Font.GothamBold
            Title.TextSize = 18
            Title.TextXAlignment = Enum.TextXAlignment.Left
            Title.Parent = TopBar

            local CloseBtn = Instance.new("TextButton")
            CloseBtn.Size = UDim2.new(0, 40, 0, 40)
            CloseBtn.Position = UDim2.new(1, -45, 0, 0)
            CloseBtn.BackgroundTransparency = 1
            CloseBtn.Text = "❌"
            CloseBtn.TextColor3 = Color3.fromRGB(255,80,80)
            CloseBtn.Font = Enum.Font.GothamBold
            CloseBtn.TextSize = 20
            CloseBtn.Parent = TopBar

            local MiniBtn = Instance.new("TextButton")
            MiniBtn.Size = UDim2.new(0, 200, 0, 40)
            MiniBtn.Position = UDim2.new(0.5, -100, 0.05, 0)
            MiniBtn.BackgroundColor3 = Color3.fromRGB(40,40,60)
            MiniBtn.Text = "🌐 GoScript Finder"
            MiniBtn.TextColor3 = Color3.fromRGB(255,255,255)
            MiniBtn.Font = Enum.Font.GothamBold
            MiniBtn.TextSize = 16
            MiniBtn.Visible = false
            MiniBtn.Parent = ScreenGui
            Instance.new("UICorner", MiniBtn).CornerRadius = UDim.new(0, 12)

            local Logs = Instance.new("ScrollingFrame")
            Logs.Size = UDim2.new(1, -20, 0.5, -60)
            Logs.Position = UDim2.new(0, 10, 0, 50)
            Logs.BackgroundColor3 = Color3.fromRGB(28,28,40)
            Logs.BorderSizePixel = 0
            Logs.CanvasSize = UDim2.new(0, 0, 0, 0)
            Logs.ScrollBarThickness = 6
            Logs.Parent = MainFrame
            Instance.new("UICorner", Logs).CornerRadius = UDim.new(0, 8)

            local function prints(str)
                local logCount = 0
                for _, child in pairs(Logs:GetChildren()) do
                    if child:IsA("TextLabel") then logCount += 1 end
                end
                local newLog = Instance.new("TextLabel")
                newLog.Size = UDim2.new(1, -10, 0, 20)
                newLog.Position = UDim2.new(0, 5, 0, logCount * 22)
                newLog.BackgroundTransparency = 1
                newLog.Text = str
                newLog.TextColor3 = Color3.fromRGB(255,255,255)
                newLog.Font = Enum.Font.Gotham
                newLog.TextSize = 14
                newLog.TextXAlignment = Enum.TextXAlignment.Left
                newLog.Parent = Logs
                Logs.CanvasSize = UDim2.new(0, 0, 0, (logCount + 1) * 22)
                print("[GoScript AutoJoiner]: "..tostring(str))
            end

            local function justJoin(script)
                local func, err = loadstring(script)
                if func then
                    local ok, result = pcall(func)
                    if not ok then
                        prints("Error executing script: " .. tostring(result))
                    end
                else
                    prints("Error loading script: " .. tostring(err))
                end
            end

            CloseBtn.MouseButton1Click:Connect(function()
                MainFrame.Visible = false
                MiniBtn.Visible = true
            end)
            MiniBtn.MouseButton1Click:Connect(function()
                MainFrame.Visible = true
                MiniBtn.Visible = false
            end)

            -- Toggles Section
            local ToggleFrame = Instance.new("Frame")
            ToggleFrame.Size = UDim2.new(1, -20, 0, 100)
            ToggleFrame.Position = UDim2.new(0, 10, 0.55, 0)
            ToggleFrame.BackgroundTransparency = 1
            ToggleFrame.Parent = MainFrame

            local AutoJoinToggle = Instance.new("TextButton")
            AutoJoinToggle.Size = UDim2.new(0.5, -5, 0, 40)
            AutoJoinToggle.Position = UDim2.new(0, 0, 0, 0)
            AutoJoinToggle.BackgroundColor3 = Color3.fromRGB(50, 50, 70)
            AutoJoinToggle.Text = "AutoJoin: ON"
            AutoJoinToggle.TextColor3 = Color3.fromRGB(100, 255, 100)
            AutoJoinToggle.Font = Enum.Font.GothamBold
            AutoJoinToggle.TextSize = 14
            AutoJoinToggle.Parent = ToggleFrame

            local BypassToggle = Instance.new("TextButton")
            BypassToggle.Size = UDim2.new(0.5, -5, 0, 40)
            BypassToggle.Position = UDim2.new(0.5, 5, 0, 0)
            BypassToggle.BackgroundColor3 = Color3.fromRGB(50, 50, 70)
            BypassToggle.Text = "Bypass10M: ON"
            BypassToggle.TextColor3 = Color3.fromRGB(100, 255, 100)
            BypassToggle.Font = Enum.Font.GothamBold
            BypassToggle.TextSize = 14
            BypassToggle.Parent = ToggleFrame

            AutoJoinToggle.MouseButton1Click:Connect(function()
                Settings.AutoJoinEnabled = not Settings.AutoJoinEnabled
                AutoJoinToggle.Text = "AutoJoin: " .. (Settings.AutoJoinEnabled and "ON" or "OFF")
                AutoJoinToggle.TextColor3 = Settings.AutoJoinEnabled and Color3.fromRGB(100,255,100) or Color3.fromRGB(255,100,100)
            end)

            BypassToggle.MouseButton1Click:Connect(function()
                Settings.Bypass10M = not Settings.Bypass10M
                BypassToggle.Text = "Bypass10M: " .. (Settings.Bypass10M and "ON" or "OFF")
                BypassToggle.TextColor3 = Settings.Bypass10M and Color3.fromRGB(100,255,100) or Color3.fromRGB(255,100,100)
            end)

            function connect()
                if Connected or not Settings.AutoJoinEnabled then return end
                prints("Connecting to "..Settings.WebSocketURL)
                local success, socket = pcall(WebSocket.connect, Settings.WebSocketURL)
                if success and socket then
                    prints("Connected to WebSocket")
                    Connected = true
                    AutoJoinSocket = socket
                    socket.OnMessage:Connect(function(msg)
                        prints("Received: "..msg)
                        justJoin(msg)
                    end)
                    socket.OnClose:Connect(function()
                        prints("WebSocket closed.")
                        Connected = false
                        AutoJoinSocket = nil
                        if Settings.AutoJoinEnabled then
                            task.wait(1)
                            connect()
                        end
                    end)
                else
                    prints("Failed to connect, retrying...")
                    task.wait(1)
                    if Settings.AutoJoinEnabled then
                        connect()
                    end
                end
            end

            connect()
        else
            print("❌ Invalid Key")
        end
        Loader:Delete("GoScript")
    end,
})
