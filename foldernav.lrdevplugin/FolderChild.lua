---
--- Move to the child of the current folder in Lightroom Classic
--- Eben Ostby
---
require "FolderCom.lua"

function goToChild()	
--- 


	local parentKids = nil
	local activeSource = FolderCom.getCurrentFolder()
	local count = 0
	local lastKid = nil
	local myKids
	local kidnames
	
	if (activeSource ~= nil) then
		catalog = activeSource.catalog		
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
import "LrTasks".startAsyncTask( goToChild )
