---
--- Move to the parent of the current folder in Lightroom Classic
--- Eben Ostby
---

require "FolderCom.lua"

function goToParent()	
--- 
	local parent
	local parentparent

	local parentKids = nil
	local activeSource = FolderCom.getCurrentFolder()
	local count = 0
	local lastKid = nil
	local myKids
	local kidnames
	
	if (activeSource ~= nil) then
		catalog = activeSource.catalog		
		parent=activeSource:getParent()
		if (parent == nil) then return end
		parentparent = parent:getParent()
		if (parentparent == nil) then return end
				
		catalog:setActiveSources({parent})

	end
end
import "LrTasks".startAsyncTask(goToParent)
