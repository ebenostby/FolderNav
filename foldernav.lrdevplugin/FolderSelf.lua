---
--- Move to the parent of the current folder in Lightroom Classic
--- Eben Ostby
---

require "FolderCom.lua"

local function goToSelf()	
--- 
	local activeSource = FolderCom.getCurrentFolder()
	if (activeSource ~= nil) then
		catalog = activeSource.catalog		
		catalog:setActiveSources({activeSource})

	end
end
import "LrTasks".startAsyncTask(goToSelf)
