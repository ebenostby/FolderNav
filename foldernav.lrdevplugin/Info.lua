--[[----------------------------------------------------------------------------

Folder Nav
Folder Navigation Menu items for Lightroom
Written so you can use keys to change which folder you're looking at in Lightroom

Eben Ostby


------------------------------------------------------------------------------]]

return {
	
	LrSdkVersion = 3.0,
	LrSdkMinimumVersion = 1.3, -- minimum SDK version required by this plug-in

	LrToolkitIdentifier = 'user.efo.lightroom.sdk.foldernav',

	LrPluginName = LOC "$$$/FolderNav/PluginName=Folder Nav",
	

	-- Add the menu item to the Library menu.
	
	LrLibraryMenuItems = {
	    {
		    title = "Folder Up",
		    file = "FolderUp.lua",
		},
	    {
		    title = "Folder Down",
		    file = "FolderDown.lua",
		},
		{	
			title = "Folder Child",
			file = "FolderChild.lua"
		},
		{
			title = "Folder Parent",
			file = "FolderParent.lua"
		},
		{
			title = "Folder Self",
			file = "FolderSelf.lua"
		}

	},
	VERSION = { major=1, minor=3, revision=0,  },

}


	
