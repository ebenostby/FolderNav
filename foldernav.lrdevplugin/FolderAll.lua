---
--- Move to the parent of the current folder in Lightroom Classic
--- Eben Ostby
---

require "FolderCom.lua"

local function goToAll()	
--- 
	local LrApplication = import 'LrApplication'

	local catalog = LrApplication.activeCatalog()
	catalog:setActiveSources(catalog.kAllPhotos)

end
import "LrTasks".startAsyncTask(goToAll)
