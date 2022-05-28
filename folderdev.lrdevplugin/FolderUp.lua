
--------------------------------------------------------------------------------
require "FolderCom.lua"

local function goUpOne()
	FolderCom.goUpOrDown(function(a, b) return string.lower(a[1])<string.lower(b[1]) end)
end
import "LrTasks".startAsyncTask( goUpOne )
