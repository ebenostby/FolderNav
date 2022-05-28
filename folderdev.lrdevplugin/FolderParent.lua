
function goToParent()	
--- 
	local LrApplication = import 'LrApplication'

	local catalog = LrApplication.activeCatalog()

	local parentKids = nil
	local myname = nil
	local sources = catalog:getActiveSources()
	local count = 0
	local lastKid = nil
	local parent
	local parentparent
	---
	for _ in pairs(sources) do count = count + 1 end
	if count == 1 then
		local activeSource = sources[1]
		
		if (type(activeSource) == "table") and (activeSource:type() == "LrFolder") then
			parent=activeSource:getParent()
			if (parent == nil) then return end
			parentparent = parent:getParent()
			if (parentparent == nil) then return end
					
			catalog:setActiveSources({parent})
		end
	end
end
import "LrTasks".startAsyncTask(goToParent)
