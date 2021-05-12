local options = {
    key = Enum.KeyCode.RightShift,
    keyset = 123,
    tabscount = 0,
    tabs = {},
    blurcamera = false,
    open = true,
    folders = {}
}
local library = {}


if game:GetService("CoreGui"):FindFirstChild("MainUI") then
    game:GetService("CoreGui"):FindFirstChild("MainUI"):Destroy()
end

local r = game:GetService("RunService")
local cg = game:GetService("CoreGui")
local TS = game:GetService("TweenService")
local UIS = game:GetService("UserInputService")
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game:GetService("CoreGui")
ScreenGui.Name = "MainUI"

do--funcs
    function movechat(yes)
        if yes then
            game:GetService("Players").LocalPlayer.PlayerGui.Chat.Frame.Position = UDim2.new(0,0,0.73,0)
        else
            game:GetService("Players").LocalPlayer.PlayerGui.Chat.Frame.Position = UDim2.new(0,0,0,0)
        end
    end

    function getmouse()
        return Vector2.new(UIS:GetMouseLocation().X + 1, UIS:GetMouseLocation().Y - 35)
    end

    function blurcamera(yes)
        local tween
        if yes then
            local a = Instance.new("BlurEffect",workspace.CurrentCamera)
            tween = TS:Create(a,TweenInfo.new(1,Enum.EasingStyle.Sine,Enum.EasingDirection.Out),{Size = 15})
            a.Size = 0
            a.Enabled = true
            a.Name = "blur"
            tween:Play()
        else
            if workspace.CurrentCamera:FindFirstChild("blur") then
                tween = TS:Create(workspace.CurrentCamera.blur,TweenInfo.new(1,Enum.EasingStyle.Sine,Enum.EasingDirection.Out),{Size = 0})
                tween:Play()
                tween.Completed:Connect(function()
                    workspace.CurrentCamera.blur:Destroy()
                end)
            end
        end
    end
end

do--main
    local Main = Instance.new("Frame")
    local Bar = Instance.new("Frame")
    local UIGradient = Instance.new("UIGradient")
    local Name = Instance.new("TextLabel")

    function library:OpenMenu()
        Main.Name = "Main"
        Main.Parent = ScreenGui
        Main.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        Main.BorderColor3 = Color3.fromRGB(170, 0, 255)
        Main.Size = UDim2.new(1, 0, 0.0761670768, 0)
        Main.Position = UDim2.new(0, 0, -3, 0)

        Bar.Name = "Bar"
        Bar.Parent = Main
        Bar.BackgroundColor3 = Color3.fromRGB(170, 0, 255)
        Bar.BorderColor3 = Color3.fromRGB(170, 0, 255)
        Bar.Position = UDim2.new(0, 0, 0.357252955, 0)
        Bar.Size = UDim2.new(1, 0, 0.112903222, 0)
        Bar.ZIndex = 2

        UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 0, 255)), ColorSequenceKeypoint.new(0.29, Color3.fromRGB(170, 0, 127)), ColorSequenceKeypoint.new(0.68, Color3.fromRGB(170, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(0, 0, 255))}
        UIGradient.Parent = Bar

        Name.Name = "Name"
        Name.Parent = Main
        Name.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Name.BackgroundTransparency = 1.000
        Name.Position = UDim2.new(0.0046875081, 0, 0, 0)
        Name.Size = UDim2.new(0, 206, 0, 22)
        Name.ZIndex = 2
        Name.Font = Enum.Font.Code
        Name.Text = "> trinity"
        Name.TextColor3 = Color3.fromRGB(255, 255, 255)
        Name.TextSize = 20.000
        Name.TextXAlignment = Enum.TextXAlignment.Left


        local function tweenitem(obj,value,valueto)
            local info = TweenInfo.new(value,Enum.EasingStyle.Sine,Enum.EasingDirection.Out)
            local tw = TS:Create(obj,info,valueto)
            tw:Play()
        end

        tweenitem(Main,1,{Position = UDim2.new(0,0,-0.035,0)})
        cg.TopBar.Enabled = false

    end

    function library:CloseMenu()
        local function tweenitem(obj,value,valueto)
            local info = TweenInfo.new(value,Enum.EasingStyle.Sine,Enum.EasingDirection.Out)
            local tw = TS:Create(obj,info,valueto)
            tw:Play()
        end

        tweenitem(Main,1,{Position = UDim2.new(0,0,-3,0)})
        cg.TopBar.Enabled = true
    end

    function library:AddTab(name,icon)
        local window = {
            count = 0,
            tempcount = 0,
        }
        local Tab = Instance.new("TextLabel")
        local Bar_2 = Instance.new("Frame")
        local UIGradient_2 = Instance.new("UIGradient")
        local Drop = Instance.new("ImageButton")
        local Icon = Instance.new("ImageLabel")
        local Body = Instance.new("Frame")
        local ImageLabel = Instance.new("ImageLabel")
        local ImageLabel_2 = Instance.new("ImageLabel")
        local ImageLabel_3 = Instance.new("ImageLabel")
        local Holder = Instance.new("Frame")
        local UIListLayout = Instance.new("UIListLayout")
        local Background = Instance.new("Frame")
        local Holder2 = Instance.new("Frame")

        local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
        local UIAspectRatioConstraint_2 = Instance.new("UIAspectRatioConstraint")
        local UIAspectRatioConstraint_3 = Instance.new("UIAspectRatioConstraint")

        Tab.Name = "Tab"
        Tab.Parent = Main
        Tab.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Tab.BackgroundTransparency = 1.000
        Tab.Position = UDim2.new(0.005, 0, 0.470156163, 0) + UDim2.new((0.12 * options.tabscount),0,0,0)
        Tab.Size = UDim2.new(0.0973958299, 0, 0.516129017, 0)
        Tab.ZIndex = 2
        Tab.Font = Enum.Font.Code
        Tab.Text = "> "..name
        Tab.TextColor3 = Color3.fromRGB(255, 255, 255)
        Tab.TextSize = 14.000

        options.tabscount = options.tabscount + 1

        Bar_2.Name = "Bar"
        Bar_2.Parent = Tab
        Bar_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Bar_2.BorderSizePixel = 0
        Bar_2.Position = UDim2.new(-0.00534759369, 0, 0.90625, 0)
        Bar_2.Size = UDim2.new(0.99465239, 0, 0.0625, 0)
        Bar_2.ZIndex = 2

        UIGradient_2.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 0, 255)), ColorSequenceKeypoint.new(0.29, Color3.fromRGB(170, 0, 127)), ColorSequenceKeypoint.new(0.68, Color3.fromRGB(170, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(0, 0, 255))}
        UIGradient_2.Parent = Bar_2

        Drop.Name = "Drop"
        Drop.Parent = Tab
        Drop.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Drop.BackgroundTransparency = 1.000
        Drop.Position = UDim2.new(0.860962689, 0, 0.125, 0)
        Drop.Size = UDim2.new(0.133689836, 0, 0.78125, 0)
        Drop.ZIndex = 2
        Drop.Image = "http://www.roblox.com/asset/?id=6702069727"
        Drop.Rotation = 90

        Icon.Name = "Icon"
        Icon.Parent = Tab
        Icon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Icon.BackgroundTransparency = 1.000
        Icon.Position = UDim2.new(0.0160427801, 0, 0.09375, 0)
        Icon.Size = UDim2.new(0.13903743, 0, 0.8125, 0)
        Icon.ZIndex = 10
        Icon.Image = "https://www.roblox.com/Thumbs/Asset.ashx?width=420&height=420&assetId="..icon

        Body.Name = "Body"
        Body.Parent = Tab
        Body.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Body.BorderColor3 = Color3.fromRGB(170, 0, 255)
        Body.ClipsDescendants = true
        Body.Position = UDim2.new(-0.0152127519, 0, 1.48866582, 0)
        Body.Size = UDim2.new(1, 0, 23.038, 0)
        Body.ZIndex = 5
        Body.BackgroundTransparency = 1

        ImageLabel.Parent = Holder2
        ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        ImageLabel.Position = UDim2.new(-0.235736921, 0, -0.0198346972, 0)
        ImageLabel.Size = UDim2.new(5.71657753, 0, 1.44916821, 0)
        ImageLabel.Image = "http://www.roblox.com/asset/?id=6791074926"
        ImageLabel.SliceScale = 2.000
        ImageLabel.ZIndex = 3

        ImageLabel_2.Parent = Holder2
        ImageLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        ImageLabel_2.BackgroundTransparency = 1.000
        ImageLabel_2.Position = UDim2.new(-0.235736921, 0, -0.0198346972, 0)
        ImageLabel_2.Size = UDim2.new(5.71657753, 0, 1.44916821, 0)
        ImageLabel_2.ZIndex = 4
        ImageLabel_2.Image = "http://www.roblox.com/asset/?id=4030608163"
        ImageLabel_2.ImageTransparency = 0.100
        ImageLabel_2.SliceScale = 2.000

        ImageLabel_3.Parent = Holder2
        ImageLabel_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        ImageLabel_3.BackgroundTransparency = 1.000
        ImageLabel_3.Position = UDim2.new(-0.235736921, 0, -0.0198346823, 0)
        ImageLabel_3.Size = UDim2.new(5.71657753, 0, 1.61737525, 0)
        ImageLabel_3.ZIndex = 5
        ImageLabel_3.Image = "http://www.roblox.com/asset/?id=3343671401"
        ImageLabel_3.ImageTransparency = 0.900
        ImageLabel_3.SliceScale = 2.000

        Holder.Name = "Holder"
        Holder.Parent = Body
        Holder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Holder.BackgroundTransparency = 1.000
        Holder.Position = UDim2.new(-0.00451758504, 0, -0.000416129827, 0)
        Holder.Size = UDim2.new(1, 0,1.006, 0)
        Holder.ZIndex = 10

        UIListLayout.Parent = Holder
        UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

        Background.Name = "Background"
        Background.Parent = Tab
        Background.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        Background.Size = UDim2.new(1, 0, 0, 0)
        Background.ZIndex = 4
        Background.ClipsDescendants = true
        Background.BackgroundTransparency = 1
        Background.Position = UDim2.new(-0.015, 0,1.489, 0)

        Holder2.Name = "Holder"
        Holder2.Parent = Background
        Holder2.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        Holder2.Position = UDim2.new(0.0053477562, 0, -0.00069238944, 0)
        Holder2.Size = UDim2.new(1, 0, 2.36174607, 0)
        Holder2.ZIndex = 2

        UIAspectRatioConstraint.Parent = ImageLabel

        UIAspectRatioConstraint_2.Parent = ImageLabel_2

        UIAspectRatioConstraint_3.Parent = ImageLabel_3

        local function tweenitem(obj,value,valueto)
            local info = TweenInfo.new(value,Enum.EasingStyle.Sine,Enum.EasingDirection.Out)
            local tw = TS:Create(obj,info,valueto)
            tw:Play()
        end

        function refreshtab()
            tweenitem(Background,0.1,{Size = UDim2.new(1,0,0.688 * (window.count + window.tempcount),0)})
        end

        local dropped = true
        Drop.MouseButton1Click:Connect(function()
            dropped = not dropped
            if dropped then
                tweenitem(Body,0.1,{Size = UDim2.new(1,0,23.038,0)})
                tweenitem(Background,0.1,{Size = UDim2.new(1,0,0.688 * (window.count + window.tempcount),0)})
                tweenitem(Drop,0.1,{Rotation = 90})
            else
                tweenitem(Body,0.1,{Size = UDim2.new(1,0,0,0)})
                tweenitem(Background,0.1,{Size = UDim2.new(1,0,0,0)})
                tweenitem(Drop,0.1,{Rotation = 0})
            end
        end)

        function window:AddToggle(text,callback)
            window.count = window.count + 1

            local toggle = {}
            local switch = false

            text = text or "toggle"
            callback = callback or function () end

            local Toggle = Instance.new("Frame")
            local FrameToggle = Instance.new("Frame")
            local CheckToggle = Instance.new("ImageLabel")
            local UIGradient1 = Instance.new("UIGradient")
            local UIGradient2 = Instance.new("UIGradient")
            local ButtonToggle = Instance.new("TextButton")
            local TextLabelToggle = Instance.new("TextLabel")

            Toggle.Name = "Toggle"
            Toggle.Parent = Holder
            Toggle.BackgroundColor3 = Color3.fromRGB(170, 0, 255)
            Toggle.BackgroundTransparency = 0.900
            Toggle.Size = UDim2.new(0, 187,0, 23)
            Toggle.ZIndex = 10
            Toggle.BorderSizePixel = 0

            FrameToggle.Parent = Toggle
            FrameToggle.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
            FrameToggle.BorderColor3 = Color3.fromRGB(170, 0, 255)
            FrameToggle.Position = UDim2.new(0, 11, 0, 5)
            FrameToggle.Size = UDim2.new(0, 15, 0, 15)
            FrameToggle.ZIndex = 10

            CheckToggle.Name = "Check"
            CheckToggle.Parent = FrameToggle
            CheckToggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            CheckToggle.BackgroundTransparency = 1.000
            CheckToggle.Size = UDim2.new(0, 14, 0, 15)
            CheckToggle.ZIndex = 10
            CheckToggle.Image = "http://www.roblox.com/asset/?id=3642321726"
            CheckToggle.Visible = false

            UIGradient1.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(85, 255, 255)), ColorSequenceKeypoint.new(0.56, Color3.fromRGB(170, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 0, 255))}
            UIGradient1.Parent = CheckToggle

            UIGradient2.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 0, 255)), ColorSequenceKeypoint.new(0.51, Color3.fromRGB(170, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(0, 0, 255))}
            UIGradient2.Parent = Toggle

            ButtonToggle.Name = "Button"
            ButtonToggle.Parent = Toggle
            ButtonToggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ButtonToggle.BackgroundTransparency = 1.000
            ButtonToggle.Size = UDim2.new(0, 187, 0, 22)
            ButtonToggle.Visible = true
            ButtonToggle.ZIndex = 10
            ButtonToggle.Font = Enum.Font.SourceSans
            ButtonToggle.TextColor3 = Color3.fromRGB(0, 0, 0)
            ButtonToggle.TextSize = 14.000
            ButtonToggle.Text = ""

            TextLabelToggle.Parent = Toggle
            TextLabelToggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            TextLabelToggle.BackgroundTransparency = 1.000
            TextLabelToggle.Position = UDim2.new(0, 32, 0, 4)
            TextLabelToggle.Size = UDim2.new(0, 155, 0, 18)
            TextLabelToggle.ZIndex = 10
            TextLabelToggle.Font = Enum.Font.Code
            TextLabelToggle.Text = "> "..text
            TextLabelToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
            TextLabelToggle.TextSize = 14.000
            TextLabelToggle.TextXAlignment = Enum.TextXAlignment.Left

            ButtonToggle.MouseButton1Click:Connect(function()
                switch = not switch
                CheckToggle.Visible = switch
                pcall(callback,switch)
            end)

            function toggle:OverwriteSetting(bool)
                switch = bool
                CheckToggle.Visible = bool
                pcall(callback,switch)
            end

            refreshtab()
            return toggle,Toggle
        end

        function window:AddButton(text,callback)
            window.count = window.count + 1

            text = text or "button" 

            local ButtonButton = Instance.new("Frame")
            local UIGradient123 = Instance.new("UIGradient")
            local Button_2Button = Instance.new("TextButton")
            local TextLabelButton = Instance.new("TextLabel")
            local ClickButton = Instance.new("ImageLabel")
            local UIGradient_2123 = Instance.new("UIGradient")

            ButtonButton.Name = "Button"
            ButtonButton.Parent = Holder
            ButtonButton.BackgroundColor3 = Color3.fromRGB(170, 0, 255)
            ButtonButton.BackgroundTransparency = 0.900
            ButtonButton.Position = UDim2.new(0, 34, 0, 100)
            ButtonButton.Size = UDim2.new(0, 187, 0, 21)
            ButtonButton.ZIndex = 6
            ButtonButton.BorderSizePixel = 0

            UIGradient123.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 0, 255)), ColorSequenceKeypoint.new(0.51, Color3.fromRGB(170, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(0, 0, 255))}
            UIGradient123.Parent = ButtonButton

            Button_2Button.Name = "Button"
            Button_2Button.Parent = ButtonButton
            Button_2Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Button_2Button.BackgroundTransparency = 1.000
            Button_2Button.Position = UDim2.new(0, 0, 0, 1)
            Button_2Button.Size = UDim2.new(0, 187, 0, 25)
            Button_2Button.Visible = true
            Button_2Button.ZIndex = 10
            Button_2Button.Font = Enum.Font.SourceSans
            Button_2Button.TextColor3 = Color3.fromRGB(0, 0, 0)
            Button_2Button.TextSize = 14.000
            Button_2Button.Text = ""

            TextLabelButton.Parent = ButtonButton
            TextLabelButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            TextLabelButton.BackgroundTransparency = 1.000
            TextLabelButton.Position = UDim2.new(0, 32, 0, 1)
            TextLabelButton.Size = UDim2.new(0, 155, 0, 21)
            TextLabelButton.ZIndex = 10
            TextLabelButton.Font = Enum.Font.Code
            TextLabelButton.Text = "> "..text
            TextLabelButton.TextColor3 = Color3.fromRGB(255, 255, 255)
            TextLabelButton.TextSize = 14.000
            TextLabelButton.TextXAlignment = Enum.TextXAlignment.Left

            ClickButton.Name = "Click"
            ClickButton.Parent = ButtonButton
            ClickButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ClickButton.BackgroundTransparency = 1.000
            ClickButton.Position = UDim2.new(0, 8, 0, 0)
            ClickButton.Rotation = -20.000
            ClickButton.Size = UDim2.new(0, 21, 0, 21)
            ClickButton.ZIndex = 10
            ClickButton.Image = "http://www.roblox.com/asset/?id=6422318705"

            UIGradient_2123.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(85, 255, 255)), ColorSequenceKeypoint.new(0.56, Color3.fromRGB(170, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 0, 255))}
            UIGradient_2123.Parent = ClickButton

            local function change()
                TextLabelButton.TextColor3 = Color3.fromRGB(255, 0, 127)
                wait(0.1)
                TextLabelButton.TextColor3 = Color3.fromRGB(255, 255, 255)
            end

            Button_2Button.MouseButton1Click:Connect(function()
                spawn(function()
                    change()
                end)
                pcall(callback)
            end)

            refreshtab()
            return ButtonButton
        end 

        function window:AddTextbox(text,placeholder,returnold,callback)
            window.count = window.count + 1

            text = text or "textbox"
            placeholder = placeholder or ""

            local TextboxTextbox = Instance.new("Frame")
            local UIGradientTextbox = Instance.new("UIGradient")
            local TextBox2 = Instance.new("TextBox")
            local IconTextbox = Instance.new("ImageLabel")
            local UIGradient_2Textbox = Instance.new("UIGradient")
            local TextLabelTextbox = Instance.new("TextLabel")
            
            TextboxTextbox.Name = "Textbox"
            TextboxTextbox.Parent = Holder
            TextboxTextbox.BackgroundColor3 = Color3.fromRGB(170, 0, 255)
            TextboxTextbox.BackgroundTransparency = 0.900
            TextboxTextbox.Position = UDim2.new(0, 0, 0, 44)
            TextboxTextbox.Size = UDim2.new(0, 187, 0, 22)
            TextboxTextbox.ZIndex = 10
            TextboxTextbox.BorderSizePixel = 0

            UIGradientTextbox.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 0, 255)), ColorSequenceKeypoint.new(0.51, Color3.fromRGB(170, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(0, 0, 255))}
            UIGradientTextbox.Parent = TextboxTextbox

            TextBox2.Parent = TextboxTextbox
            TextBox2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            TextBox2.BackgroundTransparency = 1.000
            TextBox2.Position = UDim2.new(0, 45, 0, 0)
            TextBox2.Size = UDim2.new(0, 143, 0, 22)
            TextBox2.ZIndex = 10
            TextBox2.Font = Enum.Font.Code
            TextBox2.PlaceholderText = ""..placeholder
            TextBox2.Text = ""..text
            TextBox2.TextColor3 = Color3.fromRGB(186, 186, 186)
            TextBox2.TextSize = 14.000
            TextBox2.TextXAlignment = Enum.TextXAlignment.Left

            IconTextbox.Name = "Icon"
            IconTextbox.Parent = TextboxTextbox
            IconTextbox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            IconTextbox.BackgroundTransparency = 1.000
            IconTextbox.Position = UDim2.new(0, 7, 0, 0)
            IconTextbox.Size = UDim2.new(0, 21, 0, 21)
            IconTextbox.ZIndex = 10
            IconTextbox.Image = "http://www.roblox.com/asset/?id=6791878252"

            UIGradient_2Textbox.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(85, 255, 255)), ColorSequenceKeypoint.new(0.56, Color3.fromRGB(170, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 0, 255))}
            UIGradient_2Textbox.Parent = IconTextbox

            TextLabelTextbox.Parent = TextboxTextbox
            TextLabelTextbox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            TextLabelTextbox.BackgroundTransparency = 1.000
            TextLabelTextbox.Position = UDim2.new(0, 28, 0, -2)
            TextLabelTextbox.Size = UDim2.new(0, 25, 0, 25)
            TextLabelTextbox.ZIndex = 10
            TextLabelTextbox.Font = Enum.Font.Code
            TextLabelTextbox.Text = "> "
            TextLabelTextbox.TextColor3 = Color3.fromRGB(186, 186, 186)
            TextLabelTextbox.TextSize = 14.000

            TextBox2.FocusLost:Connect(function(inp)
                if inp and TextBox2.Text ~= "" then
                    pcall(callback,TextBox2.Text)
                    if returnold then
                        TextBox2.Text = text
                    end
                end
            end)

            refreshtab()
            return TextboxTextbox
        end

        function window:AddSlider(text,callback,slideroptions)
            window.count = window.count + 1

            local slidertable = {}
            text = text or ""
            slideroptions = {
                min = slideroptions.min or 1,
                max = slideroptions.max or 100,
            }

            local Slider = Instance.new("Frame")
            local UIGradient324 = Instance.new("UIGradient")
            local Slider_2 = Instance.new("Frame")
            local UIGradient_22143 = Instance.new("UIGradient")
            local TextLabel = Instance.new("TextLabel")

            Slider.Name = "Slider"
            Slider.Parent = Holder
            Slider.BackgroundColor3 = Color3.fromRGB(170, 0, 255)
            Slider.BackgroundTransparency = 0.900
            Slider.Position = UDim2.new(0, 34, 0, 143)
            Slider.Size = UDim2.new(0, 187, 0, 22)
            Slider.ZIndex = 10
            Slider.BorderSizePixel = 0

            UIGradient324.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 0, 255)), ColorSequenceKeypoint.new(0.51, Color3.fromRGB(170, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(0, 0, 255))}
            UIGradient324.Parent = Slider

            Slider_2.Name = "Slider"
            Slider_2.Parent = Slider
            Slider_2.BackgroundColor3 = Color3.fromRGB(170, 0, 255)
            Slider_2.BackgroundTransparency = 0.600
            Slider_2.BorderSizePixel = 0
            Slider_2.Position = UDim2.new(0, 0, 0, 0)
            Slider_2.Size = UDim2.new(0, 187, 0, 22)
            Slider_2.ZIndex = 10

            UIGradient_22143.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(85, 255, 255)), ColorSequenceKeypoint.new(0.56, Color3.fromRGB(170, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 0, 255))}
            UIGradient_22143.Parent = Slider_2

            TextLabel.Parent = Slider
            TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            TextLabel.BackgroundTransparency = 1.000
            TextLabel.Position = UDim2.new(0, 0, 0, -1)
            TextLabel.Size = UDim2.new(0, 187, 0, 23)
            TextLabel.ZIndex = 10
            TextLabel.Font = Enum.Font.Code
            TextLabel.Text = "engine speed:100"
            TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            TextLabel.TextSize = 14.000


            local enter = false

            Slider.MouseEnter:Connect(function()
                enter = true
            end)

            Slider.MouseLeave:Connect(function()
                enter = false
            end)

            local function Resize(part, new, _delay)
                _delay = _delay or 0.5
                local tweenInfo = TweenInfo.new(_delay, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
                local tween = TS:Create(part, tweenInfo, new)
                tween:Play()
            end

            local Held = false
            UIS.InputBegan:Connect(function(inputObject)
                if inputObject.UserInputType == Enum.UserInputType.MouseButton1 then
                        Held = true

                        spawn(function() -- Loop check
                                if enter then
                                        while Held do
                                                local mouse_location = getmouse()
                                                local x = (Slider.AbsoluteSize.X - (Slider.AbsoluteSize.X - ((mouse_location.X - Slider.AbsolutePosition.X)) + 1)) / Slider.AbsoluteSize.X

                                                local min = 0
                                                local max = 1

                                                local size = min
                                                if x >= min and x <= max then
                                                        size = x
                                                elseif x < min then
                                                        size = min
                                                elseif x > max then
                                                        size = max
                                                end

                                                Resize(Slider_2, {Size = UDim2.new(size or min, 0, 0, 20)}, options.tween_time)
                                                local p = math.floor((size or min) * 100)

                                                local maxv = slideroptions.max
                                                local minv = slideroptions.min
                                                local diff = maxv - minv

                                                local sel_value = math.floor(((diff / 100) * p) + minv)

                                                TextLabel.Text = text..":"..tostring(sel_value)
                                                pcall(callback, sel_value)

                                                r.Heartbeat:Wait()
                                        end
                                end
                        end)
                end
            end)

            UIS.InputEnded:Connect(function(inputObject)
                if inputObject.UserInputType == Enum.UserInputType.MouseButton1 then
                    Held = false
                end
            end)

            function slidertable:OverwriteSetting(val)
                val = tonumber(val) or 0
                val = (((val >= 0 and val <= 100) and val) / 100)

                Resize(Slider_2, {Size = UDim2.new(val or 0, 0, 0, 20)}, options.tween_time)
                local p = math.floor((val or 0) * 100)

                local maxv = slideroptions.max
                local minv = slideroptions.min
                local diff = maxv - minv

                local sel_value = math.floor(((diff / 100) * p) + minv)

                TextLabel.Text = text..":"..tostring(sel_value)
                pcall(callback, sel_value)
            end

            slidertable:OverwriteSetting(slidertable.min)

            refreshtab()
            return slidertable,Slider
        end

        function window:AddFolder(text)
            window.count = window.count + 1

            local folderdata = {}

            local FolderItem = Instance.new("Frame")
            local UIListL23232ayout = Instance.new("UIListLayout")
            local Folder = Instance.new("Frame")
            local UIGradient123123 = Instance.new("UIGradient")
            local Button = Instance.new("TextButton")
            local TextLabel = Instance.new("TextLabel")
            local Click = Instance.new("ImageLabel")
            local UIGradient_2123123 = Instance.new("UIGradient")
            local Drop123 = Instance.new("ImageButton")

            FolderItem.Name = "FolderItem"
            FolderItem.Parent = Holder
            FolderItem.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            FolderItem.BackgroundTransparency = 1.000
            FolderItem.Position = UDim2.new(0, 0, 0.0854378939, 0)
            FolderItem.Size = UDim2.new(0, 187, 0, 0)
            FolderItem.ZIndex = 10
            FolderItem.BorderSizePixel = 0

            UIListL23232ayout.Parent = FolderItem
            UIListL23232ayout.SortOrder = Enum.SortOrder.LayoutOrder

            Folder.Name = "Folder"
            Folder.Parent = FolderItem
            Folder.BackgroundColor3 = Color3.fromRGB(170, 0, 255)
            Folder.BackgroundTransparency = 0.7
            Folder.Position = UDim2.new(0, 0, 0, 66)
            Folder.Size = UDim2.new(0, 187, 0, 22)
            Folder.ZIndex = 10

            UIGradient123123.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 0, 255)), ColorSequenceKeypoint.new(0.51, Color3.fromRGB(170, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(0, 0, 255))}
            UIGradient123123.Parent = Folder

            Button.Name = "Button"
            Button.Parent = Folder
            Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Button.BackgroundTransparency = 1.000
            Button.Position = UDim2.new(0, 0, 0, 1)
            Button.Size = UDim2.new(0, 187, 0, 21)
            Button.Visible = false
            Button.ZIndex = 10
            Button.Font = Enum.Font.SourceSans
            Button.TextColor3 = Color3.fromRGB(0, 0, 0)
            Button.TextSize = 14.000

            TextLabel.Parent = Folder
            TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            TextLabel.BackgroundTransparency = 1.000
            TextLabel.Position = UDim2.new(0, 32, 0, 0)
            TextLabel.Size = UDim2.new(0, 154, 0, 22)
            TextLabel.ZIndex = 10
            TextLabel.Font = Enum.Font.Code
            TextLabel.Text = "> "..text
            TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            TextLabel.TextSize = 14.000
            TextLabel.TextXAlignment = Enum.TextXAlignment.Left

            Click.Name = "Click"
            Click.Parent = Folder
            Click.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Click.BackgroundTransparency = 1.000
            Click.Position = UDim2.new(0, 9, 0, 1)
            Click.Size = UDim2.new(0, 19, 0, 17)
            Click.ZIndex = 10
            Click.Image = "http://www.roblox.com/asset/?id=6792161771"

            UIGradient_2123123.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(85, 255, 255)), ColorSequenceKeypoint.new(0.56, Color3.fromRGB(170, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 0, 255))}
            UIGradient_2123123.Parent = Click

            Drop123.Name = "Drop"
            Drop123.Parent = Folder
            Drop123.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Drop123.BackgroundTransparency = 1.000
            Drop123.Position = UDim2.new(0, 164, 0, 0)
            Drop123.Size = UDim2.new(0, 22, 0, 22)
            Drop123.ZIndex = 10
            Drop123.Image = "http://www.roblox.com/asset/?id=6702069727"

            local function countitems()
                local c = 22
                for i,v in pairs(FolderItem:GetChildren()) do
                    if not v:IsA("UIListLayout") and v ~= Folder then
                        if tostring(v) ~= "Colorpicker" then
                            c = c + 22
                        else
                            c = c + (22*8)
                        end
                    end
                end
                return c
            end

            local function getcount()
                local items = 0
                for i,v in pairs(FolderItem:GetChildren()) do
                    if not v:IsA("UIListLayout") and tostring(v) ~= "Folder" then
                        if tostring(v) ~= "Colorpicker" then
                            items = items + 1
                        else
                            items = items + 8
                        end
                    end
                end
                return items
            end

            local function toggleitems(bool)
                for i,v in pairs(FolderItem:GetChildren()) do
                    if not v:IsA("UIListLayout") and tostring(v) ~= "Folder" then
                        v.Visible = bool
                    end
                end
            end

            local ADDED
            local open = false
            Drop123.MouseButton1Click:Connect(function()
                open = not open
                if open then
                    tweenitem(Drop123,0.1,{Rotation = 90})
                    toggleitems(true)
                    local c = getcount()
                    if c > 0 then
                        ADDED = c
                        window.tempcount = window.tempcount + ADDED
                    end
                    print(ADDED,window.tempcount)
                    refreshtab()
                    
                else
                    tweenitem(Drop123,0.1,{Rotation = 0})
                    toggleitems(false)
                    if ADDED > 0 then
                        window.tempcount = window.tempcount - ADDED
                    end
                    print(ADDED,window.tempcount)
                    refreshtab()
                end
            end)

            spawn(function()
                while true do
                    tweenitem(FolderItem,0.1, {Size = UDim2.new(0, 187, 0, (open and countitems() or 22))})
                    wait()
                end
            end)

            for i,v in next, window do
                folderdata[i] = function(...)
                    local data, object
                    local ret = {v(...)}
                    if typeof(ret[1]) == "table" then
                        data = ret[1]
                        object = ret[2]
                        if tostring(object) == "Colorpicker" then
                            window.count = window.count - 8
                            object.Top.BackgroundTransparency = 0.8
                        else
                            window.count = window.count - 1
                            object.BackgroundTransparency = 0.8
                        end
                        object.Parent = FolderItem
                        object.Visible = false
                        return data, object
                    else
                        object = ret[1]
                        object.Parent = FolderItem
                        object.Visible = false
                        object.BackgroundTransparency = 0.8
                        window.count = window.count - 1
                        return object
                    end
                end
            end

            refreshtab()
            return folderdata, FolderItem
        end

        function window:AddColorpicker(text,callback)
            local colorpicktable = {}
            window.count = window.count + 8

            local Colorpicker = Instance.new("Frame")
            local Top = Instance.new("Frame")
            local UIGradient12321 = Instance.new("UIGradient")
            local TextLabel = Instance.new("TextLabel")
            local Click = Instance.new("ImageLabel")
            local UIGradient_3453452 = Instance.new("UIGradient")
            local ColorChosen = Instance.new("ImageLabel")
            local HSV = Instance.new("ImageLabel")
            local Saturation = Instance.new("ImageLabel")
            local HSV_Drag = Instance.new("ImageLabel")
            local UIGradient_763 = Instance.new("UIGradient")
            local Text = Instance.new("TextLabel")
            local SaturationDrag = Instance.new("Frame")

            Colorpicker.Name = "Colorpicker"
            Colorpicker.Parent = Holder
            Colorpicker.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Colorpicker.BackgroundTransparency = 1
            Colorpicker.Position = UDim2.new(0, 0, 0.395338476, 0)
            Colorpicker.Size = UDim2.new(0, 186, 0, 176)
            Colorpicker.ZIndex = 10

            Top.Name = "Top"
            Top.Parent = Colorpicker
            Top.BackgroundColor3 = Color3.fromRGB(170, 0, 255)
            Top.BackgroundTransparency = 0.900
            Top.Position = UDim2.new(0, 0, 0, 1)
            Top.Size = UDim2.new(0, 187, 0, 173)
            Top.ZIndex = 11

            UIGradient12321.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 0, 255)), ColorSequenceKeypoint.new(0.51, Color3.fromRGB(170, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(0, 0, 255))}
            UIGradient12321.Parent = Top

            TextLabel.Parent = Top
            TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            TextLabel.BackgroundTransparency = 1.000
            TextLabel.Position = UDim2.new(0, 32, 0, 0)
            TextLabel.Size = UDim2.new(0, 155, 0, 22)
            TextLabel.ZIndex = 10
            TextLabel.Font = Enum.Font.Code
            TextLabel.Text = "> "..text
            TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            TextLabel.TextSize = 14.000
            TextLabel.TextXAlignment = Enum.TextXAlignment.Left

            Click.Name = "Click"
            Click.Parent = Top
            Click.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Click.BackgroundTransparency = 1.000
            Click.Position = UDim2.new(0, 8, 0, 1)
            Click.Size = UDim2.new(0, 21, 0, 21)
            Click.ZIndex = 10
            Click.Image = "http://www.roblox.com/asset/?id=6799834835"

            UIGradient_3453452.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(85, 255, 255)), ColorSequenceKeypoint.new(0.56, Color3.fromRGB(170, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 0, 255))}
            UIGradient_3453452.Parent = Click

            ColorChosen.Name = "ColorChosen"
            ColorChosen.Parent = Top
            ColorChosen.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ColorChosen.BackgroundTransparency = 1.000
            ColorChosen.Position = UDim2.new(0.850026727, 0, 0.0107140541, 0)
            ColorChosen.Size = UDim2.new(0, 21, 0, 21)
            ColorChosen.ZIndex = 10
            ColorChosen.Image = "rbxassetid://3570695787"
            ColorChosen.ScaleType = Enum.ScaleType.Slice
            ColorChosen.SliceCenter = Rect.new(100, 100, 100, 100)
            ColorChosen.SliceScale = 0.120

            HSV.Name = "HSV"
            HSV.Parent = Colorpicker
            HSV.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            HSV.BorderColor3 = Color3.fromRGB(170, 0, 255)
            HSV.BorderSizePixel = 2
            HSV.Position = UDim2.new(0.167662159, 0, 0.184094101, 0)
            HSV.Size = UDim2.new(0, 107, 0, 107)
            HSV.ZIndex = 30
            HSV.Image = "rbxassetid://698052001"

            Saturation.Name = "Saturation"
            Saturation.Parent = Colorpicker
            Saturation.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Saturation.BorderColor3 = Color3.fromRGB(170, 0, 255)
            Saturation.BorderSizePixel = 2
            Saturation.Position = UDim2.new(0.834101319, 0, 0.189505488, 0)
            Saturation.Size = UDim2.new(0, 28, 0, 107)
            Saturation.ZIndex = 30
            Saturation.Image = "rbxassetid://3641079629"

            HSV_Drag.Name = "HSV_Drag"
            HSV_Drag.Parent = HSV
            HSV_Drag.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            HSV_Drag.BackgroundTransparency = 1.000
            HSV_Drag.Position = UDim2.new(0, 21,0, 30)
            HSV_Drag.Rotation = -20.000
            HSV_Drag.Size = UDim2.new(0, 21, 0, 21)
            HSV_Drag.ZIndex = 30
            HSV_Drag.Image = "http://www.roblox.com/asset/?id=6422318705"

            UIGradient_763.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(85, 255, 255)), ColorSequenceKeypoint.new(0.56, Color3.fromRGB(170, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 0, 255))}
            UIGradient_763.Parent = HSV_Drag

            Text.Name = "Text"
            Text.Parent = Colorpicker
            Text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Text.BackgroundTransparency = 1.000
            Text.Position = UDim2.new(0.167662174, 0, 0.86384356, 0)
            Text.Size = UDim2.new(0.832337558, 0, 0.124792814, 0)
            Text.ZIndex = 30
            Text.Font = Enum.Font.Code
            Text.Text = "select color to change"
            Text.TextColor3 = Color3.fromRGB(178, 178, 178)
            Text.TextSize = 13.000
            Text.TextWrapped = true

            SaturationDrag.Name = "SaturationDrag"
            SaturationDrag.Parent = Saturation
            SaturationDrag.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            SaturationDrag.Position = UDim2.new(0, 0,0.54, 0)
            SaturationDrag.Size = UDim2.new(0, 28, 0, 3)
            SaturationDrag.ZIndex = 30

            do -- Color Picker Math
                local h = 0
                local s = 1
                local v = 1

                local function Resize(part, new, _delay)
                    _delay = _delay or 0.5
                    local tweenInfo = TweenInfo.new(_delay, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
                    local tween = TS:Create(part, tweenInfo, new)
                    tween:Play()
                end

                local function rgbtohsv(r, g, b)
                    r, g, b = r / 255, g / 255, b / 255
                    local max, min = math.max(r, g, b), math.min(r, g, b)
                    local h, s, v
                    v = max
                
                    local d = max - min
                    if max == 0 then
                        s = 0
                    else
                        s = d / max
                    end
                
                    if max == min then
                        h = 0
                    else
                        if max == r then
                            h = (g - b) / d
                            if g < b then
                                h = h + 6
                            end
                        elseif max == g then
                            h = (b - r) / d + 2
                        elseif max == b then
                            h = (r - g) / d + 4
                        end
                        h = h / 6
                    end
                
                    return h, s, v
                end

                local function update()
                    local color = Color3.fromHSV(h, s, v)
                    ColorChosen.ImageColor3 = color
                    Saturation.ImageColor3 = Color3.fromHSV(h, 1, 1)
                    pcall(callback, color)
                end

                do
                    local color = Color3.fromHSV(h, s, v)
                    ColorChosen.ImageColor3 = color
                    Saturation.ImageColor3 = Color3.fromHSV(h, 1, 1)
                end

                local Entered1, Entered2 = false, false
                HSV.MouseEnter:Connect(function()
                    Entered1 = true
                end)
                HSV.MouseLeave:Connect(function()
                    Entered1 = false
                end)
                Saturation.MouseEnter:Connect(function()
                    Entered2 = true
                end)
                Saturation.MouseLeave:Connect(function()
                    Entered2 = false
                end)

                local Held = false
                UIS.InputBegan:Connect(function(inputObject)
                    if inputObject.UserInputType == Enum.UserInputType.MouseButton1 then
                        Held = true

                        spawn(function() -- Loop check
                            while Held and Entered1 do -- Palette
                                local mouse_location = getmouse()

                                local x = ((HSV.AbsoluteSize.X - (mouse_location.X - HSV.AbsolutePosition.X)) + 1)
                                local y = ((HSV.AbsoluteSize.Y - (mouse_location.Y - HSV.AbsolutePosition.Y)) + 1.5)

                                local color = Color3.fromHSV(x / 100, y / 100, 0)
                                h = x / 100
                                s = y / 100

                                Resize(HSV_Drag, {Position = UDim2.new(0, math.abs(x - 100) - (HSV_Drag.AbsoluteSize.X / 2), 0, math.abs(y - 100) - (HSV_Drag.AbsoluteSize.Y / 2))}, 0.1)

                                update()
                                r.Heartbeat:Wait()
                            end

                            while Held and Entered2 do -- Saturation
                                local mouse_location = getmouse()
                                local y = ((HSV.AbsoluteSize.Y - (mouse_location.Y - HSV.AbsolutePosition.Y)) + 1.5)
                                v = y / 100

                                Resize(SaturationDrag, {Position = UDim2.new(0, 0, 0, math.abs(y - 100))}, 0.1)

                                update()
                                r.Heartbeat:Wait()
                            end
                        end)
                    end
                end)
                UIS.InputEnded:Connect(function(inputObject)
                    if inputObject.UserInputType == Enum.UserInputType.MouseButton1 then
                        Held = false
                    end
                end)

                function colorpicktable:OverwriteSetting(color)
                    color = typeof(color) == "Color3" and color or Color3.new(1, 1, 1)
                    local h2, s2, v2 = rgbtohsv(color.r * 255, color.g * 255, color.b * 255)
                    ColorChosen.ImageColor3 = color
                    Saturation.ImageColor3 = Color3.fromHSV(h2, 1, 1)
                    pcall(callback, color)
                end
            end

            refreshtab()
            return colorpicktable,Colorpicker

        end

        function window:AddText(text)
            window.count = window.count + 1

            local Label = Instance.new("Frame")
            local UIGradien123123t = Instance.new("UIGradient")
            local TextLabel = Instance.new("TextLabel")

            Label.Name = "Label"
            Label.Parent = Holder
            Label.BackgroundColor3 = Color3.fromRGB(170, 0, 255)
            Label.BackgroundTransparency = 0.900
            Label.Position = UDim2.new(0, 0, 0.593007743, 0)
            Label.Size = UDim2.new(1, 0, 0.0286378767, 0)
            Label.ZIndex = 10

            UIGradien123123t.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 0, 255)), ColorSequenceKeypoint.new(0.51, Color3.fromRGB(170, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(0, 0, 255))}
            UIGradien123123t.Parent = Label

            TextLabel.Parent = Label
            TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            TextLabel.BackgroundTransparency = 1.000
            TextLabel.Position = UDim2.new(0.0588235296, 0, 0, 0)
            TextLabel.Size = UDim2.new(0, 176, 0, 22)
            TextLabel.ZIndex = 10
            TextLabel.Font = Enum.Font.Code
            TextLabel.Text = "> "..text
            TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            TextLabel.TextSize = 14.000
            TextLabel.TextXAlignment = Enum.TextXAlignment.Left


            return Label
        end
        
        
        return window
    end


end

do--key
    local Key = Instance.new("Frame")
    local ImageLabel_4 = Instance.new("ImageLabel")
    local ImageLabel_5 = Instance.new("ImageLabel")
    local ImageLabel_6 = Instance.new("ImageLabel")
    local Holder_2 = Instance.new("Frame")
    local Top = Instance.new("Frame")
    local Bar_3 = Instance.new("Frame")
    local UIGradient_14 = Instance.new("UIGradient")
    local Name_2 = Instance.new("TextLabel")
    local Exit = Instance.new("TextButton")
    local BoxFrame = Instance.new("Frame")
    local UIGradient_15 = Instance.new("UIGradient")
    local TextBox_2 = Instance.new("TextBox")
    local Button_5 = Instance.new("TextButton")
    local UIGradient_16 = Instance.new("UIGradient")
    local TextLabel_7 = Instance.new("TextLabel")
    local Text = Instance.new("TextLabel")
    local Copy = Instance.new("TextButton")
    local UIGradient_17 = Instance.new("UIGradient")
    local TextLabel_8 = Instance.new("TextLabel")

    Key.Name = "Key"
    Key.Parent = ScreenGui
    Key.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Key.BorderColor3 = Color3.fromRGB(170, 0, 255)
    Key.ClipsDescendants = true
    Key.Position = UDim2.new(-1, 0, 0.513999999, 0)
    Key.Size = UDim2.new(0.149479166, 0, 0.209020898, 0)
    Key.ZIndex = 0

    ImageLabel_4.Parent = Key
    ImageLabel_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    ImageLabel_4.BackgroundTransparency = 1.000
    ImageLabel_4.Position = UDim2.new(-0.235736921, 0, -0.0198346972, 0)
    ImageLabel_4.Size = UDim2.new(3.7247386, 0, 4.12631559, 0)
    ImageLabel_4.ZIndex = 2
    ImageLabel_4.Image = "http://www.roblox.com/asset/?id=4030608163"
    ImageLabel_4.ImageTransparency = 0.100
    ImageLabel_4.SliceScale = 2.000

    ImageLabel_5.Archivable = false
    ImageLabel_5.Parent = Key
    ImageLabel_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    ImageLabel_5.BackgroundTransparency = 1.000
    ImageLabel_5.Position = UDim2.new(-2.02860618, 0, -1.65984654, 0)
    ImageLabel_5.Size = UDim2.new(3.7247386, 0, 4.60526323, 0)
    ImageLabel_5.ZIndex = 3
    ImageLabel_5.Image = "http://www.roblox.com/asset/?id=3343671401"
    ImageLabel_5.ImageTransparency = 0.900
    ImageLabel_5.SliceScale = 2.000

    ImageLabel_6.Parent = Key
    ImageLabel_6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    ImageLabel_6.Position = UDim2.new(-1.04409933, 0, -0.872466445, 0)
    ImageLabel_6.Size = UDim2.new(2.54355407, 0, 2.73684216, 0)
    ImageLabel_6.Image = "http://www.roblox.com/asset/?id=6791074926"
    ImageLabel_6.SliceScale = 2.000

    Holder_2.Name = "Holder"
    Holder_2.Parent = Key
    Holder_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Holder_2.BackgroundTransparency = 1.000
    Holder_2.Size = UDim2.new(1, 0, 1, 0)
    Holder_2.ZIndex = 5

    Top.Name = "Top"
    Top.Parent = Key
    Top.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    Top.Size = UDim2.new(1, 0, 0.221052632, 0)
    Top.ZIndex = 5

    Bar_3.Name = "Bar"
    Bar_3.Parent = Key
    Bar_3.BackgroundColor3 = Color3.fromRGB(170, 0, 255)
    Bar_3.BorderColor3 = Color3.fromRGB(170, 0, 255)
    Bar_3.Position = UDim2.new(0.101045296, 0, 0.173042387, 0)
    Bar_3.Size = UDim2.new(0.797909379, 0, 0.0129031604, 0)
    Bar_3.ZIndex = 5

    UIGradient_14.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 0, 255)), ColorSequenceKeypoint.new(0.29, Color3.fromRGB(170, 0, 127)), ColorSequenceKeypoint.new(0.68, Color3.fromRGB(170, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(0, 0, 255))}
    UIGradient_14.Parent = Bar_3

    Name_2.Name = "Name"
    Name_2.Parent = Key
    Name_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Name_2.BackgroundTransparency = 1.000
    Name_2.Position = UDim2.new(0.101045296, 0, 0, 0)
    Name_2.Size = UDim2.new(0.79442507, 0, 0.16842106, 0)
    Name_2.ZIndex = 5
    Name_2.Font = Enum.Font.Code
    Name_2.Text = "something"
    Name_2.TextColor3 = Color3.fromRGB(255, 255, 255)
    Name_2.TextSize = 20.000

    Exit.Name = "Exit"
    Exit.Parent = Key
    Exit.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Exit.BackgroundTransparency = 1.000
    Exit.Position = UDim2.new(0.930313587, 0, 0, 0)
    Exit.Size = UDim2.new(0.0696864128, 0, 0.105263159, 0)
    Exit.ZIndex = 5
    Exit.Font = Enum.Font.Code
    Exit.Text = "X"
    Exit.TextColor3 = Color3.fromRGB(255, 0, 0)
    Exit.TextSize = 20.000

    BoxFrame.Name = "BoxFrame"
    BoxFrame.Parent = Key
    BoxFrame.BackgroundColor3 = Color3.fromRGB(170, 0, 255)
    BoxFrame.BackgroundTransparency = 0.500
    BoxFrame.BorderSizePixel = 0
    BoxFrame.Position = UDim2.new(0.101045296, 0, 0.347368419, 0)
    BoxFrame.Size = UDim2.new(0.797909379, 0, 0.131578952, 0)
    BoxFrame.ZIndex = 5

    UIGradient_15.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 0, 255)), ColorSequenceKeypoint.new(0.51, Color3.fromRGB(170, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(0, 0, 255))}
    UIGradient_15.Parent = BoxFrame

    TextBox_2.Parent = BoxFrame
    TextBox_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextBox_2.BackgroundTransparency = 1.000
    TextBox_2.Size = UDim2.new(0.995633185, 0, 1, 0)
    TextBox_2.Font = Enum.Font.Code
    TextBox_2.PlaceholderColor3 = Color3.fromRGB(178, 178, 178)
    TextBox_2.Text = "enter key"
    TextBox_2.TextColor3 = Color3.fromRGB(178, 178, 178)
    TextBox_2.TextSize = 14.000
    TextBox_2.ZIndex = 6

    Button_5.Name = "Button"
    Button_5.Parent = Key
    Button_5.BackgroundColor3 = Color3.fromRGB(170, 0, 255)
    Button_5.BorderSizePixel = 0
    Button_5.Position = UDim2.new(0.101045296, 0, 0.573684216, 0)
    Button_5.Size = UDim2.new(0.48780489, 0, 0.131578952, 0)
    Button_5.ZIndex = 5
    Button_5.Font = Enum.Font.Code
    Button_5.Text = ""
    Button_5.TextColor3 = Color3.fromRGB(255, 255, 255)
    Button_5.TextSize = 14.000

    UIGradient_16.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 0, 255)), ColorSequenceKeypoint.new(0.51, Color3.fromRGB(170, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(0, 0, 255))}
    UIGradient_16.Parent = Button_5

    TextLabel_7.Parent = Button_5
    TextLabel_7.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel_7.BackgroundTransparency = 1.000
    TextLabel_7.BorderSizePixel = 0
    TextLabel_7.Size = UDim2.new(1, 0, 1, 0)
    TextLabel_7.ZIndex = 5
    TextLabel_7.Font = Enum.Font.Code
    TextLabel_7.Text = "submit"
    TextLabel_7.TextColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel_7.TextSize = 14.000

    Text.Name = "Text"
    Text.Parent = Key
    Text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Text.BackgroundTransparency = 1.000
    Text.Position = UDim2.new(0.0209059231, 0, 0.805263162, 0)
    Text.Size = UDim2.new(0.979094088, 0, 0.194736838, 0)
    Text.ZIndex = 5
    Text.Font = Enum.Font.Code
    Text.TextColor3 = Color3.fromRGB(178, 178, 178)
    Text.TextSize = 13.000
    Text.TextWrapped = true
    Text.TextXAlignment = Enum.TextXAlignment.Left

    Copy.Name = "Copy"
    Copy.Parent = Key
    Copy.BackgroundColor3 = Color3.fromRGB(170, 0, 255)
    Copy.BorderSizePixel = 0
    Copy.Position = UDim2.new(0.658536613, 0, 0.573684216, 0)
    Copy.Size = UDim2.new(0.240418121, 0, 0.131578952, 0)
    Copy.ZIndex = 5
    Copy.Font = Enum.Font.Code
    Copy.Text = ""
    Copy.TextColor3 = Color3.fromRGB(255, 255, 255)
    Copy.TextSize = 14.000

    UIGradient_17.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(0, 0, 255)), ColorSequenceKeypoint.new(0.51, Color3.fromRGB(170, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 0, 255))}
    UIGradient_17.Parent = Copy

    TextLabel_8.Parent = Copy
    TextLabel_8.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel_8.BackgroundTransparency = 1.000
    TextLabel_8.BorderSizePixel = 0
    TextLabel_8.Position = UDim2.new(0.0144927539, 0, 0, 0)
    TextLabel_8.Size = UDim2.new(0.98550725, 0, 1, 0)
    TextLabel_8.ZIndex = 5
    TextLabel_8.Font = Enum.Font.Code
    TextLabel_8.Text = "copy"
    TextLabel_8.TextColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel_8.TextSize = 14.000

    function library:keyTab(stuff)
        local enteredtext = nil
        local info = TweenInfo.new(0.5,Enum.EasingStyle.Bounce,Enum.EasingDirection.Out)
        local tw = TS:Create(Key,info,{Position = UDim2.new(0.425, 0,0.514, 0)})
        tw:Play()
        Name_2.Text = stuff.Name
        Text.Text = stuff.Text
        wait(1)

        TextBox_2.FocusLost:Connect(function()
            enteredtext = TextBox_2.Text
            TextBox_2.Text = "enter key"
        end)

        Button_5.MouseButton1Click:Connect(function()
            if tonumber(enteredtext) == options.keyset or (stuff.key and tonumber(enteredtext) == stuff.key) then
                local tw2 = TS:Create(Key,info,{Position = UDim2.new(-1, 0,0.514, 0)})
                tw2:Play()
                stuff.func()
            end
        end)

        Exit.MouseButton1Click:connect(function()
            Key:Destroy()
        end)
    end 
end



local cooldown = false
UIS.InputBegan:Connect(function(input,process)
    if (input.KeyCode == options.key and not cooldown) then
        options.open = not options.open
        cooldown = true
        if options.open then
            movechat(true)
            blurcamera(true)
            library:OpenMenu()
            wait(1)
            cooldown = false
            
        else
            movechat(false)
            blurcamera(false)
            library:CloseMenu()
            wait(1)
            cooldown = false
        end
    end
end)

return library





