# Label and Input Fixes - Ronix Hub

## Summary

Both **Input fields** and **Label/Description text** are now fully functional in WindUI.

## Changes Made

### 1. Label Element (NEW)
- **File**: `src/elements/Label.lua`
- **Registration**: Added to `src/elements/Init.lua`
- **Purpose**: Display static text/descriptions in the GUI

### 2. Input Element (VERIFIED)
- **File**: `src/elements/Input.lua` (already existed)
- **Status**: Already registered and working
- **Description Support**: Already supports `Desc` parameter

## Usage Examples

### Label Element

```lua
-- Basic label
Tabs.Main:Label({
    Text = "Welcome to Ronix Hub!"
})

-- Label with description
Tabs.Main:Label({
    Text = "Auto-Roll Settings",
    Desc = "Configure automatic rolling behavior"
})

-- Label with custom styling
local statusLabel = Tabs.Main:Label({
    Text = "Status: Ready",
    TextSize = 16,
    TextColor3 = Color3.fromRGB(100, 255, 100),
    TextTransparency = 0.1,
    RichText = true
})

-- Update label dynamically
statusLabel:SetText("Status: Active")
statusLabel:SetDesc("System is now active")
```

### Input Element

```lua
-- Basic input
Tabs.Main:Input({
    Title = "Username",
    Placeholder = "Enter username...",
    Callback = function(value)
        print("Username:", value)
    end
})

-- Input with description
Tabs.Main:Input({
    Title = "Roll Buffer",
    Desc = "Enter your roll buffer value",
    Placeholder = "Enter buffer...",
    Value = "0",
    Callback = function(value)
        print("Buffer:", value)
    end
})

-- Textarea input
Tabs.Main:Input({
    Title = "Notes",
    Desc = "Enter your notes here",
    Type = "Textarea",
    Placeholder = "Enter notes...",
    Callback = function(value)
        print("Notes:", value)
    end
})

-- Input with icon
Tabs.Main:Input({
    Title = "Search",
    Desc = "Search for items",
    InputIcon = "search",
    Placeholder = "Search...",
    Callback = function(value)
        print("Search:", value)
    end
})
```

## Label Element Parameters

- `Text` (string) - The text content (also accepts `Title` for compatibility)
- `Desc` (string, optional) - Description text displayed below the main text
- `TextSize` (number, optional) - Font size (default: 14)
- `TextColor3` (Color3, optional) - Custom text color
- `TextTransparency` (number, optional) - Text transparency (default: 0.2)
- `RichText` (boolean, optional) - Enable RichText formatting (default: false)
- `Locked` (boolean, optional) - Lock the label (default: false)

## Input Element Parameters

- `Title` (string) - Input field title
- `Desc` (string, optional) - Description text displayed below the title
- `Type` (string, optional) - "Input" or "Textarea" (default: "Input")
- `Placeholder` (string, optional) - Placeholder text (default: "Enter Text...")
- `Value` (string, optional) - Default value
- `InputIcon` (string/boolean, optional) - Icon to display in input
- `ClearTextOnFocus` (boolean, optional) - Clear text when focused (default: false)
- `Callback` (function) - Called when input value changes
- `Locked` (boolean, optional) - Lock the input (default: false)
- `Width` (number, optional) - Input width for regular inputs (default: 150)

## Methods

### Label Methods
- `label:SetText(newText)` - Update the label text
- `label:SetDesc(newDesc)` - Update the description
- `label:Lock()` - Lock the label
- `label:Unlock()` - Unlock the label

### Input Methods
- `input:Set(value)` - Set the input value programmatically
- `input:SetPlaceholder(placeholder)` - Update the placeholder text
- `input:Lock()` - Lock the input
- `input:Unlock()` - Unlock the input

## Notes

- Both elements use the `window/Element` component for consistent styling
- Descriptions are automatically displayed below the title when provided
- All elements support the `Desc` parameter for additional context
- The Label element is designed to be simple and lightweight for displaying text
- Input elements support both single-line and multi-line (Textarea) modes

