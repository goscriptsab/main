-- Funny Jump Scare with Decal + Bang Sound + Flash
-- Put this in StarterPlayerScripts (LocalScript)

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local PlayerGui = player:WaitForChild("PlayerGui")

local screenGui = Instance.new("ScreenGui")
screenGui.ResetOnSpawn = false
screenGui.Parent = PlayerGui

-- Background flash
local flash = Instance.new("Frame")
flash.Size = UDim2.new(1, 0, 1, 0)
flash.BackgroundColor3 = Color3.new(1, 1, 1)
flash.BackgroundTransparency = 1
flash.Parent = screenGui

-- Big image (the jumpscare decal)
local image = Instance.new("ImageLabel")
image.Size = UDim2.new(1, 0, 1, 0)
image.BackgroundTransparency = 1
image.Image = "rbxassetid://7713734565"
image.ImageTransparency = 1
image.Parent = screenGui

-- Bang sound
local sound = Instance.new("Sound")
sound.SoundId = "rbxassetid://1835337424" -- replace with any loud/funny sound if you want
sound.Volume = 5
sound.Parent = PlayerGui

-- Jumpscare logic
local function jumpScare()
	task.wait(2) -- delay before the scare
	sound:Play()

	-- Flash white
	for i = 1, 5 do
		flash.BackgroundTransparency = 0
		task.wait(0.05)
		flash.BackgroundTransparency = 1
		task.wait(0.05)
	end

	-- Show image (fade in fast)
	for t = 1, 10 do
		image.ImageTransparency = 1 - (t / 10)
		task.wait(0.05)
	end

	-- Shake effect
	for i = 1, 50 do
		image.Position = UDim2.new(0.5 + math.random(-10,10)/100,0,0.5 + math.random(-10,10)/100,0)
		task.wait(0.03)
	end

	-- Fade out slowly
	for t = 0, 1, 0.05 do
		image.ImageTransparency = t
		task.wait(0.05)
	end

	screenGui:Destroy()
end

jumpScare()
