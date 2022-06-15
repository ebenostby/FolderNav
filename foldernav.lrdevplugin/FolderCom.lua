----- Common function for Folder Nav. 
----- Move to the next sibling of the current folder
----- 

FolderCom = {}
function FolderCom.getCurrentFolder()
	local LrApplication = import 'LrApplication'
	local LrPathUtils = import 'LrPathUtils'

	local catalog = LrApplication.activeCatalog()
	local sources = catalog:getActiveSources()
	local activeSource = nil
	local count = 0
	for _ in pairs(sources) do count = count + 1 end
	if (count == 1) then
		activeSource = sources[1]
		if (type(activeSource) == "table") and (activeSource:type() == "LrFolder") then
			return activeSource
		end
	end
	photo = catalog:getTargetPhoto()
	if (photo == nil) then
		photo = catalog:getTargetPhotos()
		if (#photo > 0) then
			photo = photo[1]
		end
	end
	if (photo ~= nil) then
		return catalog:getFolderByPath (LrPathUtils.parent (photo:getRawMetadata ("path")))
	end
	return nil
end
function FolderCom.goUpOrDown(sortfunction)	

	local parentKids = nil
	local myname = nil
	local count = 0
	local lastKid = nil
	local activeSource
	local catalog
	activeSource = FolderCom.getCurrentFolder()
	if (activeSource ~= nil) then
		catalog = activeSource.catalog
		-- we're going to find all our siblings, alphabetized, and then find ourself
		-- in that list
		myname = activeSource:getName()
		
		lastKid = activeSource:getParent()
		if (lastKid == nil) then  
			return 
		end
		parentKids = lastKid:getChildren()
		-- if my parent has no kids, then we give up. This can happen, though I don't know why
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
		-- if we find ourself in that list, then take the prior sibling in sort order
			if (kid[1] == myname) then					
					catalog:setActiveSources({lastKid})
					return
			end
			lastKid = kid[2]
		end
	end
end
