-- Funny Text Animation Script (LocalScript)
-- Put this in StarterPlayerScripts

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local PlayerGui = player:WaitForChild("PlayerGui")

local screenGui = Instance.new("ScreenGui")
screenGui.Parent = PlayerGui

local textLabel = Instance.new("TextLabel")
textLabel.Size = UDim2.new(1, 0, 1, 0)
textLabel.BackgroundTransparency = 1
textLabel.Text = "Safwan Boulras ntm"
textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
textLabel.TextScaled = true
textLabel.Font = Enum.Font.FredokaOne
textLabel.Parent = screenGui

-- Animate text
for i = 1, 10 do
	textLabel.TextStrokeTransparency = math.abs(math.sin(tick() * 2))
	textLabel.Rotation = math.sin(tick() * 5) * 20
	task.wait(0.05)
end

wait(2)
screenGui:Destroy()
