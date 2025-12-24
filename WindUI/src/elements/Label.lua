local Creator = require("../modules/Creator")
local New = Creator.New

local Element = {}

function Element:New(Config)
    local Label = {
        __type = "Label",
        Title = Config.Text or Config.Title or "",
        Text = Config.Text or Config.Title or "",
        Desc = Config.Desc or nil,
        TextSize = Config.TextSize or 14,
        TextColor3 = Config.TextColor3 or nil,
        TextTransparency = Config.TextTransparency or 0.2,
        RichText = Config.RichText or false,
        Locked = Config.Locked or false,
        UIElements = {},
    }
    
    -- Use the window/Element component to display the label
    -- This provides consistent styling with other elements
    Label.LabelFrame = require("../components/window/Element")({
        Title = Label.Title,
        Desc = Label.Desc,
        Parent = Config.Parent,
        TextOffset = 0,
        Hover = false,
        Tab = Config.Tab,
        Index = Config.Index,
        Window = Config.Window,
        ElementTable = Label,
        ParentConfig = Config,
    })
    
    -- Customize the text appearance if needed
    if Label.TextSize and Label.TextSize ~= 17 then
        if Label.LabelFrame.UIElements.Title then
            Label.LabelFrame.UIElements.Title.TextSize = Label.TextSize
        end
    end
    
    if Label.TextColor3 then
        if Label.LabelFrame.UIElements.Title then
            Label.LabelFrame.UIElements.Title.TextColor3 = Label.TextColor3
            Label.LabelFrame.UIElements.Title.ThemeTag = nil
        end
    end
    
    if Label.TextTransparency and Label.TextTransparency ~= 0 then
        if Label.LabelFrame.UIElements.Title then
            Label.LabelFrame.UIElements.Title.TextTransparency = Label.TextTransparency
        end
    end
    
    if Label.RichText then
        if Label.LabelFrame.UIElements.Title then
            Label.LabelFrame.UIElements.Title.RichText = true
        end
    end
    
    -- Set ElementFrame for proper integration with layout system
    Label.ElementFrame = Label.LabelFrame.UIElements.Main
    
    function Label:SetText(newText)
        Label.Title = newText or ""
        Label.Text = newText or ""
        if Label.LabelFrame then
            Label.LabelFrame:SetTitle(newText or "")
        end
    end
    
    function Label:SetDesc(newDesc)
        Label.Desc = newDesc
        if Label.LabelFrame then
            Label.LabelFrame:SetDesc(newDesc)
        end
    end
    
    function Label:Lock()
        Label.Locked = true
        return Label.LabelFrame:Lock()
    end
    
    function Label:Unlock()
        Label.Locked = false
        return Label.LabelFrame:Unlock()
    end
    
    if Label.Locked then
        Label:Lock()
    end
    
    return Label.__type, Label
end

return Element

