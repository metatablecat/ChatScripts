--	// FileName: DeveloperConsole.lua
--	// Written by: TheGamer101
--	// Description: Command to open or close the developer console.

local StarterGui = game:GetService("StarterGui")
local util = require(script.Parent:WaitForChild("Util"))

function ProcessMessage(message)
	if string.sub(message, 1, 8):lower() == "/console" or string.sub(message, 1, 11):lower() == "/newconsole" then
		local couldGetDevConsole, developerConsoleVisible = pcall(function()
			return StarterGui:GetCore("DevConsoleVisible")
		end)

		if couldGetDevConsole then
			local couldShowDevConsole, err = pcall(function()
				StarterGui:SetCore("DevConsoleVisible", not developerConsoleVisible)
			end)
			if not couldShowDevConsole and err then
				print("Error making developer console visible: " ..err)
			end
		end
		return true
	end
	return false
end

return {
	[util.KEY_COMMAND_PROCESSOR_TYPE] = util.COMPLETED_MESSAGE_PROCESSOR,
	[util.KEY_PROCESSOR_FUNCTION] = ProcessMessage
}

