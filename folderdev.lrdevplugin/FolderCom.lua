FolderCom = {}


function FolderCom.goUpOrDown(sortfunction)	


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
			myname = activeSource:getName()
			
			lastKid = activeSource:getParent()
			if (lastKid == nil) then  
				return 
			end
			parentKids = lastKid:getChildren()

			if (parentKids == nil) then 
				return 
			end
			-- here we need to get an array that has kid names as keys and the actual kids as values.
			kidnames = {} -- table to hold the keys
			for i, kid in ipairs(parentKids) do
				table.insert(kidnames, {kid:getName(), kid})
			end
			table.sort(kidnames, sortfunction)
			for i, kid in ipairs(kidnames) do
				if (kid[1] == myname) then					
						catalog:setActiveSources({lastKid})
						return
				end
				lastKid = kid[2]
			end
		end
	end
end
