local library = {}
local connections = {
    running = {},
    methods = {
        onMouseEnter = "mouseEnter",
        onMouseLeave = "mouseLeave",
        onMouse1Click = "mouse1Click",
        onMouse2Click = "mouse2Click",
        onActivate = "activated",
        onSliderMoved = "sliderMoved",
        onColorChange = "colorChanged",
    },
}
local family = {
    windowConfig = {
        backgroundColor = "Color3",
        titleBackgroundColor = "Color3",
        titleColor = "Color3",
        titleScaled = "boolean",
        titleTextSize = "number",
        backgroundTransparency = "number",
        titleFont = "EnumItem",
        title = "string",
    },
    textLabelConfig = {
        textColor = "Color3",
        textStrokeColor = "Color3",
        textSize = "number",
        transparency = "number",
        strokeTransparency = "number",
        scaled = "boolean",
        font = "EnumItem",
        text = "string",
    },
    textButtonConfig = {
        textColor = "Color3",
        textStrokeColor = "Color3",
        backgroundColor = "Color3",
        textSize = "number",
        transparency = "number",
        strokeTransparency = "number",
        backgroundTransparency = "number",
        scaled = "boolean",
        font = "EnumItem",
        text = "string",
    },
    connectionMethods = {
        ["TextLabel"] = {
            [connections.methods.onMouseEnter] = true,
            [connections.methods.onMouseLeave] = true,
            [connections.methods.onMouse1Click] = true,
            [connections.methods.onMouse2Click] = true,
        },
        ["List"] = {
            [connections.methods.onMouseEnter] = true,
            [connections.methods.onMouseLeave] = true,
            [connections.methods.onMouse1Click] = true,
            [connections.methods.onMouse2Click] = true,
        },
        ["ListSelect"] = {
            [connections.methods.onMouseEnter] = true,
            [connections.methods.onMouseLeave] = true,
            [connections.methods.onMouse1Click] = true,
            [connections.methods.onMouse2Click] = true,
        },
        ["Slider"] = {
            [connections.methods.onMouseEnter] = true,
            [connections.methods.onMouseLeave] = true,
            [connections.methods.onMouse1Click] = true,
            [connections.methods.onMouse2Click] = true,
            [connections.methods.onSliderMoved] = true,
        },
        ["CheckButton"] = {
            [connections.methods.onMouseEnter] = true,
            [connections.methods.onMouseLeave] = true,
            [connections.methods.onMouse1Click] = true,
            [connections.methods.onMouse2Click] = true,
            [connections.methods.onActivate] = true,
        },
        ["SelectColor"] = {
            [connections.methods.onMouseEnter] = true,
            [connections.methods.onMouseLeave] = true,
            [connections.methods.onMouse1Click] = true,
            [connections.methods.onMouse2Click] = true,
            [connections.methods.onActivate] = true,
            [connections.methods.onColorChange] = true,
        },
    }
}
local camera = workspace.CurrentCamera
local plr = game.Players.LocalPlayer

local mouse = plr:GetMouse()
local plrgui = syn and game.CoreGui or plr:WaitForChild("PlayerGui")

local uis = game:GetService("UserInputService")
local http = game:GetService("HttpService")
local screenSize
local savedLocalScreenGui

local function createColorPicker(at)
    local Picker = Instance.new("Frame")
    local Colour = Instance.new("Frame")
    local TextLabel = Instance.new("TextLabel")
    local Wheel = Instance.new("ImageButton")
    local Ring = Instance.new("ImageLabel")
    local Slider = Instance.new("ImageButton")
    local Slide = Instance.new("Frame")

    Picker.Name = "Picker"
    Picker.Parent = savedLocalScreenGui
    Picker.AnchorPoint = Vector2.new(0, 1)
    Picker.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    Picker.BackgroundTransparency = 0.400
    Picker.BorderSizePixel = 0
    Picker.Position = at
    Picker.Size = UDim2.new(0, 0, 0, 0)
    Picker.ClipsDescendants = true
    Picker.ZIndex = 0

    Colour.Name = "Colour"
    Colour.Parent = Picker
    Colour.AnchorPoint = Vector2.new(0, 1)
    Colour.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Colour.BorderSizePixel = 0
    Colour.Position = UDim2.new(0, 0, 1, 0)
    Colour.Size = UDim2.new(0.150000006, 0, 0.150000006, 0)
    Colour.SizeConstraint = Enum.SizeConstraint.RelativeYY

    TextLabel.Parent = Colour
    TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel.BackgroundTransparency = 1.000
    TextLabel.Position = UDim2.new(1.5, 0, 0, 0)
    TextLabel.Size = UDim2.new(3, 0, 1, 0)
    TextLabel.Font = Enum.Font.SourceSans
    TextLabel.Text = "255,255,255"
    TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel.TextSize = 14.000
    TextLabel.TextXAlignment = Enum.TextXAlignment.Left

    Wheel.Name = "Wheel"
    Wheel.Parent = Picker
    Wheel.Active = false
    Wheel.BackgroundColor3 = Color3.fromRGB(248, 248, 248)
    Wheel.BackgroundTransparency = 1.000
    Wheel.Position = UDim2.new(0, 0, 0.0299999993, 0)
    Wheel.Selectable = false
    Wheel.Size = UDim2.new(0.800000012, 0, 0.800000012, 0)
    Wheel.SizeConstraint = Enum.SizeConstraint.RelativeYY
    Wheel.AutoButtonColor = false
    Wheel.Image = "rbxassetid://2849458409"

    Ring.Name = "Ring"
    Ring.Parent = Wheel
    Ring.AnchorPoint = Vector2.new(0.5, 0.5)
    Ring.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Ring.BackgroundTransparency = 1.000
    Ring.Position = UDim2.new(0.5, 0, 0.5, 0)
    Ring.Size = UDim2.new(0.0799999982, 0, 0.0799999982, 0)
    Ring.SizeConstraint = Enum.SizeConstraint.RelativeYY
    Ring.Image = "rbxassetid://244221613"
    Ring.ImageColor3 = Color3.fromRGB(0, 0, 0)

    Slider.Name = "Slider"
    Slider.Parent = Wheel
    Slider.Active = false
    Slider.BackgroundColor3 = Color3.fromRGB(248, 248, 248)
    Slider.BorderSizePixel = 0
    Slider.Position = UDim2.new(1.14999998, 0, 0, 0)
    Slider.Selectable = false
    Slider.Size = UDim2.new(0.150000006, 0, 1, 0)
    Slider.SizeConstraint = Enum.SizeConstraint.RelativeYY
    Slider.AutoButtonColor = false
    Slider.Image = "rbxassetid://156579757"

    Slide.Name = "Slide"
    Slide.Parent = Slider
    Slide.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    Slide.BorderSizePixel = 0
    Slide.Size = UDim2.new(1, 0, 0.0399999991, 0)
    game.TweenService:Create(Picker,TweenInfo.new(0.4),{Size = UDim2.new(0, 142, 0, 132)}):Play()
    return Picker,Colour,TextLabel,Wheel,Ring,Slide,Slider
end
local ceil,clamp,atan2,pi   = math.ceil,math.clamp,math.atan2,math.pi
local tostr,sub             = tostring,string.sub
local fromHSV               = Color3.fromHSV
local v2,udim2              = Vector2.new,UDim2.new

local UserInputService  = game:GetService("UserInputService")
local Mouse             = game.Players.LocalPlayer:GetMouse()
local function connectColorSelector(callback,wheel,slider,slide,colour,ring)

    local WheelDown         = false
    local SlideDown         = false


    local function toPolar(v)
        return atan2(v.y, v.x), v.magnitude;
    end

    local function radToDeg(x)
        return ((x + pi) / (2 * pi)) * 360;
    end

    local hue, saturation, value = 0, 0, 1;

    local function update()
        local c = fromHSV(hue, saturation, value);

        colour.BackgroundColor3 = c
        colour.TextLabel.Text   =   sub(tostr(ceil(clamp(c.r*255,0,255))),1,3)..", "..
            sub(tostr(ceil(clamp(c.g*255,0,255))),1,3)..", "..
            sub(tostr(ceil(clamp(c.b*255,0,255))),1,3)
        callback(c)
    end

    local function UpdateSlide(iX,iY)   
        local rY = iY - slider.AbsolutePosition.y;
        local cY = clamp(rY, 0, slider.AbsoluteSize.y - slide.AbsoluteSize.y);
        slide.Position = udim2(0, 0, 0, cY);

        value = 1 - (cY / (slider.AbsoluteSize.y - slide.AbsoluteSize.y));
        slide.BackgroundColor3 = fromHSV(0, 0, 1-value);

        update();
    end
    local function UpdateRing(iX,iY)
        local r = wheel.AbsoluteSize.x/2
        local d = v2(iX, iY) - wheel.AbsolutePosition - wheel.AbsoluteSize/2;

        if (d:Dot(d) > r*r) then
            d = d.unit * r;
        end

        ring.Position = udim2(0.5, d.x, 0.5, d.y);

        local phi, len = toPolar(d * v2(1, -1));
        hue, saturation = radToDeg(phi)/360, len / r;
        slider.BackgroundColor3 = fromHSV(hue, saturation, 1);

        update();
    end


    wheel.MouseButton1Down:Connect(function()
        WheelDown = true
        UpdateRing(Mouse.X,Mouse.Y)
    end)
    slider.MouseButton1Down:Connect(function()
        SlideDown = true
        UpdateSlide(Mouse.X,Mouse.Y)
    end)

    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            WheelDown = false
            SlideDown = false
        end
    end)

    wheel.MouseMoved:Connect(function()
        if WheelDown then
            UpdateRing(Mouse.X,Mouse.Y)
        end
    end)
    slider.MouseMoved:Connect(function()
        if SlideDown then
            UpdateSlide(Mouse.X,Mouse.Y)
        end
    end)
end

local function connectSlider(whatSlider,onChange)
    local ComparableValue
    local Container = whatSlider
    local Slider = whatSlider.mover
    local Dragging
    Slider.MouseButton1Down:Connect(function()
        Dragging = true
        repeat
            Slider.Position = UDim2.new(0,(mouse.X - Container.AbsolutePosition.X),0,0)
            if Slider.Position.X.Offset < 0 then
                Slider.Position = UDim2.new(0,0,0,0)
                whatSlider.main.Size = UDim2.new(0,0,1,0)
            elseif Slider.Position.X.Offset + Slider.Size.X.Offset > Container.AbsoluteSize.X then
                Slider.Position = UDim2.new(0,(Container.AbsoluteSize.X-Slider.Size.X.Offset),0,0)
            end
            ComparableValue = math.clamp((Slider.AbsolutePosition.X-Container.AbsolutePosition.X) / (Container.AbsoluteSize.X-Slider.Size.X.Offset),0,0.98)
            onChange((Slider.AbsolutePosition.X-Container.AbsolutePosition.X) / (Container.AbsoluteSize.X-Slider.Size.X.Offset))
            Slider.Position = UDim2.new(ComparableValue,0,0,0)
            whatSlider.main.Size = UDim2.new(ComparableValue,0,1,0)
            wait()
        until not Dragging
    end)
    mouse.Button1Up:Connect(function()
        Dragging = false
    end)
    Slider.MouseButton1Up:Connect(function()
        Dragging = false
    end)
end

function connections.changeState(self,what,to)
    if self.running[what] then
        self.running[what].state = to
        self.running[what]:call()
    end
end

function connections.setUp(self,method,whatConnection)
    assert(self.setUp,"Expected : got .")
    assert(family.connectionMethods[method],method.." isn't supported by connection")
    local listSelectTable = {}
    local state = false
    local lastSelectedList
    return {
        addOption = function(connSelf,_named,callback)
            if method == "List" or method == "ListSelect" then
                local Option = Instance.new("TextButton")
                Option.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
                Option.Font = Enum.Font.Arial
                Option.Text = _named
                Option.TextColor3 = Color3.fromRGB(255, 255, 255)
                Option.TextScaled = true
                Option.TextStrokeTransparency = 0.4
                Option.Parent = whatConnection.plus.scrolling
                Option.ZIndex = 4
                local ev1,ev2 = nil,nil
                if method == "ListSelect" then
                    ev1 = Option.MouseButton1Click:Connect(function()
                        if not listSelectTable[Option] then
                            listSelectTable[Option] = true
                            game.TweenService:Create(Option,TweenInfo.new(0.2),{TextColor3 = Color3.fromRGB(219,193,255)}):Play()
                        else
                            game.TweenService:Create(Option,TweenInfo.new(0.2),{TextColor3 = Color3.fromRGB(255,255,255)}):Play()
                            listSelectTable[Option] = nil
                        end
                        callback(listSelectTable)
                    end)
                else
                    ev2 = Option.MouseButton1Click:Connect(function()
                        state = not state
                        if lastSelectedList and lastSelectedList ~= Option then
                            game.TweenService:Create(lastSelectedList,TweenInfo.new(0.2),{TextColor3 = Color3.fromRGB(255,255,255)}):Play()
                            state = false
                        end
                        if state then
                            lastSelectedList = Option
                            game.TweenService:Create(Option,TweenInfo.new(0.2),{TextColor3 = Color3.fromRGB(219,193,255)}):Play()
                        else
                            game.TweenService:Create(Option,TweenInfo.new(0.2),{TextColor3 = Color3.fromRGB(255,255,255)}):Play()
                        end
                        whatConnection.plus.scrolling.Visible = false
                        callback(state,Option)
                    end)
                end
                return {
                    remove = function()
                        ev1:Disconnect()
                        ev2:Disconnect()
                        Option:Destroy()
                    end,
                }
            end
        end,
        on = function(connSelf,event,callBack)
            assert(connSelf.on,"Expected : not .")
            assert(family.connectionMethods[method][event],"No such event has been found")
            local prevState
            local lastActivatedCheck = false

            if event == connections.methods.onSliderMoved then
                connectSlider(whatConnection.slider,function(ration)
                    callBack(ration)
                end)
            end
            local Picker,Colour,TextLabel,Wheel,Ring,Slide,Slider
            self.running[event.."/"..whatConnection.Name.."/"..math.random(1,1e9)] = {original=whatConnection,event=event,state="no",call=function(self)
                if prevState ~= self.state and self.state == event then
                    if self.event ~= "activated" and self.event ~= "colorChanged" then
                        callBack()
                    end
                    if string.find(self.state,"Click") or self.state == "activated" or self.state == "colorChanged" then
                        self.state = prevState
                        if self.event == "activated" or self.event == "colorChanged" then
                            lastActivatedCheck = not lastActivatedCheck
                            if self.event ~= "colorChanged" then
                                if lastActivatedCheck then
                                    game.TweenService:Create(self.original,TweenInfo.new(.3),{BackgroundColor3 = Color3.fromRGB(102,55,148),BorderColor3 = Color3.fromRGB(71,38,104)}):Play()
                                else
                                    game.TweenService:Create(self.original,TweenInfo.new(.3),{BackgroundColor3 = Color3.fromRGB(85,85,85),BorderColor3 = Color3.fromRGB(65,65,65)}):Play()
                                end
                            else
                                if lastActivatedCheck then
                                    Picker,Colour,TextLabel,Wheel,Ring,Slide,Slider = createColorPicker(UDim2.new(0,mouse.X+24,0,mouse.Y+15))
                                    connectColorSelector(function(colo)
                                        game.TweenService:Create(self.original,TweenInfo.new(.15),{BackgroundColor3=colo}):Play()
                                        callBack(colo)
                                    end,Wheel,Slider,Slide,Colour,Ring)
                                else
                                    game.TweenService:Create(Picker,TweenInfo.new(0.3),{Size = UDim2.new(0,0,0,0)}):Play()
                                    wait(.35)
                                    Picker:Destroy()
                                end
                            end
                            callBack(lastActivatedCheck)
                        end
                    end
                end
                prevState = self.state
            end}
        end
    }
end

function library.init(self)
    assert(self.init,"Expected : got .")
    assert(not _G.initedLibraryModuleAPI and not self.inited,"Engine already started.")
    self.inited = true
    _G.initedLibraryModuleAPI = true

    local api = {}
    local totalInstances = {}
    local streak = 0
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = tostring(math.random(1,999999))
    ScreenGui.Parent = plrgui
    savedLocalScreenGui = ScreenGui
    if syn and syn.request then
        syn.protect_gui(ScreenGui)
    end
    coroutine.wrap(function()
        local function mouseClicked(_type)
            local guiObjects = plrgui:GetGuiObjectsAtPosition(mouse.X,mouse.Y)
            local thingsInside = {}
            for i,v in pairs(guiObjects) do
                if totalInstances[v] then
                    thingsInside[v] = true
                end
            end
            for i,v in pairs(connections.running) do
                if thingsInside[v.original] and ((v.event == connections.methods.onActivate or v.event == connections.methods.onColorChange or v.event == connections.methods.onMouse1Click) and _type == 1 or v.event == connections.methods.onMouse2Click and _type == 2) then
                    if _type == 1 then
                        connections:changeState(i,(v.event == connections.methods.onActivate and connections.methods.onActivate) or v.event == connections.methods.onColorChange and connections.methods.onColorChange or connections.methods.onMouse1Click)
                    else
                        connections:changeState(i,connections.methods.onMouse2Click)
                    end
                end
            end
        end

        mouse.Button1Up:Connect(function()
            mouseClicked(1)
        end)
        mouse.Button2Up:Connect(function()
            mouseClicked(2)
        end)
        while true do
            screenSize = camera.ViewportSize
            local guiObjects = plrgui:GetGuiObjectsAtPosition(mouse.X,mouse.Y)
            local thingsInside = {}
            for i,v in pairs(guiObjects) do
                if totalInstances[v] then
                    thingsInside[v] = true
                end
            end
            for i,v in pairs(connections.running) do
                connections:changeState(i,thingsInside[v.original] and connections.methods.onMouseEnter or connections.methods.onMouseLeave)
            end
            wait(1/30)
        end
    end)()

    function api:createWindow(stringTitle,frameSize,windowConfiguration)
        stringTitle = stringTitle or ""
        frameSize = frameSize or 150
        windowConfiguration = windowConfiguration or {}

        if windowConfiguration then
            assert(type(windowConfiguration) == "table", "Arg3(configuration) isn't table while creating window")
        end
        local window = Instance.new("ImageLabel")
        local section = Instance.new("ImageLabel")
        local title = Instance.new("TextLabel")
        local closeOpen = Instance.new("TextButton")
        local closeOpenCD = 1

        local function updateConfig(calledConfiguration,calledByWindow)
            for toBeChanged,newValue in pairs(calledConfiguration) do
                assert(family.windowConfig[toBeChanged],"No such value in config existing")
                assert(typeof(newValue) == family.windowConfig[toBeChanged],tostring(toBeChanged).." expected to be "..family.windowConfig[toBeChanged])

                if toBeChanged == "backgroundColor" then
                    section.ImageColor3 = newValue
                elseif toBeChanged == "titleBackgroundColor" then
                    window.ImageColor3 = newValue
                elseif toBeChanged == "titleColor" then
                    title.TextColor3 = newValue
                elseif toBeChanged == "titleScaled" then
                    title.TextScaled = newValue
                elseif toBeChanged == "titleTextSize" then
                    title.TextSize = newValue
                elseif toBeChanged == "titleFont" then
                    title.Font = newValue
                elseif toBeChanged == "title" and not calledByWindow then
                    title.Text = newValue
                end
            end
        end

        closeOpen.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        closeOpen.BackgroundTransparency = 1.000
        closeOpen.Position = UDim2.new(0.9, 0, 0, 0)
        closeOpen.Size = UDim2.new(0.1, 0, 1, 0)
        closeOpen.ZIndex = 3
        closeOpen.Font = Enum.Font.Arial
        closeOpen.Text = "-"
        closeOpen.TextColor3 = Color3.fromRGB(255, 255, 255)
        closeOpen.TextScaled = true
        closeOpen.Name = http:GenerateGUID(false)
        closeOpen.Parent = window

        window.Name = "w"..tostring(math.random(1,9999999))
        window.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        window.BackgroundTransparency = 1
        window.Position = UDim2.new(0,math.clamp(16+(streak*160),0,screenSize and screenSize.X or 1200),0, 22)
        window.Size = UDim2.new(0, 149, 0, 22)
        window.Image = "rbxassetid://3570695787"
        window.ImageColor3 = Color3.fromRGB(51, 35, 74)
        window.ScaleType = Enum.ScaleType.Slice
        window.SliceCenter = Rect.new(100, 100, 100, 100)
        window.SliceScale = 0.03
        window.Active = true
        window.Draggable = true
        window.Parent = ScreenGui

        section.Name = "section"
        section.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        section.BackgroundTransparency = 1.000
        section.Position = UDim2.new(0, 0, 0.46, 0)
        section.Size = UDim2.new(0, 149, 0, frameSize)
        section.ZIndex = 0
        section.Image = "rbxassetid://3570695787"
        section.ImageColor3 = Color3.fromRGB(8,8,8)
        section.ImageTransparency = 0.4
        section.ScaleType = Enum.ScaleType.Slice
        section.SliceCenter = Rect.new(100,100,100,100)
        section.SliceScale = 0.06
        section.ClipsDescendants = true
        section.Parent = window

        title.Name = "title"
        title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        title.BackgroundTransparency = 1.000
        title.Position = UDim2.new(0.087, 0, 0, 0)
        title.Size = UDim2.new(0.82, 0, 1, 0)
        title.ZIndex = 2
        title.Font = Enum.Font.SourceSansSemibold
        title.Text = stringTitle
        title.TextColor3 = Color3.fromRGB(247, 207, 255)
        title.TextScaled = true
        title.Parent = window

        closeOpen.MouseButton1Click:Connect(function()
            if tick()-closeOpenCD > 0.2 then
                if closeOpen.Text == "-" then
                    closeOpen.Text = "+"
                    game.TweenService:Create(section,TweenInfo.new(0.5),{Size = UDim2.new(0,149,0,0)}):play()
                else
                    closeOpen.Text = "-"
                    game.TweenService:Create(section,TweenInfo.new(0.5),{Size = UDim2.new(0,149,0,frameSize)}):play()
                end
                closeOpenCD = tick()
            end
        end)
        updateConfig(windowConfiguration,true)
        streak += 1

        return {
            windowStorage={streak=0},
            edit = function(self,calledConfiguration)
                assert(self.create and self.edit,"Wrong method has been called, expected : but got .")
                assert(type(calledConfiguration) == "table","[edit] 1st arg isn't table")
                updateConfig(calledConfiguration)
                return "success"
            end,
            create = function(self,method,calledConfiguration)
                assert(self.create and self.edit,"Wrong method has been called, expected : but got .")
                assert(type(method) == "string","[nil] 1st arg isn't string")
                assert(type(calledConfiguration) == "table","["..method.."] 2nd arg isn't table")

                if method == "TextLabel" then
                    local textLabel = Instance.new("TextLabel")
                    textLabel.BackgroundTransparency = 1
                    textLabel.Size = UDim2.new(0, 136, 0, 19)
                    textLabel.Position = UDim2.new(.02, 0,0,10+(19*self.windowStorage.streak))
                    textLabel.TextColor3 = Color3.fromRGB(255,255,255)
                    textLabel.TextScaled = true
                    textLabel.Name = http:GenerateGUID(false)
                    textLabel.TextXAlignment = Enum.TextXAlignment.Left
                    textLabel.Parent = section
                    totalInstances[textLabel] = method
                    for toBeChanged,newValue in pairs(calledConfiguration) do
                        assert(family.textLabelConfig[toBeChanged],"No such value in config existing")
                        assert(typeof(newValue) == family.textLabelConfig[toBeChanged],tostring(toBeChanged).." expected to be "..family.textLabelConfig[toBeChanged])
                        if toBeChanged == "transparency" then
                            textLabel.TextTransparency = newValue
                        elseif toBeChanged == "strokeTransparency" then
                            textLabel.TextStrokeTransparency = newValue
                        elseif toBeChanged == "titleBackgroundColor" then
                            textLabel.TextStrokeColor3 = newValue
                        elseif toBeChanged == "textColor" then
                            textLabel.TextColor3 = newValue
                        elseif toBeChanged == "scaled" then
                            textLabel.TextScaled = newValue
                        elseif toBeChanged == "textSize" then
                            textLabel.TextSize = newValue
                        elseif toBeChanged == "font" then
                            textLabel.Font = newValue
                        elseif toBeChanged == "text" then
                            textLabel.Text = newValue
                        end
                    end
                    self.windowStorage.streak += 1
                    return connections:setUp(method,textLabel),textLabel
                elseif method == "List" then
                    local textLabel = Instance.new("TextLabel")
                    local plus = Instance.new("TextButton")
                    local scrolling = Instance.new("ScrollingFrame")
                    local UIGridLayout = Instance.new("UIGridLayout")
                    textLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    textLabel.BackgroundTransparency = 1.000
                    textLabel.Position = UDim2.new(.02, 0,0,10+(19*self.windowStorage.streak))
                    textLabel.Size = UDim2.new(0, 128, 0, 19)
                    textLabel.ZIndex = 2
                    textLabel.Font = Enum.Font.SourceSansSemibold
                    textLabel.TextColor3 = Color3.fromRGB(255,255,255)
                    textLabel.TextScaled = true
                    textLabel.Name = http:GenerateGUID(false)
                    textLabel.TextXAlignment = Enum.TextXAlignment.Left
                    textLabel.Parent = section

                    plus.Name = "plus"
                    plus.Parent = textLabel
                    plus.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    plus.BackgroundTransparency = 1.000
                    plus.Position = UDim2.new(0.95, 0, 0.092, 0)
                    plus.Size = UDim2.new(0.11, 0, 0.9, 0)
                    plus.ZIndex = 3
                    plus.Font = Enum.Font.Arial
                    plus.Text = "[+]"
                    plus.TextColor3 = Color3.fromRGB(255, 255, 255)
                    plus.TextScaled = true

                    plus.MouseButton1Click:Connect(function()
                        scrolling.Visible = not scrolling.Visible
                    end)

                    scrolling.Name = "scrolling"
                    scrolling.Parent = plus
                    scrolling.Active = true
                    scrolling.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                    scrolling.BackgroundTransparency = 0.400
                    scrolling.BorderSizePixel = 0
                    scrolling.Position = UDim2.new(-7.2, 0,1.1, 0)
                    scrolling.Size = UDim2.new(6.7, 0, 4.1, 0)
                    scrolling.Visible = false
                    scrolling.CanvasSize = UDim2.new(0, 0, 1, 0)
                    scrolling.ZIndex = 3

                    UIGridLayout.Parent = scrolling
                    UIGridLayout.SortOrder = Enum.SortOrder.LayoutOrder
                    UIGridLayout.CellPadding = UDim2.new(0, 0, 0, 0)
                    UIGridLayout.CellSize = UDim2.new(1, 0, 0, 18)

                    totalInstances[textLabel] = method
                    for toBeChanged,newValue in pairs(calledConfiguration) do
                        assert(family.textLabelConfig[toBeChanged],"No such value in config existing")
                        assert(typeof(newValue) == family.textLabelConfig[toBeChanged],tostring(toBeChanged).." expected to be "..family.textLabelConfig[toBeChanged])
                        if toBeChanged == "transparency" then
                            textLabel.TextTransparency = newValue
                        elseif toBeChanged == "strokeTransparency" then
                            textLabel.TextStrokeTransparency = newValue
                        elseif toBeChanged == "titleBackgroundColor" then
                            textLabel.TextStrokeColor3 = newValue
                        elseif toBeChanged == "textColor" then
                            textLabel.TextColor3 = newValue
                        elseif toBeChanged == "scaled" then
                            textLabel.TextScaled = newValue
                        elseif toBeChanged == "textSize" then
                            textLabel.TextSize = newValue
                        elseif toBeChanged == "font" then
                            textLabel.Font = newValue
                        elseif toBeChanged == "text" then
                            textLabel.Text = newValue
                        end
                    end
                    self.windowStorage.streak += 1
                    return connections:setUp(method,textLabel),textLabel
                elseif method == "ListSelect" then
                    local textLabel = Instance.new("TextLabel")
                    local plus = Instance.new("TextButton")
                    local scrolling = Instance.new("ScrollingFrame")
                    local UIGridLayout = Instance.new("UIGridLayout")
                    textLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    textLabel.BackgroundTransparency = 1.000
                    textLabel.Position = UDim2.new(.02, 0,0,10+(19*self.windowStorage.streak))
                    textLabel.Size = UDim2.new(0, 128, 0, 19)
                    textLabel.ZIndex = 2
                    textLabel.Font = Enum.Font.SourceSansSemibold
                    textLabel.TextColor3 = Color3.fromRGB(255,255,255)
                    textLabel.TextScaled = true
                    textLabel.Name = http:GenerateGUID(false)
                    textLabel.TextXAlignment = Enum.TextXAlignment.Left
                    textLabel.Parent = section

                    plus.Name = "plus"
                    plus.Parent = textLabel
                    plus.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    plus.BackgroundTransparency = 1.000
                    plus.Position = UDim2.new(0.95, 0, 0.092, 0)
                    plus.Size = UDim2.new(0.11, 0, 0.9, 0)
                    plus.ZIndex = 3
                    plus.Font = Enum.Font.Arial
                    plus.Text = "[+]"
                    plus.TextColor3 = Color3.fromRGB(255, 255, 255)
                    plus.TextScaled = true

                    plus.MouseButton1Click:Connect(function()
                        scrolling.Visible = not scrolling.Visible
                    end)

                    scrolling.Name = "scrolling"
                    scrolling.Parent = plus
                    scrolling.Active = true
                    scrolling.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                    scrolling.BackgroundTransparency = 0.400
                    scrolling.BorderSizePixel = 0
                    scrolling.Position = UDim2.new(-7.2, 0,1.1, 0)
                    scrolling.Size = UDim2.new(6.7, 0, 4.1, 0)
                    scrolling.Visible = false
                    scrolling.CanvasSize = UDim2.new(0, 0, 6, 0)
                    scrolling.ZIndex = 3


                    UIGridLayout.Parent = scrolling
                    UIGridLayout.SortOrder = Enum.SortOrder.LayoutOrder
                    UIGridLayout.CellPadding = UDim2.new(0, 0, 0, 0)
                    UIGridLayout.CellSize = UDim2.new(1, 0, 0, 18)

                    totalInstances[textLabel] = method
                    for toBeChanged,newValue in pairs(calledConfiguration) do
                        assert(family.textLabelConfig[toBeChanged],"No such value in config existing")
                        assert(typeof(newValue) == family.textLabelConfig[toBeChanged],tostring(toBeChanged).." expected to be "..family.textLabelConfig[toBeChanged])
                        if toBeChanged == "transparency" then
                            textLabel.TextTransparency = newValue
                        elseif toBeChanged == "strokeTransparency" then
                            textLabel.TextStrokeTransparency = newValue
                        elseif toBeChanged == "titleBackgroundColor" then
                            textLabel.TextStrokeColor3 = newValue
                        elseif toBeChanged == "textColor" then
                            textLabel.TextColor3 = newValue
                        elseif toBeChanged == "scaled" then
                            textLabel.TextScaled = newValue
                        elseif toBeChanged == "textSize" then
                            textLabel.TextSize = newValue
                        elseif toBeChanged == "font" then
                            textLabel.Font = newValue
                        elseif toBeChanged == "text" then
                            textLabel.Text = newValue
                        end
                    end
                    self.windowStorage.streak += 1
                    return connections:setUp(method,textLabel),textLabel
                elseif method == "Slider" then
                    local textLabel = Instance.new("TextLabel")
                    textLabel.BackgroundTransparency = 1
                    textLabel.Size = UDim2.new(0, 136, 0, 19)
                    textLabel.Position = UDim2.new(.02, 0,0,10+(19*self.windowStorage.streak))
                    textLabel.TextColor3 = Color3.fromRGB(255,255,255)
                    textLabel.TextScaled = true
                    textLabel.Name = http:GenerateGUID(false)
                    textLabel.TextXAlignment = Enum.TextXAlignment.Left
                    textLabel.Parent = section
                    totalInstances[textLabel] = method
                    for toBeChanged,newValue in pairs(calledConfiguration) do
                        assert(family.textLabelConfig[toBeChanged],"No such value in config existing")
                        assert(typeof(newValue) == family.textLabelConfig[toBeChanged],tostring(toBeChanged).." expected to be "..family.textLabelConfig[toBeChanged])
                        if toBeChanged == "transparency" then
                            textLabel.TextTransparency = newValue
                        elseif toBeChanged == "strokeTransparency" then
                            textLabel.TextStrokeTransparency = newValue
                        elseif toBeChanged == "titleBackgroundColor" then
                            textLabel.TextStrokeColor3 = newValue
                        elseif toBeChanged == "textColor" then
                            textLabel.TextColor3 = newValue
                        elseif toBeChanged == "scaled" then
                            textLabel.TextScaled = newValue
                        elseif toBeChanged == "textSize" then
                            textLabel.TextSize = newValue
                        elseif toBeChanged == "font" then
                            textLabel.Font = newValue
                        elseif toBeChanged == "text" then
                            textLabel.Text = newValue
                        end
                    end
                    local slider = Instance.new("Frame")
                    local main = Instance.new("Frame")
                    local UIGradient = Instance.new("UIGradient")
                    local mover = Instance.new("TextButton")
                    local amount = Instance.new("TextLabel")
                    local UITextSizeConstraint = Instance.new("UITextSizeConstraint")

                    slider.Name = "slider"
                    slider.Parent = textLabel
                    slider.BackgroundColor3 = Color3.fromRGB(59, 59, 59)
                    slider.BackgroundTransparency = 0.100
                    slider.BorderSizePixel = 0
                    slider.Position = UDim2.new(-0.015, 0, 1, 0)
                    slider.Size = UDim2.new(1.08163548, 0, 0.800000012, 0)

                    main.Name = "main"
                    main.Parent = slider
                    main.BackgroundColor3 = Color3.fromRGB(102,55,148)
                    main.BorderSizePixel = 0
                    main.Size = UDim2.new(0, 0, 1, 0)

                    UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(159, 159, 159)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 255, 255))}
                    UIGradient.Rotation = 270
                    UIGradient.Parent = main

                    mover.Name = "mover"
                    mover.Parent = slider
                    mover.BackgroundColor3 = Color3.fromRGB(41, 29, 61)
                    mover.BorderColor3 = Color3.fromRGB(23, 16, 35)
                    mover.Size = UDim2.new(0.0276814401, 0, 1, 0)
                    mover.Font = Enum.Font.SourceSans
                    mover.Text = ""
                    mover.TextColor3 = Color3.fromRGB(0, 0, 0)

                    amount.Name = "amount"
                    amount.Parent = slider
                    amount.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    amount.BackgroundTransparency = 1.000
                    amount.BorderColor3 = Color3.fromRGB(41, 29, 61)
                    amount.Position = UDim2.new(-0.0128997406, 0, 0, 0)
                    amount.Size = UDim2.new(1.01289964, 0, 1, 0)
                    amount.ZIndex = 3
                    amount.Font = Enum.Font.SourceSans
                    amount.Text = "16"
                    amount.TextColor3 = Color3.fromRGB(213, 213, 213)
                    amount.TextScaled = true
                    amount.TextStrokeColor3 = Color3.fromRGB(41, 29, 61)
                    amount.TextStrokeTransparency = 0.700

                    UITextSizeConstraint.Parent = amount
                    UITextSizeConstraint.MaxTextSize = 15
                    self.windowStorage.streak += 2
                    return connections:setUp(method,textLabel),textLabel
                elseif method == "SelectColor" then
                    local check = Instance.new("TextLabel")
                    local activate = Instance.new("Frame")

                    check.Name = http:GenerateGUID(false)
                    check.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    check.BackgroundTransparency = 1.000
                    check.Position = UDim2.new(.02, 0,0,10+(19*self.windowStorage.streak))
                    check.Size = UDim2.new(0, 112, 0, 19)
                    check.ZIndex = 2
                    check.Font = Enum.Font.SourceSans
                    check.Text = "Some random ass title"
                    check.TextColor3 = Color3.fromRGB(255, 255, 255)
                    check.TextScaled = true
                    check.TextXAlignment = Enum.TextXAlignment.Left

                    activate.Name = "activate"
                    activate.BackgroundColor3 = Color3.fromRGB(255,255,255)
                    activate.BorderColor3 = Color3.fromRGB(65, 65, 65)
                    activate.Position = UDim2.new(1.1, 0, 0.104, 0)
                    activate.Size = UDim2.new(0.14, 0, 0.79, 0)

                    check.Parent = section
                    activate.Parent = check

                    totalInstances[check] = method
                    totalInstances[activate] = method
                    for toBeChanged,newValue in pairs(calledConfiguration) do
                        assert(family.textLabelConfig[toBeChanged],"No such value in config existing")
                        assert(typeof(newValue) == family.textLabelConfig[toBeChanged],tostring(toBeChanged).." expected to be "..family.textLabelConfig[toBeChanged])
                        if toBeChanged == "transparency" then
                            check.TextTransparency = newValue
                        elseif toBeChanged == "strokeTransparency" then
                            check.TextStrokeTransparency = newValue
                        elseif toBeChanged == "titleBackgroundColor" then
                            check.TextStrokeColor3 = newValue
                        elseif toBeChanged == "textColor" then
                            check.TextColor3 = newValue
                        elseif toBeChanged == "scaled" then
                            check.TextScaled = newValue
                        elseif toBeChanged == "textSize" then
                            check.TextSize = newValue
                        elseif toBeChanged == "font" then
                            check.Font = newValue
                        elseif toBeChanged == "text" then
                            check.Text = newValue
                        end
                    end
                    self.windowStorage.streak += 1
                    return connections:setUp(method,activate),check
                elseif method == "CheckButton" then
                    local check = Instance.new("TextLabel")
                    local activate = Instance.new("Frame")

                    check.Name = http:GenerateGUID(false)
                    check.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    check.BackgroundTransparency = 1.000
                    check.Position = UDim2.new(.02, 0,0,10+(19*self.windowStorage.streak))
                    check.Size = UDim2.new(0, 112, 0, 19)
                    check.ZIndex = 2
                    check.Font = Enum.Font.SourceSans
                    check.Text = "Some random ass title"
                    check.TextColor3 = Color3.fromRGB(255, 255, 255)
                    check.TextScaled = true
                    check.TextXAlignment = Enum.TextXAlignment.Left

                    activate.Name = "activate"
                    activate.BackgroundColor3 = Color3.fromRGB(85, 85, 85)
                    activate.BorderColor3 = Color3.fromRGB(65, 65, 65)
                    activate.Position = UDim2.new(1.1, 0, 0.104, 0)
                    activate.Size = UDim2.new(0.14, 0, 0.79, 0)

                    check.Parent = section
                    activate.Parent = check

                    totalInstances[check] = method
                    totalInstances[activate] = method
                    for toBeChanged,newValue in pairs(calledConfiguration) do
                        assert(family.textLabelConfig[toBeChanged],"No such value in config existing")
                        assert(typeof(newValue) == family.textLabelConfig[toBeChanged],tostring(toBeChanged).." expected to be "..family.textLabelConfig[toBeChanged])
                        if toBeChanged == "transparency" then
                            check.TextTransparency = newValue
                        elseif toBeChanged == "strokeTransparency" then
                            check.TextStrokeTransparency = newValue
                        elseif toBeChanged == "titleBackgroundColor" then
                            check.TextStrokeColor3 = newValue
                        elseif toBeChanged == "textColor" then
                            check.TextColor3 = newValue
                        elseif toBeChanged == "scaled" then
                            check.TextScaled = newValue
                        elseif toBeChanged == "textSize" then
                            check.TextSize = newValue
                        elseif toBeChanged == "font" then
                            check.Font = newValue
                        elseif toBeChanged == "text" then
                            check.Text = newValue
                        end
                    end
                    self.windowStorage.streak += 1
                    return connections:setUp(method,activate),check
                end
                warn("No method has been found.")
            end,
        }
    end
    return api
end

return library
