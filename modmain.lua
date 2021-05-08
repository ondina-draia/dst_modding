local require = GLOBAL.require

local RecipePopup = require "widgets/recipepopup"
local ImageButton = require "widgets/imagebutton"

require "constants"

print("Hello World!")

-- Get recipe popup widget and add debut output if error

local RecipePopup_Refresh_base = RecipePopup.Refresh or function() print("ERROR: Can't run RecipePopup_Refresh_base!") return "" end

-- Function to create a button, return pointer to button 

local function ButtonCreate(caption, x, y, image_scale_x, image_scale_y, parent, onClick_function)
	-- Create image button and put it in the parent/child container 
	local new_button = parent:AddChild(ImageButton())
	-- Set image scale 
	new_button.image:SetScale(image_scale_x, image_scale_y)
	-- Set position in parent
	new_button:SetPosition(x, y, 0)
	-- Set onClick_function
	new_button:SetOnClick(onClick_function)
	-- Show button 
	new_button:Show()
	-- Set button text
	new_button:SetText(caption)
	-- Enable for click
	new_button:Enable()
	-- return new_button
	return new_button
end

local function ButtonExists(button_pointer)
	-- Check if button exists, or parent for button was destroyed and need to be recreated
	if button_pointer == nil or button_pointer.parent == nil then 
		-- button or parent dont exist
		return false 
	else 
		-- button exists
		return true
	end
end 

--Hook onto RecipePopup refresh function, overide it

function RecipePopup:Refresh()

	-- Run recipe refresh
	RecipePopup_Refresh_base(self)
	-- Get recipe 
	local current_recipe=self.name:GetString()
	-- Show refreshed recipe popup name
	print(current_recipe)
	if ButtonExists(self.my_button) == false then
		-- Create button in recipe popup and add it to self, for future reference
		-- Set position depending on skin
		if self.skins_options == 1 then
			self.my_button = ButtonCreate("Pointless button", 320, -200, 1, 0.75, self.contents, function() print("CLICK!") end)
		else
			self.my_button = ButtonCreate("Really pointless button", 320, -200, 1, 0.75, self.contents, function() print("CLICK!") end)
		end
		print("Create button")
		end
	
end