--=====================================================
-- GoScript - Key System (from src (1).lua) + Main UI (from src.lua)
-- All in one. Names changed to "GoScript". Key required: "Goscript".
--=====================================================

repeat task.wait() until game and game:IsLoaded()

-- Libraries (embedded from your uploads)
--=== Begin: GoScript Loader (from src (1).lua, patched) ===
local Loader = (function()
local UIS = game:GetService("UserInputService")
-- // Usage

--[[

local Loader = loadstring(game:HttpGet("https://raw.githubusercontent.com/laagginq/ui-libraries/main/loader_library/src.lua"))()

Loader:Create({
    Name = "Evolution",
    ImageID = "rbxassetid://14222444137",
    SaveKey = true,
    Callback = function(EnteredKey) 
        if EnteredKey == "xzisthebest" then 
            print("Whitelisted")
        else
            print("Invalid Key")
        end
        Loader:Destroy("Evolution")
    end,
})

]]


-- // Loader Library

local Loader = {}

function dragify(Frame)
	dragToggle = nil
	local dragSpeed = 0
	dragInput = nil
	dragStart = nil
	local dragPos = nil
	function updateInput(input)
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
			dragInput = input
		end
	end)
	game:GetService("UserInputService").InputChanged:Connect(function(input)
		if input == dragInput and dragToggle then
			updateInput(input)
		end
	end)
end

function Loader:Create(info)
	local name = info.Name
	local image = info.ImageID
	local savekey = info.SaveKey
	local callback = info.Callback 
	
	if game.CoreGui:FindFirstChild(name) then
		game.CoreGui:FindFirstChild(name):Destroy()
	end
	
	if isfile and isfile(name..".key") then
		-- key file exists
	end
	-- // UI
	
	local Login = Instance.new("ScreenGui")
	local Main = Instance.new("Frame")
	local UICorner = Instance.new("UICorner")
	local UIGradient = Instance.new("UIGradient")
	local Image = Instance.new("ImageLabel")
	local Title = Instance.new("TextLabel")
	local AuthKey = Instance.new("Frame")
	local TextBox = Instance.new("TextBox")
	local Hidden = Instance.new("TextLabel")
	local UICorner_2 = Instance.new("UICorner")
	local ImageButton = Instance.new("ImageButton")
	local Load = Instance.new("TextButton")
	local UICorner_3 = Instance.new("UICorner")

	Login.Name = name
	Login.Parent = game.CoreGui
	Login.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

	Main.Name = "Main"
	Main.Parent = Login
	Main.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Main.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Main.BorderSizePixel = 0
	Main.Position = UDim2.new(0.320512831, 0, 0.360148519, 0)
	Main.Size = UDim2.new(0, 447, 0, 113)

	UICorner.Parent = Main

	UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(25, 25, 25)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(42, 42, 42))}
	UIGradient.Rotation = 90
	UIGradient.Parent = Main

	Image.Name = "Image"
	Image.Parent = Main
	Image.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Image.BackgroundTransparency = 1.000
	Image.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Image.BorderSizePixel = 0
	Image.Position = UDim2.new(0.0134228189, 0, 0.0240963846, 0)
	Image.Size = UDim2.new(0, 28, 0, 28)
	Image.Image = image

	Title.Name = "Title"
	Title.Parent = Main
	Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Title.BackgroundTransparency = 1.000
	Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Title.BorderSizePixel = 0
	Title.Position = UDim2.new(0.140939593, 0, 0.0240963846, 0)
	Title.Size = UDim2.new(0, 321, 0, 28)
	Title.Font = Enum.Font.Gotham
	Title.Text = name.." Login"
	Title.TextColor3 = Color3.fromRGB(255, 255, 255)
	Title.TextSize = 16.000

	AuthKey.Name = "AuthKey"
	AuthKey.Parent = Main
	AuthKey.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	AuthKey.BorderColor3 = Color3.fromRGB(0, 0, 0)
	AuthKey.BorderSizePixel = 0
	AuthKey.Position = UDim2.new(0.0850111842, 0, 0.332265407, 0)
	AuthKey.Size = UDim2.new(0, 371, 0, 25)

	TextBox.Parent = AuthKey
	TextBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TextBox.BackgroundTransparency = 1.000
	TextBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TextBox.BorderSizePixel = 0
	TextBox.Position = UDim2.new(0.086170949, 0, 0, 0)
	TextBox.Size = UDim2.new(0, 335, 0, 25)
	TextBox.Font = Enum.Font.Gotham
	TextBox.Text = ""
	TextBox.TextColor3 = Color3.fromRGB(25, 25, 25)
	TextBox.TextSize = 14.000
	TextBox.TextTransparency = 1.000
	TextBox.TextXAlignment = Enum.TextXAlignment.Left

	Hidden.Name = "Hidden"
	Hidden.Parent = TextBox
	Hidden.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Hidden.BackgroundTransparency = 1.000
	Hidden.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Hidden.BorderSizePixel = 0
	Hidden.Position = UDim2.new(-0.00588788232, 0, 0, 0)
	Hidden.Size = UDim2.new(0, 337, 0, 25)
	Hidden.Font = Enum.Font.Gotham
	Hidden.Text = "Key"
	Hidden.TextColor3 = Color3.fromRGB(255, 255, 255)
	Hidden.TextSize = 14.000
	Hidden.TextXAlignment = Enum.TextXAlignment.Left

	UICorner_2.CornerRadius = UDim.new(0, 4)
	UICorner_2.Parent = AuthKey

	ImageButton.Parent = AuthKey
	ImageButton.AnchorPoint = Vector2.new(0.5, 0.5)
	ImageButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ImageButton.BackgroundTransparency = 1.000
	ImageButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ImageButton.BorderSizePixel = 0
	ImageButton.Position = UDim2.new(0.0404312685, 0, 0.479999989, 0)
	ImageButton.Size = UDim2.new(0, 15, 0, 15)
	ImageButton.Image = "rbxassetid://10723416652"

	Load.Name = "Load"
	Load.Parent = Main
	Load.BackgroundColor3 = Color3.fromRGB(31, 31, 31)
	Load.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Load.BorderSizePixel = 0
	Load.Position = UDim2.new(0.275167793, 0, 0.610854983, 0)
	Load.Size = UDim2.new(0, 200, 0, 34)
	Load.Font = Enum.Font.Gotham
	Load.Text = "Login"
	Load.TextColor3 = Color3.fromRGB(255, 255, 255)
	Load.TextSize = 14.000

	UICorner_3.CornerRadius = UDim.new(0, 4)
	UICorner_3.Parent = Load

	TextBox:GetPropertyChangedSignal("Text"):Connect(function()
		Hidden.Text = string.rep('•', #TextBox.Text)
	end)
	
	
	Load.MouseButton1Click:Connect(function()
		if savekey then
			writefile(name..".key",TextBox.Text)
		end
		task.spawn(callback,TextBox.Text)
	end)
	
	if savekey then
		TextBox.Text = readfile(name..".key")
	end

	dragify(Main)
	
end

function Loader:Delete(name)
	if game.CoreGui:FindFirstChild(name) then
		game.CoreGui:FindFirstChild(name):Destroy()
	else
		error("[Loader]: Could not be found.")
	end
end

return Loader

end)()
--=== End: GoScript Loader ===

--=== Begin: GoScript UI (from src.lua) ===
local GoUI = (function()
local Fun = {}

local input = game:GetService("UserInputService")
local run = game:GetService("RunService")
local tween = game:GetService("TweenService")
local tweeninfo = TweenInfo.new



function Fun:DraggingEnabled(frame, parent)
	
    parent = parent or frame
    
    -- stolen from wally or kiriot, kek
    local dragging = false
    local dragInput, mousePos, framePos

    frame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            mousePos = input.Position
            framePos = parent.Position
            
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    frame.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            dragInput = input
        end
    end)

    input.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            local delta = input.Position - mousePos
            parent.Position  = UDim2.new(framePos.X.Scale, framePos.X.Offset + delta.X, framePos.Y.Scale, framePos.Y.Offset + delta.Y)
        end
    end)
end


function Fun.Create(title)
    local nightmarefun = Instance.new("ScreenGui")
    local Shadow = Instance.new("ImageLabel")
    local mainFrame = Instance.new("Frame")
    local mainCorner = Instance.new("UICorner")
    local mainSide = Instance.new("Frame")
    local UICorner = Instance.new("UICorner")
    local nightmares = Instance.new("TextLabel")
    local fun = Instance.new("TextLabel")
    local cover = Instance.new("Frame")
    local allTabs = Instance.new("Frame")
    local tabList = Instance.new("UIListLayout")
    local allPages = Instance.new("Frame")
    local pages = Instance.new("Folder")

    Fun:DraggingEnabled(mainFrame, Shadow)
    nightmarefun.Name = "nightmarefun"
    nightmarefun.Parent = game.CoreGui
    nightmarefun.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    nightmarefun.ResetOnSpawn = false

    Shadow.Name = "Shadow"
    Shadow.Parent = nightmarefun
    Shadow.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Shadow.BackgroundTransparency = 1.000
    Shadow.Position = UDim2.new(0.349795759, 0, 0.171759665, 0)
    Shadow.Size = UDim2.new(0, 525, 0, 468)
    Shadow.Image = "http://www.roblox.com/asset/?id=6105530152"
    Shadow.ImageColor3 = Color3.fromRGB(18, 18, 18)

    mainFrame.Name = "mainFrame"
    mainFrame.Parent = Shadow
    mainFrame.BackgroundColor3 = Color3.fromRGB(47, 47, 56)
    mainFrame.Position = UDim2.new(0.0500000007, 0, 0.0780000016, 0)
    mainFrame.Size = UDim2.new(0, 475, 0, 396)

    mainCorner.CornerRadius = UDim.new(0, 6)
    mainCorner.Name = "mainCorner"
    mainCorner.Parent = mainFrame

    mainSide.Name = "mainSide"
    mainSide.Parent = mainFrame
    mainSide.BackgroundColor3 = Color3.fromRGB(37, 37, 44)
    mainSide.Size = UDim2.new(0, 166, 0, 396)

    UICorner.CornerRadius = UDim.new(0, 6)
    UICorner.Parent = mainSide


    game:GetService("UserInputService").InputBegan:connect(function(current) 
            if current.KeyCode.Name == Enum.KeyCode.LeftAlt.Name then 
                if nightmarefun.Enabled == true then
                    nightmarefun.Enabled = false
                else
                    nightmarefun.Enabled = true
                end
            end
    end)

    nightmares.Name = "nightmares"
    nightmares.Parent = mainSide
    nightmares.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    nightmares.BackgroundTransparency = 1.000
    nightmares.Position = UDim2.new(0.0499999262, 0, 0.0228203665, 0)
    nightmares.Size = UDim2.new(0, 103, 0, 28)
    nightmares.TextXAlignment = Enum.TextXAlignment.Left
    nightmares.Font = Enum.Font.Gotham
    nightmares.Text = " "..title
    nightmares.TextColor3 = Color3.fromRGB(92, 53, 93)
    nightmares.TextSize = 20.000
    nightmares.TextWrapped = true

    fun.Name = "fun"
    fun.Parent = mainSide
    fun.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    fun.BackgroundTransparency = 1.000
    fun.Position = UDim2.new(0.622289062, 0, 0.0228203665, 0)
    fun.Size = UDim2.new(0, 54, 0, 27)
    fun.Font = Enum.Font.Gotham
    fun.Text = ""
    fun.TextColor3 = Color3.fromRGB(255, 255, 255)
    fun.TextSize = 20.000
    fun.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
    fun.TextWrapped = true

    cover.Name = "cover"
    cover.Parent = mainSide
    cover.BackgroundColor3 = Color3.fromRGB(37, 37, 44)
    cover.BorderSizePixel = 0
    cover.Position = UDim2.new(0.949999988, 0, 0, 0)
    cover.Size = UDim2.new(0, 9, 0, 396)

    allTabs.Name = "allTabs"
    allTabs.Parent = mainSide
    allTabs.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    allTabs.BackgroundTransparency = 1.000
    allTabs.Position = UDim2.new(0.0499999262, 0, 0.108294941, 0)
    allTabs.Size = UDim2.new(0, 149, 0, 344)

    tabList.Name = "tabList"
    tabList.Parent = allTabs
    tabList.SortOrder = Enum.SortOrder.LayoutOrder

    allPages.Name = "allPages"
    allPages.Parent = mainFrame
    allPages.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    allPages.BackgroundTransparency = 1.000
    allPages.Position = UDim2.new(0.366315782, 0, 0.017676767, 0)
    allPages.Size = UDim2.new(0, 295, 0, 381)

    pages.Name = "pages"
    pages.Parent = allPages

    local tabHandling = {}

    function tabHandling:Tab(tabText)
        --------------------------
        tabText = tabText or "Tab"
        --------------------------
        local tabButton = Instance.new("TextButton")
        tabButton.Name = "tabButton"..tabText
        tabButton.Parent = allTabs
        tabButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        tabButton.BackgroundTransparency = 1.000
        tabButton.Size = UDim2.new(0, 149, 0, 35)
        tabButton.Font = Enum.Font.Gotham
        tabButton.Text = tabText
        tabButton.TextColor3 = Color3.fromRGB(87, 87, 104)
        tabButton.TextSize = 16.000

        local newPage = Instance.new("ScrollingFrame")
        newPage.Name = "newPage"..tabText
        newPage.Parent = pages
        newPage.Active = true
        newPage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        newPage.BackgroundTransparency = 1.000
        newPage.BorderSizePixel = 0
        newPage.Size = UDim2.new(1, 0, 1, 0)
        newPage.ScrollBarThickness = 6
        newPage.ScrollBarImageColor3 = Color3.fromRGB(127, 97, 145)
        newPage.Visible = false

        local sectionListing = Instance.new("UIListLayout")    
        sectionListing.Name = "sectionListing"
        sectionListing.Parent = newPage
        sectionListing.SortOrder = Enum.SortOrder.LayoutOrder
        sectionListing.Padding = UDim.new(0, 3)

                
        local function UpdateSize()
            local cS = sectionListing.AbsoluteContentSize

            game.TweenService:Create(newPage, TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                CanvasSize = UDim2.new(0,cS.X,0,cS.Y)
            }):Play()
        end
        UpdateSize()
        newPage.ChildAdded:Connect(UpdateSize)
        newPage.ChildRemoved:Connect(UpdateSize)

        tabButton.MouseButton1Click:Connect(function()
            --Tab Button Functioning
            UpdateSize()
            for i,v in next, allTabs:GetChildren() do
                if v:IsA("TextButton") then
                    game.TweenService:Create(v, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
                        TextColor3 = Color3.fromRGB(87, 87, 104)
                    }):Play()
                    UpdateSize()
                end
            end
            game.TweenService:Create(tabButton, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
                TextColor3 = Color3.fromRGB(127, 97, 145)
            }):Play()
            ----------------------
            --Page Functioning
            for i,v in next, pages:GetChildren() do
                v.Visible = false
                UpdateSize()
            end
            newPage.Visible = true
            ----------------------
        end)

        local sectionHandling = {}

        function sectionHandling:Section(sectionName)
            ---
            sectionName = sectionName or "Section"
            ---
            local sectionFrame = Instance.new("Frame")
            local UICorner = Instance.new("UICorner")
            local sectionListLayout = Instance.new("UIListLayout")
            local sectionFrameHead = Instance.new("Frame")
            local UICorner_2 = Instance.new("UICorner")
            local sectionCircle = Instance.new("Frame")
            local UICorner_3 = Instance.new("UICorner")
            local TextLabel = Instance.new("TextLabel")
            local closeSection = Instance.new("ImageButton")

            sectionFrame.Name = "sectionFrame"
            sectionFrame.Parent = newPage
            sectionFrame.BackgroundColor3 = Color3.fromRGB(37, 37, 44)
            sectionFrame.Position = UDim2.new(0, 0, -8.009863e-08, 0)
            sectionFrame.Size = UDim2.new(0.9559322, 0, 0, 36)
            sectionFrame.ClipsDescendants = true

            UICorner.Parent = sectionFrame

            sectionListLayout.Parent = sectionFrame
            sectionListLayout.SortOrder = Enum.SortOrder.LayoutOrder
            sectionListLayout.Padding = UDim.new(0, 3)
            sectionListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center

            sectionFrameHead.Name = "sectionFrameHead"
            sectionFrameHead.Parent = sectionFrame
            sectionFrameHead.BackgroundColor3 = Color3.fromRGB(37, 37, 44)
            sectionFrameHead.Position = UDim2.new(0, 0, -8.009863e-08, 0)
            sectionFrameHead.Size = UDim2.new(1, 0, 0, 36)

            UICorner_2.Parent = sectionFrameHead

            sectionCircle.Name = "sectionCircle"
            sectionCircle.Parent = sectionFrameHead
            sectionCircle.BackgroundColor3 = Color3.fromRGB(82, 82, 98)
            sectionCircle.Position = UDim2.new(0.0354609936, 0, 0.388888896, 0)
            sectionCircle.Size = UDim2.new(0, 7, 0, 7)

            UICorner_3.CornerRadius = UDim.new(0, 99)
            UICorner_3.Parent = sectionCircle

            TextLabel.Parent = sectionFrameHead
            TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            TextLabel.BackgroundTransparency = 1.000
            TextLabel.Position = UDim2.new(0.0992907807, 0, 0.194444448, 0)
            TextLabel.Size = UDim2.new(0, 173, 0, 22)
            TextLabel.Font = Enum.Font.Gotham
            TextLabel.Text = sectionName
            TextLabel.TextColor3 = Color3.fromRGB(82, 82, 98)
            TextLabel.TextSize = 14.000
            TextLabel.TextXAlignment = Enum.TextXAlignment.Left

            

            closeSection.Name = "closeSection"
            closeSection.Parent = sectionFrameHead
            closeSection.BackgroundTransparency = 1.000
            closeSection.Position = UDim2.new(0.889999986, 0, 0.155000001, 0)
            closeSection.Size = UDim2.new(0, 25, 0, 25)
            closeSection.ZIndex = 2
            closeSection.Image = "rbxassetid://3926305904"
            closeSection.ImageColor3 = Color3.fromRGB(82, 82, 98)
            closeSection.ImageRectOffset = Vector2.new(404, 284)
            closeSection.ImageRectSize = Vector2.new(36, 36)
            closeSection.MouseButton1Click:Connect(function()
                if isDropped then
                    isDropped = false
                    sectionFrame:TweenSize(UDim2.new(0.956, 0,0, 36), "In", "Linear", 0.10)
                    game.TweenService:Create(closeSection, TweenInfo.new(0.10, Enum.EasingStyle.Quad, Enum.EasingDirection.In),{
                        Rotation = 0,
                        ImageColor3 = Color3.fromRGB(82, 82, 98)
                    }):Play()
                    game.TweenService:Create(sectionCircle, TweenInfo.new(0.10, Enum.EasingStyle.Quad, Enum.EasingDirection.In),{
                        BackgroundColor3 = Color3.fromRGB(82, 82, 98)
                    }):Play()
                    game.TweenService:Create(TextLabel, TweenInfo.new(0.10, Enum.EasingStyle.Quad, Enum.EasingDirection.In),{
                        TextColor3 = Color3.fromRGB(82, 82, 98)
                    }):Play()
                    wait(0.10)
                    UpdateSize()
                else
                    isDropped = true
                    sectionFrame:TweenSize(UDim2.new(0.956,0, 0, sectionListLayout.AbsoluteContentSize.Y + 8), "In", "Linear", 0.10)
                    game.TweenService:Create(closeSection, TweenInfo.new(0.10, Enum.EasingStyle.Quad, Enum.EasingDirection.In),{
                        Rotation = 180,
                        ImageColor3 = Color3.fromRGB(127, 97, 145)
                    }):Play()
                    game.TweenService:Create(sectionCircle, TweenInfo.new(0.10, Enum.EasingStyle.Quad, Enum.EasingDirection.In),{
                        BackgroundColor3 = Color3.fromRGB(127, 97, 145)
                    }):Play()
                    game.TweenService:Create(TextLabel, TweenInfo.new(0.10, Enum.EasingStyle.Quad, Enum.EasingDirection.In),{
                        TextColor3 = Color3.fromRGB(127, 97, 145)
                    }):Play()
                    wait(0.10)
                    UpdateSize()
                end
            end)

            local itemHandling = {}

            function itemHandling:Button(btnText, callback)
                ----
                btnText = btnText or "Click Me!"
                callback = callback or function() end
                ----

                local buttonFrame = Instance.new("Frame")
                local UIListLayout = Instance.new("UIListLayout")
                local TextButton = Instance.new("TextButton")
                local UICorner = Instance.new("UICorner")

                buttonFrame.Name = "buttonFrame"
                buttonFrame.Parent = sectionFrame
                buttonFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                buttonFrame.BackgroundTransparency = 1.000
                buttonFrame.Position = UDim2.new(0.0354609936, 0, 0.168103442, 0)
                buttonFrame.Size = UDim2.new(0, 262, 0, 31)

                UIListLayout.Parent = buttonFrame
                UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
                UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
                UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center

                TextButton.Parent = buttonFrame
                TextButton.BackgroundColor3 = Color3.fromRGB(127, 97, 145)
                TextButton.Position = UDim2.new(0.118320614, 0, -0.0813953504, 0)
                TextButton.Size = UDim2.new(0, 262,0, 31)
                TextButton.AutoButtonColor = false
                TextButton.Font = Enum.Font.Gotham
                TextButton.Text = btnText
                TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
                TextButton.TextSize = 14.000

                UICorner.CornerRadius = UDim.new(0, 5)
                UICorner.Parent = TextButton

                local clickDebounce = false
                local callBackDebounce = false
                local mouseleft

                TextButton.MouseButton1Down:Connect(function()
                    if not clickDebounce then
                        clickDebounce = true
                        game.TweenService:Create(TextButton, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut),{
                            Size = UDim2.new(0, 251,0, 28),
                            TextSize = 13
                        }):Play()
                        wait(0.5)
                        clickDebounce = false
                    end
                end)

                TextButton.MouseButton1Click:Connect(function()
                    if not callBackDebounce then
                        callBackDebounce = true	
                        callback()
                        wait(0.5)
                        callBackDebounce = false
                    end
                end)

                TextButton.MouseButton1Up:Connect(function()
                    if mouseleft then
                        game.TweenService:Create(TextButton, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut),{
                            Size = UDim2.new(0, 262,0, 31),
                            TextSize = 14
                        }):Play()
                    else
                        game.TweenService:Create(TextButton, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut),{
                            Size = UDim2.new(0, 262,0, 31),
                            TextSize = 14
                        }):Play()
                    end
                end)
                TextButton.MouseEnter:Connect(function()
                    if callBackDebounce then
                        mouseleft = false
                        game.TweenService:Create(TextButton, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut),{
                            BackgroundColor3 = Color3.fromRGB(73, 56, 84)
                        }):Play()
                    else
                        mouseleft = false
                        game.TweenService:Create(TextButton, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut),{
                            BackgroundColor3 = Color3.fromRGB(98, 75, 113)
                        }):Play()
                    end
                end)
                TextButton.MouseLeave:Connect(function()
                    if callBackDebounce then
                        mouseleft = true
                        game.TweenService:Create(TextButton, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut),{
                            Size = UDim2.new(0, 262,0, 31),
                            TextSize = 14
                        }):Play()
                        game.TweenService:Create(TextButton, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut),{
                            BackgroundColor3 = Color3.fromRGB(127, 97, 145)
                        }):Play()
                    else
                        mouseleft = true
                        game.TweenService:Create(TextButton, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut),{
                            Size = UDim2.new(0, 262,0, 31),
                            TextSize = 14
                        }):Play()
                        game.TweenService:Create(TextButton, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut),{
                            BackgroundColor3 = Color3.fromRGB(127, 97, 145)
                        }):Play()
                    end
                end)
            end
            function itemHandling:Toggle(togInfo, callback)
                local tog = false
                togInfo = togInfo or "Toggle"
                callback = callback or function() end
                local toggleFrame = Instance.new("Frame")
                local checkBox = Instance.new("ImageButton")
                local UIListLayout = Instance.new("UIListLayout")
                local checkBoxInfo = Instance.new("TextLabel")

                toggleFrame.Name = "toggleFrame"
                toggleFrame.Parent = sectionFrame
                toggleFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                toggleFrame.BackgroundTransparency = 1.000
                toggleFrame.Position = UDim2.new(0.0354609936, 0, 0.344827592, 0)
                toggleFrame.Size = UDim2.new(0, 262, 0, 25)

                checkBox.Name = "checkBox"
                checkBox.Parent = toggleFrame
                checkBox.BackgroundColor3 = Color3.fromRGB(47, 47, 56)
                checkBox.BackgroundTransparency = 1.000
                checkBox.Position = UDim2.new(-0.0381679386, 0, 0.0263157934, 0)
                checkBox.Size = UDim2.new(0, 25, 0, 25)
                checkBox.ZIndex = 2
                checkBox.Image = "rbxassetid://3926311105"
                checkBox.ImageColor3 = Color3.fromRGB(62, 62, 74)
                checkBox.ImageRectOffset = Vector2.new(940, 784)
                checkBox.ImageRectSize = Vector2.new(48, 48)

                UIListLayout.Parent = toggleFrame
                UIListLayout.FillDirection = Enum.FillDirection.Horizontal
                UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
                UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
                UIListLayout.Padding = UDim.new(0, 3)

                checkBoxInfo.Name = "checkBoxInfo"
                checkBoxInfo.Parent = toggleFrame
                checkBoxInfo.BackgroundColor3 = Color3.fromRGB(47, 47, 56)
                checkBoxInfo.BackgroundTransparency = 1.000
                checkBoxInfo.Position = UDim2.new(0.106870227, 0, -0.157894731, 0)
                checkBoxInfo.Size = UDim2.new(0, 200, 0, 19)
                checkBoxInfo.Font = Enum.Font.Gotham
                checkBoxInfo.Text = togInfo
                checkBoxInfo.TextColor3 = Color3.fromRGB(62, 62, 74)
                checkBoxInfo.TextSize = 14.000
                checkBoxInfo.TextXAlignment = Enum.TextXAlignment.Left
                local clickDe = false
                local hoverDe = false

                checkBox.MouseEnter:Connect(function()
                    if not tog then
                        game.TweenService:Create(checkBox, TweenInfo.new(0.08, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
                            ImageColor3 = Color3.fromRGB(53, 53, 63)
                        }):Play()
                    else
                        game.TweenService:Create(checkBox, TweenInfo.new(0.08, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
                            ImageColor3 = Color3.fromRGB(89, 68, 102)
                        }):Play()
                    end
                end)

                checkBox.MouseLeave:Connect(function()
                    if not tog then
                        checkBox.Parent:TweenSize(UDim2.new(0, 262,0, 25), "InOut", "Linear", 0.08)
                        game.TweenService:Create(checkBox, TweenInfo.new(0.08, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
                            ImageColor3 = Color3.fromRGB(62, 62, 74)
                        }):Play()
                    else
                        checkBox.Parent:TweenSize(UDim2.new(0, 262,0, 25), "InOut", "Linear", 0.08)
                        game.TweenService:Create(checkBox, TweenInfo.new(0.08, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
                            ImageColor3 = Color3.fromRGB(127, 97, 145)
                        }):Play()
                    end
                end)

                checkBox.MouseButton1Down:Connect(function()
                    if not hoverDe then
                        hoverDe = true
                        checkBox.Parent:TweenSize(UDim2.new(0, 255,0, 25), "InOut", "Linear", 0.08)
                        wait(0.8)
                        hoverDe = false
                    end
                end)
                checkBox.MouseButton1Up:Connect(function()
                    checkBox.Parent:TweenSize(UDim2.new(0, 262,0, 25), "InOut", "Linear", 0.08)
                end)

                checkBox.MouseButton1Click:Connect(function()
                    if not clickDe then
                        clickDe = true
                        tog = not tog
                        callback(tog)
                        if tog then
                            game.TweenService:Create(checkBox.Parent.checkBoxInfo, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
                                TextColor3 = Color3.fromRGB(127, 97, 145)
                            }):Play()
                            checkBox.ImageRectOffset = Vector2.new(4, 836)
                            game.TweenService:Create(checkBox, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
                                ImageColor3 = Color3.fromRGB(127, 97, 145)
                            }):Play()
                        else
                            game.TweenService:Create(checkBox.Parent.checkBoxInfo, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
                                TextColor3 = Color3.fromRGB(62, 62, 74)
                            }):Play()
                            checkBox.ImageRectOffset = Vector2.new(940, 784)
                            game.TweenService:Create(checkBox, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
                                ImageColor3 = Color3.fromRGB(62, 62, 74)
                            }):Play()
                        end
                        wait(0.8)
                        clickDe = false
                    end
                end)
            end
                function itemHandling:TextBox(textInfo, callback)
                    textInfo = textInfo or "Type here"
                    callback = callback or function() end

                    local textBoxFrame = Instance.new("Frame")
                    local UIListLayout = Instance.new("UIListLayout")
                    local TextBox = Instance.new("TextBox")
                    local UICorner = Instance.new("UICorner")

                    textBoxFrame.Name = "textBoxFrame"
                    textBoxFrame.Parent = sectionFrame
                    textBoxFrame.BackgroundColor3 = Color3.fromRGB(43, 43, 52)
                    textBoxFrame.BackgroundTransparency = 1.000
                    textBoxFrame.Position = UDim2.new(0.0354609936, 0, 0.344827592, 0)
                    textBoxFrame.Size = UDim2.new(0, 262, 0, 28)

                    UIListLayout.Parent = textBoxFrame
                    UIListLayout.FillDirection = Enum.FillDirection.Horizontal
                    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
                    UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
                    UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
                    UIListLayout.Padding = UDim.new(0, 3)

                    TextBox.Parent = textBoxFrame
                    TextBox.BackgroundColor3 = Color3.fromRGB(43, 43, 52)
                    TextBox.Position = UDim2.new(0, 0, 0.106060609, 0)
                    TextBox.Size = UDim2.new(0, 262, 0, 26)
                    TextBox.ClearTextOnFocus = false
                    TextBox.Font = Enum.Font.SourceSans
                    TextBox.PlaceholderText = textInfo
                    TextBox.Text = ""
                    TextBox.TextColor3 = Color3.fromRGB(127, 97, 145)
                    TextBox.TextSize = 16.000
                    TextBox.TextWrapped = true

                    UICorner.CornerRadius = UDim.new(0, 5)
                    UICorner.Parent = TextBox

                    function anim(property)
                        if property == "Text" then
                            TextBox:TweenSize(UDim2.new(0, 250,0, 22), "InOut", "Linear", 0.1, true)
                            wait(0.18)
                            TextBox:TweenSize(UDim2.new(0, 262,0, 26), "InOut", "Linear", 0.1, true)
                        end
                    end
                    TextBox.Changed:Connect(anim)

                    TextBox.FocusLost:Connect(function(EnterPressed)
                        if not EnterPressed then return end
                        callback(TextBox.Text)
                        TextBox:TweenSize(UDim2.new(0, 250,0, 22), "InOut", "Linear", 0.1, true)
                        wait(0.18)
                        TextBox:TweenSize(UDim2.new(0, 262,0, 26), "InOut", "Linear", 0.1, true)
                        TextBox.Text = ""  
                    end)
                end

                function itemHandling:Slider(sliderInf, maxvalue, minvalue, callback)

                    local sliderfunc = {}


                    local sliderFrame = Instance.new("Frame")
                    local sliderIinfo = Instance.new("TextLabel")
                    local sliderBtn = Instance.new("TextButton")
                    local UIListLayout = Instance.new("UIListLayout")
                    local SliderDrag = Instance.new("Frame")
                    local UICorner = Instance.new("UICorner")
                    local UICorner_1 = Instance.new("UICorner")
                    local sliderBox = Instance.new("TextBox")
                    sliderInf = sliderInf or "Slider"
                    minvalue = minvalue or 0
                    maxvalue = maxvalue or 500

                    sliderFrame.Name = "sliderFrame"
                    sliderFrame.Parent = sectionFrame
                    sliderFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    sliderFrame.BackgroundTransparency = 1.000
                    sliderFrame.Position = UDim2.new(0.0354609936, 0, 0.658653855, 0)
                    sliderFrame.Size = UDim2.new(0, 262, 0, 32)

                    sliderIinfo.Name = "sliderIinfo"
                    sliderIinfo.Parent = sliderFrame
                    sliderIinfo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    sliderIinfo.BackgroundTransparency = 1.000
                    sliderIinfo.Position = UDim2.new(0, 0, -0.0102040814, 0)
                    sliderIinfo.Size = UDim2.new(0, 169, 0, 18)
                    sliderIinfo.Font = Enum.Font.Gotham
                    sliderIinfo.Text = sliderInf
                    sliderIinfo.TextColor3 = Color3.fromRGB(127, 97, 145)
                    sliderIinfo.TextSize = 14.000
                    sliderIinfo.TextXAlignment = Enum.TextXAlignment.Left

                    sliderBtn.Name = "sliderBtn"
                    sliderBtn.Parent = sliderFrame
                    sliderBtn.BackgroundColor3 = Color3.fromRGB(47, 47, 56)
                    sliderBtn.BorderSizePixel = 0
                    sliderBtn.Position = UDim2.new(0, 0, 0.616923094, 0)
                    sliderBtn.Size = UDim2.new(0, 262, 0, 9)
                    sliderBtn.AutoButtonColor = false
                    sliderBtn.Font = Enum.Font.SourceSans
                    sliderBtn.Text = ""
                    sliderBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
                    sliderBtn.TextSize = 14.000
                    sliderBtn.ClipsDescendants = true

                    UIListLayout.Parent = sliderBtn
                    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
                    UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center

                    SliderDrag.Name = "SliderDrag"
                    SliderDrag.Parent = sliderBtn
                    SliderDrag.BackgroundColor3 = Color3.fromRGB(127, 97, 145)
                    SliderDrag.BorderColor3 = Color3.fromRGB(127, 97, 145)
                    SliderDrag.BorderSizePixel = 0
                    SliderDrag.Size = UDim2.new(0, 0, 0, 9)

                    UICorner.CornerRadius = UDim.new(0, 99)
                    UICorner.Parent = SliderDrag

                    UICorner_1.CornerRadius = UDim.new(0, 99)
                    UICorner_1.Parent = sliderBtn

                    sliderBox.Name = "sliderBox"
                    sliderBox.Parent = sliderFrame
                    sliderBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    sliderBox.BackgroundTransparency = 1.000
                    sliderBox.Position = UDim2.new(0.645038188, 0, 0.0769230798, 0)
                    sliderBox.Size = UDim2.new(0, 92, 0, 14)
                    sliderBox.ClearTextOnFocus = false
                    sliderBox.Font = Enum.Font.Gotham
                    sliderBox.Text = minvalue
                    sliderBox.TextColor3 = Color3.fromRGB(96, 96, 115)
                    sliderBox.TextScaled = true
                    sliderBox.TextSize = 14.000
                    sliderBox.TextWrapped = true
                    sliderBox.TextXAlignment = Enum.TextXAlignment.Right
                    sliderBox.TextEditable = true
                    
                    local mouse = game.Players.LocalPlayer:GetMouse()
                    local uis = game:GetService("UserInputService")
                    local Value;
                    sliderBtn.MouseButton1Down:Connect(function()
                        Value = math.floor((((tonumber(maxvalue) - tonumber(minvalue)) / 262) * SliderDrag.AbsoluteSize.X) + tonumber(minvalue)) or 0
                        pcall(function()
                            callback(Value)
                        end)
                        SliderDrag:TweenSize(UDim2.new(0, math.clamp(mouse.X - SliderDrag.AbsolutePosition.X, 0, 262), 0, 9), "InOut", "Linear", 0.05, true)
                        moveconnection = mouse.Move:Connect(function()
                            sliderBox.Text = Value
                            Value = math.floor((((tonumber(maxvalue) - tonumber(minvalue)) / 262) * SliderDrag.AbsoluteSize.X) + tonumber(minvalue))
                            pcall(function()
                                callback(Value)
                            end)
                            SliderDrag:TweenSize(UDim2.new(0, math.clamp(mouse.X - SliderDrag.AbsolutePosition.X, 0, 262), 0, 9), "InOut", "Linear", 0.05, true)
                        end)
                        releaseconnection = uis.InputEnded:Connect(function(Mouse)
                            if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then
                                Value = math.floor((((tonumber(maxvalue) - tonumber(minvalue)) / 262) * SliderDrag.AbsoluteSize.X) + tonumber(minvalue))
                                pcall(function()
                                    callback(Value)
                                end)
                                sliderBox.Text = Value
                                SliderDrag:TweenSize(UDim2.new(0, math.clamp(mouse.X - SliderDrag.AbsolutePosition.X, 0, 262), 0, 9), "InOut", "Linear", 0.05, true)
                                moveconnection:Disconnect()
                                releaseconnection:Disconnect()
                            end
                        end)
                    end)

                    function set(property)
                        if property == "Text" then
                            if tonumber(sliderBox.Text) then 
                                if tonumber(sliderBox.Text) <= maxvalue then
                                    Value = sliderBox.Text
                                    SliderDrag:TweenSize(UDim2.new(((tonumber(sliderBox.Text) or minvalue) - minvalue) / (maxvalue - minvalue), 0, 0, 9), "InOut", "Linear", 0.05, true)
                                    pcall(function()
                                        callback(Value)
                                    end)
                                end
                                if tonumber(sliderBox.Text) > maxvalue then
                                    sliderBox.Text = maxvalue
                                    Value = maxvalue
                                    SliderDrag:TweenSize(UDim2.new(((maxvalue or minvalue) - minvalue) / (maxvalue - minvalue), 0, 0, 9), "InOut", "Linear", 0.05, true)
                                    pcall(function()
                                        callback(Value)
                                    end)
                                end
                                if tonumber(sliderBox.Text) >= minvalue then
                                    Value = sliderBox.Text
                                    SliderDrag:TweenSize(UDim2.new(((tonumber(sliderBox.Text) or minvalue) - minvalue) / (maxvalue - minvalue), 0, 0, 9), "InOut", "Linear", 0.05, true)
                                    pcall(function()
                                        callback(Value)
                                    end)
                                end
                                if tonumber(sliderBox.Text) < minvalue then
                                    Value = minvalue
                                    SliderDrag.Size = UDim2.new(((minvalue or minvalue) - minvalue) / (maxvalue - minvalue), 0, 0, 9)
                                    pcall(function()
                                        callback(Value)
                                    end)
                                end
                            else
                                sliderBox.Text = ""
                            end
                        end
                    end

                    sliderBox.Focused:Connect(function()
                        sliderBox.Changed:Connect(set)
                    end)
                    sliderBox.FocusLost:Connect(function(enterP)
                        if not enterP then
                            if sliderBox.Text == "" then
                                sliderBox.Text = minvalue
                                Value = minvalue
                                SliderDrag:TweenSize(UDim2.new(((minvalue) - minvalue) / (maxvalue - minvalue), 0, 0, 9), "InOut", "Linear", 0.05, true)
                                pcall(function()
                                    callback(Value)
                                end)
                            end
                            if tonumber(sliderBox.Text) > tonumber(maxvalue) then
                                Value = maxvalue
                                sliderBox.Text = maxvalue
                                SliderDrag:TweenSize(UDim2.new(((maxvalue or minvalue) - minvalue) / (maxvalue - minvalue), 0, 0, 9), "InOut", "Linear", 0.05, true)
                                pcall(function()
                                    callback(Value)
                                end)
                            else
                                Value = tonumber(sliderBox.Text)
                            end
                            if tonumber(sliderBox.Text) < minvalue then
                                sliderBox.Text = minvalue
                                Value = minvalue
                                SliderDrag:TweenSize(UDim2.new(((minvalue) - minvalue) / (maxvalue - minvalue), 0, 0, 9), "InOut", "Linear", 0.05, true)
                                pcall(function()
                                    callback(Value)
                                end)
                            else
                                Value = tonumber(sliderBox.Text)
                            end
                        end
                        if tonumber(sliderBox.Text) > maxvalue then
                            sliderBox.Text = maxvalue
                            Value = maxvalue
                            SliderDrag:TweenSize(UDim2.new(((maxvalue or minvalue) - minvalue) / (maxvalue - minvalue), 0, 0, 9), "InOut", "Linear", 0.05, true)
                            pcall(function()
                                callback(Value)
                            end)
                        else
                            Value = tonumber(sliderBox.Text)
                        end
                        if tonumber(sliderBox.Text) < minvalue then
                            sliderBox.Text = minvalue
                            Value = minvalue
                            SliderDrag.Size = UDim2.new(((minvalue) - minvalue) / (maxvalue - minvalue), 0, 0, 9)
                            pcall(function()
                                callback(Value)
                            end)
                        else
                            Value = tonumber(sliderBox.Text)
                        end
                        if sliderBox.Text == "" then
                            sliderBox.Text = minvalue
                            Value = minvalue
                            SliderDrag:TweenSize(UDim2.new(((minvalue) - minvalue) / (maxvalue - minvalue), 0, 0, 9), "InOut", "Linear", 0.05, true)
                            pcall(function()
                                callback(Value)
                            end)
                        end
                    end)
                    return sliderfunc
                end

                function itemHandling:Label(txtLabel)
                    txtLabel = txtLabel or "nightmare.fun"
                    local TextLabel = Instance.new("TextLabel")

                    TextLabel.Parent = sectionFrame
                    TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    TextLabel.BackgroundTransparency = 1.000
                    TextLabel.Position = UDim2.new(0.0390070938, 0, 0.826923072, 0)
                    TextLabel.Size = UDim2.new(0, 260, 0, 27)
                    TextLabel.Font = Enum.Font.Gotham
                    TextLabel.Text = txtLabel
                    TextLabel.TextColor3 = Color3.fromRGB(198, 198, 198)
                    TextLabel.TextSize = 14.000
                    TextLabel.TextXAlignment = Enum.TextXAlignment.Left
                end

                function itemHandling:KeyBind(bindInfo, first, callback)
                    bindInfo = bindInfo or "Press the Key"
                    local oldKey = first.Name
                    callback = callback or function() end

                    local keybindFrame = Instance.new("Frame")
                    local UIListLayout = Instance.new("UIListLayout")
                    local keybindBtn = Instance.new("TextButton")
                    local UICorner = Instance.new("UICorner")
                    local TextLabel = Instance.new("TextLabel")

                    keybindFrame.Name = "keybindFrame"
                    keybindFrame.Parent = sectionFrame
                    keybindFrame.BackgroundColor3 = Color3.fromRGB(43, 43, 52)
                    keybindFrame.BackgroundTransparency = 1.000
                    keybindFrame.Position = UDim2.new(0.0354609936, 0, 0.344827592, 0)
                    keybindFrame.Size = UDim2.new(0, 262, 0, 33)

                    UIListLayout.Parent = keybindFrame
                    UIListLayout.FillDirection = Enum.FillDirection.Horizontal
                    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
                    UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
                    UIListLayout.Padding = UDim.new(0, 3)

                    keybindBtn.Name = "keybindBtn"
                    keybindBtn.Parent = keybindFrame
                    keybindBtn.BackgroundColor3 = Color3.fromRGB(43, 43, 52)
                    keybindBtn.Position = UDim2.new(0, 0, 0.106060609, 0)
                    keybindBtn.Size = UDim2.new(0, 107, 0, 26)
                    keybindBtn.AutoButtonColor = false
                    keybindBtn.Font = Enum.Font.GothamSemibold
                    keybindBtn.Text = oldKey
                    keybindBtn.TextColor3 = Color3.fromRGB(204, 204, 204)
                    keybindBtn.TextSize = 14.000

                    UICorner.CornerRadius = UDim.new(0, 5)
                    UICorner.Parent = keybindBtn

                    TextLabel.Parent = keybindFrame
                    TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    TextLabel.BackgroundTransparency = 1.000
                    TextLabel.Position = UDim2.new(0.408396959, 0, 0.893939376, 0)
                    TextLabel.Size = UDim2.new(0, 155, 0, 12)
                    TextLabel.Font = Enum.Font.Gotham
                    TextLabel.Text = "KeyBind"
                    TextLabel.TextColor3 = Color3.fromRGB(127, 97, 145)
                    TextLabel.TextSize = 14.000
                    TextLabel.TextXAlignment = Enum.TextXAlignment.Left

                    keybindBtn.MouseButton1Click:connect(function(e) 
                        keybindBtn.Text = ". . ."
                        local a, b = game:GetService('UserInputService').InputBegan:wait();
                        if a.KeyCode.Name ~= "Unknown" then
                            keybindBtn.Text = a.KeyCode.Name
                            oldKey = a.KeyCode.Name;
                        end
                    end)
            
                    game:GetService("UserInputService").InputBegan:connect(function(current, ok) 
                        if not ok then 
                            if current.KeyCode.Name == oldKey then 
                                callback()
                            end
                        end
                    end)
                end

                function itemHandling:Dropdown(dropInfo, list, callback)
                    dropInfo = dropInfo or 'Favorite Hub'
                    list = list or {}
                    callback = callback or function() end

                    local DropYSize = 28
                    local dropped = false

                    local dropdownFrame = Instance.new("Frame")
                    local dropdownFrameHeader = Instance.new("Frame")
                    local UICorner = Instance.new("UICorner")
                    local dropdowninfo = Instance.new("TextLabel")
                    local closeDropdown = Instance.new("ImageButton")
                    local dropcover = Instance.new("Frame")
                    local dropListing = Instance.new("UIListLayout")
                    local dropdownCorner = Instance.new("UICorner")

                    dropdownFrame.Name = "dropdownFrame"
                    dropdownFrame.Parent = sectionFrame
                    dropdownFrame.BackgroundColor3 = Color3.fromRGB(48, 48, 58)
                    dropdownFrame.ClipsDescendants = true
                    dropdownFrame.Position = UDim2.new(0.0354609936, 0, 0.495833337, 0)
                    dropdownFrame.Size = UDim2.new(0, 262, 0, 28)

                    dropdownFrameHeader.Name = "dropdownFrameHeader"
                    dropdownFrameHeader.Parent = dropdownFrame
                    dropdownFrameHeader.BackgroundColor3 = Color3.fromRGB(127, 97, 145)
                    dropdownFrameHeader.Size = UDim2.new(0, 262, 0, 28)

                    UICorner.CornerRadius = UDim.new(0, 5)
                    UICorner.Parent = dropdownFrameHeader

                    dropdowninfo.Name = "dropdowninfo"
                    dropdowninfo.Parent = dropdownFrameHeader
                    dropdowninfo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    dropdowninfo.BackgroundTransparency = 1.000
                    dropdowninfo.Position = UDim2.new(0.0267175566, 0, 0, 0)
                    dropdowninfo.Size = UDim2.new(0, 197, 0, 28)
                    dropdowninfo.Font = Enum.Font.Gotham
                    dropdowninfo.Text = dropInfo
                    dropdowninfo.TextColor3 = Color3.fromRGB(255, 255, 255)
                    dropdowninfo.TextSize = 15.000
                    dropdowninfo.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
                    dropdowninfo.TextXAlignment = Enum.TextXAlignment.Left

                    closeDropdown.Name = "closeDropdown"
                    closeDropdown.Parent = dropdownFrameHeader
                    closeDropdown.BackgroundTransparency = 1.000
                    closeDropdown.Position = UDim2.new(0.8823663, 0, 0.0857142881, 0)
                    closeDropdown.Size = UDim2.new(0, 25, 0, 25)
                    closeDropdown.ZIndex = 2
                    closeDropdown.Image = "rbxassetid://3926305904"
                    closeDropdown.ImageRectOffset = Vector2.new(404, 284)
                    closeDropdown.ImageRectSize = Vector2.new(36, 36)
                    closeDropdown.MouseButton1Click:Connect(function()
                        if dropped then
                            dropped = false
                            dropdownFrame:TweenSize(UDim2.new(0, 262, 0, 28), 'InOut', 'Linear', 0.08)
                            game.TweenService:Create(closeDropdown, TweenInfo.new(0.08, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
                                Rotation = 0
                            }):Play()
                            wait(0.1)
                            sectionFrame:TweenSize(UDim2.new(0.956,0, 0, sectionListLayout.AbsoluteContentSize.Y + 8), "InOut", "Linear", 0.1)
                            wait(0.1)
                            game.TweenService:Create(dropcover, TweenInfo.new(0.08, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
                                BackgroundTransparency = 1
                            }):Play()
                            wait(0.1)
                            UpdateSize()
                        else
                            dropped = true
                            dropdownFrame:TweenSize(UDim2.new(0, 262, 0, DropYSize), 'InOut', 'Linear', 0.08)
                            game.TweenService:Create(closeDropdown, TweenInfo.new(0.08, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
                                Rotation = 180
                            }):Play()
                            wait(0.1)
                            sectionFrame:TweenSize(UDim2.new(0.956,0, 0, sectionListLayout.AbsoluteContentSize.Y + 8), "InOut", "Linear", 0.1)
                            wait(0.1)
                            game.TweenService:Create(dropcover, TweenInfo.new(0.08, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
                                BackgroundTransparency = 0
                            }):Play()
                            wait(0.1)
                            UpdateSize()
                        end
                    end)

                    dropcover.Name = "dropcover"
                    dropcover.Parent = dropdownFrameHeader
                    dropcover.BackgroundColor3 = Color3.fromRGB(127, 97, 145)
                    dropcover.BackgroundTransparency = 1.000
                    dropcover.BorderSizePixel = 0
                    dropcover.Position = UDim2.new(0, 0, 0.850000024, 0)
                    dropcover.Size = UDim2.new(0, 262, 0, 5)

                    dropListing.Name = "dropListing"
                    dropListing.Parent = dropdownFrame
                    dropListing.HorizontalAlignment = Enum.HorizontalAlignment.Center
                    dropListing.SortOrder = Enum.SortOrder.LayoutOrder
                    dropListing.Padding = UDim.new(0, 4)

                    dropdownCorner.CornerRadius = UDim.new(0, 5)
                    dropdownCorner.Name = "dropdownCorner"
                    dropdownCorner.Parent = dropdownFrame

                        for i,v in next, list do
                            local dropdownButton = Instance.new("Frame")
                            local UIListLayout = Instance.new("UIListLayout")
                            local optionButton = Instance.new("TextButton")
                            local optionCorner = Instance.new("UICorner")

                            dropdownButton.Name = "dropdownButton"
                            dropdownButton.Parent = dropdownFrame
                            dropdownButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            dropdownButton.BackgroundTransparency = 1.000
                            dropdownButton.Position = UDim2.new(0, 0, 0.284552842, 0)
                            dropdownButton.Size = UDim2.new(0, 251, 0, 28)
        
                            UIListLayout.Parent = dropdownButton
                            UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
                            UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
                            UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
                            
                            DropYSize = DropYSize + 33
                            optionButton.Name = "optionButton"
                            optionButton.Parent = dropdownButton
                            optionButton.BackgroundColor3 = Color3.fromRGB(127, 97, 145)
                            optionButton.BorderSizePixel = 0
                            optionButton.Position = UDim2.new(0.0667938963, 0, -0.418119699, 0)
                            optionButton.Size = UDim2.new(0, 251, 0, 28)
                            optionButton.AutoButtonColor = false
                            optionButton.Font = Enum.Font.Gotham
                            optionButton.Text = "  "..v
                            optionButton.TextColor3 = Color3.fromRGB(255, 255, 255)
                            optionButton.TextSize = 14.000
                            optionButton.TextXAlignment = Enum.TextXAlignment.Left
                            optionButton.MouseButton1Click:Connect(function()
                                dropped = false
                                dropdowninfo.Text = v
                                callback(v)
                                dropdownFrame:TweenSize(UDim2.new(0, 262, 0, 28), 'InOut', 'Linear', 0.08)
                                game.TweenService:Create(closeDropdown, TweenInfo.new(0.08, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
                                    Rotation = 0
                                }):Play()
                                wait(0.1)
                                sectionFrame:TweenSize(UDim2.new(0.956,0, 0, sectionListLayout.AbsoluteContentSize.Y + 8), "InOut", "Linear", 0.1)
                                wait(0.1)
                                game.TweenService:Create(dropcover, TweenInfo.new(0.08, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
                                    BackgroundTransparency = 1
                                }):Play()
                                wait(0.1)
                                UpdateSize()
                            end)

                            optionButton.MouseButton1Down:Connect(function()
                                game.TweenService:Create(optionButton, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
                                    Size = UDim2.new(0, 235,0, 26)
                                }):Play()
                            end)
                            optionButton.MouseButton1Up:Connect(function()
                                game.TweenService:Create(optionButton, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
                                    Size = UDim2.new(0, 251,0, 28)
                                }):Play()
                            end)
        
                            optionCorner.CornerRadius = UDim.new(0, 5)
                            optionCorner.Name = "optionCorner"
                            optionCorner.Parent = optionButton
                        end 
                end
            return itemHandling
        end
        return sectionHandling
    end
    return tabHandling
end

return Fun

end)()
--=== End: GoScript UI ===


--=====================================================
-- Config & Helpers
--=====================================================
local HttpService = game:GetService("HttpService")
local RbxAnalyticsService = (pcall(function() return game:GetService("RbxAnalyticsService") end) and game:GetService("RbxAnalyticsService")) or nil

local HWID = "unknown_hwid"
if RbxAnalyticsService and RbxAnalyticsService.GetClientId then
    pcall(function() HWID = RbxAnalyticsService:GetClientId() end)
end
local CFG_FILE = "goscript_autojoin_" .. HWID .. ".json"

local function read_cfg()
    if isfile and isfile(CFG_FILE) then
        local ok, data = pcall(function() return HttpService:JSONDecode(readfile(CFG_FILE)) end)
        if ok and type(data) == "table" then return data end
    end
    return { MinMS = 1000000, AutoJoin = true, Bypass10M = false, WSURL = "ws://5.255.97.147:6767/script" }
end

local function write_cfg(tbl)
    if writefile then
        pcall(function() writefile(CFG_FILE, HttpService:JSONEncode(tbl)) end)
    end
end

local function formatMoney(num)
    if num >= 1000000 then
        return string.format("%.1fM", num / 1000000)
    elseif num >= 1000 then
        return string.format("%.1fK", num / 1000)
    else
        return tostring(num)
    end
end

local function parseMoney(str)
    if not str then return 0 end
    local num, suffix = tostring(str):match("(%d+%.?%d*)([MK]?)")
    num = tonumber(num)
    if not num then return 0 end
    if suffix == "M" then return num * 1000000 end
    if suffix == "K" then return num * 1000 end
    return num
end

--=====================================================
-- Launch the key loader
--=====================================================
Loader:Create({
    Name = "GoScript",
    ImageID = "rbxassetid://14222444137",
    SaveKey = true,
    Callback = function(EnteredKey)
        if EnteredKey ~= "Goscript" then
            print("❌ Invalid Key")
            Loader:Delete("GoScript")
            return
        end

        print("✅ Whitelisted for GoScript")
        Loader:Delete("GoScript")

        --=====================================================
        -- Main UI using your src.lua (GoUI)
        --=====================================================
        local ui = GoUI.Create("GoScript")
        local joinerTab = ui:Tab("Joiner")
        local settingsTab = ui:Tab("Settings")
        local logsTab = ui:Tab("Logs")

        -- Runtime state
        local Config = read_cfg()
        local AutoJoinEnabled = (Config.AutoJoin == nil) and true or not not Config.AutoJoin
        local Bypass10M = not not Config.Bypass10M
        local MinMS = tonumber(Config.MinMS) or 1000000
        local WS_URL = Config.WSURL or "ws://5.255.97.147:6767/script"

        local ws = nil
        local wsConnected = false

        -- Logging helper (adds a new label in Logs tab)
        local logSection = logsTab:Section("Console")
        local function log(msg)
            pcall(function() logSection:Label(os.date("[%H:%M:%S] ") .. tostring(msg)) end)
            print("[GoScript] " .. tostring(msg))
        end

        -- Expose status UI
        local ctrl = joinerTab:Section("Controls")
        ctrl:Toggle("Auto Join", function(state)
            AutoJoinEnabled = state
            Config.AutoJoin = state
            write_cfg(Config)
            log("AutoJoin: " .. (state and "ON" or "OFF"))
        end)
        -- reflect initial state
        ctrl:Label("AutoJoin is " .. (AutoJoinEnabled and "ON" or "OFF"))

        ctrl:Toggle("Bypass 10M Clamp", function(state)
            Bypass10M = state
            Config.Bypass10M = state
            write_cfg(Config)
            log("Bypass10M: " .. (state and "ON" or "OFF"))
        end)
        ctrl:Label("Bypass10M is " .. (Bypass10M and "ON" or "OFF"))

        local thr = joinerTab:Section("Threshold (Min M/s)")
        thr:TextBox("Enter number in millions (e.g., 1.5)", function(text)
            local n = tonumber(text)
            if not n then
                log("Invalid number: " .. tostring(text))
                return
            end
            local val = math.floor((n * 1000000) + 0.5)
            if not Bypass10M then
                if val < 1000000 then val = 1000000 end
                if val > 10000000 then val = 10000000 end
            end
            MinMS = val
            Config.MinMS = MinMS
            write_cfg(Config)
            log("Min M/s set to " .. formatMoney(MinMS))
        end)
        thr:Label("Current: " .. formatMoney(MinMS))

        local wsSec = joinerTab:Section("WebSocket")
        wsSec:TextBox("ws://host:port/path", function(url)
            if type(url) == "string" and #url > 0 then
                WS_URL = url
                Config.WSURL = WS_URL
                write_cfg(Config)
                log("WS URL set to " .. WS_URL)
            end
        end)
        wsSec:Label("Current: " .. WS_URL)

        wsSec:Button("Connect", function()
            if wsConnected then
                log("Already connected")
                return
            end
            if not WebSocket then
                log("Your executor does not support WebSocket.")
                return
            end
            local ok, sock = pcall(WebSocket.connect, WS_URL)
            if not ok or not sock then
                log("WebSocket connect failed")
                return
            end
            ws = sock
            wsConnected = true
            log("Connected to " .. WS_URL)

            ws.OnMessage:Connect(function(msg)
                -- Accept either raw join script or JSON: {type='server_update', data={join_script=..., money=...}}
                local decoded
                local isJSON = false
                pcall(function()
                    decoded = HttpService:JSONDecode(msg)
                    if typeof(decoded) == "table" then isJSON = true end
                end)

                if isJSON and decoded and decoded.type == "server_update" and decoded.data then
                    local moneyStr = decoded.data.money or "$0/s"
                    local join_script = decoded.data.join_script
                    local moneyVal = parseMoney(moneyStr)

                    if AutoJoinEnabled and join_script and (moneyVal >= MinMS) then
                        log("Joining server with ".. moneyStr .. " (>= ".. formatMoney(MinMS) ..")")
                        local fn, err = loadstring(join_script)
                        if fn then
                            local ok2, res = pcall(fn)
                            if not ok2 then log("Join script error: " .. tostring(res)) end
                        else
                            log("Failed to load join script: " .. tostring(err))
                        end
                    else
                        log("Skipped: ".. tostring(moneyStr) .. " < Min " .. formatMoney(MinMS))
                    end
                else
                    -- If it's not JSON, assume it's a runnable script chunk.
                    if AutoJoinEnabled then
                        local fn, err = loadstring(msg)
                        if fn then
                            local ok2, res = pcall(fn)
                            if not ok2 then log("Script error: " .. tostring(res)) end
                        else
                            log("Loadstring error: " .. tostring(err))
                        end
                    else
                        log("Received script but AutoJoin is OFF")
                    end
                end
            end)

            ws.OnClose:Connect(function()
                wsConnected = false
                ws = nil
                log("WebSocket closed")
                -- Attempt autoreconnect after short delay if AutoJoin is still ON
                task.delay(1, function()
                    if AutoJoinEnabled then
                        log("Reconnecting...")
                        local ok2, sock2 = pcall(WebSocket.connect, WS_URL)
                        if ok2 and sock2 then
                            ws = sock2
                            wsConnected = true
                            log("Reconnected to " .. WS_URL)
                            -- reattach handlers
                            ws.OnMessage:Connect(function(msg)
                                -- same handler as above (omitted for brevity)
                                local decoded; local isJSON=false
                                pcall(function() decoded = HttpService:JSONDecode(msg); if typeof(decoded) == "table" then isJSON = true end end)
                                if isJSON and decoded and decoded.type == "server_update" and decoded.data then
                                    local moneyStr = decoded.data.money or "$0/s"
                                    local join_script = decoded.data.join_script
                                    local moneyVal = parseMoney(moneyStr)
                                    if AutoJoinEnabled and join_script and (moneyVal >= MinMS) then
                                        log("Joining server with ".. moneyStr .. " (>= ".. formatMoney(MinMS) ..")")
                                        local fn, err = loadstring(join_script); if fn then local ok2,res = pcall(fn); if not ok2 then log("Join script error: "..tostring(res)) end else log("Failed to load join script: "..tostring(err)) end
                                    else
                                        log("Skipped: ".. tostring(moneyStr) .. " < Min " .. formatMoney(MinMS))
                                    end
                                else
                                    if AutoJoinEnabled then
                                        local fn, err = loadstring(msg); if fn then local ok2,res = pcall(fn); if not ok2 then log("Script error: "..tostring(res)) end else log("Loadstring error: "..tostring(err)) end
                                    else
                                        log("Received script but AutoJoin is OFF")
                                    end
                                end
                            end)
                            ws.OnClose:Connect(function() wsConnected=false; ws=nil; log("WebSocket closed again") end)
                        else
                            log("Reconnect failed")
                        end
                    end
                end)
            end)
        end)

        wsSec:Button("Disconnect", function()
            if ws and ws.Close then
                pcall(function() ws:Close() end)
            end
            ws = nil
            wsConnected = false
            log("Disconnected")
        end)

        -- Settings Tab: about info
        local about = settingsTab:Section("About")
        about:Label("GoScript • AutoJoiner UI")
        about:Label("Main UI from your src.lua")
        about:Label("Key system from your src (1).lua")
    end,
})
