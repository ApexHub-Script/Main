if not game:IsLoaded() then game.Loaded:Wait() end

type Setting = {
    -- Priority functions
    AutoPlay:               boolean,

    -- Automation Functions
    AutoSkillCheck:         boolean,
    AutoNoclip:             boolean,
    AutoRun:                boolean,
    AutoFullBright:         boolean,
    AutoClosePopup:         boolean,
    AutoReady:              boolean,
    AutoEscapeSquirm:       boolean,
    AutoSetSpeed:           boolean,
    AutoJoin:               boolean,
    AutoJoinWithPlayer:     boolean,
    AutoJoinMatchMaking:    boolean,
    AutoReturnToLobby:      boolean,
    AutoUseAbility:         boolean,

    ESPGenerator:           boolean,
    ESPTwisted:             boolean,
    ESPItem:                boolean,
    ESPToon:                boolean,

    -- Settings
    AutoExecute:            boolean,
    SelectPlayer:           string,
    SelectSpeed:            number,
    SelectJoinWithPlayer:   string,
    JoinMatchMakingDelay:   number,
    TweenSpeed:             number,
    AutoPlayMode:           "Normal" | "Distractor",
    YPos:                   number,
    TeleportAtDistance:     number,
    Priority:               {Priority: number, Server: string?},
    SortedPriority:         {string},
    PlayerDropdown:         {},
}

local self = {}
self.Settings = {} :: Setting
self.Signal = Instance.new("BindableEvent")
self.Troves = {}

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")
local AuctusAPI = loadstring(game:HttpGet("https://raw.githubusercontent.com/1makam1/Main/refs/heads/main/AuctusAPI.luau"))()
local Trove = loadstring(game:HttpGet("https://raw.githubusercontent.com/1makam1/Main/refs/heads/main/Utility/Trove.luau"))()

local GAME = "Dandy World"
local SCRIPT = `loadstring(game:HttpGet("https://raw.githubusercontent.com/ApexHub-Script/Main/refs/heads/main/{GAME:gsub(" ", "%%20")}.luau"))()`
local SERVERS = {
    Lobby = 16116270224,
    InGame = 16552821455
}

-- ═══════════════════════════════════════════════════════════════
--  🔑 KEY SYSTEM 🔑
-- ═══════════════════════════════════════════════════════════════
function self.MakeKeyPopup()

    if not isfile("Apex Hub Script/Key.txt") then
        makefolder("Apex Hub Script")
        writefile("Apex Hub Script/Key.txt", "")
    end

    if AuctusAPI:ValidateKey(readfile("Apex Hub Script/Key.txt")) == true then
        return
    end

	local KeyPopup = Instance.new("ScreenGui")
	local Body = Instance.new("Frame")
	local ContentBody = Instance.new("Frame")
	local UICorner = Instance.new("UICorner")
	local Toolbar = Instance.new("Frame")
	local WindowControls = Instance.new("Frame")
	local UIListLayout = Instance.new("UIListLayout")
	local UIPadding = Instance.new("UIPadding")
	local Exit = Instance.new("ImageButton")
	local Stroke = Instance.new("ImageLabel")
	local Icon = Instance.new("ImageLabel")
	local Form = Instance.new("Frame")
	local UICorner_2 = Instance.new("UICorner")
	local TextBox = Instance.new("TextBox")
	local CheckKey = Instance.new("TextButton")
	local UICorner_3 = Instance.new("UICorner")
	local GetKey = Instance.new("TextButton")
	local UICorner_4 = Instance.new("UICorner")
	local Dropshadow = Instance.new("ImageLabel")

    do
        KeyPopup.Name = "KeyPopup"
        KeyPopup.Parent = game:GetService("CoreGui")
        KeyPopup.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
        KeyPopup.DisplayOrder = 200
        KeyPopup.ResetOnSpawn = false

        Body.Name = "Body"
        Body.Parent = KeyPopup
        Body.AnchorPoint = Vector2.new(0.5, 0.5)
        Body.BackgroundColor3 = Color3.fromRGB(32, 32, 35)
        Body.BackgroundTransparency = 1.000
        Body.BorderSizePixel = 0
        Body.Position = UDim2.new(0.499187052, 0, 0.498972088, 0)
        Body.Size = UDim2.new(0, 314, 0, 141)

        ContentBody.Name = "ContentBody"
        ContentBody.Parent = Body
        ContentBody.AnchorPoint = Vector2.new(0.5, 0.5)
        ContentBody.BackgroundColor3 = Color3.fromRGB(28, 28, 30)
        ContentBody.BorderColor3 = Color3.fromRGB(0, 0, 0)
        ContentBody.BorderSizePixel = 0
        ContentBody.ClipsDescendants = true
        ContentBody.LayoutOrder = 2
        ContentBody.Position = UDim2.new(0.5, 0, 0.5, 0)
        ContentBody.Size = UDim2.new(1, 0, 1, 0)

        UICorner.CornerRadius = UDim.new(0, 10)
        UICorner.Parent = ContentBody

        Toolbar.Name = "Toolbar"
        Toolbar.Parent = ContentBody
        Toolbar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Toolbar.BackgroundTransparency = 1.000
        Toolbar.BorderColor3 = Color3.fromRGB(0, 0, 0)
        Toolbar.BorderSizePixel = 0
        Toolbar.Size = UDim2.new(1, 0, -0.160460994, 52)

        WindowControls.Name = "WindowControls"
        WindowControls.Parent = Toolbar
        WindowControls.AnchorPoint = Vector2.new(0, 0.5)
        WindowControls.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        WindowControls.BackgroundTransparency = 1.000
        WindowControls.BorderColor3 = Color3.fromRGB(0, 0, 0)
        WindowControls.BorderSizePixel = 0
        WindowControls.Position = UDim2.new(0, 0, 0.5, 0)
        WindowControls.Size = UDim2.new(0, 69, 0, 38)

        UIListLayout.Parent = WindowControls
        UIListLayout.FillDirection = Enum.FillDirection.Horizontal
        UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
        UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
        UIListLayout.Padding = UDim.new(0, 8)

        UIPadding.Parent = WindowControls
        UIPadding.PaddingLeft = UDim.new(0, 10)
        UIPadding.PaddingRight = UDim.new(0, 20)

        Exit.Name = "Exit"
        Exit.Parent = WindowControls
        Exit.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Exit.BackgroundTransparency = 1.000
        Exit.BorderColor3 = Color3.fromRGB(0, 0, 0)
        Exit.BorderSizePixel = 0
        Exit.Size = UDim2.new(0, 12, 0, 12)
        Exit.AutoButtonColor = false
        Exit.Image = "rbxassetid://132228700346004"
        Exit.ImageColor3 = Color3.fromRGB(255, 95, 87)

        Stroke.Name = "Stroke"
        Stroke.Parent = Exit
        Stroke.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Stroke.BackgroundTransparency = 1.000
        Stroke.BorderColor3 = Color3.fromRGB(0, 0, 0)
        Stroke.BorderSizePixel = 0
        Stroke.Size = UDim2.new(1, 0, 1, 0)
        Stroke.Image = "rbxassetid://94763505860483"
        Stroke.ImageTransparency = 0.900

        Icon.Name = "Icon"
        Icon.Parent = Exit
        Icon.AnchorPoint = Vector2.new(0.5, 0.5)
        Icon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Icon.BackgroundTransparency = 1.000
        Icon.BorderColor3 = Color3.fromRGB(0, 0, 0)
        Icon.BorderSizePixel = 0
        Icon.Position = UDim2.new(0.5, 0, 0.5, 0)
        Icon.Size = UDim2.new(1, 0, 1, 0)
        Icon.Visible = false
        Icon.Image = "rbxassetid://94781753558308"
        Icon.ImageColor3 = Color3.fromRGB(0, 0, 0)
        Icon.ImageTransparency = 0.500

        Form.Name = "Form"
        Form.Parent = ContentBody
        Form.BackgroundColor3 = Color3.fromRGB(31, 31, 33)
        Form.BorderColor3 = Color3.fromRGB(0, 0, 0)
        Form.BorderSizePixel = 0
        Form.Position = UDim2.new(0.0500000007, 0, 0.208333328, 0)
        Form.Size = UDim2.new(0.899999976, 0, 0.241134748, 0)
        Form.ZIndex = 0

        UICorner_2.CornerRadius = UDim.new(0, 6)
        UICorner_2.Parent = Form

        TextBox.Parent = Form
        TextBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        TextBox.BackgroundTransparency = 1.000
        TextBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
        TextBox.BorderSizePixel = 0
        TextBox.Position = UDim2.new(0.05, 0, 0.25, 0)
        TextBox.Size = UDim2.new(0.9, 0, 0.5, 0)
        TextBox.Font = Enum.Font.Unknown
        TextBox.PlaceholderColor3 = Color3.fromRGB(159, 159, 159)
        TextBox.PlaceholderText = "key..."
        TextBox.Text = ""
        TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
        TextBox.TextSize = 15.000
        TextBox.TextScaled = true

        CheckKey.Name = "CheckKey"
        CheckKey.Parent = ContentBody
        CheckKey.Active = false
        CheckKey.BackgroundColor3 = Color3.fromRGB(31, 31, 33)
        CheckKey.BorderColor3 = Color3.fromRGB(0, 0, 0)
        CheckKey.BorderSizePixel = 0
        CheckKey.Position = UDim2.new(0.540012062, 0, 0.589538991, 0)
        CheckKey.Selectable = false
        CheckKey.Size = UDim2.new(0.407000005, 0, 0.298000008, 0)
        CheckKey.Font = Enum.Font.Unknown
        CheckKey.Text = "Submit"
        CheckKey.TextColor3 = Color3.fromRGB(255, 255, 255)
        CheckKey.TextSize = 15.000
        CheckKey.TextTransparency = 0.450

        UICorner_3.CornerRadius = UDim.new(0, 6)
        UICorner_3.Parent = CheckKey

        GetKey.Name = "GetKey"
        GetKey.Parent = ContentBody
        GetKey.Active = false
        GetKey.BackgroundColor3 = Color3.fromRGB(31, 31, 33)
        GetKey.BorderColor3 = Color3.fromRGB(0, 0, 0)
        GetKey.BorderSizePixel = 0
        GetKey.Position = UDim2.new(0.0495661832, 0, 0.589538991, 0)
        GetKey.Selectable = false
        GetKey.Size = UDim2.new(0.407141238, 0, 0.297872335, 0)
        GetKey.Font = Enum.Font.Unknown
        GetKey.Text = "GetKey"
        GetKey.TextColor3 = Color3.fromRGB(255, 255, 255)
        GetKey.TextSize = 15.000
        GetKey.TextTransparency = 0.450

        UICorner_4.CornerRadius = UDim.new(0, 6)
        UICorner_4.Parent = GetKey

        Dropshadow.Name = "Dropshadow"
        Dropshadow.Parent = Body
        Dropshadow.AnchorPoint = Vector2.new(0.5, 0.5)
        Dropshadow.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Dropshadow.BackgroundTransparency = 1.000
        Dropshadow.BorderColor3 = Color3.fromRGB(0, 0, 0)
        Dropshadow.BorderSizePixel = 0
        Dropshadow.Position = UDim2.new(0.5, 0, 0.5, 3)
        Dropshadow.Size = UDim2.new(1, 24, 1, 24)
        Dropshadow.ZIndex = 0
        Dropshadow.Image = "rbxassetid://138260268144845"
        Dropshadow.ImageTransparency = 0.650
        Dropshadow.ScaleType = Enum.ScaleType.Slice
        Dropshadow.SliceCenter = Rect.new(28, 26, 96, 94)
    end

    local key_signal = Instance.new("BindableEvent")
	local connects = {}

	local function EndPopupKey()
        KeyPopup:Destroy()
        key_signal:Destroy()

		for _, v in connects do
			v:Disconnect()
		end
	end

	local getcon = GetKey.MouseButton1Click:Connect(function()
		local link = AuctusAPI:GetKeyLink()
		setclipboard(link)
	end)

	local checkcon = CheckKey.MouseButton1Click:Connect(function()
        local key = TextBox.Text
		local isValid = AuctusAPI:ValidateKey(key)

		if isValid == true then
            writefile("Apex Hub Script/Key.txt", key)
            key_signal:Fire(true)
            EndPopupKey()
        end
	end)

	local exitcon = Exit.MouseButton1Click:Connect(function()
		key_signal:Fire(false)
        EndPopupKey()
	end)

	table.insert(connects, getcon)
	table.insert(connects, checkcon)
	table.insert(connects, exitcon)

    return key_signal.Event:Wait()
end

-- local keyresult = self.MakeKeyPopup()
-- if keyresult == false then return end

-- ═══════════════════════════════════════════════════════════════
--  🚩 INIT FUNCTIONS 🚩
-- ═══════════════════════════════════════════════════════════════
local InitFunctions = {}
function InitFunctions.LoadSave()
    if isfile(`Apex Hub Script/Settings/{GAME}.json`) then
        local http = game:GetService("HttpService")

        makefolder("Apex Hub Script")
        makefolder("Apex Hub Script/Settings")
        self.Settings = http:JSONDecode(readfile(`Apex Hub Script/Settings/{GAME}.json`))
    end
end

function InitFunctions.InitConfig()
    if not getgenv().ApexConfig then
        getgenv().ApexConfig = {}
    end
end

function InitFunctions.InitBodyType()
    task.spawn(function()
        local Character = Player.Character or Player.CharacterAdded:Wait()

        self.BodyType = Character:FindFirstChild("Torso") and "R6" or "R15"
    end)
end

function InitFunctions.AntiAFK()
    local VirtualUser = game:GetService('VirtualUser')

    Player.Idled:Connect(function()
        VirtualUser:CaptureController()
        VirtualUser:ClickButton2(Vector2.new())
    end)
end

function InitFunctions.InitPriority()
    local priority_temlate = {
        AutoPlay = {Priority = 1}
    }

    if not self.Settings.Priority then
        self.Settings.Priority = {}
    end

    for funcname, priority_info in priority_temlate do
        local func_info = self.Settings.Priority[funcname]

        if not func_info or type(func_info) ~= "table" then
            self.Settings.Priority[funcname] = priority_info
        end
    end

    self.SetPriority()
end

function InitFunctions.InitAutoExecute()
    local queueteleport = queue_on_teleport or (syn and syn.queue_on_teleport) or (fluxus and fluxus.queue_on_teleport)

    Player.OnTeleport:Connect(function()
        if not self.Settings.AutoExecute then return end

        if not getgenv().ApexHubAutoExecute and queueteleport then
            getgenv().ApexHubAutoExecute = true
            queueteleport(SCRIPT)
        end
    end)
end

function InitFunctions.InitUpdatePlayerDropdowns()
    local addcon = Players.PlayerAdded:Connect(self.UpdatePlayerDropdowns)
    local removecon = Players.PlayerRemoving:Connect(self.UpdatePlayerDropdowns)

    table.insert(self, addcon)
    table.insert(self, removecon)
end

function InitFunctions:ValidateServer()
    local valid_server

    for _, place_id in SERVERS do
        if place_id == game.PlaceId then
            valid_server = true

            break
        end
    end

    if not valid_server then
        Player:Kick("Script doesn't support this game!")

        repeat task.wait(9e9) until false
    end
end

function InitFunctions.GetRoom()
    if game.PlaceId ~= SERVERS.InGame then return end

    local CurrentRoom = workspace:WaitForChild("CurrentRoom")

    task.delay(1, function()
        local room = CurrentRoom:GetChildren()[1]

        if room then
            self.room = room
            self.Signal:Fire("RoomAdded")
        end

        CurrentRoom.ChildAdded:Connect(function(child)
            self.room = child
            self.Signal:Fire("RoomAdded")
        end)
        CurrentRoom.ChildRemoved:Connect(function()
            self.room = nil
            self.Signal:Fire("RoomRemoved")
        end)
    end)
end

function InitFunctions.InitHighlight()
    local function AddMonConnect(monster: Model)
        local icon = self.CreateTwistedIcon(monster.Name)
        local monster_trove = self.Troves.ESPMonster

        if not monster_trove then return end

        monster_trove:Add(icon)
        monster_trove:Connect(RunService.RenderStepped, function()
            self.UpdateMonsterIcon(icon)
        end)
    end

    local function AddAllMonConnect()
        local monsters = self.room:WaitForChild("Monsters")

        for _, monster in monsters:GetChildren() do
            AddMonConnect(monster)
        end

        monsters.ChildAdded:Connect(AddMonConnect)
    end

    local function newTrove()
        if self.Troves.ESPMonster then return end

        self.Troves.ESPMonster = Trove.new()
    end

    local function ESP(enable: boolean)
        if not enable then self.ClearTwistedIcon() return end
        if not self.room then return end
        if not self.Settings.ESPTwisted then return end

        newTrove()
        AddAllMonConnect()
    end

    self.Signal.Event:Connect(function(event: string, ...)
        if event == "RoomAdded" then
            ESP(true)

        elseif event == "RoomRemoved" then
            ESP(false)

        elseif event == "ESPTwisted" then
            ESP(...)
        end
    end)
end

function InitFunctions.InitNoclip()
    self.Signal.Event:Connect(function(event: string, ...)
        if event == "RoomAdded" and self.Settings.AutoNoclip then
            self.Noclip(true)

        elseif event == "AutoNoclip" then
            self.Noclip(...)
        end
    end)
end

function InitFunctions.AutoClosePopup()
    if game.PlaceId ~= SERVERS.InGame then return end

    local ScreenGui = PlayerGui:WaitForChild("ScreenGui")

    ScreenGui.ChildAdded:Connect(function(child)
        if not self.Settings.AutoClosePopup then return end

        if child.Name == "TemporaryPopUp" then
            child:Destroy()
        end
    end)

    self.Signal.Event:Connect(function(event: string, ...)
        if event == "AutoClosePopup" and ... == true then
            for _, v in ScreenGui:GetChildren() do
                if v.Name == "TemporaryPopUp" then
                    v:Destroy()
                end
            end
        end
    end)
end

-- ═══════════════════════════════════════════════════════════════
--  🏠 MAIN FUNCTIONS 🏠
-- ═══════════════════════════════════════════════════════════════
function self.SaveSetting()
    local http = game:GetService("HttpService")

    makefolder("Apex Hub Script")
    makefolder("Apex Hub Script/Settings")
    writefile(`Apex Hub Script/Settings/{GAME}.json`, http:JSONEncode(self.Settings))
end

function self.UpdatePlayerDropdowns()
    for _, dropdown_data in self.PlayerDropdown do

        local Dropdown = dropdown_data.Dropdown
        local select_plr = self.Settings[dropdown_data.SelectVar]
        local all_player = {}

        for _, plr in Players:GetPlayers() do
            if plr == Player then continue end

            table.insert(all_player, plr.Name)
        end

        if select_plr and not table.find(all_player, select_plr) then
            local newT = {select_plr}

            for _, plr in all_player do
                table.insert(newT, plr)
            end

            all_player = newT
        end

        Dropdown.Options = all_player
        Dropdown.Value = table.find(Dropdown.Options, select_plr) or 0
    end
end

function self.SetPriority(func: string?, priority: number?)
    if func and priority then
        self.Settings.Priority[func].Priority = priority
    end

    self.SortedPriority = {}

    for funcname in self.Settings.Priority do
        table.insert(self.SortedPriority, funcname)
    end

    table.sort(self.SortedPriority, function(a, b)
        return self.Settings.Priority[a].Priority > self.Settings.Priority[b].Priority
    end)

    task.spawn(function()
        repeat task.wait(0.1) until self.Cassde and self.Cassde.Forms and self.Cassde.Forms["PriorityFunctions"]

        for _, v in self.Cassde.Forms["PriorityFunctions"].Object:GetChildren() do
            if v:IsA("Frame")then
                v:Destroy()
            end
        end

        local function GetParent(row)
            local form = row.Parent
            local tab = form.Parent
            local section = tab.Parent

            return section.Title .. " > " .. tab.Title .. " > " .. form.Title
        end

        local number = 1

        for _, funcname in self.SortedPriority do
            local func_row

            for _, row_data in self.Cassde.Rows do
                if funcname == row_data.Title:gsub(" ", "") and row_data.ID ~= "" then
                    func_row = row_data
                end
            end

            if not func_row then continue end

            local row = self.Cassde:Row("", "PriorityFunctions", `{number}. {func_row.Title}`, GetParent(func_row))
            local lb = row:Right():Label({Text = `Priority : <font color='#e6cb00'>{self.Settings.Priority[funcname].Priority}</font>`, RichText = true})

            number += 1

            task.delay(0.1, function()
                lb.TextTransparency = 0.25
            end)
        end
    end)
end

function self.GetClosetMon(host: BasePart?, monnames: {string}?)
    local closetmon
    local closetdistance

    local function CheckChildren(path)
        for _, v in path:GetChildren() do
            local distance = (v:GetPivot().Position - (host or Player.Character.HumanoidRootPart).Position).Magnitude
            local hum = v:FindFirstChild("Humanoid")
            local validMon = if monnames then table.find(monnames, v.Name) else true

            if validMon and (not closetdistance or distance < closetdistance) and (hum and  hum.Health > 0) then
                closetmon = v
                closetdistance = distance
            end
        end
    end

    CheckChildren(self.room.Monsters)

    return closetmon
end

function self.Noclip(noclip: boolean)

    if game.PlaceId ~= SERVERS.InGame then return end
    if not self.room or not self.room.Parent then return end

    local path_infos = {
        FreeArea =      {"Exclude", {}},
        SecondFloor =   {"Exclude", {}},
        Walls =         {"Exclude", {"Collider"}},
        Generators =    {"Exclude", {"ScrapsAttachPoint", "FakeValve"}}
    }

    local function search(path: Instance, mode: "Exlude" | "Include", filter: {string})
        local expectType = if mode == "Exclude" then "nil" else "number"

        local function check(part: Instance)
            if part:IsA("BasePart") and type(table.find(filter, part.Name)) == expectType then
                part.CanCollide = not noclip
            end
        end

        local function CheckChildren(child)
            for _, v in child:GetDescendants() do
                check(v)
            end

            child.DescendantAdded:Connect(check)
        end

        for _, v in path:GetChildren() do
            CheckChildren(v)
        end

        path.ChildAdded:Connect(CheckChildren)
    end

    local function CheckPath(path)
        local path_info = path_infos[path.Name]

        if not path_info then return end

        task.spawn(search, path, unpack(path_info))
    end

    for _, v in self.room:GetChildren() do
        CheckPath(v)
    end

    self.room.ChildAdded:Connect(CheckPath)
end

function self.ESP(path: Folder, enable: boolean, color: Color3?)
    if game.PlaceId ~= SERVERS.InGame then return end
    if not self.room or not self.room.Parent then return end

    if not path then return end

    for _, v in path:GetChildren() do
        local highlight = v:FindFirstChild("ESP_Highlight")

        if enable then
            highlight = highlight or Instance.new("Highlight", v)
            highlight.Name = "ESP_Highlight"

            if v.Name == "Generator" then
                local stats = v:FindFirstChild("Stats")

                if stats and stats.Completed.Value then
                    highlight.FillColor = Color3.fromRGB(136, 0, 255)
                    highlight.OutlineColor = Color3.fromRGB(136, 0, 255)

                elseif stats and stats.Connie.Value then
                    highlight.FillColor = Color3.fromRGB(255, 0, 0)
                    highlight.OutlineColor = Color3.fromRGB(255, 0, 0)

                else
                    highlight.FillColor = color
                    highlight.OutlineColor = color
                end

            elseif v.Name == "FakeCapsule" then
                highlight.FillColor = Color3.fromRGB(255, 0, 0)
                highlight.OutlineColor = Color3.fromRGB(255, 0, 0)

            elseif v.Name == "Bandage" or v.Name == "HealthKit" then
                highlight.FillColor = Color3.fromRGB(0, 255, 0)
                highlight.OutlineColor = Color3.fromRGB(0, 255, 0)

            else
                highlight.FillColor = color
                highlight.OutlineColor = color
            end

        elseif not enable and highlight then
            highlight:Destroy()
        end
    end
end

function self.Run(enable: boolean)
    if self.Settings.AutoSetSpeed then return end

    local char = Player.Character
    local hum = char and char:FindFirstChild("Humanoid")
    local stats = char and char:FindFirstChild("Stats")
    local runspeed = stats and stats:FindFirstChild("RunSpeed")
    local sprinting = stats and stats:FindFirstChild("Sprinting")
    local walkspeed = stats and stats:FindFirstChild("WalkSpeed")
    local runspeedmodifier = stats and stats:FindFirstChild("RunSpeedModifier")
    local walkspeedmodifier = stats and stats:FindFirstChild("SpeedModifier")

    if hum then
        if enable and runspeed and runspeedmodifier then
            hum.WalkSpeed = runspeed.Value * runspeedmodifier.Value

        elseif sprinting and not sprinting.Value and walkspeed and walkspeedmodifier then
            hum.WalkSpeed = walkspeed.Value * walkspeedmodifier.Value
        end
    end
end

function self.FullBright(enable: boolean)
    if game.PlaceId ~= SERVERS.InGame then return end

    local lighting = game:GetService("Lighting")

    if enable then
        lighting.Ambient = Color3.fromRGB(255, 255, 255)
        lighting.FogEnd = 999999
        lighting.GlobalShadows = false

    else
        lighting.Ambient = Color3.fromRGB(0, 0, 0)
        lighting.FogEnd = workspace.Info.BlackOut.Value and 100 or 200
        lighting.GlobalShadows = true
    end
end

function self.IsChased()
    local chaseIcon = PlayerGui.ScreenGui.MonsterIcon

    return chaseIcon.Image == "rbxassetid://18141936824" and chaseIcon.ImageTransparency < 1
end

function self.FloorActive()
    local info = workspace:FindFirstChild("Info")
    local floorActive = info and info:FindFirstChild("FloorActive")
    local panic = info and info:FindFirstChild("Panic")

    if floorActive and panic then
        return floorActive.Value and not panic.Value
    end
end

function self.GetAvailableGenerator(): Model
    local dangerObjName = {"SproutTendril", "BassieChunk", "BlotHandZone"}

    local function CheckGenerator(generator: Model)
        local stats = generator:FindFirstChild("Stats")
        local activePlr = stats.ActivePlayer.Value
        local dangerous = false

        if stats.Connie.Value then return end

        local function searchDanger(path: Instance)
            if dangerous then return end

            local safefol = path:FindFirstChild(path.Name .. "Safe")

            if not safefol and path ~= workspace then
                safefol = Instance.new("Folder", path)
                safefol.Name = path.Name .. "Safe"
            end

            for _, obj in path:GetChildren() do
                if obj:IsA("Terrain") or not (obj:IsA("Model") or obj:IsA("BasePart")) then continue end

                local objHrp = obj:FindFirstChild("HumanoidRootPart")
                local nameMatch

                for _, name in dangerObjName do
                    if nameMatch then break end

                    nameMatch = obj.Name:match(name)
                end

                if safefol and not nameMatch then
                    obj.Parent = safefol
                end

                if nameMatch and ((objHrp and objHrp.Position or obj:GetPivot().Position) - generator.Prompt.Position).Magnitude < 30 then
                    dangerous = true

                    return
                end
            end
        end

        for _, char in workspace.InGamePlayers:GetChildren() do
            if char == Player.Character then continue end

            local charHrp = char:FindFirstChild("HumanoidRootPart")

            if charHrp and (charHrp.Position - generator.Prompt.Position).Magnitude < (charHrp.Anchored and 10 or 20) then
                dangerous = true

                break
            end
        end

        task.spawn(searchDanger, self.room.FreeArea)
        task.spawn(searchDanger ,self.room)
        task.spawn(searchDanger ,workspace)

        if stats and not stats.Completed.Value and (not activePlr or activePlr == Player.Character) and not dangerous then
            return generator
        end
    end

    for _, generator in self.room.Generators:GetChildren() do
        local available = CheckGenerator(generator)

        if available then return available end
    end
end

function self.Generate(generator)
    local prompt = generator.Prompt.Attachment.ProximityPrompt

    if fireproximityprompt and getexecutorname() ~= "Xeno" then
        fireproximityprompt(prompt)

    else
        workspace.CurrentCamera.CFrame = CFrame.lookAt(workspace.CurrentCamera.CFrame.Position, Vector3.new(-712.4114379882812, 101.15324401855469, -154.66770935058594) + Vector3.new(-0.8370537757873535, 0, 3.4483642578125))

        local char = Player.Character
        local hrp = char and char:FindFirstChild("HumanoidRootPart")

        if not hrp then return end

        local function ToggleItemPrompts(enable: boolean)
            local childs = self.room.Items:GetChildren()

            if childs[1] and childs[1].Prompt.ProximityPrompt.Enabled == enable then return end

            for _, v in self.room.Items:GetChildren() do
                v.Prompt.ProximityPrompt.Enabled = enable
            end
        end

        if not hrp.Anchored then
            ToggleItemPrompts(false)
            prompt:InputHoldBegin()
            prompt:InputHoldEnd()

        else
            ToggleItemPrompts(true)
        end
    end
end

function self.StopGenerate()
    local char = Player.Character
    local hrp = char and char:FindFirstChild("HumanoidRootPart")

    if hrp and not hrp.Anchored then return end

    for _, generator in self.room.Generators:GetChildren() do
        local stats = generator.Stats

        if stats.ActivePlayer.Value == Player.Character then
            stats.StopInteracting:FireServer("Stop")
        end
    end
end

function self.TPNoDanger(des)
    local char = Player.Character
    local hrp = char and char:FindFirstChild("HumanoidRootPart")

    if not hrp then return end

    for _, obj in self.room.FreeArea:GetChildren() do
        if obj.Name ~= "SproutTendril" then continue end

        local objHrp = obj:FindFirstChild("HumanoidRootPart")
        local objPos = (objHrp and objHrp.Position or obj:GetPivot().Position)

        if (objPos - des.Position).Magnitude < 30 then
            self.TPNoDanger(des - Vector3.new(0, 15, 0))

            return
        end
    end

    hrp.Anchored = false
    hrp.CFrame = des
    hrp.AssemblyLinearVelocity = Vector3.zero
end

function self.TPElevater()
    local char = Player.Character
    local hrp = char and char:FindFirstChild("HumanoidRootPart")
    local hum = char and char:FindFirstChild("Humanoid")

    if not hrp or not hum then return end

    local cf = hrp.CFrame
    local offset = (cf.Position - (workspace.Elevators.Elevator.Base.Position + Vector3.new(0, hum.HipHeight+1.5, 0)))

    hrp.Anchored = false
    hrp.CFrame = cf - offset
end

function self.CreateTwistedIcon(twisted: string)
	local ScreenGui = Instance.new("ScreenGui")
	local Icon = Instance.new("ImageLabel")
	local UICorner = Instance.new("UICorner")
	local Line = Instance.new("Frame")
	local DistanceLabel = Instance.new("TextLabel")

	ScreenGui.Name = twisted
	ScreenGui.Parent = game:GetService("CoreGui")
	ScreenGui.IgnoreGuiInset = true
	ScreenGui.ResetOnSpawn = true

	Icon.Name = "Icon"
	Icon.Parent = ScreenGui
	Icon.AnchorPoint = Vector2.new(0.5, 0.5)
	Icon.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	Icon.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Icon.BorderSizePixel = 0
	Icon.Position = UDim2.new(-1, 0, -1, 0)
	Icon.Size = UDim2.new(0, 50, 0, 50)

    task.spawn(function()
        local moduleScript = twisted ~= "SquirmMonster" and game:GetService("ReplicatedStorage").MonsterData[twisted] or game:GetService("ReplicatedStorage").MonsterModules.TwistedSquirmConfig
        local success, moduleData = pcall(require, moduleScript)
        local image = ""

        if not success then
            image = decompile(moduleScript):match('Icon%s*=%s*"(.-)"')
        else
            image = moduleData.Icon or moduleData.STATS.Icon
        end

        Icon.Image = image
    end)

	local IconStroke = Instance.new("UIStroke", Icon)
	IconStroke.Color = Color3.fromRGB(255, 255, 255)
	IconStroke.Thickness = 3

	UICorner.CornerRadius = UDim.new(1, 0)
	UICorner.Parent = Icon

	Line.Name = "Line"
	Line.Parent = ScreenGui
	Line.AnchorPoint = Vector2.new(0.5, 0.5)
	Line.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Line.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Line.BorderSizePixel = 0
	Line.Position = UDim2.new(-1, 0, -1, 0)
	Line.Size = UDim2.new(0, 100, 0, 100)
	Line.ZIndex = 0

	DistanceLabel.Name = "DistanceLabel"
	DistanceLabel.Parent = ScreenGui
	DistanceLabel.AnchorPoint = Vector2.new(0.5, 0.5)
	DistanceLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	DistanceLabel.BackgroundTransparency = 1
	DistanceLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
	DistanceLabel.BorderSizePixel = 0
	DistanceLabel.Position = UDim2.new(-1, 0, -1, 0)
	DistanceLabel.Size = UDim2.new(0, 200, 0, 50)
	DistanceLabel.Font = Enum.Font.GothamBold
	DistanceLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	DistanceLabel.TextSize = 20
	DistanceLabel.ZIndex = 2

	local DistanceStroke = Instance.new("UIStroke", DistanceLabel)
	DistanceStroke.Color = Color3.fromRGB(0, 0, 0)
	DistanceStroke.Thickness = 1

    return ScreenGui
end

function self.DeleteTwistedIcon(twisted: string)
	local icon = self._TwistedIcon[twisted]

	if icon then
		self._TwistedIcon[twisted] = icon:Destroy()
	end
end

function self.ClearTwistedIcon()
    local mon_esp_trove = self.Troves.ESPMonster

    if not mon_esp_trove then return end

    self.Troves.ESPMonster = mon_esp_trove:Clean()
end

function self.getFarthestPair(points: {Vector3})
	local maxDist = -math.huge

	for i = 1, #points do
		local dist = (points[i] - self._farthest_from_gen).Magnitude

        if dist > maxDist then
            maxDist = dist
        end
	end

	return maxDist
end

function self.UpdateMonsterIcon(icon: ScreenGui)
    if not self.room then return end

    local camera = workspace.CurrentCamera
	local char = Player.Character
	local hrp = char and char:FindFirstChild("HumanoidRootPart")
    local monsters = self.room:FindFirstChild("Monsters")

	if not hrp then return end

	local padding = 30
	local currentPos = Vector2.new(0, 0)
    local guide = icon:FindFirstChild("Icon")
    local line = icon:FindFirstChild("Line")
    local label = icon:FindFirstChild("DistanceLabel")

    if not guide or not line or not label then return end

    local target = monsters and monsters:FindFirstChild(icon.Name)
    local targethrp = target and (target:FindFirstChild("HumanoidRootPart") or target:FindFirstChild("RootPart"))

    if not targethrp then return end

    local targetpos = targethrp.Position
    local viewportSize = camera.ViewportSize
    local screenPos, onScreen = camera:WorldToViewportPoint(targetpos)

    local targetPos2D = Vector2.new(screenPos.X, screenPos.Y)

    -- Detect behind camera
    local isBehind = screenPos.Z < 0

    -- Clamp to screen edges if off-screen or behind
    if not onScreen or isBehind then
        local center = viewportSize / 2
        local dir = targetPos2D - center

        if isBehind then
            dir = -dir
        end

        dir = dir.Unit

        -- account for GUI size so it doesn't clip
        local halfGui = guide.AbsoluteSize / 2

        local limitX = (viewportSize.X / 2) - padding - halfGui.X
        local limitY = (viewportSize.Y / 2) - padding - halfGui.Y

        local scaleX = limitX / math.abs(dir.X)
        local scaleY = limitY / math.abs(dir.Y)

        local scale = math.min(scaleX, scaleY)

        targetPos2D = center + dir * scale
    end

    -- LERP movement (smooth)
    currentPos = targetPos2D

    guide.Position = UDim2.fromOffset(currentPos.X, currentPos.Y)

    -- === LINE LOGIC ===
    local center = viewportSize / 2
    local dir = targetPos2D - center
    local length = dir.Magnitude

    -- position line at midpoint
    line.Position = UDim2.fromOffset(
        center.X + dir.X / 2,
        center.Y + dir.Y / 2
    )

    -- set length (width) and thickness
    line.Size = UDim2.fromOffset(length, 2)

    -- rotate line
    line.Rotation = math.deg(math.atan2(dir.Y, dir.X))

    -- === DISTANCE LABEL ===
    label.Position = UDim2.fromOffset(
        center.X + dir.X / 2,
        center.Y + dir.Y / 2
    )

    -- world distance (3D, not screen distance)
    local worldDistance = (hrp.Position - targetpos).Magnitude

    label.Text = string.format("%.0f Studs", worldDistance)

    -- color change
    local GB_value = math.min(worldDistance, 255)*4.5
    local color = Color3.fromRGB(255, GB_value, GB_value)
    guide.UIStroke.Color = color
    line.BackgroundColor3 = color
    label.TextColor3 = color
end

function self.GetClosetElevator(host: BasePart)
    local closet_ele
    local closet_distance = 40

    for _, elevator in workspace.Elevators:GetChildren() do
        local dis = (elevator.spawn.Position - host.Position).Magnitude

        if dis < closet_distance then
            closet_ele = elevator
        end
    end

    return closet_ele
end

function self.GetFarthestComplatedGenerator(): Model?
    local farthest_gen
    local farthest_distance

    for _, v in self.room.Generators:GetChildren() do
        if v.Stats.Completed.Value then
            local distance = (v.Prompt.Position - workspace.Elevators.Elevator.Base.Position).Magnitude

            if not farthest_distance or distance > farthest_distance then
                farthest_distance = distance
                farthest_gen = v
            end
        end
    end

    return farthest_gen
end

function self.DistractorGenCountCheck()
    local info = workspace.Info
    local gen_count = info.GeneratorsCompleted.Value

    if self._last_gen_count ~= gen_count then
        self._last_gen_count = gen_count
        self._last_gen_count_change = tick()
    end

    if self._last_gen_count_change and tick() - self._last_gen_count_change > 60 then
        self._last_gen_count_change = tick()

        local farthest_completed_gen = self.GetFarthestComplatedGenerator()

        if farthest_completed_gen then
            local gen_pos = farthest_completed_gen.ScrapsAttachPoint.CFrame
            self._farthest_from_gen = gen_pos.Position - gen_pos.LookVector * 3
        end
    end
end

function self.UseAblity(...)
    game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("AbilityEvent"):InvokeServer(...)
end

function self.NormalMode()
    local char = Player.Character
    local hrp = char and char:FindFirstChild("HumanoidRootPart")
    local no_offense = {"RazzleDazzleMonster", "RodgerMonster", "BlottMonster", "ConnieMonster", "SquirmMonster"}

    if not hrp then return end

    local generator = self.GetAvailableGenerator()
    local spotted = self.IsChased()
    local geneStats = generator and generator:FindFirstChild("Stats")

    if self._distractor_start_pos then
        self._distractor_start_pos = nil
        self._farthest_from_gen = nil
    end

    if not geneStats then
        self.TPNoDanger(CFrame.new(workspace.Elevators.Elevator.Base.Position - Vector3.new(0, 20, 0)))

        return
    end

    local prompt = generator.Prompt
    local closetmon = self.GetClosetMon(prompt)
    local monhrp = closetmon and closetmon:FindFirstChild("HumanoidRootPart")
    local is_mon_close = not table.find(no_offense, closetmon.Name) and monhrp and (monhrp.Position - prompt.Position).Magnitude < 20

    if spotted or tick() - (self._last_spotted or 0) < 5 or is_mon_close then
        if spotted then
            self._last_spotted = tick()
        end

        self.StopGenerate()
        self.TPNoDanger(CFrame.new(prompt.Position - Vector3.new(0, 15, 0)))

    elseif geneStats.ActivePlayer.Value ~= Player.Character then
        if hrp.Anchored then
            self.StopGenerate()
        end

        self.TPNoDanger(generator.ScrapsAttachPoint.CFrame)
        self.Generate(generator)

    elseif geneStats.ActivePlayer.Value == Player.Character then
        hrp.CFrame = generator.ScrapsAttachPoint.CFrame
        hrp.AssemblyLinearVelocity = Vector3.zero
    end
end

function self.DistractorMode()
    local char = Player.Character
    local hrp = char and char:FindFirstChild("HumanoidRootPart")
    local no_offense = {"RazzleDazzleMonster", "RodgerMonster", "BlottMonster", "ConnieMonster", "SquirmMonster"}

    if not hrp then return end
    if not self.room:FindFirstChild("Monsters") then return end
    if not self.room:FindFirstChild("FreeArea") then return end

    self.DistractorGenCountCheck()

    if not self._distractor_start_pos then
        self._distractor_start_pos = hrp.CFrame
    end

    if not self._farthest_from_gen then
        for _, v in self.room.Monsters:GetChildren() do
            if table.find(no_offense, v.Name) then continue end

            for _, gen in self.room.Generators:GetChildren() do
                local old_ds = self._farthest_from_gen and (self._farthest_from_gen - gen.Prompt.Position).Magnitude
                local pos = v.HumanoidRootPart.Position
                local ds = (pos - gen.Prompt.Position).Magnitude

                if not old_ds or ds > old_ds then
                    self._farthest_from_gen = pos
                end
            end
        end
    end

    if not self._farthest_from_gen then
        self.TPNoDanger(CFrame.new(workspace.Elevators.Elevator.Base.Position - Vector3.new(0, 20, 0)))

        return
    end

    local monpos = {}

    for _, v in self.room.Monsters:GetChildren() do
        if table.find(no_offense, v.Name) then continue end
        if v.Name == "GlistenMonster" and not v:GetAttribute("GlistenActivated") then continue end

        if v:FindFirstChild("Grabbing") and v.Grabbing.Value then
            self._last_long_atk = tick()

            break
        end

        table.insert(monpos, v.HumanoidRootPart.Position + Vector3.new(0, 15, 0))
    end

    for _, v in self.room.FreeArea:GetChildren() do
        if v.Name == "SproutTendril" then
            local objHrp = v:FindFirstChild("HumanoidRootPart")
            local objPos = (objHrp and objHrp.Position or v:GetPivot().Position)
            local dist = (objPos - hrp.Position).Magnitude
            local attacking = v:FindFirstChild("Attacking")

            if attacking and attacking.Value and dist < 30 then
                self._last_long_atk = tick()

                break
            end
        end
    end

    if tick() - (self._last_long_atk or 0) < 2 then
        self.TPNoDanger(CFrame.new(self._farthest_from_gen + Vector3.new(0, 200, 0)))

        return
    end

    local s = self.getFarthestPair(monpos)

    if s > 20 then
        if not self._monster_step then self._monster_step = 0 end

        if not self._last_mon_step or tick() - self._last_mon_step > (self._on_farthest_pos and 0.5 or 0.2) then
            self._last_mon_step = tick()
            self._monster_step += 1

            if self._on_farthest_pos then
                self._on_farthest_pos = false
                self._monster_step = 1
            end
        end

        if self._monster_step > #monpos then
            self._on_farthest_pos = true
        end

        hrp.CFrame = CFrame.new(self._on_farthest_pos and self._farthest_from_gen + Vector3.new(0, 20, 0) or monpos[self._monster_step])
        hrp.AssemblyLinearVelocity = Vector3.zero

    else
        hrp.CFrame = CFrame.new(self._farthest_from_gen + Vector3.new(0, 20, 0))
        hrp.AssemblyLinearVelocity = Vector3.zero
    end
end

-- ═══════════════════════════════════════════════════════════════
--  ⭐ PRIORITY FUNCTIONS ⭐
-- ═══════════════════════════════════════════════════════════════
local PriorityFunctions = {}
function PriorityFunctions.AutoPlay()
    if game.PlaceId ~= SERVERS.InGame then return end

    self.PriorityFarming = true

    local char = Player.Character
    local stats = char and char:FindFirstChild("Stats")
    local game_info = workspace.Info

    if self.FloorActive() then
        if not self.room then return end

        if self.Settings.AutoPlayMode == "Normal" then -- normal mode
            self.NormalMode()

        elseif self.Settings.AutoPlayMode == "Distractor" then -- distractor mode
            self.DistractorMode()
        end

    else
        if self.Settings.AutoPlayMode == "Distractor" and self.room and game_info.Panic.Value and (game_info.PanicTimer.Value > 1 and game_info.PlayersInElevator.Value < game_info.ActivePlayers.Value-1) then
            self.DistractorMode()

        elseif stats and not stats.InElevator.Value then
            self.TPElevater()

            if self._farthest_from_gen then
                self._farthest_from_gen = nil
                self._distractor_start_pos = nil
            end
        end
    end
end

-- ═══════════════════════════════════════════════════════════════
--  🤖 AUTOMATION FUNCTIONS 🤖
-- ═══════════════════════════════════════════════════════════════
local AutomationFunctions = {}
function AutomationFunctions.AutoSkillCheck()
    if game.PlaceId ~= SERVERS.InGame then return end

    local Screen = PlayerGui:FindFirstChild("ScreenGui")
    local Menu = Screen and Screen:FindFirstChild("Menu")
    local CircleSkillCheckGui = PlayerGui:FindFirstChild("CircleSkillCheckGui")
    local SkillCheckFrame = (CircleSkillCheckGui and CircleSkillCheckGui:FindFirstChild("SkillCheckFrame")) or (Menu and Menu:FindFirstChild("SkillCheckFrame"))
    local Container = SkillCheckFrame and SkillCheckFrame:FindFirstChild("Container")
    local marker = (Container and Container:FindFirstChild("ShrinkingCircle")) or (SkillCheckFrame and SkillCheckFrame:FindFirstChild("Marker"))
    local goldArea = (Container and Container:FindFirstChild("YellowCircle")) or (SkillCheckFrame and SkillCheckFrame:FindFirstChild("GoldArea"))

    if PlayerGui:FindFirstChild("TreadmillTapSkillCheckGui") then
        if not self._last_treadmill or tick() - self._last_treadmill > 0.1 then
            self._last_treadmill = tick()

            AuctusAPI:SendKey(Enum.KeyCode.Space)
        end

        return
    end

    if not marker or not goldArea then return end

    local char = Player.Character
    local hrp = char and char:FindFirstChild("HumanoidRootPart")

    if char and char.Parent and hrp and hrp.Anchored then
        AuctusAPI:ExitRobloxMenu(0.3)
    end

    if self._lastskillcheck and tick() - self._lastskillcheck < 1 then return end

    local function isTouching(gui1, gui2)
        return gui1.AbsolutePosition.X > gui2.AbsolutePosition.X
    end

    if SkillCheckFrame.Visible and isTouching(marker, goldArea) then
        self._lastskillcheck = tick()

        AuctusAPI:SendKey(Enum.KeyCode.Space)
    end
end

function AutomationFunctions.ESP()
    if game.PlaceId ~= SERVERS.InGame then return end
    if not self.room or not self.room.Parent then return end

    self.ESP(self.room:FindFirstChild("Generators"), self.Settings.ESPGenerator, Color3.fromRGB(0, 83, 227))
    self.ESP(self.room:FindFirstChild("Monsters"), self.Settings.ESPTwisted, Color3.fromRGB(255, 0, 0))
    self.ESP(self.room:FindFirstChild("Items"), self.Settings.ESPItem, Color3.fromRGB(246, 255, 0))
    self.ESP(workspace:FindFirstChild("InGamePlayers"), self.Settings.ESPToon, Color3.fromRGB(0, 255, 0))
end

function AutomationFunctions.AutoRun()
    self.Run(true)
end

function AutomationFunctions.AutoSetSpeed()
    if game.PlaceId ~= SERVERS.InGame then return end

    local char = Player.Character
    local humanoid = char and char:FindFirstChild("Humanoid")

    if not humanoid then return end

    if not self.Settings.SelectSpeed then
        local stats = char and char:FindFirstChild("Stats")
        local runspeed = stats and stats:FindFirstChild("RunSpeed")

        humanoid.WalkSpeed = runspeed.Value

    else
        humanoid.WalkSpeed = self.Settings.SelectSpeed
    end
end

function AutomationFunctions.FullBright()
    self.FullBright(self.Settings.AutoFullBright)
end

function AutomationFunctions.AutoReady()
    if game.PlaceId ~= SERVERS.InGame then return end

    local selectionFrame = PlayerGui.ScreenGui:FindFirstChild("SelectionFrame")
    local selfTeamFrame = selectionFrame and selectionFrame.Margin.TeamFrame:FindFirstChild(Player.Name)

    if selectionFrame.Visible and selfTeamFrame and not selfTeamFrame.ReadyText.Visible then
        game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("ReadyUpEvent"):FireServer("ReadyUp")
    end
end

function AutomationFunctions.AutoEscapeSquirm()
    if game.PlaceId ~= SERVERS.InGame then return end

    local squirmGui = PlayerGui:FindFirstChild("TwistedSquirmEscapeUI")

    if squirmGui and squirmGui.Enabled then
        if not self._last_squirm or tick() - self._last_squirm > 0.1 then
            self._last_squirm = tick()
            self._squirmRight = not self._squirmRight

            if self._squirmRight then
                AuctusAPI:SendKey(Enum.KeyCode.D)

            else
                AuctusAPI:SendKey(Enum.KeyCode.A)
            end
        end
    end
end

function AutomationFunctions.AutoJoin()
    if game.PlaceId ~= SERVERS.Lobby then return end

    local char = Player.Character
    local hrp = char and char:FindFirstChild("HumanoidRootPart")
    local partyGui = PlayerGui.MainGui.fillParty

    if not hrp then return end

    if self.Settings.SelectJoinWithPlayer and self.Settings.AutoJoinWithPlayer then
        local target_char = workspace.Players:FindFirstChild(self.Settings.SelectJoinWithPlayer)
        local target_hrp = target_char and target_char:FindFirstChild("HumanoidRootPart")

        if target_hrp and hrp then
            local closet_elevator = self.GetClosetElevator(target_hrp)

            if not closet_elevator then return end

            local origin = closet_elevator.spawn.Position + Vector3.new(0, 3, 0)
            local dir = target_hrp.Position - origin
            local params = RaycastParams.new()
            params.FilterDescendantsInstances = {closet_elevator.Elevator, target_char}
            params.FilterType = Enum.RaycastFilterType.Include

            local rayresult = workspace:Raycast(origin, dir, params)
            local dis = (hrp.Position - target_hrp.Position).Magnitude

            if rayresult and rayresult.Instance and rayresult.Instance:IsDescendantOf(target_char) and (dis > 50 or not partyGui.Visible) then
                local gatepos = closet_elevator.Gate.CFrame

                firetouchinterest(closet_elevator.Gate, hrp, 0)
                task.delay(0.1, firetouchinterest, closet_elevator.Gate, hrp, 0)

                closet_elevator.Gate.CFrame = gatepos
            end
        end

    else
        if partyGui.Visible then return end

        for _, gate in workspace.Elevators:GetChildren() do
            local available = gate.GuiPart.SurfaceGui.Frame.players.Text:sub(1,1)

            if available == "0" then
                local gatepos = gate.Gate.CFrame

                firetouchinterest(gate.Gate, hrp, 0)
                task.delay(0.1, firetouchinterest, gate.Gate, hrp, 0)

                gate.Gate.CFrame = gatepos

                return
            end
        end
    end
end

function AutomationFunctions.AutoJoinMatchMaking()
    if game.PlaceId ~= SERVERS.Lobby then return end

    local partyGui = PlayerGui.MainGui.fillParty

    if partyGui.Visible then
        if not self._join_room_tick then
            self._join_room_tick = tick()
        end

    else
        self._join_room_tick = nil
    end

    if self._join_room_tick and tick() - self._join_room_tick > (self.Settings.JoinMatchMakingDelay or 0) then
        game:GetService("ReplicatedStorage"):WaitForChild("SharedUtils"):WaitForChild("Network"):WaitForChild("RemoteEvent"):FireServer("VoteMatch")

        self._join_room_tick = nil
    end
end

function AutomationFunctions.AutoReturnToLobby()
    if game.PlaceId ~= SERVERS.InGame then return end

    local spectatorGui = PlayerGui:WaitForChild("SpectatorGui")
    local deathGui = PlayerGui:WaitForChild("DeathGui"):WaitForChild("DeathScreen")

    if not spectatorGui.Enabled and not deathGui.Visible then return end

    if not self._last_teleport_request or tick() - self._last_teleport_request > 1 then
        game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Teleport"):FireServer()
    end
end

function AutomationFunctions.AutoUseAbility()
    local Character = Player.Character
    local toon = Character and Character:GetAttribute("ModuleName")
    local tape = tonumber(PlayerGui.ScreenGui.Menu.BottomLeftCorner.Status.Bottom.StaminaBin.InfoBin.PointBin.PointFrame.TextLabel.Text)

    if not toon or not self.FloorActive() then return end

    if toon == "Sprout" and tape >= 100 then
        if Character.Abilities.Ability1.CurrentCooldown.Value ~= 0 then return end

        for _, char in workspace.InGamePlayers:GetChildren() do
            if char == Character then continue end

            local hum = char:FindFirstChild("Humanoid")

            if hum and hum.Health < hum.MaxHealth then
                self.UseAblity(Character, char.HumanoidRootPart.CFrame, char)
            end
        end

    elseif toon == "Vee" then
        if Character.Abilities.Ability1.CurrentCooldown.Value ~= 0 then return end

        self.UseAblity(Character, Character.HumanoidRootPart.CFrame, false)
    end
end

-- ═══════════════════════════════════════════════════════════════
--  🔰 INIT 🔰
-- ═══════════════════════════════════════════════════════════════
for _, func in InitFunctions do
    local s, r = pcall(func); if not s then warn(r) end
end

-- ═══════════════════════════════════════════════════════════════
--  🪟 CREATE GUI 🪟
-- ═══════════════════════════════════════════════════════════════
do
    local Cassade = AuctusAPI.CreateApp("Cassade", GAME, self)
    self.Cassde = Cassade

    Cassade:Section("MainSection", {Disclosure = true, Title = "Main"})

        Cassade:Tab("Automation", "MainSection", {Selected = true, Title = "Automation", Icon = Cassade.cassade.Symbols.house})
            Cassade:Form("AutoFarmSettings", "Automation", {Title = "Auto Farm Settings"})
            Cassade:Form("AutoFarm", "Automation", {Title = "Farm"})

        Cassade:Tab("AutoJoin", "MainSection", {Title = "Auto Join", Icon = Cassade.cassade.Symbols.doorLeftHandOpen})
            Cassade:Form("LobbyForm", "AutoJoin", {Title = "Lobby"})
            Cassade:Form("InGameForm", "AutoJoin", {Title = "In Game"})

        Cassade:Tab("LocalPlayer", "MainSection", {Title = "Local Player", Icon = Cassade.cassade.Symbols.person})
            Cassade:Form("PlayerSpeed", "LocalPlayer", {Title = "Player Speed"})
            Cassade:Form("AbilityForm", "LocalPlayer", {Title = "Ability"})

        Cassade:Tab("Visual", "MainSection", {Title = "Visual", Icon = Cassade.cassade.Symbols.eye})
            Cassade:Form("ESP", "Visual", {Title = "ESP"})
            Cassade:Form("Visual", "Visual", {Title = "Visual"})

    Cassade:Section("SettingsSection", {Disclosure = true, Title = "Settings"})
        Cassade:Tab("PriorityTab", "SettingsSection", {Title = "Priority", Icon = Cassade.cassade.Symbols.star})
            Cassade:Form("SetPriority", "PriorityTab", {Title = "Set Priority"})
            Cassade:Form("PriorityFunctions", "PriorityTab", {Title = "Priority"})

        Cassade:Tab("SettingTab", "SettingsSection", {Title = "Settings", Icon = Cassade.cassade.Symbols.gearshape})
            Cassade:Form("ScriptSettings", "SettingTab", {Title = "Script"})

        Cassade:CreateSetting("SettingsSection")

    do -- Automation tab

        do -- Settings Form
            do -- select auto play mode
                local row = Cassade:Row("SelectAutoPlayMode", "AutoFarmSettings", "Auto Play Mode")

                row:Right():PopUpButton({
                    Options = {"Normal", "Distractor"},
                    Value = self.Settings.AutoPlayMode == "Distractor" and 2 or 1,
                    ValueChanged = function(_self, value: number)
                        self.Settings.AutoPlayMode = _self.Options[value]
                        self.SaveSetting()
                    end,
                })
            end
        end

        do -- Auto Farm Form
            do -- Auto Play
                local row = Cassade:Row("AutoPlayRow", "AutoFarm", "Auto Play")

                row:Right():Toggle({
                    Value = self.Settings.AutoPlay or false,
                    ValueChanged = function(_self, value: boolean)
                        self.Settings.AutoPlay = value
                        self.SaveSetting()

                        if not value and self._distractor_start_pos then
                            local char = Player.Character
                            local hrp = char and char:FindFirstChild("HumanoidRootPart")

                            if not hrp then return end

                            hrp.CFrame = self._distractor_start_pos
                            hrp.AssemblyLinearVelocity = Vector3.zero

                            self._distractor_start_pos = nil
                            self._farthest_from_gen = nil
                        end
                    end
                })
            end

            do -- Auto Skill Check
                local row = Cassade:Row("AutoSkillCheckRow", "AutoFarm", "Auto Skill Check")

                row:Right():Toggle({
                    Value = self.Settings.AutoSkillCheck or false,
                    ValueChanged = function(_self, value: boolean)
                        self.Settings.AutoSkillCheck = value
                        self.SaveSetting()
                    end
                })
            end

            do -- auto close popup
                local row = Cassade:Row("AutoClosePopupRow", "AutoFarm", "Auto Close Vee Popup")

                row:Right():Toggle({
                    Value = self.Settings.AutoClosePopup or false,
                    ValueChanged = function(_self, value: boolean)
                        self.Settings.AutoClosePopup = value
                        self.Signal:Fire("AutoClosePopup", value)
                        self.SaveSetting()
                    end
                })
            end

            do -- auto escape Squirm
                local row = Cassade:Row("AutoEscapeSquirmRow", "AutoFarm", "Auto Escape Squirm")

                row:Right():Toggle({
                    Value = self.Settings.AutoEscapeSquirm or false,
                    ValueChanged = function(_self, value: boolean)
                        self.Settings.AutoEscapeSquirm = value
                        self.SaveSetting()
                    end
                })
            end
        end

    end

    do -- Auto Join tab

        do -- Lobby Form
            do -- Auto Join
                local row = Cassade:Row("AutoJoinRow", "LobbyForm", "Auto Join")

                row:Right():Toggle({
                    Value = self.Settings.AutoJoin or false,
                    ValueChanged = function(_self, value: boolean)
                        self.Settings.AutoJoin = value
                        self.SaveSetting()
                    end
                })
            end

            do -- Auto Join With Player
                local row = Cassade:Row("AutoJoinWithPlayerRow", "LobbyForm", "Join With Player")

                row:Right():TextField({
                    Placeholder = "Player ...",
                    Value = self.Settings.SelectJoinWithPlayer or "",
                    TextChanged = function(_self, value: string)
                        self.Settings.SelectJoinWithPlayer = value
                        self.SaveSetting()
                    end,
                })

                row:Right():Toggle({
                    Value = self.Settings.AutoJoinWithPlayer or false,
                    ValueChanged = function(_self, value: boolean)
                        self.Settings.AutoJoinWithPlayer = value
                        self.SaveSetting()
                    end
                })
            end

            do -- Auto Join Match Making
                local row = Cassade:Row("AutoJoinMatchMakingRow", "LobbyForm", "Join Matchmaking")

                row:Right():TextField({
                    Placeholder = "Delay ...",
                    Value = self.Settings.JoinMatchMakingDelay or "",
                    TextChanged = function(_self, value: string)
                        self.Settings.JoinMatchMakingDelay = tonumber(value)
                        self.SaveSetting()
                    end,
                })

                row:Right():Toggle({
                    Value = self.Settings.AutoJoinMatchMaking or false,
                    ValueChanged = function(_self, value: boolean)
                        self.Settings.AutoJoinMatchMaking = value
                        self.SaveSetting()
                    end
                })
            end
        end

        do -- In Game Form
            do -- Auto Ready
                local row = Cassade:Row("AutoReadyRow", "InGameForm", "Auto Ready")

                row:Right():Toggle({
                    Value = self.Settings.AutoReady or false,
                    ValueChanged = function(_self, value: boolean)
                        self.Settings.AutoReady = value
                        self.SaveSetting()
                    end
                })
            end

            do -- Auto Return To Lobby
                local row = Cassade:Row("AutoReturnToLobbyRow", "InGameForm", "Auto Return To Lobby")

                row:Right():Toggle({
                    Value = self.Settings.AutoReturnToLobby or false,
                    ValueChanged = function(_self, value: boolean)
                        self.Settings.AutoReturnToLobby = value
                        self.SaveSetting()
                    end
                })
            end
        end

    end

    do -- Local Player tab
        do -- Player Speed Form
            do -- Auto Set speed
                local row = Cassade:Row("AutoSetSpeedRow", "PlayerSpeed", "Set Speed")

                row:Right():TextField({
                    Placeholder = "Speed ...",
                    Value = self.Settings.SelectSpeed or "",
                    TextChanged = function(_self, value: string)
                        self.Settings.SelectSpeed = tonumber(value)
                        self.SaveSetting()
                    end,
                })

                row:Right():Toggle({
                    Value = self.Settings.AutoSetSpeed or false,
                    ValueChanged = function(_self, value: boolean)
                        self.Settings.AutoSetSpeed = value
                        self.SaveSetting()

                        if not value then
                            self.Run(false)
                        end
                    end
                })
            end

            do -- Auto Run
                local row = Cassade:Row("AutoRunRow", "PlayerSpeed", "Auto Run")

                row:Right():Toggle({
                    Value = self.Settings.AutoRun or false,
                    ValueChanged = function(_self, value: boolean)
                        self.Settings.AutoRun = value
                        self.SaveSetting()

                        if not value then
                            self.Run(false)
                        end
                    end
                })
            end
        end

        do -- Ability Form
            do -- noclip
                local row = Cassade:Row("NoclipRow", "AbilityForm", "Noclip")

                row:Right():Toggle({
                    Value = self.Settings.AutoNoclip or false,
                    ValueChanged = function(_self, value: boolean)
                        self.Settings.AutoNoclip = value
                        self.Signal:Fire("AutoNoclip", value)
                        self.SaveSetting()
                    end
                })
            end

            do -- Auto Use Ability
                local row = Cassade:Row("AutoUseAbilityRow", "AbilityForm", "Auto Use Ability")

                row:Right():Toggle({
                    Value = self.Settings.AutoUseAbility or false,
                    ValueChanged = function(_self, value: boolean)
                        self.Settings.AutoUseAbility = value
                        self.SaveSetting()
                    end
                })
            end
        end
    end

    do -- Visual tab
        do -- ESP Form
            do -- ESP Generator
                local row = Cassade:Row("ESPGeneratorRow", "ESP", "Generators")

                row:Right():Toggle({
                    Value = self.Settings.ESPGenerator or false,
                    ValueChanged = function(_self, value: boolean)
                        self.Settings.ESPGenerator = value
                        self.SaveSetting()
                    end
                })
            end

            do -- ESP Twisted
                local row = Cassade:Row("ESPTwistedRow", "ESP", "Twisted")

                row:Right():Toggle({
                    Value = self.Settings.ESPTwisted or false,
                    ValueChanged = function(_self, value: boolean)
                        self.Settings.ESPTwisted = value
                        self.Signal:Fire("ESPTwisted", value)
                        self.SaveSetting()
                    end
                })

                --self.IconSignl:Fire(self.Settings.ESPTwisted)
            end

            do -- ESP item
                local row = Cassade:Row("ESPItemRow", "ESP", "Items")

                row:Right():Toggle({
                    Value = self.Settings.ESPItem or false,
                    ValueChanged = function(_self, value: boolean)
                        self.Settings.ESPItem = value
                        self.SaveSetting()
                    end
                })
            end

            do -- ESP Toon
                local row = Cassade:Row("ESPToonRow", "ESP", "Toons")

                row:Right():Toggle({
                    Value = self.Settings.ESPToon or false,
                    ValueChanged = function(_self, value: boolean)
                        self.Settings.ESPToon = value
                        self.SaveSetting()
                    end
                })
            end
        end

        do -- Visual Form
            do -- fullbright
                local row = Cassade:Row("FullBrightRow", "Visual", "Full Bright")

                row:Right():Toggle({
                    Value = self.Settings.AutoFullBright or false,
                    ValueChanged = function(_self, value: boolean)
                        self.Settings.AutoFullBright = value
                        self.SaveSetting()
                    end
                })
            end
        end
    end

    do -- Priority Tab
        local row = Cassade:Row("SetPriorityRow", "SetPriority", "")

        local selected_function
        local selected_priority

        row:Left():Label({Text = "      "})
        local flb = row:Left():Label({Text = "Functions : "})
        row:Left():PopUpButton({
            Options = (function()
                local functions = {}
                for funcname in self.Settings.Priority do
                    table.insert(functions, funcname)
                end
                return functions
            end)(),
            Value = 0,
            ValueChanged = function(_self, value: number)
                selected_function = _self.Options[value]
            end,
        })

        row:Left():Label({Text = "   |   "})

        local plb = row:Left():Label({Text = "Priority : "})
        local pField = row:Left():TextField({
            Placeholder = "...",
            TextChanged = function(_self, value: string)
                selected_priority = value
            end,
        })

        local function SendNotify(Title: string, SubTitle: string, Duration: number)
            self.app:Notification({
                App = Title,
                Title = SubTitle,
                Duration = Duration,
            })
        end

        row:Right():Button({
            Label = "Set",
            State = "Primary",
            Pushed = function(_self)
                if not selected_function or not selected_priority then
                    SendNotify("🔴 Set Priority Error 🔴", "missing function or priority.", 3)

                    return
                end

                local num = tonumber(selected_priority)

                if num then
                    if num <= 0 then
                        SendNotify("🔴 Invalide Priority 🔴", "priority must greater that 0.", 3)

                    else
                        self.SetPriority(selected_function, num)
                        self.SaveSetting()
                    end

                else
                    SendNotify("🔴 Invalide Priority 🔴", "priority must be number.", 3)
                end
            end,
        })

        task.delay(0.1, function()
            flb.TextTransparency = 0.25
            plb.TextTransparency = 0.25

            pField.Field.TextXAlignment = Enum.TextXAlignment.Center
        end)
    end

    do -- Setting Tab
        do -- script Form
            do -- auto execute
                local row = Cassade:Row("AutoExecuteRow", "ScriptSettings", "Auto Execute", "execute script when teleport to another server.")

                row:Right():Toggle({
                    Value = self.Settings.AutoExecute or false,
                    ValueChanged = function(_self, value: boolean)
                        self.Settings.AutoExecute = value
                        self.SaveSetting()
                    end
                })
            end
        end
    end
end

-- ═══════════════════════════════════════════════════════════════
--  ♾️ MAIN LOOP ♾️
-- ═══════════════════════════════════════════════════════════════
self.MainLoop = RunService.RenderStepped:Connect(function()
    self.PriorityFarming = false

    local setting = self.Settings
    local Priorities = setting.Priority

    for funcname, func in AutomationFunctions do
        if setting[funcname] or not funcname:match("Auto") then
            func()
        end
    end

    for _, funcname in self.SortedPriority do
        local func_server = Priorities[funcname].Server
        local func = PriorityFunctions[funcname]

        if not self.PriorityFarming and setting[funcname] and func and (SERVERS[func_server] == game.PlaceId or not func_server) then
            func()
        end
    end
end)

-- ═══════════════════════════════════════════════════════════════
--  🗑️ CLEAN UP 🗑️
-- ═══════════════════════════════════════════════════════════════
if getgenv().CleanUpApexHub then
    getgenv().CleanUpApexHub()
end

getgenv().CleanUpApexHub = function()
    for _, v in self do
        if typeof(v) == "thread" then
            task.cancel(v)

        elseif typeof(v) == "RBXScriptConnection" then
            v:Disconnect()
        end
    end

    for _, v in self.Troves do
        v:Clean()
    end

    self.SaveSetting()
    self.Noclip(false)
    self.Run(false)
    self.FullBright(false)
    self.ClearTwistedIcon()

    self.ESP(self.room and self.room:FindFirstChild("Generators"), false)
    self.ESP(self.room and self.room:FindFirstChild("Monsters"), false)
    self.ESP(self.room and self.room:FindFirstChild("Items"), false)
    self.ESP(workspace:FindFirstChild("InGamePlayers"), false)

    pcall(function() self.app:Destroy() end)

    self.Signal:Destroy()
end
