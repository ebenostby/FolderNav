
function goToChild()	
--- 
	local LrApplication = import 'LrApplication'

	local catalog = LrApplication.activeCatalog()

	local parentKids = nil
	local myname = nil
	local sources = catalog:getActiveSources()
	local count = 0
	local lastKid = nil
	
	for _ in pairs(sources) do count = count + 1 end
	if count == 1 then
		local activeSource = sources[1]
		
		if (type(activeSource) == "table") and (activeSource:type() == "LrFolder") then
--			myname = activeSource:getName()
			
			myKids = activeSource:getChildren()
			local count = 0
			for _ in pairs(myKids) do count = count + 1 end
			if count < 1 then return end
			-- here we need to get an array that has kid names as keys and the actual kids as values.
			kidnames = {} -- table to hold the keys
			for i, kid in ipairs(myKids) do
				table.insert(kidnames, {kid:getName(), kid})
			end
			table.sort(kidnames, function(a, b) return string.lower(a[1])<string.lower(b[1]) end)
			catalog:setActiveSources(kidnames[1][2])
		end
	end
end
import "LrTasks".startAsyncTask( goToChild )
