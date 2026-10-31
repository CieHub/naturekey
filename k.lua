local Key = "EMBLVihRj3rOwdFm6cwfY1EAqagQN4iU"

local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")

local PlayerGui = Players.LocalPlayer:WaitForChild("PlayerGui")

local function GetRoots()
    local roots = {CoreGui, PlayerGui}

    if gethui then
        pcall(function()
            table.insert(roots, gethui())
        end)
    end

    return roots
end

local function FindKeyUI()
    for _, root in ipairs(GetRoots()) do
        for _, obj in ipairs(root:GetDescendants()) do
            if obj:IsA("TextBox") then
                local placeholder = obj.PlaceholderText:lower()

                if placeholder:find("enter your key") then
                    return obj
                end
            end
        end
    end
end

local function FindLogin()
    for _, root in ipairs(GetRoots()) do
        for _, obj in ipairs(root:GetDescendants()) do
            if obj:IsA("TextButton") then
                if obj.Text:lower() == "login" then
                    return obj
                end
            end
        end
    end
end

local textbox = FindKeyUI()

if textbox then
    textbox:CaptureFocus()
    textbox.Text = Key
    task.wait(0.5)

    local login = FindLogin()

    if login and firesignal then
        firesignal(login.MouseButton1Click)
        print("Auto Key Login attempted!")
    else
        warn("Login button or firesignal unavailable")
    end
else
    warn("Nature Hub Key TextBox not found")
end
